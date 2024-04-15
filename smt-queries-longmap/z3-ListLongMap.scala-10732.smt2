; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125500 () Bool)

(assert start!125500)

(declare-fun b!1468474 () Bool)

(declare-fun res!997131 () Bool)

(declare-fun e!824543 () Bool)

(assert (=> b!1468474 (=> (not res!997131) (not e!824543))))

(declare-datatypes ((array!98926 0))(
  ( (array!98927 (arr!47752 (Array (_ BitVec 32) (_ BitVec 64))) (size!48304 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98926)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98926 (_ BitVec 32)) Bool)

(assert (=> b!1468474 (= res!997131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468475 () Bool)

(declare-fun res!997136 () Bool)

(assert (=> b!1468475 (=> (not res!997136) (not e!824543))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1468475 (= res!997136 (and (= (size!48304 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48304 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48304 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!997137 () Bool)

(assert (=> start!125500 (=> (not res!997137) (not e!824543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125500 (= res!997137 (validMask!0 mask!2687))))

(assert (=> start!125500 e!824543))

(assert (=> start!125500 true))

(declare-fun array_inv!36985 (array!98926) Bool)

(assert (=> start!125500 (array_inv!36985 a!2862)))

(declare-fun b!1468476 () Bool)

(declare-fun res!997132 () Bool)

(assert (=> b!1468476 (=> (not res!997132) (not e!824543))))

(declare-datatypes ((List!34331 0))(
  ( (Nil!34328) (Cons!34327 (h!35677 (_ BitVec 64)) (t!49017 List!34331)) )
))
(declare-fun arrayNoDuplicates!0 (array!98926 (_ BitVec 32) List!34331) Bool)

(assert (=> b!1468476 (= res!997132 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34328))))

(declare-fun b!1468477 () Bool)

(declare-fun res!997130 () Bool)

(assert (=> b!1468477 (=> (not res!997130) (not e!824543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468477 (= res!997130 (validKeyInArray!0 (select (arr!47752 a!2862) j!93)))))

(declare-fun b!1468478 () Bool)

(declare-fun res!997134 () Bool)

(assert (=> b!1468478 (=> (not res!997134) (not e!824543))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468478 (= res!997134 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48304 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48304 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48304 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47752 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468479 () Bool)

(declare-fun e!824544 () Bool)

(assert (=> b!1468479 (= e!824544 false)))

(declare-datatypes ((SeekEntryResult!12017 0))(
  ( (MissingZero!12017 (index!50460 (_ BitVec 32))) (Found!12017 (index!50461 (_ BitVec 32))) (Intermediate!12017 (undefined!12829 Bool) (index!50462 (_ BitVec 32)) (x!132045 (_ BitVec 32))) (Undefined!12017) (MissingVacant!12017 (index!50463 (_ BitVec 32))) )
))
(declare-fun lt!642107 () SeekEntryResult!12017)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98926 (_ BitVec 32)) SeekEntryResult!12017)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468479 (= lt!642107 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47752 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47752 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98927 (store (arr!47752 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48304 a!2862)) mask!2687))))

(declare-fun b!1468480 () Bool)

(declare-fun res!997135 () Bool)

(assert (=> b!1468480 (=> (not res!997135) (not e!824543))))

(assert (=> b!1468480 (= res!997135 (validKeyInArray!0 (select (arr!47752 a!2862) i!1006)))))

(declare-fun b!1468481 () Bool)

(assert (=> b!1468481 (= e!824543 e!824544)))

(declare-fun res!997138 () Bool)

(assert (=> b!1468481 (=> (not res!997138) (not e!824544))))

(declare-fun lt!642108 () SeekEntryResult!12017)

(assert (=> b!1468481 (= res!997138 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47752 a!2862) j!93) mask!2687) (select (arr!47752 a!2862) j!93) a!2862 mask!2687) lt!642108))))

(assert (=> b!1468481 (= lt!642108 (Intermediate!12017 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468482 () Bool)

(declare-fun res!997133 () Bool)

(assert (=> b!1468482 (=> (not res!997133) (not e!824544))))

(assert (=> b!1468482 (= res!997133 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47752 a!2862) j!93) a!2862 mask!2687) lt!642108))))

(assert (= (and start!125500 res!997137) b!1468475))

(assert (= (and b!1468475 res!997136) b!1468480))

(assert (= (and b!1468480 res!997135) b!1468477))

(assert (= (and b!1468477 res!997130) b!1468474))

(assert (= (and b!1468474 res!997131) b!1468476))

(assert (= (and b!1468476 res!997132) b!1468478))

(assert (= (and b!1468478 res!997134) b!1468481))

(assert (= (and b!1468481 res!997138) b!1468482))

(assert (= (and b!1468482 res!997133) b!1468479))

(declare-fun m!1355097 () Bool)

(assert (=> b!1468476 m!1355097))

(declare-fun m!1355099 () Bool)

(assert (=> b!1468480 m!1355099))

(assert (=> b!1468480 m!1355099))

(declare-fun m!1355101 () Bool)

(assert (=> b!1468480 m!1355101))

(declare-fun m!1355103 () Bool)

(assert (=> b!1468477 m!1355103))

(assert (=> b!1468477 m!1355103))

(declare-fun m!1355105 () Bool)

(assert (=> b!1468477 m!1355105))

(assert (=> b!1468482 m!1355103))

(assert (=> b!1468482 m!1355103))

(declare-fun m!1355107 () Bool)

(assert (=> b!1468482 m!1355107))

(declare-fun m!1355109 () Bool)

(assert (=> b!1468479 m!1355109))

(declare-fun m!1355111 () Bool)

(assert (=> b!1468479 m!1355111))

(assert (=> b!1468479 m!1355111))

(declare-fun m!1355113 () Bool)

(assert (=> b!1468479 m!1355113))

(assert (=> b!1468479 m!1355113))

(assert (=> b!1468479 m!1355111))

(declare-fun m!1355115 () Bool)

(assert (=> b!1468479 m!1355115))

(declare-fun m!1355117 () Bool)

(assert (=> start!125500 m!1355117))

(declare-fun m!1355119 () Bool)

(assert (=> start!125500 m!1355119))

(assert (=> b!1468481 m!1355103))

(assert (=> b!1468481 m!1355103))

(declare-fun m!1355121 () Bool)

(assert (=> b!1468481 m!1355121))

(assert (=> b!1468481 m!1355121))

(assert (=> b!1468481 m!1355103))

(declare-fun m!1355123 () Bool)

(assert (=> b!1468481 m!1355123))

(assert (=> b!1468478 m!1355109))

(declare-fun m!1355125 () Bool)

(assert (=> b!1468478 m!1355125))

(declare-fun m!1355127 () Bool)

(assert (=> b!1468474 m!1355127))

(check-sat (not b!1468482) (not b!1468476) (not b!1468480) (not b!1468481) (not b!1468477) (not b!1468479) (not b!1468474) (not start!125500))
(check-sat)
