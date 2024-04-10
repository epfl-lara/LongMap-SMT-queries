; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63438 () Bool)

(assert start!63438)

(declare-fun b!714541 () Bool)

(declare-fun res!477571 () Bool)

(declare-fun e!401579 () Bool)

(assert (=> b!714541 (=> (not res!477571) (not e!401579))))

(declare-datatypes ((List!13428 0))(
  ( (Nil!13425) (Cons!13424 (h!14469 (_ BitVec 64)) (t!19743 List!13428)) )
))
(declare-fun newAcc!49 () List!13428)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!4005 (List!13428 (_ BitVec 64)) Bool)

(assert (=> b!714541 (= res!477571 (contains!4005 newAcc!49 k0!2824))))

(declare-fun b!714542 () Bool)

(declare-fun res!477576 () Bool)

(assert (=> b!714542 (=> (not res!477576) (not e!401579))))

(declare-fun acc!652 () List!13428)

(assert (=> b!714542 (= res!477576 (not (contains!4005 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714543 () Bool)

(assert (=> b!714543 (= e!401579 false)))

(declare-fun lt!318779 () Bool)

(assert (=> b!714543 (= lt!318779 (contains!4005 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714544 () Bool)

(declare-fun res!477573 () Bool)

(assert (=> b!714544 (=> (not res!477573) (not e!401579))))

(declare-fun -!415 (List!13428 (_ BitVec 64)) List!13428)

(assert (=> b!714544 (= res!477573 (= (-!415 newAcc!49 k0!2824) acc!652))))

(declare-fun res!477582 () Bool)

(assert (=> start!63438 (=> (not res!477582) (not e!401579))))

(declare-datatypes ((array!40497 0))(
  ( (array!40498 (arr!19387 (Array (_ BitVec 32) (_ BitVec 64))) (size!19800 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40497)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63438 (= res!477582 (and (bvslt (size!19800 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19800 a!3591))))))

(assert (=> start!63438 e!401579))

(assert (=> start!63438 true))

(declare-fun array_inv!15183 (array!40497) Bool)

(assert (=> start!63438 (array_inv!15183 a!3591)))

(declare-fun b!714545 () Bool)

(declare-fun res!477578 () Bool)

(assert (=> b!714545 (=> (not res!477578) (not e!401579))))

(declare-fun arrayContainsKey!0 (array!40497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!714545 (= res!477578 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!714546 () Bool)

(declare-fun res!477583 () Bool)

(assert (=> b!714546 (=> (not res!477583) (not e!401579))))

(declare-fun subseq!450 (List!13428 List!13428) Bool)

(assert (=> b!714546 (= res!477583 (subseq!450 acc!652 newAcc!49))))

(declare-fun b!714547 () Bool)

(declare-fun res!477577 () Bool)

(assert (=> b!714547 (=> (not res!477577) (not e!401579))))

(assert (=> b!714547 (= res!477577 (not (contains!4005 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714548 () Bool)

(declare-fun res!477575 () Bool)

(assert (=> b!714548 (=> (not res!477575) (not e!401579))))

(assert (=> b!714548 (= res!477575 (not (contains!4005 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714549 () Bool)

(declare-fun res!477574 () Bool)

(assert (=> b!714549 (=> (not res!477574) (not e!401579))))

(declare-fun noDuplicate!1252 (List!13428) Bool)

(assert (=> b!714549 (= res!477574 (noDuplicate!1252 acc!652))))

(declare-fun b!714550 () Bool)

(declare-fun res!477580 () Bool)

(assert (=> b!714550 (=> (not res!477580) (not e!401579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!714550 (= res!477580 (validKeyInArray!0 k0!2824))))

(declare-fun b!714551 () Bool)

(declare-fun res!477581 () Bool)

(assert (=> b!714551 (=> (not res!477581) (not e!401579))))

(assert (=> b!714551 (= res!477581 (not (contains!4005 acc!652 k0!2824)))))

(declare-fun b!714552 () Bool)

(declare-fun res!477579 () Bool)

(assert (=> b!714552 (=> (not res!477579) (not e!401579))))

(declare-fun arrayNoDuplicates!0 (array!40497 (_ BitVec 32) List!13428) Bool)

(assert (=> b!714552 (= res!477579 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!714553 () Bool)

(declare-fun res!477572 () Bool)

(assert (=> b!714553 (=> (not res!477572) (not e!401579))))

(assert (=> b!714553 (= res!477572 (noDuplicate!1252 newAcc!49))))

(assert (= (and start!63438 res!477582) b!714549))

(assert (= (and b!714549 res!477574) b!714553))

(assert (= (and b!714553 res!477572) b!714548))

(assert (= (and b!714548 res!477575) b!714542))

(assert (= (and b!714542 res!477576) b!714545))

(assert (= (and b!714545 res!477578) b!714551))

(assert (= (and b!714551 res!477581) b!714550))

(assert (= (and b!714550 res!477580) b!714552))

(assert (= (and b!714552 res!477579) b!714546))

(assert (= (and b!714546 res!477583) b!714541))

(assert (= (and b!714541 res!477571) b!714544))

(assert (= (and b!714544 res!477573) b!714547))

(assert (= (and b!714547 res!477577) b!714543))

(declare-fun m!671045 () Bool)

(assert (=> b!714541 m!671045))

(declare-fun m!671047 () Bool)

(assert (=> b!714551 m!671047))

(declare-fun m!671049 () Bool)

(assert (=> b!714552 m!671049))

(declare-fun m!671051 () Bool)

(assert (=> b!714545 m!671051))

(declare-fun m!671053 () Bool)

(assert (=> b!714546 m!671053))

(declare-fun m!671055 () Bool)

(assert (=> b!714544 m!671055))

(declare-fun m!671057 () Bool)

(assert (=> b!714548 m!671057))

(declare-fun m!671059 () Bool)

(assert (=> b!714542 m!671059))

(declare-fun m!671061 () Bool)

(assert (=> b!714543 m!671061))

(declare-fun m!671063 () Bool)

(assert (=> b!714553 m!671063))

(declare-fun m!671065 () Bool)

(assert (=> b!714547 m!671065))

(declare-fun m!671067 () Bool)

(assert (=> b!714550 m!671067))

(declare-fun m!671069 () Bool)

(assert (=> start!63438 m!671069))

(declare-fun m!671071 () Bool)

(assert (=> b!714549 m!671071))

(check-sat (not b!714551) (not b!714548) (not b!714546) (not b!714542) (not b!714552) (not b!714549) (not b!714553) (not b!714545) (not b!714541) (not b!714547) (not start!63438) (not b!714544) (not b!714543) (not b!714550))
(check-sat)
