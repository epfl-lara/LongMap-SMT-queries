; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126036 () Bool)

(assert start!126036)

(declare-fun b!1473207 () Bool)

(declare-fun e!827031 () Bool)

(declare-fun e!827027 () Bool)

(assert (=> b!1473207 (= e!827031 e!827027)))

(declare-fun res!999884 () Bool)

(assert (=> b!1473207 (=> (not res!999884) (not e!827027))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99208 0))(
  ( (array!99209 (arr!47884 (Array (_ BitVec 32) (_ BitVec 64))) (size!48435 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99208)

(assert (=> b!1473207 (= res!999884 (= (select (store (arr!47884 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!643935 () array!99208)

(assert (=> b!1473207 (= lt!643935 (array!99209 (store (arr!47884 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48435 a!2862)))))

(declare-fun b!1473208 () Bool)

(declare-fun res!999896 () Bool)

(assert (=> b!1473208 (=> (not res!999896) (not e!827031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1473208 (= res!999896 (validKeyInArray!0 (select (arr!47884 a!2862) i!1006)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1473209 () Bool)

(declare-fun e!827026 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1473209 (= e!827026 (or (= (select (arr!47884 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47884 a!2862) intermediateBeforeIndex!19) (select (arr!47884 a!2862) j!93))))))

(declare-fun b!1473210 () Bool)

(declare-fun res!999888 () Bool)

(declare-fun e!827029 () Bool)

(assert (=> b!1473210 (=> (not res!999888) (not e!827029))))

(declare-fun e!827030 () Bool)

(assert (=> b!1473210 (= res!999888 e!827030)))

(declare-fun c!136186 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1473210 (= c!136186 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!999883 () Bool)

(assert (=> start!126036 (=> (not res!999883) (not e!827031))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126036 (= res!999883 (validMask!0 mask!2687))))

(assert (=> start!126036 e!827031))

(assert (=> start!126036 true))

(declare-fun array_inv!37165 (array!99208) Bool)

(assert (=> start!126036 (array_inv!37165 a!2862)))

(declare-fun b!1473211 () Bool)

(declare-fun res!999894 () Bool)

(assert (=> b!1473211 (=> (not res!999894) (not e!827026))))

(declare-datatypes ((SeekEntryResult!12021 0))(
  ( (MissingZero!12021 (index!50476 (_ BitVec 32))) (Found!12021 (index!50477 (_ BitVec 32))) (Intermediate!12021 (undefined!12833 Bool) (index!50478 (_ BitVec 32)) (x!132249 (_ BitVec 32))) (Undefined!12021) (MissingVacant!12021 (index!50479 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99208 (_ BitVec 32)) SeekEntryResult!12021)

(assert (=> b!1473211 (= res!999894 (= (seekEntryOrOpen!0 (select (arr!47884 a!2862) j!93) a!2862 mask!2687) (Found!12021 j!93)))))

(declare-fun b!1473212 () Bool)

(assert (=> b!1473212 (= e!827029 (not true))))

(assert (=> b!1473212 e!827026))

(declare-fun res!999895 () Bool)

(assert (=> b!1473212 (=> (not res!999895) (not e!827026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99208 (_ BitVec 32)) Bool)

(assert (=> b!1473212 (= res!999895 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49415 0))(
  ( (Unit!49416) )
))
(declare-fun lt!643932 () Unit!49415)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99208 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49415)

(assert (=> b!1473212 (= lt!643932 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1473213 () Bool)

(declare-fun e!827028 () Bool)

(assert (=> b!1473213 (= e!827028 e!827029)))

(declare-fun res!999886 () Bool)

(assert (=> b!1473213 (=> (not res!999886) (not e!827029))))

(declare-fun lt!643934 () SeekEntryResult!12021)

(assert (=> b!1473213 (= res!999886 (= lt!643934 (Intermediate!12021 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!643936 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99208 (_ BitVec 32)) SeekEntryResult!12021)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473213 (= lt!643934 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643936 mask!2687) lt!643936 lt!643935 mask!2687))))

(assert (=> b!1473213 (= lt!643936 (select (store (arr!47884 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1473214 () Bool)

(declare-fun res!999892 () Bool)

(assert (=> b!1473214 (=> (not res!999892) (not e!827028))))

(declare-fun lt!643933 () SeekEntryResult!12021)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1473214 (= res!999892 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47884 a!2862) j!93) a!2862 mask!2687) lt!643933))))

(declare-fun b!1473215 () Bool)

(assert (=> b!1473215 (= e!827027 e!827028)))

(declare-fun res!999890 () Bool)

(assert (=> b!1473215 (=> (not res!999890) (not e!827028))))

(assert (=> b!1473215 (= res!999890 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47884 a!2862) j!93) mask!2687) (select (arr!47884 a!2862) j!93) a!2862 mask!2687) lt!643933))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1473215 (= lt!643933 (Intermediate!12021 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1473216 () Bool)

(declare-fun res!999891 () Bool)

(assert (=> b!1473216 (=> (not res!999891) (not e!827031))))

(assert (=> b!1473216 (= res!999891 (and (= (size!48435 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48435 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48435 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1473217 () Bool)

(declare-fun res!999893 () Bool)

(assert (=> b!1473217 (=> (not res!999893) (not e!827031))))

(assert (=> b!1473217 (= res!999893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1473218 () Bool)

(declare-fun res!999885 () Bool)

(assert (=> b!1473218 (=> (not res!999885) (not e!827029))))

(assert (=> b!1473218 (= res!999885 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1473219 () Bool)

(declare-fun res!999889 () Bool)

(assert (=> b!1473219 (=> (not res!999889) (not e!827031))))

(assert (=> b!1473219 (= res!999889 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48435 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48435 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48435 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1473220 () Bool)

(declare-fun res!999882 () Bool)

(assert (=> b!1473220 (=> (not res!999882) (not e!827031))))

(assert (=> b!1473220 (= res!999882 (validKeyInArray!0 (select (arr!47884 a!2862) j!93)))))

(declare-fun b!1473221 () Bool)

(declare-fun res!999887 () Bool)

(assert (=> b!1473221 (=> (not res!999887) (not e!827031))))

(declare-datatypes ((List!34372 0))(
  ( (Nil!34369) (Cons!34368 (h!35738 (_ BitVec 64)) (t!49058 List!34372)) )
))
(declare-fun arrayNoDuplicates!0 (array!99208 (_ BitVec 32) List!34372) Bool)

(assert (=> b!1473221 (= res!999887 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34369))))

(declare-fun b!1473222 () Bool)

(assert (=> b!1473222 (= e!827030 (= lt!643934 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643936 lt!643935 mask!2687)))))

(declare-fun b!1473223 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99208 (_ BitVec 32)) SeekEntryResult!12021)

(assert (=> b!1473223 (= e!827030 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643936 lt!643935 mask!2687) (seekEntryOrOpen!0 lt!643936 lt!643935 mask!2687)))))

(assert (= (and start!126036 res!999883) b!1473216))

(assert (= (and b!1473216 res!999891) b!1473208))

(assert (= (and b!1473208 res!999896) b!1473220))

(assert (= (and b!1473220 res!999882) b!1473217))

(assert (= (and b!1473217 res!999893) b!1473221))

(assert (= (and b!1473221 res!999887) b!1473219))

(assert (= (and b!1473219 res!999889) b!1473207))

(assert (= (and b!1473207 res!999884) b!1473215))

(assert (= (and b!1473215 res!999890) b!1473214))

(assert (= (and b!1473214 res!999892) b!1473213))

(assert (= (and b!1473213 res!999886) b!1473210))

(assert (= (and b!1473210 c!136186) b!1473222))

(assert (= (and b!1473210 (not c!136186)) b!1473223))

(assert (= (and b!1473210 res!999888) b!1473218))

(assert (= (and b!1473218 res!999885) b!1473212))

(assert (= (and b!1473212 res!999895) b!1473211))

(assert (= (and b!1473211 res!999894) b!1473209))

(declare-fun m!1359991 () Bool)

(assert (=> b!1473208 m!1359991))

(assert (=> b!1473208 m!1359991))

(declare-fun m!1359993 () Bool)

(assert (=> b!1473208 m!1359993))

(declare-fun m!1359995 () Bool)

(assert (=> b!1473212 m!1359995))

(declare-fun m!1359997 () Bool)

(assert (=> b!1473212 m!1359997))

(declare-fun m!1359999 () Bool)

(assert (=> b!1473215 m!1359999))

(assert (=> b!1473215 m!1359999))

(declare-fun m!1360001 () Bool)

(assert (=> b!1473215 m!1360001))

(assert (=> b!1473215 m!1360001))

(assert (=> b!1473215 m!1359999))

(declare-fun m!1360003 () Bool)

(assert (=> b!1473215 m!1360003))

(assert (=> b!1473214 m!1359999))

(assert (=> b!1473214 m!1359999))

(declare-fun m!1360005 () Bool)

(assert (=> b!1473214 m!1360005))

(declare-fun m!1360007 () Bool)

(assert (=> b!1473207 m!1360007))

(declare-fun m!1360009 () Bool)

(assert (=> b!1473207 m!1360009))

(declare-fun m!1360011 () Bool)

(assert (=> b!1473222 m!1360011))

(declare-fun m!1360013 () Bool)

(assert (=> b!1473221 m!1360013))

(declare-fun m!1360015 () Bool)

(assert (=> start!126036 m!1360015))

(declare-fun m!1360017 () Bool)

(assert (=> start!126036 m!1360017))

(assert (=> b!1473211 m!1359999))

(assert (=> b!1473211 m!1359999))

(declare-fun m!1360019 () Bool)

(assert (=> b!1473211 m!1360019))

(declare-fun m!1360021 () Bool)

(assert (=> b!1473217 m!1360021))

(declare-fun m!1360023 () Bool)

(assert (=> b!1473223 m!1360023))

(declare-fun m!1360025 () Bool)

(assert (=> b!1473223 m!1360025))

(assert (=> b!1473220 m!1359999))

(assert (=> b!1473220 m!1359999))

(declare-fun m!1360027 () Bool)

(assert (=> b!1473220 m!1360027))

(declare-fun m!1360029 () Bool)

(assert (=> b!1473213 m!1360029))

(assert (=> b!1473213 m!1360029))

(declare-fun m!1360031 () Bool)

(assert (=> b!1473213 m!1360031))

(assert (=> b!1473213 m!1360007))

(declare-fun m!1360033 () Bool)

(assert (=> b!1473213 m!1360033))

(declare-fun m!1360035 () Bool)

(assert (=> b!1473209 m!1360035))

(assert (=> b!1473209 m!1359999))

(check-sat (not b!1473212) (not b!1473211) (not b!1473222) (not b!1473215) (not b!1473214) (not b!1473223) (not b!1473217) (not b!1473213) (not b!1473208) (not b!1473220) (not b!1473221) (not start!126036))
(check-sat)
