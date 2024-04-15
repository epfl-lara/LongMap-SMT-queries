; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116260 () Bool)

(assert start!116260)

(declare-fun res!915913 () Bool)

(declare-fun e!777623 () Bool)

(assert (=> start!116260 (=> (not res!915913) (not e!777623))))

(declare-datatypes ((array!93036 0))(
  ( (array!93037 (arr!44929 (Array (_ BitVec 32) (_ BitVec 64))) (size!45481 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93036)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!116260 (= res!915913 (and (bvslt (size!45481 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45481 a!3861))))))

(assert (=> start!116260 e!777623))

(declare-fun array_inv!34162 (array!93036) Bool)

(assert (=> start!116260 (array_inv!34162 a!3861)))

(assert (=> start!116260 true))

(declare-fun b!1372597 () Bool)

(declare-fun res!915911 () Bool)

(assert (=> b!1372597 (=> (not res!915911) (not e!777623))))

(declare-datatypes ((List!32075 0))(
  ( (Nil!32072) (Cons!32071 (h!33280 (_ BitVec 64)) (t!46761 List!32075)) )
))
(declare-fun newAcc!98 () List!32075)

(declare-fun contains!9668 (List!32075 (_ BitVec 64)) Bool)

(assert (=> b!1372597 (= res!915911 (not (contains!9668 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372598 () Bool)

(assert (=> b!1372598 (= e!777623 false)))

(declare-fun lt!602717 () Bool)

(declare-fun acc!866 () List!32075)

(declare-fun arrayNoDuplicates!0 (array!93036 (_ BitVec 32) List!32075) Bool)

(assert (=> b!1372598 (= lt!602717 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45186 0))(
  ( (Unit!45187) )
))
(declare-fun lt!602718 () Unit!45186)

(declare-fun noDuplicateSubseq!293 (List!32075 List!32075) Unit!45186)

(assert (=> b!1372598 (= lt!602718 (noDuplicateSubseq!293 newAcc!98 acc!866))))

(declare-fun b!1372599 () Bool)

(declare-fun res!915909 () Bool)

(assert (=> b!1372599 (=> (not res!915909) (not e!777623))))

(assert (=> b!1372599 (= res!915909 (not (contains!9668 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372600 () Bool)

(declare-fun res!915908 () Bool)

(assert (=> b!1372600 (=> (not res!915908) (not e!777623))))

(declare-fun noDuplicate!2583 (List!32075) Bool)

(assert (=> b!1372600 (= res!915908 (noDuplicate!2583 acc!866))))

(declare-fun b!1372601 () Bool)

(declare-fun res!915914 () Bool)

(assert (=> b!1372601 (=> (not res!915914) (not e!777623))))

(assert (=> b!1372601 (= res!915914 (not (contains!9668 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372602 () Bool)

(declare-fun res!915910 () Bool)

(assert (=> b!1372602 (=> (not res!915910) (not e!777623))))

(assert (=> b!1372602 (= res!915910 (not (contains!9668 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1372603 () Bool)

(declare-fun res!915912 () Bool)

(assert (=> b!1372603 (=> (not res!915912) (not e!777623))))

(declare-fun subseq!1106 (List!32075 List!32075) Bool)

(assert (=> b!1372603 (= res!915912 (subseq!1106 newAcc!98 acc!866))))

(assert (= (and start!116260 res!915913) b!1372600))

(assert (= (and b!1372600 res!915908) b!1372599))

(assert (= (and b!1372599 res!915909) b!1372602))

(assert (= (and b!1372602 res!915910) b!1372597))

(assert (= (and b!1372597 res!915911) b!1372601))

(assert (= (and b!1372601 res!915914) b!1372603))

(assert (= (and b!1372603 res!915912) b!1372598))

(declare-fun m!1255545 () Bool)

(assert (=> b!1372600 m!1255545))

(declare-fun m!1255547 () Bool)

(assert (=> b!1372597 m!1255547))

(declare-fun m!1255549 () Bool)

(assert (=> b!1372601 m!1255549))

(declare-fun m!1255551 () Bool)

(assert (=> b!1372599 m!1255551))

(declare-fun m!1255553 () Bool)

(assert (=> start!116260 m!1255553))

(declare-fun m!1255555 () Bool)

(assert (=> b!1372603 m!1255555))

(declare-fun m!1255557 () Bool)

(assert (=> b!1372602 m!1255557))

(declare-fun m!1255559 () Bool)

(assert (=> b!1372598 m!1255559))

(declare-fun m!1255561 () Bool)

(assert (=> b!1372598 m!1255561))

(check-sat (not b!1372603) (not b!1372599) (not b!1372601) (not b!1372602) (not b!1372598) (not b!1372597) (not start!116260) (not b!1372600))
(check-sat)
