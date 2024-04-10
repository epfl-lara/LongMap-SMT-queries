; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124862 () Bool)

(assert start!124862)

(declare-fun b!1449803 () Bool)

(declare-fun res!981222 () Bool)

(declare-fun e!816432 () Bool)

(assert (=> b!1449803 (=> (not res!981222) (not e!816432))))

(declare-fun e!816429 () Bool)

(assert (=> b!1449803 (= res!981222 e!816429)))

(declare-fun c!133809 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1449803 (= c!133809 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449804 () Bool)

(declare-fun res!981213 () Bool)

(declare-fun e!816425 () Bool)

(assert (=> b!1449804 (=> (not res!981213) (not e!816425))))

(declare-datatypes ((array!98310 0))(
  ( (array!98311 (arr!47443 (Array (_ BitVec 32) (_ BitVec 64))) (size!47993 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98310)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98310 (_ BitVec 32)) Bool)

(assert (=> b!1449804 (= res!981213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1449805 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!816433 () Bool)

(assert (=> b!1449805 (= e!816433 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1449806 () Bool)

(declare-fun e!816434 () Bool)

(declare-fun e!816428 () Bool)

(assert (=> b!1449806 (= e!816434 e!816428)))

(declare-fun res!981215 () Bool)

(assert (=> b!1449806 (=> res!981215 e!816428)))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1449806 (= res!981215 (or (and (= (select (arr!47443 a!2862) index!646) (select (store (arr!47443 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47443 a!2862) index!646) (select (arr!47443 a!2862) j!93))) (not (= (select (arr!47443 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449807 () Bool)

(declare-fun e!816427 () Bool)

(assert (=> b!1449807 (= e!816432 (not e!816427))))

(declare-fun res!981206 () Bool)

(assert (=> b!1449807 (=> res!981206 e!816427)))

(assert (=> b!1449807 (= res!981206 (or (and (= (select (arr!47443 a!2862) index!646) (select (store (arr!47443 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47443 a!2862) index!646) (select (arr!47443 a!2862) j!93))) (not (= (select (arr!47443 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47443 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1449807 e!816434))

(declare-fun res!981221 () Bool)

(assert (=> b!1449807 (=> (not res!981221) (not e!816434))))

(declare-datatypes ((SeekEntryResult!11695 0))(
  ( (MissingZero!11695 (index!49172 (_ BitVec 32))) (Found!11695 (index!49173 (_ BitVec 32))) (Intermediate!11695 (undefined!12507 Bool) (index!49174 (_ BitVec 32)) (x!130832 (_ BitVec 32))) (Undefined!11695) (MissingVacant!11695 (index!49175 (_ BitVec 32))) )
))
(declare-fun lt!636039 () SeekEntryResult!11695)

(declare-fun lt!636045 () SeekEntryResult!11695)

(assert (=> b!1449807 (= res!981221 (and (= lt!636039 lt!636045) (or (= (select (arr!47443 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47443 a!2862) intermediateBeforeIndex!19) (select (arr!47443 a!2862) j!93)))))))

(assert (=> b!1449807 (= lt!636045 (Found!11695 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98310 (_ BitVec 32)) SeekEntryResult!11695)

(assert (=> b!1449807 (= lt!636039 (seekEntryOrOpen!0 (select (arr!47443 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1449807 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48886 0))(
  ( (Unit!48887) )
))
(declare-fun lt!636044 () Unit!48886)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98310 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48886)

(assert (=> b!1449807 (= lt!636044 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449808 () Bool)

(declare-fun res!981211 () Bool)

(assert (=> b!1449808 (=> (not res!981211) (not e!816425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449808 (= res!981211 (validKeyInArray!0 (select (arr!47443 a!2862) i!1006)))))

(declare-fun b!1449809 () Bool)

(declare-fun res!981223 () Bool)

(assert (=> b!1449809 (=> (not res!981223) (not e!816425))))

(assert (=> b!1449809 (= res!981223 (and (= (size!47993 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47993 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47993 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!981207 () Bool)

(assert (=> start!124862 (=> (not res!981207) (not e!816425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124862 (= res!981207 (validMask!0 mask!2687))))

(assert (=> start!124862 e!816425))

(assert (=> start!124862 true))

(declare-fun array_inv!36471 (array!98310) Bool)

(assert (=> start!124862 (array_inv!36471 a!2862)))

(declare-fun b!1449810 () Bool)

(declare-fun e!816426 () Bool)

(assert (=> b!1449810 (= e!816425 e!816426)))

(declare-fun res!981217 () Bool)

(assert (=> b!1449810 (=> (not res!981217) (not e!816426))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1449810 (= res!981217 (= (select (store (arr!47443 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!636040 () array!98310)

(assert (=> b!1449810 (= lt!636040 (array!98311 (store (arr!47443 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47993 a!2862)))))

(declare-fun b!1449811 () Bool)

(assert (=> b!1449811 (= e!816427 true)))

(declare-fun lt!636038 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98310 (_ BitVec 32)) SeekEntryResult!11695)

(assert (=> b!1449811 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636038 lt!636040 mask!2687) lt!636045)))

(declare-fun lt!636042 () Unit!48886)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98310 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48886)

(assert (=> b!1449811 (= lt!636042 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1449812 () Bool)

(declare-fun res!981219 () Bool)

(assert (=> b!1449812 (=> (not res!981219) (not e!816425))))

(assert (=> b!1449812 (= res!981219 (validKeyInArray!0 (select (arr!47443 a!2862) j!93)))))

(declare-fun b!1449813 () Bool)

(declare-fun res!981218 () Bool)

(assert (=> b!1449813 (=> (not res!981218) (not e!816432))))

(assert (=> b!1449813 (= res!981218 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449814 () Bool)

(declare-fun res!981210 () Bool)

(declare-fun e!816431 () Bool)

(assert (=> b!1449814 (=> (not res!981210) (not e!816431))))

(declare-fun lt!636041 () SeekEntryResult!11695)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98310 (_ BitVec 32)) SeekEntryResult!11695)

(assert (=> b!1449814 (= res!981210 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47443 a!2862) j!93) a!2862 mask!2687) lt!636041))))

(declare-fun b!1449815 () Bool)

(assert (=> b!1449815 (= e!816429 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636038 lt!636040 mask!2687) (seekEntryOrOpen!0 lt!636038 lt!636040 mask!2687)))))

(declare-fun b!1449816 () Bool)

(declare-fun res!981212 () Bool)

(assert (=> b!1449816 (=> (not res!981212) (not e!816425))))

(assert (=> b!1449816 (= res!981212 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47993 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47993 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47993 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449817 () Bool)

(assert (=> b!1449817 (= e!816428 e!816433)))

(declare-fun res!981209 () Bool)

(assert (=> b!1449817 (=> (not res!981209) (not e!816433))))

(assert (=> b!1449817 (= res!981209 (= lt!636039 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47443 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449818 () Bool)

(declare-fun lt!636043 () SeekEntryResult!11695)

(assert (=> b!1449818 (= e!816429 (= lt!636043 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636038 lt!636040 mask!2687)))))

(declare-fun b!1449819 () Bool)

(declare-fun res!981214 () Bool)

(assert (=> b!1449819 (=> res!981214 e!816427)))

(assert (=> b!1449819 (= res!981214 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47443 a!2862) j!93) a!2862 mask!2687) lt!636045)))))

(declare-fun b!1449820 () Bool)

(assert (=> b!1449820 (= e!816426 e!816431)))

(declare-fun res!981208 () Bool)

(assert (=> b!1449820 (=> (not res!981208) (not e!816431))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449820 (= res!981208 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47443 a!2862) j!93) mask!2687) (select (arr!47443 a!2862) j!93) a!2862 mask!2687) lt!636041))))

(assert (=> b!1449820 (= lt!636041 (Intermediate!11695 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449821 () Bool)

(declare-fun res!981216 () Bool)

(assert (=> b!1449821 (=> (not res!981216) (not e!816425))))

(declare-datatypes ((List!33944 0))(
  ( (Nil!33941) (Cons!33940 (h!35290 (_ BitVec 64)) (t!48638 List!33944)) )
))
(declare-fun arrayNoDuplicates!0 (array!98310 (_ BitVec 32) List!33944) Bool)

(assert (=> b!1449821 (= res!981216 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33941))))

(declare-fun b!1449822 () Bool)

(assert (=> b!1449822 (= e!816431 e!816432)))

(declare-fun res!981220 () Bool)

(assert (=> b!1449822 (=> (not res!981220) (not e!816432))))

(assert (=> b!1449822 (= res!981220 (= lt!636043 (Intermediate!11695 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1449822 (= lt!636043 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636038 mask!2687) lt!636038 lt!636040 mask!2687))))

(assert (=> b!1449822 (= lt!636038 (select (store (arr!47443 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!124862 res!981207) b!1449809))

(assert (= (and b!1449809 res!981223) b!1449808))

(assert (= (and b!1449808 res!981211) b!1449812))

(assert (= (and b!1449812 res!981219) b!1449804))

(assert (= (and b!1449804 res!981213) b!1449821))

(assert (= (and b!1449821 res!981216) b!1449816))

(assert (= (and b!1449816 res!981212) b!1449810))

(assert (= (and b!1449810 res!981217) b!1449820))

(assert (= (and b!1449820 res!981208) b!1449814))

(assert (= (and b!1449814 res!981210) b!1449822))

(assert (= (and b!1449822 res!981220) b!1449803))

(assert (= (and b!1449803 c!133809) b!1449818))

(assert (= (and b!1449803 (not c!133809)) b!1449815))

(assert (= (and b!1449803 res!981222) b!1449813))

(assert (= (and b!1449813 res!981218) b!1449807))

(assert (= (and b!1449807 res!981221) b!1449806))

(assert (= (and b!1449806 (not res!981215)) b!1449817))

(assert (= (and b!1449817 res!981209) b!1449805))

(assert (= (and b!1449807 (not res!981206)) b!1449819))

(assert (= (and b!1449819 (not res!981214)) b!1449811))

(declare-fun m!1338491 () Bool)

(assert (=> b!1449819 m!1338491))

(assert (=> b!1449819 m!1338491))

(declare-fun m!1338493 () Bool)

(assert (=> b!1449819 m!1338493))

(declare-fun m!1338495 () Bool)

(assert (=> b!1449804 m!1338495))

(assert (=> b!1449817 m!1338491))

(assert (=> b!1449817 m!1338491))

(declare-fun m!1338497 () Bool)

(assert (=> b!1449817 m!1338497))

(declare-fun m!1338499 () Bool)

(assert (=> b!1449810 m!1338499))

(declare-fun m!1338501 () Bool)

(assert (=> b!1449810 m!1338501))

(declare-fun m!1338503 () Bool)

(assert (=> b!1449815 m!1338503))

(declare-fun m!1338505 () Bool)

(assert (=> b!1449815 m!1338505))

(declare-fun m!1338507 () Bool)

(assert (=> b!1449822 m!1338507))

(assert (=> b!1449822 m!1338507))

(declare-fun m!1338509 () Bool)

(assert (=> b!1449822 m!1338509))

(assert (=> b!1449822 m!1338499))

(declare-fun m!1338511 () Bool)

(assert (=> b!1449822 m!1338511))

(assert (=> b!1449814 m!1338491))

(assert (=> b!1449814 m!1338491))

(declare-fun m!1338513 () Bool)

(assert (=> b!1449814 m!1338513))

(declare-fun m!1338515 () Bool)

(assert (=> b!1449808 m!1338515))

(assert (=> b!1449808 m!1338515))

(declare-fun m!1338517 () Bool)

(assert (=> b!1449808 m!1338517))

(assert (=> b!1449820 m!1338491))

(assert (=> b!1449820 m!1338491))

(declare-fun m!1338519 () Bool)

(assert (=> b!1449820 m!1338519))

(assert (=> b!1449820 m!1338519))

(assert (=> b!1449820 m!1338491))

(declare-fun m!1338521 () Bool)

(assert (=> b!1449820 m!1338521))

(declare-fun m!1338523 () Bool)

(assert (=> b!1449807 m!1338523))

(assert (=> b!1449807 m!1338499))

(declare-fun m!1338525 () Bool)

(assert (=> b!1449807 m!1338525))

(declare-fun m!1338527 () Bool)

(assert (=> b!1449807 m!1338527))

(declare-fun m!1338529 () Bool)

(assert (=> b!1449807 m!1338529))

(assert (=> b!1449807 m!1338491))

(declare-fun m!1338531 () Bool)

(assert (=> b!1449807 m!1338531))

(declare-fun m!1338533 () Bool)

(assert (=> b!1449807 m!1338533))

(assert (=> b!1449807 m!1338491))

(assert (=> b!1449811 m!1338503))

(declare-fun m!1338535 () Bool)

(assert (=> b!1449811 m!1338535))

(assert (=> b!1449806 m!1338529))

(assert (=> b!1449806 m!1338499))

(assert (=> b!1449806 m!1338527))

(assert (=> b!1449806 m!1338491))

(declare-fun m!1338537 () Bool)

(assert (=> b!1449818 m!1338537))

(assert (=> b!1449812 m!1338491))

(assert (=> b!1449812 m!1338491))

(declare-fun m!1338539 () Bool)

(assert (=> b!1449812 m!1338539))

(declare-fun m!1338541 () Bool)

(assert (=> start!124862 m!1338541))

(declare-fun m!1338543 () Bool)

(assert (=> start!124862 m!1338543))

(declare-fun m!1338545 () Bool)

(assert (=> b!1449821 m!1338545))

(push 1)

