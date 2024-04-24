; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129464 () Bool)

(assert start!129464)

(declare-fun b!1517814 () Bool)

(declare-fun res!1036544 () Bool)

(declare-fun e!847114 () Bool)

(assert (=> b!1517814 (=> (not res!1036544) (not e!847114))))

(declare-datatypes ((array!101134 0))(
  ( (array!101135 (arr!48799 (Array (_ BitVec 32) (_ BitVec 64))) (size!49350 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101134)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517814 (= res!1036544 (validKeyInArray!0 (select (arr!48799 a!2804) i!961)))))

(declare-fun b!1517815 () Bool)

(declare-fun e!847116 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12863 0))(
  ( (MissingZero!12863 (index!53847 (_ BitVec 32))) (Found!12863 (index!53848 (_ BitVec 32))) (Intermediate!12863 (undefined!13675 Bool) (index!53849 (_ BitVec 32)) (x!135746 (_ BitVec 32))) (Undefined!12863) (MissingVacant!12863 (index!53850 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101134 (_ BitVec 32)) SeekEntryResult!12863)

(assert (=> b!1517815 (= e!847116 (= (seekEntry!0 (select (arr!48799 a!2804) j!70) a!2804 mask!2512) (Found!12863 j!70)))))

(declare-fun b!1517816 () Bool)

(declare-fun res!1036548 () Bool)

(assert (=> b!1517816 (=> (not res!1036548) (not e!847114))))

(assert (=> b!1517816 (= res!1036548 (and (= (size!49350 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49350 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49350 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1517817 () Bool)

(declare-fun res!1036547 () Bool)

(assert (=> b!1517817 (=> (not res!1036547) (not e!847114))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517817 (= res!1036547 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49350 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49350 a!2804))))))

(declare-fun b!1517818 () Bool)

(declare-fun res!1036540 () Bool)

(declare-fun e!847115 () Bool)

(assert (=> b!1517818 (=> (not res!1036540) (not e!847115))))

(declare-fun lt!657929 () SeekEntryResult!12863)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101134 (_ BitVec 32)) SeekEntryResult!12863)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517818 (= res!1036540 (= lt!657929 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48799 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48799 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101135 (store (arr!48799 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49350 a!2804)) mask!2512)))))

(declare-fun b!1517819 () Bool)

(declare-fun res!1036549 () Bool)

(assert (=> b!1517819 (=> (not res!1036549) (not e!847115))))

(declare-fun lt!657930 () SeekEntryResult!12863)

(assert (=> b!1517819 (= res!1036549 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48799 a!2804) j!70) a!2804 mask!2512) lt!657930))))

(declare-fun b!1517820 () Bool)

(assert (=> b!1517820 (= e!847115 (not true))))

(assert (=> b!1517820 e!847116))

(declare-fun res!1036542 () Bool)

