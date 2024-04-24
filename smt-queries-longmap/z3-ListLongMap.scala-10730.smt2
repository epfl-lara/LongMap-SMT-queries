; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125796 () Bool)

(assert start!125796)

(declare-fun b!1470215 () Bool)

(declare-fun e!825667 () Bool)

(declare-fun e!825669 () Bool)

(assert (=> b!1470215 (= e!825667 e!825669)))

(declare-fun res!997664 () Bool)

(assert (=> b!1470215 (=> (not res!997664) (not e!825669))))

(declare-datatypes ((SeekEntryResult!11961 0))(
  ( (MissingZero!11961 (index!50236 (_ BitVec 32))) (Found!11961 (index!50237 (_ BitVec 32))) (Intermediate!11961 (undefined!12773 Bool) (index!50238 (_ BitVec 32)) (x!132011 (_ BitVec 32))) (Undefined!11961) (MissingVacant!11961 (index!50239 (_ BitVec 32))) )
))
(declare-fun lt!642942 () SeekEntryResult!11961)

(declare-datatypes ((array!99082 0))(
  ( (array!99083 (arr!47824 (Array (_ BitVec 32) (_ BitVec 64))) (size!48375 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99082)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99082 (_ BitVec 32)) SeekEntryResult!11961)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1470215 (= res!997664 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47824 a!2862) j!93) mask!2687) (select (arr!47824 a!2862) j!93) a!2862 mask!2687) lt!642942))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1470215 (= lt!642942 (Intermediate!11961 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1470216 () Bool)

(declare-fun res!997658 () Bool)

(assert (=> b!1470216 (=> (not res!997658) (not e!825667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99082 (_ BitVec 32)) Bool)

(assert (=> b!1470216 (= res!997658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1470217 () Bool)

(declare-fun res!997656 () Bool)

(assert (=> b!1470217 (=> (not res!997656) (not e!825667))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1470217 (= res!997656 (validKeyInArray!0 (select (arr!47824 a!2862) j!93)))))

(declare-fun b!1470218 () Bool)

(declare-fun res!997663 () Bool)

(assert (=> b!1470218 (=> (not res!997663) (not e!825667))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1470218 (= res!997663 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48375 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48375 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48375 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47824 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1470219 () Bool)

(declare-fun res!997661 () Bool)

(assert (=> b!1470219 (=> (not res!997661) (not e!825667))))

(assert (=> b!1470219 (= res!997661 (and (= (size!48375 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48375 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48375 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!997659 () Bool)

(assert (=> start!125796 (=> (not res!997659) (not e!825667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125796 (= res!997659 (validMask!0 mask!2687))))

(assert (=> start!125796 e!825667))

(assert (=> start!125796 true))

(declare-fun array_inv!37105 (array!99082) Bool)

(assert (=> start!125796 (array_inv!37105 a!2862)))

(declare-fun b!1470220 () Bool)

(declare-fun res!997660 () Bool)

(assert (=> b!1470220 (=> (not res!997660) (not e!825669))))

(assert (=> b!1470220 (= res!997660 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47824 a!2862) j!93) a!2862 mask!2687) lt!642942))))

(declare-fun b!1470221 () Bool)

(assert (=> b!1470221 (= e!825669 false)))

(declare-fun lt!642943 () SeekEntryResult!11961)

(assert (=> b!1470221 (= lt!642943 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47824 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47824 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!99083 (store (arr!47824 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48375 a!2862)) mask!2687))))

(declare-fun b!1470222 () Bool)

(declare-fun res!997662 () Bool)

(assert (=> b!1470222 (=> (not res!997662) (not e!825667))))

(declare-datatypes ((List!34312 0))(
  ( (Nil!34309) (Cons!34308 (h!35672 (_ BitVec 64)) (t!48998 List!34312)) )
))
(declare-fun arrayNoDuplicates!0 (array!99082 (_ BitVec 32) List!34312) Bool)

(assert (=> b!1470222 (= res!997662 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34309))))

(declare-fun b!1470223 () Bool)

(declare-fun res!997657 () Bool)

(assert (=> b!1470223 (=> (not res!997657) (not e!825667))))

(assert (=> b!1470223 (= res!997657 (validKeyInArray!0 (select (arr!47824 a!2862) i!1006)))))

(assert (= (and start!125796 res!997659) b!1470219))

(assert (= (and b!1470219 res!997661) b!1470223))

(assert (= (and b!1470223 res!997657) b!1470217))

(assert (= (and b!1470217 res!997656) b!1470216))

(assert (= (and b!1470216 res!997658) b!1470222))

(assert (= (and b!1470222 res!997662) b!1470218))

(assert (= (and b!1470218 res!997663) b!1470215))

(assert (= (and b!1470215 res!997664) b!1470220))

(assert (= (and b!1470220 res!997660) b!1470221))

(declare-fun m!1357267 () Bool)

(assert (=> b!1470222 m!1357267))

(declare-fun m!1357269 () Bool)

(assert (=> b!1470215 m!1357269))

(assert (=> b!1470215 m!1357269))

(declare-fun m!1357271 () Bool)

(assert (=> b!1470215 m!1357271))

(assert (=> b!1470215 m!1357271))

(assert (=> b!1470215 m!1357269))

(declare-fun m!1357273 () Bool)

(assert (=> b!1470215 m!1357273))

(assert (=> b!1470220 m!1357269))

(assert (=> b!1470220 m!1357269))

(declare-fun m!1357275 () Bool)

(assert (=> b!1470220 m!1357275))

(declare-fun m!1357277 () Bool)

(assert (=> b!1470223 m!1357277))

(assert (=> b!1470223 m!1357277))

(declare-fun m!1357279 () Bool)

(assert (=> b!1470223 m!1357279))

(declare-fun m!1357281 () Bool)

(assert (=> b!1470221 m!1357281))

(declare-fun m!1357283 () Bool)

(assert (=> b!1470221 m!1357283))

(assert (=> b!1470221 m!1357283))

(declare-fun m!1357285 () Bool)

(assert (=> b!1470221 m!1357285))

(assert (=> b!1470221 m!1357285))

(assert (=> b!1470221 m!1357283))

(declare-fun m!1357287 () Bool)

(assert (=> b!1470221 m!1357287))

(declare-fun m!1357289 () Bool)

(assert (=> b!1470216 m!1357289))

(assert (=> b!1470217 m!1357269))

(assert (=> b!1470217 m!1357269))

(declare-fun m!1357291 () Bool)

(assert (=> b!1470217 m!1357291))

(assert (=> b!1470218 m!1357281))

(declare-fun m!1357293 () Bool)

(assert (=> b!1470218 m!1357293))

(declare-fun m!1357295 () Bool)

(assert (=> start!125796 m!1357295))

(declare-fun m!1357297 () Bool)

(assert (=> start!125796 m!1357297))

(check-sat (not b!1470222) (not b!1470220) (not start!125796) (not b!1470217) (not b!1470215) (not b!1470221) (not b!1470223) (not b!1470216))
(check-sat)
