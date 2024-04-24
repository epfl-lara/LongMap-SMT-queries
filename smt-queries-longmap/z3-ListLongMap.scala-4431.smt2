; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61620 () Bool)

(assert start!61620)

(declare-fun b!688717 () Bool)

(declare-fun res!453305 () Bool)

(declare-fun e!392283 () Bool)

(assert (=> b!688717 (=> (not res!453305) (not e!392283))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39699 0))(
  ( (array!39700 (arr!19018 (Array (_ BitVec 32) (_ BitVec 64))) (size!19398 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39699)

(assert (=> b!688717 (= res!453305 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19398 a!3626))))))

(declare-fun b!688718 () Bool)

(declare-datatypes ((Unit!24261 0))(
  ( (Unit!24262) )
))
(declare-fun e!392273 () Unit!24261)

(declare-fun lt!315895 () Unit!24261)

(assert (=> b!688718 (= e!392273 lt!315895)))

(declare-fun lt!315900 () Unit!24261)

(declare-datatypes ((List!12966 0))(
  ( (Nil!12963) (Cons!12962 (h!14010 (_ BitVec 64)) (t!19222 List!12966)) )
))
(declare-fun acc!681 () List!12966)

(declare-fun lemmaListSubSeqRefl!0 (List!12966) Unit!24261)

