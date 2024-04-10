; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124512 () Bool)

(assert start!124512)

(declare-fun b!1440787 () Bool)

(declare-fun e!812294 () Bool)

(assert (=> b!1440787 (= e!812294 false)))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97960 0))(
  ( (array!97961 (arr!47268 (Array (_ BitVec 32) (_ BitVec 64))) (size!47818 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97960)

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11520 0))(
  ( (MissingZero!11520 (index!48472 (_ BitVec 32))) (Found!11520 (index!48473 (_ BitVec 32))) (Intermediate!11520 (undefined!12332 Bool) (index!48474 (_ BitVec 32)) (x!130193 (_ BitVec 32))) (Undefined!11520) (MissingVacant!11520 (index!48475 (_ BitVec 32))) )
))
(declare-fun lt!633023 () SeekEntryResult!11520)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97960 (_ BitVec 32)) SeekEntryResult!11520)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440787 (= lt!633023 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47268 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47268 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97961 (store (arr!47268 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47818 a!2862)) mask!2687))))

(declare-fun b!1440788 () Bool)

(declare-fun res!973220 () Bool)

(assert (=> b!1440788 (=> (not res!973220) (not e!812294))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!633024 () SeekEntryResult!11520)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1440788 (= res!973220 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47268 a!2862) j!93) a!2862 mask!2687) lt!633024))))

(declare-fun b!1440789 () Bool)

(declare-fun e!812293 () Bool)

(assert (=> b!1440789 (= e!812293 e!812294)))

(declare-fun res!973217 () Bool)

(assert (=> b!1440789 (=> (not res!973217) (not e!812294))))

(assert (=> b!1440789 (= res!973217 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47268 a!2862) j!93) mask!2687) (select (arr!47268 a!2862) j!93) a!2862 mask!2687) lt!633024))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440789 (= lt!633024 (Intermediate!11520 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440790 () Bool)

(declare-fun res!973218 () Bool)

(assert (=> b!1440790 (=> (not res!973218) (not e!812293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440790 (= res!973218 (validKeyInArray!0 (select (arr!47268 a!2862) j!93)))))

(declare-fun b!1440791 () Bool)

(declare-fun res!973219 () Bool)

(assert (=> b!1440791 (=> (not res!973219) (not e!812293))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440791 (= res!973219 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47818 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47818 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47818 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47268 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!973215 () Bool)

(assert (=> start!124512 (=> (not res!973215) (not e!812293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124512 (= res!973215 (validMask!0 mask!2687))))

(assert (=> start!124512 e!812293))

(assert (=> start!124512 true))

(declare-fun array_inv!36296 (array!97960) Bool)

(assert (=> start!124512 (array_inv!36296 a!2862)))

(declare-fun b!1440792 () Bool)

(declare-fun res!973221 () Bool)

(assert (=> b!1440792 (=> (not res!973221) (not e!812293))))

(declare-datatypes ((List!33769 0))(
  ( (Nil!33766) (Cons!33765 (h!35115 (_ BitVec 64)) (t!48463 List!33769)) )
))
(declare-fun arrayNoDuplicates!0 (array!97960 (_ BitVec 32) List!33769) Bool)

(assert (=> b!1440792 (= res!973221 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33766))))

(declare-fun b!1440793 () Bool)

(declare-fun res!973216 () Bool)

(assert (=> b!1440793 (=> (not res!973216) (not e!812293))))

(assert (=> b!1440793 (= res!973216 (and (= (size!47818 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47818 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47818 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440794 () Bool)

(declare-fun res!973214 () Bool)

(assert (=> b!1440794 (=> (not res!973214) (not e!812293))))

(assert (=> b!1440794 (= res!973214 (validKeyInArray!0 (select (arr!47268 a!2862) i!1006)))))

(declare-fun b!1440795 () Bool)

(declare-fun res!973222 () Bool)

(assert (=> b!1440795 (=> (not res!973222) (not e!812293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97960 (_ BitVec 32)) Bool)

(assert (=> b!1440795 (= res!973222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124512 res!973215) b!1440793))

(assert (= (and b!1440793 res!973216) b!1440794))

(assert (= (and b!1440794 res!973214) b!1440790))

(assert (= (and b!1440790 res!973218) b!1440795))

(assert (= (and b!1440795 res!973222) b!1440792))

(assert (= (and b!1440792 res!973221) b!1440791))

(assert (= (and b!1440791 res!973219) b!1440789))

(assert (= (and b!1440789 res!973217) b!1440788))

(assert (= (and b!1440788 res!973220) b!1440787))

(declare-fun m!1330017 () Bool)

(assert (=> b!1440787 m!1330017))

(declare-fun m!1330019 () Bool)

(assert (=> b!1440787 m!1330019))

(assert (=> b!1440787 m!1330019))

(declare-fun m!1330021 () Bool)

(assert (=> b!1440787 m!1330021))

(assert (=> b!1440787 m!1330021))

(assert (=> b!1440787 m!1330019))

(declare-fun m!1330023 () Bool)

(assert (=> b!1440787 m!1330023))

(declare-fun m!1330025 () Bool)

(assert (=> b!1440794 m!1330025))

(assert (=> b!1440794 m!1330025))

(declare-fun m!1330027 () Bool)

(assert (=> b!1440794 m!1330027))

(declare-fun m!1330029 () Bool)

(assert (=> b!1440792 m!1330029))

(declare-fun m!1330031 () Bool)

(assert (=> b!1440795 m!1330031))

(declare-fun m!1330033 () Bool)

(assert (=> b!1440789 m!1330033))

(assert (=> b!1440789 m!1330033))

(declare-fun m!1330035 () Bool)

(assert (=> b!1440789 m!1330035))

(assert (=> b!1440789 m!1330035))

(assert (=> b!1440789 m!1330033))

(declare-fun m!1330037 () Bool)

(assert (=> b!1440789 m!1330037))

(declare-fun m!1330039 () Bool)

(assert (=> start!124512 m!1330039))

(declare-fun m!1330041 () Bool)

(assert (=> start!124512 m!1330041))

(assert (=> b!1440791 m!1330017))

(declare-fun m!1330043 () Bool)

(assert (=> b!1440791 m!1330043))

(assert (=> b!1440788 m!1330033))

(assert (=> b!1440788 m!1330033))

(declare-fun m!1330045 () Bool)

(assert (=> b!1440788 m!1330045))

(assert (=> b!1440790 m!1330033))

(assert (=> b!1440790 m!1330033))

(declare-fun m!1330047 () Bool)

(assert (=> b!1440790 m!1330047))

(check-sat (not b!1440792) (not b!1440794) (not b!1440788) (not start!124512) (not b!1440787) (not b!1440790) (not b!1440789) (not b!1440795))
(check-sat)
