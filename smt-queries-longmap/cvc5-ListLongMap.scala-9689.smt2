; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114474 () Bool)

(assert start!114474)

(declare-fun b!1358451 () Bool)

(declare-fun res!903135 () Bool)

(declare-fun e!771010 () Bool)

(assert (=> b!1358451 (=> (not res!903135) (not e!771010))))

(declare-datatypes ((List!31771 0))(
  ( (Nil!31768) (Cons!31767 (h!32976 (_ BitVec 64)) (t!46433 List!31771)) )
))
(declare-fun acc!759 () List!31771)

(declare-datatypes ((array!92419 0))(
  ( (array!92420 (arr!44652 (Array (_ BitVec 32) (_ BitVec 64))) (size!45204 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92419)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92419 (_ BitVec 32) List!31771) Bool)

(assert (=> b!1358451 (= res!903135 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358452 () Bool)

(declare-fun res!903132 () Bool)

(assert (=> b!1358452 (=> (not res!903132) (not e!771010))))

(assert (=> b!1358452 (= res!903132 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31768))))

(declare-fun b!1358453 () Bool)

(declare-fun res!903129 () Bool)

(assert (=> b!1358453 (=> (not res!903129) (not e!771010))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358453 (= res!903129 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358454 () Bool)

(declare-datatypes ((Unit!44532 0))(
  ( (Unit!44533) )
))
(declare-fun e!771009 () Unit!44532)

(declare-fun lt!599176 () Unit!44532)

(assert (=> b!1358454 (= e!771009 lt!599176)))

(declare-fun lt!599175 () Unit!44532)

(declare-fun lemmaListSubSeqRefl!0 (List!31771) Unit!44532)

(assert (=> b!1358454 (= lt!599175 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!829 (List!31771 List!31771) Bool)

(assert (=> b!1358454 (subseq!829 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92419 List!31771 List!31771 (_ BitVec 32)) Unit!44532)

(declare-fun $colon$colon!834 (List!31771 (_ BitVec 64)) List!31771)

(assert (=> b!1358454 (= lt!599176 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!834 acc!759 (select (arr!44652 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1358454 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1358455 () Bool)

(declare-fun res!903134 () Bool)

(assert (=> b!1358455 (=> (not res!903134) (not e!771010))))

(assert (=> b!1358455 (= res!903134 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45204 a!3742)))))

(declare-fun b!1358456 () Bool)

(assert (=> b!1358456 (= e!771010 false)))

(declare-fun lt!599174 () Unit!44532)

(assert (=> b!1358456 (= lt!599174 e!771009)))

(declare-fun c!127103 () Bool)

(assert (=> b!1358456 (= c!127103 (validKeyInArray!0 (select (arr!44652 a!3742) from!3120)))))

(declare-fun b!1358457 () Bool)

(declare-fun res!903131 () Bool)

(assert (=> b!1358457 (=> (not res!903131) (not e!771010))))

(declare-fun contains!9391 (List!31771 (_ BitVec 64)) Bool)

(assert (=> b!1358457 (= res!903131 (not (contains!9391 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358458 () Bool)

(declare-fun Unit!44534 () Unit!44532)

(assert (=> b!1358458 (= e!771009 Unit!44534)))

(declare-fun b!1358450 () Bool)

(declare-fun res!903136 () Bool)

(assert (=> b!1358450 (=> (not res!903136) (not e!771010))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358450 (= res!903136 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45204 a!3742))))))

(declare-fun res!903130 () Bool)

(assert (=> start!114474 (=> (not res!903130) (not e!771010))))

(assert (=> start!114474 (= res!903130 (and (bvslt (size!45204 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45204 a!3742))))))

(assert (=> start!114474 e!771010))

(assert (=> start!114474 true))

(declare-fun array_inv!33885 (array!92419) Bool)

(assert (=> start!114474 (array_inv!33885 a!3742)))

(declare-fun b!1358459 () Bool)

(declare-fun res!903137 () Bool)

(assert (=> b!1358459 (=> (not res!903137) (not e!771010))))

(assert (=> b!1358459 (= res!903137 (not (contains!9391 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358460 () Bool)

(declare-fun res!903133 () Bool)

(assert (=> b!1358460 (=> (not res!903133) (not e!771010))))

(declare-fun noDuplicate!2306 (List!31771) Bool)

(assert (=> b!1358460 (= res!903133 (noDuplicate!2306 acc!759))))

(assert (= (and start!114474 res!903130) b!1358460))

(assert (= (and b!1358460 res!903133) b!1358459))

(assert (= (and b!1358459 res!903137) b!1358457))

(assert (= (and b!1358457 res!903131) b!1358452))

(assert (= (and b!1358452 res!903132) b!1358451))

(assert (= (and b!1358451 res!903135) b!1358450))

(assert (= (and b!1358450 res!903136) b!1358453))

(assert (= (and b!1358453 res!903129) b!1358455))

(assert (= (and b!1358455 res!903134) b!1358456))

(assert (= (and b!1358456 c!127103) b!1358454))

(assert (= (and b!1358456 (not c!127103)) b!1358458))

(declare-fun m!1243575 () Bool)

(assert (=> b!1358460 m!1243575))

(declare-fun m!1243577 () Bool)

(assert (=> b!1358451 m!1243577))

(declare-fun m!1243579 () Bool)

(assert (=> b!1358456 m!1243579))

(assert (=> b!1358456 m!1243579))

(declare-fun m!1243581 () Bool)

(assert (=> b!1358456 m!1243581))

(declare-fun m!1243583 () Bool)

(assert (=> b!1358453 m!1243583))

(declare-fun m!1243585 () Bool)

(assert (=> b!1358454 m!1243585))

(assert (=> b!1358454 m!1243579))

(declare-fun m!1243587 () Bool)

(assert (=> b!1358454 m!1243587))

(declare-fun m!1243589 () Bool)

(assert (=> b!1358454 m!1243589))

(declare-fun m!1243591 () Bool)

(assert (=> b!1358454 m!1243591))

(assert (=> b!1358454 m!1243579))

(assert (=> b!1358454 m!1243587))

(declare-fun m!1243593 () Bool)

(assert (=> b!1358454 m!1243593))

(declare-fun m!1243595 () Bool)

(assert (=> start!114474 m!1243595))

(declare-fun m!1243597 () Bool)

(assert (=> b!1358452 m!1243597))

(declare-fun m!1243599 () Bool)

(assert (=> b!1358457 m!1243599))

(declare-fun m!1243601 () Bool)

(assert (=> b!1358459 m!1243601))

(push 1)

(assert (not b!1358452))

(assert (not b!1358460))

(assert (not b!1358451))

(assert (not b!1358457))

(assert (not b!1358459))

(assert (not b!1358454))

(assert (not b!1358456))

(assert (not b!1358453))

(assert (not start!114474))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

