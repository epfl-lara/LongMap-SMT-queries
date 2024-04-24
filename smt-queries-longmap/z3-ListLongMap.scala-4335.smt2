; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60096 () Bool)

(assert start!60096)

(declare-fun b!668227 () Bool)

(declare-fun e!382415 () Bool)

(declare-datatypes ((List!12678 0))(
  ( (Nil!12675) (Cons!12674 (h!13722 (_ BitVec 64)) (t!18898 List!12678)) )
))
(declare-fun acc!681 () List!12678)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3330 (List!12678 (_ BitVec 64)) Bool)

(assert (=> b!668227 (= e!382415 (not (contains!3330 acc!681 k0!2843)))))

(declare-fun b!668228 () Bool)

(declare-fun e!382411 () Bool)

(assert (=> b!668228 (= e!382411 e!382415)))

(declare-fun res!435241 () Bool)

(assert (=> b!668228 (=> (not res!435241) (not e!382415))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!668228 (= res!435241 (bvsle from!3004 i!1382))))

(declare-fun b!668229 () Bool)

(declare-datatypes ((Unit!23379 0))(
  ( (Unit!23380) )
))
(declare-fun e!382413 () Unit!23379)

(declare-fun Unit!23381 () Unit!23379)

(assert (=> b!668229 (= e!382413 Unit!23381)))

(declare-fun b!668230 () Bool)

(declare-fun res!435255 () Bool)

(declare-fun e!382409 () Bool)

(assert (=> b!668230 (=> (not res!435255) (not e!382409))))

(declare-fun noDuplicate!604 (List!12678) Bool)

(assert (=> b!668230 (= res!435255 (noDuplicate!604 acc!681))))

(declare-fun b!668231 () Bool)

(declare-fun e!382406 () Bool)

(assert (=> b!668231 (= e!382406 true)))

(declare-fun lt!311153 () Bool)

(declare-fun e!382407 () Bool)

(assert (=> b!668231 (= lt!311153 e!382407)))

(declare-fun res!435244 () Bool)

(assert (=> b!668231 (=> res!435244 e!382407)))

(declare-fun e!382412 () Bool)

(assert (=> b!668231 (= res!435244 e!382412)))

(declare-fun res!435256 () Bool)

(assert (=> b!668231 (=> (not res!435256) (not e!382412))))

