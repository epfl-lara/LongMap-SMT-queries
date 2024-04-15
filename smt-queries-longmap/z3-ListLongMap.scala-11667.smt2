; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136372 () Bool)

(assert start!136372)

(declare-fun b!1577059 () Bool)

(declare-fun res!1077504 () Bool)

(declare-fun e!879626 () Bool)

(assert (=> b!1577059 (=> (not res!1077504) (not e!879626))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun k0!768 () (_ BitVec 64))

(declare-datatypes ((array!105530 0))(
  ( (array!105531 (arr!50885 (Array (_ BitVec 32) (_ BitVec 64))) (size!51437 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105530)

(assert (=> b!1577059 (= res!1077504 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50885 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50885 _keys!610) ee!12) (select (arr!50885 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577058 () Bool)

(declare-fun res!1077507 () Bool)

(assert (=> b!1577058 (=> (not res!1077507) (not e!879626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577058 (= res!1077507 (validKeyInArray!0 k0!768))))

(declare-fun b!1577060 () Bool)

(assert (=> b!1577060 (= e!879626 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!458)) (bvsub #b01111111111111111111111111111110 x!458)))))

(declare-fun lt!675690 () (_ BitVec 32))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577060 (= lt!675690 (nextIndex!0 ee!12 x!458 mask!910))))

(declare-fun b!1577057 () Bool)

(declare-fun res!1077505 () Bool)

(assert (=> b!1577057 (=> (not res!1077505) (not e!879626))))

(assert (=> b!1577057 (= res!1077505 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51437 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun res!1077506 () Bool)

(assert (=> start!136372 (=> (not res!1077506) (not e!879626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136372 (= res!1077506 (validMask!0 mask!910))))

(assert (=> start!136372 e!879626))

(assert (=> start!136372 true))

(declare-fun array_inv!39821 (array!105530) Bool)

(assert (=> start!136372 (array_inv!39821 _keys!610)))

(assert (= (and start!136372 res!1077506) b!1577057))

(assert (= (and b!1577057 res!1077505) b!1577058))

(assert (= (and b!1577058 res!1077507) b!1577059))

(assert (= (and b!1577059 res!1077504) b!1577060))

(declare-fun m!1448763 () Bool)

(assert (=> b!1577059 m!1448763))

(declare-fun m!1448765 () Bool)

(assert (=> b!1577058 m!1448765))

(declare-fun m!1448767 () Bool)

(assert (=> b!1577060 m!1448767))

(declare-fun m!1448769 () Bool)

(assert (=> start!136372 m!1448769))

(declare-fun m!1448771 () Bool)

(assert (=> start!136372 m!1448771))

(check-sat (not b!1577060) (not start!136372) (not b!1577058))
(check-sat)
