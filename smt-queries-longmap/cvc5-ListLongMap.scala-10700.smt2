; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125338 () Bool)

(assert start!125338)

(declare-fun b!1464627 () Bool)

(declare-fun res!993674 () Bool)

(declare-fun e!823069 () Bool)

(assert (=> b!1464627 (=> (not res!993674) (not e!823069))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98786 0))(
  ( (array!98787 (arr!47681 (Array (_ BitVec 32) (_ BitVec 64))) (size!48231 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98786)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1464627 (= res!993674 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48231 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48231 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48231 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1464628 () Bool)

(declare-fun e!823070 () Bool)

(assert (=> b!1464628 (= e!823069 e!823070)))

(declare-fun res!993668 () Bool)

(assert (=> b!1464628 (=> (not res!993668) (not e!823070))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1464628 (= res!993668 (= (select (store (arr!47681 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!641150 () array!98786)

(assert (=> b!1464628 (= lt!641150 (array!98787 (store (arr!47681 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48231 a!2862)))))

(declare-fun b!1464629 () Bool)

(declare-fun e!823066 () Bool)

(assert (=> b!1464629 (= e!823070 e!823066)))

(declare-fun res!993675 () Bool)

(assert (=> b!1464629 (=> (not res!993675) (not e!823066))))

(declare-datatypes ((SeekEntryResult!11933 0))(
  ( (MissingZero!11933 (index!50124 (_ BitVec 32))) (Found!11933 (index!50125 (_ BitVec 32))) (Intermediate!11933 (undefined!12745 Bool) (index!50126 (_ BitVec 32)) (x!131710 (_ BitVec 32))) (Undefined!11933) (MissingVacant!11933 (index!50127 (_ BitVec 32))) )
))
(declare-fun lt!641151 () SeekEntryResult!11933)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98786 (_ BitVec 32)) SeekEntryResult!11933)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464629 (= res!993675 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47681 a!2862) j!93) mask!2687) (select (arr!47681 a!2862) j!93) a!2862 mask!2687) lt!641151))))

(assert (=> b!1464629 (= lt!641151 (Intermediate!11933 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1464630 () Bool)

(declare-fun res!993664 () Bool)

(declare-fun e!823061 () Bool)

(assert (=> b!1464630 (=> (not res!993664) (not e!823061))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98786 (_ BitVec 32)) SeekEntryResult!11933)

(assert (=> b!1464630 (= res!993664 (= (seekEntryOrOpen!0 (select (arr!47681 a!2862) j!93) a!2862 mask!2687) (Found!11933 j!93)))))

(declare-fun b!1464631 () Bool)

(declare-fun res!993669 () Bool)

(assert (=> b!1464631 (=> (not res!993669) (not e!823069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464631 (= res!993669 (validKeyInArray!0 (select (arr!47681 a!2862) i!1006)))))

(declare-fun b!1464632 () Bool)

(declare-fun res!993670 () Bool)

(assert (=> b!1464632 (=> (not res!993670) (not e!823069))))

(declare-datatypes ((List!34182 0))(
  ( (Nil!34179) (Cons!34178 (h!35528 (_ BitVec 64)) (t!48876 List!34182)) )
))
(declare-fun arrayNoDuplicates!0 (array!98786 (_ BitVec 32) List!34182) Bool)

(assert (=> b!1464632 (= res!993670 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34179))))

(declare-fun b!1464633 () Bool)

(declare-fun lt!641145 () (_ BitVec 64))

(declare-fun e!823067 () Bool)

(declare-fun lt!641147 () SeekEntryResult!11933)

(declare-fun lt!641148 () (_ BitVec 32))

(assert (=> b!1464633 (= e!823067 (not (= lt!641147 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641148 lt!641145 lt!641150 mask!2687))))))

(declare-fun b!1464634 () Bool)

(declare-fun res!993678 () Bool)

(declare-fun e!823063 () Bool)

(assert (=> b!1464634 (=> (not res!993678) (not e!823063))))

(declare-fun e!823062 () Bool)

(assert (=> b!1464634 (= res!993678 e!823062)))

(declare-fun c!134994 () Bool)

(assert (=> b!1464634 (= c!134994 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1464635 () Bool)

(assert (=> b!1464635 (= e!823061 (or (= (select (arr!47681 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47681 a!2862) intermediateBeforeIndex!19) (select (arr!47681 a!2862) j!93))))))

(declare-fun res!993667 () Bool)

(assert (=> start!125338 (=> (not res!993667) (not e!823069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125338 (= res!993667 (validMask!0 mask!2687))))

(assert (=> start!125338 e!823069))

(assert (=> start!125338 true))

(declare-fun array_inv!36709 (array!98786) Bool)

(assert (=> start!125338 (array_inv!36709 a!2862)))

(declare-fun b!1464636 () Bool)

(declare-fun e!823065 () Bool)

(assert (=> b!1464636 (= e!823063 (not e!823065))))

(declare-fun res!993673 () Bool)

(assert (=> b!1464636 (=> res!993673 e!823065)))

(assert (=> b!1464636 (= res!993673 (or (and (= (select (arr!47681 a!2862) index!646) (select (store (arr!47681 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47681 a!2862) index!646) (select (arr!47681 a!2862) j!93))) (= (select (arr!47681 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1464636 e!823061))

(declare-fun res!993671 () Bool)

(assert (=> b!1464636 (=> (not res!993671) (not e!823061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98786 (_ BitVec 32)) Bool)

(assert (=> b!1464636 (= res!993671 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49362 0))(
  ( (Unit!49363) )
))
(declare-fun lt!641146 () Unit!49362)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98786 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49362)

(assert (=> b!1464636 (= lt!641146 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1464637 () Bool)

(declare-fun res!993665 () Bool)

(assert (=> b!1464637 (=> (not res!993665) (not e!823066))))

(assert (=> b!1464637 (= res!993665 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47681 a!2862) j!93) a!2862 mask!2687) lt!641151))))

(declare-fun b!1464638 () Bool)

(assert (=> b!1464638 (= e!823062 (= lt!641147 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641145 lt!641150 mask!2687)))))

(declare-fun b!1464639 () Bool)

(declare-fun res!993679 () Bool)

(assert (=> b!1464639 (=> (not res!993679) (not e!823069))))

(assert (=> b!1464639 (= res!993679 (and (= (size!48231 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48231 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48231 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1464640 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98786 (_ BitVec 32)) SeekEntryResult!11933)

(assert (=> b!1464640 (= e!823067 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641148 intermediateAfterIndex!19 lt!641145 lt!641150 mask!2687) (seekEntryOrOpen!0 lt!641145 lt!641150 mask!2687))))))

(declare-fun b!1464641 () Bool)

(declare-fun res!993662 () Bool)

(assert (=> b!1464641 (=> (not res!993662) (not e!823063))))

(assert (=> b!1464641 (= res!993662 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1464642 () Bool)

(assert (=> b!1464642 (= e!823066 e!823063)))

(declare-fun res!993666 () Bool)

(assert (=> b!1464642 (=> (not res!993666) (not e!823063))))

(assert (=> b!1464642 (= res!993666 (= lt!641147 (Intermediate!11933 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1464642 (= lt!641147 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641145 mask!2687) lt!641145 lt!641150 mask!2687))))

(assert (=> b!1464642 (= lt!641145 (select (store (arr!47681 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464643 () Bool)

(declare-fun e!823064 () Bool)

(assert (=> b!1464643 (= e!823065 e!823064)))

(declare-fun res!993663 () Bool)

(assert (=> b!1464643 (=> res!993663 e!823064)))

(assert (=> b!1464643 (= res!993663 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641148 #b00000000000000000000000000000000) (bvsge lt!641148 (size!48231 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464643 (= lt!641148 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1464644 () Bool)

(assert (=> b!1464644 (= e!823062 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641145 lt!641150 mask!2687) (seekEntryOrOpen!0 lt!641145 lt!641150 mask!2687)))))

(declare-fun b!1464645 () Bool)

(assert (=> b!1464645 (= e!823064 true)))

(declare-fun lt!641149 () Bool)

(assert (=> b!1464645 (= lt!641149 e!823067)))

(declare-fun c!134993 () Bool)

(assert (=> b!1464645 (= c!134993 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1464646 () Bool)

(declare-fun res!993677 () Bool)

(assert (=> b!1464646 (=> (not res!993677) (not e!823069))))

(assert (=> b!1464646 (= res!993677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464647 () Bool)

(declare-fun res!993676 () Bool)

(assert (=> b!1464647 (=> (not res!993676) (not e!823069))))

(assert (=> b!1464647 (= res!993676 (validKeyInArray!0 (select (arr!47681 a!2862) j!93)))))

(declare-fun b!1464648 () Bool)

(declare-fun res!993672 () Bool)

(assert (=> b!1464648 (=> res!993672 e!823064)))

(assert (=> b!1464648 (= res!993672 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641148 (select (arr!47681 a!2862) j!93) a!2862 mask!2687) lt!641151)))))

(assert (= (and start!125338 res!993667) b!1464639))

(assert (= (and b!1464639 res!993679) b!1464631))

(assert (= (and b!1464631 res!993669) b!1464647))

(assert (= (and b!1464647 res!993676) b!1464646))

(assert (= (and b!1464646 res!993677) b!1464632))

(assert (= (and b!1464632 res!993670) b!1464627))

(assert (= (and b!1464627 res!993674) b!1464628))

(assert (= (and b!1464628 res!993668) b!1464629))

(assert (= (and b!1464629 res!993675) b!1464637))

(assert (= (and b!1464637 res!993665) b!1464642))

(assert (= (and b!1464642 res!993666) b!1464634))

(assert (= (and b!1464634 c!134994) b!1464638))

(assert (= (and b!1464634 (not c!134994)) b!1464644))

(assert (= (and b!1464634 res!993678) b!1464641))

(assert (= (and b!1464641 res!993662) b!1464636))

(assert (= (and b!1464636 res!993671) b!1464630))

(assert (= (and b!1464630 res!993664) b!1464635))

(assert (= (and b!1464636 (not res!993673)) b!1464643))

(assert (= (and b!1464643 (not res!993663)) b!1464648))

(assert (= (and b!1464648 (not res!993672)) b!1464645))

(assert (= (and b!1464645 c!134993) b!1464633))

(assert (= (and b!1464645 (not c!134993)) b!1464640))

(declare-fun m!1351819 () Bool)

(assert (=> b!1464642 m!1351819))

(assert (=> b!1464642 m!1351819))

(declare-fun m!1351821 () Bool)

(assert (=> b!1464642 m!1351821))

(declare-fun m!1351823 () Bool)

(assert (=> b!1464642 m!1351823))

(declare-fun m!1351825 () Bool)

(assert (=> b!1464642 m!1351825))

(declare-fun m!1351827 () Bool)

(assert (=> b!1464637 m!1351827))

(assert (=> b!1464637 m!1351827))

(declare-fun m!1351829 () Bool)

(assert (=> b!1464637 m!1351829))

(declare-fun m!1351831 () Bool)

(assert (=> b!1464631 m!1351831))

(assert (=> b!1464631 m!1351831))

(declare-fun m!1351833 () Bool)

(assert (=> b!1464631 m!1351833))

(declare-fun m!1351835 () Bool)

(assert (=> b!1464632 m!1351835))

(declare-fun m!1351837 () Bool)

(assert (=> b!1464638 m!1351837))

(assert (=> b!1464629 m!1351827))

(assert (=> b!1464629 m!1351827))

(declare-fun m!1351839 () Bool)

(assert (=> b!1464629 m!1351839))

(assert (=> b!1464629 m!1351839))

(assert (=> b!1464629 m!1351827))

(declare-fun m!1351841 () Bool)

(assert (=> b!1464629 m!1351841))

(declare-fun m!1351843 () Bool)

(assert (=> b!1464643 m!1351843))

(declare-fun m!1351845 () Bool)

(assert (=> start!125338 m!1351845))

(declare-fun m!1351847 () Bool)

(assert (=> start!125338 m!1351847))

(assert (=> b!1464648 m!1351827))

(assert (=> b!1464648 m!1351827))

(declare-fun m!1351849 () Bool)

(assert (=> b!1464648 m!1351849))

(declare-fun m!1351851 () Bool)

(assert (=> b!1464640 m!1351851))

(declare-fun m!1351853 () Bool)

(assert (=> b!1464640 m!1351853))

(declare-fun m!1351855 () Bool)

(assert (=> b!1464635 m!1351855))

(assert (=> b!1464635 m!1351827))

(declare-fun m!1351857 () Bool)

(assert (=> b!1464646 m!1351857))

(declare-fun m!1351859 () Bool)

(assert (=> b!1464633 m!1351859))

(declare-fun m!1351861 () Bool)

(assert (=> b!1464644 m!1351861))

(assert (=> b!1464644 m!1351853))

(assert (=> b!1464647 m!1351827))

(assert (=> b!1464647 m!1351827))

(declare-fun m!1351863 () Bool)

(assert (=> b!1464647 m!1351863))

(declare-fun m!1351865 () Bool)

(assert (=> b!1464636 m!1351865))

(assert (=> b!1464636 m!1351823))

(declare-fun m!1351867 () Bool)

(assert (=> b!1464636 m!1351867))

(declare-fun m!1351869 () Bool)

(assert (=> b!1464636 m!1351869))

(declare-fun m!1351871 () Bool)

(assert (=> b!1464636 m!1351871))

(assert (=> b!1464636 m!1351827))

(assert (=> b!1464630 m!1351827))

(assert (=> b!1464630 m!1351827))

(declare-fun m!1351873 () Bool)

(assert (=> b!1464630 m!1351873))

(assert (=> b!1464628 m!1351823))

(declare-fun m!1351875 () Bool)

(assert (=> b!1464628 m!1351875))

(push 1)

