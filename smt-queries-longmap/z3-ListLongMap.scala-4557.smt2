; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63502 () Bool)

(assert start!63502)

(declare-fun b!715209 () Bool)

(declare-fun res!478351 () Bool)

(declare-fun e!401676 () Bool)

(assert (=> b!715209 (=> (not res!478351) (not e!401676))))

(declare-datatypes ((array!40527 0))(
  ( (array!40528 (arr!19400 (Array (_ BitVec 32) (_ BitVec 64))) (size!19815 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40527)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715209 (= res!478351 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715210 () Bool)

(declare-fun res!478357 () Bool)

(assert (=> b!715210 (=> (not res!478357) (not e!401676))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715210 (= res!478357 (not (validKeyInArray!0 (select (arr!19400 a!3591) from!2969))))))

(declare-fun b!715211 () Bool)

(declare-fun res!478355 () Bool)

(assert (=> b!715211 (=> (not res!478355) (not e!401676))))

(assert (=> b!715211 (= res!478355 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19815 a!3591)))))

(declare-fun b!715212 () Bool)

(declare-fun res!478358 () Bool)

(assert (=> b!715212 (=> (not res!478358) (not e!401676))))

(declare-datatypes ((List!13480 0))(
  ( (Nil!13477) (Cons!13476 (h!14521 (_ BitVec 64)) (t!19786 List!13480)) )
))
(declare-fun newAcc!49 () List!13480)

(declare-fun contains!4002 (List!13480 (_ BitVec 64)) Bool)

(assert (=> b!715212 (= res!478358 (not (contains!4002 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715213 () Bool)

(declare-fun res!478359 () Bool)

(assert (=> b!715213 (=> (not res!478359) (not e!401676))))

(assert (=> b!715213 (= res!478359 (validKeyInArray!0 k0!2824))))

(declare-fun b!715214 () Bool)

(declare-fun res!478347 () Bool)

(assert (=> b!715214 (=> (not res!478347) (not e!401676))))

(assert (=> b!715214 (= res!478347 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!715215 () Bool)

(declare-fun res!478348 () Bool)

(assert (=> b!715215 (=> (not res!478348) (not e!401676))))

(declare-fun acc!652 () List!13480)

(declare-fun subseq!464 (List!13480 List!13480) Bool)

(assert (=> b!715215 (= res!478348 (subseq!464 acc!652 newAcc!49))))

(declare-fun b!715216 () Bool)

(declare-fun res!478362 () Bool)

(assert (=> b!715216 (=> (not res!478362) (not e!401676))))

(declare-fun noDuplicate!1271 (List!13480) Bool)

(assert (=> b!715216 (= res!478362 (noDuplicate!1271 newAcc!49))))

(declare-fun b!715217 () Bool)

(declare-fun res!478346 () Bool)

(assert (=> b!715217 (=> (not res!478346) (not e!401676))))

(assert (=> b!715217 (= res!478346 (not (contains!4002 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!478361 () Bool)

(assert (=> start!63502 (=> (not res!478361) (not e!401676))))

(assert (=> start!63502 (= res!478361 (and (bvslt (size!19815 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19815 a!3591))))))

(assert (=> start!63502 e!401676))

(assert (=> start!63502 true))

(declare-fun array_inv!15283 (array!40527) Bool)

(assert (=> start!63502 (array_inv!15283 a!3591)))

(declare-fun b!715218 () Bool)

(declare-fun res!478353 () Bool)

(assert (=> b!715218 (=> (not res!478353) (not e!401676))))

(assert (=> b!715218 (= res!478353 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!715219 () Bool)

(declare-fun res!478360 () Bool)

(assert (=> b!715219 (=> (not res!478360) (not e!401676))))

(assert (=> b!715219 (= res!478360 (not (contains!4002 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715220 () Bool)

(declare-fun res!478345 () Bool)

(assert (=> b!715220 (=> (not res!478345) (not e!401676))))

(declare-fun arrayNoDuplicates!0 (array!40527 (_ BitVec 32) List!13480) Bool)

(assert (=> b!715220 (= res!478345 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715221 () Bool)

(declare-fun res!478354 () Bool)

(assert (=> b!715221 (=> (not res!478354) (not e!401676))))

(assert (=> b!715221 (= res!478354 (not (contains!4002 acc!652 k0!2824)))))

(declare-fun b!715222 () Bool)

(declare-fun res!478350 () Bool)

(assert (=> b!715222 (=> (not res!478350) (not e!401676))))

(assert (=> b!715222 (= res!478350 (noDuplicate!1271 acc!652))))

(declare-fun b!715223 () Bool)

(declare-fun res!478349 () Bool)

(assert (=> b!715223 (=> (not res!478349) (not e!401676))))

(assert (=> b!715223 (= res!478349 (not (contains!4002 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715224 () Bool)

(declare-fun res!478352 () Bool)

(assert (=> b!715224 (=> (not res!478352) (not e!401676))))

(assert (=> b!715224 (= res!478352 (contains!4002 newAcc!49 k0!2824))))

(declare-fun b!715225 () Bool)

(declare-fun res!478356 () Bool)

(assert (=> b!715225 (=> (not res!478356) (not e!401676))))

(declare-fun -!429 (List!13480 (_ BitVec 64)) List!13480)

(assert (=> b!715225 (= res!478356 (= (-!429 newAcc!49 k0!2824) acc!652))))

(declare-fun b!715226 () Bool)

(assert (=> b!715226 (= e!401676 false)))

(declare-fun lt!318590 () Bool)

(assert (=> b!715226 (= lt!318590 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(assert (= (and start!63502 res!478361) b!715222))

(assert (= (and b!715222 res!478350) b!715216))

(assert (= (and b!715216 res!478362) b!715223))

(assert (= (and b!715223 res!478349) b!715219))

(assert (= (and b!715219 res!478360) b!715214))

(assert (= (and b!715214 res!478347) b!715221))

(assert (= (and b!715221 res!478354) b!715213))

(assert (= (and b!715213 res!478359) b!715220))

(assert (= (and b!715220 res!478345) b!715215))

(assert (= (and b!715215 res!478348) b!715224))

(assert (= (and b!715224 res!478352) b!715225))

(assert (= (and b!715225 res!478356) b!715217))

(assert (= (and b!715217 res!478346) b!715212))

(assert (= (and b!715212 res!478358) b!715211))

(assert (= (and b!715211 res!478355) b!715210))

(assert (= (and b!715210 res!478357) b!715218))

(assert (= (and b!715218 res!478353) b!715209))

(assert (= (and b!715209 res!478351) b!715226))

(declare-fun m!670941 () Bool)

(assert (=> b!715221 m!670941))

(declare-fun m!670943 () Bool)

(assert (=> b!715219 m!670943))

(declare-fun m!670945 () Bool)

(assert (=> b!715226 m!670945))

(declare-fun m!670947 () Bool)

(assert (=> b!715216 m!670947))

(declare-fun m!670949 () Bool)

(assert (=> b!715212 m!670949))

(declare-fun m!670951 () Bool)

(assert (=> b!715217 m!670951))

(declare-fun m!670953 () Bool)

(assert (=> b!715220 m!670953))

(declare-fun m!670955 () Bool)

(assert (=> b!715225 m!670955))

(declare-fun m!670957 () Bool)

(assert (=> b!715215 m!670957))

(declare-fun m!670959 () Bool)

(assert (=> start!63502 m!670959))

(declare-fun m!670961 () Bool)

(assert (=> b!715210 m!670961))

(assert (=> b!715210 m!670961))

(declare-fun m!670963 () Bool)

(assert (=> b!715210 m!670963))

(declare-fun m!670965 () Bool)

(assert (=> b!715213 m!670965))

(declare-fun m!670967 () Bool)

(assert (=> b!715214 m!670967))

(declare-fun m!670969 () Bool)

(assert (=> b!715222 m!670969))

(declare-fun m!670971 () Bool)

(assert (=> b!715223 m!670971))

(declare-fun m!670973 () Bool)

(assert (=> b!715224 m!670973))

(declare-fun m!670975 () Bool)

(assert (=> b!715209 m!670975))

(check-sat (not b!715220) (not start!63502) (not b!715226) (not b!715217) (not b!715223) (not b!715221) (not b!715219) (not b!715225) (not b!715224) (not b!715216) (not b!715212) (not b!715214) (not b!715210) (not b!715215) (not b!715222) (not b!715213) (not b!715209))
(check-sat)
