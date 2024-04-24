; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62530 () Bool)

(assert start!62530)

(declare-fun b!703116 () Bool)

(declare-fun res!466838 () Bool)

(declare-fun e!397671 () Bool)

(assert (=> b!703116 (=> (not res!466838) (not e!397671))))

(declare-datatypes ((List!13176 0))(
  ( (Nil!13173) (Cons!13172 (h!14220 (_ BitVec 64)) (t!19450 List!13176)) )
))
(declare-fun lt!317848 () List!13176)

(declare-fun noDuplicate!1102 (List!13176) Bool)

(assert (=> b!703116 (= res!466838 (noDuplicate!1102 lt!317848))))

(declare-fun b!703117 () Bool)

(declare-fun res!466849 () Bool)

(assert (=> b!703117 (=> (not res!466849) (not e!397671))))

(declare-fun lt!317850 () List!13176)

(declare-datatypes ((array!40149 0))(
  ( (array!40150 (arr!19228 (Array (_ BitVec 32) (_ BitVec 64))) (size!19611 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40149)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40149 (_ BitVec 32) List!13176) Bool)

(assert (=> b!703117 (= res!466849 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317850))))

(declare-fun b!703118 () Bool)

(declare-fun res!466845 () Bool)

(assert (=> b!703118 (=> (not res!466845) (not e!397671))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3828 (List!13176 (_ BitVec 64)) Bool)

(assert (=> b!703118 (= res!466845 (not (contains!3828 lt!317850 k0!2824)))))

(declare-fun b!703119 () Bool)

(declare-fun res!466851 () Bool)

(declare-fun e!397670 () Bool)

(assert (=> b!703119 (=> (not res!466851) (not e!397670))))

(declare-fun acc!652 () List!13176)

(assert (=> b!703119 (= res!466851 (not (contains!3828 acc!652 k0!2824)))))

(declare-fun b!703120 () Bool)

(declare-fun res!466843 () Bool)

(assert (=> b!703120 (=> (not res!466843) (not e!397671))))

(declare-fun -!260 (List!13176 (_ BitVec 64)) List!13176)

(assert (=> b!703120 (= res!466843 (= (-!260 lt!317848 k0!2824) lt!317850))))

(declare-fun b!703121 () Bool)

(declare-fun res!466844 () Bool)

(assert (=> b!703121 (=> (not res!466844) (not e!397670))))

(assert (=> b!703121 (= res!466844 (not (contains!3828 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703122 () Bool)

(declare-fun res!466827 () Bool)

(assert (=> b!703122 (=> (not res!466827) (not e!397670))))

(declare-fun newAcc!49 () List!13176)

(assert (=> b!703122 (= res!466827 (not (contains!3828 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703123 () Bool)

(declare-fun res!466853 () Bool)

(assert (=> b!703123 (=> (not res!466853) (not e!397670))))

(assert (=> b!703123 (= res!466853 (not (contains!3828 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703125 () Bool)

(declare-fun res!466830 () Bool)

(assert (=> b!703125 (=> (not res!466830) (not e!397670))))

(declare-fun subseq!296 (List!13176 List!13176) Bool)

(assert (=> b!703125 (= res!466830 (subseq!296 acc!652 newAcc!49))))

(declare-fun b!703126 () Bool)

(declare-fun res!466836 () Bool)

(assert (=> b!703126 (=> (not res!466836) (not e!397671))))

(assert (=> b!703126 (= res!466836 (subseq!296 lt!317850 lt!317848))))

(declare-fun b!703127 () Bool)

(declare-fun res!466840 () Bool)

(assert (=> b!703127 (=> (not res!466840) (not e!397670))))

(assert (=> b!703127 (= res!466840 (= (-!260 newAcc!49 k0!2824) acc!652))))

(declare-fun b!703128 () Bool)

(declare-fun res!466835 () Bool)

(assert (=> b!703128 (=> (not res!466835) (not e!397670))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703128 (= res!466835 (validKeyInArray!0 (select (arr!19228 a!3591) from!2969)))))

(declare-fun b!703129 () Bool)

(declare-fun res!466828 () Bool)

(assert (=> b!703129 (=> (not res!466828) (not e!397670))))

(declare-fun arrayContainsKey!0 (array!40149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703129 (= res!466828 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!703130 () Bool)

(declare-fun res!466842 () Bool)

(assert (=> b!703130 (=> (not res!466842) (not e!397671))))

(assert (=> b!703130 (= res!466842 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703131 () Bool)

(assert (=> b!703131 (= e!397671 (not true))))

(assert (=> b!703131 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317848)))

(declare-datatypes ((Unit!24579 0))(
  ( (Unit!24580) )
))
(declare-fun lt!317849 () Unit!24579)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40149 (_ BitVec 64) (_ BitVec 32) List!13176 List!13176) Unit!24579)

(assert (=> b!703131 (= lt!317849 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!317850 lt!317848))))

(declare-fun b!703132 () Bool)

(declare-fun res!466833 () Bool)

(assert (=> b!703132 (=> (not res!466833) (not e!397670))))

(assert (=> b!703132 (= res!466833 (contains!3828 newAcc!49 k0!2824))))

(declare-fun b!703133 () Bool)

(declare-fun res!466855 () Bool)

(assert (=> b!703133 (=> (not res!466855) (not e!397670))))

(assert (=> b!703133 (= res!466855 (noDuplicate!1102 newAcc!49))))

(declare-fun b!703124 () Bool)

(assert (=> b!703124 (= e!397670 e!397671)))

(declare-fun res!466848 () Bool)

(assert (=> b!703124 (=> (not res!466848) (not e!397671))))

(assert (=> b!703124 (= res!466848 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!491 (List!13176 (_ BitVec 64)) List!13176)

(assert (=> b!703124 (= lt!317848 ($colon$colon!491 newAcc!49 (select (arr!19228 a!3591) from!2969)))))

(assert (=> b!703124 (= lt!317850 ($colon$colon!491 acc!652 (select (arr!19228 a!3591) from!2969)))))

(declare-fun res!466854 () Bool)

(assert (=> start!62530 (=> (not res!466854) (not e!397670))))

(assert (=> start!62530 (= res!466854 (and (bvslt (size!19611 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19611 a!3591))))))

(assert (=> start!62530 e!397670))

(assert (=> start!62530 true))

(declare-fun array_inv!15087 (array!40149) Bool)

(assert (=> start!62530 (array_inv!15087 a!3591)))

(declare-fun b!703134 () Bool)

(declare-fun res!466829 () Bool)

(assert (=> b!703134 (=> (not res!466829) (not e!397670))))

(assert (=> b!703134 (= res!466829 (not (contains!3828 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703135 () Bool)

(declare-fun res!466846 () Bool)

(assert (=> b!703135 (=> (not res!466846) (not e!397670))))

(assert (=> b!703135 (= res!466846 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19611 a!3591)))))

(declare-fun b!703136 () Bool)

(declare-fun res!466839 () Bool)

(assert (=> b!703136 (=> (not res!466839) (not e!397671))))

(assert (=> b!703136 (= res!466839 (not (contains!3828 lt!317848 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703137 () Bool)

(declare-fun res!466850 () Bool)

(assert (=> b!703137 (=> (not res!466850) (not e!397671))))

(assert (=> b!703137 (= res!466850 (noDuplicate!1102 lt!317850))))

(declare-fun b!703138 () Bool)

(declare-fun res!466841 () Bool)

(assert (=> b!703138 (=> (not res!466841) (not e!397671))))

(assert (=> b!703138 (= res!466841 (not (contains!3828 lt!317850 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703139 () Bool)

(declare-fun res!466831 () Bool)

(assert (=> b!703139 (=> (not res!466831) (not e!397671))))

(assert (=> b!703139 (= res!466831 (contains!3828 lt!317848 k0!2824))))

(declare-fun b!703140 () Bool)

(declare-fun res!466832 () Bool)

(assert (=> b!703140 (=> (not res!466832) (not e!397671))))

(assert (=> b!703140 (= res!466832 (not (contains!3828 lt!317850 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703141 () Bool)

(declare-fun res!466837 () Bool)

(assert (=> b!703141 (=> (not res!466837) (not e!397670))))

(assert (=> b!703141 (= res!466837 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703142 () Bool)

(declare-fun res!466847 () Bool)

(assert (=> b!703142 (=> (not res!466847) (not e!397671))))

(assert (=> b!703142 (= res!466847 (not (contains!3828 lt!317848 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703143 () Bool)

(declare-fun res!466834 () Bool)

(assert (=> b!703143 (=> (not res!466834) (not e!397670))))

(assert (=> b!703143 (= res!466834 (validKeyInArray!0 k0!2824))))

(declare-fun b!703144 () Bool)

(declare-fun res!466852 () Bool)

(assert (=> b!703144 (=> (not res!466852) (not e!397670))))

(assert (=> b!703144 (= res!466852 (noDuplicate!1102 acc!652))))

(assert (= (and start!62530 res!466854) b!703144))

(assert (= (and b!703144 res!466852) b!703133))

(assert (= (and b!703133 res!466855) b!703121))

(assert (= (and b!703121 res!466844) b!703123))

(assert (= (and b!703123 res!466853) b!703129))

(assert (= (and b!703129 res!466828) b!703119))

(assert (= (and b!703119 res!466851) b!703143))

(assert (= (and b!703143 res!466834) b!703141))

(assert (= (and b!703141 res!466837) b!703125))

(assert (= (and b!703125 res!466830) b!703132))

(assert (= (and b!703132 res!466833) b!703127))

(assert (= (and b!703127 res!466840) b!703134))

(assert (= (and b!703134 res!466829) b!703122))

(assert (= (and b!703122 res!466827) b!703135))

(assert (= (and b!703135 res!466846) b!703128))

(assert (= (and b!703128 res!466835) b!703124))

(assert (= (and b!703124 res!466848) b!703137))

(assert (= (and b!703137 res!466850) b!703116))

(assert (= (and b!703116 res!466838) b!703138))

(assert (= (and b!703138 res!466841) b!703140))

(assert (= (and b!703140 res!466832) b!703130))

(assert (= (and b!703130 res!466842) b!703118))

(assert (= (and b!703118 res!466845) b!703117))

(assert (= (and b!703117 res!466849) b!703126))

(assert (= (and b!703126 res!466836) b!703139))

(assert (= (and b!703139 res!466831) b!703120))

(assert (= (and b!703120 res!466843) b!703136))

(assert (= (and b!703136 res!466839) b!703142))

(assert (= (and b!703142 res!466847) b!703131))

(declare-fun m!662547 () Bool)

(assert (=> b!703126 m!662547))

(declare-fun m!662549 () Bool)

(assert (=> b!703141 m!662549))

(declare-fun m!662551 () Bool)

(assert (=> b!703142 m!662551))

(declare-fun m!662553 () Bool)

(assert (=> start!62530 m!662553))

(declare-fun m!662555 () Bool)

(assert (=> b!703127 m!662555))

(declare-fun m!662557 () Bool)

(assert (=> b!703123 m!662557))

(declare-fun m!662559 () Bool)

(assert (=> b!703118 m!662559))

(declare-fun m!662561 () Bool)

(assert (=> b!703125 m!662561))

(declare-fun m!662563 () Bool)

(assert (=> b!703134 m!662563))

(declare-fun m!662565 () Bool)

(assert (=> b!703121 m!662565))

(declare-fun m!662567 () Bool)

(assert (=> b!703117 m!662567))

(declare-fun m!662569 () Bool)

(assert (=> b!703130 m!662569))

(declare-fun m!662571 () Bool)

(assert (=> b!703136 m!662571))

(declare-fun m!662573 () Bool)

(assert (=> b!703116 m!662573))

(declare-fun m!662575 () Bool)

(assert (=> b!703138 m!662575))

(declare-fun m!662577 () Bool)

(assert (=> b!703140 m!662577))

(declare-fun m!662579 () Bool)

(assert (=> b!703124 m!662579))

(assert (=> b!703124 m!662579))

(declare-fun m!662581 () Bool)

(assert (=> b!703124 m!662581))

(assert (=> b!703124 m!662579))

(declare-fun m!662583 () Bool)

(assert (=> b!703124 m!662583))

(declare-fun m!662585 () Bool)

(assert (=> b!703133 m!662585))

(declare-fun m!662587 () Bool)

(assert (=> b!703122 m!662587))

(declare-fun m!662589 () Bool)

(assert (=> b!703137 m!662589))

(declare-fun m!662591 () Bool)

(assert (=> b!703120 m!662591))

(declare-fun m!662593 () Bool)

(assert (=> b!703144 m!662593))

(declare-fun m!662595 () Bool)

(assert (=> b!703139 m!662595))

(declare-fun m!662597 () Bool)

(assert (=> b!703143 m!662597))

(declare-fun m!662599 () Bool)

(assert (=> b!703131 m!662599))

(declare-fun m!662601 () Bool)

(assert (=> b!703131 m!662601))

(declare-fun m!662603 () Bool)

(assert (=> b!703119 m!662603))

(assert (=> b!703128 m!662579))

(assert (=> b!703128 m!662579))

(declare-fun m!662605 () Bool)

(assert (=> b!703128 m!662605))

(declare-fun m!662607 () Bool)

(assert (=> b!703132 m!662607))

(declare-fun m!662609 () Bool)

(assert (=> b!703129 m!662609))

(check-sat (not b!703130) (not b!703143) (not start!62530) (not b!703139) (not b!703141) (not b!703138) (not b!703142) (not b!703137) (not b!703119) (not b!703132) (not b!703134) (not b!703129) (not b!703120) (not b!703133) (not b!703116) (not b!703117) (not b!703136) (not b!703131) (not b!703118) (not b!703124) (not b!703125) (not b!703122) (not b!703144) (not b!703121) (not b!703128) (not b!703126) (not b!703140) (not b!703123) (not b!703127))
(check-sat)
