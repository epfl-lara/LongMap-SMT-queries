; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123512 () Bool)

(assert start!123512)

(declare-fun b!1431605 () Bool)

(declare-fun res!965469 () Bool)

(declare-fun e!808243 () Bool)

(assert (=> b!1431605 (=> (not res!965469) (not e!808243))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97484 0))(
  ( (array!97485 (arr!47049 (Array (_ BitVec 32) (_ BitVec 64))) (size!47599 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97484)

(declare-datatypes ((SeekEntryResult!11328 0))(
  ( (MissingZero!11328 (index!47704 (_ BitVec 32))) (Found!11328 (index!47705 (_ BitVec 32))) (Intermediate!11328 (undefined!12140 Bool) (index!47706 (_ BitVec 32)) (x!129354 (_ BitVec 32))) (Undefined!11328) (MissingVacant!11328 (index!47707 (_ BitVec 32))) )
))
(declare-fun lt!630238 () SeekEntryResult!11328)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97484 (_ BitVec 32)) SeekEntryResult!11328)

(assert (=> b!1431605 (= res!965469 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47049 a!2831) j!81) a!2831 mask!2608) lt!630238))))

(declare-fun b!1431606 () Bool)

(declare-fun res!965473 () Bool)

(declare-fun e!808245 () Bool)

(assert (=> b!1431606 (=> (not res!965473) (not e!808245))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431606 (= res!965473 (validKeyInArray!0 (select (arr!47049 a!2831) i!982)))))

(declare-fun b!1431607 () Bool)

(declare-fun res!965474 () Bool)

(assert (=> b!1431607 (=> (not res!965474) (not e!808243))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1431607 (= res!965474 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431608 () Bool)

(declare-fun e!808244 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97484 (_ BitVec 32)) SeekEntryResult!11328)

(assert (=> b!1431608 (= e!808244 (= (seekEntryOrOpen!0 (select (arr!47049 a!2831) j!81) a!2831 mask!2608) (Found!11328 j!81)))))

(declare-fun b!1431610 () Bool)

(declare-fun res!965481 () Bool)

(assert (=> b!1431610 (=> (not res!965481) (not e!808245))))

(declare-datatypes ((List!33559 0))(
  ( (Nil!33556) (Cons!33555 (h!34878 (_ BitVec 64)) (t!48253 List!33559)) )
))
(declare-fun arrayNoDuplicates!0 (array!97484 (_ BitVec 32) List!33559) Bool)

(assert (=> b!1431610 (= res!965481 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33556))))

(declare-fun b!1431611 () Bool)

(declare-fun res!965479 () Bool)

