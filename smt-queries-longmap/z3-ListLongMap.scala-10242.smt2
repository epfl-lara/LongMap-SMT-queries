; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120506 () Bool)

(assert start!120506)

(declare-fun b!1403198 () Bool)

(declare-fun res!941715 () Bool)

(declare-fun e!794523 () Bool)

(assert (=> b!1403198 (=> (not res!941715) (not e!794523))))

(declare-datatypes ((array!95915 0))(
  ( (array!95916 (arr!46308 (Array (_ BitVec 32) (_ BitVec 64))) (size!46858 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95915)

(declare-datatypes ((List!32827 0))(
  ( (Nil!32824) (Cons!32823 (h!34071 (_ BitVec 64)) (t!47521 List!32827)) )
))
(declare-fun arrayNoDuplicates!0 (array!95915 (_ BitVec 32) List!32827) Bool)

(assert (=> b!1403198 (= res!941715 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32824))))

(declare-fun b!1403199 () Bool)

(declare-fun e!794525 () Bool)

(assert (=> b!1403199 (= e!794523 (not e!794525))))

(declare-fun res!941712 () Bool)

(assert (=> b!1403199 (=> res!941712 e!794525)))

(declare-datatypes ((SeekEntryResult!10625 0))(
  ( (MissingZero!10625 (index!44877 (_ BitVec 32))) (Found!10625 (index!44878 (_ BitVec 32))) (Intermediate!10625 (undefined!11437 Bool) (index!44879 (_ BitVec 32)) (x!126492 (_ BitVec 32))) (Undefined!10625) (MissingVacant!10625 (index!44880 (_ BitVec 32))) )
))
(declare-fun lt!618310 () SeekEntryResult!10625)

(get-info :version)

(assert (=> b!1403199 (= res!941712 (or (not ((_ is Intermediate!10625) lt!618310)) (undefined!11437 lt!618310)))))

(declare-fun e!794522 () Bool)

(assert (=> b!1403199 e!794522))

(declare-fun res!941711 () Bool)

(assert (=> b!1403199 (=> (not res!941711) (not e!794522))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95915 (_ BitVec 32)) Bool)

(assert (=> b!1403199 (= res!941711 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47254 0))(
  ( (Unit!47255) )
))
(declare-fun lt!618312 () Unit!47254)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95915 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47254)

(assert (=> b!1403199 (= lt!618312 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95915 (_ BitVec 32)) SeekEntryResult!10625)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403199 (= lt!618310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46308 a!2901) j!112) mask!2840) (select (arr!46308 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403200 () Bool)

(declare-fun res!941710 () Bool)

(assert (=> b!1403200 (=> (not res!941710) (not e!794523))))

(assert (=> b!1403200 (= res!941710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403202 () Bool)

(declare-fun res!941714 () Bool)

(assert (=> b!1403202 (=> (not res!941714) (not e!794523))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403202 (= res!941714 (and (= (size!46858 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46858 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46858 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403203 () Bool)

(assert (=> b!1403203 (= e!794525 true)))

(declare-fun lt!618311 () SeekEntryResult!10625)

(assert (=> b!1403203 (= lt!618311 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46308 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46308 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95916 (store (arr!46308 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46858 a!2901)) mask!2840))))

(declare-fun b!1403204 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95915 (_ BitVec 32)) SeekEntryResult!10625)

(assert (=> b!1403204 (= e!794522 (= (seekEntryOrOpen!0 (select (arr!46308 a!2901) j!112) a!2901 mask!2840) (Found!10625 j!112)))))

(declare-fun b!1403205 () Bool)

(declare-fun res!941709 () Bool)

(assert (=> b!1403205 (=> (not res!941709) (not e!794523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403205 (= res!941709 (validKeyInArray!0 (select (arr!46308 a!2901) i!1037)))))

(declare-fun res!941713 () Bool)

(assert (=> start!120506 (=> (not res!941713) (not e!794523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120506 (= res!941713 (validMask!0 mask!2840))))

(assert (=> start!120506 e!794523))

(assert (=> start!120506 true))

(declare-fun array_inv!35336 (array!95915) Bool)

(assert (=> start!120506 (array_inv!35336 a!2901)))

(declare-fun b!1403201 () Bool)

(declare-fun res!941716 () Bool)

(assert (=> b!1403201 (=> (not res!941716) (not e!794523))))

(assert (=> b!1403201 (= res!941716 (validKeyInArray!0 (select (arr!46308 a!2901) j!112)))))

(assert (= (and start!120506 res!941713) b!1403202))

(assert (= (and b!1403202 res!941714) b!1403205))

(assert (= (and b!1403205 res!941709) b!1403201))

(assert (= (and b!1403201 res!941716) b!1403200))

(assert (= (and b!1403200 res!941710) b!1403198))

(assert (= (and b!1403198 res!941715) b!1403199))

(assert (= (and b!1403199 res!941711) b!1403204))

(assert (= (and b!1403199 (not res!941712)) b!1403203))

(declare-fun m!1291735 () Bool)

(assert (=> b!1403205 m!1291735))

(assert (=> b!1403205 m!1291735))

(declare-fun m!1291737 () Bool)

(assert (=> b!1403205 m!1291737))

(declare-fun m!1291739 () Bool)

(assert (=> b!1403203 m!1291739))

(declare-fun m!1291741 () Bool)

(assert (=> b!1403203 m!1291741))

(assert (=> b!1403203 m!1291741))

(declare-fun m!1291743 () Bool)

(assert (=> b!1403203 m!1291743))

(assert (=> b!1403203 m!1291743))

(assert (=> b!1403203 m!1291741))

(declare-fun m!1291745 () Bool)

(assert (=> b!1403203 m!1291745))

(declare-fun m!1291747 () Bool)

(assert (=> b!1403200 m!1291747))

(declare-fun m!1291749 () Bool)

(assert (=> start!120506 m!1291749))

(declare-fun m!1291751 () Bool)

(assert (=> start!120506 m!1291751))

(declare-fun m!1291753 () Bool)

(assert (=> b!1403201 m!1291753))

(assert (=> b!1403201 m!1291753))

(declare-fun m!1291755 () Bool)

(assert (=> b!1403201 m!1291755))

(declare-fun m!1291757 () Bool)

(assert (=> b!1403198 m!1291757))

(assert (=> b!1403204 m!1291753))

(assert (=> b!1403204 m!1291753))

(declare-fun m!1291759 () Bool)

(assert (=> b!1403204 m!1291759))

(assert (=> b!1403199 m!1291753))

(declare-fun m!1291761 () Bool)

(assert (=> b!1403199 m!1291761))

(assert (=> b!1403199 m!1291753))

(declare-fun m!1291763 () Bool)

(assert (=> b!1403199 m!1291763))

(assert (=> b!1403199 m!1291761))

(assert (=> b!1403199 m!1291753))

(declare-fun m!1291765 () Bool)

(assert (=> b!1403199 m!1291765))

(declare-fun m!1291767 () Bool)

(assert (=> b!1403199 m!1291767))

(check-sat (not b!1403203) (not start!120506) (not b!1403200) (not b!1403198) (not b!1403205) (not b!1403204) (not b!1403201) (not b!1403199))
