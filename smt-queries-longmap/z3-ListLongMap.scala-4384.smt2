; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60334 () Bool)

(assert start!60334)

(declare-fun b!677855 () Bool)

(declare-fun res!444288 () Bool)

(declare-fun e!386338 () Bool)

(assert (=> b!677855 (=> (not res!444288) (not e!386338))))

(declare-datatypes ((List!12924 0))(
  ( (Nil!12921) (Cons!12920 (h!13965 (_ BitVec 64)) (t!19152 List!12924)) )
))
(declare-fun acc!681 () List!12924)

(declare-fun contains!3501 (List!12924 (_ BitVec 64)) Bool)

(assert (=> b!677855 (= res!444288 (not (contains!3501 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677856 () Bool)

(declare-fun res!444281 () Bool)

(assert (=> b!677856 (=> (not res!444281) (not e!386338))))

(declare-fun noDuplicate!748 (List!12924) Bool)

(assert (=> b!677856 (= res!444281 (noDuplicate!748 acc!681))))

(declare-fun b!677857 () Bool)

(declare-fun res!444284 () Bool)

(assert (=> b!677857 (=> (not res!444284) (not e!386338))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39381 0))(
  ( (array!39382 (arr!18883 (Array (_ BitVec 32) (_ BitVec 64))) (size!19247 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39381)

(assert (=> b!677857 (= res!444284 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19247 a!3626))))))

(declare-fun b!677858 () Bool)

(declare-fun res!444292 () Bool)

(assert (=> b!677858 (=> (not res!444292) (not e!386338))))

(declare-fun arrayNoDuplicates!0 (array!39381 (_ BitVec 32) List!12924) Bool)

(assert (=> b!677858 (= res!444292 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12921))))

(declare-fun b!677859 () Bool)

(declare-fun res!444286 () Bool)

(assert (=> b!677859 (=> (not res!444286) (not e!386338))))

(assert (=> b!677859 (= res!444286 (not (contains!3501 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!677861 () Bool)

(declare-fun res!444283 () Bool)

(assert (=> b!677861 (=> (not res!444283) (not e!386338))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!677861 (= res!444283 (validKeyInArray!0 k0!2843))))

(declare-fun b!677862 () Bool)

(declare-fun res!444291 () Bool)

(assert (=> b!677862 (=> (not res!444291) (not e!386338))))

(declare-fun arrayContainsKey!0 (array!39381 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!677862 (= res!444291 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!677863 () Bool)

(declare-fun e!386340 () Bool)

(declare-fun e!386339 () Bool)

(assert (=> b!677863 (= e!386340 e!386339)))

(declare-fun res!444287 () Bool)

(assert (=> b!677863 (=> (not res!444287) (not e!386339))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!677863 (= res!444287 (bvsle from!3004 i!1382))))

(declare-fun b!677864 () Bool)

(assert (=> b!677864 (= e!386339 (not (contains!3501 acc!681 k0!2843)))))

(declare-fun b!677865 () Bool)

(declare-fun res!444293 () Bool)

(assert (=> b!677865 (=> (not res!444293) (not e!386338))))

(assert (=> b!677865 (= res!444293 e!386340)))

(declare-fun res!444290 () Bool)

(assert (=> b!677865 (=> res!444290 e!386340)))

(declare-fun e!386337 () Bool)

(assert (=> b!677865 (= res!444290 e!386337)))

(declare-fun res!444289 () Bool)

(assert (=> b!677865 (=> (not res!444289) (not e!386337))))

(assert (=> b!677865 (= res!444289 (bvsgt from!3004 i!1382))))

(declare-fun b!677860 () Bool)

(declare-fun res!444282 () Bool)

(assert (=> b!677860 (=> (not res!444282) (not e!386338))))

(assert (=> b!677860 (= res!444282 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!444285 () Bool)

(assert (=> start!60334 (=> (not res!444285) (not e!386338))))

(assert (=> start!60334 (= res!444285 (and (bvslt (size!19247 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19247 a!3626))))))

(assert (=> start!60334 e!386338))

(assert (=> start!60334 true))

(declare-fun array_inv!14679 (array!39381) Bool)

(assert (=> start!60334 (array_inv!14679 a!3626)))

(declare-fun b!677866 () Bool)

(assert (=> b!677866 (= e!386338 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19247 a!3626)) (bvsgt from!3004 (size!19247 a!3626))))))

(declare-fun b!677867 () Bool)

(assert (=> b!677867 (= e!386337 (contains!3501 acc!681 k0!2843))))

(assert (= (and start!60334 res!444285) b!677856))

(assert (= (and b!677856 res!444281) b!677859))

(assert (= (and b!677859 res!444286) b!677855))

(assert (= (and b!677855 res!444288) b!677865))

(assert (= (and b!677865 res!444289) b!677867))

(assert (= (and b!677865 (not res!444290)) b!677863))

(assert (= (and b!677863 res!444287) b!677864))

(assert (= (and b!677865 res!444293) b!677858))

(assert (= (and b!677858 res!444292) b!677860))

(assert (= (and b!677860 res!444282) b!677857))

(assert (= (and b!677857 res!444284) b!677861))

(assert (= (and b!677861 res!444283) b!677862))

(assert (= (and b!677862 res!444291) b!677866))

(declare-fun m!643925 () Bool)

(assert (=> b!677855 m!643925))

(declare-fun m!643927 () Bool)

(assert (=> b!677856 m!643927))

(declare-fun m!643929 () Bool)

(assert (=> b!677859 m!643929))

(declare-fun m!643931 () Bool)

(assert (=> b!677860 m!643931))

(declare-fun m!643933 () Bool)

(assert (=> start!60334 m!643933))

(declare-fun m!643935 () Bool)

(assert (=> b!677862 m!643935))

(declare-fun m!643937 () Bool)

(assert (=> b!677867 m!643937))

(assert (=> b!677864 m!643937))

(declare-fun m!643939 () Bool)

(assert (=> b!677861 m!643939))

(declare-fun m!643941 () Bool)

(assert (=> b!677858 m!643941))

(check-sat (not b!677862) (not b!677861) (not b!677860) (not b!677858) (not b!677855) (not b!677867) (not b!677859) (not b!677864) (not start!60334) (not b!677856))
(check-sat)