(assert (=> b!1517820 (=> (not res!1036542) (not e!847116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101134 (_ BitVec 32)) Bool)

(assert (=> b!1517820 (= res!1036542 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50629 0))(
  ( (Unit!50630) )
))
(declare-fun lt!657931 () Unit!50629)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101134 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50629)

(assert (=> b!1517820 (= lt!657931 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517822 () Bool)

(declare-fun res!1036545 () Bool)

(assert (=> b!1517822 (=> (not res!1036545) (not e!847114))))

(assert (=> b!1517822 (= res!1036545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517823 () Bool)

(declare-fun res!1036546 () Bool)

(assert (=> b!1517823 (=> (not res!1036546) (not e!847114))))

(assert (=> b!1517823 (= res!1036546 (validKeyInArray!0 (select (arr!48799 a!2804) j!70)))))

(declare-fun b!1517824 () Bool)

(declare-fun res!1036541 () Bool)

(assert (=> b!1517824 (=> (not res!1036541) (not e!847114))))

(declare-datatypes ((List!35269 0))(
  ( (Nil!35266) (Cons!35265 (h!36692 (_ BitVec 64)) (t!49955 List!35269)) )
))
(declare-fun arrayNoDuplicates!0 (array!101134 (_ BitVec 32) List!35269) Bool)

(assert (=> b!1517824 (= res!1036541 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35266))))

(declare-fun res!1036550 () Bool)

(assert (=> start!129464 (=> (not res!1036550) (not e!847114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129464 (= res!1036550 (validMask!0 mask!2512))))

(assert (=> start!129464 e!847114))

(assert (=> start!129464 true))

(declare-fun array_inv!38080 (array!101134) Bool)

(assert (=> start!129464 (array_inv!38080 a!2804)))

(declare-fun b!1517821 () Bool)

(assert (=> b!1517821 (= e!847114 e!847115)))

(declare-fun res!1036543 () Bool)

(assert (=> b!1517821 (=> (not res!1036543) (not e!847115))))

(assert (=> b!1517821 (= res!1036543 (= lt!657929 lt!657930))))

(assert (=> b!1517821 (= lt!657930 (Intermediate!12863 false resIndex!21 resX!21))))

(assert (=> b!1517821 (= lt!657929 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48799 a!2804) j!70) mask!2512) (select (arr!48799 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129464 res!1036550) b!1517816))

(assert (= (and b!1517816 res!1036548) b!1517814))

(assert (= (and b!1517814 res!1036544) b!1517823))

(assert (= (and b!1517823 res!1036546) b!1517822))

(assert (= (and b!1517822 res!1036545) b!1517824))

(assert (= (and b!1517824 res!1036541) b!1517817))

(assert (= (and b!1517817 res!1036547) b!1517821))

(assert (= (and b!1517821 res!1036543) b!1517819))

(assert (= (and b!1517819 res!1036549) b!1517818))

(assert (= (and b!1517818 res!1036540) b!1517820))

(assert (= (and b!1517820 res!1036542) b!1517815))

(declare-fun m!1401009 () Bool)

(assert (=> start!129464 m!1401009))

(declare-fun m!1401011 () Bool)

(assert (=> start!129464 m!1401011))

(declare-fun m!1401013 () Bool)

(assert (=> b!1517822 m!1401013))

(declare-fun m!1401015 () Bool)

(assert (=> b!1517818 m!1401015))

(declare-fun m!1401017 () Bool)

(assert (=> b!1517818 m!1401017))

(assert (=> b!1517818 m!1401017))

(declare-fun m!1401019 () Bool)

(assert (=> b!1517818 m!1401019))

(assert (=> b!1517818 m!1401019))

(assert (=> b!1517818 m!1401017))

(declare-fun m!1401021 () Bool)

(assert (=> b!1517818 m!1401021))

(declare-fun m!1401023 () Bool)

(assert (=> b!1517824 m!1401023))

(declare-fun m!1401025 () Bool)

(assert (=> b!1517819 m!1401025))

(assert (=> b!1517819 m!1401025))

(declare-fun m!1401027 () Bool)

(assert (=> b!1517819 m!1401027))

(assert (=> b!1517815 m!1401025))

(assert (=> b!1517815 m!1401025))

(declare-fun m!1401029 () Bool)

(assert (=> b!1517815 m!1401029))

(assert (=> b!1517821 m!1401025))

(assert (=> b!1517821 m!1401025))

(declare-fun m!1401031 () Bool)

(assert (=> b!1517821 m!1401031))

(assert (=> b!1517821 m!1401031))

(assert (=> b!1517821 m!1401025))

(declare-fun m!1401033 () Bool)

(assert (=> b!1517821 m!1401033))

(assert (=> b!1517823 m!1401025))

(assert (=> b!1517823 m!1401025))

(declare-fun m!1401035 () Bool)

(assert (=> b!1517823 m!1401035))

(declare-fun m!1401037 () Bool)

(assert (=> b!1517814 m!1401037))

(assert (=> b!1517814 m!1401037))

(declare-fun m!1401039 () Bool)

(assert (=> b!1517814 m!1401039))

(declare-fun m!1401041 () Bool)

(assert (=> b!1517820 m!1401041))

(declare-fun m!1401043 () Bool)

(assert (=> b!1517820 m!1401043))

(check-sat (not b!1517824) (not b!1517821) (not b!1517823) (not b!1517822) (not b!1517815) (not b!1517814) (not start!129464) (not b!1517818) (not b!1517819) (not b!1517820))
(check-sat)
