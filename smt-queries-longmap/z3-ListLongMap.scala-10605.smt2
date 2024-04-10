; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124770 () Bool)

(assert start!124770)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!815045 () Bool)

(declare-fun b!1447173 () Bool)

(assert (=> b!1447173 (= e!815045 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1447174 () Bool)

(declare-fun res!978855 () Bool)

(declare-fun e!815052 () Bool)

(assert (=> b!1447174 (=> (not res!978855) (not e!815052))))

(declare-datatypes ((SeekEntryResult!11649 0))(
  ( (MissingZero!11649 (index!48988 (_ BitVec 32))) (Found!11649 (index!48989 (_ BitVec 32))) (Intermediate!11649 (undefined!12461 Bool) (index!48990 (_ BitVec 32)) (x!130666 (_ BitVec 32))) (Undefined!11649) (MissingVacant!11649 (index!48991 (_ BitVec 32))) )
))
(declare-fun lt!635068 () SeekEntryResult!11649)

(declare-datatypes ((array!98218 0))(
  ( (array!98219 (arr!47397 (Array (_ BitVec 32) (_ BitVec 64))) (size!47947 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98218)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98218 (_ BitVec 32)) SeekEntryResult!11649)

(assert (=> b!1447174 (= res!978855 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47397 a!2862) j!93) a!2862 mask!2687) lt!635068))))

(declare-fun b!1447175 () Bool)

(declare-fun res!978859 () Bool)

(declare-fun e!815051 () Bool)

(assert (=> b!1447175 (=> (not res!978859) (not e!815051))))

(declare-fun e!815053 () Bool)

(assert (=> b!1447175 (= res!978859 e!815053)))

