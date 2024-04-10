; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136374 () Bool)

(assert start!136374)

(declare-fun b!1577214 () Bool)

(declare-fun e!879721 () Bool)

(assert (=> b!1577214 (= e!879721 false)))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun lt!675970 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577214 (= lt!675970 (nextIndex!0 ee!12 x!458 mask!910))))

(declare-fun b!1577212 () Bool)

(declare-fun res!1077475 () Bool)

(assert (=> b!1577212 (=> (not res!1077475) (not e!879721))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577212 (= res!1077475 (validKeyInArray!0 k0!768))))

(declare-fun res!1077476 () Bool)

(assert (=> start!136374 (=> (not res!1077476) (not e!879721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136374 (= res!1077476 (validMask!0 mask!910))))

(assert (=> start!136374 e!879721))

(assert (=> start!136374 true))

(declare-datatypes ((array!105565 0))(
  ( (array!105566 (arr!50903 (Array (_ BitVec 32) (_ BitVec 64))) (size!51453 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105565)

(declare-fun array_inv!39630 (array!105565) Bool)

(assert (=> start!136374 (array_inv!39630 _keys!610)))

(declare-fun b!1577213 () Bool)

(declare-fun res!1077477 () Bool)

(assert (=> b!1577213 (=> (not res!1077477) (not e!879721))))

(assert (=> b!1577213 (= res!1077477 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50903 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50903 _keys!610) ee!12) (select (arr!50903 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577211 () Bool)

(declare-fun res!1077474 () Bool)

(assert (=> b!1577211 (=> (not res!1077474) (not e!879721))))

(assert (=> b!1577211 (= res!1077474 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51453 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(assert (= (and start!136374 res!1077476) b!1577211))

(assert (= (and b!1577211 res!1077474) b!1577212))

(assert (= (and b!1577212 res!1077475) b!1577213))

(assert (= (and b!1577213 res!1077477) b!1577214))

(declare-fun m!1449521 () Bool)

(assert (=> b!1577214 m!1449521))

(declare-fun m!1449523 () Bool)

(assert (=> b!1577212 m!1449523))

(declare-fun m!1449525 () Bool)

(assert (=> start!136374 m!1449525))

(declare-fun m!1449527 () Bool)

(assert (=> start!136374 m!1449527))

(declare-fun m!1449529 () Bool)

(assert (=> b!1577213 m!1449529))

(check-sat (not b!1577214) (not start!136374) (not b!1577212))
