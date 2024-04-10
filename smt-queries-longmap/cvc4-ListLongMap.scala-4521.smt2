; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62598 () Bool)

(assert start!62598)

(declare-fun b!706308 () Bool)

(declare-fun res!470121 () Bool)

(declare-fun e!397932 () Bool)

(assert (=> b!706308 (=> (not res!470121) (not e!397932))))

(declare-datatypes ((List!13336 0))(
  ( (Nil!13333) (Cons!13332 (h!14377 (_ BitVec 64)) (t!19618 List!13336)) )
))
(declare-fun newAcc!49 () List!13336)

(declare-fun contains!3913 (List!13336 (_ BitVec 64)) Bool)

(assert (=> b!706308 (= res!470121 (not (contains!3913 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!470126 () Bool)

(assert (=> start!62598 (=> (not res!470126) (not e!397932))))

(declare-datatypes ((array!40277 0))(
  ( (array!40278 (arr!19295 (Array (_ BitVec 32) (_ BitVec 64))) (size!19680 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40277)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62598 (= res!470126 (and (bvslt (size!19680 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19680 a!3591))))))

(assert (=> start!62598 e!397932))

(assert (=> start!62598 true))

(declare-fun array_inv!15091 (array!40277) Bool)

(assert (=> start!62598 (array_inv!15091 a!3591)))

(declare-fun b!706309 () Bool)

(declare-fun res!470124 () Bool)

(assert (=> b!706309 (=> (not res!470124) (not e!397932))))

(declare-fun acc!652 () List!13336)

(assert (=> b!706309 (= res!470124 (not (contains!3913 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706310 () Bool)

(assert (=> b!706310 (= e!397932 false)))

(declare-fun lt!317940 () Bool)

(assert (=> b!706310 (= lt!317940 (contains!3913 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!706311 () Bool)

(declare-fun res!470118 () Bool)

(assert (=> b!706311 (=> (not res!470118) (not e!397932))))

(declare-fun noDuplicate!1160 (List!13336) Bool)

(assert (=> b!706311 (= res!470118 (noDuplicate!1160 newAcc!49))))

(declare-fun b!706312 () Bool)

(declare-fun res!470125 () Bool)

(assert (=> b!706312 (=> (not res!470125) (not e!397932))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706312 (= res!470125 (validKeyInArray!0 k!2824))))

(declare-fun b!706313 () Bool)

(declare-fun res!470127 () Bool)

(assert (=> b!706313 (=> (not res!470127) (not e!397932))))

(declare-fun -!323 (List!13336 (_ BitVec 64)) List!13336)

(assert (=> b!706313 (= res!470127 (= (-!323 newAcc!49 k!2824) acc!652))))

(declare-fun b!706314 () Bool)

(declare-fun res!470130 () Bool)

(assert (=> b!706314 (=> (not res!470130) (not e!397932))))

(declare-fun subseq!358 (List!13336 List!13336) Bool)

(assert (=> b!706314 (= res!470130 (subseq!358 acc!652 newAcc!49))))

(declare-fun b!706315 () Bool)

(declare-fun res!470123 () Bool)

(assert (=> b!706315 (=> (not res!470123) (not e!397932))))

(declare-fun arrayNoDuplicates!0 (array!40277 (_ BitVec 32) List!13336) Bool)

(assert (=> b!706315 (= res!470123 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706316 () Bool)

(declare-fun res!470129 () Bool)

(assert (=> b!706316 (=> (not res!470129) (not e!397932))))

(assert (=> b!706316 (= res!470129 (noDuplicate!1160 acc!652))))

(declare-fun b!706317 () Bool)

(declare-fun res!470122 () Bool)

(assert (=> b!706317 (=> (not res!470122) (not e!397932))))

(assert (=> b!706317 (= res!470122 (not (contains!3913 acc!652 k!2824)))))

(declare-fun b!706318 () Bool)

(declare-fun res!470120 () Bool)

(assert (=> b!706318 (=> (not res!470120) (not e!397932))))

(assert (=> b!706318 (= res!470120 (not (contains!3913 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706319 () Bool)

(declare-fun res!470119 () Bool)

(assert (=> b!706319 (=> (not res!470119) (not e!397932))))

(assert (=> b!706319 (= res!470119 (contains!3913 newAcc!49 k!2824))))

(declare-fun b!706320 () Bool)

(declare-fun res!470128 () Bool)

(assert (=> b!706320 (=> (not res!470128) (not e!397932))))

(declare-fun arrayContainsKey!0 (array!40277 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706320 (= res!470128 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(assert (= (and start!62598 res!470126) b!706316))

(assert (= (and b!706316 res!470129) b!706311))

(assert (= (and b!706311 res!470118) b!706318))

(assert (= (and b!706318 res!470120) b!706309))

(assert (= (and b!706309 res!470124) b!706320))

(assert (= (and b!706320 res!470128) b!706317))

(assert (= (and b!706317 res!470122) b!706312))

(assert (= (and b!706312 res!470125) b!706315))

(assert (= (and b!706315 res!470123) b!706314))

(assert (= (and b!706314 res!470130) b!706319))

(assert (= (and b!706319 res!470119) b!706313))

(assert (= (and b!706313 res!470127) b!706308))

(assert (= (and b!706308 res!470121) b!706310))

(declare-fun m!664215 () Bool)

(assert (=> b!706308 m!664215))

(declare-fun m!664217 () Bool)

(assert (=> start!62598 m!664217))

(declare-fun m!664219 () Bool)

(assert (=> b!706313 m!664219))

(declare-fun m!664221 () Bool)

(assert (=> b!706315 m!664221))

(declare-fun m!664223 () Bool)

(assert (=> b!706320 m!664223))

(declare-fun m!664225 () Bool)

(assert (=> b!706310 m!664225))

(declare-fun m!664227 () Bool)

(assert (=> b!706317 m!664227))

(declare-fun m!664229 () Bool)

(assert (=> b!706318 m!664229))

(declare-fun m!664231 () Bool)

(assert (=> b!706312 m!664231))

(declare-fun m!664233 () Bool)

(assert (=> b!706309 m!664233))

(declare-fun m!664235 () Bool)

(assert (=> b!706311 m!664235))

(declare-fun m!664237 () Bool)

(assert (=> b!706314 m!664237))

(declare-fun m!664239 () Bool)

(assert (=> b!706316 m!664239))

(declare-fun m!664241 () Bool)

(assert (=> b!706319 m!664241))

(push 1)

(assert (not b!706314))

(assert (not b!706320))

(assert (not b!706319))

(assert (not b!706318))

(assert (not b!706316))

(assert (not b!706309))

(assert (not start!62598))

(assert (not b!706313))

(assert (not b!706310))

(assert (not b!706312))

(assert (not b!706311))

(assert (not b!706317))

