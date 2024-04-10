; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115868 () Bool)

(assert start!115868)

(declare-fun b!1369681 () Bool)

(declare-fun res!913146 () Bool)

(declare-fun e!775891 () Bool)

(assert (=> b!1369681 (=> (not res!913146) (not e!775891))))

(declare-datatypes ((List!31980 0))(
  ( (Nil!31977) (Cons!31976 (h!33185 (_ BitVec 64)) (t!46674 List!31980)) )
))
(declare-fun acc!866 () List!31980)

(declare-fun noDuplicate!2519 (List!31980) Bool)

(assert (=> b!1369681 (= res!913146 (noDuplicate!2519 acc!866))))

(declare-fun b!1369682 () Bool)

(declare-fun res!913141 () Bool)

(assert (=> b!1369682 (=> (not res!913141) (not e!775891))))

(declare-fun newAcc!98 () List!31980)

(declare-fun subseq!1064 (List!31980 List!31980) Bool)

(assert (=> b!1369682 (= res!913141 (subseq!1064 newAcc!98 acc!866))))

(declare-fun b!1369683 () Bool)

(declare-fun res!913143 () Bool)

(assert (=> b!1369683 (=> (not res!913143) (not e!775891))))

(declare-fun contains!9662 (List!31980 (_ BitVec 64)) Bool)

(assert (=> b!1369683 (= res!913143 (not (contains!9662 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369684 () Bool)

(declare-fun res!913147 () Bool)

(assert (=> b!1369684 (=> (not res!913147) (not e!775891))))

(assert (=> b!1369684 (= res!913147 (not (contains!9662 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369685 () Bool)

(declare-fun res!913142 () Bool)

(assert (=> b!1369685 (=> (not res!913142) (not e!775891))))

(assert (=> b!1369685 (= res!913142 (not (contains!9662 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369686 () Bool)

(assert (=> b!1369686 (= e!775891 false)))

(declare-datatypes ((array!92982 0))(
  ( (array!92983 (arr!44912 (Array (_ BitVec 32) (_ BitVec 64))) (size!45462 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92982)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun lt!602317 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92982 (_ BitVec 32) List!31980) Bool)

(assert (=> b!1369686 (= lt!602317 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45261 0))(
  ( (Unit!45262) )
))
(declare-fun lt!602316 () Unit!45261)

(declare-fun noDuplicateSubseq!251 (List!31980 List!31980) Unit!45261)

(assert (=> b!1369686 (= lt!602316 (noDuplicateSubseq!251 newAcc!98 acc!866))))

(declare-fun res!913145 () Bool)

(assert (=> start!115868 (=> (not res!913145) (not e!775891))))

(assert (=> start!115868 (= res!913145 (and (bvslt (size!45462 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45462 a!3861))))))

(assert (=> start!115868 e!775891))

(declare-fun array_inv!33940 (array!92982) Bool)

(assert (=> start!115868 (array_inv!33940 a!3861)))

(assert (=> start!115868 true))

(declare-fun b!1369687 () Bool)

(declare-fun res!913144 () Bool)

(assert (=> b!1369687 (=> (not res!913144) (not e!775891))))

(assert (=> b!1369687 (= res!913144 (not (contains!9662 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115868 res!913145) b!1369681))

(assert (= (and b!1369681 res!913146) b!1369684))

(assert (= (and b!1369684 res!913147) b!1369683))

(assert (= (and b!1369683 res!913143) b!1369685))

(assert (= (and b!1369685 res!913142) b!1369687))

(assert (= (and b!1369687 res!913144) b!1369682))

(assert (= (and b!1369682 res!913141) b!1369686))

(declare-fun m!1253419 () Bool)

(assert (=> b!1369685 m!1253419))

(declare-fun m!1253421 () Bool)

(assert (=> start!115868 m!1253421))

(declare-fun m!1253423 () Bool)

(assert (=> b!1369681 m!1253423))

(declare-fun m!1253425 () Bool)

(assert (=> b!1369687 m!1253425))

(declare-fun m!1253427 () Bool)

(assert (=> b!1369682 m!1253427))

(declare-fun m!1253429 () Bool)

(assert (=> b!1369684 m!1253429))

(declare-fun m!1253431 () Bool)

(assert (=> b!1369686 m!1253431))

(declare-fun m!1253433 () Bool)

(assert (=> b!1369686 m!1253433))

(declare-fun m!1253435 () Bool)

(assert (=> b!1369683 m!1253435))

(push 1)

(assert (not b!1369686))

(assert (not b!1369681))

(assert (not b!1369682))

(assert (not b!1369687))

(assert (not b!1369684))

(assert (not start!115868))

(assert (not b!1369685))

(assert (not b!1369683))

(check-sat)

(pop 1)

