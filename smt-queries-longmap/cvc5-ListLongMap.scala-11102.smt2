; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129634 () Bool)

(assert start!129634)

(declare-fun b!1521869 () Bool)

(declare-fun res!1041092 () Bool)

(declare-fun e!848670 () Bool)

(assert (=> b!1521869 (=> (not res!1041092) (not e!848670))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101309 0))(
  ( (array!101310 (arr!48887 (Array (_ BitVec 32) (_ BitVec 64))) (size!49437 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101309)

(declare-datatypes ((SeekEntryResult!13052 0))(
  ( (MissingZero!13052 (index!54603 (_ BitVec 32))) (Found!13052 (index!54604 (_ BitVec 32))) (Intermediate!13052 (undefined!13864 Bool) (index!54605 (_ BitVec 32)) (x!136296 (_ BitVec 32))) (Undefined!13052) (MissingVacant!13052 (index!54606 (_ BitVec 32))) )
))
(declare-fun lt!659445 () SeekEntryResult!13052)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101309 (_ BitVec 32)) SeekEntryResult!13052)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521869 (= res!1041092 (= lt!659445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48887 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48887 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101310 (store (arr!48887 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49437 a!2804)) mask!2512)))))

(declare-fun b!1521870 () Bool)

(declare-fun res!1041098 () Bool)

(declare-fun e!848671 () Bool)

(assert (=> b!1521870 (=> (not res!1041098) (not e!848671))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521870 (= res!1041098 (validKeyInArray!0 (select (arr!48887 a!2804) i!961)))))

(declare-fun b!1521871 () Bool)

(declare-fun res!1041100 () Bool)

(assert (=> b!1521871 (=> (not res!1041100) (not e!848671))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1521871 (= res!1041100 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49437 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49437 a!2804))))))

(declare-fun b!1521872 () Bool)

(declare-fun res!1041094 () Bool)

(assert (=> b!1521872 (=> (not res!1041094) (not e!848670))))

(declare-fun lt!659446 () SeekEntryResult!13052)

(assert (=> b!1521872 (= res!1041094 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48887 a!2804) j!70) a!2804 mask!2512) lt!659446))))

(declare-fun res!1041093 () Bool)

(assert (=> start!129634 (=> (not res!1041093) (not e!848671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129634 (= res!1041093 (validMask!0 mask!2512))))

(assert (=> start!129634 e!848671))

(assert (=> start!129634 true))

(declare-fun array_inv!37915 (array!101309) Bool)

(assert (=> start!129634 (array_inv!37915 a!2804)))

(declare-fun b!1521873 () Bool)

(declare-fun res!1041096 () Bool)

(assert (=> b!1521873 (=> (not res!1041096) (not e!848671))))

(declare-datatypes ((List!35370 0))(
  ( (Nil!35367) (Cons!35366 (h!36787 (_ BitVec 64)) (t!50064 List!35370)) )
))
(declare-fun arrayNoDuplicates!0 (array!101309 (_ BitVec 32) List!35370) Bool)

(assert (=> b!1521873 (= res!1041096 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35367))))

(declare-fun b!1521874 () Bool)

(assert (=> b!1521874 (= e!848671 e!848670)))

(declare-fun res!1041097 () Bool)

(assert (=> b!1521874 (=> (not res!1041097) (not e!848670))))

(assert (=> b!1521874 (= res!1041097 (= lt!659445 lt!659446))))

(assert (=> b!1521874 (= lt!659446 (Intermediate!13052 false resIndex!21 resX!21))))

(assert (=> b!1521874 (= lt!659445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48887 a!2804) j!70) mask!2512) (select (arr!48887 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521875 () Bool)

(declare-fun res!1041099 () Bool)

(assert (=> b!1521875 (=> (not res!1041099) (not e!848671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101309 (_ BitVec 32)) Bool)

(assert (=> b!1521875 (= res!1041099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521876 () Bool)

(declare-fun res!1041095 () Bool)

(assert (=> b!1521876 (=> (not res!1041095) (not e!848671))))

(assert (=> b!1521876 (= res!1041095 (validKeyInArray!0 (select (arr!48887 a!2804) j!70)))))

(declare-fun b!1521877 () Bool)

(assert (=> b!1521877 (= e!848670 (bvsgt #b00000000000000000000000000000000 (size!49437 a!2804)))))

(declare-fun b!1521878 () Bool)

(declare-fun res!1041091 () Bool)

(assert (=> b!1521878 (=> (not res!1041091) (not e!848671))))

(assert (=> b!1521878 (= res!1041091 (and (= (size!49437 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49437 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49437 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129634 res!1041093) b!1521878))

(assert (= (and b!1521878 res!1041091) b!1521870))

(assert (= (and b!1521870 res!1041098) b!1521876))

(assert (= (and b!1521876 res!1041095) b!1521875))

(assert (= (and b!1521875 res!1041099) b!1521873))

(assert (= (and b!1521873 res!1041096) b!1521871))

(assert (= (and b!1521871 res!1041100) b!1521874))

(assert (= (and b!1521874 res!1041097) b!1521872))

(assert (= (and b!1521872 res!1041094) b!1521869))

(assert (= (and b!1521869 res!1041092) b!1521877))

(declare-fun m!1404989 () Bool)

(assert (=> b!1521874 m!1404989))

(assert (=> b!1521874 m!1404989))

(declare-fun m!1404991 () Bool)

(assert (=> b!1521874 m!1404991))

(assert (=> b!1521874 m!1404991))

(assert (=> b!1521874 m!1404989))

(declare-fun m!1404993 () Bool)

(assert (=> b!1521874 m!1404993))

(declare-fun m!1404995 () Bool)

(assert (=> b!1521875 m!1404995))

(declare-fun m!1404997 () Bool)

(assert (=> b!1521873 m!1404997))

(declare-fun m!1404999 () Bool)

(assert (=> start!129634 m!1404999))

(declare-fun m!1405001 () Bool)

(assert (=> start!129634 m!1405001))

(declare-fun m!1405003 () Bool)

(assert (=> b!1521869 m!1405003))

(declare-fun m!1405005 () Bool)

(assert (=> b!1521869 m!1405005))

(assert (=> b!1521869 m!1405005))

(declare-fun m!1405007 () Bool)

(assert (=> b!1521869 m!1405007))

(assert (=> b!1521869 m!1405007))

(assert (=> b!1521869 m!1405005))

(declare-fun m!1405009 () Bool)

(assert (=> b!1521869 m!1405009))

(assert (=> b!1521872 m!1404989))

(assert (=> b!1521872 m!1404989))

(declare-fun m!1405011 () Bool)

(assert (=> b!1521872 m!1405011))

(assert (=> b!1521876 m!1404989))

(assert (=> b!1521876 m!1404989))

(declare-fun m!1405013 () Bool)

(assert (=> b!1521876 m!1405013))

(declare-fun m!1405015 () Bool)

(assert (=> b!1521870 m!1405015))

(assert (=> b!1521870 m!1405015))

(declare-fun m!1405017 () Bool)

(assert (=> b!1521870 m!1405017))

(push 1)

