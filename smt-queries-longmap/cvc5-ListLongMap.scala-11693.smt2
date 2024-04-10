; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136766 () Bool)

(assert start!136766)

(declare-fun b!1578612 () Bool)

(declare-fun res!1078553 () Bool)

(declare-fun e!880499 () Bool)

(assert (=> b!1578612 (=> (not res!1078553) (not e!880499))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105764 0))(
  ( (array!105765 (arr!50992 (Array (_ BitVec 32) (_ BitVec 64))) (size!51542 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105764)

(declare-fun arrayContainsKey!0 (array!105764 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578612 (= res!1078553 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(declare-fun b!1578614 () Bool)

(declare-fun res!1078552 () Bool)

(assert (=> b!1578614 (=> (not res!1078552) (not e!880499))))

(assert (=> b!1578614 (= res!1078552 (arrayContainsKey!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1578615 () Bool)

(assert (=> b!1578615 (= e!880499 (not true))))

(assert (=> b!1578615 (arrayContainsKey!0 a!3559 k!2792 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52186 0))(
  ( (Unit!52187) )
))
(declare-fun lt!676315 () Unit!52186)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105764 (_ BitVec 64) (_ BitVec 32)) Unit!52186)

(assert (=> b!1578615 (= lt!676315 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1578613 () Bool)

(declare-fun res!1078551 () Bool)

(assert (=> b!1578613 (=> (not res!1078551) (not e!880499))))

(assert (=> b!1578613 (= res!1078551 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51542 a!3559))))))

(declare-fun res!1078554 () Bool)

(assert (=> start!136766 (=> (not res!1078554) (not e!880499))))

(assert (=> start!136766 (= res!1078554 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51542 a!3559)) (bvslt (size!51542 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136766 e!880499))

(assert (=> start!136766 true))

(declare-fun array_inv!39719 (array!105764) Bool)

(assert (=> start!136766 (array_inv!39719 a!3559)))

(assert (= (and start!136766 res!1078554) b!1578612))

(assert (= (and b!1578612 res!1078553) b!1578613))

(assert (= (and b!1578613 res!1078551) b!1578614))

(assert (= (and b!1578614 res!1078552) b!1578615))

(declare-fun m!1450681 () Bool)

(assert (=> b!1578612 m!1450681))

(declare-fun m!1450683 () Bool)

(assert (=> b!1578614 m!1450683))

(declare-fun m!1450685 () Bool)

(assert (=> b!1578615 m!1450685))

(declare-fun m!1450687 () Bool)

(assert (=> b!1578615 m!1450687))

(declare-fun m!1450689 () Bool)

(assert (=> start!136766 m!1450689))

(push 1)

(assert (not b!1578612))

(assert (not b!1578614))

(assert (not start!136766))

(assert (not b!1578615))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

