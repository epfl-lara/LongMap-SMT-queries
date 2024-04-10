; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115612 () Bool)

(assert start!115612)

(declare-fun b!1367184 () Bool)

(declare-fun res!910713 () Bool)

(declare-fun e!774882 () Bool)

(assert (=> b!1367184 (=> (not res!910713) (not e!774882))))

(declare-datatypes ((List!31915 0))(
  ( (Nil!31912) (Cons!31911 (h!33120 (_ BitVec 64)) (t!46609 List!31915)) )
))
(declare-fun acc!866 () List!31915)

(declare-fun contains!9597 (List!31915 (_ BitVec 64)) Bool)

(assert (=> b!1367184 (= res!910713 (not (contains!9597 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367185 () Bool)

(declare-fun res!910711 () Bool)

(declare-fun e!774881 () Bool)

(assert (=> b!1367185 (=> (not res!910711) (not e!774881))))

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((array!92843 0))(
  ( (array!92844 (arr!44847 (Array (_ BitVec 32) (_ BitVec 64))) (size!45397 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92843)

(assert (=> b!1367185 (= res!910711 (bvslt from!3239 (size!45397 a!3861)))))

(declare-fun b!1367186 () Bool)

(declare-fun res!910714 () Bool)

(assert (=> b!1367186 (=> (not res!910714) (not e!774882))))

(declare-fun noDuplicate!2454 (List!31915) Bool)

(assert (=> b!1367186 (= res!910714 (noDuplicate!2454 acc!866))))

(declare-fun b!1367187 () Bool)

(declare-fun res!910720 () Bool)

(assert (=> b!1367187 (=> (not res!910720) (not e!774882))))

(declare-fun newAcc!98 () List!31915)

(declare-fun subseq!999 (List!31915 List!31915) Bool)

(assert (=> b!1367187 (= res!910720 (subseq!999 newAcc!98 acc!866))))

(declare-fun b!1367188 () Bool)

(assert (=> b!1367188 (= e!774881 (not true))))

(declare-fun lt!601827 () Bool)

(assert (=> b!1367188 (= lt!601827 (noDuplicate!2454 newAcc!98))))

(declare-datatypes ((Unit!45131 0))(
  ( (Unit!45132) )
))
(declare-fun lt!601830 () Unit!45131)

(declare-fun lt!601828 () List!31915)

(declare-fun lt!601831 () List!31915)

(declare-fun noDuplicateSubseq!186 (List!31915 List!31915) Unit!45131)

(assert (=> b!1367188 (= lt!601830 (noDuplicateSubseq!186 lt!601828 lt!601831))))

(declare-fun arrayNoDuplicates!0 (array!92843 (_ BitVec 32) List!31915) Bool)

(assert (=> b!1367188 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) lt!601828)))

(declare-fun lt!601829 () Unit!45131)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!92843 List!31915 List!31915 (_ BitVec 32)) Unit!45131)

(assert (=> b!1367188 (= lt!601829 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 lt!601831 lt!601828 (bvadd #b00000000000000000000000000000001 from!3239)))))

(assert (=> b!1367188 (= lt!601828 (Cons!31911 (select (arr!44847 a!3861) from!3239) newAcc!98))))

(assert (=> b!1367188 (= lt!601831 (Cons!31911 (select (arr!44847 a!3861) from!3239) acc!866))))

(declare-fun b!1367189 () Bool)

(declare-fun res!910710 () Bool)

(assert (=> b!1367189 (=> (not res!910710) (not e!774882))))

(assert (=> b!1367189 (= res!910710 (not (contains!9597 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367191 () Bool)

(declare-fun res!910715 () Bool)

(assert (=> b!1367191 (=> (not res!910715) (not e!774881))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1367191 (= res!910715 (validKeyInArray!0 (select (arr!44847 a!3861) from!3239)))))

(declare-fun b!1367192 () Bool)

(declare-fun res!910717 () Bool)

(assert (=> b!1367192 (=> (not res!910717) (not e!774882))))

(assert (=> b!1367192 (= res!910717 (not (contains!9597 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367190 () Bool)

(assert (=> b!1367190 (= e!774882 e!774881)))

(declare-fun res!910716 () Bool)

(assert (=> b!1367190 (=> (not res!910716) (not e!774881))))

(assert (=> b!1367190 (= res!910716 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!601826 () Unit!45131)

(assert (=> b!1367190 (= lt!601826 (noDuplicateSubseq!186 newAcc!98 acc!866))))

(declare-fun res!910718 () Bool)

(assert (=> start!115612 (=> (not res!910718) (not e!774882))))

(assert (=> start!115612 (= res!910718 (and (bvslt (size!45397 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45397 a!3861))))))

(assert (=> start!115612 e!774882))

(declare-fun array_inv!33875 (array!92843) Bool)

(assert (=> start!115612 (array_inv!33875 a!3861)))

(assert (=> start!115612 true))

(declare-fun b!1367193 () Bool)

(declare-fun res!910712 () Bool)

(assert (=> b!1367193 (=> (not res!910712) (not e!774882))))

(assert (=> b!1367193 (= res!910712 (not (contains!9597 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1367194 () Bool)

(declare-fun res!910719 () Bool)

(assert (=> b!1367194 (=> (not res!910719) (not e!774881))))

(assert (=> b!1367194 (= res!910719 (not (contains!9597 acc!866 (select (arr!44847 a!3861) from!3239))))))

(assert (= (and start!115612 res!910718) b!1367186))

(assert (= (and b!1367186 res!910714) b!1367189))

(assert (= (and b!1367189 res!910710) b!1367184))

(assert (= (and b!1367184 res!910713) b!1367193))

(assert (= (and b!1367193 res!910712) b!1367192))

(assert (= (and b!1367192 res!910717) b!1367187))

(assert (= (and b!1367187 res!910720) b!1367190))

(assert (= (and b!1367190 res!910716) b!1367185))

(assert (= (and b!1367185 res!910711) b!1367191))

(assert (= (and b!1367191 res!910715) b!1367194))

(assert (= (and b!1367194 res!910719) b!1367188))

(declare-fun m!1251447 () Bool)

(assert (=> b!1367192 m!1251447))

(declare-fun m!1251449 () Bool)

(assert (=> b!1367189 m!1251449))

(declare-fun m!1251451 () Bool)

(assert (=> b!1367194 m!1251451))

(assert (=> b!1367194 m!1251451))

(declare-fun m!1251453 () Bool)

(assert (=> b!1367194 m!1251453))

(declare-fun m!1251455 () Bool)

(assert (=> b!1367184 m!1251455))

(assert (=> b!1367191 m!1251451))

(assert (=> b!1367191 m!1251451))

(declare-fun m!1251457 () Bool)

(assert (=> b!1367191 m!1251457))

(declare-fun m!1251459 () Bool)

(assert (=> b!1367188 m!1251459))

(declare-fun m!1251461 () Bool)

(assert (=> b!1367188 m!1251461))

(assert (=> b!1367188 m!1251451))

(declare-fun m!1251463 () Bool)

(assert (=> b!1367188 m!1251463))

(declare-fun m!1251465 () Bool)

(assert (=> b!1367188 m!1251465))

(declare-fun m!1251467 () Bool)

(assert (=> b!1367193 m!1251467))

(declare-fun m!1251469 () Bool)

(assert (=> b!1367186 m!1251469))

(declare-fun m!1251471 () Bool)

(assert (=> start!115612 m!1251471))

(declare-fun m!1251473 () Bool)

(assert (=> b!1367190 m!1251473))

(declare-fun m!1251475 () Bool)

(assert (=> b!1367190 m!1251475))

(declare-fun m!1251477 () Bool)

(assert (=> b!1367187 m!1251477))

(check-sat (not b!1367187) (not b!1367191) (not b!1367189) (not b!1367192) (not b!1367186) (not b!1367188) (not b!1367193) (not b!1367190) (not start!115612) (not b!1367194) (not b!1367184))
(check-sat)
