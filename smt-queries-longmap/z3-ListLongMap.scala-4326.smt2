; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59986 () Bool)

(assert start!59986)

(declare-fun b!666053 () Bool)

(declare-fun res!433490 () Bool)

(declare-fun e!381557 () Bool)

(assert (=> b!666053 (=> res!433490 e!381557)))

(declare-fun lt!310273 () Bool)

(assert (=> b!666053 (= res!433490 lt!310273)))

(declare-fun b!666054 () Bool)

(declare-fun res!433495 () Bool)

(declare-fun e!381561 () Bool)

(assert (=> b!666054 (=> (not res!433495) (not e!381561))))

(declare-fun e!381555 () Bool)

(assert (=> b!666054 (= res!433495 e!381555)))

(declare-fun res!433504 () Bool)

(assert (=> b!666054 (=> res!433504 e!381555)))

(declare-fun e!381556 () Bool)

(assert (=> b!666054 (= res!433504 e!381556)))

(declare-fun res!433505 () Bool)

(assert (=> b!666054 (=> (not res!433505) (not e!381556))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!666054 (= res!433505 (bvsgt from!3004 i!1382))))

(declare-fun b!666055 () Bool)

(declare-fun e!381558 () Bool)

(declare-datatypes ((List!12750 0))(
  ( (Nil!12747) (Cons!12746 (h!13791 (_ BitVec 64)) (t!18978 List!12750)) )
))
(declare-fun acc!681 () List!12750)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3327 (List!12750 (_ BitVec 64)) Bool)

(assert (=> b!666055 (= e!381558 (not (contains!3327 acc!681 k0!2843)))))

(declare-fun b!666056 () Bool)

(declare-fun res!433487 () Bool)

(assert (=> b!666056 (=> (not res!433487) (not e!381561))))

