; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129272 () Bool)

(assert start!129272)

(declare-fun e!847202 () Bool)

(declare-fun b!1518780 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101128 0))(
  ( (array!101129 (arr!48802 (Array (_ BitVec 32) (_ BitVec 64))) (size!49354 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101128)

(declare-datatypes ((SeekEntryResult!12996 0))(
  ( (MissingZero!12996 (index!54379 (_ BitVec 32))) (Found!12996 (index!54380 (_ BitVec 32))) (Intermediate!12996 (undefined!13808 Bool) (index!54381 (_ BitVec 32)) (x!136052 (_ BitVec 32))) (Undefined!12996) (MissingVacant!12996 (index!54382 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101128 (_ BitVec 32)) SeekEntryResult!12996)

(assert (=> b!1518780 (= e!847202 (= (seekEntry!0 (select (arr!48802 a!2804) j!70) a!2804 mask!2512) (Found!12996 j!70)))))

(declare-fun b!1518781 () Bool)

(declare-fun res!1038897 () Bool)

(declare-fun e!847206 () Bool)

(assert (=> b!1518781 (=> (not res!1038897) (not e!847206))))

(declare-datatypes ((List!35363 0))(
  ( (Nil!35360) (Cons!35359 (h!36772 (_ BitVec 64)) (t!50049 List!35363)) )
))
(declare-fun arrayNoDuplicates!0 (array!101128 (_ BitVec 32) List!35363) Bool)

(assert (=> b!1518781 (= res!1038897 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35360))))

(declare-fun b!1518782 () Bool)

(declare-fun res!1038892 () Bool)

(declare-fun e!847200 () Bool)

(assert (=> b!1518782 (=> (not res!1038892) (not e!847200))))

(declare-fun lt!658213 () SeekEntryResult!12996)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101128 (_ BitVec 32)) SeekEntryResult!12996)

(assert (=> b!1518782 (= res!1038892 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48802 a!2804) j!70) a!2804 mask!2512) lt!658213))))

(declare-fun b!1518783 () Bool)

(declare-fun res!1038900 () Bool)

(declare-fun e!847205 () Bool)

(assert (=> b!1518783 (=> res!1038900 e!847205)))

(declare-fun lt!658217 () (_ BitVec 32))

(assert (=> b!1518783 (= res!1038900 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658217 (select (arr!48802 a!2804) j!70) a!2804 mask!2512) lt!658213)))))

(declare-fun b!1518784 () Bool)

(declare-fun e!847203 () Bool)

(assert (=> b!1518784 (= e!847203 e!847205)))

(declare-fun res!1038894 () Bool)

(assert (=> b!1518784 (=> res!1038894 e!847205)))

(assert (=> b!1518784 (= res!1038894 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658217 #b00000000000000000000000000000000) (bvsge lt!658217 (size!49354 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518784 (= lt!658217 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518785 () Bool)

(declare-fun res!1038901 () Bool)

(assert (=> b!1518785 (=> (not res!1038901) (not e!847206))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518785 (= res!1038901 (validKeyInArray!0 (select (arr!48802 a!2804) i!961)))))

(declare-fun b!1518786 () Bool)

(declare-fun res!1038896 () Bool)

(assert (=> b!1518786 (=> (not res!1038896) (not e!847206))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1518786 (= res!1038896 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49354 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49354 a!2804))))))

(declare-fun b!1518787 () Bool)

(declare-fun res!1038899 () Bool)

