; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125380 () Bool)

(assert start!125380)

(declare-fun b!1466013 () Bool)

(declare-fun res!994800 () Bool)

(declare-fun e!823683 () Bool)

(assert (=> b!1466013 (=> (not res!994800) (not e!823683))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98828 0))(
  ( (array!98829 (arr!47702 (Array (_ BitVec 32) (_ BitVec 64))) (size!48252 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98828)

(assert (=> b!1466013 (= res!994800 (and (= (size!48252 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48252 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48252 a!2862)) (not (= i!1006 j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1466014 () Bool)

(declare-datatypes ((SeekEntryResult!11954 0))(
  ( (MissingZero!11954 (index!50208 (_ BitVec 32))) (Found!11954 (index!50209 (_ BitVec 32))) (Intermediate!11954 (undefined!12766 Bool) (index!50210 (_ BitVec 32)) (x!131787 (_ BitVec 32))) (Undefined!11954) (MissingVacant!11954 (index!50211 (_ BitVec 32))) )
))
(declare-fun lt!641602 () SeekEntryResult!11954)

(declare-fun e!823687 () Bool)

(declare-fun lt!641598 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!641597 () array!98828)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98828 (_ BitVec 32)) SeekEntryResult!11954)

(assert (=> b!1466014 (= e!823687 (= lt!641602 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641598 lt!641597 mask!2687)))))

(declare-fun b!1466015 () Bool)

(declare-fun e!823681 () Bool)

(declare-fun e!823688 () Bool)

(assert (=> b!1466015 (= e!823681 (not e!823688))))

(declare-fun res!994806 () Bool)

(assert (=> b!1466015 (=> res!994806 e!823688)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1466015 (= res!994806 (or (and (= (select (arr!47702 a!2862) index!646) (select (store (arr!47702 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47702 a!2862) index!646) (select (arr!47702 a!2862) j!93))) (= (select (arr!47702 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!641604 () SeekEntryResult!11954)

(assert (=> b!1466015 (and (= lt!641604 (Found!11954 j!93)) (or (= (select (arr!47702 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47702 a!2862) intermediateBeforeIndex!19) (select (arr!47702 a!2862) j!93))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98828 (_ BitVec 32)) SeekEntryResult!11954)

(assert (=> b!1466015 (= lt!641604 (seekEntryOrOpen!0 (select (arr!47702 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98828 (_ BitVec 32)) Bool)

(assert (=> b!1466015 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49404 0))(
  ( (Unit!49405) )
))
(declare-fun lt!641601 () Unit!49404)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98828 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49404)

(assert (=> b!1466015 (= lt!641601 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1466016 () Bool)

(declare-fun res!994799 () Bool)

(assert (=> b!1466016 (=> (not res!994799) (not e!823683))))

(declare-datatypes ((List!34203 0))(
  ( (Nil!34200) (Cons!34199 (h!35549 (_ BitVec 64)) (t!48897 List!34203)) )
))
(declare-fun arrayNoDuplicates!0 (array!98828 (_ BitVec 32) List!34203) Bool)

(assert (=> b!1466016 (= res!994799 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34200))))

(declare-fun b!1466017 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98828 (_ BitVec 32)) SeekEntryResult!11954)

(assert (=> b!1466017 (= e!823687 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641598 lt!641597 mask!2687) (seekEntryOrOpen!0 lt!641598 lt!641597 mask!2687)))))

(declare-fun lt!641600 () (_ BitVec 32))

(declare-fun b!1466018 () Bool)

(declare-fun e!823684 () Bool)

(assert (=> b!1466018 (= e!823684 (not (= lt!641602 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641600 lt!641598 lt!641597 mask!2687))))))

(declare-fun b!1466019 () Bool)

(declare-fun res!994805 () Bool)

(assert (=> b!1466019 (=> (not res!994805) (not e!823681))))

(assert (=> b!1466019 (= res!994805 e!823687)))

(declare-fun c!135120 () Bool)

(assert (=> b!1466019 (= c!135120 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1466020 () Bool)

(declare-fun res!994808 () Bool)

(assert (=> b!1466020 (=> (not res!994808) (not e!823683))))

(assert (=> b!1466020 (= res!994808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!994804 () Bool)

(assert (=> start!125380 (=> (not res!994804) (not e!823683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125380 (= res!994804 (validMask!0 mask!2687))))

(assert (=> start!125380 e!823683))

(assert (=> start!125380 true))

(declare-fun array_inv!36730 (array!98828) Bool)

(assert (=> start!125380 (array_inv!36730 a!2862)))

(declare-fun b!1466021 () Bool)

(declare-fun res!994802 () Bool)

(assert (=> b!1466021 (=> (not res!994802) (not e!823683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466021 (= res!994802 (validKeyInArray!0 (select (arr!47702 a!2862) i!1006)))))

(declare-fun b!1466022 () Bool)

(assert (=> b!1466022 (= e!823684 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641600 intermediateAfterIndex!19 lt!641598 lt!641597 mask!2687) (seekEntryOrOpen!0 lt!641598 lt!641597 mask!2687))))))

(declare-fun b!1466023 () Bool)

(declare-fun res!994811 () Bool)

(assert (=> b!1466023 (=> (not res!994811) (not e!823683))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1466023 (= res!994811 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48252 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48252 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48252 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1466024 () Bool)

(declare-fun res!994797 () Bool)

(declare-fun e!823680 () Bool)

(assert (=> b!1466024 (=> res!994797 e!823680)))

(declare-fun lt!641603 () SeekEntryResult!11954)

(assert (=> b!1466024 (= res!994797 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641600 (select (arr!47702 a!2862) j!93) a!2862 mask!2687) lt!641603)))))

(declare-fun b!1466025 () Bool)

(declare-fun res!994810 () Bool)

(assert (=> b!1466025 (=> (not res!994810) (not e!823681))))

(assert (=> b!1466025 (= res!994810 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1466026 () Bool)

(declare-fun res!994796 () Bool)

(declare-fun e!823685 () Bool)

(assert (=> b!1466026 (=> (not res!994796) (not e!823685))))

(assert (=> b!1466026 (= res!994796 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47702 a!2862) j!93) a!2862 mask!2687) lt!641603))))

(declare-fun b!1466027 () Bool)

(declare-fun res!994803 () Bool)

(assert (=> b!1466027 (=> (not res!994803) (not e!823683))))

(assert (=> b!1466027 (= res!994803 (validKeyInArray!0 (select (arr!47702 a!2862) j!93)))))

(declare-fun b!1466028 () Bool)

(declare-fun e!823686 () Bool)

(assert (=> b!1466028 (= e!823683 e!823686)))

(declare-fun res!994801 () Bool)

(assert (=> b!1466028 (=> (not res!994801) (not e!823686))))

(assert (=> b!1466028 (= res!994801 (= (select (store (arr!47702 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466028 (= lt!641597 (array!98829 (store (arr!47702 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48252 a!2862)))))

(declare-fun b!1466029 () Bool)

(assert (=> b!1466029 (= e!823688 e!823680)))

(declare-fun res!994798 () Bool)

(assert (=> b!1466029 (=> res!994798 e!823680)))

(assert (=> b!1466029 (= res!994798 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641600 #b00000000000000000000000000000000) (bvsge lt!641600 (size!48252 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466029 (= lt!641600 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1466030 () Bool)

(assert (=> b!1466030 (= e!823686 e!823685)))

(declare-fun res!994813 () Bool)

(assert (=> b!1466030 (=> (not res!994813) (not e!823685))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466030 (= res!994813 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47702 a!2862) j!93) mask!2687) (select (arr!47702 a!2862) j!93) a!2862 mask!2687) lt!641603))))

(assert (=> b!1466030 (= lt!641603 (Intermediate!11954 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466031 () Bool)

(assert (=> b!1466031 (= e!823680 (bvsge mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1466031 (= lt!641604 (seekEntryOrOpen!0 lt!641598 lt!641597 mask!2687))))

(declare-fun lt!641599 () Unit!49404)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98828 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49404)

(assert (=> b!1466031 (= lt!641599 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641600 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1466032 () Bool)

(assert (=> b!1466032 (= e!823685 e!823681)))

(declare-fun res!994807 () Bool)

(assert (=> b!1466032 (=> (not res!994807) (not e!823681))))

(assert (=> b!1466032 (= res!994807 (= lt!641602 (Intermediate!11954 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1466032 (= lt!641602 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641598 mask!2687) lt!641598 lt!641597 mask!2687))))

(assert (=> b!1466032 (= lt!641598 (select (store (arr!47702 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1466033 () Bool)

(declare-fun res!994809 () Bool)

(assert (=> b!1466033 (=> res!994809 e!823680)))

(assert (=> b!1466033 (= res!994809 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1466034 () Bool)

(declare-fun res!994812 () Bool)

(assert (=> b!1466034 (=> res!994812 e!823680)))

(assert (=> b!1466034 (= res!994812 e!823684)))

(declare-fun c!135119 () Bool)

(assert (=> b!1466034 (= c!135119 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(assert (= (and start!125380 res!994804) b!1466013))

(assert (= (and b!1466013 res!994800) b!1466021))

(assert (= (and b!1466021 res!994802) b!1466027))

(assert (= (and b!1466027 res!994803) b!1466020))

(assert (= (and b!1466020 res!994808) b!1466016))

(assert (= (and b!1466016 res!994799) b!1466023))

(assert (= (and b!1466023 res!994811) b!1466028))

(assert (= (and b!1466028 res!994801) b!1466030))

(assert (= (and b!1466030 res!994813) b!1466026))

(assert (= (and b!1466026 res!994796) b!1466032))

(assert (= (and b!1466032 res!994807) b!1466019))

(assert (= (and b!1466019 c!135120) b!1466014))

(assert (= (and b!1466019 (not c!135120)) b!1466017))

(assert (= (and b!1466019 res!994805) b!1466025))

(assert (= (and b!1466025 res!994810) b!1466015))

(assert (= (and b!1466015 (not res!994806)) b!1466029))

(assert (= (and b!1466029 (not res!994798)) b!1466024))

(assert (= (and b!1466024 (not res!994797)) b!1466034))

(assert (= (and b!1466034 c!135119) b!1466018))

(assert (= (and b!1466034 (not c!135119)) b!1466022))

(assert (= (and b!1466034 (not res!994812)) b!1466033))

(assert (= (and b!1466033 (not res!994809)) b!1466031))

(declare-fun m!1353043 () Bool)

(assert (=> b!1466030 m!1353043))

(assert (=> b!1466030 m!1353043))

(declare-fun m!1353045 () Bool)

(assert (=> b!1466030 m!1353045))

(assert (=> b!1466030 m!1353045))

(assert (=> b!1466030 m!1353043))

(declare-fun m!1353047 () Bool)

(assert (=> b!1466030 m!1353047))

(assert (=> b!1466024 m!1353043))

(assert (=> b!1466024 m!1353043))

(declare-fun m!1353049 () Bool)

(assert (=> b!1466024 m!1353049))

(declare-fun m!1353051 () Bool)

(assert (=> b!1466018 m!1353051))

(declare-fun m!1353053 () Bool)

(assert (=> b!1466015 m!1353053))

(declare-fun m!1353055 () Bool)

(assert (=> b!1466015 m!1353055))

(declare-fun m!1353057 () Bool)

(assert (=> b!1466015 m!1353057))

(declare-fun m!1353059 () Bool)

(assert (=> b!1466015 m!1353059))

(declare-fun m!1353061 () Bool)

(assert (=> b!1466015 m!1353061))

(assert (=> b!1466015 m!1353043))

(declare-fun m!1353063 () Bool)

(assert (=> b!1466015 m!1353063))

(declare-fun m!1353065 () Bool)

(assert (=> b!1466015 m!1353065))

(assert (=> b!1466015 m!1353043))

(declare-fun m!1353067 () Bool)

(assert (=> b!1466032 m!1353067))

(assert (=> b!1466032 m!1353067))

(declare-fun m!1353069 () Bool)

(assert (=> b!1466032 m!1353069))

(assert (=> b!1466032 m!1353055))

(declare-fun m!1353071 () Bool)

(assert (=> b!1466032 m!1353071))

(declare-fun m!1353073 () Bool)

(assert (=> b!1466017 m!1353073))

(declare-fun m!1353075 () Bool)

(assert (=> b!1466017 m!1353075))

(declare-fun m!1353077 () Bool)

(assert (=> b!1466016 m!1353077))

(declare-fun m!1353079 () Bool)

(assert (=> b!1466029 m!1353079))

(assert (=> b!1466031 m!1353075))

(declare-fun m!1353081 () Bool)

(assert (=> b!1466031 m!1353081))

(assert (=> b!1466028 m!1353055))

(declare-fun m!1353083 () Bool)

(assert (=> b!1466028 m!1353083))

(declare-fun m!1353085 () Bool)

(assert (=> b!1466022 m!1353085))

(assert (=> b!1466022 m!1353075))

(declare-fun m!1353087 () Bool)

(assert (=> b!1466014 m!1353087))

(declare-fun m!1353089 () Bool)

(assert (=> start!125380 m!1353089))

(declare-fun m!1353091 () Bool)

(assert (=> start!125380 m!1353091))

(declare-fun m!1353093 () Bool)

(assert (=> b!1466021 m!1353093))

(assert (=> b!1466021 m!1353093))

(declare-fun m!1353095 () Bool)

(assert (=> b!1466021 m!1353095))

(assert (=> b!1466027 m!1353043))

(assert (=> b!1466027 m!1353043))

(declare-fun m!1353097 () Bool)

(assert (=> b!1466027 m!1353097))

(declare-fun m!1353099 () Bool)

(assert (=> b!1466020 m!1353099))

(assert (=> b!1466026 m!1353043))

(assert (=> b!1466026 m!1353043))

(declare-fun m!1353101 () Bool)

(assert (=> b!1466026 m!1353101))

(push 1)

