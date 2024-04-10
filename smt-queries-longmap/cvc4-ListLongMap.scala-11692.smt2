; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136764 () Bool)

(assert start!136764)

(declare-fun res!1078542 () Bool)

(declare-fun e!880492 () Bool)

(assert (=> start!136764 (=> (not res!1078542) (not e!880492))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105762 0))(
  ( (array!105763 (arr!50991 (Array (_ BitVec 32) (_ BitVec 64))) (size!51541 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105762)

(assert (=> start!136764 (= res!1078542 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51541 a!3559)) (bvslt (size!51541 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!136764 e!880492))

(assert (=> start!136764 true))

(declare-fun array_inv!39718 (array!105762) Bool)

(assert (=> start!136764 (array_inv!39718 a!3559)))

(declare-fun b!1578603 () Bool)

(assert (=> b!1578603 (= e!880492 (not (bvslt #b00000000000000000000000000000000 (size!51541 a!3559))))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105762 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1578603 (arrayContainsKey!0 a!3559 k!2792 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!52184 0))(
  ( (Unit!52185) )
))
(declare-fun lt!676312 () Unit!52184)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!105762 (_ BitVec 64) (_ BitVec 32)) Unit!52184)

(assert (=> b!1578603 (= lt!676312 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1578602 () Bool)

(declare-fun res!1078539 () Bool)

(assert (=> b!1578602 (=> (not res!1078539) (not e!880492))))

(assert (=> b!1578602 (= res!1078539 (arrayContainsKey!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun b!1578600 () Bool)

(declare-fun res!1078540 () Bool)

(assert (=> b!1578600 (=> (not res!1078540) (not e!880492))))

(assert (=> b!1578600 (= res!1078540 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(declare-fun b!1578601 () Bool)

(declare-fun res!1078541 () Bool)

(assert (=> b!1578601 (=> (not res!1078541) (not e!880492))))

(assert (=> b!1578601 (= res!1078541 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51541 a!3559))))))

(assert (= (and start!136764 res!1078542) b!1578600))

(assert (= (and b!1578600 res!1078540) b!1578601))

(assert (= (and b!1578601 res!1078541) b!1578602))

(assert (= (and b!1578602 res!1078539) b!1578603))

(declare-fun m!1450671 () Bool)

(assert (=> start!136764 m!1450671))

(declare-fun m!1450673 () Bool)

(assert (=> b!1578603 m!1450673))

(declare-fun m!1450675 () Bool)

(assert (=> b!1578603 m!1450675))

(declare-fun m!1450677 () Bool)

(assert (=> b!1578602 m!1450677))

(declare-fun m!1450679 () Bool)

(assert (=> b!1578600 m!1450679))

(push 1)

(assert (not b!1578600))

(assert (not b!1578603))

(assert (not start!136764))

(assert (not b!1578602))

(check-sat)

(pop 1)

(push 1)

(check-sat)

