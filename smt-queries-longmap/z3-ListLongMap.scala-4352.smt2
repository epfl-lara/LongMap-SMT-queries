; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60142 () Bool)

(assert start!60142)

(declare-fun res!438009 () Bool)

(declare-fun e!383681 () Bool)

(assert (=> start!60142 (=> (not res!438009) (not e!383681))))

(declare-datatypes ((array!39189 0))(
  ( (array!39190 (arr!18787 (Array (_ BitVec 32) (_ BitVec 64))) (size!19151 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39189)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60142 (= res!438009 (and (bvslt (size!19151 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19151 a!3626))))))

(assert (=> start!60142 e!383681))

(assert (=> start!60142 true))

(declare-fun array_inv!14583 (array!39189) Bool)

(assert (=> start!60142 (array_inv!14583 a!3626)))

(declare-fun b!671300 () Bool)

(declare-fun e!383683 () Bool)

(declare-fun e!383684 () Bool)

(assert (=> b!671300 (= e!383683 e!383684)))

(declare-fun res!438000 () Bool)

(assert (=> b!671300 (=> (not res!438000) (not e!383684))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671300 (= res!438000 (bvsle from!3004 i!1382))))

(declare-fun b!671301 () Bool)

(declare-fun e!383685 () Bool)

(declare-datatypes ((List!12828 0))(
  ( (Nil!12825) (Cons!12824 (h!13869 (_ BitVec 64)) (t!19056 List!12828)) )
))
(declare-fun acc!681 () List!12828)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3405 (List!12828 (_ BitVec 64)) Bool)

(assert (=> b!671301 (= e!383685 (contains!3405 acc!681 k0!2843))))

(declare-fun b!671302 () Bool)

(declare-fun res!438001 () Bool)

(assert (=> b!671302 (=> (not res!438001) (not e!383681))))

(assert (=> b!671302 (= res!438001 (not (contains!3405 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671303 () Bool)

(declare-fun res!438005 () Bool)

(assert (=> b!671303 (=> (not res!438005) (not e!383681))))

(assert (=> b!671303 (= res!438005 e!383683)))

(declare-fun res!438006 () Bool)

(assert (=> b!671303 (=> res!438006 e!383683)))

(assert (=> b!671303 (= res!438006 e!383685)))

(declare-fun res!438008 () Bool)

(assert (=> b!671303 (=> (not res!438008) (not e!383685))))

(assert (=> b!671303 (= res!438008 (bvsgt from!3004 i!1382))))

(declare-fun b!671304 () Bool)

(declare-fun res!438004 () Bool)

(assert (=> b!671304 (=> (not res!438004) (not e!383681))))

(declare-fun arrayContainsKey!0 (array!39189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671304 (= res!438004 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!671305 () Bool)

(declare-fun res!437997 () Bool)

(assert (=> b!671305 (=> (not res!437997) (not e!383681))))

(assert (=> b!671305 (= res!437997 (not (contains!3405 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671306 () Bool)

(declare-fun res!437999 () Bool)

(assert (=> b!671306 (=> (not res!437999) (not e!383681))))

(assert (=> b!671306 (= res!437999 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19151 a!3626))))))

(declare-fun b!671307 () Bool)

(declare-fun res!438010 () Bool)

(assert (=> b!671307 (=> (not res!438010) (not e!383681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671307 (= res!438010 (validKeyInArray!0 k0!2843))))

(declare-fun b!671308 () Bool)

(declare-fun res!437996 () Bool)

(assert (=> b!671308 (=> (not res!437996) (not e!383681))))

(declare-fun noDuplicate!652 (List!12828) Bool)

(assert (=> b!671308 (= res!437996 (noDuplicate!652 acc!681))))

(declare-fun b!671309 () Bool)

(declare-fun res!438007 () Bool)

(assert (=> b!671309 (=> (not res!438007) (not e!383681))))

(declare-fun arrayNoDuplicates!0 (array!39189 (_ BitVec 32) List!12828) Bool)

(assert (=> b!671309 (= res!438007 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12825))))

(declare-fun b!671310 () Bool)

(declare-fun res!437998 () Bool)

(assert (=> b!671310 (=> (not res!437998) (not e!383681))))

(assert (=> b!671310 (= res!437998 (= (select (arr!18787 a!3626) from!3004) k0!2843))))

(declare-fun b!671311 () Bool)

(declare-fun res!438003 () Bool)

(assert (=> b!671311 (=> (not res!438003) (not e!383681))))

(assert (=> b!671311 (= res!438003 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19151 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671312 () Bool)

(declare-fun res!438011 () Bool)

(assert (=> b!671312 (=> (not res!438011) (not e!383681))))

(assert (=> b!671312 (= res!438011 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671313 () Bool)

(assert (=> b!671313 (= e!383681 (not true))))

(assert (=> b!671313 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun b!671314 () Bool)

(assert (=> b!671314 (= e!383684 (not (contains!3405 acc!681 k0!2843)))))

(declare-fun b!671315 () Bool)

(declare-fun res!438002 () Bool)

(assert (=> b!671315 (=> (not res!438002) (not e!383681))))

(assert (=> b!671315 (= res!438002 (validKeyInArray!0 (select (arr!18787 a!3626) from!3004)))))

(assert (= (and start!60142 res!438009) b!671308))

(assert (= (and b!671308 res!437996) b!671302))

(assert (= (and b!671302 res!438001) b!671305))

(assert (= (and b!671305 res!437997) b!671303))

(assert (= (and b!671303 res!438008) b!671301))

(assert (= (and b!671303 (not res!438006)) b!671300))

(assert (= (and b!671300 res!438000) b!671314))

(assert (= (and b!671303 res!438005) b!671309))

(assert (= (and b!671309 res!438007) b!671312))

(assert (= (and b!671312 res!438011) b!671306))

(assert (= (and b!671306 res!437999) b!671307))

(assert (= (and b!671307 res!438010) b!671304))

(assert (= (and b!671304 res!438004) b!671311))

(assert (= (and b!671311 res!438003) b!671315))

(assert (= (and b!671315 res!438002) b!671310))

(assert (= (and b!671310 res!437998) b!671313))

(declare-fun m!640853 () Bool)

(assert (=> b!671315 m!640853))

(assert (=> b!671315 m!640853))

(declare-fun m!640855 () Bool)

(assert (=> b!671315 m!640855))

(declare-fun m!640857 () Bool)

(assert (=> b!671304 m!640857))

(declare-fun m!640859 () Bool)

(assert (=> b!671305 m!640859))

(declare-fun m!640861 () Bool)

(assert (=> b!671308 m!640861))

(declare-fun m!640863 () Bool)

(assert (=> b!671302 m!640863))

(declare-fun m!640865 () Bool)

(assert (=> b!671301 m!640865))

(assert (=> b!671310 m!640853))

(assert (=> b!671314 m!640865))

(declare-fun m!640867 () Bool)

(assert (=> start!60142 m!640867))

(declare-fun m!640869 () Bool)

(assert (=> b!671313 m!640869))

(declare-fun m!640871 () Bool)

(assert (=> b!671307 m!640871))

(declare-fun m!640873 () Bool)

(assert (=> b!671312 m!640873))

(declare-fun m!640875 () Bool)

(assert (=> b!671309 m!640875))

(check-sat (not b!671302) (not b!671315) (not b!671307) (not start!60142) (not b!671312) (not b!671308) (not b!671313) (not b!671305) (not b!671314) (not b!671309) (not b!671304) (not b!671301))
