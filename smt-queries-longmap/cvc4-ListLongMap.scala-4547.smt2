; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63362 () Bool)

(assert start!63362)

(declare-fun b!713737 () Bool)

(declare-fun res!476829 () Bool)

(declare-fun e!401296 () Bool)

(assert (=> b!713737 (=> (not res!476829) (not e!401296))))

(declare-datatypes ((List!13414 0))(
  ( (Nil!13411) (Cons!13410 (h!14455 (_ BitVec 64)) (t!19729 List!13414)) )
))
(declare-fun newAcc!49 () List!13414)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3991 (List!13414 (_ BitVec 64)) Bool)

(assert (=> b!713737 (= res!476829 (contains!3991 newAcc!49 k!2824))))

(declare-fun b!713738 () Bool)

(assert (=> b!713738 (= e!401296 false)))

(declare-fun lt!318713 () Bool)

(assert (=> b!713738 (= lt!318713 (contains!3991 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713739 () Bool)

(declare-fun res!476826 () Bool)

(assert (=> b!713739 (=> (not res!476826) (not e!401296))))

(assert (=> b!713739 (= res!476826 (not (contains!3991 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713740 () Bool)

(declare-fun res!476824 () Bool)

(assert (=> b!713740 (=> (not res!476824) (not e!401296))))

(declare-fun noDuplicate!1238 (List!13414) Bool)

(assert (=> b!713740 (= res!476824 (noDuplicate!1238 newAcc!49))))

(declare-fun res!476830 () Bool)

(assert (=> start!63362 (=> (not res!476830) (not e!401296))))

(declare-datatypes ((array!40466 0))(
  ( (array!40467 (arr!19373 (Array (_ BitVec 32) (_ BitVec 64))) (size!19784 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40466)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63362 (= res!476830 (and (bvslt (size!19784 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19784 a!3591))))))

(assert (=> start!63362 e!401296))

(assert (=> start!63362 true))

(declare-fun array_inv!15169 (array!40466) Bool)

(assert (=> start!63362 (array_inv!15169 a!3591)))

(declare-fun b!713741 () Bool)

(declare-fun res!476833 () Bool)

(assert (=> b!713741 (=> (not res!476833) (not e!401296))))

(declare-fun acc!652 () List!13414)

(assert (=> b!713741 (= res!476833 (not (contains!3991 acc!652 k!2824)))))

(declare-fun b!713742 () Bool)

(declare-fun res!476832 () Bool)

(assert (=> b!713742 (=> (not res!476832) (not e!401296))))

(assert (=> b!713742 (= res!476832 (noDuplicate!1238 acc!652))))

(declare-fun b!713743 () Bool)

(declare-fun res!476822 () Bool)

(assert (=> b!713743 (=> (not res!476822) (not e!401296))))

(assert (=> b!713743 (= res!476822 (not (contains!3991 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713744 () Bool)

(declare-fun res!476825 () Bool)

(assert (=> b!713744 (=> (not res!476825) (not e!401296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713744 (= res!476825 (validKeyInArray!0 k!2824))))

(declare-fun b!713745 () Bool)

(declare-fun res!476823 () Bool)

(assert (=> b!713745 (=> (not res!476823) (not e!401296))))

(declare-fun arrayContainsKey!0 (array!40466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713745 (= res!476823 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!713746 () Bool)

(declare-fun res!476821 () Bool)

(assert (=> b!713746 (=> (not res!476821) (not e!401296))))

(declare-fun arrayNoDuplicates!0 (array!40466 (_ BitVec 32) List!13414) Bool)

(assert (=> b!713746 (= res!476821 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713747 () Bool)

(declare-fun res!476828 () Bool)

(assert (=> b!713747 (=> (not res!476828) (not e!401296))))

(assert (=> b!713747 (= res!476828 (not (contains!3991 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713748 () Bool)

(declare-fun res!476827 () Bool)

(assert (=> b!713748 (=> (not res!476827) (not e!401296))))

(declare-fun -!401 (List!13414 (_ BitVec 64)) List!13414)

(assert (=> b!713748 (= res!476827 (= (-!401 newAcc!49 k!2824) acc!652))))

(declare-fun b!713749 () Bool)

(declare-fun res!476831 () Bool)

(assert (=> b!713749 (=> (not res!476831) (not e!401296))))

(declare-fun subseq!436 (List!13414 List!13414) Bool)

(assert (=> b!713749 (= res!476831 (subseq!436 acc!652 newAcc!49))))

(assert (= (and start!63362 res!476830) b!713742))

(assert (= (and b!713742 res!476832) b!713740))

(assert (= (and b!713740 res!476824) b!713747))

(assert (= (and b!713747 res!476828) b!713743))

(assert (= (and b!713743 res!476822) b!713745))

(assert (= (and b!713745 res!476823) b!713741))

(assert (= (and b!713741 res!476833) b!713744))

(assert (= (and b!713744 res!476825) b!713746))

(assert (= (and b!713746 res!476821) b!713749))

(assert (= (and b!713749 res!476831) b!713737))

(assert (= (and b!713737 res!476829) b!713748))

(assert (= (and b!713748 res!476827) b!713739))

(assert (= (and b!713739 res!476826) b!713738))

(declare-fun m!670455 () Bool)

(assert (=> b!713748 m!670455))

(declare-fun m!670457 () Bool)

(assert (=> b!713742 m!670457))

(declare-fun m!670459 () Bool)

(assert (=> start!63362 m!670459))

(declare-fun m!670461 () Bool)

(assert (=> b!713738 m!670461))

(declare-fun m!670463 () Bool)

(assert (=> b!713747 m!670463))

(declare-fun m!670465 () Bool)

(assert (=> b!713749 m!670465))

(declare-fun m!670467 () Bool)

(assert (=> b!713741 m!670467))

(declare-fun m!670469 () Bool)

(assert (=> b!713746 m!670469))

(declare-fun m!670471 () Bool)

(assert (=> b!713737 m!670471))

(declare-fun m!670473 () Bool)

(assert (=> b!713739 m!670473))

(declare-fun m!670475 () Bool)

(assert (=> b!713745 m!670475))

(declare-fun m!670477 () Bool)

(assert (=> b!713743 m!670477))

(declare-fun m!670479 () Bool)

(assert (=> b!713744 m!670479))

(declare-fun m!670481 () Bool)

(assert (=> b!713740 m!670481))

(push 1)

(assert (not b!713746))

(assert (not b!713745))

(assert (not b!713743))

(assert (not b!713747))

(assert (not start!63362))

(assert (not b!713748))

(assert (not b!713739))

(assert (not b!713737))

(assert (not b!713738))

