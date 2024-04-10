; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60366 () Bool)

(assert start!60366)

(declare-fun b!678407 () Bool)

(declare-fun res!444818 () Bool)

(declare-fun e!386586 () Bool)

(assert (=> b!678407 (=> (not res!444818) (not e!386586))))

(declare-fun e!386589 () Bool)

(assert (=> b!678407 (= res!444818 e!386589)))

(declare-fun res!444815 () Bool)

(assert (=> b!678407 (=> res!444815 e!386589)))

(declare-fun e!386588 () Bool)

(assert (=> b!678407 (= res!444815 e!386588)))

(declare-fun res!444822 () Bool)

(assert (=> b!678407 (=> (not res!444822) (not e!386588))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678407 (= res!444822 (bvsgt from!3004 i!1382))))

(declare-fun b!678408 () Bool)

(declare-fun res!444823 () Bool)

(assert (=> b!678408 (=> (not res!444823) (not e!386586))))

(declare-datatypes ((List!12940 0))(
  ( (Nil!12937) (Cons!12936 (h!13981 (_ BitVec 64)) (t!19168 List!12940)) )
))
(declare-fun acc!681 () List!12940)

(declare-fun contains!3517 (List!12940 (_ BitVec 64)) Bool)

(assert (=> b!678408 (= res!444823 (not (contains!3517 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678409 () Bool)

(declare-fun res!444817 () Bool)

(assert (=> b!678409 (=> (not res!444817) (not e!386586))))

(declare-datatypes ((array!39413 0))(
  ( (array!39414 (arr!18899 (Array (_ BitVec 32) (_ BitVec 64))) (size!19263 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39413)

(declare-fun arrayNoDuplicates!0 (array!39413 (_ BitVec 32) List!12940) Bool)

(assert (=> b!678409 (= res!444817 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12937))))

(declare-fun b!678410 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!678410 (= e!386588 (contains!3517 acc!681 k!2843))))

(declare-fun b!678411 () Bool)

(declare-fun e!386585 () Bool)

(assert (=> b!678411 (= e!386589 e!386585)))

(declare-fun res!444824 () Bool)

(assert (=> b!678411 (=> (not res!444824) (not e!386585))))

(assert (=> b!678411 (= res!444824 (bvsle from!3004 i!1382))))

(declare-fun res!444825 () Bool)

(assert (=> start!60366 (=> (not res!444825) (not e!386586))))

(assert (=> start!60366 (= res!444825 (and (bvslt (size!19263 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19263 a!3626))))))

(assert (=> start!60366 e!386586))

(assert (=> start!60366 true))

(declare-fun array_inv!14695 (array!39413) Bool)

(assert (=> start!60366 (array_inv!14695 a!3626)))

(declare-fun b!678412 () Bool)

(declare-fun res!444819 () Bool)

(assert (=> b!678412 (=> (not res!444819) (not e!386586))))

(assert (=> b!678412 (= res!444819 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678413 () Bool)

(declare-fun res!444821 () Bool)

(assert (=> b!678413 (=> (not res!444821) (not e!386586))))

(assert (=> b!678413 (= res!444821 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19263 a!3626))))))

(declare-fun b!678414 () Bool)

(declare-fun res!444826 () Bool)

(assert (=> b!678414 (=> (not res!444826) (not e!386586))))

(declare-fun arrayContainsKey!0 (array!39413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678414 (= res!444826 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!678415 () Bool)

(declare-fun res!444827 () Bool)

(assert (=> b!678415 (=> (not res!444827) (not e!386586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678415 (= res!444827 (validKeyInArray!0 k!2843))))

(declare-fun b!678416 () Bool)

(declare-fun res!444816 () Bool)

(assert (=> b!678416 (=> (not res!444816) (not e!386586))))

(assert (=> b!678416 (= res!444816 (not (contains!3517 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678417 () Bool)

(assert (=> b!678417 (= e!386586 (bvslt (bvsub (size!19263 a!3626) from!3004) #b00000000000000000000000000000000))))

(declare-fun b!678418 () Bool)

(declare-fun res!444820 () Bool)

(assert (=> b!678418 (=> (not res!444820) (not e!386586))))

(declare-fun noDuplicate!764 (List!12940) Bool)

(assert (=> b!678418 (= res!444820 (noDuplicate!764 acc!681))))

(declare-fun b!678419 () Bool)

(assert (=> b!678419 (= e!386585 (not (contains!3517 acc!681 k!2843)))))

(assert (= (and start!60366 res!444825) b!678418))

(assert (= (and b!678418 res!444820) b!678408))

(assert (= (and b!678408 res!444823) b!678416))

(assert (= (and b!678416 res!444816) b!678407))

(assert (= (and b!678407 res!444822) b!678410))

(assert (= (and b!678407 (not res!444815)) b!678411))

(assert (= (and b!678411 res!444824) b!678419))

(assert (= (and b!678407 res!444818) b!678409))

(assert (= (and b!678409 res!444817) b!678412))

(assert (= (and b!678412 res!444819) b!678413))

(assert (= (and b!678413 res!444821) b!678415))

(assert (= (and b!678415 res!444827) b!678414))

(assert (= (and b!678414 res!444826) b!678417))

(declare-fun m!644201 () Bool)

(assert (=> start!60366 m!644201))

(declare-fun m!644203 () Bool)

(assert (=> b!678412 m!644203))

(declare-fun m!644205 () Bool)

(assert (=> b!678416 m!644205))

(declare-fun m!644207 () Bool)

(assert (=> b!678408 m!644207))

(declare-fun m!644209 () Bool)

(assert (=> b!678414 m!644209))

(declare-fun m!644211 () Bool)

(assert (=> b!678415 m!644211))

(declare-fun m!644213 () Bool)

(assert (=> b!678418 m!644213))

(declare-fun m!644215 () Bool)

(assert (=> b!678410 m!644215))

(declare-fun m!644217 () Bool)

(assert (=> b!678409 m!644217))

(assert (=> b!678419 m!644215))

(push 1)

(assert (not b!678412))

(assert (not b!678416))

(assert (not b!678410))

(assert (not b!678408))

(assert (not b!678409))

(assert (not b!678418))

(assert (not b!678419))

(assert (not start!60366))

(assert (not b!678415))

(assert (not b!678414))

(check-sat)

(pop 1)

(push 1)

(check-sat)

