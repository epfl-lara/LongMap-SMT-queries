; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118406 () Bool)

(assert start!118406)

(declare-fun b!1385041 () Bool)

(declare-datatypes ((Unit!46233 0))(
  ( (Unit!46234) )
))
(declare-fun e!784784 () Unit!46233)

(declare-fun lt!609152 () Unit!46233)

(assert (=> b!1385041 (= e!784784 lt!609152)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun lt!609151 () Unit!46233)

(declare-datatypes ((array!94709 0))(
  ( (array!94710 (arr!45732 (Array (_ BitVec 32) (_ BitVec 64))) (size!46282 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94709)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46233)

(assert (=> b!1385041 (= lt!609151 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10125 0))(
  ( (MissingZero!10125 (index!42871 (_ BitVec 32))) (Found!10125 (index!42872 (_ BitVec 32))) (Intermediate!10125 (undefined!10937 Bool) (index!42873 (_ BitVec 32)) (x!124366 (_ BitVec 32))) (Undefined!10125) (MissingVacant!10125 (index!42874 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94709 (_ BitVec 32)) SeekEntryResult!10125)

(assert (=> b!1385041 (= (seekEntryOrOpen!0 (select (arr!45732 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45732 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94710 (store (arr!45732 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46282 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46233)

(assert (=> b!1385041 (= lt!609152 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94709 (_ BitVec 32)) Bool)

(assert (=> b!1385041 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1385042 () Bool)

(declare-fun res!926353 () Bool)

(declare-fun e!784785 () Bool)

(assert (=> b!1385042 (=> (not res!926353) (not e!784785))))

(assert (=> b!1385042 (= res!926353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1385043 () Bool)

(declare-fun res!926358 () Bool)

(assert (=> b!1385043 (=> (not res!926358) (not e!784785))))

(assert (=> b!1385043 (= res!926358 (and (not (= (select (arr!45732 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45732 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1385044 () Bool)

(declare-fun res!926359 () Bool)

(assert (=> b!1385044 (=> (not res!926359) (not e!784785))))

(declare-datatypes ((List!32260 0))(
  ( (Nil!32257) (Cons!32256 (h!33465 (_ BitVec 64)) (t!46954 List!32260)) )
))
(declare-fun arrayNoDuplicates!0 (array!94709 (_ BitVec 32) List!32260) Bool)

(assert (=> b!1385044 (= res!926359 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32257))))

(declare-fun res!926355 () Bool)

(assert (=> start!118406 (=> (not res!926355) (not e!784785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118406 (= res!926355 (validMask!0 mask!2987))))

(assert (=> start!118406 e!784785))

(assert (=> start!118406 true))

(declare-fun array_inv!34760 (array!94709) Bool)

(assert (=> start!118406 (array_inv!34760 a!2938)))

(declare-fun b!1385045 () Bool)

(declare-fun res!926356 () Bool)

(assert (=> b!1385045 (=> (not res!926356) (not e!784785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1385045 (= res!926356 (validKeyInArray!0 (select (arr!45732 a!2938) i!1065)))))

(declare-fun b!1385046 () Bool)

(declare-fun e!784786 () Bool)

(assert (=> b!1385046 (= e!784786 (validKeyInArray!0 (select (arr!45732 a!2938) startIndex!16)))))

(declare-fun b!1385047 () Bool)

(declare-fun Unit!46235 () Unit!46233)

(assert (=> b!1385047 (= e!784784 Unit!46235)))

(declare-fun b!1385048 () Bool)

(assert (=> b!1385048 (= e!784785 false)))

(declare-fun lt!609153 () Unit!46233)

(assert (=> b!1385048 (= lt!609153 e!784784)))

(declare-fun c!128784 () Bool)

(assert (=> b!1385048 (= c!128784 e!784786)))

(declare-fun res!926354 () Bool)

(assert (=> b!1385048 (=> (not res!926354) (not e!784786))))

(assert (=> b!1385048 (= res!926354 (not (= startIndex!16 i!1065)))))

(declare-fun b!1385049 () Bool)

(declare-fun res!926357 () Bool)

(assert (=> b!1385049 (=> (not res!926357) (not e!784785))))

(assert (=> b!1385049 (= res!926357 (and (= (size!46282 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46282 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46282 a!2938))))))

(assert (= (and start!118406 res!926355) b!1385049))

(assert (= (and b!1385049 res!926357) b!1385045))

(assert (= (and b!1385045 res!926356) b!1385044))

(assert (= (and b!1385044 res!926359) b!1385042))

(assert (= (and b!1385042 res!926353) b!1385043))

(assert (= (and b!1385043 res!926358) b!1385048))

(assert (= (and b!1385048 res!926354) b!1385046))

(assert (= (and b!1385048 c!128784) b!1385041))

(assert (= (and b!1385048 (not c!128784)) b!1385047))

(declare-fun m!1270359 () Bool)

(assert (=> b!1385046 m!1270359))

(assert (=> b!1385046 m!1270359))

(declare-fun m!1270361 () Bool)

(assert (=> b!1385046 m!1270361))

(declare-fun m!1270363 () Bool)

(assert (=> b!1385044 m!1270363))

(declare-fun m!1270365 () Bool)

(assert (=> b!1385043 m!1270365))

(declare-fun m!1270367 () Bool)

(assert (=> b!1385041 m!1270367))

(declare-fun m!1270369 () Bool)

(assert (=> b!1385041 m!1270369))

(assert (=> b!1385041 m!1270369))

(declare-fun m!1270371 () Bool)

(assert (=> b!1385041 m!1270371))

(declare-fun m!1270373 () Bool)

(assert (=> b!1385041 m!1270373))

(declare-fun m!1270375 () Bool)

(assert (=> b!1385041 m!1270375))

(assert (=> b!1385041 m!1270359))

(declare-fun m!1270377 () Bool)

(assert (=> b!1385041 m!1270377))

(assert (=> b!1385041 m!1270359))

(declare-fun m!1270379 () Bool)

(assert (=> b!1385041 m!1270379))

(declare-fun m!1270381 () Bool)

(assert (=> start!118406 m!1270381))

(declare-fun m!1270383 () Bool)

(assert (=> start!118406 m!1270383))

(assert (=> b!1385045 m!1270365))

(assert (=> b!1385045 m!1270365))

(declare-fun m!1270385 () Bool)

(assert (=> b!1385045 m!1270385))

(declare-fun m!1270387 () Bool)

(assert (=> b!1385042 m!1270387))

(check-sat (not b!1385046) (not start!118406) (not b!1385044) (not b!1385045) (not b!1385042) (not b!1385041))
