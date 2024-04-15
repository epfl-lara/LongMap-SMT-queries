; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122856 () Bool)

(assert start!122856)

(declare-fun b!1424946 () Bool)

(declare-fun e!805213 () Bool)

(assert (=> b!1424946 (= e!805213 false)))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97174 0))(
  ( (array!97175 (arr!46905 (Array (_ BitVec 32) (_ BitVec 64))) (size!47457 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97174)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11211 0))(
  ( (MissingZero!11211 (index!47236 (_ BitVec 32))) (Found!11211 (index!47237 (_ BitVec 32))) (Intermediate!11211 (undefined!12023 Bool) (index!47238 (_ BitVec 32)) (x!128866 (_ BitVec 32))) (Undefined!11211) (MissingVacant!11211 (index!47239 (_ BitVec 32))) )
))
(declare-fun lt!627572 () SeekEntryResult!11211)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97174 (_ BitVec 32)) SeekEntryResult!11211)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424946 (= lt!627572 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46905 a!2831) j!81) mask!2608) (select (arr!46905 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1424947 () Bool)

(declare-fun res!960431 () Bool)

(assert (=> b!1424947 (=> (not res!960431) (not e!805213))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1424947 (= res!960431 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47457 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47457 a!2831))))))

(declare-fun b!1424949 () Bool)

(declare-fun res!960430 () Bool)

(assert (=> b!1424949 (=> (not res!960430) (not e!805213))))

(declare-datatypes ((List!33493 0))(
  ( (Nil!33490) (Cons!33489 (h!34791 (_ BitVec 64)) (t!48179 List!33493)) )
))
(declare-fun arrayNoDuplicates!0 (array!97174 (_ BitVec 32) List!33493) Bool)

(assert (=> b!1424949 (= res!960430 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33490))))

(declare-fun b!1424950 () Bool)

(declare-fun res!960436 () Bool)

(assert (=> b!1424950 (=> (not res!960436) (not e!805213))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424950 (= res!960436 (validKeyInArray!0 (select (arr!46905 a!2831) j!81)))))

(declare-fun b!1424951 () Bool)

(declare-fun res!960433 () Bool)

(assert (=> b!1424951 (=> (not res!960433) (not e!805213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97174 (_ BitVec 32)) Bool)

(assert (=> b!1424951 (= res!960433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424952 () Bool)

(declare-fun res!960435 () Bool)

(assert (=> b!1424952 (=> (not res!960435) (not e!805213))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424952 (= res!960435 (and (= (size!47457 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47457 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47457 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424948 () Bool)

(declare-fun res!960432 () Bool)

(assert (=> b!1424948 (=> (not res!960432) (not e!805213))))

(assert (=> b!1424948 (= res!960432 (validKeyInArray!0 (select (arr!46905 a!2831) i!982)))))

(declare-fun res!960434 () Bool)

(assert (=> start!122856 (=> (not res!960434) (not e!805213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122856 (= res!960434 (validMask!0 mask!2608))))

(assert (=> start!122856 e!805213))

(assert (=> start!122856 true))

(declare-fun array_inv!36138 (array!97174) Bool)

(assert (=> start!122856 (array_inv!36138 a!2831)))

(assert (= (and start!122856 res!960434) b!1424952))

(assert (= (and b!1424952 res!960435) b!1424948))

(assert (= (and b!1424948 res!960432) b!1424950))

(assert (= (and b!1424950 res!960436) b!1424951))

(assert (= (and b!1424951 res!960433) b!1424949))

(assert (= (and b!1424949 res!960430) b!1424947))

(assert (= (and b!1424947 res!960431) b!1424946))

(declare-fun m!1315033 () Bool)

(assert (=> b!1424946 m!1315033))

(assert (=> b!1424946 m!1315033))

(declare-fun m!1315035 () Bool)

(assert (=> b!1424946 m!1315035))

(assert (=> b!1424946 m!1315035))

(assert (=> b!1424946 m!1315033))

(declare-fun m!1315037 () Bool)

(assert (=> b!1424946 m!1315037))

(declare-fun m!1315039 () Bool)

(assert (=> b!1424948 m!1315039))

(assert (=> b!1424948 m!1315039))

(declare-fun m!1315041 () Bool)

(assert (=> b!1424948 m!1315041))

(declare-fun m!1315043 () Bool)

(assert (=> b!1424949 m!1315043))

(assert (=> b!1424950 m!1315033))

(assert (=> b!1424950 m!1315033))

(declare-fun m!1315045 () Bool)

(assert (=> b!1424950 m!1315045))

(declare-fun m!1315047 () Bool)

(assert (=> start!122856 m!1315047))

(declare-fun m!1315049 () Bool)

(assert (=> start!122856 m!1315049))

(declare-fun m!1315051 () Bool)

(assert (=> b!1424951 m!1315051))

(push 1)

(assert (not b!1424948))

(assert (not b!1424946))

(assert (not b!1424949))

(assert (not start!122856))

(assert (not b!1424951))

(assert (not b!1424950))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

