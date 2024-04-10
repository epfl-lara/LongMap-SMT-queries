; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115876 () Bool)

(assert start!115876)

(declare-fun b!1369780 () Bool)

(declare-fun e!775920 () Bool)

(assert (=> b!1369780 (= e!775920 false)))

(declare-fun lt!602341 () Bool)

(declare-datatypes ((array!92990 0))(
  ( (array!92991 (arr!44916 (Array (_ BitVec 32) (_ BitVec 64))) (size!45466 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92990)

(declare-fun from!3239 () (_ BitVec 32))

(declare-datatypes ((List!31984 0))(
  ( (Nil!31981) (Cons!31980 (h!33189 (_ BitVec 64)) (t!46678 List!31984)) )
))
(declare-fun acc!866 () List!31984)

(declare-fun contains!9666 (List!31984 (_ BitVec 64)) Bool)

(assert (=> b!1369780 (= lt!602341 (contains!9666 acc!866 (select (arr!44916 a!3861) from!3239)))))

(declare-fun b!1369781 () Bool)

(declare-fun res!913247 () Bool)

(assert (=> b!1369781 (=> (not res!913247) (not e!775920))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369781 (= res!913247 (validKeyInArray!0 (select (arr!44916 a!3861) from!3239)))))

(declare-fun b!1369782 () Bool)

(declare-fun e!775921 () Bool)

(assert (=> b!1369782 (= e!775921 e!775920)))

(declare-fun res!913242 () Bool)

(assert (=> b!1369782 (=> (not res!913242) (not e!775920))))

(declare-fun arrayNoDuplicates!0 (array!92990 (_ BitVec 32) List!31984) Bool)

(assert (=> b!1369782 (= res!913242 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45269 0))(
  ( (Unit!45270) )
))
(declare-fun lt!602340 () Unit!45269)

(declare-fun newAcc!98 () List!31984)

(declare-fun noDuplicateSubseq!255 (List!31984 List!31984) Unit!45269)

(assert (=> b!1369782 (= lt!602340 (noDuplicateSubseq!255 newAcc!98 acc!866))))

(declare-fun b!1369783 () Bool)

(declare-fun res!913240 () Bool)

(assert (=> b!1369783 (=> (not res!913240) (not e!775921))))

(assert (=> b!1369783 (= res!913240 (not (contains!9666 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369784 () Bool)

(declare-fun res!913244 () Bool)

(assert (=> b!1369784 (=> (not res!913244) (not e!775921))))

(assert (=> b!1369784 (= res!913244 (not (contains!9666 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369785 () Bool)

(declare-fun res!913248 () Bool)

(assert (=> b!1369785 (=> (not res!913248) (not e!775921))))

(assert (=> b!1369785 (= res!913248 (not (contains!9666 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!913241 () Bool)

(assert (=> start!115876 (=> (not res!913241) (not e!775921))))

(assert (=> start!115876 (= res!913241 (and (bvslt (size!45466 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45466 a!3861))))))

(assert (=> start!115876 e!775921))

(declare-fun array_inv!33944 (array!92990) Bool)

(assert (=> start!115876 (array_inv!33944 a!3861)))

(assert (=> start!115876 true))

(declare-fun b!1369786 () Bool)

(declare-fun res!913246 () Bool)

(assert (=> b!1369786 (=> (not res!913246) (not e!775920))))

(assert (=> b!1369786 (= res!913246 (bvslt from!3239 (size!45466 a!3861)))))

(declare-fun b!1369787 () Bool)

(declare-fun res!913245 () Bool)

(assert (=> b!1369787 (=> (not res!913245) (not e!775921))))

(declare-fun noDuplicate!2523 (List!31984) Bool)

(assert (=> b!1369787 (= res!913245 (noDuplicate!2523 acc!866))))

(declare-fun b!1369788 () Bool)

(declare-fun res!913243 () Bool)

(assert (=> b!1369788 (=> (not res!913243) (not e!775921))))

(assert (=> b!1369788 (= res!913243 (not (contains!9666 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369789 () Bool)

(declare-fun res!913249 () Bool)

(assert (=> b!1369789 (=> (not res!913249) (not e!775921))))

(declare-fun subseq!1068 (List!31984 List!31984) Bool)

(assert (=> b!1369789 (= res!913249 (subseq!1068 newAcc!98 acc!866))))

(assert (= (and start!115876 res!913241) b!1369787))

(assert (= (and b!1369787 res!913245) b!1369783))

(assert (= (and b!1369783 res!913240) b!1369784))

(assert (= (and b!1369784 res!913244) b!1369785))

(assert (= (and b!1369785 res!913248) b!1369788))

(assert (= (and b!1369788 res!913243) b!1369789))

(assert (= (and b!1369789 res!913249) b!1369782))

(assert (= (and b!1369782 res!913242) b!1369786))

(assert (= (and b!1369786 res!913246) b!1369781))

(assert (= (and b!1369781 res!913247) b!1369780))

(declare-fun m!1253497 () Bool)

(assert (=> b!1369789 m!1253497))

(declare-fun m!1253499 () Bool)

(assert (=> b!1369783 m!1253499))

(declare-fun m!1253501 () Bool)

(assert (=> b!1369787 m!1253501))

(declare-fun m!1253503 () Bool)

(assert (=> b!1369784 m!1253503))

(declare-fun m!1253505 () Bool)

(assert (=> b!1369781 m!1253505))

(assert (=> b!1369781 m!1253505))

(declare-fun m!1253507 () Bool)

(assert (=> b!1369781 m!1253507))

(assert (=> b!1369780 m!1253505))

(assert (=> b!1369780 m!1253505))

(declare-fun m!1253509 () Bool)

(assert (=> b!1369780 m!1253509))

(declare-fun m!1253511 () Bool)

(assert (=> b!1369785 m!1253511))

(declare-fun m!1253513 () Bool)

(assert (=> b!1369788 m!1253513))

(declare-fun m!1253515 () Bool)

(assert (=> b!1369782 m!1253515))

(declare-fun m!1253517 () Bool)

(assert (=> b!1369782 m!1253517))

(declare-fun m!1253519 () Bool)

(assert (=> start!115876 m!1253519))

(check-sat (not b!1369788) (not b!1369780) (not b!1369787) (not b!1369781) (not b!1369785) (not b!1369789) (not b!1369784) (not start!115876) (not b!1369782) (not b!1369783))
(check-sat)
