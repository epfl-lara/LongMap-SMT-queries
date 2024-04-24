; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125802 () Bool)

(assert start!125802)

(declare-fun b!1470296 () Bool)

(declare-fun res!997740 () Bool)

(declare-fun e!825696 () Bool)

(assert (=> b!1470296 (=> (not res!997740) (not e!825696))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99088 0))(
  ( (array!99089 (arr!47827 (Array (_ BitVec 32) (_ BitVec 64))) (size!48378 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99088)

(assert (=> b!1470296 (= res!997740 (and (= (size!48378 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48378 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48378 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!997738 () Bool)

(assert (=> start!125802 (=> (not res!997738) (not e!825696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125802 (= res!997738 (validMask!0 mask!2687))))

(assert (=> start!125802 e!825696))

(assert (=> start!125802 true))

(declare-fun array_inv!37108 (array!99088) Bool)

(assert (=> start!125802 (array_inv!37108 a!2862)))

(declare-fun b!1470297 () Bool)

(declare-fun e!825695 () Bool)

(assert (=> b!1470297 (= e!825696 e!825695)))

(declare-fun res!997743 () Bool)

(assert (=> b!1470297 (=> (not res!997743) (not e!825695))))

(declare-datatypes ((SeekEntryResult!11964 0))(
  ( (MissingZero!11964 (index!50248 (_ BitVec 32))) (Found!11964 (index!50249 (_ BitVec 32))) (Intermediate!11964 (undefined!12776 Bool) (index!50250 (_ BitVec 32)) (x!132022 (_ BitVec 32))) (Undefined!11964) (MissingVacant!11964 (index!50251 (_ BitVec 32))) )
))
(declare-fun lt!642960 () SeekEntryResult!11964)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99088 (_ BitVec 32)) SeekEntryResult!11964)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470297 (= res!997743 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47827 a!2862) j!93) mask!2687) (select (arr!47827 a!2862) j!93) a!2862 mask!2687) lt!642960))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1470297 (= lt!642960 (Intermediate!11964 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470298 () Bool)

(declare-fun res!997745 () Bool)

(assert (=> b!1470298 (=> (not res!997745) (not e!825696))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1470298 (= res!997745 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48378 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48378 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48378 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47827 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1470299 () Bool)

(declare-fun res!997744 () Bool)

(assert (=> b!1470299 (=> (not res!997744) (not e!825696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470299 (= res!997744 (validKeyInArray!0 (select (arr!47827 a!2862) i!1006)))))

(declare-fun b!1470300 () Bool)

(assert (=> b!1470300 (= e!825695 false)))

(declare-fun lt!642961 () SeekEntryResult!11964)

(assert (=> b!1470300 (= lt!642961 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47827 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47827 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!99089 (store (arr!47827 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48378 a!2862)) mask!2687))))

(declare-fun b!1470301 () Bool)

(declare-fun res!997742 () Bool)

(assert (=> b!1470301 (=> (not res!997742) (not e!825695))))

(assert (=> b!1470301 (= res!997742 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47827 a!2862) j!93) a!2862 mask!2687) lt!642960))))

(declare-fun b!1470302 () Bool)

(declare-fun res!997739 () Bool)

(assert (=> b!1470302 (=> (not res!997739) (not e!825696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99088 (_ BitVec 32)) Bool)

(assert (=> b!1470302 (= res!997739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470303 () Bool)

(declare-fun res!997737 () Bool)

(assert (=> b!1470303 (=> (not res!997737) (not e!825696))))

(declare-datatypes ((List!34315 0))(
  ( (Nil!34312) (Cons!34311 (h!35675 (_ BitVec 64)) (t!49001 List!34315)) )
))
(declare-fun arrayNoDuplicates!0 (array!99088 (_ BitVec 32) List!34315) Bool)

(assert (=> b!1470303 (= res!997737 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34312))))

(declare-fun b!1470304 () Bool)

(declare-fun res!997741 () Bool)

(assert (=> b!1470304 (=> (not res!997741) (not e!825696))))

(assert (=> b!1470304 (= res!997741 (validKeyInArray!0 (select (arr!47827 a!2862) j!93)))))

(assert (= (and start!125802 res!997738) b!1470296))

(assert (= (and b!1470296 res!997740) b!1470299))

(assert (= (and b!1470299 res!997744) b!1470304))

(assert (= (and b!1470304 res!997741) b!1470302))

(assert (= (and b!1470302 res!997739) b!1470303))

(assert (= (and b!1470303 res!997737) b!1470298))

(assert (= (and b!1470298 res!997745) b!1470297))

(assert (= (and b!1470297 res!997743) b!1470301))

(assert (= (and b!1470301 res!997742) b!1470300))

(declare-fun m!1357363 () Bool)

(assert (=> b!1470298 m!1357363))

(declare-fun m!1357365 () Bool)

(assert (=> b!1470298 m!1357365))

(declare-fun m!1357367 () Bool)

(assert (=> b!1470302 m!1357367))

(declare-fun m!1357369 () Bool)

(assert (=> b!1470297 m!1357369))

(assert (=> b!1470297 m!1357369))

(declare-fun m!1357371 () Bool)

(assert (=> b!1470297 m!1357371))

(assert (=> b!1470297 m!1357371))

(assert (=> b!1470297 m!1357369))

(declare-fun m!1357373 () Bool)

(assert (=> b!1470297 m!1357373))

(assert (=> b!1470301 m!1357369))

(assert (=> b!1470301 m!1357369))

(declare-fun m!1357375 () Bool)

(assert (=> b!1470301 m!1357375))

(declare-fun m!1357377 () Bool)

(assert (=> start!125802 m!1357377))

(declare-fun m!1357379 () Bool)

(assert (=> start!125802 m!1357379))

(assert (=> b!1470304 m!1357369))

(assert (=> b!1470304 m!1357369))

(declare-fun m!1357381 () Bool)

(assert (=> b!1470304 m!1357381))

(declare-fun m!1357383 () Bool)

(assert (=> b!1470303 m!1357383))

(declare-fun m!1357385 () Bool)

(assert (=> b!1470299 m!1357385))

(assert (=> b!1470299 m!1357385))

(declare-fun m!1357387 () Bool)

(assert (=> b!1470299 m!1357387))

(assert (=> b!1470300 m!1357363))

(declare-fun m!1357389 () Bool)

(assert (=> b!1470300 m!1357389))

(assert (=> b!1470300 m!1357389))

(declare-fun m!1357391 () Bool)

(assert (=> b!1470300 m!1357391))

(assert (=> b!1470300 m!1357391))

(assert (=> b!1470300 m!1357389))

(declare-fun m!1357393 () Bool)

(assert (=> b!1470300 m!1357393))

(check-sat (not b!1470301) (not b!1470303) (not b!1470299) (not b!1470304) (not b!1470300) (not b!1470302) (not b!1470297) (not start!125802))
(check-sat)
