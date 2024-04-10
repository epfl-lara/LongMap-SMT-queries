; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124826 () Bool)

(assert start!124826)

(declare-fun b!1448769 () Bool)

(declare-fun e!815893 () Bool)

(declare-fun e!815891 () Bool)

(assert (=> b!1448769 (= e!815893 e!815891)))

(declare-fun res!980281 () Bool)

(assert (=> b!1448769 (=> (not res!980281) (not e!815891))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11677 0))(
  ( (MissingZero!11677 (index!49100 (_ BitVec 32))) (Found!11677 (index!49101 (_ BitVec 32))) (Intermediate!11677 (undefined!12489 Bool) (index!49102 (_ BitVec 32)) (x!130766 (_ BitVec 32))) (Undefined!11677) (MissingVacant!11677 (index!49103 (_ BitVec 32))) )
))
(declare-fun lt!635658 () SeekEntryResult!11677)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1448769 (= res!980281 (= lt!635658 (Intermediate!11677 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635652 () (_ BitVec 64))

(declare-datatypes ((array!98274 0))(
  ( (array!98275 (arr!47425 (Array (_ BitVec 32) (_ BitVec 64))) (size!47975 (_ BitVec 32))) )
))
(declare-fun lt!635653 () array!98274)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98274 (_ BitVec 32)) SeekEntryResult!11677)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448769 (= lt!635658 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635652 mask!2687) lt!635652 lt!635653 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98274)

(assert (=> b!1448769 (= lt!635652 (select (store (arr!47425 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448770 () Bool)

(declare-fun res!980290 () Bool)

(assert (=> b!1448770 (=> (not res!980290) (not e!815893))))

(declare-fun lt!635656 () SeekEntryResult!11677)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1448770 (= res!980290 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47425 a!2862) j!93) a!2862 mask!2687) lt!635656))))

(declare-fun b!1448772 () Bool)

(declare-fun res!980287 () Bool)

(assert (=> b!1448772 (=> (not res!980287) (not e!815891))))

(declare-fun e!815888 () Bool)

(assert (=> b!1448772 (= res!980287 e!815888)))

(declare-fun c!133755 () Bool)

(assert (=> b!1448772 (= c!133755 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448773 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98274 (_ BitVec 32)) SeekEntryResult!11677)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98274 (_ BitVec 32)) SeekEntryResult!11677)

(assert (=> b!1448773 (= e!815888 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635652 lt!635653 mask!2687) (seekEntryOrOpen!0 lt!635652 lt!635653 mask!2687)))))

(declare-fun b!1448774 () Bool)

(assert (=> b!1448774 (= e!815888 (= lt!635658 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635652 lt!635653 mask!2687)))))

(declare-fun b!1448775 () Bool)

(declare-fun res!980282 () Bool)

(declare-fun e!815892 () Bool)

