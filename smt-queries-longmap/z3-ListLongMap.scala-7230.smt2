; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92676 () Bool)

(assert start!92676)

(declare-fun b!1052368 () Bool)

(declare-fun res!700692 () Bool)

(declare-fun e!597396 () Bool)

(assert (=> b!1052368 (=> (not res!700692) (not e!597396))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052368 (= res!700692 (validKeyInArray!0 k0!2747))))

(declare-fun b!1052369 () Bool)

(declare-fun e!597391 () Bool)

(assert (=> b!1052369 (= e!597391 true)))

(declare-datatypes ((array!66292 0))(
  ( (array!66293 (arr!31879 (Array (_ BitVec 32) (_ BitVec 64))) (size!32416 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66292)

(declare-fun lt!464658 () (_ BitVec 32))

(declare-datatypes ((List!22161 0))(
  ( (Nil!22158) (Cons!22157 (h!23375 (_ BitVec 64)) (t!31460 List!22161)) )
))
(declare-fun arrayNoDuplicates!0 (array!66292 (_ BitVec 32) List!22161) Bool)

(assert (=> b!1052369 (arrayNoDuplicates!0 a!3488 lt!464658 Nil!22158)))

(declare-datatypes ((Unit!34399 0))(
  ( (Unit!34400) )
))
(declare-fun lt!464660 () Unit!34399)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66292 (_ BitVec 32) (_ BitVec 32)) Unit!34399)

(assert (=> b!1052369 (= lt!464660 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 lt!464658))))

(declare-fun b!1052370 () Bool)

(declare-fun e!597393 () Bool)

(assert (=> b!1052370 (= e!597393 (not e!597391))))

(declare-fun res!700695 () Bool)

(assert (=> b!1052370 (=> res!700695 e!597391)))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052370 (= res!700695 (or (bvsgt lt!464658 i!1381) (bvsle i!1381 lt!464658)))))

(declare-fun e!597394 () Bool)

(assert (=> b!1052370 e!597394))

(declare-fun res!700690 () Bool)

(assert (=> b!1052370 (=> (not res!700690) (not e!597394))))

(assert (=> b!1052370 (= res!700690 (= (select (store (arr!31879 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464658) k0!2747))))

(declare-fun b!1052371 () Bool)

(declare-fun e!597392 () Bool)

(assert (=> b!1052371 (= e!597394 e!597392)))

(declare-fun res!700696 () Bool)

(assert (=> b!1052371 (=> res!700696 e!597392)))

(assert (=> b!1052371 (= res!700696 (or (bvsgt lt!464658 i!1381) (bvsle i!1381 lt!464658)))))

(declare-fun b!1052373 () Bool)

(declare-fun e!597395 () Bool)

(assert (=> b!1052373 (= e!597396 e!597395)))

(declare-fun res!700693 () Bool)

(assert (=> b!1052373 (=> (not res!700693) (not e!597395))))

(declare-fun lt!464659 () array!66292)

(declare-fun arrayContainsKey!0 (array!66292 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052373 (= res!700693 (arrayContainsKey!0 lt!464659 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052373 (= lt!464659 (array!66293 (store (arr!31879 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32416 a!3488)))))

(declare-fun b!1052374 () Bool)

(assert (=> b!1052374 (= e!597395 e!597393)))

(declare-fun res!700694 () Bool)

(assert (=> b!1052374 (=> (not res!700694) (not e!597393))))

(assert (=> b!1052374 (= res!700694 (not (= lt!464658 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66292 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052374 (= lt!464658 (arrayScanForKey!0 lt!464659 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1052375 () Bool)

(assert (=> b!1052375 (= e!597392 (arrayContainsKey!0 a!3488 k0!2747 i!1381))))

(declare-fun b!1052376 () Bool)

(declare-fun res!700691 () Bool)

(assert (=> b!1052376 (=> (not res!700691) (not e!597396))))

(assert (=> b!1052376 (= res!700691 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22158))))

(declare-fun res!700697 () Bool)

(assert (=> start!92676 (=> (not res!700697) (not e!597396))))

(assert (=> start!92676 (= res!700697 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32416 a!3488)) (bvslt (size!32416 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92676 e!597396))

(assert (=> start!92676 true))

(declare-fun array_inv!24661 (array!66292) Bool)

(assert (=> start!92676 (array_inv!24661 a!3488)))

(declare-fun b!1052372 () Bool)

(declare-fun res!700689 () Bool)

(assert (=> b!1052372 (=> (not res!700689) (not e!597396))))

(assert (=> b!1052372 (= res!700689 (= (select (arr!31879 a!3488) i!1381) k0!2747))))

(assert (= (and start!92676 res!700697) b!1052376))

(assert (= (and b!1052376 res!700691) b!1052368))

(assert (= (and b!1052368 res!700692) b!1052372))

(assert (= (and b!1052372 res!700689) b!1052373))

(assert (= (and b!1052373 res!700693) b!1052374))

(assert (= (and b!1052374 res!700694) b!1052370))

(assert (= (and b!1052370 res!700690) b!1052371))

(assert (= (and b!1052371 (not res!700696)) b!1052375))

(assert (= (and b!1052370 (not res!700695)) b!1052369))

(declare-fun m!973295 () Bool)

(assert (=> b!1052373 m!973295))

(declare-fun m!973297 () Bool)

(assert (=> b!1052373 m!973297))

(declare-fun m!973299 () Bool)

(assert (=> b!1052375 m!973299))

(assert (=> b!1052370 m!973297))

(declare-fun m!973301 () Bool)

(assert (=> b!1052370 m!973301))

(declare-fun m!973303 () Bool)

(assert (=> b!1052369 m!973303))

(declare-fun m!973305 () Bool)

(assert (=> b!1052369 m!973305))

(declare-fun m!973307 () Bool)

(assert (=> b!1052372 m!973307))

(declare-fun m!973309 () Bool)

(assert (=> start!92676 m!973309))

(declare-fun m!973311 () Bool)

(assert (=> b!1052368 m!973311))

(declare-fun m!973313 () Bool)

(assert (=> b!1052374 m!973313))

(declare-fun m!973315 () Bool)

(assert (=> b!1052376 m!973315))

(check-sat (not b!1052374) (not b!1052375) (not b!1052368) (not b!1052369) (not b!1052373) (not b!1052376) (not start!92676))
(check-sat)
