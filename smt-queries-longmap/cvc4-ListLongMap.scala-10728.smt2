; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125510 () Bool)

(assert start!125510)

(declare-fun res!996941 () Bool)

(declare-fun e!824570 () Bool)

(assert (=> start!125510 (=> (not res!996941) (not e!824570))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125510 (= res!996941 (validMask!0 mask!2687))))

(assert (=> start!125510 e!824570))

(assert (=> start!125510 true))

(declare-datatypes ((array!98958 0))(
  ( (array!98959 (arr!47767 (Array (_ BitVec 32) (_ BitVec 64))) (size!48317 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98958)

(declare-fun array_inv!36795 (array!98958) Bool)

(assert (=> start!125510 (array_inv!36795 a!2862)))

(declare-fun b!1468399 () Bool)

(declare-fun res!996939 () Bool)

(assert (=> b!1468399 (=> (not res!996939) (not e!824570))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1468399 (= res!996939 (and (= (size!48317 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48317 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48317 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468400 () Bool)

(declare-fun e!824568 () Bool)

(assert (=> b!1468400 (= e!824570 e!824568)))

(declare-fun res!996940 () Bool)

(assert (=> b!1468400 (=> (not res!996940) (not e!824568))))

(declare-datatypes ((SeekEntryResult!12007 0))(
  ( (MissingZero!12007 (index!50420 (_ BitVec 32))) (Found!12007 (index!50421 (_ BitVec 32))) (Intermediate!12007 (undefined!12819 Bool) (index!50422 (_ BitVec 32)) (x!132008 (_ BitVec 32))) (Undefined!12007) (MissingVacant!12007 (index!50423 (_ BitVec 32))) )
))
(declare-fun lt!642282 () SeekEntryResult!12007)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98958 (_ BitVec 32)) SeekEntryResult!12007)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468400 (= res!996940 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47767 a!2862) j!93) mask!2687) (select (arr!47767 a!2862) j!93) a!2862 mask!2687) lt!642282))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468400 (= lt!642282 (Intermediate!12007 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468401 () Bool)

(declare-fun res!996946 () Bool)

(assert (=> b!1468401 (=> (not res!996946) (not e!824570))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1468401 (= res!996946 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48317 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48317 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48317 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47767 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468402 () Bool)

(declare-fun res!996943 () Bool)

(assert (=> b!1468402 (=> (not res!996943) (not e!824570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468402 (= res!996943 (validKeyInArray!0 (select (arr!47767 a!2862) j!93)))))

(declare-fun b!1468403 () Bool)

(declare-fun res!996942 () Bool)

(assert (=> b!1468403 (=> (not res!996942) (not e!824570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98958 (_ BitVec 32)) Bool)

(assert (=> b!1468403 (= res!996942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468404 () Bool)

(declare-fun res!996938 () Bool)

(assert (=> b!1468404 (=> (not res!996938) (not e!824570))))

(declare-datatypes ((List!34268 0))(
  ( (Nil!34265) (Cons!34264 (h!35614 (_ BitVec 64)) (t!48962 List!34268)) )
))
(declare-fun arrayNoDuplicates!0 (array!98958 (_ BitVec 32) List!34268) Bool)

(assert (=> b!1468404 (= res!996938 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34265))))

(declare-fun b!1468405 () Bool)

(declare-fun res!996944 () Bool)

(assert (=> b!1468405 (=> (not res!996944) (not e!824570))))

(assert (=> b!1468405 (= res!996944 (validKeyInArray!0 (select (arr!47767 a!2862) i!1006)))))

(declare-fun b!1468406 () Bool)

(declare-fun res!996945 () Bool)

(assert (=> b!1468406 (=> (not res!996945) (not e!824568))))

(assert (=> b!1468406 (= res!996945 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47767 a!2862) j!93) a!2862 mask!2687) lt!642282))))

(declare-fun b!1468407 () Bool)

(assert (=> b!1468407 (= e!824568 false)))

(declare-fun lt!642281 () SeekEntryResult!12007)

(assert (=> b!1468407 (= lt!642281 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47767 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47767 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98959 (store (arr!47767 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48317 a!2862)) mask!2687))))

(assert (= (and start!125510 res!996941) b!1468399))

(assert (= (and b!1468399 res!996939) b!1468405))

(assert (= (and b!1468405 res!996944) b!1468402))

(assert (= (and b!1468402 res!996943) b!1468403))

(assert (= (and b!1468403 res!996942) b!1468404))

(assert (= (and b!1468404 res!996938) b!1468401))

(assert (= (and b!1468401 res!996946) b!1468400))

(assert (= (and b!1468400 res!996940) b!1468406))

(assert (= (and b!1468406 res!996945) b!1468407))

(declare-fun m!1355453 () Bool)

(assert (=> start!125510 m!1355453))

(declare-fun m!1355455 () Bool)

(assert (=> start!125510 m!1355455))

(declare-fun m!1355457 () Bool)

(assert (=> b!1468402 m!1355457))

(assert (=> b!1468402 m!1355457))

(declare-fun m!1355459 () Bool)

(assert (=> b!1468402 m!1355459))

(declare-fun m!1355461 () Bool)

(assert (=> b!1468403 m!1355461))

(declare-fun m!1355463 () Bool)

(assert (=> b!1468407 m!1355463))

(declare-fun m!1355465 () Bool)

(assert (=> b!1468407 m!1355465))

(assert (=> b!1468407 m!1355465))

(declare-fun m!1355467 () Bool)

(assert (=> b!1468407 m!1355467))

(assert (=> b!1468407 m!1355467))

(assert (=> b!1468407 m!1355465))

(declare-fun m!1355469 () Bool)

(assert (=> b!1468407 m!1355469))

(declare-fun m!1355471 () Bool)

(assert (=> b!1468405 m!1355471))

(assert (=> b!1468405 m!1355471))

(declare-fun m!1355473 () Bool)

(assert (=> b!1468405 m!1355473))

(assert (=> b!1468406 m!1355457))

(assert (=> b!1468406 m!1355457))

(declare-fun m!1355475 () Bool)

(assert (=> b!1468406 m!1355475))

(assert (=> b!1468401 m!1355463))

(declare-fun m!1355477 () Bool)

(assert (=> b!1468401 m!1355477))

(assert (=> b!1468400 m!1355457))

(assert (=> b!1468400 m!1355457))

(declare-fun m!1355479 () Bool)

(assert (=> b!1468400 m!1355479))

(assert (=> b!1468400 m!1355479))

(assert (=> b!1468400 m!1355457))

(declare-fun m!1355481 () Bool)

(assert (=> b!1468400 m!1355481))

(declare-fun m!1355483 () Bool)

(assert (=> b!1468404 m!1355483))

(push 1)

(assert (not b!1468404))

(assert (not b!1468405))

(assert (not b!1468403))

(assert (not b!1468400))

(assert (not b!1468406))

(assert (not start!125510))

(assert (not b!1468402))

(assert (not b!1468407))

(check-sat)

(pop 1)

