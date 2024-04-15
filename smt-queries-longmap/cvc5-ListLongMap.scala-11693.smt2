; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136736 () Bool)

(assert start!136736)

(declare-fun b!1578323 () Bool)

(declare-fun res!1078446 () Bool)

(declare-fun e!880312 () Bool)

(assert (=> b!1578323 (=> (not res!1078446) (not e!880312))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105699 0))(
  ( (array!105700 (arr!50959 (Array (_ BitVec 32) (_ BitVec 64))) (size!51511 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105699)

(declare-fun arrayContainsKey!0 (array!105699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578323 (= res!1078446 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(declare-fun b!1578326 () Bool)

(assert (=> b!1578326 (= e!880312 (not true))))

(assert (=> b!1578326 (arrayContainsKey!0 a!3559 k!2792 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!51999 0))(
  ( (Unit!52000) )
))
(declare-fun lt!676038 () Unit!51999)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105699 (_ BitVec 64) (_ BitVec 32)) Unit!51999)

(assert (=> b!1578326 (= lt!676038 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1578324 () Bool)

(declare-fun res!1078447 () Bool)

(assert (=> b!1578324 (=> (not res!1078447) (not e!880312))))

(assert (=> b!1578324 (= res!1078447 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51511 a!3559))))))

(declare-fun res!1078449 () Bool)

(assert (=> start!136736 (=> (not res!1078449) (not e!880312))))

(assert (=> start!136736 (= res!1078449 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51511 a!3559)) (bvslt (size!51511 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136736 e!880312))

(assert (=> start!136736 true))

(declare-fun array_inv!39895 (array!105699) Bool)

(assert (=> start!136736 (array_inv!39895 a!3559)))

(declare-fun b!1578325 () Bool)

(declare-fun res!1078448 () Bool)

(assert (=> b!1578325 (=> (not res!1078448) (not e!880312))))

(assert (=> b!1578325 (= res!1078448 (arrayContainsKey!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(assert (= (and start!136736 res!1078449) b!1578323))

(assert (= (and b!1578323 res!1078446) b!1578324))

(assert (= (and b!1578324 res!1078447) b!1578325))

(assert (= (and b!1578325 res!1078448) b!1578326))

(declare-fun m!1449821 () Bool)

(assert (=> b!1578323 m!1449821))

(declare-fun m!1449823 () Bool)

(assert (=> b!1578326 m!1449823))

(declare-fun m!1449825 () Bool)

(assert (=> b!1578326 m!1449825))

(declare-fun m!1449827 () Bool)

(assert (=> start!136736 m!1449827))

(declare-fun m!1449829 () Bool)

(assert (=> b!1578325 m!1449829))

(push 1)

(assert (not start!136736))

(assert (not b!1578325))

(assert (not b!1578323))

(assert (not b!1578326))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

