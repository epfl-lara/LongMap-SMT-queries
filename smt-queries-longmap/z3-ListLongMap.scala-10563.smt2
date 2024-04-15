; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124486 () Bool)

(assert start!124486)

(declare-fun b!1440650 () Bool)

(declare-fun res!973194 () Bool)

(declare-fun e!812195 () Bool)

(assert (=> b!1440650 (=> (not res!973194) (not e!812195))))

(declare-datatypes ((array!97912 0))(
  ( (array!97913 (arr!47245 (Array (_ BitVec 32) (_ BitVec 64))) (size!47797 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97912)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440650 (= res!973194 (validKeyInArray!0 (select (arr!47245 a!2862) j!93)))))

(declare-fun res!973202 () Bool)

(assert (=> start!124486 (=> (not res!973202) (not e!812195))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124486 (= res!973202 (validMask!0 mask!2687))))

(assert (=> start!124486 e!812195))

(assert (=> start!124486 true))

(declare-fun array_inv!36478 (array!97912) Bool)

(assert (=> start!124486 (array_inv!36478 a!2862)))

(declare-fun b!1440651 () Bool)

(declare-fun res!973199 () Bool)

(assert (=> b!1440651 (=> (not res!973199) (not e!812195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97912 (_ BitVec 32)) Bool)

(assert (=> b!1440651 (= res!973199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440652 () Bool)

(declare-fun res!973203 () Bool)

(assert (=> b!1440652 (=> (not res!973203) (not e!812195))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440652 (= res!973203 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47797 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47797 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47797 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47245 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440653 () Bool)

(declare-fun res!973197 () Bool)

(assert (=> b!1440653 (=> (not res!973197) (not e!812195))))

(declare-datatypes ((List!33824 0))(
  ( (Nil!33821) (Cons!33820 (h!35170 (_ BitVec 64)) (t!48510 List!33824)) )
))
(declare-fun arrayNoDuplicates!0 (array!97912 (_ BitVec 32) List!33824) Bool)

(assert (=> b!1440653 (= res!973197 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33821))))

(declare-fun b!1440654 () Bool)

(declare-fun res!973198 () Bool)

(assert (=> b!1440654 (=> (not res!973198) (not e!812195))))

(assert (=> b!1440654 (= res!973198 (and (= (size!47797 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47797 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47797 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440655 () Bool)

(declare-fun res!973196 () Bool)

(declare-fun e!812196 () Bool)

(assert (=> b!1440655 (=> (not res!973196) (not e!812196))))

(declare-datatypes ((SeekEntryResult!11522 0))(
  ( (MissingZero!11522 (index!48480 (_ BitVec 32))) (Found!11522 (index!48481 (_ BitVec 32))) (Intermediate!11522 (undefined!12334 Bool) (index!48482 (_ BitVec 32)) (x!130198 (_ BitVec 32))) (Undefined!11522) (MissingVacant!11522 (index!48483 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97912 (_ BitVec 32)) SeekEntryResult!11522)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440655 (= res!973196 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47245 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47245 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97913 (store (arr!47245 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47797 a!2862)) mask!2687) (Intermediate!11522 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1440656 () Bool)

(declare-fun res!973204 () Bool)

(assert (=> b!1440656 (=> (not res!973204) (not e!812196))))

(declare-fun lt!632799 () SeekEntryResult!11522)

(assert (=> b!1440656 (= res!973204 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47245 a!2862) j!93) a!2862 mask!2687) lt!632799))))

(declare-fun b!1440657 () Bool)

(declare-fun res!973201 () Bool)

(assert (=> b!1440657 (=> (not res!973201) (not e!812196))))

(assert (=> b!1440657 (= res!973201 (and (bvsgt x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1440658 () Bool)

(declare-fun res!973195 () Bool)

(assert (=> b!1440658 (=> (not res!973195) (not e!812195))))

(assert (=> b!1440658 (= res!973195 (validKeyInArray!0 (select (arr!47245 a!2862) i!1006)))))

(declare-fun b!1440659 () Bool)

(assert (=> b!1440659 (= e!812196 (not (validKeyInArray!0 (select (store (arr!47245 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(declare-fun b!1440660 () Bool)

(assert (=> b!1440660 (= e!812195 e!812196)))

(declare-fun res!973200 () Bool)

(assert (=> b!1440660 (=> (not res!973200) (not e!812196))))

(assert (=> b!1440660 (= res!973200 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47245 a!2862) j!93) mask!2687) (select (arr!47245 a!2862) j!93) a!2862 mask!2687) lt!632799))))

(assert (=> b!1440660 (= lt!632799 (Intermediate!11522 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124486 res!973202) b!1440654))

(assert (= (and b!1440654 res!973198) b!1440658))

(assert (= (and b!1440658 res!973195) b!1440650))

(assert (= (and b!1440650 res!973194) b!1440651))

(assert (= (and b!1440651 res!973199) b!1440653))

(assert (= (and b!1440653 res!973197) b!1440652))

(assert (= (and b!1440652 res!973203) b!1440660))

(assert (= (and b!1440660 res!973200) b!1440656))

(assert (= (and b!1440656 res!973204) b!1440655))

(assert (= (and b!1440655 res!973196) b!1440657))

(assert (= (and b!1440657 res!973201) b!1440659))

(declare-fun m!1329405 () Bool)

(assert (=> b!1440659 m!1329405))

(declare-fun m!1329407 () Bool)

(assert (=> b!1440659 m!1329407))

(assert (=> b!1440659 m!1329407))

(declare-fun m!1329409 () Bool)

(assert (=> b!1440659 m!1329409))

(declare-fun m!1329411 () Bool)

(assert (=> b!1440656 m!1329411))

(assert (=> b!1440656 m!1329411))

(declare-fun m!1329413 () Bool)

(assert (=> b!1440656 m!1329413))

(declare-fun m!1329415 () Bool)

(assert (=> b!1440658 m!1329415))

(assert (=> b!1440658 m!1329415))

(declare-fun m!1329417 () Bool)

(assert (=> b!1440658 m!1329417))

(assert (=> b!1440655 m!1329405))

(assert (=> b!1440655 m!1329407))

(assert (=> b!1440655 m!1329407))

(declare-fun m!1329419 () Bool)

(assert (=> b!1440655 m!1329419))

(assert (=> b!1440655 m!1329419))

(assert (=> b!1440655 m!1329407))

(declare-fun m!1329421 () Bool)

(assert (=> b!1440655 m!1329421))

(assert (=> b!1440650 m!1329411))

(assert (=> b!1440650 m!1329411))

(declare-fun m!1329423 () Bool)

(assert (=> b!1440650 m!1329423))

(declare-fun m!1329425 () Bool)

(assert (=> b!1440651 m!1329425))

(declare-fun m!1329427 () Bool)

(assert (=> b!1440653 m!1329427))

(assert (=> b!1440652 m!1329405))

(declare-fun m!1329429 () Bool)

(assert (=> b!1440652 m!1329429))

(assert (=> b!1440660 m!1329411))

(assert (=> b!1440660 m!1329411))

(declare-fun m!1329431 () Bool)

(assert (=> b!1440660 m!1329431))

(assert (=> b!1440660 m!1329431))

(assert (=> b!1440660 m!1329411))

(declare-fun m!1329433 () Bool)

(assert (=> b!1440660 m!1329433))

(declare-fun m!1329435 () Bool)

(assert (=> start!124486 m!1329435))

(declare-fun m!1329437 () Bool)

(assert (=> start!124486 m!1329437))

(check-sat (not b!1440659) (not b!1440655) (not b!1440660) (not b!1440656) (not b!1440653) (not b!1440651) (not start!124486) (not b!1440658) (not b!1440650))
(check-sat)
