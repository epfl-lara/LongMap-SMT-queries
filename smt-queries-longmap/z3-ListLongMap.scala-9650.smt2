; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114038 () Bool)

(assert start!114038)

(declare-fun b!1353396 () Bool)

(declare-fun res!898623 () Bool)

(declare-fun e!769098 () Bool)

(assert (=> b!1353396 (=> (not res!898623) (not e!769098))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1353396 (= res!898623 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1353397 () Bool)

(declare-datatypes ((Unit!44256 0))(
  ( (Unit!44257) )
))
(declare-fun e!769100 () Unit!44256)

(declare-fun lt!597705 () Unit!44256)

(assert (=> b!1353397 (= e!769100 lt!597705)))

(declare-fun lt!597703 () Unit!44256)

(declare-datatypes ((List!31652 0))(
  ( (Nil!31649) (Cons!31648 (h!32857 (_ BitVec 64)) (t!46302 List!31652)) )
))
(declare-fun acc!759 () List!31652)

(declare-fun lemmaListSubSeqRefl!0 (List!31652) Unit!44256)

(assert (=> b!1353397 (= lt!597703 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!728 (List!31652 List!31652) Bool)

(assert (=> b!1353397 (subseq!728 acc!759 acc!759)))

(declare-datatypes ((array!92169 0))(
  ( (array!92170 (arr!44533 (Array (_ BitVec 32) (_ BitVec 64))) (size!45085 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92169)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92169 List!31652 List!31652 (_ BitVec 32)) Unit!44256)

(declare-fun $colon$colon!745 (List!31652 (_ BitVec 64)) List!31652)

(assert (=> b!1353397 (= lt!597705 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!745 acc!759 (select (arr!44533 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(declare-fun arrayNoDuplicates!0 (array!92169 (_ BitVec 32) List!31652) Bool)

(assert (=> b!1353397 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1353398 () Bool)

(declare-fun res!898626 () Bool)

(declare-fun e!769099 () Bool)

(assert (=> b!1353398 (=> (not res!898626) (not e!769099))))

(declare-fun lt!597706 () List!31652)

(declare-fun contains!9272 (List!31652 (_ BitVec 64)) Bool)

(assert (=> b!1353398 (= res!898626 (not (contains!9272 lt!597706 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353399 () Bool)

(declare-fun res!898622 () Bool)

(assert (=> b!1353399 (=> (not res!898622) (not e!769098))))

(assert (=> b!1353399 (= res!898622 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31649))))

(declare-fun b!1353400 () Bool)

(declare-fun res!898627 () Bool)

(assert (=> b!1353400 (=> (not res!898627) (not e!769098))))

(assert (=> b!1353400 (= res!898627 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1353401 () Bool)

(assert (=> b!1353401 (= e!769099 false)))

(declare-fun lt!597701 () Bool)

(assert (=> b!1353401 (= lt!597701 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) lt!597706))))

(declare-fun b!1353402 () Bool)

(declare-fun res!898634 () Bool)

(assert (=> b!1353402 (=> (not res!898634) (not e!769098))))

(declare-fun noDuplicate!2187 (List!31652) Bool)

(assert (=> b!1353402 (= res!898634 (noDuplicate!2187 acc!759))))

(declare-fun b!1353403 () Bool)

(declare-fun res!898629 () Bool)

(assert (=> b!1353403 (=> (not res!898629) (not e!769099))))

(assert (=> b!1353403 (= res!898629 (noDuplicate!2187 lt!597706))))

(declare-fun b!1353404 () Bool)

(declare-fun e!769102 () Bool)

(assert (=> b!1353404 (= e!769098 e!769102)))

(declare-fun res!898633 () Bool)

(assert (=> b!1353404 (=> (not res!898633) (not e!769102))))

(declare-fun lt!597702 () Bool)

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1353404 (= res!898633 (and (not (= from!3120 i!1404)) lt!597702))))

(declare-fun lt!597704 () Unit!44256)

(assert (=> b!1353404 (= lt!597704 e!769100)))

(declare-fun c!126830 () Bool)

(assert (=> b!1353404 (= c!126830 lt!597702)))

(assert (=> b!1353404 (= lt!597702 (validKeyInArray!0 (select (arr!44533 a!3742) from!3120)))))

(declare-fun b!1353405 () Bool)

(declare-fun Unit!44258 () Unit!44256)

(assert (=> b!1353405 (= e!769100 Unit!44258)))

(declare-fun b!1353406 () Bool)

(assert (=> b!1353406 (= e!769102 e!769099)))

(declare-fun res!898631 () Bool)

(assert (=> b!1353406 (=> (not res!898631) (not e!769099))))

(assert (=> b!1353406 (= res!898631 (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000))))

(assert (=> b!1353406 (= lt!597706 ($colon$colon!745 acc!759 (select (arr!44533 a!3742) from!3120)))))

(declare-fun b!1353407 () Bool)

(declare-fun res!898630 () Bool)

(assert (=> b!1353407 (=> (not res!898630) (not e!769098))))

(assert (=> b!1353407 (= res!898630 (not (contains!9272 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353408 () Bool)

(declare-fun res!898628 () Bool)

(assert (=> b!1353408 (=> (not res!898628) (not e!769099))))

(assert (=> b!1353408 (= res!898628 (not (contains!9272 lt!597706 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353409 () Bool)

(declare-fun res!898625 () Bool)

(assert (=> b!1353409 (=> (not res!898625) (not e!769098))))

(assert (=> b!1353409 (= res!898625 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45085 a!3742))))))

(declare-fun res!898632 () Bool)

(assert (=> start!114038 (=> (not res!898632) (not e!769098))))

(assert (=> start!114038 (= res!898632 (and (bvslt (size!45085 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45085 a!3742))))))

(assert (=> start!114038 e!769098))

(assert (=> start!114038 true))

(declare-fun array_inv!33766 (array!92169) Bool)

(assert (=> start!114038 (array_inv!33766 a!3742)))

(declare-fun b!1353410 () Bool)

(declare-fun res!898621 () Bool)

(assert (=> b!1353410 (=> (not res!898621) (not e!769098))))

(assert (=> b!1353410 (= res!898621 (not (contains!9272 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1353411 () Bool)

(declare-fun res!898624 () Bool)

(assert (=> b!1353411 (=> (not res!898624) (not e!769098))))

(assert (=> b!1353411 (= res!898624 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45085 a!3742)))))

(assert (= (and start!114038 res!898632) b!1353402))

(assert (= (and b!1353402 res!898634) b!1353407))

(assert (= (and b!1353407 res!898630) b!1353410))

(assert (= (and b!1353410 res!898621) b!1353399))

(assert (= (and b!1353399 res!898622) b!1353400))

(assert (= (and b!1353400 res!898627) b!1353409))

(assert (= (and b!1353409 res!898625) b!1353396))

(assert (= (and b!1353396 res!898623) b!1353411))

(assert (= (and b!1353411 res!898624) b!1353404))

(assert (= (and b!1353404 c!126830) b!1353397))

(assert (= (and b!1353404 (not c!126830)) b!1353405))

(assert (= (and b!1353404 res!898633) b!1353406))

(assert (= (and b!1353406 res!898631) b!1353403))

(assert (= (and b!1353403 res!898629) b!1353408))

(assert (= (and b!1353408 res!898628) b!1353398))

(assert (= (and b!1353398 res!898626) b!1353401))

(declare-fun m!1239565 () Bool)

(assert (=> b!1353398 m!1239565))

(declare-fun m!1239567 () Bool)

(assert (=> start!114038 m!1239567))

(declare-fun m!1239569 () Bool)

(assert (=> b!1353397 m!1239569))

(declare-fun m!1239571 () Bool)

(assert (=> b!1353397 m!1239571))

(declare-fun m!1239573 () Bool)

(assert (=> b!1353397 m!1239573))

(declare-fun m!1239575 () Bool)

(assert (=> b!1353397 m!1239575))

(declare-fun m!1239577 () Bool)

(assert (=> b!1353397 m!1239577))

(assert (=> b!1353397 m!1239571))

(assert (=> b!1353397 m!1239573))

(declare-fun m!1239579 () Bool)

(assert (=> b!1353397 m!1239579))

(declare-fun m!1239581 () Bool)

(assert (=> b!1353399 m!1239581))

(declare-fun m!1239583 () Bool)

(assert (=> b!1353403 m!1239583))

(assert (=> b!1353406 m!1239571))

(assert (=> b!1353406 m!1239571))

(assert (=> b!1353406 m!1239573))

(declare-fun m!1239585 () Bool)

(assert (=> b!1353401 m!1239585))

(declare-fun m!1239587 () Bool)

(assert (=> b!1353410 m!1239587))

(declare-fun m!1239589 () Bool)

(assert (=> b!1353407 m!1239589))

(declare-fun m!1239591 () Bool)

(assert (=> b!1353396 m!1239591))

(declare-fun m!1239593 () Bool)

(assert (=> b!1353408 m!1239593))

(declare-fun m!1239595 () Bool)

(assert (=> b!1353400 m!1239595))

(assert (=> b!1353404 m!1239571))

(assert (=> b!1353404 m!1239571))

(declare-fun m!1239597 () Bool)

(assert (=> b!1353404 m!1239597))

(declare-fun m!1239599 () Bool)

(assert (=> b!1353402 m!1239599))

(check-sat (not b!1353399) (not b!1353408) (not b!1353397) (not b!1353407) (not b!1353404) (not b!1353400) (not b!1353410) (not b!1353406) (not start!114038) (not b!1353403) (not b!1353398) (not b!1353402) (not b!1353401) (not b!1353396))
(check-sat)
