; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122894 () Bool)

(assert start!122894)

(declare-fun b!1425421 () Bool)

(declare-fun res!960859 () Bool)

(declare-fun e!805354 () Bool)

(assert (=> b!1425421 (=> (not res!960859) (not e!805354))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(declare-datatypes ((array!97259 0))(
  ( (array!97260 (arr!46947 (Array (_ BitVec 32) (_ BitVec 64))) (size!47497 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97259)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11226 0))(
  ( (MissingZero!11226 (index!47296 (_ BitVec 32))) (Found!11226 (index!47297 (_ BitVec 32))) (Intermediate!11226 (undefined!12038 Bool) (index!47298 (_ BitVec 32)) (x!128932 (_ BitVec 32))) (Undefined!11226) (MissingVacant!11226 (index!47299 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97259 (_ BitVec 32)) SeekEntryResult!11226)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425421 (= res!960859 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46947 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46947 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97260 (store (arr!46947 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47497 a!2831)) mask!2608) (Intermediate!11226 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1425422 () Bool)

(declare-fun res!960861 () Bool)

(assert (=> b!1425422 (=> (not res!960861) (not e!805354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425422 (= res!960861 (validKeyInArray!0 (select (arr!46947 a!2831) j!81)))))

(declare-fun res!960854 () Bool)

(assert (=> start!122894 (=> (not res!960854) (not e!805354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122894 (= res!960854 (validMask!0 mask!2608))))

(assert (=> start!122894 e!805354))

(assert (=> start!122894 true))

(declare-fun array_inv!35975 (array!97259) Bool)

(assert (=> start!122894 (array_inv!35975 a!2831)))

(declare-fun b!1425423 () Bool)

(declare-fun res!960856 () Bool)

(assert (=> b!1425423 (=> (not res!960856) (not e!805354))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425423 (= res!960856 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47497 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47497 a!2831))))))

(declare-fun b!1425424 () Bool)

(declare-fun res!960860 () Bool)

(assert (=> b!1425424 (=> (not res!960860) (not e!805354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97259 (_ BitVec 32)) Bool)

(assert (=> b!1425424 (= res!960860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425425 () Bool)

(declare-fun res!960855 () Bool)

(assert (=> b!1425425 (=> (not res!960855) (not e!805354))))

(assert (=> b!1425425 (= res!960855 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46947 a!2831) j!81) mask!2608) (select (arr!46947 a!2831) j!81) a!2831 mask!2608) (Intermediate!11226 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1425426 () Bool)

(declare-fun res!960862 () Bool)

(assert (=> b!1425426 (=> (not res!960862) (not e!805354))))

(assert (=> b!1425426 (= res!960862 (validKeyInArray!0 (select (arr!46947 a!2831) i!982)))))

(declare-fun b!1425427 () Bool)

(declare-fun res!960857 () Bool)

(assert (=> b!1425427 (=> (not res!960857) (not e!805354))))

(declare-datatypes ((List!33457 0))(
  ( (Nil!33454) (Cons!33453 (h!34755 (_ BitVec 64)) (t!48151 List!33457)) )
))
(declare-fun arrayNoDuplicates!0 (array!97259 (_ BitVec 32) List!33457) Bool)

(assert (=> b!1425427 (= res!960857 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33454))))

(declare-fun b!1425428 () Bool)

(declare-fun res!960858 () Bool)

(assert (=> b!1425428 (=> (not res!960858) (not e!805354))))

(assert (=> b!1425428 (= res!960858 (and (= (size!47497 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47497 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47497 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425429 () Bool)

(assert (=> b!1425429 (= e!805354 false)))

(declare-fun lt!627813 () SeekEntryResult!11226)

(assert (=> b!1425429 (= lt!627813 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46947 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and start!122894 res!960854) b!1425428))

(assert (= (and b!1425428 res!960858) b!1425426))

(assert (= (and b!1425426 res!960862) b!1425422))

(assert (= (and b!1425422 res!960861) b!1425424))

(assert (= (and b!1425424 res!960860) b!1425427))

(assert (= (and b!1425427 res!960857) b!1425423))

(assert (= (and b!1425423 res!960856) b!1425425))

(assert (= (and b!1425425 res!960855) b!1425421))

(assert (= (and b!1425421 res!960859) b!1425429))

(declare-fun m!1315995 () Bool)

(assert (=> b!1425426 m!1315995))

(assert (=> b!1425426 m!1315995))

(declare-fun m!1315997 () Bool)

(assert (=> b!1425426 m!1315997))

(declare-fun m!1315999 () Bool)

(assert (=> b!1425429 m!1315999))

(assert (=> b!1425429 m!1315999))

(declare-fun m!1316001 () Bool)

(assert (=> b!1425429 m!1316001))

(declare-fun m!1316003 () Bool)

(assert (=> b!1425421 m!1316003))

(declare-fun m!1316005 () Bool)

(assert (=> b!1425421 m!1316005))

(assert (=> b!1425421 m!1316005))

(declare-fun m!1316007 () Bool)

(assert (=> b!1425421 m!1316007))

(assert (=> b!1425421 m!1316007))

(assert (=> b!1425421 m!1316005))

(declare-fun m!1316009 () Bool)

(assert (=> b!1425421 m!1316009))

(declare-fun m!1316011 () Bool)

(assert (=> start!122894 m!1316011))

(declare-fun m!1316013 () Bool)

(assert (=> start!122894 m!1316013))

(assert (=> b!1425425 m!1315999))

(assert (=> b!1425425 m!1315999))

(declare-fun m!1316015 () Bool)

(assert (=> b!1425425 m!1316015))

(assert (=> b!1425425 m!1316015))

(assert (=> b!1425425 m!1315999))

(declare-fun m!1316017 () Bool)

(assert (=> b!1425425 m!1316017))

(declare-fun m!1316019 () Bool)

(assert (=> b!1425424 m!1316019))

(assert (=> b!1425422 m!1315999))

(assert (=> b!1425422 m!1315999))

(declare-fun m!1316021 () Bool)

(assert (=> b!1425422 m!1316021))

(declare-fun m!1316023 () Bool)

(assert (=> b!1425427 m!1316023))

(check-sat (not b!1425426) (not b!1425429) (not b!1425425) (not start!122894) (not b!1425421) (not b!1425424) (not b!1425427) (not b!1425422))
