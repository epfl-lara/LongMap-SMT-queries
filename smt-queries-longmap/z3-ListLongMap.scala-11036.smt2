; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128996 () Bool)

(assert start!128996)

(declare-fun b!1513317 () Bool)

(declare-fun res!1033435 () Bool)

(declare-fun e!844568 () Bool)

(assert (=> b!1513317 (=> (not res!1033435) (not e!844568))))

(declare-datatypes ((array!100852 0))(
  ( (array!100853 (arr!48664 (Array (_ BitVec 32) (_ BitVec 64))) (size!49216 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100852)

(declare-datatypes ((List!35225 0))(
  ( (Nil!35222) (Cons!35221 (h!36634 (_ BitVec 64)) (t!49911 List!35225)) )
))
(declare-fun arrayNoDuplicates!0 (array!100852 (_ BitVec 32) List!35225) Bool)

(assert (=> b!1513317 (= res!1033435 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35222))))

(declare-fun b!1513318 () Bool)

(declare-fun res!1033438 () Bool)

(assert (=> b!1513318 (=> (not res!1033438) (not e!844568))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513318 (= res!1033438 (validKeyInArray!0 (select (arr!48664 a!2804) j!70)))))

(declare-fun res!1033431 () Bool)

(assert (=> start!128996 (=> (not res!1033431) (not e!844568))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128996 (= res!1033431 (validMask!0 mask!2512))))

(assert (=> start!128996 e!844568))

(assert (=> start!128996 true))

(declare-fun array_inv!37897 (array!100852) Bool)

(assert (=> start!128996 (array_inv!37897 a!2804)))

(declare-fun b!1513319 () Bool)

(declare-fun res!1033437 () Bool)

(assert (=> b!1513319 (=> (not res!1033437) (not e!844568))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1513319 (= res!1033437 (and (= (size!49216 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49216 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49216 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513320 () Bool)

(declare-fun res!1033426 () Bool)

(declare-fun e!844567 () Bool)

(assert (=> b!1513320 (=> (not res!1033426) (not e!844567))))

(declare-datatypes ((SeekEntryResult!12858 0))(
  ( (MissingZero!12858 (index!53827 (_ BitVec 32))) (Found!12858 (index!53828 (_ BitVec 32))) (Intermediate!12858 (undefined!13670 Bool) (index!53829 (_ BitVec 32)) (x!135546 (_ BitVec 32))) (Undefined!12858) (MissingVacant!12858 (index!53830 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100852 (_ BitVec 32)) SeekEntryResult!12858)

(assert (=> b!1513320 (= res!1033426 (= (seekEntry!0 (select (arr!48664 a!2804) j!70) a!2804 mask!2512) (Found!12858 j!70)))))

(declare-fun b!1513321 () Bool)

(declare-fun res!1033429 () Bool)

(assert (=> b!1513321 (=> (not res!1033429) (not e!844568))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513321 (= res!1033429 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49216 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49216 a!2804))))))

(declare-fun b!1513322 () Bool)

(declare-fun e!844563 () Bool)

(assert (=> b!1513322 (= e!844563 (not true))))

(assert (=> b!1513322 e!844567))

(declare-fun res!1033434 () Bool)

(assert (=> b!1513322 (=> (not res!1033434) (not e!844567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100852 (_ BitVec 32)) Bool)

(assert (=> b!1513322 (= res!1033434 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50423 0))(
  ( (Unit!50424) )
))
(declare-fun lt!655763 () Unit!50423)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100852 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50423)

(assert (=> b!1513322 (= lt!655763 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513323 () Bool)

(declare-fun e!844565 () Bool)

(assert (=> b!1513323 (= e!844567 e!844565)))

(declare-fun res!1033433 () Bool)

(assert (=> b!1513323 (=> res!1033433 e!844565)))

(declare-fun lt!655760 () (_ BitVec 64))

(assert (=> b!1513323 (= res!1033433 (or (not (= (select (arr!48664 a!2804) j!70) lt!655760)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48664 a!2804) index!487) (select (arr!48664 a!2804) j!70)) (not (= (select (arr!48664 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!655761 () array!100852)

(declare-fun b!1513324 () Bool)

(declare-fun e!844569 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100852 (_ BitVec 32)) SeekEntryResult!12858)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100852 (_ BitVec 32)) SeekEntryResult!12858)

(assert (=> b!1513324 (= e!844569 (= (seekEntryOrOpen!0 lt!655760 lt!655761 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655760 lt!655761 mask!2512)))))

(declare-fun b!1513325 () Bool)

(declare-fun res!1033427 () Bool)

(assert (=> b!1513325 (=> (not res!1033427) (not e!844568))))

(assert (=> b!1513325 (= res!1033427 (validKeyInArray!0 (select (arr!48664 a!2804) i!961)))))

(declare-fun b!1513326 () Bool)

(declare-fun res!1033439 () Bool)

(declare-fun e!844566 () Bool)

(assert (=> b!1513326 (=> (not res!1033439) (not e!844566))))

(declare-fun lt!655764 () SeekEntryResult!12858)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100852 (_ BitVec 32)) SeekEntryResult!12858)

(assert (=> b!1513326 (= res!1033439 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48664 a!2804) j!70) a!2804 mask!2512) lt!655764))))

(declare-fun b!1513327 () Bool)

(assert (=> b!1513327 (= e!844565 e!844569)))

(declare-fun res!1033432 () Bool)

(assert (=> b!1513327 (=> (not res!1033432) (not e!844569))))

(assert (=> b!1513327 (= res!1033432 (= (seekEntryOrOpen!0 (select (arr!48664 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48664 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513328 () Bool)

(assert (=> b!1513328 (= e!844568 e!844566)))

(declare-fun res!1033436 () Bool)

(assert (=> b!1513328 (=> (not res!1033436) (not e!844566))))

(declare-fun lt!655762 () SeekEntryResult!12858)

(assert (=> b!1513328 (= res!1033436 (= lt!655762 lt!655764))))

(assert (=> b!1513328 (= lt!655764 (Intermediate!12858 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513328 (= lt!655762 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48664 a!2804) j!70) mask!2512) (select (arr!48664 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513329 () Bool)

(declare-fun res!1033428 () Bool)

(assert (=> b!1513329 (=> (not res!1033428) (not e!844568))))

(assert (=> b!1513329 (= res!1033428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513330 () Bool)

(assert (=> b!1513330 (= e!844566 e!844563)))

(declare-fun res!1033430 () Bool)

(assert (=> b!1513330 (=> (not res!1033430) (not e!844563))))

(assert (=> b!1513330 (= res!1033430 (= lt!655762 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655760 mask!2512) lt!655760 lt!655761 mask!2512)))))

(assert (=> b!1513330 (= lt!655760 (select (store (arr!48664 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513330 (= lt!655761 (array!100853 (store (arr!48664 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49216 a!2804)))))

(assert (= (and start!128996 res!1033431) b!1513319))

(assert (= (and b!1513319 res!1033437) b!1513325))

(assert (= (and b!1513325 res!1033427) b!1513318))

(assert (= (and b!1513318 res!1033438) b!1513329))

(assert (= (and b!1513329 res!1033428) b!1513317))

(assert (= (and b!1513317 res!1033435) b!1513321))

(assert (= (and b!1513321 res!1033429) b!1513328))

(assert (= (and b!1513328 res!1033436) b!1513326))

(assert (= (and b!1513326 res!1033439) b!1513330))

(assert (= (and b!1513330 res!1033430) b!1513322))

(assert (= (and b!1513322 res!1033434) b!1513320))

(assert (= (and b!1513320 res!1033426) b!1513323))

(assert (= (and b!1513323 (not res!1033433)) b!1513327))

(assert (= (and b!1513327 res!1033432) b!1513324))

(declare-fun m!1395629 () Bool)

(assert (=> b!1513330 m!1395629))

(assert (=> b!1513330 m!1395629))

(declare-fun m!1395631 () Bool)

(assert (=> b!1513330 m!1395631))

(declare-fun m!1395633 () Bool)

(assert (=> b!1513330 m!1395633))

(declare-fun m!1395635 () Bool)

(assert (=> b!1513330 m!1395635))

(declare-fun m!1395637 () Bool)

(assert (=> b!1513327 m!1395637))

(assert (=> b!1513327 m!1395637))

(declare-fun m!1395639 () Bool)

(assert (=> b!1513327 m!1395639))

(assert (=> b!1513327 m!1395637))

(declare-fun m!1395641 () Bool)

(assert (=> b!1513327 m!1395641))

(declare-fun m!1395643 () Bool)

(assert (=> b!1513322 m!1395643))

(declare-fun m!1395645 () Bool)

(assert (=> b!1513322 m!1395645))

(declare-fun m!1395647 () Bool)

(assert (=> b!1513329 m!1395647))

(assert (=> b!1513326 m!1395637))

(assert (=> b!1513326 m!1395637))

(declare-fun m!1395649 () Bool)

(assert (=> b!1513326 m!1395649))

(assert (=> b!1513320 m!1395637))

(assert (=> b!1513320 m!1395637))

(declare-fun m!1395651 () Bool)

(assert (=> b!1513320 m!1395651))

(declare-fun m!1395653 () Bool)

(assert (=> b!1513317 m!1395653))

(declare-fun m!1395655 () Bool)

(assert (=> start!128996 m!1395655))

(declare-fun m!1395657 () Bool)

(assert (=> start!128996 m!1395657))

(assert (=> b!1513318 m!1395637))

(assert (=> b!1513318 m!1395637))

(declare-fun m!1395659 () Bool)

(assert (=> b!1513318 m!1395659))

(declare-fun m!1395661 () Bool)

(assert (=> b!1513325 m!1395661))

(assert (=> b!1513325 m!1395661))

(declare-fun m!1395663 () Bool)

(assert (=> b!1513325 m!1395663))

(assert (=> b!1513323 m!1395637))

(declare-fun m!1395665 () Bool)

(assert (=> b!1513323 m!1395665))

(assert (=> b!1513328 m!1395637))

(assert (=> b!1513328 m!1395637))

(declare-fun m!1395667 () Bool)

(assert (=> b!1513328 m!1395667))

(assert (=> b!1513328 m!1395667))

(assert (=> b!1513328 m!1395637))

(declare-fun m!1395669 () Bool)

(assert (=> b!1513328 m!1395669))

(declare-fun m!1395671 () Bool)

(assert (=> b!1513324 m!1395671))

(declare-fun m!1395673 () Bool)

(assert (=> b!1513324 m!1395673))

(check-sat (not b!1513330) (not b!1513328) (not b!1513322) (not b!1513324) (not b!1513318) (not b!1513329) (not start!128996) (not b!1513325) (not b!1513326) (not b!1513327) (not b!1513317) (not b!1513320))
(check-sat)
