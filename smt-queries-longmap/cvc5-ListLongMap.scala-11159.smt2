; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130436 () Bool)

(assert start!130436)

(declare-fun b!1530816 () Bool)

(declare-fun res!1048158 () Bool)

(declare-fun e!853017 () Bool)

(assert (=> b!1530816 (=> (not res!1048158) (not e!853017))))

(declare-datatypes ((array!101672 0))(
  ( (array!101673 (arr!49058 (Array (_ BitVec 32) (_ BitVec 64))) (size!49608 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101672)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530816 (= res!1048158 (validKeyInArray!0 (select (arr!49058 a!2804) i!961)))))

(declare-fun b!1530817 () Bool)

(declare-fun res!1048168 () Bool)

(declare-fun e!853018 () Bool)

(assert (=> b!1530817 (=> (not res!1048168) (not e!853018))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13223 0))(
  ( (MissingZero!13223 (index!55287 (_ BitVec 32))) (Found!13223 (index!55288 (_ BitVec 32))) (Intermediate!13223 (undefined!14035 Bool) (index!55289 (_ BitVec 32)) (x!136984 (_ BitVec 32))) (Undefined!13223) (MissingVacant!13223 (index!55290 (_ BitVec 32))) )
))
(declare-fun lt!662994 () SeekEntryResult!13223)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101672 (_ BitVec 32)) SeekEntryResult!13223)

(assert (=> b!1530817 (= res!1048168 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49058 a!2804) j!70) a!2804 mask!2512) lt!662994))))

(declare-fun b!1530818 () Bool)

(declare-fun res!1048166 () Bool)

(assert (=> b!1530818 (=> (not res!1048166) (not e!853018))))

(declare-fun lt!662992 () SeekEntryResult!13223)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530818 (= res!1048166 (= lt!662992 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49058 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49058 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101673 (store (arr!49058 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49608 a!2804)) mask!2512)))))

(declare-fun res!1048165 () Bool)

(assert (=> start!130436 (=> (not res!1048165) (not e!853017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130436 (= res!1048165 (validMask!0 mask!2512))))

(assert (=> start!130436 e!853017))

(assert (=> start!130436 true))

(declare-fun array_inv!38086 (array!101672) Bool)

(assert (=> start!130436 (array_inv!38086 a!2804)))

(declare-fun b!1530819 () Bool)

(declare-fun res!1048161 () Bool)

(assert (=> b!1530819 (=> (not res!1048161) (not e!853017))))

(declare-datatypes ((List!35541 0))(
  ( (Nil!35538) (Cons!35537 (h!36979 (_ BitVec 64)) (t!50235 List!35541)) )
))
(declare-fun arrayNoDuplicates!0 (array!101672 (_ BitVec 32) List!35541) Bool)

(assert (=> b!1530819 (= res!1048161 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35538))))

(declare-fun e!853019 () Bool)

(declare-fun b!1530820 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101672 (_ BitVec 32)) SeekEntryResult!13223)

(assert (=> b!1530820 (= e!853019 (= (seekEntry!0 (select (arr!49058 a!2804) j!70) a!2804 mask!2512) (Found!13223 j!70)))))

(declare-fun b!1530821 () Bool)

(declare-fun e!853021 () Bool)

(assert (=> b!1530821 (= e!853018 (not e!853021))))

(declare-fun res!1048162 () Bool)

