; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124698 () Bool)

(assert start!124698)

(declare-fun b!1445255 () Bool)

(declare-fun res!977156 () Bool)

(declare-fun e!814166 () Bool)

(assert (=> b!1445255 (=> (not res!977156) (not e!814166))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1445255 (= res!977156 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1445257 () Bool)

(declare-fun res!977163 () Bool)

(declare-fun e!814167 () Bool)

(assert (=> b!1445257 (=> (not res!977163) (not e!814167))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!98146 0))(
  ( (array!98147 (arr!47361 (Array (_ BitVec 32) (_ BitVec 64))) (size!47911 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98146)

(assert (=> b!1445257 (= res!977163 (and (= (size!47911 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47911 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47911 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1445258 () Bool)

(declare-fun res!977160 () Bool)

(assert (=> b!1445258 (=> (not res!977160) (not e!814167))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1445258 (= res!977160 (validKeyInArray!0 (select (arr!47361 a!2862) i!1006)))))

(declare-fun b!1445259 () Bool)

(declare-fun e!814171 () Bool)

(declare-fun e!814168 () Bool)

(assert (=> b!1445259 (= e!814171 e!814168)))

(declare-fun res!977157 () Bool)

(assert (=> b!1445259 (=> (not res!977157) (not e!814168))))

(declare-datatypes ((SeekEntryResult!11613 0))(
  ( (MissingZero!11613 (index!48844 (_ BitVec 32))) (Found!11613 (index!48845 (_ BitVec 32))) (Intermediate!11613 (undefined!12425 Bool) (index!48846 (_ BitVec 32)) (x!130534 (_ BitVec 32))) (Undefined!11613) (MissingVacant!11613 (index!48847 (_ BitVec 32))) )
))
(declare-fun lt!634445 () SeekEntryResult!11613)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98146 (_ BitVec 32)) SeekEntryResult!11613)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445259 (= res!977157 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47361 a!2862) j!93) mask!2687) (select (arr!47361 a!2862) j!93) a!2862 mask!2687) lt!634445))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1445259 (= lt!634445 (Intermediate!11613 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1445260 () Bool)

(assert (=> b!1445260 (= e!814168 e!814166)))

(declare-fun res!977151 () Bool)

(assert (=> b!1445260 (=> (not res!977151) (not e!814166))))

(declare-fun lt!634444 () SeekEntryResult!11613)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1445260 (= res!977151 (= lt!634444 (Intermediate!11613 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634443 () (_ BitVec 64))

(declare-fun lt!634446 () array!98146)

(assert (=> b!1445260 (= lt!634444 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634443 mask!2687) lt!634443 lt!634446 mask!2687))))

(assert (=> b!1445260 (= lt!634443 (select (store (arr!47361 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1445261 () Bool)

(declare-fun res!977164 () Bool)

(assert (=> b!1445261 (=> (not res!977164) (not e!814166))))

(declare-fun e!814172 () Bool)

(assert (=> b!1445261 (= res!977164 e!814172)))

(declare-fun c!133563 () Bool)

(assert (=> b!1445261 (= c!133563 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1445262 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1445262 (= e!814172 (= lt!634444 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634443 lt!634446 mask!2687)))))

(declare-fun b!1445263 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98146 (_ BitVec 32)) SeekEntryResult!11613)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98146 (_ BitVec 32)) SeekEntryResult!11613)

(assert (=> b!1445263 (= e!814172 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634443 lt!634446 mask!2687) (seekEntryOrOpen!0 lt!634443 lt!634446 mask!2687)))))

(declare-fun res!977150 () Bool)

(assert (=> start!124698 (=> (not res!977150) (not e!814167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124698 (= res!977150 (validMask!0 mask!2687))))

(assert (=> start!124698 e!814167))

(assert (=> start!124698 true))

(declare-fun array_inv!36389 (array!98146) Bool)

(assert (=> start!124698 (array_inv!36389 a!2862)))

(declare-fun b!1445256 () Bool)

(declare-fun res!977153 () Bool)

(assert (=> b!1445256 (=> (not res!977153) (not e!814167))))

(declare-datatypes ((List!33862 0))(
  ( (Nil!33859) (Cons!33858 (h!35208 (_ BitVec 64)) (t!48556 List!33862)) )
))
(declare-fun arrayNoDuplicates!0 (array!98146 (_ BitVec 32) List!33862) Bool)

(assert (=> b!1445256 (= res!977153 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33859))))

(declare-fun b!1445264 () Bool)

(declare-fun res!977152 () Bool)

(assert (=> b!1445264 (=> (not res!977152) (not e!814167))))

(assert (=> b!1445264 (= res!977152 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47911 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47911 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47911 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1445265 () Bool)

(declare-fun res!977162 () Bool)

(assert (=> b!1445265 (=> (not res!977162) (not e!814167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98146 (_ BitVec 32)) Bool)

(assert (=> b!1445265 (= res!977162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1445266 () Bool)

(declare-fun res!977154 () Bool)

(assert (=> b!1445266 (=> (not res!977154) (not e!814167))))

(assert (=> b!1445266 (= res!977154 (validKeyInArray!0 (select (arr!47361 a!2862) j!93)))))

(declare-fun b!1445267 () Bool)

(assert (=> b!1445267 (= e!814166 (not true))))

(declare-fun e!814169 () Bool)

(assert (=> b!1445267 e!814169))

(declare-fun res!977158 () Bool)

(assert (=> b!1445267 (=> (not res!977158) (not e!814169))))

(assert (=> b!1445267 (= res!977158 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48722 0))(
  ( (Unit!48723) )
))
(declare-fun lt!634442 () Unit!48722)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98146 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48722)

(assert (=> b!1445267 (= lt!634442 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1445268 () Bool)

(declare-fun res!977159 () Bool)

(assert (=> b!1445268 (=> (not res!977159) (not e!814168))))

(assert (=> b!1445268 (= res!977159 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47361 a!2862) j!93) a!2862 mask!2687) lt!634445))))

(declare-fun b!1445269 () Bool)

(assert (=> b!1445269 (= e!814169 (or (= (select (arr!47361 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47361 a!2862) intermediateBeforeIndex!19) (select (arr!47361 a!2862) j!93))))))

(declare-fun b!1445270 () Bool)

(assert (=> b!1445270 (= e!814167 e!814171)))

(declare-fun res!977155 () Bool)

(assert (=> b!1445270 (=> (not res!977155) (not e!814171))))

(assert (=> b!1445270 (= res!977155 (= (select (store (arr!47361 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1445270 (= lt!634446 (array!98147 (store (arr!47361 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47911 a!2862)))))

(declare-fun b!1445271 () Bool)

(declare-fun res!977161 () Bool)

(assert (=> b!1445271 (=> (not res!977161) (not e!814169))))

(assert (=> b!1445271 (= res!977161 (= (seekEntryOrOpen!0 (select (arr!47361 a!2862) j!93) a!2862 mask!2687) (Found!11613 j!93)))))

(assert (= (and start!124698 res!977150) b!1445257))

(assert (= (and b!1445257 res!977163) b!1445258))

(assert (= (and b!1445258 res!977160) b!1445266))

(assert (= (and b!1445266 res!977154) b!1445265))

(assert (= (and b!1445265 res!977162) b!1445256))

(assert (= (and b!1445256 res!977153) b!1445264))

(assert (= (and b!1445264 res!977152) b!1445270))

(assert (= (and b!1445270 res!977155) b!1445259))

(assert (= (and b!1445259 res!977157) b!1445268))

(assert (= (and b!1445268 res!977159) b!1445260))

(assert (= (and b!1445260 res!977151) b!1445261))

(assert (= (and b!1445261 c!133563) b!1445262))

(assert (= (and b!1445261 (not c!133563)) b!1445263))

(assert (= (and b!1445261 res!977164) b!1445255))

(assert (= (and b!1445255 res!977156) b!1445267))

(assert (= (and b!1445267 res!977158) b!1445271))

(assert (= (and b!1445271 res!977161) b!1445269))

(declare-fun m!1334219 () Bool)

(assert (=> b!1445267 m!1334219))

(declare-fun m!1334221 () Bool)

(assert (=> b!1445267 m!1334221))

(declare-fun m!1334223 () Bool)

(assert (=> start!124698 m!1334223))

(declare-fun m!1334225 () Bool)

(assert (=> start!124698 m!1334225))

(declare-fun m!1334227 () Bool)

(assert (=> b!1445268 m!1334227))

(assert (=> b!1445268 m!1334227))

(declare-fun m!1334229 () Bool)

(assert (=> b!1445268 m!1334229))

(assert (=> b!1445271 m!1334227))

(assert (=> b!1445271 m!1334227))

(declare-fun m!1334231 () Bool)

(assert (=> b!1445271 m!1334231))

(declare-fun m!1334233 () Bool)

(assert (=> b!1445258 m!1334233))

(assert (=> b!1445258 m!1334233))

(declare-fun m!1334235 () Bool)

(assert (=> b!1445258 m!1334235))

(declare-fun m!1334237 () Bool)

(assert (=> b!1445270 m!1334237))

(declare-fun m!1334239 () Bool)

(assert (=> b!1445270 m!1334239))

(declare-fun m!1334241 () Bool)

(assert (=> b!1445263 m!1334241))

(declare-fun m!1334243 () Bool)

(assert (=> b!1445263 m!1334243))

(assert (=> b!1445259 m!1334227))

(assert (=> b!1445259 m!1334227))

(declare-fun m!1334245 () Bool)

(assert (=> b!1445259 m!1334245))

(assert (=> b!1445259 m!1334245))

(assert (=> b!1445259 m!1334227))

(declare-fun m!1334247 () Bool)

(assert (=> b!1445259 m!1334247))

(declare-fun m!1334249 () Bool)

(assert (=> b!1445256 m!1334249))

(declare-fun m!1334251 () Bool)

(assert (=> b!1445265 m!1334251))

(assert (=> b!1445266 m!1334227))

(assert (=> b!1445266 m!1334227))

(declare-fun m!1334253 () Bool)

(assert (=> b!1445266 m!1334253))

(declare-fun m!1334255 () Bool)

(assert (=> b!1445260 m!1334255))

(assert (=> b!1445260 m!1334255))

(declare-fun m!1334257 () Bool)

(assert (=> b!1445260 m!1334257))

(assert (=> b!1445260 m!1334237))

(declare-fun m!1334259 () Bool)

(assert (=> b!1445260 m!1334259))

(declare-fun m!1334261 () Bool)

(assert (=> b!1445269 m!1334261))

(assert (=> b!1445269 m!1334227))

(declare-fun m!1334263 () Bool)

(assert (=> b!1445262 m!1334263))

(check-sat (not b!1445262) (not b!1445259) (not b!1445271) (not b!1445267) (not b!1445260) (not b!1445265) (not b!1445266) (not b!1445268) (not b!1445263) (not start!124698) (not b!1445256) (not b!1445258))
(check-sat)
