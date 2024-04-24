; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123398 () Bool)

(assert start!123398)

(declare-fun b!1429497 () Bool)

(declare-fun e!807460 () Bool)

(declare-fun e!807462 () Bool)

(assert (=> b!1429497 (= e!807460 e!807462)))

(declare-fun res!963451 () Bool)

(assert (=> b!1429497 (=> (not res!963451) (not e!807462))))

(declare-datatypes ((SeekEntryResult!11231 0))(
  ( (MissingZero!11231 (index!47316 (_ BitVec 32))) (Found!11231 (index!47317 (_ BitVec 32))) (Intermediate!11231 (undefined!12043 Bool) (index!47318 (_ BitVec 32)) (x!129116 (_ BitVec 32))) (Undefined!11231) (MissingVacant!11231 (index!47319 (_ BitVec 32))) )
))
(declare-fun lt!629347 () SeekEntryResult!11231)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97481 0))(
  ( (array!97482 (arr!47050 (Array (_ BitVec 32) (_ BitVec 64))) (size!47601 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97481)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97481 (_ BitVec 32)) SeekEntryResult!11231)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429497 (= res!963451 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47050 a!2831) j!81) mask!2608) (select (arr!47050 a!2831) j!81) a!2831 mask!2608) lt!629347))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1429497 (= lt!629347 (Intermediate!11231 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429498 () Bool)

(declare-fun e!807464 () Bool)

(assert (=> b!1429498 (= e!807462 e!807464)))

(declare-fun res!963443 () Bool)

(assert (=> b!1429498 (=> (not res!963443) (not e!807464))))

(declare-fun lt!629351 () array!97481)

(declare-fun lt!629348 () SeekEntryResult!11231)

(declare-fun lt!629350 () (_ BitVec 64))

(assert (=> b!1429498 (= res!963443 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629350 mask!2608) lt!629350 lt!629351 mask!2608) lt!629348))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429498 (= lt!629348 (Intermediate!11231 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429498 (= lt!629350 (select (store (arr!47050 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429498 (= lt!629351 (array!97482 (store (arr!47050 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47601 a!2831)))))

(declare-fun b!1429500 () Bool)

(declare-fun res!963450 () Bool)

(assert (=> b!1429500 (=> (not res!963450) (not e!807464))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1429500 (= res!963450 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629350 lt!629351 mask!2608) lt!629348))))

(declare-fun b!1429501 () Bool)

(declare-fun res!963449 () Bool)

(assert (=> b!1429501 (=> (not res!963449) (not e!807460))))

(declare-datatypes ((List!33547 0))(
  ( (Nil!33544) (Cons!33543 (h!34865 (_ BitVec 64)) (t!48233 List!33547)) )
))
(declare-fun arrayNoDuplicates!0 (array!97481 (_ BitVec 32) List!33547) Bool)

(assert (=> b!1429501 (= res!963449 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33544))))

(declare-fun b!1429502 () Bool)

(declare-fun res!963454 () Bool)

(assert (=> b!1429502 (=> (not res!963454) (not e!807460))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429502 (= res!963454 (validKeyInArray!0 (select (arr!47050 a!2831) i!982)))))

(declare-fun b!1429503 () Bool)

(declare-fun res!963446 () Bool)

(assert (=> b!1429503 (=> (not res!963446) (not e!807464))))

(assert (=> b!1429503 (= res!963446 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47050 a!2831) j!81) a!2831 mask!2608) lt!629347))))

(declare-fun e!807463 () Bool)

(declare-fun b!1429504 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97481 (_ BitVec 32)) SeekEntryResult!11231)

(assert (=> b!1429504 (= e!807463 (= (seekEntryOrOpen!0 (select (arr!47050 a!2831) j!81) a!2831 mask!2608) (Found!11231 j!81)))))

(declare-fun b!1429505 () Bool)

(declare-fun res!963453 () Bool)

(assert (=> b!1429505 (=> (not res!963453) (not e!807460))))

