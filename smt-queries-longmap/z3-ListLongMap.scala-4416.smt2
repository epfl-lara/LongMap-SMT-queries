; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61044 () Bool)

(assert start!61044)

(declare-fun b!684209 () Bool)

(declare-fun res!449764 () Bool)

(declare-fun e!389741 () Bool)

(assert (=> b!684209 (=> (not res!449764) (not e!389741))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39591 0))(
  ( (array!39592 (arr!18973 (Array (_ BitVec 32) (_ BitVec 64))) (size!19340 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39591)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!684209 (= res!449764 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19340 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!684210 () Bool)

(declare-fun res!449753 () Bool)

(assert (=> b!684210 (=> (not res!449753) (not e!389741))))

(declare-datatypes ((List!12921 0))(
  ( (Nil!12918) (Cons!12917 (h!13965 (_ BitVec 64)) (t!19159 List!12921)) )
))
(declare-fun arrayNoDuplicates!0 (array!39591 (_ BitVec 32) List!12921) Bool)

(assert (=> b!684210 (= res!449753 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12918))))

(declare-fun b!684211 () Bool)

(declare-fun res!449761 () Bool)

(assert (=> b!684211 (=> (not res!449761) (not e!389741))))

(declare-fun acc!681 () List!12921)

(declare-fun contains!3573 (List!12921 (_ BitVec 64)) Bool)

(assert (=> b!684211 (= res!449761 (not (contains!3573 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684212 () Bool)

(declare-fun res!449754 () Bool)

(assert (=> b!684212 (=> (not res!449754) (not e!389741))))

(declare-fun e!389742 () Bool)

(assert (=> b!684212 (= res!449754 e!389742)))

(declare-fun res!449759 () Bool)

(assert (=> b!684212 (=> res!449759 e!389742)))

(declare-fun e!389744 () Bool)

(assert (=> b!684212 (= res!449759 e!389744)))

(declare-fun res!449756 () Bool)

(assert (=> b!684212 (=> (not res!449756) (not e!389744))))

(assert (=> b!684212 (= res!449756 (bvsgt from!3004 i!1382))))

(declare-fun b!684213 () Bool)

(declare-datatypes ((Unit!24036 0))(
  ( (Unit!24037) )
))
(declare-fun e!389745 () Unit!24036)

(declare-fun Unit!24038 () Unit!24036)

(assert (=> b!684213 (= e!389745 Unit!24038)))

(declare-fun lt!314217 () Unit!24036)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39591 (_ BitVec 64) (_ BitVec 32)) Unit!24036)

(assert (=> b!684213 (= lt!314217 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!684213 false))

(declare-fun b!684214 () Bool)

(declare-fun Unit!24039 () Unit!24036)

(assert (=> b!684214 (= e!389745 Unit!24039)))

(declare-fun b!684215 () Bool)

(declare-fun res!449757 () Bool)

(declare-fun e!389740 () Bool)

(assert (=> b!684215 (=> res!449757 e!389740)))

(declare-fun lt!314223 () List!12921)

(declare-fun noDuplicate!847 (List!12921) Bool)

(assert (=> b!684215 (= res!449757 (not (noDuplicate!847 lt!314223)))))

(declare-fun b!684216 () Bool)

(declare-fun e!389743 () Unit!24036)

(declare-fun Unit!24040 () Unit!24036)

(assert (=> b!684216 (= e!389743 Unit!24040)))

(declare-fun res!449751 () Bool)

(assert (=> start!61044 (=> (not res!449751) (not e!389741))))

(assert (=> start!61044 (= res!449751 (and (bvslt (size!19340 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19340 a!3626))))))

(assert (=> start!61044 e!389741))

(assert (=> start!61044 true))

(declare-fun array_inv!14832 (array!39591) Bool)

(assert (=> start!61044 (array_inv!14832 a!3626)))

(declare-fun b!684217 () Bool)

(declare-fun res!449749 () Bool)

(assert (=> b!684217 (=> (not res!449749) (not e!389741))))

(assert (=> b!684217 (= res!449749 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!684218 () Bool)

(declare-fun e!389738 () Bool)

(assert (=> b!684218 (= e!389742 e!389738)))

(declare-fun res!449752 () Bool)

(assert (=> b!684218 (=> (not res!449752) (not e!389738))))

(assert (=> b!684218 (= res!449752 (bvsle from!3004 i!1382))))

(declare-fun b!684219 () Bool)

(declare-fun res!449748 () Bool)

(assert (=> b!684219 (=> (not res!449748) (not e!389741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!684219 (= res!449748 (validKeyInArray!0 k0!2843))))

(declare-fun b!684220 () Bool)

(declare-fun res!449762 () Bool)

(assert (=> b!684220 (=> (not res!449762) (not e!389741))))

(declare-fun arrayContainsKey!0 (array!39591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!684220 (= res!449762 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!684221 () Bool)

(declare-fun lt!314218 () Unit!24036)

(assert (=> b!684221 (= e!389743 lt!314218)))

(declare-fun lt!314220 () Unit!24036)

(declare-fun lemmaListSubSeqRefl!0 (List!12921) Unit!24036)

(assert (=> b!684221 (= lt!314220 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!182 (List!12921 List!12921) Bool)

(assert (=> b!684221 (subseq!182 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39591 List!12921 List!12921 (_ BitVec 32)) Unit!24036)

(declare-fun $colon$colon!344 (List!12921 (_ BitVec 64)) List!12921)

(assert (=> b!684221 (= lt!314218 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!344 acc!681 (select (arr!18973 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684221 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!684222 () Bool)

(declare-fun res!449758 () Bool)

(assert (=> b!684222 (=> (not res!449758) (not e!389741))))

(assert (=> b!684222 (= res!449758 (noDuplicate!847 acc!681))))

(declare-fun b!684223 () Bool)

(assert (=> b!684223 (= e!389740 (not (contains!3573 acc!681 k0!2843)))))

(declare-fun b!684224 () Bool)

(assert (=> b!684224 (= e!389744 (contains!3573 acc!681 k0!2843))))

(declare-fun b!684225 () Bool)

(assert (=> b!684225 (= e!389738 (not (contains!3573 acc!681 k0!2843)))))

(declare-fun b!684226 () Bool)

(declare-fun res!449750 () Bool)

(assert (=> b!684226 (=> (not res!449750) (not e!389741))))

(assert (=> b!684226 (= res!449750 (not (contains!3573 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684227 () Bool)

(declare-fun res!449763 () Bool)

(assert (=> b!684227 (=> res!449763 e!389740)))

(declare-fun lt!314219 () Bool)

(assert (=> b!684227 (= res!449763 lt!314219)))

(declare-fun b!684228 () Bool)

(declare-fun res!449760 () Bool)

(assert (=> b!684228 (=> (not res!449760) (not e!389741))))

(assert (=> b!684228 (= res!449760 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19340 a!3626))))))

(declare-fun b!684229 () Bool)

(assert (=> b!684229 (= e!389741 (not e!389740))))

(declare-fun res!449755 () Bool)

(assert (=> b!684229 (=> res!449755 e!389740)))

(assert (=> b!684229 (= res!449755 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!146 (List!12921 (_ BitVec 64)) List!12921)

(assert (=> b!684229 (= (-!146 lt!314223 k0!2843) acc!681)))

(assert (=> b!684229 (= lt!314223 ($colon$colon!344 acc!681 k0!2843))))

(declare-fun lt!314221 () Unit!24036)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12921) Unit!24036)

(assert (=> b!684229 (= lt!314221 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!684229 (subseq!182 acc!681 acc!681)))

(declare-fun lt!314222 () Unit!24036)

(assert (=> b!684229 (= lt!314222 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684229 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314224 () Unit!24036)

(assert (=> b!684229 (= lt!314224 e!389743)))

(declare-fun c!77599 () Bool)

(assert (=> b!684229 (= c!77599 (validKeyInArray!0 (select (arr!18973 a!3626) from!3004)))))

(declare-fun lt!314216 () Unit!24036)

(assert (=> b!684229 (= lt!314216 e!389745)))

(declare-fun c!77600 () Bool)

(assert (=> b!684229 (= c!77600 lt!314219)))

(assert (=> b!684229 (= lt!314219 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684229 (arrayContainsKey!0 (array!39592 (store (arr!18973 a!3626) i!1382 k0!2843) (size!19340 a!3626)) k0!2843 from!3004)))

(assert (= (and start!61044 res!449751) b!684222))

(assert (= (and b!684222 res!449758) b!684226))

(assert (= (and b!684226 res!449750) b!684211))

(assert (= (and b!684211 res!449761) b!684212))

(assert (= (and b!684212 res!449756) b!684224))

(assert (= (and b!684212 (not res!449759)) b!684218))

(assert (= (and b!684218 res!449752) b!684225))

(assert (= (and b!684212 res!449754) b!684210))

(assert (= (and b!684210 res!449753) b!684217))

(assert (= (and b!684217 res!449749) b!684228))

(assert (= (and b!684228 res!449760) b!684219))

(assert (= (and b!684219 res!449748) b!684220))

(assert (= (and b!684220 res!449762) b!684209))

(assert (= (and b!684209 res!449764) b!684229))

(assert (= (and b!684229 c!77600) b!684213))

(assert (= (and b!684229 (not c!77600)) b!684214))

(assert (= (and b!684229 c!77599) b!684221))

(assert (= (and b!684229 (not c!77599)) b!684216))

(assert (= (and b!684229 (not res!449755)) b!684215))

(assert (= (and b!684215 (not res!449757)) b!684227))

(assert (= (and b!684227 (not res!449763)) b!684223))

(declare-fun m!649147 () Bool)

(assert (=> b!684226 m!649147))

(declare-fun m!649149 () Bool)

(assert (=> b!684229 m!649149))

(declare-fun m!649151 () Bool)

(assert (=> b!684229 m!649151))

(declare-fun m!649153 () Bool)

(assert (=> b!684229 m!649153))

(declare-fun m!649155 () Bool)

(assert (=> b!684229 m!649155))

(declare-fun m!649157 () Bool)

(assert (=> b!684229 m!649157))

(declare-fun m!649159 () Bool)

(assert (=> b!684229 m!649159))

(declare-fun m!649161 () Bool)

(assert (=> b!684229 m!649161))

(declare-fun m!649163 () Bool)

(assert (=> b!684229 m!649163))

(assert (=> b!684229 m!649151))

(declare-fun m!649165 () Bool)

(assert (=> b!684229 m!649165))

(declare-fun m!649167 () Bool)

(assert (=> b!684229 m!649167))

(declare-fun m!649169 () Bool)

(assert (=> b!684229 m!649169))

(declare-fun m!649171 () Bool)

(assert (=> start!61044 m!649171))

(declare-fun m!649173 () Bool)

(assert (=> b!684219 m!649173))

(declare-fun m!649175 () Bool)

(assert (=> b!684213 m!649175))

(declare-fun m!649177 () Bool)

(assert (=> b!684215 m!649177))

(declare-fun m!649179 () Bool)

(assert (=> b!684224 m!649179))

(declare-fun m!649181 () Bool)

(assert (=> b!684211 m!649181))

(declare-fun m!649183 () Bool)

(assert (=> b!684220 m!649183))

(assert (=> b!684225 m!649179))

(declare-fun m!649185 () Bool)

(assert (=> b!684217 m!649185))

(declare-fun m!649187 () Bool)

(assert (=> b!684222 m!649187))

(assert (=> b!684221 m!649149))

(assert (=> b!684221 m!649151))

(declare-fun m!649189 () Bool)

(assert (=> b!684221 m!649189))

(declare-fun m!649191 () Bool)

(assert (=> b!684221 m!649191))

(assert (=> b!684221 m!649151))

(assert (=> b!684221 m!649189))

(assert (=> b!684221 m!649159))

(assert (=> b!684221 m!649169))

(declare-fun m!649193 () Bool)

(assert (=> b!684210 m!649193))

(assert (=> b!684223 m!649179))

(check-sat (not b!684226) (not b!684224) (not b!684213) (not b!684220) (not b!684211) (not b!684219) (not b!684215) (not b!684221) (not b!684222) (not b!684229) (not b!684223) (not b!684217) (not b!684225) (not start!61044) (not b!684210))
(check-sat)
