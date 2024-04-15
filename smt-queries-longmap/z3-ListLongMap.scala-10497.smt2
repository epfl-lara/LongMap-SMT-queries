; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123542 () Bool)

(assert start!123542)

(declare-fun b!1432404 () Bool)

(declare-fun res!966372 () Bool)

(declare-fun e!808563 () Bool)

(assert (=> b!1432404 (=> (not res!966372) (not e!808563))))

(declare-datatypes ((array!97479 0))(
  ( (array!97480 (arr!47047 (Array (_ BitVec 32) (_ BitVec 64))) (size!47599 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97479)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432404 (= res!966372 (validKeyInArray!0 (select (arr!47047 a!2831) i!982)))))

(declare-fun b!1432405 () Bool)

(declare-fun res!966382 () Bool)

(declare-fun e!808565 () Bool)

(assert (=> b!1432405 (=> (not res!966382) (not e!808565))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11353 0))(
  ( (MissingZero!11353 (index!47804 (_ BitVec 32))) (Found!11353 (index!47805 (_ BitVec 32))) (Intermediate!11353 (undefined!12165 Bool) (index!47806 (_ BitVec 32)) (x!129438 (_ BitVec 32))) (Undefined!11353) (MissingVacant!11353 (index!47807 (_ BitVec 32))) )
))
(declare-fun lt!630426 () SeekEntryResult!11353)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97479 (_ BitVec 32)) SeekEntryResult!11353)

(assert (=> b!1432405 (= res!966382 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47047 a!2831) j!81) a!2831 mask!2608) lt!630426))))

(declare-fun b!1432406 () Bool)

(declare-fun e!808561 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97479 (_ BitVec 32)) SeekEntryResult!11353)

(assert (=> b!1432406 (= e!808561 (= (seekEntryOrOpen!0 (select (arr!47047 a!2831) j!81) a!2831 mask!2608) (Found!11353 j!81)))))

(declare-fun b!1432407 () Bool)

(declare-fun res!966375 () Bool)

(assert (=> b!1432407 (=> (not res!966375) (not e!808563))))

(assert (=> b!1432407 (= res!966375 (validKeyInArray!0 (select (arr!47047 a!2831) j!81)))))

(declare-fun b!1432408 () Bool)

(declare-fun res!966381 () Bool)

(assert (=> b!1432408 (=> (not res!966381) (not e!808563))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1432408 (= res!966381 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47599 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47599 a!2831))))))

(declare-fun b!1432409 () Bool)

(declare-fun res!966385 () Bool)

(assert (=> b!1432409 (=> (not res!966385) (not e!808565))))

(declare-fun lt!630428 () (_ BitVec 64))

(declare-fun lt!630429 () SeekEntryResult!11353)

(declare-fun lt!630425 () array!97479)

(assert (=> b!1432409 (= res!966385 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630428 lt!630425 mask!2608) lt!630429))))

(declare-fun b!1432410 () Bool)

(declare-fun e!808564 () Bool)

(assert (=> b!1432410 (= e!808564 e!808565)))

(declare-fun res!966383 () Bool)

