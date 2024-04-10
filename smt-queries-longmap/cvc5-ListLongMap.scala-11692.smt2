; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136760 () Bool)

(assert start!136760)

(declare-fun res!1078516 () Bool)

(declare-fun e!880480 () Bool)

(assert (=> start!136760 (=> (not res!1078516) (not e!880480))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105758 0))(
  ( (array!105759 (arr!50989 (Array (_ BitVec 32) (_ BitVec 64))) (size!51539 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105758)

(assert (=> start!136760 (= res!1078516 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51539 a!3559)) (bvslt (size!51539 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136760 e!880480))

(assert (=> start!136760 true))

(declare-fun array_inv!39716 (array!105758) Bool)

(assert (=> start!136760 (array_inv!39716 a!3559)))

(declare-fun b!1578578 () Bool)

(declare-fun res!1078517 () Bool)

(assert (=> b!1578578 (=> (not res!1078517) (not e!880480))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105758 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578578 (= res!1078517 (arrayContainsKey!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1578576 () Bool)

(declare-fun res!1078515 () Bool)

(assert (=> b!1578576 (=> (not res!1078515) (not e!880480))))

(assert (=> b!1578576 (= res!1078515 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(declare-fun b!1578577 () Bool)

(declare-fun res!1078518 () Bool)

(assert (=> b!1578577 (=> (not res!1078518) (not e!880480))))

(assert (=> b!1578577 (= res!1078518 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51539 a!3559))))))

(declare-fun b!1578579 () Bool)

(assert (=> b!1578579 (= e!880480 (not (bvslt #b00000000000000000000000000000000 (size!51539 a!3559))))))

(assert (=> b!1578579 (arrayContainsKey!0 a!3559 k!2792 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52180 0))(
  ( (Unit!52181) )
))
(declare-fun lt!676306 () Unit!52180)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105758 (_ BitVec 64) (_ BitVec 32)) Unit!52180)

(assert (=> b!1578579 (= lt!676306 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(assert (= (and start!136760 res!1078516) b!1578576))

(assert (= (and b!1578576 res!1078515) b!1578577))

(assert (= (and b!1578577 res!1078518) b!1578578))

(assert (= (and b!1578578 res!1078517) b!1578579))

(declare-fun m!1450651 () Bool)

(assert (=> start!136760 m!1450651))

(declare-fun m!1450653 () Bool)

(assert (=> b!1578578 m!1450653))

(declare-fun m!1450655 () Bool)

(assert (=> b!1578576 m!1450655))

(declare-fun m!1450657 () Bool)

(assert (=> b!1578579 m!1450657))

(declare-fun m!1450659 () Bool)

(assert (=> b!1578579 m!1450659))

(push 1)

(assert (not b!1578579))

(assert (not start!136760))

(assert (not b!1578578))

(assert (not b!1578576))

