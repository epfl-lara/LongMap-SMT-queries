; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130596 () Bool)

(assert start!130596)

(declare-fun b!1530683 () Bool)

(declare-fun e!853274 () Bool)

(declare-fun e!853276 () Bool)

(assert (=> b!1530683 (= e!853274 e!853276)))

(declare-fun res!1046913 () Bool)

(assert (=> b!1530683 (=> res!1046913 e!853276)))

(declare-datatypes ((SeekEntryResult!13118 0))(
  ( (MissingZero!13118 (index!54867 (_ BitVec 32))) (Found!13118 (index!54868 (_ BitVec 32))) (Intermediate!13118 (undefined!13930 Bool) (index!54869 (_ BitVec 32)) (x!136772 (_ BitVec 32))) (Undefined!13118) (MissingVacant!13118 (index!54870 (_ BitVec 32))) )
))
(declare-fun lt!662824 () SeekEntryResult!13118)

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1530683 (= res!1046913 (not (= lt!662824 (Found!13118 j!70))))))

(declare-fun lt!662821 () SeekEntryResult!13118)

(declare-fun lt!662822 () SeekEntryResult!13118)

(assert (=> b!1530683 (= lt!662821 lt!662822)))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((array!101683 0))(
  ( (array!101684 (arr!49060 (Array (_ BitVec 32) (_ BitVec 64))) (size!49611 (_ BitVec 32))) )
))
(declare-fun lt!662819 () array!101683)

(declare-fun lt!662817 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101683 (_ BitVec 32)) SeekEntryResult!13118)

