; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125280 () Bool)

(assert start!125280)

(declare-fun b!1457017 () Bool)

(declare-fun e!819936 () Bool)

(assert (=> b!1457017 (= e!819936 true)))

(declare-fun lt!638520 () Bool)

(declare-fun e!819939 () Bool)

(assert (=> b!1457017 (= lt!638520 e!819939)))

(declare-fun c!134622 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1457017 (= c!134622 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun lt!638526 () (_ BitVec 64))

(declare-fun b!1457018 () Bool)

(declare-fun lt!638525 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11745 0))(
  ( (MissingZero!11745 (index!49372 (_ BitVec 32))) (Found!11745 (index!49373 (_ BitVec 32))) (Intermediate!11745 (undefined!12557 Bool) (index!49374 (_ BitVec 32)) (x!131178 (_ BitVec 32))) (Undefined!11745) (MissingVacant!11745 (index!49375 (_ BitVec 32))) )
))
(declare-fun lt!638527 () SeekEntryResult!11745)

(declare-datatypes ((array!98623 0))(
  ( (array!98624 (arr!47596 (Array (_ BitVec 32) (_ BitVec 64))) (size!48147 (_ BitVec 32))) )
))
(declare-fun lt!638521 () array!98623)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98623 (_ BitVec 32)) SeekEntryResult!11745)

(assert (=> b!1457018 (= e!819939 (not (= lt!638527 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638525 lt!638526 lt!638521 mask!2687))))))

(declare-fun b!1457019 () Bool)

(declare-fun res!986819 () Bool)

(assert (=> b!1457019 (=> res!986819 e!819936)))

(declare-fun a!2862 () array!98623)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!638524 () SeekEntryResult!11745)

(assert (=> b!1457019 (= res!986819 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638525 (select (arr!47596 a!2862) j!93) a!2862 mask!2687) lt!638524)))))

(declare-fun b!1457020 () Bool)

(declare-fun e!819933 () Bool)

(declare-fun e!819937 () Bool)

(assert (=> b!1457020 (= e!819933 e!819937)))

(declare-fun res!986822 () Bool)

