; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129344 () Bool)

(assert start!129344)

(declare-fun b!1519534 () Bool)

(declare-fun res!1039446 () Bool)

(declare-fun e!847620 () Bool)

(assert (=> b!1519534 (=> (not res!1039446) (not e!847620))))

(declare-datatypes ((array!101200 0))(
  ( (array!101201 (arr!48837 (Array (_ BitVec 32) (_ BitVec 64))) (size!49387 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101200)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519534 (= res!1039446 (validKeyInArray!0 (select (arr!48837 a!2804) i!961)))))

(declare-fun b!1519535 () Bool)

(declare-fun e!847619 () Bool)

(assert (=> b!1519535 (= e!847620 e!847619)))

(declare-fun res!1039441 () Bool)

(assert (=> b!1519535 (=> (not res!1039441) (not e!847619))))

(declare-datatypes ((SeekEntryResult!13008 0))(
  ( (MissingZero!13008 (index!54427 (_ BitVec 32))) (Found!13008 (index!54428 (_ BitVec 32))) (Intermediate!13008 (undefined!13820 Bool) (index!54429 (_ BitVec 32)) (x!136094 (_ BitVec 32))) (Undefined!13008) (MissingVacant!13008 (index!54430 (_ BitVec 32))) )
))
(declare-fun lt!658699 () SeekEntryResult!13008)

(declare-fun lt!658697 () SeekEntryResult!13008)

(assert (=> b!1519535 (= res!1039441 (= lt!658699 lt!658697))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1519535 (= lt!658697 (Intermediate!13008 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101200 (_ BitVec 32)) SeekEntryResult!13008)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519535 (= lt!658699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48837 a!2804) j!70) mask!2512) (select (arr!48837 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519536 () Bool)

(declare-fun res!1039437 () Bool)

(assert (=> b!1519536 (=> (not res!1039437) (not e!847620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101200 (_ BitVec 32)) Bool)

(assert (=> b!1519536 (= res!1039437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519537 () Bool)

(declare-fun res!1039443 () Bool)

(assert (=> b!1519537 (=> (not res!1039443) (not e!847620))))

(declare-datatypes ((List!35320 0))(
  ( (Nil!35317) (Cons!35316 (h!36728 (_ BitVec 64)) (t!50014 List!35320)) )
))
(declare-fun arrayNoDuplicates!0 (array!101200 (_ BitVec 32) List!35320) Bool)

(assert (=> b!1519537 (= res!1039443 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35317))))

(declare-fun b!1519538 () Bool)

(declare-fun res!1039447 () Bool)

(assert (=> b!1519538 (=> (not res!1039447) (not e!847620))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1519538 (= res!1039447 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49387 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49387 a!2804))))))

(declare-fun b!1519540 () Bool)

(declare-fun res!1039445 () Bool)

(assert (=> b!1519540 (=> (not res!1039445) (not e!847619))))

(assert (=> b!1519540 (= res!1039445 (= lt!658699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48837 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48837 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101201 (store (arr!48837 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49387 a!2804)) mask!2512)))))

(declare-fun b!1519541 () Bool)

(declare-fun e!847621 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101200 (_ BitVec 32)) SeekEntryResult!13008)

(assert (=> b!1519541 (= e!847621 (= (seekEntry!0 (select (arr!48837 a!2804) j!70) a!2804 mask!2512) (Found!13008 j!70)))))

(declare-fun b!1519542 () Bool)

(declare-fun res!1039439 () Bool)

(assert (=> b!1519542 (=> (not res!1039439) (not e!847619))))

(assert (=> b!1519542 (= res!1039439 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48837 a!2804) j!70) a!2804 mask!2512) lt!658697))))

(declare-fun b!1519539 () Bool)

(declare-fun res!1039442 () Bool)

(assert (=> b!1519539 (=> (not res!1039442) (not e!847620))))

(assert (=> b!1519539 (= res!1039442 (validKeyInArray!0 (select (arr!48837 a!2804) j!70)))))

(declare-fun res!1039438 () Bool)

