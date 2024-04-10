; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60426 () Bool)

(assert start!60426)

(declare-fun b!678997 () Bool)

(declare-fun res!445382 () Bool)

(declare-fun e!386889 () Bool)

(assert (=> b!678997 (=> (not res!445382) (not e!386889))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39440 0))(
  ( (array!39441 (arr!18911 (Array (_ BitVec 32) (_ BitVec 64))) (size!19275 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39440)

(assert (=> b!678997 (= res!445382 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19275 a!3626))))))

(declare-fun b!678998 () Bool)

(declare-fun res!445383 () Bool)

(assert (=> b!678998 (=> (not res!445383) (not e!386889))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12952 0))(
  ( (Nil!12949) (Cons!12948 (h!13993 (_ BitVec 64)) (t!19180 List!12952)) )
))
(declare-fun acc!681 () List!12952)

(declare-fun arrayNoDuplicates!0 (array!39440 (_ BitVec 32) List!12952) Bool)

(assert (=> b!678998 (= res!445383 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!445392 () Bool)

(assert (=> start!60426 (=> (not res!445392) (not e!386889))))

(assert (=> start!60426 (= res!445392 (and (bvslt (size!19275 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19275 a!3626))))))

(assert (=> start!60426 e!386889))

(assert (=> start!60426 true))

(declare-fun array_inv!14707 (array!39440) Bool)

(assert (=> start!60426 (array_inv!14707 a!3626)))

(declare-fun b!678999 () Bool)

(declare-fun res!445387 () Bool)

(assert (=> b!678999 (=> (not res!445387) (not e!386889))))

(assert (=> b!678999 (= res!445387 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12949))))

(declare-fun b!679000 () Bool)

(declare-fun res!445385 () Bool)

(assert (=> b!679000 (=> (not res!445385) (not e!386889))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39440 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!679000 (= res!445385 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!679001 () Bool)

(declare-fun res!445381 () Bool)

(assert (=> b!679001 (=> (not res!445381) (not e!386889))))

(declare-fun contains!3529 (List!12952 (_ BitVec 64)) Bool)

(assert (=> b!679001 (= res!445381 (not (contains!3529 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679002 () Bool)

(declare-fun e!386887 () Bool)

(assert (=> b!679002 (= e!386887 (not (contains!3529 acc!681 k!2843)))))

(declare-fun b!679003 () Bool)

(assert (=> b!679003 (= e!386889 (not true))))

(assert (=> b!679003 (arrayContainsKey!0 (array!39441 (store (arr!18911 a!3626) i!1382 k!2843) (size!19275 a!3626)) k!2843 from!3004)))

(declare-fun b!679004 () Bool)

(declare-fun res!445388 () Bool)

(assert (=> b!679004 (=> (not res!445388) (not e!386889))))

(assert (=> b!679004 (= res!445388 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19275 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!679005 () Bool)

(declare-fun res!445393 () Bool)

(assert (=> b!679005 (=> (not res!445393) (not e!386889))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!679005 (= res!445393 (validKeyInArray!0 k!2843))))

(declare-fun b!679006 () Bool)

(declare-fun res!445389 () Bool)

(assert (=> b!679006 (=> (not res!445389) (not e!386889))))

(declare-fun e!386886 () Bool)

(assert (=> b!679006 (= res!445389 e!386886)))

(declare-fun res!445384 () Bool)

(assert (=> b!679006 (=> res!445384 e!386886)))

(declare-fun e!386888 () Bool)

(assert (=> b!679006 (= res!445384 e!386888)))

(declare-fun res!445390 () Bool)

(assert (=> b!679006 (=> (not res!445390) (not e!386888))))

(assert (=> b!679006 (= res!445390 (bvsgt from!3004 i!1382))))

(declare-fun b!679007 () Bool)

(assert (=> b!679007 (= e!386886 e!386887)))

(declare-fun res!445394 () Bool)

(assert (=> b!679007 (=> (not res!445394) (not e!386887))))

(assert (=> b!679007 (= res!445394 (bvsle from!3004 i!1382))))

(declare-fun b!679008 () Bool)

(declare-fun res!445391 () Bool)

(assert (=> b!679008 (=> (not res!445391) (not e!386889))))

(declare-fun noDuplicate!776 (List!12952) Bool)

(assert (=> b!679008 (= res!445391 (noDuplicate!776 acc!681))))

(declare-fun b!679009 () Bool)

(declare-fun res!445386 () Bool)

(assert (=> b!679009 (=> (not res!445386) (not e!386889))))

(assert (=> b!679009 (= res!445386 (not (contains!3529 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!679010 () Bool)

(assert (=> b!679010 (= e!386888 (contains!3529 acc!681 k!2843))))

(assert (= (and start!60426 res!445392) b!679008))

(assert (= (and b!679008 res!445391) b!679009))

(assert (= (and b!679009 res!445386) b!679001))

(assert (= (and b!679001 res!445381) b!679006))

(assert (= (and b!679006 res!445390) b!679010))

(assert (= (and b!679006 (not res!445384)) b!679007))

(assert (= (and b!679007 res!445394) b!679002))

(assert (= (and b!679006 res!445389) b!678999))

(assert (= (and b!678999 res!445387) b!678998))

(assert (= (and b!678998 res!445383) b!678997))

(assert (= (and b!678997 res!445382) b!679005))

(assert (= (and b!679005 res!445393) b!679000))

(assert (= (and b!679000 res!445385) b!679004))

(assert (= (and b!679004 res!445388) b!679003))

(declare-fun m!644557 () Bool)

(assert (=> b!679009 m!644557))

(declare-fun m!644559 () Bool)

(assert (=> b!679001 m!644559))

(declare-fun m!644561 () Bool)

(assert (=> b!679010 m!644561))

(declare-fun m!644563 () Bool)

(assert (=> b!678998 m!644563))

(declare-fun m!644565 () Bool)

(assert (=> b!679005 m!644565))

(declare-fun m!644567 () Bool)

(assert (=> b!678999 m!644567))

(declare-fun m!644569 () Bool)

(assert (=> b!679000 m!644569))

(assert (=> b!679002 m!644561))

(declare-fun m!644571 () Bool)

(assert (=> b!679003 m!644571))

(declare-fun m!644573 () Bool)

(assert (=> b!679003 m!644573))

(declare-fun m!644575 () Bool)

(assert (=> b!679008 m!644575))

(declare-fun m!644577 () Bool)

(assert (=> start!60426 m!644577))

(push 1)

(assert (not start!60426))

(assert (not b!679005))

(assert (not b!678999))

(assert (not b!679010))

(assert (not b!679008))

(assert (not b!679001))

(assert (not b!679003))

(assert (not b!678998))

(assert (not b!679000))

(assert (not b!679009))

(assert (not b!679002))

(check-sat)

