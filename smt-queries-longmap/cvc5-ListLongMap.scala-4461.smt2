; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62114 () Bool)

(assert start!62114)

(declare-fun b!695364 () Bool)

(declare-fun e!395520 () Bool)

(declare-datatypes ((List!13154 0))(
  ( (Nil!13151) (Cons!13150 (h!14195 (_ BitVec 64)) (t!19436 List!13154)) )
))
(declare-fun acc!681 () List!13154)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3731 (List!13154 (_ BitVec 64)) Bool)

(assert (=> b!695364 (= e!395520 (contains!3731 acc!681 k!2843))))

(declare-fun b!695365 () Bool)

(declare-fun res!459315 () Bool)

(declare-fun e!395519 () Bool)

(assert (=> b!695365 (=> (not res!459315) (not e!395519))))

(assert (=> b!695365 (= res!459315 (not (contains!3731 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695366 () Bool)

(declare-fun res!459313 () Bool)

(assert (=> b!695366 (=> (not res!459313) (not e!395519))))

(declare-datatypes ((array!39904 0))(
  ( (array!39905 (arr!19113 (Array (_ BitVec 32) (_ BitVec 64))) (size!19498 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39904)

(declare-fun arrayNoDuplicates!0 (array!39904 (_ BitVec 32) List!13154) Bool)

(assert (=> b!695366 (= res!459313 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13151))))

(declare-fun b!695367 () Bool)

(declare-fun e!395517 () Bool)

(assert (=> b!695367 (= e!395517 (not (contains!3731 acc!681 k!2843)))))

(declare-fun b!695368 () Bool)

(declare-fun res!459314 () Bool)

(assert (=> b!695368 (=> (not res!459314) (not e!395519))))

(assert (=> b!695368 (= res!459314 (not (contains!3731 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!695369 () Bool)

(declare-fun res!459320 () Bool)

(assert (=> b!695369 (=> (not res!459320) (not e!395519))))

(declare-fun e!395516 () Bool)

(assert (=> b!695369 (= res!459320 e!395516)))

(declare-fun res!459318 () Bool)

(assert (=> b!695369 (=> res!459318 e!395516)))

(assert (=> b!695369 (= res!459318 e!395520)))

(declare-fun res!459312 () Bool)

(assert (=> b!695369 (=> (not res!459312) (not e!395520))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!695369 (= res!459312 (bvsgt from!3004 i!1382))))

(declare-fun res!459317 () Bool)

(assert (=> start!62114 (=> (not res!459317) (not e!395519))))

(assert (=> start!62114 (= res!459317 (and (bvslt (size!19498 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19498 a!3626))))))

(assert (=> start!62114 e!395519))

(assert (=> start!62114 true))

(declare-fun array_inv!14909 (array!39904) Bool)

(assert (=> start!62114 (array_inv!14909 a!3626)))

(declare-fun b!695370 () Bool)

(assert (=> b!695370 (= e!395516 e!395517)))

(declare-fun res!459316 () Bool)

(assert (=> b!695370 (=> (not res!459316) (not e!395517))))

(assert (=> b!695370 (= res!459316 (bvsle from!3004 i!1382))))

(declare-fun b!695371 () Bool)

(declare-fun res!459319 () Bool)

(assert (=> b!695371 (=> (not res!459319) (not e!395519))))

(declare-fun noDuplicate!978 (List!13154) Bool)

(assert (=> b!695371 (= res!459319 (noDuplicate!978 acc!681))))

(declare-fun b!695372 () Bool)

(assert (=> b!695372 (= e!395519 false)))

(declare-fun lt!317053 () Bool)

(assert (=> b!695372 (= lt!317053 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(assert (= (and start!62114 res!459317) b!695371))

(assert (= (and b!695371 res!459319) b!695365))

(assert (= (and b!695365 res!459315) b!695368))

(assert (= (and b!695368 res!459314) b!695369))

(assert (= (and b!695369 res!459312) b!695364))

(assert (= (and b!695369 (not res!459318)) b!695370))

(assert (= (and b!695370 res!459316) b!695367))

(assert (= (and b!695369 res!459320) b!695366))

(assert (= (and b!695366 res!459313) b!695372))

(declare-fun m!656909 () Bool)

(assert (=> b!695365 m!656909))

(declare-fun m!656911 () Bool)

(assert (=> start!62114 m!656911))

(declare-fun m!656913 () Bool)

(assert (=> b!695364 m!656913))

(declare-fun m!656915 () Bool)

(assert (=> b!695372 m!656915))

(assert (=> b!695367 m!656913))

(declare-fun m!656917 () Bool)

(assert (=> b!695371 m!656917))

(declare-fun m!656919 () Bool)

(assert (=> b!695366 m!656919))

(declare-fun m!656921 () Bool)

(assert (=> b!695368 m!656921))

(push 1)

(assert (not b!695372))

(assert (not b!695365))

(assert (not b!695366))

(assert (not b!695364))

(assert (not start!62114))

(assert (not b!695371))

(assert (not b!695368))

(assert (not b!695367))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

