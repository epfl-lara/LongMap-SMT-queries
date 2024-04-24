; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127638 () Bool)

(assert start!127638)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!652957 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1498789 () Bool)

(declare-datatypes ((array!99939 0))(
  ( (array!99940 (arr!48229 (Array (_ BitVec 32) (_ BitVec 64))) (size!48780 (_ BitVec 32))) )
))
(declare-fun lt!652958 () array!99939)

(declare-fun e!839487 () Bool)

(declare-fun lt!652954 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12366 0))(
  ( (MissingZero!12366 (index!51856 (_ BitVec 32))) (Found!12366 (index!51857 (_ BitVec 32))) (Intermediate!12366 (undefined!13178 Bool) (index!51858 (_ BitVec 32)) (x!133666 (_ BitVec 32))) (Undefined!12366) (MissingVacant!12366 (index!51859 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99939 (_ BitVec 32)) SeekEntryResult!12366)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99939 (_ BitVec 32)) SeekEntryResult!12366)

(assert (=> b!1498789 (= e!839487 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652957 intermediateAfterIndex!19 lt!652954 lt!652958 mask!2687) (seekEntryOrOpen!0 lt!652954 lt!652958 mask!2687))))))

(declare-fun b!1498790 () Bool)

(declare-fun e!839486 () Bool)

(declare-fun e!839484 () Bool)

(assert (=> b!1498790 (= e!839486 e!839484)))

(declare-fun res!1018922 () Bool)

(assert (=> b!1498790 (=> res!1018922 e!839484)))

(declare-fun a!2862 () array!99939)

