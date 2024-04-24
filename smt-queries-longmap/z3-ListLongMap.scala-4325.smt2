; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60036 () Bool)

(assert start!60036)

(declare-fun b!665977 () Bool)

(declare-fun res!433358 () Bool)

(declare-fun e!381600 () Bool)

(assert (=> b!665977 (=> res!433358 e!381600)))

(declare-datatypes ((List!12648 0))(
  ( (Nil!12645) (Cons!12644 (h!13692 (_ BitVec 64)) (t!18868 List!12648)) )
))
(declare-fun lt!310253 () List!12648)

(declare-fun noDuplicate!574 (List!12648) Bool)

(assert (=> b!665977 (= res!433358 (not (noDuplicate!574 lt!310253)))))

(declare-fun b!665978 () Bool)

(declare-fun res!433347 () Bool)

(declare-fun e!381604 () Bool)

(assert (=> b!665978 (=> (not res!433347) (not e!381604))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39021 0))(
  ( (array!39022 (arr!18700 (Array (_ BitVec 32) (_ BitVec 64))) (size!19064 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39021)

(assert (=> b!665978 (= res!433347 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19064 a!3626))))))

(declare-fun res!433346 () Bool)

(assert (=> start!60036 (=> (not res!433346) (not e!381604))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60036 (= res!433346 (and (bvslt (size!19064 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19064 a!3626))))))

(assert (=> start!60036 e!381604))

(assert (=> start!60036 true))

(declare-fun array_inv!14559 (array!39021) Bool)

(assert (=> start!60036 (array_inv!14559 a!3626)))

(declare-fun b!665979 () Bool)

(declare-fun res!433353 () Bool)

(assert (=> b!665979 (=> (not res!433353) (not e!381604))))

(declare-fun arrayNoDuplicates!0 (array!39021 (_ BitVec 32) List!12648) Bool)

(assert (=> b!665979 (= res!433353 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12645))))

(declare-fun b!665980 () Bool)

(declare-fun res!433364 () Bool)

(assert (=> b!665980 (=> res!433364 e!381600)))

(declare-fun contains!3300 (List!12648 (_ BitVec 64)) Bool)

