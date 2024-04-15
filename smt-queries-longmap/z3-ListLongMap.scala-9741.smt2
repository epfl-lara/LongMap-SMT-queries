; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115420 () Bool)

(assert start!115420)

(declare-fun res!908508 () Bool)

(declare-fun e!774062 () Bool)

(assert (=> start!115420 (=> (not res!908508) (not e!774062))))

(declare-datatypes ((array!92700 0))(
  ( (array!92701 (arr!44779 (Array (_ BitVec 32) (_ BitVec 64))) (size!45331 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92700)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115420 (= res!908508 (and (bvslt (size!45331 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45331 a!3861))))))

(assert (=> start!115420 e!774062))

(declare-fun array_inv!34012 (array!92700) Bool)

(assert (=> start!115420 (array_inv!34012 a!3861)))

(assert (=> start!115420 true))

(declare-fun b!1364887 () Bool)

(declare-fun res!908505 () Bool)

(assert (=> b!1364887 (=> (not res!908505) (not e!774062))))

(declare-datatypes ((List!31925 0))(
  ( (Nil!31922) (Cons!31921 (h!33130 (_ BitVec 64)) (t!46611 List!31925)) )
))
(declare-fun newAcc!98 () List!31925)

(declare-fun acc!866 () List!31925)

(declare-fun subseq!956 (List!31925 List!31925) Bool)

(assert (=> b!1364887 (= res!908505 (subseq!956 newAcc!98 acc!866))))

(declare-fun b!1364888 () Bool)

(declare-fun res!908510 () Bool)

(assert (=> b!1364888 (=> (not res!908510) (not e!774062))))

(declare-fun contains!9518 (List!31925 (_ BitVec 64)) Bool)

(assert (=> b!1364888 (= res!908510 (not (contains!9518 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364889 () Bool)

(assert (=> b!1364889 (= e!774062 false)))

(declare-datatypes ((Unit!44886 0))(
  ( (Unit!44887) )
))
(declare-fun lt!600981 () Unit!44886)

(declare-fun noDuplicateSubseq!143 (List!31925 List!31925) Unit!44886)

(assert (=> b!1364889 (= lt!600981 (noDuplicateSubseq!143 newAcc!98 acc!866))))

(declare-fun b!1364890 () Bool)

(declare-fun res!908509 () Bool)

(assert (=> b!1364890 (=> (not res!908509) (not e!774062))))

(declare-fun noDuplicate!2433 (List!31925) Bool)

(assert (=> b!1364890 (= res!908509 (noDuplicate!2433 acc!866))))

(declare-fun b!1364891 () Bool)

(declare-fun res!908504 () Bool)

(assert (=> b!1364891 (=> (not res!908504) (not e!774062))))

(assert (=> b!1364891 (= res!908504 (not (contains!9518 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364892 () Bool)

(declare-fun res!908507 () Bool)

(assert (=> b!1364892 (=> (not res!908507) (not e!774062))))

(assert (=> b!1364892 (= res!908507 (not (contains!9518 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1364893 () Bool)

(declare-fun res!908506 () Bool)

(assert (=> b!1364893 (=> (not res!908506) (not e!774062))))

(assert (=> b!1364893 (= res!908506 (not (contains!9518 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115420 res!908508) b!1364890))

(assert (= (and b!1364890 res!908509) b!1364891))

(assert (= (and b!1364891 res!908504) b!1364888))

(assert (= (and b!1364888 res!908510) b!1364892))

(assert (= (and b!1364892 res!908507) b!1364893))

(assert (= (and b!1364893 res!908506) b!1364887))

(assert (= (and b!1364887 res!908505) b!1364889))

(declare-fun m!1249119 () Bool)

(assert (=> b!1364887 m!1249119))

(declare-fun m!1249121 () Bool)

(assert (=> b!1364890 m!1249121))

(declare-fun m!1249123 () Bool)

(assert (=> b!1364893 m!1249123))

(declare-fun m!1249125 () Bool)

(assert (=> start!115420 m!1249125))

(declare-fun m!1249127 () Bool)

(assert (=> b!1364891 m!1249127))

(declare-fun m!1249129 () Bool)

(assert (=> b!1364889 m!1249129))

(declare-fun m!1249131 () Bool)

(assert (=> b!1364888 m!1249131))

(declare-fun m!1249133 () Bool)

(assert (=> b!1364892 m!1249133))

(check-sat (not b!1364892) (not b!1364890) (not b!1364889) (not b!1364888) (not b!1364893) (not start!115420) (not b!1364887) (not b!1364891))
(check-sat)
