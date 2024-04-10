; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124914 () Bool)

(assert start!124914)

(declare-fun b!1451330 () Bool)

(declare-fun res!982590 () Bool)

(declare-fun e!817178 () Bool)

(assert (=> b!1451330 (=> (not res!982590) (not e!817178))))

(declare-datatypes ((array!98362 0))(
  ( (array!98363 (arr!47469 (Array (_ BitVec 32) (_ BitVec 64))) (size!48019 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98362)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451330 (= res!982590 (validKeyInArray!0 (select (arr!47469 a!2862) i!1006)))))

(declare-fun b!1451331 () Bool)

(declare-fun e!817173 () Bool)

(declare-fun e!817175 () Bool)

(assert (=> b!1451331 (= e!817173 e!817175)))

(declare-fun res!982580 () Bool)

(assert (=> b!1451331 (=> (not res!982580) (not e!817175))))

(declare-datatypes ((SeekEntryResult!11721 0))(
  ( (MissingZero!11721 (index!49276 (_ BitVec 32))) (Found!11721 (index!49277 (_ BitVec 32))) (Intermediate!11721 (undefined!12533 Bool) (index!49278 (_ BitVec 32)) (x!130930 (_ BitVec 32))) (Undefined!11721) (MissingVacant!11721 (index!49279 (_ BitVec 32))) )
))
(declare-fun lt!636623 () SeekEntryResult!11721)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98362 (_ BitVec 32)) SeekEntryResult!11721)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451331 (= res!982580 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47469 a!2862) j!93) mask!2687) (select (arr!47469 a!2862) j!93) a!2862 mask!2687) lt!636623))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1451331 (= lt!636623 (Intermediate!11721 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451332 () Bool)

(declare-fun res!982588 () Bool)

(assert (=> b!1451332 (=> (not res!982588) (not e!817178))))

(assert (=> b!1451332 (= res!982588 (and (= (size!48019 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48019 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48019 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451333 () Bool)

(declare-fun res!982589 () Bool)

(assert (=> b!1451333 (=> (not res!982589) (not e!817178))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98362 (_ BitVec 32)) Bool)

(assert (=> b!1451333 (= res!982589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1451334 () Bool)

(declare-fun e!817174 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!636624 () array!98362)

(declare-fun lt!636620 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98362 (_ BitVec 32)) SeekEntryResult!11721)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98362 (_ BitVec 32)) SeekEntryResult!11721)

(assert (=> b!1451334 (= e!817174 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636620 lt!636624 mask!2687) (seekEntryOrOpen!0 lt!636620 lt!636624 mask!2687)))))

(declare-fun b!1451335 () Bool)

(declare-fun e!817177 () Bool)

(assert (=> b!1451335 (= e!817175 e!817177)))

(declare-fun res!982591 () Bool)

(assert (=> b!1451335 (=> (not res!982591) (not e!817177))))

(declare-fun lt!636621 () SeekEntryResult!11721)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1451335 (= res!982591 (= lt!636621 (Intermediate!11721 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1451335 (= lt!636621 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636620 mask!2687) lt!636620 lt!636624 mask!2687))))

(assert (=> b!1451335 (= lt!636620 (select (store (arr!47469 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451336 () Bool)

(declare-fun res!982584 () Bool)

(assert (=> b!1451336 (=> (not res!982584) (not e!817178))))

(assert (=> b!1451336 (= res!982584 (validKeyInArray!0 (select (arr!47469 a!2862) j!93)))))

(declare-fun b!1451337 () Bool)

(declare-fun res!982586 () Bool)

(assert (=> b!1451337 (=> (not res!982586) (not e!817175))))

(assert (=> b!1451337 (= res!982586 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47469 a!2862) j!93) a!2862 mask!2687) lt!636623))))

(declare-fun b!1451338 () Bool)

(declare-fun res!982578 () Bool)

(assert (=> b!1451338 (=> (not res!982578) (not e!817177))))

(assert (=> b!1451338 (= res!982578 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451339 () Bool)

(assert (=> b!1451339 (= e!817178 e!817173)))

(declare-fun res!982582 () Bool)

(assert (=> b!1451339 (=> (not res!982582) (not e!817173))))

(assert (=> b!1451339 (= res!982582 (= (select (store (arr!47469 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451339 (= lt!636624 (array!98363 (store (arr!47469 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48019 a!2862)))))

(declare-fun res!982583 () Bool)

(assert (=> start!124914 (=> (not res!982583) (not e!817178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124914 (= res!982583 (validMask!0 mask!2687))))

(assert (=> start!124914 e!817178))

(assert (=> start!124914 true))

(declare-fun array_inv!36497 (array!98362) Bool)

(assert (=> start!124914 (array_inv!36497 a!2862)))

(declare-fun b!1451340 () Bool)

(assert (=> b!1451340 (= e!817174 (= lt!636621 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636620 lt!636624 mask!2687)))))

(declare-fun b!1451341 () Bool)

(declare-fun res!982585 () Bool)

(assert (=> b!1451341 (=> (not res!982585) (not e!817177))))

(assert (=> b!1451341 (= res!982585 e!817174)))

(declare-fun c!133887 () Bool)

(assert (=> b!1451341 (= c!133887 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451342 () Bool)

(declare-fun res!982579 () Bool)

(assert (=> b!1451342 (=> (not res!982579) (not e!817178))))

(declare-datatypes ((List!33970 0))(
  ( (Nil!33967) (Cons!33966 (h!35316 (_ BitVec 64)) (t!48664 List!33970)) )
))
(declare-fun arrayNoDuplicates!0 (array!98362 (_ BitVec 32) List!33970) Bool)

(assert (=> b!1451342 (= res!982579 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33967))))

(declare-fun b!1451343 () Bool)

(assert (=> b!1451343 (= e!817177 (not (or (and (= (select (arr!47469 a!2862) index!646) (select (store (arr!47469 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47469 a!2862) index!646) (select (arr!47469 a!2862) j!93))) (= (select (arr!47469 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(declare-fun e!817172 () Bool)

(assert (=> b!1451343 e!817172))

(declare-fun res!982581 () Bool)

(assert (=> b!1451343 (=> (not res!982581) (not e!817172))))

(assert (=> b!1451343 (= res!982581 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48938 0))(
  ( (Unit!48939) )
))
(declare-fun lt!636622 () Unit!48938)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48938)

(assert (=> b!1451343 (= lt!636622 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451344 () Bool)

(declare-fun res!982577 () Bool)

(assert (=> b!1451344 (=> (not res!982577) (not e!817178))))

(assert (=> b!1451344 (= res!982577 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48019 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48019 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48019 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451345 () Bool)

(assert (=> b!1451345 (= e!817172 (and (or (= (select (arr!47469 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47469 a!2862) intermediateBeforeIndex!19) (select (arr!47469 a!2862) j!93))) (or (and (= (select (arr!47469 a!2862) index!646) (select (store (arr!47469 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47469 a!2862) index!646) (select (arr!47469 a!2862) j!93))) (= (select (arr!47469 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47469 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1451346 () Bool)

(declare-fun res!982587 () Bool)

(assert (=> b!1451346 (=> (not res!982587) (not e!817172))))

(assert (=> b!1451346 (= res!982587 (= (seekEntryOrOpen!0 (select (arr!47469 a!2862) j!93) a!2862 mask!2687) (Found!11721 j!93)))))

(assert (= (and start!124914 res!982583) b!1451332))

(assert (= (and b!1451332 res!982588) b!1451330))

(assert (= (and b!1451330 res!982590) b!1451336))

(assert (= (and b!1451336 res!982584) b!1451333))

(assert (= (and b!1451333 res!982589) b!1451342))

(assert (= (and b!1451342 res!982579) b!1451344))

(assert (= (and b!1451344 res!982577) b!1451339))

(assert (= (and b!1451339 res!982582) b!1451331))

(assert (= (and b!1451331 res!982580) b!1451337))

(assert (= (and b!1451337 res!982586) b!1451335))

(assert (= (and b!1451335 res!982591) b!1451341))

(assert (= (and b!1451341 c!133887) b!1451340))

(assert (= (and b!1451341 (not c!133887)) b!1451334))

(assert (= (and b!1451341 res!982585) b!1451338))

(assert (= (and b!1451338 res!982578) b!1451343))

(assert (= (and b!1451343 res!982581) b!1451346))

(assert (= (and b!1451346 res!982587) b!1451345))

(declare-fun m!1339929 () Bool)

(assert (=> b!1451333 m!1339929))

(declare-fun m!1339931 () Bool)

(assert (=> b!1451346 m!1339931))

(assert (=> b!1451346 m!1339931))

(declare-fun m!1339933 () Bool)

(assert (=> b!1451346 m!1339933))

(declare-fun m!1339935 () Bool)

(assert (=> start!124914 m!1339935))

(declare-fun m!1339937 () Bool)

(assert (=> start!124914 m!1339937))

(assert (=> b!1451337 m!1339931))

(assert (=> b!1451337 m!1339931))

(declare-fun m!1339939 () Bool)

(assert (=> b!1451337 m!1339939))

(declare-fun m!1339941 () Bool)

(assert (=> b!1451330 m!1339941))

(assert (=> b!1451330 m!1339941))

(declare-fun m!1339943 () Bool)

(assert (=> b!1451330 m!1339943))

(declare-fun m!1339945 () Bool)

(assert (=> b!1451335 m!1339945))

(assert (=> b!1451335 m!1339945))

(declare-fun m!1339947 () Bool)

(assert (=> b!1451335 m!1339947))

(declare-fun m!1339949 () Bool)

(assert (=> b!1451335 m!1339949))

(declare-fun m!1339951 () Bool)

(assert (=> b!1451335 m!1339951))

(declare-fun m!1339953 () Bool)

(assert (=> b!1451343 m!1339953))

(assert (=> b!1451343 m!1339949))

(declare-fun m!1339955 () Bool)

(assert (=> b!1451343 m!1339955))

(declare-fun m!1339957 () Bool)

(assert (=> b!1451343 m!1339957))

(declare-fun m!1339959 () Bool)

(assert (=> b!1451343 m!1339959))

(assert (=> b!1451343 m!1339931))

(declare-fun m!1339961 () Bool)

(assert (=> b!1451334 m!1339961))

(declare-fun m!1339963 () Bool)

(assert (=> b!1451334 m!1339963))

(assert (=> b!1451331 m!1339931))

(assert (=> b!1451331 m!1339931))

(declare-fun m!1339965 () Bool)

(assert (=> b!1451331 m!1339965))

(assert (=> b!1451331 m!1339965))

(assert (=> b!1451331 m!1339931))

(declare-fun m!1339967 () Bool)

(assert (=> b!1451331 m!1339967))

(declare-fun m!1339969 () Bool)

(assert (=> b!1451340 m!1339969))

(assert (=> b!1451336 m!1339931))

(assert (=> b!1451336 m!1339931))

(declare-fun m!1339971 () Bool)

(assert (=> b!1451336 m!1339971))

(assert (=> b!1451345 m!1339949))

(declare-fun m!1339973 () Bool)

(assert (=> b!1451345 m!1339973))

(assert (=> b!1451345 m!1339955))

(assert (=> b!1451345 m!1339957))

(assert (=> b!1451345 m!1339931))

(assert (=> b!1451339 m!1339949))

(declare-fun m!1339975 () Bool)

(assert (=> b!1451339 m!1339975))

(declare-fun m!1339977 () Bool)

(assert (=> b!1451342 m!1339977))

(check-sat (not b!1451346) (not b!1451334) (not b!1451343) (not b!1451340) (not b!1451337) (not b!1451342) (not b!1451330) (not start!124914) (not b!1451331) (not b!1451333) (not b!1451335) (not b!1451336))
(check-sat)
