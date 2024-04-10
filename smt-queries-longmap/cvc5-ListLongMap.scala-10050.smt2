; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118404 () Bool)

(assert start!118404)

(declare-fun b!1385014 () Bool)

(declare-fun res!926334 () Bool)

(declare-fun e!784774 () Bool)

(assert (=> b!1385014 (=> (not res!926334) (not e!784774))))

(declare-datatypes ((array!94707 0))(
  ( (array!94708 (arr!45731 (Array (_ BitVec 32) (_ BitVec 64))) (size!46281 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94707)

(declare-datatypes ((List!32259 0))(
  ( (Nil!32256) (Cons!32255 (h!33464 (_ BitVec 64)) (t!46953 List!32259)) )
))
(declare-fun arrayNoDuplicates!0 (array!94707 (_ BitVec 32) List!32259) Bool)

(assert (=> b!1385014 (= res!926334 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32256))))

(declare-fun b!1385015 () Bool)

(declare-fun res!926338 () Bool)

(assert (=> b!1385015 (=> (not res!926338) (not e!784774))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385015 (= res!926338 (validKeyInArray!0 (select (arr!45731 a!2938) i!1065)))))

(declare-fun res!926333 () Bool)

(assert (=> start!118404 (=> (not res!926333) (not e!784774))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118404 (= res!926333 (validMask!0 mask!2987))))

(assert (=> start!118404 e!784774))

(assert (=> start!118404 true))

(declare-fun array_inv!34759 (array!94707) Bool)

(assert (=> start!118404 (array_inv!34759 a!2938)))

(declare-fun b!1385016 () Bool)

(declare-fun res!926335 () Bool)

(assert (=> b!1385016 (=> (not res!926335) (not e!784774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94707 (_ BitVec 32)) Bool)

(assert (=> b!1385016 (= res!926335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385017 () Bool)

(declare-datatypes ((Unit!46230 0))(
  ( (Unit!46231) )
))
(declare-fun e!784773 () Unit!46230)

(declare-fun Unit!46232 () Unit!46230)

(assert (=> b!1385017 (= e!784773 Unit!46232)))

(declare-fun b!1385018 () Bool)

(declare-fun lt!609142 () Unit!46230)

(assert (=> b!1385018 (= e!784773 lt!609142)))

(declare-fun lt!609144 () Unit!46230)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46230)

(assert (=> b!1385018 (= lt!609144 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10124 0))(
  ( (MissingZero!10124 (index!42867 (_ BitVec 32))) (Found!10124 (index!42868 (_ BitVec 32))) (Intermediate!10124 (undefined!10936 Bool) (index!42869 (_ BitVec 32)) (x!124365 (_ BitVec 32))) (Undefined!10124) (MissingVacant!10124 (index!42870 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94707 (_ BitVec 32)) SeekEntryResult!10124)

(assert (=> b!1385018 (= (seekEntryOrOpen!0 (select (arr!45731 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45731 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94708 (store (arr!45731 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46281 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94707 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46230)

(assert (=> b!1385018 (= lt!609142 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1385018 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1385019 () Bool)

(assert (=> b!1385019 (= e!784774 false)))

(declare-fun lt!609143 () Unit!46230)

(assert (=> b!1385019 (= lt!609143 e!784773)))

(declare-fun c!128781 () Bool)

(declare-fun e!784772 () Bool)

(assert (=> b!1385019 (= c!128781 e!784772)))

(declare-fun res!926337 () Bool)

(assert (=> b!1385019 (=> (not res!926337) (not e!784772))))

(assert (=> b!1385019 (= res!926337 (not (= startIndex!16 i!1065)))))

(declare-fun b!1385020 () Bool)

(declare-fun res!926336 () Bool)

(assert (=> b!1385020 (=> (not res!926336) (not e!784774))))

(assert (=> b!1385020 (= res!926336 (and (not (= (select (arr!45731 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45731 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1385021 () Bool)

(declare-fun res!926332 () Bool)

(assert (=> b!1385021 (=> (not res!926332) (not e!784774))))

(assert (=> b!1385021 (= res!926332 (and (= (size!46281 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46281 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46281 a!2938))))))

(declare-fun b!1385022 () Bool)

(assert (=> b!1385022 (= e!784772 (validKeyInArray!0 (select (arr!45731 a!2938) startIndex!16)))))

(assert (= (and start!118404 res!926333) b!1385021))

(assert (= (and b!1385021 res!926332) b!1385015))

(assert (= (and b!1385015 res!926338) b!1385014))

(assert (= (and b!1385014 res!926334) b!1385016))

(assert (= (and b!1385016 res!926335) b!1385020))

(assert (= (and b!1385020 res!926336) b!1385019))

(assert (= (and b!1385019 res!926337) b!1385022))

(assert (= (and b!1385019 c!128781) b!1385018))

(assert (= (and b!1385019 (not c!128781)) b!1385017))

(declare-fun m!1270329 () Bool)

(assert (=> b!1385015 m!1270329))

(assert (=> b!1385015 m!1270329))

(declare-fun m!1270331 () Bool)

(assert (=> b!1385015 m!1270331))

(declare-fun m!1270333 () Bool)

(assert (=> b!1385022 m!1270333))

(assert (=> b!1385022 m!1270333))

(declare-fun m!1270335 () Bool)

(assert (=> b!1385022 m!1270335))

(assert (=> b!1385020 m!1270329))

(declare-fun m!1270337 () Bool)

(assert (=> b!1385018 m!1270337))

(declare-fun m!1270339 () Bool)

(assert (=> b!1385018 m!1270339))

(assert (=> b!1385018 m!1270339))

(declare-fun m!1270341 () Bool)

(assert (=> b!1385018 m!1270341))

(declare-fun m!1270343 () Bool)

(assert (=> b!1385018 m!1270343))

(declare-fun m!1270345 () Bool)

(assert (=> b!1385018 m!1270345))

(assert (=> b!1385018 m!1270333))

(declare-fun m!1270347 () Bool)

(assert (=> b!1385018 m!1270347))

(assert (=> b!1385018 m!1270333))

(declare-fun m!1270349 () Bool)

(assert (=> b!1385018 m!1270349))

(declare-fun m!1270351 () Bool)

(assert (=> b!1385016 m!1270351))

(declare-fun m!1270353 () Bool)

(assert (=> start!118404 m!1270353))

(declare-fun m!1270355 () Bool)

(assert (=> start!118404 m!1270355))

(declare-fun m!1270357 () Bool)

(assert (=> b!1385014 m!1270357))

(push 1)

(assert (not start!118404))

(assert (not b!1385014))

(assert (not b!1385016))

(assert (not b!1385015))

(assert (not b!1385022))

(assert (not b!1385018))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

