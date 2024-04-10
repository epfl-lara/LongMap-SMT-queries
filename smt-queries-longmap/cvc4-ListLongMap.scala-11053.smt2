; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129154 () Bool)

(assert start!129154)

(declare-fun b!1515821 () Bool)

(declare-fun e!845891 () Bool)

(declare-fun e!845890 () Bool)

(assert (=> b!1515821 (= e!845891 e!845890)))

(declare-fun res!1035727 () Bool)

(assert (=> b!1515821 (=> res!1035727 e!845890)))

(declare-datatypes ((SeekEntryResult!12913 0))(
  ( (MissingZero!12913 (index!54047 (_ BitVec 32))) (Found!12913 (index!54048 (_ BitVec 32))) (Intermediate!12913 (undefined!13725 Bool) (index!54049 (_ BitVec 32)) (x!135743 (_ BitVec 32))) (Undefined!12913) (MissingVacant!12913 (index!54050 (_ BitVec 32))) )
))
(declare-fun lt!657163 () SeekEntryResult!12913)

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1515821 (= res!1035727 (not (= lt!657163 (Found!12913 j!70))))))

(declare-fun lt!657160 () SeekEntryResult!12913)

(declare-fun lt!657162 () SeekEntryResult!12913)

(assert (=> b!1515821 (= lt!657160 lt!657162)))

(declare-fun lt!657161 () (_ BitVec 64))

(declare-datatypes ((array!101010 0))(
  ( (array!101011 (arr!48742 (Array (_ BitVec 32) (_ BitVec 64))) (size!49292 (_ BitVec 32))) )
))
(declare-fun lt!657169 () array!101010)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101010 (_ BitVec 32)) SeekEntryResult!12913)

