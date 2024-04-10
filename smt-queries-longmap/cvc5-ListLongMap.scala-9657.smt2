; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114080 () Bool)

(assert start!114080)

(declare-fun b!1354476 () Bool)

(declare-fun res!899536 () Bool)

(declare-fun e!769447 () Bool)

(assert (=> b!1354476 (=> (not res!899536) (not e!769447))))

(declare-datatypes ((List!31620 0))(
  ( (Nil!31617) (Cons!31616 (h!32825 (_ BitVec 64)) (t!46278 List!31620)) )
))
(declare-fun acc!759 () List!31620)

(declare-fun contains!9329 (List!31620 (_ BitVec 64)) Bool)

(assert (=> b!1354476 (= res!899536 (not (contains!9329 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354477 () Bool)

(declare-fun res!899541 () Bool)

(assert (=> b!1354477 (=> (not res!899541) (not e!769447))))

(declare-datatypes ((array!92262 0))(
  ( (array!92263 (arr!44579 (Array (_ BitVec 32) (_ BitVec 64))) (size!45129 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92262)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92262 (_ BitVec 32) List!31620) Bool)

(assert (=> b!1354477 (= res!899541 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1354478 () Bool)

(declare-fun res!899538 () Bool)

(assert (=> b!1354478 (=> (not res!899538) (not e!769447))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1354478 (= res!899538 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45129 a!3742))))))

(declare-fun b!1354479 () Bool)

(declare-fun res!899545 () Bool)

(declare-fun e!769449 () Bool)

(assert (=> b!1354479 (=> (not res!899545) (not e!769449))))

(declare-fun lt!598265 () List!31620)

(assert (=> b!1354479 (= res!899545 (not (contains!9329 lt!598265 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354480 () Bool)

(declare-fun res!899547 () Bool)

(assert (=> b!1354480 (=> (not res!899547) (not e!769449))))

(assert (=> b!1354480 (= res!899547 (not (contains!9329 lt!598265 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354481 () Bool)

(assert (=> b!1354481 (= e!769449 (not (bvsle from!3120 (size!45129 a!3742))))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1354481 (arrayNoDuplicates!0 (array!92263 (store (arr!44579 a!3742) i!1404 l!3587) (size!45129 a!3742)) (bvadd #b00000000000000000000000000000001 from!3120) lt!598265)))

(declare-datatypes ((Unit!44478 0))(
  ( (Unit!44479) )
))
(declare-fun lt!598270 () Unit!44478)

(declare-fun lemmaPutNonValidKeyPreservesNoDuplicate!0 (array!92262 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!31620) Unit!44478)

(assert (=> b!1354481 (= lt!598270 (lemmaPutNonValidKeyPreservesNoDuplicate!0 a!3742 l!3587 i!1404 (bvadd #b00000000000000000000000000000001 from!3120) lt!598265))))

(declare-fun res!899544 () Bool)

(assert (=> start!114080 (=> (not res!899544) (not e!769447))))

(assert (=> start!114080 (= res!899544 (and (bvslt (size!45129 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45129 a!3742))))))

(assert (=> start!114080 e!769447))

(assert (=> start!114080 true))

(declare-fun array_inv!33607 (array!92262) Bool)

(assert (=> start!114080 (array_inv!33607 a!3742)))

(declare-fun b!1354482 () Bool)

(declare-fun res!899540 () Bool)

(assert (=> b!1354482 (=> (not res!899540) (not e!769449))))

(assert (=> b!1354482 (= res!899540 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!598265))))

(declare-fun b!1354483 () Bool)

(declare-fun e!769450 () Bool)

(assert (=> b!1354483 (= e!769450 e!769449)))

(declare-fun res!899548 () Bool)

(assert (=> b!1354483 (=> (not res!899548) (not e!769449))))

(assert (=> b!1354483 (= res!899548 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!764 (List!31620 (_ BitVec 64)) List!31620)

(assert (=> b!1354483 (= lt!598265 ($colon$colon!764 acc!759 (select (arr!44579 a!3742) from!3120)))))

(declare-fun b!1354484 () Bool)

(declare-fun res!899537 () Bool)

(assert (=> b!1354484 (=> (not res!899537) (not e!769447))))

(assert (=> b!1354484 (= res!899537 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45129 a!3742)))))

(declare-fun b!1354485 () Bool)

(declare-fun res!899542 () Bool)

(assert (=> b!1354485 (=> (not res!899542) (not e!769449))))

(declare-fun noDuplicate!2186 (List!31620) Bool)

(assert (=> b!1354485 (= res!899542 (noDuplicate!2186 lt!598265))))

(declare-fun b!1354486 () Bool)

(declare-fun e!769448 () Unit!44478)

(declare-fun Unit!44480 () Unit!44478)

(assert (=> b!1354486 (= e!769448 Unit!44480)))

(declare-fun b!1354487 () Bool)

(declare-fun lt!598267 () Unit!44478)

(assert (=> b!1354487 (= e!769448 lt!598267)))

(declare-fun lt!598268 () Unit!44478)

(declare-fun lemmaListSubSeqRefl!0 (List!31620) Unit!44478)

(assert (=> b!1354487 (= lt!598268 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!749 (List!31620 List!31620) Bool)

(assert (=> b!1354487 (subseq!749 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92262 List!31620 List!31620 (_ BitVec 32)) Unit!44478)

(assert (=> b!1354487 (= lt!598267 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!764 acc!759 (select (arr!44579 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1354487 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1354488 () Bool)

(declare-fun res!899535 () Bool)

(assert (=> b!1354488 (=> (not res!899535) (not e!769447))))

(assert (=> b!1354488 (= res!899535 (not (contains!9329 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1354489 () Bool)

(declare-fun res!899534 () Bool)

(assert (=> b!1354489 (=> (not res!899534) (not e!769447))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1354489 (= res!899534 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1354490 () Bool)

(declare-fun res!899539 () Bool)

(assert (=> b!1354490 (=> (not res!899539) (not e!769447))))

(assert (=> b!1354490 (= res!899539 (noDuplicate!2186 acc!759))))

(declare-fun b!1354491 () Bool)

(assert (=> b!1354491 (= e!769447 e!769450)))

(declare-fun res!899543 () Bool)

(assert (=> b!1354491 (=> (not res!899543) (not e!769450))))

(declare-fun lt!598269 () Bool)

(assert (=> b!1354491 (= res!899543 (and (not (= from!3120 i!1404)) lt!598269))))

(declare-fun lt!598266 () Unit!44478)

(assert (=> b!1354491 (= lt!598266 e!769448)))

(declare-fun c!126911 () Bool)

(assert (=> b!1354491 (= c!126911 lt!598269)))

(assert (=> b!1354491 (= lt!598269 (validKeyInArray!0 (select (arr!44579 a!3742) from!3120)))))

(declare-fun b!1354492 () Bool)

(declare-fun res!899546 () Bool)

(assert (=> b!1354492 (=> (not res!899546) (not e!769447))))

(assert (=> b!1354492 (= res!899546 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31617))))

(assert (= (and start!114080 res!899544) b!1354490))

(assert (= (and b!1354490 res!899539) b!1354476))

(assert (= (and b!1354476 res!899536) b!1354488))

(assert (= (and b!1354488 res!899535) b!1354492))

(assert (= (and b!1354492 res!899546) b!1354477))

(assert (= (and b!1354477 res!899541) b!1354478))

(assert (= (and b!1354478 res!899538) b!1354489))

(assert (= (and b!1354489 res!899534) b!1354484))

(assert (= (and b!1354484 res!899537) b!1354491))

(assert (= (and b!1354491 c!126911) b!1354487))

(assert (= (and b!1354491 (not c!126911)) b!1354486))

(assert (= (and b!1354491 res!899543) b!1354483))

(assert (= (and b!1354483 res!899548) b!1354485))

(assert (= (and b!1354485 res!899542) b!1354480))

(assert (= (and b!1354480 res!899547) b!1354479))

(assert (= (and b!1354479 res!899545) b!1354482))

(assert (= (and b!1354482 res!899540) b!1354481))

(declare-fun m!1240837 () Bool)

(assert (=> b!1354488 m!1240837))

(declare-fun m!1240839 () Bool)

(assert (=> b!1354483 m!1240839))

(assert (=> b!1354483 m!1240839))

(declare-fun m!1240841 () Bool)

(assert (=> b!1354483 m!1240841))

(declare-fun m!1240843 () Bool)

(assert (=> b!1354487 m!1240843))

(assert (=> b!1354487 m!1240839))

(assert (=> b!1354487 m!1240841))

(declare-fun m!1240845 () Bool)

(assert (=> b!1354487 m!1240845))

(declare-fun m!1240847 () Bool)

(assert (=> b!1354487 m!1240847))

(assert (=> b!1354487 m!1240839))

(assert (=> b!1354487 m!1240841))

(declare-fun m!1240849 () Bool)

(assert (=> b!1354487 m!1240849))

(declare-fun m!1240851 () Bool)

(assert (=> b!1354490 m!1240851))

(declare-fun m!1240853 () Bool)

(assert (=> b!1354480 m!1240853))

(declare-fun m!1240855 () Bool)

(assert (=> b!1354477 m!1240855))

(declare-fun m!1240857 () Bool)

(assert (=> b!1354476 m!1240857))

(declare-fun m!1240859 () Bool)

(assert (=> b!1354481 m!1240859))

(declare-fun m!1240861 () Bool)

(assert (=> b!1354481 m!1240861))

(declare-fun m!1240863 () Bool)

(assert (=> b!1354481 m!1240863))

(declare-fun m!1240865 () Bool)

(assert (=> b!1354482 m!1240865))

(declare-fun m!1240867 () Bool)

(assert (=> b!1354485 m!1240867))

(declare-fun m!1240869 () Bool)

(assert (=> b!1354492 m!1240869))

(assert (=> b!1354491 m!1240839))

(assert (=> b!1354491 m!1240839))

(declare-fun m!1240871 () Bool)

(assert (=> b!1354491 m!1240871))

(declare-fun m!1240873 () Bool)

(assert (=> b!1354479 m!1240873))

(declare-fun m!1240875 () Bool)

(assert (=> start!114080 m!1240875))

(declare-fun m!1240877 () Bool)

(assert (=> b!1354489 m!1240877))

(push 1)

(assert (not b!1354479))

(assert (not b!1354483))

(assert (not b!1354481))

(assert (not b!1354477))

(assert (not b!1354489))

(assert (not b!1354487))

(assert (not b!1354480))

(assert (not b!1354482))

(assert (not start!114080))

(assert (not b!1354488))

(assert (not b!1354485))

(assert (not b!1354491))

(assert (not b!1354490))

(assert (not b!1354492))

(assert (not b!1354476))

(check-sat)

(pop 1)

(push 1)

(check-sat)

