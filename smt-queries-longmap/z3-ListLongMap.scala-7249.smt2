; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92790 () Bool)

(assert start!92790)

(declare-fun b!1054117 () Bool)

(declare-fun e!598639 () Bool)

(declare-fun e!598636 () Bool)

(assert (=> b!1054117 (= e!598639 e!598636)))

(declare-fun res!702442 () Bool)

(assert (=> b!1054117 (=> (not res!702442) (not e!598636))))

(declare-datatypes ((array!66406 0))(
  ( (array!66407 (arr!31936 (Array (_ BitVec 32) (_ BitVec 64))) (size!32473 (_ BitVec 32))) )
))
(declare-fun lt!465484 () array!66406)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66406 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1054117 (= res!702442 (arrayContainsKey!0 lt!465484 k0!2747 #b00000000000000000000000000000000))))

(declare-fun a!3488 () array!66406)

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> b!1054117 (= lt!465484 (array!66407 (store (arr!31936 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32473 a!3488)))))

(declare-fun e!598638 () Bool)

(declare-fun b!1054118 () Bool)

(declare-fun lt!465485 () (_ BitVec 32))

(assert (=> b!1054118 (= e!598638 (not (or (bvsgt lt!465485 i!1381) (bvsgt i!1381 lt!465485) (bvslt #b00000000000000000000000000000000 (size!32473 a!3488)))))))

(assert (=> b!1054118 (= (select (store (arr!31936 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!465485) k0!2747)))

(declare-fun b!1054119 () Bool)

(declare-fun res!702443 () Bool)

(assert (=> b!1054119 (=> (not res!702443) (not e!598639))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1054119 (= res!702443 (validKeyInArray!0 k0!2747))))

(declare-fun res!702441 () Bool)

(assert (=> start!92790 (=> (not res!702441) (not e!598639))))

(assert (=> start!92790 (= res!702441 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32473 a!3488)) (bvslt (size!32473 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92790 e!598639))

(assert (=> start!92790 true))

(declare-fun array_inv!24718 (array!66406) Bool)

(assert (=> start!92790 (array_inv!24718 a!3488)))

(declare-fun b!1054120 () Bool)

(declare-fun res!702438 () Bool)

(assert (=> b!1054120 (=> (not res!702438) (not e!598639))))

(declare-datatypes ((List!22218 0))(
  ( (Nil!22215) (Cons!22214 (h!23432 (_ BitVec 64)) (t!31517 List!22218)) )
))
(declare-fun arrayNoDuplicates!0 (array!66406 (_ BitVec 32) List!22218) Bool)

(assert (=> b!1054120 (= res!702438 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22215))))

(declare-fun b!1054121 () Bool)

(declare-fun res!702440 () Bool)

(assert (=> b!1054121 (=> (not res!702440) (not e!598639))))

(assert (=> b!1054121 (= res!702440 (= (select (arr!31936 a!3488) i!1381) k0!2747))))

(declare-fun b!1054122 () Bool)

(assert (=> b!1054122 (= e!598636 e!598638)))

(declare-fun res!702439 () Bool)

(assert (=> b!1054122 (=> (not res!702439) (not e!598638))))

(assert (=> b!1054122 (= res!702439 (not (= lt!465485 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66406 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1054122 (= lt!465485 (arrayScanForKey!0 lt!465484 k0!2747 #b00000000000000000000000000000000))))

(assert (= (and start!92790 res!702441) b!1054120))

(assert (= (and b!1054120 res!702438) b!1054119))

(assert (= (and b!1054119 res!702443) b!1054121))

(assert (= (and b!1054121 res!702440) b!1054117))

(assert (= (and b!1054117 res!702442) b!1054122))

(assert (= (and b!1054122 res!702439) b!1054118))

(declare-fun m!974873 () Bool)

(assert (=> b!1054122 m!974873))

(declare-fun m!974875 () Bool)

(assert (=> b!1054118 m!974875))

(declare-fun m!974877 () Bool)

(assert (=> b!1054118 m!974877))

(declare-fun m!974879 () Bool)

(assert (=> b!1054121 m!974879))

(declare-fun m!974881 () Bool)

(assert (=> start!92790 m!974881))

(declare-fun m!974883 () Bool)

(assert (=> b!1054120 m!974883))

(declare-fun m!974885 () Bool)

(assert (=> b!1054119 m!974885))

(declare-fun m!974887 () Bool)

(assert (=> b!1054117 m!974887))

(assert (=> b!1054117 m!974875))

(check-sat (not b!1054117) (not start!92790) (not b!1054122) (not b!1054120) (not b!1054119))
(check-sat)
