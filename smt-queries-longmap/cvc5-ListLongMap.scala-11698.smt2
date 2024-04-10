; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136808 () Bool)

(assert start!136808)

(declare-fun b!1578772 () Bool)

(declare-fun res!1078712 () Bool)

(declare-fun e!880612 () Bool)

(assert (=> b!1578772 (=> (not res!1078712) (not e!880612))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105797 0))(
  ( (array!105798 (arr!51007 (Array (_ BitVec 32) (_ BitVec 64))) (size!51557 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105797)

(assert (=> b!1578772 (= res!1078712 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51557 a!3559))))))

(declare-fun res!1078711 () Bool)

(assert (=> start!136808 (=> (not res!1078711) (not e!880612))))

(assert (=> start!136808 (= res!1078711 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51557 a!3559)) (bvslt (size!51557 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136808 e!880612))

(assert (=> start!136808 true))

(declare-fun array_inv!39734 (array!105797) Bool)

(assert (=> start!136808 (array_inv!39734 a!3559)))

(declare-fun b!1578773 () Bool)

(declare-fun res!1078710 () Bool)

(assert (=> b!1578773 (=> (not res!1078710) (not e!880612))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578773 (= res!1078710 (arrayContainsKey!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1578771 () Bool)

(declare-fun res!1078713 () Bool)

(assert (=> b!1578771 (=> (not res!1078713) (not e!880612))))

(assert (=> b!1578771 (= res!1078713 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(declare-fun b!1578774 () Bool)

(assert (=> b!1578774 (= e!880612 (not true))))

(assert (=> b!1578774 (arrayContainsKey!0 a!3559 k!2792 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52192 0))(
  ( (Unit!52193) )
))
(declare-fun lt!676324 () Unit!52192)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105797 (_ BitVec 64) (_ BitVec 32)) Unit!52192)

(assert (=> b!1578774 (= lt!676324 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(assert (= (and start!136808 res!1078711) b!1578771))

(assert (= (and b!1578771 res!1078713) b!1578772))

(assert (= (and b!1578772 res!1078712) b!1578773))

(assert (= (and b!1578773 res!1078710) b!1578774))

(declare-fun m!1450795 () Bool)

(assert (=> start!136808 m!1450795))

(declare-fun m!1450797 () Bool)

(assert (=> b!1578773 m!1450797))

(declare-fun m!1450799 () Bool)

(assert (=> b!1578771 m!1450799))

(declare-fun m!1450801 () Bool)

(assert (=> b!1578774 m!1450801))

(declare-fun m!1450803 () Bool)

(assert (=> b!1578774 m!1450803))

(push 1)

(assert (not b!1578774))

(assert (not b!1578771))

(assert (not b!1578773))

(assert (not start!136808))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

