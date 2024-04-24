; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130908 () Bool)

(assert start!130908)

(declare-fun b!1533997 () Bool)

(declare-fun e!854884 () Bool)

(assert (=> b!1533997 (= e!854884 true)))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun lt!664218 () (_ BitVec 64))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101824 0))(
  ( (array!101825 (arr!49126 (Array (_ BitVec 32) (_ BitVec 64))) (size!49677 (_ BitVec 32))) )
))
(declare-fun lt!664216 () array!101824)

(declare-fun a!2804 () array!101824)

(declare-datatypes ((SeekEntryResult!13184 0))(
  ( (MissingZero!13184 (index!55131 (_ BitVec 32))) (Found!13184 (index!55132 (_ BitVec 32))) (Intermediate!13184 (undefined!13996 Bool) (index!55133 (_ BitVec 32)) (x!137041 (_ BitVec 32))) (Undefined!13184) (MissingVacant!13184 (index!55134 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101824 (_ BitVec 32)) SeekEntryResult!13184)

(assert (=> b!1533997 (= (seekEntryOrOpen!0 (select (arr!49126 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!664218 lt!664216 mask!2512))))

(declare-fun lt!664213 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-datatypes ((Unit!51187 0))(
  ( (Unit!51188) )
))
(declare-fun lt!664215 () Unit!51187)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101824 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51187)

(assert (=> b!1533997 (= lt!664215 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!664213 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1533998 () Bool)

(declare-fun res!1049659 () Bool)

(declare-fun e!854882 () Bool)

(assert (=> b!1533998 (=> (not res!1049659) (not e!854882))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533998 (= res!1049659 (validKeyInArray!0 (select (arr!49126 a!2804) j!70)))))

(declare-fun b!1533999 () Bool)

(declare-fun res!1049653 () Bool)

(assert (=> b!1533999 (=> (not res!1049653) (not e!854882))))

(assert (=> b!1533999 (= res!1049653 (and (= (size!49677 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49677 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49677 a!2804)) (not (= i!961 j!70))))))

(declare-fun e!854886 () Bool)

(declare-fun b!1534000 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101824 (_ BitVec 32)) SeekEntryResult!13184)

(assert (=> b!1534000 (= e!854886 (= (seekEntry!0 (select (arr!49126 a!2804) j!70) a!2804 mask!2512) (Found!13184 j!70)))))

(declare-fun b!1534002 () Bool)

(declare-fun e!854887 () Bool)

(declare-fun e!854881 () Bool)

(assert (=> b!1534002 (= e!854887 (not e!854881))))

(declare-fun res!1049656 () Bool)

(assert (=> b!1534002 (=> res!1049656 e!854881)))

(assert (=> b!1534002 (= res!1049656 (or (not (= (select (arr!49126 a!2804) j!70) lt!664218)) (= x!534 resX!21)))))

(assert (=> b!1534002 e!854886))

(declare-fun res!1049658 () Bool)

(assert (=> b!1534002 (=> (not res!1049658) (not e!854886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101824 (_ BitVec 32)) Bool)

(assert (=> b!1534002 (= res!1049658 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!664214 () Unit!51187)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101824 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51187)

(assert (=> b!1534002 (= lt!664214 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1534003 () Bool)

(declare-fun res!1049651 () Bool)

(assert (=> b!1534003 (=> res!1049651 e!854884)))

(declare-fun lt!664217 () SeekEntryResult!13184)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101824 (_ BitVec 32)) SeekEntryResult!13184)

(assert (=> b!1534003 (= res!1049651 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!664213 (select (arr!49126 a!2804) j!70) a!2804 mask!2512) lt!664217)))))

(declare-fun b!1534004 () Bool)

(declare-fun res!1049655 () Bool)

(assert (=> b!1534004 (=> (not res!1049655) (not e!854882))))

(assert (=> b!1534004 (= res!1049655 (validKeyInArray!0 (select (arr!49126 a!2804) i!961)))))

(declare-fun b!1534005 () Bool)

(declare-fun e!854883 () Bool)

(assert (=> b!1534005 (= e!854883 e!854887)))

(declare-fun res!1049657 () Bool)

(assert (=> b!1534005 (=> (not res!1049657) (not e!854887))))

(declare-fun lt!664212 () SeekEntryResult!13184)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534005 (= res!1049657 (= lt!664212 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!664218 mask!2512) lt!664218 lt!664216 mask!2512)))))

(assert (=> b!1534005 (= lt!664218 (select (store (arr!49126 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1534005 (= lt!664216 (array!101825 (store (arr!49126 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49677 a!2804)))))

(declare-fun b!1534006 () Bool)

(assert (=> b!1534006 (= e!854881 e!854884)))

(declare-fun res!1049660 () Bool)

(assert (=> b!1534006 (=> res!1049660 e!854884)))

(assert (=> b!1534006 (= res!1049660 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!664213 #b00000000000000000000000000000000) (bvsge lt!664213 (size!49677 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534006 (= lt!664213 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1534007 () Bool)

(assert (=> b!1534007 (= e!854882 e!854883)))

(declare-fun res!1049652 () Bool)

(assert (=> b!1534007 (=> (not res!1049652) (not e!854883))))

(assert (=> b!1534007 (= res!1049652 (= lt!664212 lt!664217))))

(assert (=> b!1534007 (= lt!664217 (Intermediate!13184 false resIndex!21 resX!21))))

(assert (=> b!1534007 (= lt!664212 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49126 a!2804) j!70) mask!2512) (select (arr!49126 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1534008 () Bool)

(declare-fun res!1049663 () Bool)

(assert (=> b!1534008 (=> (not res!1049663) (not e!854882))))

(declare-datatypes ((List!35596 0))(
  ( (Nil!35593) (Cons!35592 (h!37055 (_ BitVec 64)) (t!50282 List!35596)) )
))
(declare-fun arrayNoDuplicates!0 (array!101824 (_ BitVec 32) List!35596) Bool)

(assert (=> b!1534008 (= res!1049663 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35593))))

(declare-fun res!1049661 () Bool)

(assert (=> start!130908 (=> (not res!1049661) (not e!854882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130908 (= res!1049661 (validMask!0 mask!2512))))

(assert (=> start!130908 e!854882))

(assert (=> start!130908 true))

(declare-fun array_inv!38407 (array!101824) Bool)

(assert (=> start!130908 (array_inv!38407 a!2804)))

(declare-fun b!1534001 () Bool)

(declare-fun res!1049662 () Bool)

(assert (=> b!1534001 (=> (not res!1049662) (not e!854882))))

(assert (=> b!1534001 (= res!1049662 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49677 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49677 a!2804))))))

(declare-fun b!1534009 () Bool)

(declare-fun res!1049654 () Bool)

(assert (=> b!1534009 (=> (not res!1049654) (not e!854883))))

(assert (=> b!1534009 (= res!1049654 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49126 a!2804) j!70) a!2804 mask!2512) lt!664217))))

(declare-fun b!1534010 () Bool)

(declare-fun res!1049664 () Bool)

(assert (=> b!1534010 (=> (not res!1049664) (not e!854882))))

(assert (=> b!1534010 (= res!1049664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!130908 res!1049661) b!1533999))

(assert (= (and b!1533999 res!1049653) b!1534004))

(assert (= (and b!1534004 res!1049655) b!1533998))

(assert (= (and b!1533998 res!1049659) b!1534010))

(assert (= (and b!1534010 res!1049664) b!1534008))

(assert (= (and b!1534008 res!1049663) b!1534001))

(assert (= (and b!1534001 res!1049662) b!1534007))

(assert (= (and b!1534007 res!1049652) b!1534009))

(assert (= (and b!1534009 res!1049654) b!1534005))

(assert (= (and b!1534005 res!1049657) b!1534002))

(assert (= (and b!1534002 res!1049658) b!1534000))

(assert (= (and b!1534002 (not res!1049656)) b!1534006))

(assert (= (and b!1534006 (not res!1049660)) b!1534003))

(assert (= (and b!1534003 (not res!1049651)) b!1533997))

(declare-fun m!1416517 () Bool)

(assert (=> b!1534009 m!1416517))

(assert (=> b!1534009 m!1416517))

(declare-fun m!1416519 () Bool)

(assert (=> b!1534009 m!1416519))

(assert (=> b!1534000 m!1416517))

(assert (=> b!1534000 m!1416517))

(declare-fun m!1416521 () Bool)

(assert (=> b!1534000 m!1416521))

(declare-fun m!1416523 () Bool)

(assert (=> start!130908 m!1416523))

(declare-fun m!1416525 () Bool)

(assert (=> start!130908 m!1416525))

(declare-fun m!1416527 () Bool)

(assert (=> b!1534005 m!1416527))

(assert (=> b!1534005 m!1416527))

(declare-fun m!1416529 () Bool)

(assert (=> b!1534005 m!1416529))

(declare-fun m!1416531 () Bool)

(assert (=> b!1534005 m!1416531))

(declare-fun m!1416533 () Bool)

(assert (=> b!1534005 m!1416533))

(assert (=> b!1534003 m!1416517))

(assert (=> b!1534003 m!1416517))

(declare-fun m!1416535 () Bool)

(assert (=> b!1534003 m!1416535))

(assert (=> b!1533997 m!1416517))

(assert (=> b!1533997 m!1416517))

(declare-fun m!1416537 () Bool)

(assert (=> b!1533997 m!1416537))

(declare-fun m!1416539 () Bool)

(assert (=> b!1533997 m!1416539))

(declare-fun m!1416541 () Bool)

(assert (=> b!1533997 m!1416541))

(assert (=> b!1533998 m!1416517))

(assert (=> b!1533998 m!1416517))

(declare-fun m!1416543 () Bool)

(assert (=> b!1533998 m!1416543))

(declare-fun m!1416545 () Bool)

(assert (=> b!1534010 m!1416545))

(assert (=> b!1534002 m!1416517))

(declare-fun m!1416547 () Bool)

(assert (=> b!1534002 m!1416547))

(declare-fun m!1416549 () Bool)

(assert (=> b!1534002 m!1416549))

(declare-fun m!1416551 () Bool)

(assert (=> b!1534004 m!1416551))

(assert (=> b!1534004 m!1416551))

(declare-fun m!1416553 () Bool)

(assert (=> b!1534004 m!1416553))

(assert (=> b!1534007 m!1416517))

(assert (=> b!1534007 m!1416517))

(declare-fun m!1416555 () Bool)

(assert (=> b!1534007 m!1416555))

(assert (=> b!1534007 m!1416555))

(assert (=> b!1534007 m!1416517))

(declare-fun m!1416557 () Bool)

(assert (=> b!1534007 m!1416557))

(declare-fun m!1416559 () Bool)

(assert (=> b!1534008 m!1416559))

(declare-fun m!1416561 () Bool)

(assert (=> b!1534006 m!1416561))

(check-sat (not b!1534008) (not b!1533998) (not b!1534000) (not b!1534010) (not b!1534002) (not b!1534005) (not b!1534006) (not b!1534007) (not b!1533997) (not b!1534003) (not b!1534009) (not b!1534004) (not start!130908))
(check-sat)
