# Number Theory: Addition

In this lab, you’ve learned about One Hot and Binary state machines and how to build them.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions

### Compare and contrast One Hot and Binary encodings
The choice between One-hot and Binary encoding is primarily a trade-off
between the number of flip-flops used and the complexity of the combinatorial
logic needed to determine the next state. Binary encoding minimizes the use of
valuable flip-flops where are often a limited resource on an FPGA. However, it
shifts the complexity into the combinatorial logic. One-hot encoding uses the
maximum number of flip-flops but drastically simplifies the combinatorial logic.
One-hot designs are also typically faster because the next-state logic requires
fewer gates and therefore has a shorter propagation delay, allowing the machine
to run at a higher clock frequency. Binary designs are generally slower because
the multi-level logic introduces more gate displays in the critical path.

### Which method did your team find easier, and why?
We found the One-hot encoding to be easier because the equations are simple
and intuitive. You don’t need any K-Maps for the state transitions. You also don’t
need to worry about any “don’t care” conditions or what happens if the machine
lands in an unused state like 111. The binary encoding required the creation of
complex K-Maps for each flip-flop which is more prone to calculation errors.

### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.
Use binary encoding when logic resources are scarce. FPGAs have a limited
number of configurable logic blocks. Binary encoding uses the minimum number
of registers and pushes the complexity into the combinatorial logic gates. You
would use One-hot encoding when speed or timing is critical. It’s much faster
because it has fewer logic gates between the current state and the next state
input. This means the signal propagation delay is shorter, allowing the state
machine to run at a higher clock frequency. FPGAs also often have many more
logic resources than specialized registers.

