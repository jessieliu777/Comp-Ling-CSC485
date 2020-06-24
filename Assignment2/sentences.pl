% Heng Liu, liuheng7, 1004076493
% question 1
test_sent([fred, feeds, the, dog, with, biscuits]).
test_sent([fred, feeds, the, puppies, with, biscuits]).
test_sent([fred, feeds, the, dog]).
test_sent([fred, feeds, the, puppies]).
test_sent([the, dog, feeds, the, puppies]).
test_sent([the, dog, feeds, the, puppies, with, biscuits]).
test_sent([the, puppies, feed, the, dog, with, biscuits]).
% question 2
test_sent([the, student, slept]).
test_sent([the, teacher, slept]).
test_sent([the, student, tended, to, sleep]).
test_sent([the, teacher, tended, to, tend, to, sleep]).
test_sent([the, student, tended, to, tend, to, tend, to, sleep]).
test_sent([the, teacher, tended, to, appear, to, sleep]).
test_sent([the, teacher, tended, to, appear, to, tend, sleep]).
test_sent([the, student, appeared, to, appear, to, tend, to, sleep]).
test_sent([the, teacher, appeared, to, appear, to, promise, the, teacher, to, tend, to, sleep]).
test_sent([the, student, appeared, to, appear, to, appear, to, promise, the, teacher, to, sleep]).
test_sent([the, student, appeared, to, appear, to, tend, to, promise, the, teacher, to, sleep]).
test_sent([the, teacher, promised, the, student, to, sleep]).
test_sent([the, student, tended, to, request, the, teacher, to, sleep]).
test_sent([the, student, requested, the, teacher, to, sleep]).
test_sent([the, teacher, promised, the, student, to, request, the, student, to, sleep]).
test_sent([the, student, tended, to, promise, the, student, to, request, the, student, to, sleep]).
test_sent([the, teacher, promised, the, teacher, to, request, the, student, to, promise, the, teacher, to, sleep]).
test_sent([the, student, appeared, to, request, the, teacher, to, tend, to, sleep]).
test_sent([the, teacher, tended, to, promise, the, student, to, appear, to, sleep]).
test_sent([the, student, tended, to, tend, to, promise, the, teacher, to, tend, to, promise, the, student, to, sleep]).
test_sent([the, student, tended, to, tend, to, appear, to, promise, the, teacher, to, tend, to, promise, the, student, to, sleep]).
test_sent([the, teacher, promised, the, student, to, tend, to, appear, to, promise, the, teacher, to, tend, to, promise, the, student, to, sleep]).