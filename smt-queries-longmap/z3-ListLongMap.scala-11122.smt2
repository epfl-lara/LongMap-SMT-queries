; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129912 () Bool)

(assert start!129912)

(declare-fun b!1524742 () Bool)

(declare-fun res!1043291 () Bool)

(declare-fun e!849920 () Bool)

(assert (=> b!1524742 (=> (not res!1043291) (not e!849920))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101386 0))(
  ( (array!101387 (arr!48922 (Array (_ BitVec 32) (_ BitVec 64))) (size!49474 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101386)

(declare-datatypes ((SeekEntryResult!13110 0))(
  ( (MissingZero!13110 (index!54835 (_ BitVec 32))) (Found!13110 (index!54836 (_ BitVec 32))) (Intermediate!13110 (undefined!13922 Bool) (index!54837 (_ BitVec 32)) (x!136534 (_ BitVec 32))) (Undefined!13110) (MissingVacant!13110 (index!54838 (_ BitVec 32))) )
))
(declare-fun lt!660263 () SeekEntryResult!13110)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101386 (_ BitVec 32)) SeekEntryResult!13110)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1524742 (= res!1043291 (= lt!660263 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48922 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48922 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101387 (store (arr!48922 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49474 a!2804)) mask!2512)))))

(declare-fun b!1524743 () Bool)

(declare-fun res!1043289 () Bool)

(declare-fun e!849921 () Bool)

(assert (=> b!1524743 (=> (not res!1043289) (not e!849921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101386 (_ BitVec 32)) Bool)

(assert (=> b!1524743 (= res!1043289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1524744 () Bool)

(declare-fun res!1043293 () Bool)

(assert (=> b!1524744 (=> (not res!1043293) (not e!849920))))

(declare-fun lt!660262 () SeekEntryResult!13110)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1524744 (= res!1043293 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48922 a!2804) j!70) a!2804 mask!2512) lt!660262))))

(declare-fun b!1524745 () Bool)

(declare-fun res!1043295 () Bool)

(declare-fun e!849922 () Bool)

(assert (=> b!1524745 (=> (not res!1043295) (not e!849922))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101386 (_ BitVec 32)) SeekEntryResult!13110)

(assert (=> b!1524745 (= res!1043295 (= (seekEntry!0 (select (arr!48922 a!2804) j!70) a!2804 mask!2512) (Found!13110 j!70)))))

(declare-fun b!1524746 () Bool)

(assert (=> b!1524746 (= e!849921 e!849920)))

(declare-fun res!1043287 () Bool)

(assert (=> b!1524746 (=> (not res!1043287) (not e!849920))))

(assert (=> b!1524746 (= res!1043287 (= lt!660263 lt!660262))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1524746 (= lt!660262 (Intermediate!13110 false resIndex!21 resX!21))))

(assert (=> b!1524746 (= lt!660263 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48922 a!2804) j!70) mask!2512) (select (arr!48922 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1524747 () Bool)

(assert (=> b!1524747 (= e!849920 (not true))))

(assert (=> b!1524747 e!849922))

(declare-fun res!1043294 () Bool)

(assert (=> b!1524747 (=> (not res!1043294) (not e!849922))))

(assert (=> b!1524747 (= res!1043294 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50843 0))(
  ( (Unit!50844) )
))
(declare-fun lt!660264 () Unit!50843)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50843)

(assert (=> b!1524747 (= lt!660264 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1524748 () Bool)

(declare-fun e!849918 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101386 (_ BitVec 32)) SeekEntryResult!13110)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101386 (_ BitVec 32)) SeekEntryResult!13110)

