; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124522 () Bool)

(assert start!124522)

(declare-fun b!1441342 () Bool)

(declare-fun e!812501 () Bool)

(declare-fun e!812497 () Bool)

(assert (=> b!1441342 (= e!812501 e!812497)))

(declare-fun res!973793 () Bool)

(assert (=> b!1441342 (=> (not res!973793) (not e!812497))))

(declare-datatypes ((SeekEntryResult!11540 0))(
  ( (MissingZero!11540 (index!48552 (_ BitVec 32))) (Found!11540 (index!48553 (_ BitVec 32))) (Intermediate!11540 (undefined!12352 Bool) (index!48554 (_ BitVec 32)) (x!130264 (_ BitVec 32))) (Undefined!11540) (MissingVacant!11540 (index!48555 (_ BitVec 32))) )
))
(declare-fun lt!633044 () SeekEntryResult!11540)

(declare-datatypes ((array!97948 0))(
  ( (array!97949 (arr!47263 (Array (_ BitVec 32) (_ BitVec 64))) (size!47815 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97948)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97948 (_ BitVec 32)) SeekEntryResult!11540)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441342 (= res!973793 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47263 a!2862) j!93) mask!2687) (select (arr!47263 a!2862) j!93) a!2862 mask!2687) lt!633044))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441342 (= lt!633044 (Intermediate!11540 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441343 () Bool)

(declare-fun res!973797 () Bool)

(declare-fun e!812499 () Bool)

(assert (=> b!1441343 (=> (not res!973797) (not e!812499))))

(declare-datatypes ((List!33842 0))(
  ( (Nil!33839) (Cons!33838 (h!35188 (_ BitVec 64)) (t!48528 List!33842)) )
))
(declare-fun arrayNoDuplicates!0 (array!97948 (_ BitVec 32) List!33842) Bool)

(assert (=> b!1441343 (= res!973797 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33839))))

(declare-fun res!973792 () Bool)

(assert (=> start!124522 (=> (not res!973792) (not e!812499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124522 (= res!973792 (validMask!0 mask!2687))))

(assert (=> start!124522 e!812499))

(assert (=> start!124522 true))

(declare-fun array_inv!36496 (array!97948) Bool)

(assert (=> start!124522 (array_inv!36496 a!2862)))

(declare-fun b!1441344 () Bool)

(declare-fun res!973804 () Bool)

(declare-fun e!812500 () Bool)

(assert (=> b!1441344 (=> (not res!973804) (not e!812500))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441344 (= res!973804 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1441345 () Bool)

(declare-fun res!973803 () Bool)

(assert (=> b!1441345 (=> (not res!973803) (not e!812497))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1441345 (= res!973803 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47263 a!2862) j!93) a!2862 mask!2687) lt!633044))))

(declare-fun b!1441346 () Bool)

(declare-fun res!973795 () Bool)

