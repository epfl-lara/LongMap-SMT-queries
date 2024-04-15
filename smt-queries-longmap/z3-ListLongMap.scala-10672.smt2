; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125140 () Bool)

(assert start!125140)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1459059 () Bool)

(declare-datatypes ((array!98566 0))(
  ( (array!98567 (arr!47572 (Array (_ BitVec 32) (_ BitVec 64))) (size!48124 (_ BitVec 32))) )
))
(declare-fun lt!639134 () array!98566)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11849 0))(
  ( (MissingZero!11849 (index!49788 (_ BitVec 32))) (Found!11849 (index!49789 (_ BitVec 32))) (Intermediate!11849 (undefined!12661 Bool) (index!49790 (_ BitVec 32)) (x!131397 (_ BitVec 32))) (Undefined!11849) (MissingVacant!11849 (index!49791 (_ BitVec 32))) )
))
(declare-fun lt!639141 () SeekEntryResult!11849)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!639139 () (_ BitVec 64))

(declare-fun e!820571 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98566 (_ BitVec 32)) SeekEntryResult!11849)

(assert (=> b!1459059 (= e!820571 (= lt!639141 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639139 lt!639134 mask!2687)))))

(declare-fun b!1459060 () Bool)

(declare-fun res!989162 () Bool)

(declare-fun e!820572 () Bool)

(assert (=> b!1459060 (=> res!989162 e!820572)))

(declare-fun e!820569 () Bool)

(assert (=> b!1459060 (= res!989162 e!820569)))

(declare-fun c!134470 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1459060 (= c!134470 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459061 () Bool)

(declare-fun e!820573 () Bool)

(assert (=> b!1459061 (= e!820573 e!820572)))

(declare-fun res!989149 () Bool)

(assert (=> b!1459061 (=> res!989149 e!820572)))

(declare-fun a!2862 () array!98566)

(declare-fun lt!639136 () (_ BitVec 32))

(assert (=> b!1459061 (= res!989149 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639136 #b00000000000000000000000000000000) (bvsge lt!639136 (size!48124 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459061 (= lt!639136 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!639137 () SeekEntryResult!11849)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98566 (_ BitVec 32)) SeekEntryResult!11849)

(assert (=> b!1459061 (= lt!639137 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639139 lt!639134 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98566 (_ BitVec 32)) SeekEntryResult!11849)

(assert (=> b!1459061 (= lt!639137 (seekEntryOrOpen!0 lt!639139 lt!639134 mask!2687))))

(declare-fun b!1459062 () Bool)

(declare-fun res!989148 () Bool)

(declare-fun e!820567 () Bool)

(assert (=> b!1459062 (=> (not res!989148) (not e!820567))))

(declare-datatypes ((List!34151 0))(
  ( (Nil!34148) (Cons!34147 (h!35497 (_ BitVec 64)) (t!48837 List!34151)) )
))
(declare-fun arrayNoDuplicates!0 (array!98566 (_ BitVec 32) List!34151) Bool)

(assert (=> b!1459062 (= res!989148 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34148))))

(declare-fun b!1459063 () Bool)

(declare-fun res!989152 () Bool)

(declare-fun e!820575 () Bool)

(assert (=> b!1459063 (=> (not res!989152) (not e!820575))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!639140 () SeekEntryResult!11849)

(assert (=> b!1459063 (= res!989152 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47572 a!2862) j!93) a!2862 mask!2687) lt!639140))))

(declare-fun b!1459064 () Bool)

(assert (=> b!1459064 (= e!820569 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639136 intermediateAfterIndex!19 lt!639139 lt!639134 mask!2687) lt!639137)))))

(declare-fun b!1459065 () Bool)

(declare-fun res!989150 () Bool)

(assert (=> b!1459065 (=> (not res!989150) (not e!820567))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459065 (= res!989150 (validKeyInArray!0 (select (arr!47572 a!2862) j!93)))))

(declare-fun b!1459066 () Bool)

(declare-fun e!820570 () Bool)

(assert (=> b!1459066 (= e!820575 e!820570)))

(declare-fun res!989147 () Bool)

(assert (=> b!1459066 (=> (not res!989147) (not e!820570))))