(assert (=> b!1429505 (= res!963453 (and (= (size!47601 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47601 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47601 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!963445 () Bool)

(assert (=> start!123398 (=> (not res!963445) (not e!807460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123398 (= res!963445 (validMask!0 mask!2608))))

(assert (=> start!123398 e!807460))

(assert (=> start!123398 true))

(declare-fun array_inv!36331 (array!97481) Bool)

(assert (=> start!123398 (array_inv!36331 a!2831)))

(declare-fun b!1429499 () Bool)

(assert (=> b!1429499 (= e!807464 (not true))))

(assert (=> b!1429499 e!807463))

(declare-fun res!963442 () Bool)

(assert (=> b!1429499 (=> (not res!963442) (not e!807463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97481 (_ BitVec 32)) Bool)

(assert (=> b!1429499 (= res!963442 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48239 0))(
  ( (Unit!48240) )
))
(declare-fun lt!629349 () Unit!48239)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97481 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48239)

(assert (=> b!1429499 (= lt!629349 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429506 () Bool)

(declare-fun res!963444 () Bool)

(assert (=> b!1429506 (=> (not res!963444) (not e!807460))))

(assert (=> b!1429506 (= res!963444 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47601 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47601 a!2831))))))

(declare-fun b!1429507 () Bool)

(declare-fun res!963452 () Bool)

(assert (=> b!1429507 (=> (not res!963452) (not e!807464))))

(assert (=> b!1429507 (= res!963452 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429508 () Bool)

(declare-fun res!963447 () Bool)

(assert (=> b!1429508 (=> (not res!963447) (not e!807460))))

(assert (=> b!1429508 (= res!963447 (validKeyInArray!0 (select (arr!47050 a!2831) j!81)))))

(declare-fun b!1429509 () Bool)

(declare-fun res!963448 () Bool)

(assert (=> b!1429509 (=> (not res!963448) (not e!807460))))

(assert (=> b!1429509 (= res!963448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!123398 res!963445) b!1429505))

(assert (= (and b!1429505 res!963453) b!1429502))

(assert (= (and b!1429502 res!963454) b!1429508))

(assert (= (and b!1429508 res!963447) b!1429509))

(assert (= (and b!1429509 res!963448) b!1429501))

(assert (= (and b!1429501 res!963449) b!1429506))

(assert (= (and b!1429506 res!963444) b!1429497))

(assert (= (and b!1429497 res!963451) b!1429498))

(assert (= (and b!1429498 res!963443) b!1429503))

(assert (= (and b!1429503 res!963446) b!1429500))

(assert (= (and b!1429500 res!963450) b!1429507))

(assert (= (and b!1429507 res!963452) b!1429499))

(assert (= (and b!1429499 res!963442) b!1429504))

(declare-fun m!1319859 () Bool)

(assert (=> b!1429502 m!1319859))

(assert (=> b!1429502 m!1319859))

(declare-fun m!1319861 () Bool)

(assert (=> b!1429502 m!1319861))

(declare-fun m!1319863 () Bool)

(assert (=> b!1429501 m!1319863))

(declare-fun m!1319865 () Bool)

(assert (=> b!1429508 m!1319865))

(assert (=> b!1429508 m!1319865))

(declare-fun m!1319867 () Bool)

(assert (=> b!1429508 m!1319867))

(assert (=> b!1429497 m!1319865))

(assert (=> b!1429497 m!1319865))

(declare-fun m!1319869 () Bool)

(assert (=> b!1429497 m!1319869))

(assert (=> b!1429497 m!1319869))

(assert (=> b!1429497 m!1319865))

(declare-fun m!1319871 () Bool)

(assert (=> b!1429497 m!1319871))

(declare-fun m!1319873 () Bool)

(assert (=> b!1429500 m!1319873))

(assert (=> b!1429503 m!1319865))

(assert (=> b!1429503 m!1319865))

(declare-fun m!1319875 () Bool)

(assert (=> b!1429503 m!1319875))

(declare-fun m!1319877 () Bool)

(assert (=> b!1429499 m!1319877))

(declare-fun m!1319879 () Bool)

(assert (=> b!1429499 m!1319879))

(declare-fun m!1319881 () Bool)

(assert (=> b!1429498 m!1319881))

(assert (=> b!1429498 m!1319881))

(declare-fun m!1319883 () Bool)

(assert (=> b!1429498 m!1319883))

(declare-fun m!1319885 () Bool)

(assert (=> b!1429498 m!1319885))

(declare-fun m!1319887 () Bool)

(assert (=> b!1429498 m!1319887))

(declare-fun m!1319889 () Bool)

(assert (=> start!123398 m!1319889))

(declare-fun m!1319891 () Bool)

(assert (=> start!123398 m!1319891))

(declare-fun m!1319893 () Bool)

(assert (=> b!1429509 m!1319893))

(assert (=> b!1429504 m!1319865))

(assert (=> b!1429504 m!1319865))

(declare-fun m!1319895 () Bool)

(assert (=> b!1429504 m!1319895))

(check-sat (not b!1429503) (not b!1429508) (not start!123398) (not b!1429500) (not b!1429504) (not b!1429499) (not b!1429509) (not b!1429497) (not b!1429501) (not b!1429498) (not b!1429502))
(check-sat)
