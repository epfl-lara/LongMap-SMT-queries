; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129114 () Bool)

(assert start!129114)

(declare-fun b!1515041 () Bool)

(declare-fun e!845474 () Bool)

(declare-fun e!845473 () Bool)

(assert (=> b!1515041 (= e!845474 e!845473)))

(declare-fun res!1034953 () Bool)

(assert (=> b!1515041 (=> (not res!1034953) (not e!845473))))

(declare-fun lt!656561 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12893 0))(
  ( (MissingZero!12893 (index!53967 (_ BitVec 32))) (Found!12893 (index!53968 (_ BitVec 32))) (Intermediate!12893 (undefined!13705 Bool) (index!53969 (_ BitVec 32)) (x!135675 (_ BitVec 32))) (Undefined!12893) (MissingVacant!12893 (index!53970 (_ BitVec 32))) )
))
(declare-fun lt!656568 () SeekEntryResult!12893)

(declare-datatypes ((array!100970 0))(
  ( (array!100971 (arr!48722 (Array (_ BitVec 32) (_ BitVec 64))) (size!49272 (_ BitVec 32))) )
))
(declare-fun lt!656566 () array!100970)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100970 (_ BitVec 32)) SeekEntryResult!12893)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515041 (= res!1034953 (= lt!656568 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656561 mask!2512) lt!656561 lt!656566 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!100970)

