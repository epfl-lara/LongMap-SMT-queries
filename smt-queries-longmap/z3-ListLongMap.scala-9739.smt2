; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115420 () Bool)

(assert start!115420)

(declare-fun b!1364854 () Bool)

(declare-fun res!908430 () Bool)

(declare-fun e!774067 () Bool)

(assert (=> b!1364854 (=> (not res!908430) (not e!774067))))

(declare-datatypes ((List!31867 0))(
  ( (Nil!31864) (Cons!31863 (h!33072 (_ BitVec 64)) (t!46561 List!31867)) )
))
(declare-fun newAcc!98 () List!31867)

(declare-fun contains!9549 (List!31867 (_ BitVec 64)) Bool)

(assert (=> b!1364854 (= res!908430 (not (contains!9549 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364855 () Bool)

(declare-fun res!908433 () Bool)

(assert (=> b!1364855 (=> (not res!908433) (not e!774067))))

(declare-fun acc!866 () List!31867)

(declare-fun subseq!951 (List!31867 List!31867) Bool)

(assert (=> b!1364855 (= res!908433 (subseq!951 newAcc!98 acc!866))))

(declare-fun b!1364856 () Bool)

(declare-fun res!908429 () Bool)

(assert (=> b!1364856 (=> (not res!908429) (not e!774067))))

(assert (=> b!1364856 (= res!908429 (not (contains!9549 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364857 () Bool)

(declare-fun res!908434 () Bool)

(assert (=> b!1364857 (=> (not res!908434) (not e!774067))))

(assert (=> b!1364857 (= res!908434 (not (contains!9549 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364858 () Bool)

(declare-fun res!908428 () Bool)

(assert (=> b!1364858 (=> (not res!908428) (not e!774067))))

(declare-fun noDuplicate!2406 (List!31867) Bool)

(assert (=> b!1364858 (= res!908428 (noDuplicate!2406 acc!866))))

(declare-fun b!1364859 () Bool)

(assert (=> b!1364859 (= e!774067 false)))

(declare-datatypes ((Unit!45035 0))(
  ( (Unit!45036) )
))
(declare-fun lt!601153 () Unit!45035)

(declare-fun noDuplicateSubseq!138 (List!31867 List!31867) Unit!45035)

(assert (=> b!1364859 (= lt!601153 (noDuplicateSubseq!138 newAcc!98 acc!866))))

(declare-fun res!908431 () Bool)

(assert (=> start!115420 (=> (not res!908431) (not e!774067))))

(declare-datatypes ((array!92741 0))(
  ( (array!92742 (arr!44799 (Array (_ BitVec 32) (_ BitVec 64))) (size!45349 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92741)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115420 (= res!908431 (and (bvslt (size!45349 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45349 a!3861))))))

(assert (=> start!115420 e!774067))

(declare-fun array_inv!33827 (array!92741) Bool)

(assert (=> start!115420 (array_inv!33827 a!3861)))

(assert (=> start!115420 true))

(declare-fun b!1364860 () Bool)

(declare-fun res!908432 () Bool)

(assert (=> b!1364860 (=> (not res!908432) (not e!774067))))

(assert (=> b!1364860 (= res!908432 (not (contains!9549 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115420 res!908431) b!1364858))

(assert (= (and b!1364858 res!908428) b!1364860))

(assert (= (and b!1364860 res!908432) b!1364857))

(assert (= (and b!1364857 res!908434) b!1364854))

(assert (= (and b!1364854 res!908430) b!1364856))

(assert (= (and b!1364856 res!908429) b!1364855))

(assert (= (and b!1364855 res!908433) b!1364859))

(declare-fun m!1249565 () Bool)

(assert (=> b!1364855 m!1249565))

(declare-fun m!1249567 () Bool)

(assert (=> b!1364859 m!1249567))

(declare-fun m!1249569 () Bool)

(assert (=> b!1364858 m!1249569))

(declare-fun m!1249571 () Bool)

(assert (=> b!1364854 m!1249571))

(declare-fun m!1249573 () Bool)

(assert (=> b!1364857 m!1249573))

(declare-fun m!1249575 () Bool)

(assert (=> b!1364856 m!1249575))

(declare-fun m!1249577 () Bool)

(assert (=> start!115420 m!1249577))

(declare-fun m!1249579 () Bool)

(assert (=> b!1364860 m!1249579))

(check-sat (not b!1364859) (not b!1364857) (not b!1364860) (not b!1364855) (not b!1364856) (not b!1364854) (not b!1364858) (not start!115420))
(check-sat)
