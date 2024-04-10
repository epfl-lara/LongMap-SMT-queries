; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61692 () Bool)

(assert start!61692)

(declare-fun b!690204 () Bool)

(declare-fun res!454608 () Bool)

(declare-fun e!393018 () Bool)

(assert (=> b!690204 (=> (not res!454608) (not e!393018))))

(declare-datatypes ((List!13084 0))(
  ( (Nil!13081) (Cons!13080 (h!14125 (_ BitVec 64)) (t!19351 List!13084)) )
))
(declare-fun acc!681 () List!13084)

(declare-fun contains!3661 (List!13084 (_ BitVec 64)) Bool)

(assert (=> b!690204 (= res!454608 (not (contains!3661 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690205 () Bool)

(declare-fun e!393020 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!690205 (= e!393020 (not (contains!3661 acc!681 k!2843)))))

(declare-fun b!690206 () Bool)

(declare-fun e!393021 () Bool)

(assert (=> b!690206 (= e!393021 e!393020)))

(declare-fun res!454610 () Bool)

(assert (=> b!690206 (=> (not res!454610) (not e!393020))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!690206 (= res!454610 (bvsle from!3004 i!1382))))

(declare-fun b!690207 () Bool)

(declare-fun res!454611 () Bool)

(assert (=> b!690207 (=> (not res!454611) (not e!393018))))

(assert (=> b!690207 (= res!454611 e!393021)))

(declare-fun res!454609 () Bool)

(assert (=> b!690207 (=> res!454609 e!393021)))

(declare-fun e!393017 () Bool)

(assert (=> b!690207 (= res!454609 e!393017)))

(declare-fun res!454615 () Bool)

(assert (=> b!690207 (=> (not res!454615) (not e!393017))))

(assert (=> b!690207 (= res!454615 (bvsgt from!3004 i!1382))))

(declare-fun b!690208 () Bool)

(declare-fun res!454614 () Bool)

(assert (=> b!690208 (=> (not res!454614) (not e!393018))))

(declare-fun noDuplicate!908 (List!13084) Bool)

(assert (=> b!690208 (= res!454614 (noDuplicate!908 acc!681))))

(declare-fun b!690209 () Bool)

(assert (=> b!690209 (= e!393018 false)))

(declare-fun lt!316414 () Bool)

(declare-datatypes ((array!39746 0))(
  ( (array!39747 (arr!19043 (Array (_ BitVec 32) (_ BitVec 64))) (size!19428 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39746)

(declare-fun arrayNoDuplicates!0 (array!39746 (_ BitVec 32) List!13084) Bool)

(assert (=> b!690209 (= lt!316414 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!690210 () Bool)

(assert (=> b!690210 (= e!393017 (contains!3661 acc!681 k!2843))))

(declare-fun b!690211 () Bool)

(declare-fun res!454616 () Bool)

(assert (=> b!690211 (=> (not res!454616) (not e!393018))))

(assert (=> b!690211 (= res!454616 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13081))))

(declare-fun b!690212 () Bool)

(declare-fun res!454612 () Bool)

(assert (=> b!690212 (=> (not res!454612) (not e!393018))))

(assert (=> b!690212 (= res!454612 (not (contains!3661 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!454613 () Bool)

(assert (=> start!61692 (=> (not res!454613) (not e!393018))))

(assert (=> start!61692 (= res!454613 (and (bvslt (size!19428 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19428 a!3626))))))

(assert (=> start!61692 e!393018))

(assert (=> start!61692 true))

(declare-fun array_inv!14839 (array!39746) Bool)

(assert (=> start!61692 (array_inv!14839 a!3626)))

(assert (= (and start!61692 res!454613) b!690208))

(assert (= (and b!690208 res!454614) b!690204))

(assert (= (and b!690204 res!454608) b!690212))

(assert (= (and b!690212 res!454612) b!690207))

(assert (= (and b!690207 res!454615) b!690210))

(assert (= (and b!690207 (not res!454609)) b!690206))

(assert (= (and b!690206 res!454610) b!690205))

(assert (= (and b!690207 res!454611) b!690211))

(assert (= (and b!690211 res!454616) b!690209))

(declare-fun m!653811 () Bool)

(assert (=> b!690212 m!653811))

(declare-fun m!653813 () Bool)

(assert (=> b!690209 m!653813))

(declare-fun m!653815 () Bool)

(assert (=> b!690211 m!653815))

(declare-fun m!653817 () Bool)

(assert (=> b!690208 m!653817))

(declare-fun m!653819 () Bool)

(assert (=> b!690210 m!653819))

(declare-fun m!653821 () Bool)

(assert (=> start!61692 m!653821))

(assert (=> b!690205 m!653819))

(declare-fun m!653823 () Bool)

(assert (=> b!690204 m!653823))

(push 1)

(assert (not b!690209))

(assert (not start!61692))

(assert (not b!690210))

(assert (not b!690212))

(assert (not b!690205))

(assert (not b!690208))

(assert (not b!690204))

(assert (not b!690211))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

