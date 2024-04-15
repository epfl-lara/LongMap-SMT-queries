; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136300 () Bool)

(assert start!136300)

(declare-fun b!1576815 () Bool)

(declare-fun res!1077263 () Bool)

(declare-fun e!879481 () Bool)

(assert (=> b!1576815 (=> (not res!1077263) (not e!879481))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1576815 (= res!1077263 (validKeyInArray!0 k0!768))))

(declare-fun b!1576814 () Bool)

(declare-fun res!1077264 () Bool)

(assert (=> b!1576814 (=> (not res!1077264) (not e!879481))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-datatypes ((array!105479 0))(
  ( (array!105480 (arr!50861 (Array (_ BitVec 32) (_ BitVec 64))) (size!51413 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105479)

(declare-fun mask!910 () (_ BitVec 32))

(assert (=> b!1576814 (= res!1077264 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51413 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun res!1077262 () Bool)

(assert (=> start!136300 (=> (not res!1077262) (not e!879481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136300 (= res!1077262 (validMask!0 mask!910))))

(assert (=> start!136300 e!879481))

(assert (=> start!136300 true))

(declare-fun array_inv!39797 (array!105479) Bool)

(assert (=> start!136300 (array_inv!39797 _keys!610)))

(declare-fun b!1576816 () Bool)

(declare-fun res!1077261 () Bool)

(assert (=> b!1576816 (=> (not res!1077261) (not e!879481))))

(assert (=> b!1576816 (= res!1077261 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50861 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50861 _keys!610) ee!12) (select (arr!50861 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1576817 () Bool)

(declare-fun lt!675654 () (_ BitVec 32))

(assert (=> b!1576817 (= e!879481 (or (bvslt lt!675654 #b00000000000000000000000000000000) (bvsge lt!675654 (bvadd #b00000000000000000000000000000001 mask!910))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1576817 (= lt!675654 (nextIndex!0 ee!12 x!458 mask!910))))

(assert (= (and start!136300 res!1077262) b!1576814))

(assert (= (and b!1576814 res!1077264) b!1576815))

(assert (= (and b!1576815 res!1077263) b!1576816))

(assert (= (and b!1576816 res!1077261) b!1576817))

(declare-fun m!1448553 () Bool)

(assert (=> b!1576815 m!1448553))

(declare-fun m!1448555 () Bool)

(assert (=> start!136300 m!1448555))

(declare-fun m!1448557 () Bool)

(assert (=> start!136300 m!1448557))

(declare-fun m!1448559 () Bool)

(assert (=> b!1576816 m!1448559))

(declare-fun m!1448561 () Bool)

(assert (=> b!1576817 m!1448561))

(check-sat (not start!136300) (not b!1576817) (not b!1576815))
(check-sat)
(get-model)

(declare-fun d!165581 () Bool)

(assert (=> d!165581 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

(assert (=> start!136300 d!165581))

(declare-fun d!165585 () Bool)

(assert (=> d!165585 (= (array_inv!39797 _keys!610) (bvsge (size!51413 _keys!610) #b00000000000000000000000000000000))))

(assert (=> start!136300 d!165585))

(declare-fun d!165587 () Bool)

(declare-fun lt!675666 () (_ BitVec 32))

(assert (=> d!165587 (and (bvsge lt!675666 #b00000000000000000000000000000000) (bvslt lt!675666 (bvadd mask!910 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!165587 (= lt!675666 (choose!52 ee!12 x!458 mask!910))))

(assert (=> d!165587 (validMask!0 mask!910)))

(assert (=> d!165587 (= (nextIndex!0 ee!12 x!458 mask!910) lt!675666)))

(declare-fun bs!45508 () Bool)

(assert (= bs!45508 d!165587))

(declare-fun m!1448585 () Bool)

(assert (=> bs!45508 m!1448585))

(assert (=> bs!45508 m!1448555))

(assert (=> b!1576817 d!165587))

(declare-fun d!165595 () Bool)

(assert (=> d!165595 (= (validKeyInArray!0 k0!768) (and (not (= k0!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1576815 d!165595))

(check-sat (not d!165587))
(check-sat)
