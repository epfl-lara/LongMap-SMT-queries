; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125810 () Bool)

(assert start!125810)

(declare-fun b!1472825 () Bool)

(declare-fun e!826511 () Bool)

(declare-fun e!826514 () Bool)

(assert (=> b!1472825 (= e!826511 e!826514)))

(declare-fun res!1000456 () Bool)

(assert (=> b!1472825 (=> (not res!1000456) (not e!826514))))

(declare-datatypes ((SeekEntryResult!12097 0))(
  ( (MissingZero!12097 (index!50780 (_ BitVec 32))) (Found!12097 (index!50781 (_ BitVec 32))) (Intermediate!12097 (undefined!12909 Bool) (index!50782 (_ BitVec 32)) (x!132356 (_ BitVec 32))) (Undefined!12097) (MissingVacant!12097 (index!50783 (_ BitVec 32))) )
))
(declare-fun lt!643686 () SeekEntryResult!12097)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1472825 (= res!1000456 (= lt!643686 (Intermediate!12097 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!643685 () (_ BitVec 64))

(declare-datatypes ((array!99144 0))(
  ( (array!99145 (arr!47857 (Array (_ BitVec 32) (_ BitVec 64))) (size!48407 (_ BitVec 32))) )
))
(declare-fun lt!643688 () array!99144)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99144 (_ BitVec 32)) SeekEntryResult!12097)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472825 (= lt!643686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643685 mask!2687) lt!643685 lt!643688 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99144)

