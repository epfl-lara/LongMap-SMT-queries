; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124876 () Bool)

(assert start!124876)

(declare-fun b!1450931 () Bool)

(declare-fun res!982326 () Bool)

(declare-fun e!816975 () Bool)

(assert (=> b!1450931 (=> (not res!982326) (not e!816975))))

(declare-datatypes ((array!98302 0))(
  ( (array!98303 (arr!47440 (Array (_ BitVec 32) (_ BitVec 64))) (size!47992 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98302)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11717 0))(
  ( (MissingZero!11717 (index!49260 (_ BitVec 32))) (Found!11717 (index!49261 (_ BitVec 32))) (Intermediate!11717 (undefined!12529 Bool) (index!49262 (_ BitVec 32)) (x!130913 (_ BitVec 32))) (Undefined!11717) (MissingVacant!11717 (index!49263 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98302 (_ BitVec 32)) SeekEntryResult!11717)

(assert (=> b!1450931 (= res!982326 (= (seekEntryOrOpen!0 (select (arr!47440 a!2862) j!93) a!2862 mask!2687) (Found!11717 j!93)))))

(declare-fun b!1450932 () Bool)

(declare-fun e!816977 () Bool)

(declare-fun e!816974 () Bool)

(assert (=> b!1450932 (= e!816977 e!816974)))

(declare-fun res!982329 () Bool)

(assert (=> b!1450932 (=> (not res!982329) (not e!816974))))

(declare-fun lt!636326 () SeekEntryResult!11717)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1450932 (= res!982329 (= lt!636326 (Intermediate!11717 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!636327 () array!98302)

(declare-fun lt!636330 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98302 (_ BitVec 32)) SeekEntryResult!11717)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450932 (= lt!636326 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636330 mask!2687) lt!636330 lt!636327 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1450932 (= lt!636330 (select (store (arr!47440 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!982332 () Bool)

(declare-fun e!816972 () Bool)

(assert (=> start!124876 (=> (not res!982332) (not e!816972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124876 (= res!982332 (validMask!0 mask!2687))))

(assert (=> start!124876 e!816972))

(assert (=> start!124876 true))

(declare-fun array_inv!36673 (array!98302) Bool)

(assert (=> start!124876 (array_inv!36673 a!2862)))

(declare-fun b!1450933 () Bool)

(assert (=> b!1450933 (= e!816974 (not true))))

(assert (=> b!1450933 e!816975))

(declare-fun res!982330 () Bool)

(assert (=> b!1450933 (=> (not res!982330) (not e!816975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98302 (_ BitVec 32)) Bool)

(assert (=> b!1450933 (= res!982330 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48771 0))(
  ( (Unit!48772) )
))
(declare-fun lt!636329 () Unit!48771)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48771)

(assert (=> b!1450933 (= lt!636329 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450934 () Bool)

(declare-fun res!982328 () Bool)

(assert (=> b!1450934 (=> (not res!982328) (not e!816972))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1450934 (= res!982328 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47992 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47992 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47992 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1450935 () Bool)

(declare-fun res!982324 () Bool)

(assert (=> b!1450935 (=> (not res!982324) (not e!816972))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450935 (= res!982324 (validKeyInArray!0 (select (arr!47440 a!2862) i!1006)))))

(declare-fun b!1450936 () Bool)

(declare-fun e!816978 () Bool)

(assert (=> b!1450936 (= e!816972 e!816978)))

(declare-fun res!982323 () Bool)

(assert (=> b!1450936 (=> (not res!982323) (not e!816978))))

(assert (=> b!1450936 (= res!982323 (= (select (store (arr!47440 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1450936 (= lt!636327 (array!98303 (store (arr!47440 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47992 a!2862)))))

(declare-fun b!1450937 () Bool)

(declare-fun res!982327 () Bool)

(assert (=> b!1450937 (=> (not res!982327) (not e!816974))))

(assert (=> b!1450937 (= res!982327 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450938 () Bool)

(assert (=> b!1450938 (= e!816975 (and (or (= (select (arr!47440 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47440 a!2862) intermediateBeforeIndex!19) (select (arr!47440 a!2862) j!93))) (or (and (= (select (arr!47440 a!2862) index!646) (select (store (arr!47440 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47440 a!2862) index!646) (select (arr!47440 a!2862) j!93))) (= (select (arr!47440 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47440 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1450939 () Bool)

(declare-fun res!982319 () Bool)

(assert (=> b!1450939 (=> (not res!982319) (not e!816972))))

(assert (=> b!1450939 (= res!982319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!816973 () Bool)

(declare-fun b!1450940 () Bool)

(assert (=> b!1450940 (= e!816973 (= lt!636326 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636330 lt!636327 mask!2687)))))

(declare-fun b!1450941 () Bool)

(declare-fun res!982331 () Bool)

(assert (=> b!1450941 (=> (not res!982331) (not e!816972))))

(assert (=> b!1450941 (= res!982331 (validKeyInArray!0 (select (arr!47440 a!2862) j!93)))))

(declare-fun b!1450942 () Bool)

(declare-fun res!982320 () Bool)

(assert (=> b!1450942 (=> (not res!982320) (not e!816977))))

(declare-fun lt!636328 () SeekEntryResult!11717)

(assert (=> b!1450942 (= res!982320 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47440 a!2862) j!93) a!2862 mask!2687) lt!636328))))

(declare-fun b!1450943 () Bool)

(assert (=> b!1450943 (= e!816978 e!816977)))

(declare-fun res!982325 () Bool)

(assert (=> b!1450943 (=> (not res!982325) (not e!816977))))

(assert (=> b!1450943 (= res!982325 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47440 a!2862) j!93) mask!2687) (select (arr!47440 a!2862) j!93) a!2862 mask!2687) lt!636328))))

(assert (=> b!1450943 (= lt!636328 (Intermediate!11717 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450944 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98302 (_ BitVec 32)) SeekEntryResult!11717)

(assert (=> b!1450944 (= e!816973 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636330 lt!636327 mask!2687) (seekEntryOrOpen!0 lt!636330 lt!636327 mask!2687)))))

(declare-fun b!1450945 () Bool)

(declare-fun res!982333 () Bool)

(assert (=> b!1450945 (=> (not res!982333) (not e!816974))))

(assert (=> b!1450945 (= res!982333 e!816973)))

(declare-fun c!133819 () Bool)

(assert (=> b!1450945 (= c!133819 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450946 () Bool)

(declare-fun res!982322 () Bool)

(assert (=> b!1450946 (=> (not res!982322) (not e!816972))))

(declare-datatypes ((List!34019 0))(
  ( (Nil!34016) (Cons!34015 (h!35365 (_ BitVec 64)) (t!48705 List!34019)) )
))
(declare-fun arrayNoDuplicates!0 (array!98302 (_ BitVec 32) List!34019) Bool)

(assert (=> b!1450946 (= res!982322 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34016))))

(declare-fun b!1450947 () Bool)

(declare-fun res!982321 () Bool)

(assert (=> b!1450947 (=> (not res!982321) (not e!816972))))

(assert (=> b!1450947 (= res!982321 (and (= (size!47992 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47992 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47992 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124876 res!982332) b!1450947))

(assert (= (and b!1450947 res!982321) b!1450935))

(assert (= (and b!1450935 res!982324) b!1450941))

(assert (= (and b!1450941 res!982331) b!1450939))

(assert (= (and b!1450939 res!982319) b!1450946))

(assert (= (and b!1450946 res!982322) b!1450934))

(assert (= (and b!1450934 res!982328) b!1450936))

(assert (= (and b!1450936 res!982323) b!1450943))

(assert (= (and b!1450943 res!982325) b!1450942))

(assert (= (and b!1450942 res!982320) b!1450932))

(assert (= (and b!1450932 res!982329) b!1450945))

(assert (= (and b!1450945 c!133819) b!1450940))

(assert (= (and b!1450945 (not c!133819)) b!1450944))

(assert (= (and b!1450945 res!982333) b!1450937))

(assert (= (and b!1450937 res!982327) b!1450933))

(assert (= (and b!1450933 res!982330) b!1450931))

(assert (= (and b!1450931 res!982326) b!1450938))

(declare-fun m!1339053 () Bool)

(assert (=> b!1450939 m!1339053))

(declare-fun m!1339055 () Bool)

(assert (=> b!1450932 m!1339055))

(assert (=> b!1450932 m!1339055))

(declare-fun m!1339057 () Bool)

(assert (=> b!1450932 m!1339057))

(declare-fun m!1339059 () Bool)

(assert (=> b!1450932 m!1339059))

(declare-fun m!1339061 () Bool)

(assert (=> b!1450932 m!1339061))

(assert (=> b!1450938 m!1339059))

(declare-fun m!1339063 () Bool)

(assert (=> b!1450938 m!1339063))

(declare-fun m!1339065 () Bool)

(assert (=> b!1450938 m!1339065))

(declare-fun m!1339067 () Bool)

(assert (=> b!1450938 m!1339067))

(declare-fun m!1339069 () Bool)

(assert (=> b!1450938 m!1339069))

(assert (=> b!1450942 m!1339069))

(assert (=> b!1450942 m!1339069))

(declare-fun m!1339071 () Bool)

(assert (=> b!1450942 m!1339071))

(declare-fun m!1339073 () Bool)

(assert (=> b!1450933 m!1339073))

(declare-fun m!1339075 () Bool)

(assert (=> b!1450933 m!1339075))

(assert (=> b!1450941 m!1339069))

(assert (=> b!1450941 m!1339069))

(declare-fun m!1339077 () Bool)

(assert (=> b!1450941 m!1339077))

(declare-fun m!1339079 () Bool)

(assert (=> b!1450944 m!1339079))

(declare-fun m!1339081 () Bool)

(assert (=> b!1450944 m!1339081))

(assert (=> b!1450943 m!1339069))

(assert (=> b!1450943 m!1339069))

(declare-fun m!1339083 () Bool)

(assert (=> b!1450943 m!1339083))

(assert (=> b!1450943 m!1339083))

(assert (=> b!1450943 m!1339069))

(declare-fun m!1339085 () Bool)

(assert (=> b!1450943 m!1339085))

(declare-fun m!1339087 () Bool)

(assert (=> start!124876 m!1339087))

(declare-fun m!1339089 () Bool)

(assert (=> start!124876 m!1339089))

(declare-fun m!1339091 () Bool)

(assert (=> b!1450940 m!1339091))

(assert (=> b!1450936 m!1339059))

(declare-fun m!1339093 () Bool)

(assert (=> b!1450936 m!1339093))

(declare-fun m!1339095 () Bool)

(assert (=> b!1450935 m!1339095))

(assert (=> b!1450935 m!1339095))

(declare-fun m!1339097 () Bool)

(assert (=> b!1450935 m!1339097))

(assert (=> b!1450931 m!1339069))

(assert (=> b!1450931 m!1339069))

(declare-fun m!1339099 () Bool)

(assert (=> b!1450931 m!1339099))

(declare-fun m!1339101 () Bool)

(assert (=> b!1450946 m!1339101))

(check-sat (not b!1450940) (not b!1450942) (not b!1450944) (not b!1450935) (not b!1450943) (not b!1450931) (not b!1450932) (not start!124876) (not b!1450946) (not b!1450941) (not b!1450939) (not b!1450933))
(check-sat)
