; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124510 () Bool)

(assert start!124510)

(declare-fun b!1440760 () Bool)

(declare-fun res!973188 () Bool)

(declare-fun e!812285 () Bool)

(assert (=> b!1440760 (=> (not res!973188) (not e!812285))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97958 0))(
  ( (array!97959 (arr!47267 (Array (_ BitVec 32) (_ BitVec 64))) (size!47817 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97958)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440760 (= res!973188 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47817 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47817 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47817 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47267 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440761 () Bool)

(declare-fun e!812284 () Bool)

(assert (=> b!1440761 (= e!812285 e!812284)))

(declare-fun res!973189 () Bool)

(assert (=> b!1440761 (=> (not res!973189) (not e!812284))))

(declare-datatypes ((SeekEntryResult!11519 0))(
  ( (MissingZero!11519 (index!48468 (_ BitVec 32))) (Found!11519 (index!48469 (_ BitVec 32))) (Intermediate!11519 (undefined!12331 Bool) (index!48470 (_ BitVec 32)) (x!130192 (_ BitVec 32))) (Undefined!11519) (MissingVacant!11519 (index!48471 (_ BitVec 32))) )
))
(declare-fun lt!633018 () SeekEntryResult!11519)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97958 (_ BitVec 32)) SeekEntryResult!11519)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440761 (= res!973189 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47267 a!2862) j!93) mask!2687) (select (arr!47267 a!2862) j!93) a!2862 mask!2687) lt!633018))))

(assert (=> b!1440761 (= lt!633018 (Intermediate!11519 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440762 () Bool)

(assert (=> b!1440762 (= e!812284 false)))

(declare-fun lt!633017 () SeekEntryResult!11519)

(assert (=> b!1440762 (= lt!633017 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47267 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47267 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97959 (store (arr!47267 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47817 a!2862)) mask!2687))))

(declare-fun b!1440763 () Bool)

(declare-fun res!973191 () Bool)

(assert (=> b!1440763 (=> (not res!973191) (not e!812284))))

(assert (=> b!1440763 (= res!973191 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47267 a!2862) j!93) a!2862 mask!2687) lt!633018))))

(declare-fun b!1440764 () Bool)

(declare-fun res!973193 () Bool)

(assert (=> b!1440764 (=> (not res!973193) (not e!812285))))

(assert (=> b!1440764 (= res!973193 (and (= (size!47817 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47817 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47817 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440765 () Bool)

(declare-fun res!973192 () Bool)

(assert (=> b!1440765 (=> (not res!973192) (not e!812285))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440765 (= res!973192 (validKeyInArray!0 (select (arr!47267 a!2862) j!93)))))

(declare-fun b!1440767 () Bool)

(declare-fun res!973187 () Bool)

(assert (=> b!1440767 (=> (not res!973187) (not e!812285))))

(assert (=> b!1440767 (= res!973187 (validKeyInArray!0 (select (arr!47267 a!2862) i!1006)))))

(declare-fun b!1440768 () Bool)

(declare-fun res!973190 () Bool)

(assert (=> b!1440768 (=> (not res!973190) (not e!812285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97958 (_ BitVec 32)) Bool)

(assert (=> b!1440768 (= res!973190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!973194 () Bool)

(assert (=> start!124510 (=> (not res!973194) (not e!812285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124510 (= res!973194 (validMask!0 mask!2687))))

(assert (=> start!124510 e!812285))

(assert (=> start!124510 true))

(declare-fun array_inv!36295 (array!97958) Bool)

(assert (=> start!124510 (array_inv!36295 a!2862)))

(declare-fun b!1440766 () Bool)

(declare-fun res!973195 () Bool)

(assert (=> b!1440766 (=> (not res!973195) (not e!812285))))

(declare-datatypes ((List!33768 0))(
  ( (Nil!33765) (Cons!33764 (h!35114 (_ BitVec 64)) (t!48462 List!33768)) )
))
(declare-fun arrayNoDuplicates!0 (array!97958 (_ BitVec 32) List!33768) Bool)

(assert (=> b!1440766 (= res!973195 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33765))))

(assert (= (and start!124510 res!973194) b!1440764))

(assert (= (and b!1440764 res!973193) b!1440767))

(assert (= (and b!1440767 res!973187) b!1440765))

(assert (= (and b!1440765 res!973192) b!1440768))

(assert (= (and b!1440768 res!973190) b!1440766))

(assert (= (and b!1440766 res!973195) b!1440760))

(assert (= (and b!1440760 res!973188) b!1440761))

(assert (= (and b!1440761 res!973189) b!1440763))

(assert (= (and b!1440763 res!973191) b!1440762))

(declare-fun m!1329985 () Bool)

(assert (=> start!124510 m!1329985))

(declare-fun m!1329987 () Bool)

(assert (=> start!124510 m!1329987))

(declare-fun m!1329989 () Bool)

(assert (=> b!1440761 m!1329989))

(assert (=> b!1440761 m!1329989))

(declare-fun m!1329991 () Bool)

(assert (=> b!1440761 m!1329991))

(assert (=> b!1440761 m!1329991))

(assert (=> b!1440761 m!1329989))

(declare-fun m!1329993 () Bool)

(assert (=> b!1440761 m!1329993))

(assert (=> b!1440763 m!1329989))

(assert (=> b!1440763 m!1329989))

(declare-fun m!1329995 () Bool)

(assert (=> b!1440763 m!1329995))

(declare-fun m!1329997 () Bool)

(assert (=> b!1440760 m!1329997))

(declare-fun m!1329999 () Bool)

(assert (=> b!1440760 m!1329999))

(declare-fun m!1330001 () Bool)

(assert (=> b!1440767 m!1330001))

(assert (=> b!1440767 m!1330001))

(declare-fun m!1330003 () Bool)

(assert (=> b!1440767 m!1330003))

(assert (=> b!1440765 m!1329989))

(assert (=> b!1440765 m!1329989))

(declare-fun m!1330005 () Bool)

(assert (=> b!1440765 m!1330005))

(assert (=> b!1440762 m!1329997))

(declare-fun m!1330007 () Bool)

(assert (=> b!1440762 m!1330007))

(assert (=> b!1440762 m!1330007))

(declare-fun m!1330009 () Bool)

(assert (=> b!1440762 m!1330009))

(assert (=> b!1440762 m!1330009))

(assert (=> b!1440762 m!1330007))

(declare-fun m!1330011 () Bool)

(assert (=> b!1440762 m!1330011))

(declare-fun m!1330013 () Bool)

(assert (=> b!1440766 m!1330013))

(declare-fun m!1330015 () Bool)

(assert (=> b!1440768 m!1330015))

(push 1)

