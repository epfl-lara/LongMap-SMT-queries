; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60136 () Bool)

(assert start!60136)

(declare-fun b!669727 () Bool)

(declare-fun res!436498 () Bool)

(declare-fun e!383073 () Bool)

(assert (=> b!669727 (=> (not res!436498) (not e!383073))))

(declare-datatypes ((array!39121 0))(
  ( (array!39122 (arr!18750 (Array (_ BitVec 32) (_ BitVec 64))) (size!19114 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39121)

(declare-datatypes ((List!12698 0))(
  ( (Nil!12695) (Cons!12694 (h!13742 (_ BitVec 64)) (t!18918 List!12698)) )
))
(declare-fun arrayNoDuplicates!0 (array!39121 (_ BitVec 32) List!12698) Bool)

(assert (=> b!669727 (= res!436498 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12695))))

(declare-fun b!669728 () Bool)

(declare-fun res!436505 () Bool)

(declare-fun e!383068 () Bool)

(assert (=> b!669728 (=> res!436505 e!383068)))

(declare-fun lt!311752 () List!12698)

(declare-fun noDuplicate!624 (List!12698) Bool)

(assert (=> b!669728 (= res!436505 (not (noDuplicate!624 lt!311752)))))

(declare-fun b!669729 () Bool)

(assert (=> b!669729 (= e!383068 true)))

(declare-fun lt!311746 () Bool)

(declare-fun e!383075 () Bool)

(assert (=> b!669729 (= lt!311746 e!383075)))

(declare-fun res!436510 () Bool)

(assert (=> b!669729 (=> res!436510 e!383075)))

(declare-fun e!383071 () Bool)

(assert (=> b!669729 (= res!436510 e!383071)))

(declare-fun res!436514 () Bool)

(assert (=> b!669729 (=> (not res!436514) (not e!383071))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!669729 (= res!436514 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669730 () Bool)

(declare-fun res!436500 () Bool)

(assert (=> b!669730 (=> (not res!436500) (not e!383073))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669730 (= res!436500 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!669731 () Bool)

(assert (=> b!669731 (= e!383073 (not e!383068))))

(declare-fun res!436504 () Bool)

(assert (=> b!669731 (=> res!436504 e!383068)))

(assert (=> b!669731 (= res!436504 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!669731 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311752)))

(declare-datatypes ((Unit!23479 0))(
  ( (Unit!23480) )
))
(declare-fun lt!311747 () Unit!23479)

(declare-fun acc!681 () List!12698)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39121 (_ BitVec 64) (_ BitVec 32) List!12698 List!12698) Unit!23479)

(assert (=> b!669731 (= lt!311747 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311752))))

(declare-fun -!109 (List!12698 (_ BitVec 64)) List!12698)

(assert (=> b!669731 (= (-!109 lt!311752 k!2843) acc!681)))

(declare-fun $colon$colon!241 (List!12698 (_ BitVec 64)) List!12698)

(assert (=> b!669731 (= lt!311752 ($colon$colon!241 acc!681 k!2843))))

(declare-fun lt!311749 () Unit!23479)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12698) Unit!23479)

(assert (=> b!669731 (= lt!311749 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!112 (List!12698 List!12698) Bool)

(assert (=> b!669731 (subseq!112 acc!681 acc!681)))

(declare-fun lt!311750 () Unit!23479)

(declare-fun lemmaListSubSeqRefl!0 (List!12698) Unit!23479)

(assert (=> b!669731 (= lt!311750 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669731 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311753 () Unit!23479)

(declare-fun e!383067 () Unit!23479)

(assert (=> b!669731 (= lt!311753 e!383067)))

(declare-fun c!76985 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669731 (= c!76985 (validKeyInArray!0 (select (arr!18750 a!3626) from!3004)))))

(declare-fun lt!311751 () Unit!23479)

(declare-fun e!383076 () Unit!23479)

(assert (=> b!669731 (= lt!311751 e!383076)))

(declare-fun c!76984 () Bool)

(assert (=> b!669731 (= c!76984 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669731 (arrayContainsKey!0 (array!39122 (store (arr!18750 a!3626) i!1382 k!2843) (size!19114 a!3626)) k!2843 from!3004)))

(declare-fun b!669732 () Bool)

(declare-fun res!436497 () Bool)

(assert (=> b!669732 (=> (not res!436497) (not e!383073))))

(assert (=> b!669732 (= res!436497 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19114 a!3626))))))

(declare-fun b!669733 () Bool)

(declare-fun res!436516 () Bool)

(assert (=> b!669733 (=> res!436516 e!383068)))

(declare-fun contains!3350 (List!12698 (_ BitVec 64)) Bool)

(assert (=> b!669733 (= res!436516 (contains!3350 lt!311752 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669734 () Bool)

(declare-fun e!383072 () Bool)

(assert (=> b!669734 (= e!383072 (not (contains!3350 acc!681 k!2843)))))

(declare-fun b!669735 () Bool)

(declare-fun Unit!23481 () Unit!23479)

(assert (=> b!669735 (= e!383076 Unit!23481)))

(declare-fun b!669736 () Bool)

(declare-fun e!383070 () Bool)

(assert (=> b!669736 (= e!383075 e!383070)))

(declare-fun res!436502 () Bool)

(assert (=> b!669736 (=> (not res!436502) (not e!383070))))

(assert (=> b!669736 (= res!436502 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669737 () Bool)

(assert (=> b!669737 (= e!383070 (not (contains!3350 lt!311752 k!2843)))))

(declare-fun b!669738 () Bool)

(declare-fun lt!311755 () Unit!23479)

(assert (=> b!669738 (= e!383067 lt!311755)))

(declare-fun lt!311754 () Unit!23479)

(assert (=> b!669738 (= lt!311754 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669738 (subseq!112 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39121 List!12698 List!12698 (_ BitVec 32)) Unit!23479)

(assert (=> b!669738 (= lt!311755 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!241 acc!681 (select (arr!18750 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!669738 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!669739 () Bool)

(declare-fun e!383069 () Bool)

(assert (=> b!669739 (= e!383069 e!383072)))

(declare-fun res!436512 () Bool)

(assert (=> b!669739 (=> (not res!436512) (not e!383072))))

(assert (=> b!669739 (= res!436512 (bvsle from!3004 i!1382))))

(declare-fun b!669740 () Bool)

(declare-fun res!436508 () Bool)

(assert (=> b!669740 (=> (not res!436508) (not e!383073))))

(assert (=> b!669740 (= res!436508 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669741 () Bool)

(declare-fun res!436506 () Bool)

(assert (=> b!669741 (=> (not res!436506) (not e!383073))))

(assert (=> b!669741 (= res!436506 (validKeyInArray!0 k!2843))))

(declare-fun b!669742 () Bool)

(declare-fun res!436503 () Bool)

(assert (=> b!669742 (=> (not res!436503) (not e!383073))))

(assert (=> b!669742 (= res!436503 (not (contains!3350 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669743 () Bool)

(declare-fun res!436515 () Bool)

(assert (=> b!669743 (=> res!436515 e!383068)))

(assert (=> b!669743 (= res!436515 (contains!3350 lt!311752 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669744 () Bool)

(declare-fun res!436499 () Bool)

(assert (=> b!669744 (=> (not res!436499) (not e!383073))))

(assert (=> b!669744 (= res!436499 e!383069)))

(declare-fun res!436509 () Bool)

(assert (=> b!669744 (=> res!436509 e!383069)))

(declare-fun e!383066 () Bool)

(assert (=> b!669744 (= res!436509 e!383066)))

(declare-fun res!436511 () Bool)

(assert (=> b!669744 (=> (not res!436511) (not e!383066))))

(assert (=> b!669744 (= res!436511 (bvsgt from!3004 i!1382))))

(declare-fun b!669745 () Bool)

(assert (=> b!669745 (= e!383071 (contains!3350 lt!311752 k!2843))))

(declare-fun b!669746 () Bool)

(declare-fun Unit!23482 () Unit!23479)

(assert (=> b!669746 (= e!383067 Unit!23482)))

(declare-fun b!669747 () Bool)

(assert (=> b!669747 (= e!383066 (contains!3350 acc!681 k!2843))))

(declare-fun b!669748 () Bool)

(declare-fun res!436507 () Bool)

(assert (=> b!669748 (=> (not res!436507) (not e!383073))))

(assert (=> b!669748 (= res!436507 (not (contains!3350 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!436496 () Bool)

(assert (=> start!60136 (=> (not res!436496) (not e!383073))))

(assert (=> start!60136 (= res!436496 (and (bvslt (size!19114 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19114 a!3626))))))

(assert (=> start!60136 e!383073))

(assert (=> start!60136 true))

(declare-fun array_inv!14609 (array!39121) Bool)

(assert (=> start!60136 (array_inv!14609 a!3626)))

(declare-fun b!669749 () Bool)

(declare-fun res!436513 () Bool)

(assert (=> b!669749 (=> (not res!436513) (not e!383073))))

(assert (=> b!669749 (= res!436513 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19114 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669750 () Bool)

(declare-fun Unit!23483 () Unit!23479)

(assert (=> b!669750 (= e!383076 Unit!23483)))

(declare-fun lt!311748 () Unit!23479)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39121 (_ BitVec 64) (_ BitVec 32)) Unit!23479)

(assert (=> b!669750 (= lt!311748 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!669750 false))

(declare-fun b!669751 () Bool)

(declare-fun res!436501 () Bool)

(assert (=> b!669751 (=> (not res!436501) (not e!383073))))

(assert (=> b!669751 (= res!436501 (noDuplicate!624 acc!681))))

(assert (= (and start!60136 res!436496) b!669751))

(assert (= (and b!669751 res!436501) b!669748))

(assert (= (and b!669748 res!436507) b!669742))

(assert (= (and b!669742 res!436503) b!669744))

(assert (= (and b!669744 res!436511) b!669747))

(assert (= (and b!669744 (not res!436509)) b!669739))

(assert (= (and b!669739 res!436512) b!669734))

(assert (= (and b!669744 res!436499) b!669727))

(assert (= (and b!669727 res!436498) b!669740))

(assert (= (and b!669740 res!436508) b!669732))

(assert (= (and b!669732 res!436497) b!669741))

(assert (= (and b!669741 res!436506) b!669730))

(assert (= (and b!669730 res!436500) b!669749))

(assert (= (and b!669749 res!436513) b!669731))

(assert (= (and b!669731 c!76984) b!669750))

(assert (= (and b!669731 (not c!76984)) b!669735))

(assert (= (and b!669731 c!76985) b!669738))

(assert (= (and b!669731 (not c!76985)) b!669746))

(assert (= (and b!669731 (not res!436504)) b!669728))

(assert (= (and b!669728 (not res!436505)) b!669733))

(assert (= (and b!669733 (not res!436516)) b!669743))

(assert (= (and b!669743 (not res!436515)) b!669729))

(assert (= (and b!669729 res!436514) b!669745))

(assert (= (and b!669729 (not res!436510)) b!669736))

(assert (= (and b!669736 res!436502) b!669737))

(declare-fun m!640281 () Bool)

(assert (=> b!669731 m!640281))

(declare-fun m!640283 () Bool)

(assert (=> b!669731 m!640283))

(declare-fun m!640285 () Bool)

(assert (=> b!669731 m!640285))

(declare-fun m!640287 () Bool)

(assert (=> b!669731 m!640287))

(declare-fun m!640289 () Bool)

(assert (=> b!669731 m!640289))

(declare-fun m!640291 () Bool)

(assert (=> b!669731 m!640291))

(declare-fun m!640293 () Bool)

(assert (=> b!669731 m!640293))

(declare-fun m!640295 () Bool)

(assert (=> b!669731 m!640295))

(declare-fun m!640297 () Bool)

(assert (=> b!669731 m!640297))

(declare-fun m!640299 () Bool)

(assert (=> b!669731 m!640299))

(assert (=> b!669731 m!640285))

(declare-fun m!640301 () Bool)

(assert (=> b!669731 m!640301))

(declare-fun m!640303 () Bool)

(assert (=> b!669731 m!640303))

(declare-fun m!640305 () Bool)

(assert (=> b!669731 m!640305))

(declare-fun m!640307 () Bool)

(assert (=> b!669748 m!640307))

(declare-fun m!640309 () Bool)

(assert (=> b!669737 m!640309))

(declare-fun m!640311 () Bool)

(assert (=> b!669751 m!640311))

(declare-fun m!640313 () Bool)

(assert (=> b!669734 m!640313))

(declare-fun m!640315 () Bool)

(assert (=> start!60136 m!640315))

(declare-fun m!640317 () Bool)

(assert (=> b!669743 m!640317))

(declare-fun m!640319 () Bool)

(assert (=> b!669733 m!640319))

(assert (=> b!669738 m!640281))

(assert (=> b!669738 m!640285))

(declare-fun m!640321 () Bool)

(assert (=> b!669738 m!640321))

(declare-fun m!640323 () Bool)

(assert (=> b!669738 m!640323))

(assert (=> b!669738 m!640285))

(assert (=> b!669738 m!640321))

(assert (=> b!669738 m!640295))

(assert (=> b!669738 m!640305))

(declare-fun m!640325 () Bool)

(assert (=> b!669730 m!640325))

(declare-fun m!640327 () Bool)

(assert (=> b!669750 m!640327))

(assert (=> b!669747 m!640313))

(declare-fun m!640329 () Bool)

(assert (=> b!669728 m!640329))

(assert (=> b!669745 m!640309))

(declare-fun m!640331 () Bool)

(assert (=> b!669741 m!640331))

(declare-fun m!640333 () Bool)

(assert (=> b!669727 m!640333))

(declare-fun m!640335 () Bool)

(assert (=> b!669740 m!640335))

(declare-fun m!640337 () Bool)

(assert (=> b!669742 m!640337))

(push 1)

(assert (not b!669731))

(assert (not b!669740))

(assert (not b!669727))

(assert (not b!669734))

(assert (not b!669745))

(assert (not b!669741))

(assert (not b!669748))

(assert (not b!669742))

(assert (not b!669743))

(assert (not start!60136))

(assert (not b!669750))

(assert (not b!669733))

(assert (not b!669747))

(assert (not b!669737))

(assert (not b!669751))

(assert (not b!669728))

(assert (not b!669738))

(assert (not b!669730))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

