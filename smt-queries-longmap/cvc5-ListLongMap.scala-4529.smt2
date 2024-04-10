; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62642 () Bool)

(assert start!62642)

(declare-fun b!707181 () Bool)

(declare-fun res!471002 () Bool)

(declare-fun e!398065 () Bool)

(assert (=> b!707181 (=> (not res!471002) (not e!398065))))

(declare-datatypes ((List!13358 0))(
  ( (Nil!13355) (Cons!13354 (h!14399 (_ BitVec 64)) (t!19640 List!13358)) )
))
(declare-fun acc!652 () List!13358)

(declare-fun contains!3935 (List!13358 (_ BitVec 64)) Bool)

(assert (=> b!707181 (= res!471002 (not (contains!3935 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707182 () Bool)

(declare-fun res!470992 () Bool)

(assert (=> b!707182 (=> (not res!470992) (not e!398065))))

(declare-fun newAcc!49 () List!13358)

(declare-fun subseq!380 (List!13358 List!13358) Bool)

(assert (=> b!707182 (= res!470992 (subseq!380 acc!652 newAcc!49))))

(declare-fun b!707183 () Bool)

(declare-fun res!471000 () Bool)

(assert (=> b!707183 (=> (not res!471000) (not e!398065))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun -!345 (List!13358 (_ BitVec 64)) List!13358)

(assert (=> b!707183 (= res!471000 (= (-!345 newAcc!49 k!2824) acc!652))))

(declare-fun b!707184 () Bool)

(declare-fun res!471003 () Bool)

(assert (=> b!707184 (=> (not res!471003) (not e!398065))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707184 (= res!471003 (validKeyInArray!0 k!2824))))

(declare-fun b!707185 () Bool)

(declare-fun res!470997 () Bool)

(assert (=> b!707185 (=> (not res!470997) (not e!398065))))

(declare-datatypes ((array!40321 0))(
  ( (array!40322 (arr!19317 (Array (_ BitVec 32) (_ BitVec 64))) (size!19702 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40321)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!707185 (= res!470997 (validKeyInArray!0 (select (arr!19317 a!3591) from!2969)))))

(declare-fun b!707186 () Bool)

(declare-fun res!471004 () Bool)

(assert (=> b!707186 (=> (not res!471004) (not e!398065))))

(assert (=> b!707186 (= res!471004 (not (contains!3935 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707187 () Bool)

(declare-fun res!470994 () Bool)

(assert (=> b!707187 (=> (not res!470994) (not e!398065))))

(assert (=> b!707187 (= res!470994 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19702 a!3591)))))

(declare-fun b!707188 () Bool)

(declare-fun res!471001 () Bool)

(assert (=> b!707188 (=> (not res!471001) (not e!398065))))

(assert (=> b!707188 (= res!471001 (not (contains!3935 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707190 () Bool)

(declare-fun res!471006 () Bool)

(assert (=> b!707190 (=> (not res!471006) (not e!398065))))

(assert (=> b!707190 (= res!471006 (contains!3935 newAcc!49 k!2824))))

(declare-fun b!707191 () Bool)

(declare-fun res!470999 () Bool)

(assert (=> b!707191 (=> (not res!470999) (not e!398065))))

(declare-fun noDuplicate!1182 (List!13358) Bool)

(assert (=> b!707191 (= res!470999 (noDuplicate!1182 newAcc!49))))

(declare-fun b!707192 () Bool)

(declare-fun res!470998 () Bool)

(assert (=> b!707192 (=> (not res!470998) (not e!398065))))

(assert (=> b!707192 (= res!470998 (noDuplicate!1182 acc!652))))

(declare-fun b!707193 () Bool)

(declare-fun res!471005 () Bool)

(assert (=> b!707193 (=> (not res!471005) (not e!398065))))

(assert (=> b!707193 (= res!471005 (not (contains!3935 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707194 () Bool)

(assert (=> b!707194 (= e!398065 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!707195 () Bool)

(declare-fun res!470991 () Bool)

(assert (=> b!707195 (=> (not res!470991) (not e!398065))))

(declare-fun arrayContainsKey!0 (array!40321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707195 (= res!470991 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!707196 () Bool)

(declare-fun res!470995 () Bool)

(assert (=> b!707196 (=> (not res!470995) (not e!398065))))

(assert (=> b!707196 (= res!470995 (not (contains!3935 acc!652 k!2824)))))

(declare-fun b!707189 () Bool)

(declare-fun res!470993 () Bool)

(assert (=> b!707189 (=> (not res!470993) (not e!398065))))

(declare-fun arrayNoDuplicates!0 (array!40321 (_ BitVec 32) List!13358) Bool)

(assert (=> b!707189 (= res!470993 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun res!470996 () Bool)

(assert (=> start!62642 (=> (not res!470996) (not e!398065))))

(assert (=> start!62642 (= res!470996 (and (bvslt (size!19702 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19702 a!3591))))))

(assert (=> start!62642 e!398065))

(assert (=> start!62642 true))

(declare-fun array_inv!15113 (array!40321) Bool)

(assert (=> start!62642 (array_inv!15113 a!3591)))

(assert (= (and start!62642 res!470996) b!707192))

(assert (= (and b!707192 res!470998) b!707191))

(assert (= (and b!707191 res!470999) b!707186))

(assert (= (and b!707186 res!471004) b!707181))

(assert (= (and b!707181 res!471002) b!707195))

(assert (= (and b!707195 res!470991) b!707196))

(assert (= (and b!707196 res!470995) b!707184))

(assert (= (and b!707184 res!471003) b!707189))

(assert (= (and b!707189 res!470993) b!707182))

(assert (= (and b!707182 res!470992) b!707190))

(assert (= (and b!707190 res!471006) b!707183))

(assert (= (and b!707183 res!471000) b!707188))

(assert (= (and b!707188 res!471001) b!707193))

(assert (= (and b!707193 res!471005) b!707187))

(assert (= (and b!707187 res!470994) b!707185))

(assert (= (and b!707185 res!470997) b!707194))

(declare-fun m!664831 () Bool)

(assert (=> b!707190 m!664831))

(declare-fun m!664833 () Bool)

(assert (=> b!707186 m!664833))

(declare-fun m!664835 () Bool)

(assert (=> b!707188 m!664835))

(declare-fun m!664837 () Bool)

(assert (=> b!707181 m!664837))

(declare-fun m!664839 () Bool)

(assert (=> b!707189 m!664839))

(declare-fun m!664841 () Bool)

(assert (=> start!62642 m!664841))

(declare-fun m!664843 () Bool)

(assert (=> b!707184 m!664843))

(declare-fun m!664845 () Bool)

(assert (=> b!707195 m!664845))

(declare-fun m!664847 () Bool)

(assert (=> b!707182 m!664847))

(declare-fun m!664849 () Bool)

(assert (=> b!707185 m!664849))

(assert (=> b!707185 m!664849))

(declare-fun m!664851 () Bool)

(assert (=> b!707185 m!664851))

(declare-fun m!664853 () Bool)

(assert (=> b!707183 m!664853))

(declare-fun m!664855 () Bool)

(assert (=> b!707191 m!664855))

(declare-fun m!664857 () Bool)

(assert (=> b!707192 m!664857))

(declare-fun m!664859 () Bool)

(assert (=> b!707196 m!664859))

(declare-fun m!664861 () Bool)

(assert (=> b!707193 m!664861))

(push 1)

