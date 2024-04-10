; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129764 () Bool)

(assert start!129764)

(declare-fun b!1523083 () Bool)

(declare-fun res!1041992 () Bool)

(declare-fun e!849211 () Bool)

(assert (=> b!1523083 (=> (not res!1041992) (not e!849211))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101360 0))(
  ( (array!101361 (arr!48911 (Array (_ BitVec 32) (_ BitVec 64))) (size!49461 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101360)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13076 0))(
  ( (MissingZero!13076 (index!54699 (_ BitVec 32))) (Found!13076 (index!54700 (_ BitVec 32))) (Intermediate!13076 (undefined!13888 Bool) (index!54701 (_ BitVec 32)) (x!136394 (_ BitVec 32))) (Undefined!13076) (MissingVacant!13076 (index!54702 (_ BitVec 32))) )
))
(declare-fun lt!659857 () SeekEntryResult!13076)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101360 (_ BitVec 32)) SeekEntryResult!13076)

(assert (=> b!1523083 (= res!1041992 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48911 a!2804) j!70) a!2804 mask!2512) lt!659857))))

(declare-fun b!1523084 () Bool)

(assert (=> b!1523084 (= e!849211 (not true))))

(declare-fun e!849210 () Bool)

(assert (=> b!1523084 e!849210))

(declare-fun res!1042000 () Bool)

