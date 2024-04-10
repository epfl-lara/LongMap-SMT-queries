; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122582 () Bool)

(assert start!122582)

(declare-fun res!955214 () Bool)

(declare-fun e!803221 () Bool)

(assert (=> start!122582 (=> (not res!955214) (not e!803221))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122582 (= res!955214 (validMask!0 mask!2608))))

(assert (=> start!122582 e!803221))

(assert (=> start!122582 true))

(declare-datatypes ((array!96947 0))(
  ( (array!96948 (arr!46791 (Array (_ BitVec 32) (_ BitVec 64))) (size!47341 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96947)

(declare-fun array_inv!35819 (array!96947) Bool)

(assert (=> start!122582 (array_inv!35819 a!2831)))

(declare-fun b!1419778 () Bool)

(declare-fun res!955219 () Bool)

(assert (=> b!1419778 (=> (not res!955219) (not e!803221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96947 (_ BitVec 32)) Bool)

(assert (=> b!1419778 (= res!955219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1419779 () Bool)

(declare-fun res!955217 () Bool)

(assert (=> b!1419779 (=> (not res!955217) (not e!803221))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419779 (= res!955217 (validKeyInArray!0 (select (arr!46791 a!2831) j!81)))))

(declare-fun b!1419780 () Bool)

(declare-fun res!955211 () Bool)

(assert (=> b!1419780 (=> (not res!955211) (not e!803221))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11076 0))(
  ( (MissingZero!11076 (index!46696 (_ BitVec 32))) (Found!11076 (index!46697 (_ BitVec 32))) (Intermediate!11076 (undefined!11888 Bool) (index!46698 (_ BitVec 32)) (x!128366 (_ BitVec 32))) (Undefined!11076) (MissingVacant!11076 (index!46699 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96947 (_ BitVec 32)) SeekEntryResult!11076)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419780 (= res!955211 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46791 a!2831) j!81) mask!2608) (select (arr!46791 a!2831) j!81) a!2831 mask!2608) (Intermediate!11076 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419781 () Bool)

(declare-fun res!955218 () Bool)

(assert (=> b!1419781 (=> (not res!955218) (not e!803221))))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1419781 (= res!955218 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47341 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47341 a!2831))))))

(declare-fun b!1419782 () Bool)

(declare-fun res!955215 () Bool)

(assert (=> b!1419782 (=> (not res!955215) (not e!803221))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419782 (= res!955215 (and (= (size!47341 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47341 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47341 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419783 () Bool)

(declare-fun res!955212 () Bool)

(assert (=> b!1419783 (=> (not res!955212) (not e!803221))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1419783 (= res!955212 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46791 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46791 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96948 (store (arr!46791 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47341 a!2831)) mask!2608) (Intermediate!11076 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1419784 () Bool)

(declare-fun res!955213 () Bool)

(assert (=> b!1419784 (=> (not res!955213) (not e!803221))))

(declare-datatypes ((List!33301 0))(
  ( (Nil!33298) (Cons!33297 (h!34599 (_ BitVec 64)) (t!47995 List!33301)) )
))
(declare-fun arrayNoDuplicates!0 (array!96947 (_ BitVec 32) List!33301) Bool)

(assert (=> b!1419784 (= res!955213 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33298))))

(declare-fun b!1419785 () Bool)

(declare-fun res!955216 () Bool)

(assert (=> b!1419785 (=> (not res!955216) (not e!803221))))

(assert (=> b!1419785 (= res!955216 (validKeyInArray!0 (select (arr!46791 a!2831) i!982)))))

(declare-fun b!1419786 () Bool)

(assert (=> b!1419786 (= e!803221 (bvslt mask!2608 #b00000000000000000000000000000000))))

(assert (= (and start!122582 res!955214) b!1419782))

(assert (= (and b!1419782 res!955215) b!1419785))

(assert (= (and b!1419785 res!955216) b!1419779))

(assert (= (and b!1419779 res!955217) b!1419778))

(assert (= (and b!1419778 res!955219) b!1419784))

(assert (= (and b!1419784 res!955213) b!1419781))

(assert (= (and b!1419781 res!955218) b!1419780))

(assert (= (and b!1419780 res!955211) b!1419783))

(assert (= (and b!1419783 res!955212) b!1419786))

(declare-fun m!1310233 () Bool)

(assert (=> b!1419783 m!1310233))

(declare-fun m!1310235 () Bool)

(assert (=> b!1419783 m!1310235))

(assert (=> b!1419783 m!1310235))

(declare-fun m!1310237 () Bool)

(assert (=> b!1419783 m!1310237))

(assert (=> b!1419783 m!1310237))

(assert (=> b!1419783 m!1310235))

(declare-fun m!1310239 () Bool)

(assert (=> b!1419783 m!1310239))

(declare-fun m!1310241 () Bool)

(assert (=> b!1419785 m!1310241))

(assert (=> b!1419785 m!1310241))

(declare-fun m!1310243 () Bool)

(assert (=> b!1419785 m!1310243))

(declare-fun m!1310245 () Bool)

(assert (=> b!1419778 m!1310245))

(declare-fun m!1310247 () Bool)

(assert (=> start!122582 m!1310247))

(declare-fun m!1310249 () Bool)

(assert (=> start!122582 m!1310249))

(declare-fun m!1310251 () Bool)

(assert (=> b!1419780 m!1310251))

(assert (=> b!1419780 m!1310251))

(declare-fun m!1310253 () Bool)

(assert (=> b!1419780 m!1310253))

(assert (=> b!1419780 m!1310253))

(assert (=> b!1419780 m!1310251))

(declare-fun m!1310255 () Bool)

(assert (=> b!1419780 m!1310255))

(assert (=> b!1419779 m!1310251))

(assert (=> b!1419779 m!1310251))

(declare-fun m!1310257 () Bool)

(assert (=> b!1419779 m!1310257))

(declare-fun m!1310259 () Bool)

(assert (=> b!1419784 m!1310259))

(check-sat (not b!1419780) (not b!1419783) (not b!1419779) (not b!1419778) (not b!1419785) (not start!122582) (not b!1419784))
(check-sat)
