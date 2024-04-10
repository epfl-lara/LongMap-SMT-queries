; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130238 () Bool)

(assert start!130238)

(declare-fun b!1528848 () Bool)

(declare-fun res!1046563 () Bool)

(declare-fun e!852086 () Bool)

(assert (=> b!1528848 (=> (not res!1046563) (not e!852086))))

(declare-datatypes ((array!101588 0))(
  ( (array!101589 (arr!49019 (Array (_ BitVec 32) (_ BitVec 64))) (size!49569 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101588)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101588 (_ BitVec 32)) Bool)

(assert (=> b!1528848 (= res!1046563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528849 () Bool)

(declare-fun res!1046564 () Bool)

(assert (=> b!1528849 (=> (not res!1046564) (not e!852086))))

(declare-datatypes ((List!35502 0))(
  ( (Nil!35499) (Cons!35498 (h!36934 (_ BitVec 64)) (t!50196 List!35502)) )
))
(declare-fun arrayNoDuplicates!0 (array!101588 (_ BitVec 32) List!35502) Bool)

(assert (=> b!1528849 (= res!1046564 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35499))))

(declare-fun b!1528850 () Bool)

(declare-fun res!1046559 () Bool)

(assert (=> b!1528850 (=> (not res!1046559) (not e!852086))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1528850 (= res!1046559 (and (= (size!49569 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49569 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49569 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528851 () Bool)

(declare-fun res!1046562 () Bool)

(assert (=> b!1528851 (=> (not res!1046562) (not e!852086))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528851 (= res!1046562 (validKeyInArray!0 (select (arr!49019 a!2804) i!961)))))

(declare-fun b!1528852 () Bool)

(declare-fun res!1046555 () Bool)

(declare-fun e!852085 () Bool)

(assert (=> b!1528852 (=> (not res!1046555) (not e!852085))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13184 0))(
  ( (MissingZero!13184 (index!55131 (_ BitVec 32))) (Found!13184 (index!55132 (_ BitVec 32))) (Intermediate!13184 (undefined!13996 Bool) (index!55133 (_ BitVec 32)) (x!136823 (_ BitVec 32))) (Undefined!13184) (MissingVacant!13184 (index!55134 (_ BitVec 32))) )
))
(declare-fun lt!662239 () SeekEntryResult!13184)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101588 (_ BitVec 32)) SeekEntryResult!13184)

(assert (=> b!1528852 (= res!1046555 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49019 a!2804) j!70) a!2804 mask!2512) lt!662239))))

(declare-fun b!1528853 () Bool)

(declare-fun res!1046560 () Bool)

(assert (=> b!1528853 (=> (not res!1046560) (not e!852085))))

(declare-fun lt!662237 () SeekEntryResult!13184)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528853 (= res!1046560 (= lt!662237 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49019 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49019 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101589 (store (arr!49019 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49569 a!2804)) mask!2512)))))

(declare-fun b!1528854 () Bool)

(declare-fun e!852088 () Bool)

(assert (=> b!1528854 (= e!852088 true)))

