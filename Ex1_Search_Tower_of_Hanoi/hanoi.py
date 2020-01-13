numTowers = 3


class Hanoi:
    def __init__(self, stack):
        self.stack = stack

    def __unicode__(self):
        return 'Hanoi(%s)' % repr(self.stack)

    def __repr__(self):
        return 'Hanoi(%s)' % repr(self.stack)

    def __hash__(self):
        return hash(repr(self))

    def __eq__(self, other):
        return repr(self) == repr(other)

    def __getitem__(self, k):
        return self.stack[-1]

    def is_legal(self):
        for stack in self.stack:
            max_block = 4
            for block in stack:

                if block >= max_block:
                    return False
                else:
                    max_block = block
        return True

    @staticmethod
    # declare initial state
    def list_initial(numTowers):
        # empty list of 3 lists
        listoflist = [[] for i in range(numTowers)]
        # if listoflist is empty
        if(listoflist):
            # state initial list of 3 towers [[3,2,1],[],[]]
            listoflist[0] = [3, 2, 1]
        return Hanoi(listoflist)

    # declare goal state
    @staticmethod
    def list_goal(numTowers):
        # empty list of 3 lists
        listoflist = [[] for i in range(numTowers)]
        if listoflist:
            # state goal list of 3 towers [[],[],[3,2,1]]
            listoflist[-1] = [3, 2, 1]
        return Hanoi(listoflist)

    # depth of this particular state in index i, how many disks are
    # in that particular tower
    def depth(self, i):
        return len(self.stack[i])

    # function that return a class Hanoi with a list of stack for
    # all stack in a "this" hanoi stack
    def copy(self):

        return Hanoi([list(stack) for stack in self.stack])

    # moving that disk from a tower to another
    def move(self, from_index, to_index):
        new_stacks = self.copy()
        # take a specific stack that i want to move
        # depends of from_index
        from_stack = new_stacks.stack[from_index]

        # take a specific stack in to_index where
        #  i want to place from_stack
        to_stack = new_stacks.stack[to_index]

        # remove element at the end of from_stack and i
        # append at the end of to_stack
        to_stack.append(from_stack.pop())

        return new_stacks

    # return neighbor of one node
    @staticmethod
    def neighbors_nodes(stack):
        neighbors = []
        for i in range(numTowers):
            for j in range(numTowers):
                if i != j and stack.depth(i) > 0:
                    one_neighbor = stack.move(i, j)
                    if one_neighbor.is_legal():
                        neighbors.append(one_neighbor)
        return neighbors

    @staticmethod
    def heuristic(position, goal):
        # number of blocks successfully moved to the last peg
        return len(position.stack[-1])

    # function that find path using A* algorithm
    @staticmethod
    def find_path(start, goal):
        # set contain nodes that are not explored
        open_set = set()

        # queue that contains same samples of open_set but with
        # the f-heuristic value, so ordered by f
        open_queue = list()

        # initialize empty dictionary of goal
        g_score = dict()

        # initialize empty dictionary of h
        h_score = dict()

        # dictionary to obtain full path, mapping each nodes with
        # their neighbours
        came_from = dict()

        # set that contains nodes that i have just visited and i don't
        # want to visit again, nodes that we have already explored
        # their neighbours
        closed_set = set()

        def f_score(point):
            return g_score[point] + h_score[point]

        num_visit =1
        g_score[start] = 0
        h = Hanoi.heuristic(start, goal)
        h_score[start] = h
        open_set.add(start)
        open_queue.append((f_score(start), start))

        # searching a goal until all possible paths have been
        # exhausted
        while open_set:
            # order a queue
            open_queue.sort()

            # take a copple of (f_valeue,nextsamples) because i
            # want to visit this node
            f_value_next, next_sample = open_queue.pop(0)

            # remove from open_set
            open_set.remove(next_sample)

            if (next_sample == goal):

                # i found a goal, so i take the path
                path = [next_sample]

                # return back to find path
                while next_sample != start:
                    next_sample = came_from[next_sample]
                    path.append(next_sample)
                path.reverse()
                num_visit =len(closed_set)
                return (path,num_visit)

            # we have visited but we take it in standby
            closed_set.add(next_sample)

            for neighbor in Hanoi.neighbors_nodes(next_sample):

                # if we don't have just visited this node
                if neighbor not in closed_set:
                    # update gscore
                    new_gscore = g_score[next_sample]+1
    
                    if neighbor not in open_set:
                        # new node to explore
                        # to take track of it
                        came_from[neighbor] = next_sample

                        # insert new gscore
                        g_score[neighbor] = new_gscore

                        # find heuristic
                        h= Hanoi.heuristic(neighbor, goal)
                        h_score[neighbor] = h

                        # new samples in a set to explore
                        open_set.add(neighbor)

                        # new hash function
                        f = new_gscore + h

                        # add couple (f, neighbor)
                        open_queue.append((f, neighbor))

                    # case if neighbor is in the open_set
                    else:
                        if (new_gscore < g_score[neighbor]):
                            
                            # meas that there is a better path
                            # to reach the goal than before
                            came_from[neighbor]=next_sample
                            g_score[neighbor] =new_gscore
                            h=Hanoi.heuristic (neighbor,goal)
                            h_score[neighbor]=h
                            f=new_gscore+h


state_initial = Hanoi.list_initial(numTowers)
state_goal = Hanoi.list_goal(numTowers)
final_path,num= Hanoi.find_path(state_initial, state_goal)
for nodes in final_path:
    print (nodes)
print (num)
