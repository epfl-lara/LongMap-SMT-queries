; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126884 () Bool)

(assert start!126884)

(declare-fun res!1014995 () Bool)

(declare-fun e!835665 () Bool)

(assert (=> start!126884 (=> (not res!1014995) (not e!835665))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126884 (= res!1014995 (validMask!0 mask!2687))))

(assert (=> start!126884 e!835665))

(assert (=> start!126884 true))

(declare-datatypes ((array!99655 0))(
  ( (array!99656 (arr!48100 (Array (_ BitVec 32) (_ BitVec 64))) (size!48652 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99655)

(declare-fun array_inv!37333 (array!99655) Bool)

(assert (=> start!126884 (array_inv!37333 a!2862)))

(declare-fun b!1491661 () Bool)

(declare-fun res!1014994 () Bool)

(assert (=> b!1491661 (=> (not res!1014994) (not e!835665))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491661 (= res!1014994 (validKeyInArray!0 (select (arr!48100 a!2862) j!93)))))

(declare-fun b!1491662 () Bool)

(declare-fun e!835660 () Bool)

(declare-fun e!835663 () Bool)

(assert (=> b!1491662 (= e!835660 (not e!835663))))

(declare-fun res!1015003 () Bool)

(assert (=> b!1491662 (=> res!1015003 e!835663)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1491662 (= res!1015003 (or (and (= (select (arr!48100 a!2862) index!646) (select (store (arr!48100 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48100 a!2862) index!646) (select (arr!48100 a!2862) j!93))) (= (select (arr!48100 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!835664 () Bool)

(assert (=> b!1491662 e!835664))

(declare-fun res!1014996 () Bool)

(assert (=> b!1491662 (=> (not res!1014996) (not e!835664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99655 (_ BitVec 32)) Bool)

(assert (=> b!1491662 (= res!1014996 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49911 0))(
  ( (Unit!49912) )
))
(declare-fun lt!650173 () Unit!49911)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99655 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49911)

(assert (=> b!1491662 (= lt!650173 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491663 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1491663 (= e!835664 (or (= (select (arr!48100 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48100 a!2862) intermediateBeforeIndex!19) (select (arr!48100 a!2862) j!93))))))

(declare-fun b!1491664 () Bool)

(declare-fun res!1014990 () Bool)

(assert (=> b!1491664 (=> (not res!1014990) (not e!835665))))

(assert (=> b!1491664 (= res!1014990 (and (= (size!48652 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48652 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48652 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491665 () Bool)

(declare-fun res!1014988 () Bool)

(assert (=> b!1491665 (=> (not res!1014988) (not e!835664))))

(declare-datatypes ((SeekEntryResult!12365 0))(
  ( (MissingZero!12365 (index!51852 (_ BitVec 32))) (Found!12365 (index!51853 (_ BitVec 32))) (Intermediate!12365 (undefined!13177 Bool) (index!51854 (_ BitVec 32)) (x!133430 (_ BitVec 32))) (Undefined!12365) (MissingVacant!12365 (index!51855 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99655 (_ BitVec 32)) SeekEntryResult!12365)

(assert (=> b!1491665 (= res!1014988 (= (seekEntryOrOpen!0 (select (arr!48100 a!2862) j!93) a!2862 mask!2687) (Found!12365 j!93)))))

(declare-fun b!1491666 () Bool)

(assert (=> b!1491666 (= e!835663 (and (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110)))))

(declare-fun lt!650169 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491666 (= lt!650169 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1491667 () Bool)

(declare-fun e!835667 () Bool)

(assert (=> b!1491667 (= e!835667 e!835660)))

(declare-fun res!1014991 () Bool)

(assert (=> b!1491667 (=> (not res!1014991) (not e!835660))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!650172 () SeekEntryResult!12365)

(assert (=> b!1491667 (= res!1014991 (= lt!650172 (Intermediate!12365 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!650174 () (_ BitVec 64))

(declare-fun lt!650170 () array!99655)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99655 (_ BitVec 32)) SeekEntryResult!12365)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491667 (= lt!650172 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650174 mask!2687) lt!650174 lt!650170 mask!2687))))

(assert (=> b!1491667 (= lt!650174 (select (store (arr!48100 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491668 () Bool)

(declare-fun res!1014992 () Bool)

(assert (=> b!1491668 (=> (not res!1014992) (not e!835660))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1491668 (= res!1014992 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491669 () Bool)

(declare-fun res!1014993 () Bool)

(assert (=> b!1491669 (=> (not res!1014993) (not e!835660))))

(declare-fun e!835666 () Bool)

(assert (=> b!1491669 (= res!1014993 e!835666)))

(declare-fun c!137866 () Bool)

(assert (=> b!1491669 (= c!137866 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491670 () Bool)

(declare-fun res!1014997 () Bool)

(assert (=> b!1491670 (=> (not res!1014997) (not e!835665))))

(assert (=> b!1491670 (= res!1014997 (validKeyInArray!0 (select (arr!48100 a!2862) i!1006)))))

(declare-fun b!1491671 () Bool)

(declare-fun res!1014998 () Bool)

(assert (=> b!1491671 (=> (not res!1014998) (not e!835665))))

(assert (=> b!1491671 (= res!1014998 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48652 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48652 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48652 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491672 () Bool)

(declare-fun res!1015000 () Bool)

(assert (=> b!1491672 (=> (not res!1015000) (not e!835665))))

(assert (=> b!1491672 (= res!1015000 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491673 () Bool)

(declare-fun res!1015002 () Bool)

(assert (=> b!1491673 (=> (not res!1015002) (not e!835667))))

(declare-fun lt!650171 () SeekEntryResult!12365)

(assert (=> b!1491673 (= res!1015002 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48100 a!2862) j!93) a!2862 mask!2687) lt!650171))))

(declare-fun b!1491674 () Bool)

(assert (=> b!1491674 (= e!835666 (= lt!650172 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650174 lt!650170 mask!2687)))))

(declare-fun b!1491675 () Bool)

(declare-fun e!835661 () Bool)

(assert (=> b!1491675 (= e!835661 e!835667)))

(declare-fun res!1015001 () Bool)

(assert (=> b!1491675 (=> (not res!1015001) (not e!835667))))

(assert (=> b!1491675 (= res!1015001 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48100 a!2862) j!93) mask!2687) (select (arr!48100 a!2862) j!93) a!2862 mask!2687) lt!650171))))

(assert (=> b!1491675 (= lt!650171 (Intermediate!12365 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491676 () Bool)

(assert (=> b!1491676 (= e!835665 e!835661)))

(declare-fun res!1014989 () Bool)

(assert (=> b!1491676 (=> (not res!1014989) (not e!835661))))

(assert (=> b!1491676 (= res!1014989 (= (select (store (arr!48100 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1491676 (= lt!650170 (array!99656 (store (arr!48100 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48652 a!2862)))))

(declare-fun b!1491677 () Bool)

(declare-fun res!1014999 () Bool)

(assert (=> b!1491677 (=> (not res!1014999) (not e!835665))))

(declare-datatypes ((List!34679 0))(
  ( (Nil!34676) (Cons!34675 (h!36058 (_ BitVec 64)) (t!49365 List!34679)) )
))
(declare-fun arrayNoDuplicates!0 (array!99655 (_ BitVec 32) List!34679) Bool)

(assert (=> b!1491677 (= res!1014999 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34676))))

(declare-fun b!1491678 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99655 (_ BitVec 32)) SeekEntryResult!12365)

(assert (=> b!1491678 (= e!835666 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650174 lt!650170 mask!2687) (seekEntryOrOpen!0 lt!650174 lt!650170 mask!2687)))))

(assert (= (and start!126884 res!1014995) b!1491664))

(assert (= (and b!1491664 res!1014990) b!1491670))

(assert (= (and b!1491670 res!1014997) b!1491661))

(assert (= (and b!1491661 res!1014994) b!1491672))

(assert (= (and b!1491672 res!1015000) b!1491677))

(assert (= (and b!1491677 res!1014999) b!1491671))

(assert (= (and b!1491671 res!1014998) b!1491676))

(assert (= (and b!1491676 res!1014989) b!1491675))

(assert (= (and b!1491675 res!1015001) b!1491673))

(assert (= (and b!1491673 res!1015002) b!1491667))

(assert (= (and b!1491667 res!1014991) b!1491669))

(assert (= (and b!1491669 c!137866) b!1491674))

(assert (= (and b!1491669 (not c!137866)) b!1491678))

(assert (= (and b!1491669 res!1014993) b!1491668))

(assert (= (and b!1491668 res!1014992) b!1491662))

(assert (= (and b!1491662 res!1014996) b!1491665))

(assert (= (and b!1491665 res!1014988) b!1491663))

(assert (= (and b!1491662 (not res!1015003)) b!1491666))

(declare-fun m!1375227 () Bool)

(assert (=> b!1491673 m!1375227))

(assert (=> b!1491673 m!1375227))

(declare-fun m!1375229 () Bool)

(assert (=> b!1491673 m!1375229))

(declare-fun m!1375231 () Bool)

(assert (=> b!1491667 m!1375231))

(assert (=> b!1491667 m!1375231))

(declare-fun m!1375233 () Bool)

(assert (=> b!1491667 m!1375233))

(declare-fun m!1375235 () Bool)

(assert (=> b!1491667 m!1375235))

(declare-fun m!1375237 () Bool)

(assert (=> b!1491667 m!1375237))

(declare-fun m!1375239 () Bool)

(assert (=> b!1491678 m!1375239))

(declare-fun m!1375241 () Bool)

(assert (=> b!1491678 m!1375241))

(declare-fun m!1375243 () Bool)

(assert (=> b!1491677 m!1375243))

(declare-fun m!1375245 () Bool)

(assert (=> b!1491670 m!1375245))

(assert (=> b!1491670 m!1375245))

(declare-fun m!1375247 () Bool)

(assert (=> b!1491670 m!1375247))

(assert (=> b!1491665 m!1375227))

(assert (=> b!1491665 m!1375227))

(declare-fun m!1375249 () Bool)

(assert (=> b!1491665 m!1375249))

(declare-fun m!1375251 () Bool)

(assert (=> b!1491666 m!1375251))

(assert (=> b!1491675 m!1375227))

(assert (=> b!1491675 m!1375227))

(declare-fun m!1375253 () Bool)

(assert (=> b!1491675 m!1375253))

(assert (=> b!1491675 m!1375253))

(assert (=> b!1491675 m!1375227))

(declare-fun m!1375255 () Bool)

(assert (=> b!1491675 m!1375255))

(declare-fun m!1375257 () Bool)

(assert (=> b!1491663 m!1375257))

(assert (=> b!1491663 m!1375227))

(assert (=> b!1491661 m!1375227))

(assert (=> b!1491661 m!1375227))

(declare-fun m!1375259 () Bool)

(assert (=> b!1491661 m!1375259))

(declare-fun m!1375261 () Bool)

(assert (=> b!1491662 m!1375261))

(assert (=> b!1491662 m!1375235))

(declare-fun m!1375263 () Bool)

(assert (=> b!1491662 m!1375263))

(declare-fun m!1375265 () Bool)

(assert (=> b!1491662 m!1375265))

(declare-fun m!1375267 () Bool)

(assert (=> b!1491662 m!1375267))

(assert (=> b!1491662 m!1375227))

(declare-fun m!1375269 () Bool)

(assert (=> start!126884 m!1375269))

(declare-fun m!1375271 () Bool)

(assert (=> start!126884 m!1375271))

(declare-fun m!1375273 () Bool)

(assert (=> b!1491672 m!1375273))

(declare-fun m!1375275 () Bool)

(assert (=> b!1491674 m!1375275))

(assert (=> b!1491676 m!1375235))

(declare-fun m!1375277 () Bool)

(assert (=> b!1491676 m!1375277))

(check-sat (not b!1491667) (not start!126884) (not b!1491670) (not b!1491673) (not b!1491677) (not b!1491662) (not b!1491672) (not b!1491666) (not b!1491678) (not b!1491661) (not b!1491674) (not b!1491665) (not b!1491675))
(check-sat)
(get-model)

(declare-fun d!156559 () Bool)

(declare-fun lt!650213 () (_ BitVec 32))

(assert (=> d!156559 (and (bvsge lt!650213 #b00000000000000000000000000000000) (bvslt lt!650213 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156559 (= lt!650213 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!156559 (validMask!0 mask!2687)))

(assert (=> d!156559 (= (nextIndex!0 index!646 x!665 mask!2687) lt!650213)))

(declare-fun bs!42814 () Bool)

(assert (= bs!42814 d!156559))

(declare-fun m!1375383 () Bool)

(assert (=> bs!42814 m!1375383))

(assert (=> bs!42814 m!1375269))

(assert (=> b!1491666 d!156559))

(declare-fun b!1491797 () Bool)

(declare-fun e!835725 () Bool)

(declare-fun call!67904 () Bool)

(assert (=> b!1491797 (= e!835725 call!67904)))

(declare-fun b!1491798 () Bool)

(declare-fun e!835726 () Bool)

(declare-fun e!835727 () Bool)

(assert (=> b!1491798 (= e!835726 e!835727)))

(declare-fun res!1015106 () Bool)

(assert (=> b!1491798 (=> (not res!1015106) (not e!835727))))

(declare-fun e!835724 () Bool)

(assert (=> b!1491798 (= res!1015106 (not e!835724))))

(declare-fun res!1015108 () Bool)

(assert (=> b!1491798 (=> (not res!1015108) (not e!835724))))

(assert (=> b!1491798 (= res!1015108 (validKeyInArray!0 (select (arr!48100 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1491799 () Bool)

(assert (=> b!1491799 (= e!835727 e!835725)))

(declare-fun c!137875 () Bool)

(assert (=> b!1491799 (= c!137875 (validKeyInArray!0 (select (arr!48100 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1491800 () Bool)

(declare-fun contains!9890 (List!34679 (_ BitVec 64)) Bool)

(assert (=> b!1491800 (= e!835724 (contains!9890 Nil!34676 (select (arr!48100 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67901 () Bool)

(assert (=> bm!67901 (= call!67904 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!137875 (Cons!34675 (select (arr!48100 a!2862) #b00000000000000000000000000000000) Nil!34676) Nil!34676)))))

(declare-fun d!156561 () Bool)

(declare-fun res!1015107 () Bool)

(assert (=> d!156561 (=> res!1015107 e!835726)))

(assert (=> d!156561 (= res!1015107 (bvsge #b00000000000000000000000000000000 (size!48652 a!2862)))))

(assert (=> d!156561 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34676) e!835726)))

(declare-fun b!1491801 () Bool)

(assert (=> b!1491801 (= e!835725 call!67904)))

(assert (= (and d!156561 (not res!1015107)) b!1491798))

(assert (= (and b!1491798 res!1015108) b!1491800))

(assert (= (and b!1491798 res!1015106) b!1491799))

(assert (= (and b!1491799 c!137875) b!1491797))

(assert (= (and b!1491799 (not c!137875)) b!1491801))

(assert (= (or b!1491797 b!1491801) bm!67901))

(declare-fun m!1375385 () Bool)

(assert (=> b!1491798 m!1375385))

(assert (=> b!1491798 m!1375385))

(declare-fun m!1375387 () Bool)

(assert (=> b!1491798 m!1375387))

(assert (=> b!1491799 m!1375385))

(assert (=> b!1491799 m!1375385))

(assert (=> b!1491799 m!1375387))

(assert (=> b!1491800 m!1375385))

(assert (=> b!1491800 m!1375385))

(declare-fun m!1375389 () Bool)

(assert (=> b!1491800 m!1375389))

(assert (=> bm!67901 m!1375385))

(declare-fun m!1375391 () Bool)

(assert (=> bm!67901 m!1375391))

(assert (=> b!1491677 d!156561))

(declare-fun b!1491820 () Bool)

(declare-fun e!835740 () SeekEntryResult!12365)

(assert (=> b!1491820 (= e!835740 (Intermediate!12365 false (toIndex!0 (select (arr!48100 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1491821 () Bool)

(declare-fun e!835739 () SeekEntryResult!12365)

(assert (=> b!1491821 (= e!835739 e!835740)))

(declare-fun c!137883 () Bool)

(declare-fun lt!650218 () (_ BitVec 64))

(assert (=> b!1491821 (= c!137883 (or (= lt!650218 (select (arr!48100 a!2862) j!93)) (= (bvadd lt!650218 lt!650218) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1491822 () Bool)

(declare-fun lt!650219 () SeekEntryResult!12365)

(assert (=> b!1491822 (and (bvsge (index!51854 lt!650219) #b00000000000000000000000000000000) (bvslt (index!51854 lt!650219) (size!48652 a!2862)))))

(declare-fun res!1015116 () Bool)

(assert (=> b!1491822 (= res!1015116 (= (select (arr!48100 a!2862) (index!51854 lt!650219)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!835742 () Bool)

(assert (=> b!1491822 (=> res!1015116 e!835742)))

(declare-fun d!156563 () Bool)

(declare-fun e!835738 () Bool)

(assert (=> d!156563 e!835738))

(declare-fun c!137882 () Bool)

(get-info :version)

(assert (=> d!156563 (= c!137882 (and ((_ is Intermediate!12365) lt!650219) (undefined!13177 lt!650219)))))

(assert (=> d!156563 (= lt!650219 e!835739)))

(declare-fun c!137884 () Bool)

(assert (=> d!156563 (= c!137884 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156563 (= lt!650218 (select (arr!48100 a!2862) (toIndex!0 (select (arr!48100 a!2862) j!93) mask!2687)))))

(assert (=> d!156563 (validMask!0 mask!2687)))

(assert (=> d!156563 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48100 a!2862) j!93) mask!2687) (select (arr!48100 a!2862) j!93) a!2862 mask!2687) lt!650219)))

(declare-fun b!1491823 () Bool)

(assert (=> b!1491823 (= e!835739 (Intermediate!12365 true (toIndex!0 (select (arr!48100 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1491824 () Bool)

(declare-fun e!835741 () Bool)

(assert (=> b!1491824 (= e!835738 e!835741)))

(declare-fun res!1015117 () Bool)

(assert (=> b!1491824 (= res!1015117 (and ((_ is Intermediate!12365) lt!650219) (not (undefined!13177 lt!650219)) (bvslt (x!133430 lt!650219) #b01111111111111111111111111111110) (bvsge (x!133430 lt!650219) #b00000000000000000000000000000000) (bvsge (x!133430 lt!650219) #b00000000000000000000000000000000)))))

(assert (=> b!1491824 (=> (not res!1015117) (not e!835741))))

(declare-fun b!1491825 () Bool)

(assert (=> b!1491825 (= e!835738 (bvsge (x!133430 lt!650219) #b01111111111111111111111111111110))))

(declare-fun b!1491826 () Bool)

(assert (=> b!1491826 (and (bvsge (index!51854 lt!650219) #b00000000000000000000000000000000) (bvslt (index!51854 lt!650219) (size!48652 a!2862)))))

(declare-fun res!1015115 () Bool)

(assert (=> b!1491826 (= res!1015115 (= (select (arr!48100 a!2862) (index!51854 lt!650219)) (select (arr!48100 a!2862) j!93)))))

(assert (=> b!1491826 (=> res!1015115 e!835742)))

(assert (=> b!1491826 (= e!835741 e!835742)))

(declare-fun b!1491827 () Bool)

(assert (=> b!1491827 (= e!835740 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48100 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48100 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1491828 () Bool)

(assert (=> b!1491828 (and (bvsge (index!51854 lt!650219) #b00000000000000000000000000000000) (bvslt (index!51854 lt!650219) (size!48652 a!2862)))))

(assert (=> b!1491828 (= e!835742 (= (select (arr!48100 a!2862) (index!51854 lt!650219)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!156563 c!137884) b!1491823))

(assert (= (and d!156563 (not c!137884)) b!1491821))

(assert (= (and b!1491821 c!137883) b!1491820))

(assert (= (and b!1491821 (not c!137883)) b!1491827))

(assert (= (and d!156563 c!137882) b!1491825))

(assert (= (and d!156563 (not c!137882)) b!1491824))

(assert (= (and b!1491824 res!1015117) b!1491826))

(assert (= (and b!1491826 (not res!1015115)) b!1491822))

(assert (= (and b!1491822 (not res!1015116)) b!1491828))

(declare-fun m!1375393 () Bool)

(assert (=> b!1491828 m!1375393))

(assert (=> d!156563 m!1375253))

(declare-fun m!1375395 () Bool)

(assert (=> d!156563 m!1375395))

(assert (=> d!156563 m!1375269))

(assert (=> b!1491826 m!1375393))

(assert (=> b!1491827 m!1375253))

(declare-fun m!1375397 () Bool)

(assert (=> b!1491827 m!1375397))

(assert (=> b!1491827 m!1375397))

(assert (=> b!1491827 m!1375227))

(declare-fun m!1375399 () Bool)

(assert (=> b!1491827 m!1375399))

(assert (=> b!1491822 m!1375393))

(assert (=> b!1491675 d!156563))

(declare-fun d!156565 () Bool)

(declare-fun lt!650225 () (_ BitVec 32))

(declare-fun lt!650224 () (_ BitVec 32))

(assert (=> d!156565 (= lt!650225 (bvmul (bvxor lt!650224 (bvlshr lt!650224 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156565 (= lt!650224 ((_ extract 31 0) (bvand (bvxor (select (arr!48100 a!2862) j!93) (bvlshr (select (arr!48100 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156565 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1015118 (let ((h!36061 ((_ extract 31 0) (bvand (bvxor (select (arr!48100 a!2862) j!93) (bvlshr (select (arr!48100 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133435 (bvmul (bvxor h!36061 (bvlshr h!36061 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133435 (bvlshr x!133435 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1015118 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1015118 #b00000000000000000000000000000000))))))

(assert (=> d!156565 (= (toIndex!0 (select (arr!48100 a!2862) j!93) mask!2687) (bvand (bvxor lt!650225 (bvlshr lt!650225 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1491675 d!156565))

(declare-fun b!1491856 () Bool)

(declare-fun e!835763 () SeekEntryResult!12365)

(declare-fun lt!650233 () SeekEntryResult!12365)

(assert (=> b!1491856 (= e!835763 (Found!12365 (index!51854 lt!650233)))))

(declare-fun e!835762 () SeekEntryResult!12365)

(declare-fun b!1491857 () Bool)

(assert (=> b!1491857 (= e!835762 (seekKeyOrZeroReturnVacant!0 (x!133430 lt!650233) (index!51854 lt!650233) (index!51854 lt!650233) (select (arr!48100 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1491858 () Bool)

(declare-fun e!835761 () SeekEntryResult!12365)

(assert (=> b!1491858 (= e!835761 e!835763)))

(declare-fun lt!650232 () (_ BitVec 64))

(assert (=> b!1491858 (= lt!650232 (select (arr!48100 a!2862) (index!51854 lt!650233)))))

(declare-fun c!137896 () Bool)

(assert (=> b!1491858 (= c!137896 (= lt!650232 (select (arr!48100 a!2862) j!93)))))

(declare-fun b!1491859 () Bool)

(assert (=> b!1491859 (= e!835761 Undefined!12365)))

(declare-fun b!1491860 () Bool)

(declare-fun c!137895 () Bool)

(assert (=> b!1491860 (= c!137895 (= lt!650232 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1491860 (= e!835763 e!835762)))

(declare-fun b!1491861 () Bool)

(assert (=> b!1491861 (= e!835762 (MissingZero!12365 (index!51854 lt!650233)))))

(declare-fun d!156567 () Bool)

(declare-fun lt!650234 () SeekEntryResult!12365)

(assert (=> d!156567 (and (or ((_ is Undefined!12365) lt!650234) (not ((_ is Found!12365) lt!650234)) (and (bvsge (index!51853 lt!650234) #b00000000000000000000000000000000) (bvslt (index!51853 lt!650234) (size!48652 a!2862)))) (or ((_ is Undefined!12365) lt!650234) ((_ is Found!12365) lt!650234) (not ((_ is MissingZero!12365) lt!650234)) (and (bvsge (index!51852 lt!650234) #b00000000000000000000000000000000) (bvslt (index!51852 lt!650234) (size!48652 a!2862)))) (or ((_ is Undefined!12365) lt!650234) ((_ is Found!12365) lt!650234) ((_ is MissingZero!12365) lt!650234) (not ((_ is MissingVacant!12365) lt!650234)) (and (bvsge (index!51855 lt!650234) #b00000000000000000000000000000000) (bvslt (index!51855 lt!650234) (size!48652 a!2862)))) (or ((_ is Undefined!12365) lt!650234) (ite ((_ is Found!12365) lt!650234) (= (select (arr!48100 a!2862) (index!51853 lt!650234)) (select (arr!48100 a!2862) j!93)) (ite ((_ is MissingZero!12365) lt!650234) (= (select (arr!48100 a!2862) (index!51852 lt!650234)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12365) lt!650234) (= (select (arr!48100 a!2862) (index!51855 lt!650234)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156567 (= lt!650234 e!835761)))

(declare-fun c!137894 () Bool)

(assert (=> d!156567 (= c!137894 (and ((_ is Intermediate!12365) lt!650233) (undefined!13177 lt!650233)))))

(assert (=> d!156567 (= lt!650233 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48100 a!2862) j!93) mask!2687) (select (arr!48100 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156567 (validMask!0 mask!2687)))

(assert (=> d!156567 (= (seekEntryOrOpen!0 (select (arr!48100 a!2862) j!93) a!2862 mask!2687) lt!650234)))

(assert (= (and d!156567 c!137894) b!1491859))

(assert (= (and d!156567 (not c!137894)) b!1491858))

(assert (= (and b!1491858 c!137896) b!1491856))

(assert (= (and b!1491858 (not c!137896)) b!1491860))

(assert (= (and b!1491860 c!137895) b!1491861))

(assert (= (and b!1491860 (not c!137895)) b!1491857))

(assert (=> b!1491857 m!1375227))

(declare-fun m!1375409 () Bool)

(assert (=> b!1491857 m!1375409))

(declare-fun m!1375411 () Bool)

(assert (=> b!1491858 m!1375411))

(assert (=> d!156567 m!1375227))

(assert (=> d!156567 m!1375253))

(declare-fun m!1375413 () Bool)

(assert (=> d!156567 m!1375413))

(declare-fun m!1375415 () Bool)

(assert (=> d!156567 m!1375415))

(assert (=> d!156567 m!1375253))

(assert (=> d!156567 m!1375227))

(assert (=> d!156567 m!1375255))

(declare-fun m!1375417 () Bool)

(assert (=> d!156567 m!1375417))

(assert (=> d!156567 m!1375269))

(assert (=> b!1491665 d!156567))

(declare-fun lt!650249 () SeekEntryResult!12365)

(declare-fun d!156575 () Bool)

(assert (=> d!156575 (and (or ((_ is Undefined!12365) lt!650249) (not ((_ is Found!12365) lt!650249)) (and (bvsge (index!51853 lt!650249) #b00000000000000000000000000000000) (bvslt (index!51853 lt!650249) (size!48652 lt!650170)))) (or ((_ is Undefined!12365) lt!650249) ((_ is Found!12365) lt!650249) (not ((_ is MissingVacant!12365) lt!650249)) (not (= (index!51855 lt!650249) intermediateAfterIndex!19)) (and (bvsge (index!51855 lt!650249) #b00000000000000000000000000000000) (bvslt (index!51855 lt!650249) (size!48652 lt!650170)))) (or ((_ is Undefined!12365) lt!650249) (ite ((_ is Found!12365) lt!650249) (= (select (arr!48100 lt!650170) (index!51853 lt!650249)) lt!650174) (and ((_ is MissingVacant!12365) lt!650249) (= (index!51855 lt!650249) intermediateAfterIndex!19) (= (select (arr!48100 lt!650170) (index!51855 lt!650249)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!835795 () SeekEntryResult!12365)

(assert (=> d!156575 (= lt!650249 e!835795)))

(declare-fun c!137918 () Bool)

(assert (=> d!156575 (= c!137918 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!650250 () (_ BitVec 64))

(assert (=> d!156575 (= lt!650250 (select (arr!48100 lt!650170) index!646))))

(assert (=> d!156575 (validMask!0 mask!2687)))

(assert (=> d!156575 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650174 lt!650170 mask!2687) lt!650249)))

(declare-fun b!1491919 () Bool)

(declare-fun e!835797 () SeekEntryResult!12365)

(assert (=> b!1491919 (= e!835797 (Found!12365 index!646))))

(declare-fun b!1491920 () Bool)

(declare-fun e!835796 () SeekEntryResult!12365)

(assert (=> b!1491920 (= e!835796 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!650174 lt!650170 mask!2687))))

(declare-fun b!1491921 () Bool)

(assert (=> b!1491921 (= e!835795 e!835797)))

(declare-fun c!137919 () Bool)

(assert (=> b!1491921 (= c!137919 (= lt!650250 lt!650174))))

(declare-fun b!1491922 () Bool)

(declare-fun c!137920 () Bool)

(assert (=> b!1491922 (= c!137920 (= lt!650250 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1491922 (= e!835797 e!835796)))

(declare-fun b!1491923 () Bool)

(assert (=> b!1491923 (= e!835796 (MissingVacant!12365 intermediateAfterIndex!19))))

(declare-fun b!1491924 () Bool)

(assert (=> b!1491924 (= e!835795 Undefined!12365)))

(assert (= (and d!156575 c!137918) b!1491924))

(assert (= (and d!156575 (not c!137918)) b!1491921))

(assert (= (and b!1491921 c!137919) b!1491919))

(assert (= (and b!1491921 (not c!137919)) b!1491922))

(assert (= (and b!1491922 c!137920) b!1491923))

(assert (= (and b!1491922 (not c!137920)) b!1491920))

(declare-fun m!1375427 () Bool)

(assert (=> d!156575 m!1375427))

(declare-fun m!1375429 () Bool)

(assert (=> d!156575 m!1375429))

(declare-fun m!1375431 () Bool)

(assert (=> d!156575 m!1375431))

(assert (=> d!156575 m!1375269))

(assert (=> b!1491920 m!1375251))

(assert (=> b!1491920 m!1375251))

(declare-fun m!1375433 () Bool)

(assert (=> b!1491920 m!1375433))

(assert (=> b!1491678 d!156575))

(declare-fun b!1491934 () Bool)

(declare-fun e!835805 () SeekEntryResult!12365)

(declare-fun lt!650254 () SeekEntryResult!12365)

(assert (=> b!1491934 (= e!835805 (Found!12365 (index!51854 lt!650254)))))

(declare-fun b!1491935 () Bool)

(declare-fun e!835804 () SeekEntryResult!12365)

(assert (=> b!1491935 (= e!835804 (seekKeyOrZeroReturnVacant!0 (x!133430 lt!650254) (index!51854 lt!650254) (index!51854 lt!650254) lt!650174 lt!650170 mask!2687))))

(declare-fun b!1491936 () Bool)

(declare-fun e!835803 () SeekEntryResult!12365)

(assert (=> b!1491936 (= e!835803 e!835805)))

(declare-fun lt!650253 () (_ BitVec 64))

(assert (=> b!1491936 (= lt!650253 (select (arr!48100 lt!650170) (index!51854 lt!650254)))))

(declare-fun c!137926 () Bool)

(assert (=> b!1491936 (= c!137926 (= lt!650253 lt!650174))))

(declare-fun b!1491937 () Bool)

(assert (=> b!1491937 (= e!835803 Undefined!12365)))

(declare-fun b!1491938 () Bool)

(declare-fun c!137925 () Bool)

(assert (=> b!1491938 (= c!137925 (= lt!650253 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1491938 (= e!835805 e!835804)))

(declare-fun b!1491939 () Bool)

(assert (=> b!1491939 (= e!835804 (MissingZero!12365 (index!51854 lt!650254)))))

(declare-fun d!156579 () Bool)

(declare-fun lt!650255 () SeekEntryResult!12365)

(assert (=> d!156579 (and (or ((_ is Undefined!12365) lt!650255) (not ((_ is Found!12365) lt!650255)) (and (bvsge (index!51853 lt!650255) #b00000000000000000000000000000000) (bvslt (index!51853 lt!650255) (size!48652 lt!650170)))) (or ((_ is Undefined!12365) lt!650255) ((_ is Found!12365) lt!650255) (not ((_ is MissingZero!12365) lt!650255)) (and (bvsge (index!51852 lt!650255) #b00000000000000000000000000000000) (bvslt (index!51852 lt!650255) (size!48652 lt!650170)))) (or ((_ is Undefined!12365) lt!650255) ((_ is Found!12365) lt!650255) ((_ is MissingZero!12365) lt!650255) (not ((_ is MissingVacant!12365) lt!650255)) (and (bvsge (index!51855 lt!650255) #b00000000000000000000000000000000) (bvslt (index!51855 lt!650255) (size!48652 lt!650170)))) (or ((_ is Undefined!12365) lt!650255) (ite ((_ is Found!12365) lt!650255) (= (select (arr!48100 lt!650170) (index!51853 lt!650255)) lt!650174) (ite ((_ is MissingZero!12365) lt!650255) (= (select (arr!48100 lt!650170) (index!51852 lt!650255)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!12365) lt!650255) (= (select (arr!48100 lt!650170) (index!51855 lt!650255)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156579 (= lt!650255 e!835803)))

(declare-fun c!137924 () Bool)

(assert (=> d!156579 (= c!137924 (and ((_ is Intermediate!12365) lt!650254) (undefined!13177 lt!650254)))))

(assert (=> d!156579 (= lt!650254 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650174 mask!2687) lt!650174 lt!650170 mask!2687))))

(assert (=> d!156579 (validMask!0 mask!2687)))

(assert (=> d!156579 (= (seekEntryOrOpen!0 lt!650174 lt!650170 mask!2687) lt!650255)))

(assert (= (and d!156579 c!137924) b!1491937))

(assert (= (and d!156579 (not c!137924)) b!1491936))

(assert (= (and b!1491936 c!137926) b!1491934))

(assert (= (and b!1491936 (not c!137926)) b!1491938))

(assert (= (and b!1491938 c!137925) b!1491939))

(assert (= (and b!1491938 (not c!137925)) b!1491935))

(declare-fun m!1375439 () Bool)

(assert (=> b!1491935 m!1375439))

(declare-fun m!1375441 () Bool)

(assert (=> b!1491936 m!1375441))

(assert (=> d!156579 m!1375231))

(declare-fun m!1375443 () Bool)

(assert (=> d!156579 m!1375443))

(declare-fun m!1375445 () Bool)

(assert (=> d!156579 m!1375445))

(assert (=> d!156579 m!1375231))

(assert (=> d!156579 m!1375233))

(declare-fun m!1375447 () Bool)

(assert (=> d!156579 m!1375447))

(assert (=> d!156579 m!1375269))

(assert (=> b!1491678 d!156579))

(declare-fun b!1491940 () Bool)

(declare-fun e!835808 () SeekEntryResult!12365)

(assert (=> b!1491940 (= e!835808 (Intermediate!12365 false (toIndex!0 lt!650174 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1491941 () Bool)

(declare-fun e!835807 () SeekEntryResult!12365)

(assert (=> b!1491941 (= e!835807 e!835808)))

(declare-fun c!137928 () Bool)

(declare-fun lt!650256 () (_ BitVec 64))

(assert (=> b!1491941 (= c!137928 (or (= lt!650256 lt!650174) (= (bvadd lt!650256 lt!650256) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1491942 () Bool)

(declare-fun lt!650257 () SeekEntryResult!12365)

(assert (=> b!1491942 (and (bvsge (index!51854 lt!650257) #b00000000000000000000000000000000) (bvslt (index!51854 lt!650257) (size!48652 lt!650170)))))

(declare-fun res!1015148 () Bool)

(assert (=> b!1491942 (= res!1015148 (= (select (arr!48100 lt!650170) (index!51854 lt!650257)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!835810 () Bool)

(assert (=> b!1491942 (=> res!1015148 e!835810)))

(declare-fun d!156583 () Bool)

(declare-fun e!835806 () Bool)

(assert (=> d!156583 e!835806))

(declare-fun c!137927 () Bool)

(assert (=> d!156583 (= c!137927 (and ((_ is Intermediate!12365) lt!650257) (undefined!13177 lt!650257)))))

(assert (=> d!156583 (= lt!650257 e!835807)))

(declare-fun c!137929 () Bool)

(assert (=> d!156583 (= c!137929 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!156583 (= lt!650256 (select (arr!48100 lt!650170) (toIndex!0 lt!650174 mask!2687)))))

(assert (=> d!156583 (validMask!0 mask!2687)))

(assert (=> d!156583 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650174 mask!2687) lt!650174 lt!650170 mask!2687) lt!650257)))

(declare-fun b!1491943 () Bool)

(assert (=> b!1491943 (= e!835807 (Intermediate!12365 true (toIndex!0 lt!650174 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1491944 () Bool)

(declare-fun e!835809 () Bool)

(assert (=> b!1491944 (= e!835806 e!835809)))

(declare-fun res!1015149 () Bool)

(assert (=> b!1491944 (= res!1015149 (and ((_ is Intermediate!12365) lt!650257) (not (undefined!13177 lt!650257)) (bvslt (x!133430 lt!650257) #b01111111111111111111111111111110) (bvsge (x!133430 lt!650257) #b00000000000000000000000000000000) (bvsge (x!133430 lt!650257) #b00000000000000000000000000000000)))))

(assert (=> b!1491944 (=> (not res!1015149) (not e!835809))))

(declare-fun b!1491945 () Bool)

(assert (=> b!1491945 (= e!835806 (bvsge (x!133430 lt!650257) #b01111111111111111111111111111110))))

(declare-fun b!1491946 () Bool)

(assert (=> b!1491946 (and (bvsge (index!51854 lt!650257) #b00000000000000000000000000000000) (bvslt (index!51854 lt!650257) (size!48652 lt!650170)))))

(declare-fun res!1015147 () Bool)

(assert (=> b!1491946 (= res!1015147 (= (select (arr!48100 lt!650170) (index!51854 lt!650257)) lt!650174))))

(assert (=> b!1491946 (=> res!1015147 e!835810)))

(assert (=> b!1491946 (= e!835809 e!835810)))

(declare-fun b!1491947 () Bool)

(assert (=> b!1491947 (= e!835808 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!650174 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!650174 lt!650170 mask!2687))))

(declare-fun b!1491948 () Bool)

(assert (=> b!1491948 (and (bvsge (index!51854 lt!650257) #b00000000000000000000000000000000) (bvslt (index!51854 lt!650257) (size!48652 lt!650170)))))

(assert (=> b!1491948 (= e!835810 (= (select (arr!48100 lt!650170) (index!51854 lt!650257)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!156583 c!137929) b!1491943))

(assert (= (and d!156583 (not c!137929)) b!1491941))

(assert (= (and b!1491941 c!137928) b!1491940))

(assert (= (and b!1491941 (not c!137928)) b!1491947))

(assert (= (and d!156583 c!137927) b!1491945))

(assert (= (and d!156583 (not c!137927)) b!1491944))

(assert (= (and b!1491944 res!1015149) b!1491946))

(assert (= (and b!1491946 (not res!1015147)) b!1491942))

(assert (= (and b!1491942 (not res!1015148)) b!1491948))

(declare-fun m!1375449 () Bool)

(assert (=> b!1491948 m!1375449))

(assert (=> d!156583 m!1375231))

(declare-fun m!1375451 () Bool)

(assert (=> d!156583 m!1375451))

(assert (=> d!156583 m!1375269))

(assert (=> b!1491946 m!1375449))

(assert (=> b!1491947 m!1375231))

(declare-fun m!1375453 () Bool)

(assert (=> b!1491947 m!1375453))

(assert (=> b!1491947 m!1375453))

(declare-fun m!1375455 () Bool)

(assert (=> b!1491947 m!1375455))

(assert (=> b!1491942 m!1375449))

(assert (=> b!1491667 d!156583))

(declare-fun d!156585 () Bool)

(declare-fun lt!650259 () (_ BitVec 32))

(declare-fun lt!650258 () (_ BitVec 32))

(assert (=> d!156585 (= lt!650259 (bvmul (bvxor lt!650258 (bvlshr lt!650258 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156585 (= lt!650258 ((_ extract 31 0) (bvand (bvxor lt!650174 (bvlshr lt!650174 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156585 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1015118 (let ((h!36061 ((_ extract 31 0) (bvand (bvxor lt!650174 (bvlshr lt!650174 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133435 (bvmul (bvxor h!36061 (bvlshr h!36061 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133435 (bvlshr x!133435 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1015118 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1015118 #b00000000000000000000000000000000))))))

(assert (=> d!156585 (= (toIndex!0 lt!650174 mask!2687) (bvand (bvxor lt!650259 (bvlshr lt!650259 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1491667 d!156585))

(declare-fun b!1491957 () Bool)

(declare-fun e!835819 () Bool)

(declare-fun call!67910 () Bool)

(assert (=> b!1491957 (= e!835819 call!67910)))

(declare-fun bm!67907 () Bool)

(assert (=> bm!67907 (= call!67910 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1491958 () Bool)

(declare-fun e!835818 () Bool)

(assert (=> b!1491958 (= e!835818 e!835819)))

(declare-fun lt!650280 () (_ BitVec 64))

(assert (=> b!1491958 (= lt!650280 (select (arr!48100 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!650278 () Unit!49911)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99655 (_ BitVec 64) (_ BitVec 32)) Unit!49911)

(assert (=> b!1491958 (= lt!650278 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!650280 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1491958 (arrayContainsKey!0 a!2862 lt!650280 #b00000000000000000000000000000000)))

(declare-fun lt!650279 () Unit!49911)

(assert (=> b!1491958 (= lt!650279 lt!650278)))

(declare-fun res!1015154 () Bool)

(assert (=> b!1491958 (= res!1015154 (= (seekEntryOrOpen!0 (select (arr!48100 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12365 #b00000000000000000000000000000000)))))

(assert (=> b!1491958 (=> (not res!1015154) (not e!835819))))

(declare-fun b!1491959 () Bool)

(assert (=> b!1491959 (= e!835818 call!67910)))

(declare-fun b!1491960 () Bool)

(declare-fun e!835817 () Bool)

(assert (=> b!1491960 (= e!835817 e!835818)))

(declare-fun c!137932 () Bool)

(assert (=> b!1491960 (= c!137932 (validKeyInArray!0 (select (arr!48100 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!156587 () Bool)

(declare-fun res!1015155 () Bool)

(assert (=> d!156587 (=> res!1015155 e!835817)))

(assert (=> d!156587 (= res!1015155 (bvsge #b00000000000000000000000000000000 (size!48652 a!2862)))))

(assert (=> d!156587 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!835817)))

(assert (= (and d!156587 (not res!1015155)) b!1491960))

(assert (= (and b!1491960 c!137932) b!1491958))

(assert (= (and b!1491960 (not c!137932)) b!1491959))

(assert (= (and b!1491958 res!1015154) b!1491957))

(assert (= (or b!1491957 b!1491959) bm!67907))

(declare-fun m!1375461 () Bool)

(assert (=> bm!67907 m!1375461))

(assert (=> b!1491958 m!1375385))

(declare-fun m!1375463 () Bool)

(assert (=> b!1491958 m!1375463))

(declare-fun m!1375465 () Bool)

(assert (=> b!1491958 m!1375465))

(assert (=> b!1491958 m!1375385))

(declare-fun m!1375467 () Bool)

(assert (=> b!1491958 m!1375467))

(assert (=> b!1491960 m!1375385))

(assert (=> b!1491960 m!1375385))

(assert (=> b!1491960 m!1375387))

(assert (=> b!1491672 d!156587))

(declare-fun d!156601 () Bool)

(assert (=> d!156601 (= (validKeyInArray!0 (select (arr!48100 a!2862) j!93)) (and (not (= (select (arr!48100 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48100 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1491661 d!156601))

(declare-fun d!156603 () Bool)

(assert (=> d!156603 (= (validKeyInArray!0 (select (arr!48100 a!2862) i!1006)) (and (not (= (select (arr!48100 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48100 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1491670 d!156603))

(declare-fun d!156605 () Bool)

(assert (=> d!156605 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126884 d!156605))

(declare-fun d!156615 () Bool)

(assert (=> d!156615 (= (array_inv!37333 a!2862) (bvsge (size!48652 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126884 d!156615))

(declare-fun b!1492003 () Bool)

(declare-fun e!835847 () SeekEntryResult!12365)

(assert (=> b!1492003 (= e!835847 (Intermediate!12365 false index!646 x!665))))

(declare-fun b!1492004 () Bool)

(declare-fun e!835846 () SeekEntryResult!12365)

(assert (=> b!1492004 (= e!835846 e!835847)))

(declare-fun c!137949 () Bool)

(declare-fun lt!650305 () (_ BitVec 64))

(assert (=> b!1492004 (= c!137949 (or (= lt!650305 lt!650174) (= (bvadd lt!650305 lt!650305) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1492005 () Bool)

(declare-fun lt!650306 () SeekEntryResult!12365)

(assert (=> b!1492005 (and (bvsge (index!51854 lt!650306) #b00000000000000000000000000000000) (bvslt (index!51854 lt!650306) (size!48652 lt!650170)))))

(declare-fun res!1015169 () Bool)

(assert (=> b!1492005 (= res!1015169 (= (select (arr!48100 lt!650170) (index!51854 lt!650306)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!835849 () Bool)

(assert (=> b!1492005 (=> res!1015169 e!835849)))

(declare-fun d!156619 () Bool)

(declare-fun e!835845 () Bool)

(assert (=> d!156619 e!835845))

(declare-fun c!137948 () Bool)

(assert (=> d!156619 (= c!137948 (and ((_ is Intermediate!12365) lt!650306) (undefined!13177 lt!650306)))))

(assert (=> d!156619 (= lt!650306 e!835846)))

(declare-fun c!137950 () Bool)

(assert (=> d!156619 (= c!137950 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156619 (= lt!650305 (select (arr!48100 lt!650170) index!646))))

(assert (=> d!156619 (validMask!0 mask!2687)))

(assert (=> d!156619 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650174 lt!650170 mask!2687) lt!650306)))

(declare-fun b!1492006 () Bool)

(assert (=> b!1492006 (= e!835846 (Intermediate!12365 true index!646 x!665))))

(declare-fun b!1492007 () Bool)

(declare-fun e!835848 () Bool)

(assert (=> b!1492007 (= e!835845 e!835848)))

(declare-fun res!1015170 () Bool)

(assert (=> b!1492007 (= res!1015170 (and ((_ is Intermediate!12365) lt!650306) (not (undefined!13177 lt!650306)) (bvslt (x!133430 lt!650306) #b01111111111111111111111111111110) (bvsge (x!133430 lt!650306) #b00000000000000000000000000000000) (bvsge (x!133430 lt!650306) x!665)))))

(assert (=> b!1492007 (=> (not res!1015170) (not e!835848))))

(declare-fun b!1492008 () Bool)

(assert (=> b!1492008 (= e!835845 (bvsge (x!133430 lt!650306) #b01111111111111111111111111111110))))

(declare-fun b!1492009 () Bool)

(assert (=> b!1492009 (and (bvsge (index!51854 lt!650306) #b00000000000000000000000000000000) (bvslt (index!51854 lt!650306) (size!48652 lt!650170)))))

(declare-fun res!1015168 () Bool)

(assert (=> b!1492009 (= res!1015168 (= (select (arr!48100 lt!650170) (index!51854 lt!650306)) lt!650174))))

(assert (=> b!1492009 (=> res!1015168 e!835849)))

(assert (=> b!1492009 (= e!835848 e!835849)))

(declare-fun b!1492010 () Bool)

(assert (=> b!1492010 (= e!835847 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!650174 lt!650170 mask!2687))))

(declare-fun b!1492011 () Bool)

(assert (=> b!1492011 (and (bvsge (index!51854 lt!650306) #b00000000000000000000000000000000) (bvslt (index!51854 lt!650306) (size!48652 lt!650170)))))

(assert (=> b!1492011 (= e!835849 (= (select (arr!48100 lt!650170) (index!51854 lt!650306)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!156619 c!137950) b!1492006))

(assert (= (and d!156619 (not c!137950)) b!1492004))

(assert (= (and b!1492004 c!137949) b!1492003))

(assert (= (and b!1492004 (not c!137949)) b!1492010))

(assert (= (and d!156619 c!137948) b!1492008))

(assert (= (and d!156619 (not c!137948)) b!1492007))

(assert (= (and b!1492007 res!1015170) b!1492009))

(assert (= (and b!1492009 (not res!1015168)) b!1492005))

(assert (= (and b!1492005 (not res!1015169)) b!1492011))

(declare-fun m!1375491 () Bool)

(assert (=> b!1492011 m!1375491))

(assert (=> d!156619 m!1375431))

(assert (=> d!156619 m!1375269))

(assert (=> b!1492009 m!1375491))

(assert (=> b!1492010 m!1375251))

(assert (=> b!1492010 m!1375251))

(declare-fun m!1375499 () Bool)

(assert (=> b!1492010 m!1375499))

(assert (=> b!1492005 m!1375491))

(assert (=> b!1491674 d!156619))

(declare-fun b!1492018 () Bool)

(declare-fun e!835855 () Bool)

(declare-fun call!67914 () Bool)

(assert (=> b!1492018 (= e!835855 call!67914)))

(declare-fun bm!67911 () Bool)

(assert (=> bm!67911 (= call!67914 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1492019 () Bool)

(declare-fun e!835854 () Bool)

(assert (=> b!1492019 (= e!835854 e!835855)))

(declare-fun lt!650312 () (_ BitVec 64))

(assert (=> b!1492019 (= lt!650312 (select (arr!48100 a!2862) j!93))))

(declare-fun lt!650310 () Unit!49911)

(assert (=> b!1492019 (= lt!650310 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!650312 j!93))))

(assert (=> b!1492019 (arrayContainsKey!0 a!2862 lt!650312 #b00000000000000000000000000000000)))

(declare-fun lt!650311 () Unit!49911)

(assert (=> b!1492019 (= lt!650311 lt!650310)))

(declare-fun res!1015171 () Bool)

(assert (=> b!1492019 (= res!1015171 (= (seekEntryOrOpen!0 (select (arr!48100 a!2862) j!93) a!2862 mask!2687) (Found!12365 j!93)))))

(assert (=> b!1492019 (=> (not res!1015171) (not e!835855))))

(declare-fun b!1492020 () Bool)

(assert (=> b!1492020 (= e!835854 call!67914)))

(declare-fun b!1492021 () Bool)

(declare-fun e!835853 () Bool)

(assert (=> b!1492021 (= e!835853 e!835854)))

(declare-fun c!137954 () Bool)

(assert (=> b!1492021 (= c!137954 (validKeyInArray!0 (select (arr!48100 a!2862) j!93)))))

(declare-fun d!156623 () Bool)

(declare-fun res!1015172 () Bool)

(assert (=> d!156623 (=> res!1015172 e!835853)))

(assert (=> d!156623 (= res!1015172 (bvsge j!93 (size!48652 a!2862)))))

(assert (=> d!156623 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!835853)))

(assert (= (and d!156623 (not res!1015172)) b!1492021))

(assert (= (and b!1492021 c!137954) b!1492019))

(assert (= (and b!1492021 (not c!137954)) b!1492020))

(assert (= (and b!1492019 res!1015171) b!1492018))

(assert (= (or b!1492018 b!1492020) bm!67911))

(declare-fun m!1375505 () Bool)

(assert (=> bm!67911 m!1375505))

(assert (=> b!1492019 m!1375227))

(declare-fun m!1375507 () Bool)

(assert (=> b!1492019 m!1375507))

(declare-fun m!1375509 () Bool)

(assert (=> b!1492019 m!1375509))

(assert (=> b!1492019 m!1375227))

(assert (=> b!1492019 m!1375249))

(assert (=> b!1492021 m!1375227))

(assert (=> b!1492021 m!1375227))

(assert (=> b!1492021 m!1375259))

(assert (=> b!1491662 d!156623))

(declare-fun d!156627 () Bool)

(assert (=> d!156627 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!650319 () Unit!49911)

(declare-fun choose!38 (array!99655 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49911)

(assert (=> d!156627 (= lt!650319 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156627 (validMask!0 mask!2687)))

(assert (=> d!156627 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!650319)))

(declare-fun bs!42818 () Bool)

(assert (= bs!42818 d!156627))

(assert (=> bs!42818 m!1375267))

(declare-fun m!1375519 () Bool)

(assert (=> bs!42818 m!1375519))

(assert (=> bs!42818 m!1375269))

(assert (=> b!1491662 d!156627))

(declare-fun b!1492041 () Bool)

(declare-fun e!835871 () SeekEntryResult!12365)

(assert (=> b!1492041 (= e!835871 (Intermediate!12365 false index!646 x!665))))

(declare-fun b!1492042 () Bool)

(declare-fun e!835870 () SeekEntryResult!12365)

(assert (=> b!1492042 (= e!835870 e!835871)))

(declare-fun c!137961 () Bool)

(declare-fun lt!650322 () (_ BitVec 64))

(assert (=> b!1492042 (= c!137961 (or (= lt!650322 (select (arr!48100 a!2862) j!93)) (= (bvadd lt!650322 lt!650322) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1492043 () Bool)

(declare-fun lt!650323 () SeekEntryResult!12365)

(assert (=> b!1492043 (and (bvsge (index!51854 lt!650323) #b00000000000000000000000000000000) (bvslt (index!51854 lt!650323) (size!48652 a!2862)))))

(declare-fun res!1015184 () Bool)

(assert (=> b!1492043 (= res!1015184 (= (select (arr!48100 a!2862) (index!51854 lt!650323)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!835873 () Bool)

(assert (=> b!1492043 (=> res!1015184 e!835873)))

(declare-fun d!156631 () Bool)

(declare-fun e!835869 () Bool)

(assert (=> d!156631 e!835869))

(declare-fun c!137960 () Bool)

(assert (=> d!156631 (= c!137960 (and ((_ is Intermediate!12365) lt!650323) (undefined!13177 lt!650323)))))

(assert (=> d!156631 (= lt!650323 e!835870)))

(declare-fun c!137962 () Bool)

(assert (=> d!156631 (= c!137962 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156631 (= lt!650322 (select (arr!48100 a!2862) index!646))))

(assert (=> d!156631 (validMask!0 mask!2687)))

(assert (=> d!156631 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48100 a!2862) j!93) a!2862 mask!2687) lt!650323)))

(declare-fun b!1492044 () Bool)

(assert (=> b!1492044 (= e!835870 (Intermediate!12365 true index!646 x!665))))

(declare-fun b!1492045 () Bool)

(declare-fun e!835872 () Bool)

(assert (=> b!1492045 (= e!835869 e!835872)))

(declare-fun res!1015185 () Bool)

(assert (=> b!1492045 (= res!1015185 (and ((_ is Intermediate!12365) lt!650323) (not (undefined!13177 lt!650323)) (bvslt (x!133430 lt!650323) #b01111111111111111111111111111110) (bvsge (x!133430 lt!650323) #b00000000000000000000000000000000) (bvsge (x!133430 lt!650323) x!665)))))

(assert (=> b!1492045 (=> (not res!1015185) (not e!835872))))

(declare-fun b!1492046 () Bool)

(assert (=> b!1492046 (= e!835869 (bvsge (x!133430 lt!650323) #b01111111111111111111111111111110))))

(declare-fun b!1492047 () Bool)

(assert (=> b!1492047 (and (bvsge (index!51854 lt!650323) #b00000000000000000000000000000000) (bvslt (index!51854 lt!650323) (size!48652 a!2862)))))

(declare-fun res!1015183 () Bool)

(assert (=> b!1492047 (= res!1015183 (= (select (arr!48100 a!2862) (index!51854 lt!650323)) (select (arr!48100 a!2862) j!93)))))

(assert (=> b!1492047 (=> res!1015183 e!835873)))

(assert (=> b!1492047 (= e!835872 e!835873)))

(declare-fun b!1492048 () Bool)

(assert (=> b!1492048 (= e!835871 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48100 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1492049 () Bool)

(assert (=> b!1492049 (and (bvsge (index!51854 lt!650323) #b00000000000000000000000000000000) (bvslt (index!51854 lt!650323) (size!48652 a!2862)))))

(assert (=> b!1492049 (= e!835873 (= (select (arr!48100 a!2862) (index!51854 lt!650323)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!156631 c!137962) b!1492044))

(assert (= (and d!156631 (not c!137962)) b!1492042))

(assert (= (and b!1492042 c!137961) b!1492041))

(assert (= (and b!1492042 (not c!137961)) b!1492048))

(assert (= (and d!156631 c!137960) b!1492046))

(assert (= (and d!156631 (not c!137960)) b!1492045))

(assert (= (and b!1492045 res!1015185) b!1492047))

(assert (= (and b!1492047 (not res!1015183)) b!1492043))

(assert (= (and b!1492043 (not res!1015184)) b!1492049))

(declare-fun m!1375521 () Bool)

(assert (=> b!1492049 m!1375521))

(assert (=> d!156631 m!1375265))

(assert (=> d!156631 m!1375269))

(assert (=> b!1492047 m!1375521))

(assert (=> b!1492048 m!1375251))

(assert (=> b!1492048 m!1375251))

(assert (=> b!1492048 m!1375227))

(declare-fun m!1375525 () Bool)

(assert (=> b!1492048 m!1375525))

(assert (=> b!1492043 m!1375521))

(assert (=> b!1491673 d!156631))

(check-sat (not b!1491857) (not d!156627) (not bm!67911) (not d!156579) (not b!1491799) (not b!1491798) (not d!156567) (not b!1491947) (not b!1491827) (not d!156583) (not b!1491920) (not b!1492010) (not b!1491935) (not d!156559) (not d!156563) (not b!1491800) (not bm!67907) (not d!156575) (not b!1492021) (not b!1492048) (not bm!67901) (not b!1491958) (not d!156619) (not b!1491960) (not b!1492019) (not d!156631))
(check-sat)
