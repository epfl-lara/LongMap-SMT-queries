; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115690 () Bool)

(assert start!115690)

(declare-fun b!1368009 () Bool)

(declare-fun res!911560 () Bool)

(declare-fun e!775203 () Bool)

(assert (=> b!1368009 (=> (not res!911560) (not e!775203))))

(declare-datatypes ((array!92841 0))(
  ( (array!92842 (arr!44845 (Array (_ BitVec 32) (_ BitVec 64))) (size!45397 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92841)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368009 (= res!911560 (not (validKeyInArray!0 (select (arr!44845 a!3861) from!3239))))))

(declare-fun res!911565 () Bool)

(declare-fun e!775201 () Bool)

(assert (=> start!115690 (=> (not res!911565) (not e!775201))))

(assert (=> start!115690 (= res!911565 (and (bvslt (size!45397 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45397 a!3861))))))

(assert (=> start!115690 e!775201))

(declare-fun array_inv!34078 (array!92841) Bool)

(assert (=> start!115690 (array_inv!34078 a!3861)))

(assert (=> start!115690 true))

(declare-fun b!1368010 () Bool)

(declare-fun res!911562 () Bool)

(assert (=> b!1368010 (=> (not res!911562) (not e!775201))))

(declare-datatypes ((List!31991 0))(
  ( (Nil!31988) (Cons!31987 (h!33196 (_ BitVec 64)) (t!46677 List!31991)) )
))
(declare-fun newAcc!98 () List!31991)

(declare-fun acc!866 () List!31991)

(declare-fun subseq!1022 (List!31991 List!31991) Bool)

(assert (=> b!1368010 (= res!911562 (subseq!1022 newAcc!98 acc!866))))

(declare-fun b!1368011 () Bool)

(declare-fun res!911567 () Bool)

(assert (=> b!1368011 (=> (not res!911567) (not e!775201))))

(declare-fun contains!9584 (List!31991 (_ BitVec 64)) Bool)

(assert (=> b!1368011 (= res!911567 (not (contains!9584 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368012 () Bool)

(declare-fun res!911569 () Bool)

(assert (=> b!1368012 (=> (not res!911569) (not e!775203))))

(assert (=> b!1368012 (= res!911569 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368013 () Bool)

(declare-fun res!911566 () Bool)

(assert (=> b!1368013 (=> (not res!911566) (not e!775201))))

(assert (=> b!1368013 (= res!911566 (not (contains!9584 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368014 () Bool)

(declare-fun res!911561 () Bool)

(assert (=> b!1368014 (=> (not res!911561) (not e!775201))))

(assert (=> b!1368014 (= res!911561 (not (contains!9584 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368015 () Bool)

(assert (=> b!1368015 (= e!775203 false)))

(declare-fun lt!601815 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92841 (_ BitVec 32) List!31991) Bool)

(assert (=> b!1368015 (= lt!601815 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368016 () Bool)

(declare-fun res!911563 () Bool)

(assert (=> b!1368016 (=> (not res!911563) (not e!775201))))

(declare-fun noDuplicate!2499 (List!31991) Bool)

(assert (=> b!1368016 (= res!911563 (noDuplicate!2499 acc!866))))

(declare-fun b!1368017 () Bool)

(assert (=> b!1368017 (= e!775201 e!775203)))

(declare-fun res!911568 () Bool)

(assert (=> b!1368017 (=> (not res!911568) (not e!775203))))

(assert (=> b!1368017 (= res!911568 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45018 0))(
  ( (Unit!45019) )
))
(declare-fun lt!601814 () Unit!45018)

(declare-fun noDuplicateSubseq!209 (List!31991 List!31991) Unit!45018)

(assert (=> b!1368017 (= lt!601814 (noDuplicateSubseq!209 newAcc!98 acc!866))))

(declare-fun b!1368018 () Bool)

(declare-fun res!911564 () Bool)

(assert (=> b!1368018 (=> (not res!911564) (not e!775203))))

(assert (=> b!1368018 (= res!911564 (bvslt from!3239 (size!45397 a!3861)))))

(declare-fun b!1368019 () Bool)

(declare-fun res!911570 () Bool)

(assert (=> b!1368019 (=> (not res!911570) (not e!775201))))

(assert (=> b!1368019 (= res!911570 (not (contains!9584 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115690 res!911565) b!1368016))

(assert (= (and b!1368016 res!911563) b!1368014))

(assert (= (and b!1368014 res!911561) b!1368019))

(assert (= (and b!1368019 res!911570) b!1368013))

(assert (= (and b!1368013 res!911566) b!1368011))

(assert (= (and b!1368011 res!911567) b!1368010))

(assert (= (and b!1368010 res!911562) b!1368017))

(assert (= (and b!1368017 res!911568) b!1368018))

(assert (= (and b!1368018 res!911564) b!1368009))

(assert (= (and b!1368009 res!911560) b!1368012))

(assert (= (and b!1368012 res!911569) b!1368015))

(declare-fun m!1251621 () Bool)

(assert (=> b!1368016 m!1251621))

(declare-fun m!1251623 () Bool)

(assert (=> start!115690 m!1251623))

(declare-fun m!1251625 () Bool)

(assert (=> b!1368017 m!1251625))

(declare-fun m!1251627 () Bool)

(assert (=> b!1368017 m!1251627))

(declare-fun m!1251629 () Bool)

(assert (=> b!1368011 m!1251629))

(declare-fun m!1251631 () Bool)

(assert (=> b!1368015 m!1251631))

(declare-fun m!1251633 () Bool)

(assert (=> b!1368019 m!1251633))

(declare-fun m!1251635 () Bool)

(assert (=> b!1368013 m!1251635))

(declare-fun m!1251637 () Bool)

(assert (=> b!1368014 m!1251637))

(declare-fun m!1251639 () Bool)

(assert (=> b!1368010 m!1251639))

(declare-fun m!1251641 () Bool)

(assert (=> b!1368009 m!1251641))

(assert (=> b!1368009 m!1251641))

(declare-fun m!1251643 () Bool)

(assert (=> b!1368009 m!1251643))

(check-sat (not b!1368016) (not b!1368014) (not b!1368019) (not b!1368009) (not start!115690) (not b!1368015) (not b!1368011) (not b!1368017) (not b!1368013) (not b!1368010))
(check-sat)
