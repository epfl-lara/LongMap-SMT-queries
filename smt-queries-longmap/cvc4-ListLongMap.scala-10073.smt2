; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118576 () Bool)

(assert start!118576)

(declare-fun b!1386204 () Bool)

(declare-fun res!927458 () Bool)

(declare-fun e!785293 () Bool)

(assert (=> b!1386204 (=> (not res!927458) (not e!785293))))

(declare-datatypes ((array!94852 0))(
  ( (array!94853 (arr!45802 (Array (_ BitVec 32) (_ BitVec 64))) (size!46352 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94852)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1386204 (= res!927458 (and (= (size!46352 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46352 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46352 a!2938))))))

(declare-fun b!1386205 () Bool)

(declare-fun res!927459 () Bool)

(assert (=> b!1386205 (=> (not res!927459) (not e!785293))))

(declare-datatypes ((List!32330 0))(
  ( (Nil!32327) (Cons!32326 (h!33535 (_ BitVec 64)) (t!47024 List!32330)) )
))
(declare-fun arrayNoDuplicates!0 (array!94852 (_ BitVec 32) List!32330) Bool)

(assert (=> b!1386205 (= res!927459 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32327))))

(declare-fun b!1386206 () Bool)

(declare-fun res!927460 () Bool)

(assert (=> b!1386206 (=> (not res!927460) (not e!785293))))

(assert (=> b!1386206 (= res!927460 (and (not (= (select (arr!45802 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45802 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1386207 () Bool)

(declare-fun res!927456 () Bool)

(assert (=> b!1386207 (=> (not res!927456) (not e!785293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94852 (_ BitVec 32)) Bool)

(assert (=> b!1386207 (= res!927456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386208 () Bool)

(assert (=> b!1386208 (= e!785293 (not true))))

(declare-datatypes ((SeekEntryResult!10145 0))(
  ( (MissingZero!10145 (index!42951 (_ BitVec 32))) (Found!10145 (index!42952 (_ BitVec 32))) (Intermediate!10145 (undefined!10957 Bool) (index!42953 (_ BitVec 32)) (x!124570 (_ BitVec 32))) (Undefined!10145) (MissingVacant!10145 (index!42954 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94852 (_ BitVec 32)) SeekEntryResult!10145)

(assert (=> b!1386208 (= (seekEntryOrOpen!0 (select (arr!45802 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45802 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94853 (store (arr!45802 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46352 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46278 0))(
  ( (Unit!46279) )
))
(declare-fun lt!609387 () Unit!46278)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94852 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46278)

(assert (=> b!1386208 (= lt!609387 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1386210 () Bool)

(declare-fun res!927454 () Bool)

(assert (=> b!1386210 (=> (not res!927454) (not e!785293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386210 (= res!927454 (validKeyInArray!0 (select (arr!45802 a!2938) i!1065)))))

(declare-fun b!1386209 () Bool)

(declare-fun res!927457 () Bool)

(assert (=> b!1386209 (=> (not res!927457) (not e!785293))))

(assert (=> b!1386209 (= res!927457 (validKeyInArray!0 (select (arr!45802 a!2938) startIndex!16)))))

(declare-fun res!927455 () Bool)

(assert (=> start!118576 (=> (not res!927455) (not e!785293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118576 (= res!927455 (validMask!0 mask!2987))))

(assert (=> start!118576 e!785293))

(assert (=> start!118576 true))

(declare-fun array_inv!34830 (array!94852) Bool)

(assert (=> start!118576 (array_inv!34830 a!2938)))

(assert (= (and start!118576 res!927455) b!1386204))

(assert (= (and b!1386204 res!927458) b!1386210))

(assert (= (and b!1386210 res!927454) b!1386205))

(assert (= (and b!1386205 res!927459) b!1386207))

(assert (= (and b!1386207 res!927456) b!1386206))

(assert (= (and b!1386206 res!927460) b!1386209))

(assert (= (and b!1386209 res!927457) b!1386208))

(declare-fun m!1271545 () Bool)

(assert (=> b!1386209 m!1271545))

(assert (=> b!1386209 m!1271545))

(declare-fun m!1271547 () Bool)

(assert (=> b!1386209 m!1271547))

(declare-fun m!1271549 () Bool)

(assert (=> start!118576 m!1271549))

(declare-fun m!1271551 () Bool)

(assert (=> start!118576 m!1271551))

(declare-fun m!1271553 () Bool)

(assert (=> b!1386207 m!1271553))

(declare-fun m!1271555 () Bool)

(assert (=> b!1386205 m!1271555))

(declare-fun m!1271557 () Bool)

(assert (=> b!1386206 m!1271557))

(declare-fun m!1271559 () Bool)

(assert (=> b!1386208 m!1271559))

(assert (=> b!1386208 m!1271559))

(declare-fun m!1271561 () Bool)

(assert (=> b!1386208 m!1271561))

(declare-fun m!1271563 () Bool)

(assert (=> b!1386208 m!1271563))

(declare-fun m!1271565 () Bool)

(assert (=> b!1386208 m!1271565))

(assert (=> b!1386208 m!1271545))

(assert (=> b!1386208 m!1271545))

(declare-fun m!1271567 () Bool)

(assert (=> b!1386208 m!1271567))

(assert (=> b!1386210 m!1271557))

(assert (=> b!1386210 m!1271557))

(declare-fun m!1271569 () Bool)

(assert (=> b!1386210 m!1271569))

(push 1)

(assert (not b!1386205))

(assert (not b!1386208))

(assert (not b!1386209))

(assert (not b!1386210))

(assert (not b!1386207))

(assert (not start!118576))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

