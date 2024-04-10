; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126392 () Bool)

(assert start!126392)

(declare-fun b!1481822 () Bool)

(declare-fun res!1007116 () Bool)

(declare-fun e!831035 () Bool)

(assert (=> b!1481822 (=> (not res!1007116) (not e!831035))))

(declare-datatypes ((array!99411 0))(
  ( (array!99412 (arr!47983 (Array (_ BitVec 32) (_ BitVec 64))) (size!48533 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99411)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99411 (_ BitVec 32)) Bool)

(assert (=> b!1481822 (= res!1007116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1481823 () Bool)

(declare-fun res!1007114 () Bool)

(declare-fun e!831037 () Bool)

(assert (=> b!1481823 (=> (not res!1007114) (not e!831037))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1481823 (= res!1007114 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481825 () Bool)

(declare-fun res!1007103 () Bool)

(assert (=> b!1481825 (=> (not res!1007103) (not e!831035))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481825 (= res!1007103 (validKeyInArray!0 (select (arr!47983 a!2862) j!93)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun e!831038 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1481826 () Bool)

(assert (=> b!1481826 (= e!831038 (and (or (= (select (arr!47983 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47983 a!2862) intermediateBeforeIndex!19) (select (arr!47983 a!2862) j!93))) (or (and (= (select (arr!47983 a!2862) index!646) (select (store (arr!47983 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47983 a!2862) index!646) (select (arr!47983 a!2862) j!93))) (= (select (arr!47983 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47983 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1481827 () Bool)

(declare-fun res!1007107 () Bool)

(assert (=> b!1481827 (=> (not res!1007107) (not e!831035))))

(assert (=> b!1481827 (= res!1007107 (and (= (size!48533 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48533 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48533 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481828 () Bool)

(declare-fun res!1007110 () Bool)

(declare-fun e!831036 () Bool)

(assert (=> b!1481828 (=> (not res!1007110) (not e!831036))))

(declare-datatypes ((SeekEntryResult!12223 0))(
  ( (MissingZero!12223 (index!51284 (_ BitVec 32))) (Found!12223 (index!51285 (_ BitVec 32))) (Intermediate!12223 (undefined!13035 Bool) (index!51286 (_ BitVec 32)) (x!132866 (_ BitVec 32))) (Undefined!12223) (MissingVacant!12223 (index!51287 (_ BitVec 32))) )
))
(declare-fun lt!646892 () SeekEntryResult!12223)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99411 (_ BitVec 32)) SeekEntryResult!12223)

(assert (=> b!1481828 (= res!1007110 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47983 a!2862) j!93) a!2862 mask!2687) lt!646892))))

(declare-fun e!831034 () Bool)

(declare-fun lt!646891 () array!99411)

(declare-fun lt!646890 () (_ BitVec 64))

(declare-fun b!1481829 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99411 (_ BitVec 32)) SeekEntryResult!12223)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99411 (_ BitVec 32)) SeekEntryResult!12223)

(assert (=> b!1481829 (= e!831034 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646890 lt!646891 mask!2687) (seekEntryOrOpen!0 lt!646890 lt!646891 mask!2687)))))

(declare-fun b!1481830 () Bool)

(declare-fun lt!646893 () SeekEntryResult!12223)

(assert (=> b!1481830 (= e!831034 (= lt!646893 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646890 lt!646891 mask!2687)))))

(declare-fun b!1481831 () Bool)

(declare-fun e!831032 () Bool)

(assert (=> b!1481831 (= e!831035 e!831032)))

(declare-fun res!1007102 () Bool)

(assert (=> b!1481831 (=> (not res!1007102) (not e!831032))))

(assert (=> b!1481831 (= res!1007102 (= (select (store (arr!47983 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481831 (= lt!646891 (array!99412 (store (arr!47983 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48533 a!2862)))))

(declare-fun b!1481832 () Bool)

(assert (=> b!1481832 (= e!831037 (not true))))

(assert (=> b!1481832 e!831038))

(declare-fun res!1007111 () Bool)

(assert (=> b!1481832 (=> (not res!1007111) (not e!831038))))

(assert (=> b!1481832 (= res!1007111 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49786 0))(
  ( (Unit!49787) )
))
(declare-fun lt!646889 () Unit!49786)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99411 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49786)

(assert (=> b!1481832 (= lt!646889 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481833 () Bool)

(declare-fun res!1007113 () Bool)

(assert (=> b!1481833 (=> (not res!1007113) (not e!831037))))

(assert (=> b!1481833 (= res!1007113 e!831034)))

(declare-fun c!136881 () Bool)

(assert (=> b!1481833 (= c!136881 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481834 () Bool)

(declare-fun res!1007109 () Bool)

(assert (=> b!1481834 (=> (not res!1007109) (not e!831035))))

(assert (=> b!1481834 (= res!1007109 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48533 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48533 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48533 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481835 () Bool)

(declare-fun res!1007104 () Bool)

(assert (=> b!1481835 (=> (not res!1007104) (not e!831038))))

(assert (=> b!1481835 (= res!1007104 (= (seekEntryOrOpen!0 (select (arr!47983 a!2862) j!93) a!2862 mask!2687) (Found!12223 j!93)))))

(declare-fun b!1481836 () Bool)

(assert (=> b!1481836 (= e!831032 e!831036)))

(declare-fun res!1007106 () Bool)

(assert (=> b!1481836 (=> (not res!1007106) (not e!831036))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481836 (= res!1007106 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47983 a!2862) j!93) mask!2687) (select (arr!47983 a!2862) j!93) a!2862 mask!2687) lt!646892))))

(assert (=> b!1481836 (= lt!646892 (Intermediate!12223 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1007112 () Bool)

(assert (=> start!126392 (=> (not res!1007112) (not e!831035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126392 (= res!1007112 (validMask!0 mask!2687))))

(assert (=> start!126392 e!831035))

(assert (=> start!126392 true))

(declare-fun array_inv!37011 (array!99411) Bool)

(assert (=> start!126392 (array_inv!37011 a!2862)))

(declare-fun b!1481824 () Bool)

(declare-fun res!1007105 () Bool)

(assert (=> b!1481824 (=> (not res!1007105) (not e!831035))))

(declare-datatypes ((List!34484 0))(
  ( (Nil!34481) (Cons!34480 (h!35851 (_ BitVec 64)) (t!49178 List!34484)) )
))
(declare-fun arrayNoDuplicates!0 (array!99411 (_ BitVec 32) List!34484) Bool)

(assert (=> b!1481824 (= res!1007105 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34481))))

(declare-fun b!1481837 () Bool)

(declare-fun res!1007115 () Bool)

(assert (=> b!1481837 (=> (not res!1007115) (not e!831035))))

(assert (=> b!1481837 (= res!1007115 (validKeyInArray!0 (select (arr!47983 a!2862) i!1006)))))

(declare-fun b!1481838 () Bool)

(assert (=> b!1481838 (= e!831036 e!831037)))

(declare-fun res!1007108 () Bool)

(assert (=> b!1481838 (=> (not res!1007108) (not e!831037))))

(assert (=> b!1481838 (= res!1007108 (= lt!646893 (Intermediate!12223 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1481838 (= lt!646893 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646890 mask!2687) lt!646890 lt!646891 mask!2687))))

(assert (=> b!1481838 (= lt!646890 (select (store (arr!47983 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!126392 res!1007112) b!1481827))

(assert (= (and b!1481827 res!1007107) b!1481837))

(assert (= (and b!1481837 res!1007115) b!1481825))

(assert (= (and b!1481825 res!1007103) b!1481822))

(assert (= (and b!1481822 res!1007116) b!1481824))

(assert (= (and b!1481824 res!1007105) b!1481834))

(assert (= (and b!1481834 res!1007109) b!1481831))

(assert (= (and b!1481831 res!1007102) b!1481836))

(assert (= (and b!1481836 res!1007106) b!1481828))

(assert (= (and b!1481828 res!1007110) b!1481838))

(assert (= (and b!1481838 res!1007108) b!1481833))

(assert (= (and b!1481833 c!136881) b!1481830))

(assert (= (and b!1481833 (not c!136881)) b!1481829))

(assert (= (and b!1481833 res!1007113) b!1481823))

(assert (= (and b!1481823 res!1007114) b!1481832))

(assert (= (and b!1481832 res!1007111) b!1481835))

(assert (= (and b!1481835 res!1007104) b!1481826))

(declare-fun m!1367555 () Bool)

(assert (=> b!1481824 m!1367555))

(declare-fun m!1367557 () Bool)

(assert (=> b!1481835 m!1367557))

(assert (=> b!1481835 m!1367557))

(declare-fun m!1367559 () Bool)

(assert (=> b!1481835 m!1367559))

(declare-fun m!1367561 () Bool)

(assert (=> b!1481838 m!1367561))

(assert (=> b!1481838 m!1367561))

(declare-fun m!1367563 () Bool)

(assert (=> b!1481838 m!1367563))

(declare-fun m!1367565 () Bool)

(assert (=> b!1481838 m!1367565))

(declare-fun m!1367567 () Bool)

(assert (=> b!1481838 m!1367567))

(declare-fun m!1367569 () Bool)

(assert (=> b!1481832 m!1367569))

(declare-fun m!1367571 () Bool)

(assert (=> b!1481832 m!1367571))

(declare-fun m!1367573 () Bool)

(assert (=> b!1481830 m!1367573))

(declare-fun m!1367575 () Bool)

(assert (=> b!1481829 m!1367575))

(declare-fun m!1367577 () Bool)

(assert (=> b!1481829 m!1367577))

(assert (=> b!1481831 m!1367565))

(declare-fun m!1367579 () Bool)

(assert (=> b!1481831 m!1367579))

(declare-fun m!1367581 () Bool)

(assert (=> b!1481837 m!1367581))

(assert (=> b!1481837 m!1367581))

(declare-fun m!1367583 () Bool)

(assert (=> b!1481837 m!1367583))

(assert (=> b!1481826 m!1367565))

(declare-fun m!1367585 () Bool)

(assert (=> b!1481826 m!1367585))

(declare-fun m!1367587 () Bool)

(assert (=> b!1481826 m!1367587))

(declare-fun m!1367589 () Bool)

(assert (=> b!1481826 m!1367589))

(assert (=> b!1481826 m!1367557))

(declare-fun m!1367591 () Bool)

(assert (=> start!126392 m!1367591))

(declare-fun m!1367593 () Bool)

(assert (=> start!126392 m!1367593))

(assert (=> b!1481825 m!1367557))

(assert (=> b!1481825 m!1367557))

(declare-fun m!1367595 () Bool)

(assert (=> b!1481825 m!1367595))

(assert (=> b!1481836 m!1367557))

(assert (=> b!1481836 m!1367557))

(declare-fun m!1367597 () Bool)

(assert (=> b!1481836 m!1367597))

(assert (=> b!1481836 m!1367597))

(assert (=> b!1481836 m!1367557))

(declare-fun m!1367599 () Bool)

(assert (=> b!1481836 m!1367599))

(assert (=> b!1481828 m!1367557))

(assert (=> b!1481828 m!1367557))

(declare-fun m!1367601 () Bool)

(assert (=> b!1481828 m!1367601))

(declare-fun m!1367603 () Bool)

(assert (=> b!1481822 m!1367603))

(push 1)

