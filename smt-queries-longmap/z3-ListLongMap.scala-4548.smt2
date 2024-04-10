; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63366 () Bool)

(assert start!63366)

(declare-fun b!713815 () Bool)

(declare-fun res!476900 () Bool)

(declare-fun e!401309 () Bool)

(assert (=> b!713815 (=> (not res!476900) (not e!401309))))

(declare-datatypes ((List!13416 0))(
  ( (Nil!13413) (Cons!13412 (h!14457 (_ BitVec 64)) (t!19731 List!13416)) )
))
(declare-fun newAcc!49 () List!13416)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun acc!652 () List!13416)

(declare-fun -!403 (List!13416 (_ BitVec 64)) List!13416)

(assert (=> b!713815 (= res!476900 (= (-!403 newAcc!49 k0!2824) acc!652))))

(declare-fun res!476905 () Bool)

(assert (=> start!63366 (=> (not res!476905) (not e!401309))))

(declare-datatypes ((array!40470 0))(
  ( (array!40471 (arr!19375 (Array (_ BitVec 32) (_ BitVec 64))) (size!19786 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40470)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63366 (= res!476905 (and (bvslt (size!19786 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19786 a!3591))))))

(assert (=> start!63366 e!401309))

(assert (=> start!63366 true))

(declare-fun array_inv!15171 (array!40470) Bool)

(assert (=> start!63366 (array_inv!15171 a!3591)))

(declare-fun b!713816 () Bool)

(declare-fun res!476908 () Bool)

(assert (=> b!713816 (=> (not res!476908) (not e!401309))))

(declare-fun contains!3993 (List!13416 (_ BitVec 64)) Bool)

(assert (=> b!713816 (= res!476908 (not (contains!3993 acc!652 k0!2824)))))

(declare-fun b!713817 () Bool)

(declare-fun res!476901 () Bool)

(assert (=> b!713817 (=> (not res!476901) (not e!401309))))

(declare-fun arrayContainsKey!0 (array!40470 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713817 (= res!476901 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!713818 () Bool)

(declare-fun res!476907 () Bool)

(assert (=> b!713818 (=> (not res!476907) (not e!401309))))

(assert (=> b!713818 (= res!476907 (not (contains!3993 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713819 () Bool)

(declare-fun res!476903 () Bool)

(assert (=> b!713819 (=> (not res!476903) (not e!401309))))

(declare-fun arrayNoDuplicates!0 (array!40470 (_ BitVec 32) List!13416) Bool)

(assert (=> b!713819 (= res!476903 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713820 () Bool)

(declare-fun res!476906 () Bool)

(assert (=> b!713820 (=> (not res!476906) (not e!401309))))

(declare-fun subseq!438 (List!13416 List!13416) Bool)

(assert (=> b!713820 (= res!476906 (subseq!438 acc!652 newAcc!49))))

(declare-fun b!713821 () Bool)

(declare-fun res!476909 () Bool)

(assert (=> b!713821 (=> (not res!476909) (not e!401309))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713821 (= res!476909 (validKeyInArray!0 k0!2824))))

(declare-fun b!713822 () Bool)

(declare-fun res!476904 () Bool)

(assert (=> b!713822 (=> (not res!476904) (not e!401309))))

(declare-fun noDuplicate!1240 (List!13416) Bool)

(assert (=> b!713822 (= res!476904 (noDuplicate!1240 newAcc!49))))

(declare-fun b!713823 () Bool)

(declare-fun res!476911 () Bool)

(assert (=> b!713823 (=> (not res!476911) (not e!401309))))

(assert (=> b!713823 (= res!476911 (not (contains!3993 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713824 () Bool)

(declare-fun res!476910 () Bool)

(assert (=> b!713824 (=> (not res!476910) (not e!401309))))

(assert (=> b!713824 (= res!476910 (contains!3993 newAcc!49 k0!2824))))

(declare-fun b!713825 () Bool)

(declare-fun res!476899 () Bool)

(assert (=> b!713825 (=> (not res!476899) (not e!401309))))

(assert (=> b!713825 (= res!476899 (noDuplicate!1240 acc!652))))

(declare-fun b!713826 () Bool)

(declare-fun res!476902 () Bool)

(assert (=> b!713826 (=> (not res!476902) (not e!401309))))

(assert (=> b!713826 (= res!476902 (not (contains!3993 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713827 () Bool)

(assert (=> b!713827 (= e!401309 false)))

(declare-fun lt!318719 () Bool)

(assert (=> b!713827 (= lt!318719 (contains!3993 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!63366 res!476905) b!713825))

(assert (= (and b!713825 res!476899) b!713822))

(assert (= (and b!713822 res!476904) b!713818))

(assert (= (and b!713818 res!476907) b!713826))

(assert (= (and b!713826 res!476902) b!713817))

(assert (= (and b!713817 res!476901) b!713816))

(assert (= (and b!713816 res!476908) b!713821))

(assert (= (and b!713821 res!476909) b!713819))

(assert (= (and b!713819 res!476903) b!713820))

(assert (= (and b!713820 res!476906) b!713824))

(assert (= (and b!713824 res!476910) b!713815))

(assert (= (and b!713815 res!476900) b!713823))

(assert (= (and b!713823 res!476911) b!713827))

(declare-fun m!670511 () Bool)

(assert (=> b!713822 m!670511))

(declare-fun m!670513 () Bool)

(assert (=> b!713827 m!670513))

(declare-fun m!670515 () Bool)

(assert (=> b!713820 m!670515))

(declare-fun m!670517 () Bool)

(assert (=> b!713815 m!670517))

(declare-fun m!670519 () Bool)

(assert (=> b!713824 m!670519))

(declare-fun m!670521 () Bool)

(assert (=> b!713819 m!670521))

(declare-fun m!670523 () Bool)

(assert (=> b!713826 m!670523))

(declare-fun m!670525 () Bool)

(assert (=> b!713817 m!670525))

(declare-fun m!670527 () Bool)

(assert (=> b!713816 m!670527))

(declare-fun m!670529 () Bool)

(assert (=> b!713818 m!670529))

(declare-fun m!670531 () Bool)

(assert (=> b!713823 m!670531))

(declare-fun m!670533 () Bool)

(assert (=> start!63366 m!670533))

(declare-fun m!670535 () Bool)

(assert (=> b!713825 m!670535))

(declare-fun m!670537 () Bool)

(assert (=> b!713821 m!670537))

(check-sat (not b!713821) (not b!713819) (not b!713818) (not b!713823) (not b!713825) (not b!713815) (not start!63366) (not b!713822) (not b!713824) (not b!713827) (not b!713820) (not b!713816) (not b!713826) (not b!713817))
(check-sat)