(assert (=> b!1518787 (=> (not res!1038899) (not e!847206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101128 (_ BitVec 32)) Bool)

(assert (=> b!1518787 (= res!1038899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518788 () Bool)

(declare-fun res!1038889 () Bool)

(assert (=> b!1518788 (=> (not res!1038889) (not e!847206))))

(assert (=> b!1518788 (= res!1038889 (and (= (size!49354 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49354 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49354 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518789 () Bool)

(declare-fun res!1038891 () Bool)

(assert (=> b!1518789 (=> (not res!1038891) (not e!847206))))

(assert (=> b!1518789 (= res!1038891 (validKeyInArray!0 (select (arr!48802 a!2804) j!70)))))

(declare-fun b!1518790 () Bool)

(declare-fun e!847201 () Bool)

(assert (=> b!1518790 (= e!847200 e!847201)))

(declare-fun res!1038890 () Bool)

(assert (=> b!1518790 (=> (not res!1038890) (not e!847201))))

(declare-fun lt!658215 () SeekEntryResult!12996)

(declare-fun lt!658216 () array!101128)

(declare-fun lt!658214 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518790 (= res!1038890 (= lt!658215 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658214 mask!2512) lt!658214 lt!658216 mask!2512)))))

(assert (=> b!1518790 (= lt!658214 (select (store (arr!48802 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1518790 (= lt!658216 (array!101129 (store (arr!48802 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49354 a!2804)))))

(declare-fun b!1518791 () Bool)

(assert (=> b!1518791 (= e!847206 e!847200)))

(declare-fun res!1038898 () Bool)

(assert (=> b!1518791 (=> (not res!1038898) (not e!847200))))

(assert (=> b!1518791 (= res!1038898 (= lt!658215 lt!658213))))

(assert (=> b!1518791 (= lt!658213 (Intermediate!12996 false resIndex!21 resX!21))))

(assert (=> b!1518791 (= lt!658215 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48802 a!2804) j!70) mask!2512) (select (arr!48802 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518792 () Bool)

(assert (=> b!1518792 (= e!847205 (bvsge mask!2512 #b00000000000000000000000000000000))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101128 (_ BitVec 32)) SeekEntryResult!12996)

(assert (=> b!1518792 (= (seekEntryOrOpen!0 (select (arr!48802 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658214 lt!658216 mask!2512))))

(declare-datatypes ((Unit!50699 0))(
  ( (Unit!50700) )
))
(declare-fun lt!658212 () Unit!50699)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101128 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50699)

(assert (=> b!1518792 (= lt!658212 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658217 resX!21 resIndex!21 mask!2512))))

(declare-fun res!1038895 () Bool)

(assert (=> start!129272 (=> (not res!1038895) (not e!847206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129272 (= res!1038895 (validMask!0 mask!2512))))

(assert (=> start!129272 e!847206))

(assert (=> start!129272 true))

(declare-fun array_inv!38035 (array!101128) Bool)

(assert (=> start!129272 (array_inv!38035 a!2804)))

(declare-fun b!1518793 () Bool)

(assert (=> b!1518793 (= e!847201 (not e!847203))))

(declare-fun res!1038893 () Bool)

(assert (=> b!1518793 (=> res!1038893 e!847203)))

(assert (=> b!1518793 (= res!1038893 (or (not (= (select (arr!48802 a!2804) j!70) lt!658214)) (= x!534 resX!21)))))

(assert (=> b!1518793 e!847202))

(declare-fun res!1038902 () Bool)

(assert (=> b!1518793 (=> (not res!1038902) (not e!847202))))

(assert (=> b!1518793 (= res!1038902 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!658218 () Unit!50699)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101128 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50699)

(assert (=> b!1518793 (= lt!658218 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129272 res!1038895) b!1518788))

(assert (= (and b!1518788 res!1038889) b!1518785))

(assert (= (and b!1518785 res!1038901) b!1518789))

(assert (= (and b!1518789 res!1038891) b!1518787))

(assert (= (and b!1518787 res!1038899) b!1518781))

(assert (= (and b!1518781 res!1038897) b!1518786))

(assert (= (and b!1518786 res!1038896) b!1518791))

(assert (= (and b!1518791 res!1038898) b!1518782))

(assert (= (and b!1518782 res!1038892) b!1518790))

(assert (= (and b!1518790 res!1038890) b!1518793))

(assert (= (and b!1518793 res!1038902) b!1518780))

(assert (= (and b!1518793 (not res!1038893)) b!1518784))

(assert (= (and b!1518784 (not res!1038894)) b!1518783))

(assert (= (and b!1518783 (not res!1038900)) b!1518792))

(declare-fun m!1401587 () Bool)

(assert (=> b!1518792 m!1401587))

(assert (=> b!1518792 m!1401587))

(declare-fun m!1401589 () Bool)

(assert (=> b!1518792 m!1401589))

(declare-fun m!1401591 () Bool)

(assert (=> b!1518792 m!1401591))

(declare-fun m!1401593 () Bool)

(assert (=> b!1518792 m!1401593))

(assert (=> b!1518791 m!1401587))

(assert (=> b!1518791 m!1401587))

(declare-fun m!1401595 () Bool)

(assert (=> b!1518791 m!1401595))

(assert (=> b!1518791 m!1401595))

(assert (=> b!1518791 m!1401587))

(declare-fun m!1401597 () Bool)

(assert (=> b!1518791 m!1401597))

(assert (=> b!1518793 m!1401587))

(declare-fun m!1401599 () Bool)

(assert (=> b!1518793 m!1401599))

(declare-fun m!1401601 () Bool)

(assert (=> b!1518793 m!1401601))

(assert (=> b!1518780 m!1401587))

(assert (=> b!1518780 m!1401587))

(declare-fun m!1401603 () Bool)

(assert (=> b!1518780 m!1401603))

(declare-fun m!1401605 () Bool)

(assert (=> b!1518787 m!1401605))

(assert (=> b!1518783 m!1401587))

(assert (=> b!1518783 m!1401587))

(declare-fun m!1401607 () Bool)

(assert (=> b!1518783 m!1401607))

(assert (=> b!1518789 m!1401587))

(assert (=> b!1518789 m!1401587))

(declare-fun m!1401609 () Bool)

(assert (=> b!1518789 m!1401609))

(assert (=> b!1518782 m!1401587))

(assert (=> b!1518782 m!1401587))

(declare-fun m!1401611 () Bool)

(assert (=> b!1518782 m!1401611))

(declare-fun m!1401613 () Bool)

(assert (=> b!1518784 m!1401613))

(declare-fun m!1401615 () Bool)

(assert (=> b!1518781 m!1401615))

(declare-fun m!1401617 () Bool)

(assert (=> b!1518785 m!1401617))

(assert (=> b!1518785 m!1401617))

(declare-fun m!1401619 () Bool)

(assert (=> b!1518785 m!1401619))

(declare-fun m!1401621 () Bool)

(assert (=> start!129272 m!1401621))

(declare-fun m!1401623 () Bool)

(assert (=> start!129272 m!1401623))

(declare-fun m!1401625 () Bool)

(assert (=> b!1518790 m!1401625))

(assert (=> b!1518790 m!1401625))

(declare-fun m!1401627 () Bool)

(assert (=> b!1518790 m!1401627))

(declare-fun m!1401629 () Bool)

(assert (=> b!1518790 m!1401629))

(declare-fun m!1401631 () Bool)

(assert (=> b!1518790 m!1401631))

(check-sat (not b!1518780) (not b!1518787) (not b!1518790) (not b!1518783) (not b!1518791) (not start!129272) (not b!1518785) (not b!1518784) (not b!1518789) (not b!1518792) (not b!1518793) (not b!1518781) (not b!1518782))
(check-sat)
