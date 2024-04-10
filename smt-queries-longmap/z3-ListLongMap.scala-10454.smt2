; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122888 () Bool)

(assert start!122888)

(declare-fun b!1425344 () Bool)

(declare-fun res!960780 () Bool)

(declare-fun e!805336 () Bool)

(assert (=> b!1425344 (=> (not res!960780) (not e!805336))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97253 0))(
  ( (array!97254 (arr!46944 (Array (_ BitVec 32) (_ BitVec 64))) (size!47494 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97253)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425344 (= res!960780 (and (= (size!47494 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47494 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47494 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425345 () Bool)

(declare-fun res!960784 () Bool)

(assert (=> b!1425345 (=> (not res!960784) (not e!805336))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425345 (= res!960784 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47494 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47494 a!2831))))))

(declare-fun b!1425346 () Bool)

(assert (=> b!1425346 (= e!805336 false)))

(declare-datatypes ((SeekEntryResult!11223 0))(
  ( (MissingZero!11223 (index!47284 (_ BitVec 32))) (Found!11223 (index!47285 (_ BitVec 32))) (Intermediate!11223 (undefined!12035 Bool) (index!47286 (_ BitVec 32)) (x!128921 (_ BitVec 32))) (Undefined!11223) (MissingVacant!11223 (index!47287 (_ BitVec 32))) )
))
(declare-fun lt!627804 () SeekEntryResult!11223)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97253 (_ BitVec 32)) SeekEntryResult!11223)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425346 (= lt!627804 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46944 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46944 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97254 (store (arr!46944 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47494 a!2831)) mask!2608))))

(declare-fun b!1425347 () Bool)

(declare-fun res!960782 () Bool)

(assert (=> b!1425347 (=> (not res!960782) (not e!805336))))

(assert (=> b!1425347 (= res!960782 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46944 a!2831) j!81) mask!2608) (select (arr!46944 a!2831) j!81) a!2831 mask!2608) (Intermediate!11223 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun res!960781 () Bool)

(assert (=> start!122888 (=> (not res!960781) (not e!805336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122888 (= res!960781 (validMask!0 mask!2608))))

(assert (=> start!122888 e!805336))

(assert (=> start!122888 true))

(declare-fun array_inv!35972 (array!97253) Bool)

(assert (=> start!122888 (array_inv!35972 a!2831)))

(declare-fun b!1425348 () Bool)

(declare-fun res!960779 () Bool)

(assert (=> b!1425348 (=> (not res!960779) (not e!805336))))

(declare-datatypes ((List!33454 0))(
  ( (Nil!33451) (Cons!33450 (h!34752 (_ BitVec 64)) (t!48148 List!33454)) )
))
(declare-fun arrayNoDuplicates!0 (array!97253 (_ BitVec 32) List!33454) Bool)

(assert (=> b!1425348 (= res!960779 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33451))))

(declare-fun b!1425349 () Bool)

(declare-fun res!960777 () Bool)

(assert (=> b!1425349 (=> (not res!960777) (not e!805336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97253 (_ BitVec 32)) Bool)

(assert (=> b!1425349 (= res!960777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425350 () Bool)

(declare-fun res!960778 () Bool)

(assert (=> b!1425350 (=> (not res!960778) (not e!805336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425350 (= res!960778 (validKeyInArray!0 (select (arr!46944 a!2831) i!982)))))

(declare-fun b!1425351 () Bool)

(declare-fun res!960783 () Bool)

(assert (=> b!1425351 (=> (not res!960783) (not e!805336))))

(assert (=> b!1425351 (= res!960783 (validKeyInArray!0 (select (arr!46944 a!2831) j!81)))))

(assert (= (and start!122888 res!960781) b!1425344))

(assert (= (and b!1425344 res!960780) b!1425350))

(assert (= (and b!1425350 res!960778) b!1425351))

(assert (= (and b!1425351 res!960783) b!1425349))

(assert (= (and b!1425349 res!960777) b!1425348))

(assert (= (and b!1425348 res!960779) b!1425345))

(assert (= (and b!1425345 res!960784) b!1425347))

(assert (= (and b!1425347 res!960782) b!1425346))

(declare-fun m!1315909 () Bool)

(assert (=> b!1425346 m!1315909))

(declare-fun m!1315911 () Bool)

(assert (=> b!1425346 m!1315911))

(assert (=> b!1425346 m!1315911))

(declare-fun m!1315913 () Bool)

(assert (=> b!1425346 m!1315913))

(assert (=> b!1425346 m!1315913))

(assert (=> b!1425346 m!1315911))

(declare-fun m!1315915 () Bool)

(assert (=> b!1425346 m!1315915))

(declare-fun m!1315917 () Bool)

(assert (=> b!1425348 m!1315917))

(declare-fun m!1315919 () Bool)

(assert (=> b!1425350 m!1315919))

(assert (=> b!1425350 m!1315919))

(declare-fun m!1315921 () Bool)

(assert (=> b!1425350 m!1315921))

(declare-fun m!1315923 () Bool)

(assert (=> b!1425351 m!1315923))

(assert (=> b!1425351 m!1315923))

(declare-fun m!1315925 () Bool)

(assert (=> b!1425351 m!1315925))

(declare-fun m!1315927 () Bool)

(assert (=> start!122888 m!1315927))

(declare-fun m!1315929 () Bool)

(assert (=> start!122888 m!1315929))

(declare-fun m!1315931 () Bool)

(assert (=> b!1425349 m!1315931))

(assert (=> b!1425347 m!1315923))

(assert (=> b!1425347 m!1315923))

(declare-fun m!1315933 () Bool)

(assert (=> b!1425347 m!1315933))

(assert (=> b!1425347 m!1315933))

(assert (=> b!1425347 m!1315923))

(declare-fun m!1315935 () Bool)

(assert (=> b!1425347 m!1315935))

(check-sat (not b!1425350) (not b!1425351) (not b!1425347) (not b!1425348) (not b!1425349) (not start!122888) (not b!1425346))
