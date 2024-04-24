; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92784 () Bool)

(assert start!92784)

(declare-fun b!1054063 () Bool)

(declare-fun e!598602 () Bool)

(declare-fun e!598601 () Bool)

(assert (=> b!1054063 (= e!598602 e!598601)))

(declare-fun res!702385 () Bool)

(assert (=> b!1054063 (=> (not res!702385) (not e!598601))))

(declare-datatypes ((array!66400 0))(
  ( (array!66401 (arr!31933 (Array (_ BitVec 32) (_ BitVec 64))) (size!32470 (_ BitVec 32))) )
))
(declare-fun lt!465467 () array!66400)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66400 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054063 (= res!702385 (arrayContainsKey!0 lt!465467 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66400)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054063 (= lt!465467 (array!66401 (store (arr!31933 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32470 a!3488)))))

(declare-fun b!1054064 () Bool)

(declare-fun e!598603 () Bool)

(assert (=> b!1054064 (= e!598603 (not true))))

(declare-fun lt!465466 () (_ BitVec 32))

(assert (=> b!1054064 (= (select (store (arr!31933 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465466) k0!2747)))

(declare-fun b!1054065 () Bool)

(declare-fun res!702388 () Bool)

(assert (=> b!1054065 (=> (not res!702388) (not e!598602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054065 (= res!702388 (validKeyInArray!0 k0!2747))))

(declare-fun b!1054066 () Bool)

(assert (=> b!1054066 (= e!598601 e!598603)))

(declare-fun res!702386 () Bool)

(assert (=> b!1054066 (=> (not res!702386) (not e!598603))))

(assert (=> b!1054066 (= res!702386 (not (= lt!465466 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66400 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054066 (= lt!465466 (arrayScanForKey!0 lt!465467 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1054067 () Bool)

(declare-fun res!702387 () Bool)

(assert (=> b!1054067 (=> (not res!702387) (not e!598602))))

(assert (=> b!1054067 (= res!702387 (= (select (arr!31933 a!3488) i!1381) k0!2747))))

(declare-fun b!1054068 () Bool)

(declare-fun res!702384 () Bool)

(assert (=> b!1054068 (=> (not res!702384) (not e!598602))))

(declare-datatypes ((List!22215 0))(
  ( (Nil!22212) (Cons!22211 (h!23429 (_ BitVec 64)) (t!31514 List!22215)) )
))
(declare-fun arrayNoDuplicates!0 (array!66400 (_ BitVec 32) List!22215) Bool)

(assert (=> b!1054068 (= res!702384 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22212))))

(declare-fun res!702389 () Bool)

(assert (=> start!92784 (=> (not res!702389) (not e!598602))))

(assert (=> start!92784 (= res!702389 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32470 a!3488)) (bvslt (size!32470 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92784 e!598602))

(assert (=> start!92784 true))

(declare-fun array_inv!24715 (array!66400) Bool)

(assert (=> start!92784 (array_inv!24715 a!3488)))

(assert (= (and start!92784 res!702389) b!1054068))

(assert (= (and b!1054068 res!702384) b!1054065))

(assert (= (and b!1054065 res!702388) b!1054067))

(assert (= (and b!1054067 res!702387) b!1054063))

(assert (= (and b!1054063 res!702385) b!1054066))

(assert (= (and b!1054066 res!702386) b!1054064))

(declare-fun m!974825 () Bool)

(assert (=> b!1054065 m!974825))

(declare-fun m!974827 () Bool)

(assert (=> b!1054063 m!974827))

(declare-fun m!974829 () Bool)

(assert (=> b!1054063 m!974829))

(declare-fun m!974831 () Bool)

(assert (=> start!92784 m!974831))

(declare-fun m!974833 () Bool)

(assert (=> b!1054068 m!974833))

(declare-fun m!974835 () Bool)

(assert (=> b!1054066 m!974835))

(declare-fun m!974837 () Bool)

(assert (=> b!1054067 m!974837))

(assert (=> b!1054064 m!974829))

(declare-fun m!974839 () Bool)

(assert (=> b!1054064 m!974839))

(check-sat (not b!1054063) (not start!92784) (not b!1054065) (not b!1054066) (not b!1054068))
(check-sat)
