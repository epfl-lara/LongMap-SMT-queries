; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130152 () Bool)

(assert start!130152)

(declare-fun b!1527844 () Bool)

(declare-fun res!1045746 () Bool)

(declare-fun e!851534 () Bool)

(assert (=> b!1527844 (=> (not res!1045746) (not e!851534))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101500 0))(
  ( (array!101501 (arr!48976 (Array (_ BitVec 32) (_ BitVec 64))) (size!49528 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101500)

(declare-datatypes ((SeekEntryResult!13164 0))(
  ( (MissingZero!13164 (index!55051 (_ BitVec 32))) (Found!13164 (index!55052 (_ BitVec 32))) (Intermediate!13164 (undefined!13976 Bool) (index!55053 (_ BitVec 32)) (x!136750 (_ BitVec 32))) (Undefined!13164) (MissingVacant!13164 (index!55054 (_ BitVec 32))) )
))
(declare-fun lt!661484 () SeekEntryResult!13164)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101500 (_ BitVec 32)) SeekEntryResult!13164)

(assert (=> b!1527844 (= res!1045746 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48976 a!2804) j!70) a!2804 mask!2512) lt!661484))))

(declare-fun b!1527845 () Bool)

(declare-fun e!851531 () Bool)

(assert (=> b!1527845 (= e!851531 true)))

(declare-fun lt!661480 () SeekEntryResult!13164)

(declare-fun lt!661477 () SeekEntryResult!13164)

(assert (=> b!1527845 (= lt!661480 lt!661477)))

(declare-datatypes ((Unit!50951 0))(
  ( (Unit!50952) )
))
(declare-fun lt!661479 () Unit!50951)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101500 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50951)

