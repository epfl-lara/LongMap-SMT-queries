; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59766 () Bool)

(assert start!59766)

(declare-fun b!660187 () Bool)

(declare-fun res!428257 () Bool)

(declare-fun e!379368 () Bool)

(assert (=> b!660187 (=> (not res!428257) (not e!379368))))

(declare-datatypes ((List!12640 0))(
  ( (Nil!12637) (Cons!12636 (h!13681 (_ BitVec 64)) (t!18868 List!12640)) )
))
(declare-fun acc!681 () List!12640)

(declare-fun noDuplicate!464 (List!12640) Bool)

(assert (=> b!660187 (= res!428257 (noDuplicate!464 acc!681))))

(declare-fun b!660188 () Bool)

(declare-fun e!379371 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3217 (List!12640 (_ BitVec 64)) Bool)

(assert (=> b!660188 (= e!379371 (not (contains!3217 acc!681 k!2843)))))

(declare-fun b!660189 () Bool)

(declare-fun res!428256 () Bool)

(assert (=> b!660189 (=> (not res!428256) (not e!379368))))

(assert (=> b!660189 (= res!428256 (not (contains!3217 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!428253 () Bool)

(assert (=> start!59766 (=> (not res!428253) (not e!379368))))

(declare-datatypes ((array!38813 0))(
  ( (array!38814 (arr!18599 (Array (_ BitVec 32) (_ BitVec 64))) (size!18963 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38813)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59766 (= res!428253 (and (bvslt (size!18963 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18963 a!3626))))))

(assert (=> start!59766 e!379368))

(assert (=> start!59766 true))

(declare-fun array_inv!14395 (array!38813) Bool)

(assert (=> start!59766 (array_inv!14395 a!3626)))

(declare-fun b!660190 () Bool)

(declare-fun e!379367 () Bool)

(assert (=> b!660190 (= e!379367 e!379371)))

(declare-fun res!428251 () Bool)

(assert (=> b!660190 (=> (not res!428251) (not e!379371))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660190 (= res!428251 (bvsle from!3004 i!1382))))

(declare-fun b!660191 () Bool)

(declare-fun res!428255 () Bool)

(assert (=> b!660191 (=> (not res!428255) (not e!379368))))

(assert (=> b!660191 (= res!428255 (not (contains!3217 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660192 () Bool)

(declare-fun res!428258 () Bool)

(assert (=> b!660192 (=> (not res!428258) (not e!379368))))

(assert (=> b!660192 (= res!428258 e!379367)))

(declare-fun res!428252 () Bool)

(assert (=> b!660192 (=> res!428252 e!379367)))

(declare-fun e!379370 () Bool)

(assert (=> b!660192 (= res!428252 e!379370)))

(declare-fun res!428254 () Bool)

(assert (=> b!660192 (=> (not res!428254) (not e!379370))))

(assert (=> b!660192 (= res!428254 (bvsgt from!3004 i!1382))))

(declare-fun b!660193 () Bool)

(assert (=> b!660193 (= e!379370 (contains!3217 acc!681 k!2843))))

(declare-fun b!660194 () Bool)

(assert (=> b!660194 (= e!379368 false)))

(declare-fun lt!308755 () Bool)

(declare-fun arrayNoDuplicates!0 (array!38813 (_ BitVec 32) List!12640) Bool)

(assert (=> b!660194 (= lt!308755 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12637))))

(assert (= (and start!59766 res!428253) b!660187))

(assert (= (and b!660187 res!428257) b!660189))

(assert (= (and b!660189 res!428256) b!660191))

(assert (= (and b!660191 res!428255) b!660192))

(assert (= (and b!660192 res!428254) b!660193))

(assert (= (and b!660192 (not res!428252)) b!660190))

(assert (= (and b!660190 res!428251) b!660188))

(assert (= (and b!660192 res!428258) b!660194))

(declare-fun m!632993 () Bool)

(assert (=> start!59766 m!632993))

(declare-fun m!632995 () Bool)

(assert (=> b!660193 m!632995))

(declare-fun m!632997 () Bool)

(assert (=> b!660194 m!632997))

(declare-fun m!632999 () Bool)

(assert (=> b!660189 m!632999))

(declare-fun m!633001 () Bool)

(assert (=> b!660191 m!633001))

(declare-fun m!633003 () Bool)

(assert (=> b!660187 m!633003))

(assert (=> b!660188 m!632995))

(push 1)

(assert (not b!660194))

(assert (not start!59766))

(assert (not b!660189))

(assert (not b!660193))

(assert (not b!660191))

(assert (not b!660187))

(assert (not b!660188))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

