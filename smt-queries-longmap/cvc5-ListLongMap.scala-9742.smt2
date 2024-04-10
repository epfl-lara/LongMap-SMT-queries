; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115436 () Bool)

(assert start!115436)

(declare-fun b!1365022 () Bool)

(declare-fun res!908598 () Bool)

(declare-fun e!774115 () Bool)

(assert (=> b!1365022 (=> (not res!908598) (not e!774115))))

(declare-datatypes ((List!31875 0))(
  ( (Nil!31872) (Cons!31871 (h!33080 (_ BitVec 64)) (t!46569 List!31875)) )
))
(declare-fun acc!866 () List!31875)

(declare-fun noDuplicate!2414 (List!31875) Bool)

(assert (=> b!1365022 (= res!908598 (noDuplicate!2414 acc!866))))

(declare-fun b!1365023 () Bool)

(assert (=> b!1365023 (= e!774115 false)))

(declare-datatypes ((Unit!45051 0))(
  ( (Unit!45052) )
))
(declare-fun lt!601177 () Unit!45051)

(declare-fun newAcc!98 () List!31875)

(declare-fun noDuplicateSubseq!146 (List!31875 List!31875) Unit!45051)

(assert (=> b!1365023 (= lt!601177 (noDuplicateSubseq!146 newAcc!98 acc!866))))

(declare-fun b!1365024 () Bool)

(declare-fun res!908601 () Bool)

(assert (=> b!1365024 (=> (not res!908601) (not e!774115))))

(declare-fun contains!9557 (List!31875 (_ BitVec 64)) Bool)

(assert (=> b!1365024 (= res!908601 (not (contains!9557 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!908596 () Bool)

(assert (=> start!115436 (=> (not res!908596) (not e!774115))))

(declare-datatypes ((array!92757 0))(
  ( (array!92758 (arr!44807 (Array (_ BitVec 32) (_ BitVec 64))) (size!45357 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92757)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115436 (= res!908596 (and (bvslt (size!45357 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45357 a!3861))))))

(assert (=> start!115436 e!774115))

(declare-fun array_inv!33835 (array!92757) Bool)

(assert (=> start!115436 (array_inv!33835 a!3861)))

(assert (=> start!115436 true))

(declare-fun b!1365025 () Bool)

(declare-fun res!908602 () Bool)

(assert (=> b!1365025 (=> (not res!908602) (not e!774115))))

(assert (=> b!1365025 (= res!908602 (not (contains!9557 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365026 () Bool)

(declare-fun res!908600 () Bool)

(assert (=> b!1365026 (=> (not res!908600) (not e!774115))))

(assert (=> b!1365026 (= res!908600 (not (contains!9557 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365027 () Bool)

(declare-fun res!908599 () Bool)

(assert (=> b!1365027 (=> (not res!908599) (not e!774115))))

(declare-fun subseq!959 (List!31875 List!31875) Bool)

(assert (=> b!1365027 (= res!908599 (subseq!959 newAcc!98 acc!866))))

(declare-fun b!1365028 () Bool)

(declare-fun res!908597 () Bool)

(assert (=> b!1365028 (=> (not res!908597) (not e!774115))))

(assert (=> b!1365028 (= res!908597 (not (contains!9557 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115436 res!908596) b!1365022))

(assert (= (and b!1365022 res!908598) b!1365025))

(assert (= (and b!1365025 res!908602) b!1365026))

(assert (= (and b!1365026 res!908600) b!1365028))

(assert (= (and b!1365028 res!908597) b!1365024))

(assert (= (and b!1365024 res!908601) b!1365027))

(assert (= (and b!1365027 res!908599) b!1365023))

(declare-fun m!1249693 () Bool)

(assert (=> b!1365023 m!1249693))

(declare-fun m!1249695 () Bool)

(assert (=> b!1365025 m!1249695))

(declare-fun m!1249697 () Bool)

(assert (=> b!1365024 m!1249697))

(declare-fun m!1249699 () Bool)

(assert (=> b!1365027 m!1249699))

(declare-fun m!1249701 () Bool)

(assert (=> b!1365022 m!1249701))

(declare-fun m!1249703 () Bool)

(assert (=> b!1365026 m!1249703))

(declare-fun m!1249705 () Bool)

(assert (=> start!115436 m!1249705))

(declare-fun m!1249707 () Bool)

(assert (=> b!1365028 m!1249707))

(push 1)

(assert (not b!1365024))

(assert (not b!1365023))

(assert (not b!1365025))

(assert (not b!1365022))

(assert (not b!1365028))

(assert (not start!115436))

(assert (not b!1365027))

(assert (not b!1365026))

(check-sat)

(pop 1)

