; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122886 () Bool)

(assert start!122886)

(declare-fun b!1425320 () Bool)

(declare-fun res!960759 () Bool)

(declare-fun e!805331 () Bool)

(assert (=> b!1425320 (=> (not res!960759) (not e!805331))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97251 0))(
  ( (array!97252 (arr!46943 (Array (_ BitVec 32) (_ BitVec 64))) (size!47493 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97251)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425320 (= res!960759 (and (= (size!47493 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47493 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47493 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425322 () Bool)

(declare-fun res!960754 () Bool)

(assert (=> b!1425322 (=> (not res!960754) (not e!805331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97251 (_ BitVec 32)) Bool)

(assert (=> b!1425322 (= res!960754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425323 () Bool)

(declare-fun res!960758 () Bool)

(assert (=> b!1425323 (=> (not res!960758) (not e!805331))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425323 (= res!960758 (validKeyInArray!0 (select (arr!46943 a!2831) i!982)))))

(declare-fun b!1425324 () Bool)

(declare-fun res!960755 () Bool)

(assert (=> b!1425324 (=> (not res!960755) (not e!805331))))

(declare-datatypes ((List!33453 0))(
  ( (Nil!33450) (Cons!33449 (h!34751 (_ BitVec 64)) (t!48147 List!33453)) )
))
(declare-fun arrayNoDuplicates!0 (array!97251 (_ BitVec 32) List!33453) Bool)

(assert (=> b!1425324 (= res!960755 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33450))))

(declare-fun b!1425325 () Bool)

(assert (=> b!1425325 (= e!805331 false)))

(declare-datatypes ((SeekEntryResult!11222 0))(
  ( (MissingZero!11222 (index!47280 (_ BitVec 32))) (Found!11222 (index!47281 (_ BitVec 32))) (Intermediate!11222 (undefined!12034 Bool) (index!47282 (_ BitVec 32)) (x!128920 (_ BitVec 32))) (Undefined!11222) (MissingVacant!11222 (index!47283 (_ BitVec 32))) )
))
(declare-fun lt!627801 () SeekEntryResult!11222)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97251 (_ BitVec 32)) SeekEntryResult!11222)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425325 (= lt!627801 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46943 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46943 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97252 (store (arr!46943 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47493 a!2831)) mask!2608))))

(declare-fun b!1425321 () Bool)

(declare-fun res!960757 () Bool)

(assert (=> b!1425321 (=> (not res!960757) (not e!805331))))

(assert (=> b!1425321 (= res!960757 (validKeyInArray!0 (select (arr!46943 a!2831) j!81)))))

(declare-fun res!960760 () Bool)

(assert (=> start!122886 (=> (not res!960760) (not e!805331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122886 (= res!960760 (validMask!0 mask!2608))))

(assert (=> start!122886 e!805331))

(assert (=> start!122886 true))

(declare-fun array_inv!35971 (array!97251) Bool)

(assert (=> start!122886 (array_inv!35971 a!2831)))

(declare-fun b!1425326 () Bool)

(declare-fun res!960753 () Bool)

(assert (=> b!1425326 (=> (not res!960753) (not e!805331))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425326 (= res!960753 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47493 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47493 a!2831))))))

(declare-fun b!1425327 () Bool)

(declare-fun res!960756 () Bool)

(assert (=> b!1425327 (=> (not res!960756) (not e!805331))))

(assert (=> b!1425327 (= res!960756 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46943 a!2831) j!81) mask!2608) (select (arr!46943 a!2831) j!81) a!2831 mask!2608) (Intermediate!11222 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(assert (= (and start!122886 res!960760) b!1425320))

(assert (= (and b!1425320 res!960759) b!1425323))

(assert (= (and b!1425323 res!960758) b!1425321))

(assert (= (and b!1425321 res!960757) b!1425322))

(assert (= (and b!1425322 res!960754) b!1425324))

(assert (= (and b!1425324 res!960755) b!1425326))

(assert (= (and b!1425326 res!960753) b!1425327))

(assert (= (and b!1425327 res!960756) b!1425325))

(declare-fun m!1315881 () Bool)

(assert (=> b!1425325 m!1315881))

(declare-fun m!1315883 () Bool)

(assert (=> b!1425325 m!1315883))

(assert (=> b!1425325 m!1315883))

(declare-fun m!1315885 () Bool)

(assert (=> b!1425325 m!1315885))

(assert (=> b!1425325 m!1315885))

(assert (=> b!1425325 m!1315883))

(declare-fun m!1315887 () Bool)

(assert (=> b!1425325 m!1315887))

(declare-fun m!1315889 () Bool)

(assert (=> b!1425327 m!1315889))

(assert (=> b!1425327 m!1315889))

(declare-fun m!1315891 () Bool)

(assert (=> b!1425327 m!1315891))

(assert (=> b!1425327 m!1315891))

(assert (=> b!1425327 m!1315889))

(declare-fun m!1315893 () Bool)

(assert (=> b!1425327 m!1315893))

(assert (=> b!1425321 m!1315889))

(assert (=> b!1425321 m!1315889))

(declare-fun m!1315895 () Bool)

(assert (=> b!1425321 m!1315895))

(declare-fun m!1315897 () Bool)

(assert (=> start!122886 m!1315897))

(declare-fun m!1315899 () Bool)

(assert (=> start!122886 m!1315899))

(declare-fun m!1315901 () Bool)

(assert (=> b!1425323 m!1315901))

(assert (=> b!1425323 m!1315901))

(declare-fun m!1315903 () Bool)

(assert (=> b!1425323 m!1315903))

(declare-fun m!1315905 () Bool)

(assert (=> b!1425324 m!1315905))

(declare-fun m!1315907 () Bool)

(assert (=> b!1425322 m!1315907))

(push 1)

(assert (not b!1425324))

(assert (not b!1425327))

(assert (not b!1425321))

(assert (not start!122886))

(assert (not b!1425323))

(assert (not b!1425325))

(assert (not b!1425322))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

