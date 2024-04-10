; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124336 () Bool)

(assert start!124336)

(declare-fun b!1438636 () Bool)

(declare-fun res!971187 () Bool)

(declare-fun e!811533 () Bool)

(assert (=> b!1438636 (=> (not res!971187) (not e!811533))))

(declare-datatypes ((array!97823 0))(
  ( (array!97824 (arr!47201 (Array (_ BitVec 32) (_ BitVec 64))) (size!47751 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97823)

(declare-datatypes ((List!33702 0))(
  ( (Nil!33699) (Cons!33698 (h!35045 (_ BitVec 64)) (t!48396 List!33702)) )
))
(declare-fun arrayNoDuplicates!0 (array!97823 (_ BitVec 32) List!33702) Bool)

(assert (=> b!1438636 (= res!971187 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33699))))

(declare-fun b!1438637 () Bool)

(declare-fun res!971190 () Bool)

(assert (=> b!1438637 (=> (not res!971190) (not e!811533))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97823 (_ BitVec 32)) Bool)

(assert (=> b!1438637 (= res!971190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438638 () Bool)

(declare-fun e!811534 () Bool)

(assert (=> b!1438638 (= e!811534 false)))

(declare-datatypes ((SeekEntryResult!11453 0))(
  ( (MissingZero!11453 (index!48204 (_ BitVec 32))) (Found!11453 (index!48205 (_ BitVec 32))) (Intermediate!11453 (undefined!12265 Bool) (index!48206 (_ BitVec 32)) (x!129944 (_ BitVec 32))) (Undefined!11453) (MissingVacant!11453 (index!48207 (_ BitVec 32))) )
))
(declare-fun lt!632621 () SeekEntryResult!11453)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97823 (_ BitVec 32)) SeekEntryResult!11453)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438638 (= lt!632621 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47201 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47201 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97824 (store (arr!47201 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47751 a!2862)) mask!2687))))

(declare-fun b!1438639 () Bool)

(declare-fun res!971191 () Bool)

(assert (=> b!1438639 (=> (not res!971191) (not e!811533))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1438639 (= res!971191 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47751 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47751 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47751 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47201 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438640 () Bool)

(declare-fun res!971193 () Bool)

(assert (=> b!1438640 (=> (not res!971193) (not e!811533))))

(assert (=> b!1438640 (= res!971193 (and (= (size!47751 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47751 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47751 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438641 () Bool)

(assert (=> b!1438641 (= e!811533 e!811534)))

(declare-fun res!971194 () Bool)

(assert (=> b!1438641 (=> (not res!971194) (not e!811534))))

(declare-fun lt!632622 () SeekEntryResult!11453)

(assert (=> b!1438641 (= res!971194 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47201 a!2862) j!93) mask!2687) (select (arr!47201 a!2862) j!93) a!2862 mask!2687) lt!632622))))

(assert (=> b!1438641 (= lt!632622 (Intermediate!11453 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438642 () Bool)

(declare-fun res!971188 () Bool)

(assert (=> b!1438642 (=> (not res!971188) (not e!811533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438642 (= res!971188 (validKeyInArray!0 (select (arr!47201 a!2862) i!1006)))))

(declare-fun b!1438643 () Bool)

(declare-fun res!971186 () Bool)

(assert (=> b!1438643 (=> (not res!971186) (not e!811533))))

(assert (=> b!1438643 (= res!971186 (validKeyInArray!0 (select (arr!47201 a!2862) j!93)))))

(declare-fun b!1438644 () Bool)

(declare-fun res!971189 () Bool)

(assert (=> b!1438644 (=> (not res!971189) (not e!811534))))

(assert (=> b!1438644 (= res!971189 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47201 a!2862) j!93) a!2862 mask!2687) lt!632622))))

(declare-fun res!971192 () Bool)

(assert (=> start!124336 (=> (not res!971192) (not e!811533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124336 (= res!971192 (validMask!0 mask!2687))))

(assert (=> start!124336 e!811533))

(assert (=> start!124336 true))

(declare-fun array_inv!36229 (array!97823) Bool)

(assert (=> start!124336 (array_inv!36229 a!2862)))

(assert (= (and start!124336 res!971192) b!1438640))

(assert (= (and b!1438640 res!971193) b!1438642))

(assert (= (and b!1438642 res!971188) b!1438643))

(assert (= (and b!1438643 res!971186) b!1438637))

(assert (= (and b!1438637 res!971190) b!1438636))

(assert (= (and b!1438636 res!971187) b!1438639))

(assert (= (and b!1438639 res!971191) b!1438641))

(assert (= (and b!1438641 res!971194) b!1438644))

(assert (= (and b!1438644 res!971189) b!1438638))

(declare-fun m!1327735 () Bool)

(assert (=> b!1438636 m!1327735))

(declare-fun m!1327737 () Bool)

(assert (=> b!1438643 m!1327737))

(assert (=> b!1438643 m!1327737))

(declare-fun m!1327739 () Bool)

(assert (=> b!1438643 m!1327739))

(declare-fun m!1327741 () Bool)

(assert (=> b!1438638 m!1327741))

(declare-fun m!1327743 () Bool)

(assert (=> b!1438638 m!1327743))

(assert (=> b!1438638 m!1327743))

(declare-fun m!1327745 () Bool)

(assert (=> b!1438638 m!1327745))

(assert (=> b!1438638 m!1327745))

(assert (=> b!1438638 m!1327743))

(declare-fun m!1327747 () Bool)

(assert (=> b!1438638 m!1327747))

(declare-fun m!1327749 () Bool)

(assert (=> b!1438637 m!1327749))

(declare-fun m!1327751 () Bool)

(assert (=> start!124336 m!1327751))

(declare-fun m!1327753 () Bool)

(assert (=> start!124336 m!1327753))

(declare-fun m!1327755 () Bool)

(assert (=> b!1438642 m!1327755))

(assert (=> b!1438642 m!1327755))

(declare-fun m!1327757 () Bool)

(assert (=> b!1438642 m!1327757))

(assert (=> b!1438644 m!1327737))

(assert (=> b!1438644 m!1327737))

(declare-fun m!1327759 () Bool)

(assert (=> b!1438644 m!1327759))

(assert (=> b!1438641 m!1327737))

(assert (=> b!1438641 m!1327737))

(declare-fun m!1327761 () Bool)

(assert (=> b!1438641 m!1327761))

(assert (=> b!1438641 m!1327761))

(assert (=> b!1438641 m!1327737))

(declare-fun m!1327763 () Bool)

(assert (=> b!1438641 m!1327763))

(assert (=> b!1438639 m!1327741))

(declare-fun m!1327765 () Bool)

(assert (=> b!1438639 m!1327765))

(push 1)

