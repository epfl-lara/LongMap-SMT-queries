; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130240 () Bool)

(assert start!130240)

(declare-fun b!1528884 () Bool)

(declare-fun res!1046593 () Bool)

(declare-fun e!852102 () Bool)

(assert (=> b!1528884 (=> (not res!1046593) (not e!852102))))

(declare-datatypes ((array!101590 0))(
  ( (array!101591 (arr!49020 (Array (_ BitVec 32) (_ BitVec 64))) (size!49570 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101590)

(declare-datatypes ((List!35503 0))(
  ( (Nil!35500) (Cons!35499 (h!36935 (_ BitVec 64)) (t!50197 List!35503)) )
))
(declare-fun arrayNoDuplicates!0 (array!101590 (_ BitVec 32) List!35503) Bool)

(assert (=> b!1528884 (= res!1046593 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35500))))

(declare-fun b!1528885 () Bool)

(declare-fun res!1046602 () Bool)

(declare-fun e!852100 () Bool)

(assert (=> b!1528885 (=> (not res!1046602) (not e!852100))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13185 0))(
  ( (MissingZero!13185 (index!55135 (_ BitVec 32))) (Found!13185 (index!55136 (_ BitVec 32))) (Intermediate!13185 (undefined!13997 Bool) (index!55137 (_ BitVec 32)) (x!136824 (_ BitVec 32))) (Undefined!13185) (MissingVacant!13185 (index!55138 (_ BitVec 32))) )
))
(declare-fun lt!662251 () SeekEntryResult!13185)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101590 (_ BitVec 32)) SeekEntryResult!13185)

(assert (=> b!1528885 (= res!1046602 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49020 a!2804) j!70) a!2804 mask!2512) lt!662251))))

(declare-fun b!1528886 () Bool)

(declare-fun res!1046592 () Bool)

