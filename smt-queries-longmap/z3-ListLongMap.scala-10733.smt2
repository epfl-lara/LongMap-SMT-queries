; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125814 () Bool)

(assert start!125814)

(declare-fun b!1470458 () Bool)

(declare-fun res!997901 () Bool)

(declare-fun e!825749 () Bool)

(assert (=> b!1470458 (=> (not res!997901) (not e!825749))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99100 0))(
  ( (array!99101 (arr!47833 (Array (_ BitVec 32) (_ BitVec 64))) (size!48384 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99100)

(assert (=> b!1470458 (= res!997901 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48384 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48384 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48384 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47833 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1470459 () Bool)

(declare-fun res!997900 () Bool)

(assert (=> b!1470459 (=> (not res!997900) (not e!825749))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470459 (= res!997900 (validKeyInArray!0 (select (arr!47833 a!2862) j!93)))))

(declare-fun res!997899 () Bool)

(assert (=> start!125814 (=> (not res!997899) (not e!825749))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125814 (= res!997899 (validMask!0 mask!2687))))

(assert (=> start!125814 e!825749))

(assert (=> start!125814 true))

(declare-fun array_inv!37114 (array!99100) Bool)

(assert (=> start!125814 (array_inv!37114 a!2862)))

(declare-fun b!1470460 () Bool)

(declare-fun res!997904 () Bool)

(assert (=> b!1470460 (=> (not res!997904) (not e!825749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99100 (_ BitVec 32)) Bool)

(assert (=> b!1470460 (= res!997904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470461 () Bool)

(declare-fun res!997906 () Bool)

(assert (=> b!1470461 (=> (not res!997906) (not e!825749))))

(assert (=> b!1470461 (= res!997906 (validKeyInArray!0 (select (arr!47833 a!2862) i!1006)))))

(declare-fun b!1470462 () Bool)

(declare-fun res!997902 () Bool)

(assert (=> b!1470462 (=> (not res!997902) (not e!825749))))

(declare-datatypes ((List!34321 0))(
  ( (Nil!34318) (Cons!34317 (h!35681 (_ BitVec 64)) (t!49007 List!34321)) )
))
(declare-fun arrayNoDuplicates!0 (array!99100 (_ BitVec 32) List!34321) Bool)

(assert (=> b!1470462 (= res!997902 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34318))))

(declare-fun b!1470463 () Bool)

(declare-fun e!825748 () Bool)

(assert (=> b!1470463 (= e!825749 e!825748)))

(declare-fun res!997905 () Bool)

(assert (=> b!1470463 (=> (not res!997905) (not e!825748))))

(declare-datatypes ((SeekEntryResult!11970 0))(
  ( (MissingZero!11970 (index!50272 (_ BitVec 32))) (Found!11970 (index!50273 (_ BitVec 32))) (Intermediate!11970 (undefined!12782 Bool) (index!50274 (_ BitVec 32)) (x!132044 (_ BitVec 32))) (Undefined!11970) (MissingVacant!11970 (index!50275 (_ BitVec 32))) )
))
(declare-fun lt!642996 () SeekEntryResult!11970)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99100 (_ BitVec 32)) SeekEntryResult!11970)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470463 (= res!997905 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47833 a!2862) j!93) mask!2687) (select (arr!47833 a!2862) j!93) a!2862 mask!2687) lt!642996))))

(assert (=> b!1470463 (= lt!642996 (Intermediate!11970 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470464 () Bool)

(assert (=> b!1470464 (= e!825748 false)))

(declare-fun lt!642997 () SeekEntryResult!11970)

(assert (=> b!1470464 (= lt!642997 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47833 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47833 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!99101 (store (arr!47833 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48384 a!2862)) mask!2687))))

(declare-fun b!1470465 () Bool)

(declare-fun res!997907 () Bool)

(assert (=> b!1470465 (=> (not res!997907) (not e!825749))))

(assert (=> b!1470465 (= res!997907 (and (= (size!48384 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48384 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48384 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1470466 () Bool)

(declare-fun res!997903 () Bool)

(assert (=> b!1470466 (=> (not res!997903) (not e!825748))))

(assert (=> b!1470466 (= res!997903 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47833 a!2862) j!93) a!2862 mask!2687) lt!642996))))

(assert (= (and start!125814 res!997899) b!1470465))

(assert (= (and b!1470465 res!997907) b!1470461))

(assert (= (and b!1470461 res!997906) b!1470459))

(assert (= (and b!1470459 res!997900) b!1470460))

(assert (= (and b!1470460 res!997904) b!1470462))

(assert (= (and b!1470462 res!997902) b!1470458))

(assert (= (and b!1470458 res!997901) b!1470463))

(assert (= (and b!1470463 res!997905) b!1470466))

(assert (= (and b!1470466 res!997903) b!1470464))

(declare-fun m!1357555 () Bool)

(assert (=> b!1470464 m!1357555))

(declare-fun m!1357557 () Bool)

(assert (=> b!1470464 m!1357557))

(assert (=> b!1470464 m!1357557))

(declare-fun m!1357559 () Bool)

(assert (=> b!1470464 m!1357559))

(assert (=> b!1470464 m!1357559))

(assert (=> b!1470464 m!1357557))

(declare-fun m!1357561 () Bool)

(assert (=> b!1470464 m!1357561))

(declare-fun m!1357563 () Bool)

(assert (=> b!1470463 m!1357563))

(assert (=> b!1470463 m!1357563))

(declare-fun m!1357565 () Bool)

(assert (=> b!1470463 m!1357565))

(assert (=> b!1470463 m!1357565))

(assert (=> b!1470463 m!1357563))

(declare-fun m!1357567 () Bool)

(assert (=> b!1470463 m!1357567))

(declare-fun m!1357569 () Bool)

(assert (=> b!1470462 m!1357569))

(assert (=> b!1470466 m!1357563))

(assert (=> b!1470466 m!1357563))

(declare-fun m!1357571 () Bool)

(assert (=> b!1470466 m!1357571))

(assert (=> b!1470458 m!1357555))

(declare-fun m!1357573 () Bool)

(assert (=> b!1470458 m!1357573))

(declare-fun m!1357575 () Bool)

(assert (=> b!1470460 m!1357575))

(declare-fun m!1357577 () Bool)

(assert (=> start!125814 m!1357577))

(declare-fun m!1357579 () Bool)

(assert (=> start!125814 m!1357579))

(declare-fun m!1357581 () Bool)

(assert (=> b!1470461 m!1357581))

(assert (=> b!1470461 m!1357581))

(declare-fun m!1357583 () Bool)

(assert (=> b!1470461 m!1357583))

(assert (=> b!1470459 m!1357563))

(assert (=> b!1470459 m!1357563))

(declare-fun m!1357585 () Bool)

(assert (=> b!1470459 m!1357585))

(check-sat (not b!1470459) (not b!1470464) (not b!1470460) (not b!1470466) (not b!1470462) (not start!125814) (not b!1470461) (not b!1470463))
(check-sat)
