; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125440 () Bool)

(assert start!125440)

(declare-fun res!996055 () Bool)

(declare-fun e!824296 () Bool)

(assert (=> start!125440 (=> (not res!996055) (not e!824296))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125440 (= res!996055 (validMask!0 mask!2687))))

(assert (=> start!125440 e!824296))

(assert (=> start!125440 true))

(declare-datatypes ((array!98888 0))(
  ( (array!98889 (arr!47732 (Array (_ BitVec 32) (_ BitVec 64))) (size!48282 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98888)

(declare-fun array_inv!36760 (array!98888) Bool)

(assert (=> start!125440 (array_inv!36760 a!2862)))

(declare-fun b!1467513 () Bool)

(declare-fun res!996056 () Bool)

(assert (=> b!1467513 (=> (not res!996056) (not e!824296))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467513 (= res!996056 (validKeyInArray!0 (select (arr!47732 a!2862) j!93)))))

(declare-fun b!1467514 () Bool)

(declare-fun res!996053 () Bool)

(assert (=> b!1467514 (=> (not res!996053) (not e!824296))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467514 (= res!996053 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48282 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48282 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48282 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47732 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467515 () Bool)

(declare-fun res!996054 () Bool)

(assert (=> b!1467515 (=> (not res!996054) (not e!824296))))

(assert (=> b!1467515 (= res!996054 (and (= (size!48282 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48282 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48282 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467516 () Bool)

(declare-fun res!996052 () Bool)

(assert (=> b!1467516 (=> (not res!996052) (not e!824296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98888 (_ BitVec 32)) Bool)

(assert (=> b!1467516 (= res!996052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1467517 () Bool)

(declare-fun res!996057 () Bool)

(assert (=> b!1467517 (=> (not res!996057) (not e!824296))))

(assert (=> b!1467517 (= res!996057 (validKeyInArray!0 (select (arr!47732 a!2862) i!1006)))))

(declare-fun b!1467518 () Bool)

(assert (=> b!1467518 (= e!824296 false)))

(declare-fun lt!642114 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467518 (= lt!642114 (toIndex!0 (select (arr!47732 a!2862) j!93) mask!2687))))

(declare-fun b!1467519 () Bool)

(declare-fun res!996058 () Bool)

(assert (=> b!1467519 (=> (not res!996058) (not e!824296))))

(declare-datatypes ((List!34233 0))(
  ( (Nil!34230) (Cons!34229 (h!35579 (_ BitVec 64)) (t!48927 List!34233)) )
))
(declare-fun arrayNoDuplicates!0 (array!98888 (_ BitVec 32) List!34233) Bool)

(assert (=> b!1467519 (= res!996058 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34230))))

(assert (= (and start!125440 res!996055) b!1467515))

(assert (= (and b!1467515 res!996054) b!1467517))

(assert (= (and b!1467517 res!996057) b!1467513))

(assert (= (and b!1467513 res!996056) b!1467516))

(assert (= (and b!1467516 res!996052) b!1467519))

(assert (= (and b!1467519 res!996058) b!1467514))

(assert (= (and b!1467514 res!996053) b!1467518))

(declare-fun m!1354453 () Bool)

(assert (=> b!1467517 m!1354453))

(assert (=> b!1467517 m!1354453))

(declare-fun m!1354455 () Bool)

(assert (=> b!1467517 m!1354455))

(declare-fun m!1354457 () Bool)

(assert (=> b!1467516 m!1354457))

(declare-fun m!1354459 () Bool)

(assert (=> b!1467519 m!1354459))

(declare-fun m!1354461 () Bool)

(assert (=> b!1467513 m!1354461))

(assert (=> b!1467513 m!1354461))

(declare-fun m!1354463 () Bool)

(assert (=> b!1467513 m!1354463))

(declare-fun m!1354465 () Bool)

(assert (=> b!1467514 m!1354465))

(declare-fun m!1354467 () Bool)

(assert (=> b!1467514 m!1354467))

(declare-fun m!1354469 () Bool)

(assert (=> start!125440 m!1354469))

(declare-fun m!1354471 () Bool)

(assert (=> start!125440 m!1354471))

(assert (=> b!1467518 m!1354461))

(assert (=> b!1467518 m!1354461))

(declare-fun m!1354473 () Bool)

(assert (=> b!1467518 m!1354473))

(push 1)

(assert (not b!1467519))

(assert (not start!125440))

(assert (not b!1467513))

(assert (not b!1467518))

(assert (not b!1467516))

(assert (not b!1467517))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

