; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122890 () Bool)

(assert start!122890)

(declare-fun b!1425368 () Bool)

(declare-fun res!960808 () Bool)

(declare-fun e!805342 () Bool)

(assert (=> b!1425368 (=> (not res!960808) (not e!805342))))

(declare-datatypes ((array!97255 0))(
  ( (array!97256 (arr!46945 (Array (_ BitVec 32) (_ BitVec 64))) (size!47495 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97255)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425368 (= res!960808 (validKeyInArray!0 (select (arr!46945 a!2831) j!81)))))

(declare-fun b!1425369 () Bool)

(declare-fun res!960801 () Bool)

(assert (=> b!1425369 (=> (not res!960801) (not e!805342))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97255 (_ BitVec 32)) Bool)

(assert (=> b!1425369 (= res!960801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!960802 () Bool)

(assert (=> start!122890 (=> (not res!960802) (not e!805342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122890 (= res!960802 (validMask!0 mask!2608))))

(assert (=> start!122890 e!805342))

(assert (=> start!122890 true))

(declare-fun array_inv!35973 (array!97255) Bool)

(assert (=> start!122890 (array_inv!35973 a!2831)))

(declare-fun b!1425370 () Bool)

(declare-fun res!960807 () Bool)

(assert (=> b!1425370 (=> (not res!960807) (not e!805342))))

(declare-datatypes ((List!33455 0))(
  ( (Nil!33452) (Cons!33451 (h!34753 (_ BitVec 64)) (t!48149 List!33455)) )
))
(declare-fun arrayNoDuplicates!0 (array!97255 (_ BitVec 32) List!33455) Bool)

(assert (=> b!1425370 (= res!960807 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33452))))

(declare-fun b!1425371 () Bool)

(declare-fun res!960804 () Bool)

(assert (=> b!1425371 (=> (not res!960804) (not e!805342))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425371 (= res!960804 (and (= (size!47495 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47495 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47495 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425372 () Bool)

(declare-fun res!960805 () Bool)

(assert (=> b!1425372 (=> (not res!960805) (not e!805342))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11224 0))(
  ( (MissingZero!11224 (index!47288 (_ BitVec 32))) (Found!11224 (index!47289 (_ BitVec 32))) (Intermediate!11224 (undefined!12036 Bool) (index!47290 (_ BitVec 32)) (x!128922 (_ BitVec 32))) (Undefined!11224) (MissingVacant!11224 (index!47291 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97255 (_ BitVec 32)) SeekEntryResult!11224)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425372 (= res!960805 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46945 a!2831) j!81) mask!2608) (select (arr!46945 a!2831) j!81) a!2831 mask!2608) (Intermediate!11224 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1425373 () Bool)

(declare-fun res!960806 () Bool)

(assert (=> b!1425373 (=> (not res!960806) (not e!805342))))

(assert (=> b!1425373 (= res!960806 (validKeyInArray!0 (select (arr!46945 a!2831) i!982)))))

(declare-fun b!1425374 () Bool)

(declare-fun res!960803 () Bool)

(assert (=> b!1425374 (=> (not res!960803) (not e!805342))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1425374 (= res!960803 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47495 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47495 a!2831))))))

(declare-fun b!1425375 () Bool)

(assert (=> b!1425375 (= e!805342 false)))

(declare-fun lt!627807 () SeekEntryResult!11224)

(assert (=> b!1425375 (= lt!627807 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46945 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46945 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97256 (store (arr!46945 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47495 a!2831)) mask!2608))))

(assert (= (and start!122890 res!960802) b!1425371))

(assert (= (and b!1425371 res!960804) b!1425373))

(assert (= (and b!1425373 res!960806) b!1425368))

(assert (= (and b!1425368 res!960808) b!1425369))

(assert (= (and b!1425369 res!960801) b!1425370))

(assert (= (and b!1425370 res!960807) b!1425374))

(assert (= (and b!1425374 res!960803) b!1425372))

(assert (= (and b!1425372 res!960805) b!1425375))

(declare-fun m!1315937 () Bool)

(assert (=> b!1425368 m!1315937))

(assert (=> b!1425368 m!1315937))

(declare-fun m!1315939 () Bool)

(assert (=> b!1425368 m!1315939))

(declare-fun m!1315941 () Bool)

(assert (=> b!1425375 m!1315941))

(declare-fun m!1315943 () Bool)

(assert (=> b!1425375 m!1315943))

(assert (=> b!1425375 m!1315943))

(declare-fun m!1315945 () Bool)

(assert (=> b!1425375 m!1315945))

(assert (=> b!1425375 m!1315945))

(assert (=> b!1425375 m!1315943))

(declare-fun m!1315947 () Bool)

(assert (=> b!1425375 m!1315947))

(declare-fun m!1315949 () Bool)

(assert (=> b!1425369 m!1315949))

(assert (=> b!1425372 m!1315937))

(assert (=> b!1425372 m!1315937))

(declare-fun m!1315951 () Bool)

(assert (=> b!1425372 m!1315951))

(assert (=> b!1425372 m!1315951))

(assert (=> b!1425372 m!1315937))

(declare-fun m!1315953 () Bool)

(assert (=> b!1425372 m!1315953))

(declare-fun m!1315955 () Bool)

(assert (=> start!122890 m!1315955))

(declare-fun m!1315957 () Bool)

(assert (=> start!122890 m!1315957))

(declare-fun m!1315959 () Bool)

(assert (=> b!1425370 m!1315959))

(declare-fun m!1315961 () Bool)

(assert (=> b!1425373 m!1315961))

(assert (=> b!1425373 m!1315961))

(declare-fun m!1315963 () Bool)

(assert (=> b!1425373 m!1315963))

(push 1)

(assert (not b!1425373))

(assert (not b!1425370))

(assert (not b!1425368))

(assert (not start!122890))

(assert (not b!1425375))

(assert (not b!1425372))

(assert (not b!1425369))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

