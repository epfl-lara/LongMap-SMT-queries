; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114334 () Bool)

(assert start!114334)

(declare-fun b!1356485 () Bool)

(declare-fun e!770506 () Bool)

(declare-fun e!770504 () Bool)

(assert (=> b!1356485 (= e!770506 e!770504)))

(declare-fun res!900680 () Bool)

(assert (=> b!1356485 (=> (not res!900680) (not e!770504))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lt!599003 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356485 (= res!900680 (and (not (= from!3120 i!1404)) (not lt!599003) (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!44462 0))(
  ( (Unit!44463) )
))
(declare-fun lt!599001 () Unit!44462)

(declare-fun e!770505 () Unit!44462)

(assert (=> b!1356485 (= lt!599001 e!770505)))

(declare-fun c!127354 () Bool)

(assert (=> b!1356485 (= c!127354 lt!599003)))

(declare-datatypes ((array!92407 0))(
  ( (array!92408 (arr!44647 (Array (_ BitVec 32) (_ BitVec 64))) (size!45198 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92407)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356485 (= lt!599003 (validKeyInArray!0 (select (arr!44647 a!3742) from!3120)))))

(declare-fun b!1356486 () Bool)

(declare-fun res!900675 () Bool)

(assert (=> b!1356486 (=> (not res!900675) (not e!770506))))

(declare-datatypes ((List!31675 0))(
  ( (Nil!31672) (Cons!31671 (h!32889 (_ BitVec 64)) (t!46325 List!31675)) )
))
(declare-fun acc!759 () List!31675)

(declare-fun arrayNoDuplicates!0 (array!92407 (_ BitVec 32) List!31675) Bool)

(assert (=> b!1356486 (= res!900675 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356487 () Bool)

(declare-fun res!900673 () Bool)

(assert (=> b!1356487 (=> (not res!900673) (not e!770506))))

(assert (=> b!1356487 (= res!900673 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45198 a!3742)))))

(declare-fun b!1356488 () Bool)

(declare-fun res!900676 () Bool)

(assert (=> b!1356488 (=> (not res!900676) (not e!770506))))

(assert (=> b!1356488 (= res!900676 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31672))))

(declare-fun b!1356489 () Bool)

(declare-fun res!900677 () Bool)

(assert (=> b!1356489 (=> (not res!900677) (not e!770506))))

(declare-fun noDuplicate!2218 (List!31675) Bool)

(assert (=> b!1356489 (= res!900677 (noDuplicate!2218 acc!759))))

(declare-fun b!1356490 () Bool)

(declare-fun res!900681 () Bool)

(assert (=> b!1356490 (=> (not res!900681) (not e!770506))))

(declare-fun contains!9387 (List!31675 (_ BitVec 64)) Bool)

(assert (=> b!1356490 (= res!900681 (not (contains!9387 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356491 () Bool)

(declare-fun Unit!44464 () Unit!44462)

(assert (=> b!1356491 (= e!770505 Unit!44464)))

(declare-fun b!1356493 () Bool)

(declare-fun res!900672 () Bool)

(assert (=> b!1356493 (=> (not res!900672) (not e!770506))))

(assert (=> b!1356493 (= res!900672 (not (contains!9387 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356494 () Bool)

(declare-fun lt!599004 () Unit!44462)

(assert (=> b!1356494 (= e!770505 lt!599004)))

(declare-fun lt!599002 () Unit!44462)

(declare-fun lemmaListSubSeqRefl!0 (List!31675) Unit!44462)

(assert (=> b!1356494 (= lt!599002 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!764 (List!31675 List!31675) Bool)

(assert (=> b!1356494 (subseq!764 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92407 List!31675 List!31675 (_ BitVec 32)) Unit!44462)

(declare-fun $colon$colon!778 (List!31675 (_ BitVec 64)) List!31675)

(assert (=> b!1356494 (= lt!599004 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!778 acc!759 (select (arr!44647 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1356494 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1356495 () Bool)

(declare-fun res!900674 () Bool)

(assert (=> b!1356495 (=> (not res!900674) (not e!770506))))

(assert (=> b!1356495 (= res!900674 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45198 a!3742))))))

(declare-fun b!1356496 () Bool)

(declare-fun res!900678 () Bool)

(assert (=> b!1356496 (=> (not res!900678) (not e!770506))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1356496 (= res!900678 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!900679 () Bool)

(assert (=> start!114334 (=> (not res!900679) (not e!770506))))

(assert (=> start!114334 (= res!900679 (and (bvslt (size!45198 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45198 a!3742))))))

(assert (=> start!114334 e!770506))

(assert (=> start!114334 true))

(declare-fun array_inv!33928 (array!92407) Bool)

(assert (=> start!114334 (array_inv!33928 a!3742)))

(declare-fun b!1356492 () Bool)

(assert (=> b!1356492 (= e!770504 false)))

(declare-fun lt!599000 () Bool)

(assert (=> b!1356492 (= lt!599000 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759))))

(assert (= (and start!114334 res!900679) b!1356489))

(assert (= (and b!1356489 res!900677) b!1356493))

(assert (= (and b!1356493 res!900672) b!1356490))

(assert (= (and b!1356490 res!900681) b!1356488))

(assert (= (and b!1356488 res!900676) b!1356486))

(assert (= (and b!1356486 res!900675) b!1356495))

(assert (= (and b!1356495 res!900674) b!1356496))

(assert (= (and b!1356496 res!900678) b!1356487))

(assert (= (and b!1356487 res!900673) b!1356485))

(assert (= (and b!1356485 c!127354) b!1356494))

(assert (= (and b!1356485 (not c!127354)) b!1356491))

(assert (= (and b!1356485 res!900680) b!1356492))

(declare-fun m!1243021 () Bool)

(assert (=> b!1356485 m!1243021))

(assert (=> b!1356485 m!1243021))

(declare-fun m!1243023 () Bool)

(assert (=> b!1356485 m!1243023))

(declare-fun m!1243025 () Bool)

(assert (=> b!1356490 m!1243025))

(declare-fun m!1243027 () Bool)

(assert (=> b!1356494 m!1243027))

(assert (=> b!1356494 m!1243021))

(declare-fun m!1243029 () Bool)

(assert (=> b!1356494 m!1243029))

(declare-fun m!1243031 () Bool)

(assert (=> b!1356494 m!1243031))

(declare-fun m!1243033 () Bool)

(assert (=> b!1356494 m!1243033))

(assert (=> b!1356494 m!1243021))

(assert (=> b!1356494 m!1243029))

(declare-fun m!1243035 () Bool)

(assert (=> b!1356494 m!1243035))

(declare-fun m!1243037 () Bool)

(assert (=> start!114334 m!1243037))

(declare-fun m!1243039 () Bool)

(assert (=> b!1356489 m!1243039))

(declare-fun m!1243041 () Bool)

(assert (=> b!1356493 m!1243041))

(assert (=> b!1356492 m!1243033))

(declare-fun m!1243043 () Bool)

(assert (=> b!1356488 m!1243043))

(declare-fun m!1243045 () Bool)

(assert (=> b!1356496 m!1243045))

(declare-fun m!1243047 () Bool)

(assert (=> b!1356486 m!1243047))

(check-sat (not b!1356489) (not b!1356492) (not b!1356488) (not start!114334) (not b!1356486) (not b!1356496) (not b!1356490) (not b!1356485) (not b!1356493) (not b!1356494))
(check-sat)
