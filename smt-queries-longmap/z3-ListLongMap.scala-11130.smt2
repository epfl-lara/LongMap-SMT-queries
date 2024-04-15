; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130026 () Bool)

(assert start!130026)

(declare-fun res!1044394 () Bool)

(declare-fun e!850655 () Bool)

(assert (=> start!130026 (=> (not res!1044394) (not e!850655))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130026 (= res!1044394 (validMask!0 mask!2512))))

(assert (=> start!130026 e!850655))

(assert (=> start!130026 true))

(declare-datatypes ((array!101437 0))(
  ( (array!101438 (arr!48946 (Array (_ BitVec 32) (_ BitVec 64))) (size!49498 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101437)

(declare-fun array_inv!38179 (array!101437) Bool)

(assert (=> start!130026 (array_inv!38179 a!2804)))

(declare-fun b!1526169 () Bool)

(declare-fun e!850660 () Bool)

(declare-fun e!850656 () Bool)

(assert (=> b!1526169 (= e!850660 e!850656)))

(declare-fun res!1044395 () Bool)

(assert (=> b!1526169 (=> res!1044395 e!850656)))

(declare-fun lt!660806 () (_ BitVec 64))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1526169 (= res!1044395 (or (not (= (select (arr!48946 a!2804) j!70) lt!660806)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48946 a!2804) index!487) (select (arr!48946 a!2804) j!70)) (not (= (select (arr!48946 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526170 () Bool)

(declare-fun res!1044387 () Bool)

(assert (=> b!1526170 (=> (not res!1044387) (not e!850660))))

(declare-datatypes ((SeekEntryResult!13134 0))(
  ( (MissingZero!13134 (index!54931 (_ BitVec 32))) (Found!13134 (index!54932 (_ BitVec 32))) (Intermediate!13134 (undefined!13946 Bool) (index!54933 (_ BitVec 32)) (x!136631 (_ BitVec 32))) (Undefined!13134) (MissingVacant!13134 (index!54934 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101437 (_ BitVec 32)) SeekEntryResult!13134)

(assert (=> b!1526170 (= res!1044387 (= (seekEntry!0 (select (arr!48946 a!2804) j!70) a!2804 mask!2512) (Found!13134 j!70)))))

(declare-fun b!1526171 () Bool)

(declare-fun res!1044391 () Bool)

(assert (=> b!1526171 (=> (not res!1044391) (not e!850655))))

(declare-datatypes ((List!35507 0))(
  ( (Nil!35504) (Cons!35503 (h!36937 (_ BitVec 64)) (t!50193 List!35507)) )
))
(declare-fun arrayNoDuplicates!0 (array!101437 (_ BitVec 32) List!35507) Bool)

(assert (=> b!1526171 (= res!1044391 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35504))))

(declare-fun b!1526172 () Bool)

(declare-fun e!850654 () Bool)

(assert (=> b!1526172 (= e!850654 (not true))))

(assert (=> b!1526172 e!850660))

(declare-fun res!1044396 () Bool)

(assert (=> b!1526172 (=> (not res!1044396) (not e!850660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101437 (_ BitVec 32)) Bool)

(assert (=> b!1526172 (= res!1044396 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50891 0))(
  ( (Unit!50892) )
))
(declare-fun lt!660805 () Unit!50891)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101437 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50891)

(assert (=> b!1526172 (= lt!660805 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526173 () Bool)

(declare-fun res!1044393 () Bool)

(assert (=> b!1526173 (=> (not res!1044393) (not e!850655))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1526173 (= res!1044393 (and (= (size!49498 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49498 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49498 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526174 () Bool)

(declare-fun res!1044400 () Bool)

(assert (=> b!1526174 (=> (not res!1044400) (not e!850655))))

(assert (=> b!1526174 (= res!1044400 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49498 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49498 a!2804))))))

(declare-fun b!1526175 () Bool)

(declare-fun e!850658 () Bool)

(assert (=> b!1526175 (= e!850658 e!850654)))

(declare-fun res!1044397 () Bool)

(assert (=> b!1526175 (=> (not res!1044397) (not e!850654))))

(declare-fun lt!660807 () array!101437)

(declare-fun lt!660803 () SeekEntryResult!13134)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101437 (_ BitVec 32)) SeekEntryResult!13134)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526175 (= res!1044397 (= lt!660803 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660806 mask!2512) lt!660806 lt!660807 mask!2512)))))

(assert (=> b!1526175 (= lt!660806 (select (store (arr!48946 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526175 (= lt!660807 (array!101438 (store (arr!48946 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49498 a!2804)))))

(declare-fun b!1526176 () Bool)

(declare-fun res!1044390 () Bool)

(assert (=> b!1526176 (=> (not res!1044390) (not e!850655))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526176 (= res!1044390 (validKeyInArray!0 (select (arr!48946 a!2804) i!961)))))

(declare-fun b!1526177 () Bool)

(declare-fun res!1044388 () Bool)

(assert (=> b!1526177 (=> (not res!1044388) (not e!850655))))

(assert (=> b!1526177 (= res!1044388 (validKeyInArray!0 (select (arr!48946 a!2804) j!70)))))

(declare-fun b!1526178 () Bool)

(declare-fun res!1044389 () Bool)

(assert (=> b!1526178 (=> (not res!1044389) (not e!850658))))

(declare-fun lt!660804 () SeekEntryResult!13134)

(assert (=> b!1526178 (= res!1044389 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48946 a!2804) j!70) a!2804 mask!2512) lt!660804))))

(declare-fun b!1526179 () Bool)

(declare-fun e!850659 () Bool)

(assert (=> b!1526179 (= e!850656 e!850659)))

(declare-fun res!1044398 () Bool)

(assert (=> b!1526179 (=> (not res!1044398) (not e!850659))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101437 (_ BitVec 32)) SeekEntryResult!13134)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101437 (_ BitVec 32)) SeekEntryResult!13134)

(assert (=> b!1526179 (= res!1044398 (= (seekEntryOrOpen!0 (select (arr!48946 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48946 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526180 () Bool)

(declare-fun res!1044399 () Bool)

(assert (=> b!1526180 (=> (not res!1044399) (not e!850655))))

(assert (=> b!1526180 (= res!1044399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526181 () Bool)

(assert (=> b!1526181 (= e!850659 (= (seekEntryOrOpen!0 lt!660806 lt!660807 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660806 lt!660807 mask!2512)))))

(declare-fun b!1526182 () Bool)

(assert (=> b!1526182 (= e!850655 e!850658)))

(declare-fun res!1044392 () Bool)

(assert (=> b!1526182 (=> (not res!1044392) (not e!850658))))

(assert (=> b!1526182 (= res!1044392 (= lt!660803 lt!660804))))

(assert (=> b!1526182 (= lt!660804 (Intermediate!13134 false resIndex!21 resX!21))))

(assert (=> b!1526182 (= lt!660803 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48946 a!2804) j!70) mask!2512) (select (arr!48946 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!130026 res!1044394) b!1526173))

(assert (= (and b!1526173 res!1044393) b!1526176))

(assert (= (and b!1526176 res!1044390) b!1526177))

(assert (= (and b!1526177 res!1044388) b!1526180))

(assert (= (and b!1526180 res!1044399) b!1526171))

(assert (= (and b!1526171 res!1044391) b!1526174))

(assert (= (and b!1526174 res!1044400) b!1526182))

(assert (= (and b!1526182 res!1044392) b!1526178))

(assert (= (and b!1526178 res!1044389) b!1526175))

(assert (= (and b!1526175 res!1044397) b!1526172))

(assert (= (and b!1526172 res!1044396) b!1526170))

(assert (= (and b!1526170 res!1044387) b!1526169))

(assert (= (and b!1526169 (not res!1044395)) b!1526179))

(assert (= (and b!1526179 res!1044398) b!1526181))

(declare-fun m!1408397 () Bool)

(assert (=> b!1526179 m!1408397))

(assert (=> b!1526179 m!1408397))

(declare-fun m!1408399 () Bool)

(assert (=> b!1526179 m!1408399))

(assert (=> b!1526179 m!1408397))

(declare-fun m!1408401 () Bool)

(assert (=> b!1526179 m!1408401))

(assert (=> b!1526169 m!1408397))

(declare-fun m!1408403 () Bool)

(assert (=> b!1526169 m!1408403))

(assert (=> b!1526178 m!1408397))

(assert (=> b!1526178 m!1408397))

(declare-fun m!1408405 () Bool)

(assert (=> b!1526178 m!1408405))

(declare-fun m!1408407 () Bool)

(assert (=> b!1526171 m!1408407))

(declare-fun m!1408409 () Bool)

(assert (=> start!130026 m!1408409))

(declare-fun m!1408411 () Bool)

(assert (=> start!130026 m!1408411))

(declare-fun m!1408413 () Bool)

(assert (=> b!1526175 m!1408413))

(assert (=> b!1526175 m!1408413))

(declare-fun m!1408415 () Bool)

(assert (=> b!1526175 m!1408415))

(declare-fun m!1408417 () Bool)

(assert (=> b!1526175 m!1408417))

(declare-fun m!1408419 () Bool)

(assert (=> b!1526175 m!1408419))

(declare-fun m!1408421 () Bool)

(assert (=> b!1526180 m!1408421))

(declare-fun m!1408423 () Bool)

(assert (=> b!1526172 m!1408423))

(declare-fun m!1408425 () Bool)

(assert (=> b!1526172 m!1408425))

(assert (=> b!1526182 m!1408397))

(assert (=> b!1526182 m!1408397))

(declare-fun m!1408427 () Bool)

(assert (=> b!1526182 m!1408427))

(assert (=> b!1526182 m!1408427))

(assert (=> b!1526182 m!1408397))

(declare-fun m!1408429 () Bool)

(assert (=> b!1526182 m!1408429))

(declare-fun m!1408431 () Bool)

(assert (=> b!1526181 m!1408431))

(declare-fun m!1408433 () Bool)

(assert (=> b!1526181 m!1408433))

(assert (=> b!1526170 m!1408397))

(assert (=> b!1526170 m!1408397))

(declare-fun m!1408435 () Bool)

(assert (=> b!1526170 m!1408435))

(assert (=> b!1526177 m!1408397))

(assert (=> b!1526177 m!1408397))

(declare-fun m!1408437 () Bool)

(assert (=> b!1526177 m!1408437))

(declare-fun m!1408439 () Bool)

(assert (=> b!1526176 m!1408439))

(assert (=> b!1526176 m!1408439))

(declare-fun m!1408441 () Bool)

(assert (=> b!1526176 m!1408441))

(check-sat (not b!1526182) (not b!1526176) (not b!1526180) (not b!1526170) (not b!1526179) (not b!1526172) (not start!130026) (not b!1526178) (not b!1526181) (not b!1526177) (not b!1526175) (not b!1526171))
(check-sat)
