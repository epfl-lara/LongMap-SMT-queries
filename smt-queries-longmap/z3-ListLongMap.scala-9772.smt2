; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115792 () Bool)

(assert start!115792)

(declare-fun b!1369108 () Bool)

(declare-fun res!912629 () Bool)

(declare-fun e!775608 () Bool)

(assert (=> b!1369108 (=> (not res!912629) (not e!775608))))

(declare-datatypes ((List!32018 0))(
  ( (Nil!32015) (Cons!32014 (h!33223 (_ BitVec 64)) (t!46704 List!32018)) )
))
(declare-fun newAcc!98 () List!32018)

(declare-fun contains!9611 (List!32018 (_ BitVec 64)) Bool)

(assert (=> b!1369108 (= res!912629 (not (contains!9611 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369109 () Bool)

(declare-fun res!912635 () Bool)

(assert (=> b!1369109 (=> (not res!912635) (not e!775608))))

(declare-fun acc!866 () List!32018)

(declare-fun noDuplicate!2526 (List!32018) Bool)

(assert (=> b!1369109 (= res!912635 (noDuplicate!2526 acc!866))))

(declare-fun b!1369110 () Bool)

(declare-fun res!912632 () Bool)

(assert (=> b!1369110 (=> (not res!912632) (not e!775608))))

(assert (=> b!1369110 (= res!912632 (not (contains!9611 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369111 () Bool)

(declare-fun res!912630 () Bool)

(assert (=> b!1369111 (=> (not res!912630) (not e!775608))))

(assert (=> b!1369111 (= res!912630 (not (contains!9611 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!912633 () Bool)

(assert (=> start!115792 (=> (not res!912633) (not e!775608))))

(declare-datatypes ((array!92898 0))(
  ( (array!92899 (arr!44872 (Array (_ BitVec 32) (_ BitVec 64))) (size!45424 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92898)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115792 (= res!912633 (and (bvslt (size!45424 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45424 a!3861))))))

(assert (=> start!115792 e!775608))

(declare-fun array_inv!34105 (array!92898) Bool)

(assert (=> start!115792 (array_inv!34105 a!3861)))

(assert (=> start!115792 true))

(declare-fun b!1369112 () Bool)

(declare-fun res!912634 () Bool)

(assert (=> b!1369112 (=> (not res!912634) (not e!775608))))

(assert (=> b!1369112 (= res!912634 (not (contains!9611 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369113 () Bool)

(declare-fun res!912631 () Bool)

(assert (=> b!1369113 (=> (not res!912631) (not e!775608))))

(declare-fun subseq!1049 (List!32018 List!32018) Bool)

(assert (=> b!1369113 (= res!912631 (subseq!1049 newAcc!98 acc!866))))

(declare-fun b!1369114 () Bool)

(assert (=> b!1369114 (= e!775608 false)))

(declare-fun lt!602022 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92898 (_ BitVec 32) List!32018) Bool)

(assert (=> b!1369114 (= lt!602022 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45072 0))(
  ( (Unit!45073) )
))
(declare-fun lt!602021 () Unit!45072)

(declare-fun noDuplicateSubseq!236 (List!32018 List!32018) Unit!45072)

(assert (=> b!1369114 (= lt!602021 (noDuplicateSubseq!236 newAcc!98 acc!866))))

(assert (= (and start!115792 res!912633) b!1369109))

(assert (= (and b!1369109 res!912635) b!1369112))

(assert (= (and b!1369112 res!912634) b!1369111))

(assert (= (and b!1369111 res!912630) b!1369110))

(assert (= (and b!1369110 res!912632) b!1369108))

(assert (= (and b!1369108 res!912629) b!1369113))

(assert (= (and b!1369113 res!912631) b!1369114))

(declare-fun m!1252485 () Bool)

(assert (=> b!1369111 m!1252485))

(declare-fun m!1252487 () Bool)

(assert (=> start!115792 m!1252487))

(declare-fun m!1252489 () Bool)

(assert (=> b!1369108 m!1252489))

(declare-fun m!1252491 () Bool)

(assert (=> b!1369112 m!1252491))

(declare-fun m!1252493 () Bool)

(assert (=> b!1369109 m!1252493))

(declare-fun m!1252495 () Bool)

(assert (=> b!1369114 m!1252495))

(declare-fun m!1252497 () Bool)

(assert (=> b!1369114 m!1252497))

(declare-fun m!1252499 () Bool)

(assert (=> b!1369110 m!1252499))

(declare-fun m!1252501 () Bool)

(assert (=> b!1369113 m!1252501))

(check-sat (not start!115792) (not b!1369108) (not b!1369111) (not b!1369110) (not b!1369109) (not b!1369113) (not b!1369114) (not b!1369112))
(check-sat)
