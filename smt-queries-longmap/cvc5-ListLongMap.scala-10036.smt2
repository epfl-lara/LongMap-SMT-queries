; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118320 () Bool)

(assert start!118320)

(declare-fun b!1383844 () Bool)

(declare-fun res!925419 () Bool)

(declare-fun e!784235 () Bool)

(assert (=> b!1383844 (=> (not res!925419) (not e!784235))))

(declare-datatypes ((array!94623 0))(
  ( (array!94624 (arr!45689 (Array (_ BitVec 32) (_ BitVec 64))) (size!46239 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94623)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383844 (= res!925419 (validKeyInArray!0 (select (arr!45689 a!2938) i!1065)))))

(declare-fun b!1383845 () Bool)

(declare-datatypes ((Unit!46104 0))(
  ( (Unit!46105) )
))
(declare-fun e!784232 () Unit!46104)

(declare-fun lt!608694 () Unit!46104)

(assert (=> b!1383845 (= e!784232 lt!608694)))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lt!608692 () Unit!46104)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94623 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46104)

(assert (=> b!1383845 (= lt!608692 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10082 0))(
  ( (MissingZero!10082 (index!42699 (_ BitVec 32))) (Found!10082 (index!42700 (_ BitVec 32))) (Intermediate!10082 (undefined!10894 Bool) (index!42701 (_ BitVec 32)) (x!124211 (_ BitVec 32))) (Undefined!10082) (MissingVacant!10082 (index!42702 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94623 (_ BitVec 32)) SeekEntryResult!10082)

(assert (=> b!1383845 (= (seekEntryOrOpen!0 (select (arr!45689 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45689 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94624 (store (arr!45689 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46239 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94623 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46104)

(assert (=> b!1383845 (= lt!608694 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94623 (_ BitVec 32)) Bool)

(assert (=> b!1383845 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1383846 () Bool)

(declare-fun Unit!46106 () Unit!46104)

(assert (=> b!1383846 (= e!784232 Unit!46106)))

(declare-fun b!1383847 () Bool)

(declare-fun res!925417 () Bool)

(assert (=> b!1383847 (=> (not res!925417) (not e!784235))))

(assert (=> b!1383847 (= res!925417 (and (= (size!46239 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46239 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46239 a!2938))))))

(declare-fun b!1383848 () Bool)

(assert (=> b!1383848 (= e!784235 false)))

(declare-fun lt!608693 () Unit!46104)

(assert (=> b!1383848 (= lt!608693 e!784232)))

(declare-fun c!128655 () Bool)

(declare-fun e!784233 () Bool)

(assert (=> b!1383848 (= c!128655 e!784233)))

(declare-fun res!925414 () Bool)

(assert (=> b!1383848 (=> (not res!925414) (not e!784233))))

(assert (=> b!1383848 (= res!925414 (not (= startIndex!16 i!1065)))))

(declare-fun b!1383849 () Bool)

(declare-fun res!925416 () Bool)

(assert (=> b!1383849 (=> (not res!925416) (not e!784235))))

(assert (=> b!1383849 (= res!925416 (and (not (= (select (arr!45689 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45689 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!925415 () Bool)

(assert (=> start!118320 (=> (not res!925415) (not e!784235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118320 (= res!925415 (validMask!0 mask!2987))))

(assert (=> start!118320 e!784235))

(assert (=> start!118320 true))

(declare-fun array_inv!34717 (array!94623) Bool)

(assert (=> start!118320 (array_inv!34717 a!2938)))

(declare-fun b!1383850 () Bool)

(assert (=> b!1383850 (= e!784233 (validKeyInArray!0 (select (arr!45689 a!2938) startIndex!16)))))

(declare-fun b!1383851 () Bool)

(declare-fun res!925418 () Bool)

(assert (=> b!1383851 (=> (not res!925418) (not e!784235))))

(declare-datatypes ((List!32217 0))(
  ( (Nil!32214) (Cons!32213 (h!33422 (_ BitVec 64)) (t!46911 List!32217)) )
))
(declare-fun arrayNoDuplicates!0 (array!94623 (_ BitVec 32) List!32217) Bool)

(assert (=> b!1383851 (= res!925418 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32214))))

(declare-fun b!1383852 () Bool)

(declare-fun res!925420 () Bool)

(assert (=> b!1383852 (=> (not res!925420) (not e!784235))))

(assert (=> b!1383852 (= res!925420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118320 res!925415) b!1383847))

(assert (= (and b!1383847 res!925417) b!1383844))

(assert (= (and b!1383844 res!925419) b!1383851))

(assert (= (and b!1383851 res!925418) b!1383852))

(assert (= (and b!1383852 res!925420) b!1383849))

(assert (= (and b!1383849 res!925416) b!1383848))

(assert (= (and b!1383848 res!925414) b!1383850))

(assert (= (and b!1383848 c!128655) b!1383845))

(assert (= (and b!1383848 (not c!128655)) b!1383846))

(declare-fun m!1269021 () Bool)

(assert (=> start!118320 m!1269021))

(declare-fun m!1269023 () Bool)

(assert (=> start!118320 m!1269023))

(declare-fun m!1269025 () Bool)

(assert (=> b!1383850 m!1269025))

(assert (=> b!1383850 m!1269025))

(declare-fun m!1269027 () Bool)

(assert (=> b!1383850 m!1269027))

(declare-fun m!1269029 () Bool)

(assert (=> b!1383851 m!1269029))

(declare-fun m!1269031 () Bool)

(assert (=> b!1383845 m!1269031))

(declare-fun m!1269033 () Bool)

(assert (=> b!1383845 m!1269033))

(assert (=> b!1383845 m!1269033))

(declare-fun m!1269035 () Bool)

(assert (=> b!1383845 m!1269035))

(declare-fun m!1269037 () Bool)

(assert (=> b!1383845 m!1269037))

(declare-fun m!1269039 () Bool)

(assert (=> b!1383845 m!1269039))

(assert (=> b!1383845 m!1269025))

(declare-fun m!1269041 () Bool)

(assert (=> b!1383845 m!1269041))

(assert (=> b!1383845 m!1269025))

(declare-fun m!1269043 () Bool)

(assert (=> b!1383845 m!1269043))

(declare-fun m!1269045 () Bool)

(assert (=> b!1383852 m!1269045))

(declare-fun m!1269047 () Bool)

(assert (=> b!1383849 m!1269047))

(assert (=> b!1383844 m!1269047))

(assert (=> b!1383844 m!1269047))

(declare-fun m!1269049 () Bool)

(assert (=> b!1383844 m!1269049))

(push 1)

(assert (not b!1383852))

(assert (not b!1383845))

(assert (not b!1383850))

(assert (not b!1383844))

(assert (not b!1383851))

(assert (not start!118320))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

