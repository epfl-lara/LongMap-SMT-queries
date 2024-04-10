; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125486 () Bool)

(assert start!125486)

(declare-fun b!1468075 () Bool)

(declare-fun res!996616 () Bool)

(declare-fun e!824460 () Bool)

(assert (=> b!1468075 (=> (not res!996616) (not e!824460))))

(declare-datatypes ((array!98934 0))(
  ( (array!98935 (arr!47755 (Array (_ BitVec 32) (_ BitVec 64))) (size!48305 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98934)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468075 (= res!996616 (validKeyInArray!0 (select (arr!47755 a!2862) j!93)))))

(declare-fun b!1468076 () Bool)

(declare-fun res!996615 () Bool)

(assert (=> b!1468076 (=> (not res!996615) (not e!824460))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1468076 (= res!996615 (validKeyInArray!0 (select (arr!47755 a!2862) i!1006)))))

(declare-fun b!1468077 () Bool)

(declare-fun res!996622 () Bool)

(assert (=> b!1468077 (=> (not res!996622) (not e!824460))))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1468077 (= res!996622 (and (= (size!48305 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48305 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48305 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!996621 () Bool)

(assert (=> start!125486 (=> (not res!996621) (not e!824460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125486 (= res!996621 (validMask!0 mask!2687))))

(assert (=> start!125486 e!824460))

(assert (=> start!125486 true))

(declare-fun array_inv!36783 (array!98934) Bool)

(assert (=> start!125486 (array_inv!36783 a!2862)))

(declare-fun b!1468078 () Bool)

(declare-fun res!996620 () Bool)

(declare-fun e!824462 () Bool)

(assert (=> b!1468078 (=> (not res!996620) (not e!824462))))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11995 0))(
  ( (MissingZero!11995 (index!50372 (_ BitVec 32))) (Found!11995 (index!50373 (_ BitVec 32))) (Intermediate!11995 (undefined!12807 Bool) (index!50374 (_ BitVec 32)) (x!131964 (_ BitVec 32))) (Undefined!11995) (MissingVacant!11995 (index!50375 (_ BitVec 32))) )
))
(declare-fun lt!642209 () SeekEntryResult!11995)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98934 (_ BitVec 32)) SeekEntryResult!11995)

(assert (=> b!1468078 (= res!996620 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47755 a!2862) j!93) a!2862 mask!2687) lt!642209))))

(declare-fun b!1468079 () Bool)

(declare-fun res!996618 () Bool)

(assert (=> b!1468079 (=> (not res!996618) (not e!824460))))

(declare-datatypes ((List!34256 0))(
  ( (Nil!34253) (Cons!34252 (h!35602 (_ BitVec 64)) (t!48950 List!34256)) )
))
(declare-fun arrayNoDuplicates!0 (array!98934 (_ BitVec 32) List!34256) Bool)

(assert (=> b!1468079 (= res!996618 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34253))))

(declare-fun b!1468080 () Bool)

(declare-fun res!996619 () Bool)

(assert (=> b!1468080 (=> (not res!996619) (not e!824460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98934 (_ BitVec 32)) Bool)

(assert (=> b!1468080 (= res!996619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468081 () Bool)

(declare-fun res!996617 () Bool)

(assert (=> b!1468081 (=> (not res!996617) (not e!824460))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468081 (= res!996617 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48305 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48305 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48305 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47755 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468082 () Bool)

(assert (=> b!1468082 (= e!824460 e!824462)))

(declare-fun res!996614 () Bool)

(assert (=> b!1468082 (=> (not res!996614) (not e!824462))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468082 (= res!996614 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47755 a!2862) j!93) mask!2687) (select (arr!47755 a!2862) j!93) a!2862 mask!2687) lt!642209))))

(assert (=> b!1468082 (= lt!642209 (Intermediate!11995 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468083 () Bool)

(assert (=> b!1468083 (= e!824462 false)))

(declare-fun lt!642210 () SeekEntryResult!11995)

(assert (=> b!1468083 (= lt!642210 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47755 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47755 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98935 (store (arr!47755 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48305 a!2862)) mask!2687))))

(assert (= (and start!125486 res!996621) b!1468077))

(assert (= (and b!1468077 res!996622) b!1468076))

(assert (= (and b!1468076 res!996615) b!1468075))

(assert (= (and b!1468075 res!996616) b!1468080))

(assert (= (and b!1468080 res!996619) b!1468079))

(assert (= (and b!1468079 res!996618) b!1468081))

(assert (= (and b!1468081 res!996617) b!1468082))

(assert (= (and b!1468082 res!996614) b!1468078))

(assert (= (and b!1468078 res!996620) b!1468083))

(declare-fun m!1355069 () Bool)

(assert (=> b!1468075 m!1355069))

(assert (=> b!1468075 m!1355069))

(declare-fun m!1355071 () Bool)

(assert (=> b!1468075 m!1355071))

(declare-fun m!1355073 () Bool)

(assert (=> b!1468076 m!1355073))

(assert (=> b!1468076 m!1355073))

(declare-fun m!1355075 () Bool)

(assert (=> b!1468076 m!1355075))

(declare-fun m!1355077 () Bool)

(assert (=> start!125486 m!1355077))

(declare-fun m!1355079 () Bool)

(assert (=> start!125486 m!1355079))

(declare-fun m!1355081 () Bool)

(assert (=> b!1468081 m!1355081))

(declare-fun m!1355083 () Bool)

(assert (=> b!1468081 m!1355083))

(assert (=> b!1468082 m!1355069))

(assert (=> b!1468082 m!1355069))

(declare-fun m!1355085 () Bool)

(assert (=> b!1468082 m!1355085))

(assert (=> b!1468082 m!1355085))

(assert (=> b!1468082 m!1355069))

(declare-fun m!1355087 () Bool)

(assert (=> b!1468082 m!1355087))

(declare-fun m!1355089 () Bool)

(assert (=> b!1468079 m!1355089))

(assert (=> b!1468083 m!1355081))

(declare-fun m!1355091 () Bool)

(assert (=> b!1468083 m!1355091))

(assert (=> b!1468083 m!1355091))

(declare-fun m!1355093 () Bool)

(assert (=> b!1468083 m!1355093))

(assert (=> b!1468083 m!1355093))

(assert (=> b!1468083 m!1355091))

(declare-fun m!1355095 () Bool)

(assert (=> b!1468083 m!1355095))

(assert (=> b!1468078 m!1355069))

(assert (=> b!1468078 m!1355069))

(declare-fun m!1355097 () Bool)

(assert (=> b!1468078 m!1355097))

(declare-fun m!1355099 () Bool)

(assert (=> b!1468080 m!1355099))

(push 1)

(assert (not b!1468075))

(assert (not b!1468082))

(assert (not b!1468083))

(assert (not b!1468078))

(assert (not b!1468079))

(assert (not b!1468080))

(assert (not start!125486))

