; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62546 () Bool)

(assert start!62546)

(declare-fun b!704944 () Bool)

(declare-fun res!468761 () Bool)

(declare-fun e!397776 () Bool)

(assert (=> b!704944 (=> (not res!468761) (not e!397776))))

(declare-datatypes ((List!13310 0))(
  ( (Nil!13307) (Cons!13306 (h!14351 (_ BitVec 64)) (t!19592 List!13310)) )
))
(declare-fun newAcc!49 () List!13310)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3887 (List!13310 (_ BitVec 64)) Bool)

(assert (=> b!704944 (= res!468761 (contains!3887 newAcc!49 k!2824))))

(declare-fun b!704945 () Bool)

(declare-fun res!468754 () Bool)

(assert (=> b!704945 (=> (not res!468754) (not e!397776))))

(declare-fun acc!652 () List!13310)

(assert (=> b!704945 (= res!468754 (not (contains!3887 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704946 () Bool)

(declare-fun res!468766 () Bool)

(assert (=> b!704946 (=> (not res!468766) (not e!397776))))

(declare-datatypes ((array!40225 0))(
  ( (array!40226 (arr!19269 (Array (_ BitVec 32) (_ BitVec 64))) (size!19654 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40225)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704946 (= res!468766 (not (validKeyInArray!0 (select (arr!19269 a!3591) from!2969))))))

(declare-fun b!704947 () Bool)

(declare-fun res!468769 () Bool)

(assert (=> b!704947 (=> (not res!468769) (not e!397776))))

(declare-fun noDuplicate!1134 (List!13310) Bool)

(assert (=> b!704947 (= res!468769 (noDuplicate!1134 acc!652))))

(declare-fun b!704948 () Bool)

(declare-fun res!468767 () Bool)

(assert (=> b!704948 (=> (not res!468767) (not e!397776))))

(assert (=> b!704948 (= res!468767 (not (contains!3887 acc!652 k!2824)))))

(declare-fun b!704949 () Bool)

(declare-fun res!468756 () Bool)

(assert (=> b!704949 (=> (not res!468756) (not e!397776))))

(assert (=> b!704949 (= res!468756 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!704950 () Bool)

(declare-fun res!468768 () Bool)

(assert (=> b!704950 (=> (not res!468768) (not e!397776))))

(declare-fun -!297 (List!13310 (_ BitVec 64)) List!13310)

(assert (=> b!704950 (= res!468768 (= (-!297 newAcc!49 k!2824) acc!652))))

(declare-fun b!704951 () Bool)

(declare-fun res!468765 () Bool)

(assert (=> b!704951 (=> (not res!468765) (not e!397776))))

(declare-fun arrayContainsKey!0 (array!40225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704951 (= res!468765 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!704952 () Bool)

(declare-fun res!468763 () Bool)

(assert (=> b!704952 (=> (not res!468763) (not e!397776))))

(assert (=> b!704952 (= res!468763 (not (contains!3887 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704954 () Bool)

(declare-fun res!468771 () Bool)

(assert (=> b!704954 (=> (not res!468771) (not e!397776))))

(assert (=> b!704954 (= res!468771 (not (contains!3887 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704955 () Bool)

(assert (=> b!704955 (= e!397776 false)))

(declare-fun lt!317871 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40225 (_ BitVec 32) List!13310) Bool)

(assert (=> b!704955 (= lt!317871 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704956 () Bool)

(declare-fun res!468764 () Bool)

(assert (=> b!704956 (=> (not res!468764) (not e!397776))))

(assert (=> b!704956 (= res!468764 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19654 a!3591)))))

(declare-fun b!704957 () Bool)

(declare-fun res!468760 () Bool)

(assert (=> b!704957 (=> (not res!468760) (not e!397776))))

(assert (=> b!704957 (= res!468760 (validKeyInArray!0 k!2824))))

(declare-fun b!704958 () Bool)

(declare-fun res!468758 () Bool)

(assert (=> b!704958 (=> (not res!468758) (not e!397776))))

(assert (=> b!704958 (= res!468758 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!704959 () Bool)

(declare-fun res!468759 () Bool)

(assert (=> b!704959 (=> (not res!468759) (not e!397776))))

(assert (=> b!704959 (= res!468759 (noDuplicate!1134 newAcc!49))))

(declare-fun res!468755 () Bool)

(assert (=> start!62546 (=> (not res!468755) (not e!397776))))

(assert (=> start!62546 (= res!468755 (and (bvslt (size!19654 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19654 a!3591))))))

(assert (=> start!62546 e!397776))

(assert (=> start!62546 true))

(declare-fun array_inv!15065 (array!40225) Bool)

(assert (=> start!62546 (array_inv!15065 a!3591)))

(declare-fun b!704953 () Bool)

(declare-fun res!468762 () Bool)

(assert (=> b!704953 (=> (not res!468762) (not e!397776))))

(declare-fun subseq!332 (List!13310 List!13310) Bool)

(assert (=> b!704953 (= res!468762 (subseq!332 acc!652 newAcc!49))))

(declare-fun b!704960 () Bool)

(declare-fun res!468757 () Bool)

(assert (=> b!704960 (=> (not res!468757) (not e!397776))))

(assert (=> b!704960 (= res!468757 (not (contains!3887 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704961 () Bool)

(declare-fun res!468770 () Bool)

(assert (=> b!704961 (=> (not res!468770) (not e!397776))))

(assert (=> b!704961 (= res!468770 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(assert (= (and start!62546 res!468755) b!704947))

(assert (= (and b!704947 res!468769) b!704959))

(assert (= (and b!704959 res!468759) b!704954))

(assert (= (and b!704954 res!468771) b!704945))

(assert (= (and b!704945 res!468754) b!704958))

(assert (= (and b!704958 res!468758) b!704948))

(assert (= (and b!704948 res!468767) b!704957))

(assert (= (and b!704957 res!468760) b!704961))

(assert (= (and b!704961 res!468770) b!704953))

(assert (= (and b!704953 res!468762) b!704944))

(assert (= (and b!704944 res!468761) b!704950))

(assert (= (and b!704950 res!468768) b!704952))

(assert (= (and b!704952 res!468763) b!704960))

(assert (= (and b!704960 res!468757) b!704956))

(assert (= (and b!704956 res!468764) b!704946))

(assert (= (and b!704946 res!468766) b!704949))

(assert (= (and b!704949 res!468756) b!704951))

(assert (= (and b!704951 res!468765) b!704955))

(declare-fun m!663271 () Bool)

(assert (=> start!62546 m!663271))

(declare-fun m!663273 () Bool)

(assert (=> b!704946 m!663273))

(assert (=> b!704946 m!663273))

(declare-fun m!663275 () Bool)

(assert (=> b!704946 m!663275))

(declare-fun m!663277 () Bool)

(assert (=> b!704959 m!663277))

(declare-fun m!663279 () Bool)

(assert (=> b!704952 m!663279))

(declare-fun m!663281 () Bool)

(assert (=> b!704951 m!663281))

(declare-fun m!663283 () Bool)

(assert (=> b!704955 m!663283))

(declare-fun m!663285 () Bool)

(assert (=> b!704961 m!663285))

(declare-fun m!663287 () Bool)

(assert (=> b!704953 m!663287))

(declare-fun m!663289 () Bool)

(assert (=> b!704948 m!663289))

(declare-fun m!663291 () Bool)

(assert (=> b!704960 m!663291))

(declare-fun m!663293 () Bool)

(assert (=> b!704950 m!663293))

(declare-fun m!663295 () Bool)

(assert (=> b!704958 m!663295))

(declare-fun m!663297 () Bool)

(assert (=> b!704957 m!663297))

(declare-fun m!663299 () Bool)

(assert (=> b!704944 m!663299))

(declare-fun m!663301 () Bool)

(assert (=> b!704954 m!663301))

(declare-fun m!663303 () Bool)

(assert (=> b!704947 m!663303))

(declare-fun m!663305 () Bool)

(assert (=> b!704945 m!663305))

(push 1)

(assert (not start!62546))

(assert (not b!704947))

(assert (not b!704960))

(assert (not b!704958))

(assert (not b!704950))

(assert (not b!704955))

(assert (not b!704957))

(assert (not b!704961))

(assert (not b!704951))

(assert (not b!704948))

(assert (not b!704944))

(assert (not b!704959))

(assert (not b!704945))

(assert (not b!704954))

(assert (not b!704953))

(assert (not b!704946))

(assert (not b!704952))

(check-sat)

(pop 1)

