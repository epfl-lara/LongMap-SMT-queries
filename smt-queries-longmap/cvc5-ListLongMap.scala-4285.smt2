; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59764 () Bool)

(assert start!59764)

(declare-fun b!659959 () Bool)

(declare-fun e!379199 () Bool)

(declare-fun e!379201 () Bool)

(assert (=> b!659959 (= e!379199 e!379201)))

(declare-fun res!427915 () Bool)

(assert (=> b!659959 (=> (not res!427915) (not e!379201))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!659959 (= res!427915 (bvsle from!3004 i!1382))))

(declare-fun b!659960 () Bool)

(declare-fun e!379203 () Bool)

(assert (=> b!659960 (= e!379203 false)))

(declare-fun lt!308812 () Bool)

(assert (=> b!659960 (= lt!308812 e!379199)))

(declare-fun res!427916 () Bool)

(assert (=> b!659960 (=> res!427916 e!379199)))

(declare-fun e!379200 () Bool)

(assert (=> b!659960 (= res!427916 e!379200)))

(declare-fun res!427917 () Bool)

(assert (=> b!659960 (=> (not res!427917) (not e!379200))))

(assert (=> b!659960 (= res!427917 (bvsgt from!3004 i!1382))))

(declare-fun b!659961 () Bool)

(declare-datatypes ((List!12530 0))(
  ( (Nil!12527) (Cons!12526 (h!13574 (_ BitVec 64)) (t!18750 List!12530)) )
))
(declare-fun acc!681 () List!12530)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3182 (List!12530 (_ BitVec 64)) Bool)

(assert (=> b!659961 (= e!379201 (not (contains!3182 acc!681 k!2843)))))

(declare-fun b!659962 () Bool)

(declare-fun res!427914 () Bool)

(assert (=> b!659962 (=> (not res!427914) (not e!379203))))

(declare-fun noDuplicate!456 (List!12530) Bool)

(assert (=> b!659962 (= res!427914 (noDuplicate!456 acc!681))))

(declare-fun b!659963 () Bool)

(declare-fun res!427913 () Bool)

(assert (=> b!659963 (=> (not res!427913) (not e!379203))))

(assert (=> b!659963 (= res!427913 (not (contains!3182 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!659964 () Bool)

(assert (=> b!659964 (= e!379200 (contains!3182 acc!681 k!2843))))

(declare-fun res!427918 () Bool)

(assert (=> start!59764 (=> (not res!427918) (not e!379203))))

(declare-datatypes ((array!38779 0))(
  ( (array!38780 (arr!18582 (Array (_ BitVec 32) (_ BitVec 64))) (size!18946 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38779)

(assert (=> start!59764 (= res!427918 (and (bvslt (size!18946 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18946 a!3626))))))

(assert (=> start!59764 e!379203))

(assert (=> start!59764 true))

(declare-fun array_inv!14441 (array!38779) Bool)

(assert (=> start!59764 (array_inv!14441 a!3626)))

(declare-fun b!659965 () Bool)

(declare-fun res!427912 () Bool)

(assert (=> b!659965 (=> (not res!427912) (not e!379203))))

(assert (=> b!659965 (= res!427912 (not (contains!3182 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59764 res!427918) b!659962))

(assert (= (and b!659962 res!427914) b!659965))

(assert (= (and b!659965 res!427912) b!659963))

(assert (= (and b!659963 res!427913) b!659960))

(assert (= (and b!659960 res!427917) b!659964))

(assert (= (and b!659960 (not res!427916)) b!659959))

(assert (= (and b!659959 res!427915) b!659961))

(declare-fun m!633375 () Bool)

(assert (=> b!659965 m!633375))

(declare-fun m!633377 () Bool)

(assert (=> b!659964 m!633377))

(declare-fun m!633379 () Bool)

(assert (=> b!659963 m!633379))

(assert (=> b!659961 m!633377))

(declare-fun m!633381 () Bool)

(assert (=> b!659962 m!633381))

(declare-fun m!633383 () Bool)

(assert (=> start!59764 m!633383))

(push 1)

(assert (not b!659962))

(assert (not b!659963))

(assert (not b!659961))

(assert (not b!659964))

(assert (not start!59764))

(assert (not b!659965))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

