; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59836 () Bool)

(assert start!59836)

(declare-fun b!660555 () Bool)

(declare-fun res!428512 () Bool)

(declare-fun e!379598 () Bool)

(assert (=> b!660555 (=> (not res!428512) (not e!379598))))

(declare-datatypes ((List!12548 0))(
  ( (Nil!12545) (Cons!12544 (h!13592 (_ BitVec 64)) (t!18768 List!12548)) )
))
(declare-fun acc!681 () List!12548)

(declare-fun contains!3200 (List!12548 (_ BitVec 64)) Bool)

(assert (=> b!660555 (= res!428512 (not (contains!3200 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660556 () Bool)

(declare-fun res!428513 () Bool)

(assert (=> b!660556 (=> (not res!428513) (not e!379598))))

(declare-fun e!379599 () Bool)

(assert (=> b!660556 (= res!428513 e!379599)))

(declare-fun res!428514 () Bool)

(assert (=> b!660556 (=> res!428514 e!379599)))

(declare-fun e!379602 () Bool)

(assert (=> b!660556 (= res!428514 e!379602)))

(declare-fun res!428511 () Bool)

(assert (=> b!660556 (=> (not res!428511) (not e!379602))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660556 (= res!428511 (bvsgt from!3004 i!1382))))

(declare-fun b!660557 () Bool)

(declare-fun res!428508 () Bool)

(assert (=> b!660557 (=> (not res!428508) (not e!379598))))

(assert (=> b!660557 (= res!428508 (not (contains!3200 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660558 () Bool)

(declare-fun e!379600 () Bool)

(assert (=> b!660558 (= e!379599 e!379600)))

(declare-fun res!428509 () Bool)

(assert (=> b!660558 (=> (not res!428509) (not e!379600))))

(assert (=> b!660558 (= res!428509 (bvsle from!3004 i!1382))))

(declare-fun b!660559 () Bool)

(declare-fun res!428510 () Bool)

(assert (=> b!660559 (=> (not res!428510) (not e!379598))))

(declare-fun noDuplicate!474 (List!12548) Bool)

(assert (=> b!660559 (= res!428510 (noDuplicate!474 acc!681))))

(declare-fun b!660560 () Bool)

(assert (=> b!660560 (= e!379598 false)))

(declare-fun lt!308875 () Bool)

(declare-datatypes ((array!38821 0))(
  ( (array!38822 (arr!18600 (Array (_ BitVec 32) (_ BitVec 64))) (size!18964 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38821)

(declare-fun arrayNoDuplicates!0 (array!38821 (_ BitVec 32) List!12548) Bool)

(assert (=> b!660560 (= lt!308875 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12545))))

(declare-fun res!428515 () Bool)

(assert (=> start!59836 (=> (not res!428515) (not e!379598))))

(assert (=> start!59836 (= res!428515 (and (bvslt (size!18964 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18964 a!3626))))))

(assert (=> start!59836 e!379598))

(assert (=> start!59836 true))

(declare-fun array_inv!14459 (array!38821) Bool)

(assert (=> start!59836 (array_inv!14459 a!3626)))

(declare-fun b!660561 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!660561 (= e!379600 (not (contains!3200 acc!681 k!2843)))))

(declare-fun b!660562 () Bool)

(assert (=> b!660562 (= e!379602 (contains!3200 acc!681 k!2843))))

(assert (= (and start!59836 res!428515) b!660559))

(assert (= (and b!660559 res!428510) b!660555))

(assert (= (and b!660555 res!428512) b!660557))

(assert (= (and b!660557 res!428508) b!660556))

(assert (= (and b!660556 res!428511) b!660562))

(assert (= (and b!660556 (not res!428514)) b!660558))

(assert (= (and b!660558 res!428509) b!660561))

(assert (= (and b!660556 res!428513) b!660560))

(declare-fun m!633763 () Bool)

(assert (=> b!660562 m!633763))

(declare-fun m!633765 () Bool)

(assert (=> start!59836 m!633765))

(declare-fun m!633767 () Bool)

(assert (=> b!660559 m!633767))

(declare-fun m!633769 () Bool)

(assert (=> b!660557 m!633769))

(declare-fun m!633771 () Bool)

(assert (=> b!660560 m!633771))

(assert (=> b!660561 m!633763))

(declare-fun m!633773 () Bool)

(assert (=> b!660555 m!633773))

(push 1)

(assert (not b!660561))

(assert (not start!59836))

(assert (not b!660557))

(assert (not b!660562))

(assert (not b!660555))

(assert (not b!660560))

(assert (not b!660559))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

