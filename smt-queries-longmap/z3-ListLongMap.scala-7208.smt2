; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92544 () Bool)

(assert start!92544)

(declare-fun b!1050469 () Bool)

(declare-fun e!596051 () Bool)

(declare-fun e!596053 () Bool)

(assert (=> b!1050469 (= e!596051 (not e!596053))))

(declare-fun res!698798 () Bool)

(assert (=> b!1050469 (=> res!698798 e!596053)))

(declare-fun lt!463922 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050469 (= res!698798 (bvsle lt!463922 i!1381))))

(declare-fun e!596052 () Bool)

(assert (=> b!1050469 e!596052))

(declare-fun res!698792 () Bool)

(assert (=> b!1050469 (=> (not res!698792) (not e!596052))))

(declare-datatypes ((array!66160 0))(
  ( (array!66161 (arr!31813 (Array (_ BitVec 32) (_ BitVec 64))) (size!32350 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66160)

(declare-fun k0!2747 () (_ BitVec 64))

(assert (=> b!1050469 (= res!698792 (= (select (store (arr!31813 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463922) k0!2747))))

(declare-fun e!596054 () Bool)

(declare-fun b!1050470 () Bool)

(declare-fun arrayContainsKey!0 (array!66160 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050470 (= e!596054 (arrayContainsKey!0 a!3488 k0!2747 lt!463922))))

(declare-fun res!698790 () Bool)

(declare-fun e!596050 () Bool)

(assert (=> start!92544 (=> (not res!698790) (not e!596050))))

(assert (=> start!92544 (= res!698790 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32350 a!3488)) (bvslt (size!32350 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92544 e!596050))

(assert (=> start!92544 true))

(declare-fun array_inv!24595 (array!66160) Bool)

(assert (=> start!92544 (array_inv!24595 a!3488)))

(declare-fun b!1050471 () Bool)

(declare-fun e!596056 () Bool)

(assert (=> b!1050471 (= e!596056 e!596051)))

(declare-fun res!698796 () Bool)

(assert (=> b!1050471 (=> (not res!698796) (not e!596051))))

(assert (=> b!1050471 (= res!698796 (not (= lt!463922 i!1381)))))

(declare-fun lt!463921 () array!66160)

(declare-fun arrayScanForKey!0 (array!66160 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050471 (= lt!463922 (arrayScanForKey!0 lt!463921 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050472 () Bool)

(declare-fun res!698791 () Bool)

(assert (=> b!1050472 (=> (not res!698791) (not e!596050))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050472 (= res!698791 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050473 () Bool)

(assert (=> b!1050473 (= e!596052 e!596054)))

(declare-fun res!698794 () Bool)

(assert (=> b!1050473 (=> res!698794 e!596054)))

(assert (=> b!1050473 (= res!698794 (bvsle lt!463922 i!1381))))

(declare-fun b!1050474 () Bool)

(declare-fun res!698795 () Bool)

(assert (=> b!1050474 (=> (not res!698795) (not e!596050))))

(assert (=> b!1050474 (= res!698795 (= (select (arr!31813 a!3488) i!1381) k0!2747))))

(declare-fun b!1050475 () Bool)

(declare-fun res!698793 () Bool)

(assert (=> b!1050475 (=> (not res!698793) (not e!596050))))

(declare-datatypes ((List!22095 0))(
  ( (Nil!22092) (Cons!22091 (h!23309 (_ BitVec 64)) (t!31394 List!22095)) )
))
(declare-fun arrayNoDuplicates!0 (array!66160 (_ BitVec 32) List!22095) Bool)

(assert (=> b!1050475 (= res!698793 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22092))))

(declare-fun b!1050476 () Bool)

(assert (=> b!1050476 (= e!596053 true)))

(assert (=> b!1050476 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22092)))

(declare-datatypes ((Unit!34315 0))(
  ( (Unit!34316) )
))
(declare-fun lt!463920 () Unit!34315)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66160 (_ BitVec 32) (_ BitVec 32)) Unit!34315)

(assert (=> b!1050476 (= lt!463920 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1050477 () Bool)

(assert (=> b!1050477 (= e!596050 e!596056)))

(declare-fun res!698797 () Bool)

(assert (=> b!1050477 (=> (not res!698797) (not e!596056))))

(assert (=> b!1050477 (= res!698797 (arrayContainsKey!0 lt!463921 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050477 (= lt!463921 (array!66161 (store (arr!31813 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32350 a!3488)))))

(assert (= (and start!92544 res!698790) b!1050475))

(assert (= (and b!1050475 res!698793) b!1050472))

(assert (= (and b!1050472 res!698791) b!1050474))

(assert (= (and b!1050474 res!698795) b!1050477))

(assert (= (and b!1050477 res!698797) b!1050471))

(assert (= (and b!1050471 res!698796) b!1050469))

(assert (= (and b!1050469 res!698792) b!1050473))

(assert (= (and b!1050473 (not res!698794)) b!1050470))

(assert (= (and b!1050469 (not res!698798)) b!1050476))

(declare-fun m!971633 () Bool)

(assert (=> b!1050477 m!971633))

(declare-fun m!971635 () Bool)

(assert (=> b!1050477 m!971635))

(declare-fun m!971637 () Bool)

(assert (=> b!1050476 m!971637))

(declare-fun m!971639 () Bool)

(assert (=> b!1050476 m!971639))

(declare-fun m!971641 () Bool)

(assert (=> b!1050471 m!971641))

(assert (=> b!1050469 m!971635))

(declare-fun m!971643 () Bool)

(assert (=> b!1050469 m!971643))

(declare-fun m!971645 () Bool)

(assert (=> b!1050470 m!971645))

(declare-fun m!971647 () Bool)

(assert (=> b!1050472 m!971647))

(declare-fun m!971649 () Bool)

(assert (=> start!92544 m!971649))

(declare-fun m!971651 () Bool)

(assert (=> b!1050474 m!971651))

(declare-fun m!971653 () Bool)

(assert (=> b!1050475 m!971653))

(check-sat (not b!1050471) (not start!92544) (not b!1050472) (not b!1050477) (not b!1050475) (not b!1050470) (not b!1050476))
(check-sat)
