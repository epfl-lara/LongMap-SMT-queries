; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60228 () Bool)

(assert start!60228)

(declare-fun b!672486 () Bool)

(declare-fun res!439024 () Bool)

(declare-fun e!384210 () Bool)

(assert (=> b!672486 (=> (not res!439024) (not e!384210))))

(declare-datatypes ((array!39213 0))(
  ( (array!39214 (arr!18796 (Array (_ BitVec 32) (_ BitVec 64))) (size!19160 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39213)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12744 0))(
  ( (Nil!12741) (Cons!12740 (h!13788 (_ BitVec 64)) (t!18964 List!12744)) )
))
(declare-fun acc!681 () List!12744)

(declare-fun arrayNoDuplicates!0 (array!39213 (_ BitVec 32) List!12744) Bool)

(assert (=> b!672486 (= res!439024 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!672487 () Bool)

(declare-datatypes ((Unit!23595 0))(
  ( (Unit!23596) )
))
(declare-fun e!384214 () Unit!23595)

(declare-fun Unit!23597 () Unit!23595)

(assert (=> b!672487 (= e!384214 Unit!23597)))

(declare-fun b!672488 () Bool)

(declare-fun e!384207 () Bool)

(declare-fun e!384216 () Bool)

(assert (=> b!672488 (= e!384207 e!384216)))

(declare-fun res!439031 () Bool)

(assert (=> b!672488 (=> (not res!439031) (not e!384216))))

(assert (=> b!672488 (= res!439031 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!312387 () List!12744)

(declare-fun $colon$colon!266 (List!12744 (_ BitVec 64)) List!12744)

(assert (=> b!672488 (= lt!312387 ($colon$colon!266 acc!681 (select (arr!18796 a!3626) from!3004)))))

(declare-fun b!672489 () Bool)

(declare-fun res!439014 () Bool)

(assert (=> b!672489 (=> (not res!439014) (not e!384210))))

(declare-fun contains!3396 (List!12744 (_ BitVec 64)) Bool)

(assert (=> b!672489 (= res!439014 (not (contains!3396 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672490 () Bool)

(assert (=> b!672490 (= e!384210 e!384207)))

(declare-fun res!439021 () Bool)

(assert (=> b!672490 (=> (not res!439021) (not e!384207))))

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!672490 (= res!439021 (not (= (select (arr!18796 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312385 () Unit!23595)

(assert (=> b!672490 (= lt!312385 e!384214)))

(declare-fun c!77105 () Bool)

(assert (=> b!672490 (= c!77105 (= (select (arr!18796 a!3626) from!3004) k0!2843))))

(declare-fun b!672491 () Bool)

(declare-fun res!439015 () Bool)

(assert (=> b!672491 (=> (not res!439015) (not e!384210))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!672491 (= res!439015 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19160 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!672492 () Bool)

(declare-fun res!439016 () Bool)

(assert (=> b!672492 (=> (not res!439016) (not e!384210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!672492 (= res!439016 (validKeyInArray!0 (select (arr!18796 a!3626) from!3004)))))

(declare-fun b!672494 () Bool)

(declare-fun res!439018 () Bool)

(assert (=> b!672494 (=> (not res!439018) (not e!384210))))

(declare-fun arrayContainsKey!0 (array!39213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!672494 (= res!439018 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!672495 () Bool)

(declare-fun res!439020 () Bool)

(assert (=> b!672495 (=> (not res!439020) (not e!384216))))

(assert (=> b!672495 (= res!439020 (not (contains!3396 lt!312387 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672496 () Bool)

(declare-fun Unit!23598 () Unit!23595)

(assert (=> b!672496 (= e!384214 Unit!23598)))

(assert (=> b!672496 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312388 () Unit!23595)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39213 (_ BitVec 64) (_ BitVec 32)) Unit!23595)

(assert (=> b!672496 (= lt!312388 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!672496 false))

(declare-fun b!672497 () Bool)

(declare-fun res!439030 () Bool)

(assert (=> b!672497 (=> (not res!439030) (not e!384216))))

(declare-fun noDuplicate!670 (List!12744) Bool)

(assert (=> b!672497 (= res!439030 (noDuplicate!670 lt!312387))))

(declare-fun b!672498 () Bool)

(declare-fun res!439032 () Bool)

(assert (=> b!672498 (=> (not res!439032) (not e!384216))))

(assert (=> b!672498 (= res!439032 (not (contains!3396 lt!312387 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672499 () Bool)

(declare-fun res!439017 () Bool)

(assert (=> b!672499 (=> (not res!439017) (not e!384210))))

(declare-fun e!384212 () Bool)

(assert (=> b!672499 (= res!439017 e!384212)))

(declare-fun res!439025 () Bool)

(assert (=> b!672499 (=> res!439025 e!384212)))

(declare-fun e!384211 () Bool)

(assert (=> b!672499 (= res!439025 e!384211)))

(declare-fun res!439036 () Bool)

(assert (=> b!672499 (=> (not res!439036) (not e!384211))))

(assert (=> b!672499 (= res!439036 (bvsgt from!3004 i!1382))))

(declare-fun b!672500 () Bool)

(declare-fun res!439023 () Bool)

(assert (=> b!672500 (=> (not res!439023) (not e!384210))))

(assert (=> b!672500 (= res!439023 (noDuplicate!670 acc!681))))

(declare-fun b!672501 () Bool)

(declare-fun e!384206 () Bool)

(declare-fun e!384209 () Bool)

(assert (=> b!672501 (= e!384206 e!384209)))

(declare-fun res!439013 () Bool)

(assert (=> b!672501 (=> (not res!439013) (not e!384209))))

(assert (=> b!672501 (= res!439013 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672502 () Bool)

(assert (=> b!672502 (= e!384209 (not (contains!3396 lt!312387 k0!2843)))))

(declare-fun b!672503 () Bool)

(assert (=> b!672503 (= e!384216 false)))

(declare-fun lt!312386 () Bool)

(assert (=> b!672503 (= lt!312386 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312387))))

(declare-fun b!672504 () Bool)

(declare-fun res!439028 () Bool)

(assert (=> b!672504 (=> (not res!439028) (not e!384210))))

(assert (=> b!672504 (= res!439028 (validKeyInArray!0 k0!2843))))

(declare-fun b!672505 () Bool)

(declare-fun e!384215 () Bool)

(assert (=> b!672505 (= e!384215 (not (contains!3396 acc!681 k0!2843)))))

(declare-fun b!672506 () Bool)

(declare-fun res!439027 () Bool)

(assert (=> b!672506 (=> (not res!439027) (not e!384216))))

(assert (=> b!672506 (= res!439027 e!384206)))

(declare-fun res!439026 () Bool)

(assert (=> b!672506 (=> res!439026 e!384206)))

(declare-fun e!384213 () Bool)

(assert (=> b!672506 (= res!439026 e!384213)))

(declare-fun res!439035 () Bool)

(assert (=> b!672506 (=> (not res!439035) (not e!384213))))

(assert (=> b!672506 (= res!439035 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!672507 () Bool)

(assert (=> b!672507 (= e!384211 (contains!3396 acc!681 k0!2843))))

(declare-fun b!672508 () Bool)

(assert (=> b!672508 (= e!384212 e!384215)))

(declare-fun res!439029 () Bool)

(assert (=> b!672508 (=> (not res!439029) (not e!384215))))

(assert (=> b!672508 (= res!439029 (bvsle from!3004 i!1382))))

(declare-fun b!672509 () Bool)

(assert (=> b!672509 (= e!384213 (contains!3396 lt!312387 k0!2843))))

(declare-fun b!672493 () Bool)

(declare-fun res!439033 () Bool)

(assert (=> b!672493 (=> (not res!439033) (not e!384210))))

(assert (=> b!672493 (= res!439033 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19160 a!3626))))))

(declare-fun res!439034 () Bool)

(assert (=> start!60228 (=> (not res!439034) (not e!384210))))

(assert (=> start!60228 (= res!439034 (and (bvslt (size!19160 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19160 a!3626))))))

(assert (=> start!60228 e!384210))

(assert (=> start!60228 true))

(declare-fun array_inv!14655 (array!39213) Bool)

(assert (=> start!60228 (array_inv!14655 a!3626)))

(declare-fun b!672510 () Bool)

(declare-fun res!439022 () Bool)

(assert (=> b!672510 (=> (not res!439022) (not e!384210))))

(assert (=> b!672510 (= res!439022 (not (contains!3396 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!672511 () Bool)

(declare-fun res!439019 () Bool)

(assert (=> b!672511 (=> (not res!439019) (not e!384210))))

(assert (=> b!672511 (= res!439019 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12741))))

(assert (= (and start!60228 res!439034) b!672500))

(assert (= (and b!672500 res!439023) b!672489))

(assert (= (and b!672489 res!439014) b!672510))

(assert (= (and b!672510 res!439022) b!672499))

(assert (= (and b!672499 res!439036) b!672507))

(assert (= (and b!672499 (not res!439025)) b!672508))

(assert (= (and b!672508 res!439029) b!672505))

(assert (= (and b!672499 res!439017) b!672511))

(assert (= (and b!672511 res!439019) b!672486))

(assert (= (and b!672486 res!439024) b!672493))

(assert (= (and b!672493 res!439033) b!672504))

(assert (= (and b!672504 res!439028) b!672494))

(assert (= (and b!672494 res!439018) b!672491))

(assert (= (and b!672491 res!439015) b!672492))

(assert (= (and b!672492 res!439016) b!672490))

(assert (= (and b!672490 c!77105) b!672496))

(assert (= (and b!672490 (not c!77105)) b!672487))

(assert (= (and b!672490 res!439021) b!672488))

(assert (= (and b!672488 res!439031) b!672497))

(assert (= (and b!672497 res!439030) b!672495))

(assert (= (and b!672495 res!439020) b!672498))

(assert (= (and b!672498 res!439032) b!672506))

(assert (= (and b!672506 res!439035) b!672509))

(assert (= (and b!672506 (not res!439026)) b!672501))

(assert (= (and b!672501 res!439013) b!672502))

(assert (= (and b!672506 res!439027) b!672503))

(declare-fun m!642013 () Bool)

(assert (=> b!672494 m!642013))

(declare-fun m!642015 () Bool)

(assert (=> b!672507 m!642015))

(declare-fun m!642017 () Bool)

(assert (=> b!672510 m!642017))

(declare-fun m!642019 () Bool)

(assert (=> b!672500 m!642019))

(declare-fun m!642021 () Bool)

(assert (=> b!672492 m!642021))

(assert (=> b!672492 m!642021))

(declare-fun m!642023 () Bool)

(assert (=> b!672492 m!642023))

(declare-fun m!642025 () Bool)

(assert (=> b!672511 m!642025))

(declare-fun m!642027 () Bool)

(assert (=> b!672486 m!642027))

(declare-fun m!642029 () Bool)

(assert (=> b!672502 m!642029))

(declare-fun m!642031 () Bool)

(assert (=> start!60228 m!642031))

(declare-fun m!642033 () Bool)

(assert (=> b!672504 m!642033))

(declare-fun m!642035 () Bool)

(assert (=> b!672503 m!642035))

(assert (=> b!672505 m!642015))

(assert (=> b!672509 m!642029))

(declare-fun m!642037 () Bool)

(assert (=> b!672498 m!642037))

(declare-fun m!642039 () Bool)

(assert (=> b!672489 m!642039))

(declare-fun m!642041 () Bool)

(assert (=> b!672495 m!642041))

(declare-fun m!642043 () Bool)

(assert (=> b!672497 m!642043))

(assert (=> b!672490 m!642021))

(assert (=> b!672488 m!642021))

(assert (=> b!672488 m!642021))

(declare-fun m!642045 () Bool)

(assert (=> b!672488 m!642045))

(declare-fun m!642047 () Bool)

(assert (=> b!672496 m!642047))

(declare-fun m!642049 () Bool)

(assert (=> b!672496 m!642049))

(check-sat (not b!672486) (not b!672502) (not b!672505) (not b!672509) (not b!672488) (not b!672492) (not b!672489) (not b!672495) (not b!672500) (not b!672494) (not start!60228) (not b!672498) (not b!672496) (not b!672503) (not b!672510) (not b!672511) (not b!672497) (not b!672504) (not b!672507))
(check-sat)
