; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125542 () Bool)

(assert start!125542)

(declare-fun b!1469085 () Bool)

(declare-fun res!997727 () Bool)

(declare-fun e!824769 () Bool)

(assert (=> b!1469085 (=> (not res!997727) (not e!824769))))

(declare-datatypes ((array!98968 0))(
  ( (array!98969 (arr!47773 (Array (_ BitVec 32) (_ BitVec 64))) (size!48325 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98968)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98968 (_ BitVec 32)) Bool)

(assert (=> b!1469085 (= res!997727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469086 () Bool)

(declare-fun res!997726 () Bool)

(assert (=> b!1469086 (=> (not res!997726) (not e!824769))))

(declare-datatypes ((List!34352 0))(
  ( (Nil!34349) (Cons!34348 (h!35698 (_ BitVec 64)) (t!49038 List!34352)) )
))
(declare-fun arrayNoDuplicates!0 (array!98968 (_ BitVec 32) List!34352) Bool)

(assert (=> b!1469086 (= res!997726 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34349))))

(declare-fun b!1469087 () Bool)

(declare-fun e!824764 () Bool)

(declare-fun e!824765 () Bool)

(assert (=> b!1469087 (= e!824764 e!824765)))

(declare-fun res!997719 () Bool)

(assert (=> b!1469087 (=> (not res!997719) (not e!824765))))

(declare-datatypes ((SeekEntryResult!12038 0))(
  ( (MissingZero!12038 (index!50544 (_ BitVec 32))) (Found!12038 (index!50545 (_ BitVec 32))) (Intermediate!12038 (undefined!12850 Bool) (index!50546 (_ BitVec 32)) (x!132122 (_ BitVec 32))) (Undefined!12038) (MissingVacant!12038 (index!50547 (_ BitVec 32))) )
))
(declare-fun lt!642266 () SeekEntryResult!12038)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98968 (_ BitVec 32)) SeekEntryResult!12038)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469087 (= res!997719 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47773 a!2862) j!93) mask!2687) (select (arr!47773 a!2862) j!93) a!2862 mask!2687) lt!642266))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1469087 (= lt!642266 (Intermediate!12038 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469088 () Bool)

(declare-fun e!824766 () Bool)

(assert (=> b!1469088 (= e!824765 e!824766)))

(declare-fun res!997721 () Bool)

(assert (=> b!1469088 (=> (not res!997721) (not e!824766))))

(declare-fun lt!642268 () SeekEntryResult!12038)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1469088 (= res!997721 (= lt!642268 (Intermediate!12038 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!642267 () (_ BitVec 64))

(declare-fun lt!642269 () array!98968)

(assert (=> b!1469088 (= lt!642268 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642267 mask!2687) lt!642267 lt!642269 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1469088 (= lt!642267 (select (store (arr!47773 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469089 () Bool)

(declare-fun res!997720 () Bool)

(assert (=> b!1469089 (=> (not res!997720) (not e!824769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469089 (= res!997720 (validKeyInArray!0 (select (arr!47773 a!2862) j!93)))))

(declare-fun b!1469090 () Bool)

(declare-fun res!997723 () Bool)

(assert (=> b!1469090 (=> (not res!997723) (not e!824769))))

(assert (=> b!1469090 (= res!997723 (validKeyInArray!0 (select (arr!47773 a!2862) i!1006)))))

(declare-fun b!1469091 () Bool)

(declare-fun res!997725 () Bool)

(assert (=> b!1469091 (=> (not res!997725) (not e!824769))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1469091 (= res!997725 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48325 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48325 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48325 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469092 () Bool)

(declare-fun res!997729 () Bool)

(assert (=> b!1469092 (=> (not res!997729) (not e!824765))))

(assert (=> b!1469092 (= res!997729 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47773 a!2862) j!93) a!2862 mask!2687) lt!642266))))

(declare-fun b!1469093 () Bool)

(declare-fun e!824768 () Bool)

(assert (=> b!1469093 (= e!824768 (not (= lt!642268 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642267 lt!642269 mask!2687))))))

(declare-fun b!1469094 () Bool)

(declare-fun res!997722 () Bool)

(assert (=> b!1469094 (=> (not res!997722) (not e!824769))))

(assert (=> b!1469094 (= res!997722 (and (= (size!48325 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48325 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48325 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469095 () Bool)

(assert (=> b!1469095 (= e!824766 false)))

(declare-fun lt!642270 () Bool)

(assert (=> b!1469095 (= lt!642270 e!824768)))

(declare-fun c!135196 () Bool)

(assert (=> b!1469095 (= c!135196 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!997728 () Bool)

(assert (=> start!125542 (=> (not res!997728) (not e!824769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125542 (= res!997728 (validMask!0 mask!2687))))

(assert (=> start!125542 e!824769))

(assert (=> start!125542 true))

(declare-fun array_inv!37006 (array!98968) Bool)

(assert (=> start!125542 (array_inv!37006 a!2862)))

(declare-fun b!1469096 () Bool)

(assert (=> b!1469096 (= e!824769 e!824764)))

(declare-fun res!997724 () Bool)

(assert (=> b!1469096 (=> (not res!997724) (not e!824764))))

(assert (=> b!1469096 (= res!997724 (= (select (store (arr!47773 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1469096 (= lt!642269 (array!98969 (store (arr!47773 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48325 a!2862)))))

(declare-fun b!1469097 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98968 (_ BitVec 32)) SeekEntryResult!12038)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98968 (_ BitVec 32)) SeekEntryResult!12038)

(assert (=> b!1469097 (= e!824768 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642267 lt!642269 mask!2687) (seekEntryOrOpen!0 lt!642267 lt!642269 mask!2687))))))

(assert (= (and start!125542 res!997728) b!1469094))

(assert (= (and b!1469094 res!997722) b!1469090))

(assert (= (and b!1469090 res!997723) b!1469089))

(assert (= (and b!1469089 res!997720) b!1469085))

(assert (= (and b!1469085 res!997727) b!1469086))

(assert (= (and b!1469086 res!997726) b!1469091))

(assert (= (and b!1469091 res!997725) b!1469096))

(assert (= (and b!1469096 res!997724) b!1469087))

(assert (= (and b!1469087 res!997719) b!1469092))

(assert (= (and b!1469092 res!997729) b!1469088))

(assert (= (and b!1469088 res!997721) b!1469095))

(assert (= (and b!1469095 c!135196) b!1469093))

(assert (= (and b!1469095 (not c!135196)) b!1469097))

(declare-fun m!1355787 () Bool)

(assert (=> b!1469093 m!1355787))

(declare-fun m!1355789 () Bool)

(assert (=> b!1469088 m!1355789))

(assert (=> b!1469088 m!1355789))

(declare-fun m!1355791 () Bool)

(assert (=> b!1469088 m!1355791))

(declare-fun m!1355793 () Bool)

(assert (=> b!1469088 m!1355793))

(declare-fun m!1355795 () Bool)

(assert (=> b!1469088 m!1355795))

(declare-fun m!1355797 () Bool)

(assert (=> b!1469097 m!1355797))

(declare-fun m!1355799 () Bool)

(assert (=> b!1469097 m!1355799))

(declare-fun m!1355801 () Bool)

(assert (=> b!1469090 m!1355801))

(assert (=> b!1469090 m!1355801))

(declare-fun m!1355803 () Bool)

(assert (=> b!1469090 m!1355803))

(declare-fun m!1355805 () Bool)

(assert (=> b!1469085 m!1355805))

(declare-fun m!1355807 () Bool)

(assert (=> start!125542 m!1355807))

(declare-fun m!1355809 () Bool)

(assert (=> start!125542 m!1355809))

(declare-fun m!1355811 () Bool)

(assert (=> b!1469087 m!1355811))

(assert (=> b!1469087 m!1355811))

(declare-fun m!1355813 () Bool)

(assert (=> b!1469087 m!1355813))

(assert (=> b!1469087 m!1355813))

(assert (=> b!1469087 m!1355811))

(declare-fun m!1355815 () Bool)

(assert (=> b!1469087 m!1355815))

(declare-fun m!1355817 () Bool)

(assert (=> b!1469086 m!1355817))

(assert (=> b!1469092 m!1355811))

(assert (=> b!1469092 m!1355811))

(declare-fun m!1355819 () Bool)

(assert (=> b!1469092 m!1355819))

(assert (=> b!1469089 m!1355811))

(assert (=> b!1469089 m!1355811))

(declare-fun m!1355821 () Bool)

(assert (=> b!1469089 m!1355821))

(assert (=> b!1469096 m!1355793))

(declare-fun m!1355823 () Bool)

(assert (=> b!1469096 m!1355823))

(check-sat (not b!1469089) (not b!1469088) (not b!1469097) (not start!125542) (not b!1469090) (not b!1469085) (not b!1469087) (not b!1469093) (not b!1469086) (not b!1469092))
(check-sat)
