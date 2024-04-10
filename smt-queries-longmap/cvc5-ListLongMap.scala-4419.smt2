; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61004 () Bool)

(assert start!61004)

(declare-fun b!684554 () Bool)

(declare-fun res!450108 () Bool)

(declare-fun e!389818 () Bool)

(assert (=> b!684554 (=> (not res!450108) (not e!389818))))

(declare-datatypes ((List!13028 0))(
  ( (Nil!13025) (Cons!13024 (h!14069 (_ BitVec 64)) (t!19274 List!13028)) )
))
(declare-fun acc!681 () List!13028)

(declare-fun contains!3605 (List!13028 (_ BitVec 64)) Bool)

(assert (=> b!684554 (= res!450108 (not (contains!3605 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684555 () Bool)

(declare-fun e!389814 () Bool)

(assert (=> b!684555 (= e!389818 (not e!389814))))

(declare-fun res!450105 () Bool)

(assert (=> b!684555 (=> res!450105 e!389814)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!684555 (= res!450105 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!314383 () List!13028)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun -!156 (List!13028 (_ BitVec 64)) List!13028)

(assert (=> b!684555 (= (-!156 lt!314383 k!2843) acc!681)))

(declare-fun $colon$colon!356 (List!13028 (_ BitVec 64)) List!13028)

(assert (=> b!684555 (= lt!314383 ($colon$colon!356 acc!681 k!2843))))

(declare-datatypes ((Unit!24102 0))(
  ( (Unit!24103) )
))
(declare-fun lt!314379 () Unit!24102)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13028) Unit!24102)

(assert (=> b!684555 (= lt!314379 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!191 (List!13028 List!13028) Bool)

(assert (=> b!684555 (subseq!191 acc!681 acc!681)))

(declare-fun lt!314375 () Unit!24102)

(declare-fun lemmaListSubSeqRefl!0 (List!13028) Unit!24102)

(assert (=> b!684555 (= lt!314375 (lemmaListSubSeqRefl!0 acc!681))))

(declare-datatypes ((array!39613 0))(
  ( (array!39614 (arr!18987 (Array (_ BitVec 32) (_ BitVec 64))) (size!19354 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39613)

(declare-fun arrayNoDuplicates!0 (array!39613 (_ BitVec 32) List!13028) Bool)

(assert (=> b!684555 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314380 () Unit!24102)

(declare-fun e!389820 () Unit!24102)

(assert (=> b!684555 (= lt!314380 e!389820)))

(declare-fun c!77596 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!684555 (= c!77596 (validKeyInArray!0 (select (arr!18987 a!3626) from!3004)))))

(declare-fun lt!314377 () Unit!24102)

(declare-fun e!389813 () Unit!24102)

(assert (=> b!684555 (= lt!314377 e!389813)))

(declare-fun c!77597 () Bool)

(declare-fun lt!314381 () Bool)

(assert (=> b!684555 (= c!77597 lt!314381)))

(declare-fun arrayContainsKey!0 (array!39613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!684555 (= lt!314381 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!684555 (arrayContainsKey!0 (array!39614 (store (arr!18987 a!3626) i!1382 k!2843) (size!19354 a!3626)) k!2843 from!3004)))

(declare-fun b!684556 () Bool)

(declare-fun res!450103 () Bool)

(assert (=> b!684556 (=> (not res!450103) (not e!389818))))

(assert (=> b!684556 (= res!450103 (not (contains!3605 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684557 () Bool)

(declare-fun e!389817 () Bool)

(assert (=> b!684557 (= e!389817 (not (contains!3605 acc!681 k!2843)))))

(declare-fun b!684558 () Bool)

(declare-fun res!450104 () Bool)

(assert (=> b!684558 (=> (not res!450104) (not e!389818))))

(assert (=> b!684558 (= res!450104 (validKeyInArray!0 k!2843))))

(declare-fun b!684559 () Bool)

(declare-fun lt!314376 () Unit!24102)

(assert (=> b!684559 (= e!389820 lt!314376)))

(declare-fun lt!314378 () Unit!24102)

(assert (=> b!684559 (= lt!314378 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684559 (subseq!191 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39613 List!13028 List!13028 (_ BitVec 32)) Unit!24102)

(assert (=> b!684559 (= lt!314376 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!356 acc!681 (select (arr!18987 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684559 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!684560 () Bool)

(declare-fun e!389819 () Bool)

(assert (=> b!684560 (= e!389819 (contains!3605 acc!681 k!2843))))

(declare-fun b!684561 () Bool)

(declare-fun e!389815 () Bool)

(assert (=> b!684561 (= e!389815 e!389817)))

(declare-fun res!450102 () Bool)

(assert (=> b!684561 (=> (not res!450102) (not e!389817))))

(assert (=> b!684561 (= res!450102 (bvsle from!3004 i!1382))))

(declare-fun b!684563 () Bool)

(declare-fun Unit!24104 () Unit!24102)

(assert (=> b!684563 (= e!389813 Unit!24104)))

(declare-fun b!684564 () Bool)

(declare-fun res!450107 () Bool)

(assert (=> b!684564 (=> (not res!450107) (not e!389818))))

(assert (=> b!684564 (= res!450107 e!389815)))

(declare-fun res!450099 () Bool)

(assert (=> b!684564 (=> res!450099 e!389815)))

(assert (=> b!684564 (= res!450099 e!389819)))

(declare-fun res!450111 () Bool)

(assert (=> b!684564 (=> (not res!450111) (not e!389819))))

(assert (=> b!684564 (= res!450111 (bvsgt from!3004 i!1382))))

(declare-fun b!684565 () Bool)

(declare-fun res!450100 () Bool)

(assert (=> b!684565 (=> (not res!450100) (not e!389818))))

(assert (=> b!684565 (= res!450100 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!684566 () Bool)

(declare-fun res!450109 () Bool)

(assert (=> b!684566 (=> res!450109 e!389814)))

(assert (=> b!684566 (= res!450109 (contains!3605 acc!681 k!2843))))

(declare-fun b!684567 () Bool)

(declare-fun res!450098 () Bool)

(assert (=> b!684567 (=> (not res!450098) (not e!389818))))

(assert (=> b!684567 (= res!450098 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19354 a!3626))))))

(declare-fun b!684568 () Bool)

(declare-fun res!450110 () Bool)

(assert (=> b!684568 (=> (not res!450110) (not e!389818))))

(assert (=> b!684568 (= res!450110 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!684569 () Bool)

(assert (=> b!684569 (= e!389814 (subseq!191 acc!681 lt!314383))))

(declare-fun b!684570 () Bool)

(declare-fun res!450112 () Bool)

(assert (=> b!684570 (=> (not res!450112) (not e!389818))))

(assert (=> b!684570 (= res!450112 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13025))))

(declare-fun b!684571 () Bool)

(declare-fun Unit!24105 () Unit!24102)

(assert (=> b!684571 (= e!389813 Unit!24105)))

(declare-fun lt!314382 () Unit!24102)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39613 (_ BitVec 64) (_ BitVec 32)) Unit!24102)

(assert (=> b!684571 (= lt!314382 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!684571 false))

(declare-fun b!684572 () Bool)

(declare-fun Unit!24106 () Unit!24102)

(assert (=> b!684572 (= e!389820 Unit!24106)))

(declare-fun b!684573 () Bool)

(declare-fun res!450101 () Bool)

(assert (=> b!684573 (=> (not res!450101) (not e!389818))))

(declare-fun noDuplicate!852 (List!13028) Bool)

(assert (=> b!684573 (= res!450101 (noDuplicate!852 acc!681))))

(declare-fun b!684574 () Bool)

(declare-fun res!450106 () Bool)

(assert (=> b!684574 (=> res!450106 e!389814)))

(assert (=> b!684574 (= res!450106 (not (noDuplicate!852 lt!314383)))))

(declare-fun b!684575 () Bool)

(declare-fun res!450097 () Bool)

(assert (=> b!684575 (=> res!450097 e!389814)))

(assert (=> b!684575 (= res!450097 lt!314381)))

(declare-fun b!684562 () Bool)

(declare-fun res!450113 () Bool)

(assert (=> b!684562 (=> (not res!450113) (not e!389818))))

(assert (=> b!684562 (= res!450113 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19354 a!3626)) (= from!3004 i!1382)))))

(declare-fun res!450096 () Bool)

(assert (=> start!61004 (=> (not res!450096) (not e!389818))))

(assert (=> start!61004 (= res!450096 (and (bvslt (size!19354 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19354 a!3626))))))

(assert (=> start!61004 e!389818))

(assert (=> start!61004 true))

(declare-fun array_inv!14783 (array!39613) Bool)

(assert (=> start!61004 (array_inv!14783 a!3626)))

(assert (= (and start!61004 res!450096) b!684573))

(assert (= (and b!684573 res!450101) b!684554))

(assert (= (and b!684554 res!450108) b!684556))

(assert (= (and b!684556 res!450103) b!684564))

(assert (= (and b!684564 res!450111) b!684560))

(assert (= (and b!684564 (not res!450099)) b!684561))

(assert (= (and b!684561 res!450102) b!684557))

(assert (= (and b!684564 res!450107) b!684570))

(assert (= (and b!684570 res!450112) b!684568))

(assert (= (and b!684568 res!450110) b!684567))

(assert (= (and b!684567 res!450098) b!684558))

(assert (= (and b!684558 res!450104) b!684565))

(assert (= (and b!684565 res!450100) b!684562))

(assert (= (and b!684562 res!450113) b!684555))

(assert (= (and b!684555 c!77597) b!684571))

(assert (= (and b!684555 (not c!77597)) b!684563))

(assert (= (and b!684555 c!77596) b!684559))

(assert (= (and b!684555 (not c!77596)) b!684572))

(assert (= (and b!684555 (not res!450105)) b!684574))

(assert (= (and b!684574 (not res!450106)) b!684575))

(assert (= (and b!684575 (not res!450097)) b!684566))

(assert (= (and b!684566 (not res!450109)) b!684569))

(declare-fun m!648881 () Bool)

(assert (=> b!684560 m!648881))

(declare-fun m!648883 () Bool)

(assert (=> b!684568 m!648883))

(declare-fun m!648885 () Bool)

(assert (=> b!684574 m!648885))

(declare-fun m!648887 () Bool)

(assert (=> b!684559 m!648887))

(declare-fun m!648889 () Bool)

(assert (=> b!684559 m!648889))

(declare-fun m!648891 () Bool)

(assert (=> b!684559 m!648891))

(declare-fun m!648893 () Bool)

(assert (=> b!684559 m!648893))

(assert (=> b!684559 m!648889))

(assert (=> b!684559 m!648891))

(declare-fun m!648895 () Bool)

(assert (=> b!684559 m!648895))

(declare-fun m!648897 () Bool)

(assert (=> b!684559 m!648897))

(assert (=> b!684566 m!648881))

(assert (=> b!684557 m!648881))

(declare-fun m!648899 () Bool)

(assert (=> b!684556 m!648899))

(declare-fun m!648901 () Bool)

(assert (=> b!684569 m!648901))

(assert (=> b!684555 m!648887))

(assert (=> b!684555 m!648889))

(declare-fun m!648903 () Bool)

(assert (=> b!684555 m!648903))

(declare-fun m!648905 () Bool)

(assert (=> b!684555 m!648905))

(assert (=> b!684555 m!648895))

(declare-fun m!648907 () Bool)

(assert (=> b!684555 m!648907))

(assert (=> b!684555 m!648889))

(declare-fun m!648909 () Bool)

(assert (=> b!684555 m!648909))

(declare-fun m!648911 () Bool)

(assert (=> b!684555 m!648911))

(declare-fun m!648913 () Bool)

(assert (=> b!684555 m!648913))

(declare-fun m!648915 () Bool)

(assert (=> b!684555 m!648915))

(assert (=> b!684555 m!648897))

(declare-fun m!648917 () Bool)

(assert (=> b!684554 m!648917))

(declare-fun m!648919 () Bool)

(assert (=> b!684558 m!648919))

(declare-fun m!648921 () Bool)

(assert (=> start!61004 m!648921))

(declare-fun m!648923 () Bool)

(assert (=> b!684573 m!648923))

(declare-fun m!648925 () Bool)

(assert (=> b!684571 m!648925))

(declare-fun m!648927 () Bool)

(assert (=> b!684565 m!648927))

(declare-fun m!648929 () Bool)

(assert (=> b!684570 m!648929))

(push 1)

(assert (not start!61004))

(assert (not b!684554))

(assert (not b!684556))

(assert (not b!684568))

(assert (not b!684565))

(assert (not b!684569))

(assert (not b!684560))

(assert (not b!684559))

(assert (not b!684570))

(assert (not b!684574))

(assert (not b!684558))

(assert (not b!684571))

(assert (not b!684573))

(assert (not b!684557))

(assert (not b!684566))

(assert (not b!684555))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94347 () Bool)

(declare-fun res!450308 () Bool)

(declare-fun e!389973 () Bool)

(assert (=> d!94347 (=> res!450308 e!389973)))

(assert (=> d!94347 (= res!450308 (is-Nil!13025 acc!681))))

(assert (=> d!94347 (= (subseq!191 acc!681 lt!314383) e!389973)))

(declare-fun b!684826 () Bool)

(declare-fun e!389975 () Bool)

(assert (=> b!684826 (= e!389973 e!389975)))

(declare-fun res!450310 () Bool)

(assert (=> b!684826 (=> (not res!450310) (not e!389975))))

(assert (=> b!684826 (= res!450310 (is-Cons!13024 lt!314383))))

(declare-fun b!684827 () Bool)

(declare-fun e!389974 () Bool)

(assert (=> b!684827 (= e!389975 e!389974)))

(declare-fun res!450309 () Bool)

(assert (=> b!684827 (=> res!450309 e!389974)))

(declare-fun e!389976 () Bool)

(assert (=> b!684827 (= res!450309 e!389976)))

(declare-fun res!450311 () Bool)

(assert (=> b!684827 (=> (not res!450311) (not e!389976))))

(assert (=> b!684827 (= res!450311 (= (h!14069 acc!681) (h!14069 lt!314383)))))

(declare-fun b!684829 () Bool)

(assert (=> b!684829 (= e!389974 (subseq!191 acc!681 (t!19274 lt!314383)))))

(declare-fun b!684828 () Bool)

(assert (=> b!684828 (= e!389976 (subseq!191 (t!19274 acc!681) (t!19274 lt!314383)))))

(assert (= (and d!94347 (not res!450308)) b!684826))

(assert (= (and b!684826 res!450310) b!684827))

(assert (= (and b!684827 res!450311) b!684828))

(assert (= (and b!684827 (not res!450309)) b!684829))

(declare-fun m!649121 () Bool)

(assert (=> b!684829 m!649121))

(declare-fun m!649123 () Bool)

(assert (=> b!684828 m!649123))

(assert (=> b!684569 d!94347))

(declare-fun d!94361 () Bool)

(assert (=> d!94361 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!684558 d!94361))

(declare-fun d!94365 () Bool)

(assert (=> d!94365 (= (array_inv!14783 a!3626) (bvsge (size!19354 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61004 d!94365))

(declare-fun d!94369 () Bool)

(declare-fun lt!314467 () Bool)

(declare-fun content!287 (List!13028) (Set (_ BitVec 64)))

(assert (=> d!94369 (= lt!314467 (set.member k!2843 (content!287 acc!681)))))

(declare-fun e!390001 () Bool)

(assert (=> d!94369 (= lt!314467 e!390001)))

(declare-fun res!450335 () Bool)

(assert (=> d!94369 (=> (not res!450335) (not e!390001))))

(assert (=> d!94369 (= res!450335 (is-Cons!13024 acc!681))))

(assert (=> d!94369 (= (contains!3605 acc!681 k!2843) lt!314467)))

(declare-fun b!684856 () Bool)

(declare-fun e!390002 () Bool)

(assert (=> b!684856 (= e!390001 e!390002)))

(declare-fun res!450334 () Bool)

(assert (=> b!684856 (=> res!450334 e!390002)))

(assert (=> b!684856 (= res!450334 (= (h!14069 acc!681) k!2843))))

(declare-fun b!684857 () Bool)

(assert (=> b!684857 (= e!390002 (contains!3605 (t!19274 acc!681) k!2843))))

(assert (= (and d!94369 res!450335) b!684856))

(assert (= (and b!684856 (not res!450334)) b!684857))

(declare-fun m!649137 () Bool)

(assert (=> d!94369 m!649137))

(declare-fun m!649139 () Bool)

(assert (=> d!94369 m!649139))

(declare-fun m!649141 () Bool)

(assert (=> b!684857 m!649141))

(assert (=> b!684560 d!94369))

(declare-fun b!684904 () Bool)

(declare-fun e!390043 () Bool)

(declare-fun call!34047 () Bool)

(assert (=> b!684904 (= e!390043 call!34047)))

(declare-fun b!684905 () Bool)

(declare-fun e!390044 () Bool)

(assert (=> b!684905 (= e!390044 e!390043)))

(declare-fun c!77634 () Bool)

(assert (=> b!684905 (= c!77634 (validKeyInArray!0 (select (arr!18987 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!684906 () Bool)

(declare-fun e!390045 () Bool)

(assert (=> b!684906 (= e!390045 (contains!3605 Nil!13025 (select (arr!18987 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!684907 () Bool)

(declare-fun e!390046 () Bool)

(assert (=> b!684907 (= e!390046 e!390044)))

(declare-fun res!450372 () Bool)

(assert (=> b!684907 (=> (not res!450372) (not e!390044))))

(assert (=> b!684907 (= res!450372 (not e!390045))))

(declare-fun res!450371 () Bool)

(assert (=> b!684907 (=> (not res!450371) (not e!390045))))

(assert (=> b!684907 (= res!450371 (validKeyInArray!0 (select (arr!18987 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!94377 () Bool)

(declare-fun res!450370 () Bool)

(assert (=> d!94377 (=> res!450370 e!390046)))

(assert (=> d!94377 (= res!450370 (bvsge #b00000000000000000000000000000000 (size!19354 a!3626)))))

(assert (=> d!94377 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13025) e!390046)))

(declare-fun b!684908 () Bool)

(assert (=> b!684908 (= e!390043 call!34047)))

(declare-fun bm!34044 () Bool)

(assert (=> bm!34044 (= call!34047 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77634 (Cons!13024 (select (arr!18987 a!3626) #b00000000000000000000000000000000) Nil!13025) Nil!13025)))))

(assert (= (and d!94377 (not res!450370)) b!684907))

(assert (= (and b!684907 res!450371) b!684906))

(assert (= (and b!684907 res!450372) b!684905))

(assert (= (and b!684905 c!77634) b!684908))

(assert (= (and b!684905 (not c!77634)) b!684904))

(assert (= (or b!684908 b!684904) bm!34044))

(declare-fun m!649201 () Bool)

(assert (=> b!684905 m!649201))

(assert (=> b!684905 m!649201))

(declare-fun m!649203 () Bool)

(assert (=> b!684905 m!649203))

(assert (=> b!684906 m!649201))

(assert (=> b!684906 m!649201))

(declare-fun m!649205 () Bool)

(assert (=> b!684906 m!649205))

(assert (=> b!684907 m!649201))

(assert (=> b!684907 m!649201))

(assert (=> b!684907 m!649203))

(assert (=> bm!34044 m!649201))

(declare-fun m!649207 () Bool)

(assert (=> bm!34044 m!649207))

(assert (=> b!684570 d!94377))

(declare-fun d!94417 () Bool)

(assert (=> d!94417 (= ($colon$colon!356 acc!681 (select (arr!18987 a!3626) from!3004)) (Cons!13024 (select (arr!18987 a!3626) from!3004) acc!681))))

(assert (=> b!684559 d!94417))

(declare-fun d!94419 () Bool)

(declare-fun res!450373 () Bool)

(declare-fun e!390047 () Bool)

(assert (=> d!94419 (=> res!450373 e!390047)))

(assert (=> d!94419 (= res!450373 (is-Nil!13025 acc!681))))

(assert (=> d!94419 (= (subseq!191 acc!681 acc!681) e!390047)))

(declare-fun b!684909 () Bool)

(declare-fun e!390049 () Bool)

(assert (=> b!684909 (= e!390047 e!390049)))

(declare-fun res!450375 () Bool)

(assert (=> b!684909 (=> (not res!450375) (not e!390049))))

(assert (=> b!684909 (= res!450375 (is-Cons!13024 acc!681))))

(declare-fun b!684910 () Bool)

(declare-fun e!390048 () Bool)

(assert (=> b!684910 (= e!390049 e!390048)))

(declare-fun res!450374 () Bool)

(assert (=> b!684910 (=> res!450374 e!390048)))

(declare-fun e!390050 () Bool)

(assert (=> b!684910 (= res!450374 e!390050)))

(declare-fun res!450376 () Bool)

(assert (=> b!684910 (=> (not res!450376) (not e!390050))))

(assert (=> b!684910 (= res!450376 (= (h!14069 acc!681) (h!14069 acc!681)))))

(declare-fun b!684912 () Bool)

(assert (=> b!684912 (= e!390048 (subseq!191 acc!681 (t!19274 acc!681)))))

(declare-fun b!684911 () Bool)

(assert (=> b!684911 (= e!390050 (subseq!191 (t!19274 acc!681) (t!19274 acc!681)))))

(assert (= (and d!94419 (not res!450373)) b!684909))

(assert (= (and b!684909 res!450375) b!684910))

(assert (= (and b!684910 res!450376) b!684911))

(assert (= (and b!684910 (not res!450374)) b!684912))

(declare-fun m!649209 () Bool)

(assert (=> b!684912 m!649209))

(declare-fun m!649211 () Bool)

(assert (=> b!684911 m!649211))

(assert (=> b!684559 d!94419))

(declare-fun d!94421 () Bool)

(assert (=> d!94421 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314483 () Unit!24102)

(declare-fun choose!80 (array!39613 List!13028 List!13028 (_ BitVec 32)) Unit!24102)

(assert (=> d!94421 (= lt!314483 (choose!80 a!3626 ($colon$colon!356 acc!681 (select (arr!18987 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94421 (bvslt (size!19354 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94421 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!356 acc!681 (select (arr!18987 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!314483)))

(declare-fun bs!20082 () Bool)

(assert (= bs!20082 d!94421))

(assert (=> bs!20082 m!648887))

(assert (=> bs!20082 m!648891))

(declare-fun m!649213 () Bool)

(assert (=> bs!20082 m!649213))

(assert (=> b!684559 d!94421))

(declare-fun d!94423 () Bool)

(assert (=> d!94423 (subseq!191 acc!681 acc!681)))

(declare-fun lt!314486 () Unit!24102)

(declare-fun choose!36 (List!13028) Unit!24102)

(assert (=> d!94423 (= lt!314486 (choose!36 acc!681))))

(assert (=> d!94423 (= (lemmaListSubSeqRefl!0 acc!681) lt!314486)))

(declare-fun bs!20083 () Bool)

(assert (= bs!20083 d!94423))

(assert (=> bs!20083 m!648897))

(declare-fun m!649215 () Bool)

(assert (=> bs!20083 m!649215))

(assert (=> b!684559 d!94423))

(declare-fun b!684913 () Bool)

(declare-fun e!390051 () Bool)

(declare-fun call!34048 () Bool)

(assert (=> b!684913 (= e!390051 call!34048)))

(declare-fun b!684914 () Bool)

(declare-fun e!390052 () Bool)

(assert (=> b!684914 (= e!390052 e!390051)))

(declare-fun c!77635 () Bool)

(assert (=> b!684914 (= c!77635 (validKeyInArray!0 (select (arr!18987 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun e!390053 () Bool)

(declare-fun b!684915 () Bool)

(assert (=> b!684915 (= e!390053 (contains!3605 acc!681 (select (arr!18987 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!684916 () Bool)

(declare-fun e!390054 () Bool)

(assert (=> b!684916 (= e!390054 e!390052)))

(declare-fun res!450379 () Bool)

(assert (=> b!684916 (=> (not res!450379) (not e!390052))))

(assert (=> b!684916 (= res!450379 (not e!390053))))

(declare-fun res!450378 () Bool)

(assert (=> b!684916 (=> (not res!450378) (not e!390053))))

(assert (=> b!684916 (= res!450378 (validKeyInArray!0 (select (arr!18987 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!94425 () Bool)

(declare-fun res!450377 () Bool)

(assert (=> d!94425 (=> res!450377 e!390054)))

(assert (=> d!94425 (= res!450377 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19354 a!3626)))))

(assert (=> d!94425 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!390054)))

(declare-fun b!684917 () Bool)

(assert (=> b!684917 (= e!390051 call!34048)))

(declare-fun bm!34045 () Bool)

(assert (=> bm!34045 (= call!34048 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77635 (Cons!13024 (select (arr!18987 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(assert (= (and d!94425 (not res!450377)) b!684916))

(assert (= (and b!684916 res!450378) b!684915))

(assert (= (and b!684916 res!450379) b!684914))

(assert (= (and b!684914 c!77635) b!684917))

(assert (= (and b!684914 (not c!77635)) b!684913))

(assert (= (or b!684917 b!684913) bm!34045))

(declare-fun m!649217 () Bool)

(assert (=> b!684914 m!649217))

(assert (=> b!684914 m!649217))

(declare-fun m!649219 () Bool)

(assert (=> b!684914 m!649219))

(assert (=> b!684915 m!649217))

(assert (=> b!684915 m!649217))

(declare-fun m!649221 () Bool)

(assert (=> b!684915 m!649221))

(assert (=> b!684916 m!649217))

(assert (=> b!684916 m!649217))

(assert (=> b!684916 m!649219))

(assert (=> bm!34045 m!649217))

(declare-fun m!649223 () Bool)

(assert (=> bm!34045 m!649223))

(assert (=> b!684559 d!94425))

(declare-fun d!94427 () Bool)

(assert (=> d!94427 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!314489 () Unit!24102)

(declare-fun choose!13 (array!39613 (_ BitVec 64) (_ BitVec 32)) Unit!24102)

(assert (=> d!94427 (= lt!314489 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!94427 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94427 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!314489)))

(declare-fun bs!20084 () Bool)

(assert (= bs!20084 d!94427))

(assert (=> bs!20084 m!648927))

(declare-fun m!649225 () Bool)

(assert (=> bs!20084 m!649225))

(assert (=> b!684571 d!94427))

(declare-fun d!94429 () Bool)

(declare-fun res!450384 () Bool)

(declare-fun e!390059 () Bool)

(assert (=> d!94429 (=> res!450384 e!390059)))

(assert (=> d!94429 (= res!450384 (is-Nil!13025 acc!681))))

(assert (=> d!94429 (= (noDuplicate!852 acc!681) e!390059)))

(declare-fun b!684922 () Bool)

(declare-fun e!390060 () Bool)

(assert (=> b!684922 (= e!390059 e!390060)))

(declare-fun res!450385 () Bool)

(assert (=> b!684922 (=> (not res!450385) (not e!390060))))

(assert (=> b!684922 (= res!450385 (not (contains!3605 (t!19274 acc!681) (h!14069 acc!681))))))

(declare-fun b!684923 () Bool)

(assert (=> b!684923 (= e!390060 (noDuplicate!852 (t!19274 acc!681)))))

(assert (= (and d!94429 (not res!450384)) b!684922))

(assert (= (and b!684922 res!450385) b!684923))

(declare-fun m!649227 () Bool)

(assert (=> b!684922 m!649227))

(declare-fun m!649229 () Bool)

(assert (=> b!684923 m!649229))

(assert (=> b!684573 d!94429))

(declare-fun d!94431 () Bool)

(declare-fun res!450386 () Bool)

(declare-fun e!390061 () Bool)

(assert (=> d!94431 (=> res!450386 e!390061)))

(assert (=> d!94431 (= res!450386 (is-Nil!13025 lt!314383))))

(assert (=> d!94431 (= (noDuplicate!852 lt!314383) e!390061)))

(declare-fun b!684924 () Bool)

(declare-fun e!390062 () Bool)

(assert (=> b!684924 (= e!390061 e!390062)))

(declare-fun res!450387 () Bool)

