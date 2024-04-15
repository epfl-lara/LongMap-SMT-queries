; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125332 () Bool)

(assert start!125332)

(declare-fun b!1465224 () Bool)

(declare-fun res!994247 () Bool)

(declare-fun e!823311 () Bool)

(assert (=> b!1465224 (=> (not res!994247) (not e!823311))))

(declare-datatypes ((array!98758 0))(
  ( (array!98759 (arr!47668 (Array (_ BitVec 32) (_ BitVec 64))) (size!48220 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98758)

(declare-datatypes ((List!34247 0))(
  ( (Nil!34244) (Cons!34243 (h!35593 (_ BitVec 64)) (t!48933 List!34247)) )
))
(declare-fun arrayNoDuplicates!0 (array!98758 (_ BitVec 32) List!34247) Bool)

(assert (=> b!1465224 (= res!994247 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34244))))

(declare-fun b!1465225 () Bool)

(declare-fun res!994244 () Bool)

(assert (=> b!1465225 (=> (not res!994244) (not e!823311))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1465225 (= res!994244 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48220 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48220 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48220 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1465226 () Bool)

(declare-fun e!823314 () Bool)

(assert (=> b!1465226 (= e!823311 e!823314)))

(declare-fun res!994232 () Bool)

(assert (=> b!1465226 (=> (not res!994232) (not e!823314))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1465226 (= res!994232 (= (select (store (arr!47668 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!641167 () array!98758)

(assert (=> b!1465226 (= lt!641167 (array!98759 (store (arr!47668 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48220 a!2862)))))

(declare-fun b!1465227 () Bool)

(declare-fun res!994241 () Bool)

(declare-fun e!823310 () Bool)

(assert (=> b!1465227 (=> (not res!994241) (not e!823310))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11945 0))(
  ( (MissingZero!11945 (index!50172 (_ BitVec 32))) (Found!11945 (index!50173 (_ BitVec 32))) (Intermediate!11945 (undefined!12757 Bool) (index!50174 (_ BitVec 32)) (x!131749 (_ BitVec 32))) (Undefined!11945) (MissingVacant!11945 (index!50175 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98758 (_ BitVec 32)) SeekEntryResult!11945)

(assert (=> b!1465227 (= res!994241 (= (seekEntryOrOpen!0 (select (arr!47668 a!2862) j!93) a!2862 mask!2687) (Found!11945 j!93)))))

(declare-fun b!1465228 () Bool)

(declare-fun res!994237 () Bool)

(assert (=> b!1465228 (=> (not res!994237) (not e!823311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98758 (_ BitVec 32)) Bool)

(assert (=> b!1465228 (= res!994237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1465229 () Bool)

(declare-fun res!994248 () Bool)

(assert (=> b!1465229 (=> (not res!994248) (not e!823311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465229 (= res!994248 (validKeyInArray!0 (select (arr!47668 a!2862) j!93)))))

(declare-fun b!1465230 () Bool)

(declare-fun e!823307 () Bool)

(assert (=> b!1465230 (= e!823307 true)))

(declare-fun lt!641166 () Bool)

(declare-fun e!823313 () Bool)

(assert (=> b!1465230 (= lt!641166 e!823313)))

(declare-fun c!135010 () Bool)

(assert (=> b!1465230 (= c!135010 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465231 () Bool)

(declare-fun res!994245 () Bool)

(assert (=> b!1465231 (=> (not res!994245) (not e!823311))))

(assert (=> b!1465231 (= res!994245 (validKeyInArray!0 (select (arr!47668 a!2862) i!1006)))))

(declare-fun b!1465232 () Bool)

(assert (=> b!1465232 (= e!823310 (or (= (select (arr!47668 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47668 a!2862) intermediateBeforeIndex!19) (select (arr!47668 a!2862) j!93))))))

(declare-fun lt!641164 () SeekEntryResult!11945)

(declare-fun e!823305 () Bool)

(declare-fun lt!641169 () (_ BitVec 64))

(declare-fun b!1465233 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98758 (_ BitVec 32)) SeekEntryResult!11945)

(assert (=> b!1465233 (= e!823305 (= lt!641164 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641169 lt!641167 mask!2687)))))

(declare-fun lt!641163 () (_ BitVec 32))

(declare-fun b!1465234 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98758 (_ BitVec 32)) SeekEntryResult!11945)

(assert (=> b!1465234 (= e!823313 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641163 intermediateAfterIndex!19 lt!641169 lt!641167 mask!2687) (seekEntryOrOpen!0 lt!641169 lt!641167 mask!2687))))))

(declare-fun res!994240 () Bool)

(assert (=> start!125332 (=> (not res!994240) (not e!823311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125332 (= res!994240 (validMask!0 mask!2687))))

(assert (=> start!125332 e!823311))

(assert (=> start!125332 true))

(declare-fun array_inv!36901 (array!98758) Bool)

(assert (=> start!125332 (array_inv!36901 a!2862)))

(declare-fun b!1465235 () Bool)

(declare-fun e!823312 () Bool)

(declare-fun e!823306 () Bool)

(assert (=> b!1465235 (= e!823312 e!823306)))

(declare-fun res!994236 () Bool)

(assert (=> b!1465235 (=> (not res!994236) (not e!823306))))

(assert (=> b!1465235 (= res!994236 (= lt!641164 (Intermediate!11945 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465235 (= lt!641164 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641169 mask!2687) lt!641169 lt!641167 mask!2687))))

(assert (=> b!1465235 (= lt!641169 (select (store (arr!47668 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1465236 () Bool)

(declare-fun e!823308 () Bool)

(assert (=> b!1465236 (= e!823308 e!823307)))

(declare-fun res!994249 () Bool)

(assert (=> b!1465236 (=> res!994249 e!823307)))

(assert (=> b!1465236 (= res!994249 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641163 #b00000000000000000000000000000000) (bvsge lt!641163 (size!48220 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465236 (= lt!641163 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1465237 () Bool)

(assert (=> b!1465237 (= e!823314 e!823312)))

(declare-fun res!994234 () Bool)

(assert (=> b!1465237 (=> (not res!994234) (not e!823312))))

(declare-fun lt!641165 () SeekEntryResult!11945)

(assert (=> b!1465237 (= res!994234 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47668 a!2862) j!93) mask!2687) (select (arr!47668 a!2862) j!93) a!2862 mask!2687) lt!641165))))

(assert (=> b!1465237 (= lt!641165 (Intermediate!11945 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465238 () Bool)

(assert (=> b!1465238 (= e!823313 (not (= lt!641164 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641163 lt!641169 lt!641167 mask!2687))))))

(declare-fun b!1465239 () Bool)

(declare-fun res!994243 () Bool)

(assert (=> b!1465239 (=> (not res!994243) (not e!823311))))

(assert (=> b!1465239 (= res!994243 (and (= (size!48220 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48220 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48220 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1465240 () Bool)

(declare-fun res!994235 () Bool)

(assert (=> b!1465240 (=> res!994235 e!823307)))

(assert (=> b!1465240 (= res!994235 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641163 (select (arr!47668 a!2862) j!93) a!2862 mask!2687) lt!641165)))))

(declare-fun b!1465241 () Bool)

(declare-fun res!994233 () Bool)

(assert (=> b!1465241 (=> (not res!994233) (not e!823312))))

(assert (=> b!1465241 (= res!994233 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47668 a!2862) j!93) a!2862 mask!2687) lt!641165))))

(declare-fun b!1465242 () Bool)

(assert (=> b!1465242 (= e!823306 (not e!823308))))

(declare-fun res!994238 () Bool)

(assert (=> b!1465242 (=> res!994238 e!823308)))

(assert (=> b!1465242 (= res!994238 (or (and (= (select (arr!47668 a!2862) index!646) (select (store (arr!47668 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47668 a!2862) index!646) (select (arr!47668 a!2862) j!93))) (= (select (arr!47668 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1465242 e!823310))

(declare-fun res!994246 () Bool)

(assert (=> b!1465242 (=> (not res!994246) (not e!823310))))

(assert (=> b!1465242 (= res!994246 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49227 0))(
  ( (Unit!49228) )
))
(declare-fun lt!641168 () Unit!49227)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98758 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49227)

(assert (=> b!1465242 (= lt!641168 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1465243 () Bool)

(declare-fun res!994239 () Bool)

(assert (=> b!1465243 (=> (not res!994239) (not e!823306))))

(assert (=> b!1465243 (= res!994239 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465244 () Bool)

(declare-fun res!994242 () Bool)

(assert (=> b!1465244 (=> (not res!994242) (not e!823306))))

(assert (=> b!1465244 (= res!994242 e!823305)))

(declare-fun c!135009 () Bool)

(assert (=> b!1465244 (= c!135009 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1465245 () Bool)

(assert (=> b!1465245 (= e!823305 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641169 lt!641167 mask!2687) (seekEntryOrOpen!0 lt!641169 lt!641167 mask!2687)))))

(assert (= (and start!125332 res!994240) b!1465239))

(assert (= (and b!1465239 res!994243) b!1465231))

(assert (= (and b!1465231 res!994245) b!1465229))

(assert (= (and b!1465229 res!994248) b!1465228))

(assert (= (and b!1465228 res!994237) b!1465224))

(assert (= (and b!1465224 res!994247) b!1465225))

(assert (= (and b!1465225 res!994244) b!1465226))

(assert (= (and b!1465226 res!994232) b!1465237))

(assert (= (and b!1465237 res!994234) b!1465241))

(assert (= (and b!1465241 res!994233) b!1465235))

(assert (= (and b!1465235 res!994236) b!1465244))

(assert (= (and b!1465244 c!135009) b!1465233))

(assert (= (and b!1465244 (not c!135009)) b!1465245))

(assert (= (and b!1465244 res!994242) b!1465243))

(assert (= (and b!1465243 res!994239) b!1465242))

(assert (= (and b!1465242 res!994246) b!1465227))

(assert (= (and b!1465227 res!994241) b!1465232))

(assert (= (and b!1465242 (not res!994238)) b!1465236))

(assert (= (and b!1465236 (not res!994249)) b!1465240))

(assert (= (and b!1465240 (not res!994235)) b!1465230))

(assert (= (and b!1465230 c!135010) b!1465238))

(assert (= (and b!1465230 (not c!135010)) b!1465234))

(declare-fun m!1351839 () Bool)

(assert (=> b!1465238 m!1351839))

(declare-fun m!1351841 () Bool)

(assert (=> b!1465237 m!1351841))

(assert (=> b!1465237 m!1351841))

(declare-fun m!1351843 () Bool)

(assert (=> b!1465237 m!1351843))

(assert (=> b!1465237 m!1351843))

(assert (=> b!1465237 m!1351841))

(declare-fun m!1351845 () Bool)

(assert (=> b!1465237 m!1351845))

(declare-fun m!1351847 () Bool)

(assert (=> start!125332 m!1351847))

(declare-fun m!1351849 () Bool)

(assert (=> start!125332 m!1351849))

(declare-fun m!1351851 () Bool)

(assert (=> b!1465242 m!1351851))

(declare-fun m!1351853 () Bool)

(assert (=> b!1465242 m!1351853))

(declare-fun m!1351855 () Bool)

(assert (=> b!1465242 m!1351855))

(declare-fun m!1351857 () Bool)

(assert (=> b!1465242 m!1351857))

(declare-fun m!1351859 () Bool)

(assert (=> b!1465242 m!1351859))

(assert (=> b!1465242 m!1351841))

(declare-fun m!1351861 () Bool)

(assert (=> b!1465231 m!1351861))

(assert (=> b!1465231 m!1351861))

(declare-fun m!1351863 () Bool)

(assert (=> b!1465231 m!1351863))

(assert (=> b!1465226 m!1351853))

(declare-fun m!1351865 () Bool)

(assert (=> b!1465226 m!1351865))

(assert (=> b!1465240 m!1351841))

(assert (=> b!1465240 m!1351841))

(declare-fun m!1351867 () Bool)

(assert (=> b!1465240 m!1351867))

(assert (=> b!1465229 m!1351841))

(assert (=> b!1465229 m!1351841))

(declare-fun m!1351869 () Bool)

(assert (=> b!1465229 m!1351869))

(assert (=> b!1465227 m!1351841))

(assert (=> b!1465227 m!1351841))

(declare-fun m!1351871 () Bool)

(assert (=> b!1465227 m!1351871))

(declare-fun m!1351873 () Bool)

(assert (=> b!1465224 m!1351873))

(declare-fun m!1351875 () Bool)

(assert (=> b!1465245 m!1351875))

(declare-fun m!1351877 () Bool)

(assert (=> b!1465245 m!1351877))

(assert (=> b!1465241 m!1351841))

(assert (=> b!1465241 m!1351841))

(declare-fun m!1351879 () Bool)

(assert (=> b!1465241 m!1351879))

(declare-fun m!1351881 () Bool)

(assert (=> b!1465235 m!1351881))

(assert (=> b!1465235 m!1351881))

(declare-fun m!1351883 () Bool)

(assert (=> b!1465235 m!1351883))

(assert (=> b!1465235 m!1351853))

(declare-fun m!1351885 () Bool)

(assert (=> b!1465235 m!1351885))

(declare-fun m!1351887 () Bool)

(assert (=> b!1465236 m!1351887))

(declare-fun m!1351889 () Bool)

(assert (=> b!1465228 m!1351889))

(declare-fun m!1351891 () Bool)

(assert (=> b!1465234 m!1351891))

(assert (=> b!1465234 m!1351877))

(declare-fun m!1351893 () Bool)

(assert (=> b!1465233 m!1351893))

(declare-fun m!1351895 () Bool)

(assert (=> b!1465232 m!1351895))

(assert (=> b!1465232 m!1351841))

(check-sat (not b!1465237) (not b!1465233) (not start!125332) (not b!1465238) (not b!1465228) (not b!1465236) (not b!1465245) (not b!1465227) (not b!1465229) (not b!1465224) (not b!1465235) (not b!1465241) (not b!1465242) (not b!1465231) (not b!1465234) (not b!1465240))
(check-sat)