(assert (=> b!1472825 (= lt!643685 (select (store (arr!47857 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472826 () Bool)

(declare-fun e!826509 () Bool)

(declare-fun e!826512 () Bool)

(assert (=> b!1472826 (= e!826509 e!826512)))

(declare-fun res!1000455 () Bool)

(assert (=> b!1472826 (=> (not res!1000455) (not e!826512))))

(assert (=> b!1472826 (= res!1000455 (= (select (store (arr!47857 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472826 (= lt!643688 (array!99145 (store (arr!47857 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48407 a!2862)))))

(declare-fun b!1472827 () Bool)

(declare-fun res!1000450 () Bool)

(declare-fun e!826513 () Bool)

(assert (=> b!1472827 (=> (not res!1000450) (not e!826513))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99144 (_ BitVec 32)) SeekEntryResult!12097)

(assert (=> b!1472827 (= res!1000450 (= (seekEntryOrOpen!0 (select (arr!47857 a!2862) j!93) a!2862 mask!2687) (Found!12097 j!93)))))

(declare-fun b!1472828 () Bool)

(declare-fun res!1000453 () Bool)

(assert (=> b!1472828 (=> (not res!1000453) (not e!826511))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!643687 () SeekEntryResult!12097)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1472828 (= res!1000453 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47857 a!2862) j!93) a!2862 mask!2687) lt!643687))))

(declare-fun b!1472829 () Bool)

(declare-fun res!1000443 () Bool)

(assert (=> b!1472829 (=> (not res!1000443) (not e!826514))))

(declare-fun e!826508 () Bool)

(assert (=> b!1472829 (= res!1000443 e!826508)))

(declare-fun c!135705 () Bool)

(assert (=> b!1472829 (= c!135705 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472830 () Bool)

(declare-fun res!1000454 () Bool)

(assert (=> b!1472830 (=> (not res!1000454) (not e!826509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99144 (_ BitVec 32)) Bool)

(assert (=> b!1472830 (= res!1000454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472831 () Bool)

(assert (=> b!1472831 (= e!826508 (= lt!643686 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643685 lt!643688 mask!2687)))))

(declare-fun res!1000444 () Bool)

(assert (=> start!125810 (=> (not res!1000444) (not e!826509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125810 (= res!1000444 (validMask!0 mask!2687))))

(assert (=> start!125810 e!826509))

(assert (=> start!125810 true))

(declare-fun array_inv!36885 (array!99144) Bool)

(assert (=> start!125810 (array_inv!36885 a!2862)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1472832 () Bool)

(assert (=> b!1472832 (= e!826513 (or (= (select (arr!47857 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47857 a!2862) intermediateBeforeIndex!19) (select (arr!47857 a!2862) j!93))))))

(declare-fun b!1472833 () Bool)

(assert (=> b!1472833 (= e!826512 e!826511)))

(declare-fun res!1000448 () Bool)

(assert (=> b!1472833 (=> (not res!1000448) (not e!826511))))

(assert (=> b!1472833 (= res!1000448 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47857 a!2862) j!93) mask!2687) (select (arr!47857 a!2862) j!93) a!2862 mask!2687) lt!643687))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1472833 (= lt!643687 (Intermediate!12097 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472834 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99144 (_ BitVec 32)) SeekEntryResult!12097)

(assert (=> b!1472834 (= e!826508 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643685 lt!643688 mask!2687) (seekEntryOrOpen!0 lt!643685 lt!643688 mask!2687)))))

(declare-fun b!1472835 () Bool)

(declare-fun res!1000442 () Bool)

(assert (=> b!1472835 (=> (not res!1000442) (not e!826509))))

(assert (=> b!1472835 (= res!1000442 (and (= (size!48407 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48407 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48407 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472836 () Bool)

(assert (=> b!1472836 (= e!826514 (not true))))

(assert (=> b!1472836 e!826513))

(declare-fun res!1000451 () Bool)

(assert (=> b!1472836 (=> (not res!1000451) (not e!826513))))

(assert (=> b!1472836 (= res!1000451 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49534 0))(
  ( (Unit!49535) )
))
(declare-fun lt!643689 () Unit!49534)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99144 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49534)

(assert (=> b!1472836 (= lt!643689 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472837 () Bool)

(declare-fun res!1000449 () Bool)

(assert (=> b!1472837 (=> (not res!1000449) (not e!826509))))

(assert (=> b!1472837 (= res!1000449 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48407 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48407 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48407 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1472838 () Bool)

(declare-fun res!1000447 () Bool)

(assert (=> b!1472838 (=> (not res!1000447) (not e!826509))))

(declare-datatypes ((List!34358 0))(
  ( (Nil!34355) (Cons!34354 (h!35710 (_ BitVec 64)) (t!49052 List!34358)) )
))
(declare-fun arrayNoDuplicates!0 (array!99144 (_ BitVec 32) List!34358) Bool)

(assert (=> b!1472838 (= res!1000447 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34355))))

(declare-fun b!1472839 () Bool)

(declare-fun res!1000445 () Bool)

(assert (=> b!1472839 (=> (not res!1000445) (not e!826514))))

(assert (=> b!1472839 (= res!1000445 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472840 () Bool)

(declare-fun res!1000452 () Bool)

(assert (=> b!1472840 (=> (not res!1000452) (not e!826509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472840 (= res!1000452 (validKeyInArray!0 (select (arr!47857 a!2862) j!93)))))

(declare-fun b!1472841 () Bool)

(declare-fun res!1000446 () Bool)

(assert (=> b!1472841 (=> (not res!1000446) (not e!826509))))

(assert (=> b!1472841 (= res!1000446 (validKeyInArray!0 (select (arr!47857 a!2862) i!1006)))))

(assert (= (and start!125810 res!1000444) b!1472835))

(assert (= (and b!1472835 res!1000442) b!1472841))

(assert (= (and b!1472841 res!1000446) b!1472840))

(assert (= (and b!1472840 res!1000452) b!1472830))

(assert (= (and b!1472830 res!1000454) b!1472838))

(assert (= (and b!1472838 res!1000447) b!1472837))

(assert (= (and b!1472837 res!1000449) b!1472826))

(assert (= (and b!1472826 res!1000455) b!1472833))

(assert (= (and b!1472833 res!1000448) b!1472828))

(assert (= (and b!1472828 res!1000453) b!1472825))

(assert (= (and b!1472825 res!1000456) b!1472829))

(assert (= (and b!1472829 c!135705) b!1472831))

(assert (= (and b!1472829 (not c!135705)) b!1472834))

(assert (= (and b!1472829 res!1000443) b!1472839))

(assert (= (and b!1472839 res!1000445) b!1472836))

(assert (= (and b!1472836 res!1000451) b!1472827))

(assert (= (and b!1472827 res!1000450) b!1472832))

(declare-fun m!1359501 () Bool)

(assert (=> b!1472828 m!1359501))

(assert (=> b!1472828 m!1359501))

(declare-fun m!1359503 () Bool)

(assert (=> b!1472828 m!1359503))

(declare-fun m!1359505 () Bool)

(assert (=> b!1472834 m!1359505))

(declare-fun m!1359507 () Bool)

(assert (=> b!1472834 m!1359507))

(declare-fun m!1359509 () Bool)

(assert (=> b!1472838 m!1359509))

(declare-fun m!1359511 () Bool)

(assert (=> b!1472831 m!1359511))

(assert (=> b!1472827 m!1359501))

(assert (=> b!1472827 m!1359501))

(declare-fun m!1359513 () Bool)

(assert (=> b!1472827 m!1359513))

(declare-fun m!1359515 () Bool)

(assert (=> start!125810 m!1359515))

(declare-fun m!1359517 () Bool)

(assert (=> start!125810 m!1359517))

(declare-fun m!1359519 () Bool)

(assert (=> b!1472830 m!1359519))

(declare-fun m!1359521 () Bool)

(assert (=> b!1472841 m!1359521))

(assert (=> b!1472841 m!1359521))

(declare-fun m!1359523 () Bool)

(assert (=> b!1472841 m!1359523))

(declare-fun m!1359525 () Bool)

(assert (=> b!1472825 m!1359525))

(assert (=> b!1472825 m!1359525))

(declare-fun m!1359527 () Bool)

(assert (=> b!1472825 m!1359527))

(declare-fun m!1359529 () Bool)

(assert (=> b!1472825 m!1359529))

(declare-fun m!1359531 () Bool)

(assert (=> b!1472825 m!1359531))

(declare-fun m!1359533 () Bool)

(assert (=> b!1472836 m!1359533))

(declare-fun m!1359535 () Bool)

(assert (=> b!1472836 m!1359535))

(assert (=> b!1472833 m!1359501))

(assert (=> b!1472833 m!1359501))

(declare-fun m!1359537 () Bool)

(assert (=> b!1472833 m!1359537))

(assert (=> b!1472833 m!1359537))

(assert (=> b!1472833 m!1359501))

(declare-fun m!1359539 () Bool)

(assert (=> b!1472833 m!1359539))

(assert (=> b!1472826 m!1359529))

(declare-fun m!1359541 () Bool)

(assert (=> b!1472826 m!1359541))

(declare-fun m!1359543 () Bool)

(assert (=> b!1472832 m!1359543))

(assert (=> b!1472832 m!1359501))

(assert (=> b!1472840 m!1359501))

(assert (=> b!1472840 m!1359501))

(declare-fun m!1359545 () Bool)

(assert (=> b!1472840 m!1359545))

(push 1)

(assert (not b!1472833))

(assert (not b!1472840))

(assert (not b!1472841))

(assert (not b!1472838))

(assert (not start!125810))

(assert (not b!1472836))

(assert (not b!1472828))

(assert (not b!1472825))

(assert (not b!1472827))

(assert (not b!1472830))

(assert (not b!1472831))

(assert (not b!1472834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

