; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115858 () Bool)

(assert start!115858)

(declare-fun b!1369568 () Bool)

(declare-fun e!775858 () Bool)

(assert (=> b!1369568 (= e!775858 false)))

(declare-fun lt!602287 () Bool)

(declare-datatypes ((List!31975 0))(
  ( (Nil!31972) (Cons!31971 (h!33180 (_ BitVec 64)) (t!46669 List!31975)) )
))
(declare-fun newAcc!98 () List!31975)

(declare-fun noDuplicate!2514 (List!31975) Bool)

(assert (=> b!1369568 (= lt!602287 (noDuplicate!2514 newAcc!98))))

(declare-fun res!913033 () Bool)

(declare-fun e!775856 () Bool)

(assert (=> start!115858 (=> (not res!913033) (not e!775856))))

(declare-datatypes ((array!92972 0))(
  ( (array!92973 (arr!44907 (Array (_ BitVec 32) (_ BitVec 64))) (size!45457 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92972)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115858 (= res!913033 (and (bvslt (size!45457 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45457 a!3861))))))

(assert (=> start!115858 e!775856))

(declare-fun array_inv!33935 (array!92972) Bool)

(assert (=> start!115858 (array_inv!33935 a!3861)))

(assert (=> start!115858 true))

(declare-fun b!1369569 () Bool)

(declare-fun res!913028 () Bool)

(assert (=> b!1369569 (=> (not res!913028) (not e!775856))))

(declare-fun acc!866 () List!31975)

(declare-fun contains!9657 (List!31975 (_ BitVec 64)) Bool)

(assert (=> b!1369569 (= res!913028 (not (contains!9657 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369570 () Bool)

(declare-fun res!913034 () Bool)

(assert (=> b!1369570 (=> (not res!913034) (not e!775858))))

(assert (=> b!1369570 (= res!913034 (bvsge from!3239 (size!45457 a!3861)))))

(declare-fun b!1369571 () Bool)

(assert (=> b!1369571 (= e!775856 e!775858)))

(declare-fun res!913035 () Bool)

(assert (=> b!1369571 (=> (not res!913035) (not e!775858))))

(declare-fun arrayNoDuplicates!0 (array!92972 (_ BitVec 32) List!31975) Bool)

(assert (=> b!1369571 (= res!913035 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45251 0))(
  ( (Unit!45252) )
))
(declare-fun lt!602286 () Unit!45251)

(declare-fun noDuplicateSubseq!246 (List!31975 List!31975) Unit!45251)

(assert (=> b!1369571 (= lt!602286 (noDuplicateSubseq!246 newAcc!98 acc!866))))

(declare-fun b!1369572 () Bool)

(declare-fun res!913036 () Bool)

(assert (=> b!1369572 (=> (not res!913036) (not e!775856))))

(declare-fun subseq!1059 (List!31975 List!31975) Bool)

(assert (=> b!1369572 (= res!913036 (subseq!1059 newAcc!98 acc!866))))

(declare-fun b!1369573 () Bool)

(declare-fun res!913031 () Bool)

(assert (=> b!1369573 (=> (not res!913031) (not e!775856))))

(assert (=> b!1369573 (= res!913031 (not (contains!9657 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369574 () Bool)

(declare-fun res!913029 () Bool)

(assert (=> b!1369574 (=> (not res!913029) (not e!775856))))

(assert (=> b!1369574 (= res!913029 (not (contains!9657 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369575 () Bool)

(declare-fun res!913030 () Bool)

(assert (=> b!1369575 (=> (not res!913030) (not e!775856))))

(assert (=> b!1369575 (= res!913030 (not (contains!9657 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369576 () Bool)

(declare-fun res!913032 () Bool)

(assert (=> b!1369576 (=> (not res!913032) (not e!775856))))

(assert (=> b!1369576 (= res!913032 (noDuplicate!2514 acc!866))))

(assert (= (and start!115858 res!913033) b!1369576))

(assert (= (and b!1369576 res!913032) b!1369569))

(assert (= (and b!1369569 res!913028) b!1369574))

(assert (= (and b!1369574 res!913029) b!1369575))

(assert (= (and b!1369575 res!913030) b!1369573))

(assert (= (and b!1369573 res!913031) b!1369572))

(assert (= (and b!1369572 res!913036) b!1369571))

(assert (= (and b!1369571 res!913035) b!1369570))

(assert (= (and b!1369570 res!913034) b!1369568))

(declare-fun m!1253325 () Bool)

(assert (=> b!1369568 m!1253325))

(declare-fun m!1253327 () Bool)

(assert (=> b!1369569 m!1253327))

(declare-fun m!1253329 () Bool)

(assert (=> b!1369576 m!1253329))

(declare-fun m!1253331 () Bool)

(assert (=> b!1369571 m!1253331))

(declare-fun m!1253333 () Bool)

(assert (=> b!1369571 m!1253333))

(declare-fun m!1253335 () Bool)

(assert (=> b!1369575 m!1253335))

(declare-fun m!1253337 () Bool)

(assert (=> start!115858 m!1253337))

(declare-fun m!1253339 () Bool)

(assert (=> b!1369574 m!1253339))

(declare-fun m!1253341 () Bool)

(assert (=> b!1369572 m!1253341))

(declare-fun m!1253343 () Bool)

(assert (=> b!1369573 m!1253343))

(check-sat (not b!1369568) (not b!1369571) (not b!1369576) (not start!115858) (not b!1369573) (not b!1369569) (not b!1369575) (not b!1369574) (not b!1369572))
(check-sat)
