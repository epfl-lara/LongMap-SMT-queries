; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122618 () Bool)

(assert start!122618)

(declare-fun res!955677 () Bool)

(declare-fun e!803334 () Bool)

(assert (=> start!122618 (=> (not res!955677) (not e!803334))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122618 (= res!955677 (validMask!0 mask!2608))))

(assert (=> start!122618 e!803334))

(assert (=> start!122618 true))

(declare-datatypes ((array!96983 0))(
  ( (array!96984 (arr!46809 (Array (_ BitVec 32) (_ BitVec 64))) (size!47359 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96983)

(declare-fun array_inv!35837 (array!96983) Bool)

(assert (=> start!122618 (array_inv!35837 a!2831)))

(declare-fun b!1420242 () Bool)

(declare-fun res!955679 () Bool)

(assert (=> b!1420242 (=> (not res!955679) (not e!803334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96983 (_ BitVec 32)) Bool)

(assert (=> b!1420242 (= res!955679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420243 () Bool)

(declare-fun e!803335 () Bool)

(assert (=> b!1420243 (= e!803335 (bvslt mask!2608 #b00000000000000000000000000000000))))

(declare-fun b!1420244 () Bool)

(declare-fun res!955675 () Bool)

(assert (=> b!1420244 (=> (not res!955675) (not e!803334))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420244 (= res!955675 (validKeyInArray!0 (select (arr!46809 a!2831) i!982)))))

(declare-fun b!1420245 () Bool)

(declare-fun res!955676 () Bool)

(assert (=> b!1420245 (=> (not res!955676) (not e!803334))))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1420245 (= res!955676 (validKeyInArray!0 (select (arr!46809 a!2831) j!81)))))

(declare-fun b!1420246 () Bool)

(declare-fun res!955684 () Bool)

(assert (=> b!1420246 (=> (not res!955684) (not e!803334))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420246 (= res!955684 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47359 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47359 a!2831))))))

(declare-fun b!1420247 () Bool)

(declare-fun res!955683 () Bool)

(assert (=> b!1420247 (=> (not res!955683) (not e!803335))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11094 0))(
  ( (MissingZero!11094 (index!46768 (_ BitVec 32))) (Found!11094 (index!46769 (_ BitVec 32))) (Intermediate!11094 (undefined!11906 Bool) (index!46770 (_ BitVec 32)) (x!128432 (_ BitVec 32))) (Undefined!11094) (MissingVacant!11094 (index!46771 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96983 (_ BitVec 32)) SeekEntryResult!11094)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420247 (= res!955683 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46809 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46809 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96984 (store (arr!46809 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47359 a!2831)) mask!2608) (Intermediate!11094 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1420248 () Bool)

(declare-fun res!955681 () Bool)

(assert (=> b!1420248 (=> (not res!955681) (not e!803335))))

(declare-fun lt!625896 () SeekEntryResult!11094)

(assert (=> b!1420248 (= res!955681 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46809 a!2831) j!81) a!2831 mask!2608) lt!625896))))

(declare-fun b!1420249 () Bool)

(declare-fun res!955680 () Bool)

(assert (=> b!1420249 (=> (not res!955680) (not e!803334))))

(assert (=> b!1420249 (= res!955680 (and (= (size!47359 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47359 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47359 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420250 () Bool)

(assert (=> b!1420250 (= e!803334 e!803335)))

(declare-fun res!955678 () Bool)

(assert (=> b!1420250 (=> (not res!955678) (not e!803335))))

(assert (=> b!1420250 (= res!955678 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46809 a!2831) j!81) mask!2608) (select (arr!46809 a!2831) j!81) a!2831 mask!2608) lt!625896))))

(assert (=> b!1420250 (= lt!625896 (Intermediate!11094 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420251 () Bool)

(declare-fun res!955682 () Bool)

(assert (=> b!1420251 (=> (not res!955682) (not e!803334))))

(declare-datatypes ((List!33319 0))(
  ( (Nil!33316) (Cons!33315 (h!34617 (_ BitVec 64)) (t!48013 List!33319)) )
))
(declare-fun arrayNoDuplicates!0 (array!96983 (_ BitVec 32) List!33319) Bool)

(assert (=> b!1420251 (= res!955682 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33316))))

(assert (= (and start!122618 res!955677) b!1420249))

(assert (= (and b!1420249 res!955680) b!1420244))

(assert (= (and b!1420244 res!955675) b!1420245))

(assert (= (and b!1420245 res!955676) b!1420242))

(assert (= (and b!1420242 res!955679) b!1420251))

(assert (= (and b!1420251 res!955682) b!1420246))

(assert (= (and b!1420246 res!955684) b!1420250))

(assert (= (and b!1420250 res!955678) b!1420247))

(assert (= (and b!1420247 res!955683) b!1420248))

(assert (= (and b!1420248 res!955681) b!1420243))

(declare-fun m!1310745 () Bool)

(assert (=> b!1420250 m!1310745))

(assert (=> b!1420250 m!1310745))

(declare-fun m!1310747 () Bool)

(assert (=> b!1420250 m!1310747))

(assert (=> b!1420250 m!1310747))

(assert (=> b!1420250 m!1310745))

(declare-fun m!1310749 () Bool)

(assert (=> b!1420250 m!1310749))

(assert (=> b!1420245 m!1310745))

(assert (=> b!1420245 m!1310745))

(declare-fun m!1310751 () Bool)

(assert (=> b!1420245 m!1310751))

(declare-fun m!1310753 () Bool)

(assert (=> b!1420247 m!1310753))

(declare-fun m!1310755 () Bool)

(assert (=> b!1420247 m!1310755))

(assert (=> b!1420247 m!1310755))

(declare-fun m!1310757 () Bool)

(assert (=> b!1420247 m!1310757))

(assert (=> b!1420247 m!1310757))

(assert (=> b!1420247 m!1310755))

(declare-fun m!1310759 () Bool)

(assert (=> b!1420247 m!1310759))

(assert (=> b!1420248 m!1310745))

(assert (=> b!1420248 m!1310745))

(declare-fun m!1310761 () Bool)

(assert (=> b!1420248 m!1310761))

(declare-fun m!1310763 () Bool)

(assert (=> b!1420242 m!1310763))

(declare-fun m!1310765 () Bool)

(assert (=> b!1420251 m!1310765))

(declare-fun m!1310767 () Bool)

(assert (=> start!122618 m!1310767))

(declare-fun m!1310769 () Bool)

(assert (=> start!122618 m!1310769))

(declare-fun m!1310771 () Bool)

(assert (=> b!1420244 m!1310771))

(assert (=> b!1420244 m!1310771))

(declare-fun m!1310773 () Bool)

(assert (=> b!1420244 m!1310773))

(check-sat (not b!1420245) (not b!1420251) (not b!1420248) (not start!122618) (not b!1420242) (not b!1420250) (not b!1420244) (not b!1420247))
(check-sat)
