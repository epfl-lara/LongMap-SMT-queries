; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127528 () Bool)

(assert start!127528)

(declare-fun res!1019352 () Bool)

(declare-fun e!838963 () Bool)

(assert (=> start!127528 (=> (not res!1019352) (not e!838963))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127528 (= res!1019352 (validMask!0 mask!2661))))

(assert (=> start!127528 e!838963))

(assert (=> start!127528 true))

(declare-datatypes ((array!99909 0))(
  ( (array!99910 (arr!48214 (Array (_ BitVec 32) (_ BitVec 64))) (size!48764 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99909)

(declare-fun array_inv!37242 (array!99909) Bool)

(assert (=> start!127528 (array_inv!37242 a!2850)))

(declare-fun b!1498273 () Bool)

(declare-fun res!1019353 () Bool)

(assert (=> b!1498273 (=> (not res!1019353) (not e!838963))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498273 (= res!1019353 (validKeyInArray!0 (select (arr!48214 a!2850) j!87)))))

(declare-fun b!1498274 () Bool)

(declare-fun res!1019349 () Bool)

(assert (=> b!1498274 (=> (not res!1019349) (not e!838963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99909 (_ BitVec 32)) Bool)

(assert (=> b!1498274 (= res!1019349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498275 () Bool)

(declare-fun res!1019350 () Bool)

(assert (=> b!1498275 (=> (not res!1019350) (not e!838963))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1498275 (= res!1019350 (validKeyInArray!0 (select (arr!48214 a!2850) i!996)))))

(declare-fun b!1498276 () Bool)

(assert (=> b!1498276 (= e!838963 false)))

(declare-fun lt!652624 () Bool)

(declare-datatypes ((List!34706 0))(
  ( (Nil!34703) (Cons!34702 (h!36099 (_ BitVec 64)) (t!49400 List!34706)) )
))
(declare-fun arrayNoDuplicates!0 (array!99909 (_ BitVec 32) List!34706) Bool)

(assert (=> b!1498276 (= lt!652624 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34703))))

(declare-fun b!1498277 () Bool)

(declare-fun res!1019351 () Bool)

(assert (=> b!1498277 (=> (not res!1019351) (not e!838963))))

(assert (=> b!1498277 (= res!1019351 (and (= (size!48764 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48764 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48764 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127528 res!1019352) b!1498277))

(assert (= (and b!1498277 res!1019351) b!1498275))

(assert (= (and b!1498275 res!1019350) b!1498273))

(assert (= (and b!1498273 res!1019353) b!1498274))

(assert (= (and b!1498274 res!1019349) b!1498276))

(declare-fun m!1381365 () Bool)

(assert (=> b!1498275 m!1381365))

(assert (=> b!1498275 m!1381365))

(declare-fun m!1381367 () Bool)

(assert (=> b!1498275 m!1381367))

(declare-fun m!1381369 () Bool)

(assert (=> b!1498273 m!1381369))

(assert (=> b!1498273 m!1381369))

(declare-fun m!1381371 () Bool)

(assert (=> b!1498273 m!1381371))

(declare-fun m!1381373 () Bool)

(assert (=> start!127528 m!1381373))

(declare-fun m!1381375 () Bool)

(assert (=> start!127528 m!1381375))

(declare-fun m!1381377 () Bool)

(assert (=> b!1498276 m!1381377))

(declare-fun m!1381379 () Bool)

(assert (=> b!1498274 m!1381379))

(push 1)

(assert (not b!1498276))

(assert (not b!1498275))

(assert (not start!127528))

(assert (not b!1498274))

(assert (not b!1498273))

(check-sat)

