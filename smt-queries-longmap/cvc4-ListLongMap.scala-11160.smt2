; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130446 () Bool)

(assert start!130446)

(declare-fun res!1048348 () Bool)

(declare-fun e!853094 () Bool)

(assert (=> start!130446 (=> (not res!1048348) (not e!853094))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130446 (= res!1048348 (validMask!0 mask!2512))))

(assert (=> start!130446 e!853094))

(assert (=> start!130446 true))

(declare-datatypes ((array!101682 0))(
  ( (array!101683 (arr!49063 (Array (_ BitVec 32) (_ BitVec 64))) (size!49613 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101682)

(declare-fun array_inv!38091 (array!101682) Bool)

(assert (=> start!130446 (array_inv!38091 a!2804)))

(declare-fun b!1530996 () Bool)

(declare-fun res!1048337 () Bool)

(assert (=> b!1530996 (=> (not res!1048337) (not e!853094))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530996 (= res!1048337 (validKeyInArray!0 (select (arr!49063 a!2804) j!70)))))

(declare-fun b!1530997 () Bool)

(declare-fun res!1048341 () Bool)

(assert (=> b!1530997 (=> (not res!1048341) (not e!853094))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1530997 (= res!1048341 (validKeyInArray!0 (select (arr!49063 a!2804) i!961)))))

(declare-fun b!1530998 () Bool)

(declare-fun res!1048344 () Bool)

(declare-fun e!853093 () Bool)

(assert (=> b!1530998 (=> (not res!1048344) (not e!853093))))

(declare-datatypes ((SeekEntryResult!13228 0))(
  ( (MissingZero!13228 (index!55307 (_ BitVec 32))) (Found!13228 (index!55308 (_ BitVec 32))) (Intermediate!13228 (undefined!14040 Bool) (index!55309 (_ BitVec 32)) (x!136997 (_ BitVec 32))) (Undefined!13228) (MissingVacant!13228 (index!55310 (_ BitVec 32))) )
))
(declare-fun lt!663053 () SeekEntryResult!13228)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101682 (_ BitVec 32)) SeekEntryResult!13228)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530998 (= res!1048344 (= lt!663053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49063 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49063 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101683 (store (arr!49063 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49613 a!2804)) mask!2512)))))

(declare-fun b!1530999 () Bool)

(declare-fun res!1048342 () Bool)

(assert (=> b!1530999 (=> (not res!1048342) (not e!853094))))

(assert (=> b!1530999 (= res!1048342 (and (= (size!49613 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49613 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49613 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531000 () Bool)

(declare-fun res!1048343 () Bool)

(assert (=> b!1531000 (=> (not res!1048343) (not e!853094))))

(declare-datatypes ((List!35546 0))(
  ( (Nil!35543) (Cons!35542 (h!36984 (_ BitVec 64)) (t!50240 List!35546)) )
))
(declare-fun arrayNoDuplicates!0 (array!101682 (_ BitVec 32) List!35546) Bool)

(assert (=> b!1531000 (= res!1048343 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35543))))

(declare-fun b!1531001 () Bool)

(declare-fun res!1048347 () Bool)

(assert (=> b!1531001 (=> (not res!1048347) (not e!853094))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1531001 (= res!1048347 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49613 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49613 a!2804))))))

(declare-fun b!1531002 () Bool)

(declare-fun res!1048338 () Bool)

(assert (=> b!1531002 (=> (not res!1048338) (not e!853093))))

(declare-fun lt!663055 () SeekEntryResult!13228)

(assert (=> b!1531002 (= res!1048338 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49063 a!2804) j!70) a!2804 mask!2512) lt!663055))))

(declare-fun e!853096 () Bool)

(declare-fun b!1531003 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101682 (_ BitVec 32)) SeekEntryResult!13228)

(assert (=> b!1531003 (= e!853096 (= (seekEntry!0 (select (arr!49063 a!2804) j!70) a!2804 mask!2512) (Found!13228 j!70)))))

(declare-fun b!1531004 () Bool)

(assert (=> b!1531004 (= e!853094 e!853093)))

(declare-fun res!1048339 () Bool)

(assert (=> b!1531004 (=> (not res!1048339) (not e!853093))))

(assert (=> b!1531004 (= res!1048339 (= lt!663053 lt!663055))))

(assert (=> b!1531004 (= lt!663055 (Intermediate!13228 false resIndex!21 resX!21))))

