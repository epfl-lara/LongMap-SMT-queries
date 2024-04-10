; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125354 () Bool)

(assert start!125354)

(declare-fun b!1465155 () Bool)

(declare-fun res!994111 () Bool)

(declare-fun e!823301 () Bool)

(assert (=> b!1465155 (=> res!994111 e!823301)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11941 0))(
  ( (MissingZero!11941 (index!50156 (_ BitVec 32))) (Found!11941 (index!50157 (_ BitVec 32))) (Intermediate!11941 (undefined!12753 Bool) (index!50158 (_ BitVec 32)) (x!131734 (_ BitVec 32))) (Undefined!11941) (MissingVacant!11941 (index!50159 (_ BitVec 32))) )
))
(declare-fun lt!641318 () SeekEntryResult!11941)

(declare-fun lt!641314 () (_ BitVec 32))

(declare-datatypes ((array!98802 0))(
  ( (array!98803 (arr!47689 (Array (_ BitVec 32) (_ BitVec 64))) (size!48239 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98802)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98802 (_ BitVec 32)) SeekEntryResult!11941)

(assert (=> b!1465155 (= res!994111 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641314 (select (arr!47689 a!2862) j!93) a!2862 mask!2687) lt!641318)))))

(declare-fun e!823303 () Bool)

(declare-fun b!1465156 () Bool)

(declare-fun lt!641317 () array!98802)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!641315 () (_ BitVec 64))

(declare-fun lt!641313 () SeekEntryResult!11941)

(assert (=> b!1465156 (= e!823303 (= lt!641313 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641315 lt!641317 mask!2687)))))

(declare-fun b!1465157 () Bool)

(declare-fun e!823310 () Bool)

(declare-fun e!823308 () Bool)

(assert (=> b!1465157 (= e!823310 e!823308)))

(declare-fun res!994109 () Bool)

(assert (=> b!1465157 (=> (not res!994109) (not e!823308))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1465157 (= res!994109 (= lt!641313 (Intermediate!11941 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465157 (= lt!641313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641315 mask!2687) lt!641315 lt!641317 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1465157 (= lt!641315 (select (store (arr!47689 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1465158 () Bool)

(declare-fun res!994107 () Bool)

(assert (=> b!1465158 (=> (not res!994107) (not e!823310))))

(assert (=> b!1465158 (= res!994107 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47689 a!2862) j!93) a!2862 mask!2687) lt!641318))))

(declare-fun b!1465160 () Bool)

(declare-fun res!994108 () Bool)

(declare-fun e!823307 () Bool)

(assert (=> b!1465160 (=> (not res!994108) (not e!823307))))

(declare-datatypes ((List!34190 0))(
  ( (Nil!34187) (Cons!34186 (h!35536 (_ BitVec 64)) (t!48884 List!34190)) )
))
(declare-fun arrayNoDuplicates!0 (array!98802 (_ BitVec 32) List!34190) Bool)

(assert (=> b!1465160 (= res!994108 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34187))))

(declare-fun e!823306 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1465161 () Bool)

(assert (=> b!1465161 (= e!823306 (or (= (select (arr!47689 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47689 a!2862) intermediateBeforeIndex!19) (select (arr!47689 a!2862) j!93))))))

(declare-fun b!1465162 () Bool)

(declare-fun e!823302 () Bool)

(assert (=> b!1465162 (= e!823307 e!823302)))

(declare-fun res!994094 () Bool)

(assert (=> b!1465162 (=> (not res!994094) (not e!823302))))

(assert (=> b!1465162 (= res!994094 (= (select (store (arr!47689 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1465162 (= lt!641317 (array!98803 (store (arr!47689 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48239 a!2862)))))

(declare-fun b!1465163 () Bool)

(declare-fun res!994100 () Bool)

(assert (=> b!1465163 (=> (not res!994100) (not e!823308))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1465163 (= res!994100 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465164 () Bool)

(declare-fun e!823309 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98802 (_ BitVec 32)) SeekEntryResult!11941)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98802 (_ BitVec 32)) SeekEntryResult!11941)

(assert (=> b!1465164 (= e!823309 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641314 intermediateAfterIndex!19 lt!641315 lt!641317 mask!2687) (seekEntryOrOpen!0 lt!641315 lt!641317 mask!2687))))))

(declare-fun b!1465165 () Bool)

(assert (=> b!1465165 (= e!823302 e!823310)))

(declare-fun res!994096 () Bool)

(assert (=> b!1465165 (=> (not res!994096) (not e!823310))))

(assert (=> b!1465165 (= res!994096 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47689 a!2862) j!93) mask!2687) (select (arr!47689 a!2862) j!93) a!2862 mask!2687) lt!641318))))

