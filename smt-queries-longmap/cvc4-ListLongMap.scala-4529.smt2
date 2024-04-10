; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62646 () Bool)

(assert start!62646)

(declare-fun b!707277 () Bool)

(declare-fun res!471100 () Bool)

(declare-fun e!398076 () Bool)

(assert (=> b!707277 (=> (not res!471100) (not e!398076))))

(declare-datatypes ((List!13360 0))(
  ( (Nil!13357) (Cons!13356 (h!14401 (_ BitVec 64)) (t!19642 List!13360)) )
))
(declare-fun acc!652 () List!13360)

(declare-fun contains!3937 (List!13360 (_ BitVec 64)) Bool)

(assert (=> b!707277 (= res!471100 (not (contains!3937 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707278 () Bool)

(declare-fun res!471090 () Bool)

(assert (=> b!707278 (=> (not res!471090) (not e!398076))))

(declare-fun newAcc!49 () List!13360)

(declare-fun noDuplicate!1184 (List!13360) Bool)

(assert (=> b!707278 (= res!471090 (noDuplicate!1184 newAcc!49))))

(declare-fun b!707279 () Bool)

(declare-fun res!471092 () Bool)

(assert (=> b!707279 (=> (not res!471092) (not e!398076))))

(assert (=> b!707279 (= res!471092 (not (contains!3937 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707280 () Bool)

(declare-fun res!471091 () Bool)

(assert (=> b!707280 (=> (not res!471091) (not e!398076))))

(assert (=> b!707280 (= res!471091 (noDuplicate!1184 acc!652))))

(declare-fun b!707281 () Bool)

(declare-fun res!471087 () Bool)

(assert (=> b!707281 (=> (not res!471087) (not e!398076))))

(declare-fun subseq!382 (List!13360 List!13360) Bool)

(assert (=> b!707281 (= res!471087 (subseq!382 acc!652 newAcc!49))))

(declare-fun b!707282 () Bool)

(declare-fun res!471102 () Bool)

(assert (=> b!707282 (=> (not res!471102) (not e!398076))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun -!347 (List!13360 (_ BitVec 64)) List!13360)

(assert (=> b!707282 (= res!471102 (= (-!347 newAcc!49 k!2824) acc!652))))

(declare-fun b!707283 () Bool)

(declare-fun res!471093 () Bool)

(assert (=> b!707283 (=> (not res!471093) (not e!398076))))

(assert (=> b!707283 (= res!471093 (not (contains!3937 acc!652 k!2824)))))

(declare-fun b!707284 () Bool)

(declare-fun res!471097 () Bool)

(assert (=> b!707284 (=> (not res!471097) (not e!398076))))

(assert (=> b!707284 (= res!471097 (not (contains!3937 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!471101 () Bool)

(assert (=> start!62646 (=> (not res!471101) (not e!398076))))

(declare-datatypes ((array!40325 0))(
  ( (array!40326 (arr!19319 (Array (_ BitVec 32) (_ BitVec 64))) (size!19704 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40325)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62646 (= res!471101 (and (bvslt (size!19704 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19704 a!3591))))))

(assert (=> start!62646 e!398076))

(assert (=> start!62646 true))

(declare-fun array_inv!15115 (array!40325) Bool)

(assert (=> start!62646 (array_inv!15115 a!3591)))

(declare-fun b!707285 () Bool)

(declare-fun res!471095 () Bool)

(assert (=> b!707285 (=> (not res!471095) (not e!398076))))

(assert (=> b!707285 (= res!471095 (contains!3937 newAcc!49 k!2824))))

(declare-fun b!707286 () Bool)

(declare-fun res!471099 () Bool)

(assert (=> b!707286 (=> (not res!471099) (not e!398076))))

(declare-fun arrayNoDuplicates!0 (array!40325 (_ BitVec 32) List!13360) Bool)

(assert (=> b!707286 (= res!471099 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!707287 () Bool)

(declare-fun res!471094 () Bool)

(assert (=> b!707287 (=> (not res!471094) (not e!398076))))

(assert (=> b!707287 (= res!471094 (not (contains!3937 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707288 () Bool)

(assert (=> b!707288 (= e!398076 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!707289 () Bool)

(declare-fun res!471088 () Bool)

(assert (=> b!707289 (=> (not res!471088) (not e!398076))))

(assert (=> b!707289 (= res!471088 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19704 a!3591)))))

(declare-fun b!707290 () Bool)

(declare-fun res!471098 () Bool)

(assert (=> b!707290 (=> (not res!471098) (not e!398076))))

(declare-fun arrayContainsKey!0 (array!40325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707290 (= res!471098 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!707291 () Bool)

(declare-fun res!471089 () Bool)

(assert (=> b!707291 (=> (not res!471089) (not e!398076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707291 (= res!471089 (validKeyInArray!0 (select (arr!19319 a!3591) from!2969)))))

(declare-fun b!707292 () Bool)

(declare-fun res!471096 () Bool)

(assert (=> b!707292 (=> (not res!471096) (not e!398076))))

(assert (=> b!707292 (= res!471096 (validKeyInArray!0 k!2824))))

(assert (= (and start!62646 res!471101) b!707280))

(assert (= (and b!707280 res!471091) b!707278))

(assert (= (and b!707278 res!471090) b!707277))

(assert (= (and b!707277 res!471100) b!707287))

(assert (= (and b!707287 res!471094) b!707290))

(assert (= (and b!707290 res!471098) b!707283))

(assert (= (and b!707283 res!471093) b!707292))

(assert (= (and b!707292 res!471096) b!707286))

(assert (= (and b!707286 res!471099) b!707281))

(assert (= (and b!707281 res!471087) b!707285))

(assert (= (and b!707285 res!471095) b!707282))

(assert (= (and b!707282 res!471102) b!707279))

(assert (= (and b!707279 res!471092) b!707284))

(assert (= (and b!707284 res!471097) b!707289))

(assert (= (and b!707289 res!471088) b!707291))

(assert (= (and b!707291 res!471089) b!707288))

(declare-fun m!664895 () Bool)

(assert (=> b!707280 m!664895))

(declare-fun m!664897 () Bool)

(assert (=> start!62646 m!664897))

(declare-fun m!664899 () Bool)

(assert (=> b!707277 m!664899))

(declare-fun m!664901 () Bool)

(assert (=> b!707279 m!664901))

(declare-fun m!664903 () Bool)

(assert (=> b!707283 m!664903))

(declare-fun m!664905 () Bool)

(assert (=> b!707290 m!664905))

(declare-fun m!664907 () Bool)

(assert (=> b!707285 m!664907))

(declare-fun m!664909 () Bool)

(assert (=> b!707287 m!664909))

(declare-fun m!664911 () Bool)

(assert (=> b!707286 m!664911))

(declare-fun m!664913 () Bool)

(assert (=> b!707292 m!664913))

(declare-fun m!664915 () Bool)

(assert (=> b!707282 m!664915))

(declare-fun m!664917 () Bool)

(assert (=> b!707284 m!664917))

(declare-fun m!664919 () Bool)

(assert (=> b!707281 m!664919))

(declare-fun m!664921 () Bool)

(assert (=> b!707278 m!664921))

(declare-fun m!664923 () Bool)

(assert (=> b!707291 m!664923))

(assert (=> b!707291 m!664923))

(declare-fun m!664925 () Bool)

(assert (=> b!707291 m!664925))

(push 1)

(assert (not b!707292))

(assert (not b!707279))

(assert (not b!707282))

