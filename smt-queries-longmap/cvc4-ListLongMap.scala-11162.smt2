; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130518 () Bool)

(assert start!130518)

(declare-fun b!1531538 () Bool)

(declare-fun e!853389 () Bool)

(declare-fun e!853391 () Bool)

(assert (=> b!1531538 (= e!853389 e!853391)))

(declare-fun res!1048688 () Bool)

(assert (=> b!1531538 (=> res!1048688 e!853391)))

(declare-datatypes ((array!101697 0))(
  ( (array!101698 (arr!49069 (Array (_ BitVec 32) (_ BitVec 64))) (size!49619 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101697)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!663286 () (_ BitVec 32))

(assert (=> b!1531538 (= res!1048688 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663286 #b00000000000000000000000000000000) (bvsge lt!663286 (size!49619 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531538 (= lt!663286 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1531539 () Bool)

(declare-fun e!853393 () Bool)

(assert (=> b!1531539 (= e!853393 (not e!853389))))

(declare-fun res!1048690 () Bool)

(assert (=> b!1531539 (=> res!1048690 e!853389)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1531539 (= res!1048690 (or (not (= (select (arr!49069 a!2804) j!70) (select (store (arr!49069 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!853392 () Bool)

(assert (=> b!1531539 e!853392))

(declare-fun res!1048685 () Bool)

(assert (=> b!1531539 (=> (not res!1048685) (not e!853392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101697 (_ BitVec 32)) Bool)

(assert (=> b!1531539 (= res!1048685 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51252 0))(
  ( (Unit!51253) )
))
(declare-fun lt!663283 () Unit!51252)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101697 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51252)

(assert (=> b!1531539 (= lt!663283 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531540 () Bool)

(assert (=> b!1531540 (= e!853391 true)))

(declare-datatypes ((SeekEntryResult!13234 0))(
  ( (MissingZero!13234 (index!55331 (_ BitVec 32))) (Found!13234 (index!55332 (_ BitVec 32))) (Intermediate!13234 (undefined!14046 Bool) (index!55333 (_ BitVec 32)) (x!137028 (_ BitVec 32))) (Undefined!13234) (MissingVacant!13234 (index!55334 (_ BitVec 32))) )
))
(declare-fun lt!663284 () SeekEntryResult!13234)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101697 (_ BitVec 32)) SeekEntryResult!13234)

(assert (=> b!1531540 (= lt!663284 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663286 (select (arr!49069 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531541 () Bool)

(declare-fun res!1048687 () Bool)

(assert (=> b!1531541 (=> (not res!1048687) (not e!853393))))

(declare-fun lt!663285 () SeekEntryResult!13234)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531541 (= res!1048687 (= lt!663285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49069 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49069 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101698 (store (arr!49069 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49619 a!2804)) mask!2512)))))

(declare-fun b!1531542 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101697 (_ BitVec 32)) SeekEntryResult!13234)

(assert (=> b!1531542 (= e!853392 (= (seekEntry!0 (select (arr!49069 a!2804) j!70) a!2804 mask!2512) (Found!13234 j!70)))))

(declare-fun b!1531543 () Bool)

(declare-fun res!1048689 () Bool)

(assert (=> b!1531543 (=> (not res!1048689) (not e!853393))))

(declare-fun lt!663282 () SeekEntryResult!13234)

(assert (=> b!1531543 (= res!1048689 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49069 a!2804) j!70) a!2804 mask!2512) lt!663282))))

(declare-fun b!1531544 () Bool)

(declare-fun res!1048686 () Bool)

(declare-fun e!853390 () Bool)

(assert (=> b!1531544 (=> (not res!1048686) (not e!853390))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531544 (= res!1048686 (validKeyInArray!0 (select (arr!49069 a!2804) i!961)))))

(declare-fun b!1531545 () Bool)

(assert (=> b!1531545 (= e!853390 e!853393)))

(declare-fun res!1048678 () Bool)

(assert (=> b!1531545 (=> (not res!1048678) (not e!853393))))

(assert (=> b!1531545 (= res!1048678 (= lt!663285 lt!663282))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1531545 (= lt!663282 (Intermediate!13234 false resIndex!21 resX!21))))

(assert (=> b!1531545 (= lt!663285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49069 a!2804) j!70) mask!2512) (select (arr!49069 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531546 () Bool)

(declare-fun res!1048683 () Bool)

(assert (=> b!1531546 (=> (not res!1048683) (not e!853390))))

(assert (=> b!1531546 (= res!1048683 (and (= (size!49619 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49619 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49619 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531547 () Bool)

(declare-fun res!1048679 () Bool)

(assert (=> b!1531547 (=> (not res!1048679) (not e!853390))))

(assert (=> b!1531547 (= res!1048679 (validKeyInArray!0 (select (arr!49069 a!2804) j!70)))))

(declare-fun res!1048681 () Bool)

(assert (=> start!130518 (=> (not res!1048681) (not e!853390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130518 (= res!1048681 (validMask!0 mask!2512))))

(assert (=> start!130518 e!853390))

(assert (=> start!130518 true))

(declare-fun array_inv!38097 (array!101697) Bool)

(assert (=> start!130518 (array_inv!38097 a!2804)))

(declare-fun b!1531548 () Bool)

(declare-fun res!1048682 () Bool)

(assert (=> b!1531548 (=> (not res!1048682) (not e!853390))))

(declare-datatypes ((List!35552 0))(
  ( (Nil!35549) (Cons!35548 (h!36993 (_ BitVec 64)) (t!50246 List!35552)) )
))
(declare-fun arrayNoDuplicates!0 (array!101697 (_ BitVec 32) List!35552) Bool)

(assert (=> b!1531548 (= res!1048682 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35549))))

(declare-fun b!1531549 () Bool)

(declare-fun res!1048684 () Bool)

(assert (=> b!1531549 (=> (not res!1048684) (not e!853390))))

(assert (=> b!1531549 (= res!1048684 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49619 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49619 a!2804))))))

(declare-fun b!1531550 () Bool)

(declare-fun res!1048680 () Bool)

(assert (=> b!1531550 (=> (not res!1048680) (not e!853390))))

(assert (=> b!1531550 (= res!1048680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!130518 res!1048681) b!1531546))

(assert (= (and b!1531546 res!1048683) b!1531544))

(assert (= (and b!1531544 res!1048686) b!1531547))

(assert (= (and b!1531547 res!1048679) b!1531550))

(assert (= (and b!1531550 res!1048680) b!1531548))

(assert (= (and b!1531548 res!1048682) b!1531549))

(assert (= (and b!1531549 res!1048684) b!1531545))

(assert (= (and b!1531545 res!1048678) b!1531543))

(assert (= (and b!1531543 res!1048689) b!1531541))

(assert (= (and b!1531541 res!1048687) b!1531539))

(assert (= (and b!1531539 res!1048685) b!1531542))

(assert (= (and b!1531539 (not res!1048690)) b!1531538))

(assert (= (and b!1531538 (not res!1048688)) b!1531540))

(declare-fun m!1414199 () Bool)

(assert (=> b!1531540 m!1414199))

(assert (=> b!1531540 m!1414199))

(declare-fun m!1414201 () Bool)

(assert (=> b!1531540 m!1414201))

(assert (=> b!1531545 m!1414199))

(assert (=> b!1531545 m!1414199))

(declare-fun m!1414203 () Bool)

(assert (=> b!1531545 m!1414203))

(assert (=> b!1531545 m!1414203))

(assert (=> b!1531545 m!1414199))

(declare-fun m!1414205 () Bool)

(assert (=> b!1531545 m!1414205))

(assert (=> b!1531542 m!1414199))

(assert (=> b!1531542 m!1414199))

(declare-fun m!1414207 () Bool)

(assert (=> b!1531542 m!1414207))

(declare-fun m!1414209 () Bool)

(assert (=> b!1531550 m!1414209))

(declare-fun m!1414211 () Bool)

(assert (=> b!1531544 m!1414211))

(assert (=> b!1531544 m!1414211))

(declare-fun m!1414213 () Bool)

(assert (=> b!1531544 m!1414213))

(declare-fun m!1414215 () Bool)

(assert (=> start!130518 m!1414215))

(declare-fun m!1414217 () Bool)

(assert (=> start!130518 m!1414217))

(declare-fun m!1414219 () Bool)

(assert (=> b!1531541 m!1414219))

(declare-fun m!1414221 () Bool)

(assert (=> b!1531541 m!1414221))

(assert (=> b!1531541 m!1414221))

(declare-fun m!1414223 () Bool)

(assert (=> b!1531541 m!1414223))

(assert (=> b!1531541 m!1414223))

(assert (=> b!1531541 m!1414221))

(declare-fun m!1414225 () Bool)

(assert (=> b!1531541 m!1414225))

(assert (=> b!1531543 m!1414199))

(assert (=> b!1531543 m!1414199))

(declare-fun m!1414227 () Bool)

(assert (=> b!1531543 m!1414227))

(assert (=> b!1531547 m!1414199))

(assert (=> b!1531547 m!1414199))

(declare-fun m!1414229 () Bool)

(assert (=> b!1531547 m!1414229))

(assert (=> b!1531539 m!1414199))

(declare-fun m!1414231 () Bool)

(assert (=> b!1531539 m!1414231))

(assert (=> b!1531539 m!1414219))

(assert (=> b!1531539 m!1414221))

(declare-fun m!1414233 () Bool)

(assert (=> b!1531539 m!1414233))

(declare-fun m!1414235 () Bool)

(assert (=> b!1531548 m!1414235))

(declare-fun m!1414237 () Bool)

(assert (=> b!1531538 m!1414237))

(push 1)

(assert (not b!1531547))

