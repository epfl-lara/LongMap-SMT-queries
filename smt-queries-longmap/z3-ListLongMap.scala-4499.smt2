; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62450 () Bool)

(assert start!62450)

(declare-fun b!702113 () Bool)

(declare-fun res!466092 () Bool)

(declare-fun e!397318 () Bool)

(assert (=> b!702113 (=> (not res!466092) (not e!397318))))

(declare-datatypes ((List!13306 0))(
  ( (Nil!13303) (Cons!13302 (h!14347 (_ BitVec 64)) (t!19579 List!13306)) )
))
(declare-fun lt!317444 () List!13306)

(declare-fun lt!317445 () List!13306)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun -!255 (List!13306 (_ BitVec 64)) List!13306)

(assert (=> b!702113 (= res!466092 (= (-!255 lt!317445 k0!2824) lt!317444))))

(declare-fun b!702114 () Bool)

(declare-fun res!466087 () Bool)

(declare-fun e!397319 () Bool)

(assert (=> b!702114 (=> (not res!466087) (not e!397319))))

(declare-fun acc!652 () List!13306)

(declare-fun newAcc!49 () List!13306)

(declare-fun subseq!290 (List!13306 List!13306) Bool)

(assert (=> b!702114 (= res!466087 (subseq!290 acc!652 newAcc!49))))

(declare-fun b!702115 () Bool)

(declare-fun res!466088 () Bool)

(assert (=> b!702115 (=> (not res!466088) (not e!397319))))

(declare-fun contains!3828 (List!13306 (_ BitVec 64)) Bool)

