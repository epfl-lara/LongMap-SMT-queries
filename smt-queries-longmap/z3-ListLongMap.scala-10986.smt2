; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128654 () Bool)

(assert start!128654)

(declare-fun b!1507988 () Bool)

(declare-fun res!1028207 () Bool)

(declare-fun e!842452 () Bool)

(assert (=> b!1507988 (=> (not res!1028207) (not e!842452))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100549 0))(
  ( (array!100550 (arr!48514 (Array (_ BitVec 32) (_ BitVec 64))) (size!49066 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100549)

(assert (=> b!1507988 (= res!1028207 (and (= (size!49066 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49066 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49066 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507989 () Bool)

(declare-fun res!1028210 () Bool)

(assert (=> b!1507989 (=> (not res!1028210) (not e!842452))))

(declare-datatypes ((List!35075 0))(
  ( (Nil!35072) (Cons!35071 (h!36481 (_ BitVec 64)) (t!49761 List!35075)) )
))
(declare-fun arrayNoDuplicates!0 (array!100549 (_ BitVec 32) List!35075) Bool)

(assert (=> b!1507989 (= res!1028210 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35072))))

(declare-fun b!1507990 () Bool)

(declare-fun res!1028206 () Bool)

(assert (=> b!1507990 (=> (not res!1028206) (not e!842452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507990 (= res!1028206 (validKeyInArray!0 (select (arr!48514 a!2804) i!961)))))

(declare-fun b!1507991 () Bool)

(declare-fun res!1028208 () Bool)

(assert (=> b!1507991 (=> (not res!1028208) (not e!842452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100549 (_ BitVec 32)) Bool)

(assert (=> b!1507991 (= res!1028208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507992 () Bool)

(declare-fun e!842454 () Bool)

(assert (=> b!1507992 (= e!842452 e!842454)))

(declare-fun res!1028204 () Bool)

(assert (=> b!1507992 (=> (not res!1028204) (not e!842454))))

(declare-datatypes ((SeekEntryResult!12708 0))(
  ( (MissingZero!12708 (index!53227 (_ BitVec 32))) (Found!12708 (index!53228 (_ BitVec 32))) (Intermediate!12708 (undefined!13520 Bool) (index!53229 (_ BitVec 32)) (x!134990 (_ BitVec 32))) (Undefined!12708) (MissingVacant!12708 (index!53230 (_ BitVec 32))) )
))
(declare-fun lt!654312 () SeekEntryResult!12708)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100549 (_ BitVec 32)) SeekEntryResult!12708)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507992 (= res!1028204 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48514 a!2804) j!70) mask!2512) (select (arr!48514 a!2804) j!70) a!2804 mask!2512) lt!654312))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1507992 (= lt!654312 (Intermediate!12708 false resIndex!21 resX!21))))

(declare-fun b!1507993 () Bool)

(assert (=> b!1507993 (= e!842454 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun lt!654311 () (_ BitVec 32))

(assert (=> b!1507993 (= lt!654311 (toIndex!0 (select (store (arr!48514 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun b!1507994 () Bool)

(declare-fun res!1028209 () Bool)

(assert (=> b!1507994 (=> (not res!1028209) (not e!842452))))

(assert (=> b!1507994 (= res!1028209 (validKeyInArray!0 (select (arr!48514 a!2804) j!70)))))

(declare-fun b!1507995 () Bool)

(declare-fun res!1028202 () Bool)

(assert (=> b!1507995 (=> (not res!1028202) (not e!842452))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1507995 (= res!1028202 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49066 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49066 a!2804))))))

(declare-fun b!1507996 () Bool)

(declare-fun res!1028203 () Bool)

(assert (=> b!1507996 (=> (not res!1028203) (not e!842454))))

(assert (=> b!1507996 (= res!1028203 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48514 a!2804) j!70) a!2804 mask!2512) lt!654312))))

(declare-fun res!1028205 () Bool)

(assert (=> start!128654 (=> (not res!1028205) (not e!842452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128654 (= res!1028205 (validMask!0 mask!2512))))

(assert (=> start!128654 e!842452))

(assert (=> start!128654 true))

(declare-fun array_inv!37747 (array!100549) Bool)

(assert (=> start!128654 (array_inv!37747 a!2804)))

(assert (= (and start!128654 res!1028205) b!1507988))

(assert (= (and b!1507988 res!1028207) b!1507990))

(assert (= (and b!1507990 res!1028206) b!1507994))

(assert (= (and b!1507994 res!1028209) b!1507991))

(assert (= (and b!1507991 res!1028208) b!1507989))

(assert (= (and b!1507989 res!1028210) b!1507995))

(assert (= (and b!1507995 res!1028202) b!1507992))

(assert (= (and b!1507992 res!1028204) b!1507996))

(assert (= (and b!1507996 res!1028203) b!1507993))

(declare-fun m!1389923 () Bool)

(assert (=> b!1507993 m!1389923))

(declare-fun m!1389925 () Bool)

(assert (=> b!1507993 m!1389925))

(assert (=> b!1507993 m!1389925))

(declare-fun m!1389927 () Bool)

(assert (=> b!1507993 m!1389927))

(declare-fun m!1389929 () Bool)

(assert (=> b!1507996 m!1389929))

(assert (=> b!1507996 m!1389929))

(declare-fun m!1389931 () Bool)

(assert (=> b!1507996 m!1389931))

(declare-fun m!1389933 () Bool)

(assert (=> start!128654 m!1389933))

(declare-fun m!1389935 () Bool)

(assert (=> start!128654 m!1389935))

(declare-fun m!1389937 () Bool)

(assert (=> b!1507989 m!1389937))

(assert (=> b!1507994 m!1389929))

(assert (=> b!1507994 m!1389929))

(declare-fun m!1389939 () Bool)

(assert (=> b!1507994 m!1389939))

(declare-fun m!1389941 () Bool)

(assert (=> b!1507990 m!1389941))

(assert (=> b!1507990 m!1389941))

(declare-fun m!1389943 () Bool)

(assert (=> b!1507990 m!1389943))

(assert (=> b!1507992 m!1389929))

(assert (=> b!1507992 m!1389929))

(declare-fun m!1389945 () Bool)

(assert (=> b!1507992 m!1389945))

(assert (=> b!1507992 m!1389945))

(assert (=> b!1507992 m!1389929))

(declare-fun m!1389947 () Bool)

(assert (=> b!1507992 m!1389947))

(declare-fun m!1389949 () Bool)

(assert (=> b!1507991 m!1389949))

(check-sat (not b!1507991) (not b!1507990) (not b!1507993) (not b!1507989) (not b!1507994) (not b!1507992) (not b!1507996) (not start!128654))
(check-sat)
