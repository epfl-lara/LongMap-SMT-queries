; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136410 () Bool)

(assert start!136410)

(declare-fun b!1577382 () Bool)

(declare-fun res!1077647 () Bool)

(declare-fun e!879829 () Bool)

(assert (=> b!1577382 (=> (not res!1077647) (not e!879829))))

(declare-fun ee!12 () (_ BitVec 32))

(declare-datatypes ((array!105601 0))(
  ( (array!105602 (arr!50921 (Array (_ BitVec 32) (_ BitVec 64))) (size!51471 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105601)

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun x!458 () (_ BitVec 32))

(assert (=> b!1577382 (= res!1077647 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51471 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577383 () Bool)

(declare-fun res!1077645 () Bool)

(assert (=> b!1577383 (=> (not res!1077645) (not e!879829))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577383 (= res!1077645 (validKeyInArray!0 k0!768))))

(declare-fun b!1577385 () Bool)

(assert (=> b!1577385 (= e!879829 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!458)) (bvsub #b01111111111111111111111111111110 x!458)))))

(declare-fun lt!675979 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577385 (= lt!675979 (nextIndex!0 ee!12 x!458 mask!910))))

(declare-fun res!1077646 () Bool)

(assert (=> start!136410 (=> (not res!1077646) (not e!879829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136410 (= res!1077646 (validMask!0 mask!910))))

(assert (=> start!136410 e!879829))

(assert (=> start!136410 true))

(declare-fun array_inv!39648 (array!105601) Bool)

(assert (=> start!136410 (array_inv!39648 _keys!610)))

(declare-fun b!1577384 () Bool)

(declare-fun res!1077648 () Bool)

(assert (=> b!1577384 (=> (not res!1077648) (not e!879829))))

(assert (=> b!1577384 (= res!1077648 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50921 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50921 _keys!610) ee!12) (select (arr!50921 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!136410 res!1077646) b!1577382))

(assert (= (and b!1577382 res!1077647) b!1577383))

(assert (= (and b!1577383 res!1077645) b!1577384))

(assert (= (and b!1577384 res!1077648) b!1577385))

(declare-fun m!1449665 () Bool)

(assert (=> b!1577383 m!1449665))

(declare-fun m!1449667 () Bool)

(assert (=> b!1577385 m!1449667))

(declare-fun m!1449669 () Bool)

(assert (=> start!136410 m!1449669))

(declare-fun m!1449671 () Bool)

(assert (=> start!136410 m!1449671))

(declare-fun m!1449673 () Bool)

(assert (=> b!1577384 m!1449673))

(check-sat (not b!1577385) (not b!1577383) (not start!136410))
(check-sat)
