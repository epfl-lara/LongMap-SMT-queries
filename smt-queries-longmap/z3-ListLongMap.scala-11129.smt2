; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130452 () Bool)

(assert start!130452)

(declare-fun b!1528648 () Bool)

(declare-fun res!1045202 () Bool)

(declare-fun e!852210 () Bool)

(assert (=> b!1528648 (=> (not res!1045202) (not e!852210))))

(declare-datatypes ((array!101602 0))(
  ( (array!101603 (arr!49021 (Array (_ BitVec 32) (_ BitVec 64))) (size!49572 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101602)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528648 (= res!1045202 (validKeyInArray!0 (select (arr!49021 a!2804) j!70)))))

(declare-fun b!1528649 () Bool)

(declare-fun res!1045200 () Bool)

(declare-fun e!852211 () Bool)

(assert (=> b!1528649 (=> (not res!1045200) (not e!852211))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13079 0))(
  ( (MissingZero!13079 (index!54711 (_ BitVec 32))) (Found!13079 (index!54712 (_ BitVec 32))) (Intermediate!13079 (undefined!13891 Bool) (index!54713 (_ BitVec 32)) (x!136620 (_ BitVec 32))) (Undefined!13079) (MissingVacant!13079 (index!54714 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101602 (_ BitVec 32)) SeekEntryResult!13079)

(assert (=> b!1528649 (= res!1045200 (= (seekEntry!0 (select (arr!49021 a!2804) j!70) a!2804 mask!2512) (Found!13079 j!70)))))

(declare-fun b!1528650 () Bool)

(declare-fun e!852212 () Bool)

(assert (=> b!1528650 (= e!852210 e!852212)))

(declare-fun res!1045205 () Bool)

(assert (=> b!1528650 (=> (not res!1045205) (not e!852212))))

(declare-fun lt!661921 () SeekEntryResult!13079)

(declare-fun lt!661919 () SeekEntryResult!13079)

(assert (=> b!1528650 (= res!1045205 (= lt!661921 lt!661919))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1528650 (= lt!661919 (Intermediate!13079 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101602 (_ BitVec 32)) SeekEntryResult!13079)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528650 (= lt!661921 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49021 a!2804) j!70) mask!2512) (select (arr!49021 a!2804) j!70) a!2804 mask!2512))))

(declare-fun e!852213 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!661920 () array!101602)

(declare-fun b!1528651 () Bool)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!661923 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101602 (_ BitVec 32)) SeekEntryResult!13079)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101602 (_ BitVec 32)) SeekEntryResult!13079)

(assert (=> b!1528651 (= e!852213 (= (seekEntryOrOpen!0 lt!661923 lt!661920 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661923 lt!661920 mask!2512)))))

(declare-fun res!1045203 () Bool)

