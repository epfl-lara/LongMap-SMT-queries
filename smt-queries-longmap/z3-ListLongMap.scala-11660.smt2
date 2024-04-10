; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136368 () Bool)

(assert start!136368)

(declare-fun res!1077438 () Bool)

(declare-fun e!879704 () Bool)

(assert (=> start!136368 (=> (not res!1077438) (not e!879704))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136368 (= res!1077438 (validMask!0 mask!910))))

(assert (=> start!136368 e!879704))

(assert (=> start!136368 true))

(declare-datatypes ((array!105559 0))(
  ( (array!105560 (arr!50900 (Array (_ BitVec 32) (_ BitVec 64))) (size!51450 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105559)

(declare-fun array_inv!39627 (array!105559) Bool)

(assert (=> start!136368 (array_inv!39627 _keys!610)))

(declare-fun b!1577177 () Bool)

(declare-fun res!1077439 () Bool)

(assert (=> b!1577177 (=> (not res!1077439) (not e!879704))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun k0!768 () (_ BitVec 64))

(assert (=> b!1577177 (= res!1077439 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50900 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50900 _keys!610) ee!12) (select (arr!50900 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577176 () Bool)

(declare-fun res!1077441 () Bool)

(assert (=> b!1577176 (=> (not res!1077441) (not e!879704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577176 (= res!1077441 (validKeyInArray!0 k0!768))))

(declare-fun b!1577175 () Bool)

(declare-fun res!1077440 () Bool)

(assert (=> b!1577175 (=> (not res!1077440) (not e!879704))))

(assert (=> b!1577175 (= res!1077440 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51450 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577178 () Bool)

(declare-fun lt!675961 () (_ BitVec 32))

(assert (=> b!1577178 (= e!879704 (and (bvsge lt!675961 #b00000000000000000000000000000000) (bvslt lt!675961 (bvadd #b00000000000000000000000000000001 mask!910)) (bvslt (bvadd #b00000000000000000000000000000001 x!458) #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577178 (= lt!675961 (nextIndex!0 ee!12 x!458 mask!910))))

(assert (= (and start!136368 res!1077438) b!1577175))

(assert (= (and b!1577175 res!1077440) b!1577176))

(assert (= (and b!1577176 res!1077441) b!1577177))

(assert (= (and b!1577177 res!1077439) b!1577178))

(declare-fun m!1449491 () Bool)

(assert (=> start!136368 m!1449491))

(declare-fun m!1449493 () Bool)

(assert (=> start!136368 m!1449493))

(declare-fun m!1449495 () Bool)

(assert (=> b!1577177 m!1449495))

(declare-fun m!1449497 () Bool)

(assert (=> b!1577176 m!1449497))

(declare-fun m!1449499 () Bool)

(assert (=> b!1577178 m!1449499))

(check-sat (not b!1577178) (not start!136368) (not b!1577176))
(check-sat)
