; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122882 () Bool)

(assert start!122882)

(declare-fun b!1422571 () Bool)

(declare-fun res!957331 () Bool)

(declare-fun e!804471 () Bool)

(assert (=> b!1422571 (=> (not res!957331) (not e!804471))))

(declare-datatypes ((SeekEntryResult!11087 0))(
  ( (MissingZero!11087 (index!46740 (_ BitVec 32))) (Found!11087 (index!46741 (_ BitVec 32))) (Intermediate!11087 (undefined!11899 Bool) (index!46742 (_ BitVec 32)) (x!128548 (_ BitVec 32))) (Undefined!11087) (MissingVacant!11087 (index!46743 (_ BitVec 32))) )
))
(declare-fun lt!626662 () SeekEntryResult!11087)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97169 0))(
  ( (array!97170 (arr!46900 (Array (_ BitVec 32) (_ BitVec 64))) (size!47451 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97169)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97169 (_ BitVec 32)) SeekEntryResult!11087)

(assert (=> b!1422571 (= res!957331 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46900 a!2831) j!81) a!2831 mask!2608) lt!626662))))

(declare-fun b!1422572 () Bool)

(declare-fun e!804473 () Bool)

(declare-fun e!804472 () Bool)

(assert (=> b!1422572 (= e!804473 e!804472)))

(declare-fun res!957327 () Bool)

(assert (=> b!1422572 (=> (not res!957327) (not e!804472))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422572 (= res!957327 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46900 a!2831) j!81) mask!2608) (select (arr!46900 a!2831) j!81) a!2831 mask!2608) lt!626662))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1422572 (= lt!626662 (Intermediate!11087 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422573 () Bool)

(declare-fun res!957324 () Bool)

(assert (=> b!1422573 (=> (not res!957324) (not e!804473))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97169 (_ BitVec 32)) Bool)

(assert (=> b!1422573 (= res!957324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422574 () Bool)

(declare-fun res!957320 () Bool)

(assert (=> b!1422574 (=> (not res!957320) (not e!804473))))

(assert (=> b!1422574 (= res!957320 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47451 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47451 a!2831))))))

(declare-fun b!1422575 () Bool)

(declare-fun res!957322 () Bool)

(assert (=> b!1422575 (=> (not res!957322) (not e!804473))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422575 (= res!957322 (validKeyInArray!0 (select (arr!46900 a!2831) j!81)))))

(declare-fun res!957329 () Bool)

(assert (=> start!122882 (=> (not res!957329) (not e!804473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122882 (= res!957329 (validMask!0 mask!2608))))

(assert (=> start!122882 e!804473))

(assert (=> start!122882 true))

(declare-fun array_inv!36181 (array!97169) Bool)

(assert (=> start!122882 (array_inv!36181 a!2831)))

(declare-fun b!1422576 () Bool)

(declare-fun res!957323 () Bool)

(assert (=> b!1422576 (=> (not res!957323) (not e!804473))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1422576 (= res!957323 (validKeyInArray!0 (select (arr!46900 a!2831) i!982)))))

(declare-fun b!1422577 () Bool)

(declare-fun res!957330 () Bool)

(assert (=> b!1422577 (=> (not res!957330) (not e!804471))))

(declare-fun lt!626660 () (_ BitVec 64))

(declare-fun lt!626661 () SeekEntryResult!11087)

(declare-fun lt!626659 () array!97169)

(assert (=> b!1422577 (= res!957330 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626660 lt!626659 mask!2608) lt!626661))))

(declare-fun b!1422578 () Bool)

(declare-fun res!957321 () Bool)

(assert (=> b!1422578 (=> (not res!957321) (not e!804473))))

(declare-datatypes ((List!33397 0))(
  ( (Nil!33394) (Cons!33393 (h!34703 (_ BitVec 64)) (t!48083 List!33397)) )
))
(declare-fun arrayNoDuplicates!0 (array!97169 (_ BitVec 32) List!33397) Bool)

(assert (=> b!1422578 (= res!957321 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33394))))

(declare-fun b!1422579 () Bool)

(assert (=> b!1422579 (= e!804472 e!804471)))

(declare-fun res!957326 () Bool)

