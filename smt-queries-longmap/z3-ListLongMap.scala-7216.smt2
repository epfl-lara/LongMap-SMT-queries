; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92592 () Bool)

(assert start!92592)

(declare-fun b!1051285 () Bool)

(declare-fun res!699608 () Bool)

(declare-fun e!596611 () Bool)

(assert (=> b!1051285 (=> (not res!699608) (not e!596611))))

(declare-datatypes ((array!66208 0))(
  ( (array!66209 (arr!31837 (Array (_ BitVec 32) (_ BitVec 64))) (size!32374 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66208)

(declare-datatypes ((List!22119 0))(
  ( (Nil!22116) (Cons!22115 (h!23333 (_ BitVec 64)) (t!31418 List!22119)) )
))
(declare-fun arrayNoDuplicates!0 (array!66208 (_ BitVec 32) List!22119) Bool)

(assert (=> b!1051285 (= res!699608 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22116))))

(declare-fun res!699616 () Bool)

(assert (=> start!92592 (=> (not res!699616) (not e!596611))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> start!92592 (= res!699616 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32374 a!3488)) (bvslt (size!32374 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92592 e!596611))

(assert (=> start!92592 true))

(declare-fun array_inv!24619 (array!66208) Bool)

(assert (=> start!92592 (array_inv!24619 a!3488)))

(declare-fun b!1051286 () Bool)

(declare-fun e!596616 () Bool)

(declare-fun e!596617 () Bool)

(assert (=> b!1051286 (= e!596616 e!596617)))

(declare-fun res!699610 () Bool)

(assert (=> b!1051286 (=> (not res!699610) (not e!596617))))

(declare-fun lt!464252 () (_ BitVec 32))

(assert (=> b!1051286 (= res!699610 (not (= lt!464252 i!1381)))))

(declare-fun lt!464251 () array!66208)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66208 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1051286 (= lt!464252 (arrayScanForKey!0 lt!464251 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1051287 () Bool)

(declare-fun res!699607 () Bool)

(assert (=> b!1051287 (=> (not res!699607) (not e!596611))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1051287 (= res!699607 (validKeyInArray!0 k0!2747))))

(declare-fun b!1051288 () Bool)

(declare-fun e!596610 () Bool)

(assert (=> b!1051288 (= e!596610 true)))

(declare-fun lt!464248 () Bool)

(declare-fun contains!6149 (List!22119 (_ BitVec 64)) Bool)

(assert (=> b!1051288 (= lt!464248 (contains!6149 Nil!22116 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1051289 () Bool)

(assert (=> b!1051289 (= e!596611 e!596616)))

(declare-fun res!699611 () Bool)

(assert (=> b!1051289 (=> (not res!699611) (not e!596616))))

(declare-fun arrayContainsKey!0 (array!66208 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1051289 (= res!699611 (arrayContainsKey!0 lt!464251 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1051289 (= lt!464251 (array!66209 (store (arr!31837 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32374 a!3488)))))

(declare-fun b!1051290 () Bool)

(declare-fun res!699614 () Bool)

(assert (=> b!1051290 (=> res!699614 e!596610)))

(declare-fun noDuplicate!1525 (List!22119) Bool)

(assert (=> b!1051290 (= res!699614 (not (noDuplicate!1525 Nil!22116)))))

(declare-fun b!1051291 () Bool)

(declare-fun e!596612 () Bool)

(assert (=> b!1051291 (= e!596612 e!596610)))

(declare-fun res!699612 () Bool)

(assert (=> b!1051291 (=> res!699612 e!596610)))

(assert (=> b!1051291 (= res!699612 (bvsge (bvadd #b00000000000000000000000000000001 i!1381) (size!32374 a!3488)))))

(assert (=> b!1051291 (arrayContainsKey!0 a!3488 k0!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34363 0))(
  ( (Unit!34364) )
))
(declare-fun lt!464250 () Unit!34363)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66208 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34363)

(assert (=> b!1051291 (= lt!464250 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k0!2747 lt!464252 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1051291 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22116)))

(declare-fun lt!464249 () Unit!34363)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66208 (_ BitVec 32) (_ BitVec 32)) Unit!34363)

(assert (=> b!1051291 (= lt!464249 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1051292 () Bool)

(assert (=> b!1051292 (= e!596617 (not e!596612))))

(declare-fun res!699617 () Bool)

(assert (=> b!1051292 (=> res!699617 e!596612)))

(assert (=> b!1051292 (= res!699617 (bvsle lt!464252 i!1381))))

(declare-fun e!596614 () Bool)

(assert (=> b!1051292 e!596614))

(declare-fun res!699615 () Bool)

(assert (=> b!1051292 (=> (not res!699615) (not e!596614))))

(assert (=> b!1051292 (= res!699615 (= (select (store (arr!31837 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464252) k0!2747))))

(declare-fun b!1051293 () Bool)

(declare-fun res!699606 () Bool)

(assert (=> b!1051293 (=> (not res!699606) (not e!596611))))

(assert (=> b!1051293 (= res!699606 (= (select (arr!31837 a!3488) i!1381) k0!2747))))

(declare-fun e!596615 () Bool)

(declare-fun b!1051294 () Bool)

(assert (=> b!1051294 (= e!596615 (arrayContainsKey!0 a!3488 k0!2747 lt!464252))))

(declare-fun b!1051295 () Bool)

(assert (=> b!1051295 (= e!596614 e!596615)))

(declare-fun res!699609 () Bool)

(assert (=> b!1051295 (=> res!699609 e!596615)))

(assert (=> b!1051295 (= res!699609 (bvsle lt!464252 i!1381))))

(declare-fun b!1051296 () Bool)

(declare-fun res!699613 () Bool)

(assert (=> b!1051296 (=> res!699613 e!596610)))

(assert (=> b!1051296 (= res!699613 (contains!6149 Nil!22116 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!92592 res!699616) b!1051285))

(assert (= (and b!1051285 res!699608) b!1051287))

(assert (= (and b!1051287 res!699607) b!1051293))

(assert (= (and b!1051293 res!699606) b!1051289))

(assert (= (and b!1051289 res!699611) b!1051286))

(assert (= (and b!1051286 res!699610) b!1051292))

(assert (= (and b!1051292 res!699615) b!1051295))

(assert (= (and b!1051295 (not res!699609)) b!1051294))

(assert (= (and b!1051292 (not res!699617)) b!1051291))

(assert (= (and b!1051291 (not res!699612)) b!1051290))

(assert (= (and b!1051290 (not res!699614)) b!1051296))

(assert (= (and b!1051296 (not res!699613)) b!1051288))

(declare-fun m!972341 () Bool)

(assert (=> b!1051290 m!972341))

(declare-fun m!972343 () Bool)

(assert (=> b!1051289 m!972343))

(declare-fun m!972345 () Bool)

(assert (=> b!1051289 m!972345))

(assert (=> b!1051292 m!972345))

(declare-fun m!972347 () Bool)

(assert (=> b!1051292 m!972347))

(declare-fun m!972349 () Bool)

(assert (=> b!1051285 m!972349))

(declare-fun m!972351 () Bool)

(assert (=> b!1051288 m!972351))

(declare-fun m!972353 () Bool)

(assert (=> b!1051287 m!972353))

(declare-fun m!972355 () Bool)

(assert (=> b!1051296 m!972355))

(declare-fun m!972357 () Bool)

(assert (=> b!1051294 m!972357))

(declare-fun m!972359 () Bool)

(assert (=> start!92592 m!972359))

(declare-fun m!972361 () Bool)

(assert (=> b!1051291 m!972361))

(declare-fun m!972363 () Bool)

(assert (=> b!1051291 m!972363))

(declare-fun m!972365 () Bool)

(assert (=> b!1051291 m!972365))

(declare-fun m!972367 () Bool)

(assert (=> b!1051291 m!972367))

(declare-fun m!972369 () Bool)

(assert (=> b!1051293 m!972369))

(declare-fun m!972371 () Bool)

(assert (=> b!1051286 m!972371))

(check-sat (not b!1051288) (not b!1051294) (not b!1051286) (not b!1051291) (not b!1051287) (not b!1051289) (not b!1051296) (not b!1051290) (not start!92592) (not b!1051285))
(check-sat)
