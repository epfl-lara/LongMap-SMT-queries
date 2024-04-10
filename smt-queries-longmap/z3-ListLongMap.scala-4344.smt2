; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60094 () Bool)

(assert start!60094)

(declare-fun b!670117 () Bool)

(declare-datatypes ((Unit!23540 0))(
  ( (Unit!23541) )
))
(declare-fun e!383196 () Unit!23540)

(declare-fun Unit!23542 () Unit!23540)

(assert (=> b!670117 (= e!383196 Unit!23542)))

(declare-fun b!670118 () Bool)

(declare-fun e!383192 () Unit!23540)

(declare-fun lt!311907 () Unit!23540)

(assert (=> b!670118 (= e!383192 lt!311907)))

(declare-fun lt!311903 () Unit!23540)

(declare-datatypes ((List!12804 0))(
  ( (Nil!12801) (Cons!12800 (h!13845 (_ BitVec 64)) (t!19032 List!12804)) )
))
(declare-fun acc!681 () List!12804)

(declare-fun lemmaListSubSeqRefl!0 (List!12804) Unit!23540)

(assert (=> b!670118 (= lt!311903 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!120 (List!12804 List!12804) Bool)

(assert (=> b!670118 (subseq!120 acc!681 acc!681)))

(declare-datatypes ((array!39141 0))(
  ( (array!39142 (arr!18763 (Array (_ BitVec 32) (_ BitVec 64))) (size!19127 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39141)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39141 List!12804 List!12804 (_ BitVec 32)) Unit!23540)

(declare-fun $colon$colon!252 (List!12804 (_ BitVec 64)) List!12804)

(assert (=> b!670118 (= lt!311907 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!252 acc!681 (select (arr!18763 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39141 (_ BitVec 32) List!12804) Bool)

(assert (=> b!670118 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!670119 () Bool)

(declare-fun res!436905 () Bool)

(declare-fun e!383198 () Bool)

(assert (=> b!670119 (=> (not res!436905) (not e!383198))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670119 (= res!436905 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19127 a!3626))))))

(declare-fun b!670120 () Bool)

(declare-fun res!436921 () Bool)

(assert (=> b!670120 (=> (not res!436921) (not e!383198))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!670120 (= res!436921 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!670121 () Bool)

(declare-fun e!383191 () Bool)

(declare-fun lt!311899 () List!12804)

(declare-fun contains!3381 (List!12804 (_ BitVec 64)) Bool)

(assert (=> b!670121 (= e!383191 (contains!3381 lt!311899 k0!2843))))

(declare-fun b!670122 () Bool)

(declare-fun res!436920 () Bool)

(assert (=> b!670122 (=> (not res!436920) (not e!383198))))

(assert (=> b!670122 (= res!436920 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!670123 () Bool)

(declare-fun e!383190 () Bool)

(assert (=> b!670123 (= e!383190 (contains!3381 acc!681 k0!2843))))

(declare-fun res!436913 () Bool)

(assert (=> start!60094 (=> (not res!436913) (not e!383198))))

(assert (=> start!60094 (= res!436913 (and (bvslt (size!19127 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19127 a!3626))))))

(assert (=> start!60094 e!383198))

(assert (=> start!60094 true))

(declare-fun array_inv!14559 (array!39141) Bool)

(assert (=> start!60094 (array_inv!14559 a!3626)))

(declare-fun b!670124 () Bool)

(declare-fun res!436908 () Bool)

(assert (=> b!670124 (=> (not res!436908) (not e!383198))))

(declare-fun e!383194 () Bool)

(assert (=> b!670124 (= res!436908 e!383194)))

(declare-fun res!436912 () Bool)

(assert (=> b!670124 (=> res!436912 e!383194)))

(assert (=> b!670124 (= res!436912 e!383190)))

(declare-fun res!436915 () Bool)

(assert (=> b!670124 (=> (not res!436915) (not e!383190))))

(assert (=> b!670124 (= res!436915 (bvsgt from!3004 i!1382))))

(declare-fun b!670125 () Bool)

(declare-fun res!436918 () Bool)

(declare-fun e!383199 () Bool)

(assert (=> b!670125 (=> res!436918 e!383199)))

(declare-fun noDuplicate!628 (List!12804) Bool)

(assert (=> b!670125 (= res!436918 (not (noDuplicate!628 lt!311899)))))

(declare-fun b!670126 () Bool)

(assert (=> b!670126 (= e!383199 true)))

(declare-fun lt!311904 () array!39141)

(assert (=> b!670126 (arrayNoDuplicates!0 lt!311904 (bvadd #b00000000000000000000000000000001 from!3004) lt!311899)))

(declare-fun lt!311906 () Unit!23540)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39141 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12804) Unit!23540)

(assert (=> b!670126 (= lt!311906 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!311899))))

(declare-fun b!670127 () Bool)

(declare-fun e!383195 () Bool)

(assert (=> b!670127 (= e!383195 (not (contains!3381 lt!311899 k0!2843)))))

(declare-fun b!670128 () Bool)

(declare-fun Unit!23543 () Unit!23540)

(assert (=> b!670128 (= e!383192 Unit!23543)))

(declare-fun b!670129 () Bool)

(assert (=> b!670129 (= e!383198 (not e!383199))))

(declare-fun res!436914 () Bool)

(assert (=> b!670129 (=> res!436914 e!383199)))

(assert (=> b!670129 (= res!436914 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!670129 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311899)))

(declare-fun lt!311898 () Unit!23540)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39141 (_ BitVec 64) (_ BitVec 32) List!12804 List!12804) Unit!23540)

(assert (=> b!670129 (= lt!311898 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311899))))

(declare-fun -!118 (List!12804 (_ BitVec 64)) List!12804)

(assert (=> b!670129 (= (-!118 lt!311899 k0!2843) acc!681)))

(assert (=> b!670129 (= lt!311899 ($colon$colon!252 acc!681 k0!2843))))

(declare-fun lt!311905 () Unit!23540)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12804) Unit!23540)

(assert (=> b!670129 (= lt!311905 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!670129 (subseq!120 acc!681 acc!681)))

(declare-fun lt!311908 () Unit!23540)

(assert (=> b!670129 (= lt!311908 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!670129 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311902 () Unit!23540)

(assert (=> b!670129 (= lt!311902 e!383192)))

(declare-fun c!76975 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!670129 (= c!76975 (validKeyInArray!0 (select (arr!18763 a!3626) from!3004)))))

(declare-fun lt!311901 () Unit!23540)

(assert (=> b!670129 (= lt!311901 e!383196)))

(declare-fun c!76976 () Bool)

(assert (=> b!670129 (= c!76976 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!670129 (arrayContainsKey!0 lt!311904 k0!2843 from!3004)))

(assert (=> b!670129 (= lt!311904 (array!39142 (store (arr!18763 a!3626) i!1382 k0!2843) (size!19127 a!3626)))))

(declare-fun b!670130 () Bool)

(declare-fun res!436910 () Bool)

(assert (=> b!670130 (=> res!436910 e!383199)))

(assert (=> b!670130 (= res!436910 (contains!3381 lt!311899 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670131 () Bool)

(declare-fun res!436922 () Bool)

(assert (=> b!670131 (=> res!436922 e!383199)))

(assert (=> b!670131 (= res!436922 (contains!3381 lt!311899 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670132 () Bool)

(declare-fun Unit!23544 () Unit!23540)

(assert (=> b!670132 (= e!383196 Unit!23544)))

(declare-fun lt!311900 () Unit!23540)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39141 (_ BitVec 64) (_ BitVec 32)) Unit!23540)

(assert (=> b!670132 (= lt!311900 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!670132 false))

(declare-fun b!670133 () Bool)

(declare-fun e!383197 () Bool)

(assert (=> b!670133 (= e!383197 (not (contains!3381 acc!681 k0!2843)))))

(declare-fun b!670134 () Bool)

(declare-fun res!436916 () Bool)

(assert (=> b!670134 (=> res!436916 e!383199)))

(declare-fun e!383189 () Bool)

(assert (=> b!670134 (= res!436916 e!383189)))

(declare-fun res!436903 () Bool)

(assert (=> b!670134 (=> (not res!436903) (not e!383189))))

(assert (=> b!670134 (= res!436903 e!383195)))

(declare-fun res!436907 () Bool)

(assert (=> b!670134 (=> res!436907 e!383195)))

(assert (=> b!670134 (= res!436907 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670135 () Bool)

(assert (=> b!670135 (= e!383194 e!383197)))

(declare-fun res!436917 () Bool)

(assert (=> b!670135 (=> (not res!436917) (not e!383197))))

(assert (=> b!670135 (= res!436917 (bvsle from!3004 i!1382))))

(declare-fun b!670136 () Bool)

(declare-fun res!436901 () Bool)

(assert (=> b!670136 (=> (not res!436901) (not e!383198))))

(assert (=> b!670136 (= res!436901 (not (contains!3381 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670137 () Bool)

(declare-fun res!436906 () Bool)

(assert (=> b!670137 (=> (not res!436906) (not e!383198))))

(assert (=> b!670137 (= res!436906 (validKeyInArray!0 k0!2843))))

(declare-fun b!670138 () Bool)

(declare-fun res!436919 () Bool)

(assert (=> b!670138 (=> (not res!436919) (not e!383198))))

(assert (=> b!670138 (= res!436919 (noDuplicate!628 acc!681))))

(declare-fun b!670139 () Bool)

(declare-fun res!436904 () Bool)

(assert (=> b!670139 (=> (not res!436904) (not e!383198))))

(assert (=> b!670139 (= res!436904 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19127 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!670140 () Bool)

(declare-fun res!436909 () Bool)

(assert (=> b!670140 (=> (not res!436909) (not e!383198))))

(assert (=> b!670140 (= res!436909 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12801))))

(declare-fun b!670141 () Bool)

(declare-fun res!436902 () Bool)

(assert (=> b!670141 (=> (not res!436902) (not e!383198))))

(assert (=> b!670141 (= res!436902 (not (contains!3381 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670142 () Bool)

(assert (=> b!670142 (= e!383189 e!383191)))

(declare-fun res!436911 () Bool)

(assert (=> b!670142 (=> res!436911 e!383191)))

(assert (=> b!670142 (= res!436911 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60094 res!436913) b!670138))

(assert (= (and b!670138 res!436919) b!670136))

(assert (= (and b!670136 res!436901) b!670141))

(assert (= (and b!670141 res!436902) b!670124))

(assert (= (and b!670124 res!436915) b!670123))

(assert (= (and b!670124 (not res!436912)) b!670135))

(assert (= (and b!670135 res!436917) b!670133))

(assert (= (and b!670124 res!436908) b!670140))

(assert (= (and b!670140 res!436909) b!670122))

(assert (= (and b!670122 res!436920) b!670119))

(assert (= (and b!670119 res!436905) b!670137))

(assert (= (and b!670137 res!436906) b!670120))

(assert (= (and b!670120 res!436921) b!670139))

(assert (= (and b!670139 res!436904) b!670129))

(assert (= (and b!670129 c!76976) b!670132))

(assert (= (and b!670129 (not c!76976)) b!670117))

(assert (= (and b!670129 c!76975) b!670118))

(assert (= (and b!670129 (not c!76975)) b!670128))

(assert (= (and b!670129 (not res!436914)) b!670125))

(assert (= (and b!670125 (not res!436918)) b!670131))

(assert (= (and b!670131 (not res!436922)) b!670130))

(assert (= (and b!670130 (not res!436910)) b!670134))

(assert (= (and b!670134 (not res!436907)) b!670127))

(assert (= (and b!670134 res!436903) b!670142))

(assert (= (and b!670142 (not res!436911)) b!670121))

(assert (= (and b!670134 (not res!436916)) b!670126))

(declare-fun m!640063 () Bool)

(assert (=> b!670137 m!640063))

(declare-fun m!640065 () Bool)

(assert (=> b!670130 m!640065))

(declare-fun m!640067 () Bool)

(assert (=> b!670126 m!640067))

(declare-fun m!640069 () Bool)

(assert (=> b!670126 m!640069))

(declare-fun m!640071 () Bool)

(assert (=> b!670122 m!640071))

(declare-fun m!640073 () Bool)

(assert (=> b!670120 m!640073))

(declare-fun m!640075 () Bool)

(assert (=> b!670131 m!640075))

(declare-fun m!640077 () Bool)

(assert (=> b!670138 m!640077))

(declare-fun m!640079 () Bool)

(assert (=> b!670129 m!640079))

(declare-fun m!640081 () Bool)

(assert (=> b!670129 m!640081))

(declare-fun m!640083 () Bool)

(assert (=> b!670129 m!640083))

(declare-fun m!640085 () Bool)

(assert (=> b!670129 m!640085))

(declare-fun m!640087 () Bool)

(assert (=> b!670129 m!640087))

(declare-fun m!640089 () Bool)

(assert (=> b!670129 m!640089))

(declare-fun m!640091 () Bool)

(assert (=> b!670129 m!640091))

(declare-fun m!640093 () Bool)

(assert (=> b!670129 m!640093))

(declare-fun m!640095 () Bool)

(assert (=> b!670129 m!640095))

(declare-fun m!640097 () Bool)

(assert (=> b!670129 m!640097))

(assert (=> b!670129 m!640079))

(declare-fun m!640099 () Bool)

(assert (=> b!670129 m!640099))

(declare-fun m!640101 () Bool)

(assert (=> b!670129 m!640101))

(declare-fun m!640103 () Bool)

(assert (=> b!670129 m!640103))

(declare-fun m!640105 () Bool)

(assert (=> b!670123 m!640105))

(declare-fun m!640107 () Bool)

(assert (=> b!670121 m!640107))

(declare-fun m!640109 () Bool)

(assert (=> b!670125 m!640109))

(declare-fun m!640111 () Bool)

(assert (=> b!670132 m!640111))

(declare-fun m!640113 () Bool)

(assert (=> start!60094 m!640113))

(assert (=> b!670118 m!640089))

(assert (=> b!670118 m!640079))

(declare-fun m!640115 () Bool)

(assert (=> b!670118 m!640115))

(declare-fun m!640117 () Bool)

(assert (=> b!670118 m!640117))

(assert (=> b!670118 m!640079))

(assert (=> b!670118 m!640115))

(assert (=> b!670118 m!640083))

(assert (=> b!670118 m!640103))

(assert (=> b!670127 m!640107))

(assert (=> b!670133 m!640105))

(declare-fun m!640119 () Bool)

(assert (=> b!670136 m!640119))

(declare-fun m!640121 () Bool)

(assert (=> b!670140 m!640121))

(declare-fun m!640123 () Bool)

(assert (=> b!670141 m!640123))

(check-sat (not b!670123) (not b!670127) (not start!60094) (not b!670125) (not b!670121) (not b!670120) (not b!670136) (not b!670122) (not b!670137) (not b!670140) (not b!670138) (not b!670126) (not b!670118) (not b!670132) (not b!670131) (not b!670130) (not b!670129) (not b!670133) (not b!670141))