(assert (=> b!688718 (= lt!315900 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!227 (List!12966 List!12966) Bool)

(assert (=> b!688718 (subseq!227 acc!681 acc!681)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39699 List!12966 List!12966 (_ BitVec 32)) Unit!24261)

(declare-fun $colon$colon!389 (List!12966 (_ BitVec 64)) List!12966)

(assert (=> b!688718 (= lt!315895 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!389 acc!681 (select (arr!19018 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39699 (_ BitVec 32) List!12966) Bool)

(assert (=> b!688718 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!688719 () Bool)

(declare-fun res!453314 () Bool)

(assert (=> b!688719 (=> (not res!453314) (not e!392283))))

(assert (=> b!688719 (= res!453314 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19398 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!688720 () Bool)

(declare-fun res!453322 () Bool)

(declare-fun e!392278 () Bool)

(assert (=> b!688720 (=> res!453322 e!392278)))

(declare-fun lt!315894 () List!12966)

(declare-fun contains!3618 (List!12966 (_ BitVec 64)) Bool)

(assert (=> b!688720 (= res!453322 (contains!3618 lt!315894 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688721 () Bool)

(declare-fun e!392276 () Unit!24261)

(declare-fun Unit!24263 () Unit!24261)

(assert (=> b!688721 (= e!392276 Unit!24263)))

(declare-fun b!688722 () Bool)

(declare-fun res!453318 () Bool)

(assert (=> b!688722 (=> (not res!453318) (not e!392283))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!688722 (= res!453318 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!453303 () Bool)

(assert (=> start!61620 (=> (not res!453303) (not e!392283))))

(assert (=> start!61620 (= res!453303 (and (bvslt (size!19398 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19398 a!3626))))))

(assert (=> start!61620 e!392283))

(assert (=> start!61620 true))

(declare-fun array_inv!14877 (array!39699) Bool)

(assert (=> start!61620 (array_inv!14877 a!3626)))

(declare-fun b!688723 () Bool)

(declare-fun res!453306 () Bool)

(assert (=> b!688723 (=> (not res!453306) (not e!392283))))

(declare-fun e!392279 () Bool)

(assert (=> b!688723 (= res!453306 e!392279)))

(declare-fun res!453308 () Bool)

(assert (=> b!688723 (=> res!453308 e!392279)))

(declare-fun e!392277 () Bool)

(assert (=> b!688723 (= res!453308 e!392277)))

(declare-fun res!453320 () Bool)

(assert (=> b!688723 (=> (not res!453320) (not e!392277))))

(assert (=> b!688723 (= res!453320 (bvsgt from!3004 i!1382))))

(declare-fun b!688724 () Bool)

(declare-fun res!453302 () Bool)

(assert (=> b!688724 (=> (not res!453302) (not e!392283))))

(declare-fun noDuplicate!892 (List!12966) Bool)

(assert (=> b!688724 (= res!453302 (noDuplicate!892 acc!681))))

(declare-fun b!688725 () Bool)

(declare-fun Unit!24264 () Unit!24261)

(assert (=> b!688725 (= e!392276 Unit!24264)))

(declare-fun lt!315892 () Unit!24261)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39699 (_ BitVec 64) (_ BitVec 32)) Unit!24261)

(assert (=> b!688725 (= lt!315892 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!688725 false))

(declare-fun b!688726 () Bool)

(declare-fun res!453315 () Bool)

(assert (=> b!688726 (=> (not res!453315) (not e!392283))))

(assert (=> b!688726 (= res!453315 (not (contains!3618 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688727 () Bool)

(assert (=> b!688727 (= e!392277 (contains!3618 acc!681 k0!2843))))

(declare-fun b!688728 () Bool)

(declare-fun res!453319 () Bool)

(assert (=> b!688728 (=> (not res!453319) (not e!392283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!688728 (= res!453319 (validKeyInArray!0 k0!2843))))

(declare-fun b!688729 () Bool)

(assert (=> b!688729 (= e!392278 true)))

(declare-fun lt!315899 () Bool)

(declare-fun e!392275 () Bool)

(assert (=> b!688729 (= lt!315899 e!392275)))

(declare-fun res!453307 () Bool)

(assert (=> b!688729 (=> res!453307 e!392275)))

(declare-fun e!392282 () Bool)

(assert (=> b!688729 (= res!453307 e!392282)))

(declare-fun res!453316 () Bool)

(assert (=> b!688729 (=> (not res!453316) (not e!392282))))

(assert (=> b!688729 (= res!453316 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688730 () Bool)

(declare-fun res!453321 () Bool)

(assert (=> b!688730 (=> (not res!453321) (not e!392283))))

(assert (=> b!688730 (= res!453321 (not (contains!3618 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688731 () Bool)

(declare-fun e!392280 () Bool)

(assert (=> b!688731 (= e!392275 e!392280)))

(declare-fun res!453312 () Bool)

(assert (=> b!688731 (=> (not res!453312) (not e!392280))))

(assert (=> b!688731 (= res!453312 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688732 () Bool)

(declare-fun e!392274 () Bool)

(assert (=> b!688732 (= e!392274 (not (contains!3618 acc!681 k0!2843)))))

(declare-fun b!688733 () Bool)

(declare-fun Unit!24265 () Unit!24261)

(assert (=> b!688733 (= e!392273 Unit!24265)))

(declare-fun b!688734 () Bool)

(assert (=> b!688734 (= e!392282 (contains!3618 lt!315894 k0!2843))))

(declare-fun b!688735 () Bool)

(assert (=> b!688735 (= e!392283 (not e!392278))))

(declare-fun res!453311 () Bool)

(assert (=> b!688735 (=> res!453311 e!392278)))

(assert (=> b!688735 (= res!453311 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!688735 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315894)))

(declare-fun lt!315897 () Unit!24261)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39699 (_ BitVec 64) (_ BitVec 32) List!12966 List!12966) Unit!24261)

(assert (=> b!688735 (= lt!315897 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315894))))

(declare-fun -!191 (List!12966 (_ BitVec 64)) List!12966)

(assert (=> b!688735 (= (-!191 lt!315894 k0!2843) acc!681)))

(assert (=> b!688735 (= lt!315894 ($colon$colon!389 acc!681 k0!2843))))

(declare-fun lt!315898 () Unit!24261)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12966) Unit!24261)

(assert (=> b!688735 (= lt!315898 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!688735 (subseq!227 acc!681 acc!681)))

(declare-fun lt!315901 () Unit!24261)

(assert (=> b!688735 (= lt!315901 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688735 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315893 () Unit!24261)

(assert (=> b!688735 (= lt!315893 e!392273)))

(declare-fun c!78077 () Bool)

(assert (=> b!688735 (= c!78077 (validKeyInArray!0 (select (arr!19018 a!3626) from!3004)))))

(declare-fun lt!315896 () Unit!24261)

(assert (=> b!688735 (= lt!315896 e!392276)))

(declare-fun c!78076 () Bool)

(assert (=> b!688735 (= c!78076 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688735 (arrayContainsKey!0 (array!39700 (store (arr!19018 a!3626) i!1382 k0!2843) (size!19398 a!3626)) k0!2843 from!3004)))

(declare-fun b!688736 () Bool)

(declare-fun res!453317 () Bool)

(assert (=> b!688736 (=> res!453317 e!392278)))

(assert (=> b!688736 (= res!453317 (contains!3618 lt!315894 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688737 () Bool)

(declare-fun res!453313 () Bool)

(assert (=> b!688737 (=> (not res!453313) (not e!392283))))

(assert (=> b!688737 (= res!453313 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12963))))

(declare-fun b!688738 () Bool)

(assert (=> b!688738 (= e!392280 (not (contains!3618 lt!315894 k0!2843)))))

(declare-fun b!688739 () Bool)

(declare-fun res!453309 () Bool)

(assert (=> b!688739 (=> res!453309 e!392278)))

(assert (=> b!688739 (= res!453309 (not (noDuplicate!892 lt!315894)))))

(declare-fun b!688740 () Bool)

(assert (=> b!688740 (= e!392279 e!392274)))

(declare-fun res!453310 () Bool)

(assert (=> b!688740 (=> (not res!453310) (not e!392274))))

(assert (=> b!688740 (= res!453310 (bvsle from!3004 i!1382))))

(declare-fun b!688741 () Bool)

(declare-fun res!453304 () Bool)

(assert (=> b!688741 (=> (not res!453304) (not e!392283))))

(assert (=> b!688741 (= res!453304 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!61620 res!453303) b!688724))

(assert (= (and b!688724 res!453302) b!688730))

(assert (= (and b!688730 res!453321) b!688726))

(assert (= (and b!688726 res!453315) b!688723))

(assert (= (and b!688723 res!453320) b!688727))

(assert (= (and b!688723 (not res!453308)) b!688740))

(assert (= (and b!688740 res!453310) b!688732))

(assert (= (and b!688723 res!453306) b!688737))

(assert (= (and b!688737 res!453313) b!688741))

(assert (= (and b!688741 res!453304) b!688717))

(assert (= (and b!688717 res!453305) b!688728))

(assert (= (and b!688728 res!453319) b!688722))

(assert (= (and b!688722 res!453318) b!688719))

(assert (= (and b!688719 res!453314) b!688735))

(assert (= (and b!688735 c!78076) b!688725))

(assert (= (and b!688735 (not c!78076)) b!688721))

(assert (= (and b!688735 c!78077) b!688718))

(assert (= (and b!688735 (not c!78077)) b!688733))

(assert (= (and b!688735 (not res!453311)) b!688739))

(assert (= (and b!688739 (not res!453309)) b!688720))

(assert (= (and b!688720 (not res!453322)) b!688736))

(assert (= (and b!688736 (not res!453317)) b!688729))

(assert (= (and b!688729 res!453316) b!688734))

(assert (= (and b!688729 (not res!453307)) b!688731))

(assert (= (and b!688731 res!453312) b!688738))

(declare-fun m!653071 () Bool)

(assert (=> b!688736 m!653071))

(declare-fun m!653073 () Bool)

(assert (=> b!688727 m!653073))

(declare-fun m!653075 () Bool)

(assert (=> b!688730 m!653075))

(declare-fun m!653077 () Bool)

(assert (=> start!61620 m!653077))

(declare-fun m!653079 () Bool)

(assert (=> b!688734 m!653079))

(declare-fun m!653081 () Bool)

(assert (=> b!688735 m!653081))

(declare-fun m!653083 () Bool)

(assert (=> b!688735 m!653083))

(declare-fun m!653085 () Bool)

(assert (=> b!688735 m!653085))

(declare-fun m!653087 () Bool)

(assert (=> b!688735 m!653087))

(declare-fun m!653089 () Bool)

(assert (=> b!688735 m!653089))

(declare-fun m!653091 () Bool)

(assert (=> b!688735 m!653091))

(declare-fun m!653093 () Bool)

(assert (=> b!688735 m!653093))

(assert (=> b!688735 m!653083))

(declare-fun m!653095 () Bool)

(assert (=> b!688735 m!653095))

(declare-fun m!653097 () Bool)

(assert (=> b!688735 m!653097))

(declare-fun m!653099 () Bool)

(assert (=> b!688735 m!653099))

(declare-fun m!653101 () Bool)

(assert (=> b!688735 m!653101))

(declare-fun m!653103 () Bool)

(assert (=> b!688735 m!653103))

(declare-fun m!653105 () Bool)

(assert (=> b!688735 m!653105))

(assert (=> b!688732 m!653073))

(assert (=> b!688738 m!653079))

(declare-fun m!653107 () Bool)

(assert (=> b!688726 m!653107))

(declare-fun m!653109 () Bool)

(assert (=> b!688741 m!653109))

(declare-fun m!653111 () Bool)

(assert (=> b!688728 m!653111))

(declare-fun m!653113 () Bool)

(assert (=> b!688739 m!653113))

(declare-fun m!653115 () Bool)

(assert (=> b!688725 m!653115))

(assert (=> b!688718 m!653081))

(assert (=> b!688718 m!653083))

(declare-fun m!653117 () Bool)

(assert (=> b!688718 m!653117))

(declare-fun m!653119 () Bool)

(assert (=> b!688718 m!653119))

(assert (=> b!688718 m!653083))

(assert (=> b!688718 m!653117))

(assert (=> b!688718 m!653089))

(assert (=> b!688718 m!653105))

(declare-fun m!653121 () Bool)

(assert (=> b!688720 m!653121))

(declare-fun m!653123 () Bool)

(assert (=> b!688722 m!653123))

(declare-fun m!653125 () Bool)

(assert (=> b!688724 m!653125))

(declare-fun m!653127 () Bool)

(assert (=> b!688737 m!653127))

(check-sat (not b!688739) (not start!61620) (not b!688720) (not b!688725) (not b!688728) (not b!688735) (not b!688722) (not b!688734) (not b!688737) (not b!688741) (not b!688732) (not b!688738) (not b!688730) (not b!688736) (not b!688724) (not b!688718) (not b!688726) (not b!688727))
(check-sat)
