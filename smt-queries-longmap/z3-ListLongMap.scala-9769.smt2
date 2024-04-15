; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115726 () Bool)

(assert start!115726)

(declare-fun res!912172 () Bool)

(declare-fun e!775364 () Bool)

(assert (=> start!115726 (=> (not res!912172) (not e!775364))))

(declare-datatypes ((array!92877 0))(
  ( (array!92878 (arr!44863 (Array (_ BitVec 32) (_ BitVec 64))) (size!45415 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92877)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115726 (= res!912172 (and (bvslt (size!45415 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45415 a!3861))))))

(assert (=> start!115726 e!775364))

(declare-fun array_inv!34096 (array!92877) Bool)

(assert (=> start!115726 (array_inv!34096 a!3861)))

(assert (=> start!115726 true))

(declare-fun b!1368614 () Bool)

(declare-fun res!912173 () Bool)

(declare-fun e!775365 () Bool)

(assert (=> b!1368614 (=> (not res!912173) (not e!775365))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368614 (= res!912173 (not (validKeyInArray!0 (select (arr!44863 a!3861) from!3239))))))

(declare-fun b!1368615 () Bool)

(declare-fun res!912165 () Bool)

(assert (=> b!1368615 (=> (not res!912165) (not e!775364))))

(declare-datatypes ((List!32009 0))(
  ( (Nil!32006) (Cons!32005 (h!33214 (_ BitVec 64)) (t!46695 List!32009)) )
))
(declare-fun newAcc!98 () List!32009)

(declare-fun acc!866 () List!32009)

(declare-fun subseq!1040 (List!32009 List!32009) Bool)

(assert (=> b!1368615 (= res!912165 (subseq!1040 newAcc!98 acc!866))))

(declare-fun b!1368616 () Bool)

(assert (=> b!1368616 (= e!775364 e!775365)))

(declare-fun res!912168 () Bool)

(assert (=> b!1368616 (=> (not res!912168) (not e!775365))))

(declare-fun arrayNoDuplicates!0 (array!92877 (_ BitVec 32) List!32009) Bool)

(assert (=> b!1368616 (= res!912168 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45054 0))(
  ( (Unit!45055) )
))
(declare-fun lt!601923 () Unit!45054)

(declare-fun noDuplicateSubseq!227 (List!32009 List!32009) Unit!45054)

(assert (=> b!1368616 (= lt!601923 (noDuplicateSubseq!227 newAcc!98 acc!866))))

(declare-fun b!1368617 () Bool)

(declare-fun res!912175 () Bool)

(assert (=> b!1368617 (=> (not res!912175) (not e!775364))))

(declare-fun contains!9602 (List!32009 (_ BitVec 64)) Bool)

(assert (=> b!1368617 (= res!912175 (not (contains!9602 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368618 () Bool)

(declare-fun res!912176 () Bool)

(assert (=> b!1368618 (=> (not res!912176) (not e!775364))))

(assert (=> b!1368618 (= res!912176 (not (contains!9602 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368619 () Bool)

(declare-fun res!912167 () Bool)

(assert (=> b!1368619 (=> (not res!912167) (not e!775364))))

(assert (=> b!1368619 (= res!912167 (not (contains!9602 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368620 () Bool)

(assert (=> b!1368620 (= e!775365 (not true))))

(assert (=> b!1368620 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-fun lt!601922 () Unit!45054)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92877 List!32009 List!32009 (_ BitVec 32)) Unit!45054)

(assert (=> b!1368620 (= lt!601922 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun b!1368621 () Bool)

(declare-fun res!912169 () Bool)

(assert (=> b!1368621 (=> (not res!912169) (not e!775365))))

(assert (=> b!1368621 (= res!912169 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1368622 () Bool)

(declare-fun res!912166 () Bool)

(assert (=> b!1368622 (=> (not res!912166) (not e!775365))))

(assert (=> b!1368622 (= res!912166 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1368623 () Bool)

(declare-fun res!912171 () Bool)

(assert (=> b!1368623 (=> (not res!912171) (not e!775365))))

(assert (=> b!1368623 (= res!912171 (bvslt from!3239 (size!45415 a!3861)))))

(declare-fun b!1368624 () Bool)

(declare-fun res!912170 () Bool)

(assert (=> b!1368624 (=> (not res!912170) (not e!775364))))

(declare-fun noDuplicate!2517 (List!32009) Bool)

(assert (=> b!1368624 (= res!912170 (noDuplicate!2517 acc!866))))

(declare-fun b!1368625 () Bool)

(declare-fun res!912174 () Bool)

(assert (=> b!1368625 (=> (not res!912174) (not e!775364))))

(assert (=> b!1368625 (= res!912174 (not (contains!9602 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115726 res!912172) b!1368624))

(assert (= (and b!1368624 res!912170) b!1368617))

(assert (= (and b!1368617 res!912175) b!1368618))

(assert (= (and b!1368618 res!912176) b!1368625))

(assert (= (and b!1368625 res!912174) b!1368619))

(assert (= (and b!1368619 res!912167) b!1368615))

(assert (= (and b!1368615 res!912165) b!1368616))

(assert (= (and b!1368616 res!912168) b!1368623))

(assert (= (and b!1368623 res!912171) b!1368614))

(assert (= (and b!1368614 res!912173) b!1368622))

(assert (= (and b!1368622 res!912166) b!1368621))

(assert (= (and b!1368621 res!912169) b!1368620))

(declare-fun m!1252065 () Bool)

(assert (=> b!1368615 m!1252065))

(declare-fun m!1252067 () Bool)

(assert (=> b!1368616 m!1252067))

(declare-fun m!1252069 () Bool)

(assert (=> b!1368616 m!1252069))

(declare-fun m!1252071 () Bool)

(assert (=> b!1368618 m!1252071))

(declare-fun m!1252073 () Bool)

(assert (=> b!1368614 m!1252073))

(assert (=> b!1368614 m!1252073))

(declare-fun m!1252075 () Bool)

(assert (=> b!1368614 m!1252075))

(declare-fun m!1252077 () Bool)

(assert (=> b!1368620 m!1252077))

(declare-fun m!1252079 () Bool)

(assert (=> b!1368620 m!1252079))

(declare-fun m!1252081 () Bool)

(assert (=> b!1368621 m!1252081))

(declare-fun m!1252083 () Bool)

(assert (=> b!1368619 m!1252083))

(declare-fun m!1252085 () Bool)

(assert (=> b!1368624 m!1252085))

(declare-fun m!1252087 () Bool)

(assert (=> start!115726 m!1252087))

(declare-fun m!1252089 () Bool)

(assert (=> b!1368625 m!1252089))

(declare-fun m!1252091 () Bool)

(assert (=> b!1368617 m!1252091))

(check-sat (not start!115726) (not b!1368619) (not b!1368624) (not b!1368625) (not b!1368620) (not b!1368621) (not b!1368615) (not b!1368617) (not b!1368616) (not b!1368614) (not b!1368618))
(check-sat)