(assert (=> b!1530683 (= lt!662822 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!662817 lt!662819 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101683 (_ BitVec 32)) SeekEntryResult!13118)

(assert (=> b!1530683 (= lt!662821 (seekEntryOrOpen!0 lt!662817 lt!662819 mask!2512))))

(declare-fun lt!662818 () SeekEntryResult!13118)

(assert (=> b!1530683 (= lt!662818 lt!662824)))

(declare-fun a!2804 () array!101683)

(assert (=> b!1530683 (= lt!662824 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49060 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1530683 (= lt!662818 (seekEntryOrOpen!0 (select (arr!49060 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530684 () Bool)

(declare-fun e!853277 () Bool)

(declare-fun e!853273 () Bool)

(assert (=> b!1530684 (= e!853277 e!853273)))

(declare-fun res!1046915 () Bool)

(assert (=> b!1530684 (=> (not res!1046915) (not e!853273))))

(declare-fun lt!662820 () SeekEntryResult!13118)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101683 (_ BitVec 32)) SeekEntryResult!13118)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530684 (= res!1046915 (= lt!662820 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!662817 mask!2512) lt!662817 lt!662819 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1530684 (= lt!662817 (select (store (arr!49060 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1530684 (= lt!662819 (array!101684 (store (arr!49060 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49611 a!2804)))))

(declare-fun res!1046905 () Bool)

(declare-fun e!853275 () Bool)

(assert (=> start!130596 (=> (not res!1046905) (not e!853275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130596 (= res!1046905 (validMask!0 mask!2512))))

(assert (=> start!130596 e!853275))

(assert (=> start!130596 true))

(declare-fun array_inv!38341 (array!101683) Bool)

(assert (=> start!130596 (array_inv!38341 a!2804)))

(declare-fun b!1530685 () Bool)

(declare-fun res!1046908 () Bool)

(assert (=> b!1530685 (=> (not res!1046908) (not e!853275))))

(declare-datatypes ((List!35530 0))(
  ( (Nil!35527) (Cons!35526 (h!36980 (_ BitVec 64)) (t!50216 List!35530)) )
))
(declare-fun arrayNoDuplicates!0 (array!101683 (_ BitVec 32) List!35530) Bool)

(assert (=> b!1530685 (= res!1046908 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35527))))

(declare-fun b!1530686 () Bool)

(declare-fun res!1046914 () Bool)

(assert (=> b!1530686 (=> (not res!1046914) (not e!853275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530686 (= res!1046914 (validKeyInArray!0 (select (arr!49060 a!2804) j!70)))))

(declare-fun b!1530687 () Bool)

(declare-fun res!1046907 () Bool)

(assert (=> b!1530687 (=> (not res!1046907) (not e!853275))))

(assert (=> b!1530687 (= res!1046907 (and (= (size!49611 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49611 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49611 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1530688 () Bool)

(declare-fun res!1046916 () Bool)

(assert (=> b!1530688 (=> (not res!1046916) (not e!853277))))

(declare-fun lt!662823 () SeekEntryResult!13118)

(assert (=> b!1530688 (= res!1046916 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49060 a!2804) j!70) a!2804 mask!2512) lt!662823))))

(declare-fun b!1530689 () Bool)

(assert (=> b!1530689 (= e!853275 e!853277)))

(declare-fun res!1046906 () Bool)

(assert (=> b!1530689 (=> (not res!1046906) (not e!853277))))

(assert (=> b!1530689 (= res!1046906 (= lt!662820 lt!662823))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1530689 (= lt!662823 (Intermediate!13118 false resIndex!21 resX!21))))

(assert (=> b!1530689 (= lt!662820 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49060 a!2804) j!70) mask!2512) (select (arr!49060 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530690 () Bool)

(declare-fun res!1046909 () Bool)

(assert (=> b!1530690 (=> (not res!1046909) (not e!853275))))

(assert (=> b!1530690 (= res!1046909 (validKeyInArray!0 (select (arr!49060 a!2804) i!961)))))

(declare-fun b!1530691 () Bool)

(assert (=> b!1530691 (= e!853276 true)))

(assert (=> b!1530691 (= lt!662822 lt!662824)))

(declare-datatypes ((Unit!51055 0))(
  ( (Unit!51056) )
))
(declare-fun lt!662825 () Unit!51055)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51055)

(assert (=> b!1530691 (= lt!662825 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1530692 () Bool)

(assert (=> b!1530692 (= e!853273 (not e!853274))))

(declare-fun res!1046912 () Bool)

(assert (=> b!1530692 (=> res!1046912 e!853274)))

(assert (=> b!1530692 (= res!1046912 (or (not (= (select (arr!49060 a!2804) j!70) lt!662817)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49060 a!2804) index!487) (select (arr!49060 a!2804) j!70)) (not (= (select (arr!49060 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!853278 () Bool)

(assert (=> b!1530692 e!853278))

(declare-fun res!1046911 () Bool)

(assert (=> b!1530692 (=> (not res!1046911) (not e!853278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101683 (_ BitVec 32)) Bool)

(assert (=> b!1530692 (= res!1046911 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!662826 () Unit!51055)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51055)

(assert (=> b!1530692 (= lt!662826 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1530693 () Bool)

(declare-fun res!1046910 () Bool)

(assert (=> b!1530693 (=> (not res!1046910) (not e!853275))))

(assert (=> b!1530693 (= res!1046910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1530694 () Bool)

(declare-fun res!1046904 () Bool)

(assert (=> b!1530694 (=> (not res!1046904) (not e!853275))))

(assert (=> b!1530694 (= res!1046904 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49611 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49611 a!2804))))))

(declare-fun b!1530695 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101683 (_ BitVec 32)) SeekEntryResult!13118)

(assert (=> b!1530695 (= e!853278 (= (seekEntry!0 (select (arr!49060 a!2804) j!70) a!2804 mask!2512) (Found!13118 j!70)))))

(assert (= (and start!130596 res!1046905) b!1530687))

(assert (= (and b!1530687 res!1046907) b!1530690))

(assert (= (and b!1530690 res!1046909) b!1530686))

(assert (= (and b!1530686 res!1046914) b!1530693))

(assert (= (and b!1530693 res!1046910) b!1530685))

(assert (= (and b!1530685 res!1046908) b!1530694))

(assert (= (and b!1530694 res!1046904) b!1530689))

(assert (= (and b!1530689 res!1046906) b!1530688))

(assert (= (and b!1530688 res!1046916) b!1530684))

(assert (= (and b!1530684 res!1046915) b!1530692))

(assert (= (and b!1530692 res!1046911) b!1530695))

(assert (= (and b!1530692 (not res!1046912)) b!1530683))

(assert (= (and b!1530683 (not res!1046913)) b!1530691))

(declare-fun m!1413355 () Bool)

(assert (=> b!1530685 m!1413355))

(declare-fun m!1413357 () Bool)

(assert (=> b!1530695 m!1413357))

(assert (=> b!1530695 m!1413357))

(declare-fun m!1413359 () Bool)

(assert (=> b!1530695 m!1413359))

(assert (=> b!1530686 m!1413357))

(assert (=> b!1530686 m!1413357))

(declare-fun m!1413361 () Bool)

(assert (=> b!1530686 m!1413361))

(declare-fun m!1413363 () Bool)

(assert (=> b!1530693 m!1413363))

(assert (=> b!1530692 m!1413357))

(declare-fun m!1413365 () Bool)

(assert (=> b!1530692 m!1413365))

(declare-fun m!1413367 () Bool)

(assert (=> b!1530692 m!1413367))

(declare-fun m!1413369 () Bool)

(assert (=> b!1530692 m!1413369))

(declare-fun m!1413371 () Bool)

(assert (=> b!1530691 m!1413371))

(declare-fun m!1413373 () Bool)

(assert (=> b!1530684 m!1413373))

(assert (=> b!1530684 m!1413373))

(declare-fun m!1413375 () Bool)

(assert (=> b!1530684 m!1413375))

(declare-fun m!1413377 () Bool)

(assert (=> b!1530684 m!1413377))

(declare-fun m!1413379 () Bool)

(assert (=> b!1530684 m!1413379))

(declare-fun m!1413381 () Bool)

(assert (=> b!1530690 m!1413381))

(assert (=> b!1530690 m!1413381))

(declare-fun m!1413383 () Bool)

(assert (=> b!1530690 m!1413383))

(declare-fun m!1413385 () Bool)

(assert (=> start!130596 m!1413385))

(declare-fun m!1413387 () Bool)

(assert (=> start!130596 m!1413387))

(assert (=> b!1530689 m!1413357))

(assert (=> b!1530689 m!1413357))

(declare-fun m!1413389 () Bool)

(assert (=> b!1530689 m!1413389))

(assert (=> b!1530689 m!1413389))

(assert (=> b!1530689 m!1413357))

(declare-fun m!1413391 () Bool)

(assert (=> b!1530689 m!1413391))

(assert (=> b!1530683 m!1413357))

(declare-fun m!1413393 () Bool)

(assert (=> b!1530683 m!1413393))

(assert (=> b!1530683 m!1413357))

(declare-fun m!1413395 () Bool)

(assert (=> b!1530683 m!1413395))

(declare-fun m!1413397 () Bool)

(assert (=> b!1530683 m!1413397))

(assert (=> b!1530683 m!1413357))

(declare-fun m!1413399 () Bool)

(assert (=> b!1530683 m!1413399))

(assert (=> b!1530688 m!1413357))

(assert (=> b!1530688 m!1413357))

(declare-fun m!1413401 () Bool)

(assert (=> b!1530688 m!1413401))

(check-sat (not b!1530689) (not b!1530695) (not b!1530685) (not start!130596) (not b!1530683) (not b!1530693) (not b!1530684) (not b!1530691) (not b!1530690) (not b!1530692) (not b!1530686) (not b!1530688))
(check-sat)
