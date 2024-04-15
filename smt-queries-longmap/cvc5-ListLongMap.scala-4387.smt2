; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60342 () Bool)

(assert start!60342)

(declare-fun b!677845 () Bool)

(declare-fun e!386296 () Bool)

(declare-fun e!386297 () Bool)

(assert (=> b!677845 (= e!386296 e!386297)))

(declare-fun res!444433 () Bool)

(assert (=> b!677845 (=> (not res!444433) (not e!386297))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!677845 (= res!444433 (bvsle from!3004 i!1382))))

(declare-fun b!677846 () Bool)

(declare-fun res!444431 () Bool)

(declare-fun e!386298 () Bool)

(assert (=> b!677846 (=> (not res!444431) (not e!386298))))

(declare-datatypes ((List!12972 0))(
  ( (Nil!12969) (Cons!12968 (h!14013 (_ BitVec 64)) (t!19191 List!12972)) )
))
(declare-fun acc!681 () List!12972)

(declare-fun noDuplicate!763 (List!12972) Bool)

(assert (=> b!677846 (= res!444431 (noDuplicate!763 acc!681))))

(declare-fun b!677848 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3494 (List!12972 (_ BitVec 64)) Bool)

(assert (=> b!677848 (= e!386297 (not (contains!3494 acc!681 k!2843)))))

(declare-fun b!677849 () Bool)

(declare-fun e!386300 () Bool)

(assert (=> b!677849 (= e!386300 (contains!3494 acc!681 k!2843))))

(declare-fun res!444434 () Bool)

(assert (=> start!60342 (=> (not res!444434) (not e!386298))))

(declare-datatypes ((array!39400 0))(
  ( (array!39401 (arr!18892 (Array (_ BitVec 32) (_ BitVec 64))) (size!19257 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39400)

(assert (=> start!60342 (= res!444434 (and (bvslt (size!19257 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19257 a!3626))))))

(assert (=> start!60342 e!386298))

(assert (=> start!60342 true))

(declare-fun array_inv!14775 (array!39400) Bool)

(assert (=> start!60342 (array_inv!14775 a!3626)))

(declare-fun b!677847 () Bool)

(assert (=> b!677847 (= e!386298 false)))

(declare-fun lt!312612 () Bool)

(declare-fun arrayNoDuplicates!0 (array!39400 (_ BitVec 32) List!12972) Bool)

(assert (=> b!677847 (= lt!312612 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!677850 () Bool)

(declare-fun res!444439 () Bool)

(assert (=> b!677850 (=> (not res!444439) (not e!386298))))

(assert (=> b!677850 (= res!444439 e!386296)))

(declare-fun res!444435 () Bool)

(assert (=> b!677850 (=> res!444435 e!386296)))

(assert (=> b!677850 (= res!444435 e!386300)))

(declare-fun res!444437 () Bool)

(assert (=> b!677850 (=> (not res!444437) (not e!386300))))

(assert (=> b!677850 (= res!444437 (bvsgt from!3004 i!1382))))

(declare-fun b!677851 () Bool)

(declare-fun res!444436 () Bool)

(assert (=> b!677851 (=> (not res!444436) (not e!386298))))

(assert (=> b!677851 (= res!444436 (not (contains!3494 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677852 () Bool)

(declare-fun res!444432 () Bool)

(assert (=> b!677852 (=> (not res!444432) (not e!386298))))

(assert (=> b!677852 (= res!444432 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12969))))

(declare-fun b!677853 () Bool)

(declare-fun res!444438 () Bool)

(assert (=> b!677853 (=> (not res!444438) (not e!386298))))

(assert (=> b!677853 (= res!444438 (not (contains!3494 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!60342 res!444434) b!677846))

(assert (= (and b!677846 res!444431) b!677853))

(assert (= (and b!677853 res!444438) b!677851))

(assert (= (and b!677851 res!444436) b!677850))

(assert (= (and b!677850 res!444437) b!677849))

(assert (= (and b!677850 (not res!444435)) b!677845))

(assert (= (and b!677845 res!444433) b!677848))

(assert (= (and b!677850 res!444439) b!677852))

(assert (= (and b!677852 res!444432) b!677847))

(declare-fun m!643291 () Bool)

(assert (=> b!677847 m!643291))

(declare-fun m!643293 () Bool)

(assert (=> b!677849 m!643293))

(declare-fun m!643295 () Bool)

(assert (=> b!677853 m!643295))

(assert (=> b!677848 m!643293))

(declare-fun m!643297 () Bool)

(assert (=> b!677846 m!643297))

(declare-fun m!643299 () Bool)

(assert (=> b!677852 m!643299))

(declare-fun m!643301 () Bool)

(assert (=> start!60342 m!643301))

(declare-fun m!643303 () Bool)

(assert (=> b!677851 m!643303))

(push 1)

(assert (not b!677848))

(assert (not start!60342))

(assert (not b!677853))

(assert (not b!677852))

(assert (not b!677847))

(assert (not b!677849))

(assert (not b!677851))

(assert (not b!677846))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

