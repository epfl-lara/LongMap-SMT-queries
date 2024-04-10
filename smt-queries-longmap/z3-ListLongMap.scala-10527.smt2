; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124134 () Bool)

(assert start!124134)

(declare-fun b!1437029 () Bool)

(declare-fun res!969912 () Bool)

(declare-fun e!810820 () Bool)

(assert (=> b!1437029 (=> (not res!969912) (not e!810820))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-datatypes ((array!97738 0))(
  ( (array!97739 (arr!47163 (Array (_ BitVec 32) (_ BitVec 64))) (size!47713 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97738)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11415 0))(
  ( (MissingZero!11415 (index!48052 (_ BitVec 32))) (Found!11415 (index!48053 (_ BitVec 32))) (Intermediate!11415 (undefined!12227 Bool) (index!48054 (_ BitVec 32)) (x!129784 (_ BitVec 32))) (Undefined!11415) (MissingVacant!11415 (index!48055 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97738 (_ BitVec 32)) SeekEntryResult!11415)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437029 (= res!969912 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47163 a!2862) j!93) mask!2687) (select (arr!47163 a!2862) j!93) a!2862 mask!2687) (Intermediate!11415 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun res!969917 () Bool)

(assert (=> start!124134 (=> (not res!969917) (not e!810820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124134 (= res!969917 (validMask!0 mask!2687))))

(assert (=> start!124134 e!810820))

(assert (=> start!124134 true))

(declare-fun array_inv!36191 (array!97738) Bool)

(assert (=> start!124134 (array_inv!36191 a!2862)))

(declare-fun b!1437030 () Bool)

(declare-fun res!969918 () Bool)

(assert (=> b!1437030 (=> (not res!969918) (not e!810820))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437030 (= res!969918 (and (= (size!47713 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47713 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47713 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437031 () Bool)

(declare-fun res!969915 () Bool)

(assert (=> b!1437031 (=> (not res!969915) (not e!810820))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437031 (= res!969915 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47713 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47713 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47713 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47163 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437032 () Bool)

(declare-fun res!969916 () Bool)

(assert (=> b!1437032 (=> (not res!969916) (not e!810820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97738 (_ BitVec 32)) Bool)

(assert (=> b!1437032 (= res!969916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437033 () Bool)

(declare-fun res!969913 () Bool)

(assert (=> b!1437033 (=> (not res!969913) (not e!810820))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437033 (= res!969913 (validKeyInArray!0 (select (arr!47163 a!2862) j!93)))))

(declare-fun b!1437034 () Bool)

(declare-fun res!969919 () Bool)

(assert (=> b!1437034 (=> (not res!969919) (not e!810820))))

(declare-datatypes ((List!33664 0))(
  ( (Nil!33661) (Cons!33660 (h!34998 (_ BitVec 64)) (t!48358 List!33664)) )
))
(declare-fun arrayNoDuplicates!0 (array!97738 (_ BitVec 32) List!33664) Bool)

(assert (=> b!1437034 (= res!969919 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33661))))

(declare-fun b!1437035 () Bool)

(assert (=> b!1437035 (= e!810820 (and (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1437036 () Bool)

(declare-fun res!969914 () Bool)

(assert (=> b!1437036 (=> (not res!969914) (not e!810820))))

(assert (=> b!1437036 (= res!969914 (validKeyInArray!0 (select (arr!47163 a!2862) i!1006)))))

(assert (= (and start!124134 res!969917) b!1437030))

(assert (= (and b!1437030 res!969918) b!1437036))

(assert (= (and b!1437036 res!969914) b!1437033))

(assert (= (and b!1437033 res!969913) b!1437032))

(assert (= (and b!1437032 res!969916) b!1437034))

(assert (= (and b!1437034 res!969919) b!1437031))

(assert (= (and b!1437031 res!969915) b!1437029))

(assert (= (and b!1437029 res!969912) b!1437035))

(declare-fun m!1326337 () Bool)

(assert (=> b!1437033 m!1326337))

(assert (=> b!1437033 m!1326337))

(declare-fun m!1326339 () Bool)

(assert (=> b!1437033 m!1326339))

(declare-fun m!1326341 () Bool)

(assert (=> b!1437032 m!1326341))

(declare-fun m!1326343 () Bool)

(assert (=> start!124134 m!1326343))

(declare-fun m!1326345 () Bool)

(assert (=> start!124134 m!1326345))

(assert (=> b!1437029 m!1326337))

(assert (=> b!1437029 m!1326337))

(declare-fun m!1326347 () Bool)

(assert (=> b!1437029 m!1326347))

(assert (=> b!1437029 m!1326347))

(assert (=> b!1437029 m!1326337))

(declare-fun m!1326349 () Bool)

(assert (=> b!1437029 m!1326349))

(declare-fun m!1326351 () Bool)

(assert (=> b!1437034 m!1326351))

(declare-fun m!1326353 () Bool)

(assert (=> b!1437036 m!1326353))

(assert (=> b!1437036 m!1326353))

(declare-fun m!1326355 () Bool)

(assert (=> b!1437036 m!1326355))

(declare-fun m!1326357 () Bool)

(assert (=> b!1437031 m!1326357))

(declare-fun m!1326359 () Bool)

(assert (=> b!1437031 m!1326359))

(check-sat (not start!124134) (not b!1437034) (not b!1437032) (not b!1437033) (not b!1437029) (not b!1437036))
(check-sat)
