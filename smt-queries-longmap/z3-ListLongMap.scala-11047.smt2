; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129116 () Bool)

(assert start!129116)

(declare-fun b!1515080 () Bool)

(declare-fun e!845491 () Bool)

(declare-fun e!845492 () Bool)

(assert (=> b!1515080 (= e!845491 (not e!845492))))

(declare-fun res!1034990 () Bool)

(assert (=> b!1515080 (=> res!1034990 e!845492)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun lt!656591 () (_ BitVec 64))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100972 0))(
  ( (array!100973 (arr!48723 (Array (_ BitVec 32) (_ BitVec 64))) (size!49273 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100972)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1515080 (= res!1034990 (or (not (= (select (arr!48723 a!2804) j!70) lt!656591)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48723 a!2804) index!487) (select (arr!48723 a!2804) j!70)) (not (= (select (arr!48723 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!845494 () Bool)

(assert (=> b!1515080 e!845494))

(declare-fun res!1034983 () Bool)

(assert (=> b!1515080 (=> (not res!1034983) (not e!845494))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100972 (_ BitVec 32)) Bool)

(assert (=> b!1515080 (= res!1034983 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50656 0))(
  ( (Unit!50657) )
))
(declare-fun lt!656594 () Unit!50656)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100972 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50656)

(assert (=> b!1515080 (= lt!656594 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515082 () Bool)

(declare-fun res!1034985 () Bool)

(declare-fun e!845495 () Bool)

(assert (=> b!1515082 (=> (not res!1034985) (not e!845495))))

(assert (=> b!1515082 (= res!1034985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515083 () Bool)

(declare-fun res!1034993 () Bool)

(assert (=> b!1515083 (=> (not res!1034993) (not e!845495))))

(declare-datatypes ((List!35206 0))(
  ( (Nil!35203) (Cons!35202 (h!36614 (_ BitVec 64)) (t!49900 List!35206)) )
))
(declare-fun arrayNoDuplicates!0 (array!100972 (_ BitVec 32) List!35206) Bool)

(assert (=> b!1515083 (= res!1034993 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35203))))

(declare-fun b!1515084 () Bool)

(declare-fun res!1034994 () Bool)

(assert (=> b!1515084 (=> (not res!1034994) (not e!845495))))

(assert (=> b!1515084 (= res!1034994 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49273 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49273 a!2804))))))

(declare-fun b!1515085 () Bool)

(declare-fun e!845496 () Bool)

(assert (=> b!1515085 (= e!845496 e!845491)))

(declare-fun res!1034984 () Bool)

(assert (=> b!1515085 (=> (not res!1034984) (not e!845491))))

(declare-fun lt!656599 () array!100972)

(declare-datatypes ((SeekEntryResult!12894 0))(
  ( (MissingZero!12894 (index!53971 (_ BitVec 32))) (Found!12894 (index!53972 (_ BitVec 32))) (Intermediate!12894 (undefined!13706 Bool) (index!53973 (_ BitVec 32)) (x!135676 (_ BitVec 32))) (Undefined!12894) (MissingVacant!12894 (index!53974 (_ BitVec 32))) )
))
(declare-fun lt!656597 () SeekEntryResult!12894)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100972 (_ BitVec 32)) SeekEntryResult!12894)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515085 (= res!1034984 (= lt!656597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656591 mask!2512) lt!656591 lt!656599 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515085 (= lt!656591 (select (store (arr!48723 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515085 (= lt!656599 (array!100973 (store (arr!48723 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49273 a!2804)))))

(declare-fun b!1515086 () Bool)

(assert (=> b!1515086 (= e!845495 e!845496)))

(declare-fun res!1034991 () Bool)

(assert (=> b!1515086 (=> (not res!1034991) (not e!845496))))

(declare-fun lt!656590 () SeekEntryResult!12894)

(assert (=> b!1515086 (= res!1034991 (= lt!656597 lt!656590))))

(assert (=> b!1515086 (= lt!656590 (Intermediate!12894 false resIndex!21 resX!21))))

(assert (=> b!1515086 (= lt!656597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48723 a!2804) j!70) mask!2512) (select (arr!48723 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515087 () Bool)

(declare-fun e!845493 () Bool)

(assert (=> b!1515087 (= e!845492 e!845493)))

(declare-fun res!1034987 () Bool)

(assert (=> b!1515087 (=> res!1034987 e!845493)))

(declare-fun lt!656598 () SeekEntryResult!12894)

(assert (=> b!1515087 (= res!1034987 (not (= lt!656598 (Found!12894 j!70))))))

(declare-fun lt!656595 () SeekEntryResult!12894)

(declare-fun lt!656592 () SeekEntryResult!12894)

(assert (=> b!1515087 (= lt!656595 lt!656592)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100972 (_ BitVec 32)) SeekEntryResult!12894)

(assert (=> b!1515087 (= lt!656592 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656591 lt!656599 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100972 (_ BitVec 32)) SeekEntryResult!12894)

(assert (=> b!1515087 (= lt!656595 (seekEntryOrOpen!0 lt!656591 lt!656599 mask!2512))))

(declare-fun lt!656593 () SeekEntryResult!12894)

(assert (=> b!1515087 (= lt!656593 lt!656598)))

(assert (=> b!1515087 (= lt!656598 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48723 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515087 (= lt!656593 (seekEntryOrOpen!0 (select (arr!48723 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515088 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100972 (_ BitVec 32)) SeekEntryResult!12894)

(assert (=> b!1515088 (= e!845494 (= (seekEntry!0 (select (arr!48723 a!2804) j!70) a!2804 mask!2512) (Found!12894 j!70)))))

(declare-fun b!1515089 () Bool)

(declare-fun res!1034992 () Bool)

(assert (=> b!1515089 (=> (not res!1034992) (not e!845495))))

(assert (=> b!1515089 (= res!1034992 (and (= (size!49273 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49273 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49273 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515090 () Bool)

(declare-fun res!1034986 () Bool)

(assert (=> b!1515090 (=> (not res!1034986) (not e!845495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515090 (= res!1034986 (validKeyInArray!0 (select (arr!48723 a!2804) j!70)))))

(declare-fun b!1515081 () Bool)

(assert (=> b!1515081 (= e!845493 true)))

(assert (=> b!1515081 (= lt!656592 lt!656598)))

(declare-fun lt!656596 () Unit!50656)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100972 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50656)

(assert (=> b!1515081 (= lt!656596 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun res!1034989 () Bool)

(assert (=> start!129116 (=> (not res!1034989) (not e!845495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129116 (= res!1034989 (validMask!0 mask!2512))))

(assert (=> start!129116 e!845495))

(assert (=> start!129116 true))

(declare-fun array_inv!37751 (array!100972) Bool)

(assert (=> start!129116 (array_inv!37751 a!2804)))

(declare-fun b!1515091 () Bool)

(declare-fun res!1034995 () Bool)

(assert (=> b!1515091 (=> (not res!1034995) (not e!845495))))

(assert (=> b!1515091 (= res!1034995 (validKeyInArray!0 (select (arr!48723 a!2804) i!961)))))

(declare-fun b!1515092 () Bool)

(declare-fun res!1034988 () Bool)

(assert (=> b!1515092 (=> (not res!1034988) (not e!845496))))

(assert (=> b!1515092 (= res!1034988 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48723 a!2804) j!70) a!2804 mask!2512) lt!656590))))

(assert (= (and start!129116 res!1034989) b!1515089))

(assert (= (and b!1515089 res!1034992) b!1515091))

(assert (= (and b!1515091 res!1034995) b!1515090))

(assert (= (and b!1515090 res!1034986) b!1515082))

(assert (= (and b!1515082 res!1034985) b!1515083))

(assert (= (and b!1515083 res!1034993) b!1515084))

(assert (= (and b!1515084 res!1034994) b!1515086))

(assert (= (and b!1515086 res!1034991) b!1515092))

(assert (= (and b!1515092 res!1034988) b!1515085))

(assert (= (and b!1515085 res!1034984) b!1515080))

(assert (= (and b!1515080 res!1034983) b!1515088))

(assert (= (and b!1515080 (not res!1034990)) b!1515087))

(assert (= (and b!1515087 (not res!1034987)) b!1515081))

(declare-fun m!1398103 () Bool)

(assert (=> b!1515087 m!1398103))

(declare-fun m!1398105 () Bool)

(assert (=> b!1515087 m!1398105))

(assert (=> b!1515087 m!1398103))

(declare-fun m!1398107 () Bool)

(assert (=> b!1515087 m!1398107))

(declare-fun m!1398109 () Bool)

(assert (=> b!1515087 m!1398109))

(assert (=> b!1515087 m!1398103))

(declare-fun m!1398111 () Bool)

(assert (=> b!1515087 m!1398111))

(assert (=> b!1515090 m!1398103))

(assert (=> b!1515090 m!1398103))

(declare-fun m!1398113 () Bool)

(assert (=> b!1515090 m!1398113))

(declare-fun m!1398115 () Bool)

(assert (=> b!1515082 m!1398115))

(declare-fun m!1398117 () Bool)

(assert (=> b!1515085 m!1398117))

(assert (=> b!1515085 m!1398117))

(declare-fun m!1398119 () Bool)

(assert (=> b!1515085 m!1398119))

(declare-fun m!1398121 () Bool)

(assert (=> b!1515085 m!1398121))

(declare-fun m!1398123 () Bool)

(assert (=> b!1515085 m!1398123))

(declare-fun m!1398125 () Bool)

(assert (=> b!1515091 m!1398125))

(assert (=> b!1515091 m!1398125))

(declare-fun m!1398127 () Bool)

(assert (=> b!1515091 m!1398127))

(assert (=> b!1515088 m!1398103))

(assert (=> b!1515088 m!1398103))

(declare-fun m!1398129 () Bool)

(assert (=> b!1515088 m!1398129))

(declare-fun m!1398131 () Bool)

(assert (=> start!129116 m!1398131))

(declare-fun m!1398133 () Bool)

(assert (=> start!129116 m!1398133))

(assert (=> b!1515080 m!1398103))

(declare-fun m!1398135 () Bool)

(assert (=> b!1515080 m!1398135))

(declare-fun m!1398137 () Bool)

(assert (=> b!1515080 m!1398137))

(declare-fun m!1398139 () Bool)

(assert (=> b!1515080 m!1398139))

(declare-fun m!1398141 () Bool)

(assert (=> b!1515083 m!1398141))

(declare-fun m!1398143 () Bool)

(assert (=> b!1515081 m!1398143))

(assert (=> b!1515092 m!1398103))

(assert (=> b!1515092 m!1398103))

(declare-fun m!1398145 () Bool)

(assert (=> b!1515092 m!1398145))

(assert (=> b!1515086 m!1398103))

(assert (=> b!1515086 m!1398103))

(declare-fun m!1398147 () Bool)

(assert (=> b!1515086 m!1398147))

(assert (=> b!1515086 m!1398147))

(assert (=> b!1515086 m!1398103))

(declare-fun m!1398149 () Bool)

(assert (=> b!1515086 m!1398149))

(check-sat (not b!1515082) (not b!1515085) (not b!1515087) (not b!1515090) (not b!1515086) (not b!1515091) (not start!129116) (not b!1515083) (not b!1515081) (not b!1515080) (not b!1515092) (not b!1515088))
(check-sat)
