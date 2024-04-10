; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129242 () Bool)

(assert start!129242)

(declare-fun b!1517474 () Bool)

(declare-fun res!1037382 () Bool)

(declare-fun e!846633 () Bool)

(assert (=> b!1517474 (=> (not res!1037382) (not e!846633))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101098 0))(
  ( (array!101099 (arr!48786 (Array (_ BitVec 32) (_ BitVec 64))) (size!49336 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101098)

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1517474 (= res!1037382 (and (= (size!49336 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49336 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49336 a!2804)) (not (= i!961 j!70))))))

(declare-fun e!846630 () Bool)

(declare-fun b!1517475 () Bool)

(declare-datatypes ((SeekEntryResult!12957 0))(
  ( (MissingZero!12957 (index!54223 (_ BitVec 32))) (Found!12957 (index!54224 (_ BitVec 32))) (Intermediate!12957 (undefined!13769 Bool) (index!54225 (_ BitVec 32)) (x!135907 (_ BitVec 32))) (Undefined!12957) (MissingVacant!12957 (index!54226 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101098 (_ BitVec 32)) SeekEntryResult!12957)

(assert (=> b!1517475 (= e!846630 (= (seekEntry!0 (select (arr!48786 a!2804) j!70) a!2804 mask!2512) (Found!12957 j!70)))))

(declare-fun b!1517476 () Bool)

(declare-fun res!1037381 () Bool)

(declare-fun e!846634 () Bool)

(assert (=> b!1517476 (=> (not res!1037381) (not e!846634))))

(declare-fun lt!657802 () SeekEntryResult!12957)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101098 (_ BitVec 32)) SeekEntryResult!12957)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517476 (= res!1037381 (= lt!657802 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48786 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48786 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101099 (store (arr!48786 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49336 a!2804)) mask!2512)))))

(declare-fun b!1517477 () Bool)

(declare-fun res!1037378 () Bool)

(assert (=> b!1517477 (=> (not res!1037378) (not e!846633))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517477 (= res!1037378 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49336 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49336 a!2804))))))

(declare-fun b!1517478 () Bool)

(assert (=> b!1517478 (= e!846633 e!846634)))

(declare-fun res!1037386 () Bool)

(assert (=> b!1517478 (=> (not res!1037386) (not e!846634))))

(declare-fun lt!657799 () SeekEntryResult!12957)

(assert (=> b!1517478 (= res!1037386 (= lt!657802 lt!657799))))

(assert (=> b!1517478 (= lt!657799 (Intermediate!12957 false resIndex!21 resX!21))))

(assert (=> b!1517478 (= lt!657802 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48786 a!2804) j!70) mask!2512) (select (arr!48786 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517479 () Bool)

(declare-fun res!1037384 () Bool)

(assert (=> b!1517479 (=> (not res!1037384) (not e!846633))))

(declare-datatypes ((List!35269 0))(
  ( (Nil!35266) (Cons!35265 (h!36677 (_ BitVec 64)) (t!49963 List!35269)) )
))
(declare-fun arrayNoDuplicates!0 (array!101098 (_ BitVec 32) List!35269) Bool)

(assert (=> b!1517479 (= res!1037384 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35266))))

(declare-fun b!1517481 () Bool)

(declare-fun e!846632 () Bool)

(declare-fun e!846631 () Bool)

(assert (=> b!1517481 (= e!846632 e!846631)))

(declare-fun res!1037389 () Bool)

(assert (=> b!1517481 (=> res!1037389 e!846631)))

(declare-fun lt!657798 () (_ BitVec 32))

(assert (=> b!1517481 (= res!1037389 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657798 #b00000000000000000000000000000000) (bvsge lt!657798 (size!49336 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517481 (= lt!657798 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1517482 () Bool)

(declare-fun res!1037385 () Bool)

(assert (=> b!1517482 (=> (not res!1037385) (not e!846634))))

(assert (=> b!1517482 (= res!1037385 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48786 a!2804) j!70) a!2804 mask!2512) lt!657799))))

(declare-fun b!1517483 () Bool)

(assert (=> b!1517483 (= e!846631 true)))

(declare-fun lt!657800 () SeekEntryResult!12957)

