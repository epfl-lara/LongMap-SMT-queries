; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62478 () Bool)

(assert start!62478)

(declare-fun b!703097 () Bool)

(declare-fun res!466930 () Bool)

(declare-fun e!397572 () Bool)

(assert (=> b!703097 (=> (not res!466930) (not e!397572))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-datatypes ((List!13276 0))(
  ( (Nil!13273) (Cons!13272 (h!14317 (_ BitVec 64)) (t!19558 List!13276)) )
))
(declare-fun acc!652 () List!13276)

(declare-fun newAcc!49 () List!13276)

(declare-fun -!263 (List!13276 (_ BitVec 64)) List!13276)

(assert (=> b!703097 (= res!466930 (= (-!263 newAcc!49 k!2824) acc!652))))

(declare-fun b!703098 () Bool)

(declare-fun e!397573 () Bool)

(assert (=> b!703098 (= e!397572 e!397573)))

(declare-fun res!466928 () Bool)

(assert (=> b!703098 (=> (not res!466928) (not e!397573))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!703098 (= res!466928 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun lt!317768 () List!13276)

(declare-datatypes ((array!40157 0))(
  ( (array!40158 (arr!19235 (Array (_ BitVec 32) (_ BitVec 64))) (size!19620 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40157)

(declare-fun $colon$colon!496 (List!13276 (_ BitVec 64)) List!13276)

(assert (=> b!703098 (= lt!317768 ($colon$colon!496 newAcc!49 (select (arr!19235 a!3591) from!2969)))))

(declare-fun lt!317769 () List!13276)

(assert (=> b!703098 (= lt!317769 ($colon$colon!496 acc!652 (select (arr!19235 a!3591) from!2969)))))

(declare-fun b!703099 () Bool)

(declare-fun res!466916 () Bool)

(assert (=> b!703099 (=> (not res!466916) (not e!397572))))

(declare-fun noDuplicate!1100 (List!13276) Bool)

(assert (=> b!703099 (= res!466916 (noDuplicate!1100 acc!652))))

(declare-fun b!703100 () Bool)

(declare-fun res!466919 () Bool)

(assert (=> b!703100 (=> (not res!466919) (not e!397573))))

(declare-fun contains!3853 (List!13276 (_ BitVec 64)) Bool)

(assert (=> b!703100 (= res!466919 (not (contains!3853 lt!317768 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703102 () Bool)

(declare-fun res!466907 () Bool)

(assert (=> b!703102 (=> (not res!466907) (not e!397573))))

(assert (=> b!703102 (= res!466907 (noDuplicate!1100 lt!317769))))

(declare-fun b!703103 () Bool)

(declare-fun res!466932 () Bool)

(assert (=> b!703103 (=> (not res!466932) (not e!397572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703103 (= res!466932 (validKeyInArray!0 k!2824))))

(declare-fun b!703104 () Bool)

(declare-fun res!466931 () Bool)

(assert (=> b!703104 (=> (not res!466931) (not e!397572))))

(declare-fun arrayNoDuplicates!0 (array!40157 (_ BitVec 32) List!13276) Bool)

(assert (=> b!703104 (= res!466931 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703105 () Bool)

(declare-fun res!466933 () Bool)

(assert (=> b!703105 (=> (not res!466933) (not e!397572))))

(assert (=> b!703105 (= res!466933 (noDuplicate!1100 newAcc!49))))

(declare-fun b!703106 () Bool)

(declare-fun res!466929 () Bool)

(assert (=> b!703106 (=> (not res!466929) (not e!397572))))

(declare-fun subseq!298 (List!13276 List!13276) Bool)

(assert (=> b!703106 (= res!466929 (subseq!298 acc!652 newAcc!49))))

(declare-fun b!703107 () Bool)

(declare-fun res!466924 () Bool)

(assert (=> b!703107 (=> (not res!466924) (not e!397572))))

(assert (=> b!703107 (= res!466924 (not (contains!3853 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703108 () Bool)

(declare-fun res!466918 () Bool)

(assert (=> b!703108 (=> (not res!466918) (not e!397573))))

(assert (=> b!703108 (= res!466918 (not (contains!3853 lt!317769 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703109 () Bool)

(declare-fun res!466925 () Bool)

(assert (=> b!703109 (=> (not res!466925) (not e!397573))))

(assert (=> b!703109 (= res!466925 (subseq!298 lt!317769 lt!317768))))

(declare-fun b!703110 () Bool)

(declare-fun res!466911 () Bool)

(assert (=> b!703110 (=> (not res!466911) (not e!397573))))

(assert (=> b!703110 (= res!466911 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317769))))

(declare-fun b!703111 () Bool)

(declare-fun res!466913 () Bool)

(assert (=> b!703111 (=> (not res!466913) (not e!397573))))

(assert (=> b!703111 (= res!466913 (not (contains!3853 lt!317769 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703112 () Bool)

(declare-fun res!466917 () Bool)

(assert (=> b!703112 (=> (not res!466917) (not e!397573))))

(assert (=> b!703112 (= res!466917 (noDuplicate!1100 lt!317768))))

(declare-fun b!703113 () Bool)

(declare-fun res!466935 () Bool)

(assert (=> b!703113 (=> (not res!466935) (not e!397572))))

(declare-fun arrayContainsKey!0 (array!40157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703113 (= res!466935 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!703114 () Bool)

(declare-fun res!466927 () Bool)

(assert (=> b!703114 (=> (not res!466927) (not e!397573))))

(assert (=> b!703114 (= res!466927 (not (contains!3853 lt!317768 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703115 () Bool)

(assert (=> b!703115 (= e!397573 (not true))))

(assert (=> b!703115 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317768)))

(declare-datatypes ((Unit!24604 0))(
  ( (Unit!24605) )
))
(declare-fun lt!317767 () Unit!24604)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40157 (_ BitVec 64) (_ BitVec 32) List!13276 List!13276) Unit!24604)

(assert (=> b!703115 (= lt!317767 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969) lt!317769 lt!317768))))

(declare-fun res!466922 () Bool)

(assert (=> start!62478 (=> (not res!466922) (not e!397572))))

(assert (=> start!62478 (= res!466922 (and (bvslt (size!19620 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19620 a!3591))))))

(assert (=> start!62478 e!397572))

(assert (=> start!62478 true))

(declare-fun array_inv!15031 (array!40157) Bool)

(assert (=> start!62478 (array_inv!15031 a!3591)))

(declare-fun b!703101 () Bool)

(declare-fun res!466908 () Bool)

(assert (=> b!703101 (=> (not res!466908) (not e!397573))))

(assert (=> b!703101 (= res!466908 (= (-!263 lt!317768 k!2824) lt!317769))))

(declare-fun b!703116 () Bool)

(declare-fun res!466920 () Bool)

(assert (=> b!703116 (=> (not res!466920) (not e!397572))))

(assert (=> b!703116 (= res!466920 (not (contains!3853 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703117 () Bool)

(declare-fun res!466915 () Bool)

(assert (=> b!703117 (=> (not res!466915) (not e!397572))))

(assert (=> b!703117 (= res!466915 (not (contains!3853 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703118 () Bool)

(declare-fun res!466912 () Bool)

(assert (=> b!703118 (=> (not res!466912) (not e!397573))))

(assert (=> b!703118 (= res!466912 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703119 () Bool)

(declare-fun res!466934 () Bool)

(assert (=> b!703119 (=> (not res!466934) (not e!397572))))

(assert (=> b!703119 (= res!466934 (validKeyInArray!0 (select (arr!19235 a!3591) from!2969)))))

(declare-fun b!703120 () Bool)

(declare-fun res!466921 () Bool)

(assert (=> b!703120 (=> (not res!466921) (not e!397572))))

(assert (=> b!703120 (= res!466921 (contains!3853 newAcc!49 k!2824))))

(declare-fun b!703121 () Bool)

(declare-fun res!466909 () Bool)

(assert (=> b!703121 (=> (not res!466909) (not e!397573))))

(assert (=> b!703121 (= res!466909 (not (contains!3853 lt!317769 k!2824)))))

(declare-fun b!703122 () Bool)

(declare-fun res!466926 () Bool)

(assert (=> b!703122 (=> (not res!466926) (not e!397572))))

(assert (=> b!703122 (= res!466926 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19620 a!3591)))))

(declare-fun b!703123 () Bool)

(declare-fun res!466910 () Bool)

(assert (=> b!703123 (=> (not res!466910) (not e!397573))))

(assert (=> b!703123 (= res!466910 (contains!3853 lt!317768 k!2824))))

(declare-fun b!703124 () Bool)

(declare-fun res!466914 () Bool)

(assert (=> b!703124 (=> (not res!466914) (not e!397572))))

(assert (=> b!703124 (= res!466914 (not (contains!3853 acc!652 k!2824)))))

(declare-fun b!703125 () Bool)

(declare-fun res!466923 () Bool)

(assert (=> b!703125 (=> (not res!466923) (not e!397572))))

(assert (=> b!703125 (= res!466923 (not (contains!3853 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62478 res!466922) b!703099))

(assert (= (and b!703099 res!466916) b!703105))

(assert (= (and b!703105 res!466933) b!703116))

(assert (= (and b!703116 res!466920) b!703125))

(assert (= (and b!703125 res!466923) b!703113))

(assert (= (and b!703113 res!466935) b!703124))

(assert (= (and b!703124 res!466914) b!703103))

(assert (= (and b!703103 res!466932) b!703104))

(assert (= (and b!703104 res!466931) b!703106))

(assert (= (and b!703106 res!466929) b!703120))

(assert (= (and b!703120 res!466921) b!703097))

(assert (= (and b!703097 res!466930) b!703107))

(assert (= (and b!703107 res!466924) b!703117))

(assert (= (and b!703117 res!466915) b!703122))

(assert (= (and b!703122 res!466926) b!703119))

(assert (= (and b!703119 res!466934) b!703098))

(assert (= (and b!703098 res!466928) b!703102))

(assert (= (and b!703102 res!466907) b!703112))

(assert (= (and b!703112 res!466917) b!703108))

(assert (= (and b!703108 res!466918) b!703111))

(assert (= (and b!703111 res!466913) b!703118))

(assert (= (and b!703118 res!466912) b!703121))

(assert (= (and b!703121 res!466909) b!703110))

(assert (= (and b!703110 res!466911) b!703109))

(assert (= (and b!703109 res!466925) b!703123))

(assert (= (and b!703123 res!466910) b!703101))

(assert (= (and b!703101 res!466908) b!703100))

(assert (= (and b!703100 res!466919) b!703114))

(assert (= (and b!703114 res!466927) b!703115))

(declare-fun m!662019 () Bool)

(assert (=> b!703099 m!662019))

(declare-fun m!662021 () Bool)

(assert (=> b!703125 m!662021))

(declare-fun m!662023 () Bool)

(assert (=> b!703112 m!662023))

(declare-fun m!662025 () Bool)

(assert (=> b!703118 m!662025))

(declare-fun m!662027 () Bool)

(assert (=> b!703110 m!662027))

(declare-fun m!662029 () Bool)

(assert (=> b!703106 m!662029))

(declare-fun m!662031 () Bool)

(assert (=> b!703104 m!662031))

(declare-fun m!662033 () Bool)

(assert (=> b!703100 m!662033))

(declare-fun m!662035 () Bool)

(assert (=> b!703119 m!662035))

(assert (=> b!703119 m!662035))

(declare-fun m!662037 () Bool)

(assert (=> b!703119 m!662037))

(assert (=> b!703098 m!662035))

(assert (=> b!703098 m!662035))

(declare-fun m!662039 () Bool)

(assert (=> b!703098 m!662039))

(assert (=> b!703098 m!662035))

(declare-fun m!662041 () Bool)

(assert (=> b!703098 m!662041))

(declare-fun m!662043 () Bool)

(assert (=> b!703107 m!662043))

(declare-fun m!662045 () Bool)

(assert (=> b!703117 m!662045))

(declare-fun m!662047 () Bool)

(assert (=> b!703101 m!662047))

(declare-fun m!662049 () Bool)

(assert (=> start!62478 m!662049))

(declare-fun m!662051 () Bool)

(assert (=> b!703105 m!662051))

(declare-fun m!662053 () Bool)

(assert (=> b!703102 m!662053))

(declare-fun m!662055 () Bool)

(assert (=> b!703120 m!662055))

(declare-fun m!662057 () Bool)

(assert (=> b!703114 m!662057))

(declare-fun m!662059 () Bool)

(assert (=> b!703113 m!662059))

(declare-fun m!662061 () Bool)

(assert (=> b!703123 m!662061))

(declare-fun m!662063 () Bool)

(assert (=> b!703121 m!662063))

(declare-fun m!662065 () Bool)

(assert (=> b!703103 m!662065))

(declare-fun m!662067 () Bool)

(assert (=> b!703097 m!662067))

(declare-fun m!662069 () Bool)

(assert (=> b!703116 m!662069))

(declare-fun m!662071 () Bool)

(assert (=> b!703111 m!662071))

(declare-fun m!662073 () Bool)

(assert (=> b!703108 m!662073))

(declare-fun m!662075 () Bool)

(assert (=> b!703124 m!662075))

(declare-fun m!662077 () Bool)

(assert (=> b!703115 m!662077))

(declare-fun m!662079 () Bool)

(assert (=> b!703115 m!662079))

(declare-fun m!662081 () Bool)

(assert (=> b!703109 m!662081))

(push 1)

