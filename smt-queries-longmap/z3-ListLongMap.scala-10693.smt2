; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125574 () Bool)

(assert start!125574)

(declare-fun b!1464949 () Bool)

(declare-fun res!993153 () Bool)

(declare-fun e!823497 () Bool)

(assert (=> b!1464949 (=> (not res!993153) (not e!823497))))

(declare-datatypes ((array!98860 0))(
  ( (array!98861 (arr!47713 (Array (_ BitVec 32) (_ BitVec 64))) (size!48264 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98860)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11862 0))(
  ( (MissingZero!11862 (index!49840 (_ BitVec 32))) (Found!11862 (index!49841 (_ BitVec 32))) (Intermediate!11862 (undefined!12674 Bool) (index!49842 (_ BitVec 32)) (x!131616 (_ BitVec 32))) (Undefined!11862) (MissingVacant!11862 (index!49843 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98860 (_ BitVec 32)) SeekEntryResult!11862)

(assert (=> b!1464949 (= res!993153 (= (seekEntryOrOpen!0 (select (arr!47713 a!2862) j!93) a!2862 mask!2687) (Found!11862 j!93)))))

(declare-fun lt!641342 () array!98860)

(declare-fun lt!641346 () SeekEntryResult!11862)

(declare-fun lt!641343 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1464950 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!823498 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98860 (_ BitVec 32)) SeekEntryResult!11862)

(assert (=> b!1464950 (= e!823498 (= lt!641346 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641343 lt!641342 mask!2687)))))

(declare-fun b!1464952 () Bool)

(declare-fun res!993144 () Bool)

(declare-fun e!823502 () Bool)

(assert (=> b!1464952 (=> (not res!993144) (not e!823502))))

(assert (=> b!1464952 (= res!993144 e!823498)))

(declare-fun c!135427 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1464952 (= c!135427 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1464953 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98860 (_ BitVec 32)) SeekEntryResult!11862)

(assert (=> b!1464953 (= e!823498 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641343 lt!641342 mask!2687) (seekEntryOrOpen!0 lt!641343 lt!641342 mask!2687)))))

(declare-fun b!1464954 () Bool)

(declare-fun e!823499 () Bool)

(assert (=> b!1464954 (= e!823499 e!823502)))

(declare-fun res!993139 () Bool)

(assert (=> b!1464954 (=> (not res!993139) (not e!823502))))

