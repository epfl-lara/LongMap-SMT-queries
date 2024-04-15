; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115600 () Bool)

(assert start!115600)

(declare-fun b!1367079 () Bool)

(declare-fun res!910652 () Bool)

(declare-fun e!774838 () Bool)

(assert (=> b!1367079 (=> (not res!910652) (not e!774838))))

(declare-datatypes ((List!31967 0))(
  ( (Nil!31964) (Cons!31963 (h!33172 (_ BitVec 64)) (t!46653 List!31967)) )
))
(declare-fun acc!866 () List!31967)

(declare-fun noDuplicate!2475 (List!31967) Bool)

(assert (=> b!1367079 (= res!910652 (noDuplicate!2475 acc!866))))

(declare-fun b!1367080 () Bool)

(declare-fun res!910654 () Bool)

(assert (=> b!1367080 (=> (not res!910654) (not e!774838))))

(declare-fun contains!9560 (List!31967 (_ BitVec 64)) Bool)

(assert (=> b!1367080 (= res!910654 (not (contains!9560 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367081 () Bool)

(declare-fun e!774840 () Bool)

(assert (=> b!1367081 (= e!774840 (not true))))

(declare-fun lt!601625 () Bool)

(declare-fun newAcc!98 () List!31967)

(assert (=> b!1367081 (= lt!601625 (noDuplicate!2475 newAcc!98))))

(declare-datatypes ((Unit!44970 0))(
  ( (Unit!44971) )
))
(declare-fun lt!601623 () Unit!44970)

(declare-fun lt!601626 () List!31967)

(declare-fun lt!601624 () List!31967)

(declare-fun noDuplicateSubseq!185 (List!31967 List!31967) Unit!44970)

(assert (=> b!1367081 (= lt!601623 (noDuplicateSubseq!185 lt!601626 lt!601624))))

(declare-datatypes ((array!92790 0))(
  ( (array!92791 (arr!44821 (Array (_ BitVec 32) (_ BitVec 64))) (size!45373 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92790)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92790 (_ BitVec 32) List!31967) Bool)

(assert (=> b!1367081 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601626)))

(declare-fun lt!601622 () Unit!44970)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92790 List!31967 List!31967 (_ BitVec 32)) Unit!44970)

(assert (=> b!1367081 (= lt!601622 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601624 lt!601626 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1367081 (= lt!601626 (Cons!31963 (select (arr!44821 a!3861) from!3239) newAcc!98))))

(assert (=> b!1367081 (= lt!601624 (Cons!31963 (select (arr!44821 a!3861) from!3239) acc!866))))

(declare-fun b!1367082 () Bool)

(declare-fun res!910657 () Bool)

(assert (=> b!1367082 (=> (not res!910657) (not e!774838))))

(assert (=> b!1367082 (= res!910657 (not (contains!9560 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367083 () Bool)

(declare-fun res!910656 () Bool)

(assert (=> b!1367083 (=> (not res!910656) (not e!774838))))

(declare-fun subseq!998 (List!31967 List!31967) Bool)

(assert (=> b!1367083 (= res!910656 (subseq!998 newAcc!98 acc!866))))

(declare-fun b!1367084 () Bool)

(assert (=> b!1367084 (= e!774838 e!774840)))

(declare-fun res!910650 () Bool)

(assert (=> b!1367084 (=> (not res!910650) (not e!774840))))

(assert (=> b!1367084 (= res!910650 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601621 () Unit!44970)

(assert (=> b!1367084 (= lt!601621 (noDuplicateSubseq!185 newAcc!98 acc!866))))

(declare-fun b!1367085 () Bool)

(declare-fun res!910648 () Bool)

(assert (=> b!1367085 (=> (not res!910648) (not e!774840))))

(assert (=> b!1367085 (= res!910648 (not (contains!9560 acc!866 (select (arr!44821 a!3861) from!3239))))))

(declare-fun res!910649 () Bool)

(assert (=> start!115600 (=> (not res!910649) (not e!774838))))

(assert (=> start!115600 (= res!910649 (and (bvslt (size!45373 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45373 a!3861))))))

(assert (=> start!115600 e!774838))

(declare-fun array_inv!34054 (array!92790) Bool)

(assert (=> start!115600 (array_inv!34054 a!3861)))

(assert (=> start!115600 true))

(declare-fun b!1367086 () Bool)

(declare-fun res!910651 () Bool)

(assert (=> b!1367086 (=> (not res!910651) (not e!774838))))

(assert (=> b!1367086 (= res!910651 (not (contains!9560 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367087 () Bool)

(declare-fun res!910653 () Bool)

(assert (=> b!1367087 (=> (not res!910653) (not e!774838))))

(assert (=> b!1367087 (= res!910653 (not (contains!9560 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367088 () Bool)

(declare-fun res!910655 () Bool)

(assert (=> b!1367088 (=> (not res!910655) (not e!774840))))

(assert (=> b!1367088 (= res!910655 (bvslt from!3239 (size!45373 a!3861)))))

(declare-fun b!1367089 () Bool)

(declare-fun res!910658 () Bool)

(assert (=> b!1367089 (=> (not res!910658) (not e!774840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367089 (= res!910658 (validKeyInArray!0 (select (arr!44821 a!3861) from!3239)))))

(assert (= (and start!115600 res!910649) b!1367079))

(assert (= (and b!1367079 res!910652) b!1367080))

(assert (= (and b!1367080 res!910654) b!1367082))

(assert (= (and b!1367082 res!910657) b!1367086))

(assert (= (and b!1367086 res!910651) b!1367087))

(assert (= (and b!1367087 res!910653) b!1367083))

(assert (= (and b!1367083 res!910656) b!1367084))

(assert (= (and b!1367084 res!910650) b!1367088))

(assert (= (and b!1367088 res!910655) b!1367089))

(assert (= (and b!1367089 res!910658) b!1367085))

(assert (= (and b!1367085 res!910648) b!1367081))

(declare-fun m!1250889 () Bool)

(assert (=> b!1367087 m!1250889))

(declare-fun m!1250891 () Bool)

(assert (=> b!1367081 m!1250891))

(declare-fun m!1250893 () Bool)

(assert (=> b!1367081 m!1250893))

(declare-fun m!1250895 () Bool)

(assert (=> b!1367081 m!1250895))

(declare-fun m!1250897 () Bool)

(assert (=> b!1367081 m!1250897))

(declare-fun m!1250899 () Bool)

(assert (=> b!1367081 m!1250899))

(assert (=> b!1367089 m!1250899))

(assert (=> b!1367089 m!1250899))

(declare-fun m!1250901 () Bool)

(assert (=> b!1367089 m!1250901))

(declare-fun m!1250903 () Bool)

(assert (=> b!1367080 m!1250903))

(declare-fun m!1250905 () Bool)

(assert (=> b!1367084 m!1250905))

(declare-fun m!1250907 () Bool)

(assert (=> b!1367084 m!1250907))

(declare-fun m!1250909 () Bool)

(assert (=> b!1367079 m!1250909))

(declare-fun m!1250911 () Bool)

(assert (=> start!115600 m!1250911))

(declare-fun m!1250913 () Bool)

(assert (=> b!1367082 m!1250913))

(assert (=> b!1367085 m!1250899))

(assert (=> b!1367085 m!1250899))

(declare-fun m!1250915 () Bool)

(assert (=> b!1367085 m!1250915))

(declare-fun m!1250917 () Bool)

(assert (=> b!1367086 m!1250917))

(declare-fun m!1250919 () Bool)

(assert (=> b!1367083 m!1250919))

(check-sat (not b!1367081) (not b!1367079) (not b!1367083) (not b!1367089) (not b!1367082) (not b!1367087) (not b!1367085) (not b!1367086) (not b!1367084) (not b!1367080) (not start!115600))
(check-sat)
