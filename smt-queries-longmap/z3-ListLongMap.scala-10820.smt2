; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126570 () Bool)

(assert start!126570)

(declare-fun b!1485745 () Bool)

(declare-fun res!1010410 () Bool)

(declare-fun e!832907 () Bool)

(assert (=> b!1485745 (=> (not res!1010410) (not e!832907))))

(declare-datatypes ((array!99532 0))(
  ( (array!99533 (arr!48042 (Array (_ BitVec 32) (_ BitVec 64))) (size!48592 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99532)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99532 (_ BitVec 32)) Bool)

(assert (=> b!1485745 (= res!1010410 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1485746 () Bool)

(declare-fun e!832899 () Bool)

(declare-fun e!832898 () Bool)

(assert (=> b!1485746 (= e!832899 (not e!832898))))

(declare-fun res!1010402 () Bool)

(assert (=> b!1485746 (=> res!1010402 e!832898)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1485746 (= res!1010402 (or (and (= (select (arr!48042 a!2862) index!646) (select (store (arr!48042 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48042 a!2862) index!646) (select (arr!48042 a!2862) j!93))) (= (select (arr!48042 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!832905 () Bool)

(assert (=> b!1485746 e!832905))

(declare-fun res!1010399 () Bool)

(assert (=> b!1485746 (=> (not res!1010399) (not e!832905))))

(assert (=> b!1485746 (= res!1010399 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49904 0))(
  ( (Unit!49905) )
))
(declare-fun lt!648195 () Unit!49904)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99532 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49904)

(assert (=> b!1485746 (= lt!648195 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1485747 () Bool)

(declare-fun e!832903 () Bool)

(declare-fun e!832904 () Bool)

(assert (=> b!1485747 (= e!832903 e!832904)))

(declare-fun res!1010406 () Bool)

(assert (=> b!1485747 (=> (not res!1010406) (not e!832904))))

(declare-datatypes ((SeekEntryResult!12282 0))(
  ( (MissingZero!12282 (index!51520 (_ BitVec 32))) (Found!12282 (index!51521 (_ BitVec 32))) (Intermediate!12282 (undefined!13094 Bool) (index!51522 (_ BitVec 32)) (x!133094 (_ BitVec 32))) (Undefined!12282) (MissingVacant!12282 (index!51523 (_ BitVec 32))) )
))
(declare-fun lt!648196 () SeekEntryResult!12282)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99532 (_ BitVec 32)) SeekEntryResult!12282)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485747 (= res!1010406 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48042 a!2862) j!93) mask!2687) (select (arr!48042 a!2862) j!93) a!2862 mask!2687) lt!648196))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1485747 (= lt!648196 (Intermediate!12282 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1010407 () Bool)

(assert (=> start!126570 (=> (not res!1010407) (not e!832907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126570 (= res!1010407 (validMask!0 mask!2687))))

(assert (=> start!126570 e!832907))

(assert (=> start!126570 true))

(declare-fun array_inv!37070 (array!99532) Bool)

(assert (=> start!126570 (array_inv!37070 a!2862)))

(declare-fun b!1485748 () Bool)

(declare-fun res!1010409 () Bool)

(assert (=> b!1485748 (=> (not res!1010409) (not e!832907))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1485748 (= res!1010409 (validKeyInArray!0 (select (arr!48042 a!2862) j!93)))))

(declare-fun b!1485749 () Bool)

(declare-fun res!1010413 () Bool)

(assert (=> b!1485749 (=> (not res!1010413) (not e!832907))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1485749 (= res!1010413 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48592 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48592 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48592 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1485750 () Bool)

(declare-fun res!1010405 () Bool)

(assert (=> b!1485750 (=> (not res!1010405) (not e!832899))))

(declare-fun e!832906 () Bool)

(assert (=> b!1485750 (= res!1010405 e!832906)))

(declare-fun c!137196 () Bool)

(assert (=> b!1485750 (= c!137196 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1485751 () Bool)

(declare-fun lt!648201 () (_ BitVec 64))

(declare-fun lt!648198 () SeekEntryResult!12282)

(declare-fun lt!648200 () array!99532)

(assert (=> b!1485751 (= e!832906 (= lt!648198 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648201 lt!648200 mask!2687)))))

(declare-fun b!1485752 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99532 (_ BitVec 32)) SeekEntryResult!12282)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99532 (_ BitVec 32)) SeekEntryResult!12282)

(assert (=> b!1485752 (= e!832906 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648201 lt!648200 mask!2687) (seekEntryOrOpen!0 lt!648201 lt!648200 mask!2687)))))

(declare-fun b!1485753 () Bool)

(declare-fun res!1010411 () Bool)

(assert (=> b!1485753 (=> (not res!1010411) (not e!832905))))

(assert (=> b!1485753 (= res!1010411 (or (= (select (arr!48042 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48042 a!2862) intermediateBeforeIndex!19) (select (arr!48042 a!2862) j!93))))))

(declare-fun b!1485754 () Bool)

(declare-fun res!1010408 () Bool)

(assert (=> b!1485754 (=> (not res!1010408) (not e!832899))))

(assert (=> b!1485754 (= res!1010408 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1485755 () Bool)

(declare-fun res!1010412 () Bool)

(assert (=> b!1485755 (=> (not res!1010412) (not e!832907))))

(declare-datatypes ((List!34543 0))(
  ( (Nil!34540) (Cons!34539 (h!35913 (_ BitVec 64)) (t!49237 List!34543)) )
))
(declare-fun arrayNoDuplicates!0 (array!99532 (_ BitVec 32) List!34543) Bool)

(assert (=> b!1485755 (= res!1010412 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34540))))

(declare-fun b!1485756 () Bool)

(declare-fun res!1010400 () Bool)

(assert (=> b!1485756 (=> (not res!1010400) (not e!832907))))

(assert (=> b!1485756 (= res!1010400 (validKeyInArray!0 (select (arr!48042 a!2862) i!1006)))))

(declare-fun b!1485757 () Bool)

(declare-fun res!1010403 () Bool)

(assert (=> b!1485757 (=> (not res!1010403) (not e!832907))))

(assert (=> b!1485757 (= res!1010403 (and (= (size!48592 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48592 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48592 a!2862)) (not (= i!1006 j!93))))))

(declare-fun lt!648197 () (_ BitVec 32))

(declare-fun b!1485758 () Bool)

(assert (=> b!1485758 (= e!832898 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (and (bvsge lt!648197 #b00000000000000000000000000000000) (bvslt lt!648197 (size!48592 a!2862)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485758 (= lt!648197 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1485759 () Bool)

(assert (=> b!1485759 (= e!832904 e!832899)))

(declare-fun res!1010416 () Bool)

(assert (=> b!1485759 (=> (not res!1010416) (not e!832899))))

(assert (=> b!1485759 (= res!1010416 (= lt!648198 (Intermediate!12282 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1485759 (= lt!648198 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648201 mask!2687) lt!648201 lt!648200 mask!2687))))

(assert (=> b!1485759 (= lt!648201 (select (store (arr!48042 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1485760 () Bool)

(declare-fun e!832900 () Bool)

(assert (=> b!1485760 (= e!832905 e!832900)))

(declare-fun res!1010398 () Bool)

(assert (=> b!1485760 (=> res!1010398 e!832900)))

(declare-fun lt!648199 () (_ BitVec 64))

(assert (=> b!1485760 (= res!1010398 (or (and (= (select (arr!48042 a!2862) index!646) lt!648199) (= (select (arr!48042 a!2862) index!646) (select (arr!48042 a!2862) j!93))) (= (select (arr!48042 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485760 (= lt!648199 (select (store (arr!48042 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1485761 () Bool)

(declare-fun res!1010404 () Bool)

(assert (=> b!1485761 (=> (not res!1010404) (not e!832905))))

(assert (=> b!1485761 (= res!1010404 (= (seekEntryOrOpen!0 (select (arr!48042 a!2862) j!93) a!2862 mask!2687) (Found!12282 j!93)))))

(declare-fun b!1485762 () Bool)

(declare-fun res!1010401 () Bool)

(assert (=> b!1485762 (=> (not res!1010401) (not e!832904))))

(assert (=> b!1485762 (= res!1010401 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48042 a!2862) j!93) a!2862 mask!2687) lt!648196))))

(declare-fun b!1485763 () Bool)

(declare-fun e!832901 () Bool)

(assert (=> b!1485763 (= e!832901 (= (seekEntryOrOpen!0 lt!648201 lt!648200 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648201 lt!648200 mask!2687)))))

(declare-fun b!1485764 () Bool)

(assert (=> b!1485764 (= e!832900 e!832901)))

(declare-fun res!1010415 () Bool)

(assert (=> b!1485764 (=> (not res!1010415) (not e!832901))))

(assert (=> b!1485764 (= res!1010415 (and (= index!646 intermediateAfterIndex!19) (= lt!648199 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1485765 () Bool)

(assert (=> b!1485765 (= e!832907 e!832903)))

(declare-fun res!1010414 () Bool)

(assert (=> b!1485765 (=> (not res!1010414) (not e!832903))))

(assert (=> b!1485765 (= res!1010414 (= (select (store (arr!48042 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1485765 (= lt!648200 (array!99533 (store (arr!48042 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48592 a!2862)))))

(assert (= (and start!126570 res!1010407) b!1485757))

(assert (= (and b!1485757 res!1010403) b!1485756))

(assert (= (and b!1485756 res!1010400) b!1485748))

(assert (= (and b!1485748 res!1010409) b!1485745))

(assert (= (and b!1485745 res!1010410) b!1485755))

(assert (= (and b!1485755 res!1010412) b!1485749))

(assert (= (and b!1485749 res!1010413) b!1485765))

(assert (= (and b!1485765 res!1010414) b!1485747))

(assert (= (and b!1485747 res!1010406) b!1485762))

(assert (= (and b!1485762 res!1010401) b!1485759))

(assert (= (and b!1485759 res!1010416) b!1485750))

(assert (= (and b!1485750 c!137196) b!1485751))

(assert (= (and b!1485750 (not c!137196)) b!1485752))

(assert (= (and b!1485750 res!1010405) b!1485754))

(assert (= (and b!1485754 res!1010408) b!1485746))

(assert (= (and b!1485746 res!1010399) b!1485761))

(assert (= (and b!1485761 res!1010404) b!1485753))

(assert (= (and b!1485753 res!1010411) b!1485760))

(assert (= (and b!1485760 (not res!1010398)) b!1485764))

(assert (= (and b!1485764 res!1010415) b!1485763))

(assert (= (and b!1485746 (not res!1010402)) b!1485758))

(declare-fun m!1370825 () Bool)

(assert (=> b!1485759 m!1370825))

(assert (=> b!1485759 m!1370825))

(declare-fun m!1370827 () Bool)

(assert (=> b!1485759 m!1370827))

(declare-fun m!1370829 () Bool)

(assert (=> b!1485759 m!1370829))

(declare-fun m!1370831 () Bool)

(assert (=> b!1485759 m!1370831))

(assert (=> b!1485765 m!1370829))

(declare-fun m!1370833 () Bool)

(assert (=> b!1485765 m!1370833))

(declare-fun m!1370835 () Bool)

(assert (=> b!1485758 m!1370835))

(declare-fun m!1370837 () Bool)

(assert (=> b!1485755 m!1370837))

(declare-fun m!1370839 () Bool)

(assert (=> b!1485752 m!1370839))

(declare-fun m!1370841 () Bool)

(assert (=> b!1485752 m!1370841))

(assert (=> b!1485763 m!1370841))

(assert (=> b!1485763 m!1370839))

(declare-fun m!1370843 () Bool)

(assert (=> b!1485748 m!1370843))

(assert (=> b!1485748 m!1370843))

(declare-fun m!1370845 () Bool)

(assert (=> b!1485748 m!1370845))

(assert (=> b!1485761 m!1370843))

(assert (=> b!1485761 m!1370843))

(declare-fun m!1370847 () Bool)

(assert (=> b!1485761 m!1370847))

(declare-fun m!1370849 () Bool)

(assert (=> b!1485756 m!1370849))

(assert (=> b!1485756 m!1370849))

(declare-fun m!1370851 () Bool)

(assert (=> b!1485756 m!1370851))

(declare-fun m!1370853 () Bool)

(assert (=> start!126570 m!1370853))

(declare-fun m!1370855 () Bool)

(assert (=> start!126570 m!1370855))

(declare-fun m!1370857 () Bool)

(assert (=> b!1485745 m!1370857))

(declare-fun m!1370859 () Bool)

(assert (=> b!1485746 m!1370859))

(assert (=> b!1485746 m!1370829))

(declare-fun m!1370861 () Bool)

(assert (=> b!1485746 m!1370861))

(declare-fun m!1370863 () Bool)

(assert (=> b!1485746 m!1370863))

(declare-fun m!1370865 () Bool)

(assert (=> b!1485746 m!1370865))

(assert (=> b!1485746 m!1370843))

(assert (=> b!1485760 m!1370863))

(assert (=> b!1485760 m!1370843))

(assert (=> b!1485760 m!1370829))

(assert (=> b!1485760 m!1370861))

(assert (=> b!1485747 m!1370843))

(assert (=> b!1485747 m!1370843))

(declare-fun m!1370867 () Bool)

(assert (=> b!1485747 m!1370867))

(assert (=> b!1485747 m!1370867))

(assert (=> b!1485747 m!1370843))

(declare-fun m!1370869 () Bool)

(assert (=> b!1485747 m!1370869))

(declare-fun m!1370871 () Bool)

(assert (=> b!1485753 m!1370871))

(assert (=> b!1485753 m!1370843))

(declare-fun m!1370873 () Bool)

(assert (=> b!1485751 m!1370873))

(assert (=> b!1485762 m!1370843))

(assert (=> b!1485762 m!1370843))

(declare-fun m!1370875 () Bool)

(assert (=> b!1485762 m!1370875))

(check-sat (not b!1485748) (not b!1485746) (not b!1485756) (not b!1485747) (not b!1485763) (not b!1485751) (not b!1485761) (not b!1485755) (not b!1485745) (not start!126570) (not b!1485758) (not b!1485752) (not b!1485762) (not b!1485759))
(check-sat)
(get-model)

(declare-fun d!156421 () Bool)

(assert (=> d!156421 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126570 d!156421))

(declare-fun d!156423 () Bool)

(assert (=> d!156423 (= (array_inv!37070 a!2862) (bvsge (size!48592 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126570 d!156423))

(declare-fun d!156425 () Bool)

(assert (=> d!156425 (= (validKeyInArray!0 (select (arr!48042 a!2862) j!93)) (and (not (= (select (arr!48042 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48042 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1485748 d!156425))

(declare-fun b!1485847 () Bool)

(declare-fun lt!648228 () SeekEntryResult!12282)

(assert (=> b!1485847 (and (bvsge (index!51522 lt!648228) #b00000000000000000000000000000000) (bvslt (index!51522 lt!648228) (size!48592 lt!648200)))))

(declare-fun res!1010482 () Bool)

(assert (=> b!1485847 (= res!1010482 (= (select (arr!48042 lt!648200) (index!51522 lt!648228)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!832948 () Bool)

(assert (=> b!1485847 (=> res!1010482 e!832948)))

(declare-fun b!1485848 () Bool)

(declare-fun e!832950 () SeekEntryResult!12282)

(declare-fun e!832949 () SeekEntryResult!12282)

(assert (=> b!1485848 (= e!832950 e!832949)))

(declare-fun c!137208 () Bool)

(declare-fun lt!648227 () (_ BitVec 64))

(assert (=> b!1485848 (= c!137208 (or (= lt!648227 lt!648201) (= (bvadd lt!648227 lt!648227) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1485849 () Bool)

(assert (=> b!1485849 (and (bvsge (index!51522 lt!648228) #b00000000000000000000000000000000) (bvslt (index!51522 lt!648228) (size!48592 lt!648200)))))

(assert (=> b!1485849 (= e!832948 (= (select (arr!48042 lt!648200) (index!51522 lt!648228)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1485850 () Bool)

(declare-fun e!832951 () Bool)

(assert (=> b!1485850 (= e!832951 (bvsge (x!133094 lt!648228) #b01111111111111111111111111111110))))

(declare-fun b!1485851 () Bool)

(assert (=> b!1485851 (= e!832949 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!648201 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!648201 lt!648200 mask!2687))))

(declare-fun b!1485852 () Bool)

(assert (=> b!1485852 (and (bvsge (index!51522 lt!648228) #b00000000000000000000000000000000) (bvslt (index!51522 lt!648228) (size!48592 lt!648200)))))

(declare-fun res!1010481 () Bool)

(assert (=> b!1485852 (= res!1010481 (= (select (arr!48042 lt!648200) (index!51522 lt!648228)) lt!648201))))

(assert (=> b!1485852 (=> res!1010481 e!832948)))

(declare-fun e!832952 () Bool)

(assert (=> b!1485852 (= e!832952 e!832948)))

(declare-fun b!1485853 () Bool)

(assert (=> b!1485853 (= e!832949 (Intermediate!12282 false (toIndex!0 lt!648201 mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!156427 () Bool)

(assert (=> d!156427 e!832951))

(declare-fun c!137206 () Bool)

(get-info :version)

(assert (=> d!156427 (= c!137206 (and ((_ is Intermediate!12282) lt!648228) (undefined!13094 lt!648228)))))

(assert (=> d!156427 (= lt!648228 e!832950)))

(declare-fun c!137207 () Bool)

(assert (=> d!156427 (= c!137207 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156427 (= lt!648227 (select (arr!48042 lt!648200) (toIndex!0 lt!648201 mask!2687)))))

(assert (=> d!156427 (validMask!0 mask!2687)))

(assert (=> d!156427 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648201 mask!2687) lt!648201 lt!648200 mask!2687) lt!648228)))

(declare-fun b!1485854 () Bool)

(assert (=> b!1485854 (= e!832951 e!832952)))

(declare-fun res!1010480 () Bool)

(assert (=> b!1485854 (= res!1010480 (and ((_ is Intermediate!12282) lt!648228) (not (undefined!13094 lt!648228)) (bvslt (x!133094 lt!648228) #b01111111111111111111111111111110) (bvsge (x!133094 lt!648228) #b00000000000000000000000000000000) (bvsge (x!133094 lt!648228) #b00000000000000000000000000000000)))))

(assert (=> b!1485854 (=> (not res!1010480) (not e!832952))))

(declare-fun b!1485855 () Bool)

(assert (=> b!1485855 (= e!832950 (Intermediate!12282 true (toIndex!0 lt!648201 mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!156427 c!137207) b!1485855))

(assert (= (and d!156427 (not c!137207)) b!1485848))

(assert (= (and b!1485848 c!137208) b!1485853))

(assert (= (and b!1485848 (not c!137208)) b!1485851))

(assert (= (and d!156427 c!137206) b!1485850))

(assert (= (and d!156427 (not c!137206)) b!1485854))

(assert (= (and b!1485854 res!1010480) b!1485852))

(assert (= (and b!1485852 (not res!1010481)) b!1485847))

(assert (= (and b!1485847 (not res!1010482)) b!1485849))

(assert (=> b!1485851 m!1370825))

(declare-fun m!1370929 () Bool)

(assert (=> b!1485851 m!1370929))

(assert (=> b!1485851 m!1370929))

(declare-fun m!1370931 () Bool)

(assert (=> b!1485851 m!1370931))

(declare-fun m!1370933 () Bool)

(assert (=> b!1485847 m!1370933))

(assert (=> b!1485849 m!1370933))

(assert (=> b!1485852 m!1370933))

(assert (=> d!156427 m!1370825))

(declare-fun m!1370935 () Bool)

(assert (=> d!156427 m!1370935))

(assert (=> d!156427 m!1370853))

(assert (=> b!1485759 d!156427))

(declare-fun d!156429 () Bool)

(declare-fun lt!648234 () (_ BitVec 32))

(declare-fun lt!648233 () (_ BitVec 32))

(assert (=> d!156429 (= lt!648234 (bvmul (bvxor lt!648233 (bvlshr lt!648233 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156429 (= lt!648233 ((_ extract 31 0) (bvand (bvxor lt!648201 (bvlshr lt!648201 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156429 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1010483 (let ((h!35915 ((_ extract 31 0) (bvand (bvxor lt!648201 (bvlshr lt!648201 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133097 (bvmul (bvxor h!35915 (bvlshr h!35915 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133097 (bvlshr x!133097 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1010483 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1010483 #b00000000000000000000000000000000))))))

(assert (=> d!156429 (= (toIndex!0 lt!648201 mask!2687) (bvand (bvxor lt!648234 (bvlshr lt!648234 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1485759 d!156429))

(declare-fun d!156431 () Bool)

(declare-fun lt!648237 () (_ BitVec 32))

(assert (=> d!156431 (and (bvsge lt!648237 #b00000000000000000000000000000000) (bvslt lt!648237 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156431 (= lt!648237 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!156431 (validMask!0 mask!2687)))

(assert (=> d!156431 (= (nextIndex!0 index!646 x!665 mask!2687) lt!648237)))

(declare-fun bs!42758 () Bool)

(assert (= bs!42758 d!156431))

(declare-fun m!1370937 () Bool)

(assert (=> bs!42758 m!1370937))

(assert (=> bs!42758 m!1370853))

(assert (=> b!1485758 d!156431))

(declare-fun b!1485856 () Bool)

(declare-fun lt!648239 () SeekEntryResult!12282)

(assert (=> b!1485856 (and (bvsge (index!51522 lt!648239) #b00000000000000000000000000000000) (bvslt (index!51522 lt!648239) (size!48592 a!2862)))))

(declare-fun res!1010486 () Bool)

(assert (=> b!1485856 (= res!1010486 (= (select (arr!48042 a!2862) (index!51522 lt!648239)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!832953 () Bool)

(assert (=> b!1485856 (=> res!1010486 e!832953)))

(declare-fun b!1485857 () Bool)

(declare-fun e!832955 () SeekEntryResult!12282)

(declare-fun e!832954 () SeekEntryResult!12282)

(assert (=> b!1485857 (= e!832955 e!832954)))

(declare-fun lt!648238 () (_ BitVec 64))

(declare-fun c!137211 () Bool)

(assert (=> b!1485857 (= c!137211 (or (= lt!648238 (select (arr!48042 a!2862) j!93)) (= (bvadd lt!648238 lt!648238) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1485858 () Bool)

(assert (=> b!1485858 (and (bvsge (index!51522 lt!648239) #b00000000000000000000000000000000) (bvslt (index!51522 lt!648239) (size!48592 a!2862)))))

(assert (=> b!1485858 (= e!832953 (= (select (arr!48042 a!2862) (index!51522 lt!648239)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1485859 () Bool)

(declare-fun e!832956 () Bool)

(assert (=> b!1485859 (= e!832956 (bvsge (x!133094 lt!648239) #b01111111111111111111111111111110))))

(declare-fun b!1485860 () Bool)

(assert (=> b!1485860 (= e!832954 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48042 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48042 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1485861 () Bool)

(assert (=> b!1485861 (and (bvsge (index!51522 lt!648239) #b00000000000000000000000000000000) (bvslt (index!51522 lt!648239) (size!48592 a!2862)))))

(declare-fun res!1010485 () Bool)

(assert (=> b!1485861 (= res!1010485 (= (select (arr!48042 a!2862) (index!51522 lt!648239)) (select (arr!48042 a!2862) j!93)))))

(assert (=> b!1485861 (=> res!1010485 e!832953)))

(declare-fun e!832957 () Bool)

(assert (=> b!1485861 (= e!832957 e!832953)))

(declare-fun b!1485862 () Bool)

(assert (=> b!1485862 (= e!832954 (Intermediate!12282 false (toIndex!0 (select (arr!48042 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun d!156433 () Bool)

(assert (=> d!156433 e!832956))

(declare-fun c!137209 () Bool)

(assert (=> d!156433 (= c!137209 (and ((_ is Intermediate!12282) lt!648239) (undefined!13094 lt!648239)))))

(assert (=> d!156433 (= lt!648239 e!832955)))

(declare-fun c!137210 () Bool)

(assert (=> d!156433 (= c!137210 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156433 (= lt!648238 (select (arr!48042 a!2862) (toIndex!0 (select (arr!48042 a!2862) j!93) mask!2687)))))

(assert (=> d!156433 (validMask!0 mask!2687)))

(assert (=> d!156433 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48042 a!2862) j!93) mask!2687) (select (arr!48042 a!2862) j!93) a!2862 mask!2687) lt!648239)))

(declare-fun b!1485863 () Bool)

(assert (=> b!1485863 (= e!832956 e!832957)))

(declare-fun res!1010484 () Bool)

(assert (=> b!1485863 (= res!1010484 (and ((_ is Intermediate!12282) lt!648239) (not (undefined!13094 lt!648239)) (bvslt (x!133094 lt!648239) #b01111111111111111111111111111110) (bvsge (x!133094 lt!648239) #b00000000000000000000000000000000) (bvsge (x!133094 lt!648239) #b00000000000000000000000000000000)))))

(assert (=> b!1485863 (=> (not res!1010484) (not e!832957))))

(declare-fun b!1485864 () Bool)

(assert (=> b!1485864 (= e!832955 (Intermediate!12282 true (toIndex!0 (select (arr!48042 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(assert (= (and d!156433 c!137210) b!1485864))

(assert (= (and d!156433 (not c!137210)) b!1485857))

(assert (= (and b!1485857 c!137211) b!1485862))

(assert (= (and b!1485857 (not c!137211)) b!1485860))

(assert (= (and d!156433 c!137209) b!1485859))

(assert (= (and d!156433 (not c!137209)) b!1485863))

(assert (= (and b!1485863 res!1010484) b!1485861))

(assert (= (and b!1485861 (not res!1010485)) b!1485856))

(assert (= (and b!1485856 (not res!1010486)) b!1485858))

(assert (=> b!1485860 m!1370867))

(declare-fun m!1370939 () Bool)

(assert (=> b!1485860 m!1370939))

(assert (=> b!1485860 m!1370939))

(assert (=> b!1485860 m!1370843))

(declare-fun m!1370941 () Bool)

(assert (=> b!1485860 m!1370941))

(declare-fun m!1370943 () Bool)

(assert (=> b!1485856 m!1370943))

(assert (=> b!1485858 m!1370943))

(assert (=> b!1485861 m!1370943))

(assert (=> d!156433 m!1370867))

(declare-fun m!1370945 () Bool)

(assert (=> d!156433 m!1370945))

(assert (=> d!156433 m!1370853))

(assert (=> b!1485747 d!156433))

(declare-fun d!156435 () Bool)

(declare-fun lt!648241 () (_ BitVec 32))

(declare-fun lt!648240 () (_ BitVec 32))

(assert (=> d!156435 (= lt!648241 (bvmul (bvxor lt!648240 (bvlshr lt!648240 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156435 (= lt!648240 ((_ extract 31 0) (bvand (bvxor (select (arr!48042 a!2862) j!93) (bvlshr (select (arr!48042 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156435 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1010483 (let ((h!35915 ((_ extract 31 0) (bvand (bvxor (select (arr!48042 a!2862) j!93) (bvlshr (select (arr!48042 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133097 (bvmul (bvxor h!35915 (bvlshr h!35915 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133097 (bvlshr x!133097 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1010483 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1010483 #b00000000000000000000000000000000))))))

(assert (=> d!156435 (= (toIndex!0 (select (arr!48042 a!2862) j!93) mask!2687) (bvand (bvxor lt!648241 (bvlshr lt!648241 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1485747 d!156435))

(declare-fun b!1485873 () Bool)

(declare-fun e!832964 () Bool)

(declare-fun call!67876 () Bool)

(assert (=> b!1485873 (= e!832964 call!67876)))

(declare-fun b!1485874 () Bool)

(declare-fun e!832966 () Bool)

(assert (=> b!1485874 (= e!832966 e!832964)))

(declare-fun lt!648249 () (_ BitVec 64))

(assert (=> b!1485874 (= lt!648249 (select (arr!48042 a!2862) j!93))))

(declare-fun lt!648250 () Unit!49904)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99532 (_ BitVec 64) (_ BitVec 32)) Unit!49904)

(assert (=> b!1485874 (= lt!648250 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!648249 j!93))))

(declare-fun arrayContainsKey!0 (array!99532 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1485874 (arrayContainsKey!0 a!2862 lt!648249 #b00000000000000000000000000000000)))

(declare-fun lt!648248 () Unit!49904)

(assert (=> b!1485874 (= lt!648248 lt!648250)))

(declare-fun res!1010492 () Bool)

(assert (=> b!1485874 (= res!1010492 (= (seekEntryOrOpen!0 (select (arr!48042 a!2862) j!93) a!2862 mask!2687) (Found!12282 j!93)))))

(assert (=> b!1485874 (=> (not res!1010492) (not e!832964))))

(declare-fun d!156437 () Bool)

(declare-fun res!1010491 () Bool)

(declare-fun e!832965 () Bool)

(assert (=> d!156437 (=> res!1010491 e!832965)))

(assert (=> d!156437 (= res!1010491 (bvsge j!93 (size!48592 a!2862)))))

(assert (=> d!156437 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!832965)))

(declare-fun bm!67873 () Bool)

(assert (=> bm!67873 (= call!67876 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1485875 () Bool)

(assert (=> b!1485875 (= e!832965 e!832966)))

(declare-fun c!137214 () Bool)

(assert (=> b!1485875 (= c!137214 (validKeyInArray!0 (select (arr!48042 a!2862) j!93)))))

(declare-fun b!1485876 () Bool)

(assert (=> b!1485876 (= e!832966 call!67876)))

(assert (= (and d!156437 (not res!1010491)) b!1485875))

(assert (= (and b!1485875 c!137214) b!1485874))

(assert (= (and b!1485875 (not c!137214)) b!1485876))

(assert (= (and b!1485874 res!1010492) b!1485873))

(assert (= (or b!1485873 b!1485876) bm!67873))

(assert (=> b!1485874 m!1370843))

(declare-fun m!1370947 () Bool)

(assert (=> b!1485874 m!1370947))

(declare-fun m!1370949 () Bool)

(assert (=> b!1485874 m!1370949))

(assert (=> b!1485874 m!1370843))

(assert (=> b!1485874 m!1370847))

(declare-fun m!1370951 () Bool)

(assert (=> bm!67873 m!1370951))

(assert (=> b!1485875 m!1370843))

(assert (=> b!1485875 m!1370843))

(assert (=> b!1485875 m!1370845))

(assert (=> b!1485746 d!156437))

(declare-fun d!156443 () Bool)

(assert (=> d!156443 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!648256 () Unit!49904)

(declare-fun choose!38 (array!99532 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49904)

(assert (=> d!156443 (= lt!648256 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156443 (validMask!0 mask!2687)))

(assert (=> d!156443 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!648256)))

(declare-fun bs!42760 () Bool)

(assert (= bs!42760 d!156443))

(assert (=> bs!42760 m!1370865))

(declare-fun m!1370955 () Bool)

(assert (=> bs!42760 m!1370955))

(assert (=> bs!42760 m!1370853))

(assert (=> b!1485746 d!156443))

(declare-fun d!156449 () Bool)

(assert (=> d!156449 (= (validKeyInArray!0 (select (arr!48042 a!2862) i!1006)) (and (not (= (select (arr!48042 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48042 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1485756 d!156449))

(declare-fun b!1485877 () Bool)

(declare-fun e!832967 () Bool)

(declare-fun call!67877 () Bool)

(assert (=> b!1485877 (= e!832967 call!67877)))

(declare-fun b!1485878 () Bool)

(declare-fun e!832969 () Bool)

(assert (=> b!1485878 (= e!832969 e!832967)))

(declare-fun lt!648258 () (_ BitVec 64))

(assert (=> b!1485878 (= lt!648258 (select (arr!48042 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!648259 () Unit!49904)

(assert (=> b!1485878 (= lt!648259 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!648258 #b00000000000000000000000000000000))))

(assert (=> b!1485878 (arrayContainsKey!0 a!2862 lt!648258 #b00000000000000000000000000000000)))

(declare-fun lt!648257 () Unit!49904)

(assert (=> b!1485878 (= lt!648257 lt!648259)))

(declare-fun res!1010494 () Bool)

(assert (=> b!1485878 (= res!1010494 (= (seekEntryOrOpen!0 (select (arr!48042 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12282 #b00000000000000000000000000000000)))))

(assert (=> b!1485878 (=> (not res!1010494) (not e!832967))))

(declare-fun d!156451 () Bool)

(declare-fun res!1010493 () Bool)

(declare-fun e!832968 () Bool)

(assert (=> d!156451 (=> res!1010493 e!832968)))

(assert (=> d!156451 (= res!1010493 (bvsge #b00000000000000000000000000000000 (size!48592 a!2862)))))

(assert (=> d!156451 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!832968)))

(declare-fun bm!67874 () Bool)

(assert (=> bm!67874 (= call!67877 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1485879 () Bool)

(assert (=> b!1485879 (= e!832968 e!832969)))

(declare-fun c!137215 () Bool)

(assert (=> b!1485879 (= c!137215 (validKeyInArray!0 (select (arr!48042 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1485880 () Bool)

(assert (=> b!1485880 (= e!832969 call!67877)))

(assert (= (and d!156451 (not res!1010493)) b!1485879))

(assert (= (and b!1485879 c!137215) b!1485878))

(assert (= (and b!1485879 (not c!137215)) b!1485880))

(assert (= (and b!1485878 res!1010494) b!1485877))

(assert (= (or b!1485877 b!1485880) bm!67874))

(declare-fun m!1370957 () Bool)

(assert (=> b!1485878 m!1370957))

(declare-fun m!1370959 () Bool)

(assert (=> b!1485878 m!1370959))

(declare-fun m!1370961 () Bool)

(assert (=> b!1485878 m!1370961))

(assert (=> b!1485878 m!1370957))

(declare-fun m!1370963 () Bool)

(assert (=> b!1485878 m!1370963))

(declare-fun m!1370965 () Bool)

(assert (=> bm!67874 m!1370965))

(assert (=> b!1485879 m!1370957))

(assert (=> b!1485879 m!1370957))

(declare-fun m!1370967 () Bool)

(assert (=> b!1485879 m!1370967))

(assert (=> b!1485745 d!156451))

(declare-fun b!1485891 () Bool)

(declare-fun e!832981 () Bool)

(declare-fun call!67880 () Bool)

(assert (=> b!1485891 (= e!832981 call!67880)))

(declare-fun b!1485892 () Bool)

(declare-fun e!832979 () Bool)

(declare-fun e!832978 () Bool)

(assert (=> b!1485892 (= e!832979 e!832978)))

(declare-fun res!1010502 () Bool)

(assert (=> b!1485892 (=> (not res!1010502) (not e!832978))))

(declare-fun e!832980 () Bool)

(assert (=> b!1485892 (= res!1010502 (not e!832980))))

(declare-fun res!1010503 () Bool)

(assert (=> b!1485892 (=> (not res!1010503) (not e!832980))))

(assert (=> b!1485892 (= res!1010503 (validKeyInArray!0 (select (arr!48042 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1485893 () Bool)

(declare-fun contains!9916 (List!34543 (_ BitVec 64)) Bool)

(assert (=> b!1485893 (= e!832980 (contains!9916 Nil!34540 (select (arr!48042 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!156453 () Bool)

(declare-fun res!1010501 () Bool)

(assert (=> d!156453 (=> res!1010501 e!832979)))

(assert (=> d!156453 (= res!1010501 (bvsge #b00000000000000000000000000000000 (size!48592 a!2862)))))

(assert (=> d!156453 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34540) e!832979)))

(declare-fun bm!67877 () Bool)

(declare-fun c!137218 () Bool)

(assert (=> bm!67877 (= call!67880 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!137218 (Cons!34539 (select (arr!48042 a!2862) #b00000000000000000000000000000000) Nil!34540) Nil!34540)))))

(declare-fun b!1485894 () Bool)

(assert (=> b!1485894 (= e!832978 e!832981)))

(assert (=> b!1485894 (= c!137218 (validKeyInArray!0 (select (arr!48042 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1485895 () Bool)

(assert (=> b!1485895 (= e!832981 call!67880)))

(assert (= (and d!156453 (not res!1010501)) b!1485892))

(assert (= (and b!1485892 res!1010503) b!1485893))

(assert (= (and b!1485892 res!1010502) b!1485894))

(assert (= (and b!1485894 c!137218) b!1485895))

(assert (= (and b!1485894 (not c!137218)) b!1485891))

(assert (= (or b!1485895 b!1485891) bm!67877))

(assert (=> b!1485892 m!1370957))

(assert (=> b!1485892 m!1370957))

(assert (=> b!1485892 m!1370967))

(assert (=> b!1485893 m!1370957))

(assert (=> b!1485893 m!1370957))

(declare-fun m!1370969 () Bool)

(assert (=> b!1485893 m!1370969))

(assert (=> bm!67877 m!1370957))

(declare-fun m!1370971 () Bool)

(assert (=> bm!67877 m!1370971))

(assert (=> b!1485894 m!1370957))

(assert (=> b!1485894 m!1370957))

(assert (=> b!1485894 m!1370967))

(assert (=> b!1485755 d!156453))

(declare-fun b!1485957 () Bool)

(declare-fun e!833021 () SeekEntryResult!12282)

(declare-fun e!833020 () SeekEntryResult!12282)

(assert (=> b!1485957 (= e!833021 e!833020)))

(declare-fun c!137240 () Bool)

(declare-fun lt!648280 () (_ BitVec 64))

(assert (=> b!1485957 (= c!137240 (= lt!648280 lt!648201))))

(declare-fun b!1485958 () Bool)

(assert (=> b!1485958 (= e!833020 (Found!12282 index!646))))

(declare-fun b!1485959 () Bool)

(declare-fun e!833022 () SeekEntryResult!12282)

(assert (=> b!1485959 (= e!833022 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!648201 lt!648200 mask!2687))))

(declare-fun b!1485960 () Bool)

(declare-fun c!137241 () Bool)

(assert (=> b!1485960 (= c!137241 (= lt!648280 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1485960 (= e!833020 e!833022)))

(declare-fun lt!648279 () SeekEntryResult!12282)

(declare-fun d!156459 () Bool)

(assert (=> d!156459 (and (or ((_ is Undefined!12282) lt!648279) (not ((_ is Found!12282) lt!648279)) (and (bvsge (index!51521 lt!648279) #b00000000000000000000000000000000) (bvslt (index!51521 lt!648279) (size!48592 lt!648200)))) (or ((_ is Undefined!12282) lt!648279) ((_ is Found!12282) lt!648279) (not ((_ is MissingVacant!12282) lt!648279)) (not (= (index!51523 lt!648279) intermediateAfterIndex!19)) (and (bvsge (index!51523 lt!648279) #b00000000000000000000000000000000) (bvslt (index!51523 lt!648279) (size!48592 lt!648200)))) (or ((_ is Undefined!12282) lt!648279) (ite ((_ is Found!12282) lt!648279) (= (select (arr!48042 lt!648200) (index!51521 lt!648279)) lt!648201) (and ((_ is MissingVacant!12282) lt!648279) (= (index!51523 lt!648279) intermediateAfterIndex!19) (= (select (arr!48042 lt!648200) (index!51523 lt!648279)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156459 (= lt!648279 e!833021)))

(declare-fun c!137239 () Bool)

(assert (=> d!156459 (= c!137239 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156459 (= lt!648280 (select (arr!48042 lt!648200) index!646))))

(assert (=> d!156459 (validMask!0 mask!2687)))

(assert (=> d!156459 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648201 lt!648200 mask!2687) lt!648279)))

(declare-fun b!1485961 () Bool)

(assert (=> b!1485961 (= e!833021 Undefined!12282)))

(declare-fun b!1485962 () Bool)

(assert (=> b!1485962 (= e!833022 (MissingVacant!12282 intermediateAfterIndex!19))))

(assert (= (and d!156459 c!137239) b!1485961))

(assert (= (and d!156459 (not c!137239)) b!1485957))

(assert (= (and b!1485957 c!137240) b!1485958))

(assert (= (and b!1485957 (not c!137240)) b!1485960))

(assert (= (and b!1485960 c!137241) b!1485962))

(assert (= (and b!1485960 (not c!137241)) b!1485959))

(assert (=> b!1485959 m!1370835))

(assert (=> b!1485959 m!1370835))

(declare-fun m!1370991 () Bool)

(assert (=> b!1485959 m!1370991))

(declare-fun m!1370993 () Bool)

(assert (=> d!156459 m!1370993))

(declare-fun m!1370995 () Bool)

(assert (=> d!156459 m!1370995))

(declare-fun m!1370997 () Bool)

(assert (=> d!156459 m!1370997))

(assert (=> d!156459 m!1370853))

(assert (=> b!1485752 d!156459))

(declare-fun b!1486002 () Bool)

(declare-fun e!833046 () SeekEntryResult!12282)

(declare-fun e!833044 () SeekEntryResult!12282)

(assert (=> b!1486002 (= e!833046 e!833044)))

(declare-fun lt!648301 () (_ BitVec 64))

(declare-fun lt!648299 () SeekEntryResult!12282)

(assert (=> b!1486002 (= lt!648301 (select (arr!48042 lt!648200) (index!51522 lt!648299)))))

(declare-fun c!137261 () Bool)

(assert (=> b!1486002 (= c!137261 (= lt!648301 lt!648201))))

(declare-fun b!1486003 () Bool)

(assert (=> b!1486003 (= e!833044 (Found!12282 (index!51522 lt!648299)))))

(declare-fun d!156465 () Bool)

(declare-fun lt!648300 () SeekEntryResult!12282)

(assert (=> d!156465 (and (or ((_ is Undefined!12282) lt!648300) (not ((_ is Found!12282) lt!648300)) (and (bvsge (index!51521 lt!648300) #b00000000000000000000000000000000) (bvslt (index!51521 lt!648300) (size!48592 lt!648200)))) (or ((_ is Undefined!12282) lt!648300) ((_ is Found!12282) lt!648300) (not ((_ is MissingZero!12282) lt!648300)) (and (bvsge (index!51520 lt!648300) #b00000000000000000000000000000000) (bvslt (index!51520 lt!648300) (size!48592 lt!648200)))) (or ((_ is Undefined!12282) lt!648300) ((_ is Found!12282) lt!648300) ((_ is MissingZero!12282) lt!648300) (not ((_ is MissingVacant!12282) lt!648300)) (and (bvsge (index!51523 lt!648300) #b00000000000000000000000000000000) (bvslt (index!51523 lt!648300) (size!48592 lt!648200)))) (or ((_ is Undefined!12282) lt!648300) (ite ((_ is Found!12282) lt!648300) (= (select (arr!48042 lt!648200) (index!51521 lt!648300)) lt!648201) (ite ((_ is MissingZero!12282) lt!648300) (= (select (arr!48042 lt!648200) (index!51520 lt!648300)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12282) lt!648300) (= (select (arr!48042 lt!648200) (index!51523 lt!648300)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156465 (= lt!648300 e!833046)))

(declare-fun c!137262 () Bool)

(assert (=> d!156465 (= c!137262 (and ((_ is Intermediate!12282) lt!648299) (undefined!13094 lt!648299)))))

(assert (=> d!156465 (= lt!648299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648201 mask!2687) lt!648201 lt!648200 mask!2687))))

(assert (=> d!156465 (validMask!0 mask!2687)))

(assert (=> d!156465 (= (seekEntryOrOpen!0 lt!648201 lt!648200 mask!2687) lt!648300)))

(declare-fun b!1486004 () Bool)

(declare-fun c!137260 () Bool)

(assert (=> b!1486004 (= c!137260 (= lt!648301 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833045 () SeekEntryResult!12282)

(assert (=> b!1486004 (= e!833044 e!833045)))

(declare-fun b!1486005 () Bool)

(assert (=> b!1486005 (= e!833045 (seekKeyOrZeroReturnVacant!0 (x!133094 lt!648299) (index!51522 lt!648299) (index!51522 lt!648299) lt!648201 lt!648200 mask!2687))))

(declare-fun b!1486006 () Bool)

(assert (=> b!1486006 (= e!833045 (MissingZero!12282 (index!51522 lt!648299)))))

(declare-fun b!1486007 () Bool)

(assert (=> b!1486007 (= e!833046 Undefined!12282)))

(assert (= (and d!156465 c!137262) b!1486007))

(assert (= (and d!156465 (not c!137262)) b!1486002))

(assert (= (and b!1486002 c!137261) b!1486003))

(assert (= (and b!1486002 (not c!137261)) b!1486004))

(assert (= (and b!1486004 c!137260) b!1486006))

(assert (= (and b!1486004 (not c!137260)) b!1486005))

(declare-fun m!1371015 () Bool)

(assert (=> b!1486002 m!1371015))

(declare-fun m!1371017 () Bool)

(assert (=> d!156465 m!1371017))

(assert (=> d!156465 m!1370825))

(declare-fun m!1371019 () Bool)

(assert (=> d!156465 m!1371019))

(assert (=> d!156465 m!1370825))

(assert (=> d!156465 m!1370827))

(declare-fun m!1371021 () Bool)

(assert (=> d!156465 m!1371021))

(assert (=> d!156465 m!1370853))

(declare-fun m!1371023 () Bool)

(assert (=> b!1486005 m!1371023))

(assert (=> b!1485752 d!156465))

(assert (=> b!1485763 d!156465))

(assert (=> b!1485763 d!156459))

(declare-fun b!1486016 () Bool)

(declare-fun lt!648303 () SeekEntryResult!12282)

(assert (=> b!1486016 (and (bvsge (index!51522 lt!648303) #b00000000000000000000000000000000) (bvslt (index!51522 lt!648303) (size!48592 a!2862)))))

(declare-fun res!1010530 () Bool)

(assert (=> b!1486016 (= res!1010530 (= (select (arr!48042 a!2862) (index!51522 lt!648303)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833051 () Bool)

(assert (=> b!1486016 (=> res!1010530 e!833051)))

(declare-fun b!1486017 () Bool)

(declare-fun e!833053 () SeekEntryResult!12282)

(declare-fun e!833052 () SeekEntryResult!12282)

(assert (=> b!1486017 (= e!833053 e!833052)))

(declare-fun c!137269 () Bool)

(declare-fun lt!648302 () (_ BitVec 64))

(assert (=> b!1486017 (= c!137269 (or (= lt!648302 (select (arr!48042 a!2862) j!93)) (= (bvadd lt!648302 lt!648302) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486018 () Bool)

(assert (=> b!1486018 (and (bvsge (index!51522 lt!648303) #b00000000000000000000000000000000) (bvslt (index!51522 lt!648303) (size!48592 a!2862)))))

(assert (=> b!1486018 (= e!833051 (= (select (arr!48042 a!2862) (index!51522 lt!648303)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1486019 () Bool)

(declare-fun e!833054 () Bool)

(assert (=> b!1486019 (= e!833054 (bvsge (x!133094 lt!648303) #b01111111111111111111111111111110))))

(declare-fun b!1486020 () Bool)

(assert (=> b!1486020 (= e!833052 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48042 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1486021 () Bool)

(assert (=> b!1486021 (and (bvsge (index!51522 lt!648303) #b00000000000000000000000000000000) (bvslt (index!51522 lt!648303) (size!48592 a!2862)))))

(declare-fun res!1010529 () Bool)

(assert (=> b!1486021 (= res!1010529 (= (select (arr!48042 a!2862) (index!51522 lt!648303)) (select (arr!48042 a!2862) j!93)))))

(assert (=> b!1486021 (=> res!1010529 e!833051)))

(declare-fun e!833055 () Bool)

(assert (=> b!1486021 (= e!833055 e!833051)))

(declare-fun b!1486022 () Bool)

(assert (=> b!1486022 (= e!833052 (Intermediate!12282 false index!646 x!665))))

(declare-fun d!156475 () Bool)

(assert (=> d!156475 e!833054))

(declare-fun c!137267 () Bool)

(assert (=> d!156475 (= c!137267 (and ((_ is Intermediate!12282) lt!648303) (undefined!13094 lt!648303)))))

(assert (=> d!156475 (= lt!648303 e!833053)))

(declare-fun c!137268 () Bool)

(assert (=> d!156475 (= c!137268 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156475 (= lt!648302 (select (arr!48042 a!2862) index!646))))

(assert (=> d!156475 (validMask!0 mask!2687)))

(assert (=> d!156475 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48042 a!2862) j!93) a!2862 mask!2687) lt!648303)))

(declare-fun b!1486023 () Bool)

(assert (=> b!1486023 (= e!833054 e!833055)))

(declare-fun res!1010528 () Bool)

(assert (=> b!1486023 (= res!1010528 (and ((_ is Intermediate!12282) lt!648303) (not (undefined!13094 lt!648303)) (bvslt (x!133094 lt!648303) #b01111111111111111111111111111110) (bvsge (x!133094 lt!648303) #b00000000000000000000000000000000) (bvsge (x!133094 lt!648303) x!665)))))

(assert (=> b!1486023 (=> (not res!1010528) (not e!833055))))

(declare-fun b!1486024 () Bool)

(assert (=> b!1486024 (= e!833053 (Intermediate!12282 true index!646 x!665))))

(assert (= (and d!156475 c!137268) b!1486024))

(assert (= (and d!156475 (not c!137268)) b!1486017))

(assert (= (and b!1486017 c!137269) b!1486022))

(assert (= (and b!1486017 (not c!137269)) b!1486020))

(assert (= (and d!156475 c!137267) b!1486019))

(assert (= (and d!156475 (not c!137267)) b!1486023))

(assert (= (and b!1486023 res!1010528) b!1486021))

(assert (= (and b!1486021 (not res!1010529)) b!1486016))

(assert (= (and b!1486016 (not res!1010530)) b!1486018))

(assert (=> b!1486020 m!1370835))

(assert (=> b!1486020 m!1370835))

(assert (=> b!1486020 m!1370843))

(declare-fun m!1371025 () Bool)

(assert (=> b!1486020 m!1371025))

(declare-fun m!1371027 () Bool)

(assert (=> b!1486016 m!1371027))

(assert (=> b!1486018 m!1371027))

(assert (=> b!1486021 m!1371027))

(assert (=> d!156475 m!1370863))

(assert (=> d!156475 m!1370853))

(assert (=> b!1485762 d!156475))

(declare-fun b!1486025 () Bool)

(declare-fun lt!648305 () SeekEntryResult!12282)

(assert (=> b!1486025 (and (bvsge (index!51522 lt!648305) #b00000000000000000000000000000000) (bvslt (index!51522 lt!648305) (size!48592 lt!648200)))))

(declare-fun res!1010533 () Bool)

(assert (=> b!1486025 (= res!1010533 (= (select (arr!48042 lt!648200) (index!51522 lt!648305)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833056 () Bool)

(assert (=> b!1486025 (=> res!1010533 e!833056)))

(declare-fun b!1486026 () Bool)

(declare-fun e!833058 () SeekEntryResult!12282)

(declare-fun e!833057 () SeekEntryResult!12282)

(assert (=> b!1486026 (= e!833058 e!833057)))

(declare-fun c!137272 () Bool)

(declare-fun lt!648304 () (_ BitVec 64))

(assert (=> b!1486026 (= c!137272 (or (= lt!648304 lt!648201) (= (bvadd lt!648304 lt!648304) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486027 () Bool)

(assert (=> b!1486027 (and (bvsge (index!51522 lt!648305) #b00000000000000000000000000000000) (bvslt (index!51522 lt!648305) (size!48592 lt!648200)))))

(assert (=> b!1486027 (= e!833056 (= (select (arr!48042 lt!648200) (index!51522 lt!648305)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1486028 () Bool)

(declare-fun e!833059 () Bool)

(assert (=> b!1486028 (= e!833059 (bvsge (x!133094 lt!648305) #b01111111111111111111111111111110))))

(declare-fun b!1486029 () Bool)

(assert (=> b!1486029 (= e!833057 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!648201 lt!648200 mask!2687))))

(declare-fun b!1486030 () Bool)

(assert (=> b!1486030 (and (bvsge (index!51522 lt!648305) #b00000000000000000000000000000000) (bvslt (index!51522 lt!648305) (size!48592 lt!648200)))))

(declare-fun res!1010532 () Bool)

(assert (=> b!1486030 (= res!1010532 (= (select (arr!48042 lt!648200) (index!51522 lt!648305)) lt!648201))))

(assert (=> b!1486030 (=> res!1010532 e!833056)))

(declare-fun e!833060 () Bool)

(assert (=> b!1486030 (= e!833060 e!833056)))

(declare-fun b!1486031 () Bool)

(assert (=> b!1486031 (= e!833057 (Intermediate!12282 false index!646 x!665))))

(declare-fun d!156477 () Bool)

(assert (=> d!156477 e!833059))

(declare-fun c!137270 () Bool)

(assert (=> d!156477 (= c!137270 (and ((_ is Intermediate!12282) lt!648305) (undefined!13094 lt!648305)))))

(assert (=> d!156477 (= lt!648305 e!833058)))

(declare-fun c!137271 () Bool)

(assert (=> d!156477 (= c!137271 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156477 (= lt!648304 (select (arr!48042 lt!648200) index!646))))

(assert (=> d!156477 (validMask!0 mask!2687)))

(assert (=> d!156477 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648201 lt!648200 mask!2687) lt!648305)))

(declare-fun b!1486032 () Bool)

(assert (=> b!1486032 (= e!833059 e!833060)))

(declare-fun res!1010531 () Bool)

(assert (=> b!1486032 (= res!1010531 (and ((_ is Intermediate!12282) lt!648305) (not (undefined!13094 lt!648305)) (bvslt (x!133094 lt!648305) #b01111111111111111111111111111110) (bvsge (x!133094 lt!648305) #b00000000000000000000000000000000) (bvsge (x!133094 lt!648305) x!665)))))

(assert (=> b!1486032 (=> (not res!1010531) (not e!833060))))

(declare-fun b!1486033 () Bool)

(assert (=> b!1486033 (= e!833058 (Intermediate!12282 true index!646 x!665))))

(assert (= (and d!156477 c!137271) b!1486033))

(assert (= (and d!156477 (not c!137271)) b!1486026))

(assert (= (and b!1486026 c!137272) b!1486031))

(assert (= (and b!1486026 (not c!137272)) b!1486029))

(assert (= (and d!156477 c!137270) b!1486028))

(assert (= (and d!156477 (not c!137270)) b!1486032))

(assert (= (and b!1486032 res!1010531) b!1486030))

(assert (= (and b!1486030 (not res!1010532)) b!1486025))

(assert (= (and b!1486025 (not res!1010533)) b!1486027))

(assert (=> b!1486029 m!1370835))

(assert (=> b!1486029 m!1370835))

(declare-fun m!1371029 () Bool)

(assert (=> b!1486029 m!1371029))

(declare-fun m!1371031 () Bool)

(assert (=> b!1486025 m!1371031))

(assert (=> b!1486027 m!1371031))

(assert (=> b!1486030 m!1371031))

(assert (=> d!156477 m!1370997))

(assert (=> d!156477 m!1370853))

(assert (=> b!1485751 d!156477))

(declare-fun b!1486034 () Bool)

(declare-fun e!833063 () SeekEntryResult!12282)

(declare-fun e!833061 () SeekEntryResult!12282)

(assert (=> b!1486034 (= e!833063 e!833061)))

(declare-fun lt!648308 () (_ BitVec 64))

(declare-fun lt!648306 () SeekEntryResult!12282)

(assert (=> b!1486034 (= lt!648308 (select (arr!48042 a!2862) (index!51522 lt!648306)))))

(declare-fun c!137274 () Bool)

(assert (=> b!1486034 (= c!137274 (= lt!648308 (select (arr!48042 a!2862) j!93)))))

(declare-fun b!1486035 () Bool)

(assert (=> b!1486035 (= e!833061 (Found!12282 (index!51522 lt!648306)))))

(declare-fun d!156479 () Bool)

(declare-fun lt!648307 () SeekEntryResult!12282)

(assert (=> d!156479 (and (or ((_ is Undefined!12282) lt!648307) (not ((_ is Found!12282) lt!648307)) (and (bvsge (index!51521 lt!648307) #b00000000000000000000000000000000) (bvslt (index!51521 lt!648307) (size!48592 a!2862)))) (or ((_ is Undefined!12282) lt!648307) ((_ is Found!12282) lt!648307) (not ((_ is MissingZero!12282) lt!648307)) (and (bvsge (index!51520 lt!648307) #b00000000000000000000000000000000) (bvslt (index!51520 lt!648307) (size!48592 a!2862)))) (or ((_ is Undefined!12282) lt!648307) ((_ is Found!12282) lt!648307) ((_ is MissingZero!12282) lt!648307) (not ((_ is MissingVacant!12282) lt!648307)) (and (bvsge (index!51523 lt!648307) #b00000000000000000000000000000000) (bvslt (index!51523 lt!648307) (size!48592 a!2862)))) (or ((_ is Undefined!12282) lt!648307) (ite ((_ is Found!12282) lt!648307) (= (select (arr!48042 a!2862) (index!51521 lt!648307)) (select (arr!48042 a!2862) j!93)) (ite ((_ is MissingZero!12282) lt!648307) (= (select (arr!48042 a!2862) (index!51520 lt!648307)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12282) lt!648307) (= (select (arr!48042 a!2862) (index!51523 lt!648307)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156479 (= lt!648307 e!833063)))

(declare-fun c!137275 () Bool)

(assert (=> d!156479 (= c!137275 (and ((_ is Intermediate!12282) lt!648306) (undefined!13094 lt!648306)))))

(assert (=> d!156479 (= lt!648306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48042 a!2862) j!93) mask!2687) (select (arr!48042 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156479 (validMask!0 mask!2687)))

(assert (=> d!156479 (= (seekEntryOrOpen!0 (select (arr!48042 a!2862) j!93) a!2862 mask!2687) lt!648307)))

(declare-fun b!1486036 () Bool)

(declare-fun c!137273 () Bool)

(assert (=> b!1486036 (= c!137273 (= lt!648308 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!833062 () SeekEntryResult!12282)

(assert (=> b!1486036 (= e!833061 e!833062)))

(declare-fun b!1486037 () Bool)

(assert (=> b!1486037 (= e!833062 (seekKeyOrZeroReturnVacant!0 (x!133094 lt!648306) (index!51522 lt!648306) (index!51522 lt!648306) (select (arr!48042 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1486038 () Bool)

(assert (=> b!1486038 (= e!833062 (MissingZero!12282 (index!51522 lt!648306)))))

(declare-fun b!1486039 () Bool)

(assert (=> b!1486039 (= e!833063 Undefined!12282)))

(assert (= (and d!156479 c!137275) b!1486039))

(assert (= (and d!156479 (not c!137275)) b!1486034))

(assert (= (and b!1486034 c!137274) b!1486035))

(assert (= (and b!1486034 (not c!137274)) b!1486036))

(assert (= (and b!1486036 c!137273) b!1486038))

(assert (= (and b!1486036 (not c!137273)) b!1486037))

(declare-fun m!1371033 () Bool)

(assert (=> b!1486034 m!1371033))

(declare-fun m!1371035 () Bool)

(assert (=> d!156479 m!1371035))

(assert (=> d!156479 m!1370843))

(assert (=> d!156479 m!1370867))

(declare-fun m!1371037 () Bool)

(assert (=> d!156479 m!1371037))

(assert (=> d!156479 m!1370867))

(assert (=> d!156479 m!1370843))

(assert (=> d!156479 m!1370869))

(declare-fun m!1371039 () Bool)

(assert (=> d!156479 m!1371039))

(assert (=> d!156479 m!1370853))

(assert (=> b!1486037 m!1370843))

(declare-fun m!1371041 () Bool)

(assert (=> b!1486037 m!1371041))

(assert (=> b!1485761 d!156479))

(check-sat (not bm!67873) (not b!1485875) (not b!1485860) (not b!1486029) (not d!156433) (not bm!67877) (not d!156479) (not b!1485851) (not b!1485959) (not b!1485894) (not b!1486005) (not d!156475) (not d!156443) (not b!1485879) (not b!1485878) (not bm!67874) (not d!156477) (not b!1485893) (not d!156427) (not b!1485874) (not d!156459) (not b!1486020) (not b!1486037) (not d!156465) (not d!156431) (not b!1485892))
(check-sat)
