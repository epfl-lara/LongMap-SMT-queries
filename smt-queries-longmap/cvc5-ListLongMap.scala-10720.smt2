; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125432 () Bool)

(assert start!125432)

(declare-fun b!1467566 () Bool)

(declare-fun res!996228 () Bool)

(declare-fun e!824247 () Bool)

(assert (=> b!1467566 (=> (not res!996228) (not e!824247))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-datatypes ((array!98858 0))(
  ( (array!98859 (arr!47718 (Array (_ BitVec 32) (_ BitVec 64))) (size!48270 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98858)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11983 0))(
  ( (MissingZero!11983 (index!50324 (_ BitVec 32))) (Found!11983 (index!50325 (_ BitVec 32))) (Intermediate!11983 (undefined!12795 Bool) (index!50326 (_ BitVec 32)) (x!131915 (_ BitVec 32))) (Undefined!11983) (MissingVacant!11983 (index!50327 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98858 (_ BitVec 32)) SeekEntryResult!11983)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467566 (= res!996228 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47718 a!2862) j!93) mask!2687) (select (arr!47718 a!2862) j!93) a!2862 mask!2687) (Intermediate!11983 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun b!1467567 () Bool)

(declare-fun res!996229 () Bool)

(assert (=> b!1467567 (=> (not res!996229) (not e!824247))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467567 (= res!996229 (validKeyInArray!0 (select (arr!47718 a!2862) i!1006)))))

(declare-fun b!1467568 () Bool)

(declare-fun res!996225 () Bool)

(assert (=> b!1467568 (=> (not res!996225) (not e!824247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98858 (_ BitVec 32)) Bool)

(assert (=> b!1467568 (= res!996225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467569 () Bool)

(declare-fun res!996227 () Bool)

(assert (=> b!1467569 (=> (not res!996227) (not e!824247))))

(assert (=> b!1467569 (= res!996227 (and (= (size!48270 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48270 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48270 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467570 () Bool)

(declare-fun res!996226 () Bool)

(assert (=> b!1467570 (=> (not res!996226) (not e!824247))))

(assert (=> b!1467570 (= res!996226 (validKeyInArray!0 (select (arr!47718 a!2862) j!93)))))

(declare-fun b!1467571 () Bool)

(declare-fun res!996224 () Bool)

(assert (=> b!1467571 (=> (not res!996224) (not e!824247))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467571 (= res!996224 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48270 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48270 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48270 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47718 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467572 () Bool)

(declare-fun res!996222 () Bool)

(assert (=> b!1467572 (=> (not res!996222) (not e!824247))))

(declare-datatypes ((List!34297 0))(
  ( (Nil!34294) (Cons!34293 (h!35643 (_ BitVec 64)) (t!48983 List!34297)) )
))
(declare-fun arrayNoDuplicates!0 (array!98858 (_ BitVec 32) List!34297) Bool)

(assert (=> b!1467572 (= res!996222 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34294))))

(declare-fun res!996223 () Bool)

(assert (=> start!125432 (=> (not res!996223) (not e!824247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125432 (= res!996223 (validMask!0 mask!2687))))

(assert (=> start!125432 e!824247))

(assert (=> start!125432 true))

(declare-fun array_inv!36951 (array!98858) Bool)

(assert (=> start!125432 (array_inv!36951 a!2862)))

(declare-fun b!1467573 () Bool)

(assert (=> b!1467573 (= e!824247 false)))

(declare-fun lt!641913 () SeekEntryResult!11983)

(assert (=> b!1467573 (= lt!641913 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47718 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and start!125432 res!996223) b!1467569))

(assert (= (and b!1467569 res!996227) b!1467567))

(assert (= (and b!1467567 res!996229) b!1467570))

(assert (= (and b!1467570 res!996226) b!1467568))

(assert (= (and b!1467568 res!996225) b!1467572))

(assert (= (and b!1467572 res!996222) b!1467571))

(assert (= (and b!1467571 res!996224) b!1467566))

(assert (= (and b!1467566 res!996228) b!1467573))

(declare-fun m!1354045 () Bool)

(assert (=> b!1467573 m!1354045))

(assert (=> b!1467573 m!1354045))

(declare-fun m!1354047 () Bool)

(assert (=> b!1467573 m!1354047))

(declare-fun m!1354049 () Bool)

(assert (=> start!125432 m!1354049))

(declare-fun m!1354051 () Bool)

(assert (=> start!125432 m!1354051))

(declare-fun m!1354053 () Bool)

(assert (=> b!1467571 m!1354053))

(declare-fun m!1354055 () Bool)

(assert (=> b!1467571 m!1354055))

(declare-fun m!1354057 () Bool)

(assert (=> b!1467572 m!1354057))

(declare-fun m!1354059 () Bool)

(assert (=> b!1467568 m!1354059))

(assert (=> b!1467570 m!1354045))

(assert (=> b!1467570 m!1354045))

(declare-fun m!1354061 () Bool)

(assert (=> b!1467570 m!1354061))

(assert (=> b!1467566 m!1354045))

(assert (=> b!1467566 m!1354045))

(declare-fun m!1354063 () Bool)

(assert (=> b!1467566 m!1354063))

(assert (=> b!1467566 m!1354063))

(assert (=> b!1467566 m!1354045))

(declare-fun m!1354065 () Bool)

(assert (=> b!1467566 m!1354065))

(declare-fun m!1354067 () Bool)

(assert (=> b!1467567 m!1354067))

(assert (=> b!1467567 m!1354067))

(declare-fun m!1354069 () Bool)

(assert (=> b!1467567 m!1354069))

(push 1)

(assert (not b!1467570))

(assert (not b!1467573))

(assert (not start!125432))

(assert (not b!1467567))

(assert (not b!1467566))

(assert (not b!1467568))

(assert (not b!1467572))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

