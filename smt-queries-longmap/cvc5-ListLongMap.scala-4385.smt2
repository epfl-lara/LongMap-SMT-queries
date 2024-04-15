; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60330 () Bool)

(assert start!60330)

(declare-fun b!677683 () Bool)

(declare-fun e!386206 () Bool)

(declare-datatypes ((List!12966 0))(
  ( (Nil!12963) (Cons!12962 (h!14007 (_ BitVec 64)) (t!19185 List!12966)) )
))
(declare-fun acc!681 () List!12966)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3488 (List!12966 (_ BitVec 64)) Bool)

(assert (=> b!677683 (= e!386206 (contains!3488 acc!681 k!2843))))

(declare-fun b!677684 () Bool)

(declare-fun res!444276 () Bool)

(declare-fun e!386208 () Bool)

(assert (=> b!677684 (=> (not res!444276) (not e!386208))))

(declare-fun e!386207 () Bool)

(assert (=> b!677684 (= res!444276 e!386207)))

(declare-fun res!444271 () Bool)

(assert (=> b!677684 (=> res!444271 e!386207)))

(assert (=> b!677684 (= res!444271 e!386206)))

(declare-fun res!444273 () Bool)

(assert (=> b!677684 (=> (not res!444273) (not e!386206))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677684 (= res!444273 (bvsgt from!3004 i!1382))))

(declare-fun res!444269 () Bool)

(assert (=> start!60330 (=> (not res!444269) (not e!386208))))

(declare-datatypes ((array!39388 0))(
  ( (array!39389 (arr!18886 (Array (_ BitVec 32) (_ BitVec 64))) (size!19251 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39388)

(assert (=> start!60330 (= res!444269 (and (bvslt (size!19251 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19251 a!3626))))))

(assert (=> start!60330 e!386208))

(assert (=> start!60330 true))

(declare-fun array_inv!14769 (array!39388) Bool)

(assert (=> start!60330 (array_inv!14769 a!3626)))

(declare-fun b!677685 () Bool)

(declare-fun res!444270 () Bool)

(assert (=> b!677685 (=> (not res!444270) (not e!386208))))

(assert (=> b!677685 (= res!444270 (not (contains!3488 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677686 () Bool)

(declare-fun res!444272 () Bool)

(assert (=> b!677686 (=> (not res!444272) (not e!386208))))

(declare-fun arrayNoDuplicates!0 (array!39388 (_ BitVec 32) List!12966) Bool)

(assert (=> b!677686 (= res!444272 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12963))))

(declare-fun b!677687 () Bool)

(declare-fun e!386209 () Bool)

(assert (=> b!677687 (= e!386209 (not (contains!3488 acc!681 k!2843)))))

(declare-fun b!677688 () Bool)

(declare-fun res!444275 () Bool)

(assert (=> b!677688 (=> (not res!444275) (not e!386208))))

(assert (=> b!677688 (= res!444275 (not (contains!3488 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677689 () Bool)

(assert (=> b!677689 (= e!386208 false)))

(declare-fun lt!312594 () Bool)

(assert (=> b!677689 (= lt!312594 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677690 () Bool)

(declare-fun res!444277 () Bool)

(assert (=> b!677690 (=> (not res!444277) (not e!386208))))

(declare-fun noDuplicate!757 (List!12966) Bool)

(assert (=> b!677690 (= res!444277 (noDuplicate!757 acc!681))))

(declare-fun b!677691 () Bool)

(assert (=> b!677691 (= e!386207 e!386209)))

(declare-fun res!444274 () Bool)

(assert (=> b!677691 (=> (not res!444274) (not e!386209))))

(assert (=> b!677691 (= res!444274 (bvsle from!3004 i!1382))))

(assert (= (and start!60330 res!444269) b!677690))

(assert (= (and b!677690 res!444277) b!677688))

(assert (= (and b!677688 res!444275) b!677685))

(assert (= (and b!677685 res!444270) b!677684))

(assert (= (and b!677684 res!444273) b!677683))

(assert (= (and b!677684 (not res!444271)) b!677691))

(assert (= (and b!677691 res!444274) b!677687))

(assert (= (and b!677684 res!444276) b!677686))

(assert (= (and b!677686 res!444272) b!677689))

(declare-fun m!643207 () Bool)

(assert (=> b!677686 m!643207))

(declare-fun m!643209 () Bool)

(assert (=> b!677688 m!643209))

(declare-fun m!643211 () Bool)

(assert (=> b!677690 m!643211))

(declare-fun m!643213 () Bool)

(assert (=> start!60330 m!643213))

(declare-fun m!643215 () Bool)

(assert (=> b!677687 m!643215))

(declare-fun m!643217 () Bool)

(assert (=> b!677689 m!643217))

(assert (=> b!677683 m!643215))

(declare-fun m!643219 () Bool)

(assert (=> b!677685 m!643219))

(push 1)

(assert (not b!677688))

(assert (not b!677686))

(assert (not b!677689))

(assert (not b!677683))

(assert (not b!677685))

(assert (not b!677687))

(assert (not b!677690))

(assert (not start!60330))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

