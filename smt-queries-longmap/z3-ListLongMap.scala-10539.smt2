; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124506 () Bool)

(assert start!124506)

(declare-fun b!1439659 () Bool)

(declare-fun res!971507 () Bool)

(declare-fun e!812207 () Bool)

(assert (=> b!1439659 (=> (not res!971507) (not e!812207))))

(declare-datatypes ((array!97927 0))(
  ( (array!97928 (arr!47251 (Array (_ BitVec 32) (_ BitVec 64))) (size!47802 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97927)

(declare-datatypes ((List!33739 0))(
  ( (Nil!33736) (Cons!33735 (h!35090 (_ BitVec 64)) (t!48425 List!33739)) )
))
(declare-fun arrayNoDuplicates!0 (array!97927 (_ BitVec 32) List!33739) Bool)

(assert (=> b!1439659 (= res!971507 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33736))))

(declare-fun b!1439660 () Bool)

(declare-fun res!971508 () Bool)

(assert (=> b!1439660 (=> (not res!971508) (not e!812207))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439660 (= res!971508 (validKeyInArray!0 (select (arr!47251 a!2862) j!93)))))

(declare-fun b!1439661 () Bool)

(declare-fun res!971510 () Bool)

(assert (=> b!1439661 (=> (not res!971510) (not e!812207))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1439661 (= res!971510 (validKeyInArray!0 (select (arr!47251 a!2862) i!1006)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!812206 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1439662 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1439662 (= e!812206 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsgt mask!2687 #b00111111111111111111111111111111)))))

(declare-fun b!1439663 () Bool)

(declare-fun res!971512 () Bool)

(assert (=> b!1439663 (=> (not res!971512) (not e!812207))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1439663 (= res!971512 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47802 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47802 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47802 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439664 () Bool)

(assert (=> b!1439664 (= e!812207 e!812206)))

(declare-fun res!971509 () Bool)

(assert (=> b!1439664 (=> (not res!971509) (not e!812206))))

(declare-datatypes ((SeekEntryResult!11400 0))(
  ( (MissingZero!11400 (index!47992 (_ BitVec 32))) (Found!11400 (index!47993 (_ BitVec 32))) (Intermediate!11400 (undefined!12212 Bool) (index!47994 (_ BitVec 32)) (x!129901 (_ BitVec 32))) (Undefined!11400) (MissingVacant!11400 (index!47995 (_ BitVec 32))) )
))
(declare-fun lt!633007 () SeekEntryResult!11400)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97927 (_ BitVec 32)) SeekEntryResult!11400)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439664 (= res!971509 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47251 a!2862) j!93) mask!2687) (select (arr!47251 a!2862) j!93) a!2862 mask!2687) lt!633007))))

(assert (=> b!1439664 (= lt!633007 (Intermediate!11400 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!971516 () Bool)

(assert (=> start!124506 (=> (not res!971516) (not e!812207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124506 (= res!971516 (validMask!0 mask!2687))))

(assert (=> start!124506 e!812207))

(assert (=> start!124506 true))

(declare-fun array_inv!36532 (array!97927) Bool)

(assert (=> start!124506 (array_inv!36532 a!2862)))

(declare-fun b!1439665 () Bool)

(declare-fun res!971514 () Bool)

(assert (=> b!1439665 (=> (not res!971514) (not e!812207))))

(assert (=> b!1439665 (= res!971514 (and (= (size!47802 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47802 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47802 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439666 () Bool)

(declare-fun res!971515 () Bool)

(assert (=> b!1439666 (=> (not res!971515) (not e!812206))))

(assert (=> b!1439666 (= res!971515 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97928 (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47802 a!2862)) mask!2687) (Intermediate!11400 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1439667 () Bool)

(declare-fun res!971513 () Bool)

(assert (=> b!1439667 (=> (not res!971513) (not e!812207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97927 (_ BitVec 32)) Bool)

(assert (=> b!1439667 (= res!971513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439668 () Bool)

(declare-fun res!971511 () Bool)

(assert (=> b!1439668 (=> (not res!971511) (not e!812206))))

(assert (=> b!1439668 (= res!971511 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47251 a!2862) j!93) a!2862 mask!2687) lt!633007))))

(assert (= (and start!124506 res!971516) b!1439665))

(assert (= (and b!1439665 res!971514) b!1439661))

(assert (= (and b!1439661 res!971510) b!1439660))

(assert (= (and b!1439660 res!971508) b!1439667))

(assert (= (and b!1439667 res!971513) b!1439659))

(assert (= (and b!1439659 res!971507) b!1439663))

(assert (= (and b!1439663 res!971512) b!1439664))

(assert (= (and b!1439664 res!971509) b!1439668))

(assert (= (and b!1439668 res!971511) b!1439666))

(assert (= (and b!1439666 res!971515) b!1439662))

(declare-fun m!1328959 () Bool)

(assert (=> b!1439661 m!1328959))

(assert (=> b!1439661 m!1328959))

(declare-fun m!1328961 () Bool)

(assert (=> b!1439661 m!1328961))

(declare-fun m!1328963 () Bool)

(assert (=> b!1439668 m!1328963))

(assert (=> b!1439668 m!1328963))

(declare-fun m!1328965 () Bool)

(assert (=> b!1439668 m!1328965))

(declare-fun m!1328967 () Bool)

(assert (=> start!124506 m!1328967))

(declare-fun m!1328969 () Bool)

(assert (=> start!124506 m!1328969))

(declare-fun m!1328971 () Bool)

(assert (=> b!1439667 m!1328971))

(declare-fun m!1328973 () Bool)

(assert (=> b!1439666 m!1328973))

(declare-fun m!1328975 () Bool)

(assert (=> b!1439666 m!1328975))

(assert (=> b!1439666 m!1328975))

(declare-fun m!1328977 () Bool)

(assert (=> b!1439666 m!1328977))

(assert (=> b!1439666 m!1328977))

(assert (=> b!1439666 m!1328975))

(declare-fun m!1328979 () Bool)

(assert (=> b!1439666 m!1328979))

(assert (=> b!1439663 m!1328973))

(declare-fun m!1328981 () Bool)

(assert (=> b!1439663 m!1328981))

(assert (=> b!1439664 m!1328963))

(assert (=> b!1439664 m!1328963))

(declare-fun m!1328983 () Bool)

(assert (=> b!1439664 m!1328983))

(assert (=> b!1439664 m!1328983))

(assert (=> b!1439664 m!1328963))

(declare-fun m!1328985 () Bool)

(assert (=> b!1439664 m!1328985))

(assert (=> b!1439660 m!1328963))

(assert (=> b!1439660 m!1328963))

(declare-fun m!1328987 () Bool)

(assert (=> b!1439660 m!1328987))

(declare-fun m!1328989 () Bool)

(assert (=> b!1439659 m!1328989))

(check-sat (not b!1439667) (not b!1439664) (not b!1439661) (not b!1439659) (not b!1439660) (not b!1439668) (not start!124506) (not b!1439666))
(check-sat)
(get-model)

(declare-fun b!1439747 () Bool)

(declare-fun e!812240 () SeekEntryResult!11400)

(declare-fun e!812238 () SeekEntryResult!11400)

(assert (=> b!1439747 (= e!812240 e!812238)))

(declare-fun c!133599 () Bool)

(declare-fun lt!633019 () (_ BitVec 64))

(assert (=> b!1439747 (= c!133599 (or (= lt!633019 (select (arr!47251 a!2862) j!93)) (= (bvadd lt!633019 lt!633019) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439749 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439749 (= e!812238 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47251 a!2862) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (arr!47251 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1439750 () Bool)

(declare-fun lt!633018 () SeekEntryResult!11400)

(assert (=> b!1439750 (and (bvsge (index!47994 lt!633018) #b00000000000000000000000000000000) (bvslt (index!47994 lt!633018) (size!47802 a!2862)))))

(declare-fun res!971583 () Bool)

(assert (=> b!1439750 (= res!971583 (= (select (arr!47251 a!2862) (index!47994 lt!633018)) (select (arr!47251 a!2862) j!93)))))

(declare-fun e!812239 () Bool)

(assert (=> b!1439750 (=> res!971583 e!812239)))

(declare-fun e!812241 () Bool)

(assert (=> b!1439750 (= e!812241 e!812239)))

(declare-fun b!1439751 () Bool)

(assert (=> b!1439751 (= e!812240 (Intermediate!11400 true (toIndex!0 (select (arr!47251 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1439752 () Bool)

(assert (=> b!1439752 (and (bvsge (index!47994 lt!633018) #b00000000000000000000000000000000) (bvslt (index!47994 lt!633018) (size!47802 a!2862)))))

(assert (=> b!1439752 (= e!812239 (= (select (arr!47251 a!2862) (index!47994 lt!633018)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1439753 () Bool)

(declare-fun e!812237 () Bool)

(assert (=> b!1439753 (= e!812237 e!812241)))

(declare-fun res!971585 () Bool)

(get-info :version)

(assert (=> b!1439753 (= res!971585 (and ((_ is Intermediate!11400) lt!633018) (not (undefined!12212 lt!633018)) (bvslt (x!129901 lt!633018) #b01111111111111111111111111111110) (bvsge (x!129901 lt!633018) #b00000000000000000000000000000000) (bvsge (x!129901 lt!633018) #b00000000000000000000000000000000)))))

(assert (=> b!1439753 (=> (not res!971585) (not e!812241))))

(declare-fun b!1439754 () Bool)

(assert (=> b!1439754 (= e!812237 (bvsge (x!129901 lt!633018) #b01111111111111111111111111111110))))

(declare-fun b!1439755 () Bool)

(assert (=> b!1439755 (= e!812238 (Intermediate!11400 false (toIndex!0 (select (arr!47251 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1439748 () Bool)

(assert (=> b!1439748 (and (bvsge (index!47994 lt!633018) #b00000000000000000000000000000000) (bvslt (index!47994 lt!633018) (size!47802 a!2862)))))

(declare-fun res!971584 () Bool)

(assert (=> b!1439748 (= res!971584 (= (select (arr!47251 a!2862) (index!47994 lt!633018)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1439748 (=> res!971584 e!812239)))

(declare-fun d!155149 () Bool)

(assert (=> d!155149 e!812237))

(declare-fun c!133598 () Bool)

(assert (=> d!155149 (= c!133598 (and ((_ is Intermediate!11400) lt!633018) (undefined!12212 lt!633018)))))

(assert (=> d!155149 (= lt!633018 e!812240)))

(declare-fun c!133600 () Bool)

(assert (=> d!155149 (= c!133600 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155149 (= lt!633019 (select (arr!47251 a!2862) (toIndex!0 (select (arr!47251 a!2862) j!93) mask!2687)))))

(assert (=> d!155149 (validMask!0 mask!2687)))

(assert (=> d!155149 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47251 a!2862) j!93) mask!2687) (select (arr!47251 a!2862) j!93) a!2862 mask!2687) lt!633018)))

(assert (= (and d!155149 c!133600) b!1439751))

(assert (= (and d!155149 (not c!133600)) b!1439747))

(assert (= (and b!1439747 c!133599) b!1439755))

(assert (= (and b!1439747 (not c!133599)) b!1439749))

(assert (= (and d!155149 c!133598) b!1439754))

(assert (= (and d!155149 (not c!133598)) b!1439753))

(assert (= (and b!1439753 res!971585) b!1439750))

(assert (= (and b!1439750 (not res!971583)) b!1439748))

(assert (= (and b!1439748 (not res!971584)) b!1439752))

(declare-fun m!1329055 () Bool)

(assert (=> b!1439752 m!1329055))

(assert (=> b!1439750 m!1329055))

(assert (=> b!1439748 m!1329055))

(assert (=> b!1439749 m!1328983))

(declare-fun m!1329057 () Bool)

(assert (=> b!1439749 m!1329057))

(assert (=> b!1439749 m!1329057))

(assert (=> b!1439749 m!1328963))

(declare-fun m!1329059 () Bool)

(assert (=> b!1439749 m!1329059))

(assert (=> d!155149 m!1328983))

(declare-fun m!1329061 () Bool)

(assert (=> d!155149 m!1329061))

(assert (=> d!155149 m!1328967))

(assert (=> b!1439664 d!155149))

(declare-fun d!155151 () Bool)

(declare-fun lt!633025 () (_ BitVec 32))

(declare-fun lt!633024 () (_ BitVec 32))

(assert (=> d!155151 (= lt!633025 (bvmul (bvxor lt!633024 (bvlshr lt!633024 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155151 (= lt!633024 ((_ extract 31 0) (bvand (bvxor (select (arr!47251 a!2862) j!93) (bvlshr (select (arr!47251 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155151 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!971586 (let ((h!35093 ((_ extract 31 0) (bvand (bvxor (select (arr!47251 a!2862) j!93) (bvlshr (select (arr!47251 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129905 (bvmul (bvxor h!35093 (bvlshr h!35093 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129905 (bvlshr x!129905 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!971586 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!971586 #b00000000000000000000000000000000))))))

(assert (=> d!155151 (= (toIndex!0 (select (arr!47251 a!2862) j!93) mask!2687) (bvand (bvxor lt!633025 (bvlshr lt!633025 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1439664 d!155151))

(declare-fun bm!67731 () Bool)

(declare-fun call!67734 () Bool)

(assert (=> bm!67731 (= call!67734 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1439764 () Bool)

(declare-fun e!812248 () Bool)

(assert (=> b!1439764 (= e!812248 call!67734)))

(declare-fun b!1439765 () Bool)

(declare-fun e!812249 () Bool)

(declare-fun e!812250 () Bool)

(assert (=> b!1439765 (= e!812249 e!812250)))

(declare-fun c!133603 () Bool)

(assert (=> b!1439765 (= c!133603 (validKeyInArray!0 (select (arr!47251 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1439766 () Bool)

(assert (=> b!1439766 (= e!812250 e!812248)))

(declare-fun lt!633033 () (_ BitVec 64))

(assert (=> b!1439766 (= lt!633033 (select (arr!47251 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48499 0))(
  ( (Unit!48500) )
))
(declare-fun lt!633034 () Unit!48499)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97927 (_ BitVec 64) (_ BitVec 32)) Unit!48499)

(assert (=> b!1439766 (= lt!633034 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!633033 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1439766 (arrayContainsKey!0 a!2862 lt!633033 #b00000000000000000000000000000000)))

(declare-fun lt!633032 () Unit!48499)

(assert (=> b!1439766 (= lt!633032 lt!633034)))

(declare-fun res!971592 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97927 (_ BitVec 32)) SeekEntryResult!11400)

(assert (=> b!1439766 (= res!971592 (= (seekEntryOrOpen!0 (select (arr!47251 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11400 #b00000000000000000000000000000000)))))

(assert (=> b!1439766 (=> (not res!971592) (not e!812248))))

(declare-fun b!1439767 () Bool)

(assert (=> b!1439767 (= e!812250 call!67734)))

(declare-fun d!155153 () Bool)

(declare-fun res!971591 () Bool)

(assert (=> d!155153 (=> res!971591 e!812249)))

(assert (=> d!155153 (= res!971591 (bvsge #b00000000000000000000000000000000 (size!47802 a!2862)))))

(assert (=> d!155153 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!812249)))

(assert (= (and d!155153 (not res!971591)) b!1439765))

(assert (= (and b!1439765 c!133603) b!1439766))

(assert (= (and b!1439765 (not c!133603)) b!1439767))

(assert (= (and b!1439766 res!971592) b!1439764))

(assert (= (or b!1439764 b!1439767) bm!67731))

(declare-fun m!1329063 () Bool)

(assert (=> bm!67731 m!1329063))

(declare-fun m!1329065 () Bool)

(assert (=> b!1439765 m!1329065))

(assert (=> b!1439765 m!1329065))

(declare-fun m!1329067 () Bool)

(assert (=> b!1439765 m!1329067))

(assert (=> b!1439766 m!1329065))

(declare-fun m!1329069 () Bool)

(assert (=> b!1439766 m!1329069))

(declare-fun m!1329071 () Bool)

(assert (=> b!1439766 m!1329071))

(assert (=> b!1439766 m!1329065))

(declare-fun m!1329073 () Bool)

(assert (=> b!1439766 m!1329073))

(assert (=> b!1439667 d!155153))

(declare-fun b!1439768 () Bool)

(declare-fun e!812254 () SeekEntryResult!11400)

(declare-fun e!812252 () SeekEntryResult!11400)

(assert (=> b!1439768 (= e!812254 e!812252)))

(declare-fun lt!633036 () (_ BitVec 64))

(declare-fun c!133605 () Bool)

(assert (=> b!1439768 (= c!133605 (or (= lt!633036 (select (arr!47251 a!2862) j!93)) (= (bvadd lt!633036 lt!633036) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439770 () Bool)

(assert (=> b!1439770 (= e!812252 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 (bvadd x!665 #b00000000000000000000000000000001) mask!2687) (select (arr!47251 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1439771 () Bool)

(declare-fun lt!633035 () SeekEntryResult!11400)

(assert (=> b!1439771 (and (bvsge (index!47994 lt!633035) #b00000000000000000000000000000000) (bvslt (index!47994 lt!633035) (size!47802 a!2862)))))

(declare-fun res!971593 () Bool)

(assert (=> b!1439771 (= res!971593 (= (select (arr!47251 a!2862) (index!47994 lt!633035)) (select (arr!47251 a!2862) j!93)))))

(declare-fun e!812253 () Bool)

(assert (=> b!1439771 (=> res!971593 e!812253)))

(declare-fun e!812255 () Bool)

(assert (=> b!1439771 (= e!812255 e!812253)))

(declare-fun b!1439772 () Bool)

(assert (=> b!1439772 (= e!812254 (Intermediate!11400 true index!646 x!665))))

(declare-fun b!1439773 () Bool)

(assert (=> b!1439773 (and (bvsge (index!47994 lt!633035) #b00000000000000000000000000000000) (bvslt (index!47994 lt!633035) (size!47802 a!2862)))))

(assert (=> b!1439773 (= e!812253 (= (select (arr!47251 a!2862) (index!47994 lt!633035)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1439774 () Bool)

(declare-fun e!812251 () Bool)

(assert (=> b!1439774 (= e!812251 e!812255)))

(declare-fun res!971595 () Bool)

(assert (=> b!1439774 (= res!971595 (and ((_ is Intermediate!11400) lt!633035) (not (undefined!12212 lt!633035)) (bvslt (x!129901 lt!633035) #b01111111111111111111111111111110) (bvsge (x!129901 lt!633035) #b00000000000000000000000000000000) (bvsge (x!129901 lt!633035) x!665)))))

(assert (=> b!1439774 (=> (not res!971595) (not e!812255))))

(declare-fun b!1439775 () Bool)

(assert (=> b!1439775 (= e!812251 (bvsge (x!129901 lt!633035) #b01111111111111111111111111111110))))

(declare-fun b!1439776 () Bool)

(assert (=> b!1439776 (= e!812252 (Intermediate!11400 false index!646 x!665))))

(declare-fun b!1439769 () Bool)

(assert (=> b!1439769 (and (bvsge (index!47994 lt!633035) #b00000000000000000000000000000000) (bvslt (index!47994 lt!633035) (size!47802 a!2862)))))

(declare-fun res!971594 () Bool)

(assert (=> b!1439769 (= res!971594 (= (select (arr!47251 a!2862) (index!47994 lt!633035)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1439769 (=> res!971594 e!812253)))

(declare-fun d!155155 () Bool)

(assert (=> d!155155 e!812251))

(declare-fun c!133604 () Bool)

(assert (=> d!155155 (= c!133604 (and ((_ is Intermediate!11400) lt!633035) (undefined!12212 lt!633035)))))

(assert (=> d!155155 (= lt!633035 e!812254)))

(declare-fun c!133606 () Bool)

(assert (=> d!155155 (= c!133606 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!155155 (= lt!633036 (select (arr!47251 a!2862) index!646))))

(assert (=> d!155155 (validMask!0 mask!2687)))

(assert (=> d!155155 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47251 a!2862) j!93) a!2862 mask!2687) lt!633035)))

(assert (= (and d!155155 c!133606) b!1439772))

(assert (= (and d!155155 (not c!133606)) b!1439768))

(assert (= (and b!1439768 c!133605) b!1439776))

(assert (= (and b!1439768 (not c!133605)) b!1439770))

(assert (= (and d!155155 c!133604) b!1439775))

(assert (= (and d!155155 (not c!133604)) b!1439774))

(assert (= (and b!1439774 res!971595) b!1439771))

(assert (= (and b!1439771 (not res!971593)) b!1439769))

(assert (= (and b!1439769 (not res!971594)) b!1439773))

(declare-fun m!1329075 () Bool)

(assert (=> b!1439773 m!1329075))

(assert (=> b!1439771 m!1329075))

(assert (=> b!1439769 m!1329075))

(declare-fun m!1329077 () Bool)

(assert (=> b!1439770 m!1329077))

(assert (=> b!1439770 m!1329077))

(assert (=> b!1439770 m!1328963))

(declare-fun m!1329079 () Bool)

(assert (=> b!1439770 m!1329079))

(declare-fun m!1329081 () Bool)

(assert (=> d!155155 m!1329081))

(assert (=> d!155155 m!1328967))

(assert (=> b!1439668 d!155155))

(declare-fun b!1439777 () Bool)

(declare-fun e!812259 () SeekEntryResult!11400)

(declare-fun e!812257 () SeekEntryResult!11400)

(assert (=> b!1439777 (= e!812259 e!812257)))

(declare-fun lt!633038 () (_ BitVec 64))

(declare-fun c!133608 () Bool)

(assert (=> b!1439777 (= c!133608 (or (= lt!633038 (select (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93)) (= (bvadd lt!633038 lt!633038) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439779 () Bool)

(assert (=> b!1439779 (= e!812257 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2687) (select (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97928 (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47802 a!2862)) mask!2687))))

(declare-fun b!1439780 () Bool)

(declare-fun lt!633037 () SeekEntryResult!11400)

(assert (=> b!1439780 (and (bvsge (index!47994 lt!633037) #b00000000000000000000000000000000) (bvslt (index!47994 lt!633037) (size!47802 (array!97928 (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47802 a!2862)))))))

(declare-fun res!971596 () Bool)

(assert (=> b!1439780 (= res!971596 (= (select (arr!47251 (array!97928 (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47802 a!2862))) (index!47994 lt!633037)) (select (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93)))))

(declare-fun e!812258 () Bool)

(assert (=> b!1439780 (=> res!971596 e!812258)))

(declare-fun e!812260 () Bool)

(assert (=> b!1439780 (= e!812260 e!812258)))

(declare-fun b!1439781 () Bool)

(assert (=> b!1439781 (= e!812259 (Intermediate!11400 true (toIndex!0 (select (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1439782 () Bool)

(assert (=> b!1439782 (and (bvsge (index!47994 lt!633037) #b00000000000000000000000000000000) (bvslt (index!47994 lt!633037) (size!47802 (array!97928 (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47802 a!2862)))))))

(assert (=> b!1439782 (= e!812258 (= (select (arr!47251 (array!97928 (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47802 a!2862))) (index!47994 lt!633037)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1439783 () Bool)

(declare-fun e!812256 () Bool)

(assert (=> b!1439783 (= e!812256 e!812260)))

(declare-fun res!971598 () Bool)

(assert (=> b!1439783 (= res!971598 (and ((_ is Intermediate!11400) lt!633037) (not (undefined!12212 lt!633037)) (bvslt (x!129901 lt!633037) #b01111111111111111111111111111110) (bvsge (x!129901 lt!633037) #b00000000000000000000000000000000) (bvsge (x!129901 lt!633037) #b00000000000000000000000000000000)))))

(assert (=> b!1439783 (=> (not res!971598) (not e!812260))))

(declare-fun b!1439784 () Bool)

(assert (=> b!1439784 (= e!812256 (bvsge (x!129901 lt!633037) #b01111111111111111111111111111110))))

(declare-fun b!1439785 () Bool)

(assert (=> b!1439785 (= e!812257 (Intermediate!11400 false (toIndex!0 (select (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1439778 () Bool)

(assert (=> b!1439778 (and (bvsge (index!47994 lt!633037) #b00000000000000000000000000000000) (bvslt (index!47994 lt!633037) (size!47802 (array!97928 (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47802 a!2862)))))))

(declare-fun res!971597 () Bool)

(assert (=> b!1439778 (= res!971597 (= (select (arr!47251 (array!97928 (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47802 a!2862))) (index!47994 lt!633037)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1439778 (=> res!971597 e!812258)))

(declare-fun d!155157 () Bool)

(assert (=> d!155157 e!812256))

(declare-fun c!133607 () Bool)

(assert (=> d!155157 (= c!133607 (and ((_ is Intermediate!11400) lt!633037) (undefined!12212 lt!633037)))))

(assert (=> d!155157 (= lt!633037 e!812259)))

(declare-fun c!133609 () Bool)

(assert (=> d!155157 (= c!133609 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!155157 (= lt!633038 (select (arr!47251 (array!97928 (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47802 a!2862))) (toIndex!0 (select (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687)))))

(assert (=> d!155157 (validMask!0 mask!2687)))

(assert (=> d!155157 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97928 (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47802 a!2862)) mask!2687) lt!633037)))

(assert (= (and d!155157 c!133609) b!1439781))

(assert (= (and d!155157 (not c!133609)) b!1439777))

(assert (= (and b!1439777 c!133608) b!1439785))

(assert (= (and b!1439777 (not c!133608)) b!1439779))

(assert (= (and d!155157 c!133607) b!1439784))

(assert (= (and d!155157 (not c!133607)) b!1439783))

(assert (= (and b!1439783 res!971598) b!1439780))

(assert (= (and b!1439780 (not res!971596)) b!1439778))

(assert (= (and b!1439778 (not res!971597)) b!1439782))

(declare-fun m!1329083 () Bool)

(assert (=> b!1439782 m!1329083))

(assert (=> b!1439780 m!1329083))

(assert (=> b!1439778 m!1329083))

(assert (=> b!1439779 m!1328977))

(declare-fun m!1329085 () Bool)

(assert (=> b!1439779 m!1329085))

(assert (=> b!1439779 m!1329085))

(assert (=> b!1439779 m!1328975))

(declare-fun m!1329087 () Bool)

(assert (=> b!1439779 m!1329087))

(assert (=> d!155157 m!1328977))

(declare-fun m!1329089 () Bool)

(assert (=> d!155157 m!1329089))

(assert (=> d!155157 m!1328967))

(assert (=> b!1439666 d!155157))

(declare-fun d!155159 () Bool)

(declare-fun lt!633040 () (_ BitVec 32))

(declare-fun lt!633039 () (_ BitVec 32))

(assert (=> d!155159 (= lt!633040 (bvmul (bvxor lt!633039 (bvlshr lt!633039 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!155159 (= lt!633039 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!155159 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!971586 (let ((h!35093 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129905 (bvmul (bvxor h!35093 (bvlshr h!35093 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129905 (bvlshr x!129905 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!971586 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!971586 #b00000000000000000000000000000000))))))

(assert (=> d!155159 (= (toIndex!0 (select (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (bvand (bvxor lt!633040 (bvlshr lt!633040 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1439666 d!155159))

(declare-fun d!155161 () Bool)

(assert (=> d!155161 (= (validKeyInArray!0 (select (arr!47251 a!2862) i!1006)) (and (not (= (select (arr!47251 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47251 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1439661 d!155161))

(declare-fun b!1439796 () Bool)

(declare-fun e!812272 () Bool)

(declare-fun call!67737 () Bool)

(assert (=> b!1439796 (= e!812272 call!67737)))

(declare-fun b!1439797 () Bool)

(assert (=> b!1439797 (= e!812272 call!67737)))

(declare-fun b!1439798 () Bool)

(declare-fun e!812271 () Bool)

(declare-fun e!812270 () Bool)

(assert (=> b!1439798 (= e!812271 e!812270)))

(declare-fun res!971605 () Bool)

(assert (=> b!1439798 (=> (not res!971605) (not e!812270))))

(declare-fun e!812269 () Bool)

(assert (=> b!1439798 (= res!971605 (not e!812269))))

(declare-fun res!971606 () Bool)

(assert (=> b!1439798 (=> (not res!971606) (not e!812269))))

(assert (=> b!1439798 (= res!971606 (validKeyInArray!0 (select (arr!47251 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1439799 () Bool)

(declare-fun contains!9936 (List!33739 (_ BitVec 64)) Bool)

(assert (=> b!1439799 (= e!812269 (contains!9936 Nil!33736 (select (arr!47251 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!155163 () Bool)

(declare-fun res!971607 () Bool)

(assert (=> d!155163 (=> res!971607 e!812271)))

(assert (=> d!155163 (= res!971607 (bvsge #b00000000000000000000000000000000 (size!47802 a!2862)))))

(assert (=> d!155163 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33736) e!812271)))

(declare-fun bm!67734 () Bool)

(declare-fun c!133612 () Bool)

(assert (=> bm!67734 (= call!67737 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133612 (Cons!33735 (select (arr!47251 a!2862) #b00000000000000000000000000000000) Nil!33736) Nil!33736)))))

(declare-fun b!1439800 () Bool)

(assert (=> b!1439800 (= e!812270 e!812272)))

(assert (=> b!1439800 (= c!133612 (validKeyInArray!0 (select (arr!47251 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!155163 (not res!971607)) b!1439798))

(assert (= (and b!1439798 res!971606) b!1439799))

(assert (= (and b!1439798 res!971605) b!1439800))

(assert (= (and b!1439800 c!133612) b!1439796))

(assert (= (and b!1439800 (not c!133612)) b!1439797))

(assert (= (or b!1439796 b!1439797) bm!67734))

(assert (=> b!1439798 m!1329065))

(assert (=> b!1439798 m!1329065))

(assert (=> b!1439798 m!1329067))

(assert (=> b!1439799 m!1329065))

(assert (=> b!1439799 m!1329065))

(declare-fun m!1329091 () Bool)

(assert (=> b!1439799 m!1329091))

(assert (=> bm!67734 m!1329065))

(declare-fun m!1329093 () Bool)

(assert (=> bm!67734 m!1329093))

(assert (=> b!1439800 m!1329065))

(assert (=> b!1439800 m!1329065))

(assert (=> b!1439800 m!1329067))

(assert (=> b!1439659 d!155163))

(declare-fun d!155169 () Bool)

(assert (=> d!155169 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124506 d!155169))

(declare-fun d!155171 () Bool)

(assert (=> d!155171 (= (array_inv!36532 a!2862) (bvsge (size!47802 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124506 d!155171))

(declare-fun d!155173 () Bool)

(assert (=> d!155173 (= (validKeyInArray!0 (select (arr!47251 a!2862) j!93)) (and (not (= (select (arr!47251 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47251 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1439660 d!155173))

(check-sat (not b!1439799) (not bm!67731) (not bm!67734) (not b!1439766) (not b!1439798) (not d!155149) (not d!155157) (not b!1439770) (not b!1439800) (not d!155155) (not b!1439779) (not b!1439749) (not b!1439765))
(check-sat)
