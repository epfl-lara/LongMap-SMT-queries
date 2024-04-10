; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129072 () Bool)

(assert start!129072)

(declare-fun b!1514161 () Bool)

(declare-fun res!1034074 () Bool)

(declare-fun e!845032 () Bool)

(assert (=> b!1514161 (=> (not res!1034074) (not e!845032))))

(declare-datatypes ((array!100928 0))(
  ( (array!100929 (arr!48701 (Array (_ BitVec 32) (_ BitVec 64))) (size!49251 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100928)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100928 (_ BitVec 32)) Bool)

(assert (=> b!1514161 (= res!1034074 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514162 () Bool)

(declare-fun e!845035 () Bool)

(declare-fun e!845030 () Bool)

(assert (=> b!1514162 (= e!845035 e!845030)))

(declare-fun res!1034076 () Bool)

(assert (=> b!1514162 (=> res!1034076 e!845030)))

(declare-fun lt!656239 () (_ BitVec 64))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1514162 (= res!1034076 (or (not (= (select (arr!48701 a!2804) j!70) lt!656239)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48701 a!2804) index!487) (select (arr!48701 a!2804) j!70)) (not (= (select (arr!48701 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514163 () Bool)

(declare-fun res!1034072 () Bool)

(assert (=> b!1514163 (=> (not res!1034072) (not e!845032))))

(assert (=> b!1514163 (= res!1034072 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49251 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49251 a!2804))))))

(declare-fun b!1514164 () Bool)

(declare-fun e!845029 () Bool)

(assert (=> b!1514164 (= e!845029 (not true))))

(assert (=> b!1514164 e!845035))

(declare-fun res!1034071 () Bool)

(assert (=> b!1514164 (=> (not res!1034071) (not e!845035))))

(assert (=> b!1514164 (= res!1034071 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50612 0))(
  ( (Unit!50613) )
))
(declare-fun lt!656237 () Unit!50612)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100928 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50612)

(assert (=> b!1514164 (= lt!656237 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1034069 () Bool)

(assert (=> start!129072 (=> (not res!1034069) (not e!845032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129072 (= res!1034069 (validMask!0 mask!2512))))

(assert (=> start!129072 e!845032))

(assert (=> start!129072 true))

(declare-fun array_inv!37729 (array!100928) Bool)

(assert (=> start!129072 (array_inv!37729 a!2804)))

(declare-fun e!845031 () Bool)

(declare-fun lt!656238 () array!100928)

(declare-fun b!1514165 () Bool)

(declare-datatypes ((SeekEntryResult!12872 0))(
  ( (MissingZero!12872 (index!53883 (_ BitVec 32))) (Found!12872 (index!53884 (_ BitVec 32))) (Intermediate!12872 (undefined!13684 Bool) (index!53885 (_ BitVec 32)) (x!135598 (_ BitVec 32))) (Undefined!12872) (MissingVacant!12872 (index!53886 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100928 (_ BitVec 32)) SeekEntryResult!12872)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100928 (_ BitVec 32)) SeekEntryResult!12872)

(assert (=> b!1514165 (= e!845031 (= (seekEntryOrOpen!0 lt!656239 lt!656238 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656239 lt!656238 mask!2512)))))

(declare-fun b!1514166 () Bool)

(declare-fun res!1034064 () Bool)

(assert (=> b!1514166 (=> (not res!1034064) (not e!845035))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100928 (_ BitVec 32)) SeekEntryResult!12872)

(assert (=> b!1514166 (= res!1034064 (= (seekEntry!0 (select (arr!48701 a!2804) j!70) a!2804 mask!2512) (Found!12872 j!70)))))

(declare-fun b!1514167 () Bool)

(declare-fun res!1034077 () Bool)

(assert (=> b!1514167 (=> (not res!1034077) (not e!845032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514167 (= res!1034077 (validKeyInArray!0 (select (arr!48701 a!2804) j!70)))))

(declare-fun b!1514168 () Bool)

(assert (=> b!1514168 (= e!845030 e!845031)))

(declare-fun res!1034073 () Bool)

(assert (=> b!1514168 (=> (not res!1034073) (not e!845031))))

(assert (=> b!1514168 (= res!1034073 (= (seekEntryOrOpen!0 (select (arr!48701 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48701 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514169 () Bool)

(declare-fun res!1034075 () Bool)

(assert (=> b!1514169 (=> (not res!1034075) (not e!845032))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1514169 (= res!1034075 (validKeyInArray!0 (select (arr!48701 a!2804) i!961)))))

(declare-fun b!1514170 () Bool)

(declare-fun res!1034067 () Bool)

(declare-fun e!845034 () Bool)

(assert (=> b!1514170 (=> (not res!1034067) (not e!845034))))

(declare-fun lt!656236 () SeekEntryResult!12872)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100928 (_ BitVec 32)) SeekEntryResult!12872)

(assert (=> b!1514170 (= res!1034067 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48701 a!2804) j!70) a!2804 mask!2512) lt!656236))))

(declare-fun b!1514171 () Bool)

(declare-fun res!1034070 () Bool)

(assert (=> b!1514171 (=> (not res!1034070) (not e!845032))))

(declare-datatypes ((List!35184 0))(
  ( (Nil!35181) (Cons!35180 (h!36592 (_ BitVec 64)) (t!49878 List!35184)) )
))
(declare-fun arrayNoDuplicates!0 (array!100928 (_ BitVec 32) List!35184) Bool)

(assert (=> b!1514171 (= res!1034070 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35181))))

(declare-fun b!1514172 () Bool)

(declare-fun res!1034065 () Bool)

(assert (=> b!1514172 (=> (not res!1034065) (not e!845032))))

(assert (=> b!1514172 (= res!1034065 (and (= (size!49251 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49251 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49251 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514173 () Bool)

(assert (=> b!1514173 (= e!845032 e!845034)))

(declare-fun res!1034066 () Bool)

(assert (=> b!1514173 (=> (not res!1034066) (not e!845034))))

(declare-fun lt!656235 () SeekEntryResult!12872)

(assert (=> b!1514173 (= res!1034066 (= lt!656235 lt!656236))))

(assert (=> b!1514173 (= lt!656236 (Intermediate!12872 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514173 (= lt!656235 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48701 a!2804) j!70) mask!2512) (select (arr!48701 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514174 () Bool)

(assert (=> b!1514174 (= e!845034 e!845029)))

(declare-fun res!1034068 () Bool)

(assert (=> b!1514174 (=> (not res!1034068) (not e!845029))))

(assert (=> b!1514174 (= res!1034068 (= lt!656235 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656239 mask!2512) lt!656239 lt!656238 mask!2512)))))

(assert (=> b!1514174 (= lt!656239 (select (store (arr!48701 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514174 (= lt!656238 (array!100929 (store (arr!48701 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49251 a!2804)))))

(assert (= (and start!129072 res!1034069) b!1514172))

(assert (= (and b!1514172 res!1034065) b!1514169))

(assert (= (and b!1514169 res!1034075) b!1514167))

(assert (= (and b!1514167 res!1034077) b!1514161))

(assert (= (and b!1514161 res!1034074) b!1514171))

(assert (= (and b!1514171 res!1034070) b!1514163))

(assert (= (and b!1514163 res!1034072) b!1514173))

(assert (= (and b!1514173 res!1034066) b!1514170))

(assert (= (and b!1514170 res!1034067) b!1514174))

(assert (= (and b!1514174 res!1034068) b!1514164))

(assert (= (and b!1514164 res!1034071) b!1514166))

(assert (= (and b!1514166 res!1034064) b!1514162))

(assert (= (and b!1514162 (not res!1034076)) b!1514168))

(assert (= (and b!1514168 res!1034073) b!1514165))

(declare-fun m!1397089 () Bool)

(assert (=> b!1514174 m!1397089))

(assert (=> b!1514174 m!1397089))

(declare-fun m!1397091 () Bool)

(assert (=> b!1514174 m!1397091))

(declare-fun m!1397093 () Bool)

(assert (=> b!1514174 m!1397093))

(declare-fun m!1397095 () Bool)

(assert (=> b!1514174 m!1397095))

(declare-fun m!1397097 () Bool)

(assert (=> b!1514167 m!1397097))

(assert (=> b!1514167 m!1397097))

(declare-fun m!1397099 () Bool)

(assert (=> b!1514167 m!1397099))

(assert (=> b!1514173 m!1397097))

(assert (=> b!1514173 m!1397097))

(declare-fun m!1397101 () Bool)

(assert (=> b!1514173 m!1397101))

(assert (=> b!1514173 m!1397101))

(assert (=> b!1514173 m!1397097))

(declare-fun m!1397103 () Bool)

(assert (=> b!1514173 m!1397103))

(declare-fun m!1397105 () Bool)

(assert (=> start!129072 m!1397105))

(declare-fun m!1397107 () Bool)

(assert (=> start!129072 m!1397107))

(assert (=> b!1514168 m!1397097))

(assert (=> b!1514168 m!1397097))

(declare-fun m!1397109 () Bool)

(assert (=> b!1514168 m!1397109))

(assert (=> b!1514168 m!1397097))

(declare-fun m!1397111 () Bool)

(assert (=> b!1514168 m!1397111))

(declare-fun m!1397113 () Bool)

(assert (=> b!1514164 m!1397113))

(declare-fun m!1397115 () Bool)

(assert (=> b!1514164 m!1397115))

(declare-fun m!1397117 () Bool)

(assert (=> b!1514169 m!1397117))

(assert (=> b!1514169 m!1397117))

(declare-fun m!1397119 () Bool)

(assert (=> b!1514169 m!1397119))

(declare-fun m!1397121 () Bool)

(assert (=> b!1514165 m!1397121))

(declare-fun m!1397123 () Bool)

(assert (=> b!1514165 m!1397123))

(declare-fun m!1397125 () Bool)

(assert (=> b!1514161 m!1397125))

(assert (=> b!1514162 m!1397097))

(declare-fun m!1397127 () Bool)

(assert (=> b!1514162 m!1397127))

(declare-fun m!1397129 () Bool)

(assert (=> b!1514171 m!1397129))

(assert (=> b!1514166 m!1397097))

(assert (=> b!1514166 m!1397097))

(declare-fun m!1397131 () Bool)

(assert (=> b!1514166 m!1397131))

(assert (=> b!1514170 m!1397097))

(assert (=> b!1514170 m!1397097))

(declare-fun m!1397133 () Bool)

(assert (=> b!1514170 m!1397133))

(push 1)