(assert (=> b!1515821 (= lt!657162 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!657161 lt!657169 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101010 (_ BitVec 32)) SeekEntryResult!12913)

(assert (=> b!1515821 (= lt!657160 (seekEntryOrOpen!0 lt!657161 lt!657169 mask!2512))))

(declare-fun lt!657165 () SeekEntryResult!12913)

(assert (=> b!1515821 (= lt!657165 lt!657163)))

(declare-fun a!2804 () array!101010)

(assert (=> b!1515821 (= lt!657163 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48742 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515821 (= lt!657165 (seekEntryOrOpen!0 (select (arr!48742 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515822 () Bool)

(declare-fun e!845896 () Bool)

(assert (=> b!1515822 (= e!845896 (not e!845891))))

(declare-fun res!1035731 () Bool)

(assert (=> b!1515822 (=> res!1035731 e!845891)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1515822 (= res!1035731 (or (not (= (select (arr!48742 a!2804) j!70) lt!657161)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48742 a!2804) index!487) (select (arr!48742 a!2804) j!70)) (not (= (select (arr!48742 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!845892 () Bool)

(assert (=> b!1515822 e!845892))

(declare-fun res!1035730 () Bool)

(assert (=> b!1515822 (=> (not res!1035730) (not e!845892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101010 (_ BitVec 32)) Bool)

(assert (=> b!1515822 (= res!1035730 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50694 0))(
  ( (Unit!50695) )
))
(declare-fun lt!657164 () Unit!50694)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101010 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50694)

(assert (=> b!1515822 (= lt!657164 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515823 () Bool)

(declare-fun res!1035735 () Bool)

(declare-fun e!845893 () Bool)

(assert (=> b!1515823 (=> (not res!1035735) (not e!845893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515823 (= res!1035735 (validKeyInArray!0 (select (arr!48742 a!2804) j!70)))))

(declare-fun b!1515824 () Bool)

(declare-fun res!1035725 () Bool)

(assert (=> b!1515824 (=> (not res!1035725) (not e!845893))))

(assert (=> b!1515824 (= res!1035725 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49292 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49292 a!2804))))))

(declare-fun b!1515825 () Bool)

(declare-fun res!1035732 () Bool)

(assert (=> b!1515825 (=> (not res!1035732) (not e!845893))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515825 (= res!1035732 (validKeyInArray!0 (select (arr!48742 a!2804) i!961)))))

(declare-fun b!1515826 () Bool)

(declare-fun res!1035724 () Bool)

(assert (=> b!1515826 (=> (not res!1035724) (not e!845893))))

(assert (=> b!1515826 (= res!1035724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1035733 () Bool)

(assert (=> start!129154 (=> (not res!1035733) (not e!845893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129154 (= res!1035733 (validMask!0 mask!2512))))

(assert (=> start!129154 e!845893))

(assert (=> start!129154 true))

(declare-fun array_inv!37770 (array!101010) Bool)

(assert (=> start!129154 (array_inv!37770 a!2804)))

(declare-fun b!1515827 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101010 (_ BitVec 32)) SeekEntryResult!12913)

(assert (=> b!1515827 (= e!845892 (= (seekEntry!0 (select (arr!48742 a!2804) j!70) a!2804 mask!2512) (Found!12913 j!70)))))

(declare-fun b!1515828 () Bool)

(declare-fun res!1035726 () Bool)

(assert (=> b!1515828 (=> (not res!1035726) (not e!845893))))

(assert (=> b!1515828 (= res!1035726 (and (= (size!49292 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49292 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49292 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515829 () Bool)

(declare-fun res!1035736 () Bool)

(declare-fun e!845895 () Bool)

(assert (=> b!1515829 (=> (not res!1035736) (not e!845895))))

(declare-fun lt!657166 () SeekEntryResult!12913)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101010 (_ BitVec 32)) SeekEntryResult!12913)

(assert (=> b!1515829 (= res!1035736 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48742 a!2804) j!70) a!2804 mask!2512) lt!657166))))

(declare-fun b!1515830 () Bool)

(assert (=> b!1515830 (= e!845890 true)))

(assert (=> b!1515830 (= lt!657162 lt!657163)))

(declare-fun lt!657168 () Unit!50694)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101010 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50694)

(assert (=> b!1515830 (= lt!657168 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1515831 () Bool)

(assert (=> b!1515831 (= e!845895 e!845896)))

(declare-fun res!1035729 () Bool)

(assert (=> b!1515831 (=> (not res!1035729) (not e!845896))))

(declare-fun lt!657167 () SeekEntryResult!12913)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515831 (= res!1035729 (= lt!657167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657161 mask!2512) lt!657161 lt!657169 mask!2512)))))

(assert (=> b!1515831 (= lt!657161 (select (store (arr!48742 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515831 (= lt!657169 (array!101011 (store (arr!48742 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49292 a!2804)))))

(declare-fun b!1515832 () Bool)

(assert (=> b!1515832 (= e!845893 e!845895)))

(declare-fun res!1035734 () Bool)

(assert (=> b!1515832 (=> (not res!1035734) (not e!845895))))

(assert (=> b!1515832 (= res!1035734 (= lt!657167 lt!657166))))

(assert (=> b!1515832 (= lt!657166 (Intermediate!12913 false resIndex!21 resX!21))))

(assert (=> b!1515832 (= lt!657167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48742 a!2804) j!70) mask!2512) (select (arr!48742 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515833 () Bool)

(declare-fun res!1035728 () Bool)

(assert (=> b!1515833 (=> (not res!1035728) (not e!845893))))

(declare-datatypes ((List!35225 0))(
  ( (Nil!35222) (Cons!35221 (h!36633 (_ BitVec 64)) (t!49919 List!35225)) )
))
(declare-fun arrayNoDuplicates!0 (array!101010 (_ BitVec 32) List!35225) Bool)

(assert (=> b!1515833 (= res!1035728 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35222))))

(assert (= (and start!129154 res!1035733) b!1515828))

(assert (= (and b!1515828 res!1035726) b!1515825))

(assert (= (and b!1515825 res!1035732) b!1515823))

(assert (= (and b!1515823 res!1035735) b!1515826))

(assert (= (and b!1515826 res!1035724) b!1515833))

(assert (= (and b!1515833 res!1035728) b!1515824))

(assert (= (and b!1515824 res!1035725) b!1515832))

(assert (= (and b!1515832 res!1035734) b!1515829))

(assert (= (and b!1515829 res!1035736) b!1515831))

(assert (= (and b!1515831 res!1035729) b!1515822))

(assert (= (and b!1515822 res!1035730) b!1515827))

(assert (= (and b!1515822 (not res!1035731)) b!1515821))

(assert (= (and b!1515821 (not res!1035727)) b!1515830))

(declare-fun m!1399015 () Bool)

(assert (=> b!1515826 m!1399015))

(declare-fun m!1399017 () Bool)

(assert (=> start!129154 m!1399017))

(declare-fun m!1399019 () Bool)

(assert (=> start!129154 m!1399019))

(declare-fun m!1399021 () Bool)

(assert (=> b!1515832 m!1399021))

(assert (=> b!1515832 m!1399021))

(declare-fun m!1399023 () Bool)

(assert (=> b!1515832 m!1399023))

(assert (=> b!1515832 m!1399023))

(assert (=> b!1515832 m!1399021))

(declare-fun m!1399025 () Bool)

(assert (=> b!1515832 m!1399025))

(assert (=> b!1515822 m!1399021))

(declare-fun m!1399027 () Bool)

(assert (=> b!1515822 m!1399027))

(declare-fun m!1399029 () Bool)

(assert (=> b!1515822 m!1399029))

(declare-fun m!1399031 () Bool)

(assert (=> b!1515822 m!1399031))

(declare-fun m!1399033 () Bool)

(assert (=> b!1515830 m!1399033))

(assert (=> b!1515827 m!1399021))

(assert (=> b!1515827 m!1399021))

(declare-fun m!1399035 () Bool)

(assert (=> b!1515827 m!1399035))

(declare-fun m!1399037 () Bool)

(assert (=> b!1515821 m!1399037))

(assert (=> b!1515821 m!1399021))

(assert (=> b!1515821 m!1399021))

(declare-fun m!1399039 () Bool)

(assert (=> b!1515821 m!1399039))

(declare-fun m!1399041 () Bool)

(assert (=> b!1515821 m!1399041))

(assert (=> b!1515821 m!1399021))

(declare-fun m!1399043 () Bool)

(assert (=> b!1515821 m!1399043))

(declare-fun m!1399045 () Bool)

(assert (=> b!1515831 m!1399045))

(assert (=> b!1515831 m!1399045))

(declare-fun m!1399047 () Bool)

(assert (=> b!1515831 m!1399047))

(declare-fun m!1399049 () Bool)

(assert (=> b!1515831 m!1399049))

(declare-fun m!1399051 () Bool)

(assert (=> b!1515831 m!1399051))

(assert (=> b!1515829 m!1399021))

(assert (=> b!1515829 m!1399021))

(declare-fun m!1399053 () Bool)

(assert (=> b!1515829 m!1399053))

(assert (=> b!1515823 m!1399021))

(assert (=> b!1515823 m!1399021))

(declare-fun m!1399055 () Bool)

(assert (=> b!1515823 m!1399055))

(declare-fun m!1399057 () Bool)

(assert (=> b!1515825 m!1399057))

(assert (=> b!1515825 m!1399057))

(declare-fun m!1399059 () Bool)

(assert (=> b!1515825 m!1399059))

(declare-fun m!1399061 () Bool)

(assert (=> b!1515833 m!1399061))

(push 1)

