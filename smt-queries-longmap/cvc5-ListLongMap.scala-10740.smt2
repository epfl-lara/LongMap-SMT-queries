; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125578 () Bool)

(assert start!125578)

(declare-fun res!997899 () Bool)

(declare-fun e!824936 () Bool)

(assert (=> start!125578 (=> (not res!997899) (not e!824936))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125578 (= res!997899 (validMask!0 mask!2687))))

(assert (=> start!125578 e!824936))

(assert (=> start!125578 true))

(declare-datatypes ((array!99026 0))(
  ( (array!99027 (arr!47801 (Array (_ BitVec 32) (_ BitVec 64))) (size!48351 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99026)

(declare-fun array_inv!36829 (array!99026) Bool)

(assert (=> start!125578 (array_inv!36829 a!2862)))

(declare-fun b!1469397 () Bool)

(declare-fun lt!642546 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!824934 () Bool)

(declare-fun lt!642547 () array!99026)

(declare-datatypes ((SeekEntryResult!12041 0))(
  ( (MissingZero!12041 (index!50556 (_ BitVec 32))) (Found!12041 (index!50557 (_ BitVec 32))) (Intermediate!12041 (undefined!12853 Bool) (index!50558 (_ BitVec 32)) (x!132138 (_ BitVec 32))) (Undefined!12041) (MissingVacant!12041 (index!50559 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99026 (_ BitVec 32)) SeekEntryResult!12041)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99026 (_ BitVec 32)) SeekEntryResult!12041)

(assert (=> b!1469397 (= e!824934 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642546 lt!642547 mask!2687) (seekEntryOrOpen!0 lt!642546 lt!642547 mask!2687))))))

(declare-fun b!1469398 () Bool)

(declare-fun e!824939 () Bool)

(declare-fun e!824938 () Bool)

(assert (=> b!1469398 (= e!824939 e!824938)))

(declare-fun res!997896 () Bool)

(assert (=> b!1469398 (=> (not res!997896) (not e!824938))))

(declare-fun lt!642549 () SeekEntryResult!12041)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99026 (_ BitVec 32)) SeekEntryResult!12041)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469398 (= res!997896 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47801 a!2862) j!93) mask!2687) (select (arr!47801 a!2862) j!93) a!2862 mask!2687) lt!642549))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1469398 (= lt!642549 (Intermediate!12041 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469399 () Bool)

(declare-fun res!997901 () Bool)

(assert (=> b!1469399 (=> (not res!997901) (not e!824938))))

(assert (=> b!1469399 (= res!997901 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47801 a!2862) j!93) a!2862 mask!2687) lt!642549))))

(declare-fun b!1469400 () Bool)

(declare-fun res!997902 () Bool)

(assert (=> b!1469400 (=> (not res!997902) (not e!824936))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469400 (= res!997902 (validKeyInArray!0 (select (arr!47801 a!2862) j!93)))))

(declare-fun b!1469401 () Bool)

(declare-fun res!997904 () Bool)

