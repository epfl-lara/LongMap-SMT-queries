; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59832 () Bool)

(assert start!59832)

(declare-fun b!661172 () Bool)

(declare-fun res!429408 () Bool)

(declare-fun e!379765 () Bool)

(assert (=> b!661172 (=> (not res!429408) (not e!379765))))

(declare-datatypes ((List!12717 0))(
  ( (Nil!12714) (Cons!12713 (h!13758 (_ BitVec 64)) (t!18936 List!12717)) )
))
(declare-fun acc!681 () List!12717)

(declare-fun contains!3239 (List!12717 (_ BitVec 64)) Bool)

(assert (=> b!661172 (= res!429408 (not (contains!3239 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661173 () Bool)

(declare-fun res!429396 () Bool)

(assert (=> b!661173 (=> (not res!429396) (not e!379765))))

(declare-datatypes ((array!38890 0))(
  ( (array!38891 (arr!18637 (Array (_ BitVec 32) (_ BitVec 64))) (size!19002 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38890)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!38890 (_ BitVec 32) List!12717) Bool)

(assert (=> b!661173 (= res!429396 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661175 () Bool)

(declare-fun res!429401 () Bool)

(assert (=> b!661175 (=> (not res!429401) (not e!379765))))

(assert (=> b!661175 (= res!429401 (not (contains!3239 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661176 () Bool)

(declare-fun e!379763 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!661176 (= e!379763 (not (contains!3239 acc!681 k!2843)))))

(declare-fun b!661177 () Bool)

(declare-fun res!429406 () Bool)

(assert (=> b!661177 (=> (not res!429406) (not e!379765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661177 (= res!429406 (validKeyInArray!0 k!2843))))

(declare-fun b!661178 () Bool)

(declare-fun res!429399 () Bool)

(assert (=> b!661178 (=> (not res!429399) (not e!379765))))

(declare-fun arrayContainsKey!0 (array!38890 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661178 (= res!429399 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661179 () Bool)

(declare-fun res!429403 () Bool)

(assert (=> b!661179 (=> (not res!429403) (not e!379765))))

(assert (=> b!661179 (= res!429403 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12714))))

(declare-fun b!661180 () Bool)

(declare-fun e!379762 () Bool)

(assert (=> b!661180 (= e!379762 e!379763)))

(declare-fun res!429409 () Bool)

(assert (=> b!661180 (=> (not res!429409) (not e!379763))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!661180 (= res!429409 (bvsle from!3004 i!1382))))

(declare-fun b!661181 () Bool)

(declare-fun res!429402 () Bool)

(assert (=> b!661181 (=> (not res!429402) (not e!379765))))

(assert (=> b!661181 (= res!429402 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19002 a!3626))))))

(declare-fun b!661182 () Bool)

(declare-fun res!429398 () Bool)

(assert (=> b!661182 (=> (not res!429398) (not e!379765))))

(assert (=> b!661182 (= res!429398 e!379762)))

(declare-fun res!429400 () Bool)

(assert (=> b!661182 (=> res!429400 e!379762)))

(declare-fun e!379764 () Bool)

(assert (=> b!661182 (= res!429400 e!379764)))

(declare-fun res!429407 () Bool)

(assert (=> b!661182 (=> (not res!429407) (not e!379764))))

(assert (=> b!661182 (= res!429407 (bvsgt from!3004 i!1382))))

(declare-fun res!429397 () Bool)

(assert (=> start!59832 (=> (not res!429397) (not e!379765))))

(assert (=> start!59832 (= res!429397 (and (bvslt (size!19002 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19002 a!3626))))))

(assert (=> start!59832 e!379765))

(assert (=> start!59832 true))

(declare-fun array_inv!14520 (array!38890) Bool)

(assert (=> start!59832 (array_inv!14520 a!3626)))

(declare-fun b!661174 () Bool)

(declare-fun res!429405 () Bool)

(assert (=> b!661174 (=> (not res!429405) (not e!379765))))

(declare-fun noDuplicate!508 (List!12717) Bool)

(assert (=> b!661174 (= res!429405 (noDuplicate!508 acc!681))))

(declare-fun b!661183 () Bool)

(declare-fun res!429404 () Bool)

(assert (=> b!661183 (=> (not res!429404) (not e!379765))))

(assert (=> b!661183 (= res!429404 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19002 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661184 () Bool)

(assert (=> b!661184 (= e!379764 (contains!3239 acc!681 k!2843))))

(declare-fun b!661185 () Bool)

(assert (=> b!661185 (= e!379765 (not true))))

(assert (=> b!661185 (arrayContainsKey!0 (array!38891 (store (arr!18637 a!3626) i!1382 k!2843) (size!19002 a!3626)) k!2843 from!3004)))

(assert (= (and start!59832 res!429397) b!661174))

(assert (= (and b!661174 res!429405) b!661172))

(assert (= (and b!661172 res!429408) b!661175))

(assert (= (and b!661175 res!429401) b!661182))

(assert (= (and b!661182 res!429407) b!661184))

(assert (= (and b!661182 (not res!429400)) b!661180))

(assert (= (and b!661180 res!429409) b!661176))

(assert (= (and b!661182 res!429398) b!661179))

(assert (= (and b!661179 res!429403) b!661173))

(assert (= (and b!661173 res!429396) b!661181))

(assert (= (and b!661181 res!429402) b!661177))

(assert (= (and b!661177 res!429406) b!661178))

(assert (= (and b!661178 res!429399) b!661183))

(assert (= (and b!661183 res!429404) b!661185))

(declare-fun m!632861 () Bool)

(assert (=> start!59832 m!632861))

(declare-fun m!632863 () Bool)

(assert (=> b!661184 m!632863))

(declare-fun m!632865 () Bool)

(assert (=> b!661174 m!632865))

(declare-fun m!632867 () Bool)

(assert (=> b!661185 m!632867))

(declare-fun m!632869 () Bool)

(assert (=> b!661185 m!632869))

(declare-fun m!632871 () Bool)

(assert (=> b!661172 m!632871))

(declare-fun m!632873 () Bool)

(assert (=> b!661178 m!632873))

(declare-fun m!632875 () Bool)

(assert (=> b!661179 m!632875))

(declare-fun m!632877 () Bool)

(assert (=> b!661177 m!632877))

(declare-fun m!632879 () Bool)

(assert (=> b!661173 m!632879))

(declare-fun m!632881 () Bool)

(assert (=> b!661175 m!632881))

(assert (=> b!661176 m!632863))

(push 1)

(assert (not b!661172))

(assert (not b!661185))

(assert (not b!661174))

(assert (not b!661176))

(assert (not b!661178))

(assert (not b!661173))

(assert (not start!59832))

(assert (not b!661184))

(assert (not b!661175))

(assert (not b!661179))

(assert (not b!661177))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