(assert (=> b!1432410 (=> (not res!966383) (not e!808565))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432410 (= res!966383 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630428 mask!2608) lt!630428 lt!630425 mask!2608) lt!630429))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1432410 (= lt!630429 (Intermediate!11353 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432410 (= lt!630428 (select (store (arr!47047 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432410 (= lt!630425 (array!97480 (store (arr!47047 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47599 a!2831)))))

(declare-fun b!1432411 () Bool)

(declare-fun e!808562 () Bool)

(assert (=> b!1432411 (= e!808565 (not e!808562))))

(declare-fun res!966379 () Bool)

(assert (=> b!1432411 (=> res!966379 e!808562)))

(assert (=> b!1432411 (= res!966379 (or (= (select (arr!47047 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47047 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47047 a!2831) index!585) (select (arr!47047 a!2831) j!81)) (= (select (store (arr!47047 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1432411 e!808561))

(declare-fun res!966377 () Bool)

(assert (=> b!1432411 (=> (not res!966377) (not e!808561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97479 (_ BitVec 32)) Bool)

(assert (=> b!1432411 (= res!966377 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48291 0))(
  ( (Unit!48292) )
))
(declare-fun lt!630427 () Unit!48291)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48291)

(assert (=> b!1432411 (= lt!630427 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1432412 () Bool)

(assert (=> b!1432412 (= e!808562 true)))

(declare-fun lt!630424 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432412 (= lt!630424 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432413 () Bool)

(declare-fun res!966378 () Bool)

(assert (=> b!1432413 (=> (not res!966378) (not e!808563))))

(assert (=> b!1432413 (= res!966378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432414 () Bool)

(assert (=> b!1432414 (= e!808563 e!808564)))

(declare-fun res!966376 () Bool)

(assert (=> b!1432414 (=> (not res!966376) (not e!808564))))

(assert (=> b!1432414 (= res!966376 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47047 a!2831) j!81) mask!2608) (select (arr!47047 a!2831) j!81) a!2831 mask!2608) lt!630426))))

(assert (=> b!1432414 (= lt!630426 (Intermediate!11353 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!966374 () Bool)

(assert (=> start!123542 (=> (not res!966374) (not e!808563))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123542 (= res!966374 (validMask!0 mask!2608))))

(assert (=> start!123542 e!808563))

(assert (=> start!123542 true))

(declare-fun array_inv!36280 (array!97479) Bool)

(assert (=> start!123542 (array_inv!36280 a!2831)))

(declare-fun b!1432403 () Bool)

(declare-fun res!966380 () Bool)

(assert (=> b!1432403 (=> (not res!966380) (not e!808565))))

(assert (=> b!1432403 (= res!966380 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432415 () Bool)

(declare-fun res!966373 () Bool)

(assert (=> b!1432415 (=> (not res!966373) (not e!808563))))

(assert (=> b!1432415 (= res!966373 (and (= (size!47599 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47599 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47599 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432416 () Bool)

(declare-fun res!966384 () Bool)

(assert (=> b!1432416 (=> (not res!966384) (not e!808563))))

(declare-datatypes ((List!33635 0))(
  ( (Nil!33632) (Cons!33631 (h!34954 (_ BitVec 64)) (t!48321 List!33635)) )
))
(declare-fun arrayNoDuplicates!0 (array!97479 (_ BitVec 32) List!33635) Bool)

(assert (=> b!1432416 (= res!966384 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33632))))

(assert (= (and start!123542 res!966374) b!1432415))

(assert (= (and b!1432415 res!966373) b!1432404))

(assert (= (and b!1432404 res!966372) b!1432407))

(assert (= (and b!1432407 res!966375) b!1432413))

(assert (= (and b!1432413 res!966378) b!1432416))

(assert (= (and b!1432416 res!966384) b!1432408))

(assert (= (and b!1432408 res!966381) b!1432414))

(assert (= (and b!1432414 res!966376) b!1432410))

(assert (= (and b!1432410 res!966383) b!1432405))

(assert (= (and b!1432405 res!966382) b!1432409))

(assert (= (and b!1432409 res!966385) b!1432403))

(assert (= (and b!1432403 res!966380) b!1432411))

(assert (= (and b!1432411 res!966377) b!1432406))

(assert (= (and b!1432411 (not res!966379)) b!1432412))

(declare-fun m!1321733 () Bool)

(assert (=> b!1432416 m!1321733))

(declare-fun m!1321735 () Bool)

(assert (=> b!1432405 m!1321735))

(assert (=> b!1432405 m!1321735))

(declare-fun m!1321737 () Bool)

(assert (=> b!1432405 m!1321737))

(declare-fun m!1321739 () Bool)

(assert (=> b!1432413 m!1321739))

(declare-fun m!1321741 () Bool)

(assert (=> b!1432410 m!1321741))

(assert (=> b!1432410 m!1321741))

(declare-fun m!1321743 () Bool)

(assert (=> b!1432410 m!1321743))

(declare-fun m!1321745 () Bool)

(assert (=> b!1432410 m!1321745))

(declare-fun m!1321747 () Bool)

(assert (=> b!1432410 m!1321747))

(assert (=> b!1432411 m!1321745))

(declare-fun m!1321749 () Bool)

(assert (=> b!1432411 m!1321749))

(declare-fun m!1321751 () Bool)

(assert (=> b!1432411 m!1321751))

(declare-fun m!1321753 () Bool)

(assert (=> b!1432411 m!1321753))

(assert (=> b!1432411 m!1321735))

(declare-fun m!1321755 () Bool)

(assert (=> b!1432411 m!1321755))

(declare-fun m!1321757 () Bool)

(assert (=> b!1432409 m!1321757))

(assert (=> b!1432407 m!1321735))

(assert (=> b!1432407 m!1321735))

(declare-fun m!1321759 () Bool)

(assert (=> b!1432407 m!1321759))

(declare-fun m!1321761 () Bool)

(assert (=> b!1432404 m!1321761))

(assert (=> b!1432404 m!1321761))

(declare-fun m!1321763 () Bool)

(assert (=> b!1432404 m!1321763))

(assert (=> b!1432406 m!1321735))

(assert (=> b!1432406 m!1321735))

(declare-fun m!1321765 () Bool)

(assert (=> b!1432406 m!1321765))

(declare-fun m!1321767 () Bool)

(assert (=> b!1432412 m!1321767))

(declare-fun m!1321769 () Bool)

(assert (=> start!123542 m!1321769))

(declare-fun m!1321771 () Bool)

(assert (=> start!123542 m!1321771))

(assert (=> b!1432414 m!1321735))

(assert (=> b!1432414 m!1321735))

(declare-fun m!1321773 () Bool)

(assert (=> b!1432414 m!1321773))

(assert (=> b!1432414 m!1321773))

(assert (=> b!1432414 m!1321735))

(declare-fun m!1321775 () Bool)

(assert (=> b!1432414 m!1321775))

(check-sat (not b!1432404) (not b!1432413) (not b!1432411) (not b!1432407) (not b!1432409) (not b!1432410) (not b!1432416) (not b!1432412) (not b!1432406) (not b!1432405) (not b!1432414) (not start!123542))
(check-sat)
