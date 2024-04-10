; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61590 () Bool)

(assert start!61590)

(declare-fun b!689560 () Bool)

(declare-datatypes ((Unit!24352 0))(
  ( (Unit!24353) )
))
(declare-fun e!392604 () Unit!24352)

(declare-fun Unit!24354 () Unit!24352)

(assert (=> b!689560 (= e!392604 Unit!24354)))

(declare-fun lt!316217 () Unit!24352)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39731 0))(
  ( (array!39732 (arr!19037 (Array (_ BitVec 32) (_ BitVec 64))) (size!19419 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39731)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39731 (_ BitVec 64) (_ BitVec 32)) Unit!24352)

(assert (=> b!689560 (= lt!316217 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!689560 false))

(declare-fun b!689561 () Bool)

(declare-fun res!454103 () Bool)

(declare-fun e!392600 () Bool)

(assert (=> b!689561 (=> (not res!454103) (not e!392600))))

(declare-fun arrayContainsKey!0 (array!39731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!689561 (= res!454103 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!689562 () Bool)

(declare-fun res!454090 () Bool)

(declare-fun e!392601 () Bool)

(assert (=> b!689562 (=> res!454090 e!392601)))

(declare-fun e!392595 () Bool)

(assert (=> b!689562 (= res!454090 e!392595)))

(declare-fun res!454104 () Bool)

(assert (=> b!689562 (=> (not res!454104) (not e!392595))))

(declare-fun e!392597 () Bool)

(assert (=> b!689562 (= res!454104 e!392597)))

(declare-fun res!454092 () Bool)

(assert (=> b!689562 (=> res!454092 e!392597)))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!689562 (= res!454092 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689563 () Bool)

(declare-fun e!392603 () Bool)

(declare-datatypes ((List!13078 0))(
  ( (Nil!13075) (Cons!13074 (h!14119 (_ BitVec 64)) (t!19342 List!13078)) )
))
(declare-fun acc!681 () List!13078)

(declare-fun contains!3655 (List!13078 (_ BitVec 64)) Bool)

(assert (=> b!689563 (= e!392603 (not (contains!3655 acc!681 k!2843)))))

(declare-fun b!689564 () Bool)

(declare-fun res!454096 () Bool)

(assert (=> b!689564 (=> res!454096 e!392601)))

(declare-fun lt!316215 () List!13078)

(declare-fun noDuplicate!902 (List!13078) Bool)

(assert (=> b!689564 (= res!454096 (not (noDuplicate!902 lt!316215)))))

(declare-fun b!689565 () Bool)

(declare-fun res!454108 () Bool)

(assert (=> b!689565 (=> (not res!454108) (not e!392600))))

(declare-fun arrayNoDuplicates!0 (array!39731 (_ BitVec 32) List!13078) Bool)

(assert (=> b!689565 (= res!454108 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13075))))

(declare-fun b!689566 () Bool)

(declare-fun Unit!24355 () Unit!24352)

(assert (=> b!689566 (= e!392604 Unit!24355)))

(declare-fun b!689567 () Bool)

(declare-fun e!392598 () Bool)

(assert (=> b!689567 (= e!392595 e!392598)))

(declare-fun res!454099 () Bool)

(assert (=> b!689567 (=> res!454099 e!392598)))

(assert (=> b!689567 (= res!454099 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689568 () Bool)

(declare-fun e!392594 () Bool)

(assert (=> b!689568 (= e!392594 (contains!3655 acc!681 k!2843))))

(declare-fun b!689569 () Bool)

(assert (=> b!689569 (= e!392600 (not e!392601))))

(declare-fun res!454094 () Bool)

(assert (=> b!689569 (=> res!454094 e!392601)))

(assert (=> b!689569 (= res!454094 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!689569 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316215)))

(declare-fun lt!316218 () Unit!24352)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39731 (_ BitVec 64) (_ BitVec 32) List!13078 List!13078) Unit!24352)

(assert (=> b!689569 (= lt!316218 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!316215))))

(declare-fun -!206 (List!13078 (_ BitVec 64)) List!13078)

(assert (=> b!689569 (= (-!206 lt!316215 k!2843) acc!681)))

(declare-fun $colon$colon!406 (List!13078 (_ BitVec 64)) List!13078)

(assert (=> b!689569 (= lt!316215 ($colon$colon!406 acc!681 k!2843))))

(declare-fun lt!316211 () Unit!24352)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13078) Unit!24352)

