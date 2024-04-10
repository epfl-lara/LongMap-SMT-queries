; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60122 () Bool)

(assert start!60122)

(declare-fun b!670869 () Bool)

(declare-fun e!383534 () Bool)

(assert (=> b!670869 (= e!383534 false)))

(declare-datatypes ((array!39169 0))(
  ( (array!39170 (arr!18777 (Array (_ BitVec 32) (_ BitVec 64))) (size!19141 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39169)

(declare-fun lt!312160 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12818 0))(
  ( (Nil!12815) (Cons!12814 (h!13859 (_ BitVec 64)) (t!19046 List!12818)) )
))
(declare-fun acc!681 () List!12818)

(declare-fun arrayNoDuplicates!0 (array!39169 (_ BitVec 32) List!12818) Bool)

(assert (=> b!670869 (= lt!312160 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!437567 () Bool)

(assert (=> start!60122 (=> (not res!437567) (not e!383534))))

(assert (=> start!60122 (= res!437567 (and (bvslt (size!19141 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19141 a!3626))))))

(assert (=> start!60122 e!383534))

(assert (=> start!60122 true))

(declare-fun array_inv!14573 (array!39169) Bool)

(assert (=> start!60122 (array_inv!14573 a!3626)))

(declare-fun b!670870 () Bool)

(declare-fun res!437569 () Bool)

(assert (=> b!670870 (=> (not res!437569) (not e!383534))))

(declare-fun contains!3395 (List!12818 (_ BitVec 64)) Bool)

(assert (=> b!670870 (= res!437569 (not (contains!3395 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670871 () Bool)

(declare-fun e!383531 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!670871 (= e!383531 (not (contains!3395 acc!681 k!2843)))))

(declare-fun b!670872 () Bool)

(declare-fun res!437572 () Bool)

(assert (=> b!670872 (=> (not res!437572) (not e!383534))))

(declare-fun noDuplicate!642 (List!12818) Bool)

(assert (=> b!670872 (= res!437572 (noDuplicate!642 acc!681))))

(declare-fun b!670873 () Bool)

(declare-fun res!437568 () Bool)

(assert (=> b!670873 (=> (not res!437568) (not e!383534))))

(assert (=> b!670873 (= res!437568 (not (contains!3395 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670874 () Bool)

(declare-fun e!383533 () Bool)

(assert (=> b!670874 (= e!383533 e!383531)))

(declare-fun res!437571 () Bool)

(assert (=> b!670874 (=> (not res!437571) (not e!383531))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670874 (= res!437571 (bvsle from!3004 i!1382))))

(declare-fun b!670875 () Bool)

(declare-fun res!437565 () Bool)

(assert (=> b!670875 (=> (not res!437565) (not e!383534))))

(assert (=> b!670875 (= res!437565 e!383533)))

(declare-fun res!437566 () Bool)

(assert (=> b!670875 (=> res!437566 e!383533)))

(declare-fun e!383532 () Bool)

(assert (=> b!670875 (= res!437566 e!383532)))

(declare-fun res!437570 () Bool)

(assert (=> b!670875 (=> (not res!437570) (not e!383532))))

(assert (=> b!670875 (= res!437570 (bvsgt from!3004 i!1382))))

(declare-fun b!670876 () Bool)

(assert (=> b!670876 (= e!383532 (contains!3395 acc!681 k!2843))))

(declare-fun b!670877 () Bool)

(declare-fun res!437573 () Bool)

(assert (=> b!670877 (=> (not res!437573) (not e!383534))))

(assert (=> b!670877 (= res!437573 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12815))))

(assert (= (and start!60122 res!437567) b!670872))

(assert (= (and b!670872 res!437572) b!670873))

(assert (= (and b!670873 res!437568) b!670870))

(assert (= (and b!670870 res!437569) b!670875))

(assert (= (and b!670875 res!437570) b!670876))

(assert (= (and b!670875 (not res!437566)) b!670874))

(assert (= (and b!670874 res!437571) b!670871))

(assert (= (and b!670875 res!437565) b!670877))

(assert (= (and b!670877 res!437573) b!670869))

(declare-fun m!640643 () Bool)

(assert (=> b!670876 m!640643))

(declare-fun m!640645 () Bool)

(assert (=> b!670877 m!640645))

(declare-fun m!640647 () Bool)

(assert (=> b!670873 m!640647))

(declare-fun m!640649 () Bool)

(assert (=> b!670872 m!640649))

(declare-fun m!640651 () Bool)

(assert (=> b!670869 m!640651))

(declare-fun m!640653 () Bool)

(assert (=> b!670870 m!640653))

(assert (=> b!670871 m!640643))

(declare-fun m!640655 () Bool)

(assert (=> start!60122 m!640655))

(push 1)

(assert (not b!670870))

(assert (not b!670873))

(assert (not b!670872))

(assert (not b!670877))

(assert (not b!670876))

(assert (not b!670871))

(assert (not b!670869))

(assert (not start!60122))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

