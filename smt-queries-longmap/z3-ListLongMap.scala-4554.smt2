; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63556 () Bool)

(assert start!63556)

(declare-fun b!715289 () Bool)

(declare-fun res!478142 () Bool)

(declare-fun e!401990 () Bool)

(assert (=> b!715289 (=> (not res!478142) (not e!401990))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40506 0))(
  ( (array!40507 (arr!19387 (Array (_ BitVec 32) (_ BitVec 64))) (size!19802 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40506)

(declare-fun arrayContainsKey!0 (array!40506 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715289 (= res!478142 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715290 () Bool)

(declare-fun res!478150 () Bool)

(assert (=> b!715290 (=> (not res!478150) (not e!401990))))

(declare-datatypes ((List!13335 0))(
  ( (Nil!13332) (Cons!13331 (h!14379 (_ BitVec 64)) (t!19642 List!13335)) )
))
(declare-fun newAcc!49 () List!13335)

(declare-fun noDuplicate!1261 (List!13335) Bool)

(assert (=> b!715290 (= res!478150 (noDuplicate!1261 newAcc!49))))

(declare-fun b!715291 () Bool)

(declare-fun res!478144 () Bool)

(assert (=> b!715291 (=> (not res!478144) (not e!401990))))

(assert (=> b!715291 (= res!478144 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19802 a!3591)))))

(declare-fun b!715292 () Bool)

(declare-fun res!478152 () Bool)

(assert (=> b!715292 (=> (not res!478152) (not e!401990))))

(assert (=> b!715292 (= res!478152 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun res!478143 () Bool)

(assert (=> start!63556 (=> (not res!478143) (not e!401990))))

(assert (=> start!63556 (= res!478143 (and (bvslt (size!19802 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19802 a!3591))))))

(assert (=> start!63556 e!401990))

(assert (=> start!63556 true))

(declare-fun array_inv!15246 (array!40506) Bool)

(assert (=> start!63556 (array_inv!15246 a!3591)))

(declare-fun b!715293 () Bool)

(declare-fun res!478145 () Bool)

(assert (=> b!715293 (=> (not res!478145) (not e!401990))))

(declare-fun contains!3987 (List!13335 (_ BitVec 64)) Bool)

(assert (=> b!715293 (= res!478145 (contains!3987 newAcc!49 k0!2824))))

(declare-fun b!715294 () Bool)

(declare-fun res!478141 () Bool)

(assert (=> b!715294 (=> (not res!478141) (not e!401990))))

(declare-fun acc!652 () List!13335)

(assert (=> b!715294 (= res!478141 (noDuplicate!1261 acc!652))))

(declare-fun b!715295 () Bool)

(declare-fun res!478146 () Bool)

(assert (=> b!715295 (=> (not res!478146) (not e!401990))))

(declare-fun arrayNoDuplicates!0 (array!40506 (_ BitVec 32) List!13335) Bool)

(assert (=> b!715295 (= res!478146 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715296 () Bool)

(declare-fun res!478136 () Bool)

(assert (=> b!715296 (=> (not res!478136) (not e!401990))))

(assert (=> b!715296 (= res!478136 (not (contains!3987 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715297 () Bool)

(declare-fun res!478147 () Bool)

(assert (=> b!715297 (=> (not res!478147) (not e!401990))))

(assert (=> b!715297 (= res!478147 (not (contains!3987 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715298 () Bool)

(declare-fun res!478138 () Bool)

(assert (=> b!715298 (=> (not res!478138) (not e!401990))))

(assert (=> b!715298 (= res!478138 (not (contains!3987 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715299 () Bool)

(declare-fun res!478151 () Bool)

(assert (=> b!715299 (=> (not res!478151) (not e!401990))))

(declare-fun -!419 (List!13335 (_ BitVec 64)) List!13335)

(assert (=> b!715299 (= res!478151 (= (-!419 newAcc!49 k0!2824) acc!652))))

(declare-fun b!715300 () Bool)

(declare-fun res!478149 () Bool)

(assert (=> b!715300 (=> (not res!478149) (not e!401990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715300 (= res!478149 (not (validKeyInArray!0 (select (arr!19387 a!3591) from!2969))))))

(declare-fun b!715301 () Bool)

(assert (=> b!715301 (= e!401990 false)))

(declare-fun lt!318933 () Bool)

(assert (=> b!715301 (= lt!318933 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715302 () Bool)

(declare-fun res!478153 () Bool)

(assert (=> b!715302 (=> (not res!478153) (not e!401990))))

(assert (=> b!715302 (= res!478153 (not (contains!3987 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715303 () Bool)

(declare-fun res!478140 () Bool)

(assert (=> b!715303 (=> (not res!478140) (not e!401990))))

(declare-fun subseq!455 (List!13335 List!13335) Bool)

(assert (=> b!715303 (= res!478140 (subseq!455 acc!652 newAcc!49))))

(declare-fun b!715304 () Bool)

(declare-fun res!478139 () Bool)

(assert (=> b!715304 (=> (not res!478139) (not e!401990))))

(assert (=> b!715304 (= res!478139 (not (contains!3987 acc!652 k0!2824)))))

(declare-fun b!715305 () Bool)

(declare-fun res!478137 () Bool)

(assert (=> b!715305 (=> (not res!478137) (not e!401990))))

(assert (=> b!715305 (= res!478137 (validKeyInArray!0 k0!2824))))

(declare-fun b!715306 () Bool)

(declare-fun res!478148 () Bool)

(assert (=> b!715306 (=> (not res!478148) (not e!401990))))

(assert (=> b!715306 (= res!478148 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(assert (= (and start!63556 res!478143) b!715294))

(assert (= (and b!715294 res!478141) b!715290))

(assert (= (and b!715290 res!478150) b!715298))

(assert (= (and b!715298 res!478138) b!715302))

(assert (= (and b!715302 res!478153) b!715306))

(assert (= (and b!715306 res!478148) b!715304))

(assert (= (and b!715304 res!478139) b!715305))

(assert (= (and b!715305 res!478137) b!715295))

(assert (= (and b!715295 res!478146) b!715303))

(assert (= (and b!715303 res!478140) b!715293))

(assert (= (and b!715293 res!478145) b!715299))

(assert (= (and b!715299 res!478151) b!715297))

(assert (= (and b!715297 res!478147) b!715296))

(assert (= (and b!715296 res!478136) b!715291))

(assert (= (and b!715291 res!478144) b!715300))

(assert (= (and b!715300 res!478149) b!715292))

(assert (= (and b!715292 res!478152) b!715289))

(assert (= (and b!715289 res!478142) b!715301))

(declare-fun m!672165 () Bool)

(assert (=> b!715290 m!672165))

(declare-fun m!672167 () Bool)

(assert (=> b!715301 m!672167))

(declare-fun m!672169 () Bool)

(assert (=> b!715299 m!672169))

(declare-fun m!672171 () Bool)

(assert (=> b!715303 m!672171))

(declare-fun m!672173 () Bool)

(assert (=> b!715302 m!672173))

(declare-fun m!672175 () Bool)

(assert (=> b!715294 m!672175))

(declare-fun m!672177 () Bool)

(assert (=> b!715295 m!672177))

(declare-fun m!672179 () Bool)

(assert (=> b!715298 m!672179))

(declare-fun m!672181 () Bool)

(assert (=> start!63556 m!672181))

(declare-fun m!672183 () Bool)

(assert (=> b!715304 m!672183))

(declare-fun m!672185 () Bool)

(assert (=> b!715293 m!672185))

(declare-fun m!672187 () Bool)

(assert (=> b!715306 m!672187))

(declare-fun m!672189 () Bool)

(assert (=> b!715296 m!672189))

(declare-fun m!672191 () Bool)

(assert (=> b!715300 m!672191))

(assert (=> b!715300 m!672191))

(declare-fun m!672193 () Bool)

(assert (=> b!715300 m!672193))

(declare-fun m!672195 () Bool)

(assert (=> b!715305 m!672195))

(declare-fun m!672197 () Bool)

(assert (=> b!715289 m!672197))

(declare-fun m!672199 () Bool)

(assert (=> b!715297 m!672199))

(check-sat (not b!715302) (not b!715304) (not b!715298) (not start!63556) (not b!715289) (not b!715296) (not b!715303) (not b!715294) (not b!715301) (not b!715290) (not b!715306) (not b!715293) (not b!715300) (not b!715305) (not b!715297) (not b!715295) (not b!715299))
(check-sat)
