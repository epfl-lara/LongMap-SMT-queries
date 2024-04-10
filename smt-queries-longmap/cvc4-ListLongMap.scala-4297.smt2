; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59814 () Bool)

(assert start!59814)

(declare-fun b!660843 () Bool)

(declare-fun res!428913 () Bool)

(declare-fun e!379731 () Bool)

(assert (=> b!660843 (=> (not res!428913) (not e!379731))))

(declare-datatypes ((array!38861 0))(
  ( (array!38862 (arr!18623 (Array (_ BitVec 32) (_ BitVec 64))) (size!18987 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38861)

(declare-datatypes ((List!12664 0))(
  ( (Nil!12661) (Cons!12660 (h!13705 (_ BitVec 64)) (t!18892 List!12664)) )
))
(declare-fun arrayNoDuplicates!0 (array!38861 (_ BitVec 32) List!12664) Bool)

(assert (=> b!660843 (= res!428913 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12661))))

(declare-fun b!660844 () Bool)

(declare-fun e!379729 () Bool)

(declare-fun e!379730 () Bool)

(assert (=> b!660844 (= e!379729 e!379730)))

(declare-fun res!428914 () Bool)

(assert (=> b!660844 (=> (not res!428914) (not e!379730))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660844 (= res!428914 (bvsle from!3004 i!1382))))

(declare-fun b!660845 () Bool)

(declare-fun res!428915 () Bool)

(assert (=> b!660845 (=> (not res!428915) (not e!379731))))

(assert (=> b!660845 (= res!428915 e!379729)))

(declare-fun res!428907 () Bool)

(assert (=> b!660845 (=> res!428907 e!379729)))

(declare-fun e!379728 () Bool)

(assert (=> b!660845 (= res!428907 e!379728)))

(declare-fun res!428912 () Bool)

(assert (=> b!660845 (=> (not res!428912) (not e!379728))))

(assert (=> b!660845 (= res!428912 (bvsgt from!3004 i!1382))))

(declare-fun b!660846 () Bool)

(declare-fun acc!681 () List!12664)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3241 (List!12664 (_ BitVec 64)) Bool)

(assert (=> b!660846 (= e!379728 (contains!3241 acc!681 k!2843))))

(declare-fun b!660847 () Bool)

(declare-fun res!428908 () Bool)

(assert (=> b!660847 (=> (not res!428908) (not e!379731))))

(assert (=> b!660847 (= res!428908 (not (contains!3241 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660848 () Bool)

(declare-fun res!428910 () Bool)

(assert (=> b!660848 (=> (not res!428910) (not e!379731))))

(declare-fun noDuplicate!488 (List!12664) Bool)

(assert (=> b!660848 (= res!428910 (noDuplicate!488 acc!681))))

(declare-fun b!660850 () Bool)

(assert (=> b!660850 (= e!379731 false)))

(declare-fun lt!308818 () Bool)

(assert (=> b!660850 (= lt!308818 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!660851 () Bool)

(declare-fun res!428911 () Bool)

(assert (=> b!660851 (=> (not res!428911) (not e!379731))))

(assert (=> b!660851 (= res!428911 (not (contains!3241 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!428909 () Bool)

(assert (=> start!59814 (=> (not res!428909) (not e!379731))))

(assert (=> start!59814 (= res!428909 (and (bvslt (size!18987 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18987 a!3626))))))

(assert (=> start!59814 e!379731))

(assert (=> start!59814 true))

(declare-fun array_inv!14419 (array!38861) Bool)

(assert (=> start!59814 (array_inv!14419 a!3626)))

(declare-fun b!660849 () Bool)

(assert (=> b!660849 (= e!379730 (not (contains!3241 acc!681 k!2843)))))

(assert (= (and start!59814 res!428909) b!660848))

(assert (= (and b!660848 res!428910) b!660851))

(assert (= (and b!660851 res!428911) b!660847))

(assert (= (and b!660847 res!428908) b!660845))

(assert (= (and b!660845 res!428912) b!660846))

(assert (= (and b!660845 (not res!428907)) b!660844))

(assert (= (and b!660844 res!428914) b!660849))

(assert (= (and b!660845 res!428915) b!660843))

(assert (= (and b!660843 res!428913) b!660850))

(declare-fun m!633321 () Bool)

(assert (=> b!660843 m!633321))

(declare-fun m!633323 () Bool)

(assert (=> start!59814 m!633323))

(declare-fun m!633325 () Bool)

(assert (=> b!660851 m!633325))

(declare-fun m!633327 () Bool)

(assert (=> b!660848 m!633327))

(declare-fun m!633329 () Bool)

(assert (=> b!660849 m!633329))

(declare-fun m!633331 () Bool)

(assert (=> b!660850 m!633331))

(assert (=> b!660846 m!633329))

(declare-fun m!633333 () Bool)

(assert (=> b!660847 m!633333))

(push 1)

(assert (not b!660851))

(assert (not start!59814))

(assert (not b!660843))

(assert (not b!660847))

(assert (not b!660849))

(assert (not b!660846))

(assert (not b!660850))

(assert (not b!660848))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

