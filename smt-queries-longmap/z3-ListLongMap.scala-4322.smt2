; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59962 () Bool)

(assert start!59962)

(declare-fun b!665153 () Bool)

(declare-fun res!432734 () Bool)

(declare-fun e!381270 () Bool)

(assert (=> b!665153 (=> res!432734 e!381270)))

(declare-datatypes ((List!12738 0))(
  ( (Nil!12735) (Cons!12734 (h!13779 (_ BitVec 64)) (t!18966 List!12738)) )
))
(declare-fun acc!681 () List!12738)

(declare-fun lt!309907 () List!12738)

(declare-fun subseq!54 (List!12738 List!12738) Bool)

(assert (=> b!665153 (= res!432734 (not (subseq!54 acc!681 lt!309907)))))

(declare-fun b!665154 () Bool)

(declare-fun res!432744 () Bool)

(declare-fun e!381269 () Bool)

(assert (=> b!665154 (=> (not res!432744) (not e!381269))))

(declare-fun contains!3315 (List!12738 (_ BitVec 64)) Bool)

(assert (=> b!665154 (= res!432744 (not (contains!3315 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665155 () Bool)

(declare-fun e!381273 () Bool)

(declare-fun e!381266 () Bool)

(assert (=> b!665155 (= e!381273 e!381266)))

(declare-fun res!432735 () Bool)

(assert (=> b!665155 (=> (not res!432735) (not e!381266))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!665155 (= res!432735 (bvsle from!3004 i!1382))))

(declare-fun b!665156 () Bool)

(declare-fun res!432747 () Bool)

(assert (=> b!665156 (=> res!432747 e!381270)))

(declare-fun noDuplicate!562 (List!12738) Bool)

(assert (=> b!665156 (= res!432747 (not (noDuplicate!562 lt!309907)))))

(declare-fun b!665157 () Bool)

(declare-fun res!432737 () Bool)

(assert (=> b!665157 (=> (not res!432737) (not e!381269))))

(declare-datatypes ((array!39009 0))(
  ( (array!39010 (arr!18697 (Array (_ BitVec 32) (_ BitVec 64))) (size!19061 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39009)

(declare-fun arrayNoDuplicates!0 (array!39009 (_ BitVec 32) List!12738) Bool)

(assert (=> b!665157 (= res!432737 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!665158 () Bool)

(assert (=> b!665158 (= e!381270 true)))

(declare-fun lt!309909 () Bool)

(assert (=> b!665158 (= lt!309909 (contains!3315 lt!309907 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665159 () Bool)

(declare-fun res!432741 () Bool)

(assert (=> b!665159 (=> res!432741 e!381270)))

(declare-fun lt!309906 () Bool)

(assert (=> b!665159 (= res!432741 lt!309906)))

(declare-fun b!665160 () Bool)

(declare-fun res!432745 () Bool)

(assert (=> b!665160 (=> (not res!432745) (not e!381269))))

(assert (=> b!665160 (= res!432745 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12735))))

(declare-fun b!665161 () Bool)

(declare-fun res!432748 () Bool)

(assert (=> b!665161 (=> res!432748 e!381270)))

(assert (=> b!665161 (= res!432748 (contains!3315 lt!309907 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665162 () Bool)

(declare-fun res!432742 () Bool)

(assert (=> b!665162 (=> (not res!432742) (not e!381269))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39009 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665162 (= res!432742 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!665163 () Bool)

(declare-datatypes ((Unit!23210 0))(
  ( (Unit!23211) )
))
(declare-fun e!381271 () Unit!23210)

(declare-fun Unit!23212 () Unit!23210)

(assert (=> b!665163 (= e!381271 Unit!23212)))

(declare-fun res!432739 () Bool)

(assert (=> start!59962 (=> (not res!432739) (not e!381269))))

(assert (=> start!59962 (= res!432739 (and (bvslt (size!19061 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19061 a!3626))))))

(assert (=> start!59962 e!381269))

(assert (=> start!59962 true))

(declare-fun array_inv!14493 (array!39009) Bool)

(assert (=> start!59962 (array_inv!14493 a!3626)))

(declare-fun b!665164 () Bool)

(declare-fun e!381267 () Unit!23210)

(declare-fun Unit!23213 () Unit!23210)

(assert (=> b!665164 (= e!381267 Unit!23213)))

(declare-fun b!665165 () Bool)

(declare-fun res!432743 () Bool)

(assert (=> b!665165 (=> (not res!432743) (not e!381269))))

(assert (=> b!665165 (= res!432743 (not (contains!3315 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665166 () Bool)

(declare-fun res!432730 () Bool)

(assert (=> b!665166 (=> (not res!432730) (not e!381269))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665166 (= res!432730 (validKeyInArray!0 k0!2843))))

(declare-fun b!665167 () Bool)

(declare-fun res!432731 () Bool)

(assert (=> b!665167 (=> (not res!432731) (not e!381269))))

(assert (=> b!665167 (= res!432731 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19061 a!3626))))))

(declare-fun b!665168 () Bool)

(declare-fun Unit!23214 () Unit!23210)

(assert (=> b!665168 (= e!381267 Unit!23214)))

(declare-fun lt!309912 () Unit!23210)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39009 (_ BitVec 64) (_ BitVec 32)) Unit!23210)

(assert (=> b!665168 (= lt!309912 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!665168 false))

(declare-fun b!665169 () Bool)

(declare-fun res!432738 () Bool)

(assert (=> b!665169 (=> res!432738 e!381270)))

(assert (=> b!665169 (= res!432738 (contains!3315 acc!681 k0!2843))))

(declare-fun b!665170 () Bool)

(declare-fun e!381268 () Bool)

(assert (=> b!665170 (= e!381268 (contains!3315 acc!681 k0!2843))))

(declare-fun b!665171 () Bool)

(declare-fun res!432740 () Bool)

(assert (=> b!665171 (=> (not res!432740) (not e!381269))))

(assert (=> b!665171 (= res!432740 e!381273)))

(declare-fun res!432749 () Bool)

(assert (=> b!665171 (=> res!432749 e!381273)))

(assert (=> b!665171 (= res!432749 e!381268)))

(declare-fun res!432733 () Bool)

(assert (=> b!665171 (=> (not res!432733) (not e!381268))))

(assert (=> b!665171 (= res!432733 (bvsgt from!3004 i!1382))))

(declare-fun b!665172 () Bool)

(declare-fun lt!309913 () Unit!23210)

(assert (=> b!665172 (= e!381271 lt!309913)))

(declare-fun lt!309904 () Unit!23210)

(declare-fun lemmaListSubSeqRefl!0 (List!12738) Unit!23210)

(assert (=> b!665172 (= lt!309904 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665172 (subseq!54 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39009 List!12738 List!12738 (_ BitVec 32)) Unit!23210)

(declare-fun $colon$colon!186 (List!12738 (_ BitVec 64)) List!12738)

(assert (=> b!665172 (= lt!309913 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!186 acc!681 (select (arr!18697 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665172 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665173 () Bool)

(declare-fun res!432746 () Bool)

(assert (=> b!665173 (=> res!432746 e!381270)))

(assert (=> b!665173 (= res!432746 (not (contains!3315 lt!309907 k0!2843)))))

(declare-fun b!665174 () Bool)

(declare-fun res!432732 () Bool)

(assert (=> b!665174 (=> (not res!432732) (not e!381269))))

(assert (=> b!665174 (= res!432732 (noDuplicate!562 acc!681))))

(declare-fun b!665175 () Bool)

(declare-fun res!432736 () Bool)

(assert (=> b!665175 (=> (not res!432736) (not e!381269))))

(assert (=> b!665175 (= res!432736 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19061 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!665176 () Bool)

(assert (=> b!665176 (= e!381266 (not (contains!3315 acc!681 k0!2843)))))

(declare-fun b!665177 () Bool)

(assert (=> b!665177 (= e!381269 (not e!381270))))

(declare-fun res!432729 () Bool)

(assert (=> b!665177 (=> res!432729 e!381270)))

(assert (=> b!665177 (= res!432729 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!52 (List!12738 (_ BitVec 64)) List!12738)

(assert (=> b!665177 (= (-!52 lt!309907 k0!2843) acc!681)))

(assert (=> b!665177 (= lt!309907 ($colon$colon!186 acc!681 k0!2843))))

(declare-fun lt!309911 () Unit!23210)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12738) Unit!23210)

(assert (=> b!665177 (= lt!309911 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!665177 (subseq!54 acc!681 acc!681)))

(declare-fun lt!309910 () Unit!23210)

(assert (=> b!665177 (= lt!309910 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665177 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309908 () Unit!23210)

(assert (=> b!665177 (= lt!309908 e!381271)))

(declare-fun c!76579 () Bool)

(assert (=> b!665177 (= c!76579 (validKeyInArray!0 (select (arr!18697 a!3626) from!3004)))))

(declare-fun lt!309905 () Unit!23210)

(assert (=> b!665177 (= lt!309905 e!381267)))

(declare-fun c!76580 () Bool)

(assert (=> b!665177 (= c!76580 lt!309906)))

(assert (=> b!665177 (= lt!309906 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665177 (arrayContainsKey!0 (array!39010 (store (arr!18697 a!3626) i!1382 k0!2843) (size!19061 a!3626)) k0!2843 from!3004)))

(assert (= (and start!59962 res!432739) b!665174))

(assert (= (and b!665174 res!432732) b!665165))

(assert (= (and b!665165 res!432743) b!665154))

(assert (= (and b!665154 res!432744) b!665171))

(assert (= (and b!665171 res!432733) b!665170))

(assert (= (and b!665171 (not res!432749)) b!665155))

(assert (= (and b!665155 res!432735) b!665176))

(assert (= (and b!665171 res!432740) b!665160))

(assert (= (and b!665160 res!432745) b!665157))

(assert (= (and b!665157 res!432737) b!665167))

(assert (= (and b!665167 res!432731) b!665166))

(assert (= (and b!665166 res!432730) b!665162))

(assert (= (and b!665162 res!432742) b!665175))

(assert (= (and b!665175 res!432736) b!665177))

(assert (= (and b!665177 c!76580) b!665168))

(assert (= (and b!665177 (not c!76580)) b!665164))

(assert (= (and b!665177 c!76579) b!665172))

(assert (= (and b!665177 (not c!76579)) b!665163))

(assert (= (and b!665177 (not res!432729)) b!665156))

(assert (= (and b!665156 (not res!432747)) b!665159))

(assert (= (and b!665159 (not res!432741)) b!665169))

(assert (= (and b!665169 (not res!432738)) b!665153))

(assert (= (and b!665153 (not res!432734)) b!665173))

(assert (= (and b!665173 (not res!432746)) b!665161))

(assert (= (and b!665161 (not res!432748)) b!665158))

(declare-fun m!636277 () Bool)

(assert (=> b!665153 m!636277))

(declare-fun m!636279 () Bool)

(assert (=> b!665157 m!636279))

(declare-fun m!636281 () Bool)

(assert (=> b!665162 m!636281))

(declare-fun m!636283 () Bool)

(assert (=> b!665156 m!636283))

(declare-fun m!636285 () Bool)

(assert (=> b!665169 m!636285))

(declare-fun m!636287 () Bool)

(assert (=> b!665158 m!636287))

(declare-fun m!636289 () Bool)

(assert (=> b!665166 m!636289))

(declare-fun m!636291 () Bool)

(assert (=> b!665177 m!636291))

(declare-fun m!636293 () Bool)

(assert (=> b!665177 m!636293))

(declare-fun m!636295 () Bool)

(assert (=> b!665177 m!636295))

(declare-fun m!636297 () Bool)

(assert (=> b!665177 m!636297))

(declare-fun m!636299 () Bool)

(assert (=> b!665177 m!636299))

(declare-fun m!636301 () Bool)

(assert (=> b!665177 m!636301))

(assert (=> b!665177 m!636293))

(declare-fun m!636303 () Bool)

(assert (=> b!665177 m!636303))

(declare-fun m!636305 () Bool)

(assert (=> b!665177 m!636305))

(declare-fun m!636307 () Bool)

(assert (=> b!665177 m!636307))

(declare-fun m!636309 () Bool)

(assert (=> b!665177 m!636309))

(declare-fun m!636311 () Bool)

(assert (=> b!665177 m!636311))

(declare-fun m!636313 () Bool)

(assert (=> b!665174 m!636313))

(declare-fun m!636315 () Bool)

(assert (=> b!665161 m!636315))

(declare-fun m!636317 () Bool)

(assert (=> start!59962 m!636317))

(declare-fun m!636319 () Bool)

(assert (=> b!665160 m!636319))

(assert (=> b!665176 m!636285))

(declare-fun m!636321 () Bool)

(assert (=> b!665168 m!636321))

(assert (=> b!665170 m!636285))

(declare-fun m!636323 () Bool)

(assert (=> b!665173 m!636323))

(assert (=> b!665172 m!636291))

(assert (=> b!665172 m!636293))

(declare-fun m!636325 () Bool)

(assert (=> b!665172 m!636325))

(declare-fun m!636327 () Bool)

(assert (=> b!665172 m!636327))

(assert (=> b!665172 m!636293))

(assert (=> b!665172 m!636325))

(assert (=> b!665172 m!636305))

(assert (=> b!665172 m!636311))

(declare-fun m!636329 () Bool)

(assert (=> b!665165 m!636329))

(declare-fun m!636331 () Bool)

(assert (=> b!665154 m!636331))

(check-sat (not b!665177) (not b!665165) (not b!665168) (not b!665169) (not b!665170) (not b!665162) (not b!665158) (not b!665157) (not b!665176) (not b!665166) (not b!665154) (not b!665174) (not b!665153) (not b!665156) (not start!59962) (not b!665161) (not b!665160) (not b!665172) (not b!665173))
(check-sat)
