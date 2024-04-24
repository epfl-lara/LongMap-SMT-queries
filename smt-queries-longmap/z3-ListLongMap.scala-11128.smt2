; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130446 () Bool)

(assert start!130446)

(declare-fun b!1528522 () Bool)

(declare-fun e!852149 () Bool)

(declare-fun e!852146 () Bool)

(assert (=> b!1528522 (= e!852149 e!852146)))

(declare-fun res!1045083 () Bool)

(assert (=> b!1528522 (=> res!1045083 e!852146)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101596 0))(
  ( (array!101597 (arr!49018 (Array (_ BitVec 32) (_ BitVec 64))) (size!49569 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101596)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!661876 () (_ BitVec 64))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1528522 (= res!1045083 (or (not (= (select (arr!49018 a!2804) j!70) lt!661876)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49018 a!2804) index!487) (select (arr!49018 a!2804) j!70)) (not (= (select (arr!49018 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1528523 () Bool)

(declare-fun e!852145 () Bool)

(assert (=> b!1528523 (= e!852146 e!852145)))

(declare-fun res!1045078 () Bool)

(assert (=> b!1528523 (=> (not res!1045078) (not e!852145))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13076 0))(
  ( (MissingZero!13076 (index!54699 (_ BitVec 32))) (Found!13076 (index!54700 (_ BitVec 32))) (Intermediate!13076 (undefined!13888 Bool) (index!54701 (_ BitVec 32)) (x!136609 (_ BitVec 32))) (Undefined!13076) (MissingVacant!13076 (index!54702 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101596 (_ BitVec 32)) SeekEntryResult!13076)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101596 (_ BitVec 32)) SeekEntryResult!13076)

(assert (=> b!1528523 (= res!1045078 (= (seekEntryOrOpen!0 (select (arr!49018 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49018 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1528524 () Bool)

(declare-fun res!1045082 () Bool)

(declare-fun e!852147 () Bool)

(assert (=> b!1528524 (=> (not res!1045082) (not e!852147))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528524 (= res!1045082 (validKeyInArray!0 (select (arr!49018 a!2804) i!961)))))

(declare-fun b!1528525 () Bool)

(declare-fun res!1045081 () Bool)

(assert (=> b!1528525 (=> (not res!1045081) (not e!852149))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101596 (_ BitVec 32)) SeekEntryResult!13076)

(assert (=> b!1528525 (= res!1045081 (= (seekEntry!0 (select (arr!49018 a!2804) j!70) a!2804 mask!2512) (Found!13076 j!70)))))

(declare-fun b!1528526 () Bool)

(declare-fun res!1045073 () Bool)

(declare-fun e!852148 () Bool)

(assert (=> b!1528526 (=> (not res!1045073) (not e!852148))))

(declare-fun lt!661877 () SeekEntryResult!13076)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101596 (_ BitVec 32)) SeekEntryResult!13076)

(assert (=> b!1528526 (= res!1045073 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49018 a!2804) j!70) a!2804 mask!2512) lt!661877))))

(declare-fun b!1528528 () Bool)

(declare-fun res!1045072 () Bool)

(assert (=> b!1528528 (=> (not res!1045072) (not e!852147))))

(assert (=> b!1528528 (= res!1045072 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49569 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49569 a!2804))))))

(declare-fun b!1528529 () Bool)

(declare-fun e!852151 () Bool)

(assert (=> b!1528529 (= e!852151 (not true))))

(assert (=> b!1528529 e!852149))

(declare-fun res!1045070 () Bool)

(assert (=> b!1528529 (=> (not res!1045070) (not e!852149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101596 (_ BitVec 32)) Bool)

(assert (=> b!1528529 (= res!1045070 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50971 0))(
  ( (Unit!50972) )
))
(declare-fun lt!661874 () Unit!50971)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101596 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50971)

(assert (=> b!1528529 (= lt!661874 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528530 () Bool)

(declare-fun res!1045074 () Bool)

(assert (=> b!1528530 (=> (not res!1045074) (not e!852147))))

(declare-datatypes ((List!35488 0))(
  ( (Nil!35485) (Cons!35484 (h!36935 (_ BitVec 64)) (t!50174 List!35488)) )
))
(declare-fun arrayNoDuplicates!0 (array!101596 (_ BitVec 32) List!35488) Bool)

(assert (=> b!1528530 (= res!1045074 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35485))))

(declare-fun res!1045076 () Bool)

(assert (=> start!130446 (=> (not res!1045076) (not e!852147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130446 (= res!1045076 (validMask!0 mask!2512))))

(assert (=> start!130446 e!852147))

(assert (=> start!130446 true))

(declare-fun array_inv!38299 (array!101596) Bool)

(assert (=> start!130446 (array_inv!38299 a!2804)))

(declare-fun b!1528527 () Bool)

(assert (=> b!1528527 (= e!852148 e!852151)))

(declare-fun res!1045077 () Bool)

(assert (=> b!1528527 (=> (not res!1045077) (not e!852151))))

(declare-fun lt!661875 () array!101596)

(declare-fun lt!661878 () SeekEntryResult!13076)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528527 (= res!1045077 (= lt!661878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661876 mask!2512) lt!661876 lt!661875 mask!2512)))))

(assert (=> b!1528527 (= lt!661876 (select (store (arr!49018 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528527 (= lt!661875 (array!101597 (store (arr!49018 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49569 a!2804)))))

(declare-fun b!1528531 () Bool)

(declare-fun res!1045080 () Bool)

(assert (=> b!1528531 (=> (not res!1045080) (not e!852147))))

(assert (=> b!1528531 (= res!1045080 (and (= (size!49569 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49569 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49569 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528532 () Bool)

(assert (=> b!1528532 (= e!852147 e!852148)))

(declare-fun res!1045079 () Bool)

(assert (=> b!1528532 (=> (not res!1045079) (not e!852148))))

(assert (=> b!1528532 (= res!1045079 (= lt!661878 lt!661877))))

(assert (=> b!1528532 (= lt!661877 (Intermediate!13076 false resIndex!21 resX!21))))

(assert (=> b!1528532 (= lt!661878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49018 a!2804) j!70) mask!2512) (select (arr!49018 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528533 () Bool)

(declare-fun res!1045071 () Bool)

(assert (=> b!1528533 (=> (not res!1045071) (not e!852147))))

(assert (=> b!1528533 (= res!1045071 (validKeyInArray!0 (select (arr!49018 a!2804) j!70)))))

(declare-fun b!1528534 () Bool)

(declare-fun res!1045075 () Bool)

(assert (=> b!1528534 (=> (not res!1045075) (not e!852147))))

(assert (=> b!1528534 (= res!1045075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528535 () Bool)

(assert (=> b!1528535 (= e!852145 (= (seekEntryOrOpen!0 lt!661876 lt!661875 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661876 lt!661875 mask!2512)))))

(assert (= (and start!130446 res!1045076) b!1528531))

(assert (= (and b!1528531 res!1045080) b!1528524))

(assert (= (and b!1528524 res!1045082) b!1528533))

(assert (= (and b!1528533 res!1045071) b!1528534))

(assert (= (and b!1528534 res!1045075) b!1528530))

(assert (= (and b!1528530 res!1045074) b!1528528))

(assert (= (and b!1528528 res!1045072) b!1528532))

(assert (= (and b!1528532 res!1045079) b!1528526))

(assert (= (and b!1528526 res!1045073) b!1528527))

(assert (= (and b!1528527 res!1045077) b!1528529))

(assert (= (and b!1528529 res!1045070) b!1528525))

(assert (= (and b!1528525 res!1045081) b!1528522))

(assert (= (and b!1528522 (not res!1045083)) b!1528523))

(assert (= (and b!1528523 res!1045078) b!1528535))

(declare-fun m!1411153 () Bool)

(assert (=> b!1528533 m!1411153))

(assert (=> b!1528533 m!1411153))

(declare-fun m!1411155 () Bool)

(assert (=> b!1528533 m!1411155))

(declare-fun m!1411157 () Bool)

(assert (=> b!1528535 m!1411157))

(declare-fun m!1411159 () Bool)

(assert (=> b!1528535 m!1411159))

(assert (=> b!1528525 m!1411153))

(assert (=> b!1528525 m!1411153))

(declare-fun m!1411161 () Bool)

(assert (=> b!1528525 m!1411161))

(declare-fun m!1411163 () Bool)

(assert (=> b!1528529 m!1411163))

(declare-fun m!1411165 () Bool)

(assert (=> b!1528529 m!1411165))

(assert (=> b!1528522 m!1411153))

(declare-fun m!1411167 () Bool)

(assert (=> b!1528522 m!1411167))

(declare-fun m!1411169 () Bool)

(assert (=> b!1528534 m!1411169))

(assert (=> b!1528526 m!1411153))

(assert (=> b!1528526 m!1411153))

(declare-fun m!1411171 () Bool)

(assert (=> b!1528526 m!1411171))

(declare-fun m!1411173 () Bool)

(assert (=> b!1528527 m!1411173))

(assert (=> b!1528527 m!1411173))

(declare-fun m!1411175 () Bool)

(assert (=> b!1528527 m!1411175))

(declare-fun m!1411177 () Bool)

(assert (=> b!1528527 m!1411177))

(declare-fun m!1411179 () Bool)

(assert (=> b!1528527 m!1411179))

(assert (=> b!1528532 m!1411153))

(assert (=> b!1528532 m!1411153))

(declare-fun m!1411181 () Bool)

(assert (=> b!1528532 m!1411181))

(assert (=> b!1528532 m!1411181))

(assert (=> b!1528532 m!1411153))

(declare-fun m!1411183 () Bool)

(assert (=> b!1528532 m!1411183))

(declare-fun m!1411185 () Bool)

(assert (=> b!1528524 m!1411185))

(assert (=> b!1528524 m!1411185))

(declare-fun m!1411187 () Bool)

(assert (=> b!1528524 m!1411187))

(declare-fun m!1411189 () Bool)

(assert (=> b!1528530 m!1411189))

(assert (=> b!1528523 m!1411153))

(assert (=> b!1528523 m!1411153))

(declare-fun m!1411191 () Bool)

(assert (=> b!1528523 m!1411191))

(assert (=> b!1528523 m!1411153))

(declare-fun m!1411193 () Bool)

(assert (=> b!1528523 m!1411193))

(declare-fun m!1411195 () Bool)

(assert (=> start!130446 m!1411195))

(declare-fun m!1411197 () Bool)

(assert (=> start!130446 m!1411197))

(check-sat (not b!1528534) (not b!1528532) (not b!1528527) (not b!1528525) (not b!1528535) (not b!1528524) (not start!130446) (not b!1528526) (not b!1528533) (not b!1528530) (not b!1528523) (not b!1528529))
(check-sat)
