; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59994 () Bool)

(assert start!59994)

(declare-fun b!664402 () Bool)

(declare-fun res!432023 () Bool)

(declare-fun e!381095 () Bool)

(assert (=> b!664402 (=> (not res!432023) (not e!381095))))

(declare-datatypes ((List!12627 0))(
  ( (Nil!12624) (Cons!12623 (h!13671 (_ BitVec 64)) (t!18847 List!12627)) )
))
(declare-fun acc!681 () List!12627)

(declare-fun noDuplicate!553 (List!12627) Bool)

(assert (=> b!664402 (= res!432023 (noDuplicate!553 acc!681))))

(declare-fun b!664403 () Bool)

(declare-fun e!381098 () Bool)

(declare-fun e!381097 () Bool)

(assert (=> b!664403 (= e!381098 e!381097)))

(declare-fun res!432028 () Bool)

(assert (=> b!664403 (=> (not res!432028) (not e!381097))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!664403 (= res!432028 (bvsle from!3004 i!1382))))

(declare-fun b!664404 () Bool)

(declare-fun res!432034 () Bool)

(declare-fun e!381099 () Bool)

(assert (=> b!664404 (=> res!432034 e!381099)))

(declare-fun lt!309616 () List!12627)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3279 (List!12627 (_ BitVec 64)) Bool)

(assert (=> b!664404 (= res!432034 (not (contains!3279 lt!309616 k0!2843)))))

(declare-fun b!664405 () Bool)

(assert (=> b!664405 (= e!381099 true)))

(declare-fun lt!309617 () Bool)

