; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124678 () Bool)

(assert start!124678)

(declare-fun b!1444745 () Bool)

(declare-fun res!976704 () Bool)

(declare-fun e!813960 () Bool)

(assert (=> b!1444745 (=> (not res!976704) (not e!813960))))

(declare-datatypes ((array!98126 0))(
  ( (array!98127 (arr!47351 (Array (_ BitVec 32) (_ BitVec 64))) (size!47901 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98126)

(declare-datatypes ((List!33852 0))(
  ( (Nil!33849) (Cons!33848 (h!35198 (_ BitVec 64)) (t!48546 List!33852)) )
))
(declare-fun arrayNoDuplicates!0 (array!98126 (_ BitVec 32) List!33852) Bool)

(assert (=> b!1444745 (= res!976704 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33849))))

(declare-fun b!1444746 () Bool)

(declare-fun res!976714 () Bool)

(assert (=> b!1444746 (=> (not res!976714) (not e!813960))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1444746 (= res!976714 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47901 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47901 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47901 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444748 () Bool)

(declare-fun res!976705 () Bool)

(assert (=> b!1444748 (=> (not res!976705) (not e!813960))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444748 (= res!976705 (validKeyInArray!0 (select (arr!47351 a!2862) i!1006)))))

(declare-fun b!1444749 () Bool)

(declare-fun res!976709 () Bool)

(assert (=> b!1444749 (=> (not res!976709) (not e!813960))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1444749 (= res!976709 (and (= (size!47901 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47901 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47901 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444750 () Bool)

(declare-fun res!976702 () Bool)

(declare-fun e!813961 () Bool)

(assert (=> b!1444750 (=> (not res!976702) (not e!813961))))

(assert (=> b!1444750 (= res!976702 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444751 () Bool)

(assert (=> b!1444751 (= e!813961 (not (or (and (= (select (arr!47351 a!2862) index!646) (select (store (arr!47351 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47351 a!2862) index!646) (select (arr!47351 a!2862) j!93))) (not (= (select (arr!47351 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(declare-fun e!813959 () Bool)

(assert (=> b!1444751 e!813959))

(declare-fun res!976713 () Bool)

(assert (=> b!1444751 (=> (not res!976713) (not e!813959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98126 (_ BitVec 32)) Bool)

(assert (=> b!1444751 (= res!976713 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48702 0))(
  ( (Unit!48703) )
))
(declare-fun lt!634292 () Unit!48702)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98126 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48702)

(assert (=> b!1444751 (= lt!634292 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444752 () Bool)

(declare-fun res!976706 () Bool)

(assert (=> b!1444752 (=> (not res!976706) (not e!813959))))

(declare-datatypes ((SeekEntryResult!11603 0))(
  ( (MissingZero!11603 (index!48804 (_ BitVec 32))) (Found!11603 (index!48805 (_ BitVec 32))) (Intermediate!11603 (undefined!12415 Bool) (index!48806 (_ BitVec 32)) (x!130500 (_ BitVec 32))) (Undefined!11603) (MissingVacant!11603 (index!48807 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98126 (_ BitVec 32)) SeekEntryResult!11603)

(assert (=> b!1444752 (= res!976706 (= (seekEntryOrOpen!0 (select (arr!47351 a!2862) j!93) a!2862 mask!2687) (Found!11603 j!93)))))

(declare-fun res!976708 () Bool)

(assert (=> start!124678 (=> (not res!976708) (not e!813960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124678 (= res!976708 (validMask!0 mask!2687))))

(assert (=> start!124678 e!813960))

(assert (=> start!124678 true))

(declare-fun array_inv!36379 (array!98126) Bool)

(assert (=> start!124678 (array_inv!36379 a!2862)))

(declare-fun b!1444747 () Bool)

(declare-fun e!813958 () Bool)

(declare-fun e!813957 () Bool)

(assert (=> b!1444747 (= e!813958 e!813957)))

(declare-fun res!976711 () Bool)

(assert (=> b!1444747 (=> (not res!976711) (not e!813957))))

(declare-fun lt!634293 () SeekEntryResult!11603)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98126 (_ BitVec 32)) SeekEntryResult!11603)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444747 (= res!976711 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47351 a!2862) j!93) mask!2687) (select (arr!47351 a!2862) j!93) a!2862 mask!2687) lt!634293))))

(assert (=> b!1444747 (= lt!634293 (Intermediate!11603 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444753 () Bool)

(declare-fun res!976710 () Bool)

(assert (=> b!1444753 (=> (not res!976710) (not e!813961))))

(declare-fun e!813962 () Bool)

(assert (=> b!1444753 (= res!976710 e!813962)))

(declare-fun c!133533 () Bool)

(assert (=> b!1444753 (= c!133533 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444754 () Bool)

(declare-fun res!976712 () Bool)

(assert (=> b!1444754 (=> (not res!976712) (not e!813957))))

(assert (=> b!1444754 (= res!976712 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47351 a!2862) j!93) a!2862 mask!2687) lt!634293))))

(declare-fun b!1444755 () Bool)

(declare-fun res!976700 () Bool)

(assert (=> b!1444755 (=> (not res!976700) (not e!813960))))

(assert (=> b!1444755 (= res!976700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444756 () Bool)

(assert (=> b!1444756 (= e!813960 e!813958)))

(declare-fun res!976707 () Bool)

(assert (=> b!1444756 (=> (not res!976707) (not e!813958))))

(assert (=> b!1444756 (= res!976707 (= (select (store (arr!47351 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634295 () array!98126)

(assert (=> b!1444756 (= lt!634295 (array!98127 (store (arr!47351 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47901 a!2862)))))

(declare-fun lt!634294 () (_ BitVec 64))

(declare-fun lt!634296 () SeekEntryResult!11603)

(declare-fun b!1444757 () Bool)

(assert (=> b!1444757 (= e!813962 (= lt!634296 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634294 lt!634295 mask!2687)))))

(declare-fun b!1444758 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98126 (_ BitVec 32)) SeekEntryResult!11603)

(assert (=> b!1444758 (= e!813962 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634294 lt!634295 mask!2687) (seekEntryOrOpen!0 lt!634294 lt!634295 mask!2687)))))

(declare-fun b!1444759 () Bool)

(declare-fun res!976703 () Bool)

(assert (=> b!1444759 (=> (not res!976703) (not e!813960))))

(assert (=> b!1444759 (= res!976703 (validKeyInArray!0 (select (arr!47351 a!2862) j!93)))))

(declare-fun b!1444760 () Bool)

(assert (=> b!1444760 (= e!813959 (or (= (select (arr!47351 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47351 a!2862) intermediateBeforeIndex!19) (select (arr!47351 a!2862) j!93))))))

(declare-fun b!1444761 () Bool)

(assert (=> b!1444761 (= e!813957 e!813961)))

(declare-fun res!976701 () Bool)

(assert (=> b!1444761 (=> (not res!976701) (not e!813961))))

(assert (=> b!1444761 (= res!976701 (= lt!634296 (Intermediate!11603 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1444761 (= lt!634296 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634294 mask!2687) lt!634294 lt!634295 mask!2687))))

(assert (=> b!1444761 (= lt!634294 (select (store (arr!47351 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!124678 res!976708) b!1444749))

(assert (= (and b!1444749 res!976709) b!1444748))

(assert (= (and b!1444748 res!976705) b!1444759))

(assert (= (and b!1444759 res!976703) b!1444755))

(assert (= (and b!1444755 res!976700) b!1444745))

(assert (= (and b!1444745 res!976704) b!1444746))

(assert (= (and b!1444746 res!976714) b!1444756))

(assert (= (and b!1444756 res!976707) b!1444747))

(assert (= (and b!1444747 res!976711) b!1444754))

(assert (= (and b!1444754 res!976712) b!1444761))

(assert (= (and b!1444761 res!976701) b!1444753))

(assert (= (and b!1444753 c!133533) b!1444757))

(assert (= (and b!1444753 (not c!133533)) b!1444758))

(assert (= (and b!1444753 res!976710) b!1444750))

(assert (= (and b!1444750 res!976702) b!1444751))

(assert (= (and b!1444751 res!976713) b!1444752))

(assert (= (and b!1444752 res!976706) b!1444760))

(declare-fun m!1333747 () Bool)

(assert (=> start!124678 m!1333747))

(declare-fun m!1333749 () Bool)

(assert (=> start!124678 m!1333749))

(declare-fun m!1333751 () Bool)

(assert (=> b!1444747 m!1333751))

(assert (=> b!1444747 m!1333751))

(declare-fun m!1333753 () Bool)

(assert (=> b!1444747 m!1333753))

(assert (=> b!1444747 m!1333753))

(assert (=> b!1444747 m!1333751))

(declare-fun m!1333755 () Bool)

(assert (=> b!1444747 m!1333755))

(declare-fun m!1333757 () Bool)

(assert (=> b!1444756 m!1333757))

(declare-fun m!1333759 () Bool)

(assert (=> b!1444756 m!1333759))

(declare-fun m!1333761 () Bool)

(assert (=> b!1444748 m!1333761))

(assert (=> b!1444748 m!1333761))

(declare-fun m!1333763 () Bool)

(assert (=> b!1444748 m!1333763))

(declare-fun m!1333765 () Bool)

(assert (=> b!1444758 m!1333765))

(declare-fun m!1333767 () Bool)

(assert (=> b!1444758 m!1333767))

(declare-fun m!1333769 () Bool)

(assert (=> b!1444755 m!1333769))

(assert (=> b!1444754 m!1333751))

(assert (=> b!1444754 m!1333751))

(declare-fun m!1333771 () Bool)

(assert (=> b!1444754 m!1333771))

(declare-fun m!1333773 () Bool)

(assert (=> b!1444761 m!1333773))

(assert (=> b!1444761 m!1333773))

(declare-fun m!1333775 () Bool)

(assert (=> b!1444761 m!1333775))

(assert (=> b!1444761 m!1333757))

(declare-fun m!1333777 () Bool)

(assert (=> b!1444761 m!1333777))

(assert (=> b!1444752 m!1333751))

(assert (=> b!1444752 m!1333751))

(declare-fun m!1333779 () Bool)

(assert (=> b!1444752 m!1333779))

(assert (=> b!1444759 m!1333751))

(assert (=> b!1444759 m!1333751))

(declare-fun m!1333781 () Bool)

(assert (=> b!1444759 m!1333781))

(declare-fun m!1333783 () Bool)

(assert (=> b!1444760 m!1333783))

(assert (=> b!1444760 m!1333751))

(declare-fun m!1333785 () Bool)

(assert (=> b!1444745 m!1333785))

(declare-fun m!1333787 () Bool)

(assert (=> b!1444751 m!1333787))

(assert (=> b!1444751 m!1333757))

(declare-fun m!1333789 () Bool)

(assert (=> b!1444751 m!1333789))

(declare-fun m!1333791 () Bool)

(assert (=> b!1444751 m!1333791))

(declare-fun m!1333793 () Bool)

(assert (=> b!1444751 m!1333793))

(assert (=> b!1444751 m!1333751))

(declare-fun m!1333795 () Bool)

(assert (=> b!1444757 m!1333795))

(push 1)

