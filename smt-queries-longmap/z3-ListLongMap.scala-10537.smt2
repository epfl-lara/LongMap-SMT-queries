; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124494 () Bool)

(assert start!124494)

(declare-fun b!1439479 () Bool)

(declare-fun res!971330 () Bool)

(declare-fun e!812148 () Bool)

(assert (=> b!1439479 (=> (not res!971330) (not e!812148))))

(declare-datatypes ((array!97915 0))(
  ( (array!97916 (arr!47245 (Array (_ BitVec 32) (_ BitVec 64))) (size!47796 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97915)

(declare-datatypes ((List!33733 0))(
  ( (Nil!33730) (Cons!33729 (h!35084 (_ BitVec 64)) (t!48419 List!33733)) )
))
(declare-fun arrayNoDuplicates!0 (array!97915 (_ BitVec 32) List!33733) Bool)

(assert (=> b!1439479 (= res!971330 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33730))))

(declare-fun e!812146 () Bool)

(declare-fun b!1439480 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439480 (= e!812146 (not (validKeyInArray!0 (select (store (arr!47245 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(declare-fun b!1439482 () Bool)

(declare-fun e!812145 () Bool)

(assert (=> b!1439482 (= e!812145 e!812146)))

(declare-fun res!971332 () Bool)

(assert (=> b!1439482 (=> (not res!971332) (not e!812146))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!632983 () (_ BitVec 32))

(assert (=> b!1439482 (= res!971332 (and (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge lt!632983 #b00000000000000000000000000000000) (bvslt lt!632983 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439482 (= lt!632983 (toIndex!0 (select (store (arr!47245 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1439483 () Bool)

(declare-fun res!971329 () Bool)

(assert (=> b!1439483 (=> (not res!971329) (not e!812148))))

(assert (=> b!1439483 (= res!971329 (validKeyInArray!0 (select (arr!47245 a!2862) j!93)))))

(declare-fun b!1439484 () Bool)

(declare-fun res!971333 () Bool)

(assert (=> b!1439484 (=> (not res!971333) (not e!812145))))

(declare-datatypes ((SeekEntryResult!11394 0))(
  ( (MissingZero!11394 (index!47968 (_ BitVec 32))) (Found!11394 (index!47969 (_ BitVec 32))) (Intermediate!11394 (undefined!12206 Bool) (index!47970 (_ BitVec 32)) (x!129879 (_ BitVec 32))) (Undefined!11394) (MissingVacant!11394 (index!47971 (_ BitVec 32))) )
))
(declare-fun lt!632982 () SeekEntryResult!11394)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97915 (_ BitVec 32)) SeekEntryResult!11394)

(assert (=> b!1439484 (= res!971333 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47245 a!2862) j!93) a!2862 mask!2687) lt!632982))))

(declare-fun b!1439485 () Bool)

(declare-fun res!971334 () Bool)

(assert (=> b!1439485 (=> (not res!971334) (not e!812148))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1439485 (= res!971334 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47796 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47796 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47796 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47245 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439486 () Bool)

(assert (=> b!1439486 (= e!812148 e!812145)))

(declare-fun res!971331 () Bool)

(assert (=> b!1439486 (=> (not res!971331) (not e!812145))))

(assert (=> b!1439486 (= res!971331 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47245 a!2862) j!93) mask!2687) (select (arr!47245 a!2862) j!93) a!2862 mask!2687) lt!632982))))

(assert (=> b!1439486 (= lt!632982 (Intermediate!11394 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439481 () Bool)

(declare-fun res!971328 () Bool)

(assert (=> b!1439481 (=> (not res!971328) (not e!812148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97915 (_ BitVec 32)) Bool)

(assert (=> b!1439481 (= res!971328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!971336 () Bool)

(assert (=> start!124494 (=> (not res!971336) (not e!812148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124494 (= res!971336 (validMask!0 mask!2687))))

(assert (=> start!124494 e!812148))

(assert (=> start!124494 true))

(declare-fun array_inv!36526 (array!97915) Bool)

(assert (=> start!124494 (array_inv!36526 a!2862)))

(declare-fun b!1439487 () Bool)

(declare-fun res!971327 () Bool)

(assert (=> b!1439487 (=> (not res!971327) (not e!812148))))

(assert (=> b!1439487 (= res!971327 (and (= (size!47796 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47796 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47796 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439488 () Bool)

(declare-fun res!971335 () Bool)

(assert (=> b!1439488 (=> (not res!971335) (not e!812148))))

(assert (=> b!1439488 (= res!971335 (validKeyInArray!0 (select (arr!47245 a!2862) i!1006)))))

(assert (= (and start!124494 res!971336) b!1439487))

(assert (= (and b!1439487 res!971327) b!1439488))

(assert (= (and b!1439488 res!971335) b!1439483))

(assert (= (and b!1439483 res!971329) b!1439481))

(assert (= (and b!1439481 res!971328) b!1439479))

(assert (= (and b!1439479 res!971330) b!1439485))

(assert (= (and b!1439485 res!971334) b!1439486))

(assert (= (and b!1439486 res!971331) b!1439484))

(assert (= (and b!1439484 res!971333) b!1439482))

(assert (= (and b!1439482 res!971332) b!1439480))

(declare-fun m!1328767 () Bool)

(assert (=> b!1439481 m!1328767))

(declare-fun m!1328769 () Bool)

(assert (=> b!1439483 m!1328769))

(assert (=> b!1439483 m!1328769))

(declare-fun m!1328771 () Bool)

(assert (=> b!1439483 m!1328771))

(assert (=> b!1439486 m!1328769))

(assert (=> b!1439486 m!1328769))

(declare-fun m!1328773 () Bool)

(assert (=> b!1439486 m!1328773))

(assert (=> b!1439486 m!1328773))

(assert (=> b!1439486 m!1328769))

(declare-fun m!1328775 () Bool)

(assert (=> b!1439486 m!1328775))

(declare-fun m!1328777 () Bool)

(assert (=> b!1439480 m!1328777))

(declare-fun m!1328779 () Bool)

(assert (=> b!1439480 m!1328779))

(assert (=> b!1439480 m!1328779))

(declare-fun m!1328781 () Bool)

(assert (=> b!1439480 m!1328781))

(declare-fun m!1328783 () Bool)

(assert (=> start!124494 m!1328783))

(declare-fun m!1328785 () Bool)

(assert (=> start!124494 m!1328785))

(assert (=> b!1439484 m!1328769))

(assert (=> b!1439484 m!1328769))

(declare-fun m!1328787 () Bool)

(assert (=> b!1439484 m!1328787))

(assert (=> b!1439485 m!1328777))

(declare-fun m!1328789 () Bool)

(assert (=> b!1439485 m!1328789))

(assert (=> b!1439482 m!1328777))

(assert (=> b!1439482 m!1328779))

(assert (=> b!1439482 m!1328779))

(declare-fun m!1328791 () Bool)

(assert (=> b!1439482 m!1328791))

(declare-fun m!1328793 () Bool)

(assert (=> b!1439479 m!1328793))

(declare-fun m!1328795 () Bool)

(assert (=> b!1439488 m!1328795))

(assert (=> b!1439488 m!1328795))

(declare-fun m!1328797 () Bool)

(assert (=> b!1439488 m!1328797))

(check-sat (not b!1439479) (not b!1439480) (not b!1439484) (not b!1439483) (not b!1439481) (not start!124494) (not b!1439488) (not b!1439486) (not b!1439482))
(check-sat)
