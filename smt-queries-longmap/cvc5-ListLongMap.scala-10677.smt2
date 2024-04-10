; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125200 () Bool)

(assert start!125200)

(declare-fun e!821093 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11864 0))(
  ( (MissingZero!11864 (index!49848 (_ BitVec 32))) (Found!11864 (index!49849 (_ BitVec 32))) (Intermediate!11864 (undefined!12676 Bool) (index!49850 (_ BitVec 32)) (x!131457 (_ BitVec 32))) (Undefined!11864) (MissingVacant!11864 (index!49851 (_ BitVec 32))) )
))
(declare-fun lt!639766 () SeekEntryResult!11864)

(declare-fun lt!639767 () (_ BitVec 64))

(declare-fun b!1460243 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98648 0))(
  ( (array!98649 (arr!47612 (Array (_ BitVec 32) (_ BitVec 64))) (size!48162 (_ BitVec 32))) )
))
(declare-fun lt!639768 () array!98648)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98648 (_ BitVec 32)) SeekEntryResult!11864)

(assert (=> b!1460243 (= e!821093 (= lt!639766 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639767 lt!639768 mask!2687)))))

(declare-fun b!1460244 () Bool)

(declare-fun res!990044 () Bool)

(declare-fun e!821099 () Bool)

(assert (=> b!1460244 (=> (not res!990044) (not e!821099))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98648)

(assert (=> b!1460244 (= res!990044 (and (= (size!48162 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48162 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48162 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460245 () Bool)

(declare-fun e!821095 () Bool)

(declare-fun e!821098 () Bool)

(assert (=> b!1460245 (= e!821095 e!821098)))

(declare-fun res!990047 () Bool)

(assert (=> b!1460245 (=> (not res!990047) (not e!821098))))

(declare-fun lt!639764 () SeekEntryResult!11864)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460245 (= res!990047 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47612 a!2862) j!93) mask!2687) (select (arr!47612 a!2862) j!93) a!2862 mask!2687) lt!639764))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1460245 (= lt!639764 (Intermediate!11864 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460246 () Bool)

(assert (=> b!1460246 (= e!821099 e!821095)))

(declare-fun res!990046 () Bool)

(assert (=> b!1460246 (=> (not res!990046) (not e!821095))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1460246 (= res!990046 (= (select (store (arr!47612 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1460246 (= lt!639768 (array!98649 (store (arr!47612 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48162 a!2862)))))

(declare-fun b!1460247 () Bool)

(declare-fun res!990041 () Bool)

(assert (=> b!1460247 (=> (not res!990041) (not e!821099))))

(declare-datatypes ((List!34113 0))(
  ( (Nil!34110) (Cons!34109 (h!35459 (_ BitVec 64)) (t!48807 List!34113)) )
))
(declare-fun arrayNoDuplicates!0 (array!98648 (_ BitVec 32) List!34113) Bool)

(assert (=> b!1460247 (= res!990041 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34110))))

(declare-fun b!1460248 () Bool)

(declare-fun e!821094 () Bool)

(assert (=> b!1460248 (= e!821098 e!821094)))

(declare-fun res!990043 () Bool)

(assert (=> b!1460248 (=> (not res!990043) (not e!821094))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1460248 (= res!990043 (= lt!639766 (Intermediate!11864 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1460248 (= lt!639766 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639767 mask!2687) lt!639767 lt!639768 mask!2687))))

(assert (=> b!1460248 (= lt!639767 (select (store (arr!47612 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460249 () Bool)

(declare-fun res!990049 () Bool)

(assert (=> b!1460249 (=> (not res!990049) (not e!821094))))

(assert (=> b!1460249 (= res!990049 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460250 () Bool)

(declare-fun res!990038 () Bool)

(assert (=> b!1460250 (=> (not res!990038) (not e!821094))))

(assert (=> b!1460250 (= res!990038 e!821093)))

(declare-fun c!134613 () Bool)

(assert (=> b!1460250 (= c!134613 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!990052 () Bool)

(assert (=> start!125200 (=> (not res!990052) (not e!821099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125200 (= res!990052 (validMask!0 mask!2687))))

(assert (=> start!125200 e!821099))

(assert (=> start!125200 true))

(declare-fun array_inv!36640 (array!98648) Bool)

(assert (=> start!125200 (array_inv!36640 a!2862)))

(declare-fun b!1460251 () Bool)

(declare-fun e!821096 () Bool)

(assert (=> b!1460251 (= e!821096 (or (= (select (arr!47612 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47612 a!2862) intermediateBeforeIndex!19) (select (arr!47612 a!2862) j!93))))))

(declare-fun b!1460252 () Bool)

(assert (=> b!1460252 (= e!821094 (not true))))

(assert (=> b!1460252 e!821096))

(declare-fun res!990039 () Bool)

(assert (=> b!1460252 (=> (not res!990039) (not e!821096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98648 (_ BitVec 32)) Bool)

(assert (=> b!1460252 (= res!990039 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49224 0))(
  ( (Unit!49225) )
))
(declare-fun lt!639765 () Unit!49224)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98648 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49224)

(assert (=> b!1460252 (= lt!639765 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460253 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98648 (_ BitVec 32)) SeekEntryResult!11864)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98648 (_ BitVec 32)) SeekEntryResult!11864)

(assert (=> b!1460253 (= e!821093 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639767 lt!639768 mask!2687) (seekEntryOrOpen!0 lt!639767 lt!639768 mask!2687)))))

(declare-fun b!1460254 () Bool)

(declare-fun res!990042 () Bool)

(assert (=> b!1460254 (=> (not res!990042) (not e!821098))))

(assert (=> b!1460254 (= res!990042 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47612 a!2862) j!93) a!2862 mask!2687) lt!639764))))

(declare-fun b!1460255 () Bool)

(declare-fun res!990048 () Bool)

(assert (=> b!1460255 (=> (not res!990048) (not e!821096))))

(assert (=> b!1460255 (= res!990048 (= (seekEntryOrOpen!0 (select (arr!47612 a!2862) j!93) a!2862 mask!2687) (Found!11864 j!93)))))

(declare-fun b!1460256 () Bool)

(declare-fun res!990045 () Bool)

(assert (=> b!1460256 (=> (not res!990045) (not e!821099))))

(assert (=> b!1460256 (= res!990045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1460257 () Bool)

(declare-fun res!990050 () Bool)

(assert (=> b!1460257 (=> (not res!990050) (not e!821099))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460257 (= res!990050 (validKeyInArray!0 (select (arr!47612 a!2862) i!1006)))))

(declare-fun b!1460258 () Bool)

(declare-fun res!990040 () Bool)

(assert (=> b!1460258 (=> (not res!990040) (not e!821099))))

(assert (=> b!1460258 (= res!990040 (validKeyInArray!0 (select (arr!47612 a!2862) j!93)))))

(declare-fun b!1460259 () Bool)

(declare-fun res!990051 () Bool)

(assert (=> b!1460259 (=> (not res!990051) (not e!821099))))

(assert (=> b!1460259 (= res!990051 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48162 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48162 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48162 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!125200 res!990052) b!1460244))

(assert (= (and b!1460244 res!990044) b!1460257))

(assert (= (and b!1460257 res!990050) b!1460258))

(assert (= (and b!1460258 res!990040) b!1460256))

(assert (= (and b!1460256 res!990045) b!1460247))

(assert (= (and b!1460247 res!990041) b!1460259))

(assert (= (and b!1460259 res!990051) b!1460246))

(assert (= (and b!1460246 res!990046) b!1460245))

(assert (= (and b!1460245 res!990047) b!1460254))

(assert (= (and b!1460254 res!990042) b!1460248))

(assert (= (and b!1460248 res!990043) b!1460250))

(assert (= (and b!1460250 c!134613) b!1460243))

(assert (= (and b!1460250 (not c!134613)) b!1460253))

(assert (= (and b!1460250 res!990038) b!1460249))

(assert (= (and b!1460249 res!990049) b!1460252))

(assert (= (and b!1460252 res!990039) b!1460255))

(assert (= (and b!1460255 res!990048) b!1460251))

(declare-fun m!1347937 () Bool)

(assert (=> b!1460247 m!1347937))

(declare-fun m!1347939 () Bool)

(assert (=> b!1460255 m!1347939))

(assert (=> b!1460255 m!1347939))

(declare-fun m!1347941 () Bool)

(assert (=> b!1460255 m!1347941))

(declare-fun m!1347943 () Bool)

(assert (=> b!1460257 m!1347943))

(assert (=> b!1460257 m!1347943))

(declare-fun m!1347945 () Bool)

(assert (=> b!1460257 m!1347945))

(declare-fun m!1347947 () Bool)

(assert (=> b!1460248 m!1347947))

(assert (=> b!1460248 m!1347947))

(declare-fun m!1347949 () Bool)

(assert (=> b!1460248 m!1347949))

(declare-fun m!1347951 () Bool)

(assert (=> b!1460248 m!1347951))

(declare-fun m!1347953 () Bool)

(assert (=> b!1460248 m!1347953))

(declare-fun m!1347955 () Bool)

(assert (=> b!1460243 m!1347955))

(declare-fun m!1347957 () Bool)

(assert (=> start!125200 m!1347957))

(declare-fun m!1347959 () Bool)

(assert (=> start!125200 m!1347959))

(declare-fun m!1347961 () Bool)

(assert (=> b!1460251 m!1347961))

(assert (=> b!1460251 m!1347939))

(declare-fun m!1347963 () Bool)

(assert (=> b!1460253 m!1347963))

(declare-fun m!1347965 () Bool)

(assert (=> b!1460253 m!1347965))

(assert (=> b!1460258 m!1347939))

(assert (=> b!1460258 m!1347939))

(declare-fun m!1347967 () Bool)

(assert (=> b!1460258 m!1347967))

(assert (=> b!1460245 m!1347939))

(assert (=> b!1460245 m!1347939))

(declare-fun m!1347969 () Bool)

(assert (=> b!1460245 m!1347969))

(assert (=> b!1460245 m!1347969))

(assert (=> b!1460245 m!1347939))

(declare-fun m!1347971 () Bool)

(assert (=> b!1460245 m!1347971))

(assert (=> b!1460246 m!1347951))

(declare-fun m!1347973 () Bool)

(assert (=> b!1460246 m!1347973))

(declare-fun m!1347975 () Bool)

(assert (=> b!1460252 m!1347975))

(declare-fun m!1347977 () Bool)

(assert (=> b!1460252 m!1347977))

(assert (=> b!1460254 m!1347939))

(assert (=> b!1460254 m!1347939))

(declare-fun m!1347979 () Bool)

(assert (=> b!1460254 m!1347979))

(declare-fun m!1347981 () Bool)

(assert (=> b!1460256 m!1347981))

(push 1)