(assert (=> b!1498790 (= res!1018922 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652957 #b00000000000000000000000000000000) (bvsge lt!652957 (size!48780 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1498790 (= lt!652957 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun res!1018918 () Bool)

(declare-fun e!839488 () Bool)

(assert (=> start!127638 (=> (not res!1018918) (not e!839488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127638 (= res!1018918 (validMask!0 mask!2687))))

(assert (=> start!127638 e!839488))

(assert (=> start!127638 true))

(declare-fun array_inv!37510 (array!99939) Bool)

(assert (=> start!127638 (array_inv!37510 a!2862)))

(declare-fun b!1498791 () Bool)

(declare-fun res!1018930 () Bool)

(declare-fun e!839485 () Bool)

(assert (=> b!1498791 (=> (not res!1018930) (not e!839485))))

(declare-fun e!839483 () Bool)

(assert (=> b!1498791 (= res!1018930 e!839483)))

(declare-fun c!139483 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1498791 (= c!139483 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!652952 () SeekEntryResult!12366)

(declare-fun b!1498792 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99939 (_ BitVec 32)) SeekEntryResult!12366)

(assert (=> b!1498792 (= e!839487 (not (= lt!652952 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652957 lt!652954 lt!652958 mask!2687))))))

(declare-fun b!1498793 () Bool)

(declare-fun res!1018925 () Bool)

(assert (=> b!1498793 (=> res!1018925 e!839484)))

(assert (=> b!1498793 (= res!1018925 e!839487)))

(declare-fun c!139482 () Bool)

(assert (=> b!1498793 (= c!139482 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1498794 () Bool)

(declare-fun res!1018927 () Bool)

(assert (=> b!1498794 (=> (not res!1018927) (not e!839488))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498794 (= res!1018927 (validKeyInArray!0 (select (arr!48229 a!2862) i!1006)))))

(declare-fun b!1498795 () Bool)

(assert (=> b!1498795 (= e!839485 (not e!839486))))

(declare-fun res!1018915 () Bool)

(assert (=> b!1498795 (=> res!1018915 e!839486)))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1498795 (= res!1018915 (or (and (= (select (arr!48229 a!2862) index!646) (select (store (arr!48229 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48229 a!2862) index!646) (select (arr!48229 a!2862) j!93))) (= (select (arr!48229 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!652956 () SeekEntryResult!12366)

(assert (=> b!1498795 (and (= lt!652956 (Found!12366 j!93)) (or (= (select (arr!48229 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48229 a!2862) intermediateBeforeIndex!19) (select (arr!48229 a!2862) j!93))))))

(assert (=> b!1498795 (= lt!652956 (seekEntryOrOpen!0 (select (arr!48229 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99939 (_ BitVec 32)) Bool)

(assert (=> b!1498795 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!50105 0))(
  ( (Unit!50106) )
))
(declare-fun lt!652959 () Unit!50105)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99939 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50105)

(assert (=> b!1498795 (= lt!652959 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1498796 () Bool)

(declare-fun res!1018916 () Bool)

(assert (=> b!1498796 (=> res!1018916 e!839484)))

(declare-fun lt!652955 () SeekEntryResult!12366)

(assert (=> b!1498796 (= res!1018916 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652957 (select (arr!48229 a!2862) j!93) a!2862 mask!2687) lt!652955)))))

(declare-fun b!1498797 () Bool)

(declare-fun res!1018924 () Bool)

(declare-fun e!839482 () Bool)

(assert (=> b!1498797 (=> (not res!1018924) (not e!839482))))

(assert (=> b!1498797 (= res!1018924 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48229 a!2862) j!93) a!2862 mask!2687) lt!652955))))

(declare-fun b!1498798 () Bool)

(declare-fun res!1018921 () Bool)

(assert (=> b!1498798 (=> (not res!1018921) (not e!839485))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1498798 (= res!1018921 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1498799 () Bool)

(assert (=> b!1498799 (= e!839482 e!839485)))

(declare-fun res!1018931 () Bool)

(assert (=> b!1498799 (=> (not res!1018931) (not e!839485))))

(assert (=> b!1498799 (= res!1018931 (= lt!652952 (Intermediate!12366 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1498799 (= lt!652952 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652954 mask!2687) lt!652954 lt!652958 mask!2687))))

(assert (=> b!1498799 (= lt!652954 (select (store (arr!48229 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1498800 () Bool)

(declare-fun res!1018923 () Bool)

(assert (=> b!1498800 (=> (not res!1018923) (not e!839488))))

(assert (=> b!1498800 (= res!1018923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1498801 () Bool)

(declare-fun res!1018920 () Bool)

(assert (=> b!1498801 (=> (not res!1018920) (not e!839488))))

(declare-datatypes ((List!34717 0))(
  ( (Nil!34714) (Cons!34713 (h!36125 (_ BitVec 64)) (t!49403 List!34717)) )
))
(declare-fun arrayNoDuplicates!0 (array!99939 (_ BitVec 32) List!34717) Bool)

(assert (=> b!1498801 (= res!1018920 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34714))))

(declare-fun b!1498802 () Bool)

(assert (=> b!1498802 (= e!839483 (= lt!652952 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652954 lt!652958 mask!2687)))))

(declare-fun b!1498803 () Bool)

(declare-fun res!1018917 () Bool)

(assert (=> b!1498803 (=> res!1018917 e!839484)))

(assert (=> b!1498803 (= res!1018917 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1498804 () Bool)

(assert (=> b!1498804 (= e!839483 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652954 lt!652958 mask!2687) (seekEntryOrOpen!0 lt!652954 lt!652958 mask!2687)))))

(declare-fun b!1498805 () Bool)

(declare-fun e!839490 () Bool)

(assert (=> b!1498805 (= e!839488 e!839490)))

(declare-fun res!1018928 () Bool)

(assert (=> b!1498805 (=> (not res!1018928) (not e!839490))))

(assert (=> b!1498805 (= res!1018928 (= (select (store (arr!48229 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1498805 (= lt!652958 (array!99940 (store (arr!48229 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48780 a!2862)))))

(declare-fun b!1498806 () Bool)

(assert (=> b!1498806 (= e!839484 true)))

(assert (=> b!1498806 (= lt!652956 (seekEntryOrOpen!0 lt!652954 lt!652958 mask!2687))))

(declare-fun lt!652953 () Unit!50105)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99939 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50105)

(assert (=> b!1498806 (= lt!652953 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!652957 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1498807 () Bool)

(declare-fun res!1018914 () Bool)

(assert (=> b!1498807 (=> (not res!1018914) (not e!839488))))

(assert (=> b!1498807 (= res!1018914 (and (= (size!48780 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48780 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48780 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1498808 () Bool)

(assert (=> b!1498808 (= e!839490 e!839482)))

(declare-fun res!1018926 () Bool)

(assert (=> b!1498808 (=> (not res!1018926) (not e!839482))))

(assert (=> b!1498808 (= res!1018926 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48229 a!2862) j!93) mask!2687) (select (arr!48229 a!2862) j!93) a!2862 mask!2687) lt!652955))))

(assert (=> b!1498808 (= lt!652955 (Intermediate!12366 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1498809 () Bool)

(declare-fun res!1018919 () Bool)

(assert (=> b!1498809 (=> (not res!1018919) (not e!839488))))

(assert (=> b!1498809 (= res!1018919 (validKeyInArray!0 (select (arr!48229 a!2862) j!93)))))

(declare-fun b!1498810 () Bool)

(declare-fun res!1018929 () Bool)

(assert (=> b!1498810 (=> (not res!1018929) (not e!839488))))

(assert (=> b!1498810 (= res!1018929 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48780 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48780 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48780 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!127638 res!1018918) b!1498807))

(assert (= (and b!1498807 res!1018914) b!1498794))

(assert (= (and b!1498794 res!1018927) b!1498809))

(assert (= (and b!1498809 res!1018919) b!1498800))

(assert (= (and b!1498800 res!1018923) b!1498801))

(assert (= (and b!1498801 res!1018920) b!1498810))

(assert (= (and b!1498810 res!1018929) b!1498805))

(assert (= (and b!1498805 res!1018928) b!1498808))

(assert (= (and b!1498808 res!1018926) b!1498797))

(assert (= (and b!1498797 res!1018924) b!1498799))

(assert (= (and b!1498799 res!1018931) b!1498791))

(assert (= (and b!1498791 c!139483) b!1498802))

(assert (= (and b!1498791 (not c!139483)) b!1498804))

(assert (= (and b!1498791 res!1018930) b!1498798))

(assert (= (and b!1498798 res!1018921) b!1498795))

(assert (= (and b!1498795 (not res!1018915)) b!1498790))

(assert (= (and b!1498790 (not res!1018922)) b!1498796))

(assert (= (and b!1498796 (not res!1018916)) b!1498793))

(assert (= (and b!1498793 c!139482) b!1498792))

(assert (= (and b!1498793 (not c!139482)) b!1498789))

(assert (= (and b!1498793 (not res!1018925)) b!1498803))

(assert (= (and b!1498803 (not res!1018917)) b!1498806))

(declare-fun m!1381917 () Bool)

(assert (=> b!1498794 m!1381917))

(assert (=> b!1498794 m!1381917))

(declare-fun m!1381919 () Bool)

(assert (=> b!1498794 m!1381919))

(declare-fun m!1381921 () Bool)

(assert (=> b!1498797 m!1381921))

(assert (=> b!1498797 m!1381921))

(declare-fun m!1381923 () Bool)

(assert (=> b!1498797 m!1381923))

(declare-fun m!1381925 () Bool)

(assert (=> b!1498806 m!1381925))

(declare-fun m!1381927 () Bool)

(assert (=> b!1498806 m!1381927))

(declare-fun m!1381929 () Bool)

(assert (=> b!1498800 m!1381929))

(declare-fun m!1381931 () Bool)

(assert (=> b!1498792 m!1381931))

(declare-fun m!1381933 () Bool)

(assert (=> b!1498789 m!1381933))

(assert (=> b!1498789 m!1381925))

(declare-fun m!1381935 () Bool)

(assert (=> b!1498795 m!1381935))

(declare-fun m!1381937 () Bool)

(assert (=> b!1498795 m!1381937))

(declare-fun m!1381939 () Bool)

(assert (=> b!1498795 m!1381939))

(declare-fun m!1381941 () Bool)

(assert (=> b!1498795 m!1381941))

(declare-fun m!1381943 () Bool)

(assert (=> b!1498795 m!1381943))

(assert (=> b!1498795 m!1381921))

(declare-fun m!1381945 () Bool)

(assert (=> b!1498795 m!1381945))

(declare-fun m!1381947 () Bool)

(assert (=> b!1498795 m!1381947))

(assert (=> b!1498795 m!1381921))

(assert (=> b!1498805 m!1381937))

(declare-fun m!1381949 () Bool)

(assert (=> b!1498805 m!1381949))

(assert (=> b!1498808 m!1381921))

(assert (=> b!1498808 m!1381921))

(declare-fun m!1381951 () Bool)

(assert (=> b!1498808 m!1381951))

(assert (=> b!1498808 m!1381951))

(assert (=> b!1498808 m!1381921))

(declare-fun m!1381953 () Bool)

(assert (=> b!1498808 m!1381953))

(declare-fun m!1381955 () Bool)

(assert (=> start!127638 m!1381955))

(declare-fun m!1381957 () Bool)

(assert (=> start!127638 m!1381957))

(assert (=> b!1498796 m!1381921))

(assert (=> b!1498796 m!1381921))

(declare-fun m!1381959 () Bool)

(assert (=> b!1498796 m!1381959))

(declare-fun m!1381961 () Bool)

(assert (=> b!1498790 m!1381961))

(assert (=> b!1498809 m!1381921))

(assert (=> b!1498809 m!1381921))

(declare-fun m!1381963 () Bool)

(assert (=> b!1498809 m!1381963))

(declare-fun m!1381965 () Bool)

(assert (=> b!1498801 m!1381965))

(declare-fun m!1381967 () Bool)

(assert (=> b!1498804 m!1381967))

(assert (=> b!1498804 m!1381925))

(declare-fun m!1381969 () Bool)

(assert (=> b!1498802 m!1381969))

(declare-fun m!1381971 () Bool)

(assert (=> b!1498799 m!1381971))

(assert (=> b!1498799 m!1381971))

(declare-fun m!1381973 () Bool)

(assert (=> b!1498799 m!1381973))

(assert (=> b!1498799 m!1381937))

(declare-fun m!1381975 () Bool)

(assert (=> b!1498799 m!1381975))

(check-sat (not b!1498792) (not start!127638) (not b!1498797) (not b!1498804) (not b!1498796) (not b!1498795) (not b!1498800) (not b!1498808) (not b!1498790) (not b!1498799) (not b!1498794) (not b!1498801) (not b!1498809) (not b!1498802) (not b!1498789) (not b!1498806))
(check-sat)
