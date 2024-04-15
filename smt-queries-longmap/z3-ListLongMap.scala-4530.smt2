; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62636 () Bool)

(assert start!62636)

(declare-fun b!707031 () Bool)

(declare-fun res!471009 () Bool)

(declare-fun e!397900 () Bool)

(assert (=> b!707031 (=> (not res!471009) (not e!397900))))

(declare-datatypes ((List!13399 0))(
  ( (Nil!13396) (Cons!13395 (h!14440 (_ BitVec 64)) (t!19672 List!13399)) )
))
(declare-fun acc!652 () List!13399)

(declare-fun contains!3921 (List!13399 (_ BitVec 64)) Bool)

(assert (=> b!707031 (= res!471009 (not (contains!3921 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707032 () Bool)

(declare-fun res!471008 () Bool)

(assert (=> b!707032 (=> (not res!471008) (not e!397900))))

(declare-fun noDuplicate!1190 (List!13399) Bool)

(assert (=> b!707032 (= res!471008 (noDuplicate!1190 acc!652))))

(declare-fun b!707033 () Bool)

(declare-fun res!471007 () Bool)

(assert (=> b!707033 (=> (not res!471007) (not e!397900))))

(declare-fun newAcc!49 () List!13399)

(declare-fun subseq!383 (List!13399 List!13399) Bool)

(assert (=> b!707033 (= res!471007 (subseq!383 acc!652 newAcc!49))))

(declare-fun b!707034 () Bool)

(declare-fun res!471011 () Bool)

(assert (=> b!707034 (=> (not res!471011) (not e!397900))))

(assert (=> b!707034 (= res!471011 (not (contains!3921 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707035 () Bool)

(declare-fun res!471005 () Bool)

(assert (=> b!707035 (=> (not res!471005) (not e!397900))))

(declare-datatypes ((array!40326 0))(
  ( (array!40327 (arr!19319 (Array (_ BitVec 32) (_ BitVec 64))) (size!19701 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40326)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40326 (_ BitVec 32) List!13399) Bool)

(assert (=> b!707035 (= res!471005 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!707036 () Bool)

(declare-fun res!471012 () Bool)

(assert (=> b!707036 (=> (not res!471012) (not e!397900))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707036 (= res!471012 (validKeyInArray!0 k0!2824))))

(declare-fun b!707037 () Bool)

(declare-fun res!471001 () Bool)

(assert (=> b!707037 (=> (not res!471001) (not e!397900))))

(assert (=> b!707037 (= res!471001 (not (contains!3921 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!471006 () Bool)

(assert (=> start!62636 (=> (not res!471006) (not e!397900))))

(assert (=> start!62636 (= res!471006 (and (bvslt (size!19701 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19701 a!3591))))))

(assert (=> start!62636 e!397900))

(assert (=> start!62636 true))

(declare-fun array_inv!15202 (array!40326) Bool)

(assert (=> start!62636 (array_inv!15202 a!3591)))

(declare-fun b!707038 () Bool)

(declare-fun res!471010 () Bool)

(assert (=> b!707038 (=> (not res!471010) (not e!397900))))

(assert (=> b!707038 (= res!471010 (contains!3921 newAcc!49 k0!2824))))

(declare-fun b!707039 () Bool)

(declare-fun res!471003 () Bool)

(assert (=> b!707039 (=> (not res!471003) (not e!397900))))

(declare-fun -!348 (List!13399 (_ BitVec 64)) List!13399)

(assert (=> b!707039 (= res!471003 (= (-!348 newAcc!49 k0!2824) acc!652))))

(declare-fun b!707040 () Bool)

(declare-fun res!471013 () Bool)

(assert (=> b!707040 (=> (not res!471013) (not e!397900))))

(assert (=> b!707040 (= res!471013 (not (contains!3921 acc!652 k0!2824)))))

(declare-fun b!707041 () Bool)

(declare-fun res!471002 () Bool)

(assert (=> b!707041 (=> (not res!471002) (not e!397900))))

(assert (=> b!707041 (= res!471002 (noDuplicate!1190 newAcc!49))))

(declare-fun b!707042 () Bool)

(assert (=> b!707042 (= e!397900 false)))

(declare-fun lt!317745 () Bool)

(assert (=> b!707042 (= lt!317745 (contains!3921 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707043 () Bool)

(declare-fun res!471004 () Bool)

(assert (=> b!707043 (=> (not res!471004) (not e!397900))))

(declare-fun arrayContainsKey!0 (array!40326 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707043 (= res!471004 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(assert (= (and start!62636 res!471006) b!707032))

(assert (= (and b!707032 res!471008) b!707041))

(assert (= (and b!707041 res!471002) b!707037))

(assert (= (and b!707037 res!471001) b!707031))

(assert (= (and b!707031 res!471009) b!707043))

(assert (= (and b!707043 res!471004) b!707040))

(assert (= (and b!707040 res!471013) b!707036))

(assert (= (and b!707036 res!471012) b!707035))

(assert (= (and b!707035 res!471005) b!707033))

(assert (= (and b!707033 res!471007) b!707038))

(assert (= (and b!707038 res!471010) b!707039))

(assert (= (and b!707039 res!471003) b!707034))

(assert (= (and b!707034 res!471011) b!707042))

(declare-fun m!664167 () Bool)

(assert (=> b!707037 m!664167))

(declare-fun m!664169 () Bool)

(assert (=> b!707042 m!664169))

(declare-fun m!664171 () Bool)

(assert (=> b!707039 m!664171))

(declare-fun m!664173 () Bool)

(assert (=> b!707043 m!664173))

(declare-fun m!664175 () Bool)

(assert (=> b!707031 m!664175))

(declare-fun m!664177 () Bool)

(assert (=> b!707032 m!664177))

(declare-fun m!664179 () Bool)

(assert (=> b!707034 m!664179))

(declare-fun m!664181 () Bool)

(assert (=> b!707040 m!664181))

(declare-fun m!664183 () Bool)

(assert (=> b!707038 m!664183))

(declare-fun m!664185 () Bool)

(assert (=> b!707036 m!664185))

(declare-fun m!664187 () Bool)

(assert (=> b!707035 m!664187))

(declare-fun m!664189 () Bool)

(assert (=> b!707041 m!664189))

(declare-fun m!664191 () Bool)

(assert (=> b!707033 m!664191))

(declare-fun m!664193 () Bool)

(assert (=> start!62636 m!664193))

(check-sat (not b!707033) (not b!707042) (not b!707035) (not start!62636) (not b!707040) (not b!707034) (not b!707032) (not b!707039) (not b!707038) (not b!707031) (not b!707037) (not b!707041) (not b!707043) (not b!707036))
(check-sat)