(assert (=> b!1464954 (= res!993139 (= lt!641346 (Intermediate!11862 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464954 (= lt!641346 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641343 mask!2687) lt!641343 lt!641342 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1464954 (= lt!641343 (select (store (arr!47713 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun lt!641345 () (_ BitVec 32))

(declare-fun e!823501 () Bool)

(declare-fun b!1464955 () Bool)

(assert (=> b!1464955 (= e!823501 (not (= lt!641346 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641345 lt!641343 lt!641342 mask!2687))))))

(declare-fun b!1464956 () Bool)

(declare-fun e!823500 () Bool)

(assert (=> b!1464956 (= e!823500 true)))

(declare-fun lt!641341 () Bool)

(assert (=> b!1464956 (= lt!641341 e!823501)))

(declare-fun c!135426 () Bool)

(assert (=> b!1464956 (= c!135426 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1464957 () Bool)

(declare-fun res!993141 () Bool)

(declare-fun e!823503 () Bool)

(assert (=> b!1464957 (=> (not res!993141) (not e!823503))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1464957 (= res!993141 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48264 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48264 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48264 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1464958 () Bool)

(declare-fun res!993152 () Bool)

(assert (=> b!1464958 (=> (not res!993152) (not e!823503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98860 (_ BitVec 32)) Bool)

(assert (=> b!1464958 (= res!993152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464959 () Bool)

(declare-fun e!823495 () Bool)

(assert (=> b!1464959 (= e!823495 e!823500)))

(declare-fun res!993150 () Bool)

(assert (=> b!1464959 (=> res!993150 e!823500)))

(assert (=> b!1464959 (= res!993150 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641345 #b00000000000000000000000000000000) (bvsge lt!641345 (size!48264 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464959 (= lt!641345 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1464960 () Bool)

(declare-fun res!993154 () Bool)

(assert (=> b!1464960 (=> (not res!993154) (not e!823503))))

(declare-datatypes ((List!34201 0))(
  ( (Nil!34198) (Cons!34197 (h!35561 (_ BitVec 64)) (t!48887 List!34201)) )
))
(declare-fun arrayNoDuplicates!0 (array!98860 (_ BitVec 32) List!34201) Bool)

(assert (=> b!1464960 (= res!993154 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34198))))

(declare-fun b!1464961 () Bool)

(declare-fun res!993147 () Bool)

(assert (=> b!1464961 (=> res!993147 e!823500)))

(declare-fun lt!641344 () SeekEntryResult!11862)

(assert (=> b!1464961 (= res!993147 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641345 (select (arr!47713 a!2862) j!93) a!2862 mask!2687) lt!641344)))))

(declare-fun b!1464962 () Bool)

(declare-fun res!993145 () Bool)

(assert (=> b!1464962 (=> (not res!993145) (not e!823503))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464962 (= res!993145 (validKeyInArray!0 (select (arr!47713 a!2862) j!93)))))

(declare-fun b!1464963 () Bool)

(declare-fun res!993146 () Bool)

(assert (=> b!1464963 (=> (not res!993146) (not e!823499))))

(assert (=> b!1464963 (= res!993146 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47713 a!2862) j!93) a!2862 mask!2687) lt!641344))))

(declare-fun b!1464964 () Bool)

(declare-fun res!993142 () Bool)

(assert (=> b!1464964 (=> (not res!993142) (not e!823502))))

(assert (=> b!1464964 (= res!993142 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1464965 () Bool)

(declare-fun e!823494 () Bool)

(assert (=> b!1464965 (= e!823503 e!823494)))

(declare-fun res!993151 () Bool)

(assert (=> b!1464965 (=> (not res!993151) (not e!823494))))

(assert (=> b!1464965 (= res!993151 (= (select (store (arr!47713 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1464965 (= lt!641342 (array!98861 (store (arr!47713 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48264 a!2862)))))

(declare-fun b!1464966 () Bool)

(assert (=> b!1464966 (= e!823494 e!823499)))

(declare-fun res!993148 () Bool)

(assert (=> b!1464966 (=> (not res!993148) (not e!823499))))

(assert (=> b!1464966 (= res!993148 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47713 a!2862) j!93) mask!2687) (select (arr!47713 a!2862) j!93) a!2862 mask!2687) lt!641344))))

(assert (=> b!1464966 (= lt!641344 (Intermediate!11862 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1464951 () Bool)

(assert (=> b!1464951 (= e!823502 (not e!823495))))

(declare-fun res!993149 () Bool)

(assert (=> b!1464951 (=> res!993149 e!823495)))

(assert (=> b!1464951 (= res!993149 (or (and (= (select (arr!47713 a!2862) index!646) (select (store (arr!47713 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47713 a!2862) index!646) (select (arr!47713 a!2862) j!93))) (= (select (arr!47713 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1464951 e!823497))

(declare-fun res!993140 () Bool)

(assert (=> b!1464951 (=> (not res!993140) (not e!823497))))

(assert (=> b!1464951 (= res!993140 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49253 0))(
  ( (Unit!49254) )
))
(declare-fun lt!641347 () Unit!49253)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98860 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49253)

(assert (=> b!1464951 (= lt!641347 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!993143 () Bool)

(assert (=> start!125574 (=> (not res!993143) (not e!823503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125574 (= res!993143 (validMask!0 mask!2687))))

(assert (=> start!125574 e!823503))

(assert (=> start!125574 true))

(declare-fun array_inv!36994 (array!98860) Bool)

(assert (=> start!125574 (array_inv!36994 a!2862)))

(declare-fun b!1464967 () Bool)

(assert (=> b!1464967 (= e!823497 (or (= (select (arr!47713 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47713 a!2862) intermediateBeforeIndex!19) (select (arr!47713 a!2862) j!93))))))

(declare-fun b!1464968 () Bool)

(declare-fun res!993138 () Bool)

(assert (=> b!1464968 (=> (not res!993138) (not e!823503))))

(assert (=> b!1464968 (= res!993138 (validKeyInArray!0 (select (arr!47713 a!2862) i!1006)))))

(declare-fun b!1464969 () Bool)

(assert (=> b!1464969 (= e!823501 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641345 intermediateAfterIndex!19 lt!641343 lt!641342 mask!2687) (seekEntryOrOpen!0 lt!641343 lt!641342 mask!2687))))))

(declare-fun b!1464970 () Bool)

(declare-fun res!993155 () Bool)

(assert (=> b!1464970 (=> (not res!993155) (not e!823503))))

(assert (=> b!1464970 (= res!993155 (and (= (size!48264 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48264 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48264 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125574 res!993143) b!1464970))

(assert (= (and b!1464970 res!993155) b!1464968))

(assert (= (and b!1464968 res!993138) b!1464962))

(assert (= (and b!1464962 res!993145) b!1464958))

(assert (= (and b!1464958 res!993152) b!1464960))

(assert (= (and b!1464960 res!993154) b!1464957))

(assert (= (and b!1464957 res!993141) b!1464965))

(assert (= (and b!1464965 res!993151) b!1464966))

(assert (= (and b!1464966 res!993148) b!1464963))

(assert (= (and b!1464963 res!993146) b!1464954))

(assert (= (and b!1464954 res!993139) b!1464952))

(assert (= (and b!1464952 c!135427) b!1464950))

(assert (= (and b!1464952 (not c!135427)) b!1464953))

(assert (= (and b!1464952 res!993144) b!1464964))

(assert (= (and b!1464964 res!993142) b!1464951))

(assert (= (and b!1464951 res!993140) b!1464949))

(assert (= (and b!1464949 res!993153) b!1464967))

(assert (= (and b!1464951 (not res!993149)) b!1464959))

(assert (= (and b!1464959 (not res!993150)) b!1464961))

(assert (= (and b!1464961 (not res!993147)) b!1464956))

(assert (= (and b!1464956 c!135426) b!1464955))

(assert (= (and b!1464956 (not c!135426)) b!1464969))

(declare-fun m!1352287 () Bool)

(assert (=> b!1464959 m!1352287))

(declare-fun m!1352289 () Bool)

(assert (=> b!1464966 m!1352289))

(assert (=> b!1464966 m!1352289))

(declare-fun m!1352291 () Bool)

(assert (=> b!1464966 m!1352291))

(assert (=> b!1464966 m!1352291))

(assert (=> b!1464966 m!1352289))

(declare-fun m!1352293 () Bool)

(assert (=> b!1464966 m!1352293))

(declare-fun m!1352295 () Bool)

(assert (=> b!1464960 m!1352295))

(declare-fun m!1352297 () Bool)

(assert (=> b!1464953 m!1352297))

(declare-fun m!1352299 () Bool)

(assert (=> b!1464953 m!1352299))

(declare-fun m!1352301 () Bool)

(assert (=> b!1464951 m!1352301))

(declare-fun m!1352303 () Bool)

(assert (=> b!1464951 m!1352303))

(declare-fun m!1352305 () Bool)

(assert (=> b!1464951 m!1352305))

(declare-fun m!1352307 () Bool)

(assert (=> b!1464951 m!1352307))

(declare-fun m!1352309 () Bool)

(assert (=> b!1464951 m!1352309))

(assert (=> b!1464951 m!1352289))

(declare-fun m!1352311 () Bool)

(assert (=> start!125574 m!1352311))

(declare-fun m!1352313 () Bool)

(assert (=> start!125574 m!1352313))

(declare-fun m!1352315 () Bool)

(assert (=> b!1464958 m!1352315))

(declare-fun m!1352317 () Bool)

(assert (=> b!1464950 m!1352317))

(declare-fun m!1352319 () Bool)

(assert (=> b!1464955 m!1352319))

(assert (=> b!1464961 m!1352289))

(assert (=> b!1464961 m!1352289))

(declare-fun m!1352321 () Bool)

(assert (=> b!1464961 m!1352321))

(assert (=> b!1464963 m!1352289))

(assert (=> b!1464963 m!1352289))

(declare-fun m!1352323 () Bool)

(assert (=> b!1464963 m!1352323))

(declare-fun m!1352325 () Bool)

(assert (=> b!1464967 m!1352325))

(assert (=> b!1464967 m!1352289))

(declare-fun m!1352327 () Bool)

(assert (=> b!1464954 m!1352327))

(assert (=> b!1464954 m!1352327))

(declare-fun m!1352329 () Bool)

(assert (=> b!1464954 m!1352329))

(assert (=> b!1464954 m!1352303))

(declare-fun m!1352331 () Bool)

(assert (=> b!1464954 m!1352331))

(declare-fun m!1352333 () Bool)

(assert (=> b!1464968 m!1352333))

(assert (=> b!1464968 m!1352333))

(declare-fun m!1352335 () Bool)

(assert (=> b!1464968 m!1352335))

(declare-fun m!1352337 () Bool)

(assert (=> b!1464969 m!1352337))

(assert (=> b!1464969 m!1352299))

(assert (=> b!1464962 m!1352289))

(assert (=> b!1464962 m!1352289))

(declare-fun m!1352339 () Bool)

(assert (=> b!1464962 m!1352339))

(assert (=> b!1464949 m!1352289))

(assert (=> b!1464949 m!1352289))

(declare-fun m!1352341 () Bool)

(assert (=> b!1464949 m!1352341))

(assert (=> b!1464965 m!1352303))

(declare-fun m!1352343 () Bool)

(assert (=> b!1464965 m!1352343))

(check-sat (not b!1464950) (not b!1464949) (not b!1464969) (not b!1464954) (not b!1464958) (not start!125574) (not b!1464962) (not b!1464955) (not b!1464953) (not b!1464961) (not b!1464963) (not b!1464966) (not b!1464960) (not b!1464959) (not b!1464968) (not b!1464951))
(check-sat)
