; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130070 () Bool)

(assert start!130070)

(declare-fun b!1526356 () Bool)

(declare-fun res!1044392 () Bool)

(declare-fun e!850791 () Bool)

(assert (=> b!1526356 (=> (not res!1044392) (not e!850791))))

(declare-datatypes ((array!101483 0))(
  ( (array!101484 (arr!48968 (Array (_ BitVec 32) (_ BitVec 64))) (size!49518 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101483)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101483 (_ BitVec 32)) Bool)

(assert (=> b!1526356 (= res!1044392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526357 () Bool)

(declare-fun e!850794 () Bool)

(assert (=> b!1526357 (= e!850794 (not true))))

(declare-fun e!850795 () Bool)

(assert (=> b!1526357 e!850795))

(declare-fun res!1044395 () Bool)

(assert (=> b!1526357 (=> (not res!1044395) (not e!850795))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1526357 (= res!1044395 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51050 0))(
  ( (Unit!51051) )
))
(declare-fun lt!661047 () Unit!51050)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101483 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51050)

(assert (=> b!1526357 (= lt!661047 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1044399 () Bool)

(assert (=> start!130070 (=> (not res!1044399) (not e!850791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130070 (= res!1044399 (validMask!0 mask!2512))))

(assert (=> start!130070 e!850791))

(assert (=> start!130070 true))

(declare-fun array_inv!37996 (array!101483) Bool)

(assert (=> start!130070 (array_inv!37996 a!2804)))

(declare-fun e!850793 () Bool)

(declare-fun b!1526358 () Bool)

(declare-fun lt!661048 () (_ BitVec 64))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!661045 () array!101483)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13133 0))(
  ( (MissingZero!13133 (index!54927 (_ BitVec 32))) (Found!13133 (index!54928 (_ BitVec 32))) (Intermediate!13133 (undefined!13945 Bool) (index!54929 (_ BitVec 32)) (x!136627 (_ BitVec 32))) (Undefined!13133) (MissingVacant!13133 (index!54930 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101483 (_ BitVec 32)) SeekEntryResult!13133)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101483 (_ BitVec 32)) SeekEntryResult!13133)

(assert (=> b!1526358 (= e!850793 (= (seekEntryOrOpen!0 lt!661048 lt!661045 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661048 lt!661045 mask!2512)))))

(declare-fun b!1526359 () Bool)

(declare-fun res!1044393 () Bool)

(assert (=> b!1526359 (=> (not res!1044393) (not e!850791))))

(declare-datatypes ((List!35451 0))(
  ( (Nil!35448) (Cons!35447 (h!36880 (_ BitVec 64)) (t!50145 List!35451)) )
))
(declare-fun arrayNoDuplicates!0 (array!101483 (_ BitVec 32) List!35451) Bool)

(assert (=> b!1526359 (= res!1044393 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35448))))

(declare-fun b!1526360 () Bool)

(declare-fun res!1044403 () Bool)

(assert (=> b!1526360 (=> (not res!1044403) (not e!850791))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1526360 (= res!1044403 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49518 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49518 a!2804))))))

(declare-fun b!1526361 () Bool)

(declare-fun res!1044400 () Bool)

(assert (=> b!1526361 (=> (not res!1044400) (not e!850791))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526361 (= res!1044400 (validKeyInArray!0 (select (arr!48968 a!2804) j!70)))))

(declare-fun b!1526362 () Bool)

(declare-fun e!850789 () Bool)

(assert (=> b!1526362 (= e!850789 e!850793)))

(declare-fun res!1044401 () Bool)

(assert (=> b!1526362 (=> (not res!1044401) (not e!850793))))

(assert (=> b!1526362 (= res!1044401 (= (seekEntryOrOpen!0 (select (arr!48968 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48968 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526363 () Bool)

(declare-fun res!1044390 () Bool)

(declare-fun e!850790 () Bool)

(assert (=> b!1526363 (=> (not res!1044390) (not e!850790))))

(declare-fun lt!661046 () SeekEntryResult!13133)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101483 (_ BitVec 32)) SeekEntryResult!13133)

(assert (=> b!1526363 (= res!1044390 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48968 a!2804) j!70) a!2804 mask!2512) lt!661046))))

(declare-fun b!1526364 () Bool)

(declare-fun res!1044396 () Bool)

(assert (=> b!1526364 (=> (not res!1044396) (not e!850791))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1526364 (= res!1044396 (validKeyInArray!0 (select (arr!48968 a!2804) i!961)))))

(declare-fun b!1526365 () Bool)

(assert (=> b!1526365 (= e!850795 e!850789)))

(declare-fun res!1044394 () Bool)

(assert (=> b!1526365 (=> res!1044394 e!850789)))