(declare-fun c!133671 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1447175 (= c!133671 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447176 () Bool)

(declare-fun e!815054 () Bool)

(declare-fun e!815047 () Bool)

(assert (=> b!1447176 (= e!815054 e!815047)))

(declare-fun res!978852 () Bool)

(assert (=> b!1447176 (=> res!978852 e!815047)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1447176 (= res!978852 (or (and (= (select (arr!47397 a!2862) index!646) (select (store (arr!47397 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47397 a!2862) index!646) (select (arr!47397 a!2862) j!93))) (not (= (select (arr!47397 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447177 () Bool)

(declare-fun lt!635066 () (_ BitVec 64))

(declare-fun lt!635065 () array!98218)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98218 (_ BitVec 32)) SeekEntryResult!11649)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98218 (_ BitVec 32)) SeekEntryResult!11649)

(assert (=> b!1447177 (= e!815053 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635066 lt!635065 mask!2687) (seekEntryOrOpen!0 lt!635066 lt!635065 mask!2687)))))

(declare-fun b!1447178 () Bool)

(declare-fun res!978865 () Bool)

(declare-fun e!815046 () Bool)

(assert (=> b!1447178 (=> (not res!978865) (not e!815046))))

(declare-datatypes ((List!33898 0))(
  ( (Nil!33895) (Cons!33894 (h!35244 (_ BitVec 64)) (t!48592 List!33898)) )
))
(declare-fun arrayNoDuplicates!0 (array!98218 (_ BitVec 32) List!33898) Bool)

(assert (=> b!1447178 (= res!978865 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33895))))

(declare-fun b!1447179 () Bool)

(declare-fun res!978853 () Bool)

(assert (=> b!1447179 (=> (not res!978853) (not e!815046))))

(assert (=> b!1447179 (= res!978853 (and (= (size!47947 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47947 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47947 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447180 () Bool)

(declare-fun res!978862 () Bool)

(assert (=> b!1447180 (=> (not res!978862) (not e!815051))))

(assert (=> b!1447180 (= res!978862 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447181 () Bool)

(declare-fun e!815048 () Bool)

(assert (=> b!1447181 (= e!815048 e!815052)))

(declare-fun res!978860 () Bool)

(assert (=> b!1447181 (=> (not res!978860) (not e!815052))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447181 (= res!978860 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47397 a!2862) j!93) mask!2687) (select (arr!47397 a!2862) j!93) a!2862 mask!2687) lt!635068))))

(assert (=> b!1447181 (= lt!635068 (Intermediate!11649 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447183 () Bool)

(declare-fun res!978858 () Bool)

(assert (=> b!1447183 (=> (not res!978858) (not e!815046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447183 (= res!978858 (validKeyInArray!0 (select (arr!47397 a!2862) j!93)))))

(declare-fun b!1447184 () Bool)

(assert (=> b!1447184 (= e!815052 e!815051)))

(declare-fun res!978867 () Bool)

(assert (=> b!1447184 (=> (not res!978867) (not e!815051))))

(declare-fun lt!635070 () SeekEntryResult!11649)

(assert (=> b!1447184 (= res!978867 (= lt!635070 (Intermediate!11649 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1447184 (= lt!635070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635066 mask!2687) lt!635066 lt!635065 mask!2687))))

(assert (=> b!1447184 (= lt!635066 (select (store (arr!47397 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447185 () Bool)

(declare-fun e!815050 () Bool)

(assert (=> b!1447185 (= e!815050 true)))

(declare-fun lt!635069 () SeekEntryResult!11649)

(assert (=> b!1447185 (= lt!635069 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47397 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1447186 () Bool)

(assert (=> b!1447186 (= e!815046 e!815048)))

(declare-fun res!978866 () Bool)

(assert (=> b!1447186 (=> (not res!978866) (not e!815048))))

(assert (=> b!1447186 (= res!978866 (= (select (store (arr!47397 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447186 (= lt!635065 (array!98219 (store (arr!47397 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47947 a!2862)))))

(declare-fun b!1447187 () Bool)

(assert (=> b!1447187 (= e!815051 (not e!815050))))

(declare-fun res!978856 () Bool)

(assert (=> b!1447187 (=> res!978856 e!815050)))

(assert (=> b!1447187 (= res!978856 (or (and (= (select (arr!47397 a!2862) index!646) (select (store (arr!47397 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47397 a!2862) index!646) (select (arr!47397 a!2862) j!93))) (not (= (select (arr!47397 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47397 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1447187 e!815054))

(declare-fun res!978857 () Bool)

(assert (=> b!1447187 (=> (not res!978857) (not e!815054))))

(declare-fun lt!635067 () SeekEntryResult!11649)

(assert (=> b!1447187 (= res!978857 (and (= lt!635067 (Found!11649 j!93)) (or (= (select (arr!47397 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47397 a!2862) intermediateBeforeIndex!19) (select (arr!47397 a!2862) j!93)))))))

(assert (=> b!1447187 (= lt!635067 (seekEntryOrOpen!0 (select (arr!47397 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98218 (_ BitVec 32)) Bool)

(assert (=> b!1447187 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48794 0))(
  ( (Unit!48795) )
))
(declare-fun lt!635064 () Unit!48794)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98218 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48794)

(assert (=> b!1447187 (= lt!635064 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447188 () Bool)

(assert (=> b!1447188 (= e!815047 e!815045)))

(declare-fun res!978868 () Bool)

(assert (=> b!1447188 (=> (not res!978868) (not e!815045))))

(assert (=> b!1447188 (= res!978868 (= lt!635067 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47397 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1447189 () Bool)

(declare-fun res!978863 () Bool)

(assert (=> b!1447189 (=> (not res!978863) (not e!815046))))

(assert (=> b!1447189 (= res!978863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447190 () Bool)

(declare-fun res!978854 () Bool)

(assert (=> b!1447190 (=> (not res!978854) (not e!815046))))

(assert (=> b!1447190 (= res!978854 (validKeyInArray!0 (select (arr!47397 a!2862) i!1006)))))

(declare-fun b!1447191 () Bool)

(assert (=> b!1447191 (= e!815053 (= lt!635070 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635066 lt!635065 mask!2687)))))

(declare-fun b!1447182 () Bool)

(declare-fun res!978864 () Bool)

(assert (=> b!1447182 (=> (not res!978864) (not e!815046))))

(assert (=> b!1447182 (= res!978864 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47947 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47947 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47947 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!978861 () Bool)

(assert (=> start!124770 (=> (not res!978861) (not e!815046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124770 (= res!978861 (validMask!0 mask!2687))))

(assert (=> start!124770 e!815046))

(assert (=> start!124770 true))

(declare-fun array_inv!36425 (array!98218) Bool)

(assert (=> start!124770 (array_inv!36425 a!2862)))

(assert (= (and start!124770 res!978861) b!1447179))

(assert (= (and b!1447179 res!978853) b!1447190))

(assert (= (and b!1447190 res!978854) b!1447183))

(assert (= (and b!1447183 res!978858) b!1447189))

(assert (= (and b!1447189 res!978863) b!1447178))

(assert (= (and b!1447178 res!978865) b!1447182))

(assert (= (and b!1447182 res!978864) b!1447186))

(assert (= (and b!1447186 res!978866) b!1447181))

(assert (= (and b!1447181 res!978860) b!1447174))

(assert (= (and b!1447174 res!978855) b!1447184))

(assert (= (and b!1447184 res!978867) b!1447175))

(assert (= (and b!1447175 c!133671) b!1447191))

(assert (= (and b!1447175 (not c!133671)) b!1447177))

(assert (= (and b!1447175 res!978859) b!1447180))

(assert (= (and b!1447180 res!978862) b!1447187))

(assert (= (and b!1447187 res!978857) b!1447176))

(assert (= (and b!1447176 (not res!978852)) b!1447188))

(assert (= (and b!1447188 res!978868) b!1447173))

(assert (= (and b!1447187 (not res!978856)) b!1447185))

(declare-fun m!1336003 () Bool)

(assert (=> b!1447190 m!1336003))

(assert (=> b!1447190 m!1336003))

(declare-fun m!1336005 () Bool)

(assert (=> b!1447190 m!1336005))

(declare-fun m!1336007 () Bool)

(assert (=> b!1447189 m!1336007))

(declare-fun m!1336009 () Bool)

(assert (=> b!1447185 m!1336009))

(assert (=> b!1447185 m!1336009))

(declare-fun m!1336011 () Bool)

(assert (=> b!1447185 m!1336011))

(assert (=> b!1447183 m!1336009))

(assert (=> b!1447183 m!1336009))

(declare-fun m!1336013 () Bool)

(assert (=> b!1447183 m!1336013))

(declare-fun m!1336015 () Bool)

(assert (=> b!1447176 m!1336015))

(declare-fun m!1336017 () Bool)

(assert (=> b!1447176 m!1336017))

(declare-fun m!1336019 () Bool)

(assert (=> b!1447176 m!1336019))

(assert (=> b!1447176 m!1336009))

(assert (=> b!1447188 m!1336009))

(assert (=> b!1447188 m!1336009))

(declare-fun m!1336021 () Bool)

(assert (=> b!1447188 m!1336021))

(declare-fun m!1336023 () Bool)

(assert (=> b!1447184 m!1336023))

(assert (=> b!1447184 m!1336023))

(declare-fun m!1336025 () Bool)

(assert (=> b!1447184 m!1336025))

(assert (=> b!1447184 m!1336017))

(declare-fun m!1336027 () Bool)

(assert (=> b!1447184 m!1336027))

(assert (=> b!1447181 m!1336009))

(assert (=> b!1447181 m!1336009))

(declare-fun m!1336029 () Bool)

(assert (=> b!1447181 m!1336029))

(assert (=> b!1447181 m!1336029))

(assert (=> b!1447181 m!1336009))

(declare-fun m!1336031 () Bool)

(assert (=> b!1447181 m!1336031))

(assert (=> b!1447186 m!1336017))

(declare-fun m!1336033 () Bool)

(assert (=> b!1447186 m!1336033))

(declare-fun m!1336035 () Bool)

(assert (=> b!1447177 m!1336035))

(declare-fun m!1336037 () Bool)

(assert (=> b!1447177 m!1336037))

(declare-fun m!1336039 () Bool)

(assert (=> b!1447191 m!1336039))

(declare-fun m!1336041 () Bool)

(assert (=> b!1447178 m!1336041))

(declare-fun m!1336043 () Bool)

(assert (=> b!1447187 m!1336043))

(assert (=> b!1447187 m!1336017))

(declare-fun m!1336045 () Bool)

(assert (=> b!1447187 m!1336045))

(assert (=> b!1447187 m!1336019))

(assert (=> b!1447187 m!1336015))

(assert (=> b!1447187 m!1336009))

(declare-fun m!1336047 () Bool)

(assert (=> b!1447187 m!1336047))

(declare-fun m!1336049 () Bool)

(assert (=> b!1447187 m!1336049))

(assert (=> b!1447187 m!1336009))

(assert (=> b!1447174 m!1336009))

(assert (=> b!1447174 m!1336009))

(declare-fun m!1336051 () Bool)

(assert (=> b!1447174 m!1336051))

(declare-fun m!1336053 () Bool)

(assert (=> start!124770 m!1336053))

(declare-fun m!1336055 () Bool)

(assert (=> start!124770 m!1336055))

(check-sat (not b!1447178) (not b!1447183) (not b!1447187) (not b!1447189) (not b!1447174) (not b!1447185) (not b!1447181) (not b!1447190) (not b!1447188) (not start!124770) (not b!1447184) (not b!1447191) (not b!1447177))
(check-sat)
