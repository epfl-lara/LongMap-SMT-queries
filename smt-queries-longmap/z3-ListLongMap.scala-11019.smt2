; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128948 () Bool)

(assert start!128948)

(declare-fun b!1511642 () Bool)

(declare-fun res!1031548 () Bool)

(declare-fun e!843897 () Bool)

(assert (=> b!1511642 (=> (not res!1031548) (not e!843897))))

(declare-datatypes ((SeekEntryResult!12810 0))(
  ( (MissingZero!12810 (index!53635 (_ BitVec 32))) (Found!12810 (index!53636 (_ BitVec 32))) (Intermediate!12810 (undefined!13622 Bool) (index!53637 (_ BitVec 32)) (x!135368 (_ BitVec 32))) (Undefined!12810) (MissingVacant!12810 (index!53638 (_ BitVec 32))) )
))
(declare-fun lt!655495 () SeekEntryResult!12810)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100804 0))(
  ( (array!100805 (arr!48639 (Array (_ BitVec 32) (_ BitVec 64))) (size!49189 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100804)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100804 (_ BitVec 32)) SeekEntryResult!12810)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511642 (= res!1031548 (= lt!655495 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48639 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48639 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100805 (store (arr!48639 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49189 a!2804)) mask!2512)))))

(declare-fun b!1511643 () Bool)

(declare-fun res!1031557 () Bool)

(declare-fun e!843899 () Bool)

