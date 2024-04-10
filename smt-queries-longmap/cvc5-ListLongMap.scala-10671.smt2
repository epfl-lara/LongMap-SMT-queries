; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125164 () Bool)

(assert start!125164)

(declare-fun e!820608 () Bool)

(declare-fun b!1459056 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((array!98612 0))(
  ( (array!98613 (arr!47594 (Array (_ BitVec 32) (_ BitVec 64))) (size!48144 (_ BitVec 32))) )
))
(declare-fun lt!639289 () array!98612)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!639287 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11846 0))(
  ( (MissingZero!11846 (index!49776 (_ BitVec 32))) (Found!11846 (index!49777 (_ BitVec 32))) (Intermediate!11846 (undefined!12658 Bool) (index!49778 (_ BitVec 32)) (x!131391 (_ BitVec 32))) (Undefined!11846) (MissingVacant!11846 (index!49779 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98612 (_ BitVec 32)) SeekEntryResult!11846)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98612 (_ BitVec 32)) SeekEntryResult!11846)

(assert (=> b!1459056 (= e!820608 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639287 lt!639289 mask!2687) (seekEntryOrOpen!0 lt!639287 lt!639289 mask!2687)))))

(declare-fun b!1459057 () Bool)

(declare-fun e!820604 () Bool)

(declare-fun e!820609 () Bool)

(assert (=> b!1459057 (= e!820604 e!820609)))

(declare-fun res!989064 () Bool)

