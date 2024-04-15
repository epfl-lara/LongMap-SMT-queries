; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63334 () Bool)

(assert start!63334)

(declare-fun b!713099 () Bool)

(declare-fun res!476364 () Bool)

(declare-fun e!401052 () Bool)

(assert (=> b!713099 (=> (not res!476364) (not e!401052))))

(declare-datatypes ((array!40449 0))(
  ( (array!40450 (arr!19364 (Array (_ BitVec 32) (_ BitVec 64))) (size!19776 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40449)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713099 (= res!476364 (not (validKeyInArray!0 (select (arr!19364 a!3591) from!2969))))))

(declare-fun b!713100 () Bool)

(declare-fun res!476362 () Bool)

(assert (=> b!713100 (=> (not res!476362) (not e!401052))))

(declare-datatypes ((List!13444 0))(
  ( (Nil!13441) (Cons!13440 (h!14485 (_ BitVec 64)) (t!19750 List!13444)) )
))
(declare-fun acc!652 () List!13444)

(declare-fun newAcc!49 () List!13444)

(declare-fun subseq!428 (List!13444 List!13444) Bool)

(assert (=> b!713100 (= res!476362 (subseq!428 acc!652 newAcc!49))))

(declare-fun b!713101 () Bool)

(declare-fun res!476354 () Bool)

(assert (=> b!713101 (=> (not res!476354) (not e!401052))))

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!713101 (= res!476354 (validKeyInArray!0 k0!2824))))

(declare-fun b!713102 () Bool)

(declare-fun res!476353 () Bool)

(assert (=> b!713102 (=> (not res!476353) (not e!401052))))

(declare-fun contains!3966 (List!13444 (_ BitVec 64)) Bool)

(assert (=> b!713102 (= res!476353 (contains!3966 newAcc!49 k0!2824))))

(declare-fun b!713103 () Bool)

(declare-fun res!476349 () Bool)

(assert (=> b!713103 (=> (not res!476349) (not e!401052))))

(declare-fun arrayNoDuplicates!0 (array!40449 (_ BitVec 32) List!13444) Bool)

