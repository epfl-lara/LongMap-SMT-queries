; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128998 () Bool)

(assert start!128998)

(declare-fun res!1032532 () Bool)

(declare-fun e!844282 () Bool)

(assert (=> start!128998 (=> (not res!1032532) (not e!844282))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128998 (= res!1032532 (validMask!0 mask!2512))))

(assert (=> start!128998 e!844282))

(assert (=> start!128998 true))

(declare-datatypes ((array!100854 0))(
  ( (array!100855 (arr!48664 (Array (_ BitVec 32) (_ BitVec 64))) (size!49214 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100854)

(declare-fun array_inv!37692 (array!100854) Bool)

(assert (=> start!128998 (array_inv!37692 a!2804)))

(declare-fun b!1512626 () Bool)

(declare-fun res!1032540 () Bool)

(assert (=> b!1512626 (=> (not res!1032540) (not e!844282))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1512626 (= res!1032540 (and (= (size!49214 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49214 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49214 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512627 () Bool)

(declare-fun res!1032533 () Bool)

(assert (=> b!1512627 (=> (not res!1032533) (not e!844282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512627 (= res!1032533 (validKeyInArray!0 (select (arr!48664 a!2804) j!70)))))

(declare-fun b!1512628 () Bool)

(declare-fun res!1032541 () Bool)

(assert (=> b!1512628 (=> (not res!1032541) (not e!844282))))

(assert (=> b!1512628 (= res!1032541 (validKeyInArray!0 (select (arr!48664 a!2804) i!961)))))

(declare-fun b!1512629 () Bool)

(declare-fun res!1032538 () Bool)

(assert (=> b!1512629 (=> (not res!1032538) (not e!844282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100854 (_ BitVec 32)) Bool)

(assert (=> b!1512629 (= res!1032538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512630 () Bool)

(declare-fun res!1032536 () Bool)

(assert (=> b!1512630 (=> (not res!1032536) (not e!844282))))

(declare-datatypes ((List!35147 0))(
  ( (Nil!35144) (Cons!35143 (h!36555 (_ BitVec 64)) (t!49841 List!35147)) )
))
(declare-fun arrayNoDuplicates!0 (array!100854 (_ BitVec 32) List!35147) Bool)

(assert (=> b!1512630 (= res!1032536 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35144))))

(declare-fun b!1512631 () Bool)

(declare-fun e!844284 () Bool)

(assert (=> b!1512631 (= e!844284 (not true))))

(declare-fun e!844283 () Bool)

(assert (=> b!1512631 e!844283))

(declare-fun res!1032535 () Bool)

(assert (=> b!1512631 (=> (not res!1032535) (not e!844283))))

(assert (=> b!1512631 (= res!1032535 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50538 0))(
  ( (Unit!50539) )
))
(declare-fun lt!655718 () Unit!50538)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100854 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50538)

(assert (=> b!1512631 (= lt!655718 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512632 () Bool)

(declare-fun res!1032534 () Bool)

(assert (=> b!1512632 (=> (not res!1032534) (not e!844282))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512632 (= res!1032534 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49214 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49214 a!2804))))))

(declare-fun b!1512633 () Bool)

(declare-fun e!844281 () Bool)

(declare-datatypes ((SeekEntryResult!12835 0))(
  ( (MissingZero!12835 (index!53735 (_ BitVec 32))) (Found!12835 (index!53736 (_ BitVec 32))) (Intermediate!12835 (undefined!13647 Bool) (index!53737 (_ BitVec 32)) (x!135457 (_ BitVec 32))) (Undefined!12835) (MissingVacant!12835 (index!53738 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100854 (_ BitVec 32)) SeekEntryResult!12835)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100854 (_ BitVec 32)) SeekEntryResult!12835)

(assert (=> b!1512633 (= e!844281 (= (seekEntryOrOpen!0 (select (arr!48664 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48664 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512634 () Bool)

(assert (=> b!1512634 (= e!844283 e!844281)))

(declare-fun res!1032531 () Bool)

(assert (=> b!1512634 (=> res!1032531 e!844281)))

(assert (=> b!1512634 (= res!1032531 (or (not (= (select (arr!48664 a!2804) j!70) (select (store (arr!48664 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48664 a!2804) index!487) (select (arr!48664 a!2804) j!70)) (not (= (select (arr!48664 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512635 () Bool)

(declare-fun res!1032537 () Bool)

(assert (=> b!1512635 (=> (not res!1032537) (not e!844283))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100854 (_ BitVec 32)) SeekEntryResult!12835)

(assert (=> b!1512635 (= res!1032537 (= (seekEntry!0 (select (arr!48664 a!2804) j!70) a!2804 mask!2512) (Found!12835 j!70)))))

(declare-fun b!1512636 () Bool)

(assert (=> b!1512636 (= e!844282 e!844284)))

(declare-fun res!1032529 () Bool)

(assert (=> b!1512636 (=> (not res!1032529) (not e!844284))))

(declare-fun lt!655719 () SeekEntryResult!12835)

(declare-fun lt!655720 () SeekEntryResult!12835)

(assert (=> b!1512636 (= res!1032529 (= lt!655719 lt!655720))))

(assert (=> b!1512636 (= lt!655720 (Intermediate!12835 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100854 (_ BitVec 32)) SeekEntryResult!12835)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512636 (= lt!655719 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48664 a!2804) j!70) mask!2512) (select (arr!48664 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512637 () Bool)

(declare-fun res!1032530 () Bool)

(assert (=> b!1512637 (=> (not res!1032530) (not e!844284))))

(assert (=> b!1512637 (= res!1032530 (= lt!655719 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48664 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48664 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100855 (store (arr!48664 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49214 a!2804)) mask!2512)))))

(declare-fun b!1512638 () Bool)

(declare-fun res!1032539 () Bool)

(assert (=> b!1512638 (=> (not res!1032539) (not e!844284))))

(assert (=> b!1512638 (= res!1032539 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48664 a!2804) j!70) a!2804 mask!2512) lt!655720))))

(assert (= (and start!128998 res!1032532) b!1512626))

(assert (= (and b!1512626 res!1032540) b!1512628))

(assert (= (and b!1512628 res!1032541) b!1512627))

(assert (= (and b!1512627 res!1032533) b!1512629))

(assert (= (and b!1512629 res!1032538) b!1512630))

(assert (= (and b!1512630 res!1032536) b!1512632))

(assert (= (and b!1512632 res!1032534) b!1512636))

(assert (= (and b!1512636 res!1032529) b!1512638))

(assert (= (and b!1512638 res!1032539) b!1512637))

(assert (= (and b!1512637 res!1032530) b!1512631))

(assert (= (and b!1512631 res!1032535) b!1512635))

(assert (= (and b!1512635 res!1032537) b!1512634))

(assert (= (and b!1512634 (not res!1032531)) b!1512633))

(declare-fun m!1395409 () Bool)

(assert (=> b!1512630 m!1395409))

(declare-fun m!1395411 () Bool)

(assert (=> b!1512637 m!1395411))

(declare-fun m!1395413 () Bool)

(assert (=> b!1512637 m!1395413))

(assert (=> b!1512637 m!1395413))

(declare-fun m!1395415 () Bool)

(assert (=> b!1512637 m!1395415))

(assert (=> b!1512637 m!1395415))

(assert (=> b!1512637 m!1395413))

(declare-fun m!1395417 () Bool)

(assert (=> b!1512637 m!1395417))

(declare-fun m!1395419 () Bool)

(assert (=> b!1512628 m!1395419))

(assert (=> b!1512628 m!1395419))

(declare-fun m!1395421 () Bool)

(assert (=> b!1512628 m!1395421))

(declare-fun m!1395423 () Bool)

(assert (=> b!1512636 m!1395423))

(assert (=> b!1512636 m!1395423))

(declare-fun m!1395425 () Bool)

(assert (=> b!1512636 m!1395425))

(assert (=> b!1512636 m!1395425))

(assert (=> b!1512636 m!1395423))

(declare-fun m!1395427 () Bool)

(assert (=> b!1512636 m!1395427))

(declare-fun m!1395429 () Bool)

(assert (=> b!1512631 m!1395429))

(declare-fun m!1395431 () Bool)

(assert (=> b!1512631 m!1395431))

(declare-fun m!1395433 () Bool)

(assert (=> b!1512629 m!1395433))

(declare-fun m!1395435 () Bool)

(assert (=> start!128998 m!1395435))

(declare-fun m!1395437 () Bool)

(assert (=> start!128998 m!1395437))

(assert (=> b!1512633 m!1395423))

(assert (=> b!1512633 m!1395423))

(declare-fun m!1395439 () Bool)

(assert (=> b!1512633 m!1395439))

(assert (=> b!1512633 m!1395423))

(declare-fun m!1395441 () Bool)

(assert (=> b!1512633 m!1395441))

(assert (=> b!1512635 m!1395423))

(assert (=> b!1512635 m!1395423))

(declare-fun m!1395443 () Bool)

(assert (=> b!1512635 m!1395443))

(assert (=> b!1512627 m!1395423))

(assert (=> b!1512627 m!1395423))

(declare-fun m!1395445 () Bool)

(assert (=> b!1512627 m!1395445))

(assert (=> b!1512638 m!1395423))

(assert (=> b!1512638 m!1395423))

(declare-fun m!1395447 () Bool)

(assert (=> b!1512638 m!1395447))

(assert (=> b!1512634 m!1395423))

(assert (=> b!1512634 m!1395411))

(assert (=> b!1512634 m!1395413))

(declare-fun m!1395449 () Bool)

(assert (=> b!1512634 m!1395449))

(push 1)

