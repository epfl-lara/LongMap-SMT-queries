; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124214 () Bool)

(assert start!124214)

(declare-fun b!1437691 () Bool)

(declare-fun res!970470 () Bool)

(declare-fun e!811094 () Bool)

(assert (=> b!1437691 (=> (not res!970470) (not e!811094))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97779 0))(
  ( (array!97780 (arr!47182 (Array (_ BitVec 32) (_ BitVec 64))) (size!47732 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97779)

(assert (=> b!1437691 (= res!970470 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47732 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47732 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47732 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47182 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!970474 () Bool)

(assert (=> start!124214 (=> (not res!970474) (not e!811094))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124214 (= res!970474 (validMask!0 mask!2687))))

(assert (=> start!124214 e!811094))

(assert (=> start!124214 true))

(declare-fun array_inv!36210 (array!97779) Bool)

(assert (=> start!124214 (array_inv!36210 a!2862)))

(declare-fun b!1437692 () Bool)

(declare-fun res!970477 () Bool)

(assert (=> b!1437692 (=> (not res!970477) (not e!811094))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437692 (= res!970477 (validKeyInArray!0 (select (arr!47182 a!2862) i!1006)))))

(declare-fun b!1437693 () Bool)

(declare-fun res!970469 () Bool)

(assert (=> b!1437693 (=> (not res!970469) (not e!811094))))

(declare-datatypes ((List!33683 0))(
  ( (Nil!33680) (Cons!33679 (h!35020 (_ BitVec 64)) (t!48377 List!33683)) )
))
(declare-fun arrayNoDuplicates!0 (array!97779 (_ BitVec 32) List!33683) Bool)

(assert (=> b!1437693 (= res!970469 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33680))))

(declare-fun b!1437694 () Bool)

(declare-fun e!811092 () Bool)

(assert (=> b!1437694 (= e!811092 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!632369 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437694 (= lt!632369 (toIndex!0 (select (store (arr!47182 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1437695 () Bool)

(declare-fun res!970475 () Bool)

(assert (=> b!1437695 (=> (not res!970475) (not e!811094))))

(assert (=> b!1437695 (= res!970475 (validKeyInArray!0 (select (arr!47182 a!2862) j!93)))))

(declare-fun b!1437696 () Bool)

(declare-fun res!970472 () Bool)

(assert (=> b!1437696 (=> (not res!970472) (not e!811094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97779 (_ BitVec 32)) Bool)

(assert (=> b!1437696 (= res!970472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437697 () Bool)

(assert (=> b!1437697 (= e!811094 e!811092)))

(declare-fun res!970476 () Bool)

(assert (=> b!1437697 (=> (not res!970476) (not e!811092))))

(declare-datatypes ((SeekEntryResult!11434 0))(
  ( (MissingZero!11434 (index!48128 (_ BitVec 32))) (Found!11434 (index!48129 (_ BitVec 32))) (Intermediate!11434 (undefined!12246 Bool) (index!48130 (_ BitVec 32)) (x!129857 (_ BitVec 32))) (Undefined!11434) (MissingVacant!11434 (index!48131 (_ BitVec 32))) )
))
(declare-fun lt!632370 () SeekEntryResult!11434)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97779 (_ BitVec 32)) SeekEntryResult!11434)

(assert (=> b!1437697 (= res!970476 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47182 a!2862) j!93) mask!2687) (select (arr!47182 a!2862) j!93) a!2862 mask!2687) lt!632370))))

(assert (=> b!1437697 (= lt!632370 (Intermediate!11434 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1437698 () Bool)

(declare-fun res!970473 () Bool)

(assert (=> b!1437698 (=> (not res!970473) (not e!811094))))

(assert (=> b!1437698 (= res!970473 (and (= (size!47732 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47732 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47732 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437699 () Bool)

(declare-fun res!970471 () Bool)

(assert (=> b!1437699 (=> (not res!970471) (not e!811092))))

(assert (=> b!1437699 (= res!970471 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47182 a!2862) j!93) a!2862 mask!2687) lt!632370))))

(assert (= (and start!124214 res!970474) b!1437698))

(assert (= (and b!1437698 res!970473) b!1437692))

(assert (= (and b!1437692 res!970477) b!1437695))

(assert (= (and b!1437695 res!970475) b!1437696))

(assert (= (and b!1437696 res!970472) b!1437693))

(assert (= (and b!1437693 res!970469) b!1437691))

(assert (= (and b!1437691 res!970470) b!1437697))

(assert (= (and b!1437697 res!970476) b!1437699))

(assert (= (and b!1437699 res!970471) b!1437694))

(declare-fun m!1326931 () Bool)

(assert (=> start!124214 m!1326931))

(declare-fun m!1326933 () Bool)

(assert (=> start!124214 m!1326933))

(declare-fun m!1326935 () Bool)

(assert (=> b!1437693 m!1326935))

(declare-fun m!1326937 () Bool)

(assert (=> b!1437696 m!1326937))

(declare-fun m!1326939 () Bool)

(assert (=> b!1437692 m!1326939))

(assert (=> b!1437692 m!1326939))

(declare-fun m!1326941 () Bool)

(assert (=> b!1437692 m!1326941))

(declare-fun m!1326943 () Bool)

(assert (=> b!1437697 m!1326943))

(assert (=> b!1437697 m!1326943))

(declare-fun m!1326945 () Bool)

(assert (=> b!1437697 m!1326945))

(assert (=> b!1437697 m!1326945))

(assert (=> b!1437697 m!1326943))

(declare-fun m!1326947 () Bool)

(assert (=> b!1437697 m!1326947))

(assert (=> b!1437695 m!1326943))

(assert (=> b!1437695 m!1326943))

(declare-fun m!1326949 () Bool)

(assert (=> b!1437695 m!1326949))

(declare-fun m!1326951 () Bool)

(assert (=> b!1437691 m!1326951))

(declare-fun m!1326953 () Bool)

(assert (=> b!1437691 m!1326953))

(assert (=> b!1437699 m!1326943))

(assert (=> b!1437699 m!1326943))

(declare-fun m!1326955 () Bool)

(assert (=> b!1437699 m!1326955))

(assert (=> b!1437694 m!1326951))

(declare-fun m!1326957 () Bool)

(assert (=> b!1437694 m!1326957))

(assert (=> b!1437694 m!1326957))

(declare-fun m!1326959 () Bool)

(assert (=> b!1437694 m!1326959))

(push 1)

(assert (not b!1437699))

(assert (not start!124214))

(assert (not b!1437697))

(assert (not b!1437695))

(assert (not b!1437694))

(assert (not b!1437696))

(assert (not b!1437693))

(assert (not b!1437692))

(check-sat)

(pop 1)

(push 1)

(check-sat)

