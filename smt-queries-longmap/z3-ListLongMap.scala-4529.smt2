; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62644 () Bool)

(assert start!62644)

(declare-fun b!707229 () Bool)

(declare-fun res!471041 () Bool)

(declare-fun e!398071 () Bool)

(assert (=> b!707229 (=> (not res!471041) (not e!398071))))

(declare-datatypes ((List!13359 0))(
  ( (Nil!13356) (Cons!13355 (h!14400 (_ BitVec 64)) (t!19641 List!13359)) )
))
(declare-fun acc!652 () List!13359)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3936 (List!13359 (_ BitVec 64)) Bool)

(assert (=> b!707229 (= res!471041 (not (contains!3936 acc!652 k0!2824)))))

(declare-fun res!471044 () Bool)

(assert (=> start!62644 (=> (not res!471044) (not e!398071))))

(declare-datatypes ((array!40323 0))(
  ( (array!40324 (arr!19318 (Array (_ BitVec 32) (_ BitVec 64))) (size!19703 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40323)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62644 (= res!471044 (and (bvslt (size!19703 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19703 a!3591))))))

(assert (=> start!62644 e!398071))

(assert (=> start!62644 true))

(declare-fun array_inv!15114 (array!40323) Bool)

(assert (=> start!62644 (array_inv!15114 a!3591)))

(declare-fun b!707230 () Bool)

(declare-fun res!471052 () Bool)

(assert (=> b!707230 (=> (not res!471052) (not e!398071))))

(declare-fun arrayNoDuplicates!0 (array!40323 (_ BitVec 32) List!13359) Bool)

(assert (=> b!707230 (= res!471052 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!707231 () Bool)

(declare-fun res!471040 () Bool)

(assert (=> b!707231 (=> (not res!471040) (not e!398071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707231 (= res!471040 (validKeyInArray!0 (select (arr!19318 a!3591) from!2969)))))

(declare-fun b!707232 () Bool)

(declare-fun res!471049 () Bool)

(assert (=> b!707232 (=> (not res!471049) (not e!398071))))

(assert (=> b!707232 (= res!471049 (not (contains!3936 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707233 () Bool)

(declare-fun res!471051 () Bool)

(assert (=> b!707233 (=> (not res!471051) (not e!398071))))

(assert (=> b!707233 (= res!471051 (not (contains!3936 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707234 () Bool)

(declare-fun res!471048 () Bool)

(assert (=> b!707234 (=> (not res!471048) (not e!398071))))

(declare-fun arrayContainsKey!0 (array!40323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707234 (= res!471048 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!707235 () Bool)

(declare-fun res!471043 () Bool)

(assert (=> b!707235 (=> (not res!471043) (not e!398071))))

(declare-fun newAcc!49 () List!13359)

(declare-fun -!346 (List!13359 (_ BitVec 64)) List!13359)

(assert (=> b!707235 (= res!471043 (= (-!346 newAcc!49 k0!2824) acc!652))))

(declare-fun b!707236 () Bool)

(declare-fun res!471053 () Bool)

(assert (=> b!707236 (=> (not res!471053) (not e!398071))))

(assert (=> b!707236 (= res!471053 (not (contains!3936 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707237 () Bool)

(declare-fun res!471042 () Bool)

(assert (=> b!707237 (=> (not res!471042) (not e!398071))))

(declare-fun subseq!381 (List!13359 List!13359) Bool)

(assert (=> b!707237 (= res!471042 (subseq!381 acc!652 newAcc!49))))

(declare-fun b!707238 () Bool)

(declare-fun res!471047 () Bool)

(assert (=> b!707238 (=> (not res!471047) (not e!398071))))

(assert (=> b!707238 (= res!471047 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19703 a!3591)))))

(declare-fun b!707239 () Bool)

(assert (=> b!707239 (= e!398071 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!707240 () Bool)

(declare-fun res!471050 () Bool)

(assert (=> b!707240 (=> (not res!471050) (not e!398071))))

(assert (=> b!707240 (= res!471050 (not (contains!3936 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707241 () Bool)

(declare-fun res!471039 () Bool)

(assert (=> b!707241 (=> (not res!471039) (not e!398071))))

(assert (=> b!707241 (= res!471039 (contains!3936 newAcc!49 k0!2824))))

(declare-fun b!707242 () Bool)

(declare-fun res!471054 () Bool)

(assert (=> b!707242 (=> (not res!471054) (not e!398071))))

(declare-fun noDuplicate!1183 (List!13359) Bool)

(assert (=> b!707242 (= res!471054 (noDuplicate!1183 acc!652))))

(declare-fun b!707243 () Bool)

(declare-fun res!471046 () Bool)

(assert (=> b!707243 (=> (not res!471046) (not e!398071))))

(assert (=> b!707243 (= res!471046 (noDuplicate!1183 newAcc!49))))

(declare-fun b!707244 () Bool)

(declare-fun res!471045 () Bool)

(assert (=> b!707244 (=> (not res!471045) (not e!398071))))

(assert (=> b!707244 (= res!471045 (validKeyInArray!0 k0!2824))))

(assert (= (and start!62644 res!471044) b!707242))

(assert (= (and b!707242 res!471054) b!707243))

(assert (= (and b!707243 res!471046) b!707233))

(assert (= (and b!707233 res!471051) b!707232))

(assert (= (and b!707232 res!471049) b!707234))

(assert (= (and b!707234 res!471048) b!707229))

(assert (= (and b!707229 res!471041) b!707244))

(assert (= (and b!707244 res!471045) b!707230))

(assert (= (and b!707230 res!471052) b!707237))

(assert (= (and b!707237 res!471042) b!707241))

(assert (= (and b!707241 res!471039) b!707235))

(assert (= (and b!707235 res!471043) b!707236))

(assert (= (and b!707236 res!471053) b!707240))

(assert (= (and b!707240 res!471050) b!707238))

(assert (= (and b!707238 res!471047) b!707231))

(assert (= (and b!707231 res!471040) b!707239))

(declare-fun m!664863 () Bool)

(assert (=> b!707235 m!664863))

(declare-fun m!664865 () Bool)

(assert (=> b!707242 m!664865))

(declare-fun m!664867 () Bool)

(assert (=> b!707229 m!664867))

(declare-fun m!664869 () Bool)

(assert (=> b!707237 m!664869))

(declare-fun m!664871 () Bool)

(assert (=> start!62644 m!664871))

(declare-fun m!664873 () Bool)

(assert (=> b!707243 m!664873))

(declare-fun m!664875 () Bool)

(assert (=> b!707231 m!664875))

(assert (=> b!707231 m!664875))

(declare-fun m!664877 () Bool)

(assert (=> b!707231 m!664877))

(declare-fun m!664879 () Bool)

(assert (=> b!707236 m!664879))

(declare-fun m!664881 () Bool)

(assert (=> b!707241 m!664881))

(declare-fun m!664883 () Bool)

(assert (=> b!707232 m!664883))

(declare-fun m!664885 () Bool)

(assert (=> b!707234 m!664885))

(declare-fun m!664887 () Bool)

(assert (=> b!707244 m!664887))

(declare-fun m!664889 () Bool)

(assert (=> b!707230 m!664889))

(declare-fun m!664891 () Bool)

(assert (=> b!707240 m!664891))

(declare-fun m!664893 () Bool)

(assert (=> b!707233 m!664893))

(check-sat (not b!707242) (not b!707237) (not b!707234) (not b!707229) (not b!707244) (not b!707232) (not b!707241) (not b!707236) (not b!707233) (not b!707230) (not b!707231) (not b!707235) (not b!707243) (not b!707240) (not start!62644))
(check-sat)
