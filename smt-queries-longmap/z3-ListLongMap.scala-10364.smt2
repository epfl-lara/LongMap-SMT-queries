; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122186 () Bool)

(assert start!122186)

(declare-fun b!1417101 () Bool)

(declare-fun res!952460 () Bool)

(declare-fun e!802157 () Bool)

(assert (=> b!1417101 (=> (not res!952460) (not e!802157))))

(declare-datatypes ((array!96794 0))(
  ( (array!96795 (arr!46726 (Array (_ BitVec 32) (_ BitVec 64))) (size!47277 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96794)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417101 (= res!952460 (validKeyInArray!0 (select (arr!46726 a!2901) i!1037)))))

(declare-fun b!1417102 () Bool)

(declare-fun e!802156 () Bool)

(assert (=> b!1417102 (= e!802157 (not e!802156))))

(declare-fun res!952466 () Bool)

(assert (=> b!1417102 (=> res!952466 e!802156)))

(declare-datatypes ((SeekEntryResult!10940 0))(
  ( (MissingZero!10940 (index!46152 (_ BitVec 32))) (Found!10940 (index!46153 (_ BitVec 32))) (Intermediate!10940 (undefined!11752 Bool) (index!46154 (_ BitVec 32)) (x!127910 (_ BitVec 32))) (Undefined!10940) (MissingVacant!10940 (index!46155 (_ BitVec 32))) )
))
(declare-fun lt!624913 () SeekEntryResult!10940)

(get-info :version)

(assert (=> b!1417102 (= res!952466 (or (not ((_ is Intermediate!10940) lt!624913)) (undefined!11752 lt!624913)))))

(declare-fun lt!624919 () SeekEntryResult!10940)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1417102 (= lt!624919 (Found!10940 j!112))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96794 (_ BitVec 32)) SeekEntryResult!10940)

