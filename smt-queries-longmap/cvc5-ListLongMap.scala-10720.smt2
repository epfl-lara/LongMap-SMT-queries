; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125458 () Bool)

(assert start!125458)

(declare-fun b!1467713 () Bool)

(declare-fun res!996255 () Bool)

(declare-fun e!824350 () Bool)

(assert (=> b!1467713 (=> (not res!996255) (not e!824350))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98906 0))(
  ( (array!98907 (arr!47741 (Array (_ BitVec 32) (_ BitVec 64))) (size!48291 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98906)

(assert (=> b!1467713 (= res!996255 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48291 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48291 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48291 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47741 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!996259 () Bool)

(assert (=> start!125458 (=> (not res!996259) (not e!824350))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125458 (= res!996259 (validMask!0 mask!2687))))

(assert (=> start!125458 e!824350))

(assert (=> start!125458 true))

(declare-fun array_inv!36769 (array!98906) Bool)

(assert (=> start!125458 (array_inv!36769 a!2862)))

(declare-fun b!1467714 () Bool)

(declare-fun res!996252 () Bool)

(assert (=> b!1467714 (=> (not res!996252) (not e!824350))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1467714 (= res!996252 (and (= (size!48291 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48291 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48291 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467715 () Bool)

(declare-fun res!996253 () Bool)

(assert (=> b!1467715 (=> (not res!996253) (not e!824350))))

(declare-datatypes ((List!34242 0))(
  ( (Nil!34239) (Cons!34238 (h!35588 (_ BitVec 64)) (t!48936 List!34242)) )
))
(declare-fun arrayNoDuplicates!0 (array!98906 (_ BitVec 32) List!34242) Bool)

(assert (=> b!1467715 (= res!996253 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34239))))

(declare-fun b!1467716 () Bool)

(declare-fun res!996254 () Bool)

(assert (=> b!1467716 (=> (not res!996254) (not e!824350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467716 (= res!996254 (validKeyInArray!0 (select (arr!47741 a!2862) j!93)))))

(declare-fun b!1467717 () Bool)

(assert (=> b!1467717 (= e!824350 false)))

(declare-datatypes ((SeekEntryResult!11981 0))(
  ( (MissingZero!11981 (index!50316 (_ BitVec 32))) (Found!11981 (index!50317 (_ BitVec 32))) (Intermediate!11981 (undefined!12793 Bool) (index!50318 (_ BitVec 32)) (x!131918 (_ BitVec 32))) (Undefined!11981) (MissingVacant!11981 (index!50319 (_ BitVec 32))) )
))
(declare-fun lt!642141 () SeekEntryResult!11981)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98906 (_ BitVec 32)) SeekEntryResult!11981)

(assert (=> b!1467717 (= lt!642141 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47741 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1467718 () Bool)

(declare-fun res!996256 () Bool)

(assert (=> b!1467718 (=> (not res!996256) (not e!824350))))

(assert (=> b!1467718 (= res!996256 (validKeyInArray!0 (select (arr!47741 a!2862) i!1006)))))

(declare-fun b!1467719 () Bool)

(declare-fun res!996258 () Bool)

(assert (=> b!1467719 (=> (not res!996258) (not e!824350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98906 (_ BitVec 32)) Bool)

(assert (=> b!1467719 (= res!996258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467720 () Bool)

(declare-fun res!996257 () Bool)

(assert (=> b!1467720 (=> (not res!996257) (not e!824350))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467720 (= res!996257 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47741 a!2862) j!93) mask!2687) (select (arr!47741 a!2862) j!93) a!2862 mask!2687) (Intermediate!11981 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(assert (= (and start!125458 res!996259) b!1467714))

(assert (= (and b!1467714 res!996252) b!1467718))

(assert (= (and b!1467718 res!996256) b!1467716))

(assert (= (and b!1467716 res!996254) b!1467719))

(assert (= (and b!1467719 res!996258) b!1467715))

(assert (= (and b!1467715 res!996253) b!1467713))

(assert (= (and b!1467713 res!996255) b!1467720))

(assert (= (and b!1467720 res!996257) b!1467717))

(declare-fun m!1354669 () Bool)

(assert (=> b!1467720 m!1354669))

(assert (=> b!1467720 m!1354669))

(declare-fun m!1354671 () Bool)

(assert (=> b!1467720 m!1354671))

(assert (=> b!1467720 m!1354671))

(assert (=> b!1467720 m!1354669))

(declare-fun m!1354673 () Bool)

(assert (=> b!1467720 m!1354673))

(declare-fun m!1354675 () Bool)

(assert (=> start!125458 m!1354675))

(declare-fun m!1354677 () Bool)

(assert (=> start!125458 m!1354677))

(declare-fun m!1354679 () Bool)

(assert (=> b!1467713 m!1354679))

(declare-fun m!1354681 () Bool)

(assert (=> b!1467713 m!1354681))

(declare-fun m!1354683 () Bool)

(assert (=> b!1467718 m!1354683))

(assert (=> b!1467718 m!1354683))

(declare-fun m!1354685 () Bool)

(assert (=> b!1467718 m!1354685))

(assert (=> b!1467717 m!1354669))

(assert (=> b!1467717 m!1354669))

(declare-fun m!1354687 () Bool)

(assert (=> b!1467717 m!1354687))

(declare-fun m!1354689 () Bool)

(assert (=> b!1467719 m!1354689))

(assert (=> b!1467716 m!1354669))

(assert (=> b!1467716 m!1354669))

(declare-fun m!1354691 () Bool)

(assert (=> b!1467716 m!1354691))

(declare-fun m!1354693 () Bool)

(assert (=> b!1467715 m!1354693))

(push 1)

(assert (not b!1467718))

(assert (not b!1467717))

(assert (not b!1467716))

(assert (not b!1467715))

(assert (not b!1467720))

(assert (not start!125458))

(assert (not b!1467719))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