(assert (=> b!668231 (= res!435256 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668232 () Bool)

(declare-fun res!435254 () Bool)

(assert (=> b!668232 (=> (not res!435254) (not e!382409))))

(declare-datatypes ((array!39081 0))(
  ( (array!39082 (arr!18730 (Array (_ BitVec 32) (_ BitVec 64))) (size!19094 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39081)

(declare-fun arrayNoDuplicates!0 (array!39081 (_ BitVec 32) List!12678) Bool)

(assert (=> b!668232 (= res!435254 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12675))))

(declare-fun b!668233 () Bool)

(declare-fun res!435238 () Bool)

(assert (=> b!668233 (=> (not res!435238) (not e!382409))))

(declare-fun arrayContainsKey!0 (array!39081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!668233 (= res!435238 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!668234 () Bool)

(declare-fun res!435253 () Bool)

(assert (=> b!668234 (=> res!435253 e!382406)))

(declare-fun lt!311151 () List!12678)

(assert (=> b!668234 (= res!435253 (contains!3330 lt!311151 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668235 () Bool)

(declare-fun res!435242 () Bool)

(assert (=> b!668235 (=> (not res!435242) (not e!382409))))

(assert (=> b!668235 (= res!435242 (not (contains!3330 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668236 () Bool)

(declare-fun e!382410 () Bool)

(assert (=> b!668236 (= e!382407 e!382410)))

(declare-fun res!435247 () Bool)

(assert (=> b!668236 (=> (not res!435247) (not e!382410))))

(assert (=> b!668236 (= res!435247 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668237 () Bool)

(assert (=> b!668237 (= e!382412 (contains!3330 lt!311151 k0!2843))))

(declare-fun b!668238 () Bool)

(declare-fun res!435239 () Bool)

(assert (=> b!668238 (=> (not res!435239) (not e!382409))))

(assert (=> b!668238 (= res!435239 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19094 a!3626))))))

(declare-fun res!435250 () Bool)

(assert (=> start!60096 (=> (not res!435250) (not e!382409))))

(assert (=> start!60096 (= res!435250 (and (bvslt (size!19094 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19094 a!3626))))))

(assert (=> start!60096 e!382409))

(assert (=> start!60096 true))

(declare-fun array_inv!14589 (array!39081) Bool)

(assert (=> start!60096 (array_inv!14589 a!3626)))

(declare-fun b!668239 () Bool)

(declare-fun e!382414 () Unit!23379)

(declare-fun Unit!23382 () Unit!23379)

(assert (=> b!668239 (= e!382414 Unit!23382)))

(declare-fun lt!311154 () Unit!23379)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39081 (_ BitVec 64) (_ BitVec 32)) Unit!23379)

(assert (=> b!668239 (= lt!311154 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!668239 false))

(declare-fun b!668240 () Bool)

(declare-fun lt!311155 () Unit!23379)

(assert (=> b!668240 (= e!382413 lt!311155)))

(declare-fun lt!311146 () Unit!23379)

(declare-fun lemmaListSubSeqRefl!0 (List!12678) Unit!23379)

(assert (=> b!668240 (= lt!311146 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!92 (List!12678 List!12678) Bool)

(assert (=> b!668240 (subseq!92 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39081 List!12678 List!12678 (_ BitVec 32)) Unit!23379)

(declare-fun $colon$colon!221 (List!12678 (_ BitVec 64)) List!12678)

(assert (=> b!668240 (= lt!311155 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!221 acc!681 (select (arr!18730 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668240 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!668241 () Bool)

(declare-fun res!435249 () Bool)

(assert (=> b!668241 (=> (not res!435249) (not e!382409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!668241 (= res!435249 (validKeyInArray!0 k0!2843))))

(declare-fun b!668242 () Bool)

(declare-fun res!435237 () Bool)

(assert (=> b!668242 (=> (not res!435237) (not e!382409))))

(assert (=> b!668242 (= res!435237 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!668243 () Bool)

(declare-fun e!382416 () Bool)

(assert (=> b!668243 (= e!382416 (contains!3330 acc!681 k0!2843))))

(declare-fun b!668244 () Bool)

(declare-fun res!435251 () Bool)

(assert (=> b!668244 (=> res!435251 e!382406)))

(assert (=> b!668244 (= res!435251 (contains!3330 lt!311151 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668245 () Bool)

(declare-fun res!435240 () Bool)

(assert (=> b!668245 (=> (not res!435240) (not e!382409))))

(assert (=> b!668245 (= res!435240 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19094 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!668246 () Bool)

(declare-fun Unit!23383 () Unit!23379)

(assert (=> b!668246 (= e!382414 Unit!23383)))

(declare-fun b!668247 () Bool)

(assert (=> b!668247 (= e!382409 (not e!382406))))

(declare-fun res!435236 () Bool)

(assert (=> b!668247 (=> res!435236 e!382406)))

(assert (=> b!668247 (= res!435236 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!668247 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311151)))

(declare-fun lt!311147 () Unit!23379)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39081 (_ BitVec 64) (_ BitVec 32) List!12678 List!12678) Unit!23379)

(assert (=> b!668247 (= lt!311147 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311151))))

(declare-fun -!89 (List!12678 (_ BitVec 64)) List!12678)

(assert (=> b!668247 (= (-!89 lt!311151 k0!2843) acc!681)))

(assert (=> b!668247 (= lt!311151 ($colon$colon!221 acc!681 k0!2843))))

(declare-fun lt!311148 () Unit!23379)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12678) Unit!23379)

(assert (=> b!668247 (= lt!311148 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!668247 (subseq!92 acc!681 acc!681)))

(declare-fun lt!311152 () Unit!23379)

(assert (=> b!668247 (= lt!311152 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668247 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311150 () Unit!23379)

(assert (=> b!668247 (= lt!311150 e!382413)))

(declare-fun c!76864 () Bool)

(assert (=> b!668247 (= c!76864 (validKeyInArray!0 (select (arr!18730 a!3626) from!3004)))))

(declare-fun lt!311149 () Unit!23379)

(assert (=> b!668247 (= lt!311149 e!382414)))

(declare-fun c!76865 () Bool)

(assert (=> b!668247 (= c!76865 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668247 (arrayContainsKey!0 (array!39082 (store (arr!18730 a!3626) i!1382 k0!2843) (size!19094 a!3626)) k0!2843 from!3004)))

(declare-fun b!668248 () Bool)

(declare-fun res!435243 () Bool)

(assert (=> b!668248 (=> res!435243 e!382406)))

(assert (=> b!668248 (= res!435243 (not (noDuplicate!604 lt!311151)))))

(declare-fun b!668249 () Bool)

(declare-fun res!435245 () Bool)

(assert (=> b!668249 (=> (not res!435245) (not e!382409))))

(assert (=> b!668249 (= res!435245 e!382411)))

(declare-fun res!435252 () Bool)

(assert (=> b!668249 (=> res!435252 e!382411)))

(assert (=> b!668249 (= res!435252 e!382416)))

(declare-fun res!435248 () Bool)

(assert (=> b!668249 (=> (not res!435248) (not e!382416))))

(assert (=> b!668249 (= res!435248 (bvsgt from!3004 i!1382))))

(declare-fun b!668250 () Bool)

(declare-fun res!435246 () Bool)

(assert (=> b!668250 (=> (not res!435246) (not e!382409))))

(assert (=> b!668250 (= res!435246 (not (contains!3330 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668251 () Bool)

(assert (=> b!668251 (= e!382410 (not (contains!3330 lt!311151 k0!2843)))))

(assert (= (and start!60096 res!435250) b!668230))

(assert (= (and b!668230 res!435255) b!668235))

(assert (= (and b!668235 res!435242) b!668250))

(assert (= (and b!668250 res!435246) b!668249))

(assert (= (and b!668249 res!435248) b!668243))

(assert (= (and b!668249 (not res!435252)) b!668228))

(assert (= (and b!668228 res!435241) b!668227))

(assert (= (and b!668249 res!435245) b!668232))

(assert (= (and b!668232 res!435254) b!668242))

(assert (= (and b!668242 res!435237) b!668238))

(assert (= (and b!668238 res!435239) b!668241))

(assert (= (and b!668241 res!435249) b!668233))

(assert (= (and b!668233 res!435238) b!668245))

(assert (= (and b!668245 res!435240) b!668247))

(assert (= (and b!668247 c!76865) b!668239))

(assert (= (and b!668247 (not c!76865)) b!668246))

(assert (= (and b!668247 c!76864) b!668240))

(assert (= (and b!668247 (not c!76864)) b!668229))

(assert (= (and b!668247 (not res!435236)) b!668248))

(assert (= (and b!668248 (not res!435243)) b!668244))

(assert (= (and b!668244 (not res!435251)) b!668234))

(assert (= (and b!668234 (not res!435253)) b!668231))

(assert (= (and b!668231 res!435256) b!668237))

(assert (= (and b!668231 (not res!435244)) b!668236))

(assert (= (and b!668236 res!435247) b!668251))

(declare-fun m!639121 () Bool)

(assert (=> b!668237 m!639121))

(assert (=> b!668251 m!639121))

(declare-fun m!639123 () Bool)

(assert (=> b!668248 m!639123))

(declare-fun m!639125 () Bool)

(assert (=> b!668250 m!639125))

(declare-fun m!639127 () Bool)

(assert (=> b!668247 m!639127))

(declare-fun m!639129 () Bool)

(assert (=> b!668247 m!639129))

(declare-fun m!639131 () Bool)

(assert (=> b!668247 m!639131))

(declare-fun m!639133 () Bool)

(assert (=> b!668247 m!639133))

(declare-fun m!639135 () Bool)

(assert (=> b!668247 m!639135))

(declare-fun m!639137 () Bool)

(assert (=> b!668247 m!639137))

(declare-fun m!639139 () Bool)

(assert (=> b!668247 m!639139))

(declare-fun m!639141 () Bool)

(assert (=> b!668247 m!639141))

(assert (=> b!668247 m!639131))

(declare-fun m!639143 () Bool)

(assert (=> b!668247 m!639143))

(declare-fun m!639145 () Bool)

(assert (=> b!668247 m!639145))

(declare-fun m!639147 () Bool)

(assert (=> b!668247 m!639147))

(declare-fun m!639149 () Bool)

(assert (=> b!668247 m!639149))

(declare-fun m!639151 () Bool)

(assert (=> b!668247 m!639151))

(declare-fun m!639153 () Bool)

(assert (=> b!668234 m!639153))

(declare-fun m!639155 () Bool)

(assert (=> b!668244 m!639155))

(assert (=> b!668240 m!639129))

(assert (=> b!668240 m!639131))

(declare-fun m!639157 () Bool)

(assert (=> b!668240 m!639157))

(declare-fun m!639159 () Bool)

(assert (=> b!668240 m!639159))

(assert (=> b!668240 m!639131))

(assert (=> b!668240 m!639157))

(assert (=> b!668240 m!639137))

(assert (=> b!668240 m!639151))

(declare-fun m!639161 () Bool)

(assert (=> b!668241 m!639161))

(declare-fun m!639163 () Bool)

(assert (=> b!668233 m!639163))

(declare-fun m!639165 () Bool)

(assert (=> start!60096 m!639165))

(declare-fun m!639167 () Bool)

(assert (=> b!668230 m!639167))

(declare-fun m!639169 () Bool)

(assert (=> b!668239 m!639169))

(declare-fun m!639171 () Bool)

(assert (=> b!668232 m!639171))

(declare-fun m!639173 () Bool)

(assert (=> b!668235 m!639173))

(declare-fun m!639175 () Bool)

(assert (=> b!668227 m!639175))

(assert (=> b!668243 m!639175))

(declare-fun m!639177 () Bool)

(assert (=> b!668242 m!639177))

(check-sat (not b!668247) (not b!668227) (not start!60096) (not b!668239) (not b!668248) (not b!668237) (not b!668250) (not b!668243) (not b!668244) (not b!668233) (not b!668232) (not b!668241) (not b!668251) (not b!668242) (not b!668240) (not b!668235) (not b!668234) (not b!668230))
(check-sat)
