; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123266 () Bool)

(assert start!123266)

(declare-fun b!1429449 () Bool)

(declare-fun e!807143 () Bool)

(assert (=> b!1429449 (= e!807143 (not true))))

(declare-fun e!807142 () Bool)

(assert (=> b!1429449 e!807142))

(declare-fun res!964081 () Bool)

(assert (=> b!1429449 (=> (not res!964081) (not e!807142))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97427 0))(
  ( (array!97428 (arr!47025 (Array (_ BitVec 32) (_ BitVec 64))) (size!47575 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97427)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97427 (_ BitVec 32)) Bool)

(assert (=> b!1429449 (= res!964081 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48354 0))(
  ( (Unit!48355) )
))
(declare-fun lt!629370 () Unit!48354)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97427 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48354)

(assert (=> b!1429449 (= lt!629370 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429450 () Bool)

(declare-fun res!964088 () Bool)

(declare-fun e!807144 () Bool)

(assert (=> b!1429450 (=> (not res!964088) (not e!807144))))

(assert (=> b!1429450 (= res!964088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429451 () Bool)

(declare-fun res!964080 () Bool)

(assert (=> b!1429451 (=> (not res!964080) (not e!807144))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429451 (= res!964080 (and (= (size!47575 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47575 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47575 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429452 () Bool)

(declare-fun res!964083 () Bool)

(assert (=> b!1429452 (=> (not res!964083) (not e!807143))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11304 0))(
  ( (MissingZero!11304 (index!47608 (_ BitVec 32))) (Found!11304 (index!47609 (_ BitVec 32))) (Intermediate!11304 (undefined!12116 Bool) (index!47610 (_ BitVec 32)) (x!129242 (_ BitVec 32))) (Undefined!11304) (MissingVacant!11304 (index!47611 (_ BitVec 32))) )
))
(declare-fun lt!629371 () SeekEntryResult!11304)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97427 (_ BitVec 32)) SeekEntryResult!11304)

(assert (=> b!1429452 (= res!964083 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47025 a!2831) j!81) a!2831 mask!2608) lt!629371))))

(declare-fun b!1429453 () Bool)

(declare-fun res!964079 () Bool)

(assert (=> b!1429453 (=> (not res!964079) (not e!807144))))

(declare-datatypes ((List!33535 0))(
  ( (Nil!33532) (Cons!33531 (h!34845 (_ BitVec 64)) (t!48229 List!33535)) )
))
(declare-fun arrayNoDuplicates!0 (array!97427 (_ BitVec 32) List!33535) Bool)

(assert (=> b!1429453 (= res!964079 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33532))))

(declare-fun b!1429454 () Bool)

(declare-fun res!964090 () Bool)

(assert (=> b!1429454 (=> (not res!964090) (not e!807144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429454 (= res!964090 (validKeyInArray!0 (select (arr!47025 a!2831) j!81)))))

(declare-fun b!1429455 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97427 (_ BitVec 32)) SeekEntryResult!11304)

(assert (=> b!1429455 (= e!807142 (= (seekEntryOrOpen!0 (select (arr!47025 a!2831) j!81) a!2831 mask!2608) (Found!11304 j!81)))))

(declare-fun b!1429457 () Bool)

(declare-fun e!807146 () Bool)

(assert (=> b!1429457 (= e!807146 e!807143)))

(declare-fun res!964087 () Bool)

(assert (=> b!1429457 (=> (not res!964087) (not e!807143))))

(declare-fun lt!629372 () array!97427)

(declare-fun lt!629373 () (_ BitVec 64))

(declare-fun lt!629369 () SeekEntryResult!11304)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429457 (= res!964087 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629373 mask!2608) lt!629373 lt!629372 mask!2608) lt!629369))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429457 (= lt!629369 (Intermediate!11304 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429457 (= lt!629373 (select (store (arr!47025 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429457 (= lt!629372 (array!97428 (store (arr!47025 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47575 a!2831)))))

(declare-fun b!1429458 () Bool)

(declare-fun res!964086 () Bool)

(assert (=> b!1429458 (=> (not res!964086) (not e!807144))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1429458 (= res!964086 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47575 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47575 a!2831))))))

(declare-fun b!1429459 () Bool)

(declare-fun res!964085 () Bool)

(assert (=> b!1429459 (=> (not res!964085) (not e!807143))))

(assert (=> b!1429459 (= res!964085 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629373 lt!629372 mask!2608) lt!629369))))

(declare-fun b!1429460 () Bool)

(declare-fun res!964084 () Bool)

(assert (=> b!1429460 (=> (not res!964084) (not e!807144))))