(assert (=> b!1459066 (= res!989147 (= lt!639141 (Intermediate!11849 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459066 (= lt!639141 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639139 mask!2687) lt!639139 lt!639134 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1459066 (= lt!639139 (select (store (arr!47572 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459067 () Bool)

(declare-fun res!989155 () Bool)

(assert (=> b!1459067 (=> (not res!989155) (not e!820570))))

(assert (=> b!1459067 (= res!989155 e!820571)))

(declare-fun c!134469 () Bool)

(assert (=> b!1459067 (= c!134469 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459068 () Bool)

(declare-fun res!989161 () Bool)

(assert (=> b!1459068 (=> res!989161 e!820572)))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1459068 (= res!989161 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1459069 () Bool)

(assert (=> b!1459069 (= e!820571 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639139 lt!639134 mask!2687) (seekEntryOrOpen!0 lt!639139 lt!639134 mask!2687)))))

(declare-fun b!1459070 () Bool)

(declare-fun e!820568 () Bool)

(assert (=> b!1459070 (= e!820567 e!820568)))

(declare-fun res!989164 () Bool)

(assert (=> b!1459070 (=> (not res!989164) (not e!820568))))

(assert (=> b!1459070 (= res!989164 (= (select (store (arr!47572 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459070 (= lt!639134 (array!98567 (store (arr!47572 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48124 a!2862)))))

(declare-fun b!1459071 () Bool)

(declare-fun res!989160 () Bool)

(assert (=> b!1459071 (=> (not res!989160) (not e!820567))))

(assert (=> b!1459071 (= res!989160 (validKeyInArray!0 (select (arr!47572 a!2862) i!1006)))))

(declare-fun b!1459072 () Bool)

(assert (=> b!1459072 (= e!820570 (not e!820573))))

(declare-fun res!989154 () Bool)

(assert (=> b!1459072 (=> res!989154 e!820573)))

(assert (=> b!1459072 (= res!989154 (or (and (= (select (arr!47572 a!2862) index!646) (select (store (arr!47572 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47572 a!2862) index!646) (select (arr!47572 a!2862) j!93))) (= (select (arr!47572 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun lt!639133 () SeekEntryResult!11849)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1459072 (and (= lt!639133 (Found!11849 j!93)) (or (= (select (arr!47572 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47572 a!2862) intermediateBeforeIndex!19) (select (arr!47572 a!2862) j!93))) (let ((bdg!53497 (select (store (arr!47572 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47572 a!2862) index!646) bdg!53497) (= (select (arr!47572 a!2862) index!646) (select (arr!47572 a!2862) j!93))) (= (select (arr!47572 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53497 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1459072 (= lt!639133 (seekEntryOrOpen!0 (select (arr!47572 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98566 (_ BitVec 32)) Bool)

(assert (=> b!1459072 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49035 0))(
  ( (Unit!49036) )
))
(declare-fun lt!639135 () Unit!49035)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49035)

(assert (=> b!1459072 (= lt!639135 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459073 () Bool)

(declare-fun res!989153 () Bool)

(assert (=> b!1459073 (=> (not res!989153) (not e!820570))))

(assert (=> b!1459073 (= res!989153 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!989159 () Bool)

(assert (=> start!125140 (=> (not res!989159) (not e!820567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125140 (= res!989159 (validMask!0 mask!2687))))

(assert (=> start!125140 e!820567))

(assert (=> start!125140 true))

(declare-fun array_inv!36805 (array!98566) Bool)

(assert (=> start!125140 (array_inv!36805 a!2862)))

(declare-fun b!1459074 () Bool)

(declare-fun res!989157 () Bool)

(assert (=> b!1459074 (=> res!989157 e!820572)))

(assert (=> b!1459074 (= res!989157 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639136 (select (arr!47572 a!2862) j!93) a!2862 mask!2687) lt!639140)))))

(declare-fun b!1459075 () Bool)

(declare-fun res!989158 () Bool)

(assert (=> b!1459075 (=> (not res!989158) (not e!820567))))

(assert (=> b!1459075 (= res!989158 (and (= (size!48124 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48124 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48124 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459076 () Bool)

(declare-fun res!989156 () Bool)

(assert (=> b!1459076 (=> (not res!989156) (not e!820567))))

(assert (=> b!1459076 (= res!989156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459077 () Bool)

(assert (=> b!1459077 (= e!820568 e!820575)))

(declare-fun res!989151 () Bool)

(assert (=> b!1459077 (=> (not res!989151) (not e!820575))))

(assert (=> b!1459077 (= res!989151 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47572 a!2862) j!93) mask!2687) (select (arr!47572 a!2862) j!93) a!2862 mask!2687) lt!639140))))

(assert (=> b!1459077 (= lt!639140 (Intermediate!11849 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1459078 () Bool)

(declare-fun res!989163 () Bool)

(assert (=> b!1459078 (=> (not res!989163) (not e!820567))))

(assert (=> b!1459078 (= res!989163 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48124 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48124 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48124 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1459079 () Bool)

(assert (=> b!1459079 (= e!820572 true)))

(assert (=> b!1459079 (= lt!639133 lt!639137)))

(declare-fun lt!639138 () Unit!49035)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49035)

(assert (=> b!1459079 (= lt!639138 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639136 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1459080 () Bool)

(assert (=> b!1459080 (= e!820569 (not (= lt!639141 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639136 lt!639139 lt!639134 mask!2687))))))

(assert (= (and start!125140 res!989159) b!1459075))

(assert (= (and b!1459075 res!989158) b!1459071))

(assert (= (and b!1459071 res!989160) b!1459065))

(assert (= (and b!1459065 res!989150) b!1459076))

(assert (= (and b!1459076 res!989156) b!1459062))

(assert (= (and b!1459062 res!989148) b!1459078))

(assert (= (and b!1459078 res!989163) b!1459070))

(assert (= (and b!1459070 res!989164) b!1459077))

(assert (= (and b!1459077 res!989151) b!1459063))

(assert (= (and b!1459063 res!989152) b!1459066))

(assert (= (and b!1459066 res!989147) b!1459067))

(assert (= (and b!1459067 c!134469) b!1459059))

(assert (= (and b!1459067 (not c!134469)) b!1459069))

(assert (= (and b!1459067 res!989155) b!1459073))

(assert (= (and b!1459073 res!989153) b!1459072))

(assert (= (and b!1459072 (not res!989154)) b!1459061))

(assert (= (and b!1459061 (not res!989149)) b!1459074))

(assert (= (and b!1459074 (not res!989157)) b!1459060))

(assert (= (and b!1459060 c!134470) b!1459080))

(assert (= (and b!1459060 (not c!134470)) b!1459064))

(assert (= (and b!1459060 (not res!989162)) b!1459068))

(assert (= (and b!1459068 (not res!989161)) b!1459079))

(declare-fun m!1346355 () Bool)

(assert (=> b!1459071 m!1346355))

(assert (=> b!1459071 m!1346355))

(declare-fun m!1346357 () Bool)

(assert (=> b!1459071 m!1346357))

(declare-fun m!1346359 () Bool)

(assert (=> b!1459066 m!1346359))

(assert (=> b!1459066 m!1346359))

(declare-fun m!1346361 () Bool)

(assert (=> b!1459066 m!1346361))

(declare-fun m!1346363 () Bool)

(assert (=> b!1459066 m!1346363))

(declare-fun m!1346365 () Bool)

(assert (=> b!1459066 m!1346365))

(declare-fun m!1346367 () Bool)

(assert (=> b!1459062 m!1346367))

(declare-fun m!1346369 () Bool)

(assert (=> b!1459074 m!1346369))

(assert (=> b!1459074 m!1346369))

(declare-fun m!1346371 () Bool)

(assert (=> b!1459074 m!1346371))

(declare-fun m!1346373 () Bool)

(assert (=> start!125140 m!1346373))

(declare-fun m!1346375 () Bool)

(assert (=> start!125140 m!1346375))

(assert (=> b!1459077 m!1346369))

(assert (=> b!1459077 m!1346369))

(declare-fun m!1346377 () Bool)

(assert (=> b!1459077 m!1346377))

(assert (=> b!1459077 m!1346377))

(assert (=> b!1459077 m!1346369))

(declare-fun m!1346379 () Bool)

(assert (=> b!1459077 m!1346379))

(assert (=> b!1459070 m!1346363))

(declare-fun m!1346381 () Bool)

(assert (=> b!1459070 m!1346381))

(assert (=> b!1459063 m!1346369))

(assert (=> b!1459063 m!1346369))

(declare-fun m!1346383 () Bool)

(assert (=> b!1459063 m!1346383))

(declare-fun m!1346385 () Bool)

(assert (=> b!1459079 m!1346385))

(declare-fun m!1346387 () Bool)

(assert (=> b!1459069 m!1346387))

(declare-fun m!1346389 () Bool)

(assert (=> b!1459069 m!1346389))

(declare-fun m!1346391 () Bool)

(assert (=> b!1459080 m!1346391))

(declare-fun m!1346393 () Bool)

(assert (=> b!1459072 m!1346393))

(assert (=> b!1459072 m!1346363))

(declare-fun m!1346395 () Bool)

(assert (=> b!1459072 m!1346395))

(declare-fun m!1346397 () Bool)

(assert (=> b!1459072 m!1346397))

(declare-fun m!1346399 () Bool)

(assert (=> b!1459072 m!1346399))

(assert (=> b!1459072 m!1346369))

(declare-fun m!1346401 () Bool)

(assert (=> b!1459072 m!1346401))

(declare-fun m!1346403 () Bool)

(assert (=> b!1459072 m!1346403))

(assert (=> b!1459072 m!1346369))

(declare-fun m!1346405 () Bool)

(assert (=> b!1459064 m!1346405))

(declare-fun m!1346407 () Bool)

(assert (=> b!1459076 m!1346407))

(declare-fun m!1346409 () Bool)

(assert (=> b!1459061 m!1346409))

(assert (=> b!1459061 m!1346387))

(assert (=> b!1459061 m!1346389))

(declare-fun m!1346411 () Bool)

(assert (=> b!1459059 m!1346411))

(assert (=> b!1459065 m!1346369))

(assert (=> b!1459065 m!1346369))

(declare-fun m!1346413 () Bool)

(assert (=> b!1459065 m!1346413))

(check-sat (not b!1459076) (not b!1459062) (not b!1459072) (not b!1459079) (not b!1459071) (not b!1459059) (not b!1459080) (not b!1459065) (not b!1459074) (not b!1459077) (not b!1459064) (not b!1459063) (not b!1459069) (not b!1459066) (not b!1459061) (not start!125140))
(check-sat)
