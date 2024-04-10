; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122772 () Bool)

(assert start!122772)

(declare-fun b!1423167 () Bool)

(declare-fun res!958614 () Bool)

(declare-fun e!804460 () Bool)

(assert (=> b!1423167 (=> (not res!958614) (not e!804460))))

(declare-datatypes ((array!97137 0))(
  ( (array!97138 (arr!46886 (Array (_ BitVec 32) (_ BitVec 64))) (size!47436 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97137)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1423167 (= res!958614 (validKeyInArray!0 (select (arr!46886 a!2831) j!81)))))

(declare-fun b!1423168 () Bool)

(declare-fun e!804463 () Bool)

(declare-fun e!804458 () Bool)

(assert (=> b!1423168 (= e!804463 e!804458)))

(declare-fun res!958609 () Bool)

(assert (=> b!1423168 (=> (not res!958609) (not e!804458))))

(declare-fun lt!626994 () array!97137)

(declare-fun lt!626999 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11171 0))(
  ( (MissingZero!11171 (index!47076 (_ BitVec 32))) (Found!11171 (index!47077 (_ BitVec 32))) (Intermediate!11171 (undefined!11983 Bool) (index!47078 (_ BitVec 32)) (x!128717 (_ BitVec 32))) (Undefined!11171) (MissingVacant!11171 (index!47079 (_ BitVec 32))) )
))
(declare-fun lt!626996 () SeekEntryResult!11171)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97137 (_ BitVec 32)) SeekEntryResult!11171)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423168 (= res!958609 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626999 mask!2608) lt!626999 lt!626994 mask!2608) lt!626996))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1423168 (= lt!626996 (Intermediate!11171 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1423168 (= lt!626999 (select (store (arr!46886 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1423168 (= lt!626994 (array!97138 (store (arr!46886 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47436 a!2831)))))

(declare-fun b!1423169 () Bool)

(declare-fun res!958606 () Bool)

(declare-fun e!804464 () Bool)

(assert (=> b!1423169 (=> res!958606 e!804464)))

(declare-fun lt!626995 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!627000 () SeekEntryResult!11171)

(assert (=> b!1423169 (= res!958606 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626995 (select (arr!46886 a!2831) j!81) a!2831 mask!2608) lt!627000)))))

(declare-fun b!1423170 () Bool)

(declare-fun res!958604 () Bool)

(assert (=> b!1423170 (=> (not res!958604) (not e!804458))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1423170 (= res!958604 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1423171 () Bool)

(declare-fun res!958600 () Bool)

(assert (=> b!1423171 (=> (not res!958600) (not e!804460))))

(declare-datatypes ((List!33396 0))(
  ( (Nil!33393) (Cons!33392 (h!34694 (_ BitVec 64)) (t!48090 List!33396)) )
))
(declare-fun arrayNoDuplicates!0 (array!97137 (_ BitVec 32) List!33396) Bool)

(assert (=> b!1423171 (= res!958600 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33393))))

(declare-fun b!1423172 () Bool)

(declare-fun res!958610 () Bool)

(assert (=> b!1423172 (=> (not res!958610) (not e!804460))))

(assert (=> b!1423172 (= res!958610 (validKeyInArray!0 (select (arr!46886 a!2831) i!982)))))

(declare-fun res!958607 () Bool)

(assert (=> start!122772 (=> (not res!958607) (not e!804460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122772 (= res!958607 (validMask!0 mask!2608))))

(assert (=> start!122772 e!804460))

(assert (=> start!122772 true))

(declare-fun array_inv!35914 (array!97137) Bool)

(assert (=> start!122772 (array_inv!35914 a!2831)))

(declare-fun b!1423173 () Bool)

(assert (=> b!1423173 (= e!804464 true)))

(declare-fun lt!626997 () SeekEntryResult!11171)

(assert (=> b!1423173 (= lt!626997 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626995 lt!626999 lt!626994 mask!2608))))

(declare-fun b!1423174 () Bool)

(declare-fun e!804462 () Bool)

(assert (=> b!1423174 (= e!804458 (not e!804462))))

(declare-fun res!958611 () Bool)

(assert (=> b!1423174 (=> res!958611 e!804462)))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1423174 (= res!958611 (or (= (select (arr!46886 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46886 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46886 a!2831) index!585) (select (arr!46886 a!2831) j!81)) (= (select (store (arr!46886 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!804461 () Bool)

(assert (=> b!1423174 e!804461))

(declare-fun res!958603 () Bool)

(assert (=> b!1423174 (=> (not res!958603) (not e!804461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97137 (_ BitVec 32)) Bool)

(assert (=> b!1423174 (= res!958603 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48178 0))(
  ( (Unit!48179) )
))
(declare-fun lt!626998 () Unit!48178)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48178)

(assert (=> b!1423174 (= lt!626998 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1423175 () Bool)

(assert (=> b!1423175 (= e!804462 e!804464)))

(declare-fun res!958605 () Bool)

(assert (=> b!1423175 (=> res!958605 e!804464)))

(assert (=> b!1423175 (= res!958605 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626995 #b00000000000000000000000000000000) (bvsge lt!626995 (size!47436 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1423175 (= lt!626995 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1423176 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97137 (_ BitVec 32)) SeekEntryResult!11171)

(assert (=> b!1423176 (= e!804461 (= (seekEntryOrOpen!0 (select (arr!46886 a!2831) j!81) a!2831 mask!2608) (Found!11171 j!81)))))

(declare-fun b!1423177 () Bool)

(declare-fun res!958613 () Bool)

(assert (=> b!1423177 (=> (not res!958613) (not e!804460))))

(assert (=> b!1423177 (= res!958613 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47436 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47436 a!2831))))))

(declare-fun b!1423178 () Bool)

(declare-fun res!958601 () Bool)

(assert (=> b!1423178 (=> (not res!958601) (not e!804460))))

(assert (=> b!1423178 (= res!958601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1423179 () Bool)

(declare-fun res!958602 () Bool)

(assert (=> b!1423179 (=> (not res!958602) (not e!804458))))

(assert (=> b!1423179 (= res!958602 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46886 a!2831) j!81) a!2831 mask!2608) lt!627000))))

(declare-fun b!1423180 () Bool)

(declare-fun res!958615 () Bool)

(assert (=> b!1423180 (=> (not res!958615) (not e!804460))))

(assert (=> b!1423180 (= res!958615 (and (= (size!47436 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47436 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47436 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1423181 () Bool)

(declare-fun res!958608 () Bool)

(assert (=> b!1423181 (=> (not res!958608) (not e!804458))))

(assert (=> b!1423181 (= res!958608 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626999 lt!626994 mask!2608) lt!626996))))

(declare-fun b!1423182 () Bool)

(assert (=> b!1423182 (= e!804460 e!804463)))

(declare-fun res!958612 () Bool)

(assert (=> b!1423182 (=> (not res!958612) (not e!804463))))

(assert (=> b!1423182 (= res!958612 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46886 a!2831) j!81) mask!2608) (select (arr!46886 a!2831) j!81) a!2831 mask!2608) lt!627000))))

(assert (=> b!1423182 (= lt!627000 (Intermediate!11171 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122772 res!958607) b!1423180))

(assert (= (and b!1423180 res!958615) b!1423172))

(assert (= (and b!1423172 res!958610) b!1423167))

(assert (= (and b!1423167 res!958614) b!1423178))

(assert (= (and b!1423178 res!958601) b!1423171))

(assert (= (and b!1423171 res!958600) b!1423177))

(assert (= (and b!1423177 res!958613) b!1423182))

(assert (= (and b!1423182 res!958612) b!1423168))

(assert (= (and b!1423168 res!958609) b!1423179))

(assert (= (and b!1423179 res!958602) b!1423181))

(assert (= (and b!1423181 res!958608) b!1423170))

(assert (= (and b!1423170 res!958604) b!1423174))

(assert (= (and b!1423174 res!958603) b!1423176))

(assert (= (and b!1423174 (not res!958611)) b!1423175))

(assert (= (and b!1423175 (not res!958605)) b!1423169))

(assert (= (and b!1423169 (not res!958606)) b!1423173))

(declare-fun m!1313715 () Bool)

(assert (=> b!1423167 m!1313715))

(assert (=> b!1423167 m!1313715))

(declare-fun m!1313717 () Bool)

(assert (=> b!1423167 m!1313717))

(assert (=> b!1423176 m!1313715))

(assert (=> b!1423176 m!1313715))

(declare-fun m!1313719 () Bool)

(assert (=> b!1423176 m!1313719))

(declare-fun m!1313721 () Bool)

(assert (=> b!1423171 m!1313721))

(declare-fun m!1313723 () Bool)

(assert (=> b!1423174 m!1313723))

(declare-fun m!1313725 () Bool)

(assert (=> b!1423174 m!1313725))

(declare-fun m!1313727 () Bool)

(assert (=> b!1423174 m!1313727))

(declare-fun m!1313729 () Bool)

(assert (=> b!1423174 m!1313729))

(assert (=> b!1423174 m!1313715))

(declare-fun m!1313731 () Bool)

(assert (=> b!1423174 m!1313731))

(declare-fun m!1313733 () Bool)

(assert (=> b!1423178 m!1313733))

(declare-fun m!1313735 () Bool)

(assert (=> b!1423175 m!1313735))

(assert (=> b!1423179 m!1313715))

(assert (=> b!1423179 m!1313715))

(declare-fun m!1313737 () Bool)

(assert (=> b!1423179 m!1313737))

(assert (=> b!1423182 m!1313715))

(assert (=> b!1423182 m!1313715))

(declare-fun m!1313739 () Bool)

(assert (=> b!1423182 m!1313739))

(assert (=> b!1423182 m!1313739))

(assert (=> b!1423182 m!1313715))

(declare-fun m!1313741 () Bool)

(assert (=> b!1423182 m!1313741))

(declare-fun m!1313743 () Bool)

(assert (=> b!1423168 m!1313743))

(assert (=> b!1423168 m!1313743))

(declare-fun m!1313745 () Bool)

(assert (=> b!1423168 m!1313745))

(assert (=> b!1423168 m!1313723))

(declare-fun m!1313747 () Bool)

(assert (=> b!1423168 m!1313747))

(declare-fun m!1313749 () Bool)

(assert (=> b!1423181 m!1313749))

(declare-fun m!1313751 () Bool)

(assert (=> b!1423173 m!1313751))

(assert (=> b!1423169 m!1313715))

(assert (=> b!1423169 m!1313715))

(declare-fun m!1313753 () Bool)

(assert (=> b!1423169 m!1313753))

(declare-fun m!1313755 () Bool)

(assert (=> start!122772 m!1313755))

(declare-fun m!1313757 () Bool)

(assert (=> start!122772 m!1313757))

(declare-fun m!1313759 () Bool)

(assert (=> b!1423172 m!1313759))

(assert (=> b!1423172 m!1313759))

(declare-fun m!1313761 () Bool)

(assert (=> b!1423172 m!1313761))

(push 1)

