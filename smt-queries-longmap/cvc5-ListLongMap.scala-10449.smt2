; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122856 () Bool)

(assert start!122856)

(declare-fun b!1424985 () Bool)

(declare-fun res!960424 () Bool)

(declare-fun e!805241 () Bool)

(assert (=> b!1424985 (=> (not res!960424) (not e!805241))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97221 0))(
  ( (array!97222 (arr!46928 (Array (_ BitVec 32) (_ BitVec 64))) (size!47478 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97221)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1424985 (= res!960424 (and (= (size!47478 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47478 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47478 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424986 () Bool)

(declare-fun res!960421 () Bool)

(assert (=> b!1424986 (=> (not res!960421) (not e!805241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97221 (_ BitVec 32)) Bool)

(assert (=> b!1424986 (= res!960421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424987 () Bool)

(declare-fun res!960419 () Bool)

(assert (=> b!1424987 (=> (not res!960419) (not e!805241))))

(declare-datatypes ((List!33438 0))(
  ( (Nil!33435) (Cons!33434 (h!34736 (_ BitVec 64)) (t!48132 List!33438)) )
))
(declare-fun arrayNoDuplicates!0 (array!97221 (_ BitVec 32) List!33438) Bool)

(assert (=> b!1424987 (= res!960419 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33435))))

(declare-fun b!1424988 () Bool)

(assert (=> b!1424988 (= e!805241 false)))

(declare-datatypes ((SeekEntryResult!11207 0))(
  ( (MissingZero!11207 (index!47220 (_ BitVec 32))) (Found!11207 (index!47221 (_ BitVec 32))) (Intermediate!11207 (undefined!12019 Bool) (index!47222 (_ BitVec 32)) (x!128865 (_ BitVec 32))) (Undefined!11207) (MissingVacant!11207 (index!47223 (_ BitVec 32))) )
))
(declare-fun lt!627756 () SeekEntryResult!11207)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97221 (_ BitVec 32)) SeekEntryResult!11207)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424988 (= lt!627756 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46928 a!2831) j!81) mask!2608) (select (arr!46928 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1424989 () Bool)

(declare-fun res!960418 () Bool)

(assert (=> b!1424989 (=> (not res!960418) (not e!805241))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1424989 (= res!960418 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47478 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47478 a!2831))))))

(declare-fun res!960420 () Bool)

(assert (=> start!122856 (=> (not res!960420) (not e!805241))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122856 (= res!960420 (validMask!0 mask!2608))))

(assert (=> start!122856 e!805241))

(assert (=> start!122856 true))

(declare-fun array_inv!35956 (array!97221) Bool)

(assert (=> start!122856 (array_inv!35956 a!2831)))

(declare-fun b!1424990 () Bool)

(declare-fun res!960423 () Bool)

(assert (=> b!1424990 (=> (not res!960423) (not e!805241))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424990 (= res!960423 (validKeyInArray!0 (select (arr!46928 a!2831) i!982)))))

(declare-fun b!1424991 () Bool)

(declare-fun res!960422 () Bool)

(assert (=> b!1424991 (=> (not res!960422) (not e!805241))))

(assert (=> b!1424991 (= res!960422 (validKeyInArray!0 (select (arr!46928 a!2831) j!81)))))

(assert (= (and start!122856 res!960420) b!1424985))

(assert (= (and b!1424985 res!960424) b!1424990))

(assert (= (and b!1424990 res!960423) b!1424991))

(assert (= (and b!1424991 res!960422) b!1424986))

(assert (= (and b!1424986 res!960421) b!1424987))

(assert (= (and b!1424987 res!960419) b!1424989))

(assert (= (and b!1424989 res!960418) b!1424988))

(declare-fun m!1315545 () Bool)

(assert (=> b!1424991 m!1315545))

(assert (=> b!1424991 m!1315545))

(declare-fun m!1315547 () Bool)

(assert (=> b!1424991 m!1315547))

(declare-fun m!1315549 () Bool)

(assert (=> start!122856 m!1315549))

(declare-fun m!1315551 () Bool)

(assert (=> start!122856 m!1315551))

(declare-fun m!1315553 () Bool)

(assert (=> b!1424990 m!1315553))

(assert (=> b!1424990 m!1315553))

(declare-fun m!1315555 () Bool)

(assert (=> b!1424990 m!1315555))

(declare-fun m!1315557 () Bool)

(assert (=> b!1424987 m!1315557))

(assert (=> b!1424988 m!1315545))

(assert (=> b!1424988 m!1315545))

(declare-fun m!1315559 () Bool)

(assert (=> b!1424988 m!1315559))

(assert (=> b!1424988 m!1315559))

(assert (=> b!1424988 m!1315545))

(declare-fun m!1315561 () Bool)

(assert (=> b!1424988 m!1315561))

(declare-fun m!1315563 () Bool)

(assert (=> b!1424986 m!1315563))

(push 1)

(assert (not start!122856))

(assert (not b!1424988))

(assert (not b!1424987))

(assert (not b!1424991))

(assert (not b!1424986))

(assert (not b!1424990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