(assert (=> start!129344 (=> (not res!1039438) (not e!847620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129344 (= res!1039438 (validMask!0 mask!2512))))

(assert (=> start!129344 e!847620))

(assert (=> start!129344 true))

(declare-fun array_inv!37865 (array!101200) Bool)

(assert (=> start!129344 (array_inv!37865 a!2804)))

(declare-fun b!1519543 () Bool)

(assert (=> b!1519543 (= e!847619 (not (= (select (arr!48837 a!2804) j!70) (select (store (arr!48837 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))))

(assert (=> b!1519543 e!847621))

(declare-fun res!1039440 () Bool)

(assert (=> b!1519543 (=> (not res!1039440) (not e!847621))))

(assert (=> b!1519543 (= res!1039440 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50884 0))(
  ( (Unit!50885) )
))
(declare-fun lt!658698 () Unit!50884)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101200 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50884)

(assert (=> b!1519543 (= lt!658698 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519544 () Bool)

(declare-fun res!1039444 () Bool)

(assert (=> b!1519544 (=> (not res!1039444) (not e!847620))))

(assert (=> b!1519544 (= res!1039444 (and (= (size!49387 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49387 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49387 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129344 res!1039438) b!1519544))

(assert (= (and b!1519544 res!1039444) b!1519534))

(assert (= (and b!1519534 res!1039446) b!1519539))

(assert (= (and b!1519539 res!1039442) b!1519536))

(assert (= (and b!1519536 res!1039437) b!1519537))

(assert (= (and b!1519537 res!1039443) b!1519538))

(assert (= (and b!1519538 res!1039447) b!1519535))

(assert (= (and b!1519535 res!1039441) b!1519542))

(assert (= (and b!1519542 res!1039439) b!1519540))

(assert (= (and b!1519540 res!1039445) b!1519543))

(assert (= (and b!1519543 res!1039440) b!1519541))

(declare-fun m!1402951 () Bool)

(assert (=> b!1519542 m!1402951))

(assert (=> b!1519542 m!1402951))

(declare-fun m!1402953 () Bool)

(assert (=> b!1519542 m!1402953))

(declare-fun m!1402955 () Bool)

(assert (=> b!1519540 m!1402955))

(declare-fun m!1402957 () Bool)

(assert (=> b!1519540 m!1402957))

(assert (=> b!1519540 m!1402957))

(declare-fun m!1402959 () Bool)

(assert (=> b!1519540 m!1402959))

(assert (=> b!1519540 m!1402959))

(assert (=> b!1519540 m!1402957))

(declare-fun m!1402961 () Bool)

(assert (=> b!1519540 m!1402961))

(declare-fun m!1402963 () Bool)

(assert (=> b!1519536 m!1402963))

(assert (=> b!1519539 m!1402951))

(assert (=> b!1519539 m!1402951))

(declare-fun m!1402965 () Bool)

(assert (=> b!1519539 m!1402965))

(declare-fun m!1402967 () Bool)

(assert (=> start!129344 m!1402967))

(declare-fun m!1402969 () Bool)

(assert (=> start!129344 m!1402969))

(assert (=> b!1519535 m!1402951))

(assert (=> b!1519535 m!1402951))

(declare-fun m!1402971 () Bool)

(assert (=> b!1519535 m!1402971))

(assert (=> b!1519535 m!1402971))

(assert (=> b!1519535 m!1402951))

(declare-fun m!1402973 () Bool)

(assert (=> b!1519535 m!1402973))

(assert (=> b!1519543 m!1402951))

(declare-fun m!1402975 () Bool)

(assert (=> b!1519543 m!1402975))

(assert (=> b!1519543 m!1402955))

(assert (=> b!1519543 m!1402957))

(declare-fun m!1402977 () Bool)

(assert (=> b!1519543 m!1402977))

(declare-fun m!1402979 () Bool)

(assert (=> b!1519537 m!1402979))

(declare-fun m!1402981 () Bool)

(assert (=> b!1519534 m!1402981))

(assert (=> b!1519534 m!1402981))

(declare-fun m!1402983 () Bool)

(assert (=> b!1519534 m!1402983))

(assert (=> b!1519541 m!1402951))

(assert (=> b!1519541 m!1402951))

(declare-fun m!1402985 () Bool)

(assert (=> b!1519541 m!1402985))

(check-sat (not b!1519536) (not b!1519534) (not b!1519540) (not b!1519541) (not b!1519535) (not b!1519539) (not b!1519543) (not start!129344) (not b!1519542) (not b!1519537))
(check-sat)
