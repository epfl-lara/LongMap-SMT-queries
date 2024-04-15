; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126590 () Bool)

(assert start!126590)

(declare-fun b!1485883 () Bool)

(declare-fun res!1010480 () Bool)

(declare-fun e!832958 () Bool)

(assert (=> b!1485883 (=> (not res!1010480) (not e!832958))))

(declare-datatypes ((array!99487 0))(
  ( (array!99488 (arr!48019 (Array (_ BitVec 32) (_ BitVec 64))) (size!48571 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99487)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12284 0))(
  ( (MissingZero!12284 (index!51528 (_ BitVec 32))) (Found!12284 (index!51529 (_ BitVec 32))) (Intermediate!12284 (undefined!13096 Bool) (index!51530 (_ BitVec 32)) (x!133109 (_ BitVec 32))) (Undefined!12284) (MissingVacant!12284 (index!51531 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99487 (_ BitVec 32)) SeekEntryResult!12284)

(assert (=> b!1485883 (= res!1010480 (= (seekEntryOrOpen!0 (select (arr!48019 a!2862) j!93) a!2862 mask!2687) (Found!12284 j!93)))))

(declare-fun b!1485884 () Bool)

(declare-fun e!832957 () Bool)

(declare-fun e!832963 () Bool)

(assert (=> b!1485884 (= e!832957 e!832963)))

(declare-fun res!1010488 () Bool)

(assert (=> b!1485884 (=> (not res!1010488) (not e!832963))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1485884 (= res!1010488 (= (select (store (arr!48019 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!648107 () array!99487)

(assert (=> b!1485884 (= lt!648107 (array!99488 (store (arr!48019 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48571 a!2862)))))

(declare-fun lt!648102 () (_ BitVec 64))

(declare-fun b!1485885 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!832964 () Bool)

(declare-fun lt!648105 () SeekEntryResult!12284)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99487 (_ BitVec 32)) SeekEntryResult!12284)

(assert (=> b!1485885 (= e!832964 (= lt!648105 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648102 lt!648107 mask!2687)))))

(declare-fun b!1485886 () Bool)

(declare-fun res!1010485 () Bool)

(assert (=> b!1485886 (=> (not res!1010485) (not e!832957))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99487 (_ BitVec 32)) Bool)

(assert (=> b!1485886 (= res!1010485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1485887 () Bool)

(declare-fun res!1010492 () Bool)

(assert (=> b!1485887 (=> (not res!1010492) (not e!832957))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1485887 (= res!1010492 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48571 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48571 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48571 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1485888 () Bool)

(declare-fun res!1010484 () Bool)

(assert (=> b!1485888 (=> (not res!1010484) (not e!832958))))

(assert (=> b!1485888 (= res!1010484 (or (= (select (arr!48019 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48019 a!2862) intermediateBeforeIndex!19) (select (arr!48019 a!2862) j!93))))))

(declare-fun b!1485889 () Bool)

(declare-fun e!832960 () Bool)

(assert (=> b!1485889 (= e!832960 true)))

(declare-fun lt!648104 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485889 (= lt!648104 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1485890 () Bool)

(declare-fun e!832955 () Bool)

(declare-fun e!832959 () Bool)

(assert (=> b!1485890 (= e!832955 e!832959)))

(declare-fun res!1010486 () Bool)

(assert (=> b!1485890 (=> (not res!1010486) (not e!832959))))

(assert (=> b!1485890 (= res!1010486 (= lt!648105 (Intermediate!12284 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485890 (= lt!648105 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648102 mask!2687) lt!648102 lt!648107 mask!2687))))

(assert (=> b!1485890 (= lt!648102 (select (store (arr!48019 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1485891 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99487 (_ BitVec 32)) SeekEntryResult!12284)

(assert (=> b!1485891 (= e!832964 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648102 lt!648107 mask!2687) (seekEntryOrOpen!0 lt!648102 lt!648107 mask!2687)))))

(declare-fun b!1485893 () Bool)

(declare-fun e!832962 () Bool)

(declare-fun e!832961 () Bool)

(assert (=> b!1485893 (= e!832962 e!832961)))

(declare-fun res!1010477 () Bool)

(assert (=> b!1485893 (=> (not res!1010477) (not e!832961))))

(declare-fun lt!648106 () (_ BitVec 64))

(assert (=> b!1485893 (= res!1010477 (and (= index!646 intermediateAfterIndex!19) (= lt!648106 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1485894 () Bool)

(declare-fun res!1010478 () Bool)

(assert (=> b!1485894 (=> (not res!1010478) (not e!832957))))

(assert (=> b!1485894 (= res!1010478 (and (= (size!48571 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48571 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48571 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1485895 () Bool)

(assert (=> b!1485895 (= e!832963 e!832955)))

(declare-fun res!1010493 () Bool)

(assert (=> b!1485895 (=> (not res!1010493) (not e!832955))))

(declare-fun lt!648103 () SeekEntryResult!12284)

(assert (=> b!1485895 (= res!1010493 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48019 a!2862) j!93) mask!2687) (select (arr!48019 a!2862) j!93) a!2862 mask!2687) lt!648103))))

(assert (=> b!1485895 (= lt!648103 (Intermediate!12284 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1485896 () Bool)

(declare-fun res!1010494 () Bool)

(assert (=> b!1485896 (=> (not res!1010494) (not e!832959))))

(assert (=> b!1485896 (= res!1010494 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1485897 () Bool)

(declare-fun res!1010476 () Bool)

(assert (=> b!1485897 (=> (not res!1010476) (not e!832957))))

(declare-datatypes ((List!34598 0))(
  ( (Nil!34595) (Cons!34594 (h!35971 (_ BitVec 64)) (t!49284 List!34598)) )
))
(declare-fun arrayNoDuplicates!0 (array!99487 (_ BitVec 32) List!34598) Bool)

(assert (=> b!1485897 (= res!1010476 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34595))))

(declare-fun b!1485898 () Bool)

(declare-fun res!1010483 () Bool)

(assert (=> b!1485898 (=> (not res!1010483) (not e!832957))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1485898 (= res!1010483 (validKeyInArray!0 (select (arr!48019 a!2862) i!1006)))))

(declare-fun b!1485899 () Bool)

(assert (=> b!1485899 (= e!832959 (not e!832960))))

(declare-fun res!1010482 () Bool)

(assert (=> b!1485899 (=> res!1010482 e!832960)))

(assert (=> b!1485899 (= res!1010482 (or (and (= (select (arr!48019 a!2862) index!646) (select (store (arr!48019 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48019 a!2862) index!646) (select (arr!48019 a!2862) j!93))) (= (select (arr!48019 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485899 e!832958))

(declare-fun res!1010487 () Bool)

(assert (=> b!1485899 (=> (not res!1010487) (not e!832958))))

(assert (=> b!1485899 (= res!1010487 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49749 0))(
  ( (Unit!49750) )
))
(declare-fun lt!648101 () Unit!49749)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99487 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49749)

(assert (=> b!1485899 (= lt!648101 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1485900 () Bool)

(declare-fun res!1010489 () Bool)

(assert (=> b!1485900 (=> (not res!1010489) (not e!832955))))

(assert (=> b!1485900 (= res!1010489 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48019 a!2862) j!93) a!2862 mask!2687) lt!648103))))

(declare-fun b!1485901 () Bool)

(declare-fun res!1010490 () Bool)

(assert (=> b!1485901 (=> (not res!1010490) (not e!832957))))

(assert (=> b!1485901 (= res!1010490 (validKeyInArray!0 (select (arr!48019 a!2862) j!93)))))

(declare-fun b!1485902 () Bool)

(assert (=> b!1485902 (= e!832961 (= (seekEntryOrOpen!0 lt!648102 lt!648107 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648102 lt!648107 mask!2687)))))

(declare-fun b!1485903 () Bool)

(declare-fun res!1010491 () Bool)

(assert (=> b!1485903 (=> (not res!1010491) (not e!832959))))

(assert (=> b!1485903 (= res!1010491 e!832964)))

(declare-fun c!137230 () Bool)

(assert (=> b!1485903 (= c!137230 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1485892 () Bool)

(assert (=> b!1485892 (= e!832958 e!832962)))

(declare-fun res!1010481 () Bool)

(assert (=> b!1485892 (=> res!1010481 e!832962)))

(assert (=> b!1485892 (= res!1010481 (or (and (= (select (arr!48019 a!2862) index!646) lt!648106) (= (select (arr!48019 a!2862) index!646) (select (arr!48019 a!2862) j!93))) (= (select (arr!48019 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485892 (= lt!648106 (select (store (arr!48019 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun res!1010479 () Bool)

(assert (=> start!126590 (=> (not res!1010479) (not e!832957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126590 (= res!1010479 (validMask!0 mask!2687))))

(assert (=> start!126590 e!832957))

(assert (=> start!126590 true))

(declare-fun array_inv!37252 (array!99487) Bool)

(assert (=> start!126590 (array_inv!37252 a!2862)))

(assert (= (and start!126590 res!1010479) b!1485894))

(assert (= (and b!1485894 res!1010478) b!1485898))

(assert (= (and b!1485898 res!1010483) b!1485901))

(assert (= (and b!1485901 res!1010490) b!1485886))

(assert (= (and b!1485886 res!1010485) b!1485897))

(assert (= (and b!1485897 res!1010476) b!1485887))

(assert (= (and b!1485887 res!1010492) b!1485884))

(assert (= (and b!1485884 res!1010488) b!1485895))

(assert (= (and b!1485895 res!1010493) b!1485900))

(assert (= (and b!1485900 res!1010489) b!1485890))

(assert (= (and b!1485890 res!1010486) b!1485903))

(assert (= (and b!1485903 c!137230) b!1485885))

(assert (= (and b!1485903 (not c!137230)) b!1485891))

(assert (= (and b!1485903 res!1010491) b!1485896))

(assert (= (and b!1485896 res!1010494) b!1485899))

(assert (= (and b!1485899 res!1010487) b!1485883))

(assert (= (and b!1485883 res!1010480) b!1485888))

(assert (= (and b!1485888 res!1010484) b!1485892))

(assert (= (and b!1485892 (not res!1010481)) b!1485893))

(assert (= (and b!1485893 res!1010477) b!1485902))

(assert (= (and b!1485899 (not res!1010482)) b!1485889))

(declare-fun m!1370259 () Bool)

(assert (=> b!1485892 m!1370259))

(declare-fun m!1370261 () Bool)

(assert (=> b!1485892 m!1370261))

(declare-fun m!1370263 () Bool)

(assert (=> b!1485892 m!1370263))

(declare-fun m!1370265 () Bool)

(assert (=> b!1485892 m!1370265))

(declare-fun m!1370267 () Bool)

(assert (=> b!1485886 m!1370267))

(declare-fun m!1370269 () Bool)

(assert (=> b!1485888 m!1370269))

(assert (=> b!1485888 m!1370261))

(declare-fun m!1370271 () Bool)

(assert (=> b!1485902 m!1370271))

(declare-fun m!1370273 () Bool)

(assert (=> b!1485902 m!1370273))

(assert (=> b!1485901 m!1370261))

(assert (=> b!1485901 m!1370261))

(declare-fun m!1370275 () Bool)

(assert (=> b!1485901 m!1370275))

(assert (=> b!1485883 m!1370261))

(assert (=> b!1485883 m!1370261))

(declare-fun m!1370277 () Bool)

(assert (=> b!1485883 m!1370277))

(declare-fun m!1370279 () Bool)

(assert (=> b!1485899 m!1370279))

(assert (=> b!1485899 m!1370263))

(assert (=> b!1485899 m!1370265))

(assert (=> b!1485899 m!1370259))

(declare-fun m!1370281 () Bool)

(assert (=> b!1485899 m!1370281))

(assert (=> b!1485899 m!1370261))

(declare-fun m!1370283 () Bool)

(assert (=> b!1485885 m!1370283))

(assert (=> b!1485895 m!1370261))

(assert (=> b!1485895 m!1370261))

(declare-fun m!1370285 () Bool)

(assert (=> b!1485895 m!1370285))

(assert (=> b!1485895 m!1370285))

(assert (=> b!1485895 m!1370261))

(declare-fun m!1370287 () Bool)

(assert (=> b!1485895 m!1370287))

(declare-fun m!1370289 () Bool)

(assert (=> b!1485897 m!1370289))

(declare-fun m!1370291 () Bool)

(assert (=> start!126590 m!1370291))

(declare-fun m!1370293 () Bool)

(assert (=> start!126590 m!1370293))

(declare-fun m!1370295 () Bool)

(assert (=> b!1485890 m!1370295))

(assert (=> b!1485890 m!1370295))

(declare-fun m!1370297 () Bool)

(assert (=> b!1485890 m!1370297))

(assert (=> b!1485890 m!1370263))

(declare-fun m!1370299 () Bool)

(assert (=> b!1485890 m!1370299))

(assert (=> b!1485884 m!1370263))

(declare-fun m!1370301 () Bool)

(assert (=> b!1485884 m!1370301))

(assert (=> b!1485891 m!1370273))

(assert (=> b!1485891 m!1370271))

(declare-fun m!1370303 () Bool)

(assert (=> b!1485898 m!1370303))

(assert (=> b!1485898 m!1370303))

(declare-fun m!1370305 () Bool)

(assert (=> b!1485898 m!1370305))

(declare-fun m!1370307 () Bool)

(assert (=> b!1485889 m!1370307))

(assert (=> b!1485900 m!1370261))

(assert (=> b!1485900 m!1370261))

(declare-fun m!1370309 () Bool)

(assert (=> b!1485900 m!1370309))

(check-sat (not b!1485889) (not b!1485897) (not b!1485895) (not b!1485886) (not b!1485890) (not b!1485900) (not b!1485901) (not b!1485898) (not b!1485883) (not b!1485885) (not b!1485899) (not b!1485902) (not start!126590) (not b!1485891))
(check-sat)
