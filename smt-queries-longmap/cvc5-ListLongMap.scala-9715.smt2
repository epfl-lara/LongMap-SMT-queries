; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114962 () Bool)

(assert start!114962)

(declare-fun b!1362573 () Bool)

(declare-fun res!906544 () Bool)

(declare-fun e!772919 () Bool)

(assert (=> b!1362573 (=> (not res!906544) (not e!772919))))

(declare-datatypes ((List!31794 0))(
  ( (Nil!31791) (Cons!31790 (h!32999 (_ BitVec 64)) (t!46482 List!31794)) )
))
(declare-fun acc!759 () List!31794)

(declare-fun noDuplicate!2360 (List!31794) Bool)

(assert (=> b!1362573 (= res!906544 (noDuplicate!2360 acc!759))))

(declare-fun res!906542 () Bool)

(assert (=> start!114962 (=> (not res!906542) (not e!772919))))

(declare-datatypes ((array!92640 0))(
  ( (array!92641 (arr!44753 (Array (_ BitVec 32) (_ BitVec 64))) (size!45303 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92640)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114962 (= res!906542 (and (bvslt (size!45303 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45303 a!3742))))))

(assert (=> start!114962 e!772919))

(assert (=> start!114962 true))

(declare-fun array_inv!33781 (array!92640) Bool)

(assert (=> start!114962 (array_inv!33781 a!3742)))

(declare-fun b!1362574 () Bool)

(declare-fun res!906546 () Bool)

(assert (=> b!1362574 (=> (not res!906546) (not e!772919))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1362574 (= res!906546 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1362575 () Bool)

(declare-fun res!906545 () Bool)

(assert (=> b!1362575 (=> (not res!906545) (not e!772919))))

(declare-fun arrayNoDuplicates!0 (array!92640 (_ BitVec 32) List!31794) Bool)

(assert (=> b!1362575 (= res!906545 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1362576 () Bool)

(assert (=> b!1362576 (= e!772919 false)))

(declare-datatypes ((Unit!44919 0))(
  ( (Unit!44920) )
))
(declare-fun lt!600521 () Unit!44919)

(declare-fun e!772920 () Unit!44919)

(assert (=> b!1362576 (= lt!600521 e!772920)))

(declare-fun c!127457 () Bool)

(assert (=> b!1362576 (= c!127457 (validKeyInArray!0 (select (arr!44753 a!3742) from!3120)))))

(declare-fun b!1362577 () Bool)

(declare-fun res!906543 () Bool)

(assert (=> b!1362577 (=> (not res!906543) (not e!772919))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1362577 (= res!906543 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45303 a!3742))))))

(declare-fun b!1362578 () Bool)

(declare-fun res!906541 () Bool)

(assert (=> b!1362578 (=> (not res!906541) (not e!772919))))

(declare-fun contains!9503 (List!31794 (_ BitVec 64)) Bool)

(assert (=> b!1362578 (= res!906541 (not (contains!9503 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1362579 () Bool)

(declare-fun Unit!44921 () Unit!44919)

(assert (=> b!1362579 (= e!772920 Unit!44921)))

(declare-fun b!1362580 () Bool)

(declare-fun lt!600522 () Unit!44919)

(assert (=> b!1362580 (= e!772920 lt!600522)))

(declare-fun lt!600523 () Unit!44919)

(declare-fun lemmaListSubSeqRefl!0 (List!31794) Unit!44919)

(assert (=> b!1362580 (= lt!600523 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun subseq!905 (List!31794 List!31794) Bool)

(assert (=> b!1362580 (subseq!905 acc!759 acc!759)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92640 List!31794 List!31794 (_ BitVec 32)) Unit!44919)

(declare-fun $colon$colon!908 (List!31794 (_ BitVec 64)) List!31794)

(assert (=> b!1362580 (= lt!600522 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3742 ($colon$colon!908 acc!759 (select (arr!44753 a!3742) from!3120)) acc!759 (bvadd #b00000000000000000000000000000001 from!3120)))))

(assert (=> b!1362580 (arrayNoDuplicates!0 a!3742 (bvadd #b00000000000000000000000000000001 from!3120) acc!759)))

(declare-fun b!1362581 () Bool)

(declare-fun res!906539 () Bool)

(assert (=> b!1362581 (=> (not res!906539) (not e!772919))))

(assert (=> b!1362581 (= res!906539 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45303 a!3742)))))

(declare-fun b!1362582 () Bool)

(declare-fun res!906547 () Bool)

(assert (=> b!1362582 (=> (not res!906547) (not e!772919))))

(assert (=> b!1362582 (= res!906547 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31791))))

(declare-fun b!1362583 () Bool)

(declare-fun res!906540 () Bool)

(assert (=> b!1362583 (=> (not res!906540) (not e!772919))))

(assert (=> b!1362583 (= res!906540 (not (contains!9503 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114962 res!906542) b!1362573))

(assert (= (and b!1362573 res!906544) b!1362583))

(assert (= (and b!1362583 res!906540) b!1362578))

(assert (= (and b!1362578 res!906541) b!1362582))

(assert (= (and b!1362582 res!906547) b!1362575))

(assert (= (and b!1362575 res!906545) b!1362577))

(assert (= (and b!1362577 res!906543) b!1362574))

(assert (= (and b!1362574 res!906546) b!1362581))

(assert (= (and b!1362581 res!906539) b!1362576))

(assert (= (and b!1362576 c!127457) b!1362580))

(assert (= (and b!1362576 (not c!127457)) b!1362579))

(declare-fun m!1247527 () Bool)

(assert (=> b!1362575 m!1247527))

(declare-fun m!1247529 () Bool)

(assert (=> b!1362583 m!1247529))

(declare-fun m!1247531 () Bool)

(assert (=> b!1362578 m!1247531))

(declare-fun m!1247533 () Bool)

(assert (=> b!1362573 m!1247533))

(declare-fun m!1247535 () Bool)

(assert (=> b!1362576 m!1247535))

(assert (=> b!1362576 m!1247535))

(declare-fun m!1247537 () Bool)

(assert (=> b!1362576 m!1247537))

(declare-fun m!1247539 () Bool)

(assert (=> b!1362582 m!1247539))

(declare-fun m!1247541 () Bool)

(assert (=> b!1362574 m!1247541))

(declare-fun m!1247543 () Bool)

(assert (=> b!1362580 m!1247543))

(assert (=> b!1362580 m!1247535))

(declare-fun m!1247545 () Bool)

(assert (=> b!1362580 m!1247545))

(declare-fun m!1247547 () Bool)

(assert (=> b!1362580 m!1247547))

(declare-fun m!1247549 () Bool)

(assert (=> b!1362580 m!1247549))

(assert (=> b!1362580 m!1247535))

(assert (=> b!1362580 m!1247545))

(declare-fun m!1247551 () Bool)

(assert (=> b!1362580 m!1247551))

(declare-fun m!1247553 () Bool)

(assert (=> start!114962 m!1247553))

(push 1)

(assert (not b!1362580))

(assert (not b!1362582))

(assert (not b!1362576))

(assert (not b!1362583))

(assert (not b!1362575))

(assert (not b!1362573))

(assert (not b!1362578))

(assert (not b!1362574))

(assert (not start!114962))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

