; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62634 () Bool)

(assert start!62634)

(declare-fun b!707019 () Bool)

(declare-fun res!470837 () Bool)

(declare-fun e!398040 () Bool)

(assert (=> b!707019 (=> (not res!470837) (not e!398040))))

(declare-datatypes ((array!40313 0))(
  ( (array!40314 (arr!19313 (Array (_ BitVec 32) (_ BitVec 64))) (size!19698 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40313)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13354 0))(
  ( (Nil!13351) (Cons!13350 (h!14395 (_ BitVec 64)) (t!19636 List!13354)) )
))
(declare-fun acc!652 () List!13354)

(declare-fun arrayNoDuplicates!0 (array!40313 (_ BitVec 32) List!13354) Bool)

(assert (=> b!707019 (= res!470837 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun res!470840 () Bool)

(assert (=> start!62634 (=> (not res!470840) (not e!398040))))

(assert (=> start!62634 (= res!470840 (and (bvslt (size!19698 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19698 a!3591))))))

(assert (=> start!62634 e!398040))

(assert (=> start!62634 true))

(declare-fun array_inv!15109 (array!40313) Bool)

(assert (=> start!62634 (array_inv!15109 a!3591)))

(declare-fun b!707020 () Bool)

(declare-fun res!470834 () Bool)

(assert (=> b!707020 (=> (not res!470834) (not e!398040))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707020 (= res!470834 (validKeyInArray!0 k!2824))))

(declare-fun b!707021 () Bool)

(declare-fun res!470838 () Bool)

(assert (=> b!707021 (=> (not res!470838) (not e!398040))))

(declare-fun newAcc!49 () List!13354)

(declare-fun -!341 (List!13354 (_ BitVec 64)) List!13354)

(assert (=> b!707021 (= res!470838 (= (-!341 newAcc!49 k!2824) acc!652))))

(declare-fun b!707022 () Bool)

(declare-fun res!470836 () Bool)

(assert (=> b!707022 (=> (not res!470836) (not e!398040))))

(declare-fun contains!3931 (List!13354 (_ BitVec 64)) Bool)

(assert (=> b!707022 (= res!470836 (not (contains!3931 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707023 () Bool)

(declare-fun res!470841 () Bool)

(assert (=> b!707023 (=> (not res!470841) (not e!398040))))

(assert (=> b!707023 (= res!470841 (contains!3931 newAcc!49 k!2824))))

(declare-fun b!707024 () Bool)

(assert (=> b!707024 (= e!398040 false)))

(declare-fun lt!317985 () Bool)

(assert (=> b!707024 (= lt!317985 (contains!3931 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707025 () Bool)

(declare-fun res!470835 () Bool)

(assert (=> b!707025 (=> (not res!470835) (not e!398040))))

(assert (=> b!707025 (= res!470835 (not (contains!3931 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707026 () Bool)

(declare-fun res!470829 () Bool)

(assert (=> b!707026 (=> (not res!470829) (not e!398040))))

(declare-fun noDuplicate!1178 (List!13354) Bool)

(assert (=> b!707026 (= res!470829 (noDuplicate!1178 newAcc!49))))

(declare-fun b!707027 () Bool)

(declare-fun res!470831 () Bool)

(assert (=> b!707027 (=> (not res!470831) (not e!398040))))

(assert (=> b!707027 (= res!470831 (not (contains!3931 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707028 () Bool)

(declare-fun res!470833 () Bool)

(assert (=> b!707028 (=> (not res!470833) (not e!398040))))

(declare-fun arrayContainsKey!0 (array!40313 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707028 (= res!470833 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!707029 () Bool)

(declare-fun res!470832 () Bool)

(assert (=> b!707029 (=> (not res!470832) (not e!398040))))

(assert (=> b!707029 (= res!470832 (noDuplicate!1178 acc!652))))

(declare-fun b!707030 () Bool)

(declare-fun res!470830 () Bool)

(assert (=> b!707030 (=> (not res!470830) (not e!398040))))

(declare-fun subseq!376 (List!13354 List!13354) Bool)

(assert (=> b!707030 (= res!470830 (subseq!376 acc!652 newAcc!49))))

(declare-fun b!707031 () Bool)

(declare-fun res!470839 () Bool)

(assert (=> b!707031 (=> (not res!470839) (not e!398040))))

(assert (=> b!707031 (= res!470839 (not (contains!3931 acc!652 k!2824)))))

(assert (= (and start!62634 res!470840) b!707029))

(assert (= (and b!707029 res!470832) b!707026))

(assert (= (and b!707026 res!470829) b!707025))

(assert (= (and b!707025 res!470835) b!707022))

(assert (= (and b!707022 res!470836) b!707028))

(assert (= (and b!707028 res!470833) b!707031))

(assert (= (and b!707031 res!470839) b!707020))

(assert (= (and b!707020 res!470834) b!707019))

(assert (= (and b!707019 res!470837) b!707030))

(assert (= (and b!707030 res!470830) b!707023))

(assert (= (and b!707023 res!470841) b!707021))

(assert (= (and b!707021 res!470838) b!707027))

(assert (= (and b!707027 res!470831) b!707024))

(declare-fun m!664719 () Bool)

(assert (=> b!707027 m!664719))

(declare-fun m!664721 () Bool)

(assert (=> b!707031 m!664721))

(declare-fun m!664723 () Bool)

(assert (=> b!707026 m!664723))

(declare-fun m!664725 () Bool)

(assert (=> b!707021 m!664725))

(declare-fun m!664727 () Bool)

(assert (=> b!707028 m!664727))

(declare-fun m!664729 () Bool)

(assert (=> b!707024 m!664729))

(declare-fun m!664731 () Bool)

(assert (=> b!707020 m!664731))

(declare-fun m!664733 () Bool)

(assert (=> b!707022 m!664733))

(declare-fun m!664735 () Bool)

(assert (=> b!707030 m!664735))

(declare-fun m!664737 () Bool)

(assert (=> b!707019 m!664737))

(declare-fun m!664739 () Bool)

(assert (=> b!707023 m!664739))

(declare-fun m!664741 () Bool)

(assert (=> start!62634 m!664741))

(declare-fun m!664743 () Bool)

(assert (=> b!707029 m!664743))

(declare-fun m!664745 () Bool)

(assert (=> b!707025 m!664745))

(push 1)

(assert (not b!707025))

(assert (not b!707031))

(assert (not b!707020))

(assert (not b!707028))

(assert (not start!62634))

(assert (not b!707019))

(assert (not b!707024))

