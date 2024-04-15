; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122868 () Bool)

(assert start!122868)

(declare-fun b!1425072 () Bool)

(declare-fun res!960562 () Bool)

(declare-fun e!805249 () Bool)

(assert (=> b!1425072 (=> (not res!960562) (not e!805249))))

(declare-datatypes ((array!97186 0))(
  ( (array!97187 (arr!46911 (Array (_ BitVec 32) (_ BitVec 64))) (size!47463 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97186)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425072 (= res!960562 (validKeyInArray!0 (select (arr!46911 a!2831) i!982)))))

(declare-fun res!960559 () Bool)

(assert (=> start!122868 (=> (not res!960559) (not e!805249))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122868 (= res!960559 (validMask!0 mask!2608))))

(assert (=> start!122868 e!805249))

(assert (=> start!122868 true))

(declare-fun array_inv!36144 (array!97186) Bool)

(assert (=> start!122868 (array_inv!36144 a!2831)))

(declare-fun b!1425073 () Bool)

(declare-fun res!960561 () Bool)

(assert (=> b!1425073 (=> (not res!960561) (not e!805249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97186 (_ BitVec 32)) Bool)

(assert (=> b!1425073 (= res!960561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425074 () Bool)

(declare-fun res!960556 () Bool)

(assert (=> b!1425074 (=> (not res!960556) (not e!805249))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1425074 (= res!960556 (and (= (size!47463 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47463 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47463 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425075 () Bool)

(declare-fun res!960560 () Bool)

(assert (=> b!1425075 (=> (not res!960560) (not e!805249))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425075 (= res!960560 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47463 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47463 a!2831))))))

(declare-fun b!1425076 () Bool)

(declare-fun res!960558 () Bool)

(assert (=> b!1425076 (=> (not res!960558) (not e!805249))))

(assert (=> b!1425076 (= res!960558 (validKeyInArray!0 (select (arr!46911 a!2831) j!81)))))

(declare-fun b!1425077 () Bool)

(declare-fun res!960557 () Bool)

(assert (=> b!1425077 (=> (not res!960557) (not e!805249))))

(declare-datatypes ((List!33499 0))(
  ( (Nil!33496) (Cons!33495 (h!34797 (_ BitVec 64)) (t!48185 List!33499)) )
))
(declare-fun arrayNoDuplicates!0 (array!97186 (_ BitVec 32) List!33499) Bool)

(assert (=> b!1425077 (= res!960557 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33496))))

(declare-fun b!1425078 () Bool)

(assert (=> b!1425078 (= e!805249 false)))

(declare-datatypes ((SeekEntryResult!11217 0))(
  ( (MissingZero!11217 (index!47260 (_ BitVec 32))) (Found!11217 (index!47261 (_ BitVec 32))) (Intermediate!11217 (undefined!12029 Bool) (index!47262 (_ BitVec 32)) (x!128888 (_ BitVec 32))) (Undefined!11217) (MissingVacant!11217 (index!47263 (_ BitVec 32))) )
))
(declare-fun lt!627590 () SeekEntryResult!11217)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97186 (_ BitVec 32)) SeekEntryResult!11217)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425078 (= lt!627590 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46911 a!2831) j!81) mask!2608) (select (arr!46911 a!2831) j!81) a!2831 mask!2608))))

(assert (= (and start!122868 res!960559) b!1425074))

(assert (= (and b!1425074 res!960556) b!1425072))

(assert (= (and b!1425072 res!960562) b!1425076))

(assert (= (and b!1425076 res!960558) b!1425073))

(assert (= (and b!1425073 res!960561) b!1425077))

(assert (= (and b!1425077 res!960557) b!1425075))

(assert (= (and b!1425075 res!960560) b!1425078))

(declare-fun m!1315153 () Bool)

(assert (=> b!1425078 m!1315153))

(assert (=> b!1425078 m!1315153))

(declare-fun m!1315155 () Bool)

(assert (=> b!1425078 m!1315155))

(assert (=> b!1425078 m!1315155))

(assert (=> b!1425078 m!1315153))

(declare-fun m!1315157 () Bool)

(assert (=> b!1425078 m!1315157))

(declare-fun m!1315159 () Bool)

(assert (=> start!122868 m!1315159))

(declare-fun m!1315161 () Bool)

(assert (=> start!122868 m!1315161))

(assert (=> b!1425076 m!1315153))

(assert (=> b!1425076 m!1315153))

(declare-fun m!1315163 () Bool)

(assert (=> b!1425076 m!1315163))

(declare-fun m!1315165 () Bool)

(assert (=> b!1425072 m!1315165))

(assert (=> b!1425072 m!1315165))

(declare-fun m!1315167 () Bool)

(assert (=> b!1425072 m!1315167))

(declare-fun m!1315169 () Bool)

(assert (=> b!1425073 m!1315169))

(declare-fun m!1315171 () Bool)

(assert (=> b!1425077 m!1315171))

(push 1)

(assert (not start!122868))

(assert (not b!1425078))

(assert (not b!1425077))

(assert (not b!1425076))

(assert (not b!1425073))

(assert (not b!1425072))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