(assert (=> b!713103 (= res!476349 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713105 () Bool)

(declare-fun res!476360 () Bool)

(assert (=> b!713105 (=> (not res!476360) (not e!401052))))

(assert (=> b!713105 (= res!476360 (not (contains!3966 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713106 () Bool)

(declare-fun res!476358 () Bool)

(assert (=> b!713106 (=> (not res!476358) (not e!401052))))

(declare-fun noDuplicate!1235 (List!13444) Bool)

(assert (=> b!713106 (= res!476358 (noDuplicate!1235 newAcc!49))))

(declare-fun b!713107 () Bool)

(declare-fun res!476355 () Bool)

(assert (=> b!713107 (=> (not res!476355) (not e!401052))))

(declare-fun -!393 (List!13444 (_ BitVec 64)) List!13444)

(assert (=> b!713107 (= res!476355 (= (-!393 newAcc!49 k0!2824) acc!652))))

(declare-fun b!713108 () Bool)

(declare-fun res!476351 () Bool)

(assert (=> b!713108 (=> (not res!476351) (not e!401052))))

(declare-fun arrayContainsKey!0 (array!40449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713108 (= res!476351 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!713109 () Bool)

(declare-fun res!476350 () Bool)

(assert (=> b!713109 (=> (not res!476350) (not e!401052))))

(assert (=> b!713109 (= res!476350 (noDuplicate!1235 acc!652))))

(declare-fun b!713110 () Bool)

(assert (=> b!713110 (= e!401052 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!713111 () Bool)

(declare-fun res!476363 () Bool)

(assert (=> b!713111 (=> (not res!476363) (not e!401052))))

(assert (=> b!713111 (= res!476363 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19776 a!3591)))))

(declare-fun b!713112 () Bool)

(declare-fun res!476352 () Bool)

(assert (=> b!713112 (=> (not res!476352) (not e!401052))))

(assert (=> b!713112 (= res!476352 (not (contains!3966 acc!652 k0!2824)))))

(declare-fun b!713113 () Bool)

(declare-fun res!476356 () Bool)

(assert (=> b!713113 (=> (not res!476356) (not e!401052))))

(assert (=> b!713113 (= res!476356 (not (contains!3966 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713114 () Bool)

(declare-fun res!476359 () Bool)

(assert (=> b!713114 (=> (not res!476359) (not e!401052))))

(assert (=> b!713114 (= res!476359 (not (contains!3966 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713104 () Bool)

(declare-fun res!476357 () Bool)

(assert (=> b!713104 (=> (not res!476357) (not e!401052))))

(assert (=> b!713104 (= res!476357 (not (contains!3966 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!476361 () Bool)

(assert (=> start!63334 (=> (not res!476361) (not e!401052))))

(assert (=> start!63334 (= res!476361 (and (bvslt (size!19776 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19776 a!3591))))))

(assert (=> start!63334 e!401052))

(assert (=> start!63334 true))

(declare-fun array_inv!15247 (array!40449) Bool)

(assert (=> start!63334 (array_inv!15247 a!3591)))

(assert (= (and start!63334 res!476361) b!713109))

(assert (= (and b!713109 res!476350) b!713106))

(assert (= (and b!713106 res!476358) b!713113))

(assert (= (and b!713113 res!476356) b!713105))

(assert (= (and b!713105 res!476360) b!713108))

(assert (= (and b!713108 res!476351) b!713112))

(assert (= (and b!713112 res!476352) b!713101))

(assert (= (and b!713101 res!476354) b!713103))

(assert (= (and b!713103 res!476349) b!713100))

(assert (= (and b!713100 res!476362) b!713102))

(assert (= (and b!713102 res!476353) b!713107))

(assert (= (and b!713107 res!476355) b!713114))

(assert (= (and b!713114 res!476359) b!713104))

(assert (= (and b!713104 res!476357) b!713111))

(assert (= (and b!713111 res!476363) b!713099))

(assert (= (and b!713099 res!476364) b!713110))

(declare-fun m!669429 () Bool)

(assert (=> b!713108 m!669429))

(declare-fun m!669431 () Bool)

(assert (=> b!713100 m!669431))

(declare-fun m!669433 () Bool)

(assert (=> b!713107 m!669433))

(declare-fun m!669435 () Bool)

(assert (=> b!713109 m!669435))

(declare-fun m!669437 () Bool)

(assert (=> b!713099 m!669437))

(assert (=> b!713099 m!669437))

(declare-fun m!669439 () Bool)

(assert (=> b!713099 m!669439))

(declare-fun m!669441 () Bool)

(assert (=> b!713114 m!669441))

(declare-fun m!669443 () Bool)

(assert (=> b!713104 m!669443))

(declare-fun m!669445 () Bool)

(assert (=> b!713112 m!669445))

(declare-fun m!669447 () Bool)

(assert (=> start!63334 m!669447))

(declare-fun m!669449 () Bool)

(assert (=> b!713105 m!669449))

(declare-fun m!669451 () Bool)

(assert (=> b!713113 m!669451))

(declare-fun m!669453 () Bool)

(assert (=> b!713103 m!669453))

(declare-fun m!669455 () Bool)

(assert (=> b!713101 m!669455))

(declare-fun m!669457 () Bool)

(assert (=> b!713106 m!669457))

(declare-fun m!669459 () Bool)

(assert (=> b!713102 m!669459))

(check-sat (not b!713107) (not b!713103) (not start!63334) (not b!713109) (not b!713104) (not b!713106) (not b!713101) (not b!713102) (not b!713114) (not b!713113) (not b!713099) (not b!713105) (not b!713112) (not b!713100) (not b!713108))
(check-sat)
