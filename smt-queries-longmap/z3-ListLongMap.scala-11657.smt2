; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136326 () Bool)

(assert start!136326)

(declare-fun b!1577069 () Bool)

(declare-fun res!1077330 () Bool)

(declare-fun e!879649 () Bool)

(assert (=> b!1577069 (=> (not res!1077330) (not e!879649))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun k0!768 () (_ BitVec 64))

(declare-datatypes ((array!105538 0))(
  ( (array!105539 (arr!50891 (Array (_ BitVec 32) (_ BitVec 64))) (size!51441 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105538)

(assert (=> b!1577069 (= res!1077330 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50891 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50891 _keys!610) ee!12) (select (arr!50891 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577068 () Bool)

(declare-fun res!1077331 () Bool)

(assert (=> b!1577068 (=> (not res!1077331) (not e!879649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577068 (= res!1077331 (validKeyInArray!0 k0!768))))

(declare-fun res!1077333 () Bool)

(assert (=> start!136326 (=> (not res!1077333) (not e!879649))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136326 (= res!1077333 (validMask!0 mask!910))))

(assert (=> start!136326 e!879649))

(assert (=> start!136326 true))

(declare-fun array_inv!39618 (array!105538) Bool)

(assert (=> start!136326 (array_inv!39618 _keys!610)))

(declare-fun b!1577067 () Bool)

(declare-fun res!1077332 () Bool)

(assert (=> b!1577067 (=> (not res!1077332) (not e!879649))))

(assert (=> b!1577067 (= res!1077332 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51441 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577070 () Bool)

(assert (=> b!1577070 (= e!879649 false)))

(declare-fun lt!675925 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577070 (= lt!675925 (nextIndex!0 ee!12 x!458 mask!910))))

(assert (= (and start!136326 res!1077333) b!1577067))

(assert (= (and b!1577067 res!1077332) b!1577068))

(assert (= (and b!1577068 res!1077331) b!1577069))

(assert (= (and b!1577069 res!1077330) b!1577070))

(declare-fun m!1449395 () Bool)

(assert (=> b!1577069 m!1449395))

(declare-fun m!1449397 () Bool)

(assert (=> b!1577068 m!1449397))

(declare-fun m!1449399 () Bool)

(assert (=> start!136326 m!1449399))

(declare-fun m!1449401 () Bool)

(assert (=> start!136326 m!1449401))

(declare-fun m!1449403 () Bool)

(assert (=> b!1577070 m!1449403))

(check-sat (not b!1577068) (not b!1577070) (not start!136326))
