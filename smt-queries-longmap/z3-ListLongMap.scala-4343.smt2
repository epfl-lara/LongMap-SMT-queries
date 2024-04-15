; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60074 () Bool)

(assert start!60074)

(declare-fun b!669509 () Bool)

(declare-fun res!436510 () Bool)

(declare-fun e!382872 () Bool)

(assert (=> b!669509 (=> (not res!436510) (not e!382872))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!669509 (= res!436510 (validKeyInArray!0 k0!2843))))

(declare-fun b!669510 () Bool)

(declare-fun e!382869 () Bool)

(declare-fun e!382870 () Bool)

(assert (=> b!669510 (= e!382869 e!382870)))

(declare-fun res!436507 () Bool)

(assert (=> b!669510 (=> (not res!436507) (not e!382870))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!669510 (= res!436507 (bvsle from!3004 i!1382))))

(declare-fun b!669511 () Bool)

(declare-fun e!382874 () Bool)

(declare-fun e!382877 () Bool)

(assert (=> b!669511 (= e!382874 e!382877)))

(declare-fun res!436514 () Bool)

(assert (=> b!669511 (=> res!436514 e!382877)))

(assert (=> b!669511 (= res!436514 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669512 () Bool)

(declare-datatypes ((Unit!23498 0))(
  ( (Unit!23499) )
))
(declare-fun e!382876 () Unit!23498)

(declare-fun lt!311512 () Unit!23498)

(assert (=> b!669512 (= e!382876 lt!311512)))

(declare-fun lt!311510 () Unit!23498)

(declare-datatypes ((List!12838 0))(
  ( (Nil!12835) (Cons!12834 (h!13879 (_ BitVec 64)) (t!19057 List!12838)) )
))
(declare-fun acc!681 () List!12838)

(declare-fun lemmaListSubSeqRefl!0 (List!12838) Unit!23498)

(assert (=> b!669512 (= lt!311510 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!116 (List!12838 List!12838) Bool)

(assert (=> b!669512 (subseq!116 acc!681 acc!681)))

(declare-datatypes ((array!39132 0))(
  ( (array!39133 (arr!18758 (Array (_ BitVec 32) (_ BitVec 64))) (size!19123 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39132)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39132 List!12838 List!12838 (_ BitVec 32)) Unit!23498)

(declare-fun $colon$colon!247 (List!12838 (_ BitVec 64)) List!12838)

(assert (=> b!669512 (= lt!311512 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!247 acc!681 (select (arr!18758 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39132 (_ BitVec 32) List!12838) Bool)

(assert (=> b!669512 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!669513 () Bool)

(declare-fun res!436506 () Bool)

(assert (=> b!669513 (=> (not res!436506) (not e!382872))))

(declare-fun arrayContainsKey!0 (array!39132 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!669513 (= res!436506 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!669514 () Bool)

(declare-fun e!382871 () Unit!23498)

(declare-fun Unit!23500 () Unit!23498)

(assert (=> b!669514 (= e!382871 Unit!23500)))

(declare-fun lt!311515 () Unit!23498)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39132 (_ BitVec 64) (_ BitVec 32)) Unit!23498)

(assert (=> b!669514 (= lt!311515 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!669514 false))

(declare-fun b!669515 () Bool)

(declare-fun res!436504 () Bool)

(assert (=> b!669515 (=> (not res!436504) (not e!382872))))

(assert (=> b!669515 (= res!436504 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19123 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!669516 () Bool)

(declare-fun res!436513 () Bool)

(declare-fun e!382867 () Bool)

(assert (=> b!669516 (=> res!436513 e!382867)))

(assert (=> b!669516 (= res!436513 e!382874)))

(declare-fun res!436512 () Bool)

(assert (=> b!669516 (=> (not res!436512) (not e!382874))))

(declare-fun e!382868 () Bool)

(assert (=> b!669516 (= res!436512 e!382868)))

(declare-fun res!436516 () Bool)

(assert (=> b!669516 (=> res!436516 e!382868)))

(assert (=> b!669516 (= res!436516 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!669517 () Bool)

(declare-fun res!436508 () Bool)

(assert (=> b!669517 (=> res!436508 e!382867)))

(declare-fun lt!311519 () List!12838)

(declare-fun noDuplicate!629 (List!12838) Bool)

(assert (=> b!669517 (= res!436508 (not (noDuplicate!629 lt!311519)))))

(declare-fun b!669518 () Bool)

(declare-fun res!436505 () Bool)

(assert (=> b!669518 (=> (not res!436505) (not e!382872))))

(declare-fun contains!3360 (List!12838 (_ BitVec 64)) Bool)

(assert (=> b!669518 (= res!436505 (not (contains!3360 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!669519 () Bool)

(assert (=> b!669519 (= e!382868 (not (contains!3360 lt!311519 k0!2843)))))

(declare-fun b!669520 () Bool)

(declare-fun res!436521 () Bool)

(assert (=> b!669520 (=> (not res!436521) (not e!382872))))

(assert (=> b!669520 (= res!436521 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19123 a!3626))))))

(declare-fun b!669522 () Bool)

(declare-fun res!436501 () Bool)

(assert (=> b!669522 (=> res!436501 e!382867)))

(assert (=> b!669522 (= res!436501 (contains!3360 lt!311519 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669523 () Bool)

(assert (=> b!669523 (= e!382872 (not e!382867))))

(declare-fun res!436503 () Bool)

(assert (=> b!669523 (=> res!436503 e!382867)))

(assert (=> b!669523 (= res!436503 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!669523 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!311519)))

(declare-fun lt!311511 () Unit!23498)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39132 (_ BitVec 64) (_ BitVec 32) List!12838 List!12838) Unit!23498)

(assert (=> b!669523 (= lt!311511 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!311519))))

(declare-fun -!114 (List!12838 (_ BitVec 64)) List!12838)

(assert (=> b!669523 (= (-!114 lt!311519 k0!2843) acc!681)))

(assert (=> b!669523 (= lt!311519 ($colon$colon!247 acc!681 k0!2843))))

(declare-fun lt!311514 () Unit!23498)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12838) Unit!23498)

(assert (=> b!669523 (= lt!311514 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!669523 (subseq!116 acc!681 acc!681)))

(declare-fun lt!311518 () Unit!23498)

(assert (=> b!669523 (= lt!311518 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!669523 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!311513 () Unit!23498)

(assert (=> b!669523 (= lt!311513 e!382876)))

(declare-fun c!76872 () Bool)

(assert (=> b!669523 (= c!76872 (validKeyInArray!0 (select (arr!18758 a!3626) from!3004)))))

(declare-fun lt!311517 () Unit!23498)

(assert (=> b!669523 (= lt!311517 e!382871)))

(declare-fun c!76871 () Bool)

(assert (=> b!669523 (= c!76871 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun lt!311520 () array!39132)

(assert (=> b!669523 (arrayContainsKey!0 lt!311520 k0!2843 from!3004)))

(assert (=> b!669523 (= lt!311520 (array!39133 (store (arr!18758 a!3626) i!1382 k0!2843) (size!19123 a!3626)))))

(declare-fun b!669524 () Bool)

(assert (=> b!669524 (= e!382870 (not (contains!3360 acc!681 k0!2843)))))

(declare-fun b!669525 () Bool)

(assert (=> b!669525 (= e!382877 (contains!3360 lt!311519 k0!2843))))

(declare-fun b!669526 () Bool)

(assert (=> b!669526 (= e!382867 (bvsle from!3004 (size!19123 a!3626)))))

(assert (=> b!669526 (arrayNoDuplicates!0 lt!311520 (bvadd #b00000000000000000000000000000001 from!3004) lt!311519)))

(declare-fun lt!311516 () Unit!23498)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39132 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12838) Unit!23498)

(assert (=> b!669526 (= lt!311516 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!311519))))

(declare-fun b!669527 () Bool)

(declare-fun res!436517 () Bool)

(assert (=> b!669527 (=> (not res!436517) (not e!382872))))

(assert (=> b!669527 (= res!436517 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12835))))

(declare-fun b!669528 () Bool)

(declare-fun Unit!23501 () Unit!23498)

(assert (=> b!669528 (= e!382871 Unit!23501)))

(declare-fun b!669529 () Bool)

(declare-fun res!436522 () Bool)

(assert (=> b!669529 (=> res!436522 e!382867)))

(assert (=> b!669529 (= res!436522 (contains!3360 lt!311519 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!669530 () Bool)

(declare-fun res!436502 () Bool)

(assert (=> b!669530 (=> (not res!436502) (not e!382872))))

(assert (=> b!669530 (= res!436502 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!669531 () Bool)

(declare-fun e!382875 () Bool)

(assert (=> b!669531 (= e!382875 (contains!3360 acc!681 k0!2843))))

(declare-fun b!669532 () Bool)

(declare-fun Unit!23502 () Unit!23498)

(assert (=> b!669532 (= e!382876 Unit!23502)))

(declare-fun res!436520 () Bool)

(assert (=> start!60074 (=> (not res!436520) (not e!382872))))

(assert (=> start!60074 (= res!436520 (and (bvslt (size!19123 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19123 a!3626))))))

(assert (=> start!60074 e!382872))

(assert (=> start!60074 true))

(declare-fun array_inv!14641 (array!39132) Bool)

(assert (=> start!60074 (array_inv!14641 a!3626)))

(declare-fun b!669521 () Bool)

(declare-fun res!436518 () Bool)

(assert (=> b!669521 (=> (not res!436518) (not e!382872))))

(assert (=> b!669521 (= res!436518 (noDuplicate!629 acc!681))))

(declare-fun b!669533 () Bool)

(declare-fun res!436519 () Bool)

(assert (=> b!669533 (=> (not res!436519) (not e!382872))))

(assert (=> b!669533 (= res!436519 e!382869)))

(declare-fun res!436511 () Bool)

(assert (=> b!669533 (=> res!436511 e!382869)))

(assert (=> b!669533 (= res!436511 e!382875)))

(declare-fun res!436515 () Bool)

(assert (=> b!669533 (=> (not res!436515) (not e!382875))))

(assert (=> b!669533 (= res!436515 (bvsgt from!3004 i!1382))))

(declare-fun b!669534 () Bool)

(declare-fun res!436509 () Bool)

(assert (=> b!669534 (=> (not res!436509) (not e!382872))))

(assert (=> b!669534 (= res!436509 (not (contains!3360 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60074 res!436520) b!669521))

(assert (= (and b!669521 res!436518) b!669518))

(assert (= (and b!669518 res!436505) b!669534))

(assert (= (and b!669534 res!436509) b!669533))

(assert (= (and b!669533 res!436515) b!669531))

(assert (= (and b!669533 (not res!436511)) b!669510))

(assert (= (and b!669510 res!436507) b!669524))

(assert (= (and b!669533 res!436519) b!669527))

(assert (= (and b!669527 res!436517) b!669530))

(assert (= (and b!669530 res!436502) b!669520))

(assert (= (and b!669520 res!436521) b!669509))

(assert (= (and b!669509 res!436510) b!669513))

(assert (= (and b!669513 res!436506) b!669515))

(assert (= (and b!669515 res!436504) b!669523))

(assert (= (and b!669523 c!76871) b!669514))

(assert (= (and b!669523 (not c!76871)) b!669528))

(assert (= (and b!669523 c!76872) b!669512))

(assert (= (and b!669523 (not c!76872)) b!669532))

(assert (= (and b!669523 (not res!436503)) b!669517))

(assert (= (and b!669517 (not res!436508)) b!669522))

(assert (= (and b!669522 (not res!436501)) b!669529))

(assert (= (and b!669529 (not res!436522)) b!669516))

(assert (= (and b!669516 (not res!436516)) b!669519))

(assert (= (and b!669516 res!436512) b!669511))

(assert (= (and b!669511 (not res!436514)) b!669525))

(assert (= (and b!669516 (not res!436513)) b!669526))

(declare-fun m!639033 () Bool)

(assert (=> b!669529 m!639033))

(declare-fun m!639035 () Bool)

(assert (=> b!669526 m!639035))

(declare-fun m!639037 () Bool)

(assert (=> b!669526 m!639037))

(declare-fun m!639039 () Bool)

(assert (=> b!669534 m!639039))

(declare-fun m!639041 () Bool)

(assert (=> b!669531 m!639041))

(declare-fun m!639043 () Bool)

(assert (=> b!669522 m!639043))

(declare-fun m!639045 () Bool)

(assert (=> b!669525 m!639045))

(declare-fun m!639047 () Bool)

(assert (=> b!669523 m!639047))

(declare-fun m!639049 () Bool)

(assert (=> b!669523 m!639049))

(declare-fun m!639051 () Bool)

(assert (=> b!669523 m!639051))

(declare-fun m!639053 () Bool)

(assert (=> b!669523 m!639053))

(declare-fun m!639055 () Bool)

(assert (=> b!669523 m!639055))

(declare-fun m!639057 () Bool)

(assert (=> b!669523 m!639057))

(declare-fun m!639059 () Bool)

(assert (=> b!669523 m!639059))

(declare-fun m!639061 () Bool)

(assert (=> b!669523 m!639061))

(declare-fun m!639063 () Bool)

(assert (=> b!669523 m!639063))

(assert (=> b!669523 m!639047))

(declare-fun m!639065 () Bool)

(assert (=> b!669523 m!639065))

(declare-fun m!639067 () Bool)

(assert (=> b!669523 m!639067))

(declare-fun m!639069 () Bool)

(assert (=> b!669523 m!639069))

(declare-fun m!639071 () Bool)

(assert (=> b!669523 m!639071))

(declare-fun m!639073 () Bool)

(assert (=> b!669518 m!639073))

(assert (=> b!669512 m!639069))

(assert (=> b!669512 m!639047))

(declare-fun m!639075 () Bool)

(assert (=> b!669512 m!639075))

(declare-fun m!639077 () Bool)

(assert (=> b!669512 m!639077))

(assert (=> b!669512 m!639047))

(assert (=> b!669512 m!639075))

(assert (=> b!669512 m!639055))

(assert (=> b!669512 m!639067))

(declare-fun m!639079 () Bool)

(assert (=> b!669530 m!639079))

(declare-fun m!639081 () Bool)

(assert (=> b!669517 m!639081))

(declare-fun m!639083 () Bool)

(assert (=> b!669509 m!639083))

(declare-fun m!639085 () Bool)

(assert (=> b!669521 m!639085))

(declare-fun m!639087 () Bool)

(assert (=> b!669514 m!639087))

(declare-fun m!639089 () Bool)

(assert (=> b!669513 m!639089))

(declare-fun m!639091 () Bool)

(assert (=> b!669527 m!639091))

(declare-fun m!639093 () Bool)

(assert (=> start!60074 m!639093))

(assert (=> b!669524 m!639041))

(assert (=> b!669519 m!639045))

(check-sat (not b!669525) (not start!60074) (not b!669517) (not b!669518) (not b!669522) (not b!669513) (not b!669524) (not b!669519) (not b!669523) (not b!669531) (not b!669526) (not b!669512) (not b!669530) (not b!669509) (not b!669527) (not b!669529) (not b!669514) (not b!669521) (not b!669534))
(check-sat)
