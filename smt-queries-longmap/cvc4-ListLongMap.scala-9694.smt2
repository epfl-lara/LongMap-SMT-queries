; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114504 () Bool)

(assert start!114504)

(declare-fun b!1359016 () Bool)

(declare-datatypes ((Unit!44736 0))(
  ( (Unit!44737) )
))
(declare-fun e!771177 () Unit!44736)

(declare-fun Unit!44738 () Unit!44736)

(assert (=> b!1359016 (= e!771177 Unit!44738)))

(declare-fun b!1359017 () Bool)

(declare-fun res!903568 () Bool)

(declare-fun e!771176 () Bool)

(assert (=> b!1359017 (=> (not res!903568) (not e!771176))))

(declare-datatypes ((List!31733 0))(
  ( (Nil!31730) (Cons!31729 (h!32938 (_ BitVec 64)) (t!46403 List!31733)) )
))
(declare-fun acc!759 () List!31733)

(declare-datatypes ((array!92500 0))(
  ( (array!92501 (arr!44692 (Array (_ BitVec 32) (_ BitVec 64))) (size!45242 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92500)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92500 (_ BitVec 32) List!31733) Bool)

(assert (=> b!1359017 (= res!903568 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1359018 () Bool)

(declare-fun res!903569 () Bool)

(assert (=> b!1359018 (=> (not res!903569) (not e!771176))))

(assert (=> b!1359018 (= res!903569 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45242 a!3742)))))

(declare-fun b!1359019 () Bool)

(declare-fun lt!599495 () Unit!44736)

(assert (=> b!1359019 (= e!771177 lt!599495)))

(declare-fun lt!599497 () Unit!44736)

(declare-fun lemmaListSubSeqRefl!0 (List!31733) Unit!44736)

(assert (=> b!1359019 (= lt!599497 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!844 (List!31733 List!31733) Bool)

(assert (=> b!1359019 (subseq!844 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92500 List!31733 List!31733 (_ BitVec 32)) Unit!44736)

(declare-fun $colon$colon!847 (List!31733 (_ BitVec 64)) List!31733)

(assert (=> b!1359019 (= lt!599495 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!847 acc!759 (select (arr!44692 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1359019 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1359020 () Bool)

(declare-fun res!903566 () Bool)

(assert (=> b!1359020 (=> (not res!903566) (not e!771176))))

(assert (=> b!1359020 (= res!903566 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31730))))

(declare-fun b!1359021 () Bool)

(declare-fun res!903567 () Bool)

(assert (=> b!1359021 (=> (not res!903567) (not e!771176))))

(declare-fun noDuplicate!2299 (List!31733) Bool)

(assert (=> b!1359021 (= res!903567 (noDuplicate!2299 acc!759))))

(declare-fun b!1359022 () Bool)

(declare-fun res!903564 () Bool)

(assert (=> b!1359022 (=> (not res!903564) (not e!771176))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1359022 (= res!903564 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1359023 () Bool)

(declare-fun res!903563 () Bool)

(assert (=> b!1359023 (=> (not res!903563) (not e!771176))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1359023 (= res!903563 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45242 a!3742))))))

(declare-fun res!903565 () Bool)

(assert (=> start!114504 (=> (not res!903565) (not e!771176))))

(assert (=> start!114504 (= res!903565 (and (bvslt (size!45242 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45242 a!3742))))))

(assert (=> start!114504 e!771176))

(assert (=> start!114504 true))

(declare-fun array_inv!33720 (array!92500) Bool)

(assert (=> start!114504 (array_inv!33720 a!3742)))

(declare-fun b!1359015 () Bool)

(assert (=> b!1359015 (= e!771176 false)))

(declare-fun lt!599496 () Unit!44736)

(assert (=> b!1359015 (= lt!599496 e!771177)))

(declare-fun c!127166 () Bool)

(assert (=> b!1359015 (= c!127166 (validKeyInArray!0 (select (arr!44692 a!3742) from!3120)))))

(declare-fun b!1359024 () Bool)

(declare-fun res!903571 () Bool)

(assert (=> b!1359024 (=> (not res!903571) (not e!771176))))

(declare-fun contains!9442 (List!31733 (_ BitVec 64)) Bool)

(assert (=> b!1359024 (= res!903571 (not (contains!9442 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1359025 () Bool)

(declare-fun res!903570 () Bool)

(assert (=> b!1359025 (=> (not res!903570) (not e!771176))))

(assert (=> b!1359025 (= res!903570 (not (contains!9442 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114504 res!903565) b!1359021))

(assert (= (and b!1359021 res!903567) b!1359025))

(assert (= (and b!1359025 res!903570) b!1359024))

(assert (= (and b!1359024 res!903571) b!1359020))

(assert (= (and b!1359020 res!903566) b!1359017))

(assert (= (and b!1359017 res!903568) b!1359023))

(assert (= (and b!1359023 res!903563) b!1359022))

(assert (= (and b!1359022 res!903564) b!1359018))

(assert (= (and b!1359018 res!903569) b!1359015))

(assert (= (and b!1359015 c!127166) b!1359019))

(assert (= (and b!1359015 (not c!127166)) b!1359016))

(declare-fun m!1244511 () Bool)

(assert (=> b!1359025 m!1244511))

(declare-fun m!1244513 () Bool)

(assert (=> b!1359019 m!1244513))

(declare-fun m!1244515 () Bool)

(assert (=> b!1359019 m!1244515))

(declare-fun m!1244517 () Bool)

(assert (=> b!1359019 m!1244517))

(declare-fun m!1244519 () Bool)

(assert (=> b!1359019 m!1244519))

(declare-fun m!1244521 () Bool)

(assert (=> b!1359019 m!1244521))

(assert (=> b!1359019 m!1244515))

(assert (=> b!1359019 m!1244517))

(declare-fun m!1244523 () Bool)

(assert (=> b!1359019 m!1244523))

(declare-fun m!1244525 () Bool)

(assert (=> b!1359017 m!1244525))

(declare-fun m!1244527 () Bool)

(assert (=> b!1359020 m!1244527))

(assert (=> b!1359015 m!1244515))

(assert (=> b!1359015 m!1244515))

(declare-fun m!1244529 () Bool)

(assert (=> b!1359015 m!1244529))

(declare-fun m!1244531 () Bool)

(assert (=> b!1359024 m!1244531))

(declare-fun m!1244533 () Bool)

(assert (=> start!114504 m!1244533))

(declare-fun m!1244535 () Bool)

(assert (=> b!1359022 m!1244535))

(declare-fun m!1244537 () Bool)

(assert (=> b!1359021 m!1244537))

(push 1)

(assert (not b!1359025))

(assert (not b!1359015))

(assert (not b!1359022))

(assert (not b!1359024))

(assert (not start!114504))

(assert (not b!1359017))

(assert (not b!1359019))

(assert (not b!1359020))

(assert (not b!1359021))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