(assert (=> b!1422579 (=> (not res!957326) (not e!804471))))

(assert (=> b!1422579 (= res!957326 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626660 mask!2608) lt!626660 lt!626659 mask!2608) lt!626661))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422579 (= lt!626661 (Intermediate!11087 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422579 (= lt!626660 (select (store (arr!46900 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422579 (= lt!626659 (array!97170 (store (arr!46900 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47451 a!2831)))))

(declare-fun b!1422580 () Bool)

(declare-fun res!957328 () Bool)

(assert (=> b!1422580 (=> (not res!957328) (not e!804471))))

(assert (=> b!1422580 (= res!957328 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422581 () Bool)

(assert (=> b!1422581 (= e!804471 (not true))))

(assert (=> b!1422581 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48041 0))(
  ( (Unit!48042) )
))
(declare-fun lt!626663 () Unit!48041)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48041)

(assert (=> b!1422581 (= lt!626663 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422582 () Bool)

(declare-fun res!957325 () Bool)

(assert (=> b!1422582 (=> (not res!957325) (not e!804473))))

(assert (=> b!1422582 (= res!957325 (and (= (size!47451 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47451 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47451 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122882 res!957329) b!1422582))

(assert (= (and b!1422582 res!957325) b!1422576))

(assert (= (and b!1422576 res!957323) b!1422575))

(assert (= (and b!1422575 res!957322) b!1422573))

(assert (= (and b!1422573 res!957324) b!1422578))

(assert (= (and b!1422578 res!957321) b!1422574))

(assert (= (and b!1422574 res!957320) b!1422572))

(assert (= (and b!1422572 res!957327) b!1422579))

(assert (= (and b!1422579 res!957326) b!1422571))

(assert (= (and b!1422571 res!957331) b!1422577))

(assert (= (and b!1422577 res!957330) b!1422580))

(assert (= (and b!1422580 res!957328) b!1422581))

(declare-fun m!1313343 () Bool)

(assert (=> b!1422577 m!1313343))

(declare-fun m!1313345 () Bool)

(assert (=> b!1422579 m!1313345))

(assert (=> b!1422579 m!1313345))

(declare-fun m!1313347 () Bool)

(assert (=> b!1422579 m!1313347))

(declare-fun m!1313349 () Bool)

(assert (=> b!1422579 m!1313349))

(declare-fun m!1313351 () Bool)

(assert (=> b!1422579 m!1313351))

(declare-fun m!1313353 () Bool)

(assert (=> b!1422571 m!1313353))

(assert (=> b!1422571 m!1313353))

(declare-fun m!1313355 () Bool)

(assert (=> b!1422571 m!1313355))

(declare-fun m!1313357 () Bool)

(assert (=> start!122882 m!1313357))

(declare-fun m!1313359 () Bool)

(assert (=> start!122882 m!1313359))

(assert (=> b!1422572 m!1313353))

(assert (=> b!1422572 m!1313353))

(declare-fun m!1313361 () Bool)

(assert (=> b!1422572 m!1313361))

(assert (=> b!1422572 m!1313361))

(assert (=> b!1422572 m!1313353))

(declare-fun m!1313363 () Bool)

(assert (=> b!1422572 m!1313363))

(assert (=> b!1422575 m!1313353))

(assert (=> b!1422575 m!1313353))

(declare-fun m!1313365 () Bool)

(assert (=> b!1422575 m!1313365))

(declare-fun m!1313367 () Bool)

(assert (=> b!1422581 m!1313367))

(declare-fun m!1313369 () Bool)

(assert (=> b!1422581 m!1313369))

(declare-fun m!1313371 () Bool)

(assert (=> b!1422578 m!1313371))

(declare-fun m!1313373 () Bool)

(assert (=> b!1422576 m!1313373))

(assert (=> b!1422576 m!1313373))

(declare-fun m!1313375 () Bool)

(assert (=> b!1422576 m!1313375))

(declare-fun m!1313377 () Bool)

(assert (=> b!1422573 m!1313377))

(check-sat (not b!1422578) (not b!1422572) (not b!1422573) (not b!1422577) (not b!1422576) (not b!1422575) (not b!1422579) (not b!1422581) (not start!122882) (not b!1422571))
(check-sat)