(assert (=> b!1531004 (= lt!663053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49063 a!2804) j!70) mask!2512) (select (arr!49063 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531005 () Bool)

(declare-fun res!1048345 () Bool)

(assert (=> b!1531005 (=> (not res!1048345) (not e!853094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101682 (_ BitVec 32)) Bool)

(assert (=> b!1531005 (= res!1048345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531006 () Bool)

(declare-fun e!853095 () Bool)

(assert (=> b!1531006 (= e!853093 (not e!853095))))

(declare-fun res!1048346 () Bool)

(assert (=> b!1531006 (=> res!1048346 e!853095)))

(assert (=> b!1531006 (= res!1048346 (or (not (= (select (arr!49063 a!2804) j!70) (select (store (arr!49063 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1531006 e!853096))

(declare-fun res!1048340 () Bool)

(assert (=> b!1531006 (=> (not res!1048340) (not e!853096))))

(assert (=> b!1531006 (= res!1048340 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51240 0))(
  ( (Unit!51241) )
))
(declare-fun lt!663052 () Unit!51240)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101682 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51240)

(assert (=> b!1531006 (= lt!663052 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531007 () Bool)

(assert (=> b!1531007 (= e!853095 true)))

(declare-fun lt!663054 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531007 (= lt!663054 (nextIndex!0 index!487 x!534 mask!2512))))

(assert (= (and start!130446 res!1048348) b!1530999))

(assert (= (and b!1530999 res!1048342) b!1530997))

(assert (= (and b!1530997 res!1048341) b!1530996))

(assert (= (and b!1530996 res!1048337) b!1531005))

(assert (= (and b!1531005 res!1048345) b!1531000))

(assert (= (and b!1531000 res!1048343) b!1531001))

(assert (= (and b!1531001 res!1048347) b!1531004))

(assert (= (and b!1531004 res!1048339) b!1531002))

(assert (= (and b!1531002 res!1048338) b!1530998))

(assert (= (and b!1530998 res!1048344) b!1531006))

(assert (= (and b!1531006 res!1048340) b!1531003))

(assert (= (and b!1531006 (not res!1048346)) b!1531007))

(declare-fun m!1413769 () Bool)

(assert (=> b!1530998 m!1413769))

(declare-fun m!1413771 () Bool)

(assert (=> b!1530998 m!1413771))

(assert (=> b!1530998 m!1413771))

(declare-fun m!1413773 () Bool)

(assert (=> b!1530998 m!1413773))

(assert (=> b!1530998 m!1413773))

(assert (=> b!1530998 m!1413771))

(declare-fun m!1413775 () Bool)

(assert (=> b!1530998 m!1413775))

(declare-fun m!1413777 () Bool)

(assert (=> start!130446 m!1413777))

(declare-fun m!1413779 () Bool)

(assert (=> start!130446 m!1413779))

(declare-fun m!1413781 () Bool)

(assert (=> b!1531003 m!1413781))

(assert (=> b!1531003 m!1413781))

(declare-fun m!1413783 () Bool)

(assert (=> b!1531003 m!1413783))

(declare-fun m!1413785 () Bool)

(assert (=> b!1531005 m!1413785))

(assert (=> b!1531004 m!1413781))

(assert (=> b!1531004 m!1413781))

(declare-fun m!1413787 () Bool)

(assert (=> b!1531004 m!1413787))

(assert (=> b!1531004 m!1413787))

(assert (=> b!1531004 m!1413781))

(declare-fun m!1413789 () Bool)

(assert (=> b!1531004 m!1413789))

(assert (=> b!1531002 m!1413781))

(assert (=> b!1531002 m!1413781))

(declare-fun m!1413791 () Bool)

(assert (=> b!1531002 m!1413791))

(declare-fun m!1413793 () Bool)

(assert (=> b!1531007 m!1413793))

(assert (=> b!1531006 m!1413781))

(declare-fun m!1413795 () Bool)

(assert (=> b!1531006 m!1413795))

(assert (=> b!1531006 m!1413769))

(assert (=> b!1531006 m!1413771))

(declare-fun m!1413797 () Bool)

(assert (=> b!1531006 m!1413797))

(declare-fun m!1413799 () Bool)

(assert (=> b!1531000 m!1413799))

(declare-fun m!1413801 () Bool)

(assert (=> b!1530997 m!1413801))

(assert (=> b!1530997 m!1413801))

(declare-fun m!1413803 () Bool)

(assert (=> b!1530997 m!1413803))

(assert (=> b!1530996 m!1413781))

(assert (=> b!1530996 m!1413781))

(declare-fun m!1413805 () Bool)

(assert (=> b!1530996 m!1413805))

(push 1)

