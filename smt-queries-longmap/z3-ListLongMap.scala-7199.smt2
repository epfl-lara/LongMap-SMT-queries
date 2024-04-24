; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92490 () Bool)

(assert start!92490)

(declare-fun b!1049783 () Bool)

(declare-fun e!595527 () Bool)

(assert (=> b!1049783 (= e!595527 (not true))))

(declare-fun e!595528 () Bool)

(assert (=> b!1049783 e!595528))

(declare-fun res!698108 () Bool)

(assert (=> b!1049783 (=> (not res!698108) (not e!595528))))

(declare-fun lt!463720 () (_ BitVec 32))

(declare-datatypes ((array!66106 0))(
  ( (array!66107 (arr!31786 (Array (_ BitVec 32) (_ BitVec 64))) (size!32323 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66106)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1049783 (= res!698108 (= (select (store (arr!31786 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463720) k0!2747))))

(declare-fun b!1049784 () Bool)

(declare-fun res!698109 () Bool)

(declare-fun e!595529 () Bool)

(assert (=> b!1049784 (=> (not res!698109) (not e!595529))))

(declare-datatypes ((List!22068 0))(
  ( (Nil!22065) (Cons!22064 (h!23282 (_ BitVec 64)) (t!31367 List!22068)) )
))
(declare-fun arrayNoDuplicates!0 (array!66106 (_ BitVec 32) List!22068) Bool)

(assert (=> b!1049784 (= res!698109 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22065))))

(declare-fun e!595530 () Bool)

(declare-fun b!1049785 () Bool)

(declare-fun arrayContainsKey!0 (array!66106 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1049785 (= e!595530 (arrayContainsKey!0 a!3488 k0!2747 lt!463720))))

(declare-fun b!1049786 () Bool)

(declare-fun res!698107 () Bool)

(assert (=> b!1049786 (=> (not res!698107) (not e!595529))))

(assert (=> b!1049786 (= res!698107 (= (select (arr!31786 a!3488) i!1381) k0!2747))))

(declare-fun b!1049787 () Bool)

(declare-fun res!698104 () Bool)

(assert (=> b!1049787 (=> (not res!698104) (not e!595529))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1049787 (= res!698104 (validKeyInArray!0 k0!2747))))

(declare-fun b!1049789 () Bool)

(declare-fun e!595531 () Bool)

(assert (=> b!1049789 (= e!595529 e!595531)))

(declare-fun res!698105 () Bool)

(assert (=> b!1049789 (=> (not res!698105) (not e!595531))))

(declare-fun lt!463721 () array!66106)

(assert (=> b!1049789 (= res!698105 (arrayContainsKey!0 lt!463721 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1049789 (= lt!463721 (array!66107 (store (arr!31786 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32323 a!3488)))))

(declare-fun b!1049790 () Bool)

(assert (=> b!1049790 (= e!595531 e!595527)))

(declare-fun res!698106 () Bool)

(assert (=> b!1049790 (=> (not res!698106) (not e!595527))))

(assert (=> b!1049790 (= res!698106 (not (= lt!463720 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66106 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1049790 (= lt!463720 (arrayScanForKey!0 lt!463721 k0!2747 #b00000000000000000000000000000000))))

(declare-fun res!698111 () Bool)

(assert (=> start!92490 (=> (not res!698111) (not e!595529))))

(assert (=> start!92490 (= res!698111 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32323 a!3488)) (bvslt (size!32323 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92490 e!595529))

(assert (=> start!92490 true))

(declare-fun array_inv!24568 (array!66106) Bool)

(assert (=> start!92490 (array_inv!24568 a!3488)))

(declare-fun b!1049788 () Bool)

(assert (=> b!1049788 (= e!595528 e!595530)))

(declare-fun res!698110 () Bool)

(assert (=> b!1049788 (=> res!698110 e!595530)))

(assert (=> b!1049788 (= res!698110 (bvsle lt!463720 i!1381))))

(assert (= (and start!92490 res!698111) b!1049784))

(assert (= (and b!1049784 res!698109) b!1049787))

(assert (= (and b!1049787 res!698104) b!1049786))

(assert (= (and b!1049786 res!698107) b!1049789))

(assert (= (and b!1049789 res!698105) b!1049790))

(assert (= (and b!1049790 res!698106) b!1049783))

(assert (= (and b!1049783 res!698108) b!1049788))

(assert (= (and b!1049788 (not res!698110)) b!1049785))

(declare-fun m!971099 () Bool)

(assert (=> b!1049790 m!971099))

(declare-fun m!971101 () Bool)

(assert (=> b!1049784 m!971101))

(declare-fun m!971103 () Bool)

(assert (=> b!1049783 m!971103))

(declare-fun m!971105 () Bool)

(assert (=> b!1049783 m!971105))

(declare-fun m!971107 () Bool)

(assert (=> b!1049785 m!971107))

(declare-fun m!971109 () Bool)

(assert (=> b!1049786 m!971109))

(declare-fun m!971111 () Bool)

(assert (=> start!92490 m!971111))

(declare-fun m!971113 () Bool)

(assert (=> b!1049789 m!971113))

(assert (=> b!1049789 m!971103))

(declare-fun m!971115 () Bool)

(assert (=> b!1049787 m!971115))

(check-sat (not b!1049784) (not b!1049790) (not b!1049787) (not b!1049785) (not b!1049789) (not start!92490))
(check-sat)