(assert (=> b!1431611 (=> (not res!965479) (not e!808245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97484 (_ BitVec 32)) Bool)

(assert (=> b!1431611 (= res!965479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1431612 () Bool)

(declare-fun res!965471 () Bool)

(assert (=> b!1431612 (=> (not res!965471) (not e!808243))))

(declare-fun lt!630240 () SeekEntryResult!11328)

(declare-fun lt!630237 () array!97484)

(declare-fun lt!630235 () (_ BitVec 64))

(assert (=> b!1431612 (= res!965471 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630235 lt!630237 mask!2608) lt!630240))))

(declare-fun b!1431613 () Bool)

(declare-fun e!808247 () Bool)

(assert (=> b!1431613 (= e!808243 (not e!808247))))

(declare-fun res!965480 () Bool)

(assert (=> b!1431613 (=> res!965480 e!808247)))

(assert (=> b!1431613 (= res!965480 (or (= (select (arr!47049 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47049 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47049 a!2831) index!585) (select (arr!47049 a!2831) j!81)) (= (select (store (arr!47049 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1431613 e!808244))

(declare-fun res!965470 () Bool)

(assert (=> b!1431613 (=> (not res!965470) (not e!808244))))

(assert (=> b!1431613 (= res!965470 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48402 0))(
  ( (Unit!48403) )
))
(declare-fun lt!630239 () Unit!48402)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97484 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48402)

(assert (=> b!1431613 (= lt!630239 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1431614 () Bool)

(declare-fun res!965477 () Bool)

(assert (=> b!1431614 (=> (not res!965477) (not e!808245))))

(assert (=> b!1431614 (= res!965477 (and (= (size!47599 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47599 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47599 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1431615 () Bool)

(declare-fun e!808246 () Bool)

(assert (=> b!1431615 (= e!808246 e!808243)))

(declare-fun res!965475 () Bool)

(assert (=> b!1431615 (=> (not res!965475) (not e!808243))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431615 (= res!965475 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630235 mask!2608) lt!630235 lt!630237 mask!2608) lt!630240))))

(assert (=> b!1431615 (= lt!630240 (Intermediate!11328 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1431615 (= lt!630235 (select (store (arr!47049 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431615 (= lt!630237 (array!97485 (store (arr!47049 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47599 a!2831)))))

(declare-fun b!1431616 () Bool)

(assert (=> b!1431616 (= e!808245 e!808246)))

(declare-fun res!965476 () Bool)

(assert (=> b!1431616 (=> (not res!965476) (not e!808246))))

(assert (=> b!1431616 (= res!965476 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47049 a!2831) j!81) mask!2608) (select (arr!47049 a!2831) j!81) a!2831 mask!2608) lt!630238))))

(assert (=> b!1431616 (= lt!630238 (Intermediate!11328 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1431617 () Bool)

(assert (=> b!1431617 (= e!808247 true)))

(declare-fun lt!630236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431617 (= lt!630236 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1431618 () Bool)

(declare-fun res!965472 () Bool)

(assert (=> b!1431618 (=> (not res!965472) (not e!808245))))

(assert (=> b!1431618 (= res!965472 (validKeyInArray!0 (select (arr!47049 a!2831) j!81)))))

(declare-fun res!965478 () Bool)

(assert (=> start!123512 (=> (not res!965478) (not e!808245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123512 (= res!965478 (validMask!0 mask!2608))))

(assert (=> start!123512 e!808245))

(assert (=> start!123512 true))

(declare-fun array_inv!36077 (array!97484) Bool)

(assert (=> start!123512 (array_inv!36077 a!2831)))

(declare-fun b!1431609 () Bool)

(declare-fun res!965482 () Bool)

(assert (=> b!1431609 (=> (not res!965482) (not e!808245))))

(assert (=> b!1431609 (= res!965482 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47599 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47599 a!2831))))))

(assert (= (and start!123512 res!965478) b!1431614))

(assert (= (and b!1431614 res!965477) b!1431606))

(assert (= (and b!1431606 res!965473) b!1431618))

(assert (= (and b!1431618 res!965472) b!1431611))

(assert (= (and b!1431611 res!965479) b!1431610))

(assert (= (and b!1431610 res!965481) b!1431609))

(assert (= (and b!1431609 res!965482) b!1431616))

(assert (= (and b!1431616 res!965476) b!1431615))

(assert (= (and b!1431615 res!965475) b!1431605))

(assert (= (and b!1431605 res!965469) b!1431612))

(assert (= (and b!1431612 res!965471) b!1431607))

(assert (= (and b!1431607 res!965474) b!1431613))

(assert (= (and b!1431613 res!965470) b!1431608))

(assert (= (and b!1431613 (not res!965480)) b!1431617))

(declare-fun m!1321373 () Bool)

(assert (=> b!1431612 m!1321373))

(declare-fun m!1321375 () Bool)

(assert (=> b!1431611 m!1321375))

(declare-fun m!1321377 () Bool)

(assert (=> b!1431616 m!1321377))

(assert (=> b!1431616 m!1321377))

(declare-fun m!1321379 () Bool)

(assert (=> b!1431616 m!1321379))

(assert (=> b!1431616 m!1321379))

(assert (=> b!1431616 m!1321377))

(declare-fun m!1321381 () Bool)

(assert (=> b!1431616 m!1321381))

(declare-fun m!1321383 () Bool)

(assert (=> start!123512 m!1321383))

(declare-fun m!1321385 () Bool)

(assert (=> start!123512 m!1321385))

(declare-fun m!1321387 () Bool)

(assert (=> b!1431615 m!1321387))

(assert (=> b!1431615 m!1321387))

(declare-fun m!1321389 () Bool)

(assert (=> b!1431615 m!1321389))

(declare-fun m!1321391 () Bool)

(assert (=> b!1431615 m!1321391))

(declare-fun m!1321393 () Bool)

(assert (=> b!1431615 m!1321393))

(assert (=> b!1431605 m!1321377))

(assert (=> b!1431605 m!1321377))

(declare-fun m!1321395 () Bool)

(assert (=> b!1431605 m!1321395))

(declare-fun m!1321397 () Bool)

(assert (=> b!1431606 m!1321397))

(assert (=> b!1431606 m!1321397))

(declare-fun m!1321399 () Bool)

(assert (=> b!1431606 m!1321399))

(assert (=> b!1431618 m!1321377))

(assert (=> b!1431618 m!1321377))

(declare-fun m!1321401 () Bool)

(assert (=> b!1431618 m!1321401))

(assert (=> b!1431613 m!1321391))

(declare-fun m!1321403 () Bool)

(assert (=> b!1431613 m!1321403))

(declare-fun m!1321405 () Bool)

(assert (=> b!1431613 m!1321405))

(declare-fun m!1321407 () Bool)

(assert (=> b!1431613 m!1321407))

(assert (=> b!1431613 m!1321377))

(declare-fun m!1321409 () Bool)

(assert (=> b!1431613 m!1321409))

(assert (=> b!1431608 m!1321377))

(assert (=> b!1431608 m!1321377))

(declare-fun m!1321411 () Bool)

(assert (=> b!1431608 m!1321411))

(declare-fun m!1321413 () Bool)

(assert (=> b!1431617 m!1321413))

(declare-fun m!1321415 () Bool)

(assert (=> b!1431610 m!1321415))

(check-sat (not start!123512) (not b!1431618) (not b!1431605) (not b!1431610) (not b!1431616) (not b!1431617) (not b!1431611) (not b!1431608) (not b!1431613) (not b!1431615) (not b!1431606) (not b!1431612))
(check-sat)
