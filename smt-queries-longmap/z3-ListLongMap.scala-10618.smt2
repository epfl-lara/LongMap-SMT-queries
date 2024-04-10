; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124848 () Bool)

(assert start!124848)

(declare-fun b!1449396 () Bool)

(declare-fun e!816216 () Bool)

(declare-fun e!816217 () Bool)

(assert (=> b!1449396 (= e!816216 e!816217)))

(declare-fun res!980849 () Bool)

(assert (=> b!1449396 (=> (not res!980849) (not e!816217))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11688 0))(
  ( (MissingZero!11688 (index!49144 (_ BitVec 32))) (Found!11688 (index!49145 (_ BitVec 32))) (Intermediate!11688 (undefined!12500 Bool) (index!49146 (_ BitVec 32)) (x!130809 (_ BitVec 32))) (Undefined!11688) (MissingVacant!11688 (index!49147 (_ BitVec 32))) )
))
(declare-fun lt!635883 () SeekEntryResult!11688)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98296 0))(
  ( (array!98297 (arr!47436 (Array (_ BitVec 32) (_ BitVec 64))) (size!47986 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98296)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98296 (_ BitVec 32)) SeekEntryResult!11688)

(assert (=> b!1449396 (= res!980849 (= lt!635883 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47436 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449397 () Bool)

(declare-fun res!980857 () Bool)

(declare-fun e!816215 () Bool)

(assert (=> b!1449397 (=> (not res!980857) (not e!816215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98296 (_ BitVec 32)) Bool)

(assert (=> b!1449397 (= res!980857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1449398 () Bool)

(declare-fun e!816218 () Bool)

(assert (=> b!1449398 (= e!816215 e!816218)))

(declare-fun res!980846 () Bool)

(assert (=> b!1449398 (=> (not res!980846) (not e!816218))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1449398 (= res!980846 (= (select (store (arr!47436 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!635887 () array!98296)

(assert (=> b!1449398 (= lt!635887 (array!98297 (store (arr!47436 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47986 a!2862)))))

(declare-fun b!1449399 () Bool)

(declare-fun e!816221 () Bool)

(declare-fun e!816222 () Bool)

(assert (=> b!1449399 (= e!816221 (not e!816222))))

(declare-fun res!980855 () Bool)

(assert (=> b!1449399 (=> res!980855 e!816222)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1449399 (= res!980855 (or (and (= (select (arr!47436 a!2862) index!646) (select (store (arr!47436 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47436 a!2862) index!646) (select (arr!47436 a!2862) j!93))) (not (= (select (arr!47436 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47436 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816223 () Bool)

(assert (=> b!1449399 e!816223))

(declare-fun res!980841 () Bool)

(assert (=> b!1449399 (=> (not res!980841) (not e!816223))))

(assert (=> b!1449399 (= res!980841 (and (= lt!635883 (Found!11688 j!93)) (or (= (select (arr!47436 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47436 a!2862) intermediateBeforeIndex!19) (select (arr!47436 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98296 (_ BitVec 32)) SeekEntryResult!11688)

(assert (=> b!1449399 (= lt!635883 (seekEntryOrOpen!0 (select (arr!47436 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1449399 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48872 0))(
  ( (Unit!48873) )
))
(declare-fun lt!635885 () Unit!48872)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98296 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48872)

(assert (=> b!1449399 (= lt!635885 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449400 () Bool)

(declare-fun res!980848 () Bool)

(assert (=> b!1449400 (=> (not res!980848) (not e!816221))))

(declare-fun e!816220 () Bool)

(assert (=> b!1449400 (= res!980848 e!816220)))

(declare-fun c!133788 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1449400 (= c!133788 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1449401 () Bool)

(declare-fun res!980852 () Bool)

(assert (=> b!1449401 (=> (not res!980852) (not e!816215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449401 (= res!980852 (validKeyInArray!0 (select (arr!47436 a!2862) i!1006)))))

(declare-fun b!1449402 () Bool)

(declare-fun e!816219 () Bool)

(assert (=> b!1449402 (= e!816219 e!816221)))

(declare-fun res!980844 () Bool)

(assert (=> b!1449402 (=> (not res!980844) (not e!816221))))

(declare-fun lt!635888 () SeekEntryResult!11688)

(assert (=> b!1449402 (= res!980844 (= lt!635888 (Intermediate!11688 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!635884 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98296 (_ BitVec 32)) SeekEntryResult!11688)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449402 (= lt!635888 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635884 mask!2687) lt!635884 lt!635887 mask!2687))))

(assert (=> b!1449402 (= lt!635884 (select (store (arr!47436 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449403 () Bool)

(assert (=> b!1449403 (= e!816218 e!816219)))

(declare-fun res!980843 () Bool)

(assert (=> b!1449403 (=> (not res!980843) (not e!816219))))

(declare-fun lt!635886 () SeekEntryResult!11688)

(assert (=> b!1449403 (= res!980843 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47436 a!2862) j!93) mask!2687) (select (arr!47436 a!2862) j!93) a!2862 mask!2687) lt!635886))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1449403 (= lt!635886 (Intermediate!11688 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449404 () Bool)

(declare-fun res!980847 () Bool)

(assert (=> b!1449404 (=> (not res!980847) (not e!816215))))

(assert (=> b!1449404 (= res!980847 (and (= (size!47986 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47986 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47986 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449405 () Bool)

(assert (=> b!1449405 (= e!816222 true)))

(declare-fun lt!635889 () SeekEntryResult!11688)

(assert (=> b!1449405 (= lt!635889 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47436 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1449406 () Bool)

(declare-fun res!980842 () Bool)

(assert (=> b!1449406 (=> (not res!980842) (not e!816221))))

(assert (=> b!1449406 (= res!980842 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449407 () Bool)

(declare-fun res!980853 () Bool)

(assert (=> b!1449407 (=> (not res!980853) (not e!816215))))

(assert (=> b!1449407 (= res!980853 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47986 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47986 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47986 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449408 () Bool)

(assert (=> b!1449408 (= e!816220 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635884 lt!635887 mask!2687) (seekEntryOrOpen!0 lt!635884 lt!635887 mask!2687)))))

(declare-fun b!1449409 () Bool)

(declare-fun res!980850 () Bool)

(assert (=> b!1449409 (=> (not res!980850) (not e!816219))))

(assert (=> b!1449409 (= res!980850 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47436 a!2862) j!93) a!2862 mask!2687) lt!635886))))

(declare-fun b!1449410 () Bool)

(assert (=> b!1449410 (= e!816223 e!816216)))

(declare-fun res!980851 () Bool)

(assert (=> b!1449410 (=> res!980851 e!816216)))

(assert (=> b!1449410 (= res!980851 (or (and (= (select (arr!47436 a!2862) index!646) (select (store (arr!47436 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47436 a!2862) index!646) (select (arr!47436 a!2862) j!93))) (not (= (select (arr!47436 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1449411 () Bool)

(declare-fun res!980854 () Bool)

(assert (=> b!1449411 (=> (not res!980854) (not e!816215))))

(declare-datatypes ((List!33937 0))(
  ( (Nil!33934) (Cons!33933 (h!35283 (_ BitVec 64)) (t!48631 List!33937)) )
))
(declare-fun arrayNoDuplicates!0 (array!98296 (_ BitVec 32) List!33937) Bool)

(assert (=> b!1449411 (= res!980854 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33934))))

(declare-fun b!1449412 () Bool)

(assert (=> b!1449412 (= e!816217 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun res!980856 () Bool)

(assert (=> start!124848 (=> (not res!980856) (not e!816215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124848 (= res!980856 (validMask!0 mask!2687))))

(assert (=> start!124848 e!816215))

(assert (=> start!124848 true))

(declare-fun array_inv!36464 (array!98296) Bool)

(assert (=> start!124848 (array_inv!36464 a!2862)))

(declare-fun b!1449413 () Bool)

(declare-fun res!980845 () Bool)

(assert (=> b!1449413 (=> (not res!980845) (not e!816215))))

(assert (=> b!1449413 (= res!980845 (validKeyInArray!0 (select (arr!47436 a!2862) j!93)))))

(declare-fun b!1449414 () Bool)

(assert (=> b!1449414 (= e!816220 (= lt!635888 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635884 lt!635887 mask!2687)))))

(assert (= (and start!124848 res!980856) b!1449404))

(assert (= (and b!1449404 res!980847) b!1449401))

(assert (= (and b!1449401 res!980852) b!1449413))

(assert (= (and b!1449413 res!980845) b!1449397))

(assert (= (and b!1449397 res!980857) b!1449411))

(assert (= (and b!1449411 res!980854) b!1449407))

(assert (= (and b!1449407 res!980853) b!1449398))

(assert (= (and b!1449398 res!980846) b!1449403))

(assert (= (and b!1449403 res!980843) b!1449409))

(assert (= (and b!1449409 res!980850) b!1449402))

(assert (= (and b!1449402 res!980844) b!1449400))

(assert (= (and b!1449400 c!133788) b!1449414))

(assert (= (and b!1449400 (not c!133788)) b!1449408))

(assert (= (and b!1449400 res!980848) b!1449406))

(assert (= (and b!1449406 res!980842) b!1449399))

(assert (= (and b!1449399 res!980841) b!1449410))

(assert (= (and b!1449410 (not res!980851)) b!1449396))

(assert (= (and b!1449396 res!980849) b!1449412))

(assert (= (and b!1449399 (not res!980855)) b!1449405))

(declare-fun m!1338109 () Bool)

(assert (=> b!1449397 m!1338109))

(declare-fun m!1338111 () Bool)

(assert (=> b!1449409 m!1338111))

(assert (=> b!1449409 m!1338111))

(declare-fun m!1338113 () Bool)

(assert (=> b!1449409 m!1338113))

(assert (=> b!1449413 m!1338111))

(assert (=> b!1449413 m!1338111))

(declare-fun m!1338115 () Bool)

(assert (=> b!1449413 m!1338115))

(declare-fun m!1338117 () Bool)

(assert (=> b!1449410 m!1338117))

(declare-fun m!1338119 () Bool)

(assert (=> b!1449410 m!1338119))

(declare-fun m!1338121 () Bool)

(assert (=> b!1449410 m!1338121))

(assert (=> b!1449410 m!1338111))

(declare-fun m!1338123 () Bool)

(assert (=> b!1449401 m!1338123))

(assert (=> b!1449401 m!1338123))

(declare-fun m!1338125 () Bool)

(assert (=> b!1449401 m!1338125))

(assert (=> b!1449403 m!1338111))

(assert (=> b!1449403 m!1338111))

(declare-fun m!1338127 () Bool)

(assert (=> b!1449403 m!1338127))

(assert (=> b!1449403 m!1338127))

(assert (=> b!1449403 m!1338111))

(declare-fun m!1338129 () Bool)

(assert (=> b!1449403 m!1338129))

(declare-fun m!1338131 () Bool)

(assert (=> b!1449411 m!1338131))

(declare-fun m!1338133 () Bool)

(assert (=> b!1449414 m!1338133))

(declare-fun m!1338135 () Bool)

(assert (=> start!124848 m!1338135))

(declare-fun m!1338137 () Bool)

(assert (=> start!124848 m!1338137))

(declare-fun m!1338139 () Bool)

(assert (=> b!1449399 m!1338139))

(assert (=> b!1449399 m!1338119))

(declare-fun m!1338141 () Bool)

(assert (=> b!1449399 m!1338141))

(assert (=> b!1449399 m!1338121))

(assert (=> b!1449399 m!1338117))

(assert (=> b!1449399 m!1338111))

(declare-fun m!1338143 () Bool)

(assert (=> b!1449399 m!1338143))

(declare-fun m!1338145 () Bool)

(assert (=> b!1449399 m!1338145))

(assert (=> b!1449399 m!1338111))

(assert (=> b!1449398 m!1338119))

(declare-fun m!1338147 () Bool)

(assert (=> b!1449398 m!1338147))

(declare-fun m!1338149 () Bool)

(assert (=> b!1449402 m!1338149))

(assert (=> b!1449402 m!1338149))

(declare-fun m!1338151 () Bool)

(assert (=> b!1449402 m!1338151))

(assert (=> b!1449402 m!1338119))

(declare-fun m!1338153 () Bool)

(assert (=> b!1449402 m!1338153))

(assert (=> b!1449396 m!1338111))

(assert (=> b!1449396 m!1338111))

(declare-fun m!1338155 () Bool)

(assert (=> b!1449396 m!1338155))

(assert (=> b!1449405 m!1338111))

(assert (=> b!1449405 m!1338111))

(declare-fun m!1338157 () Bool)

(assert (=> b!1449405 m!1338157))

(declare-fun m!1338159 () Bool)

(assert (=> b!1449408 m!1338159))

(declare-fun m!1338161 () Bool)

(assert (=> b!1449408 m!1338161))

(check-sat (not b!1449408) (not b!1449397) (not b!1449396) (not b!1449413) (not b!1449399) (not b!1449405) (not b!1449403) (not start!124848) (not b!1449411) (not b!1449401) (not b!1449414) (not b!1449409) (not b!1449402))
(check-sat)
