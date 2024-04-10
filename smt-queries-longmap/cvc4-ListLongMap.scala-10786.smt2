; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126218 () Bool)

(assert start!126218)

(declare-fun e!829563 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1478866 () Bool)

(declare-datatypes ((array!99324 0))(
  ( (array!99325 (arr!47941 (Array (_ BitVec 32) (_ BitVec 64))) (size!48491 (_ BitVec 32))) )
))
(declare-fun lt!645825 () array!99324)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12181 0))(
  ( (MissingZero!12181 (index!51116 (_ BitVec 32))) (Found!12181 (index!51117 (_ BitVec 32))) (Intermediate!12181 (undefined!12993 Bool) (index!51118 (_ BitVec 32)) (x!132700 (_ BitVec 32))) (Undefined!12181) (MissingVacant!12181 (index!51119 (_ BitVec 32))) )
))
(declare-fun lt!645826 () SeekEntryResult!12181)

(declare-fun lt!645828 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99324 (_ BitVec 32)) SeekEntryResult!12181)

(assert (=> b!1478866 (= e!829563 (= lt!645826 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645828 lt!645825 mask!2687)))))

(declare-fun b!1478867 () Bool)

(declare-fun res!1004837 () Bool)

(declare-fun e!829557 () Bool)

(assert (=> b!1478867 (=> (not res!1004837) (not e!829557))))

(declare-fun a!2862 () array!99324)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99324 (_ BitVec 32)) Bool)

