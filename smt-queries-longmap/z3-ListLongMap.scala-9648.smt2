; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114250 () Bool)

(assert start!114250)

(declare-fun b!1354477 () Bool)

(declare-fun res!898921 () Bool)

(declare-fun e!769888 () Bool)

(assert (=> b!1354477 (=> (not res!898921) (not e!769888))))

(declare-datatypes ((List!31633 0))(
  ( (Nil!31630) (Cons!31629 (h!32847 (_ BitVec 64)) (t!46283 List!31633)) )
))
(declare-fun acc!759 () List!31633)

(declare-fun noDuplicate!2176 (List!31633) Bool)

(assert (=> b!1354477 (= res!898921 (noDuplicate!2176 acc!759))))

(declare-fun b!1354478 () Bool)

(declare-fun res!898928 () Bool)

(declare-fun e!769886 () Bool)

(assert (=> b!1354478 (=> (not res!898928) (not e!769886))))

(declare-fun lt!598258 () List!31633)

(declare-fun contains!9345 (List!31633 (_ BitVec 64)) Bool)

(assert (=> b!1354478 (= res!898928 (not (contains!9345 lt!598258 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354479 () Bool)

(assert (=> b!1354479 (= e!769886 false)))

(declare-fun lt!598257 () Bool)

(declare-datatypes ((array!92323 0))(
  ( (array!92324 (arr!44605 (Array (_ BitVec 32) (_ BitVec 64))) (size!45156 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92323)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92323 (_ BitVec 32) List!31633) Bool)

(assert (=> b!1354479 (= lt!598257 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598258))))

(declare-fun b!1354480 () Bool)

(declare-fun res!898920 () Bool)

(assert (=> b!1354480 (=> (not res!898920) (not e!769888))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354480 (= res!898920 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45156 a!3742))))))

(declare-fun b!1354481 () Bool)

(declare-fun e!769885 () Bool)

(assert (=> b!1354481 (= e!769885 e!769886)))

(declare-fun res!898916 () Bool)

(assert (=> b!1354481 (=> (not res!898916) (not e!769886))))

(assert (=> b!1354481 (= res!898916 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!736 (List!31633 (_ BitVec 64)) List!31633)

(assert (=> b!1354481 (= lt!598258 ($colon$colon!736 acc!759 (select (arr!44605 a!3742) from!3120)))))

(declare-fun res!898919 () Bool)

(assert (=> start!114250 (=> (not res!898919) (not e!769888))))

(assert (=> start!114250 (= res!898919 (and (bvslt (size!45156 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45156 a!3742))))))

(assert (=> start!114250 e!769888))

(assert (=> start!114250 true))

(declare-fun array_inv!33886 (array!92323) Bool)

(assert (=> start!114250 (array_inv!33886 a!3742)))

(declare-fun b!1354482 () Bool)

(declare-datatypes ((Unit!44336 0))(
  ( (Unit!44337) )
))
(declare-fun e!769887 () Unit!44336)

(declare-fun Unit!44338 () Unit!44336)

(assert (=> b!1354482 (= e!769887 Unit!44338)))

(declare-fun b!1354483 () Bool)

(declare-fun lt!598255 () Unit!44336)

(assert (=> b!1354483 (= e!769887 lt!598255)))

(declare-fun lt!598256 () Unit!44336)

(declare-fun lemmaListSubSeqRefl!0 (List!31633) Unit!44336)

(assert (=> b!1354483 (= lt!598256 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!722 (List!31633 List!31633) Bool)

(assert (=> b!1354483 (subseq!722 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92323 List!31633 List!31633 (_ BitVec 32)) Unit!44336)

(assert (=> b!1354483 (= lt!598255 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!736 acc!759 (select (arr!44605 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354483 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354484 () Bool)

(declare-fun res!898918 () Bool)

(assert (=> b!1354484 (=> (not res!898918) (not e!769888))))

(assert (=> b!1354484 (= res!898918 (not (contains!9345 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354485 () Bool)

(declare-fun res!898923 () Bool)

(assert (=> b!1354485 (=> (not res!898923) (not e!769886))))

(assert (=> b!1354485 (= res!898923 (not (contains!9345 lt!598258 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354486 () Bool)

(declare-fun res!898927 () Bool)

(assert (=> b!1354486 (=> (not res!898927) (not e!769888))))

(assert (=> b!1354486 (= res!898927 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31630))))

(declare-fun b!1354487 () Bool)

(declare-fun res!898925 () Bool)

(assert (=> b!1354487 (=> (not res!898925) (not e!769888))))

(assert (=> b!1354487 (= res!898925 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45156 a!3742)))))

(declare-fun b!1354488 () Bool)

(declare-fun res!898929 () Bool)

(assert (=> b!1354488 (=> (not res!898929) (not e!769888))))

(assert (=> b!1354488 (= res!898929 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354489 () Bool)

(assert (=> b!1354489 (= e!769888 e!769885)))

(declare-fun res!898922 () Bool)

(assert (=> b!1354489 (=> (not res!898922) (not e!769885))))

(declare-fun lt!598260 () Bool)

(assert (=> b!1354489 (= res!898922 (and (not (= from!3120 i!1404)) lt!598260))))

(declare-fun lt!598259 () Unit!44336)

(assert (=> b!1354489 (= lt!598259 e!769887)))

(declare-fun c!127228 () Bool)

(assert (=> b!1354489 (= c!127228 lt!598260)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354489 (= lt!598260 (validKeyInArray!0 (select (arr!44605 a!3742) from!3120)))))

(declare-fun b!1354490 () Bool)

(declare-fun res!898924 () Bool)

(assert (=> b!1354490 (=> (not res!898924) (not e!769888))))

(assert (=> b!1354490 (= res!898924 (not (contains!9345 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354491 () Bool)

(declare-fun res!898926 () Bool)

(assert (=> b!1354491 (=> (not res!898926) (not e!769888))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354491 (= res!898926 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354492 () Bool)

(declare-fun res!898917 () Bool)

(assert (=> b!1354492 (=> (not res!898917) (not e!769886))))

(assert (=> b!1354492 (= res!898917 (noDuplicate!2176 lt!598258))))

(assert (= (and start!114250 res!898919) b!1354477))

(assert (= (and b!1354477 res!898921) b!1354490))

(assert (= (and b!1354490 res!898924) b!1354484))

(assert (= (and b!1354484 res!898918) b!1354486))

(assert (= (and b!1354486 res!898927) b!1354488))

(assert (= (and b!1354488 res!898929) b!1354480))

(assert (= (and b!1354480 res!898920) b!1354491))

(assert (= (and b!1354491 res!898926) b!1354487))

(assert (= (and b!1354487 res!898925) b!1354489))

(assert (= (and b!1354489 c!127228) b!1354483))

(assert (= (and b!1354489 (not c!127228)) b!1354482))

(assert (= (and b!1354489 res!898922) b!1354481))

(assert (= (and b!1354481 res!898916) b!1354492))

(assert (= (and b!1354492 res!898917) b!1354478))

(assert (= (and b!1354478 res!898928) b!1354485))

(assert (= (and b!1354485 res!898923) b!1354479))

(declare-fun m!1241461 () Bool)

(assert (=> b!1354485 m!1241461))

(declare-fun m!1241463 () Bool)

(assert (=> b!1354490 m!1241463))

(declare-fun m!1241465 () Bool)

(assert (=> b!1354489 m!1241465))

(assert (=> b!1354489 m!1241465))

(declare-fun m!1241467 () Bool)

(assert (=> b!1354489 m!1241467))

(declare-fun m!1241469 () Bool)

(assert (=> b!1354488 m!1241469))

(declare-fun m!1241471 () Bool)

(assert (=> b!1354484 m!1241471))

(declare-fun m!1241473 () Bool)

(assert (=> b!1354483 m!1241473))

(assert (=> b!1354483 m!1241465))

(declare-fun m!1241475 () Bool)

(assert (=> b!1354483 m!1241475))

(declare-fun m!1241477 () Bool)

(assert (=> b!1354483 m!1241477))

(declare-fun m!1241479 () Bool)

(assert (=> b!1354483 m!1241479))

(assert (=> b!1354483 m!1241465))

(assert (=> b!1354483 m!1241475))

(declare-fun m!1241481 () Bool)

(assert (=> b!1354483 m!1241481))

(declare-fun m!1241483 () Bool)

(assert (=> start!114250 m!1241483))

(declare-fun m!1241485 () Bool)

(assert (=> b!1354491 m!1241485))

(declare-fun m!1241487 () Bool)

(assert (=> b!1354477 m!1241487))

(declare-fun m!1241489 () Bool)

(assert (=> b!1354486 m!1241489))

(assert (=> b!1354481 m!1241465))

(assert (=> b!1354481 m!1241465))

(assert (=> b!1354481 m!1241475))

(declare-fun m!1241491 () Bool)

(assert (=> b!1354479 m!1241491))

(declare-fun m!1241493 () Bool)

(assert (=> b!1354478 m!1241493))

(declare-fun m!1241495 () Bool)

(assert (=> b!1354492 m!1241495))

(check-sat (not b!1354477) (not b!1354492) (not b!1354481) (not b!1354488) (not b!1354478) (not b!1354479) (not b!1354485) (not start!114250) (not b!1354490) (not b!1354491) (not b!1354486) (not b!1354484) (not b!1354483) (not b!1354489))
(check-sat)
