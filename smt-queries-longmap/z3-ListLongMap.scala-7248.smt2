; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92548 () Bool)

(assert start!92548)

(declare-fun b!1052597 () Bool)

(declare-fun res!701810 () Bool)

(declare-fun e!597669 () Bool)

(assert (=> b!1052597 (=> (not res!701810) (not e!597669))))

(declare-datatypes ((array!66290 0))(
  ( (array!66291 (arr!31884 (Array (_ BitVec 32) (_ BitVec 64))) (size!32422 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66290)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1052597 (= res!701810 (= (select (arr!31884 a!3488) i!1381) k0!2747))))

(declare-fun b!1052598 () Bool)

(declare-fun res!701807 () Bool)

(assert (=> b!1052598 (=> (not res!701807) (not e!597669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1052598 (= res!701807 (validKeyInArray!0 k0!2747))))

(declare-fun res!701809 () Bool)

(assert (=> start!92548 (=> (not res!701809) (not e!597669))))

(assert (=> start!92548 (= res!701809 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32422 a!3488)) (bvslt (size!32422 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92548 e!597669))

(assert (=> start!92548 true))

(declare-fun array_inv!24667 (array!66290) Bool)

(assert (=> start!92548 (array_inv!24667 a!3488)))

(declare-fun b!1052599 () Bool)

(declare-fun e!597668 () Bool)

(assert (=> b!1052599 (= e!597668 (not true))))

(declare-fun lt!464752 () (_ BitVec 32))

(assert (=> b!1052599 (= (select (store (arr!31884 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!464752) k0!2747)))

(declare-fun b!1052600 () Bool)

(declare-fun e!597667 () Bool)

(assert (=> b!1052600 (= e!597669 e!597667)))

(declare-fun res!701811 () Bool)

(assert (=> b!1052600 (=> (not res!701811) (not e!597667))))

(declare-fun lt!464751 () array!66290)

(declare-fun arrayContainsKey!0 (array!66290 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1052600 (= res!701811 (arrayContainsKey!0 lt!464751 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1052600 (= lt!464751 (array!66291 (store (arr!31884 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32422 a!3488)))))

(declare-fun b!1052601 () Bool)

(declare-fun res!701812 () Bool)

(assert (=> b!1052601 (=> (not res!701812) (not e!597669))))

(declare-datatypes ((List!22255 0))(
  ( (Nil!22252) (Cons!22251 (h!23460 (_ BitVec 64)) (t!31553 List!22255)) )
))
(declare-fun arrayNoDuplicates!0 (array!66290 (_ BitVec 32) List!22255) Bool)

(assert (=> b!1052601 (= res!701812 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22252))))

(declare-fun b!1052602 () Bool)

(assert (=> b!1052602 (= e!597667 e!597668)))

(declare-fun res!701808 () Bool)

(assert (=> b!1052602 (=> (not res!701808) (not e!597668))))

(assert (=> b!1052602 (= res!701808 (not (= lt!464752 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66290 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1052602 (= lt!464752 (arrayScanForKey!0 lt!464751 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92548 res!701809) b!1052601))

(assert (= (and b!1052601 res!701812) b!1052598))

(assert (= (and b!1052598 res!701807) b!1052597))

(assert (= (and b!1052597 res!701810) b!1052600))

(assert (= (and b!1052600 res!701811) b!1052602))

(assert (= (and b!1052602 res!701808) b!1052599))

(declare-fun m!972541 () Bool)

(assert (=> b!1052598 m!972541))

(declare-fun m!972543 () Bool)

(assert (=> b!1052599 m!972543))

(declare-fun m!972545 () Bool)

(assert (=> b!1052599 m!972545))

(declare-fun m!972547 () Bool)

(assert (=> b!1052601 m!972547))

(declare-fun m!972549 () Bool)

(assert (=> start!92548 m!972549))

(declare-fun m!972551 () Bool)

(assert (=> b!1052602 m!972551))

(declare-fun m!972553 () Bool)

(assert (=> b!1052600 m!972553))

(assert (=> b!1052600 m!972543))

(declare-fun m!972555 () Bool)

(assert (=> b!1052597 m!972555))

(check-sat (not b!1052601) (not b!1052598) (not start!92548) (not b!1052600) (not b!1052602))
(check-sat)
