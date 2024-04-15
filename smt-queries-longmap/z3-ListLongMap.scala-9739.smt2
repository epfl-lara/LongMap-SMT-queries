; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115408 () Bool)

(assert start!115408)

(declare-fun b!1364761 () Bool)

(declare-fun res!908380 () Bool)

(declare-fun e!774026 () Bool)

(assert (=> b!1364761 (=> (not res!908380) (not e!774026))))

(declare-datatypes ((List!31919 0))(
  ( (Nil!31916) (Cons!31915 (h!33124 (_ BitVec 64)) (t!46605 List!31919)) )
))
(declare-fun acc!866 () List!31919)

(declare-fun contains!9512 (List!31919 (_ BitVec 64)) Bool)

(assert (=> b!1364761 (= res!908380 (not (contains!9512 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364762 () Bool)

(declare-fun res!908378 () Bool)

(assert (=> b!1364762 (=> (not res!908378) (not e!774026))))

(assert (=> b!1364762 (= res!908378 (not (contains!9512 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364763 () Bool)

(declare-fun res!908379 () Bool)

(assert (=> b!1364763 (=> (not res!908379) (not e!774026))))

(declare-fun newAcc!98 () List!31919)

(assert (=> b!1364763 (= res!908379 (not (contains!9512 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364764 () Bool)

(declare-fun res!908382 () Bool)

(assert (=> b!1364764 (=> (not res!908382) (not e!774026))))

(assert (=> b!1364764 (= res!908382 (not (contains!9512 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364765 () Bool)

(assert (=> b!1364765 (= e!774026 false)))

(declare-datatypes ((Unit!44874 0))(
  ( (Unit!44875) )
))
(declare-fun lt!600963 () Unit!44874)

(declare-fun noDuplicateSubseq!137 (List!31919 List!31919) Unit!44874)

(assert (=> b!1364765 (= lt!600963 (noDuplicateSubseq!137 newAcc!98 acc!866))))

(declare-fun b!1364766 () Bool)

(declare-fun res!908383 () Bool)

(assert (=> b!1364766 (=> (not res!908383) (not e!774026))))

(declare-fun noDuplicate!2427 (List!31919) Bool)

(assert (=> b!1364766 (= res!908383 (noDuplicate!2427 acc!866))))

(declare-fun res!908384 () Bool)

(assert (=> start!115408 (=> (not res!908384) (not e!774026))))

(declare-datatypes ((array!92688 0))(
  ( (array!92689 (arr!44773 (Array (_ BitVec 32) (_ BitVec 64))) (size!45325 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92688)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115408 (= res!908384 (and (bvslt (size!45325 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45325 a!3861))))))

(assert (=> start!115408 e!774026))

(declare-fun array_inv!34006 (array!92688) Bool)

(assert (=> start!115408 (array_inv!34006 a!3861)))

(assert (=> start!115408 true))

(declare-fun b!1364767 () Bool)

(declare-fun res!908381 () Bool)

(assert (=> b!1364767 (=> (not res!908381) (not e!774026))))

(declare-fun subseq!950 (List!31919 List!31919) Bool)

(assert (=> b!1364767 (= res!908381 (subseq!950 newAcc!98 acc!866))))

(assert (= (and start!115408 res!908384) b!1364766))

(assert (= (and b!1364766 res!908383) b!1364761))

(assert (= (and b!1364761 res!908380) b!1364762))

(assert (= (and b!1364762 res!908378) b!1364763))

(assert (= (and b!1364763 res!908379) b!1364764))

(assert (= (and b!1364764 res!908382) b!1364767))

(assert (= (and b!1364767 res!908381) b!1364765))

(declare-fun m!1249023 () Bool)

(assert (=> b!1364763 m!1249023))

(declare-fun m!1249025 () Bool)

(assert (=> b!1364761 m!1249025))

(declare-fun m!1249027 () Bool)

(assert (=> b!1364767 m!1249027))

(declare-fun m!1249029 () Bool)

(assert (=> b!1364766 m!1249029))

(declare-fun m!1249031 () Bool)

(assert (=> b!1364762 m!1249031))

(declare-fun m!1249033 () Bool)

(assert (=> b!1364765 m!1249033))

(declare-fun m!1249035 () Bool)

(assert (=> start!115408 m!1249035))

(declare-fun m!1249037 () Bool)

(assert (=> b!1364764 m!1249037))

(check-sat (not b!1364764) (not b!1364766) (not b!1364765) (not b!1364763) (not start!115408) (not b!1364767) (not b!1364761) (not b!1364762))
(check-sat)
