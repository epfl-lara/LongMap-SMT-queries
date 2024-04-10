; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124532 () Bool)

(assert start!124532)

(declare-fun b!1441143 () Bool)

(declare-fun res!973544 () Bool)

(declare-fun e!812433 () Bool)

(assert (=> b!1441143 (=> (not res!973544) (not e!812433))))

(declare-datatypes ((array!97980 0))(
  ( (array!97981 (arr!47278 (Array (_ BitVec 32) (_ BitVec 64))) (size!47828 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97980)

(declare-datatypes ((List!33779 0))(
  ( (Nil!33776) (Cons!33775 (h!35125 (_ BitVec 64)) (t!48473 List!33779)) )
))
(declare-fun arrayNoDuplicates!0 (array!97980 (_ BitVec 32) List!33779) Bool)

(assert (=> b!1441143 (= res!973544 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33776))))

(declare-fun b!1441145 () Bool)

(declare-fun res!973538 () Bool)

(assert (=> b!1441145 (=> (not res!973538) (not e!812433))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441145 (= res!973538 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47828 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47828 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47828 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1441146 () Bool)

(declare-fun res!973537 () Bool)

(assert (=> b!1441146 (=> (not res!973537) (not e!812433))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1441146 (= res!973537 (and (= (size!47828 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47828 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47828 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441147 () Bool)

(declare-fun e!812438 () Bool)

(assert (=> b!1441147 (= e!812438 false)))

(declare-fun lt!633127 () Bool)

(declare-fun e!812434 () Bool)

(assert (=> b!1441147 (= lt!633127 e!812434)))

(declare-fun c!133314 () Bool)

(assert (=> b!1441147 (= c!133314 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441148 () Bool)

(declare-fun res!973542 () Bool)

(assert (=> b!1441148 (=> (not res!973542) (not e!812433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97980 (_ BitVec 32)) Bool)

(assert (=> b!1441148 (= res!973542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441149 () Bool)

(declare-fun lt!633128 () array!97980)

(declare-fun lt!633125 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11530 0))(
  ( (MissingZero!11530 (index!48512 (_ BitVec 32))) (Found!11530 (index!48513 (_ BitVec 32))) (Intermediate!11530 (undefined!12342 Bool) (index!48514 (_ BitVec 32)) (x!130227 (_ BitVec 32))) (Undefined!11530) (MissingVacant!11530 (index!48515 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97980 (_ BitVec 32)) SeekEntryResult!11530)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97980 (_ BitVec 32)) SeekEntryResult!11530)

(assert (=> b!1441149 (= e!812434 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633125 lt!633128 mask!2687) (seekEntryOrOpen!0 lt!633125 lt!633128 mask!2687))))))

(declare-fun b!1441150 () Bool)

(declare-fun res!973543 () Bool)

(assert (=> b!1441150 (=> (not res!973543) (not e!812433))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441150 (= res!973543 (validKeyInArray!0 (select (arr!47278 a!2862) i!1006)))))

(declare-fun b!1441151 () Bool)

(declare-fun res!973539 () Bool)

(assert (=> b!1441151 (=> (not res!973539) (not e!812433))))

(assert (=> b!1441151 (= res!973539 (validKeyInArray!0 (select (arr!47278 a!2862) j!93)))))

(declare-fun b!1441152 () Bool)

(declare-fun res!973540 () Bool)

(declare-fun e!812436 () Bool)

(assert (=> b!1441152 (=> (not res!973540) (not e!812436))))

(declare-fun lt!633126 () SeekEntryResult!11530)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97980 (_ BitVec 32)) SeekEntryResult!11530)

(assert (=> b!1441152 (= res!973540 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47278 a!2862) j!93) a!2862 mask!2687) lt!633126))))

(declare-fun res!973536 () Bool)

(assert (=> start!124532 (=> (not res!973536) (not e!812433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124532 (= res!973536 (validMask!0 mask!2687))))

(assert (=> start!124532 e!812433))

(assert (=> start!124532 true))

(declare-fun array_inv!36306 (array!97980) Bool)

(assert (=> start!124532 (array_inv!36306 a!2862)))

(declare-fun b!1441144 () Bool)

(assert (=> b!1441144 (= e!812436 e!812438)))

(declare-fun res!973546 () Bool)

(assert (=> b!1441144 (=> (not res!973546) (not e!812438))))

(declare-fun lt!633129 () SeekEntryResult!11530)

(assert (=> b!1441144 (= res!973546 (= lt!633129 (Intermediate!11530 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441144 (= lt!633129 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633125 mask!2687) lt!633125 lt!633128 mask!2687))))

(assert (=> b!1441144 (= lt!633125 (select (store (arr!47278 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441153 () Bool)

(declare-fun e!812435 () Bool)

(assert (=> b!1441153 (= e!812433 e!812435)))

(declare-fun res!973545 () Bool)

(assert (=> b!1441153 (=> (not res!973545) (not e!812435))))

(assert (=> b!1441153 (= res!973545 (= (select (store (arr!47278 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441153 (= lt!633128 (array!97981 (store (arr!47278 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47828 a!2862)))))

(declare-fun b!1441154 () Bool)

(assert (=> b!1441154 (= e!812435 e!812436)))

(declare-fun res!973541 () Bool)

(assert (=> b!1441154 (=> (not res!973541) (not e!812436))))

(assert (=> b!1441154 (= res!973541 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47278 a!2862) j!93) mask!2687) (select (arr!47278 a!2862) j!93) a!2862 mask!2687) lt!633126))))

(assert (=> b!1441154 (= lt!633126 (Intermediate!11530 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441155 () Bool)

(assert (=> b!1441155 (= e!812434 (not (= lt!633129 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633125 lt!633128 mask!2687))))))

(assert (= (and start!124532 res!973536) b!1441146))

(assert (= (and b!1441146 res!973537) b!1441150))

(assert (= (and b!1441150 res!973543) b!1441151))

(assert (= (and b!1441151 res!973539) b!1441148))

(assert (= (and b!1441148 res!973542) b!1441143))

(assert (= (and b!1441143 res!973544) b!1441145))

(assert (= (and b!1441145 res!973538) b!1441153))

(assert (= (and b!1441153 res!973545) b!1441154))

(assert (= (and b!1441154 res!973541) b!1441152))

(assert (= (and b!1441152 res!973540) b!1441144))

(assert (= (and b!1441144 res!973546) b!1441147))

(assert (= (and b!1441147 c!133314) b!1441155))

(assert (= (and b!1441147 (not c!133314)) b!1441149))

(declare-fun m!1330373 () Bool)

(assert (=> b!1441151 m!1330373))

(assert (=> b!1441151 m!1330373))

(declare-fun m!1330375 () Bool)

(assert (=> b!1441151 m!1330375))

(declare-fun m!1330377 () Bool)

(assert (=> b!1441148 m!1330377))

(declare-fun m!1330379 () Bool)

(assert (=> b!1441150 m!1330379))

(assert (=> b!1441150 m!1330379))

(declare-fun m!1330381 () Bool)

(assert (=> b!1441150 m!1330381))

(declare-fun m!1330383 () Bool)

(assert (=> start!124532 m!1330383))

(declare-fun m!1330385 () Bool)

(assert (=> start!124532 m!1330385))

(declare-fun m!1330387 () Bool)

(assert (=> b!1441143 m!1330387))

(declare-fun m!1330389 () Bool)

(assert (=> b!1441153 m!1330389))

(declare-fun m!1330391 () Bool)

(assert (=> b!1441153 m!1330391))

(declare-fun m!1330393 () Bool)

(assert (=> b!1441149 m!1330393))

(declare-fun m!1330395 () Bool)

(assert (=> b!1441149 m!1330395))

(assert (=> b!1441152 m!1330373))

(assert (=> b!1441152 m!1330373))

(declare-fun m!1330397 () Bool)

(assert (=> b!1441152 m!1330397))

(assert (=> b!1441154 m!1330373))

(assert (=> b!1441154 m!1330373))

(declare-fun m!1330399 () Bool)

(assert (=> b!1441154 m!1330399))

(assert (=> b!1441154 m!1330399))

(assert (=> b!1441154 m!1330373))

(declare-fun m!1330401 () Bool)

(assert (=> b!1441154 m!1330401))

(declare-fun m!1330403 () Bool)

(assert (=> b!1441144 m!1330403))

(assert (=> b!1441144 m!1330403))

(declare-fun m!1330405 () Bool)

(assert (=> b!1441144 m!1330405))

(assert (=> b!1441144 m!1330389))

(declare-fun m!1330407 () Bool)

(assert (=> b!1441144 m!1330407))

(declare-fun m!1330409 () Bool)

(assert (=> b!1441155 m!1330409))

(push 1)

(assert (not start!124532))

(assert (not b!1441144))

(assert (not b!1441151))

(assert (not b!1441149))