(assert (=> b!1523084 (=> (not res!1042000) (not e!849210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101360 (_ BitVec 32)) Bool)

(assert (=> b!1523084 (= res!1042000 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50936 0))(
  ( (Unit!50937) )
))
(declare-fun lt!659855 () Unit!50936)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101360 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50936)

(assert (=> b!1523084 (= lt!659855 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523085 () Bool)

(declare-fun res!1041997 () Bool)

(declare-fun e!849209 () Bool)

(assert (=> b!1523085 (=> (not res!1041997) (not e!849209))))

(declare-datatypes ((List!35394 0))(
  ( (Nil!35391) (Cons!35390 (h!36814 (_ BitVec 64)) (t!50088 List!35394)) )
))
(declare-fun arrayNoDuplicates!0 (array!101360 (_ BitVec 32) List!35394) Bool)

(assert (=> b!1523085 (= res!1041997 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35391))))

(declare-fun b!1523086 () Bool)

(declare-fun res!1041998 () Bool)

(assert (=> b!1523086 (=> (not res!1041998) (not e!849209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523086 (= res!1041998 (validKeyInArray!0 (select (arr!48911 a!2804) j!70)))))

(declare-fun b!1523087 () Bool)

(assert (=> b!1523087 (= e!849209 e!849211)))

(declare-fun res!1041999 () Bool)

(assert (=> b!1523087 (=> (not res!1041999) (not e!849211))))

(declare-fun lt!659856 () SeekEntryResult!13076)

(assert (=> b!1523087 (= res!1041999 (= lt!659856 lt!659857))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1523087 (= lt!659857 (Intermediate!13076 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523087 (= lt!659856 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48911 a!2804) j!70) mask!2512) (select (arr!48911 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523088 () Bool)

(declare-fun res!1041990 () Bool)

(assert (=> b!1523088 (=> (not res!1041990) (not e!849209))))

(assert (=> b!1523088 (= res!1041990 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49461 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49461 a!2804))))))

(declare-fun b!1523089 () Bool)

(declare-fun res!1041994 () Bool)

(assert (=> b!1523089 (=> (not res!1041994) (not e!849209))))

(assert (=> b!1523089 (= res!1041994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523090 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101360 (_ BitVec 32)) SeekEntryResult!13076)

(assert (=> b!1523090 (= e!849210 (= (seekEntry!0 (select (arr!48911 a!2804) j!70) a!2804 mask!2512) (Found!13076 j!70)))))

(declare-fun res!1041993 () Bool)

(assert (=> start!129764 (=> (not res!1041993) (not e!849209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129764 (= res!1041993 (validMask!0 mask!2512))))

(assert (=> start!129764 e!849209))

(assert (=> start!129764 true))

(declare-fun array_inv!37939 (array!101360) Bool)

(assert (=> start!129764 (array_inv!37939 a!2804)))

(declare-fun b!1523091 () Bool)

(declare-fun res!1041996 () Bool)

(assert (=> b!1523091 (=> (not res!1041996) (not e!849209))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1523091 (= res!1041996 (and (= (size!49461 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49461 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49461 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523092 () Bool)

(declare-fun res!1041995 () Bool)

(assert (=> b!1523092 (=> (not res!1041995) (not e!849209))))

(assert (=> b!1523092 (= res!1041995 (validKeyInArray!0 (select (arr!48911 a!2804) i!961)))))

(declare-fun b!1523093 () Bool)

(declare-fun res!1041991 () Bool)

(assert (=> b!1523093 (=> (not res!1041991) (not e!849211))))

(assert (=> b!1523093 (= res!1041991 (= lt!659856 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48911 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48911 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101361 (store (arr!48911 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49461 a!2804)) mask!2512)))))

(assert (= (and start!129764 res!1041993) b!1523091))

(assert (= (and b!1523091 res!1041996) b!1523092))

(assert (= (and b!1523092 res!1041995) b!1523086))

(assert (= (and b!1523086 res!1041998) b!1523089))

(assert (= (and b!1523089 res!1041994) b!1523085))

(assert (= (and b!1523085 res!1041997) b!1523088))

(assert (= (and b!1523088 res!1041990) b!1523087))

(assert (= (and b!1523087 res!1041999) b!1523083))

(assert (= (and b!1523083 res!1041992) b!1523093))

(assert (= (and b!1523093 res!1041991) b!1523084))

(assert (= (and b!1523084 res!1042000) b!1523090))

(declare-fun m!1406169 () Bool)

(assert (=> b!1523093 m!1406169))

(declare-fun m!1406171 () Bool)

(assert (=> b!1523093 m!1406171))

(assert (=> b!1523093 m!1406171))

(declare-fun m!1406173 () Bool)

(assert (=> b!1523093 m!1406173))

(assert (=> b!1523093 m!1406173))

(assert (=> b!1523093 m!1406171))

(declare-fun m!1406175 () Bool)

(assert (=> b!1523093 m!1406175))

(declare-fun m!1406177 () Bool)

(assert (=> b!1523086 m!1406177))

(assert (=> b!1523086 m!1406177))

(declare-fun m!1406179 () Bool)

(assert (=> b!1523086 m!1406179))

(declare-fun m!1406181 () Bool)

(assert (=> b!1523092 m!1406181))

(assert (=> b!1523092 m!1406181))

(declare-fun m!1406183 () Bool)

(assert (=> b!1523092 m!1406183))

(assert (=> b!1523090 m!1406177))

(assert (=> b!1523090 m!1406177))

(declare-fun m!1406185 () Bool)

(assert (=> b!1523090 m!1406185))

(assert (=> b!1523087 m!1406177))

(assert (=> b!1523087 m!1406177))

(declare-fun m!1406187 () Bool)

(assert (=> b!1523087 m!1406187))

(assert (=> b!1523087 m!1406187))

(assert (=> b!1523087 m!1406177))

(declare-fun m!1406189 () Bool)

(assert (=> b!1523087 m!1406189))

(declare-fun m!1406191 () Bool)

(assert (=> b!1523084 m!1406191))

(declare-fun m!1406193 () Bool)

(assert (=> b!1523084 m!1406193))

(declare-fun m!1406195 () Bool)

(assert (=> b!1523085 m!1406195))

(declare-fun m!1406197 () Bool)

(assert (=> start!129764 m!1406197))

(declare-fun m!1406199 () Bool)

(assert (=> start!129764 m!1406199))

(declare-fun m!1406201 () Bool)

(assert (=> b!1523089 m!1406201))

(assert (=> b!1523083 m!1406177))

(assert (=> b!1523083 m!1406177))

(declare-fun m!1406203 () Bool)

(assert (=> b!1523083 m!1406203))

(push 1)

