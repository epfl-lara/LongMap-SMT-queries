; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129758 () Bool)

(assert start!129758)

(declare-fun b!1522984 () Bool)

(declare-fun e!849173 () Bool)

(assert (=> b!1522984 (= e!849173 (not true))))

(declare-fun e!849175 () Bool)

(assert (=> b!1522984 e!849175))

(declare-fun res!1041895 () Bool)

(assert (=> b!1522984 (=> (not res!1041895) (not e!849175))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101354 0))(
  ( (array!101355 (arr!48908 (Array (_ BitVec 32) (_ BitVec 64))) (size!49458 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101354)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101354 (_ BitVec 32)) Bool)

(assert (=> b!1522984 (= res!1041895 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50930 0))(
  ( (Unit!50931) )
))
(declare-fun lt!659830 () Unit!50930)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101354 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50930)

(assert (=> b!1522984 (= lt!659830 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1522985 () Bool)

(declare-fun e!849172 () Bool)

(assert (=> b!1522985 (= e!849172 e!849173)))

(declare-fun res!1041896 () Bool)

(assert (=> b!1522985 (=> (not res!1041896) (not e!849173))))

(declare-datatypes ((SeekEntryResult!13073 0))(
  ( (MissingZero!13073 (index!54687 (_ BitVec 32))) (Found!13073 (index!54688 (_ BitVec 32))) (Intermediate!13073 (undefined!13885 Bool) (index!54689 (_ BitVec 32)) (x!136383 (_ BitVec 32))) (Undefined!13073) (MissingVacant!13073 (index!54690 (_ BitVec 32))) )
))
(declare-fun lt!659828 () SeekEntryResult!13073)

(declare-fun lt!659829 () SeekEntryResult!13073)

(assert (=> b!1522985 (= res!1041896 (= lt!659828 lt!659829))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1522985 (= lt!659829 (Intermediate!13073 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101354 (_ BitVec 32)) SeekEntryResult!13073)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522985 (= lt!659828 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48908 a!2804) j!70) mask!2512) (select (arr!48908 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522986 () Bool)

(declare-fun res!1041898 () Bool)

(assert (=> b!1522986 (=> (not res!1041898) (not e!849172))))

(assert (=> b!1522986 (= res!1041898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1522987 () Bool)

(declare-fun res!1041897 () Bool)

(assert (=> b!1522987 (=> (not res!1041897) (not e!849172))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1522987 (= res!1041897 (and (= (size!49458 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49458 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49458 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1522988 () Bool)

(declare-fun res!1041891 () Bool)

(assert (=> b!1522988 (=> (not res!1041891) (not e!849172))))

(declare-datatypes ((List!35391 0))(
  ( (Nil!35388) (Cons!35387 (h!36811 (_ BitVec 64)) (t!50085 List!35391)) )
))
(declare-fun arrayNoDuplicates!0 (array!101354 (_ BitVec 32) List!35391) Bool)

(assert (=> b!1522988 (= res!1041891 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35388))))

(declare-fun b!1522990 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101354 (_ BitVec 32)) SeekEntryResult!13073)

(assert (=> b!1522990 (= e!849175 (= (seekEntry!0 (select (arr!48908 a!2804) j!70) a!2804 mask!2512) (Found!13073 j!70)))))

(declare-fun b!1522991 () Bool)

(declare-fun res!1041893 () Bool)

(assert (=> b!1522991 (=> (not res!1041893) (not e!849173))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1522991 (= res!1041893 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48908 a!2804) j!70) a!2804 mask!2512) lt!659829))))

(declare-fun b!1522992 () Bool)

(declare-fun res!1041901 () Bool)

(assert (=> b!1522992 (=> (not res!1041901) (not e!849173))))

(assert (=> b!1522992 (= res!1041901 (= lt!659828 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48908 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48908 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101355 (store (arr!48908 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49458 a!2804)) mask!2512)))))

(declare-fun b!1522993 () Bool)

(declare-fun res!1041894 () Bool)

(assert (=> b!1522993 (=> (not res!1041894) (not e!849172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522993 (= res!1041894 (validKeyInArray!0 (select (arr!48908 a!2804) i!961)))))

(declare-fun b!1522994 () Bool)

(declare-fun res!1041899 () Bool)

(assert (=> b!1522994 (=> (not res!1041899) (not e!849172))))

(assert (=> b!1522994 (= res!1041899 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49458 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49458 a!2804))))))

(declare-fun b!1522989 () Bool)

(declare-fun res!1041892 () Bool)

(assert (=> b!1522989 (=> (not res!1041892) (not e!849172))))

(assert (=> b!1522989 (= res!1041892 (validKeyInArray!0 (select (arr!48908 a!2804) j!70)))))

(declare-fun res!1041900 () Bool)

(assert (=> start!129758 (=> (not res!1041900) (not e!849172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129758 (= res!1041900 (validMask!0 mask!2512))))

(assert (=> start!129758 e!849172))

(assert (=> start!129758 true))

(declare-fun array_inv!37936 (array!101354) Bool)

(assert (=> start!129758 (array_inv!37936 a!2804)))

(assert (= (and start!129758 res!1041900) b!1522987))

(assert (= (and b!1522987 res!1041897) b!1522993))

(assert (= (and b!1522993 res!1041894) b!1522989))

(assert (= (and b!1522989 res!1041892) b!1522986))

(assert (= (and b!1522986 res!1041898) b!1522988))

(assert (= (and b!1522988 res!1041891) b!1522994))

(assert (= (and b!1522994 res!1041899) b!1522985))

(assert (= (and b!1522985 res!1041896) b!1522991))

(assert (= (and b!1522991 res!1041893) b!1522992))

(assert (= (and b!1522992 res!1041901) b!1522984))

(assert (= (and b!1522984 res!1041895) b!1522990))

(declare-fun m!1406061 () Bool)

(assert (=> b!1522993 m!1406061))

(assert (=> b!1522993 m!1406061))

(declare-fun m!1406063 () Bool)

(assert (=> b!1522993 m!1406063))

(declare-fun m!1406065 () Bool)

(assert (=> b!1522985 m!1406065))

(assert (=> b!1522985 m!1406065))

(declare-fun m!1406067 () Bool)

(assert (=> b!1522985 m!1406067))

(assert (=> b!1522985 m!1406067))

(assert (=> b!1522985 m!1406065))

(declare-fun m!1406069 () Bool)

(assert (=> b!1522985 m!1406069))

(declare-fun m!1406071 () Bool)

(assert (=> b!1522988 m!1406071))

(assert (=> b!1522989 m!1406065))

(assert (=> b!1522989 m!1406065))

(declare-fun m!1406073 () Bool)

(assert (=> b!1522989 m!1406073))

(declare-fun m!1406075 () Bool)

(assert (=> b!1522984 m!1406075))

(declare-fun m!1406077 () Bool)

(assert (=> b!1522984 m!1406077))

(assert (=> b!1522990 m!1406065))

(assert (=> b!1522990 m!1406065))

(declare-fun m!1406079 () Bool)

(assert (=> b!1522990 m!1406079))

(assert (=> b!1522991 m!1406065))

(assert (=> b!1522991 m!1406065))

(declare-fun m!1406081 () Bool)

(assert (=> b!1522991 m!1406081))

(declare-fun m!1406083 () Bool)

(assert (=> start!129758 m!1406083))

(declare-fun m!1406085 () Bool)

(assert (=> start!129758 m!1406085))

(declare-fun m!1406087 () Bool)

(assert (=> b!1522992 m!1406087))

(declare-fun m!1406089 () Bool)

(assert (=> b!1522992 m!1406089))

(assert (=> b!1522992 m!1406089))

(declare-fun m!1406091 () Bool)

(assert (=> b!1522992 m!1406091))

(assert (=> b!1522992 m!1406091))

(assert (=> b!1522992 m!1406089))

(declare-fun m!1406093 () Bool)

(assert (=> b!1522992 m!1406093))

(declare-fun m!1406095 () Bool)

(assert (=> b!1522986 m!1406095))

(push 1)

