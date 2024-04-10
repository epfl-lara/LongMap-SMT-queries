; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124930 () Bool)

(assert start!124930)

(declare-fun res!982950 () Bool)

(declare-fun e!817354 () Bool)

(assert (=> start!124930 (=> (not res!982950) (not e!817354))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124930 (= res!982950 (validMask!0 mask!2687))))

(assert (=> start!124930 e!817354))

(assert (=> start!124930 true))

(declare-datatypes ((array!98378 0))(
  ( (array!98379 (arr!47477 (Array (_ BitVec 32) (_ BitVec 64))) (size!48027 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98378)

(declare-fun array_inv!36505 (array!98378) Bool)

(assert (=> start!124930 (array_inv!36505 a!2862)))

(declare-fun b!1451747 () Bool)

(declare-fun e!817352 () Bool)

(assert (=> b!1451747 (= e!817352 (not true))))

(declare-fun e!817349 () Bool)

(assert (=> b!1451747 e!817349))

(declare-fun res!982955 () Bool)

(assert (=> b!1451747 (=> (not res!982955) (not e!817349))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98378 (_ BitVec 32)) Bool)

(assert (=> b!1451747 (= res!982955 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48954 0))(
  ( (Unit!48955) )
))
(declare-fun lt!636742 () Unit!48954)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98378 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48954)

(assert (=> b!1451747 (= lt!636742 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451748 () Bool)

(declare-fun e!817351 () Bool)

(assert (=> b!1451748 (= e!817351 e!817352)))

(declare-fun res!982949 () Bool)

(assert (=> b!1451748 (=> (not res!982949) (not e!817352))))

(declare-datatypes ((SeekEntryResult!11729 0))(
  ( (MissingZero!11729 (index!49308 (_ BitVec 32))) (Found!11729 (index!49309 (_ BitVec 32))) (Intermediate!11729 (undefined!12541 Bool) (index!49310 (_ BitVec 32)) (x!130962 (_ BitVec 32))) (Undefined!11729) (MissingVacant!11729 (index!49311 (_ BitVec 32))) )
))
(declare-fun lt!636744 () SeekEntryResult!11729)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1451748 (= res!982949 (= lt!636744 (Intermediate!11729 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!636740 () (_ BitVec 64))

(declare-fun lt!636743 () array!98378)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98378 (_ BitVec 32)) SeekEntryResult!11729)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451748 (= lt!636744 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636740 mask!2687) lt!636740 lt!636743 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1451748 (= lt!636740 (select (store (arr!47477 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451749 () Bool)

(declare-fun res!982951 () Bool)

(assert (=> b!1451749 (=> (not res!982951) (not e!817351))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!636741 () SeekEntryResult!11729)

(assert (=> b!1451749 (= res!982951 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47477 a!2862) j!93) a!2862 mask!2687) lt!636741))))

(declare-fun e!817355 () Bool)

(declare-fun b!1451750 () Bool)

(assert (=> b!1451750 (= e!817355 (= lt!636744 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636740 lt!636743 mask!2687)))))

(declare-fun b!1451751 () Bool)

(declare-fun e!817350 () Bool)

(assert (=> b!1451751 (= e!817350 e!817351)))

(declare-fun res!982946 () Bool)

(assert (=> b!1451751 (=> (not res!982946) (not e!817351))))

(assert (=> b!1451751 (= res!982946 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47477 a!2862) j!93) mask!2687) (select (arr!47477 a!2862) j!93) a!2862 mask!2687) lt!636741))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1451751 (= lt!636741 (Intermediate!11729 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451752 () Bool)

(declare-fun res!982952 () Bool)

(assert (=> b!1451752 (=> (not res!982952) (not e!817354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451752 (= res!982952 (validKeyInArray!0 (select (arr!47477 a!2862) i!1006)))))

(declare-fun b!1451753 () Bool)

(assert (=> b!1451753 (= e!817349 (and (or (= (select (arr!47477 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47477 a!2862) intermediateBeforeIndex!19) (select (arr!47477 a!2862) j!93))) (or (and (= (select (arr!47477 a!2862) index!646) (select (store (arr!47477 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47477 a!2862) index!646) (select (arr!47477 a!2862) j!93))) (= (select (arr!47477 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47477 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1451754 () Bool)

(declare-fun res!982956 () Bool)

(assert (=> b!1451754 (=> (not res!982956) (not e!817354))))

(assert (=> b!1451754 (= res!982956 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48027 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48027 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48027 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451755 () Bool)

(declare-fun res!982947 () Bool)

(assert (=> b!1451755 (=> (not res!982947) (not e!817352))))

(assert (=> b!1451755 (= res!982947 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1451756 () Bool)

(assert (=> b!1451756 (= e!817354 e!817350)))

(declare-fun res!982958 () Bool)

(assert (=> b!1451756 (=> (not res!982958) (not e!817350))))

(assert (=> b!1451756 (= res!982958 (= (select (store (arr!47477 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451756 (= lt!636743 (array!98379 (store (arr!47477 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48027 a!2862)))))

(declare-fun b!1451757 () Bool)

(declare-fun res!982957 () Bool)

(assert (=> b!1451757 (=> (not res!982957) (not e!817354))))

(declare-datatypes ((List!33978 0))(
  ( (Nil!33975) (Cons!33974 (h!35324 (_ BitVec 64)) (t!48672 List!33978)) )
))
(declare-fun arrayNoDuplicates!0 (array!98378 (_ BitVec 32) List!33978) Bool)

(assert (=> b!1451757 (= res!982957 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33975))))

(declare-fun b!1451758 () Bool)

(declare-fun res!982948 () Bool)

(assert (=> b!1451758 (=> (not res!982948) (not e!817354))))

(assert (=> b!1451758 (= res!982948 (and (= (size!48027 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48027 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48027 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451759 () Bool)

(declare-fun res!982953 () Bool)

(assert (=> b!1451759 (=> (not res!982953) (not e!817354))))

(assert (=> b!1451759 (= res!982953 (validKeyInArray!0 (select (arr!47477 a!2862) j!93)))))

(declare-fun b!1451760 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98378 (_ BitVec 32)) SeekEntryResult!11729)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98378 (_ BitVec 32)) SeekEntryResult!11729)

(assert (=> b!1451760 (= e!817355 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636740 lt!636743 mask!2687) (seekEntryOrOpen!0 lt!636740 lt!636743 mask!2687)))))

(declare-fun b!1451761 () Bool)

(declare-fun res!982959 () Bool)

(assert (=> b!1451761 (=> (not res!982959) (not e!817352))))

(assert (=> b!1451761 (= res!982959 e!817355)))

(declare-fun c!133911 () Bool)

(assert (=> b!1451761 (= c!133911 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451762 () Bool)

(declare-fun res!982954 () Bool)

(assert (=> b!1451762 (=> (not res!982954) (not e!817354))))

(assert (=> b!1451762 (= res!982954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451763 () Bool)

(declare-fun res!982960 () Bool)

(assert (=> b!1451763 (=> (not res!982960) (not e!817349))))

(assert (=> b!1451763 (= res!982960 (= (seekEntryOrOpen!0 (select (arr!47477 a!2862) j!93) a!2862 mask!2687) (Found!11729 j!93)))))

(assert (= (and start!124930 res!982950) b!1451758))

(assert (= (and b!1451758 res!982948) b!1451752))

(assert (= (and b!1451752 res!982952) b!1451759))

(assert (= (and b!1451759 res!982953) b!1451762))

(assert (= (and b!1451762 res!982954) b!1451757))

(assert (= (and b!1451757 res!982957) b!1451754))

(assert (= (and b!1451754 res!982956) b!1451756))

(assert (= (and b!1451756 res!982958) b!1451751))

(assert (= (and b!1451751 res!982946) b!1451749))

(assert (= (and b!1451749 res!982951) b!1451748))

(assert (= (and b!1451748 res!982949) b!1451761))

(assert (= (and b!1451761 c!133911) b!1451750))

(assert (= (and b!1451761 (not c!133911)) b!1451760))

(assert (= (and b!1451761 res!982959) b!1451755))

(assert (= (and b!1451755 res!982947) b!1451747))

(assert (= (and b!1451747 res!982955) b!1451763))

(assert (= (and b!1451763 res!982960) b!1451753))

(declare-fun m!1340335 () Bool)

(assert (=> b!1451750 m!1340335))

(declare-fun m!1340337 () Bool)

(assert (=> b!1451749 m!1340337))

(assert (=> b!1451749 m!1340337))

(declare-fun m!1340339 () Bool)

(assert (=> b!1451749 m!1340339))

(declare-fun m!1340341 () Bool)

(assert (=> b!1451752 m!1340341))

(assert (=> b!1451752 m!1340341))

(declare-fun m!1340343 () Bool)

(assert (=> b!1451752 m!1340343))

(declare-fun m!1340345 () Bool)

(assert (=> b!1451757 m!1340345))

(declare-fun m!1340347 () Bool)

(assert (=> b!1451756 m!1340347))

(declare-fun m!1340349 () Bool)

(assert (=> b!1451756 m!1340349))

(assert (=> b!1451751 m!1340337))

(assert (=> b!1451751 m!1340337))

(declare-fun m!1340351 () Bool)

(assert (=> b!1451751 m!1340351))

(assert (=> b!1451751 m!1340351))

(assert (=> b!1451751 m!1340337))

(declare-fun m!1340353 () Bool)

(assert (=> b!1451751 m!1340353))

(assert (=> b!1451763 m!1340337))

(assert (=> b!1451763 m!1340337))

(declare-fun m!1340355 () Bool)

(assert (=> b!1451763 m!1340355))

(declare-fun m!1340357 () Bool)

(assert (=> b!1451747 m!1340357))

(declare-fun m!1340359 () Bool)

(assert (=> b!1451747 m!1340359))

(assert (=> b!1451753 m!1340347))

(declare-fun m!1340361 () Bool)

(assert (=> b!1451753 m!1340361))

(declare-fun m!1340363 () Bool)

(assert (=> b!1451753 m!1340363))

(declare-fun m!1340365 () Bool)

(assert (=> b!1451753 m!1340365))

(assert (=> b!1451753 m!1340337))

(declare-fun m!1340367 () Bool)

(assert (=> b!1451748 m!1340367))

(assert (=> b!1451748 m!1340367))

(declare-fun m!1340369 () Bool)

(assert (=> b!1451748 m!1340369))

(assert (=> b!1451748 m!1340347))

(declare-fun m!1340371 () Bool)

(assert (=> b!1451748 m!1340371))

(declare-fun m!1340373 () Bool)

(assert (=> b!1451762 m!1340373))

(declare-fun m!1340375 () Bool)

(assert (=> b!1451760 m!1340375))

(declare-fun m!1340377 () Bool)

(assert (=> b!1451760 m!1340377))

(assert (=> b!1451759 m!1340337))

(assert (=> b!1451759 m!1340337))

(declare-fun m!1340379 () Bool)

(assert (=> b!1451759 m!1340379))

(declare-fun m!1340381 () Bool)

(assert (=> start!124930 m!1340381))

(declare-fun m!1340383 () Bool)

(assert (=> start!124930 m!1340383))

(push 1)

