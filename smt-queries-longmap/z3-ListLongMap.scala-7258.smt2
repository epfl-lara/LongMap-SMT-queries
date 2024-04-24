; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92874 () Bool)

(assert start!92874)

(declare-fun res!702727 () Bool)

(declare-fun e!598904 () Bool)

(assert (=> start!92874 (=> (not res!702727) (not e!598904))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66463 0))(
  ( (array!66464 (arr!31963 (Array (_ BitVec 32) (_ BitVec 64))) (size!32500 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66463)

(assert (=> start!92874 (= res!702727 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32500 a!3488)) (bvslt (size!32500 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92874 e!598904))

(assert (=> start!92874 true))

(declare-fun array_inv!24745 (array!66463) Bool)

(assert (=> start!92874 (array_inv!24745 a!3488)))

(declare-fun b!1054439 () Bool)

(declare-fun e!598906 () Bool)

(assert (=> b!1054439 (= e!598906 false)))

(declare-fun lt!465583 () (_ BitVec 32))

(declare-fun lt!465584 () array!66463)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66463 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054439 (= lt!465583 (arrayScanForKey!0 lt!465584 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054440 () Bool)

(declare-fun res!702725 () Bool)

(assert (=> b!1054440 (=> (not res!702725) (not e!598904))))

(declare-datatypes ((List!22245 0))(
  ( (Nil!22242) (Cons!22241 (h!23459 (_ BitVec 64)) (t!31544 List!22245)) )
))
(declare-fun arrayNoDuplicates!0 (array!66463 (_ BitVec 32) List!22245) Bool)

(assert (=> b!1054440 (= res!702725 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22242))))

(declare-fun b!1054441 () Bool)

(declare-fun res!702728 () Bool)

(assert (=> b!1054441 (=> (not res!702728) (not e!598904))))

(assert (=> b!1054441 (= res!702728 (= (select (arr!31963 a!3488) i!1381) k0!2747))))

(declare-fun b!1054442 () Bool)

(declare-fun res!702724 () Bool)

(assert (=> b!1054442 (=> (not res!702724) (not e!598904))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054442 (= res!702724 (validKeyInArray!0 k0!2747))))

(declare-fun b!1054443 () Bool)

(assert (=> b!1054443 (= e!598904 e!598906)))

(declare-fun res!702726 () Bool)

(assert (=> b!1054443 (=> (not res!702726) (not e!598906))))

(declare-fun arrayContainsKey!0 (array!66463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054443 (= res!702726 (arrayContainsKey!0 lt!465584 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1054443 (= lt!465584 (array!66464 (store (arr!31963 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32500 a!3488)))))

(assert (= (and start!92874 res!702727) b!1054440))

(assert (= (and b!1054440 res!702725) b!1054442))

(assert (= (and b!1054442 res!702724) b!1054441))

(assert (= (and b!1054441 res!702728) b!1054443))

(assert (= (and b!1054443 res!702726) b!1054439))

(declare-fun m!975155 () Bool)

(assert (=> b!1054439 m!975155))

(declare-fun m!975157 () Bool)

(assert (=> b!1054443 m!975157))

(declare-fun m!975159 () Bool)

(assert (=> b!1054443 m!975159))

(declare-fun m!975161 () Bool)

(assert (=> b!1054441 m!975161))

(declare-fun m!975163 () Bool)

(assert (=> b!1054440 m!975163))

(declare-fun m!975165 () Bool)

(assert (=> b!1054442 m!975165))

(declare-fun m!975167 () Bool)

(assert (=> start!92874 m!975167))

(check-sat (not b!1054440) (not b!1054443) (not b!1054442) (not b!1054439) (not start!92874))
(check-sat)
