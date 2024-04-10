; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129620 () Bool)

(assert start!129620)

(declare-fun res!1040907 () Bool)

(declare-fun e!848606 () Bool)

(assert (=> start!129620 (=> (not res!1040907) (not e!848606))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129620 (= res!1040907 (validMask!0 mask!2512))))

(assert (=> start!129620 e!848606))

(assert (=> start!129620 true))

(declare-datatypes ((array!101295 0))(
  ( (array!101296 (arr!48880 (Array (_ BitVec 32) (_ BitVec 64))) (size!49430 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101295)

(declare-fun array_inv!37908 (array!101295) Bool)

(assert (=> start!129620 (array_inv!37908 a!2804)))

(declare-fun b!1521678 () Bool)

(declare-fun res!1040900 () Bool)

(assert (=> b!1521678 (=> (not res!1040900) (not e!848606))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1521678 (= res!1040900 (and (= (size!49430 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49430 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49430 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521679 () Bool)

(declare-fun e!848608 () Bool)

(assert (=> b!1521679 (= e!848606 e!848608)))

(declare-fun res!1040904 () Bool)

(assert (=> b!1521679 (=> (not res!1040904) (not e!848608))))

(declare-datatypes ((SeekEntryResult!13045 0))(
  ( (MissingZero!13045 (index!54575 (_ BitVec 32))) (Found!13045 (index!54576 (_ BitVec 32))) (Intermediate!13045 (undefined!13857 Bool) (index!54577 (_ BitVec 32)) (x!136265 (_ BitVec 32))) (Undefined!13045) (MissingVacant!13045 (index!54578 (_ BitVec 32))) )
))
(declare-fun lt!659403 () SeekEntryResult!13045)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101295 (_ BitVec 32)) SeekEntryResult!13045)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521679 (= res!1040904 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48880 a!2804) j!70) mask!2512) (select (arr!48880 a!2804) j!70) a!2804 mask!2512) lt!659403))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521679 (= lt!659403 (Intermediate!13045 false resIndex!21 resX!21))))

(declare-fun b!1521680 () Bool)

(declare-fun res!1040902 () Bool)

(assert (=> b!1521680 (=> (not res!1040902) (not e!848606))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521680 (= res!1040902 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49430 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49430 a!2804))))))

(declare-fun b!1521681 () Bool)

(declare-fun res!1040905 () Bool)

(assert (=> b!1521681 (=> (not res!1040905) (not e!848606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521681 (= res!1040905 (validKeyInArray!0 (select (arr!48880 a!2804) j!70)))))

(declare-fun b!1521682 () Bool)

(declare-fun res!1040901 () Bool)

(assert (=> b!1521682 (=> (not res!1040901) (not e!848606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101295 (_ BitVec 32)) Bool)

(assert (=> b!1521682 (= res!1040901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521683 () Bool)

(declare-fun res!1040906 () Bool)

(assert (=> b!1521683 (=> (not res!1040906) (not e!848606))))

(declare-datatypes ((List!35363 0))(
  ( (Nil!35360) (Cons!35359 (h!36780 (_ BitVec 64)) (t!50057 List!35363)) )
))
(declare-fun arrayNoDuplicates!0 (array!101295 (_ BitVec 32) List!35363) Bool)

(assert (=> b!1521683 (= res!1040906 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35360))))

(declare-fun b!1521684 () Bool)

(declare-fun res!1040908 () Bool)

(assert (=> b!1521684 (=> (not res!1040908) (not e!848606))))

(assert (=> b!1521684 (= res!1040908 (validKeyInArray!0 (select (arr!48880 a!2804) i!961)))))

(declare-fun b!1521685 () Bool)

(assert (=> b!1521685 (= e!848608 false)))

(declare-fun lt!659404 () SeekEntryResult!13045)

(assert (=> b!1521685 (= lt!659404 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48880 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48880 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101296 (store (arr!48880 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49430 a!2804)) mask!2512))))

(declare-fun b!1521686 () Bool)

(declare-fun res!1040903 () Bool)

(assert (=> b!1521686 (=> (not res!1040903) (not e!848608))))

(assert (=> b!1521686 (= res!1040903 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48880 a!2804) j!70) a!2804 mask!2512) lt!659403))))

(assert (= (and start!129620 res!1040907) b!1521678))

(assert (= (and b!1521678 res!1040900) b!1521684))

(assert (= (and b!1521684 res!1040908) b!1521681))

(assert (= (and b!1521681 res!1040905) b!1521682))

(assert (= (and b!1521682 res!1040901) b!1521683))

(assert (= (and b!1521683 res!1040906) b!1521680))

(assert (= (and b!1521680 res!1040902) b!1521679))

(assert (= (and b!1521679 res!1040904) b!1521686))

(assert (= (and b!1521686 res!1040903) b!1521685))

(declare-fun m!1404779 () Bool)

(assert (=> b!1521679 m!1404779))

(assert (=> b!1521679 m!1404779))

(declare-fun m!1404781 () Bool)

(assert (=> b!1521679 m!1404781))

(assert (=> b!1521679 m!1404781))

(assert (=> b!1521679 m!1404779))

(declare-fun m!1404783 () Bool)

(assert (=> b!1521679 m!1404783))

(declare-fun m!1404785 () Bool)

(assert (=> b!1521685 m!1404785))

(declare-fun m!1404787 () Bool)

(assert (=> b!1521685 m!1404787))

(assert (=> b!1521685 m!1404787))

(declare-fun m!1404789 () Bool)

(assert (=> b!1521685 m!1404789))

(assert (=> b!1521685 m!1404789))

(assert (=> b!1521685 m!1404787))

(declare-fun m!1404791 () Bool)

(assert (=> b!1521685 m!1404791))

(declare-fun m!1404793 () Bool)

(assert (=> b!1521683 m!1404793))

(assert (=> b!1521681 m!1404779))

(assert (=> b!1521681 m!1404779))

(declare-fun m!1404795 () Bool)

(assert (=> b!1521681 m!1404795))

(declare-fun m!1404797 () Bool)

(assert (=> b!1521682 m!1404797))

(assert (=> b!1521686 m!1404779))

(assert (=> b!1521686 m!1404779))

(declare-fun m!1404799 () Bool)

(assert (=> b!1521686 m!1404799))

(declare-fun m!1404801 () Bool)

(assert (=> start!129620 m!1404801))

(declare-fun m!1404803 () Bool)

(assert (=> start!129620 m!1404803))

(declare-fun m!1404805 () Bool)

(assert (=> b!1521684 m!1404805))

(assert (=> b!1521684 m!1404805))

(declare-fun m!1404807 () Bool)

(assert (=> b!1521684 m!1404807))

(push 1)

(assert (not start!129620))

(assert (not b!1521682))

(assert (not b!1521681))

(assert (not b!1521685))

(assert (not b!1521679))

