; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63424 () Bool)

(assert start!63424)

(declare-fun b!714037 () Bool)

(declare-fun res!477003 () Bool)

(declare-fun e!401474 () Bool)

(assert (=> b!714037 (=> (not res!477003) (not e!401474))))

(declare-datatypes ((List!13317 0))(
  ( (Nil!13314) (Cons!13313 (h!14361 (_ BitVec 64)) (t!19624 List!13317)) )
))
(declare-fun acc!652 () List!13317)

(declare-fun newAcc!49 () List!13317)

(declare-fun subseq!437 (List!13317 List!13317) Bool)

(assert (=> b!714037 (= res!477003 (subseq!437 acc!652 newAcc!49))))

(declare-fun b!714038 () Bool)

(assert (=> b!714038 (= e!401474 false)))

(declare-fun lt!318831 () Bool)

(declare-fun contains!3969 (List!13317 (_ BitVec 64)) Bool)

(assert (=> b!714038 (= lt!318831 (contains!3969 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714039 () Bool)

(declare-fun res!477000 () Bool)

(assert (=> b!714039 (=> (not res!477000) (not e!401474))))

(declare-fun noDuplicate!1243 (List!13317) Bool)

(assert (=> b!714039 (= res!477000 (noDuplicate!1243 newAcc!49))))

(declare-fun b!714040 () Bool)

(declare-fun res!476999 () Bool)

(assert (=> b!714040 (=> (not res!476999) (not e!401474))))

(assert (=> b!714040 (= res!476999 (noDuplicate!1243 acc!652))))

(declare-fun b!714041 () Bool)

(declare-fun res!477007 () Bool)

(assert (=> b!714041 (=> (not res!477007) (not e!401474))))

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!714041 (= res!477007 (not (contains!3969 acc!652 k0!2824)))))

(declare-fun b!714042 () Bool)

(declare-fun res!477010 () Bool)

(assert (=> b!714042 (=> (not res!477010) (not e!401474))))

(assert (=> b!714042 (= res!477010 (not (contains!3969 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714043 () Bool)

(declare-fun res!477005 () Bool)

(assert (=> b!714043 (=> (not res!477005) (not e!401474))))

(declare-fun -!401 (List!13317 (_ BitVec 64)) List!13317)

(assert (=> b!714043 (= res!477005 (= (-!401 newAcc!49 k0!2824) acc!652))))

(declare-fun res!477006 () Bool)

(assert (=> start!63424 (=> (not res!477006) (not e!401474))))

(declare-datatypes ((array!40464 0))(
  ( (array!40465 (arr!19369 (Array (_ BitVec 32) (_ BitVec 64))) (size!19781 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40464)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63424 (= res!477006 (and (bvslt (size!19781 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19781 a!3591))))))

(assert (=> start!63424 e!401474))

(assert (=> start!63424 true))

(declare-fun array_inv!15228 (array!40464) Bool)

(assert (=> start!63424 (array_inv!15228 a!3591)))

(declare-fun b!714044 () Bool)

(declare-fun res!477009 () Bool)

(assert (=> b!714044 (=> (not res!477009) (not e!401474))))

(assert (=> b!714044 (= res!477009 (not (contains!3969 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714045 () Bool)

(declare-fun res!477008 () Bool)

(assert (=> b!714045 (=> (not res!477008) (not e!401474))))

(assert (=> b!714045 (= res!477008 (not (contains!3969 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714046 () Bool)

(declare-fun res!477004 () Bool)

(assert (=> b!714046 (=> (not res!477004) (not e!401474))))

(assert (=> b!714046 (= res!477004 (contains!3969 newAcc!49 k0!2824))))

(declare-fun b!714047 () Bool)

(declare-fun res!477002 () Bool)

(assert (=> b!714047 (=> (not res!477002) (not e!401474))))

(declare-fun arrayContainsKey!0 (array!40464 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!714047 (= res!477002 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!714048 () Bool)

(declare-fun res!476998 () Bool)

(assert (=> b!714048 (=> (not res!476998) (not e!401474))))

(declare-fun arrayNoDuplicates!0 (array!40464 (_ BitVec 32) List!13317) Bool)

(assert (=> b!714048 (= res!476998 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!714049 () Bool)

(declare-fun res!477001 () Bool)

(assert (=> b!714049 (=> (not res!477001) (not e!401474))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!714049 (= res!477001 (validKeyInArray!0 k0!2824))))

(assert (= (and start!63424 res!477006) b!714040))

(assert (= (and b!714040 res!476999) b!714039))

(assert (= (and b!714039 res!477000) b!714042))

(assert (= (and b!714042 res!477010) b!714045))

(assert (= (and b!714045 res!477008) b!714047))

(assert (= (and b!714047 res!477002) b!714041))

(assert (= (and b!714041 res!477007) b!714049))

(assert (= (and b!714049 res!477001) b!714048))

(assert (= (and b!714048 res!476998) b!714037))

(assert (= (and b!714037 res!477003) b!714046))

(assert (= (and b!714046 res!477004) b!714043))

(assert (= (and b!714043 res!477005) b!714044))

(assert (= (and b!714044 res!477009) b!714038))

(declare-fun m!671241 () Bool)

(assert (=> b!714046 m!671241))

(declare-fun m!671243 () Bool)

(assert (=> b!714047 m!671243))

(declare-fun m!671245 () Bool)

(assert (=> b!714040 m!671245))

(declare-fun m!671247 () Bool)

(assert (=> b!714048 m!671247))

(declare-fun m!671249 () Bool)

(assert (=> b!714041 m!671249))

(declare-fun m!671251 () Bool)

(assert (=> b!714042 m!671251))

(declare-fun m!671253 () Bool)

(assert (=> start!63424 m!671253))

(declare-fun m!671255 () Bool)

(assert (=> b!714045 m!671255))

(declare-fun m!671257 () Bool)

(assert (=> b!714044 m!671257))

(declare-fun m!671259 () Bool)

(assert (=> b!714037 m!671259))

(declare-fun m!671261 () Bool)

(assert (=> b!714049 m!671261))

(declare-fun m!671263 () Bool)

(assert (=> b!714039 m!671263))

(declare-fun m!671265 () Bool)

(assert (=> b!714038 m!671265))

(declare-fun m!671267 () Bool)

(assert (=> b!714043 m!671267))

(check-sat (not b!714047) (not b!714048) (not b!714049) (not b!714041) (not b!714045) (not b!714046) (not b!714044) (not b!714042) (not b!714039) (not b!714037) (not start!63424) (not b!714043) (not b!714038) (not b!714040))
(check-sat)
