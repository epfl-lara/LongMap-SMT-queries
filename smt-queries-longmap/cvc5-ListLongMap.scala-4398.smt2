; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60488 () Bool)

(assert start!60488)

(declare-fun b!679729 () Bool)

(declare-fun res!446074 () Bool)

(declare-fun e!387244 () Bool)

(assert (=> b!679729 (=> (not res!446074) (not e!387244))))

(declare-datatypes ((array!39469 0))(
  ( (array!39470 (arr!18924 (Array (_ BitVec 32) (_ BitVec 64))) (size!19288 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39469)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12965 0))(
  ( (Nil!12962) (Cons!12961 (h!14006 (_ BitVec 64)) (t!19193 List!12965)) )
))
(declare-fun acc!681 () List!12965)

(declare-fun arrayNoDuplicates!0 (array!39469 (_ BitVec 32) List!12965) Bool)

(assert (=> b!679729 (= res!446074 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679730 () Bool)

(declare-fun res!446075 () Bool)

(assert (=> b!679730 (=> (not res!446075) (not e!387244))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679730 (= res!446075 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679732 () Bool)

(declare-fun e!387249 () Bool)

(assert (=> b!679732 (= e!387249 true)))

(declare-fun subseq!128 (List!12965 List!12965) Bool)

(assert (=> b!679732 (subseq!128 acc!681 acc!681)))

(declare-datatypes ((Unit!23814 0))(
  ( (Unit!23815) )
))
(declare-fun lt!312960 () Unit!23814)

(declare-fun lemmaListSubSeqRefl!0 (List!12965) Unit!23814)

(assert (=> b!679732 (= lt!312960 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!679733 () Bool)

(declare-fun res!446068 () Bool)

(assert (=> b!679733 (=> (not res!446068) (not e!387244))))

(declare-fun e!387246 () Bool)

(assert (=> b!679733 (= res!446068 e!387246)))

(declare-fun res!446077 () Bool)

(assert (=> b!679733 (=> res!446077 e!387246)))

(declare-fun e!387248 () Bool)

(assert (=> b!679733 (= res!446077 e!387248)))

(declare-fun res!446069 () Bool)

(assert (=> b!679733 (=> (not res!446069) (not e!387248))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!679733 (= res!446069 (bvsgt from!3004 i!1382))))

(declare-fun b!679734 () Bool)

(declare-fun e!387243 () Unit!23814)

(declare-fun Unit!23816 () Unit!23814)

(assert (=> b!679734 (= e!387243 Unit!23816)))

(declare-fun lt!312961 () Unit!23814)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39469 (_ BitVec 64) (_ BitVec 32)) Unit!23814)

(assert (=> b!679734 (= lt!312961 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!679734 false))

(declare-fun b!679735 () Bool)

(declare-fun e!387245 () Bool)

(assert (=> b!679735 (= e!387246 e!387245)))

(declare-fun res!446080 () Bool)

(assert (=> b!679735 (=> (not res!446080) (not e!387245))))

(assert (=> b!679735 (= res!446080 (bvsle from!3004 i!1382))))

(declare-fun b!679736 () Bool)

(declare-fun res!446076 () Bool)

(assert (=> b!679736 (=> (not res!446076) (not e!387244))))

(assert (=> b!679736 (= res!446076 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19288 a!3626))))))

(declare-fun b!679737 () Bool)

(declare-fun contains!3542 (List!12965 (_ BitVec 64)) Bool)

(assert (=> b!679737 (= e!387245 (not (contains!3542 acc!681 k!2843)))))

(declare-fun b!679738 () Bool)

(declare-fun res!446071 () Bool)

(assert (=> b!679738 (=> (not res!446071) (not e!387244))))

(assert (=> b!679738 (= res!446071 (not (contains!3542 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679739 () Bool)

(declare-fun res!446067 () Bool)

(assert (=> b!679739 (=> (not res!446067) (not e!387244))))

(assert (=> b!679739 (= res!446067 (not (contains!3542 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679740 () Bool)

(declare-fun res!446078 () Bool)

(assert (=> b!679740 (=> (not res!446078) (not e!387244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679740 (= res!446078 (validKeyInArray!0 k!2843))))

(declare-fun res!446070 () Bool)

(assert (=> start!60488 (=> (not res!446070) (not e!387244))))

(assert (=> start!60488 (= res!446070 (and (bvslt (size!19288 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19288 a!3626))))))

(assert (=> start!60488 e!387244))

(assert (=> start!60488 true))

(declare-fun array_inv!14720 (array!39469) Bool)

(assert (=> start!60488 (array_inv!14720 a!3626)))

(declare-fun b!679731 () Bool)

(declare-fun res!446073 () Bool)

(assert (=> b!679731 (=> (not res!446073) (not e!387244))))

(assert (=> b!679731 (= res!446073 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19288 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679741 () Bool)

(assert (=> b!679741 (= e!387244 (not e!387249))))

(declare-fun res!446081 () Bool)

(assert (=> b!679741 (=> res!446081 e!387249)))

(assert (=> b!679741 (= res!446081 (not (validKeyInArray!0 (select (arr!18924 a!3626) from!3004))))))

(declare-fun lt!312959 () Unit!23814)

(assert (=> b!679741 (= lt!312959 e!387243)))

(declare-fun c!77198 () Bool)

(assert (=> b!679741 (= c!77198 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!679741 (arrayContainsKey!0 (array!39470 (store (arr!18924 a!3626) i!1382 k!2843) (size!19288 a!3626)) k!2843 from!3004)))

(declare-fun b!679742 () Bool)

(declare-fun Unit!23817 () Unit!23814)

(assert (=> b!679742 (= e!387243 Unit!23817)))

(declare-fun b!679743 () Bool)

(declare-fun res!446079 () Bool)

(assert (=> b!679743 (=> (not res!446079) (not e!387244))))

(assert (=> b!679743 (= res!446079 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12962))))

(declare-fun b!679744 () Bool)

(assert (=> b!679744 (= e!387248 (contains!3542 acc!681 k!2843))))

(declare-fun b!679745 () Bool)

(declare-fun res!446072 () Bool)

(assert (=> b!679745 (=> (not res!446072) (not e!387244))))

(declare-fun noDuplicate!789 (List!12965) Bool)

(assert (=> b!679745 (= res!446072 (noDuplicate!789 acc!681))))

(assert (= (and start!60488 res!446070) b!679745))

(assert (= (and b!679745 res!446072) b!679738))

(assert (= (and b!679738 res!446071) b!679739))

(assert (= (and b!679739 res!446067) b!679733))

(assert (= (and b!679733 res!446069) b!679744))

(assert (= (and b!679733 (not res!446077)) b!679735))

(assert (= (and b!679735 res!446080) b!679737))

(assert (= (and b!679733 res!446068) b!679743))

(assert (= (and b!679743 res!446079) b!679729))

(assert (= (and b!679729 res!446074) b!679736))

(assert (= (and b!679736 res!446076) b!679740))

(assert (= (and b!679740 res!446078) b!679730))

(assert (= (and b!679730 res!446075) b!679731))

(assert (= (and b!679731 res!446073) b!679741))

(assert (= (and b!679741 c!77198) b!679734))

(assert (= (and b!679741 (not c!77198)) b!679742))

(assert (= (and b!679741 (not res!446081)) b!679732))

(declare-fun m!645017 () Bool)

(assert (=> b!679729 m!645017))

(declare-fun m!645019 () Bool)

(assert (=> b!679734 m!645019))

(declare-fun m!645021 () Bool)

(assert (=> b!679738 m!645021))

(declare-fun m!645023 () Bool)

(assert (=> start!60488 m!645023))

(declare-fun m!645025 () Bool)

(assert (=> b!679743 m!645025))

(declare-fun m!645027 () Bool)

(assert (=> b!679740 m!645027))

(declare-fun m!645029 () Bool)

(assert (=> b!679744 m!645029))

(declare-fun m!645031 () Bool)

(assert (=> b!679732 m!645031))

(declare-fun m!645033 () Bool)

(assert (=> b!679732 m!645033))

(declare-fun m!645035 () Bool)

(assert (=> b!679730 m!645035))

(declare-fun m!645037 () Bool)

(assert (=> b!679741 m!645037))

(declare-fun m!645039 () Bool)

(assert (=> b!679741 m!645039))

(declare-fun m!645041 () Bool)

(assert (=> b!679741 m!645041))

(assert (=> b!679741 m!645037))

(declare-fun m!645043 () Bool)

(assert (=> b!679741 m!645043))

(declare-fun m!645045 () Bool)

(assert (=> b!679741 m!645045))

(declare-fun m!645047 () Bool)

(assert (=> b!679739 m!645047))

(declare-fun m!645049 () Bool)

(assert (=> b!679745 m!645049))

(assert (=> b!679737 m!645029))

(push 1)

(assert (not b!679744))

(assert (not start!60488))

(assert (not b!679738))

(assert (not b!679734))

(assert (not b!679740))

(assert (not b!679730))

(assert (not b!679743))

(assert (not b!679739))

(assert (not b!679745))

(assert (not b!679741))

(assert (not b!679732))

(assert (not b!679729))

(assert (not b!679737))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

