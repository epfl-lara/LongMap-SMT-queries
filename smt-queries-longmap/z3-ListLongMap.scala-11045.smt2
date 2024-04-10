; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129104 () Bool)

(assert start!129104)

(declare-fun b!1514833 () Bool)

(declare-fun res!1034741 () Bool)

(declare-fun e!845366 () Bool)

(assert (=> b!1514833 (=> (not res!1034741) (not e!845366))))

(declare-datatypes ((array!100960 0))(
  ( (array!100961 (arr!48717 (Array (_ BitVec 32) (_ BitVec 64))) (size!49267 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100960)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100960 (_ BitVec 32)) Bool)

(assert (=> b!1514833 (= res!1034741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514834 () Bool)

(declare-fun e!845369 () Bool)

(assert (=> b!1514834 (= e!845366 e!845369)))

(declare-fun res!1034740 () Bool)

(assert (=> b!1514834 (=> (not res!1034740) (not e!845369))))

(declare-datatypes ((SeekEntryResult!12888 0))(
  ( (MissingZero!12888 (index!53947 (_ BitVec 32))) (Found!12888 (index!53948 (_ BitVec 32))) (Intermediate!12888 (undefined!13700 Bool) (index!53949 (_ BitVec 32)) (x!135654 (_ BitVec 32))) (Undefined!12888) (MissingVacant!12888 (index!53950 (_ BitVec 32))) )
))
(declare-fun lt!656475 () SeekEntryResult!12888)

(declare-fun lt!656476 () SeekEntryResult!12888)

(assert (=> b!1514834 (= res!1034740 (= lt!656475 lt!656476))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1514834 (= lt!656476 (Intermediate!12888 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100960 (_ BitVec 32)) SeekEntryResult!12888)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514834 (= lt!656475 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48717 a!2804) j!70) mask!2512) (select (arr!48717 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514835 () Bool)

(declare-fun e!845365 () Bool)

(declare-fun e!845370 () Bool)

(assert (=> b!1514835 (= e!845365 e!845370)))

(declare-fun res!1034736 () Bool)

(assert (=> b!1514835 (=> (not res!1034736) (not e!845370))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100960 (_ BitVec 32)) SeekEntryResult!12888)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100960 (_ BitVec 32)) SeekEntryResult!12888)

(assert (=> b!1514835 (= res!1034736 (= (seekEntryOrOpen!0 (select (arr!48717 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48717 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514836 () Bool)

(declare-fun res!1034748 () Bool)

(assert (=> b!1514836 (=> (not res!1034748) (not e!845369))))

(assert (=> b!1514836 (= res!1034748 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48717 a!2804) j!70) a!2804 mask!2512) lt!656476))))

(declare-fun b!1514837 () Bool)

(declare-fun res!1034738 () Bool)

(assert (=> b!1514837 (=> (not res!1034738) (not e!845366))))

(declare-datatypes ((List!35200 0))(
  ( (Nil!35197) (Cons!35196 (h!36608 (_ BitVec 64)) (t!49894 List!35200)) )
))
(declare-fun arrayNoDuplicates!0 (array!100960 (_ BitVec 32) List!35200) Bool)

(assert (=> b!1514837 (= res!1034738 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35197))))

(declare-fun b!1514838 () Bool)

(declare-fun res!1034746 () Bool)

(declare-fun e!845368 () Bool)

(assert (=> b!1514838 (=> (not res!1034746) (not e!845368))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100960 (_ BitVec 32)) SeekEntryResult!12888)

(assert (=> b!1514838 (= res!1034746 (= (seekEntry!0 (select (arr!48717 a!2804) j!70) a!2804 mask!2512) (Found!12888 j!70)))))

(declare-fun b!1514840 () Bool)

(declare-fun res!1034737 () Bool)

(assert (=> b!1514840 (=> (not res!1034737) (not e!845366))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514840 (= res!1034737 (validKeyInArray!0 (select (arr!48717 a!2804) j!70)))))

(declare-fun b!1514841 () Bool)

(assert (=> b!1514841 (= e!845368 e!845365)))

(declare-fun res!1034747 () Bool)

(assert (=> b!1514841 (=> res!1034747 e!845365)))

(declare-fun lt!656477 () (_ BitVec 64))

(assert (=> b!1514841 (= res!1034747 (or (not (= (select (arr!48717 a!2804) j!70) lt!656477)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48717 a!2804) index!487) (select (arr!48717 a!2804) j!70)) (not (= (select (arr!48717 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514842 () Bool)

(declare-fun lt!656479 () array!100960)

(assert (=> b!1514842 (= e!845370 (= (seekEntryOrOpen!0 lt!656477 lt!656479 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656477 lt!656479 mask!2512)))))

(declare-fun b!1514843 () Bool)

(declare-fun e!845367 () Bool)

(assert (=> b!1514843 (= e!845369 e!845367)))

(declare-fun res!1034743 () Bool)

(assert (=> b!1514843 (=> (not res!1034743) (not e!845367))))

(assert (=> b!1514843 (= res!1034743 (= lt!656475 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656477 mask!2512) lt!656477 lt!656479 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1514843 (= lt!656477 (select (store (arr!48717 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514843 (= lt!656479 (array!100961 (store (arr!48717 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49267 a!2804)))))

(declare-fun b!1514844 () Bool)

(assert (=> b!1514844 (= e!845367 (not true))))

(assert (=> b!1514844 e!845368))

(declare-fun res!1034745 () Bool)

(assert (=> b!1514844 (=> (not res!1034745) (not e!845368))))

(assert (=> b!1514844 (= res!1034745 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50644 0))(
  ( (Unit!50645) )
))
(declare-fun lt!656478 () Unit!50644)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50644)

(assert (=> b!1514844 (= lt!656478 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514845 () Bool)

(declare-fun res!1034739 () Bool)

(assert (=> b!1514845 (=> (not res!1034739) (not e!845366))))

(assert (=> b!1514845 (= res!1034739 (and (= (size!49267 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49267 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49267 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514846 () Bool)

(declare-fun res!1034742 () Bool)

(assert (=> b!1514846 (=> (not res!1034742) (not e!845366))))

(assert (=> b!1514846 (= res!1034742 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49267 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49267 a!2804))))))

(declare-fun b!1514839 () Bool)

(declare-fun res!1034744 () Bool)

(assert (=> b!1514839 (=> (not res!1034744) (not e!845366))))

(assert (=> b!1514839 (= res!1034744 (validKeyInArray!0 (select (arr!48717 a!2804) i!961)))))

(declare-fun res!1034749 () Bool)

(assert (=> start!129104 (=> (not res!1034749) (not e!845366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129104 (= res!1034749 (validMask!0 mask!2512))))

(assert (=> start!129104 e!845366))

(assert (=> start!129104 true))

(declare-fun array_inv!37745 (array!100960) Bool)

(assert (=> start!129104 (array_inv!37745 a!2804)))

(assert (= (and start!129104 res!1034749) b!1514845))

(assert (= (and b!1514845 res!1034739) b!1514839))

(assert (= (and b!1514839 res!1034744) b!1514840))

(assert (= (and b!1514840 res!1034737) b!1514833))

(assert (= (and b!1514833 res!1034741) b!1514837))

(assert (= (and b!1514837 res!1034738) b!1514846))

(assert (= (and b!1514846 res!1034742) b!1514834))

(assert (= (and b!1514834 res!1034740) b!1514836))

(assert (= (and b!1514836 res!1034748) b!1514843))

(assert (= (and b!1514843 res!1034743) b!1514844))

(assert (= (and b!1514844 res!1034745) b!1514838))

(assert (= (and b!1514838 res!1034746) b!1514841))

(assert (= (and b!1514841 (not res!1034747)) b!1514835))

(assert (= (and b!1514835 res!1034736) b!1514842))

(declare-fun m!1397825 () Bool)

(assert (=> b!1514836 m!1397825))

(assert (=> b!1514836 m!1397825))

(declare-fun m!1397827 () Bool)

(assert (=> b!1514836 m!1397827))

(declare-fun m!1397829 () Bool)

(assert (=> start!129104 m!1397829))

(declare-fun m!1397831 () Bool)

(assert (=> start!129104 m!1397831))

(assert (=> b!1514841 m!1397825))

(declare-fun m!1397833 () Bool)

(assert (=> b!1514841 m!1397833))

(assert (=> b!1514834 m!1397825))

(assert (=> b!1514834 m!1397825))

(declare-fun m!1397835 () Bool)

(assert (=> b!1514834 m!1397835))

(assert (=> b!1514834 m!1397835))

(assert (=> b!1514834 m!1397825))

(declare-fun m!1397837 () Bool)

(assert (=> b!1514834 m!1397837))

(assert (=> b!1514835 m!1397825))

(assert (=> b!1514835 m!1397825))

(declare-fun m!1397839 () Bool)

(assert (=> b!1514835 m!1397839))

(assert (=> b!1514835 m!1397825))

(declare-fun m!1397841 () Bool)

(assert (=> b!1514835 m!1397841))

(declare-fun m!1397843 () Bool)

(assert (=> b!1514837 m!1397843))

(declare-fun m!1397845 () Bool)

(assert (=> b!1514842 m!1397845))

(declare-fun m!1397847 () Bool)

(assert (=> b!1514842 m!1397847))

(declare-fun m!1397849 () Bool)

(assert (=> b!1514833 m!1397849))

(declare-fun m!1397851 () Bool)

(assert (=> b!1514843 m!1397851))

(assert (=> b!1514843 m!1397851))

(declare-fun m!1397853 () Bool)

(assert (=> b!1514843 m!1397853))

(declare-fun m!1397855 () Bool)

(assert (=> b!1514843 m!1397855))

(declare-fun m!1397857 () Bool)

(assert (=> b!1514843 m!1397857))

(assert (=> b!1514840 m!1397825))

(assert (=> b!1514840 m!1397825))

(declare-fun m!1397859 () Bool)

(assert (=> b!1514840 m!1397859))

(declare-fun m!1397861 () Bool)

(assert (=> b!1514839 m!1397861))

(assert (=> b!1514839 m!1397861))

(declare-fun m!1397863 () Bool)

(assert (=> b!1514839 m!1397863))

(assert (=> b!1514838 m!1397825))

(assert (=> b!1514838 m!1397825))

(declare-fun m!1397865 () Bool)

(assert (=> b!1514838 m!1397865))

(declare-fun m!1397867 () Bool)

(assert (=> b!1514844 m!1397867))

(declare-fun m!1397869 () Bool)

(assert (=> b!1514844 m!1397869))

(check-sat (not b!1514836) (not b!1514840) (not b!1514835) (not b!1514837) (not b!1514844) (not b!1514839) (not b!1514838) (not start!129104) (not b!1514842) (not b!1514834) (not b!1514843) (not b!1514833))
(check-sat)