(assert (=> b!1517483 (= lt!657800 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657798 (select (arr!48786 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517480 () Bool)

(declare-fun res!1037379 () Bool)

(assert (=> b!1517480 (=> (not res!1037379) (not e!846633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101098 (_ BitVec 32)) Bool)

(assert (=> b!1517480 (= res!1037379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1037387 () Bool)

(assert (=> start!129242 (=> (not res!1037387) (not e!846633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129242 (= res!1037387 (validMask!0 mask!2512))))

(assert (=> start!129242 e!846633))

(assert (=> start!129242 true))

(declare-fun array_inv!37814 (array!101098) Bool)

(assert (=> start!129242 (array_inv!37814 a!2804)))

(declare-fun b!1517484 () Bool)

(declare-fun res!1037383 () Bool)

(assert (=> b!1517484 (=> (not res!1037383) (not e!846633))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517484 (= res!1037383 (validKeyInArray!0 (select (arr!48786 a!2804) j!70)))))

(declare-fun b!1517485 () Bool)

(declare-fun res!1037380 () Bool)

(assert (=> b!1517485 (=> (not res!1037380) (not e!846633))))

(assert (=> b!1517485 (= res!1037380 (validKeyInArray!0 (select (arr!48786 a!2804) i!961)))))

(declare-fun b!1517486 () Bool)

(assert (=> b!1517486 (= e!846634 (not e!846632))))

(declare-fun res!1037388 () Bool)

(assert (=> b!1517486 (=> res!1037388 e!846632)))

(assert (=> b!1517486 (= res!1037388 (or (not (= (select (arr!48786 a!2804) j!70) (select (store (arr!48786 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1517486 e!846630))

(declare-fun res!1037377 () Bool)

(assert (=> b!1517486 (=> (not res!1037377) (not e!846630))))

(assert (=> b!1517486 (= res!1037377 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50782 0))(
  ( (Unit!50783) )
))
(declare-fun lt!657801 () Unit!50782)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50782)

(assert (=> b!1517486 (= lt!657801 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129242 res!1037387) b!1517474))

(assert (= (and b!1517474 res!1037382) b!1517485))

(assert (= (and b!1517485 res!1037380) b!1517484))

(assert (= (and b!1517484 res!1037383) b!1517480))

(assert (= (and b!1517480 res!1037379) b!1517479))

(assert (= (and b!1517479 res!1037384) b!1517477))

(assert (= (and b!1517477 res!1037378) b!1517478))

(assert (= (and b!1517478 res!1037386) b!1517482))

(assert (= (and b!1517482 res!1037385) b!1517476))

(assert (= (and b!1517476 res!1037381) b!1517486))

(assert (= (and b!1517486 res!1037377) b!1517475))

(assert (= (and b!1517486 (not res!1037388)) b!1517481))

(assert (= (and b!1517481 (not res!1037389)) b!1517483))

(declare-fun m!1400765 () Bool)

(assert (=> b!1517479 m!1400765))

(declare-fun m!1400767 () Bool)

(assert (=> b!1517476 m!1400767))

(declare-fun m!1400769 () Bool)

(assert (=> b!1517476 m!1400769))

(assert (=> b!1517476 m!1400769))

(declare-fun m!1400771 () Bool)

(assert (=> b!1517476 m!1400771))

(assert (=> b!1517476 m!1400771))

(assert (=> b!1517476 m!1400769))

(declare-fun m!1400773 () Bool)

(assert (=> b!1517476 m!1400773))

(declare-fun m!1400775 () Bool)

(assert (=> b!1517482 m!1400775))

(assert (=> b!1517482 m!1400775))

(declare-fun m!1400777 () Bool)

(assert (=> b!1517482 m!1400777))

(declare-fun m!1400779 () Bool)

(assert (=> start!129242 m!1400779))

(declare-fun m!1400781 () Bool)

(assert (=> start!129242 m!1400781))

(declare-fun m!1400783 () Bool)

(assert (=> b!1517481 m!1400783))

(assert (=> b!1517483 m!1400775))

(assert (=> b!1517483 m!1400775))

(declare-fun m!1400785 () Bool)

(assert (=> b!1517483 m!1400785))

(assert (=> b!1517475 m!1400775))

(assert (=> b!1517475 m!1400775))

(declare-fun m!1400787 () Bool)

(assert (=> b!1517475 m!1400787))

(declare-fun m!1400789 () Bool)

(assert (=> b!1517485 m!1400789))

(assert (=> b!1517485 m!1400789))

(declare-fun m!1400791 () Bool)

(assert (=> b!1517485 m!1400791))

(assert (=> b!1517486 m!1400775))

(declare-fun m!1400793 () Bool)

(assert (=> b!1517486 m!1400793))

(assert (=> b!1517486 m!1400767))

(assert (=> b!1517486 m!1400769))

(declare-fun m!1400795 () Bool)

(assert (=> b!1517486 m!1400795))

(assert (=> b!1517484 m!1400775))

(assert (=> b!1517484 m!1400775))

(declare-fun m!1400797 () Bool)

(assert (=> b!1517484 m!1400797))

(declare-fun m!1400799 () Bool)

(assert (=> b!1517480 m!1400799))

(assert (=> b!1517478 m!1400775))

(assert (=> b!1517478 m!1400775))

(declare-fun m!1400801 () Bool)

(assert (=> b!1517478 m!1400801))

(assert (=> b!1517478 m!1400801))

(assert (=> b!1517478 m!1400775))

(declare-fun m!1400803 () Bool)

(assert (=> b!1517478 m!1400803))

(check-sat (not b!1517476) (not b!1517479) (not b!1517481) (not b!1517483) (not start!129242) (not b!1517475) (not b!1517484) (not b!1517480) (not b!1517486) (not b!1517478) (not b!1517485) (not b!1517482))
(check-sat)
