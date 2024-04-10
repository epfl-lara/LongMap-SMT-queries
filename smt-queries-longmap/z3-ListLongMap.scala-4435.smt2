; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61588 () Bool)

(assert start!61588)

(declare-fun b!689482 () Bool)

(declare-fun res!454039 () Bool)

(declare-fun e!392564 () Bool)

(assert (=> b!689482 (=> (not res!454039) (not e!392564))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13077 0))(
  ( (Nil!13074) (Cons!13073 (h!14118 (_ BitVec 64)) (t!19341 List!13077)) )
))
(declare-fun acc!681 () List!13077)

(declare-datatypes ((array!39729 0))(
  ( (array!39730 (arr!19036 (Array (_ BitVec 32) (_ BitVec 64))) (size!19418 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39729)

(declare-fun arrayNoDuplicates!0 (array!39729 (_ BitVec 32) List!13077) Bool)

(assert (=> b!689482 (= res!454039 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!689483 () Bool)

(declare-fun e!392566 () Bool)

(assert (=> b!689483 (= e!392566 true)))

(declare-fun lt!316182 () array!39729)

(declare-fun lt!316177 () List!13077)

(assert (=> b!689483 (arrayNoDuplicates!0 lt!316182 (bvadd #b00000000000000000000000000000001 from!3004) lt!316177)))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((Unit!24347 0))(
  ( (Unit!24348) )
))
(declare-fun lt!316183 () Unit!24347)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39729 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13077) Unit!24347)

(assert (=> b!689483 (= lt!316183 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316177))))

(declare-fun b!689484 () Bool)

(declare-fun e!392568 () Bool)

(declare-fun e!392571 () Bool)

(assert (=> b!689484 (= e!392568 e!392571)))

(declare-fun res!454030 () Bool)

(assert (=> b!689484 (=> res!454030 e!392571)))

(assert (=> b!689484 (= res!454030 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!454034 () Bool)

(assert (=> start!61588 (=> (not res!454034) (not e!392564))))

(assert (=> start!61588 (= res!454034 (and (bvslt (size!19418 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19418 a!3626))))))

(assert (=> start!61588 e!392564))

(assert (=> start!61588 true))

(declare-fun array_inv!14832 (array!39729) Bool)

(assert (=> start!61588 (array_inv!14832 a!3626)))

(declare-fun b!689485 () Bool)

(declare-fun res!454042 () Bool)

(assert (=> b!689485 (=> (not res!454042) (not e!392564))))

(assert (=> b!689485 (= res!454042 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19418 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!689486 () Bool)

(declare-fun e!392569 () Bool)

(declare-fun e!392567 () Bool)

(assert (=> b!689486 (= e!392569 e!392567)))

(declare-fun res!454032 () Bool)

(assert (=> b!689486 (=> (not res!454032) (not e!392567))))

(assert (=> b!689486 (= res!454032 (bvsle from!3004 i!1382))))

(declare-fun b!689487 () Bool)

(declare-fun res!454023 () Bool)

(assert (=> b!689487 (=> res!454023 e!392566)))

(assert (=> b!689487 (= res!454023 e!392568)))

(declare-fun res!454025 () Bool)

(assert (=> b!689487 (=> (not res!454025) (not e!392568))))

(declare-fun e!392570 () Bool)

(assert (=> b!689487 (= res!454025 e!392570)))

(declare-fun res!454028 () Bool)

(assert (=> b!689487 (=> res!454028 e!392570)))

(assert (=> b!689487 (= res!454028 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689488 () Bool)

(declare-fun res!454037 () Bool)

(assert (=> b!689488 (=> (not res!454037) (not e!392564))))

(assert (=> b!689488 (= res!454037 e!392569)))

(declare-fun res!454043 () Bool)

(assert (=> b!689488 (=> res!454043 e!392569)))

(declare-fun e!392561 () Bool)

(assert (=> b!689488 (= res!454043 e!392561)))

(declare-fun res!454029 () Bool)

(assert (=> b!689488 (=> (not res!454029) (not e!392561))))

(assert (=> b!689488 (= res!454029 (bvsgt from!3004 i!1382))))

(declare-fun b!689489 () Bool)

(assert (=> b!689489 (= e!392564 (not e!392566))))

(declare-fun res!454027 () Bool)

(assert (=> b!689489 (=> res!454027 e!392566)))

(assert (=> b!689489 (= res!454027 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!689489 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316177)))

(declare-fun lt!316181 () Unit!24347)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39729 (_ BitVec 64) (_ BitVec 32) List!13077 List!13077) Unit!24347)

(assert (=> b!689489 (= lt!316181 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!316177))))

(declare-fun -!205 (List!13077 (_ BitVec 64)) List!13077)

(assert (=> b!689489 (= (-!205 lt!316177 k0!2843) acc!681)))

(declare-fun $colon$colon!405 (List!13077 (_ BitVec 64)) List!13077)

(assert (=> b!689489 (= lt!316177 ($colon$colon!405 acc!681 k0!2843))))

(declare-fun lt!316178 () Unit!24347)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13077) Unit!24347)

(assert (=> b!689489 (= lt!316178 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!240 (List!13077 List!13077) Bool)

(assert (=> b!689489 (subseq!240 acc!681 acc!681)))

(declare-fun lt!316179 () Unit!24347)

(declare-fun lemmaListSubSeqRefl!0 (List!13077) Unit!24347)

(assert (=> b!689489 (= lt!316179 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689489 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!316176 () Unit!24347)

(declare-fun e!392562 () Unit!24347)

(assert (=> b!689489 (= lt!316176 e!392562)))

(declare-fun c!78097 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!689489 (= c!78097 (validKeyInArray!0 (select (arr!19036 a!3626) from!3004)))))

(declare-fun lt!316180 () Unit!24347)

(declare-fun e!392563 () Unit!24347)

(assert (=> b!689489 (= lt!316180 e!392563)))

(declare-fun c!78098 () Bool)

(declare-fun arrayContainsKey!0 (array!39729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!689489 (= c!78098 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689489 (arrayContainsKey!0 lt!316182 k0!2843 from!3004)))

(assert (=> b!689489 (= lt!316182 (array!39730 (store (arr!19036 a!3626) i!1382 k0!2843) (size!19418 a!3626)))))

(declare-fun b!689490 () Bool)

(declare-fun res!454031 () Bool)

(assert (=> b!689490 (=> res!454031 e!392566)))

(declare-fun noDuplicate!901 (List!13077) Bool)

(assert (=> b!689490 (= res!454031 (not (noDuplicate!901 lt!316177)))))

(declare-fun b!689491 () Bool)

(declare-fun contains!3654 (List!13077 (_ BitVec 64)) Bool)

(assert (=> b!689491 (= e!392561 (contains!3654 acc!681 k0!2843))))

(declare-fun b!689492 () Bool)

(declare-fun res!454036 () Bool)

(assert (=> b!689492 (=> (not res!454036) (not e!392564))))

(assert (=> b!689492 (= res!454036 (noDuplicate!901 acc!681))))

(declare-fun b!689493 () Bool)

(assert (=> b!689493 (= e!392570 (not (contains!3654 lt!316177 k0!2843)))))

(declare-fun b!689494 () Bool)

(declare-fun res!454033 () Bool)

(assert (=> b!689494 (=> res!454033 e!392566)))

(assert (=> b!689494 (= res!454033 (contains!3654 lt!316177 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689495 () Bool)

(declare-fun res!454026 () Bool)

(assert (=> b!689495 (=> (not res!454026) (not e!392564))))

(assert (=> b!689495 (= res!454026 (not (contains!3654 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689496 () Bool)

(declare-fun res!454035 () Bool)

(assert (=> b!689496 (=> (not res!454035) (not e!392564))))

(assert (=> b!689496 (= res!454035 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13074))))

(declare-fun b!689497 () Bool)

(declare-fun lt!316184 () Unit!24347)

(assert (=> b!689497 (= e!392562 lt!316184)))

(declare-fun lt!316185 () Unit!24347)

(assert (=> b!689497 (= lt!316185 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689497 (subseq!240 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39729 List!13077 List!13077 (_ BitVec 32)) Unit!24347)

(assert (=> b!689497 (= lt!316184 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!405 acc!681 (select (arr!19036 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689497 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!689498 () Bool)

(declare-fun Unit!24349 () Unit!24347)

(assert (=> b!689498 (= e!392563 Unit!24349)))

(declare-fun lt!316186 () Unit!24347)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39729 (_ BitVec 64) (_ BitVec 32)) Unit!24347)

(assert (=> b!689498 (= lt!316186 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!689498 false))

(declare-fun b!689499 () Bool)

(declare-fun res!454022 () Bool)

(assert (=> b!689499 (=> (not res!454022) (not e!392564))))

(assert (=> b!689499 (= res!454022 (not (contains!3654 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689500 () Bool)

(declare-fun res!454024 () Bool)

(assert (=> b!689500 (=> res!454024 e!392566)))

(assert (=> b!689500 (= res!454024 (contains!3654 lt!316177 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689501 () Bool)

(declare-fun Unit!24350 () Unit!24347)

(assert (=> b!689501 (= e!392563 Unit!24350)))

(declare-fun b!689502 () Bool)

(assert (=> b!689502 (= e!392571 (contains!3654 lt!316177 k0!2843))))

(declare-fun b!689503 () Bool)

(assert (=> b!689503 (= e!392567 (not (contains!3654 acc!681 k0!2843)))))

(declare-fun b!689504 () Bool)

(declare-fun Unit!24351 () Unit!24347)

(assert (=> b!689504 (= e!392562 Unit!24351)))

(declare-fun b!689505 () Bool)

(declare-fun res!454038 () Bool)

(assert (=> b!689505 (=> (not res!454038) (not e!392564))))

(assert (=> b!689505 (= res!454038 (validKeyInArray!0 k0!2843))))

(declare-fun b!689506 () Bool)

(declare-fun res!454041 () Bool)

(assert (=> b!689506 (=> (not res!454041) (not e!392564))))

(assert (=> b!689506 (= res!454041 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!689507 () Bool)

(declare-fun res!454040 () Bool)

(assert (=> b!689507 (=> (not res!454040) (not e!392564))))

(assert (=> b!689507 (= res!454040 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19418 a!3626))))))

(assert (= (and start!61588 res!454034) b!689492))

(assert (= (and b!689492 res!454036) b!689495))

(assert (= (and b!689495 res!454026) b!689499))

(assert (= (and b!689499 res!454022) b!689488))

(assert (= (and b!689488 res!454029) b!689491))

(assert (= (and b!689488 (not res!454043)) b!689486))

(assert (= (and b!689486 res!454032) b!689503))

(assert (= (and b!689488 res!454037) b!689496))

(assert (= (and b!689496 res!454035) b!689482))

(assert (= (and b!689482 res!454039) b!689507))

(assert (= (and b!689507 res!454040) b!689505))

(assert (= (and b!689505 res!454038) b!689506))

(assert (= (and b!689506 res!454041) b!689485))

(assert (= (and b!689485 res!454042) b!689489))

(assert (= (and b!689489 c!78098) b!689498))

(assert (= (and b!689489 (not c!78098)) b!689501))

(assert (= (and b!689489 c!78097) b!689497))

(assert (= (and b!689489 (not c!78097)) b!689504))

(assert (= (and b!689489 (not res!454027)) b!689490))

(assert (= (and b!689490 (not res!454031)) b!689500))

(assert (= (and b!689500 (not res!454024)) b!689494))

(assert (= (and b!689494 (not res!454033)) b!689487))

(assert (= (and b!689487 (not res!454028)) b!689493))

(assert (= (and b!689487 res!454025) b!689484))

(assert (= (and b!689484 (not res!454030)) b!689502))

(assert (= (and b!689487 (not res!454023)) b!689483))

(declare-fun m!653131 () Bool)

(assert (=> b!689497 m!653131))

(declare-fun m!653133 () Bool)

(assert (=> b!689497 m!653133))

(declare-fun m!653135 () Bool)

(assert (=> b!689497 m!653135))

(declare-fun m!653137 () Bool)

(assert (=> b!689497 m!653137))

(assert (=> b!689497 m!653133))

(assert (=> b!689497 m!653135))

(declare-fun m!653139 () Bool)

(assert (=> b!689497 m!653139))

(declare-fun m!653141 () Bool)

(assert (=> b!689497 m!653141))

(declare-fun m!653143 () Bool)

(assert (=> b!689502 m!653143))

(declare-fun m!653145 () Bool)

(assert (=> b!689498 m!653145))

(declare-fun m!653147 () Bool)

(assert (=> b!689490 m!653147))

(declare-fun m!653149 () Bool)

(assert (=> start!61588 m!653149))

(declare-fun m!653151 () Bool)

(assert (=> b!689503 m!653151))

(declare-fun m!653153 () Bool)

(assert (=> b!689483 m!653153))

(declare-fun m!653155 () Bool)

(assert (=> b!689483 m!653155))

(declare-fun m!653157 () Bool)

(assert (=> b!689500 m!653157))

(declare-fun m!653159 () Bool)

(assert (=> b!689496 m!653159))

(declare-fun m!653161 () Bool)

(assert (=> b!689489 m!653161))

(assert (=> b!689489 m!653131))

(assert (=> b!689489 m!653133))

(declare-fun m!653163 () Bool)

(assert (=> b!689489 m!653163))

(declare-fun m!653165 () Bool)

(assert (=> b!689489 m!653165))

(declare-fun m!653167 () Bool)

(assert (=> b!689489 m!653167))

(declare-fun m!653169 () Bool)

(assert (=> b!689489 m!653169))

(assert (=> b!689489 m!653133))

(declare-fun m!653171 () Bool)

(assert (=> b!689489 m!653171))

(assert (=> b!689489 m!653141))

(declare-fun m!653173 () Bool)

(assert (=> b!689489 m!653173))

(assert (=> b!689489 m!653139))

(declare-fun m!653175 () Bool)

(assert (=> b!689489 m!653175))

(declare-fun m!653177 () Bool)

(assert (=> b!689489 m!653177))

(assert (=> b!689493 m!653143))

(assert (=> b!689491 m!653151))

(declare-fun m!653179 () Bool)

(assert (=> b!689494 m!653179))

(declare-fun m!653181 () Bool)

(assert (=> b!689505 m!653181))

(declare-fun m!653183 () Bool)

(assert (=> b!689506 m!653183))

(declare-fun m!653185 () Bool)

(assert (=> b!689482 m!653185))

(declare-fun m!653187 () Bool)

(assert (=> b!689495 m!653187))

(declare-fun m!653189 () Bool)

(assert (=> b!689492 m!653189))

(declare-fun m!653191 () Bool)

(assert (=> b!689499 m!653191))

(check-sat (not b!689492) (not b!689502) (not b!689499) (not b!689489) (not b!689495) (not start!61588) (not b!689498) (not b!689505) (not b!689496) (not b!689497) (not b!689500) (not b!689503) (not b!689490) (not b!689493) (not b!689491) (not b!689506) (not b!689482) (not b!689483) (not b!689494))
