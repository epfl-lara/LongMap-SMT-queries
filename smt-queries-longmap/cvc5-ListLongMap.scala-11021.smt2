; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128958 () Bool)

(assert start!128958)

(declare-fun b!1511837 () Bool)

(declare-fun res!1031740 () Bool)

(declare-fun e!843975 () Bool)

(assert (=> b!1511837 (=> (not res!1031740) (not e!843975))))

(declare-datatypes ((array!100814 0))(
  ( (array!100815 (arr!48644 (Array (_ BitVec 32) (_ BitVec 64))) (size!49194 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100814)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100814 (_ BitVec 32)) Bool)

(assert (=> b!1511837 (= res!1031740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511838 () Bool)

(declare-fun res!1031742 () Bool)

(assert (=> b!1511838 (=> (not res!1031742) (not e!843975))))

(declare-datatypes ((List!35127 0))(
  ( (Nil!35124) (Cons!35123 (h!36535 (_ BitVec 64)) (t!49821 List!35127)) )
))
(declare-fun arrayNoDuplicates!0 (array!100814 (_ BitVec 32) List!35127) Bool)

(assert (=> b!1511838 (= res!1031742 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35124))))

(declare-fun b!1511839 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun e!843972 () Bool)

(declare-datatypes ((SeekEntryResult!12815 0))(
  ( (MissingZero!12815 (index!53655 (_ BitVec 32))) (Found!12815 (index!53656 (_ BitVec 32))) (Intermediate!12815 (undefined!13627 Bool) (index!53657 (_ BitVec 32)) (x!135389 (_ BitVec 32))) (Undefined!12815) (MissingVacant!12815 (index!53658 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100814 (_ BitVec 32)) SeekEntryResult!12815)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100814 (_ BitVec 32)) SeekEntryResult!12815)

(assert (=> b!1511839 (= e!843972 (= (seekEntryOrOpen!0 (select (arr!48644 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48644 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1511840 () Bool)

(declare-fun e!843976 () Bool)

(assert (=> b!1511840 (= e!843976 e!843972)))

(declare-fun res!1031745 () Bool)

(assert (=> b!1511840 (=> res!1031745 e!843972)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511840 (= res!1031745 (or (not (= (select (arr!48644 a!2804) j!70) (select (store (arr!48644 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48644 a!2804) index!487) (select (arr!48644 a!2804) j!70)) (not (= (select (arr!48644 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1511841 () Bool)

(declare-fun res!1031751 () Bool)

(assert (=> b!1511841 (=> (not res!1031751) (not e!843975))))

(assert (=> b!1511841 (= res!1031751 (and (= (size!49194 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49194 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49194 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511842 () Bool)

(declare-fun res!1031747 () Bool)

(assert (=> b!1511842 (=> (not res!1031747) (not e!843975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511842 (= res!1031747 (validKeyInArray!0 (select (arr!48644 a!2804) i!961)))))

(declare-fun b!1511844 () Bool)

(declare-fun e!843974 () Bool)

(assert (=> b!1511844 (= e!843974 (not true))))

(assert (=> b!1511844 e!843976))

(declare-fun res!1031743 () Bool)

(assert (=> b!1511844 (=> (not res!1031743) (not e!843976))))

(assert (=> b!1511844 (= res!1031743 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50498 0))(
  ( (Unit!50499) )
))
(declare-fun lt!655540 () Unit!50498)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100814 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50498)

(assert (=> b!1511844 (= lt!655540 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511845 () Bool)

(declare-fun res!1031752 () Bool)

(assert (=> b!1511845 (=> (not res!1031752) (not e!843974))))

(declare-fun lt!655539 () SeekEntryResult!12815)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100814 (_ BitVec 32)) SeekEntryResult!12815)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511845 (= res!1031752 (= lt!655539 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48644 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48644 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100815 (store (arr!48644 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49194 a!2804)) mask!2512)))))

(declare-fun res!1031746 () Bool)

(assert (=> start!128958 (=> (not res!1031746) (not e!843975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128958 (= res!1031746 (validMask!0 mask!2512))))

(assert (=> start!128958 e!843975))

(assert (=> start!128958 true))

(declare-fun array_inv!37672 (array!100814) Bool)

(assert (=> start!128958 (array_inv!37672 a!2804)))

(declare-fun b!1511843 () Bool)

(declare-fun res!1031744 () Bool)

(assert (=> b!1511843 (=> (not res!1031744) (not e!843974))))

(declare-fun lt!655538 () SeekEntryResult!12815)

(assert (=> b!1511843 (= res!1031744 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48644 a!2804) j!70) a!2804 mask!2512) lt!655538))))

(declare-fun b!1511846 () Bool)

(declare-fun res!1031749 () Bool)

(assert (=> b!1511846 (=> (not res!1031749) (not e!843975))))

(assert (=> b!1511846 (= res!1031749 (validKeyInArray!0 (select (arr!48644 a!2804) j!70)))))

(declare-fun b!1511847 () Bool)

(declare-fun res!1031741 () Bool)

(assert (=> b!1511847 (=> (not res!1031741) (not e!843975))))

(assert (=> b!1511847 (= res!1031741 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49194 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49194 a!2804))))))

(declare-fun b!1511848 () Bool)

(assert (=> b!1511848 (= e!843975 e!843974)))

(declare-fun res!1031750 () Bool)

(assert (=> b!1511848 (=> (not res!1031750) (not e!843974))))

(assert (=> b!1511848 (= res!1031750 (= lt!655539 lt!655538))))

(assert (=> b!1511848 (= lt!655538 (Intermediate!12815 false resIndex!21 resX!21))))

(assert (=> b!1511848 (= lt!655539 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48644 a!2804) j!70) mask!2512) (select (arr!48644 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511849 () Bool)

(declare-fun res!1031748 () Bool)

(assert (=> b!1511849 (=> (not res!1031748) (not e!843976))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100814 (_ BitVec 32)) SeekEntryResult!12815)

(assert (=> b!1511849 (= res!1031748 (= (seekEntry!0 (select (arr!48644 a!2804) j!70) a!2804 mask!2512) (Found!12815 j!70)))))

(assert (= (and start!128958 res!1031746) b!1511841))

(assert (= (and b!1511841 res!1031751) b!1511842))

(assert (= (and b!1511842 res!1031747) b!1511846))

(assert (= (and b!1511846 res!1031749) b!1511837))

(assert (= (and b!1511837 res!1031740) b!1511838))

(assert (= (and b!1511838 res!1031742) b!1511847))

(assert (= (and b!1511847 res!1031741) b!1511848))

(assert (= (and b!1511848 res!1031750) b!1511843))

(assert (= (and b!1511843 res!1031744) b!1511845))

(assert (= (and b!1511845 res!1031752) b!1511844))

(assert (= (and b!1511844 res!1031743) b!1511849))

(assert (= (and b!1511849 res!1031748) b!1511840))

(assert (= (and b!1511840 (not res!1031745)) b!1511839))

(declare-fun m!1394563 () Bool)

(assert (=> b!1511846 m!1394563))

(assert (=> b!1511846 m!1394563))

(declare-fun m!1394565 () Bool)

(assert (=> b!1511846 m!1394565))

(declare-fun m!1394567 () Bool)

(assert (=> b!1511842 m!1394567))

(assert (=> b!1511842 m!1394567))

(declare-fun m!1394569 () Bool)

(assert (=> b!1511842 m!1394569))

(assert (=> b!1511849 m!1394563))

(assert (=> b!1511849 m!1394563))

(declare-fun m!1394571 () Bool)

(assert (=> b!1511849 m!1394571))

(assert (=> b!1511839 m!1394563))

(assert (=> b!1511839 m!1394563))

(declare-fun m!1394573 () Bool)

(assert (=> b!1511839 m!1394573))

(assert (=> b!1511839 m!1394563))

(declare-fun m!1394575 () Bool)

(assert (=> b!1511839 m!1394575))

(assert (=> b!1511848 m!1394563))

(assert (=> b!1511848 m!1394563))

(declare-fun m!1394577 () Bool)

(assert (=> b!1511848 m!1394577))

(assert (=> b!1511848 m!1394577))

(assert (=> b!1511848 m!1394563))

(declare-fun m!1394579 () Bool)

(assert (=> b!1511848 m!1394579))

(assert (=> b!1511840 m!1394563))

(declare-fun m!1394581 () Bool)

(assert (=> b!1511840 m!1394581))

(declare-fun m!1394583 () Bool)

(assert (=> b!1511840 m!1394583))

(declare-fun m!1394585 () Bool)

(assert (=> b!1511840 m!1394585))

(declare-fun m!1394587 () Bool)

(assert (=> start!128958 m!1394587))

(declare-fun m!1394589 () Bool)

(assert (=> start!128958 m!1394589))

(declare-fun m!1394591 () Bool)

(assert (=> b!1511838 m!1394591))

(assert (=> b!1511845 m!1394581))

(assert (=> b!1511845 m!1394583))

(assert (=> b!1511845 m!1394583))

(declare-fun m!1394593 () Bool)

(assert (=> b!1511845 m!1394593))

(assert (=> b!1511845 m!1394593))

(assert (=> b!1511845 m!1394583))

(declare-fun m!1394595 () Bool)

(assert (=> b!1511845 m!1394595))

(declare-fun m!1394597 () Bool)

(assert (=> b!1511837 m!1394597))

(declare-fun m!1394599 () Bool)

(assert (=> b!1511844 m!1394599))

(declare-fun m!1394601 () Bool)

(assert (=> b!1511844 m!1394601))

(assert (=> b!1511843 m!1394563))

(assert (=> b!1511843 m!1394563))

(declare-fun m!1394603 () Bool)

(assert (=> b!1511843 m!1394603))

(push 1)

