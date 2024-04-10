; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126860 () Bool)

(assert start!126860)

(declare-fun b!1489992 () Bool)

(declare-fun e!834995 () Bool)

(declare-fun e!834998 () Bool)

(assert (=> b!1489992 (= e!834995 e!834998)))

(declare-fun res!1013337 () Bool)

(assert (=> b!1489992 (=> (not res!1013337) (not e!834998))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99633 0))(
  ( (array!99634 (arr!48088 (Array (_ BitVec 32) (_ BitVec 64))) (size!48638 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99633)

(assert (=> b!1489992 (= res!1013337 (= (select (store (arr!48088 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!649782 () array!99633)

(assert (=> b!1489992 (= lt!649782 (array!99634 (store (arr!48088 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48638 a!2862)))))

(declare-fun b!1489993 () Bool)

(declare-fun e!834996 () Bool)

(declare-fun e!834994 () Bool)

(assert (=> b!1489993 (= e!834996 e!834994)))

(declare-fun res!1013345 () Bool)

(assert (=> b!1489993 (=> (not res!1013345) (not e!834994))))

(declare-datatypes ((SeekEntryResult!12328 0))(
  ( (MissingZero!12328 (index!51704 (_ BitVec 32))) (Found!12328 (index!51705 (_ BitVec 32))) (Intermediate!12328 (undefined!13140 Bool) (index!51706 (_ BitVec 32)) (x!133296 (_ BitVec 32))) (Undefined!12328) (MissingVacant!12328 (index!51707 (_ BitVec 32))) )
))
(declare-fun lt!649778 () SeekEntryResult!12328)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1489993 (= res!1013345 (= lt!649778 (Intermediate!12328 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!649779 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99633 (_ BitVec 32)) SeekEntryResult!12328)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489993 (= lt!649778 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649779 mask!2687) lt!649779 lt!649782 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1489993 (= lt!649779 (select (store (arr!48088 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1013353 () Bool)

(assert (=> start!126860 (=> (not res!1013353) (not e!834995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126860 (= res!1013353 (validMask!0 mask!2687))))

(assert (=> start!126860 e!834995))

(assert (=> start!126860 true))

(declare-fun array_inv!37116 (array!99633) Bool)

(assert (=> start!126860 (array_inv!37116 a!2862)))

(declare-fun b!1489994 () Bool)

(declare-fun res!1013349 () Bool)

(assert (=> b!1489994 (=> (not res!1013349) (not e!834994))))

(declare-fun e!834997 () Bool)

(assert (=> b!1489994 (= res!1013349 e!834997)))

(declare-fun c!137855 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1489994 (= c!137855 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!649777 () SeekEntryResult!12328)

(declare-fun b!1489995 () Bool)

(declare-fun lt!649780 () (_ BitVec 32))

(declare-fun e!834992 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99633 (_ BitVec 32)) SeekEntryResult!12328)

(assert (=> b!1489995 (= e!834992 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649780 intermediateAfterIndex!19 lt!649779 lt!649782 mask!2687) lt!649777)))))

(declare-fun b!1489996 () Bool)

(declare-fun res!1013341 () Bool)

(assert (=> b!1489996 (=> (not res!1013341) (not e!834995))))

(declare-datatypes ((List!34589 0))(
  ( (Nil!34586) (Cons!34585 (h!35968 (_ BitVec 64)) (t!49283 List!34589)) )
))
(declare-fun arrayNoDuplicates!0 (array!99633 (_ BitVec 32) List!34589) Bool)

(assert (=> b!1489996 (= res!1013341 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34586))))

(declare-fun b!1489997 () Bool)

(declare-fun res!1013346 () Bool)

(assert (=> b!1489997 (=> (not res!1013346) (not e!834994))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1489997 (= res!1013346 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1489998 () Bool)

(assert (=> b!1489998 (= e!834992 (not (= lt!649778 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649780 lt!649779 lt!649782 mask!2687))))))

(declare-fun b!1489999 () Bool)

(declare-fun res!1013352 () Bool)

(assert (=> b!1489999 (=> (not res!1013352) (not e!834995))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489999 (= res!1013352 (validKeyInArray!0 (select (arr!48088 a!2862) i!1006)))))

(declare-fun b!1490000 () Bool)

(declare-fun res!1013344 () Bool)

(declare-fun e!834990 () Bool)

(assert (=> b!1490000 (=> res!1013344 e!834990)))

(declare-fun lt!649783 () SeekEntryResult!12328)

(assert (=> b!1490000 (= res!1013344 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649780 (select (arr!48088 a!2862) j!93) a!2862 mask!2687) lt!649783)))))

(declare-fun b!1490001 () Bool)

(assert (=> b!1490001 (= e!834990 true)))

(declare-fun lt!649785 () SeekEntryResult!12328)

(assert (=> b!1490001 (= lt!649785 lt!649777)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49996 0))(
  ( (Unit!49997) )
))
(declare-fun lt!649784 () Unit!49996)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49996)

(assert (=> b!1490001 (= lt!649784 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!649780 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1490002 () Bool)

(declare-fun res!1013342 () Bool)

(assert (=> b!1490002 (=> res!1013342 e!834990)))

(assert (=> b!1490002 (= res!1013342 e!834992)))

(declare-fun c!137856 () Bool)

(assert (=> b!1490002 (= c!137856 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1490003 () Bool)

(declare-fun e!834993 () Bool)

(assert (=> b!1490003 (= e!834993 e!834990)))

(declare-fun res!1013350 () Bool)

(assert (=> b!1490003 (=> res!1013350 e!834990)))

(assert (=> b!1490003 (= res!1013350 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649780 #b00000000000000000000000000000000) (bvsge lt!649780 (size!48638 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490003 (= lt!649780 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1490003 (= lt!649777 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649779 lt!649782 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99633 (_ BitVec 32)) SeekEntryResult!12328)

(assert (=> b!1490003 (= lt!649777 (seekEntryOrOpen!0 lt!649779 lt!649782 mask!2687))))

(declare-fun b!1490004 () Bool)

(declare-fun res!1013339 () Bool)

(assert (=> b!1490004 (=> (not res!1013339) (not e!834995))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99633 (_ BitVec 32)) Bool)

(assert (=> b!1490004 (= res!1013339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490005 () Bool)

(declare-fun res!1013348 () Bool)

(assert (=> b!1490005 (=> (not res!1013348) (not e!834995))))

(assert (=> b!1490005 (= res!1013348 (and (= (size!48638 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48638 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48638 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490006 () Bool)

(declare-fun res!1013343 () Bool)

(assert (=> b!1490006 (=> (not res!1013343) (not e!834996))))

(assert (=> b!1490006 (= res!1013343 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48088 a!2862) j!93) a!2862 mask!2687) lt!649783))))

(declare-fun b!1490007 () Bool)

(declare-fun res!1013336 () Bool)

(assert (=> b!1490007 (=> (not res!1013336) (not e!834995))))

(assert (=> b!1490007 (= res!1013336 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48638 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48638 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48638 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1490008 () Bool)

(assert (=> b!1490008 (= e!834997 (= lt!649778 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649779 lt!649782 mask!2687)))))

(declare-fun b!1490009 () Bool)

(declare-fun res!1013338 () Bool)

(assert (=> b!1490009 (=> (not res!1013338) (not e!834995))))

(assert (=> b!1490009 (= res!1013338 (validKeyInArray!0 (select (arr!48088 a!2862) j!93)))))

(declare-fun b!1490010 () Bool)

(assert (=> b!1490010 (= e!834997 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649779 lt!649782 mask!2687) (seekEntryOrOpen!0 lt!649779 lt!649782 mask!2687)))))

(declare-fun b!1490011 () Bool)

(assert (=> b!1490011 (= e!834994 (not e!834993))))

(declare-fun res!1013347 () Bool)

(assert (=> b!1490011 (=> res!1013347 e!834993)))

(assert (=> b!1490011 (= res!1013347 (or (and (= (select (arr!48088 a!2862) index!646) (select (store (arr!48088 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48088 a!2862) index!646) (select (arr!48088 a!2862) j!93))) (= (select (arr!48088 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1490011 (and (= lt!649785 (Found!12328 j!93)) (or (= (select (arr!48088 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48088 a!2862) intermediateBeforeIndex!19) (select (arr!48088 a!2862) j!93))) (let ((bdg!54758 (select (store (arr!48088 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48088 a!2862) index!646) bdg!54758) (= (select (arr!48088 a!2862) index!646) (select (arr!48088 a!2862) j!93))) (= (select (arr!48088 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54758 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1490011 (= lt!649785 (seekEntryOrOpen!0 (select (arr!48088 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1490011 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!649781 () Unit!49996)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49996)

(assert (=> b!1490011 (= lt!649781 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490012 () Bool)

(declare-fun res!1013351 () Bool)

(assert (=> b!1490012 (=> res!1013351 e!834990)))

(assert (=> b!1490012 (= res!1013351 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1490013 () Bool)

(assert (=> b!1490013 (= e!834998 e!834996)))

(declare-fun res!1013340 () Bool)

(assert (=> b!1490013 (=> (not res!1013340) (not e!834996))))

(assert (=> b!1490013 (= res!1013340 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48088 a!2862) j!93) mask!2687) (select (arr!48088 a!2862) j!93) a!2862 mask!2687) lt!649783))))

(assert (=> b!1490013 (= lt!649783 (Intermediate!12328 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!126860 res!1013353) b!1490005))

(assert (= (and b!1490005 res!1013348) b!1489999))

(assert (= (and b!1489999 res!1013352) b!1490009))

(assert (= (and b!1490009 res!1013338) b!1490004))

(assert (= (and b!1490004 res!1013339) b!1489996))

(assert (= (and b!1489996 res!1013341) b!1490007))

(assert (= (and b!1490007 res!1013336) b!1489992))

(assert (= (and b!1489992 res!1013337) b!1490013))

(assert (= (and b!1490013 res!1013340) b!1490006))

(assert (= (and b!1490006 res!1013343) b!1489993))

(assert (= (and b!1489993 res!1013345) b!1489994))

(assert (= (and b!1489994 c!137855) b!1490008))

(assert (= (and b!1489994 (not c!137855)) b!1490010))

(assert (= (and b!1489994 res!1013349) b!1489997))

(assert (= (and b!1489997 res!1013346) b!1490011))

(assert (= (and b!1490011 (not res!1013347)) b!1490003))

(assert (= (and b!1490003 (not res!1013350)) b!1490000))

(assert (= (and b!1490000 (not res!1013344)) b!1490002))

(assert (= (and b!1490002 c!137856) b!1489998))

(assert (= (and b!1490002 (not c!137856)) b!1489995))

(assert (= (and b!1490002 (not res!1013342)) b!1490012))

(assert (= (and b!1490012 (not res!1013351)) b!1490001))

(declare-fun m!1374175 () Bool)

(assert (=> b!1490001 m!1374175))

(declare-fun m!1374177 () Bool)

(assert (=> b!1490010 m!1374177))

(declare-fun m!1374179 () Bool)

(assert (=> b!1490010 m!1374179))

(declare-fun m!1374181 () Bool)

(assert (=> b!1489999 m!1374181))

(assert (=> b!1489999 m!1374181))

(declare-fun m!1374183 () Bool)

(assert (=> b!1489999 m!1374183))

(declare-fun m!1374185 () Bool)

(assert (=> start!126860 m!1374185))

(declare-fun m!1374187 () Bool)

(assert (=> start!126860 m!1374187))

(declare-fun m!1374189 () Bool)

(assert (=> b!1490011 m!1374189))

(declare-fun m!1374191 () Bool)

(assert (=> b!1490011 m!1374191))

(declare-fun m!1374193 () Bool)

(assert (=> b!1490011 m!1374193))

(declare-fun m!1374195 () Bool)

(assert (=> b!1490011 m!1374195))

(declare-fun m!1374197 () Bool)

(assert (=> b!1490011 m!1374197))

(declare-fun m!1374199 () Bool)

(assert (=> b!1490011 m!1374199))

(declare-fun m!1374201 () Bool)

(assert (=> b!1490011 m!1374201))

(declare-fun m!1374203 () Bool)

(assert (=> b!1490011 m!1374203))

(assert (=> b!1490011 m!1374199))

(declare-fun m!1374205 () Bool)

(assert (=> b!1489996 m!1374205))

(assert (=> b!1490006 m!1374199))

(assert (=> b!1490006 m!1374199))

(declare-fun m!1374207 () Bool)

(assert (=> b!1490006 m!1374207))

(declare-fun m!1374209 () Bool)

(assert (=> b!1490003 m!1374209))

(assert (=> b!1490003 m!1374177))

(assert (=> b!1490003 m!1374179))

(assert (=> b!1490013 m!1374199))

(assert (=> b!1490013 m!1374199))

(declare-fun m!1374211 () Bool)

(assert (=> b!1490013 m!1374211))

(assert (=> b!1490013 m!1374211))

(assert (=> b!1490013 m!1374199))

(declare-fun m!1374213 () Bool)

(assert (=> b!1490013 m!1374213))

(declare-fun m!1374215 () Bool)

(assert (=> b!1489998 m!1374215))

(assert (=> b!1489992 m!1374191))

(declare-fun m!1374217 () Bool)

(assert (=> b!1489992 m!1374217))

(assert (=> b!1490009 m!1374199))

(assert (=> b!1490009 m!1374199))

(declare-fun m!1374219 () Bool)

(assert (=> b!1490009 m!1374219))

(declare-fun m!1374221 () Bool)

(assert (=> b!1490008 m!1374221))

(declare-fun m!1374223 () Bool)

(assert (=> b!1489993 m!1374223))

(assert (=> b!1489993 m!1374223))

(declare-fun m!1374225 () Bool)

(assert (=> b!1489993 m!1374225))

(assert (=> b!1489993 m!1374191))

(declare-fun m!1374227 () Bool)

(assert (=> b!1489993 m!1374227))

(declare-fun m!1374229 () Bool)

(assert (=> b!1489995 m!1374229))

(assert (=> b!1490000 m!1374199))

(assert (=> b!1490000 m!1374199))

(declare-fun m!1374231 () Bool)

(assert (=> b!1490000 m!1374231))

(declare-fun m!1374233 () Bool)

(assert (=> b!1490004 m!1374233))

(push 1)

