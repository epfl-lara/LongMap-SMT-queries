; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59846 () Bool)

(assert start!59846)

(declare-fun b!661482 () Bool)

(declare-fun res!429721 () Bool)

(declare-fun e!379880 () Bool)

(assert (=> b!661482 (=> (not res!429721) (not e!379880))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38904 0))(
  ( (array!38905 (arr!18644 (Array (_ BitVec 32) (_ BitVec 64))) (size!19009 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38904)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!661482 (= res!429721 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19009 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661483 () Bool)

(declare-fun e!379873 () Bool)

(declare-fun e!379876 () Bool)

(assert (=> b!661483 (= e!379873 e!379876)))

(declare-fun res!429705 () Bool)

(assert (=> b!661483 (=> res!429705 e!379876)))

(assert (=> b!661483 (= res!429705 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!12724 0))(
  ( (Nil!12721) (Cons!12720 (h!13765 (_ BitVec 64)) (t!18943 List!12724)) )
))
(declare-fun acc!681 () List!12724)

(declare-fun lt!308578 () List!12724)

(declare-fun $colon$colon!133 (List!12724 (_ BitVec 64)) List!12724)

(assert (=> b!661483 (= lt!308578 ($colon$colon!133 acc!681 (select (arr!18644 a!3626) from!3004)))))

(declare-fun subseq!2 (List!12724 List!12724) Bool)

(assert (=> b!661483 (subseq!2 acc!681 acc!681)))

(declare-datatypes ((Unit!22952 0))(
  ( (Unit!22953) )
))
(declare-fun lt!308577 () Unit!22952)

(declare-fun lemmaListSubSeqRefl!0 (List!12724) Unit!22952)

(assert (=> b!661483 (= lt!308577 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!661484 () Bool)

(declare-fun e!379874 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3246 (List!12724 (_ BitVec 64)) Bool)

(assert (=> b!661484 (= e!379874 (not (contains!3246 acc!681 k0!2843)))))

(declare-fun b!661485 () Bool)

(declare-fun res!429717 () Bool)

(assert (=> b!661485 (=> (not res!429717) (not e!379880))))

(declare-fun arrayContainsKey!0 (array!38904 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661485 (= res!429717 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661486 () Bool)

(declare-fun res!429719 () Bool)

(assert (=> b!661486 (=> (not res!429719) (not e!379880))))

(assert (=> b!661486 (= res!429719 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19009 a!3626))))))

(declare-fun b!661487 () Bool)

(declare-fun e!379877 () Unit!22952)

(declare-fun Unit!22954 () Unit!22952)

(assert (=> b!661487 (= e!379877 Unit!22954)))

(declare-fun lt!308575 () Unit!22952)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38904 (_ BitVec 64) (_ BitVec 32)) Unit!22952)

(assert (=> b!661487 (= lt!308575 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!661487 false))

(declare-fun b!661488 () Bool)

(declare-fun res!429714 () Bool)

(assert (=> b!661488 (=> (not res!429714) (not e!379880))))

(declare-fun arrayNoDuplicates!0 (array!38904 (_ BitVec 32) List!12724) Bool)

(assert (=> b!661488 (= res!429714 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12721))))

(declare-fun b!661489 () Bool)

(declare-fun e!379875 () Bool)

(assert (=> b!661489 (= e!379875 e!379874)))

(declare-fun res!429709 () Bool)

(assert (=> b!661489 (=> (not res!429709) (not e!379874))))

(assert (=> b!661489 (= res!429709 (bvsle from!3004 i!1382))))

(declare-fun b!661490 () Bool)

(declare-fun res!429716 () Bool)

(assert (=> b!661490 (=> (not res!429716) (not e!379880))))

(assert (=> b!661490 (= res!429716 e!379875)))

(declare-fun res!429702 () Bool)

(assert (=> b!661490 (=> res!429702 e!379875)))

(declare-fun e!379879 () Bool)

(assert (=> b!661490 (= res!429702 e!379879)))

(declare-fun res!429707 () Bool)

(assert (=> b!661490 (=> (not res!429707) (not e!379879))))

(assert (=> b!661490 (= res!429707 (bvsgt from!3004 i!1382))))

(declare-fun b!661491 () Bool)

(declare-fun res!429706 () Bool)

(assert (=> b!661491 (=> res!429706 e!379876)))

(assert (=> b!661491 (= res!429706 (contains!3246 lt!308578 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!661493 () Bool)

(assert (=> b!661493 (= e!379876 true)))

(declare-fun lt!308579 () Bool)

(assert (=> b!661493 (= lt!308579 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!308578))))

(declare-fun lt!308580 () Unit!22952)

(declare-fun noDuplicateSubseq!2 (List!12724 List!12724) Unit!22952)

(assert (=> b!661493 (= lt!308580 (noDuplicateSubseq!2 acc!681 lt!308578))))

(declare-fun b!661494 () Bool)

(declare-fun res!429704 () Bool)

(assert (=> b!661494 (=> (not res!429704) (not e!379880))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661494 (= res!429704 (validKeyInArray!0 k0!2843))))

(declare-fun b!661495 () Bool)

(declare-fun res!429703 () Bool)

(assert (=> b!661495 (=> res!429703 e!379876)))

(assert (=> b!661495 (= res!429703 (contains!3246 lt!308578 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!661496 () Bool)

(declare-fun res!429710 () Bool)

(assert (=> b!661496 (=> (not res!429710) (not e!379880))))

(assert (=> b!661496 (= res!429710 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661497 () Bool)

(declare-fun Unit!22955 () Unit!22952)

(assert (=> b!661497 (= e!379877 Unit!22955)))

(declare-fun b!661498 () Bool)

(declare-fun res!429712 () Bool)

(assert (=> b!661498 (=> (not res!429712) (not e!379880))))

(assert (=> b!661498 (= res!429712 (not (contains!3246 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661499 () Bool)

(declare-fun res!429711 () Bool)

(assert (=> b!661499 (=> (not res!429711) (not e!379880))))

(assert (=> b!661499 (= res!429711 (not (contains!3246 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661500 () Bool)

(assert (=> b!661500 (= e!379880 (not e!379873))))

(declare-fun res!429715 () Bool)

(assert (=> b!661500 (=> res!429715 e!379873)))

(assert (=> b!661500 (= res!429715 (not (validKeyInArray!0 (select (arr!18644 a!3626) from!3004))))))

(declare-fun lt!308576 () Unit!22952)

(assert (=> b!661500 (= lt!308576 e!379877)))

(declare-fun c!76257 () Bool)

(assert (=> b!661500 (= c!76257 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!661500 (arrayContainsKey!0 (array!38905 (store (arr!18644 a!3626) i!1382 k0!2843) (size!19009 a!3626)) k0!2843 from!3004)))

(declare-fun res!429720 () Bool)

(assert (=> start!59846 (=> (not res!429720) (not e!379880))))

(assert (=> start!59846 (= res!429720 (and (bvslt (size!19009 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19009 a!3626))))))

(assert (=> start!59846 e!379880))

(assert (=> start!59846 true))

(declare-fun array_inv!14527 (array!38904) Bool)

(assert (=> start!59846 (array_inv!14527 a!3626)))

(declare-fun b!661492 () Bool)

(assert (=> b!661492 (= e!379879 (contains!3246 acc!681 k0!2843))))

(declare-fun b!661501 () Bool)

(declare-fun res!429713 () Bool)

(assert (=> b!661501 (=> (not res!429713) (not e!379880))))

(declare-fun noDuplicate!515 (List!12724) Bool)

(assert (=> b!661501 (= res!429713 (noDuplicate!515 acc!681))))

(declare-fun b!661502 () Bool)

(declare-fun res!429708 () Bool)

(assert (=> b!661502 (=> res!429708 e!379876)))

(assert (=> b!661502 (= res!429708 (not (subseq!2 acc!681 lt!308578)))))

(declare-fun b!661503 () Bool)

(declare-fun res!429718 () Bool)

(assert (=> b!661503 (=> res!429718 e!379876)))

(assert (=> b!661503 (= res!429718 (not (noDuplicate!515 lt!308578)))))

(assert (= (and start!59846 res!429720) b!661501))

(assert (= (and b!661501 res!429713) b!661499))

(assert (= (and b!661499 res!429711) b!661498))

(assert (= (and b!661498 res!429712) b!661490))

(assert (= (and b!661490 res!429707) b!661492))

(assert (= (and b!661490 (not res!429702)) b!661489))

(assert (= (and b!661489 res!429709) b!661484))

(assert (= (and b!661490 res!429716) b!661488))

(assert (= (and b!661488 res!429714) b!661496))

(assert (= (and b!661496 res!429710) b!661486))

(assert (= (and b!661486 res!429719) b!661494))

(assert (= (and b!661494 res!429704) b!661485))

(assert (= (and b!661485 res!429717) b!661482))

(assert (= (and b!661482 res!429721) b!661500))

(assert (= (and b!661500 c!76257) b!661487))

(assert (= (and b!661500 (not c!76257)) b!661497))

(assert (= (and b!661500 (not res!429715)) b!661483))

(assert (= (and b!661483 (not res!429705)) b!661503))

(assert (= (and b!661503 (not res!429718)) b!661495))

(assert (= (and b!661495 (not res!429703)) b!661491))

(assert (= (and b!661491 (not res!429706)) b!661502))

(assert (= (and b!661502 (not res!429708)) b!661493))

(declare-fun m!633015 () Bool)

(assert (=> b!661501 m!633015))

(declare-fun m!633017 () Bool)

(assert (=> start!59846 m!633017))

(declare-fun m!633019 () Bool)

(assert (=> b!661502 m!633019))

(declare-fun m!633021 () Bool)

(assert (=> b!661503 m!633021))

(declare-fun m!633023 () Bool)

(assert (=> b!661495 m!633023))

(declare-fun m!633025 () Bool)

(assert (=> b!661500 m!633025))

(declare-fun m!633027 () Bool)

(assert (=> b!661500 m!633027))

(declare-fun m!633029 () Bool)

(assert (=> b!661500 m!633029))

(assert (=> b!661500 m!633025))

(declare-fun m!633031 () Bool)

(assert (=> b!661500 m!633031))

(declare-fun m!633033 () Bool)

(assert (=> b!661500 m!633033))

(declare-fun m!633035 () Bool)

(assert (=> b!661485 m!633035))

(declare-fun m!633037 () Bool)

(assert (=> b!661498 m!633037))

(declare-fun m!633039 () Bool)

(assert (=> b!661487 m!633039))

(declare-fun m!633041 () Bool)

(assert (=> b!661499 m!633041))

(declare-fun m!633043 () Bool)

(assert (=> b!661492 m!633043))

(declare-fun m!633045 () Bool)

(assert (=> b!661488 m!633045))

(declare-fun m!633047 () Bool)

(assert (=> b!661494 m!633047))

(assert (=> b!661483 m!633025))

(assert (=> b!661483 m!633025))

(declare-fun m!633049 () Bool)

(assert (=> b!661483 m!633049))

(declare-fun m!633051 () Bool)

(assert (=> b!661483 m!633051))

(declare-fun m!633053 () Bool)

(assert (=> b!661483 m!633053))

(assert (=> b!661484 m!633043))

(declare-fun m!633055 () Bool)

(assert (=> b!661496 m!633055))

(declare-fun m!633057 () Bool)

(assert (=> b!661493 m!633057))

(declare-fun m!633059 () Bool)

(assert (=> b!661493 m!633059))

(declare-fun m!633061 () Bool)

(assert (=> b!661491 m!633061))

(check-sat (not b!661501) (not b!661496) (not b!661498) (not b!661485) (not b!661499) (not b!661493) (not b!661483) (not b!661492) (not b!661500) (not b!661487) (not b!661491) (not b!661488) (not b!661503) (not b!661495) (not b!661484) (not b!661494) (not start!59846) (not b!661502))
(check-sat)
