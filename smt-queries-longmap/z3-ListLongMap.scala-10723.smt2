; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125754 () Bool)

(assert start!125754)

(declare-fun b!1469648 () Bool)

(declare-fun res!997092 () Bool)

(declare-fun e!825479 () Bool)

(assert (=> b!1469648 (=> (not res!997092) (not e!825479))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99040 0))(
  ( (array!99041 (arr!47803 (Array (_ BitVec 32) (_ BitVec 64))) (size!48354 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99040)

(assert (=> b!1469648 (= res!997092 (and (= (size!48354 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48354 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48354 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469649 () Bool)

(declare-fun res!997090 () Bool)

(declare-fun e!825478 () Bool)

(assert (=> b!1469649 (=> (not res!997090) (not e!825478))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11940 0))(
  ( (MissingZero!11940 (index!50152 (_ BitVec 32))) (Found!11940 (index!50153 (_ BitVec 32))) (Intermediate!11940 (undefined!12752 Bool) (index!50154 (_ BitVec 32)) (x!131934 (_ BitVec 32))) (Undefined!11940) (MissingVacant!11940 (index!50155 (_ BitVec 32))) )
))
(declare-fun lt!642816 () SeekEntryResult!11940)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99040 (_ BitVec 32)) SeekEntryResult!11940)

(assert (=> b!1469649 (= res!997090 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47803 a!2862) j!93) a!2862 mask!2687) lt!642816))))

(declare-fun b!1469651 () Bool)

(declare-fun res!997089 () Bool)

(assert (=> b!1469651 (=> (not res!997089) (not e!825479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99040 (_ BitVec 32)) Bool)

(assert (=> b!1469651 (= res!997089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469652 () Bool)

(assert (=> b!1469652 (= e!825478 false)))

(declare-fun lt!642817 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469652 (= lt!642817 (toIndex!0 (select (store (arr!47803 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1469653 () Bool)

(declare-fun res!997091 () Bool)

(assert (=> b!1469653 (=> (not res!997091) (not e!825479))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1469653 (= res!997091 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48354 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48354 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48354 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47803 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1469654 () Bool)

(declare-fun res!997097 () Bool)

(assert (=> b!1469654 (=> (not res!997097) (not e!825479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469654 (= res!997097 (validKeyInArray!0 (select (arr!47803 a!2862) i!1006)))))

(declare-fun b!1469650 () Bool)

(declare-fun res!997093 () Bool)

(assert (=> b!1469650 (=> (not res!997093) (not e!825479))))

(assert (=> b!1469650 (= res!997093 (validKeyInArray!0 (select (arr!47803 a!2862) j!93)))))

(declare-fun res!997096 () Bool)

(assert (=> start!125754 (=> (not res!997096) (not e!825479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125754 (= res!997096 (validMask!0 mask!2687))))

(assert (=> start!125754 e!825479))

(assert (=> start!125754 true))

(declare-fun array_inv!37084 (array!99040) Bool)

(assert (=> start!125754 (array_inv!37084 a!2862)))

(declare-fun b!1469655 () Bool)

(declare-fun res!997094 () Bool)

(assert (=> b!1469655 (=> (not res!997094) (not e!825479))))

(declare-datatypes ((List!34291 0))(
  ( (Nil!34288) (Cons!34287 (h!35651 (_ BitVec 64)) (t!48977 List!34291)) )
))
(declare-fun arrayNoDuplicates!0 (array!99040 (_ BitVec 32) List!34291) Bool)

(assert (=> b!1469655 (= res!997094 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34288))))

(declare-fun b!1469656 () Bool)

(assert (=> b!1469656 (= e!825479 e!825478)))

(declare-fun res!997095 () Bool)

(assert (=> b!1469656 (=> (not res!997095) (not e!825478))))

(assert (=> b!1469656 (= res!997095 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47803 a!2862) j!93) mask!2687) (select (arr!47803 a!2862) j!93) a!2862 mask!2687) lt!642816))))

(assert (=> b!1469656 (= lt!642816 (Intermediate!11940 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125754 res!997096) b!1469648))

(assert (= (and b!1469648 res!997092) b!1469654))

(assert (= (and b!1469654 res!997097) b!1469650))

(assert (= (and b!1469650 res!997093) b!1469651))

(assert (= (and b!1469651 res!997089) b!1469655))

(assert (= (and b!1469655 res!997094) b!1469653))

(assert (= (and b!1469653 res!997091) b!1469656))

(assert (= (and b!1469656 res!997095) b!1469649))

(assert (= (and b!1469649 res!997090) b!1469652))

(declare-fun m!1356601 () Bool)

(assert (=> b!1469656 m!1356601))

(assert (=> b!1469656 m!1356601))

(declare-fun m!1356603 () Bool)

(assert (=> b!1469656 m!1356603))

(assert (=> b!1469656 m!1356603))

(assert (=> b!1469656 m!1356601))

(declare-fun m!1356605 () Bool)

(assert (=> b!1469656 m!1356605))

(declare-fun m!1356607 () Bool)

(assert (=> b!1469653 m!1356607))

(declare-fun m!1356609 () Bool)

(assert (=> b!1469653 m!1356609))

(declare-fun m!1356611 () Bool)

(assert (=> start!125754 m!1356611))

(declare-fun m!1356613 () Bool)

(assert (=> start!125754 m!1356613))

(assert (=> b!1469649 m!1356601))

(assert (=> b!1469649 m!1356601))

(declare-fun m!1356615 () Bool)

(assert (=> b!1469649 m!1356615))

(declare-fun m!1356617 () Bool)

(assert (=> b!1469651 m!1356617))

(assert (=> b!1469652 m!1356607))

(declare-fun m!1356619 () Bool)

(assert (=> b!1469652 m!1356619))

(assert (=> b!1469652 m!1356619))

(declare-fun m!1356621 () Bool)

(assert (=> b!1469652 m!1356621))

(assert (=> b!1469650 m!1356601))

(assert (=> b!1469650 m!1356601))

(declare-fun m!1356623 () Bool)

(assert (=> b!1469650 m!1356623))

(declare-fun m!1356625 () Bool)

(assert (=> b!1469654 m!1356625))

(assert (=> b!1469654 m!1356625))

(declare-fun m!1356627 () Bool)

(assert (=> b!1469654 m!1356627))

(declare-fun m!1356629 () Bool)

(assert (=> b!1469655 m!1356629))

(check-sat (not b!1469654) (not start!125754) (not b!1469656) (not b!1469649) (not b!1469655) (not b!1469652) (not b!1469650) (not b!1469651))
(check-sat)