(assert (=> b!1526365 (= res!1044394 (or (not (= (select (arr!48968 a!2804) j!70) lt!661048)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48968 a!2804) index!487) (select (arr!48968 a!2804) j!70)) (not (= (select (arr!48968 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526366 () Bool)

(declare-fun res!1044391 () Bool)

(assert (=> b!1526366 (=> (not res!1044391) (not e!850795))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101483 (_ BitVec 32)) SeekEntryResult!13133)

(assert (=> b!1526366 (= res!1044391 (= (seekEntry!0 (select (arr!48968 a!2804) j!70) a!2804 mask!2512) (Found!13133 j!70)))))

(declare-fun b!1526367 () Bool)

(declare-fun res!1044397 () Bool)

(assert (=> b!1526367 (=> (not res!1044397) (not e!850791))))

(assert (=> b!1526367 (= res!1044397 (and (= (size!49518 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49518 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49518 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526368 () Bool)

(assert (=> b!1526368 (= e!850791 e!850790)))

(declare-fun res!1044398 () Bool)

(assert (=> b!1526368 (=> (not res!1044398) (not e!850790))))

(declare-fun lt!661044 () SeekEntryResult!13133)

(assert (=> b!1526368 (= res!1044398 (= lt!661044 lt!661046))))

(assert (=> b!1526368 (= lt!661046 (Intermediate!13133 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526368 (= lt!661044 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48968 a!2804) j!70) mask!2512) (select (arr!48968 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526369 () Bool)

(assert (=> b!1526369 (= e!850790 e!850794)))

(declare-fun res!1044402 () Bool)

(assert (=> b!1526369 (=> (not res!1044402) (not e!850794))))

(assert (=> b!1526369 (= res!1044402 (= lt!661044 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661048 mask!2512) lt!661048 lt!661045 mask!2512)))))

(assert (=> b!1526369 (= lt!661048 (select (store (arr!48968 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526369 (= lt!661045 (array!101484 (store (arr!48968 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49518 a!2804)))))

(assert (= (and start!130070 res!1044399) b!1526367))

(assert (= (and b!1526367 res!1044397) b!1526364))

(assert (= (and b!1526364 res!1044396) b!1526361))

(assert (= (and b!1526361 res!1044400) b!1526356))

(assert (= (and b!1526356 res!1044392) b!1526359))

(assert (= (and b!1526359 res!1044393) b!1526360))

(assert (= (and b!1526360 res!1044403) b!1526368))

(assert (= (and b!1526368 res!1044398) b!1526363))

(assert (= (and b!1526363 res!1044390) b!1526369))

(assert (= (and b!1526369 res!1044402) b!1526357))

(assert (= (and b!1526357 res!1044395) b!1526366))

(assert (= (and b!1526366 res!1044391) b!1526365))

(assert (= (and b!1526365 (not res!1044394)) b!1526362))

(assert (= (and b!1526362 res!1044401) b!1526358))

(declare-fun m!1409151 () Bool)

(assert (=> b!1526358 m!1409151))

(declare-fun m!1409153 () Bool)

(assert (=> b!1526358 m!1409153))

(declare-fun m!1409155 () Bool)

(assert (=> b!1526369 m!1409155))

(assert (=> b!1526369 m!1409155))

(declare-fun m!1409157 () Bool)

(assert (=> b!1526369 m!1409157))

(declare-fun m!1409159 () Bool)

(assert (=> b!1526369 m!1409159))

(declare-fun m!1409161 () Bool)

(assert (=> b!1526369 m!1409161))

(declare-fun m!1409163 () Bool)

(assert (=> b!1526361 m!1409163))

(assert (=> b!1526361 m!1409163))

(declare-fun m!1409165 () Bool)

(assert (=> b!1526361 m!1409165))

(assert (=> b!1526366 m!1409163))

(assert (=> b!1526366 m!1409163))

(declare-fun m!1409167 () Bool)

(assert (=> b!1526366 m!1409167))

(assert (=> b!1526362 m!1409163))

(assert (=> b!1526362 m!1409163))

(declare-fun m!1409169 () Bool)

(assert (=> b!1526362 m!1409169))

(assert (=> b!1526362 m!1409163))

(declare-fun m!1409171 () Bool)

(assert (=> b!1526362 m!1409171))

(declare-fun m!1409173 () Bool)

(assert (=> b!1526356 m!1409173))

(assert (=> b!1526368 m!1409163))

(assert (=> b!1526368 m!1409163))

(declare-fun m!1409175 () Bool)

(assert (=> b!1526368 m!1409175))

(assert (=> b!1526368 m!1409175))

(assert (=> b!1526368 m!1409163))

(declare-fun m!1409177 () Bool)

(assert (=> b!1526368 m!1409177))

(assert (=> b!1526363 m!1409163))

(assert (=> b!1526363 m!1409163))

(declare-fun m!1409179 () Bool)

(assert (=> b!1526363 m!1409179))

(declare-fun m!1409181 () Bool)

(assert (=> start!130070 m!1409181))

(declare-fun m!1409183 () Bool)

(assert (=> start!130070 m!1409183))

(declare-fun m!1409185 () Bool)

(assert (=> b!1526357 m!1409185))

(declare-fun m!1409187 () Bool)

(assert (=> b!1526357 m!1409187))

(assert (=> b!1526365 m!1409163))

(declare-fun m!1409189 () Bool)

(assert (=> b!1526365 m!1409189))

(declare-fun m!1409191 () Bool)

(assert (=> b!1526364 m!1409191))

(assert (=> b!1526364 m!1409191))

(declare-fun m!1409193 () Bool)

(assert (=> b!1526364 m!1409193))

(declare-fun m!1409195 () Bool)

(assert (=> b!1526359 m!1409195))

(push 1)

