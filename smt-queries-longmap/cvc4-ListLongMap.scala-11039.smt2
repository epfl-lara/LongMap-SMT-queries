; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129070 () Bool)

(assert start!129070)

(declare-fun e!845009 () Bool)

(declare-fun b!1514119 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!656222 () (_ BitVec 64))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((array!100926 0))(
  ( (array!100927 (arr!48700 (Array (_ BitVec 32) (_ BitVec 64))) (size!49250 (_ BitVec 32))) )
))
(declare-fun lt!656224 () array!100926)

(declare-datatypes ((SeekEntryResult!12871 0))(
  ( (MissingZero!12871 (index!53879 (_ BitVec 32))) (Found!12871 (index!53880 (_ BitVec 32))) (Intermediate!12871 (undefined!13683 Bool) (index!53881 (_ BitVec 32)) (x!135589 (_ BitVec 32))) (Undefined!12871) (MissingVacant!12871 (index!53882 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100926 (_ BitVec 32)) SeekEntryResult!12871)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100926 (_ BitVec 32)) SeekEntryResult!12871)

(assert (=> b!1514119 (= e!845009 (= (seekEntryOrOpen!0 lt!656222 lt!656224 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656222 lt!656224 mask!2512)))))

(declare-fun b!1514120 () Bool)

(declare-fun res!1034028 () Bool)

(declare-fun e!845010 () Bool)

(assert (=> b!1514120 (=> (not res!1034028) (not e!845010))))

(declare-fun a!2804 () array!100926)

(declare-datatypes ((List!35183 0))(
  ( (Nil!35180) (Cons!35179 (h!36591 (_ BitVec 64)) (t!49877 List!35183)) )
))
(declare-fun arrayNoDuplicates!0 (array!100926 (_ BitVec 32) List!35183) Bool)

(assert (=> b!1514120 (= res!1034028 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35180))))

(declare-fun b!1514121 () Bool)

(declare-fun e!845012 () Bool)

(declare-fun e!845011 () Bool)

(assert (=> b!1514121 (= e!845012 e!845011)))

(declare-fun res!1034030 () Bool)

(assert (=> b!1514121 (=> (not res!1034030) (not e!845011))))