(assert (=> b!1515041 (= lt!656561 (select (store (arr!48722 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515041 (= lt!656566 (array!100971 (store (arr!48722 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49272 a!2804)))))

(declare-fun b!1515042 () Bool)

(declare-fun e!845472 () Bool)

(assert (=> b!1515042 (= e!845472 e!845474)))

(declare-fun res!1034954 () Bool)

(assert (=> b!1515042 (=> (not res!1034954) (not e!845474))))

(declare-fun lt!656564 () SeekEntryResult!12893)

(assert (=> b!1515042 (= res!1034954 (= lt!656568 lt!656564))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1515042 (= lt!656564 (Intermediate!12893 false resIndex!21 resX!21))))

(assert (=> b!1515042 (= lt!656568 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48722 a!2804) j!70) mask!2512) (select (arr!48722 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515043 () Bool)

(declare-fun res!1034956 () Bool)

(assert (=> b!1515043 (=> (not res!1034956) (not e!845472))))

(declare-datatypes ((List!35205 0))(
  ( (Nil!35202) (Cons!35201 (h!36613 (_ BitVec 64)) (t!49899 List!35205)) )
))
(declare-fun arrayNoDuplicates!0 (array!100970 (_ BitVec 32) List!35205) Bool)

(assert (=> b!1515043 (= res!1034956 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35202))))

(declare-fun b!1515045 () Bool)

(declare-fun res!1034947 () Bool)

(assert (=> b!1515045 (=> (not res!1034947) (not e!845472))))

(assert (=> b!1515045 (= res!1034947 (and (= (size!49272 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49272 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49272 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515046 () Bool)

(declare-fun res!1034955 () Bool)

(assert (=> b!1515046 (=> (not res!1034955) (not e!845472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100970 (_ BitVec 32)) Bool)

(assert (=> b!1515046 (= res!1034955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515047 () Bool)

(declare-fun res!1034944 () Bool)

(assert (=> b!1515047 (=> (not res!1034944) (not e!845474))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1515047 (= res!1034944 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48722 a!2804) j!70) a!2804 mask!2512) lt!656564))))

(declare-fun b!1515048 () Bool)

(declare-fun res!1034948 () Bool)

(assert (=> b!1515048 (=> (not res!1034948) (not e!845472))))

(assert (=> b!1515048 (= res!1034948 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49272 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49272 a!2804))))))

(declare-fun e!845475 () Bool)

(declare-fun b!1515049 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100970 (_ BitVec 32)) SeekEntryResult!12893)

(assert (=> b!1515049 (= e!845475 (= (seekEntry!0 (select (arr!48722 a!2804) j!70) a!2804 mask!2512) (Found!12893 j!70)))))

(declare-fun b!1515050 () Bool)

(declare-fun e!845470 () Bool)

(declare-fun e!845476 () Bool)

(assert (=> b!1515050 (= e!845470 e!845476)))

(declare-fun res!1034950 () Bool)

(assert (=> b!1515050 (=> res!1034950 e!845476)))

(declare-fun lt!656563 () SeekEntryResult!12893)

(assert (=> b!1515050 (= res!1034950 (not (= lt!656563 (Found!12893 j!70))))))

(declare-fun lt!656560 () SeekEntryResult!12893)

(declare-fun lt!656562 () SeekEntryResult!12893)

(assert (=> b!1515050 (= lt!656560 lt!656562)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100970 (_ BitVec 32)) SeekEntryResult!12893)

(assert (=> b!1515050 (= lt!656562 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656561 lt!656566 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100970 (_ BitVec 32)) SeekEntryResult!12893)

(assert (=> b!1515050 (= lt!656560 (seekEntryOrOpen!0 lt!656561 lt!656566 mask!2512))))

(declare-fun lt!656569 () SeekEntryResult!12893)

(assert (=> b!1515050 (= lt!656569 lt!656563)))

(assert (=> b!1515050 (= lt!656563 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48722 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515050 (= lt!656569 (seekEntryOrOpen!0 (select (arr!48722 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515051 () Bool)

(declare-fun res!1034952 () Bool)

(assert (=> b!1515051 (=> (not res!1034952) (not e!845472))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515051 (= res!1034952 (validKeyInArray!0 (select (arr!48722 a!2804) j!70)))))

(declare-fun b!1515044 () Bool)

(assert (=> b!1515044 (= e!845476 true)))

(assert (=> b!1515044 (= lt!656562 lt!656563)))

(declare-datatypes ((Unit!50654 0))(
  ( (Unit!50655) )
))
(declare-fun lt!656565 () Unit!50654)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100970 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50654)

(assert (=> b!1515044 (= lt!656565 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun res!1034949 () Bool)

(assert (=> start!129114 (=> (not res!1034949) (not e!845472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129114 (= res!1034949 (validMask!0 mask!2512))))

(assert (=> start!129114 e!845472))

(assert (=> start!129114 true))

(declare-fun array_inv!37750 (array!100970) Bool)

(assert (=> start!129114 (array_inv!37750 a!2804)))

(declare-fun b!1515052 () Bool)

(assert (=> b!1515052 (= e!845473 (not e!845470))))

(declare-fun res!1034946 () Bool)

(assert (=> b!1515052 (=> res!1034946 e!845470)))

(assert (=> b!1515052 (= res!1034946 (or (not (= (select (arr!48722 a!2804) j!70) lt!656561)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48722 a!2804) index!487) (select (arr!48722 a!2804) j!70)) (not (= (select (arr!48722 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1515052 e!845475))

(declare-fun res!1034951 () Bool)

(assert (=> b!1515052 (=> (not res!1034951) (not e!845475))))

(assert (=> b!1515052 (= res!1034951 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!656567 () Unit!50654)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100970 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50654)

(assert (=> b!1515052 (= lt!656567 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515053 () Bool)

(declare-fun res!1034945 () Bool)

(assert (=> b!1515053 (=> (not res!1034945) (not e!845472))))

(assert (=> b!1515053 (= res!1034945 (validKeyInArray!0 (select (arr!48722 a!2804) i!961)))))

(assert (= (and start!129114 res!1034949) b!1515045))

(assert (= (and b!1515045 res!1034947) b!1515053))

(assert (= (and b!1515053 res!1034945) b!1515051))

(assert (= (and b!1515051 res!1034952) b!1515046))

(assert (= (and b!1515046 res!1034955) b!1515043))

(assert (= (and b!1515043 res!1034956) b!1515048))

(assert (= (and b!1515048 res!1034948) b!1515042))

(assert (= (and b!1515042 res!1034954) b!1515047))

(assert (= (and b!1515047 res!1034944) b!1515041))

(assert (= (and b!1515041 res!1034953) b!1515052))

(assert (= (and b!1515052 res!1034951) b!1515049))

(assert (= (and b!1515052 (not res!1034946)) b!1515050))

(assert (= (and b!1515050 (not res!1034950)) b!1515044))

(declare-fun m!1398055 () Bool)

(assert (=> b!1515044 m!1398055))

(declare-fun m!1398057 () Bool)

(assert (=> b!1515053 m!1398057))

(assert (=> b!1515053 m!1398057))

(declare-fun m!1398059 () Bool)

(assert (=> b!1515053 m!1398059))

(declare-fun m!1398061 () Bool)

(assert (=> b!1515046 m!1398061))

(declare-fun m!1398063 () Bool)

(assert (=> b!1515052 m!1398063))

(declare-fun m!1398065 () Bool)

(assert (=> b!1515052 m!1398065))

(declare-fun m!1398067 () Bool)

(assert (=> b!1515052 m!1398067))

(declare-fun m!1398069 () Bool)

(assert (=> b!1515052 m!1398069))

(assert (=> b!1515051 m!1398063))

(assert (=> b!1515051 m!1398063))

(declare-fun m!1398071 () Bool)

(assert (=> b!1515051 m!1398071))

(declare-fun m!1398073 () Bool)

(assert (=> b!1515043 m!1398073))

(assert (=> b!1515042 m!1398063))

(assert (=> b!1515042 m!1398063))

(declare-fun m!1398075 () Bool)

(assert (=> b!1515042 m!1398075))

(assert (=> b!1515042 m!1398075))

(assert (=> b!1515042 m!1398063))

(declare-fun m!1398077 () Bool)

(assert (=> b!1515042 m!1398077))

(declare-fun m!1398079 () Bool)

(assert (=> start!129114 m!1398079))

(declare-fun m!1398081 () Bool)

(assert (=> start!129114 m!1398081))

(assert (=> b!1515049 m!1398063))

(assert (=> b!1515049 m!1398063))

(declare-fun m!1398083 () Bool)

(assert (=> b!1515049 m!1398083))

(assert (=> b!1515047 m!1398063))

(assert (=> b!1515047 m!1398063))

(declare-fun m!1398085 () Bool)

(assert (=> b!1515047 m!1398085))

(assert (=> b!1515050 m!1398063))

(declare-fun m!1398087 () Bool)

(assert (=> b!1515050 m!1398087))

(declare-fun m!1398089 () Bool)

(assert (=> b!1515050 m!1398089))

(assert (=> b!1515050 m!1398063))

(declare-fun m!1398091 () Bool)

(assert (=> b!1515050 m!1398091))

(assert (=> b!1515050 m!1398063))

(declare-fun m!1398093 () Bool)

(assert (=> b!1515050 m!1398093))

(declare-fun m!1398095 () Bool)

(assert (=> b!1515041 m!1398095))

(assert (=> b!1515041 m!1398095))

(declare-fun m!1398097 () Bool)

(assert (=> b!1515041 m!1398097))

(declare-fun m!1398099 () Bool)

(assert (=> b!1515041 m!1398099))

(declare-fun m!1398101 () Bool)

(assert (=> b!1515041 m!1398101))

(push 1)