(assert (=> b!1465165 (= lt!641318 (Intermediate!11941 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465166 () Bool)

(declare-fun res!994110 () Bool)

(assert (=> b!1465166 (=> (not res!994110) (not e!823307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465166 (= res!994110 (validKeyInArray!0 (select (arr!47689 a!2862) i!1006)))))

(declare-fun b!1465167 () Bool)

(declare-fun e!823305 () Bool)

(assert (=> b!1465167 (= e!823308 (not e!823305))))

(declare-fun res!994106 () Bool)

(assert (=> b!1465167 (=> res!994106 e!823305)))

(assert (=> b!1465167 (= res!994106 (or (and (= (select (arr!47689 a!2862) index!646) (select (store (arr!47689 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47689 a!2862) index!646) (select (arr!47689 a!2862) j!93))) (= (select (arr!47689 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1465167 e!823306))

(declare-fun res!994101 () Bool)

(assert (=> b!1465167 (=> (not res!994101) (not e!823306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98802 (_ BitVec 32)) Bool)

(assert (=> b!1465167 (= res!994101 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49378 0))(
  ( (Unit!49379) )
))
(declare-fun lt!641319 () Unit!49378)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98802 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49378)

(assert (=> b!1465167 (= lt!641319 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1465168 () Bool)

(declare-fun res!994105 () Bool)

(assert (=> b!1465168 (=> (not res!994105) (not e!823307))))

(assert (=> b!1465168 (= res!994105 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48239 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48239 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48239 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1465169 () Bool)

(assert (=> b!1465169 (= e!823301 true)))

(declare-fun lt!641316 () Bool)

(assert (=> b!1465169 (= lt!641316 e!823309)))

(declare-fun c!135041 () Bool)

(assert (=> b!1465169 (= c!135041 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465170 () Bool)

(assert (=> b!1465170 (= e!823305 e!823301)))

(declare-fun res!994098 () Bool)

(assert (=> b!1465170 (=> res!994098 e!823301)))

(assert (=> b!1465170 (= res!994098 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641314 #b00000000000000000000000000000000) (bvsge lt!641314 (size!48239 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465170 (= lt!641314 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1465171 () Bool)

(declare-fun res!994097 () Bool)

(assert (=> b!1465171 (=> (not res!994097) (not e!823308))))

(assert (=> b!1465171 (= res!994097 e!823303)))

(declare-fun c!135042 () Bool)

(assert (=> b!1465171 (= c!135042 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1465172 () Bool)

(assert (=> b!1465172 (= e!823303 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641315 lt!641317 mask!2687) (seekEntryOrOpen!0 lt!641315 lt!641317 mask!2687)))))

(declare-fun res!994104 () Bool)

(assert (=> start!125354 (=> (not res!994104) (not e!823307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125354 (= res!994104 (validMask!0 mask!2687))))

(assert (=> start!125354 e!823307))

(assert (=> start!125354 true))

(declare-fun array_inv!36717 (array!98802) Bool)

(assert (=> start!125354 (array_inv!36717 a!2862)))

(declare-fun b!1465159 () Bool)

(declare-fun res!994102 () Bool)

(assert (=> b!1465159 (=> (not res!994102) (not e!823307))))

(assert (=> b!1465159 (= res!994102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1465173 () Bool)

(declare-fun res!994103 () Bool)

(assert (=> b!1465173 (=> (not res!994103) (not e!823307))))

(assert (=> b!1465173 (= res!994103 (validKeyInArray!0 (select (arr!47689 a!2862) j!93)))))

(declare-fun b!1465174 () Bool)

(declare-fun res!994099 () Bool)

(assert (=> b!1465174 (=> (not res!994099) (not e!823306))))

(assert (=> b!1465174 (= res!994099 (= (seekEntryOrOpen!0 (select (arr!47689 a!2862) j!93) a!2862 mask!2687) (Found!11941 j!93)))))

(declare-fun b!1465175 () Bool)

(assert (=> b!1465175 (= e!823309 (not (= lt!641313 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641314 lt!641315 lt!641317 mask!2687))))))

(declare-fun b!1465176 () Bool)

(declare-fun res!994095 () Bool)

(assert (=> b!1465176 (=> (not res!994095) (not e!823307))))

(assert (=> b!1465176 (= res!994095 (and (= (size!48239 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48239 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48239 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125354 res!994104) b!1465176))

(assert (= (and b!1465176 res!994095) b!1465166))

(assert (= (and b!1465166 res!994110) b!1465173))

(assert (= (and b!1465173 res!994103) b!1465159))

(assert (= (and b!1465159 res!994102) b!1465160))

(assert (= (and b!1465160 res!994108) b!1465168))

(assert (= (and b!1465168 res!994105) b!1465162))

(assert (= (and b!1465162 res!994094) b!1465165))

(assert (= (and b!1465165 res!994096) b!1465158))

(assert (= (and b!1465158 res!994107) b!1465157))

(assert (= (and b!1465157 res!994109) b!1465171))

(assert (= (and b!1465171 c!135042) b!1465156))

(assert (= (and b!1465171 (not c!135042)) b!1465172))

(assert (= (and b!1465171 res!994097) b!1465163))

(assert (= (and b!1465163 res!994100) b!1465167))

(assert (= (and b!1465167 res!994101) b!1465174))

(assert (= (and b!1465174 res!994099) b!1465161))

(assert (= (and b!1465167 (not res!994106)) b!1465170))

(assert (= (and b!1465170 (not res!994098)) b!1465155))

(assert (= (and b!1465155 (not res!994111)) b!1465169))

(assert (= (and b!1465169 c!135041) b!1465175))

(assert (= (and b!1465169 (not c!135041)) b!1465164))

(declare-fun m!1352283 () Bool)

(assert (=> b!1465165 m!1352283))

(assert (=> b!1465165 m!1352283))

(declare-fun m!1352285 () Bool)

(assert (=> b!1465165 m!1352285))

(assert (=> b!1465165 m!1352285))

(assert (=> b!1465165 m!1352283))

(declare-fun m!1352287 () Bool)

(assert (=> b!1465165 m!1352287))

(declare-fun m!1352289 () Bool)

(assert (=> b!1465167 m!1352289))

(declare-fun m!1352291 () Bool)

(assert (=> b!1465167 m!1352291))

(declare-fun m!1352293 () Bool)

(assert (=> b!1465167 m!1352293))

(declare-fun m!1352295 () Bool)

(assert (=> b!1465167 m!1352295))

(declare-fun m!1352297 () Bool)

(assert (=> b!1465167 m!1352297))

(assert (=> b!1465167 m!1352283))

(assert (=> b!1465162 m!1352291))

(declare-fun m!1352299 () Bool)

(assert (=> b!1465162 m!1352299))

(declare-fun m!1352301 () Bool)

(assert (=> b!1465159 m!1352301))

(declare-fun m!1352303 () Bool)

(assert (=> start!125354 m!1352303))

(declare-fun m!1352305 () Bool)

(assert (=> start!125354 m!1352305))

(declare-fun m!1352307 () Bool)

(assert (=> b!1465170 m!1352307))

(declare-fun m!1352309 () Bool)

(assert (=> b!1465172 m!1352309))

(declare-fun m!1352311 () Bool)

(assert (=> b!1465172 m!1352311))

(declare-fun m!1352313 () Bool)

(assert (=> b!1465175 m!1352313))

(declare-fun m!1352315 () Bool)

(assert (=> b!1465161 m!1352315))

(assert (=> b!1465161 m!1352283))

(declare-fun m!1352317 () Bool)

(assert (=> b!1465156 m!1352317))

(assert (=> b!1465174 m!1352283))

(assert (=> b!1465174 m!1352283))

(declare-fun m!1352319 () Bool)

(assert (=> b!1465174 m!1352319))

(declare-fun m!1352321 () Bool)

(assert (=> b!1465166 m!1352321))

(assert (=> b!1465166 m!1352321))

(declare-fun m!1352323 () Bool)

(assert (=> b!1465166 m!1352323))

(assert (=> b!1465158 m!1352283))

(assert (=> b!1465158 m!1352283))

(declare-fun m!1352325 () Bool)

(assert (=> b!1465158 m!1352325))

(declare-fun m!1352327 () Bool)

(assert (=> b!1465164 m!1352327))

(assert (=> b!1465164 m!1352311))

(assert (=> b!1465155 m!1352283))

(assert (=> b!1465155 m!1352283))

(declare-fun m!1352329 () Bool)

(assert (=> b!1465155 m!1352329))

(declare-fun m!1352331 () Bool)

(assert (=> b!1465157 m!1352331))

(assert (=> b!1465157 m!1352331))

(declare-fun m!1352333 () Bool)

(assert (=> b!1465157 m!1352333))

(assert (=> b!1465157 m!1352291))

(declare-fun m!1352335 () Bool)

(assert (=> b!1465157 m!1352335))

(declare-fun m!1352337 () Bool)

(assert (=> b!1465160 m!1352337))

(assert (=> b!1465173 m!1352283))

(assert (=> b!1465173 m!1352283))

(declare-fun m!1352339 () Bool)

(assert (=> b!1465173 m!1352339))

(push 1)

