; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92398 () Bool)

(assert start!92398)

(declare-fun b!1050428 () Bool)

(declare-fun e!596111 () Bool)

(declare-fun e!596109 () Bool)

(assert (=> b!1050428 (= e!596111 e!596109)))

(declare-fun res!699643 () Bool)

(assert (=> b!1050428 (=> (not res!699643) (not e!596109))))

(declare-fun lt!463816 () (_ BitVec 32))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1050428 (= res!699643 (not (= lt!463816 i!1381)))))

(declare-datatypes ((array!66140 0))(
  ( (array!66141 (arr!31809 (Array (_ BitVec 32) (_ BitVec 64))) (size!32347 (_ BitVec 32))) )
))
(declare-fun lt!463815 () array!66140)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!66140 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1050428 (= lt!463816 (arrayScanForKey!0 lt!463815 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1050429 () Bool)

(assert (=> b!1050429 (= e!596109 (not true))))

(declare-fun a!3488 () array!66140)

(assert (=> b!1050429 (= (select (store (arr!31809 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463816) k0!2747)))

(declare-fun b!1050430 () Bool)

(declare-fun res!699638 () Bool)

(declare-fun e!596110 () Bool)

(assert (=> b!1050430 (=> (not res!699638) (not e!596110))))

(assert (=> b!1050430 (= res!699638 (= (select (arr!31809 a!3488) i!1381) k0!2747))))

(declare-fun b!1050431 () Bool)

(declare-fun res!699639 () Bool)

(assert (=> b!1050431 (=> (not res!699639) (not e!596110))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1050431 (= res!699639 (validKeyInArray!0 k0!2747))))

(declare-fun b!1050432 () Bool)

(declare-fun res!699642 () Bool)

(assert (=> b!1050432 (=> (not res!699642) (not e!596110))))

(declare-datatypes ((List!22180 0))(
  ( (Nil!22177) (Cons!22176 (h!23385 (_ BitVec 64)) (t!31478 List!22180)) )
))
(declare-fun arrayNoDuplicates!0 (array!66140 (_ BitVec 32) List!22180) Bool)

(assert (=> b!1050432 (= res!699642 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22177))))

(declare-fun res!699641 () Bool)

(assert (=> start!92398 (=> (not res!699641) (not e!596110))))

(assert (=> start!92398 (= res!699641 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32347 a!3488)) (bvslt (size!32347 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92398 e!596110))

(assert (=> start!92398 true))

(declare-fun array_inv!24592 (array!66140) Bool)

(assert (=> start!92398 (array_inv!24592 a!3488)))

(declare-fun b!1050433 () Bool)

(assert (=> b!1050433 (= e!596110 e!596111)))

(declare-fun res!699640 () Bool)

(assert (=> b!1050433 (=> (not res!699640) (not e!596111))))

(declare-fun arrayContainsKey!0 (array!66140 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1050433 (= res!699640 (arrayContainsKey!0 lt!463815 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1050433 (= lt!463815 (array!66141 (store (arr!31809 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32347 a!3488)))))

(assert (= (and start!92398 res!699641) b!1050432))

(assert (= (and b!1050432 res!699642) b!1050431))

(assert (= (and b!1050431 res!699639) b!1050430))

(assert (= (and b!1050430 res!699638) b!1050433))

(assert (= (and b!1050433 res!699640) b!1050428))

(assert (= (and b!1050428 res!699643) b!1050429))

(declare-fun m!970645 () Bool)

(assert (=> b!1050429 m!970645))

(declare-fun m!970647 () Bool)

(assert (=> b!1050429 m!970647))

(declare-fun m!970649 () Bool)

(assert (=> b!1050431 m!970649))

(declare-fun m!970651 () Bool)

(assert (=> b!1050430 m!970651))

(declare-fun m!970653 () Bool)

(assert (=> b!1050428 m!970653))

(declare-fun m!970655 () Bool)

(assert (=> start!92398 m!970655))

(declare-fun m!970657 () Bool)

(assert (=> b!1050433 m!970657))

(assert (=> b!1050433 m!970645))

(declare-fun m!970659 () Bool)

(assert (=> b!1050432 m!970659))

(check-sat (not b!1050428) (not start!92398) (not b!1050433) (not b!1050432) (not b!1050431))
(check-sat)
