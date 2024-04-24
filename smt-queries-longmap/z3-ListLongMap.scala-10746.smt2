; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125952 () Bool)

(assert start!125952)

(declare-fun b!1472248 () Bool)

(declare-fun res!999277 () Bool)

(declare-fun e!826552 () Bool)

(assert (=> b!1472248 (=> (not res!999277) (not e!826552))))

(declare-datatypes ((array!99181 0))(
  ( (array!99182 (arr!47872 (Array (_ BitVec 32) (_ BitVec 64))) (size!48423 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99181)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99181 (_ BitVec 32)) Bool)

(assert (=> b!1472248 (= res!999277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!643593 () (_ BitVec 64))

(declare-fun lt!643594 () array!99181)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1472250 () Bool)

(declare-fun e!826550 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12009 0))(
  ( (MissingZero!12009 (index!50428 (_ BitVec 32))) (Found!12009 (index!50429 (_ BitVec 32))) (Intermediate!12009 (undefined!12821 Bool) (index!50430 (_ BitVec 32)) (x!132196 (_ BitVec 32))) (Undefined!12009) (MissingVacant!12009 (index!50431 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99181 (_ BitVec 32)) SeekEntryResult!12009)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99181 (_ BitVec 32)) SeekEntryResult!12009)

(assert (=> b!1472250 (= e!826550 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643593 lt!643594 mask!2687) (seekEntryOrOpen!0 lt!643593 lt!643594 mask!2687)))))

(declare-fun b!1472251 () Bool)

(declare-fun lt!643597 () SeekEntryResult!12009)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99181 (_ BitVec 32)) SeekEntryResult!12009)

(assert (=> b!1472251 (= e!826550 (= lt!643597 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643593 lt!643594 mask!2687)))))

(declare-fun b!1472252 () Bool)

(declare-fun res!999273 () Bool)

(declare-fun e!826551 () Bool)

(assert (=> b!1472252 (=> (not res!999273) (not e!826551))))

(assert (=> b!1472252 (= res!999273 e!826550)))

