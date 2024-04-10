; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118638 () Bool)

(assert start!118638)

(declare-fun b!1387041 () Bool)

(declare-fun e!785665 () Bool)

(declare-fun e!785666 () Bool)

(assert (=> b!1387041 (= e!785665 e!785666)))

(declare-fun res!928107 () Bool)

(assert (=> b!1387041 (=> (not res!928107) (not e!785666))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-datatypes ((array!94914 0))(
  ( (array!94915 (arr!45833 (Array (_ BitVec 32) (_ BitVec 64))) (size!46383 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94914)

(assert (=> b!1387041 (= res!928107 (and (bvslt startIndex!16 (bvsub (size!46383 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!46370 0))(
  ( (Unit!46371) )
))
(declare-fun lt!609672 () Unit!46370)

(declare-fun e!785668 () Unit!46370)

(assert (=> b!1387041 (= lt!609672 e!785668)))

(declare-fun c!128907 () Bool)

(declare-fun e!785669 () Bool)

(assert (=> b!1387041 (= c!128907 e!785669)))

(declare-fun res!928111 () Bool)

(assert (=> b!1387041 (=> (not res!928111) (not e!785669))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1387041 (= res!928111 (not (= startIndex!16 i!1065)))))

(declare-fun lt!609671 () array!94914)

(assert (=> b!1387041 (= lt!609671 (array!94915 (store (arr!45833 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46383 a!2938)))))

(declare-fun b!1387042 () Bool)

(declare-fun res!928108 () Bool)

(assert (=> b!1387042 (=> (not res!928108) (not e!785665))))

(declare-datatypes ((List!32361 0))(
  ( (Nil!32358) (Cons!32357 (h!33566 (_ BitVec 64)) (t!47055 List!32361)) )
))
(declare-fun arrayNoDuplicates!0 (array!94914 (_ BitVec 32) List!32361) Bool)

(assert (=> b!1387042 (= res!928108 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32358))))

(declare-fun b!1387043 () Bool)

(declare-fun lt!609668 () Unit!46370)

(assert (=> b!1387043 (= e!785668 lt!609668)))

(declare-fun lt!609670 () Unit!46370)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94914 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46370)

(assert (=> b!1387043 (= lt!609670 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10176 0))(
  ( (MissingZero!10176 (index!43075 (_ BitVec 32))) (Found!10176 (index!43076 (_ BitVec 32))) (Intermediate!10176 (undefined!10988 Bool) (index!43077 (_ BitVec 32)) (x!124689 (_ BitVec 32))) (Undefined!10176) (MissingVacant!10176 (index!43078 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94914 (_ BitVec 32)) SeekEntryResult!10176)

(assert (=> b!1387043 (= (seekEntryOrOpen!0 (select (arr!45833 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45833 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609671 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94914 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46370)

(assert (=> b!1387043 (= lt!609668 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94914 (_ BitVec 32)) Bool)

(assert (=> b!1387043 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1387044 () Bool)

(declare-fun res!928110 () Bool)

(assert (=> b!1387044 (=> (not res!928110) (not e!785665))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387044 (= res!928110 (validKeyInArray!0 (select (arr!45833 a!2938) i!1065)))))

(declare-fun b!1387045 () Bool)

(declare-fun res!928112 () Bool)

(assert (=> b!1387045 (=> (not res!928112) (not e!785665))))

(assert (=> b!1387045 (= res!928112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1387046 () Bool)

(assert (=> b!1387046 (= e!785666 (not true))))

(assert (=> b!1387046 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!609671 mask!2987)))

(declare-fun lt!609669 () Unit!46370)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94914 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46370)

(assert (=> b!1387046 (= lt!609669 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1387048 () Bool)

(declare-fun Unit!46372 () Unit!46370)

(assert (=> b!1387048 (= e!785668 Unit!46372)))

(declare-fun b!1387049 () Bool)

(assert (=> b!1387049 (= e!785669 (validKeyInArray!0 (select (arr!45833 a!2938) startIndex!16)))))

(declare-fun b!1387050 () Bool)

(declare-fun res!928113 () Bool)

(assert (=> b!1387050 (=> (not res!928113) (not e!785665))))

(assert (=> b!1387050 (= res!928113 (and (= (size!46383 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46383 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46383 a!2938))))))

(declare-fun b!1387047 () Bool)

(declare-fun res!928114 () Bool)

(assert (=> b!1387047 (=> (not res!928114) (not e!785665))))

(assert (=> b!1387047 (= res!928114 (and (not (= (select (arr!45833 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45833 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!928109 () Bool)

(assert (=> start!118638 (=> (not res!928109) (not e!785665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118638 (= res!928109 (validMask!0 mask!2987))))

(assert (=> start!118638 e!785665))

(assert (=> start!118638 true))

(declare-fun array_inv!34861 (array!94914) Bool)

(assert (=> start!118638 (array_inv!34861 a!2938)))

(assert (= (and start!118638 res!928109) b!1387050))

(assert (= (and b!1387050 res!928113) b!1387044))

(assert (= (and b!1387044 res!928110) b!1387042))

(assert (= (and b!1387042 res!928108) b!1387045))

(assert (= (and b!1387045 res!928112) b!1387047))

(assert (= (and b!1387047 res!928114) b!1387041))

(assert (= (and b!1387041 res!928111) b!1387049))

(assert (= (and b!1387041 c!128907) b!1387043))

(assert (= (and b!1387041 (not c!128907)) b!1387048))

(assert (= (and b!1387041 res!928107) b!1387046))

(declare-fun m!1272471 () Bool)

(assert (=> start!118638 m!1272471))

(declare-fun m!1272473 () Bool)

(assert (=> start!118638 m!1272473))

(declare-fun m!1272475 () Bool)

(assert (=> b!1387047 m!1272475))

(declare-fun m!1272477 () Bool)

(assert (=> b!1387043 m!1272477))

(declare-fun m!1272479 () Bool)

(assert (=> b!1387043 m!1272479))

(assert (=> b!1387043 m!1272479))

(declare-fun m!1272481 () Bool)

(assert (=> b!1387043 m!1272481))

(declare-fun m!1272483 () Bool)

(assert (=> b!1387043 m!1272483))

(declare-fun m!1272485 () Bool)

(assert (=> b!1387043 m!1272485))

(declare-fun m!1272487 () Bool)

(assert (=> b!1387043 m!1272487))

(declare-fun m!1272489 () Bool)

(assert (=> b!1387043 m!1272489))

(assert (=> b!1387043 m!1272487))

(declare-fun m!1272491 () Bool)

(assert (=> b!1387043 m!1272491))

(declare-fun m!1272493 () Bool)

(assert (=> b!1387046 m!1272493))

(declare-fun m!1272495 () Bool)

(assert (=> b!1387046 m!1272495))

(assert (=> b!1387044 m!1272475))

(assert (=> b!1387044 m!1272475))

(declare-fun m!1272497 () Bool)

(assert (=> b!1387044 m!1272497))

(declare-fun m!1272499 () Bool)

(assert (=> b!1387045 m!1272499))

(assert (=> b!1387041 m!1272483))

(declare-fun m!1272501 () Bool)

(assert (=> b!1387042 m!1272501))

(assert (=> b!1387049 m!1272487))

(assert (=> b!1387049 m!1272487))

(declare-fun m!1272503 () Bool)

(assert (=> b!1387049 m!1272503))

(push 1)

(assert (not b!1387045))

(assert (not b!1387042))

(assert (not start!118638))

(assert (not b!1387049))

(assert (not b!1387044))

(assert (not b!1387046))

(assert (not b!1387043))

(check-sat)

(pop 1)

