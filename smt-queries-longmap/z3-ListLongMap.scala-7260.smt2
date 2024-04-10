; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92684 () Bool)

(assert start!92684)

(declare-fun b!1053310 () Bool)

(declare-fun res!702366 () Bool)

(declare-fun e!598188 () Bool)

(assert (=> b!1053310 (=> (not res!702366) (not e!598188))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053310 (= res!702366 (validKeyInArray!0 k0!2747))))

(declare-fun res!702368 () Bool)

(assert (=> start!92684 (=> (not res!702368) (not e!598188))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66431 0))(
  ( (array!66432 (arr!31952 (Array (_ BitVec 32) (_ BitVec 64))) (size!32488 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66431)

(assert (=> start!92684 (= res!702368 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32488 a!3488)) (bvslt (size!32488 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92684 e!598188))

(assert (=> start!92684 true))

(declare-fun array_inv!24732 (array!66431) Bool)

(assert (=> start!92684 (array_inv!24732 a!3488)))

(declare-fun b!1053311 () Bool)

(declare-fun res!702367 () Bool)

(assert (=> b!1053311 (=> (not res!702367) (not e!598188))))

(declare-datatypes ((List!22264 0))(
  ( (Nil!22261) (Cons!22260 (h!23469 (_ BitVec 64)) (t!31571 List!22264)) )
))
(declare-fun arrayNoDuplicates!0 (array!66431 (_ BitVec 32) List!22264) Bool)

(assert (=> b!1053311 (= res!702367 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22261))))

(declare-fun b!1053312 () Bool)

(declare-fun e!598189 () Bool)

(declare-fun lt!465120 () (_ BitVec 32))

(assert (=> b!1053312 (= e!598189 (and (not (= lt!465120 i!1381)) (not (= (select (store (arr!31952 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465120) k0!2747))))))

(declare-fun lt!465119 () array!66431)

(declare-fun arrayScanForKey!0 (array!66431 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053312 (= lt!465120 (arrayScanForKey!0 lt!465119 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1053313 () Bool)

(declare-fun res!702365 () Bool)

(assert (=> b!1053313 (=> (not res!702365) (not e!598188))))

(assert (=> b!1053313 (= res!702365 (= (select (arr!31952 a!3488) i!1381) k0!2747))))

(declare-fun b!1053314 () Bool)

(assert (=> b!1053314 (= e!598188 e!598189)))

(declare-fun res!702364 () Bool)

(assert (=> b!1053314 (=> (not res!702364) (not e!598189))))

(declare-fun arrayContainsKey!0 (array!66431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053314 (= res!702364 (arrayContainsKey!0 lt!465119 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053314 (= lt!465119 (array!66432 (store (arr!31952 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32488 a!3488)))))

(assert (= (and start!92684 res!702368) b!1053311))

(assert (= (and b!1053311 res!702367) b!1053310))

(assert (= (and b!1053310 res!702366) b!1053313))

(assert (= (and b!1053313 res!702365) b!1053314))

(assert (= (and b!1053314 res!702364) b!1053312))

(declare-fun m!973635 () Bool)

(assert (=> start!92684 m!973635))

(declare-fun m!973637 () Bool)

(assert (=> b!1053314 m!973637))

(declare-fun m!973639 () Bool)

(assert (=> b!1053314 m!973639))

(declare-fun m!973641 () Bool)

(assert (=> b!1053313 m!973641))

(assert (=> b!1053312 m!973639))

(declare-fun m!973643 () Bool)

(assert (=> b!1053312 m!973643))

(declare-fun m!973645 () Bool)

(assert (=> b!1053312 m!973645))

(declare-fun m!973647 () Bool)

(assert (=> b!1053311 m!973647))

(declare-fun m!973649 () Bool)

(assert (=> b!1053310 m!973649))

(check-sat (not b!1053312) (not b!1053310) (not b!1053311) (not b!1053314) (not start!92684))
(check-sat)
(get-model)

(declare-fun d!127883 () Bool)

(assert (=> d!127883 (= (validKeyInArray!0 k0!2747) (and (not (= k0!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1053310 d!127883))

(declare-fun b!1053394 () Bool)

(declare-fun e!598251 () Bool)

