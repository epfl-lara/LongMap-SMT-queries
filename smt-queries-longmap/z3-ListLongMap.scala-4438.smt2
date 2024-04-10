; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61696 () Bool)

(assert start!61696)

(declare-fun b!690258 () Bool)

(declare-fun res!454668 () Bool)

(declare-fun e!393051 () Bool)

(assert (=> b!690258 (=> (not res!454668) (not e!393051))))

(declare-datatypes ((array!39750 0))(
  ( (array!39751 (arr!19045 (Array (_ BitVec 32) (_ BitVec 64))) (size!19430 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39750)

(declare-datatypes ((List!13086 0))(
  ( (Nil!13083) (Cons!13082 (h!14127 (_ BitVec 64)) (t!19353 List!13086)) )
))
(declare-fun arrayNoDuplicates!0 (array!39750 (_ BitVec 32) List!13086) Bool)

(assert (=> b!690258 (= res!454668 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13083))))

(declare-fun b!690259 () Bool)

(declare-fun res!454664 () Bool)

(assert (=> b!690259 (=> (not res!454664) (not e!393051))))

(declare-fun acc!681 () List!13086)

(declare-fun contains!3663 (List!13086 (_ BitVec 64)) Bool)

(assert (=> b!690259 (= res!454664 (not (contains!3663 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690260 () Bool)

(declare-fun res!454662 () Bool)

(assert (=> b!690260 (=> (not res!454662) (not e!393051))))

(assert (=> b!690260 (= res!454662 (not (contains!3663 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690261 () Bool)

(declare-fun res!454665 () Bool)

(assert (=> b!690261 (=> (not res!454665) (not e!393051))))

(declare-fun noDuplicate!910 (List!13086) Bool)

(assert (=> b!690261 (= res!454665 (noDuplicate!910 acc!681))))

(declare-fun b!690262 () Bool)

(assert (=> b!690262 (= e!393051 false)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!316420 () Bool)

(assert (=> b!690262 (= lt!316420 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!690263 () Bool)

(declare-fun e!393047 () Bool)

(declare-fun e!393048 () Bool)

(assert (=> b!690263 (= e!393047 e!393048)))

(declare-fun res!454669 () Bool)

(assert (=> b!690263 (=> (not res!454669) (not e!393048))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!690263 (= res!454669 (bvsle from!3004 i!1382))))

(declare-fun res!454663 () Bool)

(assert (=> start!61696 (=> (not res!454663) (not e!393051))))

(assert (=> start!61696 (= res!454663 (and (bvslt (size!19430 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19430 a!3626))))))

(assert (=> start!61696 e!393051))

(assert (=> start!61696 true))

(declare-fun array_inv!14841 (array!39750) Bool)

(assert (=> start!61696 (array_inv!14841 a!3626)))

(declare-fun b!690264 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(assert (=> b!690264 (= e!393048 (not (contains!3663 acc!681 k0!2843)))))

(declare-fun b!690265 () Bool)

(declare-fun e!393050 () Bool)

(assert (=> b!690265 (= e!393050 (contains!3663 acc!681 k0!2843))))

(declare-fun b!690266 () Bool)

(declare-fun res!454670 () Bool)

(assert (=> b!690266 (=> (not res!454670) (not e!393051))))

(assert (=> b!690266 (= res!454670 e!393047)))

(declare-fun res!454666 () Bool)

(assert (=> b!690266 (=> res!454666 e!393047)))

(assert (=> b!690266 (= res!454666 e!393050)))

(declare-fun res!454667 () Bool)

(assert (=> b!690266 (=> (not res!454667) (not e!393050))))

(assert (=> b!690266 (= res!454667 (bvsgt from!3004 i!1382))))

(assert (= (and start!61696 res!454663) b!690261))

(assert (= (and b!690261 res!454665) b!690259))

(assert (= (and b!690259 res!454664) b!690260))

(assert (= (and b!690260 res!454662) b!690266))

(assert (= (and b!690266 res!454667) b!690265))

(assert (= (and b!690266 (not res!454666)) b!690263))

(assert (= (and b!690263 res!454669) b!690264))

(assert (= (and b!690266 res!454670) b!690258))

(assert (= (and b!690258 res!454668) b!690262))

(declare-fun m!653839 () Bool)

(assert (=> b!690265 m!653839))

(declare-fun m!653841 () Bool)

(assert (=> b!690262 m!653841))

(declare-fun m!653843 () Bool)

(assert (=> b!690260 m!653843))

(assert (=> b!690264 m!653839))

(declare-fun m!653845 () Bool)

(assert (=> b!690261 m!653845))

(declare-fun m!653847 () Bool)

(assert (=> b!690258 m!653847))

(declare-fun m!653849 () Bool)

(assert (=> start!61696 m!653849))

(declare-fun m!653851 () Bool)

(assert (=> b!690259 m!653851))

(check-sat (not b!690259) (not b!690265) (not b!690260) (not b!690261) (not b!690258) (not start!61696) (not b!690262) (not b!690264))
(check-sat)
