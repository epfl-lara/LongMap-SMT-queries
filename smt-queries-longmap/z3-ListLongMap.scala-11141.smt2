; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130158 () Bool)

(assert start!130158)

(declare-fun b!1527961 () Bool)

(declare-fun e!851593 () Bool)

(declare-fun e!851599 () Bool)

(assert (=> b!1527961 (= e!851593 e!851599)))

(declare-fun res!1045853 () Bool)

(assert (=> b!1527961 (=> res!1045853 e!851599)))

(declare-datatypes ((SeekEntryResult!13167 0))(
  ( (MissingZero!13167 (index!55063 (_ BitVec 32))) (Found!13167 (index!55064 (_ BitVec 32))) (Intermediate!13167 (undefined!13979 Bool) (index!55065 (_ BitVec 32)) (x!136761 (_ BitVec 32))) (Undefined!13167) (MissingVacant!13167 (index!55066 (_ BitVec 32))) )
))
(declare-fun lt!661574 () SeekEntryResult!13167)

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1527961 (= res!1045853 (not (= lt!661574 (Found!13167 j!70))))))

(declare-fun lt!661575 () SeekEntryResult!13167)

(declare-fun lt!661567 () SeekEntryResult!13167)

(assert (=> b!1527961 (= lt!661575 lt!661567)))

(declare-datatypes ((array!101506 0))(
  ( (array!101507 (arr!48979 (Array (_ BitVec 32) (_ BitVec 64))) (size!49531 (_ BitVec 32))) )
))
(declare-fun lt!661568 () array!101506)

(declare-fun lt!661570 () (_ BitVec 64))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101506 (_ BitVec 32)) SeekEntryResult!13167)

