; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129170 () Bool)

(assert start!129170)

(declare-fun res!1030865 () Bool)

(declare-fun e!844543 () Bool)

(assert (=> start!129170 (=> (not res!1030865) (not e!844543))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129170 (= res!1030865 (validMask!0 mask!2512))))

(assert (=> start!129170 e!844543))

(assert (=> start!129170 true))

(declare-datatypes ((array!100840 0))(
  ( (array!100841 (arr!48652 (Array (_ BitVec 32) (_ BitVec 64))) (size!49203 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100840)

(declare-fun array_inv!37933 (array!100840) Bool)

(assert (=> start!129170 (array_inv!37933 a!2804)))

(declare-fun b!1512137 () Bool)

(declare-fun res!1030869 () Bool)

(assert (=> b!1512137 (=> (not res!1030869) (not e!844543))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1512137 (= res!1030869 (and (= (size!49203 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49203 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49203 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512138 () Bool)

(declare-fun res!1030864 () Bool)

(assert (=> b!1512138 (=> (not res!1030864) (not e!844543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512138 (= res!1030864 (validKeyInArray!0 (select (arr!48652 a!2804) j!70)))))

(declare-fun b!1512139 () Bool)

(declare-fun e!844542 () Bool)

(declare-datatypes ((SeekEntryResult!12716 0))(
  ( (MissingZero!12716 (index!53259 (_ BitVec 32))) (Found!12716 (index!53260 (_ BitVec 32))) (Intermediate!12716 (undefined!13528 Bool) (index!53261 (_ BitVec 32)) (x!135207 (_ BitVec 32))) (Undefined!12716) (MissingVacant!12716 (index!53262 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100840 (_ BitVec 32)) SeekEntryResult!12716)

(assert (=> b!1512139 (= e!844542 (= (seekEntry!0 (select (arr!48652 a!2804) j!70) a!2804 mask!2512) (Found!12716 j!70)))))

(declare-fun b!1512140 () Bool)

(declare-fun e!844541 () Bool)

(assert (=> b!1512140 (= e!844543 e!844541)))

(declare-fun res!1030870 () Bool)

(assert (=> b!1512140 (=> (not res!1030870) (not e!844541))))

(declare-fun lt!655796 () SeekEntryResult!12716)

(declare-fun lt!655797 () SeekEntryResult!12716)

(assert (=> b!1512140 (= res!1030870 (= lt!655796 lt!655797))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1512140 (= lt!655797 (Intermediate!12716 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100840 (_ BitVec 32)) SeekEntryResult!12716)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512140 (= lt!655796 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48652 a!2804) j!70) mask!2512) (select (arr!48652 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512141 () Bool)

(declare-fun res!1030863 () Bool)

(assert (=> b!1512141 (=> (not res!1030863) (not e!844541))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1512141 (= res!1030863 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48652 a!2804) j!70) a!2804 mask!2512) lt!655797))))

(declare-fun b!1512142 () Bool)

(declare-fun res!1030871 () Bool)

(assert (=> b!1512142 (=> (not res!1030871) (not e!844543))))

(declare-datatypes ((List!35122 0))(
  ( (Nil!35119) (Cons!35118 (h!36545 (_ BitVec 64)) (t!49808 List!35122)) )
))
(declare-fun arrayNoDuplicates!0 (array!100840 (_ BitVec 32) List!35122) Bool)

(assert (=> b!1512142 (= res!1030871 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35119))))

(declare-fun b!1512143 () Bool)

(declare-fun e!844545 () Bool)

(assert (=> b!1512143 (= e!844545 (validKeyInArray!0 (select (store (arr!48652 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun b!1512144 () Bool)

(declare-fun res!1030874 () Bool)

(assert (=> b!1512144 (=> (not res!1030874) (not e!844541))))

(assert (=> b!1512144 (= res!1030874 (= lt!655796 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48652 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48652 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100841 (store (arr!48652 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49203 a!2804)) mask!2512)))))

(declare-fun b!1512145 () Bool)

(assert (=> b!1512145 (= e!844541 (not e!844545))))

(declare-fun res!1030872 () Bool)

(assert (=> b!1512145 (=> res!1030872 e!844545)))

(assert (=> b!1512145 (= res!1030872 (or (not (= (select (arr!48652 a!2804) j!70) (select (store (arr!48652 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48652 a!2804) index!487) (select (arr!48652 a!2804) j!70))) (not (= j!70 index!487)) (bvslt mask!2512 #b00000000000000000000000000000000)))))

(assert (=> b!1512145 e!844542))

(declare-fun res!1030868 () Bool)

(assert (=> b!1512145 (=> (not res!1030868) (not e!844542))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100840 (_ BitVec 32)) Bool)

(assert (=> b!1512145 (= res!1030868 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50335 0))(
  ( (Unit!50336) )
))
(declare-fun lt!655798 () Unit!50335)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100840 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50335)

(assert (=> b!1512145 (= lt!655798 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512146 () Bool)

(declare-fun res!1030867 () Bool)

(assert (=> b!1512146 (=> (not res!1030867) (not e!844543))))

(assert (=> b!1512146 (= res!1030867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512147 () Bool)

(declare-fun res!1030873 () Bool)

(assert (=> b!1512147 (=> (not res!1030873) (not e!844543))))

(assert (=> b!1512147 (= res!1030873 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49203 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49203 a!2804))))))

(declare-fun b!1512148 () Bool)

(declare-fun res!1030866 () Bool)

(assert (=> b!1512148 (=> (not res!1030866) (not e!844543))))

(assert (=> b!1512148 (= res!1030866 (validKeyInArray!0 (select (arr!48652 a!2804) i!961)))))

(assert (= (and start!129170 res!1030865) b!1512137))

(assert (= (and b!1512137 res!1030869) b!1512148))

(assert (= (and b!1512148 res!1030866) b!1512138))

(assert (= (and b!1512138 res!1030864) b!1512146))

(assert (= (and b!1512146 res!1030867) b!1512142))

(assert (= (and b!1512142 res!1030871) b!1512147))

(assert (= (and b!1512147 res!1030873) b!1512140))

(assert (= (and b!1512140 res!1030870) b!1512141))

(assert (= (and b!1512141 res!1030863) b!1512144))

(assert (= (and b!1512144 res!1030874) b!1512145))

(assert (= (and b!1512145 res!1030868) b!1512139))

(assert (= (and b!1512145 (not res!1030872)) b!1512143))

(declare-fun m!1394673 () Bool)

(assert (=> b!1512140 m!1394673))

(assert (=> b!1512140 m!1394673))

(declare-fun m!1394675 () Bool)

(assert (=> b!1512140 m!1394675))

(assert (=> b!1512140 m!1394675))

(assert (=> b!1512140 m!1394673))

(declare-fun m!1394677 () Bool)

(assert (=> b!1512140 m!1394677))

(declare-fun m!1394679 () Bool)

(assert (=> start!129170 m!1394679))

(declare-fun m!1394681 () Bool)

(assert (=> start!129170 m!1394681))

(declare-fun m!1394683 () Bool)

(assert (=> b!1512144 m!1394683))

(declare-fun m!1394685 () Bool)

(assert (=> b!1512144 m!1394685))

(assert (=> b!1512144 m!1394685))

(declare-fun m!1394687 () Bool)

(assert (=> b!1512144 m!1394687))

(assert (=> b!1512144 m!1394687))

(assert (=> b!1512144 m!1394685))

(declare-fun m!1394689 () Bool)

(assert (=> b!1512144 m!1394689))

(declare-fun m!1394691 () Bool)

(assert (=> b!1512146 m!1394691))

(declare-fun m!1394693 () Bool)

(assert (=> b!1512148 m!1394693))

(assert (=> b!1512148 m!1394693))

(declare-fun m!1394695 () Bool)

(assert (=> b!1512148 m!1394695))

(assert (=> b!1512141 m!1394673))

(assert (=> b!1512141 m!1394673))

(declare-fun m!1394697 () Bool)

(assert (=> b!1512141 m!1394697))

(assert (=> b!1512143 m!1394683))

(assert (=> b!1512143 m!1394685))

(assert (=> b!1512143 m!1394685))

(declare-fun m!1394699 () Bool)

(assert (=> b!1512143 m!1394699))

(assert (=> b!1512139 m!1394673))

(assert (=> b!1512139 m!1394673))

(declare-fun m!1394701 () Bool)

(assert (=> b!1512139 m!1394701))

(declare-fun m!1394703 () Bool)

(assert (=> b!1512142 m!1394703))

(assert (=> b!1512145 m!1394673))

(declare-fun m!1394705 () Bool)

(assert (=> b!1512145 m!1394705))

(assert (=> b!1512145 m!1394683))

(declare-fun m!1394707 () Bool)

(assert (=> b!1512145 m!1394707))

(assert (=> b!1512145 m!1394685))

(declare-fun m!1394709 () Bool)

(assert (=> b!1512145 m!1394709))

(assert (=> b!1512138 m!1394673))

(assert (=> b!1512138 m!1394673))

(declare-fun m!1394711 () Bool)

(assert (=> b!1512138 m!1394711))

(check-sat (not b!1512140) (not b!1512146) (not b!1512145) (not b!1512138) (not b!1512142) (not b!1512141) (not start!129170) (not b!1512148) (not b!1512144) (not b!1512139) (not b!1512143))
(check-sat)