(assert (=> b!1478867 (= res!1004837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478868 () Bool)

(declare-fun e!829561 () Bool)

(declare-fun e!829565 () Bool)

(assert (=> b!1478868 (= e!829561 e!829565)))

(declare-fun res!1004843 () Bool)

(assert (=> b!1478868 (=> (not res!1004843) (not e!829565))))

(declare-fun lt!645823 () SeekEntryResult!12181)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478868 (= res!1004843 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47941 a!2862) j!93) mask!2687) (select (arr!47941 a!2862) j!93) a!2862 mask!2687) lt!645823))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1478868 (= lt!645823 (Intermediate!12181 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478869 () Bool)

(declare-fun res!1004845 () Bool)

(assert (=> b!1478869 (=> (not res!1004845) (not e!829557))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1478869 (= res!1004845 (and (= (size!48491 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48491 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48491 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478870 () Bool)

(declare-fun res!1004846 () Bool)

(assert (=> b!1478870 (=> (not res!1004846) (not e!829565))))

(assert (=> b!1478870 (= res!1004846 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47941 a!2862) j!93) a!2862 mask!2687) lt!645823))))

(declare-fun b!1478871 () Bool)

(declare-fun e!829564 () Bool)

(declare-fun e!829560 () Bool)

(assert (=> b!1478871 (= e!829564 e!829560)))

(declare-fun res!1004842 () Bool)

(assert (=> b!1478871 (=> res!1004842 e!829560)))

(assert (=> b!1478871 (= res!1004842 (or (and (= (select (arr!47941 a!2862) index!646) (select (store (arr!47941 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47941 a!2862) index!646) (select (arr!47941 a!2862) j!93))) (not (= (select (arr!47941 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478872 () Bool)

(declare-fun res!1004839 () Bool)

(assert (=> b!1478872 (=> (not res!1004839) (not e!829557))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478872 (= res!1004839 (validKeyInArray!0 (select (arr!47941 a!2862) i!1006)))))

(declare-fun b!1478873 () Bool)

(declare-fun e!829559 () Bool)

(assert (=> b!1478873 (= e!829560 e!829559)))

(declare-fun res!1004848 () Bool)

(assert (=> b!1478873 (=> (not res!1004848) (not e!829559))))

(declare-fun lt!645824 () SeekEntryResult!12181)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99324 (_ BitVec 32)) SeekEntryResult!12181)

(assert (=> b!1478873 (= res!1004848 (= lt!645824 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47941 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478874 () Bool)

(declare-fun res!1004844 () Bool)

(declare-fun e!829562 () Bool)

(assert (=> b!1478874 (=> (not res!1004844) (not e!829562))))

(assert (=> b!1478874 (= res!1004844 e!829563)))

(declare-fun c!136536 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1478874 (= c!136536 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478875 () Bool)

(assert (=> b!1478875 (= e!829559 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478876 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99324 (_ BitVec 32)) SeekEntryResult!12181)

(assert (=> b!1478876 (= e!829563 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645828 lt!645825 mask!2687) (seekEntryOrOpen!0 lt!645828 lt!645825 mask!2687)))))

(declare-fun b!1478877 () Bool)

(declare-fun res!1004841 () Bool)

(assert (=> b!1478877 (=> (not res!1004841) (not e!829562))))

(assert (=> b!1478877 (= res!1004841 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478878 () Bool)

(declare-fun res!1004847 () Bool)

(assert (=> b!1478878 (=> (not res!1004847) (not e!829557))))

(assert (=> b!1478878 (= res!1004847 (validKeyInArray!0 (select (arr!47941 a!2862) j!93)))))

(declare-fun b!1478879 () Bool)

(assert (=> b!1478879 (= e!829557 e!829561)))

(declare-fun res!1004834 () Bool)

(assert (=> b!1478879 (=> (not res!1004834) (not e!829561))))

(assert (=> b!1478879 (= res!1004834 (= (select (store (arr!47941 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1478879 (= lt!645825 (array!99325 (store (arr!47941 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48491 a!2862)))))

(declare-fun b!1478880 () Bool)

(declare-fun res!1004840 () Bool)

(assert (=> b!1478880 (=> (not res!1004840) (not e!829557))))

(assert (=> b!1478880 (= res!1004840 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48491 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48491 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48491 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1004833 () Bool)

(assert (=> start!126218 (=> (not res!1004833) (not e!829557))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126218 (= res!1004833 (validMask!0 mask!2687))))

(assert (=> start!126218 e!829557))

(assert (=> start!126218 true))

(declare-fun array_inv!36969 (array!99324) Bool)

(assert (=> start!126218 (array_inv!36969 a!2862)))

(declare-fun b!1478881 () Bool)

(assert (=> b!1478881 (= e!829562 (not true))))

(assert (=> b!1478881 e!829564))

(declare-fun res!1004836 () Bool)

(assert (=> b!1478881 (=> (not res!1004836) (not e!829564))))

(assert (=> b!1478881 (= res!1004836 (and (= lt!645824 (Found!12181 j!93)) (or (= (select (arr!47941 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47941 a!2862) intermediateBeforeIndex!19) (select (arr!47941 a!2862) j!93)))))))

(assert (=> b!1478881 (= lt!645824 (seekEntryOrOpen!0 (select (arr!47941 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1478881 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49702 0))(
  ( (Unit!49703) )
))
(declare-fun lt!645827 () Unit!49702)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99324 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49702)

(assert (=> b!1478881 (= lt!645827 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478882 () Bool)

(assert (=> b!1478882 (= e!829565 e!829562)))

(declare-fun res!1004835 () Bool)

(assert (=> b!1478882 (=> (not res!1004835) (not e!829562))))

(assert (=> b!1478882 (= res!1004835 (= lt!645826 (Intermediate!12181 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1478882 (= lt!645826 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645828 mask!2687) lt!645828 lt!645825 mask!2687))))

(assert (=> b!1478882 (= lt!645828 (select (store (arr!47941 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478883 () Bool)

(declare-fun res!1004838 () Bool)

(assert (=> b!1478883 (=> (not res!1004838) (not e!829557))))

(declare-datatypes ((List!34442 0))(
  ( (Nil!34439) (Cons!34438 (h!35806 (_ BitVec 64)) (t!49136 List!34442)) )
))
(declare-fun arrayNoDuplicates!0 (array!99324 (_ BitVec 32) List!34442) Bool)

(assert (=> b!1478883 (= res!1004838 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34439))))

(assert (= (and start!126218 res!1004833) b!1478869))

(assert (= (and b!1478869 res!1004845) b!1478872))

(assert (= (and b!1478872 res!1004839) b!1478878))

(assert (= (and b!1478878 res!1004847) b!1478867))

(assert (= (and b!1478867 res!1004837) b!1478883))

(assert (= (and b!1478883 res!1004838) b!1478880))

(assert (= (and b!1478880 res!1004840) b!1478879))

(assert (= (and b!1478879 res!1004834) b!1478868))

(assert (= (and b!1478868 res!1004843) b!1478870))

(assert (= (and b!1478870 res!1004846) b!1478882))

(assert (= (and b!1478882 res!1004835) b!1478874))

(assert (= (and b!1478874 c!136536) b!1478866))

(assert (= (and b!1478874 (not c!136536)) b!1478876))

(assert (= (and b!1478874 res!1004844) b!1478877))

(assert (= (and b!1478877 res!1004841) b!1478881))

(assert (= (and b!1478881 res!1004836) b!1478871))

(assert (= (and b!1478871 (not res!1004842)) b!1478873))

(assert (= (and b!1478873 res!1004848) b!1478875))

(declare-fun m!1364763 () Bool)

(assert (=> b!1478878 m!1364763))

(assert (=> b!1478878 m!1364763))

(declare-fun m!1364765 () Bool)

(assert (=> b!1478878 m!1364765))

(declare-fun m!1364767 () Bool)

(assert (=> b!1478866 m!1364767))

(assert (=> b!1478870 m!1364763))

(assert (=> b!1478870 m!1364763))

(declare-fun m!1364769 () Bool)

(assert (=> b!1478870 m!1364769))

(assert (=> b!1478868 m!1364763))

(assert (=> b!1478868 m!1364763))

(declare-fun m!1364771 () Bool)

(assert (=> b!1478868 m!1364771))

(assert (=> b!1478868 m!1364771))

(assert (=> b!1478868 m!1364763))

(declare-fun m!1364773 () Bool)

(assert (=> b!1478868 m!1364773))

(declare-fun m!1364775 () Bool)

(assert (=> b!1478876 m!1364775))

(declare-fun m!1364777 () Bool)

(assert (=> b!1478876 m!1364777))

(declare-fun m!1364779 () Bool)

(assert (=> b!1478871 m!1364779))

(declare-fun m!1364781 () Bool)

(assert (=> b!1478871 m!1364781))

(declare-fun m!1364783 () Bool)

(assert (=> b!1478871 m!1364783))

(assert (=> b!1478871 m!1364763))

(assert (=> b!1478879 m!1364781))

(declare-fun m!1364785 () Bool)

(assert (=> b!1478879 m!1364785))

(declare-fun m!1364787 () Bool)

(assert (=> start!126218 m!1364787))

(declare-fun m!1364789 () Bool)

(assert (=> start!126218 m!1364789))

(declare-fun m!1364791 () Bool)

(assert (=> b!1478867 m!1364791))

(declare-fun m!1364793 () Bool)

(assert (=> b!1478882 m!1364793))

(assert (=> b!1478882 m!1364793))

(declare-fun m!1364795 () Bool)

(assert (=> b!1478882 m!1364795))

(assert (=> b!1478882 m!1364781))

(declare-fun m!1364797 () Bool)

(assert (=> b!1478882 m!1364797))

(declare-fun m!1364799 () Bool)

(assert (=> b!1478883 m!1364799))

(declare-fun m!1364801 () Bool)

(assert (=> b!1478881 m!1364801))

(declare-fun m!1364803 () Bool)

(assert (=> b!1478881 m!1364803))

(assert (=> b!1478881 m!1364763))

(declare-fun m!1364805 () Bool)

(assert (=> b!1478881 m!1364805))

(declare-fun m!1364807 () Bool)

(assert (=> b!1478881 m!1364807))

(assert (=> b!1478881 m!1364763))

(assert (=> b!1478873 m!1364763))

(assert (=> b!1478873 m!1364763))

(declare-fun m!1364809 () Bool)

(assert (=> b!1478873 m!1364809))

(declare-fun m!1364811 () Bool)

(assert (=> b!1478872 m!1364811))

(assert (=> b!1478872 m!1364811))

(declare-fun m!1364813 () Bool)

(assert (=> b!1478872 m!1364813))

(push 1)

