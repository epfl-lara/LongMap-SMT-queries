; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60980 () Bool)

(assert start!60980)

(declare-fun b!683803 () Bool)

(declare-fun res!449493 () Bool)

(declare-fun e!389531 () Bool)

(assert (=> b!683803 (=> (not res!449493) (not e!389531))))

(declare-datatypes ((array!39589 0))(
  ( (array!39590 (arr!18975 (Array (_ BitVec 32) (_ BitVec 64))) (size!19342 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39589)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!683803 (= res!449493 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!449500 () Bool)

(assert (=> start!60980 (=> (not res!449500) (not e!389531))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60980 (= res!449500 (and (bvslt (size!19342 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19342 a!3626))))))

(assert (=> start!60980 e!389531))

(assert (=> start!60980 true))

(declare-fun array_inv!14771 (array!39589) Bool)

(assert (=> start!60980 (array_inv!14771 a!3626)))

(declare-fun b!683804 () Bool)

(declare-fun res!449503 () Bool)

(assert (=> b!683804 (=> (not res!449503) (not e!389531))))

(declare-datatypes ((List!13016 0))(
  ( (Nil!13013) (Cons!13012 (h!14057 (_ BitVec 64)) (t!19262 List!13016)) )
))
(declare-fun acc!681 () List!13016)

(declare-fun contains!3593 (List!13016 (_ BitVec 64)) Bool)

(assert (=> b!683804 (= res!449503 (not (contains!3593 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683805 () Bool)

(declare-fun res!449490 () Bool)

(assert (=> b!683805 (=> (not res!449490) (not e!389531))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!683805 (= res!449490 (validKeyInArray!0 k!2843))))

(declare-fun b!683806 () Bool)

(declare-fun res!449489 () Bool)

(assert (=> b!683806 (=> (not res!449489) (not e!389531))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!683806 (= res!449489 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19342 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!683807 () Bool)

(declare-fun res!449492 () Bool)

(assert (=> b!683807 (=> (not res!449492) (not e!389531))))

(declare-fun e!389529 () Bool)

(assert (=> b!683807 (= res!449492 e!389529)))

(declare-fun res!449494 () Bool)

(assert (=> b!683807 (=> res!449494 e!389529)))

(declare-fun e!389526 () Bool)

(assert (=> b!683807 (= res!449494 e!389526)))

(declare-fun res!449498 () Bool)

(assert (=> b!683807 (=> (not res!449498) (not e!389526))))

(assert (=> b!683807 (= res!449498 (bvsgt from!3004 i!1382))))

(declare-fun b!683808 () Bool)

(declare-datatypes ((Unit!24042 0))(
  ( (Unit!24043) )
))
(declare-fun e!389532 () Unit!24042)

(declare-fun Unit!24044 () Unit!24042)

(assert (=> b!683808 (= e!389532 Unit!24044)))

(declare-fun b!683809 () Bool)

(declare-fun res!449495 () Bool)

(assert (=> b!683809 (=> (not res!449495) (not e!389531))))

(assert (=> b!683809 (= res!449495 (not (contains!3593 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683810 () Bool)

(declare-fun e!389528 () Bool)

(declare-fun lt!314037 () Bool)

(assert (=> b!683810 (= e!389528 (not lt!314037))))

(declare-fun b!683811 () Bool)

(declare-fun res!449496 () Bool)

(assert (=> b!683811 (=> (not res!449496) (not e!389531))))

(declare-fun arrayNoDuplicates!0 (array!39589 (_ BitVec 32) List!13016) Bool)

(assert (=> b!683811 (= res!449496 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13013))))

(declare-fun b!683812 () Bool)

(declare-fun res!449502 () Bool)

(assert (=> b!683812 (=> res!449502 e!389528)))

(declare-fun lt!314039 () List!13016)

(declare-fun noDuplicate!840 (List!13016) Bool)

(assert (=> b!683812 (= res!449502 (not (noDuplicate!840 lt!314039)))))

(declare-fun b!683813 () Bool)

(declare-fun e!389530 () Bool)

(assert (=> b!683813 (= e!389530 (not (contains!3593 acc!681 k!2843)))))

(declare-fun b!683814 () Bool)

(assert (=> b!683814 (= e!389531 (not e!389528))))

(declare-fun res!449491 () Bool)

(assert (=> b!683814 (=> res!449491 e!389528)))

(assert (=> b!683814 (= res!449491 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!144 (List!13016 (_ BitVec 64)) List!13016)

(assert (=> b!683814 (= (-!144 lt!314039 k!2843) acc!681)))

(declare-fun $colon$colon!344 (List!13016 (_ BitVec 64)) List!13016)

(assert (=> b!683814 (= lt!314039 ($colon$colon!344 acc!681 k!2843))))

(declare-fun lt!314035 () Unit!24042)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13016) Unit!24042)

(assert (=> b!683814 (= lt!314035 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!179 (List!13016 List!13016) Bool)

(assert (=> b!683814 (subseq!179 acc!681 acc!681)))

(declare-fun lt!314033 () Unit!24042)

(declare-fun lemmaListSubSeqRefl!0 (List!13016) Unit!24042)

(assert (=> b!683814 (= lt!314033 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683814 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314034 () Unit!24042)

(declare-fun e!389527 () Unit!24042)

(assert (=> b!683814 (= lt!314034 e!389527)))

(declare-fun c!77524 () Bool)

(assert (=> b!683814 (= c!77524 (validKeyInArray!0 (select (arr!18975 a!3626) from!3004)))))

(declare-fun lt!314040 () Unit!24042)

(assert (=> b!683814 (= lt!314040 e!389532)))

(declare-fun c!77525 () Bool)

(assert (=> b!683814 (= c!77525 lt!314037)))

(assert (=> b!683814 (= lt!314037 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683814 (arrayContainsKey!0 (array!39590 (store (arr!18975 a!3626) i!1382 k!2843) (size!19342 a!3626)) k!2843 from!3004)))

(declare-fun b!683815 () Bool)

(assert (=> b!683815 (= e!389529 e!389530)))

(declare-fun res!449497 () Bool)

(assert (=> b!683815 (=> (not res!449497) (not e!389530))))

(assert (=> b!683815 (= res!449497 (bvsle from!3004 i!1382))))

(declare-fun b!683816 () Bool)

(declare-fun res!449499 () Bool)

(assert (=> b!683816 (=> (not res!449499) (not e!389531))))

(assert (=> b!683816 (= res!449499 (noDuplicate!840 acc!681))))

(declare-fun b!683817 () Bool)

(declare-fun Unit!24045 () Unit!24042)

(assert (=> b!683817 (= e!389532 Unit!24045)))

(declare-fun lt!314038 () Unit!24042)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39589 (_ BitVec 64) (_ BitVec 32)) Unit!24042)

(assert (=> b!683817 (= lt!314038 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!683817 false))

(declare-fun b!683818 () Bool)

(declare-fun Unit!24046 () Unit!24042)

(assert (=> b!683818 (= e!389527 Unit!24046)))

(declare-fun b!683819 () Bool)

(declare-fun lt!314036 () Unit!24042)

(assert (=> b!683819 (= e!389527 lt!314036)))

(declare-fun lt!314041 () Unit!24042)

(assert (=> b!683819 (= lt!314041 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683819 (subseq!179 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39589 List!13016 List!13016 (_ BitVec 32)) Unit!24042)

(assert (=> b!683819 (= lt!314036 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!344 acc!681 (select (arr!18975 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683819 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!683820 () Bool)

(declare-fun res!449501 () Bool)

(assert (=> b!683820 (=> (not res!449501) (not e!389531))))

(assert (=> b!683820 (= res!449501 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!683821 () Bool)

(assert (=> b!683821 (= e!389526 (contains!3593 acc!681 k!2843))))

(declare-fun b!683822 () Bool)

(declare-fun res!449504 () Bool)

(assert (=> b!683822 (=> (not res!449504) (not e!389531))))

(assert (=> b!683822 (= res!449504 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19342 a!3626))))))

(assert (= (and start!60980 res!449500) b!683816))

(assert (= (and b!683816 res!449499) b!683809))

(assert (= (and b!683809 res!449495) b!683804))

(assert (= (and b!683804 res!449503) b!683807))

(assert (= (and b!683807 res!449498) b!683821))

(assert (= (and b!683807 (not res!449494)) b!683815))

(assert (= (and b!683815 res!449497) b!683813))

(assert (= (and b!683807 res!449492) b!683811))

(assert (= (and b!683811 res!449496) b!683820))

(assert (= (and b!683820 res!449501) b!683822))

(assert (= (and b!683822 res!449504) b!683805))

(assert (= (and b!683805 res!449490) b!683803))

(assert (= (and b!683803 res!449493) b!683806))

(assert (= (and b!683806 res!449489) b!683814))

(assert (= (and b!683814 c!77525) b!683817))

(assert (= (and b!683814 (not c!77525)) b!683808))

(assert (= (and b!683814 c!77524) b!683819))

(assert (= (and b!683814 (not c!77524)) b!683818))

(assert (= (and b!683814 (not res!449491)) b!683812))

(assert (= (and b!683812 (not res!449502)) b!683810))

(declare-fun m!648305 () Bool)

(assert (=> b!683817 m!648305))

(declare-fun m!648307 () Bool)

(assert (=> b!683805 m!648307))

(declare-fun m!648309 () Bool)

(assert (=> b!683813 m!648309))

(declare-fun m!648311 () Bool)

(assert (=> start!60980 m!648311))

(declare-fun m!648313 () Bool)

(assert (=> b!683809 m!648313))

(declare-fun m!648315 () Bool)

(assert (=> b!683812 m!648315))

(declare-fun m!648317 () Bool)

(assert (=> b!683804 m!648317))

(declare-fun m!648319 () Bool)

(assert (=> b!683816 m!648319))

(declare-fun m!648321 () Bool)

(assert (=> b!683803 m!648321))

(declare-fun m!648323 () Bool)

(assert (=> b!683814 m!648323))

(declare-fun m!648325 () Bool)

(assert (=> b!683814 m!648325))

(declare-fun m!648327 () Bool)

(assert (=> b!683814 m!648327))

(declare-fun m!648329 () Bool)

(assert (=> b!683814 m!648329))

(declare-fun m!648331 () Bool)

(assert (=> b!683814 m!648331))

(declare-fun m!648333 () Bool)

(assert (=> b!683814 m!648333))

(declare-fun m!648335 () Bool)

(assert (=> b!683814 m!648335))

(declare-fun m!648337 () Bool)

(assert (=> b!683814 m!648337))

(assert (=> b!683814 m!648325))

(declare-fun m!648339 () Bool)

(assert (=> b!683814 m!648339))

(declare-fun m!648341 () Bool)

(assert (=> b!683814 m!648341))

(declare-fun m!648343 () Bool)

(assert (=> b!683814 m!648343))

(declare-fun m!648345 () Bool)

(assert (=> b!683811 m!648345))

(assert (=> b!683819 m!648323))

(assert (=> b!683819 m!648325))

(declare-fun m!648347 () Bool)

(assert (=> b!683819 m!648347))

(declare-fun m!648349 () Bool)

(assert (=> b!683819 m!648349))

(assert (=> b!683819 m!648325))

(assert (=> b!683819 m!648347))

(assert (=> b!683819 m!648333))

(assert (=> b!683819 m!648343))

(assert (=> b!683821 m!648309))

(declare-fun m!648351 () Bool)

(assert (=> b!683820 m!648351))

(push 1)

(assert (not b!683804))

(assert (not b!683820))

(assert (not b!683809))

(assert (not b!683811))

(assert (not b!683816))

(assert (not b!683817))

(assert (not b!683821))

(assert (not b!683813))

(assert (not b!683812))

(assert (not b!683805))

(assert (not b!683819))

(assert (not b!683803))

(assert (not b!683814))

(assert (not start!60980))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