(declare-fun c!136012 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1472252 (= c!136012 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472253 () Bool)

(declare-fun e!826554 () Bool)

(assert (=> b!1472253 (= e!826554 e!826551)))

(declare-fun res!999279 () Bool)

(assert (=> b!1472253 (=> (not res!999279) (not e!826551))))

(assert (=> b!1472253 (= res!999279 (= lt!643597 (Intermediate!12009 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472253 (= lt!643597 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643593 mask!2687) lt!643593 lt!643594 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1472253 (= lt!643593 (select (store (arr!47872 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472254 () Bool)

(declare-fun res!999270 () Bool)

(assert (=> b!1472254 (=> (not res!999270) (not e!826552))))

(declare-datatypes ((List!34360 0))(
  ( (Nil!34357) (Cons!34356 (h!35723 (_ BitVec 64)) (t!49046 List!34360)) )
))
(declare-fun arrayNoDuplicates!0 (array!99181 (_ BitVec 32) List!34360) Bool)

(assert (=> b!1472254 (= res!999270 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34357))))

(declare-fun b!1472255 () Bool)

(assert (=> b!1472255 (= e!826551 (not true))))

(declare-fun e!826553 () Bool)

(assert (=> b!1472255 e!826553))

(declare-fun res!999281 () Bool)

(assert (=> b!1472255 (=> (not res!999281) (not e!826553))))

(assert (=> b!1472255 (= res!999281 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49391 0))(
  ( (Unit!49392) )
))
(declare-fun lt!643596 () Unit!49391)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99181 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49391)

(assert (=> b!1472255 (= lt!643596 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472256 () Bool)

(assert (=> b!1472256 (= e!826553 (= (seekEntryOrOpen!0 (select (arr!47872 a!2862) j!93) a!2862 mask!2687) (Found!12009 j!93)))))

(declare-fun b!1472257 () Bool)

(declare-fun res!999276 () Bool)

(assert (=> b!1472257 (=> (not res!999276) (not e!826552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472257 (= res!999276 (validKeyInArray!0 (select (arr!47872 a!2862) i!1006)))))

(declare-fun b!1472258 () Bool)

(declare-fun res!999274 () Bool)

(assert (=> b!1472258 (=> (not res!999274) (not e!826552))))

(assert (=> b!1472258 (= res!999274 (and (= (size!48423 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48423 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48423 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472259 () Bool)

(declare-fun res!999278 () Bool)

(assert (=> b!1472259 (=> (not res!999278) (not e!826554))))

(declare-fun lt!643595 () SeekEntryResult!12009)

(assert (=> b!1472259 (= res!999278 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47872 a!2862) j!93) a!2862 mask!2687) lt!643595))))

(declare-fun b!1472260 () Bool)

(declare-fun e!826548 () Bool)

(assert (=> b!1472260 (= e!826552 e!826548)))

(declare-fun res!999275 () Bool)

(assert (=> b!1472260 (=> (not res!999275) (not e!826548))))

(assert (=> b!1472260 (= res!999275 (= (select (store (arr!47872 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472260 (= lt!643594 (array!99182 (store (arr!47872 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48423 a!2862)))))

(declare-fun b!1472261 () Bool)

(declare-fun res!999268 () Bool)

(assert (=> b!1472261 (=> (not res!999268) (not e!826552))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1472261 (= res!999268 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48423 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48423 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48423 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1472249 () Bool)

(declare-fun res!999271 () Bool)

(assert (=> b!1472249 (=> (not res!999271) (not e!826551))))

(assert (=> b!1472249 (= res!999271 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!999272 () Bool)

(assert (=> start!125952 (=> (not res!999272) (not e!826552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125952 (= res!999272 (validMask!0 mask!2687))))

(assert (=> start!125952 e!826552))

(assert (=> start!125952 true))

(declare-fun array_inv!37153 (array!99181) Bool)

(assert (=> start!125952 (array_inv!37153 a!2862)))

(declare-fun b!1472262 () Bool)

(assert (=> b!1472262 (= e!826548 e!826554)))

(declare-fun res!999280 () Bool)

(assert (=> b!1472262 (=> (not res!999280) (not e!826554))))

(assert (=> b!1472262 (= res!999280 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47872 a!2862) j!93) mask!2687) (select (arr!47872 a!2862) j!93) a!2862 mask!2687) lt!643595))))

(assert (=> b!1472262 (= lt!643595 (Intermediate!12009 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472263 () Bool)

(declare-fun res!999269 () Bool)

(assert (=> b!1472263 (=> (not res!999269) (not e!826552))))

(assert (=> b!1472263 (= res!999269 (validKeyInArray!0 (select (arr!47872 a!2862) j!93)))))

(assert (= (and start!125952 res!999272) b!1472258))

(assert (= (and b!1472258 res!999274) b!1472257))

(assert (= (and b!1472257 res!999276) b!1472263))

(assert (= (and b!1472263 res!999269) b!1472248))

(assert (= (and b!1472248 res!999277) b!1472254))

(assert (= (and b!1472254 res!999270) b!1472261))

(assert (= (and b!1472261 res!999268) b!1472260))

(assert (= (and b!1472260 res!999275) b!1472262))

(assert (= (and b!1472262 res!999280) b!1472259))

(assert (= (and b!1472259 res!999278) b!1472253))

(assert (= (and b!1472253 res!999279) b!1472252))

(assert (= (and b!1472252 c!136012) b!1472251))

(assert (= (and b!1472252 (not c!136012)) b!1472250))

(assert (= (and b!1472252 res!999273) b!1472249))

(assert (= (and b!1472249 res!999271) b!1472255))

(assert (= (and b!1472255 res!999281) b!1472256))

(declare-fun m!1359217 () Bool)

(assert (=> b!1472260 m!1359217))

(declare-fun m!1359219 () Bool)

(assert (=> b!1472260 m!1359219))

(declare-fun m!1359221 () Bool)

(assert (=> b!1472253 m!1359221))

(assert (=> b!1472253 m!1359221))

(declare-fun m!1359223 () Bool)

(assert (=> b!1472253 m!1359223))

(assert (=> b!1472253 m!1359217))

(declare-fun m!1359225 () Bool)

(assert (=> b!1472253 m!1359225))

(declare-fun m!1359227 () Bool)

(assert (=> start!125952 m!1359227))

(declare-fun m!1359229 () Bool)

(assert (=> start!125952 m!1359229))

(declare-fun m!1359231 () Bool)

(assert (=> b!1472250 m!1359231))

(declare-fun m!1359233 () Bool)

(assert (=> b!1472250 m!1359233))

(declare-fun m!1359235 () Bool)

(assert (=> b!1472262 m!1359235))

(assert (=> b!1472262 m!1359235))

(declare-fun m!1359237 () Bool)

(assert (=> b!1472262 m!1359237))

(assert (=> b!1472262 m!1359237))

(assert (=> b!1472262 m!1359235))

(declare-fun m!1359239 () Bool)

(assert (=> b!1472262 m!1359239))

(assert (=> b!1472256 m!1359235))

(assert (=> b!1472256 m!1359235))

(declare-fun m!1359241 () Bool)

(assert (=> b!1472256 m!1359241))

(assert (=> b!1472263 m!1359235))

(assert (=> b!1472263 m!1359235))

(declare-fun m!1359243 () Bool)

(assert (=> b!1472263 m!1359243))

(declare-fun m!1359245 () Bool)

(assert (=> b!1472255 m!1359245))

(declare-fun m!1359247 () Bool)

(assert (=> b!1472255 m!1359247))

(declare-fun m!1359249 () Bool)

(assert (=> b!1472251 m!1359249))

(declare-fun m!1359251 () Bool)

(assert (=> b!1472257 m!1359251))

(assert (=> b!1472257 m!1359251))

(declare-fun m!1359253 () Bool)

(assert (=> b!1472257 m!1359253))

(declare-fun m!1359255 () Bool)

(assert (=> b!1472248 m!1359255))

(assert (=> b!1472259 m!1359235))

(assert (=> b!1472259 m!1359235))

(declare-fun m!1359257 () Bool)

(assert (=> b!1472259 m!1359257))

(declare-fun m!1359259 () Bool)

(assert (=> b!1472254 m!1359259))

(check-sat (not b!1472257) (not start!125952) (not b!1472263) (not b!1472255) (not b!1472262) (not b!1472250) (not b!1472254) (not b!1472253) (not b!1472259) (not b!1472248) (not b!1472256) (not b!1472251))
(check-sat)