(assert (=> b!1527961 (= lt!661567 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661570 lt!661568 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101506 (_ BitVec 32)) SeekEntryResult!13167)

(assert (=> b!1527961 (= lt!661575 (seekEntryOrOpen!0 lt!661570 lt!661568 mask!2512))))

(declare-fun lt!661571 () SeekEntryResult!13167)

(assert (=> b!1527961 (= lt!661571 lt!661574)))

(declare-fun a!2804 () array!101506)

(assert (=> b!1527961 (= lt!661574 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48979 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1527961 (= lt!661571 (seekEntryOrOpen!0 (select (arr!48979 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527962 () Bool)

(declare-fun res!1045863 () Bool)

(declare-fun e!851596 () Bool)

(assert (=> b!1527962 (=> (not res!1045863) (not e!851596))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527962 (= res!1045863 (validKeyInArray!0 (select (arr!48979 a!2804) i!961)))))

(declare-fun b!1527963 () Bool)

(declare-fun res!1045855 () Bool)

(assert (=> b!1527963 (=> (not res!1045855) (not e!851596))))

(assert (=> b!1527963 (= res!1045855 (and (= (size!49531 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49531 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49531 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1527964 () Bool)

(declare-fun res!1045859 () Bool)

(assert (=> b!1527964 (=> (not res!1045859) (not e!851596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101506 (_ BitVec 32)) Bool)

(assert (=> b!1527964 (= res!1045859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1527965 () Bool)

(declare-fun e!851595 () Bool)

(assert (=> b!1527965 (= e!851595 (not e!851593))))

(declare-fun res!1045864 () Bool)

(assert (=> b!1527965 (=> res!1045864 e!851593)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1527965 (= res!1045864 (or (not (= (select (arr!48979 a!2804) j!70) lt!661570)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48979 a!2804) index!487) (select (arr!48979 a!2804) j!70)) (not (= (select (arr!48979 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!851594 () Bool)

(assert (=> b!1527965 e!851594))

(declare-fun res!1045856 () Bool)

(assert (=> b!1527965 (=> (not res!1045856) (not e!851594))))

(assert (=> b!1527965 (= res!1045856 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50957 0))(
  ( (Unit!50958) )
))
(declare-fun lt!661569 () Unit!50957)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101506 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50957)

(assert (=> b!1527965 (= lt!661569 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1527966 () Bool)

(declare-fun res!1045860 () Bool)

(assert (=> b!1527966 (=> (not res!1045860) (not e!851596))))

(assert (=> b!1527966 (= res!1045860 (validKeyInArray!0 (select (arr!48979 a!2804) j!70)))))

(declare-fun b!1527967 () Bool)

(declare-fun res!1045854 () Bool)

(declare-fun e!851597 () Bool)

(assert (=> b!1527967 (=> (not res!1045854) (not e!851597))))

(declare-fun lt!661573 () SeekEntryResult!13167)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101506 (_ BitVec 32)) SeekEntryResult!13167)

(assert (=> b!1527967 (= res!1045854 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48979 a!2804) j!70) a!2804 mask!2512) lt!661573))))

(declare-fun res!1045862 () Bool)

(assert (=> start!130158 (=> (not res!1045862) (not e!851596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130158 (= res!1045862 (validMask!0 mask!2512))))

(assert (=> start!130158 e!851596))

(assert (=> start!130158 true))

(declare-fun array_inv!38212 (array!101506) Bool)

(assert (=> start!130158 (array_inv!38212 a!2804)))

(declare-fun b!1527968 () Bool)

(assert (=> b!1527968 (= e!851597 e!851595)))

(declare-fun res!1045861 () Bool)

(assert (=> b!1527968 (=> (not res!1045861) (not e!851595))))

(declare-fun lt!661566 () SeekEntryResult!13167)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527968 (= res!1045861 (= lt!661566 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661570 mask!2512) lt!661570 lt!661568 mask!2512)))))

(assert (=> b!1527968 (= lt!661570 (select (store (arr!48979 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527968 (= lt!661568 (array!101507 (store (arr!48979 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49531 a!2804)))))

(declare-fun b!1527969 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101506 (_ BitVec 32)) SeekEntryResult!13167)

(assert (=> b!1527969 (= e!851594 (= (seekEntry!0 (select (arr!48979 a!2804) j!70) a!2804 mask!2512) (Found!13167 j!70)))))

(declare-fun b!1527970 () Bool)

(assert (=> b!1527970 (= e!851596 e!851597)))

(declare-fun res!1045858 () Bool)

(assert (=> b!1527970 (=> (not res!1045858) (not e!851597))))

(assert (=> b!1527970 (= res!1045858 (= lt!661566 lt!661573))))

(assert (=> b!1527970 (= lt!661573 (Intermediate!13167 false resIndex!21 resX!21))))

(assert (=> b!1527970 (= lt!661566 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48979 a!2804) j!70) mask!2512) (select (arr!48979 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527971 () Bool)

(declare-fun res!1045852 () Bool)

(assert (=> b!1527971 (=> (not res!1045852) (not e!851596))))

(declare-datatypes ((List!35540 0))(
  ( (Nil!35537) (Cons!35536 (h!36973 (_ BitVec 64)) (t!50226 List!35540)) )
))
(declare-fun arrayNoDuplicates!0 (array!101506 (_ BitVec 32) List!35540) Bool)

(assert (=> b!1527971 (= res!1045852 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35537))))

(declare-fun b!1527972 () Bool)

(declare-fun res!1045857 () Bool)

(assert (=> b!1527972 (=> (not res!1045857) (not e!851596))))

(assert (=> b!1527972 (= res!1045857 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49531 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49531 a!2804))))))

(declare-fun b!1527973 () Bool)

(assert (=> b!1527973 (= e!851599 true)))

(assert (=> b!1527973 (= lt!661567 lt!661574)))

(declare-fun lt!661572 () Unit!50957)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101506 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50957)

(assert (=> b!1527973 (= lt!661572 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(assert (= (and start!130158 res!1045862) b!1527963))

(assert (= (and b!1527963 res!1045855) b!1527962))

(assert (= (and b!1527962 res!1045863) b!1527966))

(assert (= (and b!1527966 res!1045860) b!1527964))

(assert (= (and b!1527964 res!1045859) b!1527971))

(assert (= (and b!1527971 res!1045852) b!1527972))

(assert (= (and b!1527972 res!1045857) b!1527970))

(assert (= (and b!1527970 res!1045858) b!1527967))

(assert (= (and b!1527967 res!1045854) b!1527968))

(assert (= (and b!1527968 res!1045861) b!1527965))

(assert (= (and b!1527965 res!1045856) b!1527969))

(assert (= (and b!1527965 (not res!1045864)) b!1527961))

(assert (= (and b!1527961 (not res!1045853)) b!1527973))

(declare-fun m!1410179 () Bool)

(assert (=> b!1527970 m!1410179))

(assert (=> b!1527970 m!1410179))

(declare-fun m!1410181 () Bool)

(assert (=> b!1527970 m!1410181))

(assert (=> b!1527970 m!1410181))

(assert (=> b!1527970 m!1410179))

(declare-fun m!1410183 () Bool)

(assert (=> b!1527970 m!1410183))

(declare-fun m!1410185 () Bool)

(assert (=> b!1527962 m!1410185))

(assert (=> b!1527962 m!1410185))

(declare-fun m!1410187 () Bool)

(assert (=> b!1527962 m!1410187))

(assert (=> b!1527967 m!1410179))

(assert (=> b!1527967 m!1410179))

(declare-fun m!1410189 () Bool)

(assert (=> b!1527967 m!1410189))

(declare-fun m!1410191 () Bool)

(assert (=> b!1527973 m!1410191))

(assert (=> b!1527966 m!1410179))

(assert (=> b!1527966 m!1410179))

(declare-fun m!1410193 () Bool)

(assert (=> b!1527966 m!1410193))

(assert (=> b!1527965 m!1410179))

(declare-fun m!1410195 () Bool)

(assert (=> b!1527965 m!1410195))

(declare-fun m!1410197 () Bool)

(assert (=> b!1527965 m!1410197))

(declare-fun m!1410199 () Bool)

(assert (=> b!1527965 m!1410199))

(declare-fun m!1410201 () Bool)

(assert (=> start!130158 m!1410201))

(declare-fun m!1410203 () Bool)

(assert (=> start!130158 m!1410203))

(declare-fun m!1410205 () Bool)

(assert (=> b!1527971 m!1410205))

(declare-fun m!1410207 () Bool)

(assert (=> b!1527964 m!1410207))

(assert (=> b!1527961 m!1410179))

(declare-fun m!1410209 () Bool)

(assert (=> b!1527961 m!1410209))

(assert (=> b!1527961 m!1410179))

(declare-fun m!1410211 () Bool)

(assert (=> b!1527961 m!1410211))

(assert (=> b!1527961 m!1410179))

(declare-fun m!1410213 () Bool)

(assert (=> b!1527961 m!1410213))

(declare-fun m!1410215 () Bool)

(assert (=> b!1527961 m!1410215))

(declare-fun m!1410217 () Bool)

(assert (=> b!1527968 m!1410217))

(assert (=> b!1527968 m!1410217))

(declare-fun m!1410219 () Bool)

(assert (=> b!1527968 m!1410219))

(declare-fun m!1410221 () Bool)

(assert (=> b!1527968 m!1410221))

(declare-fun m!1410223 () Bool)

(assert (=> b!1527968 m!1410223))

(assert (=> b!1527969 m!1410179))

(assert (=> b!1527969 m!1410179))

(declare-fun m!1410225 () Bool)

(assert (=> b!1527969 m!1410225))

(check-sat (not b!1527965) (not b!1527964) (not b!1527962) (not b!1527969) (not b!1527971) (not b!1527961) (not b!1527968) (not start!130158) (not b!1527970) (not b!1527966) (not b!1527973) (not b!1527967))
(check-sat)
