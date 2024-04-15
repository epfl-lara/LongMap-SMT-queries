; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92764 () Bool)

(assert start!92764)

(declare-fun b!1053570 () Bool)

(declare-fun e!598408 () Bool)

(declare-fun e!598406 () Bool)

(assert (=> b!1053570 (= e!598408 e!598406)))

(declare-fun res!702639 () Bool)

(assert (=> b!1053570 (=> res!702639 e!598406)))

(declare-fun lt!465004 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1053570 (= res!702639 (bvsle lt!465004 i!1381))))

(declare-fun b!1053571 () Bool)

(declare-fun res!702642 () Bool)

(declare-fun e!598407 () Bool)

(assert (=> b!1053571 (=> (not res!702642) (not e!598407))))

(declare-datatypes ((array!66398 0))(
  ( (array!66399 (arr!31932 (Array (_ BitVec 32) (_ BitVec 64))) (size!32470 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66398)

(declare-datatypes ((List!22303 0))(
  ( (Nil!22300) (Cons!22299 (h!23508 (_ BitVec 64)) (t!31601 List!22303)) )
))
(declare-fun arrayNoDuplicates!0 (array!66398 (_ BitVec 32) List!22303) Bool)

(assert (=> b!1053571 (= res!702642 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22300))))

(declare-fun b!1053572 () Bool)

(declare-fun res!702641 () Bool)

(assert (=> b!1053572 (=> (not res!702641) (not e!598407))))

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1053572 (= res!702641 (validKeyInArray!0 k0!2747))))

(declare-fun b!1053573 () Bool)

(declare-fun e!598410 () Bool)

(declare-fun e!598405 () Bool)

(assert (=> b!1053573 (= e!598410 e!598405)))

(declare-fun res!702643 () Bool)

(assert (=> b!1053573 (=> (not res!702643) (not e!598405))))

(assert (=> b!1053573 (= res!702643 (not (= lt!465004 i!1381)))))

(declare-fun lt!465003 () array!66398)

(declare-fun arrayScanForKey!0 (array!66398 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1053573 (= lt!465004 (arrayScanForKey!0 lt!465003 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!702640 () Bool)

(assert (=> start!92764 (=> (not res!702640) (not e!598407))))

(assert (=> start!92764 (= res!702640 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32470 a!3488)) (bvslt (size!32470 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92764 e!598407))

(assert (=> start!92764 true))

(declare-fun array_inv!24715 (array!66398) Bool)

(assert (=> start!92764 (array_inv!24715 a!3488)))

(declare-fun b!1053574 () Bool)

(declare-fun res!702638 () Bool)

(assert (=> b!1053574 (=> (not res!702638) (not e!598407))))

(assert (=> b!1053574 (= res!702638 (= (select (arr!31932 a!3488) i!1381) k0!2747))))

(declare-fun b!1053575 () Bool)

(assert (=> b!1053575 (= e!598407 e!598410)))

(declare-fun res!702637 () Bool)

(assert (=> b!1053575 (=> (not res!702637) (not e!598410))))

(declare-fun arrayContainsKey!0 (array!66398 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1053575 (= res!702637 (arrayContainsKey!0 lt!465003 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1053575 (= lt!465003 (array!66399 (store (arr!31932 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32470 a!3488)))))

(declare-fun b!1053576 () Bool)

(assert (=> b!1053576 (= e!598405 (not (or (bvsle lt!465004 i!1381) (bvsle #b00000000000000000000000000000000 (size!32470 a!3488)))))))

(assert (=> b!1053576 e!598408))

(declare-fun res!702636 () Bool)

(assert (=> b!1053576 (=> (not res!702636) (not e!598408))))

(assert (=> b!1053576 (= res!702636 (= (select (store (arr!31932 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465004) k0!2747))))

(declare-fun b!1053577 () Bool)

(assert (=> b!1053577 (= e!598406 (arrayContainsKey!0 a!3488 k0!2747 lt!465004))))

(assert (= (and start!92764 res!702640) b!1053571))

(assert (= (and b!1053571 res!702642) b!1053572))

(assert (= (and b!1053572 res!702641) b!1053574))

(assert (= (and b!1053574 res!702638) b!1053575))

(assert (= (and b!1053575 res!702637) b!1053573))

(assert (= (and b!1053573 res!702643) b!1053576))

(assert (= (and b!1053576 res!702636) b!1053570))

(assert (= (and b!1053570 (not res!702639)) b!1053577))

(declare-fun m!973321 () Bool)

(assert (=> b!1053577 m!973321))

(declare-fun m!973323 () Bool)

(assert (=> b!1053574 m!973323))

(declare-fun m!973325 () Bool)

(assert (=> b!1053575 m!973325))

(declare-fun m!973327 () Bool)

(assert (=> b!1053575 m!973327))

(declare-fun m!973329 () Bool)

(assert (=> start!92764 m!973329))

(declare-fun m!973331 () Bool)

(assert (=> b!1053573 m!973331))

(assert (=> b!1053576 m!973327))

(declare-fun m!973333 () Bool)

(assert (=> b!1053576 m!973333))

(declare-fun m!973335 () Bool)

(assert (=> b!1053572 m!973335))

(declare-fun m!973337 () Bool)

(assert (=> b!1053571 m!973337))

(check-sat (not b!1053573) (not b!1053575) (not b!1053572) (not b!1053571) (not start!92764) (not b!1053577))
(check-sat)
