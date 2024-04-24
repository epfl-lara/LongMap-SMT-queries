; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125058 () Bool)

(assert start!125058)

(declare-fun b!1450496 () Bool)

(declare-fun res!981140 () Bool)

(declare-fun e!816941 () Bool)

(assert (=> b!1450496 (=> (not res!981140) (not e!816941))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1450496 (= res!981140 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450497 () Bool)

(declare-fun res!981146 () Bool)

(declare-fun e!816933 () Bool)

(assert (=> b!1450497 (=> (not res!981146) (not e!816933))))

(declare-datatypes ((array!98401 0))(
  ( (array!98402 (arr!47485 (Array (_ BitVec 32) (_ BitVec 64))) (size!48036 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98401)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450497 (= res!981146 (validKeyInArray!0 (select (arr!47485 a!2862) j!93)))))

(declare-datatypes ((SeekEntryResult!11634 0))(
  ( (MissingZero!11634 (index!48928 (_ BitVec 32))) (Found!11634 (index!48929 (_ BitVec 32))) (Intermediate!11634 (undefined!12446 Bool) (index!48930 (_ BitVec 32)) (x!130771 (_ BitVec 32))) (Undefined!11634) (MissingVacant!11634 (index!48931 (_ BitVec 32))) )
))
(declare-fun lt!636281 () SeekEntryResult!11634)

(declare-fun lt!636278 () array!98401)

(declare-fun e!816934 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!636277 () (_ BitVec 64))

(declare-fun b!1450498 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98401 (_ BitVec 32)) SeekEntryResult!11634)

(assert (=> b!1450498 (= e!816934 (= lt!636281 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636277 lt!636278 mask!2687)))))

(declare-fun b!1450499 () Bool)

(declare-fun res!981149 () Bool)

(assert (=> b!1450499 (=> (not res!981149) (not e!816941))))

(assert (=> b!1450499 (= res!981149 e!816934)))

(declare-fun c!134197 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1450499 (= c!134197 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450500 () Bool)

(declare-fun e!816939 () Bool)

(assert (=> b!1450500 (= e!816941 (not e!816939))))

(declare-fun res!981153 () Bool)

(assert (=> b!1450500 (=> res!981153 e!816939)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1450500 (= res!981153 (or (and (= (select (arr!47485 a!2862) index!646) (select (store (arr!47485 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47485 a!2862) index!646) (select (arr!47485 a!2862) j!93))) (not (= (select (arr!47485 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47485 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816942 () Bool)

(assert (=> b!1450500 e!816942))

(declare-fun res!981144 () Bool)

(assert (=> b!1450500 (=> (not res!981144) (not e!816942))))

(declare-fun lt!636282 () SeekEntryResult!11634)

(assert (=> b!1450500 (= res!981144 (and (= lt!636282 (Found!11634 j!93)) (or (= (select (arr!47485 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47485 a!2862) intermediateBeforeIndex!19) (select (arr!47485 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98401 (_ BitVec 32)) SeekEntryResult!11634)

(assert (=> b!1450500 (= lt!636282 (seekEntryOrOpen!0 (select (arr!47485 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98401 (_ BitVec 32)) Bool)

(assert (=> b!1450500 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48797 0))(
  ( (Unit!48798) )
))
(declare-fun lt!636280 () Unit!48797)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48797)

(assert (=> b!1450500 (= lt!636280 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450501 () Bool)

(declare-fun res!981152 () Bool)

(assert (=> b!1450501 (=> (not res!981152) (not e!816933))))

(assert (=> b!1450501 (= res!981152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1450495 () Bool)

(declare-fun res!981155 () Bool)

(assert (=> b!1450495 (=> (not res!981155) (not e!816933))))

(assert (=> b!1450495 (= res!981155 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48036 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48036 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48036 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!981145 () Bool)

(assert (=> start!125058 (=> (not res!981145) (not e!816933))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125058 (= res!981145 (validMask!0 mask!2687))))

(assert (=> start!125058 e!816933))

(assert (=> start!125058 true))

(declare-fun array_inv!36766 (array!98401) Bool)

(assert (=> start!125058 (array_inv!36766 a!2862)))

(declare-fun b!1450502 () Bool)

(declare-fun res!981142 () Bool)

(declare-fun e!816938 () Bool)

(assert (=> b!1450502 (=> (not res!981142) (not e!816938))))

(declare-fun lt!636283 () SeekEntryResult!11634)

(assert (=> b!1450502 (= res!981142 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47485 a!2862) j!93) a!2862 mask!2687) lt!636283))))

(declare-fun b!1450503 () Bool)

(declare-fun e!816935 () Bool)

(assert (=> b!1450503 (= e!816935 e!816938)))

(declare-fun res!981139 () Bool)

(assert (=> b!1450503 (=> (not res!981139) (not e!816938))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450503 (= res!981139 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47485 a!2862) j!93) mask!2687) (select (arr!47485 a!2862) j!93) a!2862 mask!2687) lt!636283))))

(assert (=> b!1450503 (= lt!636283 (Intermediate!11634 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450504 () Bool)

(declare-fun e!816937 () Bool)

(assert (=> b!1450504 (= e!816942 e!816937)))

(declare-fun res!981154 () Bool)

(assert (=> b!1450504 (=> res!981154 e!816937)))

(assert (=> b!1450504 (= res!981154 (or (and (= (select (arr!47485 a!2862) index!646) (select (store (arr!47485 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47485 a!2862) index!646) (select (arr!47485 a!2862) j!93))) (not (= (select (arr!47485 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816940 () Bool)

(declare-fun b!1450505 () Bool)

(assert (=> b!1450505 (= e!816940 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450506 () Bool)

(declare-fun res!981148 () Bool)

(assert (=> b!1450506 (=> (not res!981148) (not e!816933))))

(declare-datatypes ((List!33973 0))(
  ( (Nil!33970) (Cons!33969 (h!35330 (_ BitVec 64)) (t!48659 List!33973)) )
))
(declare-fun arrayNoDuplicates!0 (array!98401 (_ BitVec 32) List!33973) Bool)

(assert (=> b!1450506 (= res!981148 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33970))))

(declare-fun b!1450507 () Bool)

(declare-fun res!981151 () Bool)

(assert (=> b!1450507 (=> (not res!981151) (not e!816933))))

(assert (=> b!1450507 (= res!981151 (validKeyInArray!0 (select (arr!47485 a!2862) i!1006)))))

(declare-fun b!1450508 () Bool)

(declare-fun res!981141 () Bool)

(assert (=> b!1450508 (=> (not res!981141) (not e!816933))))

(assert (=> b!1450508 (= res!981141 (and (= (size!48036 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48036 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48036 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450509 () Bool)

(assert (=> b!1450509 (= e!816938 e!816941)))

(declare-fun res!981147 () Bool)

(assert (=> b!1450509 (=> (not res!981147) (not e!816941))))

(assert (=> b!1450509 (= res!981147 (= lt!636281 (Intermediate!11634 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1450509 (= lt!636281 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636277 mask!2687) lt!636277 lt!636278 mask!2687))))

(assert (=> b!1450509 (= lt!636277 (select (store (arr!47485 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1450510 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98401 (_ BitVec 32)) SeekEntryResult!11634)

(assert (=> b!1450510 (= e!816934 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636277 lt!636278 mask!2687) (seekEntryOrOpen!0 lt!636277 lt!636278 mask!2687)))))

(declare-fun b!1450511 () Bool)

(assert (=> b!1450511 (= e!816937 e!816940)))

(declare-fun res!981150 () Bool)

(assert (=> b!1450511 (=> (not res!981150) (not e!816940))))

(assert (=> b!1450511 (= res!981150 (= lt!636282 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47485 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1450512 () Bool)

(assert (=> b!1450512 (= e!816939 true)))

(declare-fun lt!636279 () SeekEntryResult!11634)

(assert (=> b!1450512 (= lt!636279 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47485 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1450513 () Bool)

(assert (=> b!1450513 (= e!816933 e!816935)))

(declare-fun res!981143 () Bool)

(assert (=> b!1450513 (=> (not res!981143) (not e!816935))))

(assert (=> b!1450513 (= res!981143 (= (select (store (arr!47485 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1450513 (= lt!636278 (array!98402 (store (arr!47485 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48036 a!2862)))))

(assert (= (and start!125058 res!981145) b!1450508))

(assert (= (and b!1450508 res!981141) b!1450507))

(assert (= (and b!1450507 res!981151) b!1450497))

(assert (= (and b!1450497 res!981146) b!1450501))

(assert (= (and b!1450501 res!981152) b!1450506))

(assert (= (and b!1450506 res!981148) b!1450495))

(assert (= (and b!1450495 res!981155) b!1450513))

(assert (= (and b!1450513 res!981143) b!1450503))

(assert (= (and b!1450503 res!981139) b!1450502))

(assert (= (and b!1450502 res!981142) b!1450509))

(assert (= (and b!1450509 res!981147) b!1450499))

(assert (= (and b!1450499 c!134197) b!1450498))

(assert (= (and b!1450499 (not c!134197)) b!1450510))

(assert (= (and b!1450499 res!981149) b!1450496))

(assert (= (and b!1450496 res!981140) b!1450500))

(assert (= (and b!1450500 res!981144) b!1450504))

(assert (= (and b!1450504 (not res!981154)) b!1450511))

(assert (= (and b!1450511 res!981150) b!1450505))

(assert (= (and b!1450500 (not res!981153)) b!1450512))

(declare-fun m!1339333 () Bool)

(assert (=> b!1450497 m!1339333))

(assert (=> b!1450497 m!1339333))

(declare-fun m!1339335 () Bool)

(assert (=> b!1450497 m!1339335))

(declare-fun m!1339337 () Bool)

(assert (=> b!1450501 m!1339337))

(assert (=> b!1450503 m!1339333))

(assert (=> b!1450503 m!1339333))

(declare-fun m!1339339 () Bool)

(assert (=> b!1450503 m!1339339))

(assert (=> b!1450503 m!1339339))

(assert (=> b!1450503 m!1339333))

(declare-fun m!1339341 () Bool)

(assert (=> b!1450503 m!1339341))

(declare-fun m!1339343 () Bool)

(assert (=> b!1450509 m!1339343))

(assert (=> b!1450509 m!1339343))

(declare-fun m!1339345 () Bool)

(assert (=> b!1450509 m!1339345))

(declare-fun m!1339347 () Bool)

(assert (=> b!1450509 m!1339347))

(declare-fun m!1339349 () Bool)

(assert (=> b!1450509 m!1339349))

(assert (=> b!1450513 m!1339347))

(declare-fun m!1339351 () Bool)

(assert (=> b!1450513 m!1339351))

(declare-fun m!1339353 () Bool)

(assert (=> b!1450507 m!1339353))

(assert (=> b!1450507 m!1339353))

(declare-fun m!1339355 () Bool)

(assert (=> b!1450507 m!1339355))

(declare-fun m!1339357 () Bool)

(assert (=> b!1450504 m!1339357))

(assert (=> b!1450504 m!1339347))

(declare-fun m!1339359 () Bool)

(assert (=> b!1450504 m!1339359))

(assert (=> b!1450504 m!1339333))

(declare-fun m!1339361 () Bool)

(assert (=> b!1450498 m!1339361))

(declare-fun m!1339363 () Bool)

(assert (=> b!1450500 m!1339363))

(assert (=> b!1450500 m!1339347))

(declare-fun m!1339365 () Bool)

(assert (=> b!1450500 m!1339365))

(assert (=> b!1450500 m!1339359))

(assert (=> b!1450500 m!1339357))

(assert (=> b!1450500 m!1339333))

(declare-fun m!1339367 () Bool)

(assert (=> b!1450500 m!1339367))

(declare-fun m!1339369 () Bool)

(assert (=> b!1450500 m!1339369))

(assert (=> b!1450500 m!1339333))

(assert (=> b!1450512 m!1339333))

(assert (=> b!1450512 m!1339333))

(declare-fun m!1339371 () Bool)

(assert (=> b!1450512 m!1339371))

(declare-fun m!1339373 () Bool)

(assert (=> b!1450506 m!1339373))

(assert (=> b!1450502 m!1339333))

(assert (=> b!1450502 m!1339333))

(declare-fun m!1339375 () Bool)

(assert (=> b!1450502 m!1339375))

(assert (=> b!1450511 m!1339333))

(assert (=> b!1450511 m!1339333))

(declare-fun m!1339377 () Bool)

(assert (=> b!1450511 m!1339377))

(declare-fun m!1339379 () Bool)

(assert (=> b!1450510 m!1339379))

(declare-fun m!1339381 () Bool)

(assert (=> b!1450510 m!1339381))

(declare-fun m!1339383 () Bool)

(assert (=> start!125058 m!1339383))

(declare-fun m!1339385 () Bool)

(assert (=> start!125058 m!1339385))

(check-sat (not b!1450501) (not b!1450511) (not b!1450512) (not start!125058) (not b!1450510) (not b!1450502) (not b!1450507) (not b!1450498) (not b!1450503) (not b!1450500) (not b!1450497) (not b!1450506) (not b!1450509))
(check-sat)
