; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60942 () Bool)

(assert start!60942)

(declare-fun b!683279 () Bool)

(declare-fun e!389248 () Bool)

(declare-datatypes ((List!12909 0))(
  ( (Nil!12906) (Cons!12905 (h!13953 (_ BitVec 64)) (t!19144 List!12909)) )
))
(declare-fun acc!681 () List!12909)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3561 (List!12909 (_ BitVec 64)) Bool)

(assert (=> b!683279 (= e!389248 (not (contains!3561 acc!681 k0!2843)))))

(declare-fun b!683280 () Bool)

(declare-datatypes ((Unit!23976 0))(
  ( (Unit!23977) )
))
(declare-fun e!389250 () Unit!23976)

(declare-fun Unit!23978 () Unit!23976)

(assert (=> b!683280 (= e!389250 Unit!23978)))

(declare-fun lt!313861 () Unit!23976)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!39564 0))(
  ( (array!39565 (arr!18961 (Array (_ BitVec 32) (_ BitVec 64))) (size!19325 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39564)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39564 (_ BitVec 64) (_ BitVec 32)) Unit!23976)

(assert (=> b!683280 (= lt!313861 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!683280 false))

(declare-fun b!683281 () Bool)

(declare-fun res!449035 () Bool)

(declare-fun e!389252 () Bool)

(assert (=> b!683281 (=> (not res!449035) (not e!389252))))

(assert (=> b!683281 (= res!449035 (not (contains!3561 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683282 () Bool)

(declare-fun res!449041 () Bool)

(assert (=> b!683282 (=> (not res!449041) (not e!389252))))

(declare-fun arrayNoDuplicates!0 (array!39564 (_ BitVec 32) List!12909) Bool)

(assert (=> b!683282 (= res!449041 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!683283 () Bool)

(declare-fun Unit!23979 () Unit!23976)

(assert (=> b!683283 (= e!389250 Unit!23979)))

(declare-fun b!683284 () Bool)

(declare-fun res!449040 () Bool)

(assert (=> b!683284 (=> (not res!449040) (not e!389252))))

(assert (=> b!683284 (= res!449040 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12906))))

(declare-fun res!449038 () Bool)

(assert (=> start!60942 (=> (not res!449038) (not e!389252))))

(assert (=> start!60942 (= res!449038 (and (bvslt (size!19325 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19325 a!3626))))))

(assert (=> start!60942 e!389252))

(assert (=> start!60942 true))

(declare-fun array_inv!14820 (array!39564) Bool)

(assert (=> start!60942 (array_inv!14820 a!3626)))

(declare-fun b!683285 () Bool)

(declare-fun e!389251 () Unit!23976)

(declare-fun Unit!23980 () Unit!23976)

(assert (=> b!683285 (= e!389251 Unit!23980)))

(declare-fun b!683286 () Bool)

(declare-fun e!389247 () Bool)

(assert (=> b!683286 (= e!389247 e!389248)))

(declare-fun res!449028 () Bool)

(assert (=> b!683286 (=> (not res!449028) (not e!389248))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!683286 (= res!449028 (bvsle from!3004 i!1382))))

(declare-fun b!683287 () Bool)

(declare-fun res!449039 () Bool)

(assert (=> b!683287 (=> (not res!449039) (not e!389252))))

(assert (=> b!683287 (= res!449039 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19325 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!683288 () Bool)

(declare-fun e!389249 () Bool)

(assert (=> b!683288 (= e!389249 (contains!3561 acc!681 k0!2843))))

(declare-fun b!683289 () Bool)

(declare-fun res!449031 () Bool)

(assert (=> b!683289 (=> (not res!449031) (not e!389252))))

(assert (=> b!683289 (= res!449031 e!389247)))

(declare-fun res!449032 () Bool)

(assert (=> b!683289 (=> res!449032 e!389247)))

(assert (=> b!683289 (= res!449032 e!389249)))

(declare-fun res!449030 () Bool)

(assert (=> b!683289 (=> (not res!449030) (not e!389249))))

(assert (=> b!683289 (= res!449030 (bvsgt from!3004 i!1382))))

(declare-fun b!683290 () Bool)

(declare-fun res!449033 () Bool)

(assert (=> b!683290 (=> (not res!449033) (not e!389252))))

(declare-fun noDuplicate!835 (List!12909) Bool)

(assert (=> b!683290 (= res!449033 (noDuplicate!835 acc!681))))

(declare-fun b!683291 () Bool)

(declare-fun res!449037 () Bool)

(assert (=> b!683291 (=> (not res!449037) (not e!389252))))

(declare-fun arrayContainsKey!0 (array!39564 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!683291 (= res!449037 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!683292 () Bool)

(declare-fun res!449036 () Bool)

(assert (=> b!683292 (=> (not res!449036) (not e!389252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!683292 (= res!449036 (validKeyInArray!0 k0!2843))))

(declare-fun b!683293 () Bool)

(declare-fun res!449029 () Bool)

(assert (=> b!683293 (=> (not res!449029) (not e!389252))))

(assert (=> b!683293 (= res!449029 (not (contains!3561 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!683294 () Bool)

(declare-fun lt!313858 () Unit!23976)

(assert (=> b!683294 (= e!389251 lt!313858)))

(declare-fun lt!313859 () Unit!23976)

(declare-fun lemmaListSubSeqRefl!0 (List!12909) Unit!23976)

(assert (=> b!683294 (= lt!313859 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!170 (List!12909 List!12909) Bool)

(assert (=> b!683294 (subseq!170 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39564 List!12909 List!12909 (_ BitVec 32)) Unit!23976)

(declare-fun $colon$colon!332 (List!12909 (_ BitVec 64)) List!12909)

(assert (=> b!683294 (= lt!313858 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!332 acc!681 (select (arr!18961 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683294 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!683295 () Bool)

(declare-fun res!449034 () Bool)

(assert (=> b!683295 (=> (not res!449034) (not e!389252))))

(assert (=> b!683295 (= res!449034 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19325 a!3626))))))

(declare-fun b!683296 () Bool)

(assert (=> b!683296 (= e!389252 (not true))))

(declare-fun -!134 (List!12909 (_ BitVec 64)) List!12909)

(assert (=> b!683296 (= (-!134 ($colon$colon!332 acc!681 k0!2843) k0!2843) acc!681)))

(declare-fun lt!313860 () Unit!23976)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12909) Unit!23976)

(assert (=> b!683296 (= lt!313860 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!683296 (subseq!170 acc!681 acc!681)))

(declare-fun lt!313857 () Unit!23976)

(assert (=> b!683296 (= lt!313857 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!683296 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313855 () Unit!23976)

(assert (=> b!683296 (= lt!313855 e!389251)))

(declare-fun c!77495 () Bool)

(assert (=> b!683296 (= c!77495 (validKeyInArray!0 (select (arr!18961 a!3626) from!3004)))))

(declare-fun lt!313856 () Unit!23976)

(assert (=> b!683296 (= lt!313856 e!389250)))

(declare-fun c!77494 () Bool)

(assert (=> b!683296 (= c!77494 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!683296 (arrayContainsKey!0 (array!39565 (store (arr!18961 a!3626) i!1382 k0!2843) (size!19325 a!3626)) k0!2843 from!3004)))

(assert (= (and start!60942 res!449038) b!683290))

(assert (= (and b!683290 res!449033) b!683281))

(assert (= (and b!683281 res!449035) b!683293))

(assert (= (and b!683293 res!449029) b!683289))

(assert (= (and b!683289 res!449030) b!683288))

(assert (= (and b!683289 (not res!449032)) b!683286))

(assert (= (and b!683286 res!449028) b!683279))

(assert (= (and b!683289 res!449031) b!683284))

(assert (= (and b!683284 res!449040) b!683282))

(assert (= (and b!683282 res!449041) b!683295))

(assert (= (and b!683295 res!449034) b!683292))

(assert (= (and b!683292 res!449036) b!683291))

(assert (= (and b!683291 res!449037) b!683287))

(assert (= (and b!683287 res!449039) b!683296))

(assert (= (and b!683296 c!77494) b!683280))

(assert (= (and b!683296 (not c!77494)) b!683283))

(assert (= (and b!683296 c!77495) b!683294))

(assert (= (and b!683296 (not c!77495)) b!683285))

(declare-fun m!648349 () Bool)

(assert (=> b!683294 m!648349))

(declare-fun m!648351 () Bool)

(assert (=> b!683294 m!648351))

(declare-fun m!648353 () Bool)

(assert (=> b!683294 m!648353))

(declare-fun m!648355 () Bool)

(assert (=> b!683294 m!648355))

(assert (=> b!683294 m!648351))

(assert (=> b!683294 m!648353))

(declare-fun m!648357 () Bool)

(assert (=> b!683294 m!648357))

(declare-fun m!648359 () Bool)

(assert (=> b!683294 m!648359))

(declare-fun m!648361 () Bool)

(assert (=> b!683293 m!648361))

(declare-fun m!648363 () Bool)

(assert (=> b!683291 m!648363))

(declare-fun m!648365 () Bool)

(assert (=> b!683290 m!648365))

(declare-fun m!648367 () Bool)

(assert (=> b!683284 m!648367))

(declare-fun m!648369 () Bool)

(assert (=> b!683282 m!648369))

(declare-fun m!648371 () Bool)

(assert (=> b!683288 m!648371))

(declare-fun m!648373 () Bool)

(assert (=> b!683281 m!648373))

(declare-fun m!648375 () Bool)

(assert (=> b!683292 m!648375))

(assert (=> b!683279 m!648371))

(declare-fun m!648377 () Bool)

(assert (=> start!60942 m!648377))

(declare-fun m!648379 () Bool)

(assert (=> b!683280 m!648379))

(declare-fun m!648381 () Bool)

(assert (=> b!683296 m!648381))

(declare-fun m!648383 () Bool)

(assert (=> b!683296 m!648383))

(assert (=> b!683296 m!648349))

(assert (=> b!683296 m!648351))

(declare-fun m!648385 () Bool)

(assert (=> b!683296 m!648385))

(declare-fun m!648387 () Bool)

(assert (=> b!683296 m!648387))

(assert (=> b!683296 m!648357))

(declare-fun m!648389 () Bool)

(assert (=> b!683296 m!648389))

(assert (=> b!683296 m!648381))

(assert (=> b!683296 m!648351))

(declare-fun m!648391 () Bool)

(assert (=> b!683296 m!648391))

(declare-fun m!648393 () Bool)

(assert (=> b!683296 m!648393))

(assert (=> b!683296 m!648359))

(check-sat (not b!683296) (not b!683294) (not b!683281) (not b!683292) (not b!683284) (not b!683280) (not start!60942) (not b!683282) (not b!683279) (not b!683288) (not b!683291) (not b!683290) (not b!683293))
(check-sat)
