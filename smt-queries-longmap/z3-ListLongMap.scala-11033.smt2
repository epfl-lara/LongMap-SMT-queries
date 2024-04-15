; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128978 () Bool)

(assert start!128978)

(declare-fun b!1512939 () Bool)

(declare-fun res!1033060 () Bool)

(declare-fun e!844377 () Bool)

(assert (=> b!1512939 (=> (not res!1033060) (not e!844377))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100834 0))(
  ( (array!100835 (arr!48655 (Array (_ BitVec 32) (_ BitVec 64))) (size!49207 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100834)

(assert (=> b!1512939 (= res!1033060 (and (= (size!49207 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49207 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49207 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512940 () Bool)

(declare-fun res!1033051 () Bool)

(assert (=> b!1512940 (=> (not res!1033051) (not e!844377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100834 (_ BitVec 32)) Bool)

(assert (=> b!1512940 (= res!1033051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1033057 () Bool)

(assert (=> start!128978 (=> (not res!1033057) (not e!844377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128978 (= res!1033057 (validMask!0 mask!2512))))

(assert (=> start!128978 e!844377))

(assert (=> start!128978 true))

(declare-fun array_inv!37888 (array!100834) Bool)

(assert (=> start!128978 (array_inv!37888 a!2804)))

(declare-fun b!1512941 () Bool)

(declare-fun e!844374 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!655628 () (_ BitVec 64))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!655625 () array!100834)

(declare-datatypes ((SeekEntryResult!12849 0))(
  ( (MissingZero!12849 (index!53791 (_ BitVec 32))) (Found!12849 (index!53792 (_ BitVec 32))) (Intermediate!12849 (undefined!13661 Bool) (index!53793 (_ BitVec 32)) (x!135513 (_ BitVec 32))) (Undefined!12849) (MissingVacant!12849 (index!53794 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100834 (_ BitVec 32)) SeekEntryResult!12849)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100834 (_ BitVec 32)) SeekEntryResult!12849)

(assert (=> b!1512941 (= e!844374 (= (seekEntryOrOpen!0 lt!655628 lt!655625 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655628 lt!655625 mask!2512)))))

(declare-fun b!1512942 () Bool)

(declare-fun e!844380 () Bool)

(assert (=> b!1512942 (= e!844380 e!844374)))

(declare-fun res!1033058 () Bool)

(assert (=> b!1512942 (=> (not res!1033058) (not e!844374))))

(assert (=> b!1512942 (= res!1033058 (= (seekEntryOrOpen!0 (select (arr!48655 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48655 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512943 () Bool)

(declare-fun e!844375 () Bool)

(declare-fun e!844378 () Bool)

(assert (=> b!1512943 (= e!844375 e!844378)))

(declare-fun res!1033059 () Bool)

(assert (=> b!1512943 (=> (not res!1033059) (not e!844378))))

(declare-fun lt!655626 () SeekEntryResult!12849)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100834 (_ BitVec 32)) SeekEntryResult!12849)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512943 (= res!1033059 (= lt!655626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655628 mask!2512) lt!655628 lt!655625 mask!2512)))))

(assert (=> b!1512943 (= lt!655628 (select (store (arr!48655 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1512943 (= lt!655625 (array!100835 (store (arr!48655 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49207 a!2804)))))

(declare-fun b!1512944 () Bool)

(declare-fun res!1033054 () Bool)

(assert (=> b!1512944 (=> (not res!1033054) (not e!844377))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512944 (= res!1033054 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49207 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49207 a!2804))))))

(declare-fun b!1512945 () Bool)

(declare-fun res!1033048 () Bool)

(assert (=> b!1512945 (=> (not res!1033048) (not e!844377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512945 (= res!1033048 (validKeyInArray!0 (select (arr!48655 a!2804) i!961)))))

(declare-fun b!1512946 () Bool)

(declare-fun res!1033061 () Bool)

(assert (=> b!1512946 (=> (not res!1033061) (not e!844375))))

(declare-fun lt!655627 () SeekEntryResult!12849)

(assert (=> b!1512946 (= res!1033061 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48655 a!2804) j!70) a!2804 mask!2512) lt!655627))))

(declare-fun b!1512947 () Bool)

(declare-fun e!844376 () Bool)

(assert (=> b!1512947 (= e!844376 e!844380)))

(declare-fun res!1033052 () Bool)

(assert (=> b!1512947 (=> res!1033052 e!844380)))

(assert (=> b!1512947 (= res!1033052 (or (not (= (select (arr!48655 a!2804) j!70) lt!655628)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48655 a!2804) index!487) (select (arr!48655 a!2804) j!70)) (not (= (select (arr!48655 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512948 () Bool)

(declare-fun res!1033055 () Bool)

(assert (=> b!1512948 (=> (not res!1033055) (not e!844377))))

(declare-datatypes ((List!35216 0))(
  ( (Nil!35213) (Cons!35212 (h!36625 (_ BitVec 64)) (t!49902 List!35216)) )
))
(declare-fun arrayNoDuplicates!0 (array!100834 (_ BitVec 32) List!35216) Bool)

(assert (=> b!1512948 (= res!1033055 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35213))))

(declare-fun b!1512949 () Bool)

(declare-fun res!1033053 () Bool)

(assert (=> b!1512949 (=> (not res!1033053) (not e!844377))))

(assert (=> b!1512949 (= res!1033053 (validKeyInArray!0 (select (arr!48655 a!2804) j!70)))))

(declare-fun b!1512950 () Bool)

(assert (=> b!1512950 (= e!844378 (not true))))

(assert (=> b!1512950 e!844376))

(declare-fun res!1033050 () Bool)

(assert (=> b!1512950 (=> (not res!1033050) (not e!844376))))

(assert (=> b!1512950 (= res!1033050 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50405 0))(
  ( (Unit!50406) )
))
(declare-fun lt!655629 () Unit!50405)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100834 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50405)

(assert (=> b!1512950 (= lt!655629 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512951 () Bool)

(assert (=> b!1512951 (= e!844377 e!844375)))

(declare-fun res!1033049 () Bool)

(assert (=> b!1512951 (=> (not res!1033049) (not e!844375))))

(assert (=> b!1512951 (= res!1033049 (= lt!655626 lt!655627))))

(assert (=> b!1512951 (= lt!655627 (Intermediate!12849 false resIndex!21 resX!21))))

(assert (=> b!1512951 (= lt!655626 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48655 a!2804) j!70) mask!2512) (select (arr!48655 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512952 () Bool)

(declare-fun res!1033056 () Bool)

(assert (=> b!1512952 (=> (not res!1033056) (not e!844376))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100834 (_ BitVec 32)) SeekEntryResult!12849)

(assert (=> b!1512952 (= res!1033056 (= (seekEntry!0 (select (arr!48655 a!2804) j!70) a!2804 mask!2512) (Found!12849 j!70)))))

(assert (= (and start!128978 res!1033057) b!1512939))

(assert (= (and b!1512939 res!1033060) b!1512945))

(assert (= (and b!1512945 res!1033048) b!1512949))

(assert (= (and b!1512949 res!1033053) b!1512940))

(assert (= (and b!1512940 res!1033051) b!1512948))

(assert (= (and b!1512948 res!1033055) b!1512944))

(assert (= (and b!1512944 res!1033054) b!1512951))

(assert (= (and b!1512951 res!1033049) b!1512946))

(assert (= (and b!1512946 res!1033061) b!1512943))

(assert (= (and b!1512943 res!1033059) b!1512950))

(assert (= (and b!1512950 res!1033050) b!1512952))

(assert (= (and b!1512952 res!1033056) b!1512947))

(assert (= (and b!1512947 (not res!1033052)) b!1512942))

(assert (= (and b!1512942 res!1033058) b!1512941))

(declare-fun m!1395215 () Bool)

(assert (=> start!128978 m!1395215))

(declare-fun m!1395217 () Bool)

(assert (=> start!128978 m!1395217))

(declare-fun m!1395219 () Bool)

(assert (=> b!1512940 m!1395219))

(declare-fun m!1395221 () Bool)

(assert (=> b!1512945 m!1395221))

(assert (=> b!1512945 m!1395221))

(declare-fun m!1395223 () Bool)

(assert (=> b!1512945 m!1395223))

(declare-fun m!1395225 () Bool)

(assert (=> b!1512946 m!1395225))

(assert (=> b!1512946 m!1395225))

(declare-fun m!1395227 () Bool)

(assert (=> b!1512946 m!1395227))

(assert (=> b!1512951 m!1395225))

(assert (=> b!1512951 m!1395225))

(declare-fun m!1395229 () Bool)

(assert (=> b!1512951 m!1395229))

(assert (=> b!1512951 m!1395229))

(assert (=> b!1512951 m!1395225))

(declare-fun m!1395231 () Bool)

(assert (=> b!1512951 m!1395231))

(assert (=> b!1512949 m!1395225))

(assert (=> b!1512949 m!1395225))

(declare-fun m!1395233 () Bool)

(assert (=> b!1512949 m!1395233))

(assert (=> b!1512947 m!1395225))

(declare-fun m!1395235 () Bool)

(assert (=> b!1512947 m!1395235))

(declare-fun m!1395237 () Bool)

(assert (=> b!1512941 m!1395237))

(declare-fun m!1395239 () Bool)

(assert (=> b!1512941 m!1395239))

(assert (=> b!1512952 m!1395225))

(assert (=> b!1512952 m!1395225))

(declare-fun m!1395241 () Bool)

(assert (=> b!1512952 m!1395241))

(assert (=> b!1512942 m!1395225))

(assert (=> b!1512942 m!1395225))

(declare-fun m!1395243 () Bool)

(assert (=> b!1512942 m!1395243))

(assert (=> b!1512942 m!1395225))

(declare-fun m!1395245 () Bool)

(assert (=> b!1512942 m!1395245))

(declare-fun m!1395247 () Bool)

(assert (=> b!1512950 m!1395247))

(declare-fun m!1395249 () Bool)

(assert (=> b!1512950 m!1395249))

(declare-fun m!1395251 () Bool)

(assert (=> b!1512948 m!1395251))

(declare-fun m!1395253 () Bool)

(assert (=> b!1512943 m!1395253))

(assert (=> b!1512943 m!1395253))

(declare-fun m!1395255 () Bool)

(assert (=> b!1512943 m!1395255))

(declare-fun m!1395257 () Bool)

(assert (=> b!1512943 m!1395257))

(declare-fun m!1395259 () Bool)

(assert (=> b!1512943 m!1395259))

(check-sat (not b!1512952) (not b!1512946) (not b!1512945) (not b!1512949) (not start!128978) (not b!1512948) (not b!1512951) (not b!1512940) (not b!1512942) (not b!1512943) (not b!1512950) (not b!1512941))
(check-sat)