(assert (=> b!1441346 (=> (not res!973795) (not e!812499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441346 (= res!973795 (validKeyInArray!0 (select (arr!47263 a!2862) j!93)))))

(declare-fun b!1441347 () Bool)

(declare-fun res!973794 () Bool)

(assert (=> b!1441347 (=> (not res!973794) (not e!812499))))

(assert (=> b!1441347 (= res!973794 (validKeyInArray!0 (select (arr!47263 a!2862) i!1006)))))

(declare-fun b!1441348 () Bool)

(assert (=> b!1441348 (= e!812497 e!812500)))

(declare-fun res!973799 () Bool)

(assert (=> b!1441348 (=> (not res!973799) (not e!812500))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!633045 () SeekEntryResult!11540)

(assert (=> b!1441348 (= res!973799 (= lt!633045 (Intermediate!11540 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633043 () (_ BitVec 64))

(declare-fun lt!633042 () array!97948)

(assert (=> b!1441348 (= lt!633045 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633043 mask!2687) lt!633043 lt!633042 mask!2687))))

(assert (=> b!1441348 (= lt!633043 (select (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441349 () Bool)

(declare-fun res!973798 () Bool)

(assert (=> b!1441349 (=> (not res!973798) (not e!812499))))

(assert (=> b!1441349 (= res!973798 (and (= (size!47815 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47815 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47815 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441350 () Bool)

(assert (=> b!1441350 (= e!812500 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97948 (_ BitVec 32)) Bool)

(assert (=> b!1441350 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48417 0))(
  ( (Unit!48418) )
))
(declare-fun lt!633041 () Unit!48417)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97948 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48417)

(assert (=> b!1441350 (= lt!633041 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1441351 () Bool)

(declare-fun e!812498 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97948 (_ BitVec 32)) SeekEntryResult!11540)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97948 (_ BitVec 32)) SeekEntryResult!11540)

(assert (=> b!1441351 (= e!812498 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633043 lt!633042 mask!2687) (seekEntryOrOpen!0 lt!633043 lt!633042 mask!2687)))))

(declare-fun b!1441352 () Bool)

(declare-fun res!973800 () Bool)

(assert (=> b!1441352 (=> (not res!973800) (not e!812500))))

(assert (=> b!1441352 (= res!973800 e!812498)))

(declare-fun c!133288 () Bool)

(assert (=> b!1441352 (= c!133288 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441353 () Bool)

(declare-fun res!973796 () Bool)

(assert (=> b!1441353 (=> (not res!973796) (not e!812499))))

(assert (=> b!1441353 (= res!973796 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47815 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47815 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47815 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1441354 () Bool)

(assert (=> b!1441354 (= e!812499 e!812501)))

(declare-fun res!973801 () Bool)

(assert (=> b!1441354 (=> (not res!973801) (not e!812501))))

(assert (=> b!1441354 (= res!973801 (= (select (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441354 (= lt!633042 (array!97949 (store (arr!47263 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47815 a!2862)))))

(declare-fun b!1441355 () Bool)

(assert (=> b!1441355 (= e!812498 (= lt!633045 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633043 lt!633042 mask!2687)))))

(declare-fun b!1441356 () Bool)

(declare-fun res!973802 () Bool)

(assert (=> b!1441356 (=> (not res!973802) (not e!812499))))

(assert (=> b!1441356 (= res!973802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124522 res!973792) b!1441349))

(assert (= (and b!1441349 res!973798) b!1441347))

(assert (= (and b!1441347 res!973794) b!1441346))

(assert (= (and b!1441346 res!973795) b!1441356))

(assert (= (and b!1441356 res!973802) b!1441343))

(assert (= (and b!1441343 res!973797) b!1441353))

(assert (= (and b!1441353 res!973796) b!1441354))

(assert (= (and b!1441354 res!973801) b!1441342))

(assert (= (and b!1441342 res!973793) b!1441345))

(assert (= (and b!1441345 res!973803) b!1441348))

(assert (= (and b!1441348 res!973799) b!1441352))

(assert (= (and b!1441352 c!133288) b!1441355))

(assert (= (and b!1441352 (not c!133288)) b!1441351))

(assert (= (and b!1441352 res!973800) b!1441344))

(assert (= (and b!1441344 res!973804) b!1441350))

(declare-fun m!1330077 () Bool)

(assert (=> b!1441345 m!1330077))

(assert (=> b!1441345 m!1330077))

(declare-fun m!1330079 () Bool)

(assert (=> b!1441345 m!1330079))

(declare-fun m!1330081 () Bool)

(assert (=> b!1441356 m!1330081))

(declare-fun m!1330083 () Bool)

(assert (=> b!1441354 m!1330083))

(declare-fun m!1330085 () Bool)

(assert (=> b!1441354 m!1330085))

(declare-fun m!1330087 () Bool)

(assert (=> b!1441343 m!1330087))

(declare-fun m!1330089 () Bool)

(assert (=> b!1441347 m!1330089))

(assert (=> b!1441347 m!1330089))

(declare-fun m!1330091 () Bool)

(assert (=> b!1441347 m!1330091))

(assert (=> b!1441342 m!1330077))

(assert (=> b!1441342 m!1330077))

(declare-fun m!1330093 () Bool)

(assert (=> b!1441342 m!1330093))

(assert (=> b!1441342 m!1330093))

(assert (=> b!1441342 m!1330077))

(declare-fun m!1330095 () Bool)

(assert (=> b!1441342 m!1330095))

(declare-fun m!1330097 () Bool)

(assert (=> b!1441355 m!1330097))

(declare-fun m!1330099 () Bool)

(assert (=> b!1441348 m!1330099))

(assert (=> b!1441348 m!1330099))

(declare-fun m!1330101 () Bool)

(assert (=> b!1441348 m!1330101))

(assert (=> b!1441348 m!1330083))

(declare-fun m!1330103 () Bool)

(assert (=> b!1441348 m!1330103))

(declare-fun m!1330105 () Bool)

(assert (=> start!124522 m!1330105))

(declare-fun m!1330107 () Bool)

(assert (=> start!124522 m!1330107))

(declare-fun m!1330109 () Bool)

(assert (=> b!1441350 m!1330109))

(declare-fun m!1330111 () Bool)

(assert (=> b!1441350 m!1330111))

(assert (=> b!1441346 m!1330077))

(assert (=> b!1441346 m!1330077))

(declare-fun m!1330113 () Bool)

(assert (=> b!1441346 m!1330113))

(declare-fun m!1330115 () Bool)

(assert (=> b!1441351 m!1330115))

(declare-fun m!1330117 () Bool)

(assert (=> b!1441351 m!1330117))

(check-sat (not b!1441348) (not b!1441343) (not b!1441356) (not b!1441351) (not b!1441345) (not b!1441342) (not b!1441347) (not start!124522) (not b!1441346) (not b!1441355) (not b!1441350))
(check-sat)
