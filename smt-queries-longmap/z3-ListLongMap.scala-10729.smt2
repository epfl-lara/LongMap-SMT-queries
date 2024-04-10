; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125514 () Bool)

(assert start!125514)

(declare-fun b!1468453 () Bool)

(declare-fun res!996994 () Bool)

(declare-fun e!824586 () Bool)

(assert (=> b!1468453 (=> (not res!996994) (not e!824586))))

(declare-datatypes ((array!98962 0))(
  ( (array!98963 (arr!47769 (Array (_ BitVec 32) (_ BitVec 64))) (size!48319 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98962)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468453 (= res!996994 (validKeyInArray!0 (select (arr!47769 a!2862) j!93)))))

(declare-fun b!1468454 () Bool)

(declare-fun res!996993 () Bool)

(assert (=> b!1468454 (=> (not res!996993) (not e!824586))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1468454 (= res!996993 (and (= (size!48319 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48319 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48319 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468455 () Bool)

(declare-fun res!996999 () Bool)

(declare-fun e!824588 () Bool)

(assert (=> b!1468455 (=> (not res!996999) (not e!824588))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12009 0))(
  ( (MissingZero!12009 (index!50428 (_ BitVec 32))) (Found!12009 (index!50429 (_ BitVec 32))) (Intermediate!12009 (undefined!12821 Bool) (index!50430 (_ BitVec 32)) (x!132018 (_ BitVec 32))) (Undefined!12009) (MissingVacant!12009 (index!50431 (_ BitVec 32))) )
))
(declare-fun lt!642294 () SeekEntryResult!12009)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98962 (_ BitVec 32)) SeekEntryResult!12009)

(assert (=> b!1468455 (= res!996999 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47769 a!2862) j!93) a!2862 mask!2687) lt!642294))))

(declare-fun b!1468456 () Bool)

(declare-fun res!996996 () Bool)

(assert (=> b!1468456 (=> (not res!996996) (not e!824586))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468456 (= res!996996 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48319 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48319 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48319 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47769 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468457 () Bool)

(declare-fun res!996995 () Bool)

(assert (=> b!1468457 (=> (not res!996995) (not e!824586))))

(declare-datatypes ((List!34270 0))(
  ( (Nil!34267) (Cons!34266 (h!35616 (_ BitVec 64)) (t!48964 List!34270)) )
))
(declare-fun arrayNoDuplicates!0 (array!98962 (_ BitVec 32) List!34270) Bool)

(assert (=> b!1468457 (= res!996995 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34267))))

(declare-fun b!1468459 () Bool)

(declare-fun res!997000 () Bool)

(assert (=> b!1468459 (=> (not res!997000) (not e!824586))))

(assert (=> b!1468459 (= res!997000 (validKeyInArray!0 (select (arr!47769 a!2862) i!1006)))))

(declare-fun b!1468460 () Bool)

(assert (=> b!1468460 (= e!824586 e!824588)))

(declare-fun res!996992 () Bool)

(assert (=> b!1468460 (=> (not res!996992) (not e!824588))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468460 (= res!996992 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47769 a!2862) j!93) mask!2687) (select (arr!47769 a!2862) j!93) a!2862 mask!2687) lt!642294))))

(assert (=> b!1468460 (= lt!642294 (Intermediate!12009 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468461 () Bool)

(assert (=> b!1468461 (= e!824588 false)))

(declare-fun lt!642293 () SeekEntryResult!12009)

(assert (=> b!1468461 (= lt!642293 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47769 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47769 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98963 (store (arr!47769 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48319 a!2862)) mask!2687))))

(declare-fun res!996997 () Bool)

(assert (=> start!125514 (=> (not res!996997) (not e!824586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125514 (= res!996997 (validMask!0 mask!2687))))

(assert (=> start!125514 e!824586))

(assert (=> start!125514 true))

(declare-fun array_inv!36797 (array!98962) Bool)

(assert (=> start!125514 (array_inv!36797 a!2862)))

(declare-fun b!1468458 () Bool)

(declare-fun res!996998 () Bool)

(assert (=> b!1468458 (=> (not res!996998) (not e!824586))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98962 (_ BitVec 32)) Bool)

(assert (=> b!1468458 (= res!996998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125514 res!996997) b!1468454))

(assert (= (and b!1468454 res!996993) b!1468459))

(assert (= (and b!1468459 res!997000) b!1468453))

(assert (= (and b!1468453 res!996994) b!1468458))

(assert (= (and b!1468458 res!996998) b!1468457))

(assert (= (and b!1468457 res!996995) b!1468456))

(assert (= (and b!1468456 res!996996) b!1468460))

(assert (= (and b!1468460 res!996992) b!1468455))

(assert (= (and b!1468455 res!996999) b!1468461))

(declare-fun m!1355517 () Bool)

(assert (=> b!1468459 m!1355517))

(assert (=> b!1468459 m!1355517))

(declare-fun m!1355519 () Bool)

(assert (=> b!1468459 m!1355519))

(declare-fun m!1355521 () Bool)

(assert (=> b!1468455 m!1355521))

(assert (=> b!1468455 m!1355521))

(declare-fun m!1355523 () Bool)

(assert (=> b!1468455 m!1355523))

(declare-fun m!1355525 () Bool)

(assert (=> start!125514 m!1355525))

(declare-fun m!1355527 () Bool)

(assert (=> start!125514 m!1355527))

(declare-fun m!1355529 () Bool)

(assert (=> b!1468461 m!1355529))

(declare-fun m!1355531 () Bool)

(assert (=> b!1468461 m!1355531))

(assert (=> b!1468461 m!1355531))

(declare-fun m!1355533 () Bool)

(assert (=> b!1468461 m!1355533))

(assert (=> b!1468461 m!1355533))

(assert (=> b!1468461 m!1355531))

(declare-fun m!1355535 () Bool)

(assert (=> b!1468461 m!1355535))

(assert (=> b!1468453 m!1355521))

(assert (=> b!1468453 m!1355521))

(declare-fun m!1355537 () Bool)

(assert (=> b!1468453 m!1355537))

(assert (=> b!1468456 m!1355529))

(declare-fun m!1355539 () Bool)

(assert (=> b!1468456 m!1355539))

(declare-fun m!1355541 () Bool)

(assert (=> b!1468457 m!1355541))

(assert (=> b!1468460 m!1355521))

(assert (=> b!1468460 m!1355521))

(declare-fun m!1355543 () Bool)

(assert (=> b!1468460 m!1355543))

(assert (=> b!1468460 m!1355543))

(assert (=> b!1468460 m!1355521))

(declare-fun m!1355545 () Bool)

(assert (=> b!1468460 m!1355545))

(declare-fun m!1355547 () Bool)

(assert (=> b!1468458 m!1355547))

(check-sat (not b!1468459) (not b!1468461) (not b!1468455) (not start!125514) (not b!1468458) (not b!1468453) (not b!1468457) (not b!1468460))
(check-sat)
