; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59758 () Bool)

(assert start!59758)

(declare-fun b!660087 () Bool)

(declare-fun e!379310 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((array!38805 0))(
  ( (array!38806 (arr!18595 (Array (_ BitVec 32) (_ BitVec 64))) (size!18959 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38805)

(assert (=> b!660087 (= e!379310 (bvsgt from!3004 (size!18959 a!3626)))))

(declare-fun b!660088 () Bool)

(declare-fun e!379308 () Bool)

(declare-datatypes ((List!12636 0))(
  ( (Nil!12633) (Cons!12632 (h!13677 (_ BitVec 64)) (t!18864 List!12636)) )
))
(declare-fun acc!681 () List!12636)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3213 (List!12636 (_ BitVec 64)) Bool)

(assert (=> b!660088 (= e!379308 (contains!3213 acc!681 k0!2843))))

(declare-fun b!660089 () Bool)

(declare-fun res!428153 () Bool)

(assert (=> b!660089 (=> (not res!428153) (not e!379310))))

(declare-fun e!379307 () Bool)

(assert (=> b!660089 (= res!428153 e!379307)))

(declare-fun res!428151 () Bool)

(assert (=> b!660089 (=> res!428151 e!379307)))

(assert (=> b!660089 (= res!428151 e!379308)))

(declare-fun res!428154 () Bool)

(assert (=> b!660089 (=> (not res!428154) (not e!379308))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!660089 (= res!428154 (bvsgt from!3004 i!1382))))

(declare-fun b!660090 () Bool)

(declare-fun res!428152 () Bool)

(assert (=> b!660090 (=> (not res!428152) (not e!379310))))

(assert (=> b!660090 (= res!428152 (not (contains!3213 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660092 () Bool)

(declare-fun e!379309 () Bool)

(assert (=> b!660092 (= e!379309 (not (contains!3213 acc!681 k0!2843)))))

(declare-fun b!660093 () Bool)

(declare-fun res!428155 () Bool)

(assert (=> b!660093 (=> (not res!428155) (not e!379310))))

(declare-fun noDuplicate!460 (List!12636) Bool)

(assert (=> b!660093 (= res!428155 (noDuplicate!460 acc!681))))

(declare-fun b!660094 () Bool)

(declare-fun res!428157 () Bool)

(assert (=> b!660094 (=> (not res!428157) (not e!379310))))

(assert (=> b!660094 (= res!428157 (not (contains!3213 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!660095 () Bool)

(declare-fun res!428158 () Bool)

(assert (=> b!660095 (=> (not res!428158) (not e!379310))))

(declare-fun arrayNoDuplicates!0 (array!38805 (_ BitVec 32) List!12636) Bool)

(assert (=> b!660095 (= res!428158 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12633))))

(declare-fun b!660091 () Bool)

(assert (=> b!660091 (= e!379307 e!379309)))

(declare-fun res!428156 () Bool)

(assert (=> b!660091 (=> (not res!428156) (not e!379309))))

(assert (=> b!660091 (= res!428156 (bvsle from!3004 i!1382))))

(declare-fun res!428159 () Bool)

(assert (=> start!59758 (=> (not res!428159) (not e!379310))))

(assert (=> start!59758 (= res!428159 (and (bvslt (size!18959 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18959 a!3626))))))

(assert (=> start!59758 e!379310))

(assert (=> start!59758 true))

(declare-fun array_inv!14391 (array!38805) Bool)

(assert (=> start!59758 (array_inv!14391 a!3626)))

(assert (= (and start!59758 res!428159) b!660093))

(assert (= (and b!660093 res!428155) b!660094))

(assert (= (and b!660094 res!428157) b!660090))

(assert (= (and b!660090 res!428152) b!660089))

(assert (= (and b!660089 res!428154) b!660088))

(assert (= (and b!660089 (not res!428151)) b!660091))

(assert (= (and b!660091 res!428156) b!660092))

(assert (= (and b!660089 res!428153) b!660095))

(assert (= (and b!660095 res!428158) b!660087))

(declare-fun m!632945 () Bool)

(assert (=> b!660090 m!632945))

(declare-fun m!632947 () Bool)

(assert (=> b!660095 m!632947))

(declare-fun m!632949 () Bool)

(assert (=> b!660088 m!632949))

(declare-fun m!632951 () Bool)

(assert (=> b!660094 m!632951))

(assert (=> b!660092 m!632949))

(declare-fun m!632953 () Bool)

(assert (=> start!59758 m!632953))

(declare-fun m!632955 () Bool)

(assert (=> b!660093 m!632955))

(check-sat (not b!660093) (not b!660090) (not b!660094) (not b!660088) (not b!660092) (not b!660095) (not start!59758))
(check-sat)
