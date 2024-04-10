; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60040 () Bool)

(assert start!60040)

(declare-fun b!668078 () Bool)

(declare-fun res!435193 () Bool)

(declare-fun e!382308 () Bool)

(assert (=> b!668078 (=> (not res!435193) (not e!382308))))

(declare-fun e!382303 () Bool)

(assert (=> b!668078 (= res!435193 e!382303)))

(declare-fun res!435190 () Bool)

(assert (=> b!668078 (=> res!435190 e!382303)))

(declare-fun e!382301 () Bool)

(assert (=> b!668078 (= res!435190 e!382301)))

(declare-fun res!435201 () Bool)

(assert (=> b!668078 (=> (not res!435201) (not e!382301))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!668078 (= res!435201 (bvsgt from!3004 i!1382))))

(declare-fun b!668079 () Bool)

(declare-fun e!382302 () Bool)

(assert (=> b!668079 (= e!382308 (not e!382302))))

(declare-fun res!435206 () Bool)

(assert (=> b!668079 (=> res!435206 e!382302)))

(assert (=> b!668079 (= res!435206 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39087 0))(
  ( (array!39088 (arr!18736 (Array (_ BitVec 32) (_ BitVec 64))) (size!19100 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39087)

(declare-datatypes ((List!12777 0))(
  ( (Nil!12774) (Cons!12773 (h!13818 (_ BitVec 64)) (t!19005 List!12777)) )
))
(declare-fun lt!311080 () List!12777)

(declare-fun arrayNoDuplicates!0 (array!39087 (_ BitVec 32) List!12777) Bool)

(assert (=> b!668079 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311080)))

(declare-datatypes ((Unit!23405 0))(
  ( (Unit!23406) )
))
(declare-fun lt!311081 () Unit!23405)

(declare-fun acc!681 () List!12777)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39087 (_ BitVec 64) (_ BitVec 32) List!12777 List!12777) Unit!23405)

(assert (=> b!668079 (= lt!311081 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311080))))

(declare-fun -!91 (List!12777 (_ BitVec 64)) List!12777)

(assert (=> b!668079 (= (-!91 lt!311080 k0!2843) acc!681)))

(declare-fun $colon$colon!225 (List!12777 (_ BitVec 64)) List!12777)

(assert (=> b!668079 (= lt!311080 ($colon$colon!225 acc!681 k0!2843))))

(declare-fun lt!311074 () Unit!23405)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12777) Unit!23405)

