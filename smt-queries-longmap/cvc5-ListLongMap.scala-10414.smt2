; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122646 () Bool)

(assert start!122646)

(declare-fun b!1420653 () Bool)

(declare-fun res!956093 () Bool)

(declare-fun e!803444 () Bool)

(assert (=> b!1420653 (=> (not res!956093) (not e!803444))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97011 0))(
  ( (array!97012 (arr!46823 (Array (_ BitVec 32) (_ BitVec 64))) (size!47373 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97011)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420653 (= res!956093 (and (= (size!47373 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47373 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47373 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420654 () Bool)

(declare-fun e!803445 () Bool)

(declare-fun e!803447 () Bool)

(assert (=> b!1420654 (= e!803445 e!803447)))

(declare-fun res!956092 () Bool)

(assert (=> b!1420654 (=> (not res!956092) (not e!803447))))

(declare-fun lt!625946 () array!97011)

(declare-fun lt!625947 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-datatypes ((SeekEntryResult!11108 0))(
  ( (MissingZero!11108 (index!46824 (_ BitVec 32))) (Found!11108 (index!46825 (_ BitVec 32))) (Intermediate!11108 (undefined!11920 Bool) (index!46826 (_ BitVec 32)) (x!128486 (_ BitVec 32))) (Undefined!11108) (MissingVacant!11108 (index!46827 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97011 (_ BitVec 32)) SeekEntryResult!11108)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420654 (= res!956092 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!625947 mask!2608) lt!625947 lt!625946 mask!2608) (Intermediate!11108 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1420654 (= lt!625947 (select (store (arr!46823 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1420654 (= lt!625946 (array!97012 (store (arr!46823 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47373 a!2831)))))

(declare-fun b!1420655 () Bool)

(declare-fun res!956094 () Bool)

(assert (=> b!1420655 (=> (not res!956094) (not e!803447))))

(declare-fun lt!625945 () SeekEntryResult!11108)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420655 (= res!956094 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46823 a!2831) j!81) a!2831 mask!2608) lt!625945))))

(declare-fun b!1420657 () Bool)

(assert (=> b!1420657 (= e!803447 false)))

(declare-fun lt!625944 () SeekEntryResult!11108)

(assert (=> b!1420657 (= lt!625944 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!625947 lt!625946 mask!2608))))

(declare-fun b!1420658 () Bool)

(declare-fun res!956088 () Bool)

(assert (=> b!1420658 (=> (not res!956088) (not e!803444))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1420658 (= res!956088 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47373 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47373 a!2831))))))

(declare-fun b!1420659 () Bool)

(declare-fun res!956087 () Bool)

(assert (=> b!1420659 (=> (not res!956087) (not e!803444))))

(declare-datatypes ((List!33333 0))(
  ( (Nil!33330) (Cons!33329 (h!34631 (_ BitVec 64)) (t!48027 List!33333)) )
))
(declare-fun arrayNoDuplicates!0 (array!97011 (_ BitVec 32) List!33333) Bool)

(assert (=> b!1420659 (= res!956087 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33330))))

(declare-fun b!1420660 () Bool)

(assert (=> b!1420660 (= e!803444 e!803445)))

(declare-fun res!956086 () Bool)

(assert (=> b!1420660 (=> (not res!956086) (not e!803445))))

(assert (=> b!1420660 (= res!956086 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46823 a!2831) j!81) mask!2608) (select (arr!46823 a!2831) j!81) a!2831 mask!2608) lt!625945))))

(assert (=> b!1420660 (= lt!625945 (Intermediate!11108 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420661 () Bool)

(declare-fun res!956095 () Bool)

(assert (=> b!1420661 (=> (not res!956095) (not e!803444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97011 (_ BitVec 32)) Bool)

(assert (=> b!1420661 (= res!956095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420662 () Bool)

(declare-fun res!956090 () Bool)

(assert (=> b!1420662 (=> (not res!956090) (not e!803444))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420662 (= res!956090 (validKeyInArray!0 (select (arr!46823 a!2831) j!81)))))

(declare-fun res!956089 () Bool)

(assert (=> start!122646 (=> (not res!956089) (not e!803444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122646 (= res!956089 (validMask!0 mask!2608))))

(assert (=> start!122646 e!803444))

(assert (=> start!122646 true))

(declare-fun array_inv!35851 (array!97011) Bool)

(assert (=> start!122646 (array_inv!35851 a!2831)))

(declare-fun b!1420656 () Bool)

(declare-fun res!956091 () Bool)

(assert (=> b!1420656 (=> (not res!956091) (not e!803444))))

(assert (=> b!1420656 (= res!956091 (validKeyInArray!0 (select (arr!46823 a!2831) i!982)))))

(assert (= (and start!122646 res!956089) b!1420653))

(assert (= (and b!1420653 res!956093) b!1420656))

(assert (= (and b!1420656 res!956091) b!1420662))

(assert (= (and b!1420662 res!956090) b!1420661))

(assert (= (and b!1420661 res!956095) b!1420659))

(assert (= (and b!1420659 res!956087) b!1420658))

(assert (= (and b!1420658 res!956088) b!1420660))

(assert (= (and b!1420660 res!956086) b!1420654))

(assert (= (and b!1420654 res!956092) b!1420655))

(assert (= (and b!1420655 res!956094) b!1420657))

(declare-fun m!1311171 () Bool)

(assert (=> b!1420660 m!1311171))

(assert (=> b!1420660 m!1311171))

(declare-fun m!1311173 () Bool)

(assert (=> b!1420660 m!1311173))

(assert (=> b!1420660 m!1311173))

(assert (=> b!1420660 m!1311171))

(declare-fun m!1311175 () Bool)

(assert (=> b!1420660 m!1311175))

(declare-fun m!1311177 () Bool)

(assert (=> b!1420661 m!1311177))

(assert (=> b!1420655 m!1311171))

(assert (=> b!1420655 m!1311171))

(declare-fun m!1311179 () Bool)

(assert (=> b!1420655 m!1311179))

(declare-fun m!1311181 () Bool)

(assert (=> b!1420654 m!1311181))

(assert (=> b!1420654 m!1311181))

(declare-fun m!1311183 () Bool)

(assert (=> b!1420654 m!1311183))

(declare-fun m!1311185 () Bool)

(assert (=> b!1420654 m!1311185))

(declare-fun m!1311187 () Bool)

(assert (=> b!1420654 m!1311187))

(assert (=> b!1420662 m!1311171))

(assert (=> b!1420662 m!1311171))

(declare-fun m!1311189 () Bool)

(assert (=> b!1420662 m!1311189))

(declare-fun m!1311191 () Bool)

(assert (=> start!122646 m!1311191))

(declare-fun m!1311193 () Bool)

(assert (=> start!122646 m!1311193))

(declare-fun m!1311195 () Bool)

(assert (=> b!1420659 m!1311195))

(declare-fun m!1311197 () Bool)

(assert (=> b!1420657 m!1311197))

(declare-fun m!1311199 () Bool)

(assert (=> b!1420656 m!1311199))

(assert (=> b!1420656 m!1311199))

(declare-fun m!1311201 () Bool)

(assert (=> b!1420656 m!1311201))

(push 1)

