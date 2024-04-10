; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124354 () Bool)

(assert start!124354)

(declare-fun b!1438890 () Bool)

(declare-fun res!971444 () Bool)

(declare-fun e!811616 () Bool)

(assert (=> b!1438890 (=> (not res!971444) (not e!811616))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!97841 0))(
  ( (array!97842 (arr!47210 (Array (_ BitVec 32) (_ BitVec 64))) (size!47760 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97841)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11462 0))(
  ( (MissingZero!11462 (index!48240 (_ BitVec 32))) (Found!11462 (index!48241 (_ BitVec 32))) (Intermediate!11462 (undefined!12274 Bool) (index!48242 (_ BitVec 32)) (x!129977 (_ BitVec 32))) (Undefined!11462) (MissingVacant!11462 (index!48243 (_ BitVec 32))) )
))
(declare-fun lt!632667 () SeekEntryResult!11462)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97841 (_ BitVec 32)) SeekEntryResult!11462)

(assert (=> b!1438890 (= res!971444 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47210 a!2862) j!93) a!2862 mask!2687) lt!632667))))

(declare-fun b!1438891 () Bool)

(declare-fun res!971442 () Bool)

(declare-fun e!811617 () Bool)

(assert (=> b!1438891 (=> (not res!971442) (not e!811617))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1438891 (= res!971442 (and (= (size!47760 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47760 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47760 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438892 () Bool)

(declare-fun res!971449 () Bool)

(assert (=> b!1438892 (=> (not res!971449) (not e!811617))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438892 (= res!971449 (validKeyInArray!0 (select (arr!47210 a!2862) i!1006)))))

(declare-fun b!1438893 () Bool)

(declare-fun e!811619 () Bool)

(assert (=> b!1438893 (= e!811616 e!811619)))

(declare-fun res!971448 () Bool)

(assert (=> b!1438893 (=> (not res!971448) (not e!811619))))

(declare-fun lt!632666 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1438893 (= res!971448 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!632666 (select (store (arr!47210 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97842 (store (arr!47210 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47760 a!2862)) mask!2687) (Intermediate!11462 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438893 (= lt!632666 (toIndex!0 (select (store (arr!47210 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1438894 () Bool)

(assert (=> b!1438894 (= e!811619 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (or (bvslt lt!632666 #b00000000000000000000000000000000) (bvsge lt!632666 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(declare-fun b!1438895 () Bool)

(declare-fun res!971445 () Bool)

(assert (=> b!1438895 (=> (not res!971445) (not e!811617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97841 (_ BitVec 32)) Bool)

(assert (=> b!1438895 (= res!971445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438897 () Bool)

(assert (=> b!1438897 (= e!811617 e!811616)))

(declare-fun res!971443 () Bool)

(assert (=> b!1438897 (=> (not res!971443) (not e!811616))))

(assert (=> b!1438897 (= res!971443 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47210 a!2862) j!93) mask!2687) (select (arr!47210 a!2862) j!93) a!2862 mask!2687) lt!632667))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1438897 (= lt!632667 (Intermediate!11462 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438898 () Bool)

(declare-fun res!971440 () Bool)

(assert (=> b!1438898 (=> (not res!971440) (not e!811617))))

(assert (=> b!1438898 (= res!971440 (validKeyInArray!0 (select (arr!47210 a!2862) j!93)))))

(declare-fun b!1438899 () Bool)

(declare-fun res!971441 () Bool)

(assert (=> b!1438899 (=> (not res!971441) (not e!811617))))

(declare-datatypes ((List!33711 0))(
  ( (Nil!33708) (Cons!33707 (h!35054 (_ BitVec 64)) (t!48405 List!33711)) )
))
(declare-fun arrayNoDuplicates!0 (array!97841 (_ BitVec 32) List!33711) Bool)

(assert (=> b!1438899 (= res!971441 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33708))))

(declare-fun b!1438896 () Bool)

(declare-fun res!971447 () Bool)

(assert (=> b!1438896 (=> (not res!971447) (not e!811617))))

(assert (=> b!1438896 (= res!971447 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47760 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47760 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47760 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47210 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!971446 () Bool)

(assert (=> start!124354 (=> (not res!971446) (not e!811617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124354 (= res!971446 (validMask!0 mask!2687))))

(assert (=> start!124354 e!811617))

(assert (=> start!124354 true))

(declare-fun array_inv!36238 (array!97841) Bool)

(assert (=> start!124354 (array_inv!36238 a!2862)))

(assert (= (and start!124354 res!971446) b!1438891))

(assert (= (and b!1438891 res!971442) b!1438892))

(assert (= (and b!1438892 res!971449) b!1438898))

(assert (= (and b!1438898 res!971440) b!1438895))

(assert (= (and b!1438895 res!971445) b!1438899))

(assert (= (and b!1438899 res!971441) b!1438896))

(assert (= (and b!1438896 res!971447) b!1438897))

(assert (= (and b!1438897 res!971443) b!1438890))

(assert (= (and b!1438890 res!971444) b!1438893))

(assert (= (and b!1438893 res!971448) b!1438894))

(declare-fun m!1328023 () Bool)

(assert (=> b!1438898 m!1328023))

(assert (=> b!1438898 m!1328023))

(declare-fun m!1328025 () Bool)

(assert (=> b!1438898 m!1328025))

(declare-fun m!1328027 () Bool)

(assert (=> b!1438893 m!1328027))

(declare-fun m!1328029 () Bool)

(assert (=> b!1438893 m!1328029))

(assert (=> b!1438893 m!1328029))

(declare-fun m!1328031 () Bool)

(assert (=> b!1438893 m!1328031))

(assert (=> b!1438893 m!1328029))

(declare-fun m!1328033 () Bool)

(assert (=> b!1438893 m!1328033))

(declare-fun m!1328035 () Bool)

(assert (=> start!124354 m!1328035))

(declare-fun m!1328037 () Bool)

(assert (=> start!124354 m!1328037))

(assert (=> b!1438897 m!1328023))

(assert (=> b!1438897 m!1328023))

(declare-fun m!1328039 () Bool)

(assert (=> b!1438897 m!1328039))

(assert (=> b!1438897 m!1328039))

(assert (=> b!1438897 m!1328023))

(declare-fun m!1328041 () Bool)

(assert (=> b!1438897 m!1328041))

(declare-fun m!1328043 () Bool)

(assert (=> b!1438892 m!1328043))

(assert (=> b!1438892 m!1328043))

(declare-fun m!1328045 () Bool)

(assert (=> b!1438892 m!1328045))

(declare-fun m!1328047 () Bool)

(assert (=> b!1438895 m!1328047))

(declare-fun m!1328049 () Bool)

(assert (=> b!1438899 m!1328049))

(assert (=> b!1438896 m!1328027))

(declare-fun m!1328051 () Bool)

(assert (=> b!1438896 m!1328051))

(assert (=> b!1438890 m!1328023))

(assert (=> b!1438890 m!1328023))

(declare-fun m!1328053 () Bool)

(assert (=> b!1438890 m!1328053))

(push 1)

(assert (not b!1438895))

(assert (not b!1438898))

(assert (not b!1438893))

(assert (not b!1438899))

(assert (not b!1438897))

(assert (not b!1438892))

(assert (not start!124354))

(assert (not b!1438890))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1439058 () Bool)

(declare-fun lt!632716 () SeekEntryResult!11462)

(assert (=> b!1439058 (and (bvsge (index!48242 lt!632716) #b00000000000000000000000000000000) (bvslt (index!48242 lt!632716) (size!47760 (array!97842 (store (arr!47210 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47760 a!2862)))))))

(declare-fun e!811705 () Bool)

(assert (=> b!1439058 (= e!811705 (= (select (arr!47210 (array!97842 (store (arr!47210 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47760 a!2862))) (index!48242 lt!632716)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1439059 () Bool)

(declare-fun e!811706 () SeekEntryResult!11462)

(declare-fun e!811708 () SeekEntryResult!11462)

(assert (=> b!1439059 (= e!811706 e!811708)))

(declare-fun c!133267 () Bool)

(declare-fun lt!632715 () (_ BitVec 64))

(assert (=> b!1439059 (= c!133267 (or (= lt!632715 (select (store (arr!47210 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93)) (= (bvadd lt!632715 lt!632715) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439060 () Bool)

(assert (=> b!1439060 (= e!811706 (Intermediate!11462 true lt!632666 #b00000000000000000000000000000000))))

(declare-fun b!1439061 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439061 (= e!811708 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!632666 #b00000000000000000000000000000000 mask!2687) (select (store (arr!47210 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97842 (store (arr!47210 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47760 a!2862)) mask!2687))))

(declare-fun b!1439062 () Bool)

(assert (=> b!1439062 (and (bvsge (index!48242 lt!632716) #b00000000000000000000000000000000) (bvslt (index!48242 lt!632716) (size!47760 (array!97842 (store (arr!47210 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47760 a!2862)))))))

(declare-fun res!971547 () Bool)

(assert (=> b!1439062 (= res!971547 (= (select (arr!47210 (array!97842 (store (arr!47210 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47760 a!2862))) (index!48242 lt!632716)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1439062 (=> res!971547 e!811705)))

(declare-fun b!1439063 () Bool)

(assert (=> b!1439063 (= e!811708 (Intermediate!11462 false lt!632666 #b00000000000000000000000000000000))))

(declare-fun d!154845 () Bool)

(declare-fun e!811704 () Bool)

(assert (=> d!154845 e!811704))

(declare-fun c!133266 () Bool)

(assert (=> d!154845 (= c!133266 (and (is-Intermediate!11462 lt!632716) (undefined!12274 lt!632716)))))

(assert (=> d!154845 (= lt!632716 e!811706)))

(declare-fun c!133265 () Bool)

(assert (=> d!154845 (= c!133265 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154845 (= lt!632715 (select (arr!47210 (array!97842 (store (arr!47210 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47760 a!2862))) lt!632666))))

(assert (=> d!154845 (validMask!0 mask!2687)))

(assert (=> d!154845 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!632666 (select (store (arr!47210 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97842 (store (arr!47210 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47760 a!2862)) mask!2687) lt!632716)))

(declare-fun b!1439064 () Bool)

(declare-fun e!811707 () Bool)

(assert (=> b!1439064 (= e!811704 e!811707)))

(declare-fun res!971549 () Bool)

(assert (=> b!1439064 (= res!971549 (and (is-Intermediate!11462 lt!632716) (not (undefined!12274 lt!632716)) (bvslt (x!129977 lt!632716) #b01111111111111111111111111111110) (bvsge (x!129977 lt!632716) #b00000000000000000000000000000000) (bvsge (x!129977 lt!632716) #b00000000000000000000000000000000)))))

(assert (=> b!1439064 (=> (not res!971549) (not e!811707))))

(declare-fun b!1439065 () Bool)

(assert (=> b!1439065 (and (bvsge (index!48242 lt!632716) #b00000000000000000000000000000000) (bvslt (index!48242 lt!632716) (size!47760 (array!97842 (store (arr!47210 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47760 a!2862)))))))

(declare-fun res!971548 () Bool)

(assert (=> b!1439065 (= res!971548 (= (select (arr!47210 (array!97842 (store (arr!47210 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47760 a!2862))) (index!48242 lt!632716)) (select (store (arr!47210 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93)))))

(assert (=> b!1439065 (=> res!971548 e!811705)))

(assert (=> b!1439065 (= e!811707 e!811705)))

(declare-fun b!1439066 () Bool)

(assert (=> b!1439066 (= e!811704 (bvsge (x!129977 lt!632716) #b01111111111111111111111111111110))))

(assert (= (and d!154845 c!133265) b!1439060))

(assert (= (and d!154845 (not c!133265)) b!1439059))

(assert (= (and b!1439059 c!133267) b!1439063))

(assert (= (and b!1439059 (not c!133267)) b!1439061))

(assert (= (and d!154845 c!133266) b!1439066))

(assert (= (and d!154845 (not c!133266)) b!1439064))

(assert (= (and b!1439064 res!971549) b!1439065))

(assert (= (and b!1439065 (not res!971548)) b!1439062))

(assert (= (and b!1439062 (not res!971547)) b!1439058))

(declare-fun m!1328159 () Bool)

(assert (=> d!154845 m!1328159))

(assert (=> d!154845 m!1328035))

(declare-fun m!1328161 () Bool)

(assert (=> b!1439065 m!1328161))

(declare-fun m!1328163 () Bool)

(assert (=> b!1439061 m!1328163))

(assert (=> b!1439061 m!1328163))

(assert (=> b!1439061 m!1328029))

(declare-fun m!1328165 () Bool)

(assert (=> b!1439061 m!1328165))

(assert (=> b!1439058 m!1328161))

(assert (=> b!1439062 m!1328161))

(assert (=> b!1438893 d!154845))

(declare-fun d!154867 () Bool)

(declare-fun lt!632724 () (_ BitVec 32))

(declare-fun lt!632723 () (_ BitVec 32))

(assert (=> d!154867 (= lt!632724 (bvmul (bvxor lt!632723 (bvlshr lt!632723 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154867 (= lt!632723 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47210 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47210 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154867 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!971556 (let ((h!35058 ((_ extract 31 0) (bvand (bvxor (select (store (arr!47210 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (bvlshr (select (store (arr!47210 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129984 (bvmul (bvxor h!35058 (bvlshr h!35058 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129984 (bvlshr x!129984 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!971556 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!971556 #b00000000000000000000000000000000))))))

(assert (=> d!154867 (= (toIndex!0 (select (store (arr!47210 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (bvand (bvxor lt!632724 (bvlshr lt!632724 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1438893 d!154867))

(declare-fun b!1439096 () Bool)

(declare-fun e!811728 () Bool)

(declare-fun contains!9894 (List!33711 (_ BitVec 64)) Bool)

(assert (=> b!1439096 (= e!811728 (contains!9894 Nil!33708 (select (arr!47210 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!154871 () Bool)

(declare-fun res!971569 () Bool)

(declare-fun e!811731 () Bool)

(assert (=> d!154871 (=> res!971569 e!811731)))

(assert (=> d!154871 (= res!971569 (bvsge #b00000000000000000000000000000000 (size!47760 a!2862)))))

(assert (=> d!154871 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33708) e!811731)))

(declare-fun b!1439097 () Bool)

(declare-fun e!811729 () Bool)

(declare-fun e!811730 () Bool)

(assert (=> b!1439097 (= e!811729 e!811730)))

(declare-fun c!133275 () Bool)

(assert (=> b!1439097 (= c!133275 (validKeyInArray!0 (select (arr!47210 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1439098 () Bool)

(assert (=> b!1439098 (= e!811731 e!811729)))

(declare-fun res!971568 () Bool)

(assert (=> b!1439098 (=> (not res!971568) (not e!811729))))

(assert (=> b!1439098 (= res!971568 (not e!811728))))

(declare-fun res!971567 () Bool)

(assert (=> b!1439098 (=> (not res!971567) (not e!811728))))

(assert (=> b!1439098 (= res!971567 (validKeyInArray!0 (select (arr!47210 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1439099 () Bool)

(declare-fun call!67687 () Bool)

(assert (=> b!1439099 (= e!811730 call!67687)))

(declare-fun bm!67684 () Bool)

(assert (=> bm!67684 (= call!67687 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133275 (Cons!33707 (select (arr!47210 a!2862) #b00000000000000000000000000000000) Nil!33708) Nil!33708)))))

(declare-fun b!1439100 () Bool)

(assert (=> b!1439100 (= e!811730 call!67687)))

(assert (= (and d!154871 (not res!971569)) b!1439098))

(assert (= (and b!1439098 res!971567) b!1439096))

(assert (= (and b!1439098 res!971568) b!1439097))

(assert (= (and b!1439097 c!133275) b!1439099))

(assert (= (and b!1439097 (not c!133275)) b!1439100))

(assert (= (or b!1439099 b!1439100) bm!67684))

(declare-fun m!1328175 () Bool)

(assert (=> b!1439096 m!1328175))

(assert (=> b!1439096 m!1328175))

(declare-fun m!1328177 () Bool)

(assert (=> b!1439096 m!1328177))

(assert (=> b!1439097 m!1328175))

(assert (=> b!1439097 m!1328175))

(declare-fun m!1328179 () Bool)

(assert (=> b!1439097 m!1328179))

(assert (=> b!1439098 m!1328175))

(assert (=> b!1439098 m!1328175))

(assert (=> b!1439098 m!1328179))

(assert (=> bm!67684 m!1328175))

(declare-fun m!1328181 () Bool)

(assert (=> bm!67684 m!1328181))

(assert (=> b!1438899 d!154871))

(declare-fun b!1439124 () Bool)

(declare-fun e!811752 () Bool)

(declare-fun e!811751 () Bool)

(assert (=> b!1439124 (= e!811752 e!811751)))

(declare-fun c!133281 () Bool)

(assert (=> b!1439124 (= c!133281 (validKeyInArray!0 (select (arr!47210 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67690 () Bool)

(declare-fun call!67693 () Bool)

(assert (=> bm!67690 (= call!67693 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1439125 () Bool)

(declare-fun e!811750 () Bool)

(assert (=> b!1439125 (= e!811751 e!811750)))

(declare-fun lt!632739 () (_ BitVec 64))

(assert (=> b!1439125 (= lt!632739 (select (arr!47210 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48572 0))(
  ( (Unit!48573) )
))
(declare-fun lt!632738 () Unit!48572)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97841 (_ BitVec 64) (_ BitVec 32)) Unit!48572)

(assert (=> b!1439125 (= lt!632738 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632739 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1439125 (arrayContainsKey!0 a!2862 lt!632739 #b00000000000000000000000000000000)))

(declare-fun lt!632737 () Unit!48572)

(assert (=> b!1439125 (= lt!632737 lt!632738)))

(declare-fun res!971583 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97841 (_ BitVec 32)) SeekEntryResult!11462)

(assert (=> b!1439125 (= res!971583 (= (seekEntryOrOpen!0 (select (arr!47210 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11462 #b00000000000000000000000000000000)))))

(assert (=> b!1439125 (=> (not res!971583) (not e!811750))))

(declare-fun b!1439126 () Bool)

(assert (=> b!1439126 (= e!811750 call!67693)))

(declare-fun d!154875 () Bool)

(declare-fun res!971584 () Bool)

(assert (=> d!154875 (=> res!971584 e!811752)))

(assert (=> d!154875 (= res!971584 (bvsge #b00000000000000000000000000000000 (size!47760 a!2862)))))

(assert (=> d!154875 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!811752)))

(declare-fun b!1439127 () Bool)

(assert (=> b!1439127 (= e!811751 call!67693)))

(assert (= (and d!154875 (not res!971584)) b!1439124))

(assert (= (and b!1439124 c!133281) b!1439125))

(assert (= (and b!1439124 (not c!133281)) b!1439127))

(assert (= (and b!1439125 res!971583) b!1439126))

(assert (= (or b!1439126 b!1439127) bm!67690))

(assert (=> b!1439124 m!1328175))

(assert (=> b!1439124 m!1328175))

(assert (=> b!1439124 m!1328179))

(declare-fun m!1328191 () Bool)

(assert (=> bm!67690 m!1328191))

(assert (=> b!1439125 m!1328175))

(declare-fun m!1328193 () Bool)

(assert (=> b!1439125 m!1328193))

(declare-fun m!1328195 () Bool)

(assert (=> b!1439125 m!1328195))

(assert (=> b!1439125 m!1328175))

(declare-fun m!1328197 () Bool)

(assert (=> b!1439125 m!1328197))

(assert (=> b!1438895 d!154875))

(declare-fun b!1439128 () Bool)

(declare-fun lt!632741 () SeekEntryResult!11462)

(assert (=> b!1439128 (and (bvsge (index!48242 lt!632741) #b00000000000000000000000000000000) (bvslt (index!48242 lt!632741) (size!47760 a!2862)))))

(declare-fun e!811754 () Bool)

(assert (=> b!1439128 (= e!811754 (= (select (arr!47210 a!2862) (index!48242 lt!632741)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1439129 () Bool)

(declare-fun e!811755 () SeekEntryResult!11462)

(declare-fun e!811757 () SeekEntryResult!11462)

(assert (=> b!1439129 (= e!811755 e!811757)))

(declare-fun lt!632740 () (_ BitVec 64))

(declare-fun c!133284 () Bool)

(assert (=> b!1439129 (= c!133284 (or (= lt!632740 (select (arr!47210 a!2862) j!93)) (= (bvadd lt!632740 lt!632740) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439130 () Bool)

(assert (=> b!1439130 (= e!811755 (Intermediate!11462 true index!646 x!665))))

(declare-fun b!1439131 () Bool)

(assert (=> b!1439131 (= e!811757 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!47210 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1439132 () Bool)

(assert (=> b!1439132 (and (bvsge (index!48242 lt!632741) #b00000000000000000000000000000000) (bvslt (index!48242 lt!632741) (size!47760 a!2862)))))

(declare-fun res!971585 () Bool)

(assert (=> b!1439132 (= res!971585 (= (select (arr!47210 a!2862) (index!48242 lt!632741)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1439132 (=> res!971585 e!811754)))

(declare-fun b!1439133 () Bool)

(assert (=> b!1439133 (= e!811757 (Intermediate!11462 false index!646 x!665))))

(declare-fun d!154881 () Bool)

(declare-fun e!811753 () Bool)

(assert (=> d!154881 e!811753))

(declare-fun c!133283 () Bool)

(assert (=> d!154881 (= c!133283 (and (is-Intermediate!11462 lt!632741) (undefined!12274 lt!632741)))))

(assert (=> d!154881 (= lt!632741 e!811755)))

(declare-fun c!133282 () Bool)

(assert (=> d!154881 (= c!133282 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!154881 (= lt!632740 (select (arr!47210 a!2862) index!646))))

(assert (=> d!154881 (validMask!0 mask!2687)))

(assert (=> d!154881 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47210 a!2862) j!93) a!2862 mask!2687) lt!632741)))

(declare-fun b!1439134 () Bool)

(declare-fun e!811756 () Bool)

(assert (=> b!1439134 (= e!811753 e!811756)))

(declare-fun res!971587 () Bool)

(assert (=> b!1439134 (= res!971587 (and (is-Intermediate!11462 lt!632741) (not (undefined!12274 lt!632741)) (bvslt (x!129977 lt!632741) #b01111111111111111111111111111110) (bvsge (x!129977 lt!632741) #b00000000000000000000000000000000) (bvsge (x!129977 lt!632741) x!665)))))

(assert (=> b!1439134 (=> (not res!971587) (not e!811756))))

(declare-fun b!1439135 () Bool)

(assert (=> b!1439135 (and (bvsge (index!48242 lt!632741) #b00000000000000000000000000000000) (bvslt (index!48242 lt!632741) (size!47760 a!2862)))))

(declare-fun res!971586 () Bool)

(assert (=> b!1439135 (= res!971586 (= (select (arr!47210 a!2862) (index!48242 lt!632741)) (select (arr!47210 a!2862) j!93)))))

(assert (=> b!1439135 (=> res!971586 e!811754)))

(assert (=> b!1439135 (= e!811756 e!811754)))

(declare-fun b!1439136 () Bool)

(assert (=> b!1439136 (= e!811753 (bvsge (x!129977 lt!632741) #b01111111111111111111111111111110))))

(assert (= (and d!154881 c!133282) b!1439130))

(assert (= (and d!154881 (not c!133282)) b!1439129))

(assert (= (and b!1439129 c!133284) b!1439133))

(assert (= (and b!1439129 (not c!133284)) b!1439131))

(assert (= (and d!154881 c!133283) b!1439136))

(assert (= (and d!154881 (not c!133283)) b!1439134))

(assert (= (and b!1439134 res!971587) b!1439135))

(assert (= (and b!1439135 (not res!971586)) b!1439132))

(assert (= (and b!1439132 (not res!971585)) b!1439128))

(declare-fun m!1328199 () Bool)

(assert (=> d!154881 m!1328199))

(assert (=> d!154881 m!1328035))

(declare-fun m!1328201 () Bool)

(assert (=> b!1439135 m!1328201))

(declare-fun m!1328203 () Bool)

(assert (=> b!1439131 m!1328203))

(assert (=> b!1439131 m!1328203))

(assert (=> b!1439131 m!1328023))

(declare-fun m!1328205 () Bool)

(assert (=> b!1439131 m!1328205))

(assert (=> b!1439128 m!1328201))

(assert (=> b!1439132 m!1328201))

(assert (=> b!1438890 d!154881))

(declare-fun d!154883 () Bool)

(assert (=> d!154883 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124354 d!154883))

(declare-fun d!154891 () Bool)

(assert (=> d!154891 (= (array_inv!36238 a!2862) (bvsge (size!47760 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124354 d!154891))

(declare-fun b!1439158 () Bool)

(declare-fun lt!632754 () SeekEntryResult!11462)

(assert (=> b!1439158 (and (bvsge (index!48242 lt!632754) #b00000000000000000000000000000000) (bvslt (index!48242 lt!632754) (size!47760 a!2862)))))

(declare-fun e!811773 () Bool)

(assert (=> b!1439158 (= e!811773 (= (select (arr!47210 a!2862) (index!48242 lt!632754)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1439159 () Bool)

(declare-fun e!811774 () SeekEntryResult!11462)

(declare-fun e!811776 () SeekEntryResult!11462)

(assert (=> b!1439159 (= e!811774 e!811776)))

(declare-fun lt!632753 () (_ BitVec 64))

(declare-fun c!133293 () Bool)

(assert (=> b!1439159 (= c!133293 (or (= lt!632753 (select (arr!47210 a!2862) j!93)) (= (bvadd lt!632753 lt!632753) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439160 () Bool)

(assert (=> b!1439160 (= e!811774 (Intermediate!11462 true (toIndex!0 (select (arr!47210 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1439161 () Bool)

(assert (=> b!1439161 (= e!811776 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!47210 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!47210 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1439162 () Bool)

(assert (=> b!1439162 (and (bvsge (index!48242 lt!632754) #b00000000000000000000000000000000) (bvslt (index!48242 lt!632754) (size!47760 a!2862)))))

(declare-fun res!971597 () Bool)

(assert (=> b!1439162 (= res!971597 (= (select (arr!47210 a!2862) (index!48242 lt!632754)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1439162 (=> res!971597 e!811773)))

(declare-fun b!1439163 () Bool)

(assert (=> b!1439163 (= e!811776 (Intermediate!11462 false (toIndex!0 (select (arr!47210 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!154893 () Bool)

(declare-fun e!811772 () Bool)

(assert (=> d!154893 e!811772))

(declare-fun c!133292 () Bool)

(assert (=> d!154893 (= c!133292 (and (is-Intermediate!11462 lt!632754) (undefined!12274 lt!632754)))))

(assert (=> d!154893 (= lt!632754 e!811774)))

(declare-fun c!133291 () Bool)

(assert (=> d!154893 (= c!133291 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!154893 (= lt!632753 (select (arr!47210 a!2862) (toIndex!0 (select (arr!47210 a!2862) j!93) mask!2687)))))

(assert (=> d!154893 (validMask!0 mask!2687)))

(assert (=> d!154893 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47210 a!2862) j!93) mask!2687) (select (arr!47210 a!2862) j!93) a!2862 mask!2687) lt!632754)))

(declare-fun b!1439164 () Bool)

(declare-fun e!811775 () Bool)

(assert (=> b!1439164 (= e!811772 e!811775)))

(declare-fun res!971599 () Bool)

(assert (=> b!1439164 (= res!971599 (and (is-Intermediate!11462 lt!632754) (not (undefined!12274 lt!632754)) (bvslt (x!129977 lt!632754) #b01111111111111111111111111111110) (bvsge (x!129977 lt!632754) #b00000000000000000000000000000000) (bvsge (x!129977 lt!632754) #b00000000000000000000000000000000)))))

(assert (=> b!1439164 (=> (not res!971599) (not e!811775))))

(declare-fun b!1439165 () Bool)

(assert (=> b!1439165 (and (bvsge (index!48242 lt!632754) #b00000000000000000000000000000000) (bvslt (index!48242 lt!632754) (size!47760 a!2862)))))

(declare-fun res!971598 () Bool)

(assert (=> b!1439165 (= res!971598 (= (select (arr!47210 a!2862) (index!48242 lt!632754)) (select (arr!47210 a!2862) j!93)))))

(assert (=> b!1439165 (=> res!971598 e!811773)))

(assert (=> b!1439165 (= e!811775 e!811773)))

(declare-fun b!1439166 () Bool)

(assert (=> b!1439166 (= e!811772 (bvsge (x!129977 lt!632754) #b01111111111111111111111111111110))))

(assert (= (and d!154893 c!133291) b!1439160))

(assert (= (and d!154893 (not c!133291)) b!1439159))

(assert (= (and b!1439159 c!133293) b!1439163))

(assert (= (and b!1439159 (not c!133293)) b!1439161))

(assert (= (and d!154893 c!133292) b!1439166))

(assert (= (and d!154893 (not c!133292)) b!1439164))

(assert (= (and b!1439164 res!971599) b!1439165))

(assert (= (and b!1439165 (not res!971598)) b!1439162))

(assert (= (and b!1439162 (not res!971597)) b!1439158))

(assert (=> d!154893 m!1328039))

(declare-fun m!1328223 () Bool)

(assert (=> d!154893 m!1328223))

(assert (=> d!154893 m!1328035))

(declare-fun m!1328225 () Bool)

(assert (=> b!1439165 m!1328225))

(assert (=> b!1439161 m!1328039))

(declare-fun m!1328227 () Bool)

(assert (=> b!1439161 m!1328227))

(assert (=> b!1439161 m!1328227))

(assert (=> b!1439161 m!1328023))

(declare-fun m!1328229 () Bool)

(assert (=> b!1439161 m!1328229))

(assert (=> b!1439158 m!1328225))

(assert (=> b!1439162 m!1328225))

(assert (=> b!1438897 d!154893))

(declare-fun d!154895 () Bool)

(declare-fun lt!632756 () (_ BitVec 32))

(declare-fun lt!632755 () (_ BitVec 32))

(assert (=> d!154895 (= lt!632756 (bvmul (bvxor lt!632755 (bvlshr lt!632755 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154895 (= lt!632755 ((_ extract 31 0) (bvand (bvxor (select (arr!47210 a!2862) j!93) (bvlshr (select (arr!47210 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154895 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!971556 (let ((h!35058 ((_ extract 31 0) (bvand (bvxor (select (arr!47210 a!2862) j!93) (bvlshr (select (arr!47210 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129984 (bvmul (bvxor h!35058 (bvlshr h!35058 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129984 (bvlshr x!129984 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!971556 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!971556 #b00000000000000000000000000000000))))))

(assert (=> d!154895 (= (toIndex!0 (select (arr!47210 a!2862) j!93) mask!2687) (bvand (bvxor lt!632756 (bvlshr lt!632756 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1438897 d!154895))

(declare-fun d!154897 () Bool)

(assert (=> d!154897 (= (validKeyInArray!0 (select (arr!47210 a!2862) i!1006)) (and (not (= (select (arr!47210 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47210 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1438892 d!154897))

(declare-fun d!154899 () Bool)

(assert (=> d!154899 (= (validKeyInArray!0 (select (arr!47210 a!2862) j!93)) (and (not (= (select (arr!47210 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47210 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1438898 d!154899))

(push 1)

(assert (not bm!67690))

(assert (not b!1439131))

(assert (not b!1439124))

(assert (not d!154881))

(assert (not b!1439161))

(assert (not b!1439096))

(assert (not b!1439097))

(assert (not d!154893))

(assert (not b!1439125))

(assert (not d!154845))

(assert (not b!1439098))

(assert (not b!1439061))

(assert (not bm!67684))

(check-sat)

(pop 1)

(push 1)

(check-sat)