(assert (=> b!1457020 (=> (not res!986822) (not e!819937))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1457020 (= res!986822 (= (select (store (arr!47596 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1457020 (= lt!638521 (array!98624 (store (arr!47596 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48147 a!2862)))))

(declare-fun b!1457021 () Bool)

(declare-fun res!986821 () Bool)

(declare-fun e!819931 () Bool)

(assert (=> b!1457021 (=> (not res!986821) (not e!819931))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1457021 (= res!986821 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47596 a!2862) j!93) a!2862 mask!2687) lt!638524))))

(declare-fun b!1457022 () Bool)

(declare-fun res!986813 () Bool)

(assert (=> b!1457022 (=> (not res!986813) (not e!819933))))

(assert (=> b!1457022 (= res!986813 (and (= (size!48147 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48147 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48147 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1457023 () Bool)

(declare-fun res!986828 () Bool)

(declare-fun e!819930 () Bool)

(assert (=> b!1457023 (=> (not res!986828) (not e!819930))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1457023 (= res!986828 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1457024 () Bool)

(declare-fun res!986827 () Bool)

(assert (=> b!1457024 (=> (not res!986827) (not e!819933))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1457024 (= res!986827 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48147 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48147 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48147 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1457025 () Bool)

(declare-fun e!819935 () Bool)

(assert (=> b!1457025 (= e!819935 (and (or (= (select (arr!47596 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47596 a!2862) intermediateBeforeIndex!19) (select (arr!47596 a!2862) j!93))) (let ((bdg!53180 (select (store (arr!47596 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47596 a!2862) index!646) bdg!53180) (= (select (arr!47596 a!2862) index!646) (select (arr!47596 a!2862) j!93))) (= (select (arr!47596 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53180 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457026 () Bool)

(declare-fun res!986820 () Bool)

(assert (=> b!1457026 (=> (not res!986820) (not e!819933))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457026 (= res!986820 (validKeyInArray!0 (select (arr!47596 a!2862) j!93)))))

(declare-fun lt!638522 () SeekEntryResult!11745)

(declare-fun b!1457027 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98623 (_ BitVec 32)) SeekEntryResult!11745)

(assert (=> b!1457027 (= e!819939 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638525 intermediateAfterIndex!19 lt!638526 lt!638521 mask!2687) lt!638522)))))

(declare-fun b!1457028 () Bool)

(declare-fun res!986824 () Bool)

(assert (=> b!1457028 (=> (not res!986824) (not e!819933))))

(declare-datatypes ((List!34084 0))(
  ( (Nil!34081) (Cons!34080 (h!35441 (_ BitVec 64)) (t!48770 List!34084)) )
))
(declare-fun arrayNoDuplicates!0 (array!98623 (_ BitVec 32) List!34084) Bool)

(assert (=> b!1457028 (= res!986824 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34081))))

(declare-fun b!1457029 () Bool)

(declare-fun e!819938 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98623 (_ BitVec 32)) SeekEntryResult!11745)

(assert (=> b!1457029 (= e!819938 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638526 lt!638521 mask!2687) (seekEntryOrOpen!0 lt!638526 lt!638521 mask!2687)))))

(declare-fun b!1457030 () Bool)

(declare-fun res!986816 () Bool)

(assert (=> b!1457030 (=> (not res!986816) (not e!819933))))

(assert (=> b!1457030 (= res!986816 (validKeyInArray!0 (select (arr!47596 a!2862) i!1006)))))

(declare-fun b!1457031 () Bool)

(assert (=> b!1457031 (= e!819938 (= lt!638527 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638526 lt!638521 mask!2687)))))

(declare-fun b!1457032 () Bool)

(assert (=> b!1457032 (= e!819937 e!819931)))

(declare-fun res!986823 () Bool)

(assert (=> b!1457032 (=> (not res!986823) (not e!819931))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457032 (= res!986823 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47596 a!2862) j!93) mask!2687) (select (arr!47596 a!2862) j!93) a!2862 mask!2687) lt!638524))))

(assert (=> b!1457032 (= lt!638524 (Intermediate!11745 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!986817 () Bool)

(assert (=> start!125280 (=> (not res!986817) (not e!819933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125280 (= res!986817 (validMask!0 mask!2687))))

(assert (=> start!125280 e!819933))

(assert (=> start!125280 true))

(declare-fun array_inv!36877 (array!98623) Bool)

(assert (=> start!125280 (array_inv!36877 a!2862)))

(declare-fun b!1457033 () Bool)

(declare-fun e!819932 () Bool)

(assert (=> b!1457033 (= e!819932 e!819936)))

(declare-fun res!986815 () Bool)

(assert (=> b!1457033 (=> res!986815 e!819936)))

(assert (=> b!1457033 (= res!986815 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638525 #b00000000000000000000000000000000) (bvsge lt!638525 (size!48147 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457033 (= lt!638525 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(assert (=> b!1457033 (= lt!638522 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638526 lt!638521 mask!2687))))

(assert (=> b!1457033 (= lt!638522 (seekEntryOrOpen!0 lt!638526 lt!638521 mask!2687))))

(declare-fun b!1457034 () Bool)

(assert (=> b!1457034 (= e!819931 e!819930)))

(declare-fun res!986811 () Bool)

(assert (=> b!1457034 (=> (not res!986811) (not e!819930))))

(assert (=> b!1457034 (= res!986811 (= lt!638527 (Intermediate!11745 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1457034 (= lt!638527 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638526 mask!2687) lt!638526 lt!638521 mask!2687))))

(assert (=> b!1457034 (= lt!638526 (select (store (arr!47596 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1457035 () Bool)

(declare-fun res!986825 () Bool)

(assert (=> b!1457035 (=> (not res!986825) (not e!819933))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98623 (_ BitVec 32)) Bool)

(assert (=> b!1457035 (= res!986825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1457036 () Bool)

(declare-fun res!986812 () Bool)

(assert (=> b!1457036 (=> (not res!986812) (not e!819930))))

(assert (=> b!1457036 (= res!986812 e!819938)))

(declare-fun c!134623 () Bool)

(assert (=> b!1457036 (= c!134623 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1457037 () Bool)

(assert (=> b!1457037 (= e!819930 (not e!819932))))

(declare-fun res!986814 () Bool)

(assert (=> b!1457037 (=> res!986814 e!819932)))

(assert (=> b!1457037 (= res!986814 (or (and (= (select (arr!47596 a!2862) index!646) (select (store (arr!47596 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47596 a!2862) index!646) (select (arr!47596 a!2862) j!93))) (= (select (arr!47596 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1457037 e!819935))

(declare-fun res!986826 () Bool)

(assert (=> b!1457037 (=> (not res!986826) (not e!819935))))

(assert (=> b!1457037 (= res!986826 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49019 0))(
  ( (Unit!49020) )
))
(declare-fun lt!638523 () Unit!49019)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98623 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49019)

(assert (=> b!1457037 (= lt!638523 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1457038 () Bool)

(declare-fun res!986818 () Bool)

(assert (=> b!1457038 (=> (not res!986818) (not e!819935))))

(assert (=> b!1457038 (= res!986818 (= (seekEntryOrOpen!0 (select (arr!47596 a!2862) j!93) a!2862 mask!2687) (Found!11745 j!93)))))

(assert (= (and start!125280 res!986817) b!1457022))

(assert (= (and b!1457022 res!986813) b!1457030))

(assert (= (and b!1457030 res!986816) b!1457026))

(assert (= (and b!1457026 res!986820) b!1457035))

(assert (= (and b!1457035 res!986825) b!1457028))

(assert (= (and b!1457028 res!986824) b!1457024))

(assert (= (and b!1457024 res!986827) b!1457020))

(assert (= (and b!1457020 res!986822) b!1457032))

(assert (= (and b!1457032 res!986823) b!1457021))

(assert (= (and b!1457021 res!986821) b!1457034))

(assert (= (and b!1457034 res!986811) b!1457036))

(assert (= (and b!1457036 c!134623) b!1457031))

(assert (= (and b!1457036 (not c!134623)) b!1457029))

(assert (= (and b!1457036 res!986812) b!1457023))

(assert (= (and b!1457023 res!986828) b!1457037))

(assert (= (and b!1457037 res!986826) b!1457038))

(assert (= (and b!1457038 res!986818) b!1457025))

(assert (= (and b!1457037 (not res!986814)) b!1457033))

(assert (= (and b!1457033 (not res!986815)) b!1457019))

(assert (= (and b!1457019 (not res!986819)) b!1457017))

(assert (= (and b!1457017 c!134622) b!1457018))

(assert (= (and b!1457017 (not c!134622)) b!1457027))

(declare-fun m!1345321 () Bool)

(assert (=> b!1457028 m!1345321))

(declare-fun m!1345323 () Bool)

(assert (=> b!1457020 m!1345323))

(declare-fun m!1345325 () Bool)

(assert (=> b!1457020 m!1345325))

(declare-fun m!1345327 () Bool)

(assert (=> b!1457034 m!1345327))

(assert (=> b!1457034 m!1345327))

(declare-fun m!1345329 () Bool)

(assert (=> b!1457034 m!1345329))

(assert (=> b!1457034 m!1345323))

(declare-fun m!1345331 () Bool)

(assert (=> b!1457034 m!1345331))

(declare-fun m!1345333 () Bool)

(assert (=> b!1457026 m!1345333))

(assert (=> b!1457026 m!1345333))

(declare-fun m!1345335 () Bool)

(assert (=> b!1457026 m!1345335))

(assert (=> b!1457038 m!1345333))

(assert (=> b!1457038 m!1345333))

(declare-fun m!1345337 () Bool)

(assert (=> b!1457038 m!1345337))

(declare-fun m!1345339 () Bool)

(assert (=> b!1457027 m!1345339))

(declare-fun m!1345341 () Bool)

(assert (=> b!1457029 m!1345341))

(declare-fun m!1345343 () Bool)

(assert (=> b!1457029 m!1345343))

(declare-fun m!1345345 () Bool)

(assert (=> b!1457037 m!1345345))

(assert (=> b!1457037 m!1345323))

(declare-fun m!1345347 () Bool)

(assert (=> b!1457037 m!1345347))

(declare-fun m!1345349 () Bool)

(assert (=> b!1457037 m!1345349))

(declare-fun m!1345351 () Bool)

(assert (=> b!1457037 m!1345351))

(assert (=> b!1457037 m!1345333))

(declare-fun m!1345353 () Bool)

(assert (=> start!125280 m!1345353))

(declare-fun m!1345355 () Bool)

(assert (=> start!125280 m!1345355))

(declare-fun m!1345357 () Bool)

(assert (=> b!1457035 m!1345357))

(assert (=> b!1457032 m!1345333))

(assert (=> b!1457032 m!1345333))

(declare-fun m!1345359 () Bool)

(assert (=> b!1457032 m!1345359))

(assert (=> b!1457032 m!1345359))

(assert (=> b!1457032 m!1345333))

(declare-fun m!1345361 () Bool)

(assert (=> b!1457032 m!1345361))

(assert (=> b!1457021 m!1345333))

(assert (=> b!1457021 m!1345333))

(declare-fun m!1345363 () Bool)

(assert (=> b!1457021 m!1345363))

(declare-fun m!1345365 () Bool)

(assert (=> b!1457031 m!1345365))

(assert (=> b!1457019 m!1345333))

(assert (=> b!1457019 m!1345333))

(declare-fun m!1345367 () Bool)

(assert (=> b!1457019 m!1345367))

(declare-fun m!1345369 () Bool)

(assert (=> b!1457033 m!1345369))

(assert (=> b!1457033 m!1345341))

(assert (=> b!1457033 m!1345343))

(declare-fun m!1345371 () Bool)

(assert (=> b!1457018 m!1345371))

(assert (=> b!1457025 m!1345323))

(declare-fun m!1345373 () Bool)

(assert (=> b!1457025 m!1345373))

(assert (=> b!1457025 m!1345347))

(assert (=> b!1457025 m!1345349))

(assert (=> b!1457025 m!1345333))

(declare-fun m!1345375 () Bool)

(assert (=> b!1457030 m!1345375))

(assert (=> b!1457030 m!1345375))

(declare-fun m!1345377 () Bool)

(assert (=> b!1457030 m!1345377))

(check-sat (not b!1457034) (not b!1457029) (not b!1457018) (not b!1457028) (not b!1457026) (not b!1457032) (not b!1457031) (not b!1457035) (not start!125280) (not b!1457038) (not b!1457021) (not b!1457037) (not b!1457033) (not b!1457027) (not b!1457019) (not b!1457030))
(check-sat)
