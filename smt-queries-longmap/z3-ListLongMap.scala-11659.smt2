; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136338 () Bool)

(assert start!136338)

(declare-fun res!1077403 () Bool)

(declare-fun e!879685 () Bool)

(assert (=> start!136338 (=> (not res!1077403) (not e!879685))))

(declare-fun mask!910 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136338 (= res!1077403 (validMask!0 mask!910))))

(assert (=> start!136338 e!879685))

(assert (=> start!136338 true))

(declare-datatypes ((array!105550 0))(
  ( (array!105551 (arr!50897 (Array (_ BitVec 32) (_ BitVec 64))) (size!51447 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105550)

(declare-fun array_inv!39624 (array!105550) Bool)

(assert (=> start!136338 (array_inv!39624 _keys!610)))

(declare-fun b!1577141 () Bool)

(declare-fun res!1077404 () Bool)

(assert (=> b!1577141 (=> (not res!1077404) (not e!879685))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun k0!768 () (_ BitVec 64))

(assert (=> b!1577141 (= res!1077404 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50897 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50897 _keys!610) ee!12) (select (arr!50897 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1577139 () Bool)

(declare-fun res!1077402 () Bool)

(assert (=> b!1577139 (=> (not res!1077402) (not e!879685))))

(assert (=> b!1577139 (= res!1077402 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51447 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1577142 () Bool)

(declare-fun lt!675943 () (_ BitVec 32))

(assert (=> b!1577142 (= e!879685 (or (bvslt lt!675943 #b00000000000000000000000000000000) (bvsge lt!675943 (bvadd #b00000000000000000000000000000001 mask!910))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577142 (= lt!675943 (nextIndex!0 ee!12 x!458 mask!910))))

(declare-fun b!1577140 () Bool)

(declare-fun res!1077405 () Bool)

(assert (=> b!1577140 (=> (not res!1077405) (not e!879685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577140 (= res!1077405 (validKeyInArray!0 k0!768))))

(assert (= (and start!136338 res!1077403) b!1577139))

(assert (= (and b!1577139 res!1077402) b!1577140))

(assert (= (and b!1577140 res!1077405) b!1577141))

(assert (= (and b!1577141 res!1077404) b!1577142))

(declare-fun m!1449455 () Bool)

(assert (=> start!136338 m!1449455))

(declare-fun m!1449457 () Bool)

(assert (=> start!136338 m!1449457))

(declare-fun m!1449459 () Bool)

(assert (=> b!1577141 m!1449459))

(declare-fun m!1449461 () Bool)

(assert (=> b!1577142 m!1449461))

(declare-fun m!1449463 () Bool)

(assert (=> b!1577140 m!1449463))

(check-sat (not b!1577142) (not start!136338) (not b!1577140))
(check-sat)
(get-model)

(declare-fun d!165821 () Bool)

(declare-fun lt!675949 () (_ BitVec 32))

(assert (=> d!165821 (and (bvsge lt!675949 #b00000000000000000000000000000000) (bvslt lt!675949 (bvadd mask!910 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!165821 (= lt!675949 (choose!52 ee!12 x!458 mask!910))))

(assert (=> d!165821 (validMask!0 mask!910)))

(assert (=> d!165821 (= (nextIndex!0 ee!12 x!458 mask!910) lt!675949)))

(declare-fun bs!45553 () Bool)

(assert (= bs!45553 d!165821))

(declare-fun m!1449475 () Bool)

(assert (=> bs!45553 m!1449475))

(assert (=> bs!45553 m!1449455))

(assert (=> b!1577142 d!165821))

(declare-fun d!165823 () Bool)

(assert (=> d!165823 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

(assert (=> start!136338 d!165823))

(declare-fun d!165831 () Bool)

(assert (=> d!165831 (= (array_inv!39624 _keys!610) (bvsge (size!51447 _keys!610) #b00000000000000000000000000000000))))

(assert (=> start!136338 d!165831))

(declare-fun d!165835 () Bool)

(assert (=> d!165835 (= (validKeyInArray!0 k0!768) (and (not (= k0!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577140 d!165835))

(check-sat (not d!165821))
(check-sat)
