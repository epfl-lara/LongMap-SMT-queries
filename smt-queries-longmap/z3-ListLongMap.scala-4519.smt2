; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62584 () Bool)

(assert start!62584)

(declare-fun b!706002 () Bool)

(declare-fun res!469813 () Bool)

(declare-fun e!397890 () Bool)

(assert (=> b!706002 (=> (not res!469813) (not e!397890))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13329 0))(
  ( (Nil!13326) (Cons!13325 (h!14370 (_ BitVec 64)) (t!19611 List!13329)) )
))
(declare-fun acc!652 () List!13329)

(declare-datatypes ((array!40263 0))(
  ( (array!40264 (arr!19288 (Array (_ BitVec 32) (_ BitVec 64))) (size!19673 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40263)

(declare-fun arrayNoDuplicates!0 (array!40263 (_ BitVec 32) List!13329) Bool)

(assert (=> b!706002 (= res!469813 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706003 () Bool)

(declare-fun res!469822 () Bool)

(assert (=> b!706003 (=> (not res!469822) (not e!397890))))

(declare-fun contains!3906 (List!13329 (_ BitVec 64)) Bool)

(assert (=> b!706003 (= res!469822 (not (contains!3906 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706004 () Bool)

(assert (=> b!706004 (= e!397890 (not true))))

(declare-fun newAcc!49 () List!13329)

(assert (=> b!706004 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-datatypes ((Unit!24626 0))(
  ( (Unit!24627) )
))
(declare-fun lt!317928 () Unit!24626)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40263 (_ BitVec 64) (_ BitVec 32) List!13329 List!13329) Unit!24626)

(assert (=> b!706004 (= lt!317928 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun b!706005 () Bool)

(declare-fun res!469830 () Bool)

(assert (=> b!706005 (=> (not res!469830) (not e!397890))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706005 (= res!469830 (validKeyInArray!0 k0!2824))))

(declare-fun b!706006 () Bool)

(declare-fun res!469820 () Bool)

(assert (=> b!706006 (=> (not res!469820) (not e!397890))))

(assert (=> b!706006 (= res!469820 (contains!3906 newAcc!49 k0!2824))))

(declare-fun res!469819 () Bool)

(assert (=> start!62584 (=> (not res!469819) (not e!397890))))

(assert (=> start!62584 (= res!469819 (and (bvslt (size!19673 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19673 a!3591))))))

(assert (=> start!62584 e!397890))

(assert (=> start!62584 true))

(declare-fun array_inv!15084 (array!40263) Bool)

(assert (=> start!62584 (array_inv!15084 a!3591)))

(declare-fun b!706007 () Bool)

(declare-fun res!469824 () Bool)

(assert (=> b!706007 (=> (not res!469824) (not e!397890))))

(assert (=> b!706007 (= res!469824 (not (contains!3906 acc!652 k0!2824)))))

(declare-fun b!706008 () Bool)

(declare-fun res!469815 () Bool)

(assert (=> b!706008 (=> (not res!469815) (not e!397890))))

(declare-fun noDuplicate!1153 (List!13329) Bool)

(assert (=> b!706008 (= res!469815 (noDuplicate!1153 newAcc!49))))

(declare-fun b!706009 () Bool)

(declare-fun res!469821 () Bool)

(assert (=> b!706009 (=> (not res!469821) (not e!397890))))

(assert (=> b!706009 (= res!469821 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!706010 () Bool)

(declare-fun res!469826 () Bool)

(assert (=> b!706010 (=> (not res!469826) (not e!397890))))

(assert (=> b!706010 (= res!469826 (not (contains!3906 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706011 () Bool)

(declare-fun res!469827 () Bool)

(assert (=> b!706011 (=> (not res!469827) (not e!397890))))

(declare-fun subseq!351 (List!13329 List!13329) Bool)

(assert (=> b!706011 (= res!469827 (subseq!351 acc!652 newAcc!49))))

(declare-fun b!706012 () Bool)

(declare-fun res!469814 () Bool)

(assert (=> b!706012 (=> (not res!469814) (not e!397890))))

(declare-fun arrayContainsKey!0 (array!40263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706012 (= res!469814 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!706013 () Bool)

(declare-fun res!469818 () Bool)

(assert (=> b!706013 (=> (not res!469818) (not e!397890))))

(assert (=> b!706013 (= res!469818 (noDuplicate!1153 acc!652))))

(declare-fun b!706014 () Bool)

(declare-fun res!469816 () Bool)

(assert (=> b!706014 (=> (not res!469816) (not e!397890))))

(assert (=> b!706014 (= res!469816 (not (contains!3906 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706015 () Bool)

(declare-fun res!469812 () Bool)

(assert (=> b!706015 (=> (not res!469812) (not e!397890))))

(assert (=> b!706015 (= res!469812 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19673 a!3591)))))

(declare-fun b!706016 () Bool)

(declare-fun res!469829 () Bool)

(assert (=> b!706016 (=> (not res!469829) (not e!397890))))

(assert (=> b!706016 (= res!469829 (not (contains!3906 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706017 () Bool)

(declare-fun res!469828 () Bool)

(assert (=> b!706017 (=> (not res!469828) (not e!397890))))

(assert (=> b!706017 (= res!469828 (not (validKeyInArray!0 (select (arr!19288 a!3591) from!2969))))))

(declare-fun b!706018 () Bool)

(declare-fun res!469825 () Bool)

(assert (=> b!706018 (=> (not res!469825) (not e!397890))))

(declare-fun -!316 (List!13329 (_ BitVec 64)) List!13329)

(assert (=> b!706018 (= res!469825 (= (-!316 newAcc!49 k0!2824) acc!652))))

(declare-fun b!706019 () Bool)

(declare-fun res!469823 () Bool)

(assert (=> b!706019 (=> (not res!469823) (not e!397890))))

(assert (=> b!706019 (= res!469823 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!706020 () Bool)

(declare-fun res!469817 () Bool)

(assert (=> b!706020 (=> (not res!469817) (not e!397890))))

(assert (=> b!706020 (= res!469817 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(assert (= (and start!62584 res!469819) b!706013))

(assert (= (and b!706013 res!469818) b!706008))

(assert (= (and b!706008 res!469815) b!706014))

(assert (= (and b!706014 res!469816) b!706003))

(assert (= (and b!706003 res!469822) b!706019))

(assert (= (and b!706019 res!469823) b!706007))

(assert (= (and b!706007 res!469824) b!706005))

(assert (= (and b!706005 res!469830) b!706002))

(assert (= (and b!706002 res!469813) b!706011))

(assert (= (and b!706011 res!469827) b!706006))

(assert (= (and b!706006 res!469820) b!706018))

(assert (= (and b!706018 res!469825) b!706016))

(assert (= (and b!706016 res!469829) b!706010))

(assert (= (and b!706010 res!469826) b!706015))

(assert (= (and b!706015 res!469812) b!706017))

(assert (= (and b!706017 res!469828) b!706009))

(assert (= (and b!706009 res!469821) b!706012))

(assert (= (and b!706012 res!469814) b!706020))

(assert (= (and b!706020 res!469817) b!706004))

(declare-fun m!663995 () Bool)

(assert (=> b!706002 m!663995))

(declare-fun m!663997 () Bool)

(assert (=> b!706007 m!663997))

(declare-fun m!663999 () Bool)

(assert (=> b!706016 m!663999))

(declare-fun m!664001 () Bool)

(assert (=> b!706004 m!664001))

(declare-fun m!664003 () Bool)

(assert (=> b!706004 m!664003))

(declare-fun m!664005 () Bool)

(assert (=> b!706020 m!664005))

(declare-fun m!664007 () Bool)

(assert (=> b!706006 m!664007))

(declare-fun m!664009 () Bool)

(assert (=> b!706011 m!664009))

(declare-fun m!664011 () Bool)

(assert (=> start!62584 m!664011))

(declare-fun m!664013 () Bool)

(assert (=> b!706012 m!664013))

(declare-fun m!664015 () Bool)

(assert (=> b!706008 m!664015))

(declare-fun m!664017 () Bool)

(assert (=> b!706017 m!664017))

(assert (=> b!706017 m!664017))

(declare-fun m!664019 () Bool)

(assert (=> b!706017 m!664019))

(declare-fun m!664021 () Bool)

(assert (=> b!706013 m!664021))

(declare-fun m!664023 () Bool)

(assert (=> b!706018 m!664023))

(declare-fun m!664025 () Bool)

(assert (=> b!706014 m!664025))

(declare-fun m!664027 () Bool)

(assert (=> b!706019 m!664027))

(declare-fun m!664029 () Bool)

(assert (=> b!706005 m!664029))

(declare-fun m!664031 () Bool)

(assert (=> b!706010 m!664031))

(declare-fun m!664033 () Bool)

(assert (=> b!706003 m!664033))

(check-sat (not start!62584) (not b!706019) (not b!706017) (not b!706012) (not b!706003) (not b!706004) (not b!706005) (not b!706013) (not b!706002) (not b!706007) (not b!706011) (not b!706018) (not b!706014) (not b!706020) (not b!706016) (not b!706010) (not b!706008) (not b!706006))
(check-sat)
