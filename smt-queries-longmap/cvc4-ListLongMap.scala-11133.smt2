; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130098 () Bool)

(assert start!130098)

(declare-fun b!1526944 () Bool)

(declare-fun res!1044981 () Bool)

(declare-fun e!851088 () Bool)

(assert (=> b!1526944 (=> (not res!1044981) (not e!851088))))

(declare-datatypes ((array!101511 0))(
  ( (array!101512 (arr!48982 (Array (_ BitVec 32) (_ BitVec 64))) (size!49532 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101511)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526944 (= res!1044981 (validKeyInArray!0 (select (arr!48982 a!2804) j!70)))))

(declare-fun b!1526945 () Bool)

(declare-fun res!1044990 () Bool)

(assert (=> b!1526945 (=> (not res!1044990) (not e!851088))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1526945 (= res!1044990 (and (= (size!49532 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49532 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49532 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526946 () Bool)

(declare-fun res!1044987 () Bool)

(assert (=> b!1526946 (=> (not res!1044987) (not e!851088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101511 (_ BitVec 32)) Bool)

(assert (=> b!1526946 (= res!1044987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1044984 () Bool)

(assert (=> start!130098 (=> (not res!1044984) (not e!851088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130098 (= res!1044984 (validMask!0 mask!2512))))

(assert (=> start!130098 e!851088))

(assert (=> start!130098 true))

(declare-fun array_inv!38010 (array!101511) Bool)

(assert (=> start!130098 (array_inv!38010 a!2804)))

(declare-fun b!1526947 () Bool)

(declare-fun res!1044991 () Bool)

(assert (=> b!1526947 (=> (not res!1044991) (not e!851088))))

(assert (=> b!1526947 (= res!1044991 (validKeyInArray!0 (select (arr!48982 a!2804) i!961)))))

(declare-fun b!1526948 () Bool)

(declare-fun e!851083 () Bool)

(assert (=> b!1526948 (= e!851088 e!851083)))

(declare-fun res!1044989 () Bool)

(assert (=> b!1526948 (=> (not res!1044989) (not e!851083))))

(declare-datatypes ((SeekEntryResult!13147 0))(
  ( (MissingZero!13147 (index!54983 (_ BitVec 32))) (Found!13147 (index!54984 (_ BitVec 32))) (Intermediate!13147 (undefined!13959 Bool) (index!54985 (_ BitVec 32)) (x!136673 (_ BitVec 32))) (Undefined!13147) (MissingVacant!13147 (index!54986 (_ BitVec 32))) )
))
(declare-fun lt!661255 () SeekEntryResult!13147)

(declare-fun lt!661256 () SeekEntryResult!13147)

(assert (=> b!1526948 (= res!1044989 (= lt!661255 lt!661256))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1526948 (= lt!661256 (Intermediate!13147 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101511 (_ BitVec 32)) SeekEntryResult!13147)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526948 (= lt!661255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48982 a!2804) j!70) mask!2512) (select (arr!48982 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526949 () Bool)

(declare-fun e!851085 () Bool)

(declare-fun e!851087 () Bool)

(assert (=> b!1526949 (= e!851085 e!851087)))

(declare-fun res!1044978 () Bool)

(assert (=> b!1526949 (=> res!1044978 e!851087)))

(declare-fun lt!661258 () (_ BitVec 64))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1526949 (= res!1044978 (or (not (= (select (arr!48982 a!2804) j!70) lt!661258)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48982 a!2804) index!487) (select (arr!48982 a!2804) j!70)) (not (= (select (arr!48982 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526950 () Bool)

(declare-fun res!1044982 () Bool)

(assert (=> b!1526950 (=> (not res!1044982) (not e!851085))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101511 (_ BitVec 32)) SeekEntryResult!13147)

(assert (=> b!1526950 (= res!1044982 (= (seekEntry!0 (select (arr!48982 a!2804) j!70) a!2804 mask!2512) (Found!13147 j!70)))))

(declare-fun b!1526951 () Bool)

(declare-fun e!851084 () Bool)

(assert (=> b!1526951 (= e!851084 (not true))))

(assert (=> b!1526951 e!851085))

(declare-fun res!1044985 () Bool)

(assert (=> b!1526951 (=> (not res!1044985) (not e!851085))))

(assert (=> b!1526951 (= res!1044985 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51078 0))(
  ( (Unit!51079) )
))
(declare-fun lt!661257 () Unit!51078)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101511 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51078)

(assert (=> b!1526951 (= lt!661257 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526952 () Bool)

(declare-fun e!851086 () Bool)

(assert (=> b!1526952 (= e!851087 e!851086)))

(declare-fun res!1044988 () Bool)

(assert (=> b!1526952 (=> (not res!1044988) (not e!851086))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101511 (_ BitVec 32)) SeekEntryResult!13147)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101511 (_ BitVec 32)) SeekEntryResult!13147)

(assert (=> b!1526952 (= res!1044988 (= (seekEntryOrOpen!0 (select (arr!48982 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48982 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun lt!661254 () array!101511)

(declare-fun b!1526953 () Bool)

(assert (=> b!1526953 (= e!851086 (= (seekEntryOrOpen!0 lt!661258 lt!661254 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661258 lt!661254 mask!2512)))))

(declare-fun b!1526954 () Bool)

(declare-fun res!1044980 () Bool)

(assert (=> b!1526954 (=> (not res!1044980) (not e!851088))))

(assert (=> b!1526954 (= res!1044980 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49532 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49532 a!2804))))))

(declare-fun b!1526955 () Bool)

(declare-fun res!1044986 () Bool)

(assert (=> b!1526955 (=> (not res!1044986) (not e!851083))))

(assert (=> b!1526955 (= res!1044986 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48982 a!2804) j!70) a!2804 mask!2512) lt!661256))))

(declare-fun b!1526956 () Bool)

(declare-fun res!1044983 () Bool)

(assert (=> b!1526956 (=> (not res!1044983) (not e!851088))))

(declare-datatypes ((List!35465 0))(
  ( (Nil!35462) (Cons!35461 (h!36894 (_ BitVec 64)) (t!50159 List!35465)) )
))
(declare-fun arrayNoDuplicates!0 (array!101511 (_ BitVec 32) List!35465) Bool)

(assert (=> b!1526956 (= res!1044983 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35462))))

(declare-fun b!1526957 () Bool)

(assert (=> b!1526957 (= e!851083 e!851084)))

(declare-fun res!1044979 () Bool)

(assert (=> b!1526957 (=> (not res!1044979) (not e!851084))))

(assert (=> b!1526957 (= res!1044979 (= lt!661255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661258 mask!2512) lt!661258 lt!661254 mask!2512)))))

(assert (=> b!1526957 (= lt!661258 (select (store (arr!48982 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526957 (= lt!661254 (array!101512 (store (arr!48982 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49532 a!2804)))))

(assert (= (and start!130098 res!1044984) b!1526945))

(assert (= (and b!1526945 res!1044990) b!1526947))

(assert (= (and b!1526947 res!1044991) b!1526944))

(assert (= (and b!1526944 res!1044981) b!1526946))

(assert (= (and b!1526946 res!1044987) b!1526956))

(assert (= (and b!1526956 res!1044983) b!1526954))

(assert (= (and b!1526954 res!1044980) b!1526948))

(assert (= (and b!1526948 res!1044989) b!1526955))

(assert (= (and b!1526955 res!1044986) b!1526957))

(assert (= (and b!1526957 res!1044979) b!1526951))

(assert (= (and b!1526951 res!1044985) b!1526950))

(assert (= (and b!1526950 res!1044982) b!1526949))

(assert (= (and b!1526949 (not res!1044978)) b!1526952))

(assert (= (and b!1526952 res!1044988) b!1526953))

(declare-fun m!1409795 () Bool)

(assert (=> b!1526955 m!1409795))

(assert (=> b!1526955 m!1409795))

(declare-fun m!1409797 () Bool)

(assert (=> b!1526955 m!1409797))

(assert (=> b!1526949 m!1409795))

(declare-fun m!1409799 () Bool)

(assert (=> b!1526949 m!1409799))

(declare-fun m!1409801 () Bool)

(assert (=> b!1526946 m!1409801))

(declare-fun m!1409803 () Bool)

(assert (=> b!1526957 m!1409803))

(assert (=> b!1526957 m!1409803))

(declare-fun m!1409805 () Bool)

(assert (=> b!1526957 m!1409805))

(declare-fun m!1409807 () Bool)

(assert (=> b!1526957 m!1409807))

(declare-fun m!1409809 () Bool)

(assert (=> b!1526957 m!1409809))

(assert (=> b!1526944 m!1409795))

(assert (=> b!1526944 m!1409795))

(declare-fun m!1409811 () Bool)

(assert (=> b!1526944 m!1409811))

(assert (=> b!1526948 m!1409795))

(assert (=> b!1526948 m!1409795))

(declare-fun m!1409813 () Bool)

(assert (=> b!1526948 m!1409813))

(assert (=> b!1526948 m!1409813))

(assert (=> b!1526948 m!1409795))

(declare-fun m!1409815 () Bool)

(assert (=> b!1526948 m!1409815))

(assert (=> b!1526952 m!1409795))

(assert (=> b!1526952 m!1409795))

(declare-fun m!1409817 () Bool)

(assert (=> b!1526952 m!1409817))

(assert (=> b!1526952 m!1409795))

(declare-fun m!1409819 () Bool)

(assert (=> b!1526952 m!1409819))

(declare-fun m!1409821 () Bool)

(assert (=> b!1526947 m!1409821))

(assert (=> b!1526947 m!1409821))

(declare-fun m!1409823 () Bool)

(assert (=> b!1526947 m!1409823))

(declare-fun m!1409825 () Bool)

(assert (=> b!1526956 m!1409825))

(assert (=> b!1526950 m!1409795))

(assert (=> b!1526950 m!1409795))

(declare-fun m!1409827 () Bool)

(assert (=> b!1526950 m!1409827))

(declare-fun m!1409829 () Bool)

(assert (=> b!1526951 m!1409829))

(declare-fun m!1409831 () Bool)

(assert (=> b!1526951 m!1409831))

(declare-fun m!1409833 () Bool)

(assert (=> start!130098 m!1409833))

(declare-fun m!1409835 () Bool)

(assert (=> start!130098 m!1409835))

(declare-fun m!1409837 () Bool)

(assert (=> b!1526953 m!1409837))

(declare-fun m!1409839 () Bool)

(assert (=> b!1526953 m!1409839))

(push 1)

