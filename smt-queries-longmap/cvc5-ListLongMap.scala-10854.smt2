; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127102 () Bool)

(assert start!127102)

(declare-fun b!1493764 () Bool)

(declare-fun e!836774 () Bool)

(declare-fun e!836777 () Bool)

(assert (=> b!1493764 (= e!836774 e!836777)))

(declare-fun res!1016214 () Bool)

(assert (=> b!1493764 (=> (not res!1016214) (not e!836777))))

(declare-datatypes ((SeekEntryResult!12383 0))(
  ( (MissingZero!12383 (index!51924 (_ BitVec 32))) (Found!12383 (index!51925 (_ BitVec 32))) (Intermediate!12383 (undefined!13195 Bool) (index!51926 (_ BitVec 32)) (x!133527 (_ BitVec 32))) (Undefined!12383) (MissingVacant!12383 (index!51927 (_ BitVec 32))) )
))
(declare-fun lt!651138 () SeekEntryResult!12383)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1493764 (= res!1016214 (= lt!651138 (Intermediate!12383 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!99749 0))(
  ( (array!99750 (arr!48143 (Array (_ BitVec 32) (_ BitVec 64))) (size!48693 (_ BitVec 32))) )
))
(declare-fun lt!651134 () array!99749)

(declare-fun lt!651137 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99749 (_ BitVec 32)) SeekEntryResult!12383)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493764 (= lt!651138 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651137 mask!2687) lt!651137 lt!651134 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99749)