(assert (=> start!130452 (=> (not res!1045203) (not e!852210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130452 (= res!1045203 (validMask!0 mask!2512))))

(assert (=> start!130452 e!852210))

(assert (=> start!130452 true))

(declare-fun array_inv!38302 (array!101602) Bool)

(assert (=> start!130452 (array_inv!38302 a!2804)))

(declare-fun b!1528652 () Bool)

(declare-fun e!852209 () Bool)

(assert (=> b!1528652 (= e!852212 e!852209)))

(declare-fun res!1045204 () Bool)

(assert (=> b!1528652 (=> (not res!1045204) (not e!852209))))

(assert (=> b!1528652 (= res!1045204 (= lt!661921 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661923 mask!2512) lt!661923 lt!661920 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1528652 (= lt!661923 (select (store (arr!49021 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528652 (= lt!661920 (array!101603 (store (arr!49021 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49572 a!2804)))))

(declare-fun b!1528653 () Bool)

(declare-fun res!1045201 () Bool)

(assert (=> b!1528653 (=> (not res!1045201) (not e!852210))))

(assert (=> b!1528653 (= res!1045201 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49572 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49572 a!2804))))))

(declare-fun b!1528654 () Bool)

(declare-fun res!1045198 () Bool)

(assert (=> b!1528654 (=> (not res!1045198) (not e!852212))))

(assert (=> b!1528654 (= res!1045198 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49021 a!2804) j!70) a!2804 mask!2512) lt!661919))))

(declare-fun b!1528655 () Bool)

(declare-fun res!1045206 () Bool)

(assert (=> b!1528655 (=> (not res!1045206) (not e!852210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101602 (_ BitVec 32)) Bool)

(assert (=> b!1528655 (= res!1045206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528656 () Bool)

(assert (=> b!1528656 (= e!852209 (not true))))

(assert (=> b!1528656 e!852211))

(declare-fun res!1045197 () Bool)

(assert (=> b!1528656 (=> (not res!1045197) (not e!852211))))

(assert (=> b!1528656 (= res!1045197 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50977 0))(
  ( (Unit!50978) )
))
(declare-fun lt!661922 () Unit!50977)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101602 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50977)

(assert (=> b!1528656 (= lt!661922 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528657 () Bool)

(declare-fun res!1045199 () Bool)

(assert (=> b!1528657 (=> (not res!1045199) (not e!852210))))

(assert (=> b!1528657 (= res!1045199 (and (= (size!49572 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49572 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49572 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528658 () Bool)

(declare-fun res!1045208 () Bool)

(assert (=> b!1528658 (=> (not res!1045208) (not e!852210))))

(declare-datatypes ((List!35491 0))(
  ( (Nil!35488) (Cons!35487 (h!36938 (_ BitVec 64)) (t!50177 List!35491)) )
))
(declare-fun arrayNoDuplicates!0 (array!101602 (_ BitVec 32) List!35491) Bool)

(assert (=> b!1528658 (= res!1045208 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35488))))

(declare-fun b!1528659 () Bool)

(declare-fun e!852208 () Bool)

(assert (=> b!1528659 (= e!852211 e!852208)))

(declare-fun res!1045196 () Bool)

(assert (=> b!1528659 (=> res!1045196 e!852208)))

(assert (=> b!1528659 (= res!1045196 (or (not (= (select (arr!49021 a!2804) j!70) lt!661923)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49021 a!2804) index!487) (select (arr!49021 a!2804) j!70)) (not (= (select (arr!49021 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1528660 () Bool)

(declare-fun res!1045209 () Bool)

(assert (=> b!1528660 (=> (not res!1045209) (not e!852210))))

(assert (=> b!1528660 (= res!1045209 (validKeyInArray!0 (select (arr!49021 a!2804) i!961)))))

(declare-fun b!1528661 () Bool)

(assert (=> b!1528661 (= e!852208 e!852213)))

(declare-fun res!1045207 () Bool)

(assert (=> b!1528661 (=> (not res!1045207) (not e!852213))))

(assert (=> b!1528661 (= res!1045207 (= (seekEntryOrOpen!0 (select (arr!49021 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49021 a!2804) j!70) a!2804 mask!2512)))))

(assert (= (and start!130452 res!1045203) b!1528657))

(assert (= (and b!1528657 res!1045199) b!1528660))

(assert (= (and b!1528660 res!1045209) b!1528648))

(assert (= (and b!1528648 res!1045202) b!1528655))

(assert (= (and b!1528655 res!1045206) b!1528658))

(assert (= (and b!1528658 res!1045208) b!1528653))

(assert (= (and b!1528653 res!1045201) b!1528650))

(assert (= (and b!1528650 res!1045205) b!1528654))

(assert (= (and b!1528654 res!1045198) b!1528652))

(assert (= (and b!1528652 res!1045204) b!1528656))

(assert (= (and b!1528656 res!1045197) b!1528649))

(assert (= (and b!1528649 res!1045200) b!1528659))

(assert (= (and b!1528659 (not res!1045196)) b!1528661))

(assert (= (and b!1528661 res!1045207) b!1528651))

(declare-fun m!1411291 () Bool)

(assert (=> b!1528655 m!1411291))

(declare-fun m!1411293 () Bool)

(assert (=> b!1528651 m!1411293))

(declare-fun m!1411295 () Bool)

(assert (=> b!1528651 m!1411295))

(declare-fun m!1411297 () Bool)

(assert (=> b!1528648 m!1411297))

(assert (=> b!1528648 m!1411297))

(declare-fun m!1411299 () Bool)

(assert (=> b!1528648 m!1411299))

(assert (=> b!1528661 m!1411297))

(assert (=> b!1528661 m!1411297))

(declare-fun m!1411301 () Bool)

(assert (=> b!1528661 m!1411301))

(assert (=> b!1528661 m!1411297))

(declare-fun m!1411303 () Bool)

(assert (=> b!1528661 m!1411303))

(declare-fun m!1411305 () Bool)

(assert (=> b!1528656 m!1411305))

(declare-fun m!1411307 () Bool)

(assert (=> b!1528656 m!1411307))

(declare-fun m!1411309 () Bool)

(assert (=> start!130452 m!1411309))

(declare-fun m!1411311 () Bool)

(assert (=> start!130452 m!1411311))

(declare-fun m!1411313 () Bool)

(assert (=> b!1528652 m!1411313))

(assert (=> b!1528652 m!1411313))

(declare-fun m!1411315 () Bool)

(assert (=> b!1528652 m!1411315))

(declare-fun m!1411317 () Bool)

(assert (=> b!1528652 m!1411317))

(declare-fun m!1411319 () Bool)

(assert (=> b!1528652 m!1411319))

(declare-fun m!1411321 () Bool)

(assert (=> b!1528660 m!1411321))

(assert (=> b!1528660 m!1411321))

(declare-fun m!1411323 () Bool)

(assert (=> b!1528660 m!1411323))

(assert (=> b!1528649 m!1411297))

(assert (=> b!1528649 m!1411297))

(declare-fun m!1411325 () Bool)

(assert (=> b!1528649 m!1411325))

(assert (=> b!1528650 m!1411297))

(assert (=> b!1528650 m!1411297))

(declare-fun m!1411327 () Bool)

(assert (=> b!1528650 m!1411327))

(assert (=> b!1528650 m!1411327))

(assert (=> b!1528650 m!1411297))

(declare-fun m!1411329 () Bool)

(assert (=> b!1528650 m!1411329))

(assert (=> b!1528659 m!1411297))

(declare-fun m!1411331 () Bool)

(assert (=> b!1528659 m!1411331))

(declare-fun m!1411333 () Bool)

(assert (=> b!1528658 m!1411333))

(assert (=> b!1528654 m!1411297))

(assert (=> b!1528654 m!1411297))

(declare-fun m!1411335 () Bool)

(assert (=> b!1528654 m!1411335))

(check-sat (not b!1528658) (not b!1528649) (not b!1528651) (not b!1528660) (not b!1528652) (not start!130452) (not b!1528656) (not b!1528654) (not b!1528650) (not b!1528648) (not b!1528655) (not b!1528661))
(check-sat)
