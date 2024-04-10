; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130216 () Bool)

(assert start!130216)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101566 0))(
  ( (array!101567 (arr!49008 (Array (_ BitVec 32) (_ BitVec 64))) (size!49558 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101566)

(declare-fun b!1528430 () Bool)

(declare-fun e!851881 () Bool)

(declare-datatypes ((SeekEntryResult!13173 0))(
  ( (MissingZero!13173 (index!55087 (_ BitVec 32))) (Found!13173 (index!55088 (_ BitVec 32))) (Intermediate!13173 (undefined!13985 Bool) (index!55089 (_ BitVec 32)) (x!136780 (_ BitVec 32))) (Undefined!13173) (MissingVacant!13173 (index!55090 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101566 (_ BitVec 32)) SeekEntryResult!13173)

(assert (=> b!1528430 (= e!851881 (= (seekEntry!0 (select (arr!49008 a!2804) j!70) a!2804 mask!2512) (Found!13173 j!70)))))

(declare-fun b!1528431 () Bool)

(declare-fun e!851879 () Bool)

(declare-fun e!851877 () Bool)

(assert (=> b!1528431 (= e!851879 e!851877)))

(declare-fun res!1046147 () Bool)

(assert (=> b!1528431 (=> (not res!1046147) (not e!851877))))

(declare-fun lt!661978 () SeekEntryResult!13173)

(declare-fun lt!661974 () SeekEntryResult!13173)

(assert (=> b!1528431 (= res!1046147 (= lt!661978 lt!661974))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1528431 (= lt!661974 (Intermediate!13173 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101566 (_ BitVec 32)) SeekEntryResult!13173)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528431 (= lt!661978 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49008 a!2804) j!70) mask!2512) (select (arr!49008 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528432 () Bool)

(declare-fun res!1046144 () Bool)

(assert (=> b!1528432 (=> (not res!1046144) (not e!851879))))

(declare-datatypes ((List!35491 0))(
  ( (Nil!35488) (Cons!35487 (h!36923 (_ BitVec 64)) (t!50185 List!35491)) )
))
(declare-fun arrayNoDuplicates!0 (array!101566 (_ BitVec 32) List!35491) Bool)

(assert (=> b!1528432 (= res!1046144 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35488))))

(declare-fun b!1528433 () Bool)

(declare-fun e!851880 () Bool)

(assert (=> b!1528433 (= e!851877 e!851880)))

(declare-fun res!1046140 () Bool)

(assert (=> b!1528433 (=> (not res!1046140) (not e!851880))))

(declare-fun lt!661981 () array!101566)

(declare-fun lt!661976 () (_ BitVec 64))

(assert (=> b!1528433 (= res!1046140 (= lt!661978 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661976 mask!2512) lt!661976 lt!661981 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1528433 (= lt!661976 (select (store (arr!49008 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528433 (= lt!661981 (array!101567 (store (arr!49008 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49558 a!2804)))))

(declare-fun b!1528434 () Bool)

(declare-fun e!851876 () Bool)

(assert (=> b!1528434 (= e!851880 (not e!851876))))

(declare-fun res!1046143 () Bool)

(assert (=> b!1528434 (=> res!1046143 e!851876)))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1528434 (= res!1046143 (or (not (= (select (arr!49008 a!2804) j!70) lt!661976)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49008 a!2804) index!487) (select (arr!49008 a!2804) j!70)) (not (= (select (arr!49008 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1528434 e!851881))

(declare-fun res!1046141 () Bool)

(assert (=> b!1528434 (=> (not res!1046141) (not e!851881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101566 (_ BitVec 32)) Bool)

(assert (=> b!1528434 (= res!1046141 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51130 0))(
  ( (Unit!51131) )
))
(declare-fun lt!661973 () Unit!51130)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51130)

(assert (=> b!1528434 (= lt!661973 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528435 () Bool)

(declare-fun e!851875 () Bool)

(assert (=> b!1528435 (= e!851876 e!851875)))

(declare-fun res!1046145 () Bool)

(assert (=> b!1528435 (=> res!1046145 e!851875)))

(declare-fun lt!661980 () SeekEntryResult!13173)

(assert (=> b!1528435 (= res!1046145 (not (= lt!661980 (Found!13173 j!70))))))

(declare-fun lt!661979 () SeekEntryResult!13173)

(declare-fun lt!661975 () SeekEntryResult!13173)

(assert (=> b!1528435 (= lt!661979 lt!661975)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101566 (_ BitVec 32)) SeekEntryResult!13173)

(assert (=> b!1528435 (= lt!661975 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661976 lt!661981 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101566 (_ BitVec 32)) SeekEntryResult!13173)

(assert (=> b!1528435 (= lt!661979 (seekEntryOrOpen!0 lt!661976 lt!661981 mask!2512))))

(declare-fun lt!661972 () SeekEntryResult!13173)

(assert (=> b!1528435 (= lt!661972 lt!661980)))

(assert (=> b!1528435 (= lt!661980 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49008 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1528435 (= lt!661972 (seekEntryOrOpen!0 (select (arr!49008 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528436 () Bool)

(declare-fun res!1046146 () Bool)

(assert (=> b!1528436 (=> (not res!1046146) (not e!851877))))

(assert (=> b!1528436 (= res!1046146 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49008 a!2804) j!70) a!2804 mask!2512) lt!661974))))

(declare-fun b!1528437 () Bool)

(declare-fun res!1046139 () Bool)

(assert (=> b!1528437 (=> (not res!1046139) (not e!851879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528437 (= res!1046139 (validKeyInArray!0 (select (arr!49008 a!2804) i!961)))))

(declare-fun b!1528438 () Bool)

(declare-fun res!1046148 () Bool)

(assert (=> b!1528438 (=> (not res!1046148) (not e!851879))))

(assert (=> b!1528438 (= res!1046148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1046142 () Bool)

(assert (=> start!130216 (=> (not res!1046142) (not e!851879))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130216 (= res!1046142 (validMask!0 mask!2512))))

(assert (=> start!130216 e!851879))

(assert (=> start!130216 true))

(declare-fun array_inv!38036 (array!101566) Bool)

(assert (=> start!130216 (array_inv!38036 a!2804)))

(declare-fun b!1528439 () Bool)

(assert (=> b!1528439 (= e!851875 true)))

(assert (=> b!1528439 (= lt!661975 lt!661980)))

(declare-fun lt!661977 () Unit!51130)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51130)

(assert (=> b!1528439 (= lt!661977 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1528440 () Bool)

(declare-fun res!1046138 () Bool)

(assert (=> b!1528440 (=> (not res!1046138) (not e!851879))))

(assert (=> b!1528440 (= res!1046138 (and (= (size!49558 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49558 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49558 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528441 () Bool)

(declare-fun res!1046137 () Bool)

(assert (=> b!1528441 (=> (not res!1046137) (not e!851879))))

(assert (=> b!1528441 (= res!1046137 (validKeyInArray!0 (select (arr!49008 a!2804) j!70)))))

(declare-fun b!1528442 () Bool)

(declare-fun res!1046149 () Bool)

(assert (=> b!1528442 (=> (not res!1046149) (not e!851879))))

(assert (=> b!1528442 (= res!1046149 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49558 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49558 a!2804))))))

(assert (= (and start!130216 res!1046142) b!1528440))

(assert (= (and b!1528440 res!1046138) b!1528437))

(assert (= (and b!1528437 res!1046139) b!1528441))

(assert (= (and b!1528441 res!1046137) b!1528438))

(assert (= (and b!1528438 res!1046148) b!1528432))

(assert (= (and b!1528432 res!1046144) b!1528442))

(assert (= (and b!1528442 res!1046149) b!1528431))

(assert (= (and b!1528431 res!1046147) b!1528436))

(assert (= (and b!1528436 res!1046146) b!1528433))

(assert (= (and b!1528433 res!1046140) b!1528434))

(assert (= (and b!1528434 res!1046141) b!1528430))

(assert (= (and b!1528434 (not res!1046143)) b!1528435))

(assert (= (and b!1528435 (not res!1046145)) b!1528439))

(declare-fun m!1411263 () Bool)

(assert (=> b!1528431 m!1411263))

(assert (=> b!1528431 m!1411263))

(declare-fun m!1411265 () Bool)

(assert (=> b!1528431 m!1411265))

(assert (=> b!1528431 m!1411265))

(assert (=> b!1528431 m!1411263))

(declare-fun m!1411267 () Bool)

(assert (=> b!1528431 m!1411267))

(assert (=> b!1528436 m!1411263))

(assert (=> b!1528436 m!1411263))

(declare-fun m!1411269 () Bool)

(assert (=> b!1528436 m!1411269))

(assert (=> b!1528434 m!1411263))

(declare-fun m!1411271 () Bool)

(assert (=> b!1528434 m!1411271))

(declare-fun m!1411273 () Bool)

(assert (=> b!1528434 m!1411273))

(declare-fun m!1411275 () Bool)

(assert (=> b!1528434 m!1411275))

(assert (=> b!1528430 m!1411263))

(assert (=> b!1528430 m!1411263))

(declare-fun m!1411277 () Bool)

(assert (=> b!1528430 m!1411277))

(declare-fun m!1411279 () Bool)

(assert (=> b!1528438 m!1411279))

(assert (=> b!1528441 m!1411263))

(assert (=> b!1528441 m!1411263))

(declare-fun m!1411281 () Bool)

(assert (=> b!1528441 m!1411281))

(declare-fun m!1411283 () Bool)

(assert (=> b!1528439 m!1411283))

(declare-fun m!1411285 () Bool)

(assert (=> start!130216 m!1411285))

(declare-fun m!1411287 () Bool)

(assert (=> start!130216 m!1411287))

(declare-fun m!1411289 () Bool)

(assert (=> b!1528432 m!1411289))

(assert (=> b!1528435 m!1411263))

(declare-fun m!1411291 () Bool)

(assert (=> b!1528435 m!1411291))

(assert (=> b!1528435 m!1411263))

(declare-fun m!1411293 () Bool)

(assert (=> b!1528435 m!1411293))

(assert (=> b!1528435 m!1411263))

(declare-fun m!1411295 () Bool)

(assert (=> b!1528435 m!1411295))

(declare-fun m!1411297 () Bool)

(assert (=> b!1528435 m!1411297))

(declare-fun m!1411299 () Bool)

(assert (=> b!1528433 m!1411299))

(assert (=> b!1528433 m!1411299))

(declare-fun m!1411301 () Bool)

(assert (=> b!1528433 m!1411301))

(declare-fun m!1411303 () Bool)

(assert (=> b!1528433 m!1411303))

(declare-fun m!1411305 () Bool)

(assert (=> b!1528433 m!1411305))

(declare-fun m!1411307 () Bool)

(assert (=> b!1528437 m!1411307))

(assert (=> b!1528437 m!1411307))

(declare-fun m!1411309 () Bool)

(assert (=> b!1528437 m!1411309))

(check-sat (not b!1528432) (not start!130216) (not b!1528439) (not b!1528435) (not b!1528441) (not b!1528438) (not b!1528431) (not b!1528430) (not b!1528436) (not b!1528437) (not b!1528434) (not b!1528433))
(check-sat)
