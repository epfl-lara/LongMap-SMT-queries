; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62420 () Bool)

(assert start!62420)

(declare-fun b!698687 () Bool)

(declare-fun res!462400 () Bool)

(declare-fun e!397185 () Bool)

(assert (=> b!698687 (=> (not res!462400) (not e!397185))))

(declare-datatypes ((List!13121 0))(
  ( (Nil!13118) (Cons!13117 (h!14165 (_ BitVec 64)) (t!19395 List!13121)) )
))
(declare-fun acc!652 () List!13121)

(declare-fun contains!3773 (List!13121 (_ BitVec 64)) Bool)

(assert (=> b!698687 (= res!462400 (not (contains!3773 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698688 () Bool)

(declare-fun res!462398 () Bool)

(assert (=> b!698688 (=> (not res!462398) (not e!397185))))

(declare-datatypes ((array!40039 0))(
  ( (array!40040 (arr!19173 (Array (_ BitVec 32) (_ BitVec 64))) (size!19556 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40039)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!698688 (= res!462398 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!698689 () Bool)

(declare-fun res!462399 () Bool)

(assert (=> b!698689 (=> (not res!462399) (not e!397185))))

(assert (=> b!698689 (= res!462399 (not (contains!3773 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698690 () Bool)

(declare-fun res!462403 () Bool)

(assert (=> b!698690 (=> (not res!462403) (not e!397185))))

(declare-fun noDuplicate!1047 (List!13121) Bool)

(assert (=> b!698690 (= res!462403 (noDuplicate!1047 acc!652))))

(declare-fun res!462402 () Bool)

(assert (=> start!62420 (=> (not res!462402) (not e!397185))))

(assert (=> start!62420 (= res!462402 (and (bvslt (size!19556 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19556 a!3591))))))

(assert (=> start!62420 e!397185))

(assert (=> start!62420 true))

(declare-fun array_inv!15032 (array!40039) Bool)

(assert (=> start!62420 (array_inv!15032 a!3591)))

(declare-fun b!698691 () Bool)

(assert (=> b!698691 (= e!397185 false)))

(declare-fun lt!317373 () Bool)

(assert (=> b!698691 (= lt!317373 (contains!3773 acc!652 k!2824))))

(declare-fun b!698692 () Bool)

(declare-fun res!462401 () Bool)

(assert (=> b!698692 (=> (not res!462401) (not e!397185))))

(declare-fun newAcc!49 () List!13121)

(assert (=> b!698692 (= res!462401 (noDuplicate!1047 newAcc!49))))

(assert (= (and start!62420 res!462402) b!698690))

(assert (= (and b!698690 res!462403) b!698692))

(assert (= (and b!698692 res!462401) b!698687))

(assert (= (and b!698687 res!462400) b!698689))

(assert (= (and b!698689 res!462399) b!698688))

(assert (= (and b!698688 res!462398) b!698691))

(declare-fun m!659395 () Bool)

(assert (=> b!698691 m!659395))

(declare-fun m!659397 () Bool)

(assert (=> b!698692 m!659397))

(declare-fun m!659399 () Bool)

(assert (=> start!62420 m!659399))

(declare-fun m!659401 () Bool)

(assert (=> b!698689 m!659401))

(declare-fun m!659403 () Bool)

(assert (=> b!698688 m!659403))

(declare-fun m!659405 () Bool)

(assert (=> b!698690 m!659405))

(declare-fun m!659407 () Bool)

(assert (=> b!698687 m!659407))

(push 1)

(assert (not b!698692))

(assert (not b!698690))

(assert (not start!62420))

(assert (not b!698688))

(assert (not b!698689))

(assert (not b!698687))

(assert (not b!698691))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

