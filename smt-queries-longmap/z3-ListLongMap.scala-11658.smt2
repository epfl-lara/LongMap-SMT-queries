; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136332 () Bool)

(assert start!136332)

(declare-fun b!1577104 () Bool)

(declare-fun res!1077369 () Bool)

(declare-fun e!879668 () Bool)

(assert (=> b!1577104 (=> (not res!1077369) (not e!879668))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577104 (= res!1077369 (validKeyInArray!0 k0!768))))

(declare-fun b!1577105 () Bool)

(declare-fun res!1077366 () Bool)

(assert (=> b!1577105 (=> (not res!1077366) (not e!879668))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-datatypes ((array!105544 0))(
  ( (array!105545 (arr!50894 (Array (_ BitVec 32) (_ BitVec 64))) (size!51444 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105544)

(assert (=> b!1577105 (= res!1077366 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50894 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50894 _keys!610) ee!12) (select (arr!50894 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1077367 () Bool)

(assert (=> start!136332 (=> (not res!1077367) (not e!879668))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136332 (= res!1077367 (validMask!0 mask!910))))

(assert (=> start!136332 e!879668))

(assert (=> start!136332 true))

(declare-fun array_inv!39621 (array!105544) Bool)

(assert (=> start!136332 (array_inv!39621 _keys!610)))

(declare-fun b!1577103 () Bool)

(declare-fun res!1077368 () Bool)

(assert (=> b!1577103 (=> (not res!1077368) (not e!879668))))

(assert (=> b!1577103 (= res!1077368 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51444 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577106 () Bool)

(assert (=> b!1577106 (= e!879668 false)))

(declare-fun lt!675934 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577106 (= lt!675934 (nextIndex!0 ee!12 x!458 mask!910))))

(assert (= (and start!136332 res!1077367) b!1577103))

(assert (= (and b!1577103 res!1077368) b!1577104))

(assert (= (and b!1577104 res!1077369) b!1577105))

(assert (= (and b!1577105 res!1077366) b!1577106))

(declare-fun m!1449425 () Bool)

(assert (=> b!1577104 m!1449425))

(declare-fun m!1449427 () Bool)

(assert (=> b!1577105 m!1449427))

(declare-fun m!1449429 () Bool)

(assert (=> start!136332 m!1449429))

(declare-fun m!1449431 () Bool)

(assert (=> start!136332 m!1449431))

(declare-fun m!1449433 () Bool)

(assert (=> b!1577106 m!1449433))

(check-sat (not b!1577106) (not start!136332) (not b!1577104))
