; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114464 () Bool)

(assert start!114464)

(declare-fun b!1358467 () Bool)

(declare-fun res!902443 () Bool)

(declare-fun e!771106 () Bool)

(assert (=> b!1358467 (=> (not res!902443) (not e!771106))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92537 0))(
  ( (array!92538 (arr!44712 (Array (_ BitVec 32) (_ BitVec 64))) (size!45263 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92537)

(assert (=> b!1358467 (= res!902443 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45263 a!3742))))))

(declare-fun res!902451 () Bool)

(assert (=> start!114464 (=> (not res!902451) (not e!771106))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114464 (= res!902451 (and (bvslt (size!45263 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45263 a!3742))))))

(assert (=> start!114464 e!771106))

(assert (=> start!114464 true))

(declare-fun array_inv!33993 (array!92537) Bool)

(assert (=> start!114464 (array_inv!33993 a!3742)))

(declare-fun b!1358468 () Bool)

(declare-fun res!902445 () Bool)

(assert (=> b!1358468 (=> (not res!902445) (not e!771106))))

(declare-datatypes ((List!31740 0))(
  ( (Nil!31737) (Cons!31736 (h!32954 (_ BitVec 64)) (t!46390 List!31740)) )
))
(declare-fun acc!759 () List!31740)

(declare-fun contains!9452 (List!31740 (_ BitVec 64)) Bool)

(assert (=> b!1358468 (= res!902445 (not (contains!9452 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358469 () Bool)

(assert (=> b!1358469 (= e!771106 (not true))))

(declare-fun subseq!811 (List!31740 List!31740) Bool)

(assert (=> b!1358469 (subseq!811 acc!759 acc!759)))

(declare-datatypes ((Unit!44592 0))(
  ( (Unit!44593) )
))
(declare-fun lt!599601 () Unit!44592)

(declare-fun lemmaListSubSeqRefl!0 (List!31740) Unit!44592)

(assert (=> b!1358469 (= lt!599601 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1358470 () Bool)

(declare-fun res!902442 () Bool)

(assert (=> b!1358470 (=> (not res!902442) (not e!771106))))

(assert (=> b!1358470 (= res!902442 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45263 a!3742)))))

(declare-fun b!1358471 () Bool)

(declare-fun res!902444 () Bool)

(assert (=> b!1358471 (=> (not res!902444) (not e!771106))))

(declare-fun noDuplicate!2283 (List!31740) Bool)

(assert (=> b!1358471 (= res!902444 (noDuplicate!2283 acc!759))))

(declare-fun b!1358472 () Bool)

(declare-fun res!902447 () Bool)

(assert (=> b!1358472 (=> (not res!902447) (not e!771106))))

(declare-fun arrayNoDuplicates!0 (array!92537 (_ BitVec 32) List!31740) Bool)

(assert (=> b!1358472 (= res!902447 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1358473 () Bool)

(declare-fun res!902448 () Bool)

(assert (=> b!1358473 (=> (not res!902448) (not e!771106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358473 (= res!902448 (validKeyInArray!0 (select (arr!44712 a!3742) from!3120)))))

(declare-fun b!1358474 () Bool)

(declare-fun res!902450 () Bool)

(assert (=> b!1358474 (=> (not res!902450) (not e!771106))))

(assert (=> b!1358474 (= res!902450 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31737))))

(declare-fun b!1358475 () Bool)

(declare-fun res!902449 () Bool)

(assert (=> b!1358475 (=> (not res!902449) (not e!771106))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1358475 (= res!902449 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358476 () Bool)

(declare-fun res!902446 () Bool)

(assert (=> b!1358476 (=> (not res!902446) (not e!771106))))

(assert (=> b!1358476 (= res!902446 (not (contains!9452 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114464 res!902451) b!1358471))

(assert (= (and b!1358471 res!902444) b!1358468))

(assert (= (and b!1358468 res!902445) b!1358476))

(assert (= (and b!1358476 res!902446) b!1358474))

(assert (= (and b!1358474 res!902450) b!1358472))

(assert (= (and b!1358472 res!902447) b!1358467))

(assert (= (and b!1358467 res!902443) b!1358475))

(assert (= (and b!1358475 res!902449) b!1358470))

(assert (= (and b!1358470 res!902442) b!1358473))

(assert (= (and b!1358473 res!902448) b!1358469))

(declare-fun m!1244571 () Bool)

(assert (=> b!1358475 m!1244571))

(declare-fun m!1244573 () Bool)

(assert (=> b!1358471 m!1244573))

(declare-fun m!1244575 () Bool)

(assert (=> b!1358476 m!1244575))

(declare-fun m!1244577 () Bool)

(assert (=> b!1358468 m!1244577))

(declare-fun m!1244579 () Bool)

(assert (=> start!114464 m!1244579))

(declare-fun m!1244581 () Bool)

(assert (=> b!1358474 m!1244581))

(declare-fun m!1244583 () Bool)

(assert (=> b!1358469 m!1244583))

(declare-fun m!1244585 () Bool)

(assert (=> b!1358469 m!1244585))

(declare-fun m!1244587 () Bool)

(assert (=> b!1358472 m!1244587))

(declare-fun m!1244589 () Bool)

(assert (=> b!1358473 m!1244589))

(assert (=> b!1358473 m!1244589))

(declare-fun m!1244591 () Bool)

(assert (=> b!1358473 m!1244591))

(push 1)

(assert (not b!1358468))

(assert (not b!1358476))

(assert (not b!1358472))

(assert (not b!1358471))

(assert (not b!1358473))

(assert (not b!1358474))

(assert (not b!1358475))

(assert (not b!1358469))

(assert (not start!114464))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