(declare-fun lt!656221 () SeekEntryResult!12871)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100926 (_ BitVec 32)) SeekEntryResult!12871)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514121 (= res!1034030 (= lt!656221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656222 mask!2512) lt!656222 lt!656224 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1514121 (= lt!656222 (select (store (arr!48700 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514121 (= lt!656224 (array!100927 (store (arr!48700 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49250 a!2804)))))

(declare-fun b!1514122 () Bool)

(declare-fun res!1034031 () Bool)

(assert (=> b!1514122 (=> (not res!1034031) (not e!845010))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514122 (= res!1034031 (validKeyInArray!0 (select (arr!48700 a!2804) j!70)))))

(declare-fun res!1034026 () Bool)

(assert (=> start!129070 (=> (not res!1034026) (not e!845010))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129070 (= res!1034026 (validMask!0 mask!2512))))

(assert (=> start!129070 e!845010))

(assert (=> start!129070 true))

(declare-fun array_inv!37728 (array!100926) Bool)

(assert (=> start!129070 (array_inv!37728 a!2804)))

(declare-fun b!1514123 () Bool)

(declare-fun res!1034035 () Bool)

(assert (=> b!1514123 (=> (not res!1034035) (not e!845010))))

(assert (=> b!1514123 (= res!1034035 (validKeyInArray!0 (select (arr!48700 a!2804) i!961)))))

(declare-fun b!1514124 () Bool)

(declare-fun res!1034034 () Bool)

(assert (=> b!1514124 (=> (not res!1034034) (not e!845010))))

(assert (=> b!1514124 (= res!1034034 (and (= (size!49250 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49250 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49250 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514125 () Bool)

(declare-fun res!1034032 () Bool)

(assert (=> b!1514125 (=> (not res!1034032) (not e!845012))))

(declare-fun lt!656220 () SeekEntryResult!12871)

(assert (=> b!1514125 (= res!1034032 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48700 a!2804) j!70) a!2804 mask!2512) lt!656220))))

(declare-fun b!1514126 () Bool)

(declare-fun res!1034027 () Bool)

(declare-fun e!845013 () Bool)

(assert (=> b!1514126 (=> (not res!1034027) (not e!845013))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100926 (_ BitVec 32)) SeekEntryResult!12871)

(assert (=> b!1514126 (= res!1034027 (= (seekEntry!0 (select (arr!48700 a!2804) j!70) a!2804 mask!2512) (Found!12871 j!70)))))

(declare-fun b!1514127 () Bool)

(assert (=> b!1514127 (= e!845010 e!845012)))

(declare-fun res!1034025 () Bool)

(assert (=> b!1514127 (=> (not res!1034025) (not e!845012))))

(assert (=> b!1514127 (= res!1034025 (= lt!656221 lt!656220))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1514127 (= lt!656220 (Intermediate!12871 false resIndex!21 resX!21))))

(assert (=> b!1514127 (= lt!656221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48700 a!2804) j!70) mask!2512) (select (arr!48700 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514128 () Bool)

(declare-fun e!845008 () Bool)

(assert (=> b!1514128 (= e!845013 e!845008)))

(declare-fun res!1034022 () Bool)

(assert (=> b!1514128 (=> res!1034022 e!845008)))

(assert (=> b!1514128 (= res!1034022 (or (not (= (select (arr!48700 a!2804) j!70) lt!656222)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48700 a!2804) index!487) (select (arr!48700 a!2804) j!70)) (not (= (select (arr!48700 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514129 () Bool)

(declare-fun res!1034033 () Bool)

(assert (=> b!1514129 (=> (not res!1034033) (not e!845010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100926 (_ BitVec 32)) Bool)

(assert (=> b!1514129 (= res!1034033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514130 () Bool)

(assert (=> b!1514130 (= e!845011 (not true))))

(assert (=> b!1514130 e!845013))

(declare-fun res!1034029 () Bool)

(assert (=> b!1514130 (=> (not res!1034029) (not e!845013))))

(assert (=> b!1514130 (= res!1034029 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50610 0))(
  ( (Unit!50611) )
))
(declare-fun lt!656223 () Unit!50610)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100926 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50610)

(assert (=> b!1514130 (= lt!656223 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514131 () Bool)

(declare-fun res!1034023 () Bool)

(assert (=> b!1514131 (=> (not res!1034023) (not e!845010))))

(assert (=> b!1514131 (= res!1034023 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49250 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49250 a!2804))))))

(declare-fun b!1514132 () Bool)

(assert (=> b!1514132 (= e!845008 e!845009)))

(declare-fun res!1034024 () Bool)

(assert (=> b!1514132 (=> (not res!1034024) (not e!845009))))

(assert (=> b!1514132 (= res!1034024 (= (seekEntryOrOpen!0 (select (arr!48700 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48700 a!2804) j!70) a!2804 mask!2512)))))

(assert (= (and start!129070 res!1034026) b!1514124))

(assert (= (and b!1514124 res!1034034) b!1514123))

(assert (= (and b!1514123 res!1034035) b!1514122))

(assert (= (and b!1514122 res!1034031) b!1514129))

(assert (= (and b!1514129 res!1034033) b!1514120))

(assert (= (and b!1514120 res!1034028) b!1514131))

(assert (= (and b!1514131 res!1034023) b!1514127))

(assert (= (and b!1514127 res!1034025) b!1514125))

(assert (= (and b!1514125 res!1034032) b!1514121))

(assert (= (and b!1514121 res!1034030) b!1514130))

(assert (= (and b!1514130 res!1034029) b!1514126))

(assert (= (and b!1514126 res!1034027) b!1514128))

(assert (= (and b!1514128 (not res!1034022)) b!1514132))

(assert (= (and b!1514132 res!1034024) b!1514119))

(declare-fun m!1397043 () Bool)

(assert (=> b!1514125 m!1397043))

(assert (=> b!1514125 m!1397043))

(declare-fun m!1397045 () Bool)

(assert (=> b!1514125 m!1397045))

(declare-fun m!1397047 () Bool)

(assert (=> start!129070 m!1397047))

(declare-fun m!1397049 () Bool)

(assert (=> start!129070 m!1397049))

(assert (=> b!1514127 m!1397043))

(assert (=> b!1514127 m!1397043))

(declare-fun m!1397051 () Bool)

(assert (=> b!1514127 m!1397051))

(assert (=> b!1514127 m!1397051))

(assert (=> b!1514127 m!1397043))

(declare-fun m!1397053 () Bool)

(assert (=> b!1514127 m!1397053))

(assert (=> b!1514122 m!1397043))

(assert (=> b!1514122 m!1397043))

(declare-fun m!1397055 () Bool)

(assert (=> b!1514122 m!1397055))

(assert (=> b!1514128 m!1397043))

(declare-fun m!1397057 () Bool)

(assert (=> b!1514128 m!1397057))

(declare-fun m!1397059 () Bool)

(assert (=> b!1514120 m!1397059))

(assert (=> b!1514132 m!1397043))

(assert (=> b!1514132 m!1397043))

(declare-fun m!1397061 () Bool)

(assert (=> b!1514132 m!1397061))

(assert (=> b!1514132 m!1397043))

(declare-fun m!1397063 () Bool)

(assert (=> b!1514132 m!1397063))

(declare-fun m!1397065 () Bool)

(assert (=> b!1514123 m!1397065))

(assert (=> b!1514123 m!1397065))

(declare-fun m!1397067 () Bool)

(assert (=> b!1514123 m!1397067))

(declare-fun m!1397069 () Bool)

(assert (=> b!1514129 m!1397069))

(declare-fun m!1397071 () Bool)

(assert (=> b!1514119 m!1397071))

(declare-fun m!1397073 () Bool)

(assert (=> b!1514119 m!1397073))

(assert (=> b!1514126 m!1397043))

(assert (=> b!1514126 m!1397043))

(declare-fun m!1397075 () Bool)

(assert (=> b!1514126 m!1397075))

(declare-fun m!1397077 () Bool)

(assert (=> b!1514130 m!1397077))

(declare-fun m!1397079 () Bool)

(assert (=> b!1514130 m!1397079))

(declare-fun m!1397081 () Bool)

(assert (=> b!1514121 m!1397081))

(assert (=> b!1514121 m!1397081))

(declare-fun m!1397083 () Bool)

(assert (=> b!1514121 m!1397083))

(declare-fun m!1397085 () Bool)

(assert (=> b!1514121 m!1397085))

(declare-fun m!1397087 () Bool)

(assert (=> b!1514121 m!1397087))

(push 1)