(assert (=> b!702115 (= res!466088 (not (contains!3828 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702116 () Bool)

(declare-fun res!466093 () Bool)

(assert (=> b!702116 (=> (not res!466093) (not e!397319))))

(assert (=> b!702116 (= res!466093 (not (contains!3828 acc!652 k0!2824)))))

(declare-fun b!702117 () Bool)

(declare-fun res!466083 () Bool)

(assert (=> b!702117 (=> (not res!466083) (not e!397318))))

(declare-datatypes ((array!40140 0))(
  ( (array!40141 (arr!19226 (Array (_ BitVec 32) (_ BitVec 64))) (size!19608 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40140)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40140 (_ BitVec 32) List!13306) Bool)

(assert (=> b!702117 (= res!466083 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317444))))

(declare-fun b!702118 () Bool)

(declare-fun res!466099 () Bool)

(assert (=> b!702118 (=> (not res!466099) (not e!397318))))

(assert (=> b!702118 (= res!466099 (subseq!290 lt!317444 lt!317445))))

(declare-fun b!702119 () Bool)

(declare-fun res!466085 () Bool)

(assert (=> b!702119 (=> (not res!466085) (not e!397319))))

(assert (=> b!702119 (= res!466085 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19608 a!3591)))))

(declare-fun b!702120 () Bool)

(declare-fun res!466102 () Bool)

(assert (=> b!702120 (=> (not res!466102) (not e!397318))))

(assert (=> b!702120 (= res!466102 (not (contains!3828 lt!317444 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702121 () Bool)

(declare-fun res!466096 () Bool)

(assert (=> b!702121 (=> (not res!466096) (not e!397319))))

(assert (=> b!702121 (= res!466096 (not (contains!3828 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702122 () Bool)

(declare-fun res!466105 () Bool)

(assert (=> b!702122 (=> (not res!466105) (not e!397319))))

(assert (=> b!702122 (= res!466105 (contains!3828 newAcc!49 k0!2824))))

(declare-fun b!702123 () Bool)

(declare-fun res!466095 () Bool)

(assert (=> b!702123 (=> (not res!466095) (not e!397318))))

(assert (=> b!702123 (= res!466095 (not (contains!3828 lt!317444 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702124 () Bool)

(declare-fun res!466101 () Bool)

(assert (=> b!702124 (=> (not res!466101) (not e!397318))))

(declare-fun noDuplicate!1097 (List!13306) Bool)

(assert (=> b!702124 (= res!466101 (noDuplicate!1097 lt!317445))))

(declare-fun b!702125 () Bool)

(declare-fun res!466091 () Bool)

(assert (=> b!702125 (=> (not res!466091) (not e!397318))))

(assert (=> b!702125 (= res!466091 (not (contains!3828 lt!317445 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702126 () Bool)

(declare-fun res!466090 () Bool)

(assert (=> b!702126 (=> (not res!466090) (not e!397319))))

(assert (=> b!702126 (= res!466090 (not (contains!3828 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702127 () Bool)

(declare-fun res!466106 () Bool)

(assert (=> b!702127 (=> (not res!466106) (not e!397319))))

(assert (=> b!702127 (= res!466106 (not (contains!3828 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!466110 () Bool)

(assert (=> start!62450 (=> (not res!466110) (not e!397319))))

(assert (=> start!62450 (= res!466110 (and (bvslt (size!19608 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19608 a!3591))))))

(assert (=> start!62450 e!397319))

(assert (=> start!62450 true))

(declare-fun array_inv!15109 (array!40140) Bool)

(assert (=> start!62450 (array_inv!15109 a!3591)))

(declare-fun b!702128 () Bool)

(declare-fun res!466089 () Bool)

(assert (=> b!702128 (=> (not res!466089) (not e!397318))))

(assert (=> b!702128 (= res!466089 (noDuplicate!1097 lt!317444))))

(declare-fun b!702129 () Bool)

(declare-fun res!466086 () Bool)

(assert (=> b!702129 (=> (not res!466086) (not e!397318))))

(assert (=> b!702129 (= res!466086 (contains!3828 lt!317445 k0!2824))))

(declare-fun b!702130 () Bool)

(declare-fun res!466107 () Bool)

(assert (=> b!702130 (=> (not res!466107) (not e!397319))))

(assert (=> b!702130 (= res!466107 (noDuplicate!1097 newAcc!49))))

(declare-fun b!702131 () Bool)

(declare-fun res!466098 () Bool)

(assert (=> b!702131 (=> (not res!466098) (not e!397318))))

(assert (=> b!702131 (= res!466098 (not (contains!3828 lt!317445 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!702132 () Bool)

(assert (=> b!702132 (= e!397319 e!397318)))

(declare-fun res!466097 () Bool)

(assert (=> b!702132 (=> (not res!466097) (not e!397318))))

(assert (=> b!702132 (= res!466097 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!487 (List!13306 (_ BitVec 64)) List!13306)

(assert (=> b!702132 (= lt!317445 ($colon$colon!487 newAcc!49 (select (arr!19226 a!3591) from!2969)))))

(assert (=> b!702132 (= lt!317444 ($colon$colon!487 acc!652 (select (arr!19226 a!3591) from!2969)))))

(declare-fun b!702133 () Bool)

(declare-fun res!466109 () Bool)

(assert (=> b!702133 (=> (not res!466109) (not e!397318))))

(assert (=> b!702133 (= res!466109 (not (contains!3828 lt!317444 k0!2824)))))

(declare-fun b!702134 () Bool)

(declare-fun res!466094 () Bool)

(assert (=> b!702134 (=> (not res!466094) (not e!397319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!702134 (= res!466094 (validKeyInArray!0 k0!2824))))

(declare-fun b!702135 () Bool)

(declare-fun res!466104 () Bool)

(assert (=> b!702135 (=> (not res!466104) (not e!397319))))

(declare-fun arrayContainsKey!0 (array!40140 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!702135 (= res!466104 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!702136 () Bool)

(declare-fun res!466100 () Bool)

(assert (=> b!702136 (=> (not res!466100) (not e!397318))))

(assert (=> b!702136 (= res!466100 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!702137 () Bool)

(declare-fun res!466103 () Bool)

(assert (=> b!702137 (=> (not res!466103) (not e!397319))))

(assert (=> b!702137 (= res!466103 (noDuplicate!1097 acc!652))))

(declare-fun b!702138 () Bool)

(declare-fun res!466111 () Bool)

(assert (=> b!702138 (=> (not res!466111) (not e!397319))))

(assert (=> b!702138 (= res!466111 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!702139 () Bool)

(declare-fun res!466084 () Bool)

(assert (=> b!702139 (=> (not res!466084) (not e!397319))))

(assert (=> b!702139 (= res!466084 (validKeyInArray!0 (select (arr!19226 a!3591) from!2969)))))

(declare-fun b!702140 () Bool)

(declare-fun res!466108 () Bool)

(assert (=> b!702140 (=> (not res!466108) (not e!397319))))

(assert (=> b!702140 (= res!466108 (= (-!255 newAcc!49 k0!2824) acc!652))))

(declare-fun b!702141 () Bool)

(assert (=> b!702141 (= e!397318 (not true))))

(assert (=> b!702141 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317445)))

(declare-datatypes ((Unit!24566 0))(
  ( (Unit!24567) )
))
(declare-fun lt!317443 () Unit!24566)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40140 (_ BitVec 64) (_ BitVec 32) List!13306 List!13306) Unit!24566)

(assert (=> b!702141 (= lt!317443 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!317444 lt!317445))))

(assert (= (and start!62450 res!466110) b!702137))

(assert (= (and b!702137 res!466103) b!702130))

(assert (= (and b!702130 res!466107) b!702127))

(assert (= (and b!702127 res!466106) b!702115))

(assert (= (and b!702115 res!466088) b!702135))

(assert (= (and b!702135 res!466104) b!702116))

(assert (= (and b!702116 res!466093) b!702134))

(assert (= (and b!702134 res!466094) b!702138))

(assert (= (and b!702138 res!466111) b!702114))

(assert (= (and b!702114 res!466087) b!702122))

(assert (= (and b!702122 res!466105) b!702140))

(assert (= (and b!702140 res!466108) b!702121))

(assert (= (and b!702121 res!466096) b!702126))

(assert (= (and b!702126 res!466090) b!702119))

(assert (= (and b!702119 res!466085) b!702139))

(assert (= (and b!702139 res!466084) b!702132))

(assert (= (and b!702132 res!466097) b!702128))

(assert (= (and b!702128 res!466089) b!702124))

(assert (= (and b!702124 res!466101) b!702123))

(assert (= (and b!702123 res!466095) b!702120))

(assert (= (and b!702120 res!466102) b!702136))

(assert (= (and b!702136 res!466100) b!702133))

(assert (= (and b!702133 res!466109) b!702117))

(assert (= (and b!702117 res!466083) b!702118))

(assert (= (and b!702118 res!466099) b!702129))

(assert (= (and b!702129 res!466086) b!702113))

(assert (= (and b!702113 res!466092) b!702131))

(assert (= (and b!702131 res!466098) b!702125))

(assert (= (and b!702125 res!466091) b!702141))

(declare-fun m!660747 () Bool)

(assert (=> b!702122 m!660747))

(declare-fun m!660749 () Bool)

(assert (=> b!702137 m!660749))

(declare-fun m!660751 () Bool)

(assert (=> b!702129 m!660751))

(declare-fun m!660753 () Bool)

(assert (=> b!702130 m!660753))

(declare-fun m!660755 () Bool)

(assert (=> b!702141 m!660755))

(declare-fun m!660757 () Bool)

(assert (=> b!702141 m!660757))

(declare-fun m!660759 () Bool)

(assert (=> b!702135 m!660759))

(declare-fun m!660761 () Bool)

(assert (=> b!702113 m!660761))

(declare-fun m!660763 () Bool)

(assert (=> b!702133 m!660763))

(declare-fun m!660765 () Bool)

(assert (=> b!702114 m!660765))

(declare-fun m!660767 () Bool)

(assert (=> b!702118 m!660767))

(declare-fun m!660769 () Bool)

(assert (=> b!702125 m!660769))

(declare-fun m!660771 () Bool)

(assert (=> b!702126 m!660771))

(declare-fun m!660773 () Bool)

(assert (=> b!702124 m!660773))

(declare-fun m!660775 () Bool)

(assert (=> b!702134 m!660775))

(declare-fun m!660777 () Bool)

(assert (=> b!702140 m!660777))

(declare-fun m!660779 () Bool)

(assert (=> b!702132 m!660779))

(assert (=> b!702132 m!660779))

(declare-fun m!660781 () Bool)

(assert (=> b!702132 m!660781))

(assert (=> b!702132 m!660779))

(declare-fun m!660783 () Bool)

(assert (=> b!702132 m!660783))

(declare-fun m!660785 () Bool)

(assert (=> b!702128 m!660785))

(declare-fun m!660787 () Bool)

(assert (=> b!702136 m!660787))

(assert (=> b!702139 m!660779))

(assert (=> b!702139 m!660779))

(declare-fun m!660789 () Bool)

(assert (=> b!702139 m!660789))

(declare-fun m!660791 () Bool)

(assert (=> b!702117 m!660791))

(declare-fun m!660793 () Bool)

(assert (=> b!702127 m!660793))

(declare-fun m!660795 () Bool)

(assert (=> b!702138 m!660795))

(declare-fun m!660797 () Bool)

(assert (=> b!702120 m!660797))

(declare-fun m!660799 () Bool)

(assert (=> b!702115 m!660799))

(declare-fun m!660801 () Bool)

(assert (=> b!702121 m!660801))

(declare-fun m!660803 () Bool)

(assert (=> b!702131 m!660803))

(declare-fun m!660805 () Bool)

(assert (=> b!702123 m!660805))

(declare-fun m!660807 () Bool)

(assert (=> b!702116 m!660807))

(declare-fun m!660809 () Bool)

(assert (=> start!62450 m!660809))

(check-sat (not b!702113) (not b!702133) (not b!702126) (not b!702140) (not b!702135) (not b!702134) (not b!702138) (not b!702114) (not b!702122) (not b!702141) (not b!702131) (not b!702137) (not b!702115) (not b!702123) (not b!702120) (not b!702136) (not b!702139) (not b!702117) (not b!702125) (not b!702129) (not b!702116) (not b!702124) (not b!702121) (not b!702132) (not b!702128) (not b!702130) (not start!62450) (not b!702127) (not b!702118))
(check-sat)
