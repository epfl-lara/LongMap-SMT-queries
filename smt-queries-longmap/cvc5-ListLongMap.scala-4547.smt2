; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63358 () Bool)

(assert start!63358)

(declare-fun b!713659 () Bool)

(declare-fun res!476750 () Bool)

(declare-fun e!401285 () Bool)

(assert (=> b!713659 (=> (not res!476750) (not e!401285))))

(declare-datatypes ((List!13412 0))(
  ( (Nil!13409) (Cons!13408 (h!14453 (_ BitVec 64)) (t!19727 List!13412)) )
))
(declare-fun acc!652 () List!13412)

(declare-fun newAcc!49 () List!13412)

(declare-fun subseq!434 (List!13412 List!13412) Bool)

(assert (=> b!713659 (= res!476750 (subseq!434 acc!652 newAcc!49))))

(declare-fun b!713660 () Bool)

(declare-fun res!476748 () Bool)

(assert (=> b!713660 (=> (not res!476748) (not e!401285))))

(declare-datatypes ((array!40462 0))(
  ( (array!40463 (arr!19371 (Array (_ BitVec 32) (_ BitVec 64))) (size!19782 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40462)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40462 (_ BitVec 32) List!13412) Bool)

(assert (=> b!713660 (= res!476748 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713661 () Bool)

(declare-fun res!476755 () Bool)

(assert (=> b!713661 (=> (not res!476755) (not e!401285))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713661 (= res!476755 (validKeyInArray!0 k!2824))))

(declare-fun res!476745 () Bool)

(assert (=> start!63358 (=> (not res!476745) (not e!401285))))

(assert (=> start!63358 (= res!476745 (and (bvslt (size!19782 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19782 a!3591))))))

(assert (=> start!63358 e!401285))

(assert (=> start!63358 true))

(declare-fun array_inv!15167 (array!40462) Bool)

(assert (=> start!63358 (array_inv!15167 a!3591)))

(declare-fun b!713662 () Bool)

(declare-fun res!476747 () Bool)

(assert (=> b!713662 (=> (not res!476747) (not e!401285))))

(declare-fun contains!3989 (List!13412 (_ BitVec 64)) Bool)

(assert (=> b!713662 (= res!476747 (contains!3989 newAcc!49 k!2824))))

(declare-fun b!713663 () Bool)

(declare-fun res!476753 () Bool)

(assert (=> b!713663 (=> (not res!476753) (not e!401285))))

(declare-fun noDuplicate!1236 (List!13412) Bool)

(assert (=> b!713663 (= res!476753 (noDuplicate!1236 acc!652))))

(declare-fun b!713664 () Bool)

(declare-fun res!476744 () Bool)

(assert (=> b!713664 (=> (not res!476744) (not e!401285))))

(assert (=> b!713664 (= res!476744 (not (contains!3989 acc!652 k!2824)))))

(declare-fun b!713665 () Bool)

(assert (=> b!713665 (= e!401285 false)))

(declare-fun lt!318707 () Bool)

(assert (=> b!713665 (= lt!318707 (contains!3989 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713666 () Bool)

(declare-fun res!476754 () Bool)

(assert (=> b!713666 (=> (not res!476754) (not e!401285))))

(assert (=> b!713666 (= res!476754 (not (contains!3989 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713667 () Bool)

(declare-fun res!476752 () Bool)

(assert (=> b!713667 (=> (not res!476752) (not e!401285))))

(declare-fun -!399 (List!13412 (_ BitVec 64)) List!13412)

(assert (=> b!713667 (= res!476752 (= (-!399 newAcc!49 k!2824) acc!652))))

(declare-fun b!713668 () Bool)

(declare-fun res!476749 () Bool)

(assert (=> b!713668 (=> (not res!476749) (not e!401285))))

(declare-fun arrayContainsKey!0 (array!40462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713668 (= res!476749 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!713669 () Bool)

(declare-fun res!476751 () Bool)

(assert (=> b!713669 (=> (not res!476751) (not e!401285))))

(assert (=> b!713669 (= res!476751 (not (contains!3989 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713670 () Bool)

(declare-fun res!476743 () Bool)

(assert (=> b!713670 (=> (not res!476743) (not e!401285))))

(assert (=> b!713670 (= res!476743 (noDuplicate!1236 newAcc!49))))

(declare-fun b!713671 () Bool)

(declare-fun res!476746 () Bool)

(assert (=> b!713671 (=> (not res!476746) (not e!401285))))

(assert (=> b!713671 (= res!476746 (not (contains!3989 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!63358 res!476745) b!713663))

(assert (= (and b!713663 res!476753) b!713670))

(assert (= (and b!713670 res!476743) b!713666))

(assert (= (and b!713666 res!476754) b!713669))

(assert (= (and b!713669 res!476751) b!713668))

(assert (= (and b!713668 res!476749) b!713664))

(assert (= (and b!713664 res!476744) b!713661))

(assert (= (and b!713661 res!476755) b!713660))

(assert (= (and b!713660 res!476748) b!713659))

(assert (= (and b!713659 res!476750) b!713662))

(assert (= (and b!713662 res!476747) b!713667))

(assert (= (and b!713667 res!476752) b!713671))

(assert (= (and b!713671 res!476746) b!713665))

(declare-fun m!670399 () Bool)

(assert (=> b!713671 m!670399))

(declare-fun m!670401 () Bool)

(assert (=> b!713659 m!670401))

(declare-fun m!670403 () Bool)

(assert (=> b!713661 m!670403))

(declare-fun m!670405 () Bool)

(assert (=> start!63358 m!670405))

(declare-fun m!670407 () Bool)

(assert (=> b!713664 m!670407))

(declare-fun m!670409 () Bool)

(assert (=> b!713660 m!670409))

(declare-fun m!670411 () Bool)

(assert (=> b!713666 m!670411))

(declare-fun m!670413 () Bool)

(assert (=> b!713667 m!670413))

(declare-fun m!670415 () Bool)

(assert (=> b!713668 m!670415))

(declare-fun m!670417 () Bool)

(assert (=> b!713663 m!670417))

(declare-fun m!670419 () Bool)

(assert (=> b!713662 m!670419))

(declare-fun m!670421 () Bool)

(assert (=> b!713665 m!670421))

(declare-fun m!670423 () Bool)

(assert (=> b!713670 m!670423))

(declare-fun m!670425 () Bool)

(assert (=> b!713669 m!670425))

(push 1)

(assert (not b!713670))

(assert (not b!713661))

(assert (not b!713666))

(assert (not b!713660))

(assert (not b!713668))

(assert (not start!63358))

(assert (not b!713663))

(assert (not b!713667))

(assert (not b!713662))

(assert (not b!713664))

(assert (not b!713659))

(assert (not b!713669))

(assert (not b!713665))

(assert (not b!713671))

(check-sat)

(pop 1)