(assert (=> b!689569 (= lt!316211 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!241 (List!13078 List!13078) Bool)

(assert (=> b!689569 (subseq!241 acc!681 acc!681)))

(declare-fun lt!316209 () Unit!24352)

(declare-fun lemmaListSubSeqRefl!0 (List!13078) Unit!24352)

(assert (=> b!689569 (= lt!316209 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689569 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!316213 () Unit!24352)

(declare-fun e!392599 () Unit!24352)

(assert (=> b!689569 (= lt!316213 e!392599)))

(declare-fun c!78104 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!689569 (= c!78104 (validKeyInArray!0 (select (arr!19037 a!3626) from!3004)))))

(declare-fun lt!316219 () Unit!24352)

(assert (=> b!689569 (= lt!316219 e!392604)))

(declare-fun c!78103 () Bool)

(assert (=> b!689569 (= c!78103 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun lt!316216 () array!39731)

(assert (=> b!689569 (arrayContainsKey!0 lt!316216 k!2843 from!3004)))

(assert (=> b!689569 (= lt!316216 (array!39732 (store (arr!19037 a!3626) i!1382 k!2843) (size!19419 a!3626)))))

(declare-fun b!689570 () Bool)

(declare-fun res!454100 () Bool)

(assert (=> b!689570 (=> (not res!454100) (not e!392600))))

(assert (=> b!689570 (= res!454100 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19419 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!689572 () Bool)

(declare-fun res!454105 () Bool)

(assert (=> b!689572 (=> (not res!454105) (not e!392600))))

(declare-fun e!392602 () Bool)

(assert (=> b!689572 (= res!454105 e!392602)))

(declare-fun res!454097 () Bool)

(assert (=> b!689572 (=> res!454097 e!392602)))

(assert (=> b!689572 (= res!454097 e!392594)))

(declare-fun res!454107 () Bool)

(assert (=> b!689572 (=> (not res!454107) (not e!392594))))

(assert (=> b!689572 (= res!454107 (bvsgt from!3004 i!1382))))

(declare-fun b!689573 () Bool)

(declare-fun lt!316214 () Unit!24352)

(assert (=> b!689573 (= e!392599 lt!316214)))

(declare-fun lt!316210 () Unit!24352)

(assert (=> b!689573 (= lt!316210 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689573 (subseq!241 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39731 List!13078 List!13078 (_ BitVec 32)) Unit!24352)

(assert (=> b!689573 (= lt!316214 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!406 acc!681 (select (arr!19037 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!689573 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!689574 () Bool)

(assert (=> b!689574 (= e!392598 (contains!3655 lt!316215 k!2843))))

(declare-fun b!689575 () Bool)

(declare-fun res!454109 () Bool)

(assert (=> b!689575 (=> (not res!454109) (not e!392600))))

(assert (=> b!689575 (= res!454109 (noDuplicate!902 acc!681))))

(declare-fun b!689576 () Bool)

(assert (=> b!689576 (= e!392597 (not (contains!3655 lt!316215 k!2843)))))

(declare-fun b!689577 () Bool)

(declare-fun res!454098 () Bool)

(assert (=> b!689577 (=> (not res!454098) (not e!392600))))

(assert (=> b!689577 (= res!454098 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!689578 () Bool)

(assert (=> b!689578 (= e!392601 true)))

(assert (=> b!689578 (arrayNoDuplicates!0 lt!316216 (bvadd #b00000000000000000000000000000001 from!3004) lt!316215)))

(declare-fun lt!316212 () Unit!24352)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39731 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!13078) Unit!24352)

(assert (=> b!689578 (= lt!316212 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316215))))

(declare-fun b!689579 () Bool)

(declare-fun res!454091 () Bool)

(assert (=> b!689579 (=> (not res!454091) (not e!392600))))

(assert (=> b!689579 (= res!454091 (not (contains!3655 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689580 () Bool)

(declare-fun Unit!24356 () Unit!24352)

(assert (=> b!689580 (= e!392599 Unit!24356)))

(declare-fun b!689581 () Bool)

(declare-fun res!454089 () Bool)

(assert (=> b!689581 (=> res!454089 e!392601)))

(assert (=> b!689581 (= res!454089 (contains!3655 lt!316215 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689571 () Bool)

(declare-fun res!454095 () Bool)

(assert (=> b!689571 (=> (not res!454095) (not e!392600))))

(assert (=> b!689571 (= res!454095 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19419 a!3626))))))

(declare-fun res!454102 () Bool)

(assert (=> start!61590 (=> (not res!454102) (not e!392600))))

(assert (=> start!61590 (= res!454102 (and (bvslt (size!19419 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19419 a!3626))))))

(assert (=> start!61590 e!392600))

(assert (=> start!61590 true))

(declare-fun array_inv!14833 (array!39731) Bool)

(assert (=> start!61590 (array_inv!14833 a!3626)))

(declare-fun b!689582 () Bool)

(declare-fun res!454101 () Bool)

(assert (=> b!689582 (=> (not res!454101) (not e!392600))))

(assert (=> b!689582 (= res!454101 (validKeyInArray!0 k!2843))))

(declare-fun b!689583 () Bool)

(declare-fun res!454093 () Bool)

(assert (=> b!689583 (=> res!454093 e!392601)))

(assert (=> b!689583 (= res!454093 (contains!3655 lt!316215 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689584 () Bool)

(assert (=> b!689584 (= e!392602 e!392603)))

(declare-fun res!454106 () Bool)

(assert (=> b!689584 (=> (not res!454106) (not e!392603))))

(assert (=> b!689584 (= res!454106 (bvsle from!3004 i!1382))))

(declare-fun b!689585 () Bool)

(declare-fun res!454088 () Bool)

(assert (=> b!689585 (=> (not res!454088) (not e!392600))))

(assert (=> b!689585 (= res!454088 (not (contains!3655 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!61590 res!454102) b!689575))

(assert (= (and b!689575 res!454109) b!689585))

(assert (= (and b!689585 res!454088) b!689579))

(assert (= (and b!689579 res!454091) b!689572))

(assert (= (and b!689572 res!454107) b!689568))

(assert (= (and b!689572 (not res!454097)) b!689584))

(assert (= (and b!689584 res!454106) b!689563))

(assert (= (and b!689572 res!454105) b!689565))

(assert (= (and b!689565 res!454108) b!689577))

(assert (= (and b!689577 res!454098) b!689571))

(assert (= (and b!689571 res!454095) b!689582))

(assert (= (and b!689582 res!454101) b!689561))

(assert (= (and b!689561 res!454103) b!689570))

(assert (= (and b!689570 res!454100) b!689569))

(assert (= (and b!689569 c!78103) b!689560))

(assert (= (and b!689569 (not c!78103)) b!689566))

(assert (= (and b!689569 c!78104) b!689573))

(assert (= (and b!689569 (not c!78104)) b!689580))

(assert (= (and b!689569 (not res!454094)) b!689564))

(assert (= (and b!689564 (not res!454096)) b!689581))

(assert (= (and b!689581 (not res!454089)) b!689583))

(assert (= (and b!689583 (not res!454093)) b!689562))

(assert (= (and b!689562 (not res!454092)) b!689576))

(assert (= (and b!689562 res!454104) b!689567))

(assert (= (and b!689567 (not res!454099)) b!689574))

(assert (= (and b!689562 (not res!454090)) b!689578))

(declare-fun m!653193 () Bool)

(assert (=> b!689578 m!653193))

(declare-fun m!653195 () Bool)

(assert (=> b!689578 m!653195))

(declare-fun m!653197 () Bool)

(assert (=> b!689585 m!653197))

(declare-fun m!653199 () Bool)

(assert (=> start!61590 m!653199))

(declare-fun m!653201 () Bool)

(assert (=> b!689579 m!653201))

(declare-fun m!653203 () Bool)

(assert (=> b!689563 m!653203))

(declare-fun m!653205 () Bool)

(assert (=> b!689576 m!653205))

(declare-fun m!653207 () Bool)

(assert (=> b!689575 m!653207))

(declare-fun m!653209 () Bool)

(assert (=> b!689565 m!653209))

(assert (=> b!689574 m!653205))

(declare-fun m!653211 () Bool)

(assert (=> b!689581 m!653211))

(declare-fun m!653213 () Bool)

(assert (=> b!689569 m!653213))

(declare-fun m!653215 () Bool)

(assert (=> b!689569 m!653215))

(declare-fun m!653217 () Bool)

(assert (=> b!689569 m!653217))

(declare-fun m!653219 () Bool)

(assert (=> b!689569 m!653219))

(declare-fun m!653221 () Bool)

(assert (=> b!689569 m!653221))

(declare-fun m!653223 () Bool)

(assert (=> b!689569 m!653223))

(declare-fun m!653225 () Bool)

(assert (=> b!689569 m!653225))

(assert (=> b!689569 m!653213))

(declare-fun m!653227 () Bool)

(assert (=> b!689569 m!653227))

(declare-fun m!653229 () Bool)

(assert (=> b!689569 m!653229))

(declare-fun m!653231 () Bool)

(assert (=> b!689569 m!653231))

(declare-fun m!653233 () Bool)

(assert (=> b!689569 m!653233))

(declare-fun m!653235 () Bool)

(assert (=> b!689569 m!653235))

(declare-fun m!653237 () Bool)

(assert (=> b!689569 m!653237))

(declare-fun m!653239 () Bool)

(assert (=> b!689582 m!653239))

(declare-fun m!653241 () Bool)

(assert (=> b!689583 m!653241))

(assert (=> b!689573 m!653231))

(assert (=> b!689573 m!653213))

(declare-fun m!653243 () Bool)

(assert (=> b!689573 m!653243))

(declare-fun m!653245 () Bool)

(assert (=> b!689573 m!653245))

(assert (=> b!689573 m!653213))

(assert (=> b!689573 m!653243))

(assert (=> b!689573 m!653223))

(assert (=> b!689573 m!653229))

(assert (=> b!689568 m!653203))

(declare-fun m!653247 () Bool)

(assert (=> b!689564 m!653247))

(declare-fun m!653249 () Bool)

(assert (=> b!689577 m!653249))

(declare-fun m!653251 () Bool)

(assert (=> b!689560 m!653251))

(declare-fun m!653253 () Bool)

(assert (=> b!689561 m!653253))

(push 1)

(assert (not b!689574))

(assert (not b!689563))

(assert (not b!689582))

(assert (not b!689561))

(assert (not b!689565))

(assert (not b!689569))

(assert (not b!689581))

(assert (not start!61590))

(assert (not b!689560))

(assert (not b!689578))

(assert (not b!689583))

(assert (not b!689575))

(assert (not b!689568))

(assert (not b!689585))

(assert (not b!689577))

(assert (not b!689576))

(assert (not b!689579))

(assert (not b!689573))

(assert (not b!689564))

(check-sat)

