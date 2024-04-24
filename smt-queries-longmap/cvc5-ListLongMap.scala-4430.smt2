; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61618 () Bool)

(assert start!61618)

(declare-fun b!688642 () Bool)

(declare-fun res!453253 () Bool)

(declare-fun e!392249 () Bool)

(assert (=> b!688642 (=> res!453253 e!392249)))

(declare-datatypes ((List!12965 0))(
  ( (Nil!12962) (Cons!12961 (h!14009 (_ BitVec 64)) (t!19221 List!12965)) )
))
(declare-fun lt!315866 () List!12965)

(declare-fun contains!3617 (List!12965 (_ BitVec 64)) Bool)

(assert (=> b!688642 (= res!453253 (contains!3617 lt!315866 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688643 () Bool)

(declare-fun res!453239 () Bool)

(declare-fun e!392247 () Bool)

(assert (=> b!688643 (=> (not res!453239) (not e!392247))))

(declare-fun acc!681 () List!12965)

(assert (=> b!688643 (= res!453239 (not (contains!3617 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688644 () Bool)

(declare-fun res!453241 () Bool)

(assert (=> b!688644 (=> (not res!453241) (not e!392247))))

(declare-fun e!392246 () Bool)

(assert (=> b!688644 (= res!453241 e!392246)))

(declare-fun res!453257 () Bool)

(assert (=> b!688644 (=> res!453257 e!392246)))

(declare-fun e!392244 () Bool)

(assert (=> b!688644 (= res!453257 e!392244)))

(declare-fun res!453259 () Bool)

(assert (=> b!688644 (=> (not res!453259) (not e!392244))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!688644 (= res!453259 (bvsgt from!3004 i!1382))))

(declare-fun b!688645 () Bool)

(declare-fun res!453243 () Bool)

(assert (=> b!688645 (=> (not res!453243) (not e!392247))))

(declare-datatypes ((array!39697 0))(
  ( (array!39698 (arr!19017 (Array (_ BitVec 32) (_ BitVec 64))) (size!19397 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39697)

(assert (=> b!688645 (= res!453243 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19397 a!3626))))))

(declare-fun b!688646 () Bool)

(declare-fun res!453250 () Bool)

(assert (=> b!688646 (=> (not res!453250) (not e!392247))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!688646 (= res!453250 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!453242 () Bool)

(assert (=> start!61618 (=> (not res!453242) (not e!392247))))

(assert (=> start!61618 (= res!453242 (and (bvslt (size!19397 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19397 a!3626))))))

(assert (=> start!61618 e!392247))

(assert (=> start!61618 true))

(declare-fun array_inv!14876 (array!39697) Bool)

(assert (=> start!61618 (array_inv!14876 a!3626)))

(declare-fun b!688647 () Bool)

(declare-datatypes ((Unit!24256 0))(
  ( (Unit!24257) )
))
(declare-fun e!392242 () Unit!24256)

(declare-fun Unit!24258 () Unit!24256)

(assert (=> b!688647 (= e!392242 Unit!24258)))

(declare-fun b!688648 () Bool)

(assert (=> b!688648 (= e!392249 true)))

(declare-fun lt!315869 () Bool)

(declare-fun e!392250 () Bool)

(assert (=> b!688648 (= lt!315869 e!392250)))

(declare-fun res!453251 () Bool)

(assert (=> b!688648 (=> res!453251 e!392250)))

(declare-fun e!392240 () Bool)

(assert (=> b!688648 (= res!453251 e!392240)))

(declare-fun res!453258 () Bool)

(assert (=> b!688648 (=> (not res!453258) (not e!392240))))

(assert (=> b!688648 (= res!453258 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688649 () Bool)

(declare-fun e!392241 () Bool)

(assert (=> b!688649 (= e!392246 e!392241)))

(declare-fun res!453249 () Bool)

(assert (=> b!688649 (=> (not res!453249) (not e!392241))))

(assert (=> b!688649 (= res!453249 (bvsle from!3004 i!1382))))

(declare-fun b!688650 () Bool)

(declare-fun res!453245 () Bool)

(assert (=> b!688650 (=> (not res!453245) (not e!392247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!688650 (= res!453245 (validKeyInArray!0 k!2843))))

(declare-fun b!688651 () Bool)

(assert (=> b!688651 (= e!392240 (contains!3617 lt!315866 k!2843))))

(declare-fun b!688652 () Bool)

(declare-fun res!453256 () Bool)

(assert (=> b!688652 (=> (not res!453256) (not e!392247))))

(declare-fun arrayNoDuplicates!0 (array!39697 (_ BitVec 32) List!12965) Bool)

(assert (=> b!688652 (= res!453256 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12962))))

(declare-fun b!688653 () Bool)

(declare-fun res!453246 () Bool)

(assert (=> b!688653 (=> (not res!453246) (not e!392247))))

(assert (=> b!688653 (= res!453246 (not (contains!3617 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688654 () Bool)

(declare-fun lt!315865 () Unit!24256)

(assert (=> b!688654 (= e!392242 lt!315865)))

(declare-fun lt!315870 () Unit!24256)

(declare-fun lemmaListSubSeqRefl!0 (List!12965) Unit!24256)

(assert (=> b!688654 (= lt!315870 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!226 (List!12965 List!12965) Bool)

(assert (=> b!688654 (subseq!226 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39697 List!12965 List!12965 (_ BitVec 32)) Unit!24256)

(declare-fun $colon$colon!388 (List!12965 (_ BitVec 64)) List!12965)

(assert (=> b!688654 (= lt!315865 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!388 acc!681 (select (arr!19017 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688654 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!688655 () Bool)

(declare-fun res!453255 () Bool)

(assert (=> b!688655 (=> res!453255 e!392249)))

(declare-fun noDuplicate!891 (List!12965) Bool)

(assert (=> b!688655 (= res!453255 (not (noDuplicate!891 lt!315866)))))

(declare-fun b!688656 () Bool)

(assert (=> b!688656 (= e!392241 (not (contains!3617 acc!681 k!2843)))))

(declare-fun b!688657 () Bool)

(assert (=> b!688657 (= e!392247 (not e!392249))))

(declare-fun res!453244 () Bool)

(assert (=> b!688657 (=> res!453244 e!392249)))

(assert (=> b!688657 (= res!453244 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!688657 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315866)))

(declare-fun lt!315863 () Unit!24256)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39697 (_ BitVec 64) (_ BitVec 32) List!12965 List!12965) Unit!24256)

(assert (=> b!688657 (= lt!315863 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315866))))

(declare-fun -!190 (List!12965 (_ BitVec 64)) List!12965)

(assert (=> b!688657 (= (-!190 lt!315866 k!2843) acc!681)))

(assert (=> b!688657 (= lt!315866 ($colon$colon!388 acc!681 k!2843))))

(declare-fun lt!315868 () Unit!24256)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12965) Unit!24256)

(assert (=> b!688657 (= lt!315868 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!688657 (subseq!226 acc!681 acc!681)))

(declare-fun lt!315862 () Unit!24256)

(assert (=> b!688657 (= lt!315862 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688657 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315867 () Unit!24256)

(assert (=> b!688657 (= lt!315867 e!392242)))

(declare-fun c!78071 () Bool)

(assert (=> b!688657 (= c!78071 (validKeyInArray!0 (select (arr!19017 a!3626) from!3004)))))

(declare-fun lt!315871 () Unit!24256)

(declare-fun e!392245 () Unit!24256)

(assert (=> b!688657 (= lt!315871 e!392245)))

(declare-fun c!78070 () Bool)

(assert (=> b!688657 (= c!78070 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688657 (arrayContainsKey!0 (array!39698 (store (arr!19017 a!3626) i!1382 k!2843) (size!19397 a!3626)) k!2843 from!3004)))

(declare-fun b!688658 () Bool)

(declare-fun res!453254 () Bool)

(assert (=> b!688658 (=> (not res!453254) (not e!392247))))

(assert (=> b!688658 (= res!453254 (noDuplicate!891 acc!681))))

(declare-fun b!688659 () Bool)

(declare-fun res!453252 () Bool)

(assert (=> b!688659 (=> (not res!453252) (not e!392247))))

(assert (=> b!688659 (= res!453252 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19397 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!688660 () Bool)

(assert (=> b!688660 (= e!392244 (contains!3617 acc!681 k!2843))))

(declare-fun b!688661 () Bool)

(declare-fun e!392243 () Bool)

(assert (=> b!688661 (= e!392243 (not (contains!3617 lt!315866 k!2843)))))

(declare-fun b!688662 () Bool)

(declare-fun res!453248 () Bool)

(assert (=> b!688662 (=> (not res!453248) (not e!392247))))

(assert (=> b!688662 (= res!453248 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!688663 () Bool)

(declare-fun Unit!24259 () Unit!24256)

(assert (=> b!688663 (= e!392245 Unit!24259)))

(declare-fun lt!315864 () Unit!24256)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39697 (_ BitVec 64) (_ BitVec 32)) Unit!24256)

(assert (=> b!688663 (= lt!315864 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!688663 false))

(declare-fun b!688664 () Bool)

(declare-fun res!453247 () Bool)

(assert (=> b!688664 (=> res!453247 e!392249)))

(assert (=> b!688664 (= res!453247 (contains!3617 lt!315866 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688665 () Bool)

(declare-fun Unit!24260 () Unit!24256)

(assert (=> b!688665 (= e!392245 Unit!24260)))

(declare-fun b!688666 () Bool)

(assert (=> b!688666 (= e!392250 e!392243)))

(declare-fun res!453240 () Bool)

(assert (=> b!688666 (=> (not res!453240) (not e!392243))))

(assert (=> b!688666 (= res!453240 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!61618 res!453242) b!688658))

(assert (= (and b!688658 res!453254) b!688653))

(assert (= (and b!688653 res!453246) b!688643))

(assert (= (and b!688643 res!453239) b!688644))

(assert (= (and b!688644 res!453259) b!688660))

(assert (= (and b!688644 (not res!453257)) b!688649))

(assert (= (and b!688649 res!453249) b!688656))

(assert (= (and b!688644 res!453241) b!688652))

(assert (= (and b!688652 res!453256) b!688662))

(assert (= (and b!688662 res!453248) b!688645))

(assert (= (and b!688645 res!453243) b!688650))

(assert (= (and b!688650 res!453245) b!688646))

(assert (= (and b!688646 res!453250) b!688659))

(assert (= (and b!688659 res!453252) b!688657))

(assert (= (and b!688657 c!78070) b!688663))

(assert (= (and b!688657 (not c!78070)) b!688665))

(assert (= (and b!688657 c!78071) b!688654))

(assert (= (and b!688657 (not c!78071)) b!688647))

(assert (= (and b!688657 (not res!453244)) b!688655))

(assert (= (and b!688655 (not res!453255)) b!688642))

(assert (= (and b!688642 (not res!453253)) b!688664))

(assert (= (and b!688664 (not res!453247)) b!688648))

(assert (= (and b!688648 res!453258) b!688651))

(assert (= (and b!688648 (not res!453251)) b!688666))

(assert (= (and b!688666 res!453240) b!688661))

(declare-fun m!653013 () Bool)

(assert (=> b!688662 m!653013))

(declare-fun m!653015 () Bool)

(assert (=> start!61618 m!653015))

(declare-fun m!653017 () Bool)

(assert (=> b!688642 m!653017))

(declare-fun m!653019 () Bool)

(assert (=> b!688657 m!653019))

(declare-fun m!653021 () Bool)

(assert (=> b!688657 m!653021))

(declare-fun m!653023 () Bool)

(assert (=> b!688657 m!653023))

(declare-fun m!653025 () Bool)

(assert (=> b!688657 m!653025))

(declare-fun m!653027 () Bool)

(assert (=> b!688657 m!653027))

(declare-fun m!653029 () Bool)

(assert (=> b!688657 m!653029))

(declare-fun m!653031 () Bool)

(assert (=> b!688657 m!653031))

(declare-fun m!653033 () Bool)

(assert (=> b!688657 m!653033))

(declare-fun m!653035 () Bool)

(assert (=> b!688657 m!653035))

(declare-fun m!653037 () Bool)

(assert (=> b!688657 m!653037))

(assert (=> b!688657 m!653021))

(declare-fun m!653039 () Bool)

(assert (=> b!688657 m!653039))

(declare-fun m!653041 () Bool)

(assert (=> b!688657 m!653041))

(declare-fun m!653043 () Bool)

(assert (=> b!688657 m!653043))

(declare-fun m!653045 () Bool)

(assert (=> b!688643 m!653045))

(declare-fun m!653047 () Bool)

(assert (=> b!688653 m!653047))

(declare-fun m!653049 () Bool)

(assert (=> b!688646 m!653049))

(declare-fun m!653051 () Bool)

(assert (=> b!688663 m!653051))

(declare-fun m!653053 () Bool)

(assert (=> b!688658 m!653053))

(declare-fun m!653055 () Bool)

(assert (=> b!688652 m!653055))

(assert (=> b!688654 m!653019))

(assert (=> b!688654 m!653021))

(declare-fun m!653057 () Bool)

(assert (=> b!688654 m!653057))

(declare-fun m!653059 () Bool)

(assert (=> b!688654 m!653059))

(assert (=> b!688654 m!653021))

(assert (=> b!688654 m!653057))

(assert (=> b!688654 m!653027))

(assert (=> b!688654 m!653043))

(declare-fun m!653061 () Bool)

(assert (=> b!688655 m!653061))

(declare-fun m!653063 () Bool)

(assert (=> b!688656 m!653063))

(declare-fun m!653065 () Bool)

(assert (=> b!688661 m!653065))

(assert (=> b!688651 m!653065))

(declare-fun m!653067 () Bool)

(assert (=> b!688650 m!653067))

(assert (=> b!688660 m!653063))

(declare-fun m!653069 () Bool)

(assert (=> b!688664 m!653069))

(push 1)

(assert (not b!688642))

(assert (not b!688652))

(assert (not b!688664))

(assert (not b!688660))

(assert (not b!688654))

(assert (not b!688661))

(assert (not b!688658))

(assert (not b!688657))

(assert (not b!688643))

(assert (not b!688650))

(assert (not b!688655))

(assert (not b!688656))

(assert (not b!688662))

(assert (not b!688663))

(assert (not b!688653))

(assert (not b!688646))

(assert (not b!688651))

(assert (not start!61618))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

