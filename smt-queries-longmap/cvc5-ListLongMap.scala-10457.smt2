; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122904 () Bool)

(assert start!122904)

(declare-fun b!1425556 () Bool)

(declare-fun res!960990 () Bool)

(declare-fun e!805385 () Bool)

(assert (=> b!1425556 (=> (not res!960990) (not e!805385))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97269 0))(
  ( (array!97270 (arr!46952 (Array (_ BitVec 32) (_ BitVec 64))) (size!47502 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97269)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425556 (= res!960990 (and (= (size!47502 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47502 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47502 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425557 () Bool)

(declare-fun res!960989 () Bool)

(assert (=> b!1425557 (=> (not res!960989) (not e!805385))))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11231 0))(
  ( (MissingZero!11231 (index!47316 (_ BitVec 32))) (Found!11231 (index!47317 (_ BitVec 32))) (Intermediate!11231 (undefined!12043 Bool) (index!47318 (_ BitVec 32)) (x!128953 (_ BitVec 32))) (Undefined!11231) (MissingVacant!11231 (index!47319 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97269 (_ BitVec 32)) SeekEntryResult!11231)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425557 (= res!960989 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46952 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46952 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!97270 (store (arr!46952 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47502 a!2831)) mask!2608) (Intermediate!11231 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1425558 () Bool)

(declare-fun res!960991 () Bool)

(assert (=> b!1425558 (=> (not res!960991) (not e!805385))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1425558 (= res!960991 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46952 a!2831) j!81) mask!2608) (select (arr!46952 a!2831) j!81) a!2831 mask!2608) (Intermediate!11231 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1425559 () Bool)

(assert (=> b!1425559 (= e!805385 false)))

(declare-fun lt!627828 () SeekEntryResult!11231)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1425559 (= lt!627828 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46952 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1425560 () Bool)

(declare-fun res!960993 () Bool)

(assert (=> b!1425560 (=> (not res!960993) (not e!805385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97269 (_ BitVec 32)) Bool)

(assert (=> b!1425560 (= res!960993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!960995 () Bool)

(assert (=> start!122904 (=> (not res!960995) (not e!805385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122904 (= res!960995 (validMask!0 mask!2608))))

(assert (=> start!122904 e!805385))

(assert (=> start!122904 true))

(declare-fun array_inv!35980 (array!97269) Bool)

(assert (=> start!122904 (array_inv!35980 a!2831)))

(declare-fun b!1425561 () Bool)

(declare-fun res!960994 () Bool)

(assert (=> b!1425561 (=> (not res!960994) (not e!805385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425561 (= res!960994 (validKeyInArray!0 (select (arr!46952 a!2831) j!81)))))

(declare-fun b!1425562 () Bool)

(declare-fun res!960997 () Bool)

(assert (=> b!1425562 (=> (not res!960997) (not e!805385))))

(declare-datatypes ((List!33462 0))(
  ( (Nil!33459) (Cons!33458 (h!34760 (_ BitVec 64)) (t!48156 List!33462)) )
))
(declare-fun arrayNoDuplicates!0 (array!97269 (_ BitVec 32) List!33462) Bool)

(assert (=> b!1425562 (= res!960997 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33459))))

(declare-fun b!1425563 () Bool)

(declare-fun res!960996 () Bool)

(assert (=> b!1425563 (=> (not res!960996) (not e!805385))))

(assert (=> b!1425563 (= res!960996 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47502 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47502 a!2831))))))

(declare-fun b!1425564 () Bool)

(declare-fun res!960992 () Bool)

(assert (=> b!1425564 (=> (not res!960992) (not e!805385))))

(assert (=> b!1425564 (= res!960992 (validKeyInArray!0 (select (arr!46952 a!2831) i!982)))))

(assert (= (and start!122904 res!960995) b!1425556))

(assert (= (and b!1425556 res!960990) b!1425564))

(assert (= (and b!1425564 res!960992) b!1425561))

(assert (= (and b!1425561 res!960994) b!1425560))

(assert (= (and b!1425560 res!960993) b!1425562))

(assert (= (and b!1425562 res!960997) b!1425563))

(assert (= (and b!1425563 res!960996) b!1425558))

(assert (= (and b!1425558 res!960991) b!1425557))

(assert (= (and b!1425557 res!960989) b!1425559))

(declare-fun m!1316145 () Bool)

(assert (=> b!1425561 m!1316145))

(assert (=> b!1425561 m!1316145))

(declare-fun m!1316147 () Bool)

(assert (=> b!1425561 m!1316147))

(declare-fun m!1316149 () Bool)

(assert (=> b!1425560 m!1316149))

(declare-fun m!1316151 () Bool)

(assert (=> b!1425564 m!1316151))

(assert (=> b!1425564 m!1316151))

(declare-fun m!1316153 () Bool)

(assert (=> b!1425564 m!1316153))

(declare-fun m!1316155 () Bool)

(assert (=> b!1425562 m!1316155))

(assert (=> b!1425559 m!1316145))

(assert (=> b!1425559 m!1316145))

(declare-fun m!1316157 () Bool)

(assert (=> b!1425559 m!1316157))

(declare-fun m!1316159 () Bool)

(assert (=> start!122904 m!1316159))

(declare-fun m!1316161 () Bool)

(assert (=> start!122904 m!1316161))

(assert (=> b!1425558 m!1316145))

(assert (=> b!1425558 m!1316145))

(declare-fun m!1316163 () Bool)

(assert (=> b!1425558 m!1316163))

(assert (=> b!1425558 m!1316163))

(assert (=> b!1425558 m!1316145))

(declare-fun m!1316165 () Bool)

(assert (=> b!1425558 m!1316165))

(declare-fun m!1316167 () Bool)

(assert (=> b!1425557 m!1316167))

(declare-fun m!1316169 () Bool)

(assert (=> b!1425557 m!1316169))

(assert (=> b!1425557 m!1316169))

(declare-fun m!1316171 () Bool)

(assert (=> b!1425557 m!1316171))

(assert (=> b!1425557 m!1316171))

(assert (=> b!1425557 m!1316169))

(declare-fun m!1316173 () Bool)

(assert (=> b!1425557 m!1316173))

(push 1)

(assert (not b!1425559))

(assert (not b!1425558))

(assert (not start!122904))

(assert (not b!1425562))

(assert (not b!1425561))

(assert (not b!1425557))

(assert (not b!1425560))

(assert (not b!1425564))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

