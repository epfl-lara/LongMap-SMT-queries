; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115954 () Bool)

(assert start!115954)

(declare-fun b!1369877 () Bool)

(declare-fun res!912611 () Bool)

(declare-fun e!776213 () Bool)

(assert (=> b!1369877 (=> (not res!912611) (not e!776213))))

(declare-datatypes ((List!31993 0))(
  ( (Nil!31990) (Cons!31989 (h!33207 (_ BitVec 64)) (t!46679 List!31993)) )
))
(declare-fun newAcc!98 () List!31993)

(declare-fun contains!9678 (List!31993 (_ BitVec 64)) Bool)

(assert (=> b!1369877 (= res!912611 (not (contains!9678 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369878 () Bool)

(declare-fun res!912615 () Bool)

(assert (=> b!1369878 (=> (not res!912615) (not e!776213))))

(assert (=> b!1369878 (= res!912615 (not (contains!9678 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369879 () Bool)

(declare-fun e!776214 () Bool)

(assert (=> b!1369879 (= e!776214 (not true))))

(declare-datatypes ((array!93037 0))(
  ( (array!93038 (arr!44938 (Array (_ BitVec 32) (_ BitVec 64))) (size!45489 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93037)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!93037 (_ BitVec 32) List!31993) Bool)

(assert (=> b!1369879 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) newAcc!98)))

(declare-datatypes ((Unit!45146 0))(
  ( (Unit!45147) )
))
(declare-fun lt!602567 () Unit!45146)

(declare-fun acc!866 () List!31993)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!93037 List!31993 List!31993 (_ BitVec 32)) Unit!45146)

(assert (=> b!1369879 (= lt!602567 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3861 acc!866 newAcc!98 (bvadd #b00000000000000000000000000000001 from!3239)))))

(declare-fun b!1369880 () Bool)

(declare-fun res!912610 () Bool)

(assert (=> b!1369880 (=> (not res!912610) (not e!776214))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1369880 (= res!912610 (not (validKeyInArray!0 (select (arr!44938 a!3861) from!3239))))))

(declare-fun b!1369881 () Bool)

(declare-fun res!912604 () Bool)

(assert (=> b!1369881 (=> (not res!912604) (not e!776213))))

(declare-fun noDuplicate!2509 (List!31993) Bool)

(assert (=> b!1369881 (= res!912604 (noDuplicate!2509 acc!866))))

(declare-fun b!1369882 () Bool)

(declare-fun res!912613 () Bool)

(assert (=> b!1369882 (=> (not res!912613) (not e!776213))))

(assert (=> b!1369882 (= res!912613 (not (contains!9678 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369883 () Bool)

(declare-fun res!912606 () Bool)

(assert (=> b!1369883 (=> (not res!912606) (not e!776213))))

(declare-fun subseq!1037 (List!31993 List!31993) Bool)

(assert (=> b!1369883 (= res!912606 (subseq!1037 newAcc!98 acc!866))))

(declare-fun res!912608 () Bool)

(assert (=> start!115954 (=> (not res!912608) (not e!776213))))

(assert (=> start!115954 (= res!912608 (and (bvslt (size!45489 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45489 a!3861))))))

(assert (=> start!115954 e!776213))

(declare-fun array_inv!34219 (array!93037) Bool)

(assert (=> start!115954 (array_inv!34219 a!3861)))

(assert (=> start!115954 true))

(declare-fun b!1369884 () Bool)

(declare-fun res!912614 () Bool)

(assert (=> b!1369884 (=> (not res!912614) (not e!776214))))

(assert (=> b!1369884 (= res!912614 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(declare-fun b!1369885 () Bool)

(declare-fun res!912607 () Bool)

(assert (=> b!1369885 (=> (not res!912607) (not e!776214))))

(assert (=> b!1369885 (= res!912607 (bvslt from!3239 (size!45489 a!3861)))))

(declare-fun b!1369886 () Bool)

(declare-fun res!912612 () Bool)

(assert (=> b!1369886 (=> (not res!912612) (not e!776214))))

(assert (=> b!1369886 (= res!912612 (arrayNoDuplicates!0 a!3861 (bvadd #b00000000000000000000000000000001 from!3239) acc!866))))

(declare-fun b!1369887 () Bool)

(declare-fun res!912609 () Bool)

(assert (=> b!1369887 (=> (not res!912609) (not e!776213))))

(assert (=> b!1369887 (= res!912609 (not (contains!9678 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369888 () Bool)

(assert (=> b!1369888 (= e!776213 e!776214)))

(declare-fun res!912605 () Bool)

(assert (=> b!1369888 (=> (not res!912605) (not e!776214))))

(assert (=> b!1369888 (= res!912605 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-fun lt!602568 () Unit!45146)

(declare-fun noDuplicateSubseq!224 (List!31993 List!31993) Unit!45146)

(assert (=> b!1369888 (= lt!602568 (noDuplicateSubseq!224 newAcc!98 acc!866))))

(assert (= (and start!115954 res!912608) b!1369881))

(assert (= (and b!1369881 res!912604) b!1369887))

(assert (= (and b!1369887 res!912609) b!1369882))

(assert (= (and b!1369882 res!912613) b!1369877))

(assert (= (and b!1369877 res!912611) b!1369878))

(assert (= (and b!1369878 res!912615) b!1369883))

(assert (= (and b!1369883 res!912606) b!1369888))

(assert (= (and b!1369888 res!912605) b!1369885))

(assert (= (and b!1369885 res!912607) b!1369880))

(assert (= (and b!1369880 res!912610) b!1369884))

(assert (= (and b!1369884 res!912614) b!1369886))

(assert (= (and b!1369886 res!912612) b!1369879))

(declare-fun m!1254103 () Bool)

(assert (=> b!1369887 m!1254103))

(declare-fun m!1254105 () Bool)

(assert (=> b!1369882 m!1254105))

(declare-fun m!1254107 () Bool)

(assert (=> b!1369883 m!1254107))

(declare-fun m!1254109 () Bool)

(assert (=> b!1369879 m!1254109))

(declare-fun m!1254111 () Bool)

(assert (=> b!1369879 m!1254111))

(declare-fun m!1254113 () Bool)

(assert (=> b!1369886 m!1254113))

(declare-fun m!1254115 () Bool)

(assert (=> b!1369880 m!1254115))

(assert (=> b!1369880 m!1254115))

(declare-fun m!1254117 () Bool)

(assert (=> b!1369880 m!1254117))

(declare-fun m!1254119 () Bool)

(assert (=> b!1369881 m!1254119))

(declare-fun m!1254121 () Bool)

(assert (=> b!1369888 m!1254121))

(declare-fun m!1254123 () Bool)

(assert (=> b!1369888 m!1254123))

(declare-fun m!1254125 () Bool)

(assert (=> b!1369877 m!1254125))

(declare-fun m!1254127 () Bool)

(assert (=> start!115954 m!1254127))

(declare-fun m!1254129 () Bool)

(assert (=> b!1369878 m!1254129))

(check-sat (not b!1369886) (not b!1369883) (not b!1369882) (not b!1369880) (not b!1369877) (not b!1369888) (not b!1369879) (not b!1369881) (not b!1369878) (not start!115954) (not b!1369887))
(check-sat)
