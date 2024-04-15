; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118554 () Bool)

(assert start!118554)

(declare-fun b!1385946 () Bool)

(declare-fun res!927244 () Bool)

(declare-fun e!785209 () Bool)

(assert (=> b!1385946 (=> (not res!927244) (not e!785209))))

(declare-datatypes ((array!94783 0))(
  ( (array!94784 (arr!45768 (Array (_ BitVec 32) (_ BitVec 64))) (size!46320 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94783)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94783 (_ BitVec 32)) Bool)

(assert (=> b!1385946 (= res!927244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385947 () Bool)

(declare-fun res!927240 () Bool)

(assert (=> b!1385947 (=> (not res!927240) (not e!785209))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1385947 (= res!927240 (and (= (size!46320 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46320 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46320 a!2938))))))

(declare-fun b!1385948 () Bool)

(assert (=> b!1385948 (= e!785209 (not true))))

(declare-datatypes ((SeekEntryResult!10137 0))(
  ( (MissingZero!10137 (index!42919 (_ BitVec 32))) (Found!10137 (index!42920 (_ BitVec 32))) (Intermediate!10137 (undefined!10949 Bool) (index!42921 (_ BitVec 32)) (x!124535 (_ BitVec 32))) (Undefined!10137) (MissingVacant!10137 (index!42922 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94783 (_ BitVec 32)) SeekEntryResult!10137)

(assert (=> b!1385948 (= (seekEntryOrOpen!0 (select (arr!45768 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45768 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94784 (store (arr!45768 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46320 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46105 0))(
  ( (Unit!46106) )
))
(declare-fun lt!609176 () Unit!46105)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94783 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46105)

(assert (=> b!1385948 (= lt!609176 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1385949 () Bool)

(declare-fun res!927241 () Bool)

(assert (=> b!1385949 (=> (not res!927241) (not e!785209))))

(declare-datatypes ((List!32374 0))(
  ( (Nil!32371) (Cons!32370 (h!33579 (_ BitVec 64)) (t!47060 List!32374)) )
))
(declare-fun arrayNoDuplicates!0 (array!94783 (_ BitVec 32) List!32374) Bool)

(assert (=> b!1385949 (= res!927241 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32371))))

(declare-fun b!1385950 () Bool)

(declare-fun res!927239 () Bool)

(assert (=> b!1385950 (=> (not res!927239) (not e!785209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385950 (= res!927239 (validKeyInArray!0 (select (arr!45768 a!2938) startIndex!16)))))

(declare-fun res!927243 () Bool)

(assert (=> start!118554 (=> (not res!927243) (not e!785209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118554 (= res!927243 (validMask!0 mask!2987))))

(assert (=> start!118554 e!785209))

(assert (=> start!118554 true))

(declare-fun array_inv!35001 (array!94783) Bool)

(assert (=> start!118554 (array_inv!35001 a!2938)))

(declare-fun b!1385951 () Bool)

(declare-fun res!927245 () Bool)

(assert (=> b!1385951 (=> (not res!927245) (not e!785209))))

(assert (=> b!1385951 (= res!927245 (and (not (= (select (arr!45768 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45768 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1385952 () Bool)

(declare-fun res!927242 () Bool)

(assert (=> b!1385952 (=> (not res!927242) (not e!785209))))

(assert (=> b!1385952 (= res!927242 (validKeyInArray!0 (select (arr!45768 a!2938) i!1065)))))

(assert (= (and start!118554 res!927243) b!1385947))

(assert (= (and b!1385947 res!927240) b!1385952))

(assert (= (and b!1385952 res!927242) b!1385949))

(assert (= (and b!1385949 res!927241) b!1385946))

(assert (= (and b!1385946 res!927244) b!1385951))

(assert (= (and b!1385951 res!927245) b!1385950))

(assert (= (and b!1385950 res!927239) b!1385948))

(declare-fun m!1270807 () Bool)

(assert (=> b!1385948 m!1270807))

(assert (=> b!1385948 m!1270807))

(declare-fun m!1270809 () Bool)

(assert (=> b!1385948 m!1270809))

(declare-fun m!1270811 () Bool)

(assert (=> b!1385948 m!1270811))

(declare-fun m!1270813 () Bool)

(assert (=> b!1385948 m!1270813))

(declare-fun m!1270815 () Bool)

(assert (=> b!1385948 m!1270815))

(assert (=> b!1385948 m!1270815))

(declare-fun m!1270817 () Bool)

(assert (=> b!1385948 m!1270817))

(assert (=> b!1385950 m!1270815))

(assert (=> b!1385950 m!1270815))

(declare-fun m!1270819 () Bool)

(assert (=> b!1385950 m!1270819))

(declare-fun m!1270821 () Bool)

(assert (=> b!1385946 m!1270821))

(declare-fun m!1270823 () Bool)

(assert (=> b!1385949 m!1270823))

(declare-fun m!1270825 () Bool)

(assert (=> start!118554 m!1270825))

(declare-fun m!1270827 () Bool)

(assert (=> start!118554 m!1270827))

(declare-fun m!1270829 () Bool)

(assert (=> b!1385951 m!1270829))

(assert (=> b!1385952 m!1270829))

(assert (=> b!1385952 m!1270829))

(declare-fun m!1270831 () Bool)

(assert (=> b!1385952 m!1270831))

(push 1)

(assert (not b!1385948))

(assert (not start!118554))

(assert (not b!1385952))

(assert (not b!1385946))

(assert (not b!1385949))

(assert (not b!1385950))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

