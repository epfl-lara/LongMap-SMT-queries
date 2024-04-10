; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59772 () Bool)

(assert start!59772)

(declare-fun b!660259 () Bool)

(declare-fun e!379416 () Bool)

(assert (=> b!660259 (= e!379416 false)))

(declare-fun lt!308764 () Bool)

(declare-datatypes ((array!38819 0))(
  ( (array!38820 (arr!18602 (Array (_ BitVec 32) (_ BitVec 64))) (size!18966 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38819)

(declare-datatypes ((List!12643 0))(
  ( (Nil!12640) (Cons!12639 (h!13684 (_ BitVec 64)) (t!18871 List!12643)) )
))
(declare-fun arrayNoDuplicates!0 (array!38819 (_ BitVec 32) List!12643) Bool)

(assert (=> b!660259 (= lt!308764 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12640))))

(declare-fun b!660260 () Bool)

(declare-fun e!379415 () Bool)

(declare-fun acc!681 () List!12643)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3220 (List!12643 (_ BitVec 64)) Bool)

(assert (=> b!660260 (= e!379415 (contains!3220 acc!681 k!2843))))

(declare-fun b!660261 () Bool)

(declare-fun res!428329 () Bool)

(assert (=> b!660261 (=> (not res!428329) (not e!379416))))

(assert (=> b!660261 (= res!428329 (not (contains!3220 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660262 () Bool)

(declare-fun e!379414 () Bool)

(assert (=> b!660262 (= e!379414 (not (contains!3220 acc!681 k!2843)))))

(declare-fun b!660263 () Bool)

(declare-fun res!428324 () Bool)

(assert (=> b!660263 (=> (not res!428324) (not e!379416))))

(declare-fun e!379412 () Bool)

(assert (=> b!660263 (= res!428324 e!379412)))

(declare-fun res!428330 () Bool)

(assert (=> b!660263 (=> res!428330 e!379412)))

(assert (=> b!660263 (= res!428330 e!379415)))

(declare-fun res!428328 () Bool)

(assert (=> b!660263 (=> (not res!428328) (not e!379415))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660263 (= res!428328 (bvsgt from!3004 i!1382))))

(declare-fun res!428325 () Bool)

(assert (=> start!59772 (=> (not res!428325) (not e!379416))))

(assert (=> start!59772 (= res!428325 (and (bvslt (size!18966 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18966 a!3626))))))

(assert (=> start!59772 e!379416))

(assert (=> start!59772 true))

(declare-fun array_inv!14398 (array!38819) Bool)

(assert (=> start!59772 (array_inv!14398 a!3626)))

(declare-fun b!660264 () Bool)

(declare-fun res!428323 () Bool)

(assert (=> b!660264 (=> (not res!428323) (not e!379416))))

(declare-fun noDuplicate!467 (List!12643) Bool)

(assert (=> b!660264 (= res!428323 (noDuplicate!467 acc!681))))

(declare-fun b!660265 () Bool)

(assert (=> b!660265 (= e!379412 e!379414)))

(declare-fun res!428327 () Bool)

(assert (=> b!660265 (=> (not res!428327) (not e!379414))))

(assert (=> b!660265 (= res!428327 (bvsle from!3004 i!1382))))

(declare-fun b!660266 () Bool)

(declare-fun res!428326 () Bool)

(assert (=> b!660266 (=> (not res!428326) (not e!379416))))

(assert (=> b!660266 (= res!428326 (not (contains!3220 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59772 res!428325) b!660264))

(assert (= (and b!660264 res!428323) b!660261))

(assert (= (and b!660261 res!428329) b!660266))

(assert (= (and b!660266 res!428326) b!660263))

(assert (= (and b!660263 res!428328) b!660260))

(assert (= (and b!660263 (not res!428330)) b!660265))

(assert (= (and b!660265 res!428327) b!660262))

(assert (= (and b!660263 res!428324) b!660259))

(declare-fun m!633029 () Bool)

(assert (=> b!660260 m!633029))

(assert (=> b!660262 m!633029))

(declare-fun m!633031 () Bool)

(assert (=> b!660266 m!633031))

(declare-fun m!633033 () Bool)

(assert (=> b!660259 m!633033))

(declare-fun m!633035 () Bool)

(assert (=> b!660264 m!633035))

(declare-fun m!633037 () Bool)

(assert (=> start!59772 m!633037))

(declare-fun m!633039 () Bool)

(assert (=> b!660261 m!633039))

(push 1)

(assert (not b!660264))

(assert (not b!660262))

(assert (not b!660261))

(assert (not b!660266))

(assert (not b!660259))

(assert (not start!59772))

(assert (not b!660260))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

