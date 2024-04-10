; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60288 () Bool)

(assert start!60288)

(declare-fun b!676474 () Bool)

(declare-fun res!442910 () Bool)

(declare-fun e!385805 () Bool)

(assert (=> b!676474 (=> (not res!442910) (not e!385805))))

(declare-datatypes ((List!12901 0))(
  ( (Nil!12898) (Cons!12897 (h!13942 (_ BitVec 64)) (t!19129 List!12901)) )
))
(declare-fun acc!681 () List!12901)

(declare-fun noDuplicate!725 (List!12901) Bool)

(assert (=> b!676474 (= res!442910 (noDuplicate!725 acc!681))))

(declare-fun res!442917 () Bool)

(assert (=> start!60288 (=> (not res!442917) (not e!385805))))

(declare-datatypes ((array!39335 0))(
  ( (array!39336 (arr!18860 (Array (_ BitVec 32) (_ BitVec 64))) (size!19224 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39335)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60288 (= res!442917 (and (bvslt (size!19224 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19224 a!3626))))))

(assert (=> start!60288 e!385805))

(assert (=> start!60288 true))

(declare-fun array_inv!14656 (array!39335) Bool)

(assert (=> start!60288 (array_inv!14656 a!3626)))

(declare-fun b!676475 () Bool)

(declare-fun res!442912 () Bool)

(assert (=> b!676475 (=> (not res!442912) (not e!385805))))

(declare-fun contains!3478 (List!12901 (_ BitVec 64)) Bool)

(assert (=> b!676475 (= res!442912 (not (contains!3478 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676476 () Bool)

(declare-fun res!442902 () Bool)

(assert (=> b!676476 (=> (not res!442902) (not e!385805))))

(assert (=> b!676476 (= res!442902 (not (contains!3478 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!676477 () Bool)

(declare-fun res!442906 () Bool)

(assert (=> b!676477 (=> (not res!442906) (not e!385805))))

(assert (=> b!676477 (= res!442906 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!676478 () Bool)

(declare-fun e!385803 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!676478 (= e!385803 (not (contains!3478 acc!681 k!2843)))))

(declare-fun b!676479 () Bool)

(declare-fun e!385802 () Bool)

(assert (=> b!676479 (= e!385802 (contains!3478 acc!681 k!2843))))

(declare-fun b!676480 () Bool)

(declare-fun res!442904 () Bool)

(assert (=> b!676480 (=> (not res!442904) (not e!385805))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!676480 (= res!442904 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19224 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!676481 () Bool)

(declare-fun e!385799 () Bool)

(assert (=> b!676481 (= e!385799 e!385803)))

(declare-fun res!442900 () Bool)

(assert (=> b!676481 (=> (not res!442900) (not e!385803))))

(assert (=> b!676481 (= res!442900 (bvsle from!3004 i!1382))))

(declare-fun b!676482 () Bool)

(declare-fun res!442901 () Bool)

(assert (=> b!676482 (=> (not res!442901) (not e!385805))))

(assert (=> b!676482 (= res!442901 e!385799)))

(declare-fun res!442908 () Bool)

(assert (=> b!676482 (=> res!442908 e!385799)))

(assert (=> b!676482 (= res!442908 e!385802)))

(declare-fun res!442913 () Bool)

(assert (=> b!676482 (=> (not res!442913) (not e!385802))))

(assert (=> b!676482 (= res!442913 (bvsgt from!3004 i!1382))))

(declare-fun b!676483 () Bool)

(declare-fun res!442909 () Bool)

(assert (=> b!676483 (=> (not res!442909) (not e!385805))))

(declare-fun arrayNoDuplicates!0 (array!39335 (_ BitVec 32) List!12901) Bool)

(assert (=> b!676483 (= res!442909 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!676484 () Bool)

(assert (=> b!676484 (= e!385805 false)))

(declare-fun lt!312778 () Bool)

(assert (=> b!676484 (= lt!312778 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681))))

(declare-fun b!676485 () Bool)

(declare-fun res!442916 () Bool)

(assert (=> b!676485 (=> (not res!442916) (not e!385805))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!676485 (= res!442916 (validKeyInArray!0 k!2843))))

(declare-fun b!676486 () Bool)

(declare-fun e!385800 () Bool)

(assert (=> b!676486 (= e!385800 (contains!3478 acc!681 k!2843))))

(declare-fun b!676487 () Bool)

(declare-fun res!442907 () Bool)

(assert (=> b!676487 (=> (not res!442907) (not e!385805))))

(assert (=> b!676487 (= res!442907 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19224 a!3626))))))

(declare-fun b!676488 () Bool)

(declare-fun res!442903 () Bool)

(assert (=> b!676488 (=> (not res!442903) (not e!385805))))

(assert (=> b!676488 (= res!442903 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12898))))

(declare-fun b!676489 () Bool)

(declare-fun e!385806 () Bool)

(assert (=> b!676489 (= e!385806 (not (contains!3478 acc!681 k!2843)))))

(declare-fun b!676490 () Bool)

(declare-fun res!442905 () Bool)

(assert (=> b!676490 (=> (not res!442905) (not e!385805))))

(declare-fun e!385801 () Bool)

(assert (=> b!676490 (= res!442905 e!385801)))

(declare-fun res!442915 () Bool)

(assert (=> b!676490 (=> res!442915 e!385801)))

(assert (=> b!676490 (= res!442915 e!385800)))

(declare-fun res!442919 () Bool)

(assert (=> b!676490 (=> (not res!442919) (not e!385800))))

(assert (=> b!676490 (= res!442919 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!676491 () Bool)

(declare-fun res!442914 () Bool)

(assert (=> b!676491 (=> (not res!442914) (not e!385805))))

(declare-fun arrayContainsKey!0 (array!39335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!676491 (= res!442914 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!676492 () Bool)

(declare-fun res!442911 () Bool)

(assert (=> b!676492 (=> (not res!442911) (not e!385805))))

(assert (=> b!676492 (= res!442911 (not (validKeyInArray!0 (select (arr!18860 a!3626) from!3004))))))

(declare-fun b!676493 () Bool)

(assert (=> b!676493 (= e!385801 e!385806)))

(declare-fun res!442918 () Bool)

(assert (=> b!676493 (=> (not res!442918) (not e!385806))))

(assert (=> b!676493 (= res!442918 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60288 res!442917) b!676474))

(assert (= (and b!676474 res!442910) b!676476))

(assert (= (and b!676476 res!442902) b!676475))

(assert (= (and b!676475 res!442912) b!676482))

(assert (= (and b!676482 res!442913) b!676479))

(assert (= (and b!676482 (not res!442908)) b!676481))

(assert (= (and b!676481 res!442900) b!676478))

(assert (= (and b!676482 res!442901) b!676488))

(assert (= (and b!676488 res!442903) b!676483))

(assert (= (and b!676483 res!442909) b!676487))

(assert (= (and b!676487 res!442907) b!676485))

(assert (= (and b!676485 res!442916) b!676491))

(assert (= (and b!676491 res!442914) b!676480))

(assert (= (and b!676480 res!442904) b!676492))

(assert (= (and b!676492 res!442911) b!676477))

(assert (= (and b!676477 res!442906) b!676490))

(assert (= (and b!676490 res!442919) b!676486))

(assert (= (and b!676490 (not res!442915)) b!676493))

(assert (= (and b!676493 res!442918) b!676489))

(assert (= (and b!676490 res!442905) b!676484))

(declare-fun m!643307 () Bool)

(assert (=> start!60288 m!643307))

(declare-fun m!643309 () Bool)

(assert (=> b!676485 m!643309))

(declare-fun m!643311 () Bool)

(assert (=> b!676484 m!643311))

(declare-fun m!643313 () Bool)

(assert (=> b!676488 m!643313))

(declare-fun m!643315 () Bool)

(assert (=> b!676491 m!643315))

(declare-fun m!643317 () Bool)

(assert (=> b!676486 m!643317))

(declare-fun m!643319 () Bool)

(assert (=> b!676474 m!643319))

(declare-fun m!643321 () Bool)

(assert (=> b!676475 m!643321))

(declare-fun m!643323 () Bool)

(assert (=> b!676476 m!643323))

(declare-fun m!643325 () Bool)

(assert (=> b!676492 m!643325))

(assert (=> b!676492 m!643325))

(declare-fun m!643327 () Bool)

(assert (=> b!676492 m!643327))

(assert (=> b!676479 m!643317))

(assert (=> b!676489 m!643317))

(assert (=> b!676478 m!643317))

(declare-fun m!643329 () Bool)

(assert (=> b!676483 m!643329))

(push 1)

(assert (not b!676491))

(assert (not b!676475))

(assert (not start!60288))

(assert (not b!676483))

(assert (not b!676474))

(assert (not b!676489))

(assert (not b!676476))

(assert (not b!676478))

(assert (not b!676479))

(assert (not b!676488))

(assert (not b!676484))

(assert (not b!676485))

(assert (not b!676492))

(assert (not b!676486))

(check-sat)

