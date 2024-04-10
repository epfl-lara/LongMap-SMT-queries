; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126260 () Bool)

(assert start!126260)

(declare-fun b!1480079 () Bool)

(declare-fun e!830172 () Bool)

(declare-fun e!830174 () Bool)

(assert (=> b!1480079 (= e!830172 e!830174)))

(declare-fun res!1005931 () Bool)

(assert (=> b!1480079 (=> res!1005931 e!830174)))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99366 0))(
  ( (array!99367 (arr!47962 (Array (_ BitVec 32) (_ BitVec 64))) (size!48512 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99366)

(assert (=> b!1480079 (= res!1005931 (or (and (= (select (arr!47962 a!2862) index!646) (select (store (arr!47962 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47962 a!2862) index!646) (select (arr!47962 a!2862) j!93))) (not (= (select (arr!47962 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1480080 () Bool)

(declare-fun res!1005936 () Bool)

(declare-fun e!830170 () Bool)

(assert (=> b!1480080 (=> (not res!1005936) (not e!830170))))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1480080 (= res!1005936 (and (= (size!48512 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48512 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48512 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1480081 () Bool)

(declare-fun e!830171 () Bool)

(assert (=> b!1480081 (= e!830174 e!830171)))

(declare-fun res!1005933 () Bool)

(assert (=> b!1480081 (=> (not res!1005933) (not e!830171))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12202 0))(
  ( (MissingZero!12202 (index!51200 (_ BitVec 32))) (Found!12202 (index!51201 (_ BitVec 32))) (Intermediate!12202 (undefined!13014 Bool) (index!51202 (_ BitVec 32)) (x!132777 (_ BitVec 32))) (Undefined!12202) (MissingVacant!12202 (index!51203 (_ BitVec 32))) )
))
(declare-fun lt!646286 () SeekEntryResult!12202)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99366 (_ BitVec 32)) SeekEntryResult!12202)

(assert (=> b!1480081 (= res!1005933 (= lt!646286 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47962 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1480082 () Bool)

(declare-fun res!1005929 () Bool)

(assert (=> b!1480082 (=> (not res!1005929) (not e!830170))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1480082 (= res!1005929 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48512 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48512 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48512 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1480083 () Bool)

(declare-fun e!830175 () Bool)

(assert (=> b!1480083 (= e!830170 e!830175)))

(declare-fun res!1005928 () Bool)

(assert (=> b!1480083 (=> (not res!1005928) (not e!830175))))

(assert (=> b!1480083 (= res!1005928 (= (select (store (arr!47962 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!646282 () array!99366)

(assert (=> b!1480083 (= lt!646282 (array!99367 (store (arr!47962 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48512 a!2862)))))

(declare-fun lt!646280 () (_ BitVec 64))

(declare-fun e!830176 () Bool)

(declare-fun lt!646285 () SeekEntryResult!12202)

(declare-fun b!1480084 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99366 (_ BitVec 32)) SeekEntryResult!12202)

(assert (=> b!1480084 (= e!830176 (= lt!646285 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646280 lt!646282 mask!2687)))))

(declare-fun b!1480085 () Bool)

(declare-fun e!830168 () Bool)

(declare-fun e!830173 () Bool)

(assert (=> b!1480085 (= e!830168 e!830173)))

(declare-fun res!1005920 () Bool)

(assert (=> b!1480085 (=> (not res!1005920) (not e!830173))))

(assert (=> b!1480085 (= res!1005920 (= lt!646285 (Intermediate!12202 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1480085 (= lt!646285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646280 mask!2687) lt!646280 lt!646282 mask!2687))))

(assert (=> b!1480085 (= lt!646280 (select (store (arr!47962 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1480086 () Bool)

(assert (=> b!1480086 (= e!830175 e!830168)))

(declare-fun res!1005932 () Bool)

(assert (=> b!1480086 (=> (not res!1005932) (not e!830168))))

(declare-fun lt!646283 () SeekEntryResult!12202)

(assert (=> b!1480086 (= res!1005932 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47962 a!2862) j!93) mask!2687) (select (arr!47962 a!2862) j!93) a!2862 mask!2687) lt!646283))))

(assert (=> b!1480086 (= lt!646283 (Intermediate!12202 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1480087 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99366 (_ BitVec 32)) SeekEntryResult!12202)

(assert (=> b!1480087 (= e!830176 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646280 lt!646282 mask!2687) (seekEntryOrOpen!0 lt!646280 lt!646282 mask!2687)))))

(declare-fun b!1480088 () Bool)

(declare-fun res!1005937 () Bool)

(declare-fun e!830177 () Bool)

(assert (=> b!1480088 (=> res!1005937 e!830177)))

(declare-fun lt!646287 () SeekEntryResult!12202)

(assert (=> b!1480088 (= res!1005937 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47962 a!2862) j!93) a!2862 mask!2687) lt!646287)))))

(declare-fun b!1480089 () Bool)

(assert (=> b!1480089 (= e!830177 true)))

(assert (=> b!1480089 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646280 lt!646282 mask!2687) lt!646287)))

(declare-datatypes ((Unit!49744 0))(
  ( (Unit!49745) )
))
(declare-fun lt!646281 () Unit!49744)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99366 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49744)

(assert (=> b!1480089 (= lt!646281 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1480090 () Bool)

(declare-fun res!1005926 () Bool)

(assert (=> b!1480090 (=> (not res!1005926) (not e!830170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99366 (_ BitVec 32)) Bool)

(assert (=> b!1480090 (= res!1005926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1480091 () Bool)

(declare-fun res!1005930 () Bool)

(assert (=> b!1480091 (=> (not res!1005930) (not e!830173))))

(assert (=> b!1480091 (= res!1005930 e!830176)))

(declare-fun c!136599 () Bool)

(assert (=> b!1480091 (= c!136599 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!1005927 () Bool)

(assert (=> start!126260 (=> (not res!1005927) (not e!830170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126260 (= res!1005927 (validMask!0 mask!2687))))

(assert (=> start!126260 e!830170))

(assert (=> start!126260 true))

(declare-fun array_inv!36990 (array!99366) Bool)

(assert (=> start!126260 (array_inv!36990 a!2862)))

(declare-fun b!1480092 () Bool)

(declare-fun res!1005923 () Bool)

(assert (=> b!1480092 (=> (not res!1005923) (not e!830168))))

(assert (=> b!1480092 (= res!1005923 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47962 a!2862) j!93) a!2862 mask!2687) lt!646283))))

(declare-fun b!1480093 () Bool)

(declare-fun res!1005922 () Bool)

(assert (=> b!1480093 (=> (not res!1005922) (not e!830170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1480093 (= res!1005922 (validKeyInArray!0 (select (arr!47962 a!2862) i!1006)))))

(declare-fun b!1480094 () Bool)

(declare-fun res!1005935 () Bool)

(assert (=> b!1480094 (=> (not res!1005935) (not e!830170))))

(declare-datatypes ((List!34463 0))(
  ( (Nil!34460) (Cons!34459 (h!35827 (_ BitVec 64)) (t!49157 List!34463)) )
))
(declare-fun arrayNoDuplicates!0 (array!99366 (_ BitVec 32) List!34463) Bool)

(assert (=> b!1480094 (= res!1005935 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34460))))

(declare-fun b!1480095 () Bool)

(declare-fun res!1005925 () Bool)

(assert (=> b!1480095 (=> (not res!1005925) (not e!830173))))

(assert (=> b!1480095 (= res!1005925 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1480096 () Bool)

(assert (=> b!1480096 (= e!830171 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1480097 () Bool)

(assert (=> b!1480097 (= e!830173 (not e!830177))))

(declare-fun res!1005921 () Bool)

(assert (=> b!1480097 (=> res!1005921 e!830177)))

(assert (=> b!1480097 (= res!1005921 (or (and (= (select (arr!47962 a!2862) index!646) (select (store (arr!47962 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47962 a!2862) index!646) (select (arr!47962 a!2862) j!93))) (not (= (select (arr!47962 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47962 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1480097 e!830172))

(declare-fun res!1005934 () Bool)

(assert (=> b!1480097 (=> (not res!1005934) (not e!830172))))

(assert (=> b!1480097 (= res!1005934 (and (= lt!646286 lt!646287) (or (= (select (arr!47962 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47962 a!2862) intermediateBeforeIndex!19) (select (arr!47962 a!2862) j!93)))))))

(assert (=> b!1480097 (= lt!646287 (Found!12202 j!93))))

(assert (=> b!1480097 (= lt!646286 (seekEntryOrOpen!0 (select (arr!47962 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1480097 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!646284 () Unit!49744)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99366 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49744)

(assert (=> b!1480097 (= lt!646284 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1480098 () Bool)

(declare-fun res!1005924 () Bool)

(assert (=> b!1480098 (=> (not res!1005924) (not e!830170))))

(assert (=> b!1480098 (= res!1005924 (validKeyInArray!0 (select (arr!47962 a!2862) j!93)))))

(assert (= (and start!126260 res!1005927) b!1480080))

(assert (= (and b!1480080 res!1005936) b!1480093))

(assert (= (and b!1480093 res!1005922) b!1480098))

(assert (= (and b!1480098 res!1005924) b!1480090))

(assert (= (and b!1480090 res!1005926) b!1480094))

(assert (= (and b!1480094 res!1005935) b!1480082))

(assert (= (and b!1480082 res!1005929) b!1480083))

(assert (= (and b!1480083 res!1005928) b!1480086))

(assert (= (and b!1480086 res!1005932) b!1480092))

(assert (= (and b!1480092 res!1005923) b!1480085))

(assert (= (and b!1480085 res!1005920) b!1480091))

(assert (= (and b!1480091 c!136599) b!1480084))

(assert (= (and b!1480091 (not c!136599)) b!1480087))

(assert (= (and b!1480091 res!1005930) b!1480095))

(assert (= (and b!1480095 res!1005925) b!1480097))

(assert (= (and b!1480097 res!1005934) b!1480079))

(assert (= (and b!1480079 (not res!1005931)) b!1480081))

(assert (= (and b!1480081 res!1005933) b!1480096))

(assert (= (and b!1480097 (not res!1005921)) b!1480088))

(assert (= (and b!1480088 (not res!1005937)) b!1480089))

(declare-fun m!1365905 () Bool)

(assert (=> b!1480079 m!1365905))

(declare-fun m!1365907 () Bool)

(assert (=> b!1480079 m!1365907))

(declare-fun m!1365909 () Bool)

(assert (=> b!1480079 m!1365909))

(declare-fun m!1365911 () Bool)

(assert (=> b!1480079 m!1365911))

(declare-fun m!1365913 () Bool)

(assert (=> b!1480090 m!1365913))

(declare-fun m!1365915 () Bool)

(assert (=> b!1480087 m!1365915))

(declare-fun m!1365917 () Bool)

(assert (=> b!1480087 m!1365917))

(declare-fun m!1365919 () Bool)

(assert (=> b!1480097 m!1365919))

(assert (=> b!1480097 m!1365907))

(declare-fun m!1365921 () Bool)

(assert (=> b!1480097 m!1365921))

(assert (=> b!1480097 m!1365909))

(assert (=> b!1480097 m!1365905))

(assert (=> b!1480097 m!1365911))

(declare-fun m!1365923 () Bool)

(assert (=> b!1480097 m!1365923))

(declare-fun m!1365925 () Bool)

(assert (=> b!1480097 m!1365925))

(assert (=> b!1480097 m!1365911))

(declare-fun m!1365927 () Bool)

(assert (=> b!1480093 m!1365927))

(assert (=> b!1480093 m!1365927))

(declare-fun m!1365929 () Bool)

(assert (=> b!1480093 m!1365929))

(declare-fun m!1365931 () Bool)

(assert (=> b!1480085 m!1365931))

(assert (=> b!1480085 m!1365931))

(declare-fun m!1365933 () Bool)

(assert (=> b!1480085 m!1365933))

(assert (=> b!1480085 m!1365907))

(declare-fun m!1365935 () Bool)

(assert (=> b!1480085 m!1365935))

(assert (=> b!1480089 m!1365915))

(declare-fun m!1365937 () Bool)

(assert (=> b!1480089 m!1365937))

(assert (=> b!1480083 m!1365907))

(declare-fun m!1365939 () Bool)

(assert (=> b!1480083 m!1365939))

(declare-fun m!1365941 () Bool)

(assert (=> start!126260 m!1365941))

(declare-fun m!1365943 () Bool)

(assert (=> start!126260 m!1365943))

(assert (=> b!1480088 m!1365911))

(assert (=> b!1480088 m!1365911))

(declare-fun m!1365945 () Bool)

(assert (=> b!1480088 m!1365945))

(declare-fun m!1365947 () Bool)

(assert (=> b!1480084 m!1365947))

(assert (=> b!1480098 m!1365911))

(assert (=> b!1480098 m!1365911))

(declare-fun m!1365949 () Bool)

(assert (=> b!1480098 m!1365949))

(assert (=> b!1480081 m!1365911))

(assert (=> b!1480081 m!1365911))

(declare-fun m!1365951 () Bool)

(assert (=> b!1480081 m!1365951))

(assert (=> b!1480086 m!1365911))

(assert (=> b!1480086 m!1365911))

(declare-fun m!1365953 () Bool)

(assert (=> b!1480086 m!1365953))

(assert (=> b!1480086 m!1365953))

(assert (=> b!1480086 m!1365911))

(declare-fun m!1365955 () Bool)

(assert (=> b!1480086 m!1365955))

(declare-fun m!1365957 () Bool)

(assert (=> b!1480094 m!1365957))

(assert (=> b!1480092 m!1365911))

(assert (=> b!1480092 m!1365911))

(declare-fun m!1365959 () Bool)

(assert (=> b!1480092 m!1365959))

(push 1)