(assert (=> b!1417102 (= lt!624919 (seekEntryOrOpen!0 (select (arr!46726 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96794 (_ BitVec 32)) Bool)

(assert (=> b!1417102 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47881 0))(
  ( (Unit!47882) )
))
(declare-fun lt!624914 () Unit!47881)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47881)

(assert (=> b!1417102 (= lt!624914 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!624918 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96794 (_ BitVec 32)) SeekEntryResult!10940)

(assert (=> b!1417102 (= lt!624913 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624918 (select (arr!46726 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1417102 (= lt!624918 (toIndex!0 (select (arr!46726 a!2901) j!112) mask!2840))))

(declare-fun b!1417103 () Bool)

(declare-fun e!802160 () Bool)

(declare-fun e!802158 () Bool)

(assert (=> b!1417103 (= e!802160 e!802158)))

(declare-fun res!952468 () Bool)

(assert (=> b!1417103 (=> res!952468 e!802158)))

(declare-fun lt!624917 () SeekEntryResult!10940)

(assert (=> b!1417103 (= res!952468 (or (bvslt (x!127910 lt!624913) #b00000000000000000000000000000000) (bvsgt (x!127910 lt!624913) #b01111111111111111111111111111110) (bvslt (x!127910 lt!624917) #b00000000000000000000000000000000) (bvsgt (x!127910 lt!624917) #b01111111111111111111111111111110) (bvslt lt!624918 #b00000000000000000000000000000000) (bvsge lt!624918 (size!47277 a!2901)) (bvslt (index!46154 lt!624913) #b00000000000000000000000000000000) (bvsge (index!46154 lt!624913) (size!47277 a!2901)) (bvslt (index!46154 lt!624917) #b00000000000000000000000000000000) (bvsge (index!46154 lt!624917) (size!47277 a!2901)) (not (= lt!624913 (Intermediate!10940 false (index!46154 lt!624913) (x!127910 lt!624913)))) (not (= lt!624917 (Intermediate!10940 false (index!46154 lt!624917) (x!127910 lt!624917))))))))

(declare-fun lt!624915 () SeekEntryResult!10940)

(declare-fun lt!624911 () array!96794)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96794 (_ BitVec 32)) SeekEntryResult!10940)

(assert (=> b!1417103 (= lt!624915 (seekKeyOrZeroReturnVacant!0 (x!127910 lt!624917) (index!46154 lt!624917) (index!46154 lt!624917) (select (arr!46726 a!2901) j!112) lt!624911 mask!2840))))

(declare-fun lt!624916 () (_ BitVec 64))

(assert (=> b!1417103 (= lt!624915 (seekEntryOrOpen!0 lt!624916 lt!624911 mask!2840))))

(assert (=> b!1417103 (and (not (undefined!11752 lt!624917)) (= (index!46154 lt!624917) i!1037) (bvslt (x!127910 lt!624917) (x!127910 lt!624913)) (= (select (store (arr!46726 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!46154 lt!624917)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!624920 () Unit!47881)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!96794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47881)

(assert (=> b!1417103 (= lt!624920 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624918 (x!127910 lt!624913) (index!46154 lt!624913) (x!127910 lt!624917) (index!46154 lt!624917) (undefined!11752 lt!624917) mask!2840))))

(declare-fun b!1417105 () Bool)

(declare-fun res!952461 () Bool)

(assert (=> b!1417105 (=> (not res!952461) (not e!802157))))

(assert (=> b!1417105 (= res!952461 (and (= (size!47277 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47277 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47277 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1417106 () Bool)

(declare-fun res!952467 () Bool)

(assert (=> b!1417106 (=> (not res!952467) (not e!802157))))

(declare-datatypes ((List!33232 0))(
  ( (Nil!33229) (Cons!33228 (h!34523 (_ BitVec 64)) (t!47918 List!33232)) )
))
(declare-fun arrayNoDuplicates!0 (array!96794 (_ BitVec 32) List!33232) Bool)

(assert (=> b!1417106 (= res!952467 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33229))))

(declare-fun b!1417107 () Bool)

(assert (=> b!1417107 (= e!802156 e!802160)))

(declare-fun res!952465 () Bool)

(assert (=> b!1417107 (=> res!952465 e!802160)))

(assert (=> b!1417107 (= res!952465 (or (= lt!624913 lt!624917) (not ((_ is Intermediate!10940) lt!624917))))))

(assert (=> b!1417107 (= lt!624917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!624916 mask!2840) lt!624916 lt!624911 mask!2840))))

(assert (=> b!1417107 (= lt!624916 (select (store (arr!46726 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1417107 (= lt!624911 (array!96795 (store (arr!46726 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47277 a!2901)))))

(declare-fun b!1417108 () Bool)

(assert (=> b!1417108 (= e!802158 true)))

(assert (=> b!1417108 (= lt!624919 lt!624915)))

(declare-fun lt!624912 () Unit!47881)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!96794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47881)

(assert (=> b!1417108 (= lt!624912 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!624918 (x!127910 lt!624913) (index!46154 lt!624913) (x!127910 lt!624917) (index!46154 lt!624917) mask!2840))))

(declare-fun b!1417109 () Bool)

(declare-fun res!952463 () Bool)

(assert (=> b!1417109 (=> (not res!952463) (not e!802157))))

(assert (=> b!1417109 (= res!952463 (validKeyInArray!0 (select (arr!46726 a!2901) j!112)))))

(declare-fun b!1417110 () Bool)

(declare-fun res!952464 () Bool)

(assert (=> b!1417110 (=> res!952464 e!802158)))

(assert (=> b!1417110 (= res!952464 (not (= lt!624917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!624918 lt!624916 lt!624911 mask!2840))))))

(declare-fun res!952459 () Bool)

(assert (=> start!122186 (=> (not res!952459) (not e!802157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122186 (= res!952459 (validMask!0 mask!2840))))

(assert (=> start!122186 e!802157))

(assert (=> start!122186 true))

(declare-fun array_inv!36007 (array!96794) Bool)

(assert (=> start!122186 (array_inv!36007 a!2901)))

(declare-fun b!1417104 () Bool)

(declare-fun res!952462 () Bool)

(assert (=> b!1417104 (=> (not res!952462) (not e!802157))))

(assert (=> b!1417104 (= res!952462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!122186 res!952459) b!1417105))

(assert (= (and b!1417105 res!952461) b!1417101))

(assert (= (and b!1417101 res!952460) b!1417109))

(assert (= (and b!1417109 res!952463) b!1417104))

(assert (= (and b!1417104 res!952462) b!1417106))

(assert (= (and b!1417106 res!952467) b!1417102))

(assert (= (and b!1417102 (not res!952466)) b!1417107))

(assert (= (and b!1417107 (not res!952465)) b!1417103))

(assert (= (and b!1417103 (not res!952468)) b!1417110))

(assert (= (and b!1417110 (not res!952464)) b!1417108))

(declare-fun m!1307803 () Bool)

(assert (=> b!1417101 m!1307803))

(assert (=> b!1417101 m!1307803))

(declare-fun m!1307805 () Bool)

(assert (=> b!1417101 m!1307805))

(declare-fun m!1307807 () Bool)

(assert (=> b!1417110 m!1307807))

(declare-fun m!1307809 () Bool)

(assert (=> b!1417109 m!1307809))

(assert (=> b!1417109 m!1307809))

(declare-fun m!1307811 () Bool)

(assert (=> b!1417109 m!1307811))

(declare-fun m!1307813 () Bool)

(assert (=> b!1417106 m!1307813))

(declare-fun m!1307815 () Bool)

(assert (=> b!1417104 m!1307815))

(declare-fun m!1307817 () Bool)

(assert (=> b!1417107 m!1307817))

(assert (=> b!1417107 m!1307817))

(declare-fun m!1307819 () Bool)

(assert (=> b!1417107 m!1307819))

(declare-fun m!1307821 () Bool)

(assert (=> b!1417107 m!1307821))

(declare-fun m!1307823 () Bool)

(assert (=> b!1417107 m!1307823))

(declare-fun m!1307825 () Bool)

(assert (=> b!1417108 m!1307825))

(declare-fun m!1307827 () Bool)

(assert (=> start!122186 m!1307827))

(declare-fun m!1307829 () Bool)

(assert (=> start!122186 m!1307829))

(declare-fun m!1307831 () Bool)

(assert (=> b!1417103 m!1307831))

(assert (=> b!1417103 m!1307809))

(declare-fun m!1307833 () Bool)

(assert (=> b!1417103 m!1307833))

(declare-fun m!1307835 () Bool)

(assert (=> b!1417103 m!1307835))

(assert (=> b!1417103 m!1307809))

(declare-fun m!1307837 () Bool)

(assert (=> b!1417103 m!1307837))

(assert (=> b!1417103 m!1307821))

(assert (=> b!1417102 m!1307809))

(declare-fun m!1307839 () Bool)

(assert (=> b!1417102 m!1307839))

(assert (=> b!1417102 m!1307809))

(assert (=> b!1417102 m!1307809))

(declare-fun m!1307841 () Bool)

(assert (=> b!1417102 m!1307841))

(declare-fun m!1307843 () Bool)

(assert (=> b!1417102 m!1307843))

(assert (=> b!1417102 m!1307809))

(declare-fun m!1307845 () Bool)

(assert (=> b!1417102 m!1307845))

(declare-fun m!1307847 () Bool)

(assert (=> b!1417102 m!1307847))

(check-sat (not b!1417107) (not b!1417110) (not b!1417103) (not start!122186) (not b!1417109) (not b!1417102) (not b!1417106) (not b!1417108) (not b!1417101) (not b!1417104))
(check-sat)
