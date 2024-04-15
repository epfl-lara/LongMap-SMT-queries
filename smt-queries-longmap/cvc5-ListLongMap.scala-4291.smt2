; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59766 () Bool)

(assert start!59766)

(declare-fun b!660035 () Bool)

(declare-fun e!379267 () Bool)

(declare-fun e!379268 () Bool)

(assert (=> b!660035 (= e!379267 e!379268)))

(declare-fun res!428266 () Bool)

(assert (=> b!660035 (=> (not res!428266) (not e!379268))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660035 (= res!428266 (bvsle from!3004 i!1382))))

(declare-fun res!428263 () Bool)

(declare-fun e!379270 () Bool)

(assert (=> start!59766 (=> (not res!428263) (not e!379270))))

(declare-datatypes ((array!38824 0))(
  ( (array!38825 (arr!18604 (Array (_ BitVec 32) (_ BitVec 64))) (size!18969 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38824)

(assert (=> start!59766 (= res!428263 (and (bvslt (size!18969 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18969 a!3626))))))

(assert (=> start!59766 e!379270))

(assert (=> start!59766 true))

(declare-fun array_inv!14487 (array!38824) Bool)

(assert (=> start!59766 (array_inv!14487 a!3626)))

(declare-fun b!660036 () Bool)

(declare-fun res!428260 () Bool)

(assert (=> b!660036 (=> (not res!428260) (not e!379270))))

(declare-datatypes ((List!12684 0))(
  ( (Nil!12681) (Cons!12680 (h!13725 (_ BitVec 64)) (t!18903 List!12684)) )
))
(declare-fun acc!681 () List!12684)

(declare-fun noDuplicate!475 (List!12684) Bool)

(assert (=> b!660036 (= res!428260 (noDuplicate!475 acc!681))))

(declare-fun b!660037 () Bool)

(declare-fun res!428265 () Bool)

(assert (=> b!660037 (=> (not res!428265) (not e!379270))))

(assert (=> b!660037 (= res!428265 e!379267)))

(declare-fun res!428261 () Bool)

(assert (=> b!660037 (=> res!428261 e!379267)))

(declare-fun e!379269 () Bool)

(assert (=> b!660037 (= res!428261 e!379269)))

(declare-fun res!428259 () Bool)

(assert (=> b!660037 (=> (not res!428259) (not e!379269))))

(assert (=> b!660037 (= res!428259 (bvsgt from!3004 i!1382))))

(declare-fun b!660038 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3206 (List!12684 (_ BitVec 64)) Bool)

(assert (=> b!660038 (= e!379269 (contains!3206 acc!681 k!2843))))

(declare-fun b!660039 () Bool)

(assert (=> b!660039 (= e!379268 (not (contains!3206 acc!681 k!2843)))))

(declare-fun b!660040 () Bool)

(declare-fun res!428262 () Bool)

(assert (=> b!660040 (=> (not res!428262) (not e!379270))))

(assert (=> b!660040 (= res!428262 (not (contains!3206 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660041 () Bool)

(assert (=> b!660041 (= e!379270 false)))

(declare-fun lt!308517 () Bool)

(declare-fun arrayNoDuplicates!0 (array!38824 (_ BitVec 32) List!12684) Bool)

(assert (=> b!660041 (= lt!308517 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12681))))

(declare-fun b!660042 () Bool)

(declare-fun res!428264 () Bool)

(assert (=> b!660042 (=> (not res!428264) (not e!379270))))

(assert (=> b!660042 (= res!428264 (not (contains!3206 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59766 res!428263) b!660036))

(assert (= (and b!660036 res!428260) b!660042))

(assert (= (and b!660042 res!428264) b!660040))

(assert (= (and b!660040 res!428262) b!660037))

(assert (= (and b!660037 res!428259) b!660038))

(assert (= (and b!660037 (not res!428261)) b!660035))

(assert (= (and b!660035 res!428266) b!660039))

(assert (= (and b!660037 res!428265) b!660041))

(declare-fun m!632283 () Bool)

(assert (=> b!660040 m!632283))

(declare-fun m!632285 () Bool)

(assert (=> b!660038 m!632285))

(declare-fun m!632287 () Bool)

(assert (=> b!660036 m!632287))

(declare-fun m!632289 () Bool)

(assert (=> b!660042 m!632289))

(assert (=> b!660039 m!632285))

(declare-fun m!632291 () Bool)

(assert (=> b!660041 m!632291))

(declare-fun m!632293 () Bool)

(assert (=> start!59766 m!632293))

(push 1)

(assert (not b!660041))

(assert (not start!59766))

(assert (not b!660040))

(assert (not b!660038))

(assert (not b!660042))

(assert (not b!660036))

(assert (not b!660039))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

