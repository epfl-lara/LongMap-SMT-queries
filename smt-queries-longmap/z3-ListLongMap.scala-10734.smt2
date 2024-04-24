; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125820 () Bool)

(assert start!125820)

(declare-fun b!1470539 () Bool)

(declare-fun res!997985 () Bool)

(declare-fun e!825775 () Bool)

(assert (=> b!1470539 (=> (not res!997985) (not e!825775))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99106 0))(
  ( (array!99107 (arr!47836 (Array (_ BitVec 32) (_ BitVec 64))) (size!48387 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99106)

(assert (=> b!1470539 (= res!997985 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48387 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48387 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48387 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47836 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1470540 () Bool)

(declare-fun res!997987 () Bool)

(assert (=> b!1470540 (=> (not res!997987) (not e!825775))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99106 (_ BitVec 32)) Bool)

(assert (=> b!1470540 (= res!997987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470541 () Bool)

(declare-fun res!997988 () Bool)

(assert (=> b!1470541 (=> (not res!997988) (not e!825775))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1470541 (= res!997988 (and (= (size!48387 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48387 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48387 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!997980 () Bool)

(assert (=> start!125820 (=> (not res!997980) (not e!825775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125820 (= res!997980 (validMask!0 mask!2687))))

(assert (=> start!125820 e!825775))

(assert (=> start!125820 true))

(declare-fun array_inv!37117 (array!99106) Bool)

(assert (=> start!125820 (array_inv!37117 a!2862)))

(declare-fun b!1470542 () Bool)

(declare-fun res!997982 () Bool)

(declare-fun e!825776 () Bool)

(assert (=> b!1470542 (=> (not res!997982) (not e!825776))))

(declare-datatypes ((SeekEntryResult!11973 0))(
  ( (MissingZero!11973 (index!50284 (_ BitVec 32))) (Found!11973 (index!50285 (_ BitVec 32))) (Intermediate!11973 (undefined!12785 Bool) (index!50286 (_ BitVec 32)) (x!132055 (_ BitVec 32))) (Undefined!11973) (MissingVacant!11973 (index!50287 (_ BitVec 32))) )
))
(declare-fun lt!643015 () SeekEntryResult!11973)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99106 (_ BitVec 32)) SeekEntryResult!11973)

(assert (=> b!1470542 (= res!997982 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47836 a!2862) j!93) a!2862 mask!2687) lt!643015))))

(declare-fun b!1470543 () Bool)

(declare-fun res!997981 () Bool)

(assert (=> b!1470543 (=> (not res!997981) (not e!825775))))

(declare-datatypes ((List!34324 0))(
  ( (Nil!34321) (Cons!34320 (h!35684 (_ BitVec 64)) (t!49010 List!34324)) )
))
(declare-fun arrayNoDuplicates!0 (array!99106 (_ BitVec 32) List!34324) Bool)

(assert (=> b!1470543 (= res!997981 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34321))))

(declare-fun b!1470544 () Bool)

(declare-fun res!997984 () Bool)

(assert (=> b!1470544 (=> (not res!997984) (not e!825775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470544 (= res!997984 (validKeyInArray!0 (select (arr!47836 a!2862) j!93)))))

(declare-fun b!1470545 () Bool)

(declare-fun res!997983 () Bool)

(assert (=> b!1470545 (=> (not res!997983) (not e!825775))))

(assert (=> b!1470545 (= res!997983 (validKeyInArray!0 (select (arr!47836 a!2862) i!1006)))))

(declare-fun b!1470546 () Bool)

(assert (=> b!1470546 (= e!825776 false)))

(declare-fun lt!643014 () SeekEntryResult!11973)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470546 (= lt!643014 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47836 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47836 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!99107 (store (arr!47836 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48387 a!2862)) mask!2687))))

(declare-fun b!1470547 () Bool)

(assert (=> b!1470547 (= e!825775 e!825776)))

(declare-fun res!997986 () Bool)

(assert (=> b!1470547 (=> (not res!997986) (not e!825776))))

(assert (=> b!1470547 (= res!997986 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47836 a!2862) j!93) mask!2687) (select (arr!47836 a!2862) j!93) a!2862 mask!2687) lt!643015))))

(assert (=> b!1470547 (= lt!643015 (Intermediate!11973 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125820 res!997980) b!1470541))

(assert (= (and b!1470541 res!997988) b!1470545))

(assert (= (and b!1470545 res!997983) b!1470544))

(assert (= (and b!1470544 res!997984) b!1470540))

(assert (= (and b!1470540 res!997987) b!1470543))

(assert (= (and b!1470543 res!997981) b!1470539))

(assert (= (and b!1470539 res!997985) b!1470547))

(assert (= (and b!1470547 res!997986) b!1470542))

(assert (= (and b!1470542 res!997982) b!1470546))

(declare-fun m!1357651 () Bool)

(assert (=> b!1470543 m!1357651))

(declare-fun m!1357653 () Bool)

(assert (=> b!1470546 m!1357653))

(declare-fun m!1357655 () Bool)

(assert (=> b!1470546 m!1357655))

(assert (=> b!1470546 m!1357655))

(declare-fun m!1357657 () Bool)

(assert (=> b!1470546 m!1357657))

(assert (=> b!1470546 m!1357657))

(assert (=> b!1470546 m!1357655))

(declare-fun m!1357659 () Bool)

(assert (=> b!1470546 m!1357659))

(declare-fun m!1357661 () Bool)

(assert (=> b!1470542 m!1357661))

(assert (=> b!1470542 m!1357661))

(declare-fun m!1357663 () Bool)

(assert (=> b!1470542 m!1357663))

(declare-fun m!1357665 () Bool)

(assert (=> b!1470540 m!1357665))

(assert (=> b!1470544 m!1357661))

(assert (=> b!1470544 m!1357661))

(declare-fun m!1357667 () Bool)

(assert (=> b!1470544 m!1357667))

(assert (=> b!1470539 m!1357653))

(declare-fun m!1357669 () Bool)

(assert (=> b!1470539 m!1357669))

(declare-fun m!1357671 () Bool)

(assert (=> start!125820 m!1357671))

(declare-fun m!1357673 () Bool)

(assert (=> start!125820 m!1357673))

(declare-fun m!1357675 () Bool)

(assert (=> b!1470545 m!1357675))

(assert (=> b!1470545 m!1357675))

(declare-fun m!1357677 () Bool)

(assert (=> b!1470545 m!1357677))

(assert (=> b!1470547 m!1357661))

(assert (=> b!1470547 m!1357661))

(declare-fun m!1357679 () Bool)

(assert (=> b!1470547 m!1357679))

(assert (=> b!1470547 m!1357679))

(assert (=> b!1470547 m!1357661))

(declare-fun m!1357681 () Bool)

(assert (=> b!1470547 m!1357681))

(check-sat (not b!1470542) (not b!1470546) (not b!1470547) (not b!1470543) (not b!1470540) (not b!1470544) (not start!125820) (not b!1470545))
(check-sat)
