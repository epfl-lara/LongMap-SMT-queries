; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136724 () Bool)

(assert start!136724)

(declare-fun b!1578254 () Bool)

(declare-fun e!880276 () Bool)

(assert (=> b!1578254 (= e!880276 (not true))))

(declare-datatypes ((array!105687 0))(
  ( (array!105688 (arr!50953 (Array (_ BitVec 32) (_ BitVec 64))) (size!51505 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105687)

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105687 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578254 (arrayContainsKey!0 a!3559 k!2792 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!51987 0))(
  ( (Unit!51988) )
))
(declare-fun lt!676020 () Unit!51987)

(declare-fun from!2937 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105687 (_ BitVec 64) (_ BitVec 32)) Unit!51987)

(assert (=> b!1578254 (= lt!676020 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun res!1078374 () Bool)

(assert (=> start!136724 (=> (not res!1078374) (not e!880276))))

(assert (=> start!136724 (= res!1078374 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51505 a!3559)) (bvslt (size!51505 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136724 e!880276))

(assert (=> start!136724 true))

(declare-fun array_inv!39889 (array!105687) Bool)

(assert (=> start!136724 (array_inv!39889 a!3559)))

(declare-fun b!1578252 () Bool)

(declare-fun res!1078376 () Bool)

(assert (=> b!1578252 (=> (not res!1078376) (not e!880276))))

(assert (=> b!1578252 (= res!1078376 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51505 a!3559))))))

(declare-fun b!1578253 () Bool)

(declare-fun res!1078377 () Bool)

(assert (=> b!1578253 (=> (not res!1078377) (not e!880276))))

(assert (=> b!1578253 (= res!1078377 (arrayContainsKey!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1578251 () Bool)

(declare-fun res!1078375 () Bool)

(assert (=> b!1578251 (=> (not res!1078375) (not e!880276))))

(assert (=> b!1578251 (= res!1078375 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(assert (= (and start!136724 res!1078374) b!1578251))

(assert (= (and b!1578251 res!1078375) b!1578252))

(assert (= (and b!1578252 res!1078376) b!1578253))

(assert (= (and b!1578253 res!1078377) b!1578254))

(declare-fun m!1449761 () Bool)

(assert (=> b!1578254 m!1449761))

(declare-fun m!1449763 () Bool)

(assert (=> b!1578254 m!1449763))

(declare-fun m!1449765 () Bool)

(assert (=> start!136724 m!1449765))

(declare-fun m!1449767 () Bool)

(assert (=> b!1578253 m!1449767))

(declare-fun m!1449769 () Bool)

(assert (=> b!1578251 m!1449769))

(push 1)

(assert (not b!1578251))

(assert (not b!1578253))

(assert (not start!136724))

(assert (not b!1578254))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

