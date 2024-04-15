; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124312 () Bool)

(assert start!124312)

(declare-fun b!1438524 () Bool)

(declare-fun res!971192 () Bool)

(declare-fun e!811445 () Bool)

(assert (=> b!1438524 (=> (not res!971192) (not e!811445))))

(declare-datatypes ((array!97777 0))(
  ( (array!97778 (arr!47179 (Array (_ BitVec 32) (_ BitVec 64))) (size!47731 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97777)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438524 (= res!971192 (validKeyInArray!0 (select (arr!47179 a!2862) i!1006)))))

(declare-fun b!1438525 () Bool)

(declare-fun res!971193 () Bool)

(declare-fun e!811446 () Bool)

(assert (=> b!1438525 (=> (not res!971193) (not e!811446))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11456 0))(
  ( (MissingZero!11456 (index!48216 (_ BitVec 32))) (Found!11456 (index!48217 (_ BitVec 32))) (Intermediate!11456 (undefined!12268 Bool) (index!48218 (_ BitVec 32)) (x!129950 (_ BitVec 32))) (Undefined!11456) (MissingVacant!11456 (index!48219 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97777 (_ BitVec 32)) SeekEntryResult!11456)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438525 (= res!971193 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47179 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47179 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97778 (store (arr!47179 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47731 a!2862)) mask!2687) (Intermediate!11456 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1438526 () Bool)

(declare-fun res!971199 () Bool)

(assert (=> b!1438526 (=> (not res!971199) (not e!811446))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!632403 () SeekEntryResult!11456)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1438526 (= res!971199 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47179 a!2862) j!93) a!2862 mask!2687) lt!632403))))

(declare-fun b!1438527 () Bool)

(declare-fun res!971194 () Bool)

(assert (=> b!1438527 (=> (not res!971194) (not e!811445))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1438527 (= res!971194 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47731 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47731 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47731 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47179 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438528 () Bool)

(declare-fun res!971197 () Bool)

(assert (=> b!1438528 (=> (not res!971197) (not e!811445))))

(assert (=> b!1438528 (= res!971197 (and (= (size!47731 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47731 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47731 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438529 () Bool)

(declare-fun res!971198 () Bool)

(assert (=> b!1438529 (=> (not res!971198) (not e!811445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97777 (_ BitVec 32)) Bool)

(assert (=> b!1438529 (= res!971198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438530 () Bool)

(declare-fun res!971195 () Bool)

(assert (=> b!1438530 (=> (not res!971195) (not e!811445))))

(declare-datatypes ((List!33758 0))(
  ( (Nil!33755) (Cons!33754 (h!35101 (_ BitVec 64)) (t!48444 List!33758)) )
))
(declare-fun arrayNoDuplicates!0 (array!97777 (_ BitVec 32) List!33758) Bool)

(assert (=> b!1438530 (= res!971195 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33755))))

(declare-fun b!1438532 () Bool)

(assert (=> b!1438532 (= e!811446 (and (bvsle x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1438533 () Bool)

(declare-fun res!971196 () Bool)

(assert (=> b!1438533 (=> (not res!971196) (not e!811445))))

(assert (=> b!1438533 (= res!971196 (validKeyInArray!0 (select (arr!47179 a!2862) j!93)))))

(declare-fun res!971200 () Bool)

(assert (=> start!124312 (=> (not res!971200) (not e!811445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124312 (= res!971200 (validMask!0 mask!2687))))

(assert (=> start!124312 e!811445))

(assert (=> start!124312 true))

(declare-fun array_inv!36412 (array!97777) Bool)

(assert (=> start!124312 (array_inv!36412 a!2862)))

(declare-fun b!1438531 () Bool)

(assert (=> b!1438531 (= e!811445 e!811446)))

(declare-fun res!971191 () Bool)

(assert (=> b!1438531 (=> (not res!971191) (not e!811446))))

(assert (=> b!1438531 (= res!971191 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47179 a!2862) j!93) mask!2687) (select (arr!47179 a!2862) j!93) a!2862 mask!2687) lt!632403))))

(assert (=> b!1438531 (= lt!632403 (Intermediate!11456 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124312 res!971200) b!1438528))

(assert (= (and b!1438528 res!971197) b!1438524))

(assert (= (and b!1438524 res!971192) b!1438533))

(assert (= (and b!1438533 res!971196) b!1438529))

(assert (= (and b!1438529 res!971198) b!1438530))

(assert (= (and b!1438530 res!971195) b!1438527))

(assert (= (and b!1438527 res!971194) b!1438531))

(assert (= (and b!1438531 res!971191) b!1438526))

(assert (= (and b!1438526 res!971199) b!1438525))

(assert (= (and b!1438525 res!971193) b!1438532))

(declare-fun m!1327155 () Bool)

(assert (=> b!1438531 m!1327155))

(assert (=> b!1438531 m!1327155))

(declare-fun m!1327157 () Bool)

(assert (=> b!1438531 m!1327157))

(assert (=> b!1438531 m!1327157))

(assert (=> b!1438531 m!1327155))

(declare-fun m!1327159 () Bool)

(assert (=> b!1438531 m!1327159))

(assert (=> b!1438533 m!1327155))

(assert (=> b!1438533 m!1327155))

(declare-fun m!1327161 () Bool)

(assert (=> b!1438533 m!1327161))

(declare-fun m!1327163 () Bool)

(assert (=> b!1438529 m!1327163))

(assert (=> b!1438526 m!1327155))

(assert (=> b!1438526 m!1327155))

(declare-fun m!1327165 () Bool)

(assert (=> b!1438526 m!1327165))

(declare-fun m!1327167 () Bool)

(assert (=> b!1438527 m!1327167))

(declare-fun m!1327169 () Bool)

(assert (=> b!1438527 m!1327169))

(declare-fun m!1327171 () Bool)

(assert (=> start!124312 m!1327171))

(declare-fun m!1327173 () Bool)

(assert (=> start!124312 m!1327173))

(declare-fun m!1327175 () Bool)

(assert (=> b!1438530 m!1327175))

(assert (=> b!1438525 m!1327167))

(declare-fun m!1327177 () Bool)

(assert (=> b!1438525 m!1327177))

(assert (=> b!1438525 m!1327177))

(declare-fun m!1327179 () Bool)

(assert (=> b!1438525 m!1327179))

(assert (=> b!1438525 m!1327179))

(assert (=> b!1438525 m!1327177))

(declare-fun m!1327181 () Bool)

(assert (=> b!1438525 m!1327181))

(declare-fun m!1327183 () Bool)

(assert (=> b!1438524 m!1327183))

(assert (=> b!1438524 m!1327183))

(declare-fun m!1327185 () Bool)

(assert (=> b!1438524 m!1327185))

(check-sat (not start!124312) (not b!1438524) (not b!1438531) (not b!1438526) (not b!1438533) (not b!1438525) (not b!1438529) (not b!1438530))
(check-sat)
