; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115774 () Bool)

(assert start!115774)

(declare-fun b!1368078 () Bool)

(declare-fun res!910848 () Bool)

(declare-fun e!775501 () Bool)

(assert (=> b!1368078 (=> (not res!910848) (not e!775501))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92941 0))(
  ( (array!92942 (arr!44893 (Array (_ BitVec 32) (_ BitVec 64))) (size!45444 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92941)

(assert (=> b!1368078 (= res!910848 (bvslt from!3239 (size!45444 a!3861)))))

(declare-fun b!1368079 () Bool)

(declare-fun res!910854 () Bool)

(declare-fun e!775500 () Bool)

(assert (=> b!1368079 (=> (not res!910854) (not e!775500))))

(declare-datatypes ((List!31948 0))(
  ( (Nil!31945) (Cons!31944 (h!33162 (_ BitVec 64)) (t!46634 List!31948)) )
))
(declare-fun newAcc!98 () List!31948)

(declare-fun contains!9633 (List!31948 (_ BitVec 64)) Bool)

(assert (=> b!1368079 (= res!910854 (not (contains!9633 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!910855 () Bool)

(assert (=> start!115774 (=> (not res!910855) (not e!775500))))

(assert (=> start!115774 (= res!910855 (and (bvslt (size!45444 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45444 a!3861))))))

(assert (=> start!115774 e!775500))

(declare-fun array_inv!34174 (array!92941) Bool)

(assert (=> start!115774 (array_inv!34174 a!3861)))

(assert (=> start!115774 true))

(declare-fun b!1368080 () Bool)

(declare-fun res!910856 () Bool)

(assert (=> b!1368080 (=> (not res!910856) (not e!775500))))

(declare-fun acc!866 () List!31948)

(assert (=> b!1368080 (= res!910856 (not (contains!9633 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368081 () Bool)

(declare-fun res!910847 () Bool)

(assert (=> b!1368081 (=> (not res!910847) (not e!775500))))

(declare-fun noDuplicate!2464 (List!31948) Bool)

(assert (=> b!1368081 (= res!910847 (noDuplicate!2464 acc!866))))

(declare-fun b!1368082 () Bool)

(declare-fun res!910851 () Bool)

(assert (=> b!1368082 (=> (not res!910851) (not e!775500))))

(declare-fun subseq!992 (List!31948 List!31948) Bool)

(assert (=> b!1368082 (= res!910851 (subseq!992 newAcc!98 acc!866))))

(declare-fun b!1368083 () Bool)

(declare-fun res!910852 () Bool)

(assert (=> b!1368083 (=> (not res!910852) (not e!775501))))

(assert (=> b!1368083 (= res!910852 (not (contains!9633 acc!866 (select (arr!44893 a!3861) from!3239))))))

(declare-fun b!1368084 () Bool)

(assert (=> b!1368084 (= e!775501 (not true))))

(declare-datatypes ((Unit!45056 0))(
  ( (Unit!45057) )
))
(declare-fun lt!602151 () Unit!45056)

(declare-fun lt!602154 () List!31948)

(declare-fun lt!602153 () List!31948)

(declare-fun noDuplicateSubseq!179 (List!31948 List!31948) Unit!45056)

(assert (=> b!1368084 (= lt!602151 (noDuplicateSubseq!179 lt!602154 lt!602153))))

(declare-fun arrayNoDuplicates!0 (array!92941 (_ BitVec 32) List!31948) Bool)

(assert (=> b!1368084 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!602154)))

(declare-fun lt!602152 () Unit!45056)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92941 List!31948 List!31948 (_ BitVec 32)) Unit!45056)

(assert (=> b!1368084 (= lt!602152 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!602153 lt!602154 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1368084 (= lt!602154 (Cons!31944 (select (arr!44893 a!3861) from!3239) newAcc!98))))

(assert (=> b!1368084 (= lt!602153 (Cons!31944 (select (arr!44893 a!3861) from!3239) acc!866))))

(declare-fun b!1368085 () Bool)

(declare-fun res!910853 () Bool)

(assert (=> b!1368085 (=> (not res!910853) (not e!775500))))

(assert (=> b!1368085 (= res!910853 (not (contains!9633 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1368086 () Bool)

(assert (=> b!1368086 (= e!775500 e!775501)))

(declare-fun res!910849 () Bool)

(assert (=> b!1368086 (=> (not res!910849) (not e!775501))))

(assert (=> b!1368086 (= res!910849 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!602150 () Unit!45056)

(assert (=> b!1368086 (= lt!602150 (noDuplicateSubseq!179 newAcc!98 acc!866))))

(declare-fun b!1368087 () Bool)

(declare-fun res!910857 () Bool)

(assert (=> b!1368087 (=> (not res!910857) (not e!775501))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1368087 (= res!910857 (validKeyInArray!0 (select (arr!44893 a!3861) from!3239)))))

(declare-fun b!1368088 () Bool)

(declare-fun res!910850 () Bool)

(assert (=> b!1368088 (=> (not res!910850) (not e!775500))))

(assert (=> b!1368088 (= res!910850 (not (contains!9633 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115774 res!910855) b!1368081))

(assert (= (and b!1368081 res!910847) b!1368088))

(assert (= (and b!1368088 res!910850) b!1368080))

(assert (= (and b!1368080 res!910856) b!1368085))

(assert (= (and b!1368085 res!910853) b!1368079))

(assert (= (and b!1368079 res!910854) b!1368082))

(assert (= (and b!1368082 res!910851) b!1368086))

(assert (= (and b!1368086 res!910849) b!1368078))

(assert (= (and b!1368078 res!910848) b!1368087))

(assert (= (and b!1368087 res!910857) b!1368083))

(assert (= (and b!1368083 res!910852) b!1368084))

(declare-fun m!1252651 () Bool)

(assert (=> b!1368084 m!1252651))

(declare-fun m!1252653 () Bool)

(assert (=> b!1368084 m!1252653))

(declare-fun m!1252655 () Bool)

(assert (=> b!1368084 m!1252655))

(declare-fun m!1252657 () Bool)

(assert (=> b!1368084 m!1252657))

(declare-fun m!1252659 () Bool)

(assert (=> b!1368079 m!1252659))

(declare-fun m!1252661 () Bool)

(assert (=> b!1368080 m!1252661))

(declare-fun m!1252663 () Bool)

(assert (=> b!1368088 m!1252663))

(declare-fun m!1252665 () Bool)

(assert (=> start!115774 m!1252665))

(declare-fun m!1252667 () Bool)

(assert (=> b!1368082 m!1252667))

(declare-fun m!1252669 () Bool)

(assert (=> b!1368081 m!1252669))

(assert (=> b!1368087 m!1252657))

(assert (=> b!1368087 m!1252657))

(declare-fun m!1252671 () Bool)

(assert (=> b!1368087 m!1252671))

(declare-fun m!1252673 () Bool)

(assert (=> b!1368085 m!1252673))

(declare-fun m!1252675 () Bool)

(assert (=> b!1368086 m!1252675))

(declare-fun m!1252677 () Bool)

(assert (=> b!1368086 m!1252677))

(assert (=> b!1368083 m!1252657))

(assert (=> b!1368083 m!1252657))

(declare-fun m!1252679 () Bool)

(assert (=> b!1368083 m!1252679))

(check-sat (not b!1368084) (not b!1368081) (not b!1368082) (not b!1368088) (not b!1368079) (not b!1368085) (not b!1368083) (not start!115774) (not b!1368080) (not b!1368086) (not b!1368087))
(check-sat)