(assert (=> b!1459057 (=> (not res!989064) (not e!820609))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!639286 () SeekEntryResult!11846)

(assert (=> b!1459057 (= res!989064 (= lt!639286 (Intermediate!11846 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98612 (_ BitVec 32)) SeekEntryResult!11846)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459057 (= lt!639286 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639287 mask!2687) lt!639287 lt!639289 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98612)

(assert (=> b!1459057 (= lt!639287 (select (store (arr!47594 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459058 () Bool)

(declare-fun res!989067 () Bool)

(declare-fun e!820606 () Bool)

(assert (=> b!1459058 (=> (not res!989067) (not e!820606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98612 (_ BitVec 32)) Bool)

(assert (=> b!1459058 (= res!989067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459059 () Bool)

(assert (=> b!1459059 (= e!820608 (= lt!639286 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639287 lt!639289 mask!2687)))))

(declare-fun res!989068 () Bool)

(assert (=> start!125164 (=> (not res!989068) (not e!820606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125164 (= res!989068 (validMask!0 mask!2687))))

(assert (=> start!125164 e!820606))

(assert (=> start!125164 true))

(declare-fun array_inv!36622 (array!98612) Bool)

(assert (=> start!125164 (array_inv!36622 a!2862)))

(declare-fun e!820605 () Bool)

(declare-fun b!1459060 () Bool)

(declare-fun lt!639293 () (_ BitVec 32))

(assert (=> b!1459060 (= e!820605 (not (= lt!639286 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639293 lt!639287 lt!639289 mask!2687))))))

(declare-fun b!1459061 () Bool)

(declare-fun res!989077 () Bool)

(assert (=> b!1459061 (=> (not res!989077) (not e!820606))))

(assert (=> b!1459061 (= res!989077 (and (= (size!48144 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48144 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48144 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459062 () Bool)

(declare-fun e!820610 () Bool)

(assert (=> b!1459062 (= e!820606 e!820610)))

(declare-fun res!989065 () Bool)

(assert (=> b!1459062 (=> (not res!989065) (not e!820610))))

(assert (=> b!1459062 (= res!989065 (= (select (store (arr!47594 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459062 (= lt!639289 (array!98613 (store (arr!47594 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48144 a!2862)))))

(declare-fun b!1459063 () Bool)

(declare-fun res!989080 () Bool)

(declare-fun e!820603 () Bool)

(assert (=> b!1459063 (=> res!989080 e!820603)))

(declare-fun lt!639292 () SeekEntryResult!11846)

(assert (=> b!1459063 (= res!989080 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639293 (select (arr!47594 a!2862) j!93) a!2862 mask!2687) lt!639292)))))

(declare-fun b!1459064 () Bool)

(declare-fun res!989063 () Bool)

(assert (=> b!1459064 (=> (not res!989063) (not e!820609))))

(assert (=> b!1459064 (= res!989063 e!820608)))

(declare-fun c!134508 () Bool)

(assert (=> b!1459064 (= c!134508 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459065 () Bool)

(declare-fun e!820602 () Bool)

(assert (=> b!1459065 (= e!820609 (not e!820602))))

(declare-fun res!989069 () Bool)

(assert (=> b!1459065 (=> res!989069 e!820602)))

(assert (=> b!1459065 (= res!989069 (or (and (= (select (arr!47594 a!2862) index!646) (select (store (arr!47594 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47594 a!2862) index!646) (select (arr!47594 a!2862) j!93))) (= (select (arr!47594 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!639294 () SeekEntryResult!11846)

(assert (=> b!1459065 (and (= lt!639294 (Found!11846 j!93)) (or (= (select (arr!47594 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47594 a!2862) intermediateBeforeIndex!19) (select (arr!47594 a!2862) j!93))) (let ((bdg!53481 (select (store (arr!47594 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47594 a!2862) index!646) bdg!53481) (= (select (arr!47594 a!2862) index!646) (select (arr!47594 a!2862) j!93))) (= (select (arr!47594 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53481 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1459065 (= lt!639294 (seekEntryOrOpen!0 (select (arr!47594 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1459065 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49188 0))(
  ( (Unit!49189) )
))
(declare-fun lt!639290 () Unit!49188)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98612 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49188)

(assert (=> b!1459065 (= lt!639290 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459066 () Bool)

(declare-fun res!989070 () Bool)

(assert (=> b!1459066 (=> (not res!989070) (not e!820609))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1459066 (= res!989070 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459067 () Bool)

(declare-fun res!989066 () Bool)

(assert (=> b!1459067 (=> (not res!989066) (not e!820606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459067 (= res!989066 (validKeyInArray!0 (select (arr!47594 a!2862) i!1006)))))

(declare-fun b!1459068 () Bool)

(assert (=> b!1459068 (= e!820603 true)))

(declare-fun lt!639291 () SeekEntryResult!11846)

(assert (=> b!1459068 (= lt!639294 lt!639291)))

(declare-fun lt!639288 () Unit!49188)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98612 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49188)

(assert (=> b!1459068 (= lt!639288 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639293 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1459069 () Bool)

(declare-fun res!989074 () Bool)

(assert (=> b!1459069 (=> (not res!989074) (not e!820604))))

(assert (=> b!1459069 (= res!989074 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47594 a!2862) j!93) a!2862 mask!2687) lt!639292))))

(declare-fun b!1459070 () Bool)

(declare-fun res!989071 () Bool)

(assert (=> b!1459070 (=> (not res!989071) (not e!820606))))

(assert (=> b!1459070 (= res!989071 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48144 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48144 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48144 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1459071 () Bool)

(declare-fun res!989079 () Bool)

(assert (=> b!1459071 (=> res!989079 e!820603)))

(assert (=> b!1459071 (= res!989079 e!820605)))

(declare-fun c!134507 () Bool)

(assert (=> b!1459071 (= c!134507 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459072 () Bool)

(declare-fun res!989075 () Bool)

(assert (=> b!1459072 (=> (not res!989075) (not e!820606))))

(assert (=> b!1459072 (= res!989075 (validKeyInArray!0 (select (arr!47594 a!2862) j!93)))))

(declare-fun b!1459073 () Bool)

(declare-fun res!989076 () Bool)

(assert (=> b!1459073 (=> res!989076 e!820603)))

(assert (=> b!1459073 (= res!989076 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1459074 () Bool)

(assert (=> b!1459074 (= e!820605 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639293 intermediateAfterIndex!19 lt!639287 lt!639289 mask!2687) lt!639291)))))

(declare-fun b!1459075 () Bool)

(declare-fun res!989072 () Bool)

(assert (=> b!1459075 (=> (not res!989072) (not e!820606))))

(declare-datatypes ((List!34095 0))(
  ( (Nil!34092) (Cons!34091 (h!35441 (_ BitVec 64)) (t!48789 List!34095)) )
))
(declare-fun arrayNoDuplicates!0 (array!98612 (_ BitVec 32) List!34095) Bool)

(assert (=> b!1459075 (= res!989072 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34092))))

(declare-fun b!1459076 () Bool)

(assert (=> b!1459076 (= e!820602 e!820603)))

(declare-fun res!989073 () Bool)

(assert (=> b!1459076 (=> res!989073 e!820603)))

(assert (=> b!1459076 (= res!989073 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639293 #b00000000000000000000000000000000) (bvsge lt!639293 (size!48144 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459076 (= lt!639293 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1459076 (= lt!639291 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639287 lt!639289 mask!2687))))

(assert (=> b!1459076 (= lt!639291 (seekEntryOrOpen!0 lt!639287 lt!639289 mask!2687))))

(declare-fun b!1459077 () Bool)

(assert (=> b!1459077 (= e!820610 e!820604)))

(declare-fun res!989078 () Bool)

(assert (=> b!1459077 (=> (not res!989078) (not e!820604))))

(assert (=> b!1459077 (= res!989078 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47594 a!2862) j!93) mask!2687) (select (arr!47594 a!2862) j!93) a!2862 mask!2687) lt!639292))))

(assert (=> b!1459077 (= lt!639292 (Intermediate!11846 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125164 res!989068) b!1459061))

(assert (= (and b!1459061 res!989077) b!1459067))

(assert (= (and b!1459067 res!989066) b!1459072))

(assert (= (and b!1459072 res!989075) b!1459058))

(assert (= (and b!1459058 res!989067) b!1459075))

(assert (= (and b!1459075 res!989072) b!1459070))

(assert (= (and b!1459070 res!989071) b!1459062))

(assert (= (and b!1459062 res!989065) b!1459077))

(assert (= (and b!1459077 res!989078) b!1459069))

(assert (= (and b!1459069 res!989074) b!1459057))

(assert (= (and b!1459057 res!989064) b!1459064))

(assert (= (and b!1459064 c!134508) b!1459059))

(assert (= (and b!1459064 (not c!134508)) b!1459056))

(assert (= (and b!1459064 res!989063) b!1459066))

(assert (= (and b!1459066 res!989070) b!1459065))

(assert (= (and b!1459065 (not res!989069)) b!1459076))

(assert (= (and b!1459076 (not res!989073)) b!1459063))

(assert (= (and b!1459063 (not res!989080)) b!1459071))

(assert (= (and b!1459071 c!134507) b!1459060))

(assert (= (and b!1459071 (not c!134507)) b!1459074))

(assert (= (and b!1459071 (not res!989079)) b!1459073))

(assert (= (and b!1459073 (not res!989076)) b!1459068))

(declare-fun m!1346851 () Bool)

(assert (=> b!1459057 m!1346851))

(assert (=> b!1459057 m!1346851))

(declare-fun m!1346853 () Bool)

(assert (=> b!1459057 m!1346853))

(declare-fun m!1346855 () Bool)

(assert (=> b!1459057 m!1346855))

(declare-fun m!1346857 () Bool)

(assert (=> b!1459057 m!1346857))

(declare-fun m!1346859 () Bool)

(assert (=> b!1459076 m!1346859))

(declare-fun m!1346861 () Bool)

(assert (=> b!1459076 m!1346861))

(declare-fun m!1346863 () Bool)

(assert (=> b!1459076 m!1346863))

(declare-fun m!1346865 () Bool)

(assert (=> b!1459059 m!1346865))

(declare-fun m!1346867 () Bool)

(assert (=> b!1459077 m!1346867))

(assert (=> b!1459077 m!1346867))

(declare-fun m!1346869 () Bool)

(assert (=> b!1459077 m!1346869))

(assert (=> b!1459077 m!1346869))

(assert (=> b!1459077 m!1346867))

(declare-fun m!1346871 () Bool)

(assert (=> b!1459077 m!1346871))

(declare-fun m!1346873 () Bool)

(assert (=> b!1459060 m!1346873))

(declare-fun m!1346875 () Bool)

(assert (=> start!125164 m!1346875))

(declare-fun m!1346877 () Bool)

(assert (=> start!125164 m!1346877))

(assert (=> b!1459056 m!1346861))

(assert (=> b!1459056 m!1346863))

(declare-fun m!1346879 () Bool)

(assert (=> b!1459058 m!1346879))

(declare-fun m!1346881 () Bool)

(assert (=> b!1459065 m!1346881))

(assert (=> b!1459065 m!1346855))

(declare-fun m!1346883 () Bool)

(assert (=> b!1459065 m!1346883))

(declare-fun m!1346885 () Bool)

(assert (=> b!1459065 m!1346885))

(declare-fun m!1346887 () Bool)

(assert (=> b!1459065 m!1346887))

(assert (=> b!1459065 m!1346867))

(declare-fun m!1346889 () Bool)

(assert (=> b!1459065 m!1346889))

(declare-fun m!1346891 () Bool)

(assert (=> b!1459065 m!1346891))

(assert (=> b!1459065 m!1346867))

(declare-fun m!1346893 () Bool)

(assert (=> b!1459075 m!1346893))

(declare-fun m!1346895 () Bool)

(assert (=> b!1459074 m!1346895))

(declare-fun m!1346897 () Bool)

(assert (=> b!1459068 m!1346897))

(assert (=> b!1459072 m!1346867))

(assert (=> b!1459072 m!1346867))

(declare-fun m!1346899 () Bool)

(assert (=> b!1459072 m!1346899))

(declare-fun m!1346901 () Bool)

(assert (=> b!1459067 m!1346901))

(assert (=> b!1459067 m!1346901))

(declare-fun m!1346903 () Bool)

(assert (=> b!1459067 m!1346903))

(assert (=> b!1459062 m!1346855))

(declare-fun m!1346905 () Bool)

(assert (=> b!1459062 m!1346905))

(assert (=> b!1459069 m!1346867))

(assert (=> b!1459069 m!1346867))

(declare-fun m!1346907 () Bool)

(assert (=> b!1459069 m!1346907))

(assert (=> b!1459063 m!1346867))

(assert (=> b!1459063 m!1346867))

(declare-fun m!1346909 () Bool)

(assert (=> b!1459063 m!1346909))

(push 1)