(assert (=> b!668079 (= lt!311074 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!93 (List!12777 List!12777) Bool)

(assert (=> b!668079 (subseq!93 acc!681 acc!681)))

(declare-fun lt!311079 () Unit!23405)

(declare-fun lemmaListSubSeqRefl!0 (List!12777) Unit!23405)

(assert (=> b!668079 (= lt!311079 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668079 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311077 () Unit!23405)

(declare-fun e!382300 () Unit!23405)

(assert (=> b!668079 (= lt!311077 e!382300)))

(declare-fun c!76813 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!668079 (= c!76813 (validKeyInArray!0 (select (arr!18736 a!3626) from!3004)))))

(declare-fun lt!311075 () Unit!23405)

(declare-fun e!382305 () Unit!23405)

(assert (=> b!668079 (= lt!311075 e!382305)))

(declare-fun c!76814 () Bool)

(declare-fun arrayContainsKey!0 (array!39087 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!668079 (= c!76814 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668079 (arrayContainsKey!0 (array!39088 (store (arr!18736 a!3626) i!1382 k0!2843) (size!19100 a!3626)) k0!2843 from!3004)))

(declare-fun b!668080 () Bool)

(declare-fun Unit!23407 () Unit!23405)

(assert (=> b!668080 (= e!382305 Unit!23407)))

(declare-fun res!435195 () Bool)

(assert (=> start!60040 (=> (not res!435195) (not e!382308))))

(assert (=> start!60040 (= res!435195 (and (bvslt (size!19100 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19100 a!3626))))))

(assert (=> start!60040 e!382308))

(assert (=> start!60040 true))

(declare-fun array_inv!14532 (array!39087) Bool)

(assert (=> start!60040 (array_inv!14532 a!3626)))

(declare-fun b!668081 () Bool)

(declare-fun res!435198 () Bool)

(assert (=> b!668081 (=> (not res!435198) (not e!382308))))

(assert (=> b!668081 (= res!435198 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19100 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!668082 () Bool)

(declare-fun e!382304 () Bool)

(declare-fun contains!3354 (List!12777 (_ BitVec 64)) Bool)

(assert (=> b!668082 (= e!382304 (not (contains!3354 lt!311080 k0!2843)))))

(declare-fun b!668083 () Bool)

(declare-fun e!382306 () Bool)

(assert (=> b!668083 (= e!382306 e!382304)))

(declare-fun res!435194 () Bool)

(assert (=> b!668083 (=> (not res!435194) (not e!382304))))

(assert (=> b!668083 (= res!435194 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668084 () Bool)

(declare-fun e!382307 () Bool)

(assert (=> b!668084 (= e!382307 (contains!3354 lt!311080 k0!2843))))

(declare-fun b!668085 () Bool)

(declare-fun res!435199 () Bool)

(assert (=> b!668085 (=> (not res!435199) (not e!382308))))

(assert (=> b!668085 (= res!435199 (validKeyInArray!0 k0!2843))))

(declare-fun b!668086 () Bool)

(declare-fun lt!311083 () Unit!23405)

(assert (=> b!668086 (= e!382300 lt!311083)))

(declare-fun lt!311082 () Unit!23405)

(assert (=> b!668086 (= lt!311082 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!668086 (subseq!93 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39087 List!12777 List!12777 (_ BitVec 32)) Unit!23405)

(assert (=> b!668086 (= lt!311083 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!225 acc!681 (select (arr!18736 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!668086 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!668087 () Bool)

(declare-fun res!435203 () Bool)

(assert (=> b!668087 (=> res!435203 e!382302)))

(assert (=> b!668087 (= res!435203 (contains!3354 lt!311080 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668088 () Bool)

(declare-fun res!435205 () Bool)

(assert (=> b!668088 (=> (not res!435205) (not e!382308))))

(assert (=> b!668088 (= res!435205 (not (contains!3354 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668089 () Bool)

(declare-fun res!435204 () Bool)

(assert (=> b!668089 (=> (not res!435204) (not e!382308))))

(declare-fun noDuplicate!601 (List!12777) Bool)

(assert (=> b!668089 (= res!435204 (noDuplicate!601 acc!681))))

(declare-fun b!668090 () Bool)

(declare-fun e!382299 () Bool)

(assert (=> b!668090 (= e!382303 e!382299)))

(declare-fun res!435186 () Bool)

(assert (=> b!668090 (=> (not res!435186) (not e!382299))))

(assert (=> b!668090 (= res!435186 (bvsle from!3004 i!1382))))

(declare-fun b!668091 () Bool)

(declare-fun res!435192 () Bool)

(assert (=> b!668091 (=> (not res!435192) (not e!382308))))

(assert (=> b!668091 (= res!435192 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19100 a!3626))))))

(declare-fun b!668092 () Bool)

(declare-fun res!435191 () Bool)

(assert (=> b!668092 (=> (not res!435191) (not e!382308))))

(assert (=> b!668092 (= res!435191 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!668093 () Bool)

(declare-fun res!435196 () Bool)

(assert (=> b!668093 (=> res!435196 e!382302)))

(assert (=> b!668093 (= res!435196 (not (noDuplicate!601 lt!311080)))))

(declare-fun b!668094 () Bool)

(assert (=> b!668094 (= e!382302 true)))

(declare-fun lt!311076 () Bool)

(assert (=> b!668094 (= lt!311076 e!382306)))

(declare-fun res!435197 () Bool)

(assert (=> b!668094 (=> res!435197 e!382306)))

(assert (=> b!668094 (= res!435197 e!382307)))

(declare-fun res!435200 () Bool)

(assert (=> b!668094 (=> (not res!435200) (not e!382307))))

(assert (=> b!668094 (= res!435200 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!668095 () Bool)

(assert (=> b!668095 (= e!382301 (contains!3354 acc!681 k0!2843))))

(declare-fun b!668096 () Bool)

(assert (=> b!668096 (= e!382299 (not (contains!3354 acc!681 k0!2843)))))

(declare-fun b!668097 () Bool)

(declare-fun res!435188 () Bool)

(assert (=> b!668097 (=> (not res!435188) (not e!382308))))

(assert (=> b!668097 (= res!435188 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!668098 () Bool)

(declare-fun res!435202 () Bool)

(assert (=> b!668098 (=> (not res!435202) (not e!382308))))

(assert (=> b!668098 (= res!435202 (not (contains!3354 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!668099 () Bool)

(declare-fun res!435187 () Bool)

(assert (=> b!668099 (=> (not res!435187) (not e!382308))))

(assert (=> b!668099 (= res!435187 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12774))))

(declare-fun b!668100 () Bool)

(declare-fun Unit!23408 () Unit!23405)

(assert (=> b!668100 (= e!382305 Unit!23408)))

(declare-fun lt!311078 () Unit!23405)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39087 (_ BitVec 64) (_ BitVec 32)) Unit!23405)

(assert (=> b!668100 (= lt!311078 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!668100 false))

(declare-fun b!668101 () Bool)

(declare-fun res!435189 () Bool)

(assert (=> b!668101 (=> res!435189 e!382302)))

(assert (=> b!668101 (= res!435189 (contains!3354 lt!311080 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!668102 () Bool)

(declare-fun Unit!23409 () Unit!23405)

(assert (=> b!668102 (= e!382300 Unit!23409)))

(assert (= (and start!60040 res!435195) b!668089))

(assert (= (and b!668089 res!435204) b!668088))

(assert (= (and b!668088 res!435205) b!668098))

(assert (= (and b!668098 res!435202) b!668078))

(assert (= (and b!668078 res!435201) b!668095))

(assert (= (and b!668078 (not res!435190)) b!668090))

(assert (= (and b!668090 res!435186) b!668096))

(assert (= (and b!668078 res!435193) b!668099))

(assert (= (and b!668099 res!435187) b!668092))

(assert (= (and b!668092 res!435191) b!668091))

(assert (= (and b!668091 res!435192) b!668085))

(assert (= (and b!668085 res!435199) b!668097))

(assert (= (and b!668097 res!435188) b!668081))

(assert (= (and b!668081 res!435198) b!668079))

(assert (= (and b!668079 c!76814) b!668100))

(assert (= (and b!668079 (not c!76814)) b!668080))

(assert (= (and b!668079 c!76813) b!668086))

(assert (= (and b!668079 (not c!76813)) b!668102))

(assert (= (and b!668079 (not res!435206)) b!668093))

(assert (= (and b!668093 (not res!435196)) b!668087))

(assert (= (and b!668087 (not res!435203)) b!668101))

(assert (= (and b!668101 (not res!435189)) b!668094))

(assert (= (and b!668094 res!435200) b!668084))

(assert (= (and b!668094 (not res!435197)) b!668083))

(assert (= (and b!668083 res!435194) b!668082))

(declare-fun m!638481 () Bool)

(assert (=> b!668084 m!638481))

(declare-fun m!638483 () Bool)

(assert (=> b!668093 m!638483))

(declare-fun m!638485 () Bool)

(assert (=> b!668100 m!638485))

(declare-fun m!638487 () Bool)

(assert (=> b!668079 m!638487))

(declare-fun m!638489 () Bool)

(assert (=> b!668079 m!638489))

(declare-fun m!638491 () Bool)

(assert (=> b!668079 m!638491))

(declare-fun m!638493 () Bool)

(assert (=> b!668079 m!638493))

(declare-fun m!638495 () Bool)

(assert (=> b!668079 m!638495))

(declare-fun m!638497 () Bool)

(assert (=> b!668079 m!638497))

(declare-fun m!638499 () Bool)

(assert (=> b!668079 m!638499))

(declare-fun m!638501 () Bool)

(assert (=> b!668079 m!638501))

(declare-fun m!638503 () Bool)

(assert (=> b!668079 m!638503))

(declare-fun m!638505 () Bool)

(assert (=> b!668079 m!638505))

(assert (=> b!668079 m!638495))

(declare-fun m!638507 () Bool)

(assert (=> b!668079 m!638507))

(declare-fun m!638509 () Bool)

(assert (=> b!668079 m!638509))

(declare-fun m!638511 () Bool)

(assert (=> b!668079 m!638511))

(assert (=> b!668082 m!638481))

(declare-fun m!638513 () Bool)

(assert (=> b!668088 m!638513))

(declare-fun m!638515 () Bool)

(assert (=> b!668099 m!638515))

(declare-fun m!638517 () Bool)

(assert (=> b!668098 m!638517))

(declare-fun m!638519 () Bool)

(assert (=> b!668089 m!638519))

(declare-fun m!638521 () Bool)

(assert (=> start!60040 m!638521))

(declare-fun m!638523 () Bool)

(assert (=> b!668092 m!638523))

(assert (=> b!668086 m!638491))

(assert (=> b!668086 m!638495))

(declare-fun m!638525 () Bool)

(assert (=> b!668086 m!638525))

(declare-fun m!638527 () Bool)

(assert (=> b!668086 m!638527))

(assert (=> b!668086 m!638495))

(assert (=> b!668086 m!638525))

(assert (=> b!668086 m!638501))

(assert (=> b!668086 m!638511))

(declare-fun m!638529 () Bool)

(assert (=> b!668096 m!638529))

(declare-fun m!638531 () Bool)

(assert (=> b!668101 m!638531))

(declare-fun m!638533 () Bool)

(assert (=> b!668085 m!638533))

(declare-fun m!638535 () Bool)

(assert (=> b!668087 m!638535))

(declare-fun m!638537 () Bool)

(assert (=> b!668097 m!638537))

(assert (=> b!668095 m!638529))

(check-sat (not b!668098) (not b!668089) (not b!668093) (not b!668085) (not b!668096) (not b!668099) (not b!668101) (not b!668079) (not b!668088) (not start!60040) (not b!668087) (not b!668084) (not b!668086) (not b!668095) (not b!668092) (not b!668082) (not b!668100) (not b!668097))
(check-sat)
