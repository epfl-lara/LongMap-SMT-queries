; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129152 () Bool)

(assert start!129152)

(declare-fun b!1515782 () Bool)

(declare-fun res!1035690 () Bool)

(declare-fun e!845873 () Bool)

(assert (=> b!1515782 (=> (not res!1035690) (not e!845873))))

(declare-datatypes ((array!101008 0))(
  ( (array!101009 (arr!48741 (Array (_ BitVec 32) (_ BitVec 64))) (size!49291 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101008)

(declare-datatypes ((List!35224 0))(
  ( (Nil!35221) (Cons!35220 (h!36632 (_ BitVec 64)) (t!49918 List!35224)) )
))
(declare-fun arrayNoDuplicates!0 (array!101008 (_ BitVec 32) List!35224) Bool)

(assert (=> b!1515782 (= res!1035690 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35221))))

(declare-fun res!1035685 () Bool)

(assert (=> start!129152 (=> (not res!1035685) (not e!845873))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129152 (= res!1035685 (validMask!0 mask!2512))))

(assert (=> start!129152 e!845873))

(assert (=> start!129152 true))

(declare-fun array_inv!37769 (array!101008) Bool)

(assert (=> start!129152 (array_inv!37769 a!2804)))

(declare-fun b!1515783 () Bool)

(declare-fun res!1035686 () Bool)

(assert (=> b!1515783 (=> (not res!1035686) (not e!845873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101008 (_ BitVec 32)) Bool)

(assert (=> b!1515783 (= res!1035686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515784 () Bool)

(declare-fun res!1035694 () Bool)

(assert (=> b!1515784 (=> (not res!1035694) (not e!845873))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515784 (= res!1035694 (validKeyInArray!0 (select (arr!48741 a!2804) j!70)))))

(declare-fun b!1515785 () Bool)

(declare-fun e!845872 () Bool)

(declare-fun e!845875 () Bool)

(assert (=> b!1515785 (= e!845872 e!845875)))

(declare-fun res!1035693 () Bool)

(assert (=> b!1515785 (=> res!1035693 e!845875)))

(declare-datatypes ((SeekEntryResult!12912 0))(
  ( (MissingZero!12912 (index!54043 (_ BitVec 32))) (Found!12912 (index!54044 (_ BitVec 32))) (Intermediate!12912 (undefined!13724 Bool) (index!54045 (_ BitVec 32)) (x!135742 (_ BitVec 32))) (Undefined!12912) (MissingVacant!12912 (index!54046 (_ BitVec 32))) )
))
(declare-fun lt!657130 () SeekEntryResult!12912)

(assert (=> b!1515785 (= res!1035693 (not (= lt!657130 (Found!12912 j!70))))))

(declare-fun lt!657131 () SeekEntryResult!12912)

(declare-fun lt!657133 () SeekEntryResult!12912)

(assert (=> b!1515785 (= lt!657131 lt!657133)))

(declare-fun lt!657139 () array!101008)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!657134 () (_ BitVec 64))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101008 (_ BitVec 32)) SeekEntryResult!12912)

(assert (=> b!1515785 (= lt!657133 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!657134 lt!657139 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101008 (_ BitVec 32)) SeekEntryResult!12912)

(assert (=> b!1515785 (= lt!657131 (seekEntryOrOpen!0 lt!657134 lt!657139 mask!2512))))

(declare-fun lt!657138 () SeekEntryResult!12912)

(assert (=> b!1515785 (= lt!657138 lt!657130)))

(assert (=> b!1515785 (= lt!657130 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48741 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515785 (= lt!657138 (seekEntryOrOpen!0 (select (arr!48741 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515786 () Bool)

(assert (=> b!1515786 (= e!845875 true)))

(assert (=> b!1515786 (= lt!657133 lt!657130)))

(declare-datatypes ((Unit!50692 0))(
  ( (Unit!50693) )
))
(declare-fun lt!657135 () Unit!50692)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101008 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50692)

(assert (=> b!1515786 (= lt!657135 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1515787 () Bool)

(declare-fun e!845874 () Bool)

(assert (=> b!1515787 (= e!845874 (not e!845872))))

(declare-fun res!1035689 () Bool)

(assert (=> b!1515787 (=> res!1035689 e!845872)))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1515787 (= res!1035689 (or (not (= (select (arr!48741 a!2804) j!70) lt!657134)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48741 a!2804) index!487) (select (arr!48741 a!2804) j!70)) (not (= (select (arr!48741 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!845871 () Bool)

(assert (=> b!1515787 e!845871))

(declare-fun res!1035692 () Bool)

(assert (=> b!1515787 (=> (not res!1035692) (not e!845871))))

(assert (=> b!1515787 (= res!1035692 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!657136 () Unit!50692)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101008 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50692)

(assert (=> b!1515787 (= lt!657136 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515788 () Bool)

(declare-fun res!1035687 () Bool)

(assert (=> b!1515788 (=> (not res!1035687) (not e!845873))))

(assert (=> b!1515788 (= res!1035687 (validKeyInArray!0 (select (arr!48741 a!2804) i!961)))))

(declare-fun b!1515789 () Bool)

(declare-fun e!845869 () Bool)

(assert (=> b!1515789 (= e!845873 e!845869)))

(declare-fun res!1035695 () Bool)

(assert (=> b!1515789 (=> (not res!1035695) (not e!845869))))

(declare-fun lt!657132 () SeekEntryResult!12912)

(declare-fun lt!657137 () SeekEntryResult!12912)

(assert (=> b!1515789 (= res!1035695 (= lt!657132 lt!657137))))

(assert (=> b!1515789 (= lt!657137 (Intermediate!12912 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101008 (_ BitVec 32)) SeekEntryResult!12912)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515789 (= lt!657132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48741 a!2804) j!70) mask!2512) (select (arr!48741 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515790 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101008 (_ BitVec 32)) SeekEntryResult!12912)

(assert (=> b!1515790 (= e!845871 (= (seekEntry!0 (select (arr!48741 a!2804) j!70) a!2804 mask!2512) (Found!12912 j!70)))))

(declare-fun b!1515791 () Bool)

(declare-fun res!1035691 () Bool)

(assert (=> b!1515791 (=> (not res!1035691) (not e!845873))))

(assert (=> b!1515791 (= res!1035691 (and (= (size!49291 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49291 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49291 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515792 () Bool)

(declare-fun res!1035697 () Bool)

(assert (=> b!1515792 (=> (not res!1035697) (not e!845869))))

(assert (=> b!1515792 (= res!1035697 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48741 a!2804) j!70) a!2804 mask!2512) lt!657137))))

(declare-fun b!1515793 () Bool)

(assert (=> b!1515793 (= e!845869 e!845874)))

(declare-fun res!1035688 () Bool)

(assert (=> b!1515793 (=> (not res!1035688) (not e!845874))))

(assert (=> b!1515793 (= res!1035688 (= lt!657132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657134 mask!2512) lt!657134 lt!657139 mask!2512)))))

(assert (=> b!1515793 (= lt!657134 (select (store (arr!48741 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515793 (= lt!657139 (array!101009 (store (arr!48741 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49291 a!2804)))))

(declare-fun b!1515794 () Bool)

(declare-fun res!1035696 () Bool)

(assert (=> b!1515794 (=> (not res!1035696) (not e!845873))))

(assert (=> b!1515794 (= res!1035696 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49291 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49291 a!2804))))))

(assert (= (and start!129152 res!1035685) b!1515791))

(assert (= (and b!1515791 res!1035691) b!1515788))

(assert (= (and b!1515788 res!1035687) b!1515784))

(assert (= (and b!1515784 res!1035694) b!1515783))

(assert (= (and b!1515783 res!1035686) b!1515782))

(assert (= (and b!1515782 res!1035690) b!1515794))

(assert (= (and b!1515794 res!1035696) b!1515789))

(assert (= (and b!1515789 res!1035695) b!1515792))

(assert (= (and b!1515792 res!1035697) b!1515793))

(assert (= (and b!1515793 res!1035688) b!1515787))

(assert (= (and b!1515787 res!1035692) b!1515790))

(assert (= (and b!1515787 (not res!1035689)) b!1515785))

(assert (= (and b!1515785 (not res!1035693)) b!1515786))

(declare-fun m!1398967 () Bool)

(assert (=> b!1515792 m!1398967))

(assert (=> b!1515792 m!1398967))

(declare-fun m!1398969 () Bool)

(assert (=> b!1515792 m!1398969))

(declare-fun m!1398971 () Bool)

(assert (=> b!1515788 m!1398971))

(assert (=> b!1515788 m!1398971))

(declare-fun m!1398973 () Bool)

(assert (=> b!1515788 m!1398973))

(declare-fun m!1398975 () Bool)

(assert (=> start!129152 m!1398975))

(declare-fun m!1398977 () Bool)

(assert (=> start!129152 m!1398977))

(assert (=> b!1515789 m!1398967))

(assert (=> b!1515789 m!1398967))

(declare-fun m!1398979 () Bool)

(assert (=> b!1515789 m!1398979))

(assert (=> b!1515789 m!1398979))

(assert (=> b!1515789 m!1398967))

(declare-fun m!1398981 () Bool)

(assert (=> b!1515789 m!1398981))

(assert (=> b!1515787 m!1398967))

(declare-fun m!1398983 () Bool)

(assert (=> b!1515787 m!1398983))

(declare-fun m!1398985 () Bool)

(assert (=> b!1515787 m!1398985))

(declare-fun m!1398987 () Bool)

(assert (=> b!1515787 m!1398987))

(declare-fun m!1398989 () Bool)

(assert (=> b!1515793 m!1398989))

(assert (=> b!1515793 m!1398989))

(declare-fun m!1398991 () Bool)

(assert (=> b!1515793 m!1398991))

(declare-fun m!1398993 () Bool)

(assert (=> b!1515793 m!1398993))

(declare-fun m!1398995 () Bool)

(assert (=> b!1515793 m!1398995))

(assert (=> b!1515790 m!1398967))

(assert (=> b!1515790 m!1398967))

(declare-fun m!1398997 () Bool)

(assert (=> b!1515790 m!1398997))

(declare-fun m!1398999 () Bool)

(assert (=> b!1515786 m!1398999))

(assert (=> b!1515784 m!1398967))

(assert (=> b!1515784 m!1398967))

(declare-fun m!1399001 () Bool)

(assert (=> b!1515784 m!1399001))

(assert (=> b!1515785 m!1398967))

(declare-fun m!1399003 () Bool)

(assert (=> b!1515785 m!1399003))

(assert (=> b!1515785 m!1398967))

(declare-fun m!1399005 () Bool)

(assert (=> b!1515785 m!1399005))

(declare-fun m!1399007 () Bool)

(assert (=> b!1515785 m!1399007))

(assert (=> b!1515785 m!1398967))

(declare-fun m!1399009 () Bool)

(assert (=> b!1515785 m!1399009))

(declare-fun m!1399011 () Bool)

(assert (=> b!1515783 m!1399011))

(declare-fun m!1399013 () Bool)

(assert (=> b!1515782 m!1399013))

(check-sat (not b!1515783) (not b!1515793) (not b!1515788) (not b!1515787) (not b!1515789) (not b!1515792) (not b!1515782) (not b!1515786) (not b!1515790) (not b!1515785) (not b!1515784) (not start!129152))
(check-sat)
