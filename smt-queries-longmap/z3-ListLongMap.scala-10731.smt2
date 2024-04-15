; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125494 () Bool)

(assert start!125494)

(declare-fun b!1468393 () Bool)

(declare-fun res!997053 () Bool)

(declare-fun e!824515 () Bool)

(assert (=> b!1468393 (=> (not res!997053) (not e!824515))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98920 0))(
  ( (array!98921 (arr!47749 (Array (_ BitVec 32) (_ BitVec 64))) (size!48301 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98920)

(assert (=> b!1468393 (= res!997053 (and (= (size!48301 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48301 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48301 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468394 () Bool)

(declare-fun res!997055 () Bool)

(assert (=> b!1468394 (=> (not res!997055) (not e!824515))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468394 (= res!997055 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48301 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48301 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48301 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47749 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468396 () Bool)

(declare-fun res!997049 () Bool)

(assert (=> b!1468396 (=> (not res!997049) (not e!824515))))

(declare-datatypes ((List!34328 0))(
  ( (Nil!34325) (Cons!34324 (h!35674 (_ BitVec 64)) (t!49014 List!34328)) )
))
(declare-fun arrayNoDuplicates!0 (array!98920 (_ BitVec 32) List!34328) Bool)

(assert (=> b!1468396 (= res!997049 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34325))))

(declare-fun b!1468397 () Bool)

(declare-fun res!997052 () Bool)

(declare-fun e!824517 () Bool)

(assert (=> b!1468397 (=> (not res!997052) (not e!824517))))

(declare-datatypes ((SeekEntryResult!12014 0))(
  ( (MissingZero!12014 (index!50448 (_ BitVec 32))) (Found!12014 (index!50449 (_ BitVec 32))) (Intermediate!12014 (undefined!12826 Bool) (index!50450 (_ BitVec 32)) (x!132034 (_ BitVec 32))) (Undefined!12014) (MissingVacant!12014 (index!50451 (_ BitVec 32))) )
))
(declare-fun lt!642089 () SeekEntryResult!12014)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98920 (_ BitVec 32)) SeekEntryResult!12014)

(assert (=> b!1468397 (= res!997052 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47749 a!2862) j!93) a!2862 mask!2687) lt!642089))))

(declare-fun b!1468398 () Bool)

(declare-fun res!997056 () Bool)

(assert (=> b!1468398 (=> (not res!997056) (not e!824515))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468398 (= res!997056 (validKeyInArray!0 (select (arr!47749 a!2862) i!1006)))))

(declare-fun b!1468399 () Bool)

(declare-fun res!997054 () Bool)

(assert (=> b!1468399 (=> (not res!997054) (not e!824515))))

(assert (=> b!1468399 (= res!997054 (validKeyInArray!0 (select (arr!47749 a!2862) j!93)))))

(declare-fun b!1468400 () Bool)

(assert (=> b!1468400 (= e!824517 false)))

(declare-fun lt!642090 () SeekEntryResult!12014)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468400 (= lt!642090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47749 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47749 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98921 (store (arr!47749 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48301 a!2862)) mask!2687))))

(declare-fun b!1468401 () Bool)

(assert (=> b!1468401 (= e!824515 e!824517)))

(declare-fun res!997051 () Bool)

(assert (=> b!1468401 (=> (not res!997051) (not e!824517))))

(assert (=> b!1468401 (= res!997051 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47749 a!2862) j!93) mask!2687) (select (arr!47749 a!2862) j!93) a!2862 mask!2687) lt!642089))))

(assert (=> b!1468401 (= lt!642089 (Intermediate!12014 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468395 () Bool)

(declare-fun res!997050 () Bool)

(assert (=> b!1468395 (=> (not res!997050) (not e!824515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98920 (_ BitVec 32)) Bool)

(assert (=> b!1468395 (= res!997050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!997057 () Bool)

(assert (=> start!125494 (=> (not res!997057) (not e!824515))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125494 (= res!997057 (validMask!0 mask!2687))))

(assert (=> start!125494 e!824515))

(assert (=> start!125494 true))

(declare-fun array_inv!36982 (array!98920) Bool)

(assert (=> start!125494 (array_inv!36982 a!2862)))

(assert (= (and start!125494 res!997057) b!1468393))

(assert (= (and b!1468393 res!997053) b!1468398))

(assert (= (and b!1468398 res!997056) b!1468399))

(assert (= (and b!1468399 res!997054) b!1468395))

(assert (= (and b!1468395 res!997050) b!1468396))

(assert (= (and b!1468396 res!997049) b!1468394))

(assert (= (and b!1468394 res!997055) b!1468401))

(assert (= (and b!1468401 res!997051) b!1468397))

(assert (= (and b!1468397 res!997052) b!1468400))

(declare-fun m!1355001 () Bool)

(assert (=> b!1468399 m!1355001))

(assert (=> b!1468399 m!1355001))

(declare-fun m!1355003 () Bool)

(assert (=> b!1468399 m!1355003))

(declare-fun m!1355005 () Bool)

(assert (=> b!1468394 m!1355005))

(declare-fun m!1355007 () Bool)

(assert (=> b!1468394 m!1355007))

(assert (=> b!1468397 m!1355001))

(assert (=> b!1468397 m!1355001))

(declare-fun m!1355009 () Bool)

(assert (=> b!1468397 m!1355009))

(declare-fun m!1355011 () Bool)

(assert (=> start!125494 m!1355011))

(declare-fun m!1355013 () Bool)

(assert (=> start!125494 m!1355013))

(assert (=> b!1468400 m!1355005))

(declare-fun m!1355015 () Bool)

(assert (=> b!1468400 m!1355015))

(assert (=> b!1468400 m!1355015))

(declare-fun m!1355017 () Bool)

(assert (=> b!1468400 m!1355017))

(assert (=> b!1468400 m!1355017))

(assert (=> b!1468400 m!1355015))

(declare-fun m!1355019 () Bool)

(assert (=> b!1468400 m!1355019))

(declare-fun m!1355021 () Bool)

(assert (=> b!1468396 m!1355021))

(assert (=> b!1468401 m!1355001))

(assert (=> b!1468401 m!1355001))

(declare-fun m!1355023 () Bool)

(assert (=> b!1468401 m!1355023))

(assert (=> b!1468401 m!1355023))

(assert (=> b!1468401 m!1355001))

(declare-fun m!1355025 () Bool)

(assert (=> b!1468401 m!1355025))

(declare-fun m!1355027 () Bool)

(assert (=> b!1468398 m!1355027))

(assert (=> b!1468398 m!1355027))

(declare-fun m!1355029 () Bool)

(assert (=> b!1468398 m!1355029))

(declare-fun m!1355031 () Bool)

(assert (=> b!1468395 m!1355031))

(check-sat (not b!1468397) (not b!1468400) (not b!1468399) (not start!125494) (not b!1468396) (not b!1468395) (not b!1468401) (not b!1468398))
(check-sat)
