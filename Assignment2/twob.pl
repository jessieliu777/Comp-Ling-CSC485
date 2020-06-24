% Heng Liu, liuheng7, 1004076493
:- ale_flag(subtypecover,_,off).
:- discontiguous sub/2,intro/2.

bot sub [mood, tense, sem, cat, pos, verbal, nominal, role, part, main].

    % parts of speech
        pos sub [n, p, v, det, toinf].
            n sub [].
            p sub [].
            v sub [] intro [vtense:tense].
            det sub [].
            toinf sub [].   % infinitival to
    % phrasal categories
    cat sub [vproj, np, none].
        vproj sub [inf_clause, s, vp] intro [mood:mood, part:part].
            inf_clause intro [mood:infinitive].
            s intro [mood:indicative].
            vp intro [mood:indicative].
        np sub [].
        part sub [] intro [subj:cat, obj1:cat, obj2:cat, main:main]. % introduce subj, obj1, obj2, main
            main sub [request, not_request]. % the main verb is either request or not request
        verbal sub [v, vproj, inf] intro [vsem:v_sem].
        nominal sub [n, np] intro [nsem:n_sem].
    
    % mood and tense for verbs
    tense sub [past, present].
        past sub [].    
        present sub [].
    mood sub [indicative, infinitive].
        indicative intro [tense:tense].
        infinitive sub [].

    % semantics for verbs and nouns
    sem sub [v_sem, n_sem].

        % semantics for nouns
        n_sem sub [student, teacher].
            student sub [].
            teacher sub [].

        % semantics for verbs 
        v_sem sub [tend, appear, promise, request, sleep]
              intro [agent:cat, theme:cat, experiencer:cat, beneficiary:cat].     % This should not be empty!  Fill in features for this and
                            % the following subtypes:
            tend sub [].
            appear sub [].
            promise sub [].
            request sub [].
            sleep sub [].

    role sub [agent, theme, beneficiary, experiencer].

% grammar rules
% S: NP + VP
np_vp__s rule
(s, mood:Mood, part:(Part, subj:NP), vsem:Word) ===> % get the mood & vsem from vp
cat> (NP, np),
cat> (vp, mood:Mood, part:Part, vsem:Word). % pass the subj to vp

% S: NP + V (the only case is NP + slept)
np_v__s rule
(s, mood:(tense:Tense), vsem:Word) ===> % get the tense & vsem from v
cat> (NP,np),
cat> (v, vtense:(Tense, past), vsem:(Word, experiencer:NP)).

% NP: det + N
det_n__np rule
(np, nsem:Nsem) ===>
cat> det,
cat> (n, nsem:Nsem).

% VP: tended + inf_clause
tend__vp rule
(vp, mood:(tense:Tense), part:(Part, subj:S, main:not_request), vsem:Word) ===>
cat> (v, vtense:(Tense, past), vsem:((Word, tend), theme:IC, agent:S)), % set the agent, theme
cat> (IC, inf_clause, part:Part).

% VP: appeared + inf_clause
appear__vp rule
(vp, mood:(tense:Tense), part:(Part, subj:S, main:not_request), vsem:Word) ===>
cat> (v, vtense:(Tense, past), vsem:((Word, appear), theme:S)), % set the theme
cat> (inf_clause, part:Part).

% VP: promised + inf_clause
promise__vp rule
(vp, mood:(tense:Tense), part:(Part, subj:S, main:not_request), vsem:Word) ===>
cat> (v, vtense:(Tense, past), vsem:((Word, promise), theme:IC, agent:S, beneficiary:O)), % set the beneficiary, agent, theme
cat> (IC, inf_clause, part:(Part,obj2:O)).

% VP: requested + inf_clause
request__vp rule
(vp, mood:(tense:Tense), part:(Part, subj:S, main:request), vsem:Word) ===>
cat> (v, vtense:(Tense, past), vsem:((Word, request), theme:IC, agent:S, beneficiary:O)), % set the beneficiary, agent, theme
cat> (IC, inf_clause, part:(Part,obj2:O)).

% inf_clause: to + sleep (left verb: not request)
request_sleep__inf_clause rule
(inf_clause, vsem:(Word), part:(subj:S, main:not_request)) ===>
cat> toinf,
cat> (v, vtense:present, vsem:((Word,sleep), experiencer:S)). % set the experiencer to be the subj

% inf_clause: to + sleep (left verb: request)
not_request_sleep__inf_clause rule
(inf_clause, vsem:(Word), part:(obj1:S, main:request)) ===>
cat> toinf,
cat> (v, vtense:present, vsem:((Word,sleep), experiencer:S)). % set the experiencer to be obj1 (first left NP of sleep)

% inf_clause: to + tend + inf_clause
tend__inf_clause rule
(inf_clause, part:(Part, subj:S), vsem:Word) ===>
cat> toinf,
cat> (v, vtense:present, vsem:((Word, tend), agent:S, theme:IC)), % set the agent, theme
cat> (IC, inf_clause, part:Part).

% inf_clause: to + appear + inf_clause
appear__inf_clause rule
(inf_clause, part:(Part, subj:S), vsem:(Word)) ===>
cat> toinf,
cat> (v, vtense:present, vsem:((Word, appear),theme:S)), % set the theme
cat> (inf_clause, part:Part).

% inf_clause: to + promise + inf_clause
promise__inf_clause rule
(inf_clause, part:(Part, subj:S, obj2:O), vsem:(Word)) ===>
cat> toinf,
cat> (v, vtense:present, vsem:((Word, promise), beneficiary:O, agent:S, theme: IC)), % set the beneficiary, agent, theme
cat> (IC, inf_clause, part:Part).

% inf_clause: to + request + inf_clause
request__inf_clause rule
(inf_clause, part:(subj:S, obj2:O), vsem:(Word)) ===>
cat> toinf,
cat> (v, vtense:present, vsem:((Word, request), beneficiary:O, agent:S, theme: IC)), % set the beneficiary, agent, theme
cat> (IC, inf_clause, part:(subj:S, obj2:O, main:request)).

% inf_clause: NP + inf_clause (to promise & to request)
np__inf_clause rule
(inf_clause, part:(subj:S, main:M, obj2:NP), vsem:Word) ===> % pass the NP as the obj2 of the larger inf_clause
cat> (NP,np),
cat> (inf_clause, part:(subj:S, main:M, obj1:NP), vsem:Word). % pass the NP as the obj1 of the smaller inf_clause

% lexica
appear ---> (v, vtense:present, vsem:(appear, agent:none, beneficiary:none, experiencer:none)).
appeared ---> (v, vtense:past, vsem:(appear, agent:none, beneficiary:none, experiencer:none)).
promise ---> (v, vtense:present, vsem:(promise, experiencer:none)).
promised ---> (v, vtense:past, vsem:(promise, experiencer:none)).
request ---> (v, vtense:present, vsem:(request, experiencer:none)).
requested ---> (v, vtense:past, vsem:(request, experiencer:none)).
sleep --->  (v, vtense:present, vsem:(sleep, agent:none, beneficiary:none, theme:none)).
slept ---> (v, vtense:past, vsem:(sleep, agent:none, beneficiary:none, theme:none)).
student ---> (n, nsem:student).
teacher ---> (n, nsem:teacher).
tend ---> (v, vtense:present, vsem:(tend, beneficiary:none, experiencer: none)).
tended ---> (v, vtense:past, vsem:(tend, beneficiary:none, experiencer: none)).
the ---> det.
to ---> toinf.
