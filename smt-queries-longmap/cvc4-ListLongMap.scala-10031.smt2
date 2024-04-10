; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118294 () Bool)

(assert start!118294)

(declare-fun b!1383549 () Bool)

(declare-fun res!925147 () Bool)

(declare-fun e!784132 () Bool)

(assert (=> b!1383549 (=> (not res!925147) (not e!784132))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94597 0))(
  ( (array!94598 (arr!45676 (Array (_ BitVec 32) (_ BitVec 64))) (size!46226 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94597)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1383549 (= res!925147 (and (= (size!46226 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46226 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46226 a!2938))))))

(declare-fun b!1383550 () Bool)

(declare-fun res!925143 () Bool)

(assert (=> b!1383550 (=> (not res!925143) (not e!784132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383550 (= res!925143 (validKeyInArray!0 (select (arr!45676 a!2938) startIndex!16)))))

(declare-fun b!1383551 () Bool)

(declare-fun res!925146 () Bool)

(assert (=> b!1383551 (=> (not res!925146) (not e!784132))))

(assert (=> b!1383551 (= res!925146 (validKeyInArray!0 (select (arr!45676 a!2938) i!1065)))))

(declare-fun b!1383552 () Bool)

(declare-fun res!925142 () Bool)

(assert (=> b!1383552 (=> (not res!925142) (not e!784132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94597 (_ BitVec 32)) Bool)

(assert (=> b!1383552 (= res!925142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!925144 () Bool)

(assert (=> start!118294 (=> (not res!925144) (not e!784132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118294 (= res!925144 (validMask!0 mask!2987))))

(assert (=> start!118294 e!784132))

(assert (=> start!118294 true))

(declare-fun array_inv!34704 (array!94597) Bool)

(assert (=> start!118294 (array_inv!34704 a!2938)))

(declare-fun b!1383553 () Bool)

(declare-fun res!925145 () Bool)

(assert (=> b!1383553 (=> (not res!925145) (not e!784132))))

(declare-datatypes ((List!32204 0))(
  ( (Nil!32201) (Cons!32200 (h!33409 (_ BitVec 64)) (t!46898 List!32204)) )
))
(declare-fun arrayNoDuplicates!0 (array!94597 (_ BitVec 32) List!32204) Bool)

(assert (=> b!1383553 (= res!925145 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32201))))

(declare-fun b!1383554 () Bool)

(assert (=> b!1383554 (= e!784132 (not true))))

(declare-datatypes ((SeekEntryResult!10069 0))(
  ( (MissingZero!10069 (index!42647 (_ BitVec 32))) (Found!10069 (index!42648 (_ BitVec 32))) (Intermediate!10069 (undefined!10881 Bool) (index!42649 (_ BitVec 32)) (x!124158 (_ BitVec 32))) (Undefined!10069) (MissingVacant!10069 (index!42650 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94597 (_ BitVec 32)) SeekEntryResult!10069)

(assert (=> b!1383554 (= (seekEntryOrOpen!0 (select (arr!45676 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45676 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94598 (store (arr!45676 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46226 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46075 0))(
  ( (Unit!46076) )
))
(declare-fun lt!608631 () Unit!46075)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94597 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46075)

(assert (=> b!1383554 (= lt!608631 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1383555 () Bool)

(declare-fun res!925141 () Bool)

(assert (=> b!1383555 (=> (not res!925141) (not e!784132))))

(assert (=> b!1383555 (= res!925141 (and (not (= (select (arr!45676 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45676 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(assert (= (and start!118294 res!925144) b!1383549))

(assert (= (and b!1383549 res!925147) b!1383551))

(assert (= (and b!1383551 res!925146) b!1383553))

(assert (= (and b!1383553 res!925145) b!1383552))

(assert (= (and b!1383552 res!925142) b!1383555))

(assert (= (and b!1383555 res!925141) b!1383550))

(assert (= (and b!1383550 res!925143) b!1383554))

(declare-fun m!1268671 () Bool)

(assert (=> b!1383550 m!1268671))

(assert (=> b!1383550 m!1268671))

(declare-fun m!1268673 () Bool)

(assert (=> b!1383550 m!1268673))

(declare-fun m!1268675 () Bool)

(assert (=> b!1383555 m!1268675))

(assert (=> b!1383551 m!1268675))

(assert (=> b!1383551 m!1268675))

(declare-fun m!1268677 () Bool)

(assert (=> b!1383551 m!1268677))

(declare-fun m!1268679 () Bool)

(assert (=> start!118294 m!1268679))

(declare-fun m!1268681 () Bool)

(assert (=> start!118294 m!1268681))

(declare-fun m!1268683 () Bool)

(assert (=> b!1383553 m!1268683))

(declare-fun m!1268685 () Bool)

(assert (=> b!1383552 m!1268685))

(declare-fun m!1268687 () Bool)

(assert (=> b!1383554 m!1268687))

(assert (=> b!1383554 m!1268687))

(declare-fun m!1268689 () Bool)

(assert (=> b!1383554 m!1268689))

(declare-fun m!1268691 () Bool)

(assert (=> b!1383554 m!1268691))

(declare-fun m!1268693 () Bool)

(assert (=> b!1383554 m!1268693))

(assert (=> b!1383554 m!1268671))

(assert (=> b!1383554 m!1268671))

(declare-fun m!1268695 () Bool)

(assert (=> b!1383554 m!1268695))

(push 1)

(assert (not b!1383554))

(assert (not b!1383552))

(assert (not b!1383553))

(assert (not b!1383551))

(assert (not start!118294))

(assert (not b!1383550))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

