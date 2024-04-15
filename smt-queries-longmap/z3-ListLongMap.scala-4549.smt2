; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63358 () Bool)

(assert start!63358)

(declare-fun b!713588 () Bool)

(declare-fun e!401125 () Bool)

(assert (=> b!713588 (= e!401125 false)))

(declare-fun lt!318470 () Bool)

(declare-datatypes ((List!13456 0))(
  ( (Nil!13453) (Cons!13452 (h!14497 (_ BitVec 64)) (t!19762 List!13456)) )
))
(declare-fun newAcc!49 () List!13456)

(declare-fun contains!3978 (List!13456 (_ BitVec 64)) Bool)

(assert (=> b!713588 (= lt!318470 (contains!3978 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!713589 () Bool)

(declare-fun res!476842 () Bool)

(assert (=> b!713589 (=> (not res!476842) (not e!401125))))

(assert (=> b!713589 (= res!476842 (not (contains!3978 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713590 () Bool)

(declare-fun res!476849 () Bool)

(assert (=> b!713590 (=> (not res!476849) (not e!401125))))

(declare-datatypes ((array!40473 0))(
  ( (array!40474 (arr!19376 (Array (_ BitVec 32) (_ BitVec 64))) (size!19788 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40473)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun acc!652 () List!13456)

(declare-fun arrayNoDuplicates!0 (array!40473 (_ BitVec 32) List!13456) Bool)

(assert (=> b!713590 (= res!476849 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713591 () Bool)

(declare-fun res!476840 () Bool)

(assert (=> b!713591 (=> (not res!476840) (not e!401125))))

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!713591 (= res!476840 (contains!3978 newAcc!49 k0!2824))))

(declare-fun b!713592 () Bool)

(declare-fun res!476845 () Bool)

(assert (=> b!713592 (=> (not res!476845) (not e!401125))))

(declare-fun -!405 (List!13456 (_ BitVec 64)) List!13456)

(assert (=> b!713592 (= res!476845 (= (-!405 newAcc!49 k0!2824) acc!652))))

(declare-fun b!713593 () Bool)

(declare-fun res!476850 () Bool)

(assert (=> b!713593 (=> (not res!476850) (not e!401125))))

(declare-fun noDuplicate!1247 (List!13456) Bool)

(assert (=> b!713593 (= res!476850 (noDuplicate!1247 newAcc!49))))

(declare-fun b!713594 () Bool)

(declare-fun res!476848 () Bool)

(assert (=> b!713594 (=> (not res!476848) (not e!401125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713594 (= res!476848 (validKeyInArray!0 k0!2824))))

(declare-fun b!713595 () Bool)

(declare-fun res!476843 () Bool)

(assert (=> b!713595 (=> (not res!476843) (not e!401125))))

(assert (=> b!713595 (= res!476843 (not (contains!3978 acc!652 k0!2824)))))

(declare-fun b!713596 () Bool)

(declare-fun res!476847 () Bool)

(assert (=> b!713596 (=> (not res!476847) (not e!401125))))

(assert (=> b!713596 (= res!476847 (noDuplicate!1247 acc!652))))

(declare-fun res!476846 () Bool)

(assert (=> start!63358 (=> (not res!476846) (not e!401125))))

(assert (=> start!63358 (= res!476846 (and (bvslt (size!19788 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19788 a!3591))))))

(assert (=> start!63358 e!401125))

(assert (=> start!63358 true))

(declare-fun array_inv!15259 (array!40473) Bool)

(assert (=> start!63358 (array_inv!15259 a!3591)))

(declare-fun b!713597 () Bool)

(declare-fun res!476839 () Bool)

(assert (=> b!713597 (=> (not res!476839) (not e!401125))))

(declare-fun arrayContainsKey!0 (array!40473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713597 (= res!476839 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!713598 () Bool)

(declare-fun res!476838 () Bool)

(assert (=> b!713598 (=> (not res!476838) (not e!401125))))

(assert (=> b!713598 (= res!476838 (not (contains!3978 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713599 () Bool)

(declare-fun res!476844 () Bool)

(assert (=> b!713599 (=> (not res!476844) (not e!401125))))

(assert (=> b!713599 (= res!476844 (not (contains!3978 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713600 () Bool)

(declare-fun res!476841 () Bool)

(assert (=> b!713600 (=> (not res!476841) (not e!401125))))

(declare-fun subseq!440 (List!13456 List!13456) Bool)

(assert (=> b!713600 (= res!476841 (subseq!440 acc!652 newAcc!49))))

(assert (= (and start!63358 res!476846) b!713596))

(assert (= (and b!713596 res!476847) b!713593))

(assert (= (and b!713593 res!476850) b!713598))

(assert (= (and b!713598 res!476838) b!713599))

(assert (= (and b!713599 res!476844) b!713597))

(assert (= (and b!713597 res!476839) b!713595))

(assert (= (and b!713595 res!476843) b!713594))

(assert (= (and b!713594 res!476848) b!713590))

(assert (= (and b!713590 res!476849) b!713600))

(assert (= (and b!713600 res!476841) b!713591))

(assert (= (and b!713591 res!476840) b!713592))

(assert (= (and b!713592 res!476845) b!713589))

(assert (= (and b!713589 res!476842) b!713588))

(declare-fun m!669777 () Bool)

(assert (=> start!63358 m!669777))

(declare-fun m!669779 () Bool)

(assert (=> b!713599 m!669779))

(declare-fun m!669781 () Bool)

(assert (=> b!713593 m!669781))

(declare-fun m!669783 () Bool)

(assert (=> b!713590 m!669783))

(declare-fun m!669785 () Bool)

(assert (=> b!713592 m!669785))

(declare-fun m!669787 () Bool)

(assert (=> b!713598 m!669787))

(declare-fun m!669789 () Bool)

(assert (=> b!713600 m!669789))

(declare-fun m!669791 () Bool)

(assert (=> b!713594 m!669791))

(declare-fun m!669793 () Bool)

(assert (=> b!713588 m!669793))

(declare-fun m!669795 () Bool)

(assert (=> b!713591 m!669795))

(declare-fun m!669797 () Bool)

(assert (=> b!713595 m!669797))

(declare-fun m!669799 () Bool)

(assert (=> b!713597 m!669799))

(declare-fun m!669801 () Bool)

(assert (=> b!713596 m!669801))

(declare-fun m!669803 () Bool)

(assert (=> b!713589 m!669803))

(check-sat (not b!713590) (not b!713600) (not b!713593) (not b!713595) (not b!713599) (not b!713592) (not b!713594) (not b!713598) (not b!713589) (not b!713596) (not b!713588) (not b!713597) (not b!713591) (not start!63358))
(check-sat)