(assert (=> b!1511643 (=> (not res!1031557) (not e!843899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100804 (_ BitVec 32)) Bool)

(assert (=> b!1511643 (= res!1031557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511644 () Bool)

(declare-fun res!1031549 () Bool)

(declare-fun e!843898 () Bool)

(assert (=> b!1511644 (=> (not res!1031549) (not e!843898))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100804 (_ BitVec 32)) SeekEntryResult!12810)

(assert (=> b!1511644 (= res!1031549 (= (seekEntry!0 (select (arr!48639 a!2804) j!70) a!2804 mask!2512) (Found!12810 j!70)))))

(declare-fun b!1511645 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun e!843900 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100804 (_ BitVec 32)) SeekEntryResult!12810)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100804 (_ BitVec 32)) SeekEntryResult!12810)

(assert (=> b!1511645 (= e!843900 (= (seekEntryOrOpen!0 (select (arr!48639 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48639 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun res!1031547 () Bool)

(assert (=> start!128948 (=> (not res!1031547) (not e!843899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128948 (= res!1031547 (validMask!0 mask!2512))))

(assert (=> start!128948 e!843899))

(assert (=> start!128948 true))

(declare-fun array_inv!37667 (array!100804) Bool)

(assert (=> start!128948 (array_inv!37667 a!2804)))

(declare-fun b!1511646 () Bool)

(assert (=> b!1511646 (= e!843897 (not true))))

(assert (=> b!1511646 e!843898))

(declare-fun res!1031551 () Bool)

(assert (=> b!1511646 (=> (not res!1031551) (not e!843898))))

(assert (=> b!1511646 (= res!1031551 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50488 0))(
  ( (Unit!50489) )
))
(declare-fun lt!655494 () Unit!50488)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100804 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50488)

(assert (=> b!1511646 (= lt!655494 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511647 () Bool)

(declare-fun res!1031550 () Bool)

(assert (=> b!1511647 (=> (not res!1031550) (not e!843899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511647 (= res!1031550 (validKeyInArray!0 (select (arr!48639 a!2804) i!961)))))

(declare-fun b!1511648 () Bool)

(assert (=> b!1511648 (= e!843899 e!843897)))

(declare-fun res!1031555 () Bool)

(assert (=> b!1511648 (=> (not res!1031555) (not e!843897))))

(declare-fun lt!655493 () SeekEntryResult!12810)

(assert (=> b!1511648 (= res!1031555 (= lt!655495 lt!655493))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1511648 (= lt!655493 (Intermediate!12810 false resIndex!21 resX!21))))

(assert (=> b!1511648 (= lt!655495 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48639 a!2804) j!70) mask!2512) (select (arr!48639 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511649 () Bool)

(declare-fun res!1031554 () Bool)

(assert (=> b!1511649 (=> (not res!1031554) (not e!843899))))

(assert (=> b!1511649 (= res!1031554 (and (= (size!49189 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49189 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49189 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511650 () Bool)

(declare-fun res!1031546 () Bool)

(assert (=> b!1511650 (=> (not res!1031546) (not e!843899))))

(assert (=> b!1511650 (= res!1031546 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49189 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49189 a!2804))))))

(declare-fun b!1511651 () Bool)

(declare-fun res!1031553 () Bool)

(assert (=> b!1511651 (=> (not res!1031553) (not e!843899))))

(declare-datatypes ((List!35122 0))(
  ( (Nil!35119) (Cons!35118 (h!36530 (_ BitVec 64)) (t!49816 List!35122)) )
))
(declare-fun arrayNoDuplicates!0 (array!100804 (_ BitVec 32) List!35122) Bool)

(assert (=> b!1511651 (= res!1031553 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35119))))

(declare-fun b!1511652 () Bool)

(assert (=> b!1511652 (= e!843898 e!843900)))

(declare-fun res!1031556 () Bool)

(assert (=> b!1511652 (=> res!1031556 e!843900)))

(assert (=> b!1511652 (= res!1031556 (or (not (= (select (arr!48639 a!2804) j!70) (select (store (arr!48639 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48639 a!2804) index!487) (select (arr!48639 a!2804) j!70)) (not (= (select (arr!48639 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1511653 () Bool)

(declare-fun res!1031545 () Bool)

(assert (=> b!1511653 (=> (not res!1031545) (not e!843897))))

(assert (=> b!1511653 (= res!1031545 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48639 a!2804) j!70) a!2804 mask!2512) lt!655493))))

(declare-fun b!1511654 () Bool)

(declare-fun res!1031552 () Bool)

(assert (=> b!1511654 (=> (not res!1031552) (not e!843899))))

(assert (=> b!1511654 (= res!1031552 (validKeyInArray!0 (select (arr!48639 a!2804) j!70)))))

(assert (= (and start!128948 res!1031547) b!1511649))

(assert (= (and b!1511649 res!1031554) b!1511647))

(assert (= (and b!1511647 res!1031550) b!1511654))

(assert (= (and b!1511654 res!1031552) b!1511643))

(assert (= (and b!1511643 res!1031557) b!1511651))

(assert (= (and b!1511651 res!1031553) b!1511650))

(assert (= (and b!1511650 res!1031546) b!1511648))

(assert (= (and b!1511648 res!1031555) b!1511653))

(assert (= (and b!1511653 res!1031545) b!1511642))

(assert (= (and b!1511642 res!1031548) b!1511646))

(assert (= (and b!1511646 res!1031551) b!1511644))

(assert (= (and b!1511644 res!1031549) b!1511652))

(assert (= (and b!1511652 (not res!1031556)) b!1511645))

(declare-fun m!1394353 () Bool)

(assert (=> b!1511653 m!1394353))

(assert (=> b!1511653 m!1394353))

(declare-fun m!1394355 () Bool)

(assert (=> b!1511653 m!1394355))

(assert (=> b!1511645 m!1394353))

(assert (=> b!1511645 m!1394353))

(declare-fun m!1394357 () Bool)

(assert (=> b!1511645 m!1394357))

(assert (=> b!1511645 m!1394353))

(declare-fun m!1394359 () Bool)

(assert (=> b!1511645 m!1394359))

(declare-fun m!1394361 () Bool)

(assert (=> b!1511642 m!1394361))

(declare-fun m!1394363 () Bool)

(assert (=> b!1511642 m!1394363))

(assert (=> b!1511642 m!1394363))

(declare-fun m!1394365 () Bool)

(assert (=> b!1511642 m!1394365))

(assert (=> b!1511642 m!1394365))

(assert (=> b!1511642 m!1394363))

(declare-fun m!1394367 () Bool)

(assert (=> b!1511642 m!1394367))

(assert (=> b!1511654 m!1394353))

(assert (=> b!1511654 m!1394353))

(declare-fun m!1394369 () Bool)

(assert (=> b!1511654 m!1394369))

(declare-fun m!1394371 () Bool)

(assert (=> b!1511647 m!1394371))

(assert (=> b!1511647 m!1394371))

(declare-fun m!1394373 () Bool)

(assert (=> b!1511647 m!1394373))

(assert (=> b!1511652 m!1394353))

(assert (=> b!1511652 m!1394361))

(assert (=> b!1511652 m!1394363))

(declare-fun m!1394375 () Bool)

(assert (=> b!1511652 m!1394375))

(assert (=> b!1511648 m!1394353))

(assert (=> b!1511648 m!1394353))

(declare-fun m!1394377 () Bool)

(assert (=> b!1511648 m!1394377))

(assert (=> b!1511648 m!1394377))

(assert (=> b!1511648 m!1394353))

(declare-fun m!1394379 () Bool)

(assert (=> b!1511648 m!1394379))

(declare-fun m!1394381 () Bool)

(assert (=> b!1511643 m!1394381))

(declare-fun m!1394383 () Bool)

(assert (=> b!1511651 m!1394383))

(declare-fun m!1394385 () Bool)

(assert (=> b!1511646 m!1394385))

(declare-fun m!1394387 () Bool)

(assert (=> b!1511646 m!1394387))

(assert (=> b!1511644 m!1394353))

(assert (=> b!1511644 m!1394353))

(declare-fun m!1394389 () Bool)

(assert (=> b!1511644 m!1394389))

(declare-fun m!1394391 () Bool)

(assert (=> start!128948 m!1394391))

(declare-fun m!1394393 () Bool)

(assert (=> start!128948 m!1394393))

(check-sat (not b!1511654) (not b!1511651) (not b!1511653) (not b!1511642) (not b!1511645) (not b!1511646) (not start!128948) (not b!1511648) (not b!1511643) (not b!1511644) (not b!1511647))
(check-sat)
