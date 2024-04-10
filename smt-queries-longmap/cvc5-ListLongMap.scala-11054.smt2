; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129156 () Bool)

(assert start!129156)

(declare-fun b!1515862 () Bool)

(declare-fun e!845920 () Bool)

(declare-fun lt!657192 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515862 (= e!845920 (validKeyInArray!0 lt!657192))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun e!845916 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101012 0))(
  ( (array!101013 (arr!48743 (Array (_ BitVec 32) (_ BitVec 64))) (size!49293 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101012)

(declare-fun b!1515863 () Bool)

(declare-datatypes ((SeekEntryResult!12914 0))(
  ( (MissingZero!12914 (index!54051 (_ BitVec 32))) (Found!12914 (index!54052 (_ BitVec 32))) (Intermediate!12914 (undefined!13726 Bool) (index!54053 (_ BitVec 32)) (x!135752 (_ BitVec 32))) (Undefined!12914) (MissingVacant!12914 (index!54054 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101012 (_ BitVec 32)) SeekEntryResult!12914)

(assert (=> b!1515863 (= e!845916 (= (seekEntry!0 (select (arr!48743 a!2804) j!70) a!2804 mask!2512) (Found!12914 j!70)))))

(declare-fun res!1035769 () Bool)

(declare-fun e!845914 () Bool)

(assert (=> start!129156 (=> (not res!1035769) (not e!845914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129156 (= res!1035769 (validMask!0 mask!2512))))

(assert (=> start!129156 e!845914))

(assert (=> start!129156 true))

(declare-fun array_inv!37771 (array!101012) Bool)

(assert (=> start!129156 (array_inv!37771 a!2804)))

(declare-fun b!1515864 () Bool)

(declare-fun res!1035778 () Bool)

(assert (=> b!1515864 (=> (not res!1035778) (not e!845914))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515864 (= res!1035778 (validKeyInArray!0 (select (arr!48743 a!2804) i!961)))))

(declare-fun b!1515865 () Bool)

(declare-fun res!1035773 () Bool)

(assert (=> b!1515865 (=> (not res!1035773) (not e!845914))))

(assert (=> b!1515865 (= res!1035773 (validKeyInArray!0 (select (arr!48743 a!2804) j!70)))))

(declare-fun b!1515866 () Bool)

(declare-fun e!845917 () Bool)

(assert (=> b!1515866 (= e!845917 e!845920)))

(declare-fun res!1035765 () Bool)

(assert (=> b!1515866 (=> res!1035765 e!845920)))

(assert (=> b!1515866 (= res!1035765 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun lt!657195 () SeekEntryResult!12914)

(declare-fun lt!657197 () SeekEntryResult!12914)

(assert (=> b!1515866 (= lt!657195 lt!657197)))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((Unit!50696 0))(
  ( (Unit!50697) )
))
(declare-fun lt!657193 () Unit!50696)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101012 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50696)

(assert (=> b!1515866 (= lt!657193 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1515867 () Bool)

(declare-fun res!1035776 () Bool)

(declare-fun e!845915 () Bool)

(assert (=> b!1515867 (=> (not res!1035776) (not e!845915))))

(declare-fun lt!657196 () SeekEntryResult!12914)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101012 (_ BitVec 32)) SeekEntryResult!12914)

(assert (=> b!1515867 (= res!1035776 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48743 a!2804) j!70) a!2804 mask!2512) lt!657196))))

(declare-fun b!1515868 () Bool)

(declare-fun res!1035775 () Bool)

(assert (=> b!1515868 (=> (not res!1035775) (not e!845914))))

(assert (=> b!1515868 (= res!1035775 (and (= (size!49293 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49293 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49293 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515869 () Bool)

(assert (=> b!1515869 (= e!845914 e!845915)))

(declare-fun res!1035767 () Bool)

(assert (=> b!1515869 (=> (not res!1035767) (not e!845915))))

(declare-fun lt!657190 () SeekEntryResult!12914)

(assert (=> b!1515869 (= res!1035767 (= lt!657190 lt!657196))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1515869 (= lt!657196 (Intermediate!12914 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515869 (= lt!657190 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48743 a!2804) j!70) mask!2512) (select (arr!48743 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515870 () Bool)

(declare-fun e!845918 () Bool)

(assert (=> b!1515870 (= e!845915 e!845918)))

(declare-fun res!1035770 () Bool)

(assert (=> b!1515870 (=> (not res!1035770) (not e!845918))))

(declare-fun lt!657198 () array!101012)

(assert (=> b!1515870 (= res!1035770 (= lt!657190 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657192 mask!2512) lt!657192 lt!657198 mask!2512)))))

(assert (=> b!1515870 (= lt!657192 (select (store (arr!48743 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515870 (= lt!657198 (array!101013 (store (arr!48743 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49293 a!2804)))))

(declare-fun b!1515871 () Bool)

(declare-fun res!1035777 () Bool)

(assert (=> b!1515871 (=> (not res!1035777) (not e!845914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101012 (_ BitVec 32)) Bool)

(assert (=> b!1515871 (= res!1035777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515872 () Bool)

(declare-fun res!1035774 () Bool)

(assert (=> b!1515872 (=> (not res!1035774) (not e!845914))))

(assert (=> b!1515872 (= res!1035774 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49293 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49293 a!2804))))))

(declare-fun b!1515873 () Bool)

(declare-fun res!1035771 () Bool)

(assert (=> b!1515873 (=> (not res!1035771) (not e!845914))))

(declare-datatypes ((List!35226 0))(
  ( (Nil!35223) (Cons!35222 (h!36634 (_ BitVec 64)) (t!49920 List!35226)) )
))
(declare-fun arrayNoDuplicates!0 (array!101012 (_ BitVec 32) List!35226) Bool)

(assert (=> b!1515873 (= res!1035771 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35223))))

(declare-fun b!1515874 () Bool)

(declare-fun e!845919 () Bool)

(assert (=> b!1515874 (= e!845918 (not e!845919))))

(declare-fun res!1035768 () Bool)

(assert (=> b!1515874 (=> res!1035768 e!845919)))

(assert (=> b!1515874 (= res!1035768 (or (not (= (select (arr!48743 a!2804) j!70) lt!657192)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48743 a!2804) index!487) (select (arr!48743 a!2804) j!70)) (not (= (select (arr!48743 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1515874 e!845916))

(declare-fun res!1035772 () Bool)

(assert (=> b!1515874 (=> (not res!1035772) (not e!845916))))

(assert (=> b!1515874 (= res!1035772 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!657191 () Unit!50696)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101012 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50696)

(assert (=> b!1515874 (= lt!657191 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515875 () Bool)

(assert (=> b!1515875 (= e!845919 e!845917)))

(declare-fun res!1035766 () Bool)

(assert (=> b!1515875 (=> res!1035766 e!845917)))

(assert (=> b!1515875 (= res!1035766 (not (= lt!657197 (Found!12914 j!70))))))

(declare-fun lt!657199 () SeekEntryResult!12914)

(assert (=> b!1515875 (= lt!657199 lt!657195)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101012 (_ BitVec 32)) SeekEntryResult!12914)

(assert (=> b!1515875 (= lt!657195 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!657192 lt!657198 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101012 (_ BitVec 32)) SeekEntryResult!12914)

(assert (=> b!1515875 (= lt!657199 (seekEntryOrOpen!0 lt!657192 lt!657198 mask!2512))))

(declare-fun lt!657194 () SeekEntryResult!12914)

(assert (=> b!1515875 (= lt!657194 lt!657197)))

(assert (=> b!1515875 (= lt!657197 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48743 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515875 (= lt!657194 (seekEntryOrOpen!0 (select (arr!48743 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129156 res!1035769) b!1515868))

(assert (= (and b!1515868 res!1035775) b!1515864))

(assert (= (and b!1515864 res!1035778) b!1515865))

(assert (= (and b!1515865 res!1035773) b!1515871))

(assert (= (and b!1515871 res!1035777) b!1515873))

(assert (= (and b!1515873 res!1035771) b!1515872))

(assert (= (and b!1515872 res!1035774) b!1515869))

(assert (= (and b!1515869 res!1035767) b!1515867))

(assert (= (and b!1515867 res!1035776) b!1515870))

(assert (= (and b!1515870 res!1035770) b!1515874))

(assert (= (and b!1515874 res!1035772) b!1515863))

(assert (= (and b!1515874 (not res!1035768)) b!1515875))

(assert (= (and b!1515875 (not res!1035766)) b!1515866))

(assert (= (and b!1515866 (not res!1035765)) b!1515862))

(declare-fun m!1399063 () Bool)

(assert (=> b!1515862 m!1399063))

(declare-fun m!1399065 () Bool)

(assert (=> b!1515865 m!1399065))

(assert (=> b!1515865 m!1399065))

(declare-fun m!1399067 () Bool)

(assert (=> b!1515865 m!1399067))

(declare-fun m!1399069 () Bool)

(assert (=> b!1515873 m!1399069))

(declare-fun m!1399071 () Bool)

(assert (=> b!1515864 m!1399071))

(assert (=> b!1515864 m!1399071))

(declare-fun m!1399073 () Bool)

(assert (=> b!1515864 m!1399073))

(declare-fun m!1399075 () Bool)

(assert (=> start!129156 m!1399075))

(declare-fun m!1399077 () Bool)

(assert (=> start!129156 m!1399077))

(assert (=> b!1515867 m!1399065))

(assert (=> b!1515867 m!1399065))

(declare-fun m!1399079 () Bool)

(assert (=> b!1515867 m!1399079))

(assert (=> b!1515874 m!1399065))

(declare-fun m!1399081 () Bool)

(assert (=> b!1515874 m!1399081))

(declare-fun m!1399083 () Bool)

(assert (=> b!1515874 m!1399083))

(declare-fun m!1399085 () Bool)

(assert (=> b!1515874 m!1399085))

(declare-fun m!1399087 () Bool)

(assert (=> b!1515871 m!1399087))

(assert (=> b!1515863 m!1399065))

(assert (=> b!1515863 m!1399065))

(declare-fun m!1399089 () Bool)

(assert (=> b!1515863 m!1399089))

(assert (=> b!1515869 m!1399065))

(assert (=> b!1515869 m!1399065))

(declare-fun m!1399091 () Bool)

(assert (=> b!1515869 m!1399091))

(assert (=> b!1515869 m!1399091))

(assert (=> b!1515869 m!1399065))

(declare-fun m!1399093 () Bool)

(assert (=> b!1515869 m!1399093))

(declare-fun m!1399095 () Bool)

(assert (=> b!1515866 m!1399095))

(declare-fun m!1399097 () Bool)

(assert (=> b!1515870 m!1399097))

(assert (=> b!1515870 m!1399097))

(declare-fun m!1399099 () Bool)

(assert (=> b!1515870 m!1399099))

(declare-fun m!1399101 () Bool)

(assert (=> b!1515870 m!1399101))

(declare-fun m!1399103 () Bool)

(assert (=> b!1515870 m!1399103))

(assert (=> b!1515875 m!1399065))

(declare-fun m!1399105 () Bool)

(assert (=> b!1515875 m!1399105))

(assert (=> b!1515875 m!1399065))

(declare-fun m!1399107 () Bool)

(assert (=> b!1515875 m!1399107))

(declare-fun m!1399109 () Bool)

(assert (=> b!1515875 m!1399109))

(assert (=> b!1515875 m!1399065))

(declare-fun m!1399111 () Bool)

(assert (=> b!1515875 m!1399111))

(push 1)

