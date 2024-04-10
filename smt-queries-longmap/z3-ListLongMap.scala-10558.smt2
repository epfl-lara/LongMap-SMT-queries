; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124488 () Bool)

(assert start!124488)

(declare-fun b!1440436 () Bool)

(declare-fun res!972863 () Bool)

(declare-fun e!812184 () Bool)

(assert (=> b!1440436 (=> (not res!972863) (not e!812184))))

(declare-datatypes ((array!97936 0))(
  ( (array!97937 (arr!47256 (Array (_ BitVec 32) (_ BitVec 64))) (size!47806 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97936)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97936 (_ BitVec 32)) Bool)

(assert (=> b!1440436 (= res!972863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440437 () Bool)

(declare-fun res!972871 () Bool)

(declare-fun e!812186 () Bool)

(assert (=> b!1440437 (=> (not res!972871) (not e!812186))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11508 0))(
  ( (MissingZero!11508 (index!48424 (_ BitVec 32))) (Found!11508 (index!48425 (_ BitVec 32))) (Intermediate!11508 (undefined!12320 Bool) (index!48426 (_ BitVec 32)) (x!130149 (_ BitVec 32))) (Undefined!11508) (MissingVacant!11508 (index!48427 (_ BitVec 32))) )
))
(declare-fun lt!632970 () SeekEntryResult!11508)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97936 (_ BitVec 32)) SeekEntryResult!11508)

(assert (=> b!1440437 (= res!972871 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47256 a!2862) j!93) a!2862 mask!2687) lt!632970))))

(declare-fun b!1440438 () Bool)

(declare-fun res!972869 () Bool)

(assert (=> b!1440438 (=> (not res!972869) (not e!812184))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440438 (= res!972869 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47806 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47806 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47806 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47256 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440440 () Bool)

(assert (=> b!1440440 (= e!812184 e!812186)))

(declare-fun res!972864 () Bool)

(assert (=> b!1440440 (=> (not res!972864) (not e!812186))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440440 (= res!972864 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47256 a!2862) j!93) mask!2687) (select (arr!47256 a!2862) j!93) a!2862 mask!2687) lt!632970))))

(assert (=> b!1440440 (= lt!632970 (Intermediate!11508 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440441 () Bool)

(declare-fun res!972868 () Bool)

(assert (=> b!1440441 (=> (not res!972868) (not e!812184))))

(declare-datatypes ((List!33757 0))(
  ( (Nil!33754) (Cons!33753 (h!35103 (_ BitVec 64)) (t!48451 List!33757)) )
))
(declare-fun arrayNoDuplicates!0 (array!97936 (_ BitVec 32) List!33757) Bool)

(assert (=> b!1440441 (= res!972868 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33754))))

(declare-fun b!1440442 () Bool)

(assert (=> b!1440442 (= e!812186 false)))

(declare-fun lt!632969 () SeekEntryResult!11508)

(assert (=> b!1440442 (= lt!632969 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47256 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47256 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97937 (store (arr!47256 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47806 a!2862)) mask!2687))))

(declare-fun b!1440443 () Bool)

(declare-fun res!972867 () Bool)

(assert (=> b!1440443 (=> (not res!972867) (not e!812184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440443 (= res!972867 (validKeyInArray!0 (select (arr!47256 a!2862) j!93)))))

(declare-fun b!1440444 () Bool)

(declare-fun res!972865 () Bool)

(assert (=> b!1440444 (=> (not res!972865) (not e!812184))))

(assert (=> b!1440444 (= res!972865 (and (= (size!47806 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47806 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47806 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440439 () Bool)

(declare-fun res!972866 () Bool)

(assert (=> b!1440439 (=> (not res!972866) (not e!812184))))

(assert (=> b!1440439 (= res!972866 (validKeyInArray!0 (select (arr!47256 a!2862) i!1006)))))

(declare-fun res!972870 () Bool)

(assert (=> start!124488 (=> (not res!972870) (not e!812184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124488 (= res!972870 (validMask!0 mask!2687))))

(assert (=> start!124488 e!812184))

(assert (=> start!124488 true))

(declare-fun array_inv!36284 (array!97936) Bool)

(assert (=> start!124488 (array_inv!36284 a!2862)))

(assert (= (and start!124488 res!972870) b!1440444))

(assert (= (and b!1440444 res!972865) b!1440439))

(assert (= (and b!1440439 res!972866) b!1440443))

(assert (= (and b!1440443 res!972867) b!1440436))

(assert (= (and b!1440436 res!972863) b!1440441))

(assert (= (and b!1440441 res!972868) b!1440438))

(assert (= (and b!1440438 res!972869) b!1440440))

(assert (= (and b!1440440 res!972864) b!1440437))

(assert (= (and b!1440437 res!972871) b!1440442))

(declare-fun m!1329627 () Bool)

(assert (=> b!1440442 m!1329627))

(declare-fun m!1329629 () Bool)

(assert (=> b!1440442 m!1329629))

(assert (=> b!1440442 m!1329629))

(declare-fun m!1329631 () Bool)

(assert (=> b!1440442 m!1329631))

(assert (=> b!1440442 m!1329631))

(assert (=> b!1440442 m!1329629))

(declare-fun m!1329633 () Bool)

(assert (=> b!1440442 m!1329633))

(declare-fun m!1329635 () Bool)

(assert (=> start!124488 m!1329635))

(declare-fun m!1329637 () Bool)

(assert (=> start!124488 m!1329637))

(assert (=> b!1440438 m!1329627))

(declare-fun m!1329639 () Bool)

(assert (=> b!1440438 m!1329639))

(declare-fun m!1329641 () Bool)

(assert (=> b!1440440 m!1329641))

(assert (=> b!1440440 m!1329641))

(declare-fun m!1329643 () Bool)

(assert (=> b!1440440 m!1329643))

(assert (=> b!1440440 m!1329643))

(assert (=> b!1440440 m!1329641))

(declare-fun m!1329645 () Bool)

(assert (=> b!1440440 m!1329645))

(declare-fun m!1329647 () Bool)

(assert (=> b!1440436 m!1329647))

(declare-fun m!1329649 () Bool)

(assert (=> b!1440441 m!1329649))

(declare-fun m!1329651 () Bool)

(assert (=> b!1440439 m!1329651))

(assert (=> b!1440439 m!1329651))

(declare-fun m!1329653 () Bool)

(assert (=> b!1440439 m!1329653))

(assert (=> b!1440437 m!1329641))

(assert (=> b!1440437 m!1329641))

(declare-fun m!1329655 () Bool)

(assert (=> b!1440437 m!1329655))

(assert (=> b!1440443 m!1329641))

(assert (=> b!1440443 m!1329641))

(declare-fun m!1329657 () Bool)

(assert (=> b!1440443 m!1329657))

(check-sat (not b!1440442) (not b!1440440) (not b!1440437) (not b!1440439) (not b!1440443) (not b!1440436) (not start!124488) (not b!1440441))
(check-sat)