(assert (=> b!1469401 (=> (not res!997904) (not e!824936))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1469401 (= res!997904 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48351 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48351 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48351 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1469402 () Bool)

(declare-fun e!824935 () Bool)

(assert (=> b!1469402 (= e!824935 false)))

(declare-fun lt!642548 () Bool)

(assert (=> b!1469402 (= lt!642548 e!824934)))

(declare-fun c!135261 () Bool)

(assert (=> b!1469402 (= c!135261 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469403 () Bool)

(assert (=> b!1469403 (= e!824936 e!824939)))

(declare-fun res!997905 () Bool)

(assert (=> b!1469403 (=> (not res!997905) (not e!824939))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1469403 (= res!997905 (= (select (store (arr!47801 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1469403 (= lt!642547 (array!99027 (store (arr!47801 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48351 a!2862)))))

(declare-fun b!1469404 () Bool)

(declare-fun res!997903 () Bool)

(assert (=> b!1469404 (=> (not res!997903) (not e!824936))))

(assert (=> b!1469404 (= res!997903 (validKeyInArray!0 (select (arr!47801 a!2862) i!1006)))))

(declare-fun b!1469405 () Bool)

(declare-fun res!997898 () Bool)

(assert (=> b!1469405 (=> (not res!997898) (not e!824936))))

(declare-datatypes ((List!34302 0))(
  ( (Nil!34299) (Cons!34298 (h!35648 (_ BitVec 64)) (t!48996 List!34302)) )
))
(declare-fun arrayNoDuplicates!0 (array!99026 (_ BitVec 32) List!34302) Bool)

(assert (=> b!1469405 (= res!997898 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34299))))

(declare-fun lt!642545 () SeekEntryResult!12041)

(declare-fun b!1469406 () Bool)

(assert (=> b!1469406 (= e!824934 (not (= lt!642545 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642546 lt!642547 mask!2687))))))

(declare-fun b!1469407 () Bool)

(declare-fun res!997906 () Bool)

(assert (=> b!1469407 (=> (not res!997906) (not e!824936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99026 (_ BitVec 32)) Bool)

(assert (=> b!1469407 (= res!997906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469408 () Bool)

(declare-fun res!997900 () Bool)

(assert (=> b!1469408 (=> (not res!997900) (not e!824936))))

(assert (=> b!1469408 (= res!997900 (and (= (size!48351 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48351 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48351 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469409 () Bool)

(assert (=> b!1469409 (= e!824938 e!824935)))

(declare-fun res!997897 () Bool)

(assert (=> b!1469409 (=> (not res!997897) (not e!824935))))

(assert (=> b!1469409 (= res!997897 (= lt!642545 (Intermediate!12041 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1469409 (= lt!642545 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642546 mask!2687) lt!642546 lt!642547 mask!2687))))

(assert (=> b!1469409 (= lt!642546 (select (store (arr!47801 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125578 res!997899) b!1469408))

(assert (= (and b!1469408 res!997900) b!1469404))

(assert (= (and b!1469404 res!997903) b!1469400))

(assert (= (and b!1469400 res!997902) b!1469407))

(assert (= (and b!1469407 res!997906) b!1469405))

(assert (= (and b!1469405 res!997898) b!1469401))

(assert (= (and b!1469401 res!997904) b!1469403))

(assert (= (and b!1469403 res!997905) b!1469398))

(assert (= (and b!1469398 res!997896) b!1469399))

(assert (= (and b!1469399 res!997901) b!1469409))

(assert (= (and b!1469409 res!997897) b!1469402))

(assert (= (and b!1469402 c!135261) b!1469406))

(assert (= (and b!1469402 (not c!135261)) b!1469397))

(declare-fun m!1356577 () Bool)

(assert (=> b!1469397 m!1356577))

(declare-fun m!1356579 () Bool)

(assert (=> b!1469397 m!1356579))

(declare-fun m!1356581 () Bool)

(assert (=> start!125578 m!1356581))

(declare-fun m!1356583 () Bool)

(assert (=> start!125578 m!1356583))

(declare-fun m!1356585 () Bool)

(assert (=> b!1469405 m!1356585))

(declare-fun m!1356587 () Bool)

(assert (=> b!1469398 m!1356587))

(assert (=> b!1469398 m!1356587))

(declare-fun m!1356589 () Bool)

(assert (=> b!1469398 m!1356589))

(assert (=> b!1469398 m!1356589))

(assert (=> b!1469398 m!1356587))

(declare-fun m!1356591 () Bool)

(assert (=> b!1469398 m!1356591))

(assert (=> b!1469399 m!1356587))

(assert (=> b!1469399 m!1356587))

(declare-fun m!1356593 () Bool)

(assert (=> b!1469399 m!1356593))

(declare-fun m!1356595 () Bool)

(assert (=> b!1469406 m!1356595))

(declare-fun m!1356597 () Bool)

(assert (=> b!1469409 m!1356597))

(assert (=> b!1469409 m!1356597))

(declare-fun m!1356599 () Bool)

(assert (=> b!1469409 m!1356599))

(declare-fun m!1356601 () Bool)

(assert (=> b!1469409 m!1356601))

(declare-fun m!1356603 () Bool)

(assert (=> b!1469409 m!1356603))

(declare-fun m!1356605 () Bool)

(assert (=> b!1469407 m!1356605))

(assert (=> b!1469403 m!1356601))

(declare-fun m!1356607 () Bool)

(assert (=> b!1469403 m!1356607))

(assert (=> b!1469400 m!1356587))

(assert (=> b!1469400 m!1356587))

(declare-fun m!1356609 () Bool)

(assert (=> b!1469400 m!1356609))

(declare-fun m!1356611 () Bool)

(assert (=> b!1469404 m!1356611))

(assert (=> b!1469404 m!1356611))

(declare-fun m!1356613 () Bool)

(assert (=> b!1469404 m!1356613))

(push 1)

