; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115802 () Bool)

(assert start!115802)

(declare-fun b!1369180 () Bool)

(declare-fun res!912662 () Bool)

(declare-fun e!775641 () Bool)

(assert (=> b!1369180 (=> (not res!912662) (not e!775641))))

(declare-datatypes ((List!31965 0))(
  ( (Nil!31962) (Cons!31961 (h!33170 (_ BitVec 64)) (t!46659 List!31965)) )
))
(declare-fun newAcc!98 () List!31965)

(declare-fun acc!866 () List!31965)

(declare-fun subseq!1049 (List!31965 List!31965) Bool)

(assert (=> b!1369180 (= res!912662 (subseq!1049 newAcc!98 acc!866))))

(declare-fun b!1369181 () Bool)

(declare-fun res!912659 () Bool)

(assert (=> b!1369181 (=> (not res!912659) (not e!775641))))

(declare-fun contains!9647 (List!31965 (_ BitVec 64)) Bool)

(assert (=> b!1369181 (= res!912659 (not (contains!9647 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369182 () Bool)

(declare-fun res!912663 () Bool)

(assert (=> b!1369182 (=> (not res!912663) (not e!775641))))

(assert (=> b!1369182 (= res!912663 (not (contains!9647 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1369183 () Bool)

(declare-fun res!912658 () Bool)

(assert (=> b!1369183 (=> (not res!912658) (not e!775641))))

(assert (=> b!1369183 (= res!912658 (not (contains!9647 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!912661 () Bool)

(assert (=> start!115802 (=> (not res!912661) (not e!775641))))

(declare-datatypes ((array!92949 0))(
  ( (array!92950 (arr!44897 (Array (_ BitVec 32) (_ BitVec 64))) (size!45447 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!92949)

(declare-fun from!3239 () (_ BitVec 32))

(assert (=> start!115802 (= res!912661 (and (bvslt (size!45447 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45447 a!3861))))))

(assert (=> start!115802 e!775641))

(declare-fun array_inv!33925 (array!92949) Bool)

(assert (=> start!115802 (array_inv!33925 a!3861)))

(assert (=> start!115802 true))

(declare-fun b!1369184 () Bool)

(assert (=> b!1369184 (= e!775641 false)))

(declare-fun lt!602208 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92949 (_ BitVec 32) List!31965) Bool)

(assert (=> b!1369184 (= lt!602208 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45231 0))(
  ( (Unit!45232) )
))
(declare-fun lt!602209 () Unit!45231)

(declare-fun noDuplicateSubseq!236 (List!31965 List!31965) Unit!45231)

(assert (=> b!1369184 (= lt!602209 (noDuplicateSubseq!236 newAcc!98 acc!866))))

(declare-fun b!1369185 () Bool)

(declare-fun res!912664 () Bool)

(assert (=> b!1369185 (=> (not res!912664) (not e!775641))))

(declare-fun noDuplicate!2504 (List!31965) Bool)

(assert (=> b!1369185 (= res!912664 (noDuplicate!2504 acc!866))))

(declare-fun b!1369186 () Bool)

(declare-fun res!912660 () Bool)

(assert (=> b!1369186 (=> (not res!912660) (not e!775641))))

(assert (=> b!1369186 (= res!912660 (not (contains!9647 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115802 res!912661) b!1369185))

(assert (= (and b!1369185 res!912664) b!1369181))

(assert (= (and b!1369181 res!912659) b!1369182))

(assert (= (and b!1369182 res!912663) b!1369183))

(assert (= (and b!1369183 res!912658) b!1369186))

(assert (= (and b!1369186 res!912660) b!1369180))

(assert (= (and b!1369180 res!912662) b!1369184))

(declare-fun m!1253011 () Bool)

(assert (=> b!1369186 m!1253011))

(declare-fun m!1253013 () Bool)

(assert (=> b!1369181 m!1253013))

(declare-fun m!1253015 () Bool)

(assert (=> b!1369182 m!1253015))

(declare-fun m!1253017 () Bool)

(assert (=> start!115802 m!1253017))

(declare-fun m!1253019 () Bool)

(assert (=> b!1369185 m!1253019))

(declare-fun m!1253021 () Bool)

(assert (=> b!1369183 m!1253021))

(declare-fun m!1253023 () Bool)

(assert (=> b!1369184 m!1253023))

(declare-fun m!1253025 () Bool)

(assert (=> b!1369184 m!1253025))

(declare-fun m!1253027 () Bool)

(assert (=> b!1369180 m!1253027))

(push 1)

(assert (not b!1369184))

(assert (not b!1369180))

(assert (not b!1369182))

(assert (not b!1369183))

(assert (not b!1369181))

(assert (not start!115802))

(assert (not b!1369186))

(assert (not b!1369185))

(check-sat)

(pop 1)