(assert (=> b!1530821 (=> res!1048162 e!853021)))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1530821 (= res!1048162 (or (not (= (select (arr!49058 a!2804) j!70) (select (store (arr!49058 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1530821 e!853019))

(declare-fun res!1048167 () Bool)

(assert (=> b!1530821 (=> (not res!1048167) (not e!853019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101672 (_ BitVec 32)) Bool)

(assert (=> b!1530821 (= res!1048167 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51230 0))(
  ( (Unit!51231) )
))
(declare-fun lt!662993 () Unit!51230)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101672 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51230)

(assert (=> b!1530821 (= lt!662993 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1530822 () Bool)

(declare-fun res!1048163 () Bool)

(assert (=> b!1530822 (=> (not res!1048163) (not e!853017))))

(assert (=> b!1530822 (= res!1048163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1530823 () Bool)

(assert (=> b!1530823 (= e!853021 true)))

(declare-fun lt!662995 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530823 (= lt!662995 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1530824 () Bool)

(declare-fun res!1048160 () Bool)

(assert (=> b!1530824 (=> (not res!1048160) (not e!853017))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1530824 (= res!1048160 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49608 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49608 a!2804))))))

(declare-fun b!1530825 () Bool)

(declare-fun res!1048157 () Bool)

(assert (=> b!1530825 (=> (not res!1048157) (not e!853017))))

(assert (=> b!1530825 (= res!1048157 (validKeyInArray!0 (select (arr!49058 a!2804) j!70)))))

(declare-fun b!1530826 () Bool)

(declare-fun res!1048164 () Bool)

(assert (=> b!1530826 (=> (not res!1048164) (not e!853017))))

(assert (=> b!1530826 (= res!1048164 (and (= (size!49608 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49608 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49608 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1530827 () Bool)

(assert (=> b!1530827 (= e!853017 e!853018)))

(declare-fun res!1048159 () Bool)

(assert (=> b!1530827 (=> (not res!1048159) (not e!853018))))

(assert (=> b!1530827 (= res!1048159 (= lt!662992 lt!662994))))

(assert (=> b!1530827 (= lt!662994 (Intermediate!13223 false resIndex!21 resX!21))))

(assert (=> b!1530827 (= lt!662992 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49058 a!2804) j!70) mask!2512) (select (arr!49058 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!130436 res!1048165) b!1530826))

(assert (= (and b!1530826 res!1048164) b!1530816))

(assert (= (and b!1530816 res!1048158) b!1530825))

(assert (= (and b!1530825 res!1048157) b!1530822))

(assert (= (and b!1530822 res!1048163) b!1530819))

(assert (= (and b!1530819 res!1048161) b!1530824))

(assert (= (and b!1530824 res!1048160) b!1530827))

(assert (= (and b!1530827 res!1048159) b!1530817))

(assert (= (and b!1530817 res!1048168) b!1530818))

(assert (= (and b!1530818 res!1048166) b!1530821))

(assert (= (and b!1530821 res!1048167) b!1530820))

(assert (= (and b!1530821 (not res!1048162)) b!1530823))

(declare-fun m!1413579 () Bool)

(assert (=> b!1530820 m!1413579))

(assert (=> b!1530820 m!1413579))

(declare-fun m!1413581 () Bool)

(assert (=> b!1530820 m!1413581))

(assert (=> b!1530817 m!1413579))

(assert (=> b!1530817 m!1413579))

(declare-fun m!1413583 () Bool)

(assert (=> b!1530817 m!1413583))

(declare-fun m!1413585 () Bool)

(assert (=> b!1530822 m!1413585))

(declare-fun m!1413587 () Bool)

(assert (=> b!1530823 m!1413587))

(declare-fun m!1413589 () Bool)

(assert (=> b!1530816 m!1413589))

(assert (=> b!1530816 m!1413589))

(declare-fun m!1413591 () Bool)

(assert (=> b!1530816 m!1413591))

(assert (=> b!1530827 m!1413579))

(assert (=> b!1530827 m!1413579))

(declare-fun m!1413593 () Bool)

(assert (=> b!1530827 m!1413593))

(assert (=> b!1530827 m!1413593))

(assert (=> b!1530827 m!1413579))

(declare-fun m!1413595 () Bool)

(assert (=> b!1530827 m!1413595))

(assert (=> b!1530825 m!1413579))

(assert (=> b!1530825 m!1413579))

(declare-fun m!1413597 () Bool)

(assert (=> b!1530825 m!1413597))

(declare-fun m!1413599 () Bool)

(assert (=> b!1530818 m!1413599))

(declare-fun m!1413601 () Bool)

(assert (=> b!1530818 m!1413601))

(assert (=> b!1530818 m!1413601))

(declare-fun m!1413603 () Bool)

(assert (=> b!1530818 m!1413603))

(assert (=> b!1530818 m!1413603))

(assert (=> b!1530818 m!1413601))

(declare-fun m!1413605 () Bool)

(assert (=> b!1530818 m!1413605))

(declare-fun m!1413607 () Bool)

(assert (=> start!130436 m!1413607))

(declare-fun m!1413609 () Bool)

(assert (=> start!130436 m!1413609))

(declare-fun m!1413611 () Bool)

(assert (=> b!1530819 m!1413611))

(assert (=> b!1530821 m!1413579))

(declare-fun m!1413613 () Bool)

(assert (=> b!1530821 m!1413613))

(assert (=> b!1530821 m!1413599))

(assert (=> b!1530821 m!1413601))

(declare-fun m!1413615 () Bool)

(assert (=> b!1530821 m!1413615))

(push 1)