(assert (=> b!1528886 (=> (not res!1046592) (not e!852102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528886 (= res!1046592 (validKeyInArray!0 (select (arr!49020 a!2804) j!70)))))

(declare-fun b!1528887 () Bool)

(declare-fun e!852103 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101590 (_ BitVec 32)) SeekEntryResult!13185)

(assert (=> b!1528887 (= e!852103 (= (seekEntry!0 (select (arr!49020 a!2804) j!70) a!2804 mask!2512) (Found!13185 j!70)))))

(declare-fun res!1046594 () Bool)

(assert (=> start!130240 (=> (not res!1046594) (not e!852102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130240 (= res!1046594 (validMask!0 mask!2512))))

(assert (=> start!130240 e!852102))

(assert (=> start!130240 true))

(declare-fun array_inv!38048 (array!101590) Bool)

(assert (=> start!130240 (array_inv!38048 a!2804)))

(declare-fun b!1528888 () Bool)

(declare-fun res!1046597 () Bool)

(assert (=> b!1528888 (=> (not res!1046597) (not e!852102))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1528888 (= res!1046597 (validKeyInArray!0 (select (arr!49020 a!2804) i!961)))))

(declare-fun b!1528889 () Bool)

(assert (=> b!1528889 (= e!852102 e!852100)))

(declare-fun res!1046596 () Bool)

(assert (=> b!1528889 (=> (not res!1046596) (not e!852100))))

(declare-fun lt!662250 () SeekEntryResult!13185)

(assert (=> b!1528889 (= res!1046596 (= lt!662250 lt!662251))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1528889 (= lt!662251 (Intermediate!13185 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528889 (= lt!662250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49020 a!2804) j!70) mask!2512) (select (arr!49020 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528890 () Bool)

(declare-fun res!1046595 () Bool)

(assert (=> b!1528890 (=> (not res!1046595) (not e!852102))))

(assert (=> b!1528890 (= res!1046595 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49570 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49570 a!2804))))))

(declare-fun b!1528891 () Bool)

(declare-fun e!852101 () Bool)

(assert (=> b!1528891 (= e!852101 true)))

(declare-fun lt!662249 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528891 (= lt!662249 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1528892 () Bool)

(declare-fun res!1046601 () Bool)

(assert (=> b!1528892 (=> (not res!1046601) (not e!852102))))

(assert (=> b!1528892 (= res!1046601 (and (= (size!49570 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49570 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49570 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528893 () Bool)

(declare-fun res!1046600 () Bool)

(assert (=> b!1528893 (=> (not res!1046600) (not e!852100))))

(assert (=> b!1528893 (= res!1046600 (= lt!662250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49020 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49020 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101591 (store (arr!49020 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49570 a!2804)) mask!2512)))))

(declare-fun b!1528894 () Bool)

(assert (=> b!1528894 (= e!852100 (not e!852101))))

(declare-fun res!1046598 () Bool)

(assert (=> b!1528894 (=> res!1046598 e!852101)))

(assert (=> b!1528894 (= res!1046598 (or (not (= (select (arr!49020 a!2804) j!70) (select (store (arr!49020 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1528894 e!852103))

(declare-fun res!1046591 () Bool)

(assert (=> b!1528894 (=> (not res!1046591) (not e!852103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101590 (_ BitVec 32)) Bool)

(assert (=> b!1528894 (= res!1046591 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51154 0))(
  ( (Unit!51155) )
))
(declare-fun lt!662248 () Unit!51154)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101590 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51154)

(assert (=> b!1528894 (= lt!662248 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528895 () Bool)

(declare-fun res!1046599 () Bool)

(assert (=> b!1528895 (=> (not res!1046599) (not e!852102))))

(assert (=> b!1528895 (= res!1046599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!130240 res!1046594) b!1528892))

(assert (= (and b!1528892 res!1046601) b!1528888))

(assert (= (and b!1528888 res!1046597) b!1528886))

(assert (= (and b!1528886 res!1046592) b!1528895))

(assert (= (and b!1528895 res!1046599) b!1528884))

(assert (= (and b!1528884 res!1046593) b!1528890))

(assert (= (and b!1528890 res!1046595) b!1528889))

(assert (= (and b!1528889 res!1046596) b!1528885))

(assert (= (and b!1528885 res!1046602) b!1528893))

(assert (= (and b!1528893 res!1046600) b!1528894))

(assert (= (and b!1528894 res!1046591) b!1528887))

(assert (= (and b!1528894 (not res!1046598)) b!1528891))

(declare-fun m!1411799 () Bool)

(assert (=> b!1528889 m!1411799))

(assert (=> b!1528889 m!1411799))

(declare-fun m!1411801 () Bool)

(assert (=> b!1528889 m!1411801))

(assert (=> b!1528889 m!1411801))

(assert (=> b!1528889 m!1411799))

(declare-fun m!1411803 () Bool)

(assert (=> b!1528889 m!1411803))

(assert (=> b!1528885 m!1411799))

(assert (=> b!1528885 m!1411799))

(declare-fun m!1411805 () Bool)

(assert (=> b!1528885 m!1411805))

(declare-fun m!1411807 () Bool)

(assert (=> b!1528891 m!1411807))

(assert (=> b!1528887 m!1411799))

(assert (=> b!1528887 m!1411799))

(declare-fun m!1411809 () Bool)

(assert (=> b!1528887 m!1411809))

(declare-fun m!1411811 () Bool)

(assert (=> b!1528884 m!1411811))

(declare-fun m!1411813 () Bool)

(assert (=> b!1528893 m!1411813))

(declare-fun m!1411815 () Bool)

(assert (=> b!1528893 m!1411815))

(assert (=> b!1528893 m!1411815))

(declare-fun m!1411817 () Bool)

(assert (=> b!1528893 m!1411817))

(assert (=> b!1528893 m!1411817))

(assert (=> b!1528893 m!1411815))

(declare-fun m!1411819 () Bool)

(assert (=> b!1528893 m!1411819))

(declare-fun m!1411821 () Bool)

(assert (=> b!1528895 m!1411821))

(assert (=> b!1528886 m!1411799))

(assert (=> b!1528886 m!1411799))

(declare-fun m!1411823 () Bool)

(assert (=> b!1528886 m!1411823))

(declare-fun m!1411825 () Bool)

(assert (=> b!1528888 m!1411825))

(assert (=> b!1528888 m!1411825))

(declare-fun m!1411827 () Bool)

(assert (=> b!1528888 m!1411827))

(assert (=> b!1528894 m!1411799))

(declare-fun m!1411829 () Bool)

(assert (=> b!1528894 m!1411829))

(assert (=> b!1528894 m!1411813))

(assert (=> b!1528894 m!1411815))

(declare-fun m!1411831 () Bool)

(assert (=> b!1528894 m!1411831))

(declare-fun m!1411833 () Bool)

(assert (=> start!130240 m!1411833))

(declare-fun m!1411835 () Bool)

(assert (=> start!130240 m!1411835))

(check-sat (not b!1528885) (not b!1528887) (not b!1528888) (not start!130240) (not b!1528893) (not b!1528889) (not b!1528886) (not b!1528884) (not b!1528891) (not b!1528895) (not b!1528894))
(check-sat)