(assert (=> b!665980 (= res!433364 (contains!3300 lt!310253 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665981 () Bool)

(declare-fun e!381601 () Bool)

(declare-fun e!381599 () Bool)

(assert (=> b!665981 (= e!381601 e!381599)))

(declare-fun res!433360 () Bool)

(assert (=> b!665981 (=> (not res!433360) (not e!381599))))

(assert (=> b!665981 (= res!433360 (bvsle from!3004 i!1382))))

(declare-fun b!665982 () Bool)

(declare-datatypes ((Unit!23229 0))(
  ( (Unit!23230) )
))
(declare-fun e!381606 () Unit!23229)

(declare-fun Unit!23231 () Unit!23229)

(assert (=> b!665982 (= e!381606 Unit!23231)))

(declare-fun b!665983 () Bool)

(declare-fun res!433349 () Bool)

(assert (=> b!665983 (=> (not res!433349) (not e!381604))))

(declare-fun acc!681 () List!12648)

(assert (=> b!665983 (= res!433349 (not (contains!3300 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!665984 () Bool)

(declare-fun res!433357 () Bool)

(assert (=> b!665984 (=> res!433357 e!381600)))

(declare-fun subseq!62 (List!12648 List!12648) Bool)

(assert (=> b!665984 (= res!433357 (not (subseq!62 acc!681 lt!310253)))))

(declare-fun b!665985 () Bool)

(declare-fun res!433355 () Bool)

(assert (=> b!665985 (=> (not res!433355) (not e!381604))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!665985 (= res!433355 (validKeyInArray!0 k0!2843))))

(declare-fun b!665986 () Bool)

(declare-fun res!433366 () Bool)

(assert (=> b!665986 (=> res!433366 e!381600)))

(assert (=> b!665986 (= res!433366 (not (contains!3300 lt!310253 k0!2843)))))

(declare-fun b!665987 () Bool)

(declare-fun res!433362 () Bool)

(assert (=> b!665987 (=> (not res!433362) (not e!381604))))

(assert (=> b!665987 (= res!433362 e!381601)))

(declare-fun res!433361 () Bool)

(assert (=> b!665987 (=> res!433361 e!381601)))

(declare-fun e!381602 () Bool)

(assert (=> b!665987 (= res!433361 e!381602)))

(declare-fun res!433352 () Bool)

(assert (=> b!665987 (=> (not res!433352) (not e!381602))))

(assert (=> b!665987 (= res!433352 (bvsgt from!3004 i!1382))))

(declare-fun b!665988 () Bool)

(declare-fun res!433351 () Bool)

(assert (=> b!665988 (=> (not res!433351) (not e!381604))))

(assert (=> b!665988 (= res!433351 (noDuplicate!574 acc!681))))

(declare-fun b!665989 () Bool)

(declare-fun lt!310249 () Unit!23229)

(assert (=> b!665989 (= e!381606 lt!310249)))

(declare-fun lt!310248 () Unit!23229)

(declare-fun lemmaListSubSeqRefl!0 (List!12648) Unit!23229)

(assert (=> b!665989 (= lt!310248 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665989 (subseq!62 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39021 List!12648 List!12648 (_ BitVec 32)) Unit!23229)

(declare-fun $colon$colon!191 (List!12648 (_ BitVec 64)) List!12648)

(assert (=> b!665989 (= lt!310249 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!191 acc!681 (select (arr!18700 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665989 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!665990 () Bool)

(assert (=> b!665990 (= e!381600 true)))

(declare-fun lt!310251 () Bool)

(assert (=> b!665990 (= lt!310251 (contains!3300 lt!310253 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!665991 () Bool)

(declare-fun e!381605 () Unit!23229)

(declare-fun Unit!23232 () Unit!23229)

(assert (=> b!665991 (= e!381605 Unit!23232)))

(declare-fun lt!310254 () Unit!23229)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39021 (_ BitVec 64) (_ BitVec 32)) Unit!23229)

(assert (=> b!665991 (= lt!310254 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!665991 false))

(declare-fun b!665992 () Bool)

(assert (=> b!665992 (= e!381602 (contains!3300 acc!681 k0!2843))))

(declare-fun b!665993 () Bool)

(assert (=> b!665993 (= e!381604 (not e!381600))))

(declare-fun res!433356 () Bool)

(assert (=> b!665993 (=> res!433356 e!381600)))

(assert (=> b!665993 (= res!433356 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!59 (List!12648 (_ BitVec 64)) List!12648)

(assert (=> b!665993 (= (-!59 lt!310253 k0!2843) acc!681)))

(assert (=> b!665993 (= lt!310253 ($colon$colon!191 acc!681 k0!2843))))

(declare-fun lt!310252 () Unit!23229)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12648) Unit!23229)

(assert (=> b!665993 (= lt!310252 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!665993 (subseq!62 acc!681 acc!681)))

(declare-fun lt!310247 () Unit!23229)

(assert (=> b!665993 (= lt!310247 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!665993 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310255 () Unit!23229)

(assert (=> b!665993 (= lt!310255 e!381606)))

(declare-fun c!76685 () Bool)

(assert (=> b!665993 (= c!76685 (validKeyInArray!0 (select (arr!18700 a!3626) from!3004)))))

(declare-fun lt!310250 () Unit!23229)

(assert (=> b!665993 (= lt!310250 e!381605)))

(declare-fun c!76684 () Bool)

(declare-fun lt!310246 () Bool)

(assert (=> b!665993 (= c!76684 lt!310246)))

(declare-fun arrayContainsKey!0 (array!39021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!665993 (= lt!310246 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!665993 (arrayContainsKey!0 (array!39022 (store (arr!18700 a!3626) i!1382 k0!2843) (size!19064 a!3626)) k0!2843 from!3004)))

(declare-fun b!665994 () Bool)

(declare-fun res!433348 () Bool)

(assert (=> b!665994 (=> (not res!433348) (not e!381604))))

(assert (=> b!665994 (= res!433348 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19064 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!665995 () Bool)

(declare-fun res!433354 () Bool)

(assert (=> b!665995 (=> (not res!433354) (not e!381604))))

(assert (=> b!665995 (= res!433354 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!665996 () Bool)

(declare-fun res!433363 () Bool)

(assert (=> b!665996 (=> res!433363 e!381600)))

(assert (=> b!665996 (= res!433363 (contains!3300 acc!681 k0!2843))))

(declare-fun b!665997 () Bool)

(declare-fun Unit!23233 () Unit!23229)

(assert (=> b!665997 (= e!381605 Unit!23233)))

(declare-fun b!665998 () Bool)

(declare-fun res!433350 () Bool)

(assert (=> b!665998 (=> (not res!433350) (not e!381604))))

(assert (=> b!665998 (= res!433350 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!665999 () Bool)

(declare-fun res!433359 () Bool)

(assert (=> b!665999 (=> res!433359 e!381600)))

(assert (=> b!665999 (= res!433359 lt!310246)))

(declare-fun b!666000 () Bool)

(assert (=> b!666000 (= e!381599 (not (contains!3300 acc!681 k0!2843)))))

(declare-fun b!666001 () Bool)

(declare-fun res!433365 () Bool)

(assert (=> b!666001 (=> (not res!433365) (not e!381604))))

(assert (=> b!666001 (= res!433365 (not (contains!3300 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60036 res!433346) b!665988))

(assert (= (and b!665988 res!433351) b!666001))

(assert (= (and b!666001 res!433365) b!665983))

(assert (= (and b!665983 res!433349) b!665987))

(assert (= (and b!665987 res!433352) b!665992))

(assert (= (and b!665987 (not res!433361)) b!665981))

(assert (= (and b!665981 res!433360) b!666000))

(assert (= (and b!665987 res!433362) b!665979))

(assert (= (and b!665979 res!433353) b!665998))

(assert (= (and b!665998 res!433350) b!665978))

(assert (= (and b!665978 res!433347) b!665985))

(assert (= (and b!665985 res!433355) b!665995))

(assert (= (and b!665995 res!433354) b!665994))

(assert (= (and b!665994 res!433348) b!665993))

(assert (= (and b!665993 c!76684) b!665991))

(assert (= (and b!665993 (not c!76684)) b!665997))

(assert (= (and b!665993 c!76685) b!665989))

(assert (= (and b!665993 (not c!76685)) b!665982))

(assert (= (and b!665993 (not res!433356)) b!665977))

(assert (= (and b!665977 (not res!433358)) b!665999))

(assert (= (and b!665999 (not res!433359)) b!665996))

(assert (= (and b!665996 (not res!433363)) b!665984))

(assert (= (and b!665984 (not res!433357)) b!665986))

(assert (= (and b!665986 (not res!433366)) b!665980))

(assert (= (and b!665980 (not res!433364)) b!665990))

(declare-fun m!637423 () Bool)

(assert (=> b!665988 m!637423))

(declare-fun m!637425 () Bool)

(assert (=> b!665989 m!637425))

(declare-fun m!637427 () Bool)

(assert (=> b!665989 m!637427))

(declare-fun m!637429 () Bool)

(assert (=> b!665989 m!637429))

(declare-fun m!637431 () Bool)

(assert (=> b!665989 m!637431))

(assert (=> b!665989 m!637427))

(assert (=> b!665989 m!637429))

(declare-fun m!637433 () Bool)

(assert (=> b!665989 m!637433))

(declare-fun m!637435 () Bool)

(assert (=> b!665989 m!637435))

(assert (=> b!665993 m!637425))

(assert (=> b!665993 m!637427))

(declare-fun m!637437 () Bool)

(assert (=> b!665993 m!637437))

(declare-fun m!637439 () Bool)

(assert (=> b!665993 m!637439))

(assert (=> b!665993 m!637433))

(declare-fun m!637441 () Bool)

(assert (=> b!665993 m!637441))

(declare-fun m!637443 () Bool)

(assert (=> b!665993 m!637443))

(declare-fun m!637445 () Bool)

(assert (=> b!665993 m!637445))

(assert (=> b!665993 m!637427))

(declare-fun m!637447 () Bool)

(assert (=> b!665993 m!637447))

(declare-fun m!637449 () Bool)

(assert (=> b!665993 m!637449))

(assert (=> b!665993 m!637435))

(declare-fun m!637451 () Bool)

(assert (=> b!665996 m!637451))

(declare-fun m!637453 () Bool)

(assert (=> b!665980 m!637453))

(declare-fun m!637455 () Bool)

(assert (=> b!665979 m!637455))

(declare-fun m!637457 () Bool)

(assert (=> b!665990 m!637457))

(declare-fun m!637459 () Bool)

(assert (=> b!665977 m!637459))

(declare-fun m!637461 () Bool)

(assert (=> b!665983 m!637461))

(declare-fun m!637463 () Bool)

(assert (=> b!665998 m!637463))

(assert (=> b!665992 m!637451))

(assert (=> b!666000 m!637451))

(declare-fun m!637465 () Bool)

(assert (=> b!665991 m!637465))

(declare-fun m!637467 () Bool)

(assert (=> b!665985 m!637467))

(declare-fun m!637469 () Bool)

(assert (=> b!666001 m!637469))

(declare-fun m!637471 () Bool)

(assert (=> start!60036 m!637471))

(declare-fun m!637473 () Bool)

(assert (=> b!665995 m!637473))

(declare-fun m!637475 () Bool)

(assert (=> b!665986 m!637475))

(declare-fun m!637477 () Bool)

(assert (=> b!665984 m!637477))

(check-sat (not b!665996) (not b!665988) (not b!666000) (not b!665980) (not b!665979) (not b!665992) (not b!665991) (not b!665993) (not b!665983) (not b!665995) (not start!60036) (not b!665986) (not b!665998) (not b!666001) (not b!665977) (not b!665990) (not b!665985) (not b!665989) (not b!665984))
(check-sat)
