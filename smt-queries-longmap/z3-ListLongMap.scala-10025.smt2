; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118256 () Bool)

(assert start!118256)

(declare-fun b!1383270 () Bool)

(declare-fun res!924865 () Bool)

(declare-fun e!784018 () Bool)

(assert (=> b!1383270 (=> (not res!924865) (not e!784018))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94559 0))(
  ( (array!94560 (arr!45657 (Array (_ BitVec 32) (_ BitVec 64))) (size!46207 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94559)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1383270 (= res!924865 (and (= (size!46207 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46207 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46207 a!2938))))))

(declare-fun b!1383272 () Bool)

(declare-fun res!924862 () Bool)

(assert (=> b!1383272 (=> (not res!924862) (not e!784018))))

(declare-datatypes ((List!32185 0))(
  ( (Nil!32182) (Cons!32181 (h!33390 (_ BitVec 64)) (t!46879 List!32185)) )
))
(declare-fun arrayNoDuplicates!0 (array!94559 (_ BitVec 32) List!32185) Bool)

(assert (=> b!1383272 (= res!924862 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32182))))

(declare-fun res!924864 () Bool)

(assert (=> start!118256 (=> (not res!924864) (not e!784018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118256 (= res!924864 (validMask!0 mask!2987))))

(assert (=> start!118256 e!784018))

(assert (=> start!118256 true))

(declare-fun array_inv!34685 (array!94559) Bool)

(assert (=> start!118256 (array_inv!34685 a!2938)))

(declare-fun b!1383273 () Bool)

(assert (=> b!1383273 (= e!784018 false)))

(declare-fun lt!608574 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94559 (_ BitVec 32)) Bool)

(assert (=> b!1383273 (= lt!608574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383271 () Bool)

(declare-fun res!924863 () Bool)

(assert (=> b!1383271 (=> (not res!924863) (not e!784018))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383271 (= res!924863 (validKeyInArray!0 (select (arr!45657 a!2938) i!1065)))))

(assert (= (and start!118256 res!924864) b!1383270))

(assert (= (and b!1383270 res!924865) b!1383271))

(assert (= (and b!1383271 res!924863) b!1383272))

(assert (= (and b!1383272 res!924862) b!1383273))

(declare-fun m!1268373 () Bool)

(assert (=> b!1383272 m!1268373))

(declare-fun m!1268375 () Bool)

(assert (=> start!118256 m!1268375))

(declare-fun m!1268377 () Bool)

(assert (=> start!118256 m!1268377))

(declare-fun m!1268379 () Bool)

(assert (=> b!1383273 m!1268379))

(declare-fun m!1268381 () Bool)

(assert (=> b!1383271 m!1268381))

(assert (=> b!1383271 m!1268381))

(declare-fun m!1268383 () Bool)

(assert (=> b!1383271 m!1268383))

(check-sat (not b!1383271) (not start!118256) (not b!1383272) (not b!1383273))
