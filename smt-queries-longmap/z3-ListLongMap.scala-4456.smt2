; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62018 () Bool)

(assert start!62018)

(declare-fun b!693695 () Bool)

(declare-fun res!457952 () Bool)

(declare-fun e!394658 () Bool)

(assert (=> b!693695 (=> (not res!457952) (not e!394658))))

(declare-datatypes ((array!39870 0))(
  ( (array!39871 (arr!19097 (Array (_ BitVec 32) (_ BitVec 64))) (size!19479 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39870)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!693695 (= res!457952 (validKeyInArray!0 (select (arr!19097 a!3626) from!3004)))))

(declare-fun b!693696 () Bool)

(declare-fun res!457937 () Bool)

(declare-fun e!394662 () Bool)

(assert (=> b!693696 (=> (not res!457937) (not e!394662))))

(declare-datatypes ((List!13177 0))(
  ( (Nil!13174) (Cons!13173 (h!14218 (_ BitVec 64)) (t!19447 List!13177)) )
))
(declare-fun lt!316583 () List!13177)

(declare-fun contains!3699 (List!13177 (_ BitVec 64)) Bool)

(assert (=> b!693696 (= res!457937 (not (contains!3699 lt!316583 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693697 () Bool)

(declare-fun res!457938 () Bool)

(assert (=> b!693697 (=> (not res!457938) (not e!394658))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39870 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!693697 (= res!457938 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!693698 () Bool)

(declare-fun e!394656 () Bool)

(assert (=> b!693698 (= e!394656 (contains!3699 lt!316583 k0!2843))))

(declare-fun b!693699 () Bool)

(declare-fun res!457931 () Bool)

(assert (=> b!693699 (=> (not res!457931) (not e!394658))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!693699 (= res!457931 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19479 a!3626))))))

(declare-fun b!693700 () Bool)

(declare-fun e!394654 () Bool)

(declare-fun e!394659 () Bool)

(assert (=> b!693700 (= e!394654 e!394659)))

(declare-fun res!457943 () Bool)

(assert (=> b!693700 (=> (not res!457943) (not e!394659))))

(assert (=> b!693700 (= res!457943 (bvsle from!3004 i!1382))))

(declare-fun b!693701 () Bool)

(declare-datatypes ((Unit!24488 0))(
  ( (Unit!24489) )
))
(declare-fun e!394664 () Unit!24488)

(declare-fun Unit!24490 () Unit!24488)

(assert (=> b!693701 (= e!394664 Unit!24490)))

(assert (=> b!693701 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!316581 () Unit!24488)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39870 (_ BitVec 64) (_ BitVec 32)) Unit!24488)

(assert (=> b!693701 (= lt!316581 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!693701 false))

(declare-fun b!693702 () Bool)

(declare-fun res!457944 () Bool)

(assert (=> b!693702 (=> (not res!457944) (not e!394658))))

(declare-fun acc!681 () List!13177)

(declare-fun noDuplicate!968 (List!13177) Bool)

(assert (=> b!693702 (= res!457944 (noDuplicate!968 acc!681))))

(declare-fun b!693703 () Bool)

(declare-fun res!457942 () Bool)

(assert (=> b!693703 (=> (not res!457942) (not e!394658))))

(assert (=> b!693703 (= res!457942 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19479 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!693704 () Bool)

(declare-fun e!394661 () Bool)

(assert (=> b!693704 (= e!394661 (not (contains!3699 lt!316583 k0!2843)))))

(declare-fun b!693705 () Bool)

(declare-fun res!457945 () Bool)

(assert (=> b!693705 (=> (not res!457945) (not e!394658))))

(assert (=> b!693705 (= res!457945 (not (contains!3699 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693706 () Bool)

(declare-fun e!394655 () Bool)

(assert (=> b!693706 (= e!394655 e!394661)))

(declare-fun res!457947 () Bool)

(assert (=> b!693706 (=> (not res!457947) (not e!394661))))

(assert (=> b!693706 (= res!457947 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693707 () Bool)

(declare-fun res!457940 () Bool)

(assert (=> b!693707 (=> (not res!457940) (not e!394662))))

(assert (=> b!693707 (= res!457940 (not (contains!3699 lt!316583 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693708 () Bool)

(declare-fun res!457935 () Bool)

(assert (=> b!693708 (=> (not res!457935) (not e!394658))))

(assert (=> b!693708 (= res!457935 (validKeyInArray!0 k0!2843))))

(declare-fun b!693709 () Bool)

(declare-fun res!457934 () Bool)

(assert (=> b!693709 (=> (not res!457934) (not e!394658))))

(assert (=> b!693709 (= res!457934 (not (contains!3699 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!693710 () Bool)

(declare-fun res!457936 () Bool)

(assert (=> b!693710 (=> (not res!457936) (not e!394658))))

(declare-fun arrayNoDuplicates!0 (array!39870 (_ BitVec 32) List!13177) Bool)

(assert (=> b!693710 (= res!457936 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13174))))

(declare-fun b!693711 () Bool)

(assert (=> b!693711 (= e!394662 false)))

(declare-fun lt!316584 () Bool)

(assert (=> b!693711 (= lt!316584 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316583))))

(declare-fun b!693712 () Bool)

(declare-fun e!394660 () Bool)

(assert (=> b!693712 (= e!394660 e!394662)))

(declare-fun res!457932 () Bool)

(assert (=> b!693712 (=> (not res!457932) (not e!394662))))

(assert (=> b!693712 (= res!457932 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!427 (List!13177 (_ BitVec 64)) List!13177)

(assert (=> b!693712 (= lt!316583 ($colon$colon!427 acc!681 (select (arr!19097 a!3626) from!3004)))))

(declare-fun b!693713 () Bool)

(declare-fun res!457946 () Bool)

(assert (=> b!693713 (=> (not res!457946) (not e!394658))))

(assert (=> b!693713 (= res!457946 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!693714 () Bool)

(declare-fun Unit!24491 () Unit!24488)

(assert (=> b!693714 (= e!394664 Unit!24491)))

(declare-fun b!693715 () Bool)

(declare-fun res!457949 () Bool)

(assert (=> b!693715 (=> (not res!457949) (not e!394658))))

(assert (=> b!693715 (= res!457949 e!394654)))

(declare-fun res!457941 () Bool)

(assert (=> b!693715 (=> res!457941 e!394654)))

(declare-fun e!394663 () Bool)

(assert (=> b!693715 (= res!457941 e!394663)))

(declare-fun res!457948 () Bool)

(assert (=> b!693715 (=> (not res!457948) (not e!394663))))

(assert (=> b!693715 (= res!457948 (bvsgt from!3004 i!1382))))

(declare-fun b!693716 () Bool)

(declare-fun res!457939 () Bool)

(assert (=> b!693716 (=> (not res!457939) (not e!394662))))

(assert (=> b!693716 (= res!457939 e!394655)))

(declare-fun res!457954 () Bool)

(assert (=> b!693716 (=> res!457954 e!394655)))

(assert (=> b!693716 (= res!457954 e!394656)))

(declare-fun res!457953 () Bool)

(assert (=> b!693716 (=> (not res!457953) (not e!394656))))

(assert (=> b!693716 (= res!457953 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!693717 () Bool)

(assert (=> b!693717 (= e!394663 (contains!3699 acc!681 k0!2843))))

(declare-fun b!693718 () Bool)

(assert (=> b!693718 (= e!394658 e!394660)))

(declare-fun res!457951 () Bool)

(assert (=> b!693718 (=> (not res!457951) (not e!394660))))

(assert (=> b!693718 (= res!457951 (not (= (select (arr!19097 a!3626) from!3004) k0!2843)))))

(declare-fun lt!316582 () Unit!24488)

(assert (=> b!693718 (= lt!316582 e!394664)))

(declare-fun c!78249 () Bool)

(assert (=> b!693718 (= c!78249 (= (select (arr!19097 a!3626) from!3004) k0!2843))))

(declare-fun res!457933 () Bool)

(assert (=> start!62018 (=> (not res!457933) (not e!394658))))

(assert (=> start!62018 (= res!457933 (and (bvslt (size!19479 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19479 a!3626))))))

(assert (=> start!62018 e!394658))

(assert (=> start!62018 true))

(declare-fun array_inv!14980 (array!39870) Bool)

(assert (=> start!62018 (array_inv!14980 a!3626)))

(declare-fun b!693719 () Bool)

(assert (=> b!693719 (= e!394659 (not (contains!3699 acc!681 k0!2843)))))

(declare-fun b!693720 () Bool)

(declare-fun res!457950 () Bool)

(assert (=> b!693720 (=> (not res!457950) (not e!394662))))

(assert (=> b!693720 (= res!457950 (noDuplicate!968 lt!316583))))

(assert (= (and start!62018 res!457933) b!693702))

(assert (= (and b!693702 res!457944) b!693705))

(assert (= (and b!693705 res!457945) b!693709))

(assert (= (and b!693709 res!457934) b!693715))

(assert (= (and b!693715 res!457948) b!693717))

(assert (= (and b!693715 (not res!457941)) b!693700))

(assert (= (and b!693700 res!457943) b!693719))

(assert (= (and b!693715 res!457949) b!693710))

(assert (= (and b!693710 res!457936) b!693713))

(assert (= (and b!693713 res!457946) b!693699))

(assert (= (and b!693699 res!457931) b!693708))

(assert (= (and b!693708 res!457935) b!693697))

(assert (= (and b!693697 res!457938) b!693703))

(assert (= (and b!693703 res!457942) b!693695))

(assert (= (and b!693695 res!457952) b!693718))

(assert (= (and b!693718 c!78249) b!693701))

(assert (= (and b!693718 (not c!78249)) b!693714))

(assert (= (and b!693718 res!457951) b!693712))

(assert (= (and b!693712 res!457932) b!693720))

(assert (= (and b!693720 res!457950) b!693707))

(assert (= (and b!693707 res!457940) b!693696))

(assert (= (and b!693696 res!457937) b!693716))

(assert (= (and b!693716 res!457953) b!693698))

(assert (= (and b!693716 (not res!457954)) b!693706))

(assert (= (and b!693706 res!457947) b!693704))

(assert (= (and b!693716 res!457939) b!693711))

(declare-fun m!655269 () Bool)

(assert (=> start!62018 m!655269))

(declare-fun m!655271 () Bool)

(assert (=> b!693712 m!655271))

(assert (=> b!693712 m!655271))

(declare-fun m!655273 () Bool)

(assert (=> b!693712 m!655273))

(assert (=> b!693695 m!655271))

(assert (=> b!693695 m!655271))

(declare-fun m!655275 () Bool)

(assert (=> b!693695 m!655275))

(declare-fun m!655277 () Bool)

(assert (=> b!693696 m!655277))

(declare-fun m!655279 () Bool)

(assert (=> b!693710 m!655279))

(declare-fun m!655281 () Bool)

(assert (=> b!693711 m!655281))

(declare-fun m!655283 () Bool)

(assert (=> b!693709 m!655283))

(declare-fun m!655285 () Bool)

(assert (=> b!693705 m!655285))

(declare-fun m!655287 () Bool)

(assert (=> b!693707 m!655287))

(declare-fun m!655289 () Bool)

(assert (=> b!693713 m!655289))

(declare-fun m!655291 () Bool)

(assert (=> b!693708 m!655291))

(declare-fun m!655293 () Bool)

(assert (=> b!693717 m!655293))

(declare-fun m!655295 () Bool)

(assert (=> b!693704 m!655295))

(assert (=> b!693719 m!655293))

(declare-fun m!655297 () Bool)

(assert (=> b!693702 m!655297))

(declare-fun m!655299 () Bool)

(assert (=> b!693720 m!655299))

(declare-fun m!655301 () Bool)

(assert (=> b!693701 m!655301))

(declare-fun m!655303 () Bool)

(assert (=> b!693701 m!655303))

(assert (=> b!693718 m!655271))

(declare-fun m!655305 () Bool)

(assert (=> b!693697 m!655305))

(assert (=> b!693698 m!655295))

(check-sat (not b!693719) (not b!693717) (not b!693704) (not b!693698) (not b!693720) (not b!693696) (not b!693702) (not b!693713) (not b!693712) (not b!693708) (not start!62018) (not b!693710) (not b!693701) (not b!693705) (not b!693711) (not b!693709) (not b!693695) (not b!693707) (not b!693697))
(check-sat)
