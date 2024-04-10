; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59764 () Bool)

(assert start!59764)

(declare-fun b!660163 () Bool)

(declare-fun e!379353 () Bool)

(assert (=> b!660163 (= e!379353 false)))

(declare-fun lt!308752 () Bool)

(declare-datatypes ((array!38811 0))(
  ( (array!38812 (arr!18598 (Array (_ BitVec 32) (_ BitVec 64))) (size!18962 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38811)

(declare-datatypes ((List!12639 0))(
  ( (Nil!12636) (Cons!12635 (h!13680 (_ BitVec 64)) (t!18867 List!12639)) )
))
(declare-fun arrayNoDuplicates!0 (array!38811 (_ BitVec 32) List!12639) Bool)

(assert (=> b!660163 (= lt!308752 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12636))))

(declare-fun b!660164 () Bool)

(declare-fun e!379355 () Bool)

(declare-fun e!379354 () Bool)

(assert (=> b!660164 (= e!379355 e!379354)))

(declare-fun res!428234 () Bool)

(assert (=> b!660164 (=> (not res!428234) (not e!379354))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660164 (= res!428234 (bvsle from!3004 i!1382))))

(declare-fun b!660165 () Bool)

(declare-fun res!428232 () Bool)

(assert (=> b!660165 (=> (not res!428232) (not e!379353))))

(declare-fun acc!681 () List!12639)

(declare-fun contains!3216 (List!12639 (_ BitVec 64)) Bool)

(assert (=> b!660165 (= res!428232 (not (contains!3216 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!428231 () Bool)

(assert (=> start!59764 (=> (not res!428231) (not e!379353))))

(assert (=> start!59764 (= res!428231 (and (bvslt (size!18962 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18962 a!3626))))))

(assert (=> start!59764 e!379353))

(assert (=> start!59764 true))

(declare-fun array_inv!14394 (array!38811) Bool)

(assert (=> start!59764 (array_inv!14394 a!3626)))

(declare-fun b!660166 () Bool)

(declare-fun res!428227 () Bool)

(assert (=> b!660166 (=> (not res!428227) (not e!379353))))

(assert (=> b!660166 (= res!428227 (not (contains!3216 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660167 () Bool)

(declare-fun res!428230 () Bool)

(assert (=> b!660167 (=> (not res!428230) (not e!379353))))

(declare-fun noDuplicate!463 (List!12639) Bool)

(assert (=> b!660167 (= res!428230 (noDuplicate!463 acc!681))))

(declare-fun b!660168 () Bool)

(declare-fun e!379352 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!660168 (= e!379352 (contains!3216 acc!681 k0!2843))))

(declare-fun b!660169 () Bool)

(assert (=> b!660169 (= e!379354 (not (contains!3216 acc!681 k0!2843)))))

(declare-fun b!660170 () Bool)

(declare-fun res!428229 () Bool)

(assert (=> b!660170 (=> (not res!428229) (not e!379353))))

(assert (=> b!660170 (= res!428229 e!379355)))

(declare-fun res!428233 () Bool)

(assert (=> b!660170 (=> res!428233 e!379355)))

(assert (=> b!660170 (= res!428233 e!379352)))

(declare-fun res!428228 () Bool)

(assert (=> b!660170 (=> (not res!428228) (not e!379352))))

(assert (=> b!660170 (= res!428228 (bvsgt from!3004 i!1382))))

(assert (= (and start!59764 res!428231) b!660167))

(assert (= (and b!660167 res!428230) b!660165))

(assert (= (and b!660165 res!428232) b!660166))

(assert (= (and b!660166 res!428227) b!660170))

(assert (= (and b!660170 res!428228) b!660168))

(assert (= (and b!660170 (not res!428233)) b!660164))

(assert (= (and b!660164 res!428234) b!660169))

(assert (= (and b!660170 res!428229) b!660163))

(declare-fun m!632981 () Bool)

(assert (=> b!660168 m!632981))

(declare-fun m!632983 () Bool)

(assert (=> b!660167 m!632983))

(declare-fun m!632985 () Bool)

(assert (=> b!660163 m!632985))

(assert (=> b!660169 m!632981))

(declare-fun m!632987 () Bool)

(assert (=> b!660165 m!632987))

(declare-fun m!632989 () Bool)

(assert (=> b!660166 m!632989))

(declare-fun m!632991 () Bool)

(assert (=> start!59764 m!632991))

(check-sat (not b!660169) (not start!59764) (not b!660167) (not b!660166) (not b!660165) (not b!660168) (not b!660163))