(assert (=> b!1448775 (=> (not res!980282) (not e!815892))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1448775 (= res!980282 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47975 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47975 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47975 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448776 () Bool)

(declare-fun res!980284 () Bool)

(assert (=> b!1448776 (=> (not res!980284) (not e!815891))))

(assert (=> b!1448776 (= res!980284 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448777 () Bool)

(declare-fun e!815887 () Bool)

(assert (=> b!1448777 (= e!815887 true)))

(declare-fun lt!635657 () SeekEntryResult!11677)

(assert (=> b!1448777 (= lt!635657 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47425 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448778 () Bool)

(declare-fun res!980294 () Bool)

(assert (=> b!1448778 (=> (not res!980294) (not e!815892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448778 (= res!980294 (validKeyInArray!0 (select (arr!47425 a!2862) i!1006)))))

(declare-fun res!980280 () Bool)

(assert (=> start!124826 (=> (not res!980280) (not e!815892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124826 (= res!980280 (validMask!0 mask!2687))))

(assert (=> start!124826 e!815892))

(assert (=> start!124826 true))

(declare-fun array_inv!36453 (array!98274) Bool)

(assert (=> start!124826 (array_inv!36453 a!2862)))

(declare-fun b!1448771 () Bool)

(declare-fun res!980293 () Bool)

(assert (=> b!1448771 (=> (not res!980293) (not e!815892))))

(declare-datatypes ((List!33926 0))(
  ( (Nil!33923) (Cons!33922 (h!35272 (_ BitVec 64)) (t!48620 List!33926)) )
))
(declare-fun arrayNoDuplicates!0 (array!98274 (_ BitVec 32) List!33926) Bool)

(assert (=> b!1448771 (= res!980293 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33923))))

(declare-fun b!1448779 () Bool)

(declare-fun res!980291 () Bool)

(assert (=> b!1448779 (=> (not res!980291) (not e!815892))))

(assert (=> b!1448779 (= res!980291 (and (= (size!47975 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47975 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47975 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448780 () Bool)

(declare-fun e!815894 () Bool)

(declare-fun e!815886 () Bool)

(assert (=> b!1448780 (= e!815894 e!815886)))

(declare-fun res!980286 () Bool)

(assert (=> b!1448780 (=> (not res!980286) (not e!815886))))

(declare-fun lt!635655 () SeekEntryResult!11677)

(assert (=> b!1448780 (= res!980286 (= lt!635655 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47425 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448781 () Bool)

(declare-fun res!980295 () Bool)

(assert (=> b!1448781 (=> (not res!980295) (not e!815892))))

(assert (=> b!1448781 (= res!980295 (validKeyInArray!0 (select (arr!47425 a!2862) j!93)))))

(declare-fun b!1448782 () Bool)

(declare-fun res!980289 () Bool)

(assert (=> b!1448782 (=> (not res!980289) (not e!815892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98274 (_ BitVec 32)) Bool)

(assert (=> b!1448782 (= res!980289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448783 () Bool)

(declare-fun e!815890 () Bool)

(assert (=> b!1448783 (= e!815890 e!815894)))

(declare-fun res!980292 () Bool)

(assert (=> b!1448783 (=> res!980292 e!815894)))

(assert (=> b!1448783 (= res!980292 (or (and (= (select (arr!47425 a!2862) index!646) (select (store (arr!47425 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47425 a!2862) index!646) (select (arr!47425 a!2862) j!93))) (not (= (select (arr!47425 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448784 () Bool)

(assert (=> b!1448784 (= e!815891 (not e!815887))))

(declare-fun res!980285 () Bool)

(assert (=> b!1448784 (=> res!980285 e!815887)))

(assert (=> b!1448784 (= res!980285 (or (and (= (select (arr!47425 a!2862) index!646) (select (store (arr!47425 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47425 a!2862) index!646) (select (arr!47425 a!2862) j!93))) (not (= (select (arr!47425 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47425 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1448784 e!815890))

(declare-fun res!980283 () Bool)

(assert (=> b!1448784 (=> (not res!980283) (not e!815890))))

(assert (=> b!1448784 (= res!980283 (and (= lt!635655 (Found!11677 j!93)) (or (= (select (arr!47425 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47425 a!2862) intermediateBeforeIndex!19) (select (arr!47425 a!2862) j!93)))))))

(assert (=> b!1448784 (= lt!635655 (seekEntryOrOpen!0 (select (arr!47425 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1448784 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48850 0))(
  ( (Unit!48851) )
))
(declare-fun lt!635654 () Unit!48850)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98274 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48850)

(assert (=> b!1448784 (= lt!635654 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448785 () Bool)

(declare-fun e!815889 () Bool)

(assert (=> b!1448785 (= e!815889 e!815893)))

(declare-fun res!980288 () Bool)

(assert (=> b!1448785 (=> (not res!980288) (not e!815893))))

(assert (=> b!1448785 (= res!980288 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47425 a!2862) j!93) mask!2687) (select (arr!47425 a!2862) j!93) a!2862 mask!2687) lt!635656))))

(assert (=> b!1448785 (= lt!635656 (Intermediate!11677 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448786 () Bool)

(assert (=> b!1448786 (= e!815886 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1448787 () Bool)

(assert (=> b!1448787 (= e!815892 e!815889)))

(declare-fun res!980296 () Bool)

(assert (=> b!1448787 (=> (not res!980296) (not e!815889))))

(assert (=> b!1448787 (= res!980296 (= (select (store (arr!47425 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448787 (= lt!635653 (array!98275 (store (arr!47425 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47975 a!2862)))))

(assert (= (and start!124826 res!980280) b!1448779))

(assert (= (and b!1448779 res!980291) b!1448778))

(assert (= (and b!1448778 res!980294) b!1448781))

(assert (= (and b!1448781 res!980295) b!1448782))

(assert (= (and b!1448782 res!980289) b!1448771))

(assert (= (and b!1448771 res!980293) b!1448775))

(assert (= (and b!1448775 res!980282) b!1448787))

(assert (= (and b!1448787 res!980296) b!1448785))

(assert (= (and b!1448785 res!980288) b!1448770))

(assert (= (and b!1448770 res!980290) b!1448769))

(assert (= (and b!1448769 res!980281) b!1448772))

(assert (= (and b!1448772 c!133755) b!1448774))

(assert (= (and b!1448772 (not c!133755)) b!1448773))

(assert (= (and b!1448772 res!980287) b!1448776))

(assert (= (and b!1448776 res!980284) b!1448784))

(assert (= (and b!1448784 res!980283) b!1448783))

(assert (= (and b!1448783 (not res!980292)) b!1448780))

(assert (= (and b!1448780 res!980286) b!1448786))

(assert (= (and b!1448784 (not res!980285)) b!1448777))

(declare-fun m!1337515 () Bool)

(assert (=> b!1448773 m!1337515))

(declare-fun m!1337517 () Bool)

(assert (=> b!1448773 m!1337517))

(declare-fun m!1337519 () Bool)

(assert (=> b!1448777 m!1337519))

(assert (=> b!1448777 m!1337519))

(declare-fun m!1337521 () Bool)

(assert (=> b!1448777 m!1337521))

(declare-fun m!1337523 () Bool)

(assert (=> b!1448782 m!1337523))

(declare-fun m!1337525 () Bool)

(assert (=> b!1448771 m!1337525))

(assert (=> b!1448781 m!1337519))

(assert (=> b!1448781 m!1337519))

(declare-fun m!1337527 () Bool)

(assert (=> b!1448781 m!1337527))

(assert (=> b!1448770 m!1337519))

(assert (=> b!1448770 m!1337519))

(declare-fun m!1337529 () Bool)

(assert (=> b!1448770 m!1337529))

(declare-fun m!1337531 () Bool)

(assert (=> b!1448774 m!1337531))

(declare-fun m!1337533 () Bool)

(assert (=> b!1448778 m!1337533))

(assert (=> b!1448778 m!1337533))

(declare-fun m!1337535 () Bool)

(assert (=> b!1448778 m!1337535))

(declare-fun m!1337537 () Bool)

(assert (=> b!1448769 m!1337537))

(assert (=> b!1448769 m!1337537))

(declare-fun m!1337539 () Bool)

(assert (=> b!1448769 m!1337539))

(declare-fun m!1337541 () Bool)

(assert (=> b!1448769 m!1337541))

(declare-fun m!1337543 () Bool)

(assert (=> b!1448769 m!1337543))

(declare-fun m!1337545 () Bool)

(assert (=> b!1448784 m!1337545))

(assert (=> b!1448784 m!1337541))

(declare-fun m!1337547 () Bool)

(assert (=> b!1448784 m!1337547))

(declare-fun m!1337549 () Bool)

(assert (=> b!1448784 m!1337549))

(declare-fun m!1337551 () Bool)

(assert (=> b!1448784 m!1337551))

(assert (=> b!1448784 m!1337519))

(declare-fun m!1337553 () Bool)

(assert (=> b!1448784 m!1337553))

(declare-fun m!1337555 () Bool)

(assert (=> b!1448784 m!1337555))

(assert (=> b!1448784 m!1337519))

(assert (=> b!1448787 m!1337541))

(declare-fun m!1337557 () Bool)

(assert (=> b!1448787 m!1337557))

(assert (=> b!1448780 m!1337519))

(assert (=> b!1448780 m!1337519))

(declare-fun m!1337559 () Bool)

(assert (=> b!1448780 m!1337559))

(assert (=> b!1448783 m!1337551))

(assert (=> b!1448783 m!1337541))

(assert (=> b!1448783 m!1337549))

(assert (=> b!1448783 m!1337519))

(declare-fun m!1337561 () Bool)

(assert (=> start!124826 m!1337561))

(declare-fun m!1337563 () Bool)

(assert (=> start!124826 m!1337563))

(assert (=> b!1448785 m!1337519))

(assert (=> b!1448785 m!1337519))

(declare-fun m!1337565 () Bool)

(assert (=> b!1448785 m!1337565))

(assert (=> b!1448785 m!1337565))

(assert (=> b!1448785 m!1337519))

(declare-fun m!1337567 () Bool)

(assert (=> b!1448785 m!1337567))

(push 1)