(assert (=> b!1527845 (= lt!661479 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1527846 () Bool)

(declare-fun res!1045747 () Bool)

(declare-fun e!851532 () Bool)

(assert (=> b!1527846 (=> (not res!1045747) (not e!851532))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101500 (_ BitVec 32)) Bool)

(assert (=> b!1527846 (= res!1045747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1527847 () Bool)

(declare-fun e!851535 () Bool)

(assert (=> b!1527847 (= e!851535 e!851531)))

(declare-fun res!1045735 () Bool)

(assert (=> b!1527847 (=> res!1045735 e!851531)))

(assert (=> b!1527847 (= res!1045735 (not (= lt!661477 (Found!13164 j!70))))))

(declare-fun lt!661481 () SeekEntryResult!13164)

(assert (=> b!1527847 (= lt!661481 lt!661480)))

(declare-fun lt!661482 () (_ BitVec 64))

(declare-fun lt!661478 () array!101500)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101500 (_ BitVec 32)) SeekEntryResult!13164)

(assert (=> b!1527847 (= lt!661480 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661482 lt!661478 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101500 (_ BitVec 32)) SeekEntryResult!13164)

(assert (=> b!1527847 (= lt!661481 (seekEntryOrOpen!0 lt!661482 lt!661478 mask!2512))))

(declare-fun lt!661483 () SeekEntryResult!13164)

(assert (=> b!1527847 (= lt!661483 lt!661477)))

(assert (=> b!1527847 (= lt!661477 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48976 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1527847 (= lt!661483 (seekEntryOrOpen!0 (select (arr!48976 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527848 () Bool)

(declare-fun e!851533 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101500 (_ BitVec 32)) SeekEntryResult!13164)

(assert (=> b!1527848 (= e!851533 (= (seekEntry!0 (select (arr!48976 a!2804) j!70) a!2804 mask!2512) (Found!13164 j!70)))))

(declare-fun b!1527849 () Bool)

(declare-fun res!1045741 () Bool)

(assert (=> b!1527849 (=> (not res!1045741) (not e!851532))))

(declare-datatypes ((List!35537 0))(
  ( (Nil!35534) (Cons!35533 (h!36970 (_ BitVec 64)) (t!50223 List!35537)) )
))
(declare-fun arrayNoDuplicates!0 (array!101500 (_ BitVec 32) List!35537) Bool)

(assert (=> b!1527849 (= res!1045741 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35534))))

(declare-fun b!1527850 () Bool)

(declare-fun e!851536 () Bool)

(assert (=> b!1527850 (= e!851536 (not e!851535))))

(declare-fun res!1045739 () Bool)

(assert (=> b!1527850 (=> res!1045739 e!851535)))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1527850 (= res!1045739 (or (not (= (select (arr!48976 a!2804) j!70) lt!661482)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48976 a!2804) index!487) (select (arr!48976 a!2804) j!70)) (not (= (select (arr!48976 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1527850 e!851533))

(declare-fun res!1045745 () Bool)

(assert (=> b!1527850 (=> (not res!1045745) (not e!851533))))

(assert (=> b!1527850 (= res!1045745 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!661476 () Unit!50951)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101500 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50951)

(assert (=> b!1527850 (= lt!661476 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1527851 () Bool)

(declare-fun res!1045744 () Bool)

(assert (=> b!1527851 (=> (not res!1045744) (not e!851532))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527851 (= res!1045744 (validKeyInArray!0 (select (arr!48976 a!2804) j!70)))))

(declare-fun b!1527852 () Bool)

(declare-fun res!1045742 () Bool)

(assert (=> b!1527852 (=> (not res!1045742) (not e!851532))))

(assert (=> b!1527852 (= res!1045742 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49528 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49528 a!2804))))))

(declare-fun b!1527853 () Bool)

(declare-fun res!1045738 () Bool)

(assert (=> b!1527853 (=> (not res!1045738) (not e!851532))))

(assert (=> b!1527853 (= res!1045738 (and (= (size!49528 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49528 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49528 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1527854 () Bool)

(assert (=> b!1527854 (= e!851532 e!851534)))

(declare-fun res!1045740 () Bool)

(assert (=> b!1527854 (=> (not res!1045740) (not e!851534))))

(declare-fun lt!661485 () SeekEntryResult!13164)

(assert (=> b!1527854 (= res!1045740 (= lt!661485 lt!661484))))

(assert (=> b!1527854 (= lt!661484 (Intermediate!13164 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527854 (= lt!661485 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48976 a!2804) j!70) mask!2512) (select (arr!48976 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1045737 () Bool)

(assert (=> start!130152 (=> (not res!1045737) (not e!851532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130152 (= res!1045737 (validMask!0 mask!2512))))

(assert (=> start!130152 e!851532))

(assert (=> start!130152 true))

(declare-fun array_inv!38209 (array!101500) Bool)

(assert (=> start!130152 (array_inv!38209 a!2804)))

(declare-fun b!1527855 () Bool)

(declare-fun res!1045743 () Bool)

(assert (=> b!1527855 (=> (not res!1045743) (not e!851532))))

(assert (=> b!1527855 (= res!1045743 (validKeyInArray!0 (select (arr!48976 a!2804) i!961)))))

(declare-fun b!1527856 () Bool)

(assert (=> b!1527856 (= e!851534 e!851536)))

(declare-fun res!1045736 () Bool)

(assert (=> b!1527856 (=> (not res!1045736) (not e!851536))))

(assert (=> b!1527856 (= res!1045736 (= lt!661485 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661482 mask!2512) lt!661482 lt!661478 mask!2512)))))

(assert (=> b!1527856 (= lt!661482 (select (store (arr!48976 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527856 (= lt!661478 (array!101501 (store (arr!48976 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49528 a!2804)))))

(assert (= (and start!130152 res!1045737) b!1527853))

(assert (= (and b!1527853 res!1045738) b!1527855))

(assert (= (and b!1527855 res!1045743) b!1527851))

(assert (= (and b!1527851 res!1045744) b!1527846))

(assert (= (and b!1527846 res!1045747) b!1527849))

(assert (= (and b!1527849 res!1045741) b!1527852))

(assert (= (and b!1527852 res!1045742) b!1527854))

(assert (= (and b!1527854 res!1045740) b!1527844))

(assert (= (and b!1527844 res!1045746) b!1527856))

(assert (= (and b!1527856 res!1045736) b!1527850))

(assert (= (and b!1527850 res!1045745) b!1527848))

(assert (= (and b!1527850 (not res!1045739)) b!1527847))

(assert (= (and b!1527847 (not res!1045735)) b!1527845))

(declare-fun m!1410035 () Bool)

(assert (=> b!1527855 m!1410035))

(assert (=> b!1527855 m!1410035))

(declare-fun m!1410037 () Bool)

(assert (=> b!1527855 m!1410037))

(declare-fun m!1410039 () Bool)

(assert (=> b!1527845 m!1410039))

(declare-fun m!1410041 () Bool)

(assert (=> b!1527851 m!1410041))

(assert (=> b!1527851 m!1410041))

(declare-fun m!1410043 () Bool)

(assert (=> b!1527851 m!1410043))

(assert (=> b!1527844 m!1410041))

(assert (=> b!1527844 m!1410041))

(declare-fun m!1410045 () Bool)

(assert (=> b!1527844 m!1410045))

(assert (=> b!1527848 m!1410041))

(assert (=> b!1527848 m!1410041))

(declare-fun m!1410047 () Bool)

(assert (=> b!1527848 m!1410047))

(declare-fun m!1410049 () Bool)

(assert (=> b!1527856 m!1410049))

(assert (=> b!1527856 m!1410049))

(declare-fun m!1410051 () Bool)

(assert (=> b!1527856 m!1410051))

(declare-fun m!1410053 () Bool)

(assert (=> b!1527856 m!1410053))

(declare-fun m!1410055 () Bool)

(assert (=> b!1527856 m!1410055))

(assert (=> b!1527850 m!1410041))

(declare-fun m!1410057 () Bool)

(assert (=> b!1527850 m!1410057))

(declare-fun m!1410059 () Bool)

(assert (=> b!1527850 m!1410059))

(declare-fun m!1410061 () Bool)

(assert (=> b!1527850 m!1410061))

(declare-fun m!1410063 () Bool)

(assert (=> b!1527849 m!1410063))

(assert (=> b!1527847 m!1410041))

(declare-fun m!1410065 () Bool)

(assert (=> b!1527847 m!1410065))

(assert (=> b!1527847 m!1410041))

(declare-fun m!1410067 () Bool)

(assert (=> b!1527847 m!1410067))

(assert (=> b!1527847 m!1410041))

(declare-fun m!1410069 () Bool)

(assert (=> b!1527847 m!1410069))

(declare-fun m!1410071 () Bool)

(assert (=> b!1527847 m!1410071))

(assert (=> b!1527854 m!1410041))

(assert (=> b!1527854 m!1410041))

(declare-fun m!1410073 () Bool)

(assert (=> b!1527854 m!1410073))

(assert (=> b!1527854 m!1410073))

(assert (=> b!1527854 m!1410041))

(declare-fun m!1410075 () Bool)

(assert (=> b!1527854 m!1410075))

(declare-fun m!1410077 () Bool)

(assert (=> start!130152 m!1410077))

(declare-fun m!1410079 () Bool)

(assert (=> start!130152 m!1410079))

(declare-fun m!1410081 () Bool)

(assert (=> b!1527846 m!1410081))

(check-sat (not b!1527848) (not b!1527849) (not b!1527850) (not b!1527844) (not b!1527847) (not b!1527846) (not b!1527855) (not b!1527856) (not b!1527845) (not b!1527851) (not b!1527854) (not start!130152))
(check-sat)
