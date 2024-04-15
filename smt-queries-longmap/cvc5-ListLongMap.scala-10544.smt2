; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124376 () Bool)

(assert start!124376)

(declare-fun b!1439053 () Bool)

(declare-fun e!811690 () Bool)

(declare-fun e!811691 () Bool)

(assert (=> b!1439053 (= e!811690 e!811691)))

(declare-fun res!971597 () Bool)

(assert (=> b!1439053 (=> (not res!971597) (not e!811691))))

(declare-datatypes ((SeekEntryResult!11467 0))(
  ( (MissingZero!11467 (index!48260 (_ BitVec 32))) (Found!11467 (index!48261 (_ BitVec 32))) (Intermediate!11467 (undefined!12279 Bool) (index!48262 (_ BitVec 32)) (x!129991 (_ BitVec 32))) (Undefined!11467) (MissingVacant!11467 (index!48263 (_ BitVec 32))) )
))
(declare-fun lt!632544 () SeekEntryResult!11467)

(declare-datatypes ((array!97802 0))(
  ( (array!97803 (arr!47190 (Array (_ BitVec 32) (_ BitVec 64))) (size!47742 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97802)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97802 (_ BitVec 32)) SeekEntryResult!11467)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439053 (= res!971597 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47190 a!2862) j!93) mask!2687) (select (arr!47190 a!2862) j!93) a!2862 mask!2687) lt!632544))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1439053 (= lt!632544 (Intermediate!11467 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439054 () Bool)

(declare-fun res!971601 () Bool)

(assert (=> b!1439054 (=> (not res!971601) (not e!811690))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1439054 (= res!971601 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47742 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47742 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47742 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47190 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439055 () Bool)

(declare-fun res!971602 () Bool)

(assert (=> b!1439055 (=> (not res!971602) (not e!811690))))

(declare-datatypes ((List!33769 0))(
  ( (Nil!33766) (Cons!33765 (h!35115 (_ BitVec 64)) (t!48455 List!33769)) )
))
(declare-fun arrayNoDuplicates!0 (array!97802 (_ BitVec 32) List!33769) Bool)

(assert (=> b!1439055 (= res!971602 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33766))))

(declare-fun b!1439056 () Bool)

(declare-fun res!971598 () Bool)

(assert (=> b!1439056 (=> (not res!971598) (not e!811690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97802 (_ BitVec 32)) Bool)

(assert (=> b!1439056 (= res!971598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439057 () Bool)

(declare-fun res!971600 () Bool)

(assert (=> b!1439057 (=> (not res!971600) (not e!811690))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439057 (= res!971600 (validKeyInArray!0 (select (arr!47190 a!2862) i!1006)))))

(declare-fun b!1439058 () Bool)

(declare-fun res!971603 () Bool)

(assert (=> b!1439058 (=> (not res!971603) (not e!811690))))

(assert (=> b!1439058 (= res!971603 (validKeyInArray!0 (select (arr!47190 a!2862) j!93)))))

(declare-fun b!1439059 () Bool)

(assert (=> b!1439059 (= e!811691 false)))

(declare-fun lt!632543 () SeekEntryResult!11467)

(assert (=> b!1439059 (= lt!632543 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47190 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47190 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97803 (store (arr!47190 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47742 a!2862)) mask!2687))))

(declare-fun res!971604 () Bool)

(assert (=> start!124376 (=> (not res!971604) (not e!811690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124376 (= res!971604 (validMask!0 mask!2687))))

(assert (=> start!124376 e!811690))

(assert (=> start!124376 true))

(declare-fun array_inv!36423 (array!97802) Bool)

(assert (=> start!124376 (array_inv!36423 a!2862)))

(declare-fun b!1439060 () Bool)

(declare-fun res!971599 () Bool)

(assert (=> b!1439060 (=> (not res!971599) (not e!811690))))

(assert (=> b!1439060 (= res!971599 (and (= (size!47742 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47742 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47742 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439061 () Bool)

(declare-fun res!971605 () Bool)

(assert (=> b!1439061 (=> (not res!971605) (not e!811691))))

(assert (=> b!1439061 (= res!971605 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47190 a!2862) j!93) a!2862 mask!2687) lt!632544))))

(assert (= (and start!124376 res!971604) b!1439060))

(assert (= (and b!1439060 res!971599) b!1439057))

(assert (= (and b!1439057 res!971600) b!1439058))

(assert (= (and b!1439058 res!971603) b!1439056))

(assert (= (and b!1439056 res!971598) b!1439055))

(assert (= (and b!1439055 res!971602) b!1439054))

(assert (= (and b!1439054 res!971601) b!1439053))

(assert (= (and b!1439053 res!971597) b!1439061))

(assert (= (and b!1439061 res!971605) b!1439059))

(declare-fun m!1327627 () Bool)

(assert (=> b!1439056 m!1327627))

(declare-fun m!1327629 () Bool)

(assert (=> b!1439059 m!1327629))

(declare-fun m!1327631 () Bool)

(assert (=> b!1439059 m!1327631))

(assert (=> b!1439059 m!1327631))

(declare-fun m!1327633 () Bool)

(assert (=> b!1439059 m!1327633))

(assert (=> b!1439059 m!1327633))

(assert (=> b!1439059 m!1327631))

(declare-fun m!1327635 () Bool)

(assert (=> b!1439059 m!1327635))

(declare-fun m!1327637 () Bool)

(assert (=> start!124376 m!1327637))

(declare-fun m!1327639 () Bool)

(assert (=> start!124376 m!1327639))

(declare-fun m!1327641 () Bool)

(assert (=> b!1439055 m!1327641))

(declare-fun m!1327643 () Bool)

(assert (=> b!1439053 m!1327643))

(assert (=> b!1439053 m!1327643))

(declare-fun m!1327645 () Bool)

(assert (=> b!1439053 m!1327645))

(assert (=> b!1439053 m!1327645))

(assert (=> b!1439053 m!1327643))

(declare-fun m!1327647 () Bool)

(assert (=> b!1439053 m!1327647))

(assert (=> b!1439054 m!1327629))

(declare-fun m!1327649 () Bool)

(assert (=> b!1439054 m!1327649))

(assert (=> b!1439058 m!1327643))

(assert (=> b!1439058 m!1327643))

(declare-fun m!1327651 () Bool)

(assert (=> b!1439058 m!1327651))

(declare-fun m!1327653 () Bool)

(assert (=> b!1439057 m!1327653))

(assert (=> b!1439057 m!1327653))

(declare-fun m!1327655 () Bool)

(assert (=> b!1439057 m!1327655))

(assert (=> b!1439061 m!1327643))

(assert (=> b!1439061 m!1327643))

(declare-fun m!1327657 () Bool)

(assert (=> b!1439061 m!1327657))

(push 1)

(assert (not b!1439061))

(assert (not b!1439058))

(assert (not b!1439057))

(assert (not b!1439053))

(assert (not b!1439056))

(assert (not b!1439055))

(assert (not b!1439059))

(assert (not start!124376))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

