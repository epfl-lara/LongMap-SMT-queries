; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92758 () Bool)

(assert start!92758)

(declare-fun b!1053498 () Bool)

(declare-fun res!702564 () Bool)

(declare-fun e!598351 () Bool)

(assert (=> b!1053498 (=> (not res!702564) (not e!598351))))

(declare-datatypes ((array!66392 0))(
  ( (array!66393 (arr!31929 (Array (_ BitVec 32) (_ BitVec 64))) (size!32467 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66392)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053498 (= res!702564 (= (select (arr!31929 a!3488) i!1381) k0!2747))))

(declare-fun b!1053499 () Bool)

(declare-fun lt!464985 () (_ BitVec 32))

(declare-fun e!598354 () Bool)

(declare-fun arrayContainsKey!0 (array!66392 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053499 (= e!598354 (arrayContainsKey!0 a!3488 k0!2747 lt!464985))))

(declare-fun b!1053500 () Bool)

(declare-fun res!702565 () Bool)

(assert (=> b!1053500 (=> (not res!702565) (not e!598351))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053500 (= res!702565 (validKeyInArray!0 k0!2747))))

(declare-fun b!1053501 () Bool)

(declare-fun e!598355 () Bool)

(assert (=> b!1053501 (= e!598355 e!598354)))

(declare-fun res!702566 () Bool)

(assert (=> b!1053501 (=> res!702566 e!598354)))

(assert (=> b!1053501 (= res!702566 (bvsle lt!464985 i!1381))))

(declare-fun b!1053502 () Bool)

(declare-fun e!598353 () Bool)

(assert (=> b!1053502 (= e!598351 e!598353)))

(declare-fun res!702571 () Bool)

(assert (=> b!1053502 (=> (not res!702571) (not e!598353))))

(declare-fun lt!464986 () array!66392)

(assert (=> b!1053502 (= res!702571 (arrayContainsKey!0 lt!464986 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053502 (= lt!464986 (array!66393 (store (arr!31929 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32467 a!3488)))))

(declare-fun res!702567 () Bool)

(assert (=> start!92758 (=> (not res!702567) (not e!598351))))

(assert (=> start!92758 (= res!702567 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32467 a!3488)) (bvslt (size!32467 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92758 e!598351))

(assert (=> start!92758 true))

(declare-fun array_inv!24712 (array!66392) Bool)

(assert (=> start!92758 (array_inv!24712 a!3488)))

(declare-fun b!1053503 () Bool)

(declare-fun e!598352 () Bool)

(assert (=> b!1053503 (= e!598352 (not true))))

(assert (=> b!1053503 e!598355))

(declare-fun res!702570 () Bool)

(assert (=> b!1053503 (=> (not res!702570) (not e!598355))))

(assert (=> b!1053503 (= res!702570 (= (select (store (arr!31929 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464985) k0!2747))))

(declare-fun b!1053504 () Bool)

(declare-fun res!702568 () Bool)

(assert (=> b!1053504 (=> (not res!702568) (not e!598351))))

(declare-datatypes ((List!22300 0))(
  ( (Nil!22297) (Cons!22296 (h!23505 (_ BitVec 64)) (t!31598 List!22300)) )
))
(declare-fun arrayNoDuplicates!0 (array!66392 (_ BitVec 32) List!22300) Bool)

(assert (=> b!1053504 (= res!702568 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22297))))

(declare-fun b!1053505 () Bool)

(assert (=> b!1053505 (= e!598353 e!598352)))

(declare-fun res!702569 () Bool)

(assert (=> b!1053505 (=> (not res!702569) (not e!598352))))

(assert (=> b!1053505 (= res!702569 (not (= lt!464985 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66392 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053505 (= lt!464985 (arrayScanForKey!0 lt!464986 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92758 res!702567) b!1053504))

(assert (= (and b!1053504 res!702568) b!1053500))

(assert (= (and b!1053500 res!702565) b!1053498))

(assert (= (and b!1053498 res!702564) b!1053502))

(assert (= (and b!1053502 res!702571) b!1053505))

(assert (= (and b!1053505 res!702569) b!1053503))

(assert (= (and b!1053503 res!702570) b!1053501))

(assert (= (and b!1053501 (not res!702566)) b!1053499))

(declare-fun m!973267 () Bool)

(assert (=> b!1053503 m!973267))

(declare-fun m!973269 () Bool)

(assert (=> b!1053503 m!973269))

(declare-fun m!973271 () Bool)

(assert (=> start!92758 m!973271))

(declare-fun m!973273 () Bool)

(assert (=> b!1053500 m!973273))

(declare-fun m!973275 () Bool)

(assert (=> b!1053499 m!973275))

(declare-fun m!973277 () Bool)

(assert (=> b!1053502 m!973277))

(assert (=> b!1053502 m!973267))

(declare-fun m!973279 () Bool)

(assert (=> b!1053498 m!973279))

(declare-fun m!973281 () Bool)

(assert (=> b!1053505 m!973281))

(declare-fun m!973283 () Bool)

(assert (=> b!1053504 m!973283))

(check-sat (not b!1053505) (not b!1053499) (not b!1053500) (not start!92758) (not b!1053504) (not b!1053502))
(check-sat)
