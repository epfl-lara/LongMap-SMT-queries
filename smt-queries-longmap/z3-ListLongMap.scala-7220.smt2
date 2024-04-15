; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92380 () Bool)

(assert start!92380)

(declare-datatypes ((array!66122 0))(
  ( (array!66123 (arr!31800 (Array (_ BitVec 32) (_ BitVec 64))) (size!32338 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66122)

(declare-fun b!1050218 () Bool)

(declare-fun e!595958 () Bool)

(declare-fun lt!463715 () (_ BitVec 32))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66122 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050218 (= e!595958 (arrayContainsKey!0 a!3488 k0!2747 lt!463715))))

(declare-fun b!1050219 () Bool)

(declare-fun e!595953 () Bool)

(declare-fun e!595954 () Bool)

(assert (=> b!1050219 (= e!595953 (not e!595954))))

(declare-fun res!699436 () Bool)

(assert (=> b!1050219 (=> res!699436 e!595954)))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050219 (= res!699436 (bvsle lt!463715 i!1381))))

(declare-fun e!595959 () Bool)

(assert (=> b!1050219 e!595959))

(declare-fun res!699433 () Bool)

(assert (=> b!1050219 (=> (not res!699433) (not e!595959))))

(assert (=> b!1050219 (= res!699433 (= (select (store (arr!31800 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463715) k0!2747))))

(declare-fun b!1050220 () Bool)

(declare-fun res!699428 () Bool)

(declare-fun e!595955 () Bool)

(assert (=> b!1050220 (=> (not res!699428) (not e!595955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050220 (= res!699428 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050221 () Bool)

(assert (=> b!1050221 (= e!595959 e!595958)))

(declare-fun res!699435 () Bool)

(assert (=> b!1050221 (=> res!699435 e!595958)))

(assert (=> b!1050221 (= res!699435 (bvsle lt!463715 i!1381))))

(declare-fun b!1050222 () Bool)

(declare-fun e!595956 () Bool)

(assert (=> b!1050222 (= e!595955 e!595956)))

(declare-fun res!699431 () Bool)

(assert (=> b!1050222 (=> (not res!699431) (not e!595956))))

(declare-fun lt!463713 () array!66122)

(assert (=> b!1050222 (= res!699431 (arrayContainsKey!0 lt!463713 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050222 (= lt!463713 (array!66123 (store (arr!31800 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32338 a!3488)))))

(declare-fun res!699434 () Bool)

(assert (=> start!92380 (=> (not res!699434) (not e!595955))))

(assert (=> start!92380 (= res!699434 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32338 a!3488)) (bvslt (size!32338 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92380 e!595955))

(assert (=> start!92380 true))

(declare-fun array_inv!24583 (array!66122) Bool)

(assert (=> start!92380 (array_inv!24583 a!3488)))

(declare-fun b!1050223 () Bool)

(assert (=> b!1050223 (= e!595954 true)))

(assert (=> b!1050223 false))

(declare-datatypes ((Unit!34253 0))(
  ( (Unit!34254) )
))
(declare-fun lt!463714 () Unit!34253)

(declare-datatypes ((List!22171 0))(
  ( (Nil!22168) (Cons!22167 (h!23376 (_ BitVec 64)) (t!31469 List!22171)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!66122 (_ BitVec 64) (_ BitVec 32) List!22171) Unit!34253)

(assert (=> b!1050223 (= lt!463714 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 a!3488 k0!2747 i!1381 Nil!22168))))

(assert (=> b!1050223 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!463716 () Unit!34253)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66122 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34253)

(assert (=> b!1050223 (= lt!463716 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!463715 (bvadd #b00000000000000000000000000000001 i!1381)))))

(declare-fun arrayNoDuplicates!0 (array!66122 (_ BitVec 32) List!22171) Bool)

(assert (=> b!1050223 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22168)))

(declare-fun lt!463717 () Unit!34253)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66122 (_ BitVec 32) (_ BitVec 32)) Unit!34253)

(assert (=> b!1050223 (= lt!463717 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1050224 () Bool)

(declare-fun res!699430 () Bool)

(assert (=> b!1050224 (=> (not res!699430) (not e!595955))))

(assert (=> b!1050224 (= res!699430 (= (select (arr!31800 a!3488) i!1381) k0!2747))))

(declare-fun b!1050225 () Bool)

(declare-fun res!699432 () Bool)

(assert (=> b!1050225 (=> (not res!699432) (not e!595955))))

(assert (=> b!1050225 (= res!699432 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22168))))

(declare-fun b!1050226 () Bool)

(assert (=> b!1050226 (= e!595956 e!595953)))

(declare-fun res!699429 () Bool)

(assert (=> b!1050226 (=> (not res!699429) (not e!595953))))

(assert (=> b!1050226 (= res!699429 (not (= lt!463715 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66122 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050226 (= lt!463715 (arrayScanForKey!0 lt!463713 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92380 res!699434) b!1050225))

(assert (= (and b!1050225 res!699432) b!1050220))

(assert (= (and b!1050220 res!699428) b!1050224))

(assert (= (and b!1050224 res!699430) b!1050222))

(assert (= (and b!1050222 res!699431) b!1050226))

(assert (= (and b!1050226 res!699429) b!1050219))

(assert (= (and b!1050219 res!699433) b!1050221))

(assert (= (and b!1050221 (not res!699435)) b!1050218))

(assert (= (and b!1050219 (not res!699436)) b!1050223))

(declare-fun m!970429 () Bool)

(assert (=> b!1050226 m!970429))

(declare-fun m!970431 () Bool)

(assert (=> b!1050225 m!970431))

(declare-fun m!970433 () Bool)

(assert (=> b!1050218 m!970433))

(declare-fun m!970435 () Bool)

(assert (=> b!1050224 m!970435))

(declare-fun m!970437 () Bool)

(assert (=> b!1050223 m!970437))

(declare-fun m!970439 () Bool)

(assert (=> b!1050223 m!970439))

(declare-fun m!970441 () Bool)

(assert (=> b!1050223 m!970441))

(declare-fun m!970443 () Bool)

(assert (=> b!1050223 m!970443))

(declare-fun m!970445 () Bool)

(assert (=> b!1050223 m!970445))

(declare-fun m!970447 () Bool)

(assert (=> start!92380 m!970447))

(declare-fun m!970449 () Bool)

(assert (=> b!1050222 m!970449))

(declare-fun m!970451 () Bool)

(assert (=> b!1050222 m!970451))

(declare-fun m!970453 () Bool)

(assert (=> b!1050220 m!970453))

(assert (=> b!1050219 m!970451))

(declare-fun m!970455 () Bool)

(assert (=> b!1050219 m!970455))

(check-sat (not b!1050222) (not b!1050223) (not start!92380) (not b!1050220) (not b!1050226) (not b!1050225) (not b!1050218))
(check-sat)
