; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124212 () Bool)

(assert start!124212)

(declare-fun res!970445 () Bool)

(declare-fun e!811083 () Bool)

(assert (=> start!124212 (=> (not res!970445) (not e!811083))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124212 (= res!970445 (validMask!0 mask!2687))))

(assert (=> start!124212 e!811083))

(assert (=> start!124212 true))

(declare-datatypes ((array!97777 0))(
  ( (array!97778 (arr!47181 (Array (_ BitVec 32) (_ BitVec 64))) (size!47731 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97777)

(declare-fun array_inv!36209 (array!97777) Bool)

(assert (=> start!124212 (array_inv!36209 a!2862)))

(declare-fun b!1437664 () Bool)

(declare-fun e!811085 () Bool)

(assert (=> b!1437664 (= e!811083 e!811085)))

(declare-fun res!970448 () Bool)

(assert (=> b!1437664 (=> (not res!970448) (not e!811085))))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11433 0))(
  ( (MissingZero!11433 (index!48124 (_ BitVec 32))) (Found!11433 (index!48125 (_ BitVec 32))) (Intermediate!11433 (undefined!12245 Bool) (index!48126 (_ BitVec 32)) (x!129856 (_ BitVec 32))) (Undefined!11433) (MissingVacant!11433 (index!48127 (_ BitVec 32))) )
))
(declare-fun lt!632363 () SeekEntryResult!11433)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97777 (_ BitVec 32)) SeekEntryResult!11433)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437664 (= res!970448 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47181 a!2862) j!93) mask!2687) (select (arr!47181 a!2862) j!93) a!2862 mask!2687) lt!632363))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1437664 (= lt!632363 (Intermediate!11433 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1437665 () Bool)

(declare-fun res!970444 () Bool)

(assert (=> b!1437665 (=> (not res!970444) (not e!811083))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437665 (= res!970444 (validKeyInArray!0 (select (arr!47181 a!2862) i!1006)))))

(declare-fun b!1437666 () Bool)

(declare-fun res!970450 () Bool)

(assert (=> b!1437666 (=> (not res!970450) (not e!811085))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1437666 (= res!970450 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47181 a!2862) j!93) a!2862 mask!2687) lt!632363))))

(declare-fun b!1437667 () Bool)

(declare-fun res!970447 () Bool)

(assert (=> b!1437667 (=> (not res!970447) (not e!811083))))

(assert (=> b!1437667 (= res!970447 (validKeyInArray!0 (select (arr!47181 a!2862) j!93)))))

(declare-fun b!1437668 () Bool)

(declare-fun res!970443 () Bool)

(assert (=> b!1437668 (=> (not res!970443) (not e!811083))))

(assert (=> b!1437668 (= res!970443 (and (= (size!47731 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47731 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47731 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437669 () Bool)

(declare-fun res!970449 () Bool)

(assert (=> b!1437669 (=> (not res!970449) (not e!811083))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437669 (= res!970449 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47731 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47731 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47731 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47181 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437670 () Bool)

(declare-fun res!970446 () Bool)

(assert (=> b!1437670 (=> (not res!970446) (not e!811083))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97777 (_ BitVec 32)) Bool)

(assert (=> b!1437670 (= res!970446 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437671 () Bool)

(declare-fun res!970442 () Bool)

(assert (=> b!1437671 (=> (not res!970442) (not e!811083))))

(declare-datatypes ((List!33682 0))(
  ( (Nil!33679) (Cons!33678 (h!35019 (_ BitVec 64)) (t!48376 List!33682)) )
))
(declare-fun arrayNoDuplicates!0 (array!97777 (_ BitVec 32) List!33682) Bool)

(assert (=> b!1437671 (= res!970442 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33679))))

(declare-fun b!1437672 () Bool)

(assert (=> b!1437672 (= e!811085 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!632364 () (_ BitVec 32))

(assert (=> b!1437672 (= lt!632364 (toIndex!0 (select (store (arr!47181 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(assert (= (and start!124212 res!970445) b!1437668))

(assert (= (and b!1437668 res!970443) b!1437665))

(assert (= (and b!1437665 res!970444) b!1437667))

(assert (= (and b!1437667 res!970447) b!1437670))

(assert (= (and b!1437670 res!970446) b!1437671))

(assert (= (and b!1437671 res!970442) b!1437669))

(assert (= (and b!1437669 res!970449) b!1437664))

(assert (= (and b!1437664 res!970448) b!1437666))

(assert (= (and b!1437666 res!970450) b!1437672))

(declare-fun m!1326901 () Bool)

(assert (=> b!1437666 m!1326901))

(assert (=> b!1437666 m!1326901))

(declare-fun m!1326903 () Bool)

(assert (=> b!1437666 m!1326903))

(assert (=> b!1437667 m!1326901))

(assert (=> b!1437667 m!1326901))

(declare-fun m!1326905 () Bool)

(assert (=> b!1437667 m!1326905))

(assert (=> b!1437664 m!1326901))

(assert (=> b!1437664 m!1326901))

(declare-fun m!1326907 () Bool)

(assert (=> b!1437664 m!1326907))

(assert (=> b!1437664 m!1326907))

(assert (=> b!1437664 m!1326901))

(declare-fun m!1326909 () Bool)

(assert (=> b!1437664 m!1326909))

(declare-fun m!1326911 () Bool)

(assert (=> b!1437671 m!1326911))

(declare-fun m!1326913 () Bool)

(assert (=> b!1437672 m!1326913))

(declare-fun m!1326915 () Bool)

(assert (=> b!1437672 m!1326915))

(assert (=> b!1437672 m!1326915))

(declare-fun m!1326917 () Bool)

(assert (=> b!1437672 m!1326917))

(assert (=> b!1437669 m!1326913))

(declare-fun m!1326919 () Bool)

(assert (=> b!1437669 m!1326919))

(declare-fun m!1326921 () Bool)

(assert (=> start!124212 m!1326921))

(declare-fun m!1326923 () Bool)

(assert (=> start!124212 m!1326923))

(declare-fun m!1326925 () Bool)

(assert (=> b!1437665 m!1326925))

(assert (=> b!1437665 m!1326925))

(declare-fun m!1326927 () Bool)

(assert (=> b!1437665 m!1326927))

(declare-fun m!1326929 () Bool)

(assert (=> b!1437670 m!1326929))

(check-sat (not start!124212) (not b!1437670) (not b!1437664) (not b!1437672) (not b!1437665) (not b!1437671) (not b!1437666) (not b!1437667))
(check-sat)
