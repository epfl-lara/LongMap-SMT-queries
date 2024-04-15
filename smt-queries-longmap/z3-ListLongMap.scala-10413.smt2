; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122636 () Bool)

(assert start!122636)

(declare-fun b!1420475 () Bool)

(declare-fun e!803378 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96954 0))(
  ( (array!96955 (arr!46795 (Array (_ BitVec 32) (_ BitVec 64))) (size!47347 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96954)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420475 (= e!803378 (not (validKeyInArray!0 (select (store (arr!46795 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))))

(declare-fun b!1420476 () Bool)

(declare-fun res!955964 () Bool)

(declare-fun e!803377 () Bool)

(assert (=> b!1420476 (=> (not res!955964) (not e!803377))))

(declare-datatypes ((List!33383 0))(
  ( (Nil!33380) (Cons!33379 (h!34681 (_ BitVec 64)) (t!48069 List!33383)) )
))
(declare-fun arrayNoDuplicates!0 (array!96954 (_ BitVec 32) List!33383) Bool)

(assert (=> b!1420476 (= res!955964 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33380))))

(declare-fun b!1420477 () Bool)

(declare-fun res!955967 () Bool)

(assert (=> b!1420477 (=> (not res!955967) (not e!803378))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420477 (= res!955967 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvslt index!585 (bvadd #b00000000000000000000000000000001 mask!2608))))))

(declare-fun b!1420478 () Bool)

(declare-fun res!955965 () Bool)

(assert (=> b!1420478 (=> (not res!955965) (not e!803377))))

(assert (=> b!1420478 (= res!955965 (and (= (size!47347 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47347 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47347 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420479 () Bool)

(declare-fun res!955969 () Bool)

(assert (=> b!1420479 (=> (not res!955969) (not e!803377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96954 (_ BitVec 32)) Bool)

(assert (=> b!1420479 (= res!955969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420480 () Bool)

(declare-fun res!955961 () Bool)

(assert (=> b!1420480 (=> (not res!955961) (not e!803377))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1420480 (= res!955961 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47347 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47347 a!2831))))))

(declare-fun res!955966 () Bool)

(assert (=> start!122636 (=> (not res!955966) (not e!803377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122636 (= res!955966 (validMask!0 mask!2608))))

(assert (=> start!122636 e!803377))

(assert (=> start!122636 true))

(declare-fun array_inv!36028 (array!96954) Bool)

(assert (=> start!122636 (array_inv!36028 a!2831)))

(declare-fun b!1420481 () Bool)

(declare-fun res!955968 () Bool)

(assert (=> b!1420481 (=> (not res!955968) (not e!803378))))

(declare-datatypes ((SeekEntryResult!11107 0))(
  ( (MissingZero!11107 (index!46820 (_ BitVec 32))) (Found!11107 (index!46821 (_ BitVec 32))) (Intermediate!11107 (undefined!11919 Bool) (index!46822 (_ BitVec 32)) (x!128474 (_ BitVec 32))) (Undefined!11107) (MissingVacant!11107 (index!46823 (_ BitVec 32))) )
))
(declare-fun lt!625739 () SeekEntryResult!11107)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96954 (_ BitVec 32)) SeekEntryResult!11107)

(assert (=> b!1420481 (= res!955968 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46795 a!2831) j!81) a!2831 mask!2608) lt!625739))))

(declare-fun b!1420482 () Bool)

(declare-fun res!955962 () Bool)

(assert (=> b!1420482 (=> (not res!955962) (not e!803377))))

(assert (=> b!1420482 (= res!955962 (validKeyInArray!0 (select (arr!46795 a!2831) j!81)))))

(declare-fun b!1420483 () Bool)

(declare-fun res!955960 () Bool)

(assert (=> b!1420483 (=> (not res!955960) (not e!803377))))

(assert (=> b!1420483 (= res!955960 (validKeyInArray!0 (select (arr!46795 a!2831) i!982)))))

(declare-fun b!1420484 () Bool)

(declare-fun res!955959 () Bool)

(assert (=> b!1420484 (=> (not res!955959) (not e!803378))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420484 (= res!955959 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46795 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46795 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96955 (store (arr!46795 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47347 a!2831)) mask!2608) (Intermediate!11107 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1420485 () Bool)

(assert (=> b!1420485 (= e!803377 e!803378)))

(declare-fun res!955963 () Bool)

(assert (=> b!1420485 (=> (not res!955963) (not e!803378))))

(assert (=> b!1420485 (= res!955963 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46795 a!2831) j!81) mask!2608) (select (arr!46795 a!2831) j!81) a!2831 mask!2608) lt!625739))))

(assert (=> b!1420485 (= lt!625739 (Intermediate!11107 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122636 res!955966) b!1420478))

(assert (= (and b!1420478 res!955965) b!1420483))

(assert (= (and b!1420483 res!955960) b!1420482))

(assert (= (and b!1420482 res!955962) b!1420479))

(assert (= (and b!1420479 res!955969) b!1420476))

(assert (= (and b!1420476 res!955964) b!1420480))

(assert (= (and b!1420480 res!955961) b!1420485))

(assert (= (and b!1420485 res!955963) b!1420484))

(assert (= (and b!1420484 res!955959) b!1420481))

(assert (= (and b!1420481 res!955968) b!1420477))

(assert (= (and b!1420477 res!955967) b!1420475))

(declare-fun m!1310523 () Bool)

(assert (=> b!1420481 m!1310523))

(assert (=> b!1420481 m!1310523))

(declare-fun m!1310525 () Bool)

(assert (=> b!1420481 m!1310525))

(declare-fun m!1310527 () Bool)

(assert (=> b!1420484 m!1310527))

(declare-fun m!1310529 () Bool)

(assert (=> b!1420484 m!1310529))

(assert (=> b!1420484 m!1310529))

(declare-fun m!1310531 () Bool)

(assert (=> b!1420484 m!1310531))

(assert (=> b!1420484 m!1310531))

(assert (=> b!1420484 m!1310529))

(declare-fun m!1310533 () Bool)

(assert (=> b!1420484 m!1310533))

(declare-fun m!1310535 () Bool)

(assert (=> b!1420476 m!1310535))

(assert (=> b!1420482 m!1310523))

(assert (=> b!1420482 m!1310523))

(declare-fun m!1310537 () Bool)

(assert (=> b!1420482 m!1310537))

(assert (=> b!1420475 m!1310527))

(assert (=> b!1420475 m!1310529))

(assert (=> b!1420475 m!1310529))

(declare-fun m!1310539 () Bool)

(assert (=> b!1420475 m!1310539))

(assert (=> b!1420485 m!1310523))

(assert (=> b!1420485 m!1310523))

(declare-fun m!1310541 () Bool)

(assert (=> b!1420485 m!1310541))

(assert (=> b!1420485 m!1310541))

(assert (=> b!1420485 m!1310523))

(declare-fun m!1310543 () Bool)

(assert (=> b!1420485 m!1310543))

(declare-fun m!1310545 () Bool)

(assert (=> start!122636 m!1310545))

(declare-fun m!1310547 () Bool)

(assert (=> start!122636 m!1310547))

(declare-fun m!1310549 () Bool)

(assert (=> b!1420483 m!1310549))

(assert (=> b!1420483 m!1310549))

(declare-fun m!1310551 () Bool)

(assert (=> b!1420483 m!1310551))

(declare-fun m!1310553 () Bool)

(assert (=> b!1420479 m!1310553))

(check-sat (not start!122636) (not b!1420481) (not b!1420476) (not b!1420482) (not b!1420475) (not b!1420485) (not b!1420483) (not b!1420479) (not b!1420484))
(check-sat)
