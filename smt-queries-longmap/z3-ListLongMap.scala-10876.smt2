; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127520 () Bool)

(assert start!127520)

(declare-fun b!1498209 () Bool)

(declare-fun res!1019290 () Bool)

(declare-fun e!838939 () Bool)

(assert (=> b!1498209 (=> (not res!1019290) (not e!838939))))

(declare-datatypes ((array!99901 0))(
  ( (array!99902 (arr!48210 (Array (_ BitVec 32) (_ BitVec 64))) (size!48760 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99901)

(declare-datatypes ((List!34702 0))(
  ( (Nil!34699) (Cons!34698 (h!36095 (_ BitVec 64)) (t!49396 List!34702)) )
))
(declare-fun arrayNoDuplicates!0 (array!99901 (_ BitVec 32) List!34702) Bool)

(assert (=> b!1498209 (= res!1019290 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34699))))

(declare-fun b!1498210 () Bool)

(declare-fun res!1019287 () Bool)

(assert (=> b!1498210 (=> (not res!1019287) (not e!838939))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99901 (_ BitVec 32)) Bool)

(assert (=> b!1498210 (= res!1019287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1019285 () Bool)

(assert (=> start!127520 (=> (not res!1019285) (not e!838939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127520 (= res!1019285 (validMask!0 mask!2661))))

(assert (=> start!127520 e!838939))

(assert (=> start!127520 true))

(declare-fun array_inv!37238 (array!99901) Bool)

(assert (=> start!127520 (array_inv!37238 a!2850)))

(declare-fun b!1498211 () Bool)

(declare-fun res!1019288 () Bool)

(assert (=> b!1498211 (=> (not res!1019288) (not e!838939))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498211 (= res!1019288 (validKeyInArray!0 (select (arr!48210 a!2850) i!996)))))

(declare-fun b!1498212 () Bool)

(declare-fun res!1019289 () Bool)

(assert (=> b!1498212 (=> (not res!1019289) (not e!838939))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1498212 (= res!1019289 (validKeyInArray!0 (select (arr!48210 a!2850) j!87)))))

(declare-fun b!1498213 () Bool)

(declare-fun res!1019286 () Bool)

(assert (=> b!1498213 (=> (not res!1019286) (not e!838939))))

(assert (=> b!1498213 (= res!1019286 (and (= (size!48760 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48760 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48760 a!2850)) (not (= i!996 j!87))))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun b!1498214 () Bool)

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498214 (= e!838939 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48760 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48760 a!2850)) (= (select (arr!48210 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48210 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48760 a!2850)) (bvsge mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(assert (= (and start!127520 res!1019285) b!1498213))

(assert (= (and b!1498213 res!1019286) b!1498211))

(assert (= (and b!1498211 res!1019288) b!1498212))

(assert (= (and b!1498212 res!1019289) b!1498210))

(assert (= (and b!1498210 res!1019287) b!1498209))

(assert (= (and b!1498209 res!1019290) b!1498214))

(declare-fun m!1381289 () Bool)

(assert (=> start!127520 m!1381289))

(declare-fun m!1381291 () Bool)

(assert (=> start!127520 m!1381291))

(declare-fun m!1381293 () Bool)

(assert (=> b!1498211 m!1381293))

(assert (=> b!1498211 m!1381293))

(declare-fun m!1381295 () Bool)

(assert (=> b!1498211 m!1381295))

(declare-fun m!1381297 () Bool)

(assert (=> b!1498210 m!1381297))

(declare-fun m!1381299 () Bool)

(assert (=> b!1498212 m!1381299))

(assert (=> b!1498212 m!1381299))

(declare-fun m!1381301 () Bool)

(assert (=> b!1498212 m!1381301))

(declare-fun m!1381303 () Bool)

(assert (=> b!1498214 m!1381303))

(declare-fun m!1381305 () Bool)

(assert (=> b!1498214 m!1381305))

(declare-fun m!1381307 () Bool)

(assert (=> b!1498214 m!1381307))

(declare-fun m!1381309 () Bool)

(assert (=> b!1498209 m!1381309))

(check-sat (not b!1498212) (not b!1498211) (not b!1498209) (not b!1498210) (not start!127520))
(check-sat)
