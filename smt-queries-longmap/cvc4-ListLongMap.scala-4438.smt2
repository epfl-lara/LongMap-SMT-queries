; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61698 () Bool)

(assert start!61698)

(declare-fun b!690285 () Bool)

(declare-fun res!454695 () Bool)

(declare-fun e!393065 () Bool)

(assert (=> b!690285 (=> (not res!454695) (not e!393065))))

(declare-datatypes ((List!13087 0))(
  ( (Nil!13084) (Cons!13083 (h!14128 (_ BitVec 64)) (t!19354 List!13087)) )
))
(declare-fun acc!681 () List!13087)

(declare-fun contains!3664 (List!13087 (_ BitVec 64)) Bool)

(assert (=> b!690285 (= res!454695 (not (contains!3664 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690286 () Bool)

(declare-fun e!393064 () Bool)

(declare-fun e!393062 () Bool)

(assert (=> b!690286 (= e!393064 e!393062)))

(declare-fun res!454689 () Bool)

(assert (=> b!690286 (=> (not res!454689) (not e!393062))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!690286 (= res!454689 (bvsle from!3004 i!1382))))

(declare-fun b!690287 () Bool)

(declare-fun res!454693 () Bool)

(assert (=> b!690287 (=> (not res!454693) (not e!393065))))

(assert (=> b!690287 (= res!454693 e!393064)))

(declare-fun res!454696 () Bool)

(assert (=> b!690287 (=> res!454696 e!393064)))

(declare-fun e!393066 () Bool)

(assert (=> b!690287 (= res!454696 e!393066)))

(declare-fun res!454697 () Bool)

(assert (=> b!690287 (=> (not res!454697) (not e!393066))))

(assert (=> b!690287 (= res!454697 (bvsgt from!3004 i!1382))))

(declare-fun b!690288 () Bool)

(declare-fun res!454690 () Bool)

(assert (=> b!690288 (=> (not res!454690) (not e!393065))))

(declare-datatypes ((array!39752 0))(
  ( (array!39753 (arr!19046 (Array (_ BitVec 32) (_ BitVec 64))) (size!19431 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39752)

(declare-fun arrayNoDuplicates!0 (array!39752 (_ BitVec 32) List!13087) Bool)

(assert (=> b!690288 (= res!454690 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13084))))

(declare-fun b!690290 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!690290 (= e!393062 (not (contains!3664 acc!681 k!2843)))))

(declare-fun b!690291 () Bool)

(declare-fun res!454694 () Bool)

(assert (=> b!690291 (=> (not res!454694) (not e!393065))))

(declare-fun noDuplicate!911 (List!13087) Bool)

(assert (=> b!690291 (= res!454694 (noDuplicate!911 acc!681))))

(declare-fun b!690292 () Bool)

(assert (=> b!690292 (= e!393065 false)))

(declare-fun lt!316423 () Bool)

(assert (=> b!690292 (= lt!316423 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!690293 () Bool)

(declare-fun res!454692 () Bool)

(assert (=> b!690293 (=> (not res!454692) (not e!393065))))

(assert (=> b!690293 (= res!454692 (not (contains!3664 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690289 () Bool)

(assert (=> b!690289 (= e!393066 (contains!3664 acc!681 k!2843))))

(declare-fun res!454691 () Bool)

(assert (=> start!61698 (=> (not res!454691) (not e!393065))))

(assert (=> start!61698 (= res!454691 (and (bvslt (size!19431 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19431 a!3626))))))

(assert (=> start!61698 e!393065))

(assert (=> start!61698 true))

(declare-fun array_inv!14842 (array!39752) Bool)

(assert (=> start!61698 (array_inv!14842 a!3626)))

(assert (= (and start!61698 res!454691) b!690291))

(assert (= (and b!690291 res!454694) b!690285))

(assert (= (and b!690285 res!454695) b!690293))

(assert (= (and b!690293 res!454692) b!690287))

(assert (= (and b!690287 res!454697) b!690289))

(assert (= (and b!690287 (not res!454696)) b!690286))

(assert (= (and b!690286 res!454689) b!690290))

(assert (= (and b!690287 res!454693) b!690288))

(assert (= (and b!690288 res!454690) b!690292))

(declare-fun m!653853 () Bool)

(assert (=> b!690288 m!653853))

(declare-fun m!653855 () Bool)

(assert (=> b!690290 m!653855))

(declare-fun m!653857 () Bool)

(assert (=> b!690291 m!653857))

(declare-fun m!653859 () Bool)

(assert (=> b!690285 m!653859))

(declare-fun m!653861 () Bool)

(assert (=> start!61698 m!653861))

(declare-fun m!653863 () Bool)

(assert (=> b!690293 m!653863))

(declare-fun m!653865 () Bool)

(assert (=> b!690292 m!653865))

(assert (=> b!690289 m!653855))

(push 1)

(assert (not start!61698))

(assert (not b!690291))

(assert (not b!690288))

(assert (not b!690285))

(assert (not b!690292))

(assert (not b!690290))

(assert (not b!690289))

(assert (not b!690293))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

