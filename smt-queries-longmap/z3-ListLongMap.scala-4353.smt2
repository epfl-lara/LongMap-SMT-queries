; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60148 () Bool)

(assert start!60148)

(declare-fun b!671444 () Bool)

(declare-fun res!438140 () Bool)

(declare-fun e!383726 () Bool)

(assert (=> b!671444 (=> (not res!438140) (not e!383726))))

(declare-fun e!383727 () Bool)

(assert (=> b!671444 (= res!438140 e!383727)))

(declare-fun res!438141 () Bool)

(assert (=> b!671444 (=> res!438141 e!383727)))

(declare-fun e!383728 () Bool)

(assert (=> b!671444 (= res!438141 e!383728)))

(declare-fun res!438142 () Bool)

(assert (=> b!671444 (=> (not res!438142) (not e!383728))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!671444 (= res!438142 (bvsgt from!3004 i!1382))))

(declare-fun b!671445 () Bool)

(declare-datatypes ((List!12831 0))(
  ( (Nil!12828) (Cons!12827 (h!13872 (_ BitVec 64)) (t!19059 List!12831)) )
))
(declare-fun acc!681 () List!12831)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3408 (List!12831 (_ BitVec 64)) Bool)

(assert (=> b!671445 (= e!383728 (contains!3408 acc!681 k0!2843))))

(declare-fun b!671446 () Bool)

(assert (=> b!671446 (= e!383726 (not true))))

(declare-datatypes ((array!39195 0))(
  ( (array!39196 (arr!18790 (Array (_ BitVec 32) (_ BitVec 64))) (size!19154 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39195)

(declare-fun arrayContainsKey!0 (array!39195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!671446 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun b!671447 () Bool)

(declare-fun res!438144 () Bool)

(assert (=> b!671447 (=> (not res!438144) (not e!383726))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!671447 (= res!438144 (validKeyInArray!0 (select (arr!18790 a!3626) from!3004)))))

(declare-fun b!671448 () Bool)

(declare-fun res!438151 () Bool)

(assert (=> b!671448 (=> (not res!438151) (not e!383726))))

(assert (=> b!671448 (= res!438151 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19154 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!671449 () Bool)

(declare-fun res!438145 () Bool)

(assert (=> b!671449 (=> (not res!438145) (not e!383726))))

(declare-fun arrayNoDuplicates!0 (array!39195 (_ BitVec 32) List!12831) Bool)

(assert (=> b!671449 (= res!438145 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12828))))

(declare-fun b!671450 () Bool)

(declare-fun res!438146 () Bool)

(assert (=> b!671450 (=> (not res!438146) (not e!383726))))

(assert (=> b!671450 (= res!438146 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!438150 () Bool)

(assert (=> start!60148 (=> (not res!438150) (not e!383726))))

(assert (=> start!60148 (= res!438150 (and (bvslt (size!19154 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19154 a!3626))))))

(assert (=> start!60148 e!383726))

(assert (=> start!60148 true))

(declare-fun array_inv!14586 (array!39195) Bool)

(assert (=> start!60148 (array_inv!14586 a!3626)))

(declare-fun b!671451 () Bool)

(declare-fun res!438155 () Bool)

(assert (=> b!671451 (=> (not res!438155) (not e!383726))))

(assert (=> b!671451 (= res!438155 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!671452 () Bool)

(declare-fun res!438153 () Bool)

(assert (=> b!671452 (=> (not res!438153) (not e!383726))))

(declare-fun noDuplicate!655 (List!12831) Bool)

(assert (=> b!671452 (= res!438153 (noDuplicate!655 acc!681))))

(declare-fun b!671453 () Bool)

(declare-fun res!438149 () Bool)

(assert (=> b!671453 (=> (not res!438149) (not e!383726))))

(assert (=> b!671453 (= res!438149 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19154 a!3626))))))

(declare-fun b!671454 () Bool)

(declare-fun res!438152 () Bool)

(assert (=> b!671454 (=> (not res!438152) (not e!383726))))

(assert (=> b!671454 (= res!438152 (not (contains!3408 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671455 () Bool)

(declare-fun res!438154 () Bool)

(assert (=> b!671455 (=> (not res!438154) (not e!383726))))

(assert (=> b!671455 (= res!438154 (not (contains!3408 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!671456 () Bool)

(declare-fun res!438143 () Bool)

(assert (=> b!671456 (=> (not res!438143) (not e!383726))))

(assert (=> b!671456 (= res!438143 (= (select (arr!18790 a!3626) from!3004) k0!2843))))

(declare-fun b!671457 () Bool)

(declare-fun e!383729 () Bool)

(assert (=> b!671457 (= e!383727 e!383729)))

(declare-fun res!438148 () Bool)

(assert (=> b!671457 (=> (not res!438148) (not e!383729))))

(assert (=> b!671457 (= res!438148 (bvsle from!3004 i!1382))))

(declare-fun b!671458 () Bool)

(declare-fun res!438147 () Bool)

(assert (=> b!671458 (=> (not res!438147) (not e!383726))))

(assert (=> b!671458 (= res!438147 (validKeyInArray!0 k0!2843))))

(declare-fun b!671459 () Bool)

(assert (=> b!671459 (= e!383729 (not (contains!3408 acc!681 k0!2843)))))

(assert (= (and start!60148 res!438150) b!671452))

(assert (= (and b!671452 res!438153) b!671455))

(assert (= (and b!671455 res!438154) b!671454))

(assert (= (and b!671454 res!438152) b!671444))

(assert (= (and b!671444 res!438142) b!671445))

(assert (= (and b!671444 (not res!438141)) b!671457))

(assert (= (and b!671457 res!438148) b!671459))

(assert (= (and b!671444 res!438140) b!671449))

(assert (= (and b!671449 res!438145) b!671451))

(assert (= (and b!671451 res!438155) b!671453))

(assert (= (and b!671453 res!438149) b!671458))

(assert (= (and b!671458 res!438147) b!671450))

(assert (= (and b!671450 res!438146) b!671448))

(assert (= (and b!671448 res!438151) b!671447))

(assert (= (and b!671447 res!438144) b!671456))

(assert (= (and b!671456 res!438143) b!671446))

(declare-fun m!640925 () Bool)

(assert (=> b!671454 m!640925))

(declare-fun m!640927 () Bool)

(assert (=> b!671451 m!640927))

(declare-fun m!640929 () Bool)

(assert (=> b!671449 m!640929))

(declare-fun m!640931 () Bool)

(assert (=> b!671455 m!640931))

(declare-fun m!640933 () Bool)

(assert (=> b!671459 m!640933))

(declare-fun m!640935 () Bool)

(assert (=> b!671447 m!640935))

(assert (=> b!671447 m!640935))

(declare-fun m!640937 () Bool)

(assert (=> b!671447 m!640937))

(assert (=> b!671445 m!640933))

(declare-fun m!640939 () Bool)

(assert (=> start!60148 m!640939))

(declare-fun m!640941 () Bool)

(assert (=> b!671450 m!640941))

(declare-fun m!640943 () Bool)

(assert (=> b!671458 m!640943))

(declare-fun m!640945 () Bool)

(assert (=> b!671452 m!640945))

(declare-fun m!640947 () Bool)

(assert (=> b!671446 m!640947))

(assert (=> b!671456 m!640935))

(check-sat (not start!60148) (not b!671447) (not b!671450) (not b!671445) (not b!671454) (not b!671452) (not b!671446) (not b!671458) (not b!671449) (not b!671455) (not b!671459) (not b!671451))