(declare-fun lt!662238 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528854 (= lt!662238 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1528855 () Bool)

(assert (=> b!1528855 (= e!852086 e!852085)))

(declare-fun res!1046557 () Bool)

(assert (=> b!1528855 (=> (not res!1046557) (not e!852085))))

(assert (=> b!1528855 (= res!1046557 (= lt!662237 lt!662239))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1528855 (= lt!662239 (Intermediate!13184 false resIndex!21 resX!21))))

(assert (=> b!1528855 (= lt!662237 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49019 a!2804) j!70) mask!2512) (select (arr!49019 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1046565 () Bool)

(assert (=> start!130238 (=> (not res!1046565) (not e!852086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130238 (= res!1046565 (validMask!0 mask!2512))))

(assert (=> start!130238 e!852086))

(assert (=> start!130238 true))

(declare-fun array_inv!38047 (array!101588) Bool)

(assert (=> start!130238 (array_inv!38047 a!2804)))

(declare-fun b!1528856 () Bool)

(assert (=> b!1528856 (= e!852085 (not e!852088))))

(declare-fun res!1046566 () Bool)

(assert (=> b!1528856 (=> res!1046566 e!852088)))

(assert (=> b!1528856 (= res!1046566 (or (not (= (select (arr!49019 a!2804) j!70) (select (store (arr!49019 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852084 () Bool)

(assert (=> b!1528856 e!852084))

(declare-fun res!1046558 () Bool)

(assert (=> b!1528856 (=> (not res!1046558) (not e!852084))))

(assert (=> b!1528856 (= res!1046558 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51152 0))(
  ( (Unit!51153) )
))
(declare-fun lt!662236 () Unit!51152)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51152)

(assert (=> b!1528856 (= lt!662236 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528857 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101588 (_ BitVec 32)) SeekEntryResult!13184)

(assert (=> b!1528857 (= e!852084 (= (seekEntry!0 (select (arr!49019 a!2804) j!70) a!2804 mask!2512) (Found!13184 j!70)))))

(declare-fun b!1528858 () Bool)

(declare-fun res!1046561 () Bool)

(assert (=> b!1528858 (=> (not res!1046561) (not e!852086))))

(assert (=> b!1528858 (= res!1046561 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49569 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49569 a!2804))))))

(declare-fun b!1528859 () Bool)

(declare-fun res!1046556 () Bool)

(assert (=> b!1528859 (=> (not res!1046556) (not e!852086))))

(assert (=> b!1528859 (= res!1046556 (validKeyInArray!0 (select (arr!49019 a!2804) j!70)))))

(assert (= (and start!130238 res!1046565) b!1528850))

(assert (= (and b!1528850 res!1046559) b!1528851))

(assert (= (and b!1528851 res!1046562) b!1528859))

(assert (= (and b!1528859 res!1046556) b!1528848))

(assert (= (and b!1528848 res!1046563) b!1528849))

(assert (= (and b!1528849 res!1046564) b!1528858))

(assert (= (and b!1528858 res!1046561) b!1528855))

(assert (= (and b!1528855 res!1046557) b!1528852))

(assert (= (and b!1528852 res!1046555) b!1528853))

(assert (= (and b!1528853 res!1046560) b!1528856))

(assert (= (and b!1528856 res!1046558) b!1528857))

(assert (= (and b!1528856 (not res!1046566)) b!1528854))

(declare-fun m!1411761 () Bool)

(assert (=> b!1528854 m!1411761))

(declare-fun m!1411763 () Bool)

(assert (=> b!1528849 m!1411763))

(declare-fun m!1411765 () Bool)

(assert (=> b!1528855 m!1411765))

(assert (=> b!1528855 m!1411765))

(declare-fun m!1411767 () Bool)

(assert (=> b!1528855 m!1411767))

(assert (=> b!1528855 m!1411767))

(assert (=> b!1528855 m!1411765))

(declare-fun m!1411769 () Bool)

(assert (=> b!1528855 m!1411769))

(assert (=> b!1528856 m!1411765))

(declare-fun m!1411771 () Bool)

(assert (=> b!1528856 m!1411771))

(declare-fun m!1411773 () Bool)

(assert (=> b!1528856 m!1411773))

(declare-fun m!1411775 () Bool)

(assert (=> b!1528856 m!1411775))

(declare-fun m!1411777 () Bool)

(assert (=> b!1528856 m!1411777))

(declare-fun m!1411779 () Bool)

(assert (=> b!1528851 m!1411779))

(assert (=> b!1528851 m!1411779))

(declare-fun m!1411781 () Bool)

(assert (=> b!1528851 m!1411781))

(assert (=> b!1528853 m!1411773))

(assert (=> b!1528853 m!1411775))

(assert (=> b!1528853 m!1411775))

(declare-fun m!1411783 () Bool)

(assert (=> b!1528853 m!1411783))

(assert (=> b!1528853 m!1411783))

(assert (=> b!1528853 m!1411775))

(declare-fun m!1411785 () Bool)

(assert (=> b!1528853 m!1411785))

(assert (=> b!1528859 m!1411765))

(assert (=> b!1528859 m!1411765))

(declare-fun m!1411787 () Bool)

(assert (=> b!1528859 m!1411787))

(declare-fun m!1411789 () Bool)

(assert (=> start!130238 m!1411789))

(declare-fun m!1411791 () Bool)

(assert (=> start!130238 m!1411791))

(declare-fun m!1411793 () Bool)

(assert (=> b!1528848 m!1411793))

(assert (=> b!1528857 m!1411765))

(assert (=> b!1528857 m!1411765))

(declare-fun m!1411795 () Bool)

(assert (=> b!1528857 m!1411795))

(assert (=> b!1528852 m!1411765))

(assert (=> b!1528852 m!1411765))

(declare-fun m!1411797 () Bool)

(assert (=> b!1528852 m!1411797))

(push 1)