(assert (=> b!1429460 (= res!964084 (validKeyInArray!0 (select (arr!47025 a!2831) i!982)))))

(declare-fun b!1429461 () Bool)

(assert (=> b!1429461 (= e!807144 e!807146)))

(declare-fun res!964082 () Bool)

(assert (=> b!1429461 (=> (not res!964082) (not e!807146))))

(assert (=> b!1429461 (= res!964082 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47025 a!2831) j!81) mask!2608) (select (arr!47025 a!2831) j!81) a!2831 mask!2608) lt!629371))))

(assert (=> b!1429461 (= lt!629371 (Intermediate!11304 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429456 () Bool)

(declare-fun res!964089 () Bool)

(assert (=> b!1429456 (=> (not res!964089) (not e!807143))))

(assert (=> b!1429456 (= res!964089 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun res!964078 () Bool)

(assert (=> start!123266 (=> (not res!964078) (not e!807144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123266 (= res!964078 (validMask!0 mask!2608))))

(assert (=> start!123266 e!807144))

(assert (=> start!123266 true))

(declare-fun array_inv!36053 (array!97427) Bool)

(assert (=> start!123266 (array_inv!36053 a!2831)))

(assert (= (and start!123266 res!964078) b!1429451))

(assert (= (and b!1429451 res!964080) b!1429460))

(assert (= (and b!1429460 res!964084) b!1429454))

(assert (= (and b!1429454 res!964090) b!1429450))

(assert (= (and b!1429450 res!964088) b!1429453))

(assert (= (and b!1429453 res!964079) b!1429458))

(assert (= (and b!1429458 res!964086) b!1429461))

(assert (= (and b!1429461 res!964082) b!1429457))

(assert (= (and b!1429457 res!964087) b!1429452))

(assert (= (and b!1429452 res!964083) b!1429459))

(assert (= (and b!1429459 res!964085) b!1429456))

(assert (= (and b!1429456 res!964089) b!1429449))

(assert (= (and b!1429449 res!964081) b!1429455))

(declare-fun m!1319549 () Bool)

(assert (=> b!1429453 m!1319549))

(declare-fun m!1319551 () Bool)

(assert (=> b!1429449 m!1319551))

(declare-fun m!1319553 () Bool)

(assert (=> b!1429449 m!1319553))

(declare-fun m!1319555 () Bool)

(assert (=> b!1429454 m!1319555))

(assert (=> b!1429454 m!1319555))

(declare-fun m!1319557 () Bool)

(assert (=> b!1429454 m!1319557))

(assert (=> b!1429452 m!1319555))

(assert (=> b!1429452 m!1319555))

(declare-fun m!1319559 () Bool)

(assert (=> b!1429452 m!1319559))

(declare-fun m!1319561 () Bool)

(assert (=> b!1429450 m!1319561))

(declare-fun m!1319563 () Bool)

(assert (=> b!1429460 m!1319563))

(assert (=> b!1429460 m!1319563))

(declare-fun m!1319565 () Bool)

(assert (=> b!1429460 m!1319565))

(declare-fun m!1319567 () Bool)

(assert (=> b!1429459 m!1319567))

(assert (=> b!1429461 m!1319555))

(assert (=> b!1429461 m!1319555))

(declare-fun m!1319569 () Bool)

(assert (=> b!1429461 m!1319569))

(assert (=> b!1429461 m!1319569))

(assert (=> b!1429461 m!1319555))

(declare-fun m!1319571 () Bool)

(assert (=> b!1429461 m!1319571))

(declare-fun m!1319573 () Bool)

(assert (=> start!123266 m!1319573))

(declare-fun m!1319575 () Bool)

(assert (=> start!123266 m!1319575))

(declare-fun m!1319577 () Bool)

(assert (=> b!1429457 m!1319577))

(assert (=> b!1429457 m!1319577))

(declare-fun m!1319579 () Bool)

(assert (=> b!1429457 m!1319579))

(declare-fun m!1319581 () Bool)

(assert (=> b!1429457 m!1319581))

(declare-fun m!1319583 () Bool)

(assert (=> b!1429457 m!1319583))

(assert (=> b!1429455 m!1319555))

(assert (=> b!1429455 m!1319555))

(declare-fun m!1319585 () Bool)

(assert (=> b!1429455 m!1319585))

(check-sat (not start!123266) (not b!1429452) (not b!1429453) (not b!1429457) (not b!1429454) (not b!1429455) (not b!1429450) (not b!1429460) (not b!1429459) (not b!1429461) (not b!1429449))
(check-sat)
