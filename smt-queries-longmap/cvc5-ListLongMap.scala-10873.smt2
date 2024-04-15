; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127458 () Bool)

(assert start!127458)

(declare-fun b!1497759 () Bool)

(declare-fun e!838692 () Bool)

(assert (=> b!1497759 (= e!838692 false)))

(declare-fun lt!652327 () Bool)

(declare-datatypes ((array!99833 0))(
  ( (array!99834 (arr!48177 (Array (_ BitVec 32) (_ BitVec 64))) (size!48729 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99833)

(declare-datatypes ((List!34747 0))(
  ( (Nil!34744) (Cons!34743 (h!36141 (_ BitVec 64)) (t!49433 List!34747)) )
))
(declare-fun arrayNoDuplicates!0 (array!99833 (_ BitVec 32) List!34747) Bool)

(assert (=> b!1497759 (= lt!652327 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34744))))

(declare-fun res!1019025 () Bool)

(assert (=> start!127458 (=> (not res!1019025) (not e!838692))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127458 (= res!1019025 (validMask!0 mask!2661))))

(assert (=> start!127458 e!838692))

(assert (=> start!127458 true))

(declare-fun array_inv!37410 (array!99833) Bool)

(assert (=> start!127458 (array_inv!37410 a!2850)))

(declare-fun b!1497760 () Bool)

(declare-fun res!1019023 () Bool)

(assert (=> b!1497760 (=> (not res!1019023) (not e!838692))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497760 (= res!1019023 (validKeyInArray!0 (select (arr!48177 a!2850) i!996)))))

(declare-fun b!1497761 () Bool)

(declare-fun res!1019027 () Bool)

(assert (=> b!1497761 (=> (not res!1019027) (not e!838692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99833 (_ BitVec 32)) Bool)

(assert (=> b!1497761 (= res!1019027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1497762 () Bool)

(declare-fun res!1019024 () Bool)

(assert (=> b!1497762 (=> (not res!1019024) (not e!838692))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1497762 (= res!1019024 (and (= (size!48729 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48729 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48729 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1497763 () Bool)

(declare-fun res!1019026 () Bool)

(assert (=> b!1497763 (=> (not res!1019026) (not e!838692))))

(assert (=> b!1497763 (= res!1019026 (validKeyInArray!0 (select (arr!48177 a!2850) j!87)))))

(assert (= (and start!127458 res!1019025) b!1497762))

(assert (= (and b!1497762 res!1019024) b!1497760))

(assert (= (and b!1497760 res!1019023) b!1497763))

(assert (= (and b!1497763 res!1019026) b!1497761))

(assert (= (and b!1497761 res!1019027) b!1497759))

(declare-fun m!1380267 () Bool)

(assert (=> b!1497760 m!1380267))

(assert (=> b!1497760 m!1380267))

(declare-fun m!1380269 () Bool)

(assert (=> b!1497760 m!1380269))

(declare-fun m!1380271 () Bool)

(assert (=> b!1497761 m!1380271))

(declare-fun m!1380273 () Bool)

(assert (=> b!1497763 m!1380273))

(assert (=> b!1497763 m!1380273))

(declare-fun m!1380275 () Bool)

(assert (=> b!1497763 m!1380275))

(declare-fun m!1380277 () Bool)

(assert (=> start!127458 m!1380277))

(declare-fun m!1380279 () Bool)

(assert (=> start!127458 m!1380279))

(declare-fun m!1380281 () Bool)

(assert (=> b!1497759 m!1380281))

(push 1)

(assert (not b!1497759))

(assert (not b!1497761))

(assert (not b!1497760))

(assert (not b!1497763))

(assert (not start!127458))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

