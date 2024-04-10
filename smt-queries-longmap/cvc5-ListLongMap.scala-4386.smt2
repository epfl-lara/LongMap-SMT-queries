; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60344 () Bool)

(assert start!60344)

(declare-fun b!678006 () Bool)

(declare-fun res!444433 () Bool)

(declare-fun e!386414 () Bool)

(assert (=> b!678006 (=> (not res!444433) (not e!386414))))

(declare-datatypes ((List!12929 0))(
  ( (Nil!12926) (Cons!12925 (h!13970 (_ BitVec 64)) (t!19157 List!12929)) )
))
(declare-fun acc!681 () List!12929)

(declare-fun contains!3506 (List!12929 (_ BitVec 64)) Bool)

(assert (=> b!678006 (= res!444433 (not (contains!3506 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678007 () Bool)

(declare-fun res!444437 () Bool)

(assert (=> b!678007 (=> (not res!444437) (not e!386414))))

(assert (=> b!678007 (= res!444437 (not (contains!3506 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678008 () Bool)

(declare-fun e!386411 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!678008 (= e!386411 (not (contains!3506 acc!681 k!2843)))))

(declare-fun b!678009 () Bool)

(declare-fun e!386415 () Bool)

(assert (=> b!678009 (= e!386415 e!386411)))

(declare-fun res!444435 () Bool)

(assert (=> b!678009 (=> (not res!444435) (not e!386411))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678009 (= res!444435 (bvsle from!3004 i!1382))))

(declare-fun res!444434 () Bool)

(assert (=> start!60344 (=> (not res!444434) (not e!386414))))

(declare-datatypes ((array!39391 0))(
  ( (array!39392 (arr!18888 (Array (_ BitVec 32) (_ BitVec 64))) (size!19252 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39391)

(assert (=> start!60344 (= res!444434 (and (bvslt (size!19252 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19252 a!3626))))))

(assert (=> start!60344 e!386414))

(assert (=> start!60344 true))

(declare-fun array_inv!14684 (array!39391) Bool)

(assert (=> start!60344 (array_inv!14684 a!3626)))

(declare-fun b!678010 () Bool)

(declare-fun res!444439 () Bool)

(assert (=> b!678010 (=> (not res!444439) (not e!386414))))

(assert (=> b!678010 (= res!444439 e!386415)))

(declare-fun res!444440 () Bool)

(assert (=> b!678010 (=> res!444440 e!386415)))

(declare-fun e!386413 () Bool)

(assert (=> b!678010 (= res!444440 e!386413)))

(declare-fun res!444432 () Bool)

(assert (=> b!678010 (=> (not res!444432) (not e!386413))))

(assert (=> b!678010 (= res!444432 (bvsgt from!3004 i!1382))))

(declare-fun b!678011 () Bool)

(assert (=> b!678011 (= e!386413 (contains!3506 acc!681 k!2843))))

(declare-fun b!678012 () Bool)

(declare-fun res!444436 () Bool)

(assert (=> b!678012 (=> (not res!444436) (not e!386414))))

(declare-fun arrayNoDuplicates!0 (array!39391 (_ BitVec 32) List!12929) Bool)

(assert (=> b!678012 (= res!444436 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12926))))

(declare-fun b!678013 () Bool)

(assert (=> b!678013 (= e!386414 false)))

(declare-fun lt!312853 () Bool)

(assert (=> b!678013 (= lt!312853 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678014 () Bool)

(declare-fun res!444438 () Bool)

(assert (=> b!678014 (=> (not res!444438) (not e!386414))))

(declare-fun noDuplicate!753 (List!12929) Bool)

(assert (=> b!678014 (= res!444438 (noDuplicate!753 acc!681))))

(assert (= (and start!60344 res!444434) b!678014))

(assert (= (and b!678014 res!444438) b!678007))

(assert (= (and b!678007 res!444437) b!678006))

(assert (= (and b!678006 res!444433) b!678010))

(assert (= (and b!678010 res!444432) b!678011))

(assert (= (and b!678010 (not res!444440)) b!678009))

(assert (= (and b!678009 res!444435) b!678008))

(assert (= (and b!678010 res!444439) b!678012))

(assert (= (and b!678012 res!444436) b!678013))

(declare-fun m!644003 () Bool)

(assert (=> b!678014 m!644003))

(declare-fun m!644005 () Bool)

(assert (=> b!678011 m!644005))

(declare-fun m!644007 () Bool)

(assert (=> b!678012 m!644007))

(declare-fun m!644009 () Bool)

(assert (=> b!678007 m!644009))

(declare-fun m!644011 () Bool)

(assert (=> b!678006 m!644011))

(declare-fun m!644013 () Bool)

(assert (=> start!60344 m!644013))

(assert (=> b!678008 m!644005))

(declare-fun m!644015 () Bool)

(assert (=> b!678013 m!644015))

(push 1)

(assert (not b!678008))

(assert (not b!678011))

(assert (not b!678007))

(assert (not b!678014))

(assert (not b!678006))

(assert (not b!678012))

(assert (not b!678013))

(assert (not start!60344))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

