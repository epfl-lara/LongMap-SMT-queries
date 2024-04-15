; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124384 () Bool)

(assert start!124384)

(declare-fun b!1439179 () Bool)

(declare-fun e!811736 () Bool)

(declare-fun e!811735 () Bool)

(assert (=> b!1439179 (= e!811736 e!811735)))

(declare-fun res!971730 () Bool)

(assert (=> b!1439179 (=> (not res!971730) (not e!811735))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11471 0))(
  ( (MissingZero!11471 (index!48276 (_ BitVec 32))) (Found!11471 (index!48277 (_ BitVec 32))) (Intermediate!11471 (undefined!12283 Bool) (index!48278 (_ BitVec 32)) (x!130011 (_ BitVec 32))) (Undefined!11471) (MissingVacant!11471 (index!48279 (_ BitVec 32))) )
))
(declare-fun lt!632567 () SeekEntryResult!11471)

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!97810 0))(
  ( (array!97811 (arr!47194 (Array (_ BitVec 32) (_ BitVec 64))) (size!47746 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97810)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97810 (_ BitVec 32)) SeekEntryResult!11471)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439179 (= res!971730 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47194 a!2862) j!93) mask!2687) (select (arr!47194 a!2862) j!93) a!2862 mask!2687) lt!632567))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1439179 (= lt!632567 (Intermediate!11471 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439180 () Bool)

(declare-fun res!971727 () Bool)

(assert (=> b!1439180 (=> (not res!971727) (not e!811736))))

(declare-datatypes ((List!33773 0))(
  ( (Nil!33770) (Cons!33769 (h!35119 (_ BitVec 64)) (t!48459 List!33773)) )
))
(declare-fun arrayNoDuplicates!0 (array!97810 (_ BitVec 32) List!33773) Bool)

(assert (=> b!1439180 (= res!971727 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33770))))

(declare-fun b!1439181 () Bool)

(declare-fun res!971724 () Bool)

(assert (=> b!1439181 (=> (not res!971724) (not e!811735))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1439181 (= res!971724 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47194 a!2862) j!93) a!2862 mask!2687) lt!632567))))

(declare-fun b!1439182 () Bool)

(assert (=> b!1439182 (= e!811735 false)))

(declare-fun lt!632568 () SeekEntryResult!11471)

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1439182 (= lt!632568 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47194 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47194 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97811 (store (arr!47194 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47746 a!2862)) mask!2687))))

(declare-fun b!1439183 () Bool)

(declare-fun res!971729 () Bool)

(assert (=> b!1439183 (=> (not res!971729) (not e!811736))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439183 (= res!971729 (validKeyInArray!0 (select (arr!47194 a!2862) i!1006)))))

(declare-fun b!1439184 () Bool)

(declare-fun res!971726 () Bool)

(assert (=> b!1439184 (=> (not res!971726) (not e!811736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97810 (_ BitVec 32)) Bool)

(assert (=> b!1439184 (= res!971726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!971731 () Bool)

(assert (=> start!124384 (=> (not res!971731) (not e!811736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124384 (= res!971731 (validMask!0 mask!2687))))

(assert (=> start!124384 e!811736))

(assert (=> start!124384 true))

(declare-fun array_inv!36427 (array!97810) Bool)

(assert (=> start!124384 (array_inv!36427 a!2862)))

(declare-fun b!1439185 () Bool)

(declare-fun res!971725 () Bool)

(assert (=> b!1439185 (=> (not res!971725) (not e!811736))))

(assert (=> b!1439185 (= res!971725 (validKeyInArray!0 (select (arr!47194 a!2862) j!93)))))

(declare-fun b!1439186 () Bool)

(declare-fun res!971723 () Bool)

(assert (=> b!1439186 (=> (not res!971723) (not e!811736))))

(assert (=> b!1439186 (= res!971723 (and (= (size!47746 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47746 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47746 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439187 () Bool)

(declare-fun res!971728 () Bool)

(assert (=> b!1439187 (=> (not res!971728) (not e!811736))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1439187 (= res!971728 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47746 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47746 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47746 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47194 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124384 res!971731) b!1439186))

(assert (= (and b!1439186 res!971723) b!1439183))

(assert (= (and b!1439183 res!971729) b!1439185))

(assert (= (and b!1439185 res!971725) b!1439184))

(assert (= (and b!1439184 res!971726) b!1439180))

(assert (= (and b!1439180 res!971727) b!1439187))

(assert (= (and b!1439187 res!971728) b!1439179))

(assert (= (and b!1439179 res!971730) b!1439181))

(assert (= (and b!1439181 res!971724) b!1439182))

(declare-fun m!1327761 () Bool)

(assert (=> b!1439187 m!1327761))

(declare-fun m!1327763 () Bool)

(assert (=> b!1439187 m!1327763))

(declare-fun m!1327765 () Bool)

(assert (=> b!1439184 m!1327765))

(declare-fun m!1327767 () Bool)

(assert (=> b!1439181 m!1327767))

(assert (=> b!1439181 m!1327767))

(declare-fun m!1327769 () Bool)

(assert (=> b!1439181 m!1327769))

(declare-fun m!1327771 () Bool)

(assert (=> b!1439180 m!1327771))

(assert (=> b!1439182 m!1327761))

(declare-fun m!1327773 () Bool)

(assert (=> b!1439182 m!1327773))

(assert (=> b!1439182 m!1327773))

(declare-fun m!1327775 () Bool)

(assert (=> b!1439182 m!1327775))

(assert (=> b!1439182 m!1327775))

(assert (=> b!1439182 m!1327773))

(declare-fun m!1327777 () Bool)

(assert (=> b!1439182 m!1327777))

(declare-fun m!1327779 () Bool)

(assert (=> start!124384 m!1327779))

(declare-fun m!1327781 () Bool)

(assert (=> start!124384 m!1327781))

(assert (=> b!1439185 m!1327767))

(assert (=> b!1439185 m!1327767))

(declare-fun m!1327783 () Bool)

(assert (=> b!1439185 m!1327783))

(declare-fun m!1327785 () Bool)

(assert (=> b!1439183 m!1327785))

(assert (=> b!1439183 m!1327785))

(declare-fun m!1327787 () Bool)

(assert (=> b!1439183 m!1327787))

(assert (=> b!1439179 m!1327767))

(assert (=> b!1439179 m!1327767))

(declare-fun m!1327789 () Bool)

(assert (=> b!1439179 m!1327789))

(assert (=> b!1439179 m!1327789))

(assert (=> b!1439179 m!1327767))

(declare-fun m!1327791 () Bool)

(assert (=> b!1439179 m!1327791))

(check-sat (not b!1439185) (not b!1439181) (not b!1439183) (not start!124384) (not b!1439179) (not b!1439184) (not b!1439180) (not b!1439182))
(check-sat)
