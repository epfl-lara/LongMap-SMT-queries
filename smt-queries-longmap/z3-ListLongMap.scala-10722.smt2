; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125748 () Bool)

(assert start!125748)

(declare-fun b!1469567 () Bool)

(declare-fun res!997013 () Bool)

(declare-fun e!825453 () Bool)

(assert (=> b!1469567 (=> (not res!997013) (not e!825453))))

(declare-datatypes ((array!99034 0))(
  ( (array!99035 (arr!47800 (Array (_ BitVec 32) (_ BitVec 64))) (size!48351 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99034)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469567 (= res!997013 (validKeyInArray!0 (select (arr!47800 a!2862) j!93)))))

(declare-fun b!1469568 () Bool)

(declare-fun res!997009 () Bool)

(assert (=> b!1469568 (=> (not res!997009) (not e!825453))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1469568 (= res!997009 (and (= (size!48351 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48351 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48351 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469569 () Bool)

(declare-fun e!825451 () Bool)

(assert (=> b!1469569 (= e!825451 false)))

(declare-fun lt!642799 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469569 (= lt!642799 (toIndex!0 (select (store (arr!47800 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1469570 () Bool)

(declare-fun res!997010 () Bool)

(assert (=> b!1469570 (=> (not res!997010) (not e!825451))))

(declare-datatypes ((SeekEntryResult!11937 0))(
  ( (MissingZero!11937 (index!50140 (_ BitVec 32))) (Found!11937 (index!50141 (_ BitVec 32))) (Intermediate!11937 (undefined!12749 Bool) (index!50142 (_ BitVec 32)) (x!131923 (_ BitVec 32))) (Undefined!11937) (MissingVacant!11937 (index!50143 (_ BitVec 32))) )
))
(declare-fun lt!642798 () SeekEntryResult!11937)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99034 (_ BitVec 32)) SeekEntryResult!11937)

(assert (=> b!1469570 (= res!997010 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47800 a!2862) j!93) a!2862 mask!2687) lt!642798))))

(declare-fun b!1469571 () Bool)

(declare-fun res!997008 () Bool)

(assert (=> b!1469571 (=> (not res!997008) (not e!825453))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1469571 (= res!997008 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48351 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48351 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48351 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47800 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!997016 () Bool)

(assert (=> start!125748 (=> (not res!997016) (not e!825453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125748 (= res!997016 (validMask!0 mask!2687))))

(assert (=> start!125748 e!825453))

(assert (=> start!125748 true))

(declare-fun array_inv!37081 (array!99034) Bool)

(assert (=> start!125748 (array_inv!37081 a!2862)))

(declare-fun b!1469572 () Bool)

(declare-fun res!997012 () Bool)

(assert (=> b!1469572 (=> (not res!997012) (not e!825453))))

(declare-datatypes ((List!34288 0))(
  ( (Nil!34285) (Cons!34284 (h!35648 (_ BitVec 64)) (t!48974 List!34288)) )
))
(declare-fun arrayNoDuplicates!0 (array!99034 (_ BitVec 32) List!34288) Bool)

(assert (=> b!1469572 (= res!997012 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34285))))

(declare-fun b!1469573 () Bool)

(declare-fun res!997015 () Bool)

(assert (=> b!1469573 (=> (not res!997015) (not e!825453))))

(assert (=> b!1469573 (= res!997015 (validKeyInArray!0 (select (arr!47800 a!2862) i!1006)))))

(declare-fun b!1469574 () Bool)

(declare-fun res!997011 () Bool)

(assert (=> b!1469574 (=> (not res!997011) (not e!825453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99034 (_ BitVec 32)) Bool)

(assert (=> b!1469574 (= res!997011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469575 () Bool)

(assert (=> b!1469575 (= e!825453 e!825451)))

(declare-fun res!997014 () Bool)

(assert (=> b!1469575 (=> (not res!997014) (not e!825451))))

(assert (=> b!1469575 (= res!997014 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47800 a!2862) j!93) mask!2687) (select (arr!47800 a!2862) j!93) a!2862 mask!2687) lt!642798))))

(assert (=> b!1469575 (= lt!642798 (Intermediate!11937 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125748 res!997016) b!1469568))

(assert (= (and b!1469568 res!997009) b!1469573))

(assert (= (and b!1469573 res!997015) b!1469567))

(assert (= (and b!1469567 res!997013) b!1469574))

(assert (= (and b!1469574 res!997011) b!1469572))

(assert (= (and b!1469572 res!997012) b!1469571))

(assert (= (and b!1469571 res!997008) b!1469575))

(assert (= (and b!1469575 res!997014) b!1469570))

(assert (= (and b!1469570 res!997010) b!1469569))

(declare-fun m!1356511 () Bool)

(assert (=> start!125748 m!1356511))

(declare-fun m!1356513 () Bool)

(assert (=> start!125748 m!1356513))

(declare-fun m!1356515 () Bool)

(assert (=> b!1469574 m!1356515))

(declare-fun m!1356517 () Bool)

(assert (=> b!1469569 m!1356517))

(declare-fun m!1356519 () Bool)

(assert (=> b!1469569 m!1356519))

(assert (=> b!1469569 m!1356519))

(declare-fun m!1356521 () Bool)

(assert (=> b!1469569 m!1356521))

(declare-fun m!1356523 () Bool)

(assert (=> b!1469567 m!1356523))

(assert (=> b!1469567 m!1356523))

(declare-fun m!1356525 () Bool)

(assert (=> b!1469567 m!1356525))

(declare-fun m!1356527 () Bool)

(assert (=> b!1469573 m!1356527))

(assert (=> b!1469573 m!1356527))

(declare-fun m!1356529 () Bool)

(assert (=> b!1469573 m!1356529))

(assert (=> b!1469575 m!1356523))

(assert (=> b!1469575 m!1356523))

(declare-fun m!1356531 () Bool)

(assert (=> b!1469575 m!1356531))

(assert (=> b!1469575 m!1356531))

(assert (=> b!1469575 m!1356523))

(declare-fun m!1356533 () Bool)

(assert (=> b!1469575 m!1356533))

(declare-fun m!1356535 () Bool)

(assert (=> b!1469572 m!1356535))

(assert (=> b!1469570 m!1356523))

(assert (=> b!1469570 m!1356523))

(declare-fun m!1356537 () Bool)

(assert (=> b!1469570 m!1356537))

(assert (=> b!1469571 m!1356517))

(declare-fun m!1356539 () Bool)

(assert (=> b!1469571 m!1356539))

(check-sat (not b!1469567) (not b!1469574) (not b!1469573) (not start!125748) (not b!1469575) (not b!1469570) (not b!1469572) (not b!1469569))
(check-sat)