(assert (=> b!1524748 (= e!849918 (= (seekEntryOrOpen!0 (select (arr!48922 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48922 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1524749 () Bool)

(declare-fun res!1043290 () Bool)

(assert (=> b!1524749 (=> (not res!1043290) (not e!849921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1524749 (= res!1043290 (validKeyInArray!0 (select (arr!48922 a!2804) i!961)))))

(declare-fun b!1524750 () Bool)

(declare-fun res!1043296 () Bool)

(assert (=> b!1524750 (=> (not res!1043296) (not e!849921))))

(assert (=> b!1524750 (= res!1043296 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49474 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49474 a!2804))))))

(declare-fun b!1524752 () Bool)

(declare-fun res!1043292 () Bool)

(assert (=> b!1524752 (=> (not res!1043292) (not e!849921))))

(declare-datatypes ((List!35483 0))(
  ( (Nil!35480) (Cons!35479 (h!36910 (_ BitVec 64)) (t!50169 List!35483)) )
))
(declare-fun arrayNoDuplicates!0 (array!101386 (_ BitVec 32) List!35483) Bool)

(assert (=> b!1524752 (= res!1043292 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35480))))

(declare-fun b!1524753 () Bool)

(declare-fun res!1043299 () Bool)

(assert (=> b!1524753 (=> (not res!1043299) (not e!849921))))

(assert (=> b!1524753 (= res!1043299 (and (= (size!49474 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49474 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49474 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1524754 () Bool)

(assert (=> b!1524754 (= e!849922 e!849918)))

(declare-fun res!1043288 () Bool)

(assert (=> b!1524754 (=> res!1043288 e!849918)))

(assert (=> b!1524754 (= res!1043288 (or (not (= (select (arr!48922 a!2804) j!70) (select (store (arr!48922 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48922 a!2804) index!487) (select (arr!48922 a!2804) j!70)) (not (= (select (arr!48922 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1043297 () Bool)

(assert (=> start!129912 (=> (not res!1043297) (not e!849921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129912 (= res!1043297 (validMask!0 mask!2512))))

(assert (=> start!129912 e!849921))

(assert (=> start!129912 true))

(declare-fun array_inv!38155 (array!101386) Bool)

(assert (=> start!129912 (array_inv!38155 a!2804)))

(declare-fun b!1524751 () Bool)

(declare-fun res!1043298 () Bool)

(assert (=> b!1524751 (=> (not res!1043298) (not e!849921))))

(assert (=> b!1524751 (= res!1043298 (validKeyInArray!0 (select (arr!48922 a!2804) j!70)))))

(assert (= (and start!129912 res!1043297) b!1524753))

(assert (= (and b!1524753 res!1043299) b!1524749))

(assert (= (and b!1524749 res!1043290) b!1524751))

(assert (= (and b!1524751 res!1043298) b!1524743))

(assert (= (and b!1524743 res!1043289) b!1524752))

(assert (= (and b!1524752 res!1043292) b!1524750))

(assert (= (and b!1524750 res!1043296) b!1524746))

(assert (= (and b!1524746 res!1043287) b!1524744))

(assert (= (and b!1524744 res!1043293) b!1524742))

(assert (= (and b!1524742 res!1043291) b!1524747))

(assert (= (and b!1524747 res!1043294) b!1524745))

(assert (= (and b!1524745 res!1043295) b!1524754))

(assert (= (and b!1524754 (not res!1043288)) b!1524748))

(declare-fun m!1407047 () Bool)

(assert (=> b!1524743 m!1407047))

(declare-fun m!1407049 () Bool)

(assert (=> b!1524752 m!1407049))

(declare-fun m!1407051 () Bool)

(assert (=> b!1524749 m!1407051))

(assert (=> b!1524749 m!1407051))

(declare-fun m!1407053 () Bool)

(assert (=> b!1524749 m!1407053))

(declare-fun m!1407055 () Bool)

(assert (=> b!1524746 m!1407055))

(assert (=> b!1524746 m!1407055))

(declare-fun m!1407057 () Bool)

(assert (=> b!1524746 m!1407057))

(assert (=> b!1524746 m!1407057))

(assert (=> b!1524746 m!1407055))

(declare-fun m!1407059 () Bool)

(assert (=> b!1524746 m!1407059))

(assert (=> b!1524748 m!1407055))

(assert (=> b!1524748 m!1407055))

(declare-fun m!1407061 () Bool)

(assert (=> b!1524748 m!1407061))

(assert (=> b!1524748 m!1407055))

(declare-fun m!1407063 () Bool)

(assert (=> b!1524748 m!1407063))

(declare-fun m!1407065 () Bool)

(assert (=> b!1524747 m!1407065))

(declare-fun m!1407067 () Bool)

(assert (=> b!1524747 m!1407067))

(declare-fun m!1407069 () Bool)

(assert (=> start!129912 m!1407069))

(declare-fun m!1407071 () Bool)

(assert (=> start!129912 m!1407071))

(assert (=> b!1524744 m!1407055))

(assert (=> b!1524744 m!1407055))

(declare-fun m!1407073 () Bool)

(assert (=> b!1524744 m!1407073))

(assert (=> b!1524751 m!1407055))

(assert (=> b!1524751 m!1407055))

(declare-fun m!1407075 () Bool)

(assert (=> b!1524751 m!1407075))

(assert (=> b!1524745 m!1407055))

(assert (=> b!1524745 m!1407055))

(declare-fun m!1407077 () Bool)

(assert (=> b!1524745 m!1407077))

(assert (=> b!1524754 m!1407055))

(declare-fun m!1407079 () Bool)

(assert (=> b!1524754 m!1407079))

(declare-fun m!1407081 () Bool)

(assert (=> b!1524754 m!1407081))

(declare-fun m!1407083 () Bool)

(assert (=> b!1524754 m!1407083))

(assert (=> b!1524742 m!1407079))

(assert (=> b!1524742 m!1407081))

(assert (=> b!1524742 m!1407081))

(declare-fun m!1407085 () Bool)

(assert (=> b!1524742 m!1407085))

(assert (=> b!1524742 m!1407085))

(assert (=> b!1524742 m!1407081))

(declare-fun m!1407087 () Bool)

(assert (=> b!1524742 m!1407087))

(check-sat (not b!1524743) (not b!1524751) (not b!1524745) (not start!129912) (not b!1524748) (not b!1524749) (not b!1524747) (not b!1524744) (not b!1524752) (not b!1524742) (not b!1524746))
(check-sat)
