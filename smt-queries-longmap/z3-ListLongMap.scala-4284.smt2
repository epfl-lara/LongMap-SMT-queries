; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59754 () Bool)

(assert start!59754)

(declare-fun b!659847 () Bool)

(declare-fun e!379125 () Bool)

(declare-datatypes ((List!12525 0))(
  ( (Nil!12522) (Cons!12521 (h!13569 (_ BitVec 64)) (t!18745 List!12525)) )
))
(declare-fun acc!681 () List!12525)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3177 (List!12525 (_ BitVec 64)) Bool)

(assert (=> b!659847 (= e!379125 (contains!3177 acc!681 k0!2843))))

(declare-fun b!659848 () Bool)

(declare-fun res!427801 () Bool)

(declare-fun e!379128 () Bool)

(assert (=> b!659848 (=> (not res!427801) (not e!379128))))

(assert (=> b!659848 (= res!427801 (not (contains!3177 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!427806 () Bool)

(assert (=> start!59754 (=> (not res!427806) (not e!379128))))

(declare-datatypes ((array!38769 0))(
  ( (array!38770 (arr!18577 (Array (_ BitVec 32) (_ BitVec 64))) (size!18941 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38769)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59754 (= res!427806 (and (bvslt (size!18941 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18941 a!3626))))))

(assert (=> start!59754 e!379128))

(assert (=> start!59754 true))

(declare-fun array_inv!14436 (array!38769) Bool)

(assert (=> start!59754 (array_inv!14436 a!3626)))

(declare-fun b!659849 () Bool)

(declare-fun res!427800 () Bool)

(assert (=> b!659849 (=> (not res!427800) (not e!379128))))

(declare-fun e!379127 () Bool)

(assert (=> b!659849 (= res!427800 e!379127)))

(declare-fun res!427807 () Bool)

(assert (=> b!659849 (=> res!427807 e!379127)))

(assert (=> b!659849 (= res!427807 e!379125)))

(declare-fun res!427804 () Bool)

(assert (=> b!659849 (=> (not res!427804) (not e!379125))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!659849 (= res!427804 (bvsgt from!3004 i!1382))))

(declare-fun b!659850 () Bool)

(declare-fun e!379124 () Bool)

(assert (=> b!659850 (= e!379127 e!379124)))

(declare-fun res!427803 () Bool)

(assert (=> b!659850 (=> (not res!427803) (not e!379124))))

(assert (=> b!659850 (= res!427803 (bvsle from!3004 i!1382))))

(declare-fun b!659851 () Bool)

(declare-fun res!427805 () Bool)

(assert (=> b!659851 (=> (not res!427805) (not e!379128))))

(declare-fun noDuplicate!451 (List!12525) Bool)

(assert (=> b!659851 (= res!427805 (noDuplicate!451 acc!681))))

(declare-fun b!659852 () Bool)

(assert (=> b!659852 (= e!379124 (not (contains!3177 acc!681 k0!2843)))))

(declare-fun b!659853 () Bool)

(assert (=> b!659853 (= e!379128 (bvsgt #b00000000000000000000000000000000 (size!18941 a!3626)))))

(declare-fun b!659854 () Bool)

(declare-fun res!427802 () Bool)

(assert (=> b!659854 (=> (not res!427802) (not e!379128))))

(assert (=> b!659854 (= res!427802 (not (contains!3177 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!59754 res!427806) b!659851))

(assert (= (and b!659851 res!427805) b!659848))

(assert (= (and b!659848 res!427801) b!659854))

(assert (= (and b!659854 res!427802) b!659849))

(assert (= (and b!659849 res!427804) b!659847))

(assert (= (and b!659849 (not res!427807)) b!659850))

(assert (= (and b!659850 res!427803) b!659852))

(assert (= (and b!659849 res!427800) b!659853))

(declare-fun m!633325 () Bool)

(assert (=> b!659851 m!633325))

(declare-fun m!633327 () Bool)

(assert (=> b!659852 m!633327))

(declare-fun m!633329 () Bool)

(assert (=> b!659854 m!633329))

(declare-fun m!633331 () Bool)

(assert (=> b!659848 m!633331))

(declare-fun m!633333 () Bool)

(assert (=> start!59754 m!633333))

(assert (=> b!659847 m!633327))

(check-sat (not b!659848) (not b!659852) (not start!59754) (not b!659851) (not b!659854) (not b!659847))
(check-sat)