(assert (=> b!664405 (= lt!309617 (contains!3279 lt!309616 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664406 () Bool)

(declare-datatypes ((Unit!23124 0))(
  ( (Unit!23125) )
))
(declare-fun e!381100 () Unit!23124)

(declare-fun lt!309619 () Unit!23124)

(assert (=> b!664406 (= e!381100 lt!309619)))

(declare-fun lt!309625 () Unit!23124)

(declare-fun lemmaListSubSeqRefl!0 (List!12627) Unit!23124)

(assert (=> b!664406 (= lt!309625 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!41 (List!12627 List!12627) Bool)

(assert (=> b!664406 (subseq!41 acc!681 acc!681)))

(declare-datatypes ((array!38979 0))(
  ( (array!38980 (arr!18679 (Array (_ BitVec 32) (_ BitVec 64))) (size!19043 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38979)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38979 List!12627 List!12627 (_ BitVec 32)) Unit!23124)

(declare-fun $colon$colon!170 (List!12627 (_ BitVec 64)) List!12627)

(assert (=> b!664406 (= lt!309619 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!170 acc!681 (select (arr!18679 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!38979 (_ BitVec 32) List!12627) Bool)

(assert (=> b!664406 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!664407 () Bool)

(declare-fun res!432024 () Bool)

(assert (=> b!664407 (=> res!432024 e!381099)))

(assert (=> b!664407 (= res!432024 (contains!3279 lt!309616 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664408 () Bool)

(declare-fun res!432035 () Bool)

(assert (=> b!664408 (=> (not res!432035) (not e!381095))))

(assert (=> b!664408 (= res!432035 (not (contains!3279 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664409 () Bool)

(assert (=> b!664409 (= e!381097 (not (contains!3279 acc!681 k0!2843)))))

(declare-fun b!664410 () Bool)

(declare-fun e!381101 () Bool)

(assert (=> b!664410 (= e!381101 (contains!3279 acc!681 k0!2843))))

(declare-fun b!664411 () Bool)

(declare-fun Unit!23126 () Unit!23124)

(assert (=> b!664411 (= e!381100 Unit!23126)))

(declare-fun b!664412 () Bool)

(declare-fun res!432039 () Bool)

(assert (=> b!664412 (=> (not res!432039) (not e!381095))))

(assert (=> b!664412 (= res!432039 e!381098)))

(declare-fun res!432025 () Bool)

(assert (=> b!664412 (=> res!432025 e!381098)))

(assert (=> b!664412 (= res!432025 e!381101)))

(declare-fun res!432041 () Bool)

(assert (=> b!664412 (=> (not res!432041) (not e!381101))))

(assert (=> b!664412 (= res!432041 (bvsgt from!3004 i!1382))))

(declare-fun b!664413 () Bool)

(declare-fun res!432032 () Bool)

(assert (=> b!664413 (=> (not res!432032) (not e!381095))))

(assert (=> b!664413 (= res!432032 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19043 a!3626))))))

(declare-fun res!432033 () Bool)

(assert (=> start!59994 (=> (not res!432033) (not e!381095))))

(assert (=> start!59994 (= res!432033 (and (bvslt (size!19043 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19043 a!3626))))))

(assert (=> start!59994 e!381095))

(assert (=> start!59994 true))

(declare-fun array_inv!14538 (array!38979) Bool)

(assert (=> start!59994 (array_inv!14538 a!3626)))

(declare-fun b!664414 () Bool)

(declare-fun res!432026 () Bool)

(assert (=> b!664414 (=> (not res!432026) (not e!381095))))

(assert (=> b!664414 (= res!432026 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!664415 () Bool)

(declare-fun res!432037 () Bool)

(assert (=> b!664415 (=> (not res!432037) (not e!381095))))

(assert (=> b!664415 (= res!432037 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12624))))

(declare-fun b!664416 () Bool)

(declare-fun res!432031 () Bool)

(assert (=> b!664416 (=> res!432031 e!381099)))

(declare-fun lt!309622 () Bool)

(assert (=> b!664416 (= res!432031 lt!309622)))

(declare-fun b!664417 () Bool)

(declare-fun e!381096 () Unit!23124)

(declare-fun Unit!23127 () Unit!23124)

(assert (=> b!664417 (= e!381096 Unit!23127)))

(declare-fun lt!309623 () Unit!23124)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38979 (_ BitVec 64) (_ BitVec 32)) Unit!23124)

(assert (=> b!664417 (= lt!309623 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!664417 false))

(declare-fun b!664418 () Bool)

(declare-fun res!432038 () Bool)

(assert (=> b!664418 (=> (not res!432038) (not e!381095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664418 (= res!432038 (validKeyInArray!0 k0!2843))))

(declare-fun b!664419 () Bool)

(declare-fun res!432029 () Bool)

(assert (=> b!664419 (=> (not res!432029) (not e!381095))))

(declare-fun arrayContainsKey!0 (array!38979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664419 (= res!432029 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!664420 () Bool)

(declare-fun res!432036 () Bool)

(assert (=> b!664420 (=> res!432036 e!381099)))

(assert (=> b!664420 (= res!432036 (not (subseq!41 acc!681 lt!309616)))))

(declare-fun b!664421 () Bool)

(assert (=> b!664421 (= e!381095 (not e!381099))))

(declare-fun res!432042 () Bool)

(assert (=> b!664421 (=> res!432042 e!381099)))

(assert (=> b!664421 (= res!432042 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!38 (List!12627 (_ BitVec 64)) List!12627)

(assert (=> b!664421 (= (-!38 lt!309616 k0!2843) acc!681)))

(assert (=> b!664421 (= lt!309616 ($colon$colon!170 acc!681 k0!2843))))

(declare-fun lt!309621 () Unit!23124)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12627) Unit!23124)

(assert (=> b!664421 (= lt!309621 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!664421 (subseq!41 acc!681 acc!681)))

(declare-fun lt!309618 () Unit!23124)

(assert (=> b!664421 (= lt!309618 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664421 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309624 () Unit!23124)

(assert (=> b!664421 (= lt!309624 e!381100)))

(declare-fun c!76558 () Bool)

(assert (=> b!664421 (= c!76558 (validKeyInArray!0 (select (arr!18679 a!3626) from!3004)))))

(declare-fun lt!309620 () Unit!23124)

(assert (=> b!664421 (= lt!309620 e!381096)))

(declare-fun c!76559 () Bool)

(assert (=> b!664421 (= c!76559 lt!309622)))

(assert (=> b!664421 (= lt!309622 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664421 (arrayContainsKey!0 (array!38980 (store (arr!18679 a!3626) i!1382 k0!2843) (size!19043 a!3626)) k0!2843 from!3004)))

(declare-fun b!664422 () Bool)

(declare-fun res!432030 () Bool)

(assert (=> b!664422 (=> (not res!432030) (not e!381095))))

(assert (=> b!664422 (= res!432030 (not (contains!3279 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664423 () Bool)

(declare-fun res!432043 () Bool)

(assert (=> b!664423 (=> (not res!432043) (not e!381095))))

(assert (=> b!664423 (= res!432043 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19043 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664424 () Bool)

(declare-fun res!432027 () Bool)

(assert (=> b!664424 (=> res!432027 e!381099)))

(assert (=> b!664424 (= res!432027 (contains!3279 acc!681 k0!2843))))

(declare-fun b!664425 () Bool)

(declare-fun Unit!23128 () Unit!23124)

(assert (=> b!664425 (= e!381096 Unit!23128)))

(declare-fun b!664426 () Bool)

(declare-fun res!432040 () Bool)

(assert (=> b!664426 (=> res!432040 e!381099)))

(assert (=> b!664426 (= res!432040 (not (noDuplicate!553 lt!309616)))))

(assert (= (and start!59994 res!432033) b!664402))

(assert (= (and b!664402 res!432023) b!664408))

(assert (= (and b!664408 res!432035) b!664422))

(assert (= (and b!664422 res!432030) b!664412))

(assert (= (and b!664412 res!432041) b!664410))

(assert (= (and b!664412 (not res!432025)) b!664403))

(assert (= (and b!664403 res!432028) b!664409))

(assert (= (and b!664412 res!432039) b!664415))

(assert (= (and b!664415 res!432037) b!664414))

(assert (= (and b!664414 res!432026) b!664413))

(assert (= (and b!664413 res!432032) b!664418))

(assert (= (and b!664418 res!432038) b!664419))

(assert (= (and b!664419 res!432029) b!664423))

(assert (= (and b!664423 res!432043) b!664421))

(assert (= (and b!664421 c!76559) b!664417))

(assert (= (and b!664421 (not c!76559)) b!664425))

(assert (= (and b!664421 c!76558) b!664406))

(assert (= (and b!664421 (not c!76558)) b!664411))

(assert (= (and b!664421 (not res!432042)) b!664426))

(assert (= (and b!664426 (not res!432040)) b!664416))

(assert (= (and b!664416 (not res!432031)) b!664424))

(assert (= (and b!664424 (not res!432027)) b!664420))

(assert (= (and b!664420 (not res!432036)) b!664404))

(assert (= (and b!664404 (not res!432034)) b!664407))

(assert (= (and b!664407 (not res!432024)) b!664405))

(declare-fun m!636247 () Bool)

(assert (=> b!664404 m!636247))

(declare-fun m!636249 () Bool)

(assert (=> b!664414 m!636249))

(declare-fun m!636251 () Bool)

(assert (=> b!664407 m!636251))

(declare-fun m!636253 () Bool)

(assert (=> b!664417 m!636253))

(declare-fun m!636255 () Bool)

(assert (=> b!664420 m!636255))

(declare-fun m!636257 () Bool)

(assert (=> b!664421 m!636257))

(declare-fun m!636259 () Bool)

(assert (=> b!664421 m!636259))

(declare-fun m!636261 () Bool)

(assert (=> b!664421 m!636261))

(declare-fun m!636263 () Bool)

(assert (=> b!664421 m!636263))

(declare-fun m!636265 () Bool)

(assert (=> b!664421 m!636265))

(declare-fun m!636267 () Bool)

(assert (=> b!664421 m!636267))

(declare-fun m!636269 () Bool)

(assert (=> b!664421 m!636269))

(declare-fun m!636271 () Bool)

(assert (=> b!664421 m!636271))

(assert (=> b!664421 m!636259))

(declare-fun m!636273 () Bool)

(assert (=> b!664421 m!636273))

(declare-fun m!636275 () Bool)

(assert (=> b!664421 m!636275))

(declare-fun m!636277 () Bool)

(assert (=> b!664421 m!636277))

(declare-fun m!636279 () Bool)

(assert (=> start!59994 m!636279))

(declare-fun m!636281 () Bool)

(assert (=> b!664415 m!636281))

(declare-fun m!636283 () Bool)

(assert (=> b!664402 m!636283))

(declare-fun m!636285 () Bool)

(assert (=> b!664409 m!636285))

(assert (=> b!664406 m!636257))

(assert (=> b!664406 m!636259))

(declare-fun m!636287 () Bool)

(assert (=> b!664406 m!636287))

(declare-fun m!636289 () Bool)

(assert (=> b!664406 m!636289))

(assert (=> b!664406 m!636259))

(assert (=> b!664406 m!636287))

(assert (=> b!664406 m!636267))

(assert (=> b!664406 m!636277))

(declare-fun m!636291 () Bool)

(assert (=> b!664422 m!636291))

(declare-fun m!636293 () Bool)

(assert (=> b!664418 m!636293))

(assert (=> b!664424 m!636285))

(declare-fun m!636295 () Bool)

(assert (=> b!664419 m!636295))

(declare-fun m!636297 () Bool)

(assert (=> b!664426 m!636297))

(declare-fun m!636299 () Bool)

(assert (=> b!664405 m!636299))

(declare-fun m!636301 () Bool)

(assert (=> b!664408 m!636301))

(assert (=> b!664410 m!636285))

(check-sat (not start!59994) (not b!664426) (not b!664417) (not b!664422) (not b!664404) (not b!664419) (not b!664424) (not b!664410) (not b!664421) (not b!664414) (not b!664415) (not b!664409) (not b!664406) (not b!664402) (not b!664418) (not b!664407) (not b!664420) (not b!664405) (not b!664408))
(check-sat)
