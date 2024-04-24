; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136768 () Bool)

(assert start!136768)

(declare-fun b!1579593 () Bool)

(declare-fun e!881206 () Bool)

(declare-fun lt!676848 () (_ BitVec 32))

(declare-fun mask!910 () (_ BitVec 32))

(assert (=> b!1579593 (= e!881206 (or (bvslt lt!676848 #b00000000000000000000000000000000) (bvsge lt!676848 (bvadd #b00000000000000000000000000000001 mask!910))))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1579593 (= lt!676848 (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910))))

(declare-fun b!1579591 () Bool)

(declare-fun res!1078278 () Bool)

(assert (=> b!1579591 (=> (not res!1078278) (not e!881206))))

(declare-fun k0!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1579591 (= res!1078278 (validKeyInArray!0 k0!768))))

(declare-fun b!1579590 () Bool)

(declare-fun res!1078277 () Bool)

(assert (=> b!1579590 (=> (not res!1078277) (not e!881206))))

(declare-datatypes ((array!105680 0))(
  ( (array!105681 (arr!50953 (Array (_ BitVec 32) (_ BitVec 64))) (size!51504 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105680)

(assert (=> b!1579590 (= res!1078277 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51504 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-fun b!1579592 () Bool)

(declare-fun res!1078279 () Bool)

(assert (=> b!1579592 (=> (not res!1078279) (not e!881206))))

(assert (=> b!1579592 (= res!1078279 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50953 _keys!610) ee!12) k0!768)) (not (= (bvadd (select (arr!50953 _keys!610) ee!12) (select (arr!50953 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1078280 () Bool)

(assert (=> start!136768 (=> (not res!1078280) (not e!881206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136768 (= res!1078280 (validMask!0 mask!910))))

(assert (=> start!136768 e!881206))

(assert (=> start!136768 true))

(declare-fun array_inv!39908 (array!105680) Bool)

(assert (=> start!136768 (array_inv!39908 _keys!610)))

(assert (= (and start!136768 res!1078280) b!1579590))

(assert (= (and b!1579590 res!1078277) b!1579591))

(assert (= (and b!1579591 res!1078278) b!1579592))

(assert (= (and b!1579592 res!1078279) b!1579593))

(declare-fun m!1451727 () Bool)

(assert (=> b!1579593 m!1451727))

(declare-fun m!1451729 () Bool)

(assert (=> b!1579591 m!1451729))

(declare-fun m!1451731 () Bool)

(assert (=> b!1579592 m!1451731))

(declare-fun m!1451733 () Bool)

(assert (=> start!136768 m!1451733))

(declare-fun m!1451735 () Bool)

(assert (=> start!136768 m!1451735))

(check-sat (not start!136768) (not b!1579593) (not b!1579591))
(check-sat)
(get-model)

(declare-fun d!166539 () Bool)

(assert (=> d!166539 (= (validMask!0 mask!910) (and (or (= mask!910 #b00000000000000000000000000000111) (= mask!910 #b00000000000000000000000000001111) (= mask!910 #b00000000000000000000000000011111) (= mask!910 #b00000000000000000000000000111111) (= mask!910 #b00000000000000000000000001111111) (= mask!910 #b00000000000000000000000011111111) (= mask!910 #b00000000000000000000000111111111) (= mask!910 #b00000000000000000000001111111111) (= mask!910 #b00000000000000000000011111111111) (= mask!910 #b00000000000000000000111111111111) (= mask!910 #b00000000000000000001111111111111) (= mask!910 #b00000000000000000011111111111111) (= mask!910 #b00000000000000000111111111111111) (= mask!910 #b00000000000000001111111111111111) (= mask!910 #b00000000000000011111111111111111) (= mask!910 #b00000000000000111111111111111111) (= mask!910 #b00000000000001111111111111111111) (= mask!910 #b00000000000011111111111111111111) (= mask!910 #b00000000000111111111111111111111) (= mask!910 #b00000000001111111111111111111111) (= mask!910 #b00000000011111111111111111111111) (= mask!910 #b00000000111111111111111111111111) (= mask!910 #b00000001111111111111111111111111) (= mask!910 #b00000011111111111111111111111111) (= mask!910 #b00000111111111111111111111111111) (= mask!910 #b00001111111111111111111111111111) (= mask!910 #b00011111111111111111111111111111) (= mask!910 #b00111111111111111111111111111111)) (bvsle mask!910 #b00111111111111111111111111111111)))))

(assert (=> start!136768 d!166539))

(declare-fun d!166545 () Bool)

(assert (=> d!166545 (= (array_inv!39908 _keys!610) (bvsge (size!51504 _keys!610) #b00000000000000000000000000000000))))

(assert (=> start!136768 d!166545))

(declare-fun d!166549 () Bool)

(declare-fun lt!676860 () (_ BitVec 32))

(assert (=> d!166549 (and (bvsge lt!676860 #b00000000000000000000000000000000) (bvslt lt!676860 (bvadd mask!910 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!166549 (= lt!676860 (choose!52 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910))))

(assert (=> d!166549 (validMask!0 mask!910)))

(assert (=> d!166549 (= (nextIndex!0 ee!12 (bvadd #b00000000000000000000000000000001 x!458) mask!910) lt!676860)))

(declare-fun bs!45575 () Bool)

(assert (= bs!45575 d!166549))

(declare-fun m!1451759 () Bool)

(assert (=> bs!45575 m!1451759))

(assert (=> bs!45575 m!1451733))

(assert (=> b!1579593 d!166549))

(declare-fun d!166553 () Bool)

(assert (=> d!166553 (= (validKeyInArray!0 k0!768) (and (not (= k0!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1579591 d!166553))

(check-sat (not d!166549))
(check-sat)
