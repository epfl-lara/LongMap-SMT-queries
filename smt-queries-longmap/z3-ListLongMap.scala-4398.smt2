; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60490 () Bool)

(assert start!60490)

(declare-fun b!679780 () Bool)

(declare-fun res!446121 () Bool)

(declare-fun e!387267 () Bool)

(assert (=> b!679780 (=> (not res!446121) (not e!387267))))

(declare-datatypes ((array!39471 0))(
  ( (array!39472 (arr!18925 (Array (_ BitVec 32) (_ BitVec 64))) (size!19289 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39471)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12966 0))(
  ( (Nil!12963) (Cons!12962 (h!14007 (_ BitVec 64)) (t!19194 List!12966)) )
))
(declare-fun acc!681 () List!12966)

(declare-fun arrayNoDuplicates!0 (array!39471 (_ BitVec 32) List!12966) Bool)

(assert (=> b!679780 (= res!446121 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!679781 () Bool)

(declare-fun res!446117 () Bool)

(assert (=> b!679781 (=> (not res!446117) (not e!387267))))

(declare-fun noDuplicate!790 (List!12966) Bool)

(assert (=> b!679781 (= res!446117 (noDuplicate!790 acc!681))))

(declare-fun b!679782 () Bool)

(declare-fun res!446119 () Bool)

(assert (=> b!679782 (=> (not res!446119) (not e!387267))))

(declare-fun e!387270 () Bool)

(assert (=> b!679782 (= res!446119 e!387270)))

(declare-fun res!446123 () Bool)

(assert (=> b!679782 (=> res!446123 e!387270)))

(declare-fun e!387264 () Bool)

(assert (=> b!679782 (= res!446123 e!387264)))

(declare-fun res!446113 () Bool)

(assert (=> b!679782 (=> (not res!446113) (not e!387264))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!679782 (= res!446113 (bvsgt from!3004 i!1382))))

(declare-fun b!679783 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3543 (List!12966 (_ BitVec 64)) Bool)

(assert (=> b!679783 (= e!387264 (contains!3543 acc!681 k0!2843))))

(declare-fun b!679785 () Bool)

(declare-datatypes ((Unit!23818 0))(
  ( (Unit!23819) )
))
(declare-fun e!387265 () Unit!23818)

(declare-fun Unit!23820 () Unit!23818)

(assert (=> b!679785 (= e!387265 Unit!23820)))

(declare-fun lt!312969 () Unit!23818)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39471 (_ BitVec 64) (_ BitVec 32)) Unit!23818)

(assert (=> b!679785 (= lt!312969 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!679785 false))

(declare-fun b!679786 () Bool)

(declare-fun res!446114 () Bool)

(assert (=> b!679786 (=> (not res!446114) (not e!387267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679786 (= res!446114 (validKeyInArray!0 k0!2843))))

(declare-fun b!679787 () Bool)

(declare-fun res!446116 () Bool)

(assert (=> b!679787 (=> (not res!446116) (not e!387267))))

(declare-fun arrayContainsKey!0 (array!39471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679787 (= res!446116 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679788 () Bool)

(declare-fun e!387266 () Bool)

(assert (=> b!679788 (= e!387267 (not e!387266))))

(declare-fun res!446122 () Bool)

(assert (=> b!679788 (=> res!446122 e!387266)))

(assert (=> b!679788 (= res!446122 (not (validKeyInArray!0 (select (arr!18925 a!3626) from!3004))))))

(declare-fun lt!312970 () Unit!23818)

(assert (=> b!679788 (= lt!312970 e!387265)))

(declare-fun c!77201 () Bool)

(assert (=> b!679788 (= c!77201 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!679788 (arrayContainsKey!0 (array!39472 (store (arr!18925 a!3626) i!1382 k0!2843) (size!19289 a!3626)) k0!2843 from!3004)))

(declare-fun b!679789 () Bool)

(declare-fun e!387268 () Bool)

(assert (=> b!679789 (= e!387270 e!387268)))

(declare-fun res!446115 () Bool)

(assert (=> b!679789 (=> (not res!446115) (not e!387268))))

(assert (=> b!679789 (= res!446115 (bvsle from!3004 i!1382))))

(declare-fun b!679790 () Bool)

(assert (=> b!679790 (= e!387268 (not (contains!3543 acc!681 k0!2843)))))

(declare-fun b!679791 () Bool)

(assert (=> b!679791 (= e!387266 true)))

(declare-fun subseq!129 (List!12966 List!12966) Bool)

(assert (=> b!679791 (subseq!129 acc!681 acc!681)))

(declare-fun lt!312968 () Unit!23818)

(declare-fun lemmaListSubSeqRefl!0 (List!12966) Unit!23818)

(assert (=> b!679791 (= lt!312968 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!679792 () Bool)

(declare-fun res!446118 () Bool)

(assert (=> b!679792 (=> (not res!446118) (not e!387267))))

(assert (=> b!679792 (= res!446118 (not (contains!3543 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679793 () Bool)

(declare-fun res!446126 () Bool)

(assert (=> b!679793 (=> (not res!446126) (not e!387267))))

(assert (=> b!679793 (= res!446126 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19289 a!3626))))))

(declare-fun res!446125 () Bool)

(assert (=> start!60490 (=> (not res!446125) (not e!387267))))

(assert (=> start!60490 (= res!446125 (and (bvslt (size!19289 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19289 a!3626))))))

(assert (=> start!60490 e!387267))

(assert (=> start!60490 true))

(declare-fun array_inv!14721 (array!39471) Bool)

(assert (=> start!60490 (array_inv!14721 a!3626)))

(declare-fun b!679784 () Bool)

(declare-fun Unit!23821 () Unit!23818)

(assert (=> b!679784 (= e!387265 Unit!23821)))

(declare-fun b!679794 () Bool)

(declare-fun res!446112 () Bool)

(assert (=> b!679794 (=> (not res!446112) (not e!387267))))

(assert (=> b!679794 (= res!446112 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12963))))

(declare-fun b!679795 () Bool)

(declare-fun res!446124 () Bool)

(assert (=> b!679795 (=> (not res!446124) (not e!387267))))

(assert (=> b!679795 (= res!446124 (not (contains!3543 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679796 () Bool)

(declare-fun res!446120 () Bool)

(assert (=> b!679796 (=> (not res!446120) (not e!387267))))

(assert (=> b!679796 (= res!446120 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19289 a!3626)) (= from!3004 i!1382)))))

(assert (= (and start!60490 res!446125) b!679781))

(assert (= (and b!679781 res!446117) b!679792))

(assert (= (and b!679792 res!446118) b!679795))

(assert (= (and b!679795 res!446124) b!679782))

(assert (= (and b!679782 res!446113) b!679783))

(assert (= (and b!679782 (not res!446123)) b!679789))

(assert (= (and b!679789 res!446115) b!679790))

(assert (= (and b!679782 res!446119) b!679794))

(assert (= (and b!679794 res!446112) b!679780))

(assert (= (and b!679780 res!446121) b!679793))

(assert (= (and b!679793 res!446126) b!679786))

(assert (= (and b!679786 res!446114) b!679787))

(assert (= (and b!679787 res!446116) b!679796))

(assert (= (and b!679796 res!446120) b!679788))

(assert (= (and b!679788 c!77201) b!679785))

(assert (= (and b!679788 (not c!77201)) b!679784))

(assert (= (and b!679788 (not res!446122)) b!679791))

(declare-fun m!645051 () Bool)

(assert (=> b!679787 m!645051))

(declare-fun m!645053 () Bool)

(assert (=> b!679788 m!645053))

(declare-fun m!645055 () Bool)

(assert (=> b!679788 m!645055))

(declare-fun m!645057 () Bool)

(assert (=> b!679788 m!645057))

(assert (=> b!679788 m!645053))

(declare-fun m!645059 () Bool)

(assert (=> b!679788 m!645059))

(declare-fun m!645061 () Bool)

(assert (=> b!679788 m!645061))

(declare-fun m!645063 () Bool)

(assert (=> b!679790 m!645063))

(assert (=> b!679783 m!645063))

(declare-fun m!645065 () Bool)

(assert (=> b!679780 m!645065))

(declare-fun m!645067 () Bool)

(assert (=> b!679792 m!645067))

(declare-fun m!645069 () Bool)

(assert (=> b!679794 m!645069))

(declare-fun m!645071 () Bool)

(assert (=> b!679786 m!645071))

(declare-fun m!645073 () Bool)

(assert (=> b!679795 m!645073))

(declare-fun m!645075 () Bool)

(assert (=> b!679785 m!645075))

(declare-fun m!645077 () Bool)

(assert (=> b!679781 m!645077))

(declare-fun m!645079 () Bool)

(assert (=> b!679791 m!645079))

(declare-fun m!645081 () Bool)

(assert (=> b!679791 m!645081))

(declare-fun m!645083 () Bool)

(assert (=> start!60490 m!645083))

(check-sat (not start!60490) (not b!679794) (not b!679791) (not b!679786) (not b!679792) (not b!679788) (not b!679785) (not b!679780) (not b!679783) (not b!679795) (not b!679787) (not b!679790) (not b!679781))
