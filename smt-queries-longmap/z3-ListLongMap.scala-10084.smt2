; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118850 () Bool)

(assert start!118850)

(declare-fun b!1388349 () Bool)

(declare-fun res!928627 () Bool)

(declare-fun e!786515 () Bool)

(assert (=> b!1388349 (=> (not res!928627) (not e!786515))))

(declare-datatypes ((array!95024 0))(
  ( (array!95025 (arr!45886 (Array (_ BitVec 32) (_ BitVec 64))) (size!46437 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!95024)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1388349 (= res!928627 (validKeyInArray!0 (select (arr!45886 a!2938) i!1065)))))

(declare-fun b!1388350 () Bool)

(declare-fun e!786516 () Bool)

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1388350 (= e!786516 (validKeyInArray!0 (select (arr!45886 a!2938) startIndex!16)))))

(declare-fun b!1388351 () Bool)

(declare-datatypes ((Unit!46311 0))(
  ( (Unit!46312) )
))
(declare-fun e!786517 () Unit!46311)

(declare-fun lt!610148 () Unit!46311)

(assert (=> b!1388351 (= e!786517 lt!610148)))

(declare-fun lt!610149 () Unit!46311)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!95024 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46311)

(assert (=> b!1388351 (= lt!610149 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun lt!610152 () array!95024)

(declare-datatypes ((SeekEntryResult!10133 0))(
  ( (MissingZero!10133 (index!42903 (_ BitVec 32))) (Found!10133 (index!42904 (_ BitVec 32))) (Intermediate!10133 (undefined!10945 Bool) (index!42905 (_ BitVec 32)) (x!124668 (_ BitVec 32))) (Undefined!10133) (MissingVacant!10133 (index!42906 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95024 (_ BitVec 32)) SeekEntryResult!10133)

(assert (=> b!1388351 (= (seekEntryOrOpen!0 (select (arr!45886 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45886 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!610152 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95024 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46311)

(assert (=> b!1388351 (= lt!610148 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95024 (_ BitVec 32)) Bool)

(assert (=> b!1388351 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1388352 () Bool)

(declare-fun res!928630 () Bool)

(assert (=> b!1388352 (=> (not res!928630) (not e!786515))))

(assert (=> b!1388352 (= res!928630 (and (= (size!46437 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46437 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46437 a!2938))))))

(declare-fun b!1388353 () Bool)

(declare-fun e!786513 () Bool)

(assert (=> b!1388353 (= e!786513 (not true))))

(assert (=> b!1388353 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!610152 mask!2987)))

(declare-fun lt!610150 () Unit!46311)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!95024 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46311)

(assert (=> b!1388353 (= lt!610150 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1388354 () Bool)

(declare-fun res!928633 () Bool)

(assert (=> b!1388354 (=> (not res!928633) (not e!786515))))

(assert (=> b!1388354 (= res!928633 (and (not (= (select (arr!45886 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45886 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1388355 () Bool)

(declare-fun res!928632 () Bool)

(assert (=> b!1388355 (=> (not res!928632) (not e!786515))))

(declare-datatypes ((List!32401 0))(
  ( (Nil!32398) (Cons!32397 (h!33615 (_ BitVec 64)) (t!47087 List!32401)) )
))
(declare-fun arrayNoDuplicates!0 (array!95024 (_ BitVec 32) List!32401) Bool)

(assert (=> b!1388355 (= res!928632 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32398))))

(declare-fun b!1388356 () Bool)

(declare-fun res!928628 () Bool)

(assert (=> b!1388356 (=> (not res!928628) (not e!786515))))

(assert (=> b!1388356 (= res!928628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1388358 () Bool)

(assert (=> b!1388358 (= e!786515 e!786513)))

(declare-fun res!928626 () Bool)

(assert (=> b!1388358 (=> (not res!928626) (not e!786513))))

(assert (=> b!1388358 (= res!928626 (and (bvslt startIndex!16 (bvsub (size!46437 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!610151 () Unit!46311)

(assert (=> b!1388358 (= lt!610151 e!786517)))

(declare-fun c!129309 () Bool)

(assert (=> b!1388358 (= c!129309 e!786516)))

(declare-fun res!928631 () Bool)

(assert (=> b!1388358 (=> (not res!928631) (not e!786516))))

(assert (=> b!1388358 (= res!928631 (not (= startIndex!16 i!1065)))))

(assert (=> b!1388358 (= lt!610152 (array!95025 (store (arr!45886 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46437 a!2938)))))

(declare-fun b!1388357 () Bool)

(declare-fun Unit!46313 () Unit!46311)

(assert (=> b!1388357 (= e!786517 Unit!46313)))

(declare-fun res!928629 () Bool)

(assert (=> start!118850 (=> (not res!928629) (not e!786515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118850 (= res!928629 (validMask!0 mask!2987))))

(assert (=> start!118850 e!786515))

(assert (=> start!118850 true))

(declare-fun array_inv!35167 (array!95024) Bool)

(assert (=> start!118850 (array_inv!35167 a!2938)))

(assert (= (and start!118850 res!928629) b!1388352))

(assert (= (and b!1388352 res!928630) b!1388349))

(assert (= (and b!1388349 res!928627) b!1388355))

(assert (= (and b!1388355 res!928632) b!1388356))

(assert (= (and b!1388356 res!928628) b!1388354))

(assert (= (and b!1388354 res!928633) b!1388358))

(assert (= (and b!1388358 res!928631) b!1388350))

(assert (= (and b!1388358 c!129309) b!1388351))

(assert (= (and b!1388358 (not c!129309)) b!1388357))

(assert (= (and b!1388358 res!928626) b!1388353))

(declare-fun m!1274103 () Bool)

(assert (=> b!1388358 m!1274103))

(declare-fun m!1274105 () Bool)

(assert (=> b!1388355 m!1274105))

(declare-fun m!1274107 () Bool)

(assert (=> b!1388354 m!1274107))

(declare-fun m!1274109 () Bool)

(assert (=> b!1388356 m!1274109))

(declare-fun m!1274111 () Bool)

(assert (=> b!1388351 m!1274111))

(declare-fun m!1274113 () Bool)

(assert (=> b!1388351 m!1274113))

(assert (=> b!1388351 m!1274103))

(declare-fun m!1274115 () Bool)

(assert (=> b!1388351 m!1274115))

(assert (=> b!1388351 m!1274113))

(declare-fun m!1274117 () Bool)

(assert (=> b!1388351 m!1274117))

(declare-fun m!1274119 () Bool)

(assert (=> b!1388351 m!1274119))

(declare-fun m!1274121 () Bool)

(assert (=> b!1388351 m!1274121))

(assert (=> b!1388351 m!1274119))

(declare-fun m!1274123 () Bool)

(assert (=> b!1388351 m!1274123))

(declare-fun m!1274125 () Bool)

(assert (=> start!118850 m!1274125))

(declare-fun m!1274127 () Bool)

(assert (=> start!118850 m!1274127))

(declare-fun m!1274129 () Bool)

(assert (=> b!1388353 m!1274129))

(declare-fun m!1274131 () Bool)

(assert (=> b!1388353 m!1274131))

(assert (=> b!1388350 m!1274119))

(assert (=> b!1388350 m!1274119))

(declare-fun m!1274133 () Bool)

(assert (=> b!1388350 m!1274133))

(assert (=> b!1388349 m!1274107))

(assert (=> b!1388349 m!1274107))

(declare-fun m!1274135 () Bool)

(assert (=> b!1388349 m!1274135))

(check-sat (not b!1388350) (not b!1388355) (not b!1388349) (not b!1388351) (not b!1388356) (not b!1388353) (not start!118850))
(check-sat)