(assert (=> b!1493764 (= lt!651137 (select (store (arr!48143 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1493765 () Bool)

(declare-fun e!836773 () Bool)

(declare-fun e!836771 () Bool)

(assert (=> b!1493765 (= e!836773 e!836771)))

(declare-fun res!1016224 () Bool)

(assert (=> b!1493765 (=> (not res!1016224) (not e!836771))))

(assert (=> b!1493765 (= res!1016224 (= (select (store (arr!48143 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1493765 (= lt!651134 (array!99750 (store (arr!48143 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48693 a!2862)))))

(declare-fun b!1493766 () Bool)

(declare-fun res!1016212 () Bool)

(assert (=> b!1493766 (=> (not res!1016212) (not e!836773))))

(assert (=> b!1493766 (= res!1016212 (and (= (size!48693 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48693 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48693 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1493767 () Bool)

(declare-fun res!1016226 () Bool)

(assert (=> b!1493767 (=> (not res!1016226) (not e!836773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99749 (_ BitVec 32)) Bool)

(assert (=> b!1493767 (= res!1016226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1493768 () Bool)

(declare-fun e!836776 () Bool)

(assert (=> b!1493768 (= e!836777 (not e!836776))))

(declare-fun res!1016218 () Bool)

(assert (=> b!1493768 (=> res!1016218 e!836776)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1493768 (= res!1016218 (or (and (= (select (arr!48143 a!2862) index!646) (select (store (arr!48143 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48143 a!2862) index!646) (select (arr!48143 a!2862) j!93))) (= (select (arr!48143 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!836770 () Bool)

(assert (=> b!1493768 e!836770))

(declare-fun res!1016215 () Bool)

(assert (=> b!1493768 (=> (not res!1016215) (not e!836770))))

(assert (=> b!1493768 (= res!1016215 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50106 0))(
  ( (Unit!50107) )
))
(declare-fun lt!651135 () Unit!50106)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99749 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50106)

(assert (=> b!1493768 (= lt!651135 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun e!836772 () Bool)

(declare-fun b!1493769 () Bool)

(assert (=> b!1493769 (= e!836772 (= lt!651138 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651137 lt!651134 mask!2687)))))

(declare-fun b!1493770 () Bool)

(assert (=> b!1493770 (= e!836776 true)))

(declare-fun lt!651136 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1493770 (= lt!651136 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1493771 () Bool)

(assert (=> b!1493771 (= e!836771 e!836774)))

(declare-fun res!1016223 () Bool)

(assert (=> b!1493771 (=> (not res!1016223) (not e!836774))))

(declare-fun lt!651133 () SeekEntryResult!12383)

(assert (=> b!1493771 (= res!1016223 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48143 a!2862) j!93) mask!2687) (select (arr!48143 a!2862) j!93) a!2862 mask!2687) lt!651133))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1493771 (= lt!651133 (Intermediate!12383 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1493772 () Bool)

(declare-fun res!1016225 () Bool)

(assert (=> b!1493772 (=> (not res!1016225) (not e!836774))))

(assert (=> b!1493772 (= res!1016225 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48143 a!2862) j!93) a!2862 mask!2687) lt!651133))))

(declare-fun b!1493773 () Bool)

(declare-fun res!1016216 () Bool)

(assert (=> b!1493773 (=> (not res!1016216) (not e!836773))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1493773 (= res!1016216 (validKeyInArray!0 (select (arr!48143 a!2862) j!93)))))

(declare-fun b!1493774 () Bool)

(assert (=> b!1493774 (= e!836770 (or (= (select (arr!48143 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48143 a!2862) intermediateBeforeIndex!19) (select (arr!48143 a!2862) j!93))))))

(declare-fun res!1016222 () Bool)

(assert (=> start!127102 (=> (not res!1016222) (not e!836773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127102 (= res!1016222 (validMask!0 mask!2687))))

(assert (=> start!127102 e!836773))

(assert (=> start!127102 true))

(declare-fun array_inv!37171 (array!99749) Bool)

(assert (=> start!127102 (array_inv!37171 a!2862)))

(declare-fun b!1493775 () Bool)

(declare-fun res!1016227 () Bool)

(assert (=> b!1493775 (=> (not res!1016227) (not e!836777))))

(assert (=> b!1493775 (= res!1016227 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1493776 () Bool)

(declare-fun res!1016220 () Bool)

(assert (=> b!1493776 (=> (not res!1016220) (not e!836777))))

(assert (=> b!1493776 (= res!1016220 e!836772)))

(declare-fun c!138306 () Bool)

(assert (=> b!1493776 (= c!138306 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1493777 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99749 (_ BitVec 32)) SeekEntryResult!12383)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99749 (_ BitVec 32)) SeekEntryResult!12383)

(assert (=> b!1493777 (= e!836772 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651137 lt!651134 mask!2687) (seekEntryOrOpen!0 lt!651137 lt!651134 mask!2687)))))

(declare-fun b!1493778 () Bool)

(declare-fun res!1016221 () Bool)

(assert (=> b!1493778 (=> (not res!1016221) (not e!836773))))

(assert (=> b!1493778 (= res!1016221 (validKeyInArray!0 (select (arr!48143 a!2862) i!1006)))))

(declare-fun b!1493779 () Bool)

(declare-fun res!1016219 () Bool)

(assert (=> b!1493779 (=> (not res!1016219) (not e!836773))))

(declare-datatypes ((List!34644 0))(
  ( (Nil!34641) (Cons!34640 (h!36029 (_ BitVec 64)) (t!49338 List!34644)) )
))
(declare-fun arrayNoDuplicates!0 (array!99749 (_ BitVec 32) List!34644) Bool)

(assert (=> b!1493779 (= res!1016219 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34641))))

(declare-fun b!1493780 () Bool)

(declare-fun res!1016213 () Bool)

(assert (=> b!1493780 (=> (not res!1016213) (not e!836770))))

(assert (=> b!1493780 (= res!1016213 (= (seekEntryOrOpen!0 (select (arr!48143 a!2862) j!93) a!2862 mask!2687) (Found!12383 j!93)))))

(declare-fun b!1493781 () Bool)

(declare-fun res!1016217 () Bool)

(assert (=> b!1493781 (=> (not res!1016217) (not e!836773))))

(assert (=> b!1493781 (= res!1016217 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48693 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48693 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48693 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!127102 res!1016222) b!1493766))

(assert (= (and b!1493766 res!1016212) b!1493778))

(assert (= (and b!1493778 res!1016221) b!1493773))

(assert (= (and b!1493773 res!1016216) b!1493767))

(assert (= (and b!1493767 res!1016226) b!1493779))

(assert (= (and b!1493779 res!1016219) b!1493781))

(assert (= (and b!1493781 res!1016217) b!1493765))

(assert (= (and b!1493765 res!1016224) b!1493771))

(assert (= (and b!1493771 res!1016223) b!1493772))

(assert (= (and b!1493772 res!1016225) b!1493764))

(assert (= (and b!1493764 res!1016214) b!1493776))

(assert (= (and b!1493776 c!138306) b!1493769))

(assert (= (and b!1493776 (not c!138306)) b!1493777))

(assert (= (and b!1493776 res!1016220) b!1493775))

(assert (= (and b!1493775 res!1016227) b!1493768))

(assert (= (and b!1493768 res!1016215) b!1493780))

(assert (= (and b!1493780 res!1016213) b!1493774))

(assert (= (and b!1493768 (not res!1016218)) b!1493770))

(declare-fun m!1377535 () Bool)

(assert (=> b!1493779 m!1377535))

(declare-fun m!1377537 () Bool)

(assert (=> b!1493770 m!1377537))

(declare-fun m!1377539 () Bool)

(assert (=> b!1493768 m!1377539))

(declare-fun m!1377541 () Bool)

(assert (=> b!1493768 m!1377541))

(declare-fun m!1377543 () Bool)

(assert (=> b!1493768 m!1377543))

(declare-fun m!1377545 () Bool)

(assert (=> b!1493768 m!1377545))

(declare-fun m!1377547 () Bool)

(assert (=> b!1493768 m!1377547))

(declare-fun m!1377549 () Bool)

(assert (=> b!1493768 m!1377549))

(declare-fun m!1377551 () Bool)

(assert (=> b!1493764 m!1377551))

(assert (=> b!1493764 m!1377551))

(declare-fun m!1377553 () Bool)

(assert (=> b!1493764 m!1377553))

(assert (=> b!1493764 m!1377541))

(declare-fun m!1377555 () Bool)

(assert (=> b!1493764 m!1377555))

(declare-fun m!1377557 () Bool)

(assert (=> b!1493767 m!1377557))

(assert (=> b!1493780 m!1377549))

(assert (=> b!1493780 m!1377549))

(declare-fun m!1377559 () Bool)

(assert (=> b!1493780 m!1377559))

(declare-fun m!1377561 () Bool)

(assert (=> b!1493774 m!1377561))

(assert (=> b!1493774 m!1377549))

(declare-fun m!1377563 () Bool)

(assert (=> b!1493769 m!1377563))

(declare-fun m!1377565 () Bool)

(assert (=> b!1493778 m!1377565))

(assert (=> b!1493778 m!1377565))

(declare-fun m!1377567 () Bool)

(assert (=> b!1493778 m!1377567))

(declare-fun m!1377569 () Bool)

(assert (=> start!127102 m!1377569))

(declare-fun m!1377571 () Bool)

(assert (=> start!127102 m!1377571))

(assert (=> b!1493772 m!1377549))

(assert (=> b!1493772 m!1377549))

(declare-fun m!1377573 () Bool)

(assert (=> b!1493772 m!1377573))

(assert (=> b!1493773 m!1377549))

(assert (=> b!1493773 m!1377549))

(declare-fun m!1377575 () Bool)

(assert (=> b!1493773 m!1377575))

(assert (=> b!1493765 m!1377541))

(declare-fun m!1377577 () Bool)

(assert (=> b!1493765 m!1377577))

(declare-fun m!1377579 () Bool)

(assert (=> b!1493777 m!1377579))

(declare-fun m!1377581 () Bool)

(assert (=> b!1493777 m!1377581))

(assert (=> b!1493771 m!1377549))

(assert (=> b!1493771 m!1377549))

(declare-fun m!1377583 () Bool)

(assert (=> b!1493771 m!1377583))

(assert (=> b!1493771 m!1377583))

(assert (=> b!1493771 m!1377549))

(declare-fun m!1377585 () Bool)

(assert (=> b!1493771 m!1377585))

(push 1)