(assert (=> b!666056 (= res!433487 (not (contains!3327 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666057 () Bool)

(declare-fun res!433486 () Bool)

(assert (=> b!666057 (=> res!433486 e!381557)))

(assert (=> b!666057 (= res!433486 (contains!3327 acc!681 k0!2843))))

(declare-fun b!666058 () Bool)

(declare-fun res!433497 () Bool)

(assert (=> b!666058 (=> (not res!433497) (not e!381561))))

(declare-fun noDuplicate!574 (List!12750) Bool)

(assert (=> b!666058 (= res!433497 (noDuplicate!574 acc!681))))

(declare-fun b!666059 () Bool)

(declare-fun res!433492 () Bool)

(assert (=> b!666059 (=> (not res!433492) (not e!381561))))

(assert (=> b!666059 (= res!433492 (not (contains!3327 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666060 () Bool)

(declare-fun res!433501 () Bool)

(assert (=> b!666060 (=> res!433501 e!381557)))

(declare-fun lt!310266 () List!12750)

(declare-fun subseq!66 (List!12750 List!12750) Bool)

(assert (=> b!666060 (= res!433501 (not (subseq!66 acc!681 lt!310266)))))

(declare-fun b!666062 () Bool)

(declare-datatypes ((Unit!23270 0))(
  ( (Unit!23271) )
))
(declare-fun e!381560 () Unit!23270)

(declare-fun Unit!23272 () Unit!23270)

(assert (=> b!666062 (= e!381560 Unit!23272)))

(declare-fun lt!310264 () Unit!23270)

(declare-datatypes ((array!39033 0))(
  ( (array!39034 (arr!18709 (Array (_ BitVec 32) (_ BitVec 64))) (size!19073 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39033)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39033 (_ BitVec 64) (_ BitVec 32)) Unit!23270)

(assert (=> b!666062 (= lt!310264 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!666062 false))

(declare-fun b!666063 () Bool)

(declare-fun res!433499 () Bool)

(assert (=> b!666063 (=> (not res!433499) (not e!381561))))

(declare-fun arrayNoDuplicates!0 (array!39033 (_ BitVec 32) List!12750) Bool)

(assert (=> b!666063 (= res!433499 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!666064 () Bool)

(declare-fun res!433496 () Bool)

(assert (=> b!666064 (=> (not res!433496) (not e!381561))))

(assert (=> b!666064 (= res!433496 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12747))))

(declare-fun b!666065 () Bool)

(declare-fun res!433494 () Bool)

(assert (=> b!666065 (=> (not res!433494) (not e!381561))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!666065 (= res!433494 (validKeyInArray!0 k0!2843))))

(declare-fun b!666066 () Bool)

(assert (=> b!666066 (= e!381556 (contains!3327 acc!681 k0!2843))))

(declare-fun b!666067 () Bool)

(assert (=> b!666067 (= e!381561 (not e!381557))))

(declare-fun res!433489 () Bool)

(assert (=> b!666067 (=> res!433489 e!381557)))

(assert (=> b!666067 (= res!433489 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!64 (List!12750 (_ BitVec 64)) List!12750)

(assert (=> b!666067 (= (-!64 lt!310266 k0!2843) acc!681)))

(declare-fun $colon$colon!198 (List!12750 (_ BitVec 64)) List!12750)

(assert (=> b!666067 (= lt!310266 ($colon$colon!198 acc!681 k0!2843))))

(declare-fun lt!310267 () Unit!23270)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12750) Unit!23270)

(assert (=> b!666067 (= lt!310267 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!666067 (subseq!66 acc!681 acc!681)))

(declare-fun lt!310270 () Unit!23270)

(declare-fun lemmaListSubSeqRefl!0 (List!12750) Unit!23270)

(assert (=> b!666067 (= lt!310270 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666067 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310272 () Unit!23270)

(declare-fun e!381559 () Unit!23270)

(assert (=> b!666067 (= lt!310272 e!381559)))

(declare-fun c!76652 () Bool)

(assert (=> b!666067 (= c!76652 (validKeyInArray!0 (select (arr!18709 a!3626) from!3004)))))

(declare-fun lt!310268 () Unit!23270)

(assert (=> b!666067 (= lt!310268 e!381560)))

(declare-fun c!76651 () Bool)

(assert (=> b!666067 (= c!76651 lt!310273)))

(declare-fun arrayContainsKey!0 (array!39033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!666067 (= lt!310273 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666067 (arrayContainsKey!0 (array!39034 (store (arr!18709 a!3626) i!1382 k0!2843) (size!19073 a!3626)) k0!2843 from!3004)))

(declare-fun b!666068 () Bool)

(assert (=> b!666068 (= e!381557 true)))

(declare-fun lt!310271 () Bool)

(assert (=> b!666068 (= lt!310271 (contains!3327 lt!310266 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666069 () Bool)

(declare-fun Unit!23273 () Unit!23270)

(assert (=> b!666069 (= e!381560 Unit!23273)))

(declare-fun b!666070 () Bool)

(declare-fun res!433491 () Bool)

(assert (=> b!666070 (=> res!433491 e!381557)))

(assert (=> b!666070 (= res!433491 (contains!3327 lt!310266 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666071 () Bool)

(declare-fun lt!310265 () Unit!23270)

(assert (=> b!666071 (= e!381559 lt!310265)))

(declare-fun lt!310269 () Unit!23270)

(assert (=> b!666071 (= lt!310269 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666071 (subseq!66 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39033 List!12750 List!12750 (_ BitVec 32)) Unit!23270)

(assert (=> b!666071 (= lt!310265 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!198 acc!681 (select (arr!18709 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666071 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun res!433503 () Bool)

(assert (=> start!59986 (=> (not res!433503) (not e!381561))))

(assert (=> start!59986 (= res!433503 (and (bvslt (size!19073 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19073 a!3626))))))

(assert (=> start!59986 e!381561))

(assert (=> start!59986 true))

(declare-fun array_inv!14505 (array!39033) Bool)

(assert (=> start!59986 (array_inv!14505 a!3626)))

(declare-fun b!666061 () Bool)

(declare-fun Unit!23274 () Unit!23270)

(assert (=> b!666061 (= e!381559 Unit!23274)))

(declare-fun b!666072 () Bool)

(assert (=> b!666072 (= e!381555 e!381558)))

(declare-fun res!433488 () Bool)

(assert (=> b!666072 (=> (not res!433488) (not e!381558))))

(assert (=> b!666072 (= res!433488 (bvsle from!3004 i!1382))))

(declare-fun b!666073 () Bool)

(declare-fun res!433498 () Bool)

(assert (=> b!666073 (=> (not res!433498) (not e!381561))))

(assert (=> b!666073 (= res!433498 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19073 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!666074 () Bool)

(declare-fun res!433500 () Bool)

(assert (=> b!666074 (=> res!433500 e!381557)))

(assert (=> b!666074 (= res!433500 (not (noDuplicate!574 lt!310266)))))

(declare-fun b!666075 () Bool)

(declare-fun res!433493 () Bool)

(assert (=> b!666075 (=> (not res!433493) (not e!381561))))

(assert (=> b!666075 (= res!433493 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!666076 () Bool)

(declare-fun res!433502 () Bool)

(assert (=> b!666076 (=> res!433502 e!381557)))

(assert (=> b!666076 (= res!433502 (not (contains!3327 lt!310266 k0!2843)))))

(declare-fun b!666077 () Bool)

(declare-fun res!433485 () Bool)

(assert (=> b!666077 (=> (not res!433485) (not e!381561))))

(assert (=> b!666077 (= res!433485 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19073 a!3626))))))

(assert (= (and start!59986 res!433503) b!666058))

(assert (= (and b!666058 res!433497) b!666059))

(assert (= (and b!666059 res!433492) b!666056))

(assert (= (and b!666056 res!433487) b!666054))

(assert (= (and b!666054 res!433505) b!666066))

(assert (= (and b!666054 (not res!433504)) b!666072))

(assert (= (and b!666072 res!433488) b!666055))

(assert (= (and b!666054 res!433495) b!666064))

(assert (= (and b!666064 res!433496) b!666063))

(assert (= (and b!666063 res!433499) b!666077))

(assert (= (and b!666077 res!433485) b!666065))

(assert (= (and b!666065 res!433494) b!666075))

(assert (= (and b!666075 res!433493) b!666073))

(assert (= (and b!666073 res!433498) b!666067))

(assert (= (and b!666067 c!76651) b!666062))

(assert (= (and b!666067 (not c!76651)) b!666069))

(assert (= (and b!666067 c!76652) b!666071))

(assert (= (and b!666067 (not c!76652)) b!666061))

(assert (= (and b!666067 (not res!433489)) b!666074))

(assert (= (and b!666074 (not res!433500)) b!666053))

(assert (= (and b!666053 (not res!433490)) b!666057))

(assert (= (and b!666057 (not res!433486)) b!666060))

(assert (= (and b!666060 (not res!433501)) b!666076))

(assert (= (and b!666076 (not res!433502)) b!666070))

(assert (= (and b!666070 (not res!433491)) b!666068))

(declare-fun m!636949 () Bool)

(assert (=> b!666067 m!636949))

(declare-fun m!636951 () Bool)

(assert (=> b!666067 m!636951))

(declare-fun m!636953 () Bool)

(assert (=> b!666067 m!636953))

(declare-fun m!636955 () Bool)

(assert (=> b!666067 m!636955))

(declare-fun m!636957 () Bool)

(assert (=> b!666067 m!636957))

(declare-fun m!636959 () Bool)

(assert (=> b!666067 m!636959))

(assert (=> b!666067 m!636951))

(declare-fun m!636961 () Bool)

(assert (=> b!666067 m!636961))

(declare-fun m!636963 () Bool)

(assert (=> b!666067 m!636963))

(declare-fun m!636965 () Bool)

(assert (=> b!666067 m!636965))

(declare-fun m!636967 () Bool)

(assert (=> b!666067 m!636967))

(declare-fun m!636969 () Bool)

(assert (=> b!666067 m!636969))

(declare-fun m!636971 () Bool)

(assert (=> b!666063 m!636971))

(declare-fun m!636973 () Bool)

(assert (=> b!666076 m!636973))

(declare-fun m!636975 () Bool)

(assert (=> b!666068 m!636975))

(declare-fun m!636977 () Bool)

(assert (=> b!666062 m!636977))

(declare-fun m!636979 () Bool)

(assert (=> b!666059 m!636979))

(declare-fun m!636981 () Bool)

(assert (=> b!666064 m!636981))

(declare-fun m!636983 () Bool)

(assert (=> b!666055 m!636983))

(declare-fun m!636985 () Bool)

(assert (=> b!666075 m!636985))

(declare-fun m!636987 () Bool)

(assert (=> b!666058 m!636987))

(assert (=> b!666071 m!636949))

(assert (=> b!666071 m!636951))

(declare-fun m!636989 () Bool)

(assert (=> b!666071 m!636989))

(declare-fun m!636991 () Bool)

(assert (=> b!666071 m!636991))

(assert (=> b!666071 m!636951))

(assert (=> b!666071 m!636989))

(assert (=> b!666071 m!636955))

(assert (=> b!666071 m!636969))

(assert (=> b!666057 m!636983))

(declare-fun m!636993 () Bool)

(assert (=> b!666070 m!636993))

(declare-fun m!636995 () Bool)

(assert (=> b!666056 m!636995))

(declare-fun m!636997 () Bool)

(assert (=> b!666065 m!636997))

(declare-fun m!636999 () Bool)

(assert (=> b!666074 m!636999))

(declare-fun m!637001 () Bool)

(assert (=> b!666060 m!637001))

(declare-fun m!637003 () Bool)

(assert (=> start!59986 m!637003))

(assert (=> b!666066 m!636983))

(check-sat (not b!666068) (not b!666058) (not b!666074) (not b!666063) (not b!666062) (not b!666059) (not b!666065) (not b!666055) (not b!666056) (not b!666070) (not start!59986) (not b!666075) (not b!666064) (not b!666067) (not b!666066) (not b!666060) (not b!666071) (not b!666057) (not b!666076))
(check-sat)
