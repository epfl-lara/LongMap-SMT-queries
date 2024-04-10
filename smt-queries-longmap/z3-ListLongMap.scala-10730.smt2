; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125520 () Bool)

(assert start!125520)

(declare-fun b!1468534 () Bool)

(declare-fun res!997074 () Bool)

(declare-fun e!824615 () Bool)

(assert (=> b!1468534 (=> (not res!997074) (not e!824615))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98968 0))(
  ( (array!98969 (arr!47772 (Array (_ BitVec 32) (_ BitVec 64))) (size!48322 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98968)

(assert (=> b!1468534 (= res!997074 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48322 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48322 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48322 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47772 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468535 () Bool)

(declare-fun e!824614 () Bool)

(assert (=> b!1468535 (= e!824614 false)))

(declare-datatypes ((SeekEntryResult!12012 0))(
  ( (MissingZero!12012 (index!50440 (_ BitVec 32))) (Found!12012 (index!50441 (_ BitVec 32))) (Intermediate!12012 (undefined!12824 Bool) (index!50442 (_ BitVec 32)) (x!132029 (_ BitVec 32))) (Undefined!12012) (MissingVacant!12012 (index!50443 (_ BitVec 32))) )
))
(declare-fun lt!642312 () SeekEntryResult!12012)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98968 (_ BitVec 32)) SeekEntryResult!12012)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468535 (= lt!642312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47772 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47772 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98969 (store (arr!47772 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48322 a!2862)) mask!2687))))

(declare-fun b!1468536 () Bool)

(declare-fun res!997078 () Bool)

(assert (=> b!1468536 (=> (not res!997078) (not e!824614))))

(declare-fun lt!642311 () SeekEntryResult!12012)

(assert (=> b!1468536 (= res!997078 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47772 a!2862) j!93) a!2862 mask!2687) lt!642311))))

(declare-fun b!1468537 () Bool)

(assert (=> b!1468537 (= e!824615 e!824614)))

(declare-fun res!997080 () Bool)

(assert (=> b!1468537 (=> (not res!997080) (not e!824614))))

(assert (=> b!1468537 (= res!997080 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47772 a!2862) j!93) mask!2687) (select (arr!47772 a!2862) j!93) a!2862 mask!2687) lt!642311))))

(assert (=> b!1468537 (= lt!642311 (Intermediate!12012 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!997075 () Bool)

(assert (=> start!125520 (=> (not res!997075) (not e!824615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125520 (= res!997075 (validMask!0 mask!2687))))

(assert (=> start!125520 e!824615))

(assert (=> start!125520 true))

(declare-fun array_inv!36800 (array!98968) Bool)

(assert (=> start!125520 (array_inv!36800 a!2862)))

(declare-fun b!1468538 () Bool)

(declare-fun res!997077 () Bool)

(assert (=> b!1468538 (=> (not res!997077) (not e!824615))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98968 (_ BitVec 32)) Bool)

(assert (=> b!1468538 (= res!997077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468539 () Bool)

(declare-fun res!997076 () Bool)

(assert (=> b!1468539 (=> (not res!997076) (not e!824615))))

(assert (=> b!1468539 (= res!997076 (and (= (size!48322 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48322 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48322 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468540 () Bool)

(declare-fun res!997073 () Bool)

(assert (=> b!1468540 (=> (not res!997073) (not e!824615))))

(declare-datatypes ((List!34273 0))(
  ( (Nil!34270) (Cons!34269 (h!35619 (_ BitVec 64)) (t!48967 List!34273)) )
))
(declare-fun arrayNoDuplicates!0 (array!98968 (_ BitVec 32) List!34273) Bool)

(assert (=> b!1468540 (= res!997073 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34270))))

(declare-fun b!1468541 () Bool)

(declare-fun res!997081 () Bool)

(assert (=> b!1468541 (=> (not res!997081) (not e!824615))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468541 (= res!997081 (validKeyInArray!0 (select (arr!47772 a!2862) i!1006)))))

(declare-fun b!1468542 () Bool)

(declare-fun res!997079 () Bool)

(assert (=> b!1468542 (=> (not res!997079) (not e!824615))))

(assert (=> b!1468542 (= res!997079 (validKeyInArray!0 (select (arr!47772 a!2862) j!93)))))

(assert (= (and start!125520 res!997075) b!1468539))

(assert (= (and b!1468539 res!997076) b!1468541))

(assert (= (and b!1468541 res!997081) b!1468542))

(assert (= (and b!1468542 res!997079) b!1468538))

(assert (= (and b!1468538 res!997077) b!1468540))

(assert (= (and b!1468540 res!997073) b!1468534))

(assert (= (and b!1468534 res!997074) b!1468537))

(assert (= (and b!1468537 res!997080) b!1468536))

(assert (= (and b!1468536 res!997078) b!1468535))

(declare-fun m!1355613 () Bool)

(assert (=> start!125520 m!1355613))

(declare-fun m!1355615 () Bool)

(assert (=> start!125520 m!1355615))

(declare-fun m!1355617 () Bool)

(assert (=> b!1468536 m!1355617))

(assert (=> b!1468536 m!1355617))

(declare-fun m!1355619 () Bool)

(assert (=> b!1468536 m!1355619))

(declare-fun m!1355621 () Bool)

(assert (=> b!1468540 m!1355621))

(declare-fun m!1355623 () Bool)

(assert (=> b!1468541 m!1355623))

(assert (=> b!1468541 m!1355623))

(declare-fun m!1355625 () Bool)

(assert (=> b!1468541 m!1355625))

(assert (=> b!1468542 m!1355617))

(assert (=> b!1468542 m!1355617))

(declare-fun m!1355627 () Bool)

(assert (=> b!1468542 m!1355627))

(declare-fun m!1355629 () Bool)

(assert (=> b!1468534 m!1355629))

(declare-fun m!1355631 () Bool)

(assert (=> b!1468534 m!1355631))

(assert (=> b!1468535 m!1355629))

(declare-fun m!1355633 () Bool)

(assert (=> b!1468535 m!1355633))

(assert (=> b!1468535 m!1355633))

(declare-fun m!1355635 () Bool)

(assert (=> b!1468535 m!1355635))

(assert (=> b!1468535 m!1355635))

(assert (=> b!1468535 m!1355633))

(declare-fun m!1355637 () Bool)

(assert (=> b!1468535 m!1355637))

(declare-fun m!1355639 () Bool)

(assert (=> b!1468538 m!1355639))

(assert (=> b!1468537 m!1355617))

(assert (=> b!1468537 m!1355617))

(declare-fun m!1355641 () Bool)

(assert (=> b!1468537 m!1355641))

(assert (=> b!1468537 m!1355641))

(assert (=> b!1468537 m!1355617))

(declare-fun m!1355643 () Bool)

(assert (=> b!1468537 m!1355643))

(check-sat (not b!1468536) (not b!1468537) (not b!1468541) (not b!1468538) (not start!125520) (not b!1468542) (not b!1468535) (not b!1468540))
(check-sat)
