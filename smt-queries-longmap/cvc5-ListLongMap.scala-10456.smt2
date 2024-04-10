; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122898 () Bool)

(assert start!122898)

(declare-fun b!1425475 () Bool)

(declare-fun res!960909 () Bool)

(declare-fun e!805366 () Bool)

(assert (=> b!1425475 (=> (not res!960909) (not e!805366))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-datatypes ((array!97263 0))(
  ( (array!97264 (arr!46949 (Array (_ BitVec 32) (_ BitVec 64))) (size!47499 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97263)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11228 0))(
  ( (MissingZero!11228 (index!47304 (_ BitVec 32))) (Found!11228 (index!47305 (_ BitVec 32))) (Intermediate!11228 (undefined!12040 Bool) (index!47306 (_ BitVec 32)) (x!128942 (_ BitVec 32))) (Undefined!11228) (MissingVacant!11228 (index!47307 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97263 (_ BitVec 32)) SeekEntryResult!11228)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425475 (= res!960909 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46949 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46949 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97264 (store (arr!46949 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47499 a!2831)) mask!2608) (Intermediate!11228 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1425476 () Bool)

(declare-fun res!960916 () Bool)

(assert (=> b!1425476 (=> (not res!960916) (not e!805366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97263 (_ BitVec 32)) Bool)

(assert (=> b!1425476 (= res!960916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425477 () Bool)

(declare-fun res!960910 () Bool)

(assert (=> b!1425477 (=> (not res!960910) (not e!805366))))

(assert (=> b!1425477 (= res!960910 (and (= (size!47499 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47499 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47499 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!960914 () Bool)

(assert (=> start!122898 (=> (not res!960914) (not e!805366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122898 (= res!960914 (validMask!0 mask!2608))))

(assert (=> start!122898 e!805366))

(assert (=> start!122898 true))

(declare-fun array_inv!35977 (array!97263) Bool)

(assert (=> start!122898 (array_inv!35977 a!2831)))

(declare-fun b!1425478 () Bool)

(declare-fun res!960915 () Bool)

(assert (=> b!1425478 (=> (not res!960915) (not e!805366))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1425478 (= res!960915 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47499 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47499 a!2831))))))

(declare-fun b!1425479 () Bool)

(declare-fun res!960913 () Bool)

(assert (=> b!1425479 (=> (not res!960913) (not e!805366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425479 (= res!960913 (validKeyInArray!0 (select (arr!46949 a!2831) j!81)))))

(declare-fun b!1425480 () Bool)

(declare-fun res!960911 () Bool)

(assert (=> b!1425480 (=> (not res!960911) (not e!805366))))

(declare-datatypes ((List!33459 0))(
  ( (Nil!33456) (Cons!33455 (h!34757 (_ BitVec 64)) (t!48153 List!33459)) )
))
(declare-fun arrayNoDuplicates!0 (array!97263 (_ BitVec 32) List!33459) Bool)

(assert (=> b!1425480 (= res!960911 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33456))))

(declare-fun b!1425481 () Bool)

(declare-fun res!960908 () Bool)

(assert (=> b!1425481 (=> (not res!960908) (not e!805366))))

(assert (=> b!1425481 (= res!960908 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46949 a!2831) j!81) mask!2608) (select (arr!46949 a!2831) j!81) a!2831 mask!2608) (Intermediate!11228 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1425482 () Bool)

(declare-fun res!960912 () Bool)

(assert (=> b!1425482 (=> (not res!960912) (not e!805366))))

(assert (=> b!1425482 (= res!960912 (validKeyInArray!0 (select (arr!46949 a!2831) i!982)))))

(declare-fun b!1425483 () Bool)

(assert (=> b!1425483 (= e!805366 false)))

(declare-fun lt!627819 () SeekEntryResult!11228)

(assert (=> b!1425483 (= lt!627819 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46949 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and start!122898 res!960914) b!1425477))

(assert (= (and b!1425477 res!960910) b!1425482))

(assert (= (and b!1425482 res!960912) b!1425479))

(assert (= (and b!1425479 res!960913) b!1425476))

(assert (= (and b!1425476 res!960916) b!1425480))

(assert (= (and b!1425480 res!960911) b!1425478))

(assert (= (and b!1425478 res!960915) b!1425481))

(assert (= (and b!1425481 res!960908) b!1425475))

(assert (= (and b!1425475 res!960909) b!1425483))

(declare-fun m!1316055 () Bool)

(assert (=> b!1425476 m!1316055))

(declare-fun m!1316057 () Bool)

(assert (=> b!1425475 m!1316057))

(declare-fun m!1316059 () Bool)

(assert (=> b!1425475 m!1316059))

(assert (=> b!1425475 m!1316059))

(declare-fun m!1316061 () Bool)

(assert (=> b!1425475 m!1316061))

(assert (=> b!1425475 m!1316061))

(assert (=> b!1425475 m!1316059))

(declare-fun m!1316063 () Bool)

(assert (=> b!1425475 m!1316063))

(declare-fun m!1316065 () Bool)

(assert (=> start!122898 m!1316065))

(declare-fun m!1316067 () Bool)

(assert (=> start!122898 m!1316067))

(declare-fun m!1316069 () Bool)

(assert (=> b!1425482 m!1316069))

(assert (=> b!1425482 m!1316069))

(declare-fun m!1316071 () Bool)

(assert (=> b!1425482 m!1316071))

(declare-fun m!1316073 () Bool)

(assert (=> b!1425481 m!1316073))

(assert (=> b!1425481 m!1316073))

(declare-fun m!1316075 () Bool)

(assert (=> b!1425481 m!1316075))

(assert (=> b!1425481 m!1316075))

(assert (=> b!1425481 m!1316073))

(declare-fun m!1316077 () Bool)

(assert (=> b!1425481 m!1316077))

(assert (=> b!1425483 m!1316073))

(assert (=> b!1425483 m!1316073))

(declare-fun m!1316079 () Bool)

(assert (=> b!1425483 m!1316079))

(declare-fun m!1316081 () Bool)

(assert (=> b!1425480 m!1316081))

(assert (=> b!1425479 m!1316073))

(assert (=> b!1425479 m!1316073))

(declare-fun m!1316083 () Bool)

(assert (=> b!1425479 m!1316083))

(push 1)

(assert (not b!1425480))

(assert (not start!122898))

(assert (not b!1425479))

(assert (not b!1425475))

(assert (not b!1425476))

(assert (not b!1425482))

(assert (not b!1425481))

(assert (not b!1425483))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

