; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136340 () Bool)

(assert start!136340)

(declare-fun b!1577154 () Bool)

(declare-fun e!879692 () Bool)

(declare-fun lt!675946 () (_ BitVec 32))

(declare-fun mask!910 () (_ BitVec 32))

(assert (=> b!1577154 (= e!879692 (or (bvslt lt!675946 #b00000000000000000000000000000000) (bvsge lt!675946 (bvadd #b00000000000000000000000000000001 mask!910))))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577154 (= lt!675946 (nextIndex!0 ee!12 x!458 mask!910))))

(declare-fun b!1577153 () Bool)

(declare-fun res!1077417 () Bool)

(assert (=> b!1577153 (=> (not res!1077417) (not e!879692))))

(declare-fun k!768 () (_ BitVec 64))

(declare-datatypes ((array!105552 0))(
  ( (array!105553 (arr!50898 (Array (_ BitVec 32) (_ BitVec 64))) (size!51448 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105552)

(assert (=> b!1577153 (= res!1077417 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50898 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50898 _keys!610) ee!12) (select (arr!50898 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1077414 () Bool)

(assert (=> start!136340 (=> (not res!1077414) (not e!879692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136340 (= res!1077414 (validMask!0 mask!910))))

(assert (=> start!136340 e!879692))

(assert (=> start!136340 true))

(declare-fun array_inv!39625 (array!105552) Bool)

(assert (=> start!136340 (array_inv!39625 _keys!610)))

(declare-fun b!1577152 () Bool)

(declare-fun res!1077416 () Bool)

(assert (=> b!1577152 (=> (not res!1077416) (not e!879692))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577152 (= res!1077416 (validKeyInArray!0 k!768))))

(declare-fun b!1577151 () Bool)

(declare-fun res!1077415 () Bool)

(assert (=> b!1577151 (=> (not res!1077415) (not e!879692))))

(assert (=> b!1577151 (= res!1077415 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51448 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(assert (= (and start!136340 res!1077414) b!1577151))

(assert (= (and b!1577151 res!1077415) b!1577152))

(assert (= (and b!1577152 res!1077416) b!1577153))

(assert (= (and b!1577153 res!1077417) b!1577154))

(declare-fun m!1449465 () Bool)

(assert (=> b!1577154 m!1449465))

(declare-fun m!1449467 () Bool)

(assert (=> b!1577153 m!1449467))

(declare-fun m!1449469 () Bool)

(assert (=> start!136340 m!1449469))

(declare-fun m!1449471 () Bool)

(assert (=> start!136340 m!1449471))

(declare-fun m!1449473 () Bool)

(assert (=> b!1577152 m!1449473))

(push 1)

(assert (not start!136340))

(assert (not b!1577152))

(assert (not b!1577154))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165833 () Bool)

(assert (=> d!165833 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

