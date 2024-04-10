; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62566 () Bool)

(assert start!62566)

(declare-fun b!705489 () Bool)

(declare-fun res!469307 () Bool)

(declare-fun e!397836 () Bool)

(assert (=> b!705489 (=> (not res!469307) (not e!397836))))

(declare-datatypes ((List!13320 0))(
  ( (Nil!13317) (Cons!13316 (h!14361 (_ BitVec 64)) (t!19602 List!13320)) )
))
(declare-fun acc!652 () List!13320)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3897 (List!13320 (_ BitVec 64)) Bool)

(assert (=> b!705489 (= res!469307 (not (contains!3897 acc!652 k0!2824)))))

(declare-fun b!705490 () Bool)

(declare-fun res!469308 () Bool)

(assert (=> b!705490 (=> (not res!469308) (not e!397836))))

(declare-datatypes ((array!40245 0))(
  ( (array!40246 (arr!19279 (Array (_ BitVec 32) (_ BitVec 64))) (size!19664 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40245)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705490 (= res!469308 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!705491 () Bool)

(declare-fun res!469314 () Bool)

(assert (=> b!705491 (=> (not res!469314) (not e!397836))))

(declare-fun noDuplicate!1144 (List!13320) Bool)

(assert (=> b!705491 (= res!469314 (noDuplicate!1144 acc!652))))

(declare-fun b!705493 () Bool)

(declare-fun res!469300 () Bool)

(assert (=> b!705493 (=> (not res!469300) (not e!397836))))

(declare-fun newAcc!49 () List!13320)

(declare-fun -!307 (List!13320 (_ BitVec 64)) List!13320)

(assert (=> b!705493 (= res!469300 (= (-!307 newAcc!49 k0!2824) acc!652))))

(declare-fun b!705494 () Bool)

(assert (=> b!705494 (= e!397836 (not (bvsle from!2969 (size!19664 a!3591))))))

(declare-fun arrayNoDuplicates!0 (array!40245 (_ BitVec 32) List!13320) Bool)

(assert (=> b!705494 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-datatypes ((Unit!24608 0))(
  ( (Unit!24609) )
))
(declare-fun lt!317901 () Unit!24608)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40245 (_ BitVec 64) (_ BitVec 32) List!13320 List!13320) Unit!24608)

(assert (=> b!705494 (= lt!317901 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun b!705495 () Bool)

(declare-fun res!469316 () Bool)

(assert (=> b!705495 (=> (not res!469316) (not e!397836))))

(assert (=> b!705495 (= res!469316 (not (contains!3897 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705496 () Bool)

(declare-fun res!469306 () Bool)

(assert (=> b!705496 (=> (not res!469306) (not e!397836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705496 (= res!469306 (not (validKeyInArray!0 (select (arr!19279 a!3591) from!2969))))))

(declare-fun b!705497 () Bool)

(declare-fun res!469313 () Bool)

(assert (=> b!705497 (=> (not res!469313) (not e!397836))))

(assert (=> b!705497 (= res!469313 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19664 a!3591)))))

(declare-fun b!705498 () Bool)

(declare-fun res!469304 () Bool)

(assert (=> b!705498 (=> (not res!469304) (not e!397836))))

(assert (=> b!705498 (= res!469304 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705499 () Bool)

(declare-fun res!469309 () Bool)

(assert (=> b!705499 (=> (not res!469309) (not e!397836))))

(assert (=> b!705499 (= res!469309 (not (contains!3897 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705500 () Bool)

(declare-fun res!469301 () Bool)

(assert (=> b!705500 (=> (not res!469301) (not e!397836))))

(assert (=> b!705500 (= res!469301 (not (contains!3897 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705501 () Bool)

(declare-fun res!469310 () Bool)

(assert (=> b!705501 (=> (not res!469310) (not e!397836))))

(assert (=> b!705501 (= res!469310 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705502 () Bool)

(declare-fun res!469311 () Bool)

(assert (=> b!705502 (=> (not res!469311) (not e!397836))))

(assert (=> b!705502 (= res!469311 (contains!3897 newAcc!49 k0!2824))))

(declare-fun b!705503 () Bool)

(declare-fun res!469305 () Bool)

(assert (=> b!705503 (=> (not res!469305) (not e!397836))))

(declare-fun subseq!342 (List!13320 List!13320) Bool)

(assert (=> b!705503 (= res!469305 (subseq!342 acc!652 newAcc!49))))

(declare-fun b!705504 () Bool)

(declare-fun res!469303 () Bool)

(assert (=> b!705504 (=> (not res!469303) (not e!397836))))

(assert (=> b!705504 (= res!469303 (noDuplicate!1144 newAcc!49))))

(declare-fun b!705505 () Bool)

(declare-fun res!469299 () Bool)

(assert (=> b!705505 (=> (not res!469299) (not e!397836))))

(assert (=> b!705505 (= res!469299 (validKeyInArray!0 k0!2824))))

(declare-fun b!705506 () Bool)

(declare-fun res!469312 () Bool)

(assert (=> b!705506 (=> (not res!469312) (not e!397836))))

(assert (=> b!705506 (= res!469312 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!705507 () Bool)

(declare-fun res!469315 () Bool)

(assert (=> b!705507 (=> (not res!469315) (not e!397836))))

(assert (=> b!705507 (= res!469315 (not (contains!3897 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705492 () Bool)

(declare-fun res!469302 () Bool)

(assert (=> b!705492 (=> (not res!469302) (not e!397836))))

(assert (=> b!705492 (= res!469302 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun res!469317 () Bool)

(assert (=> start!62566 (=> (not res!469317) (not e!397836))))

(assert (=> start!62566 (= res!469317 (and (bvslt (size!19664 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19664 a!3591))))))

(assert (=> start!62566 e!397836))

(assert (=> start!62566 true))

(declare-fun array_inv!15075 (array!40245) Bool)

(assert (=> start!62566 (array_inv!15075 a!3591)))

(assert (= (and start!62566 res!469317) b!705491))

(assert (= (and b!705491 res!469314) b!705504))

(assert (= (and b!705504 res!469303) b!705499))

(assert (= (and b!705499 res!469309) b!705495))

(assert (= (and b!705495 res!469316) b!705490))

(assert (= (and b!705490 res!469308) b!705489))

(assert (= (and b!705489 res!469307) b!705505))

(assert (= (and b!705505 res!469299) b!705506))

(assert (= (and b!705506 res!469312) b!705503))

(assert (= (and b!705503 res!469305) b!705502))

(assert (= (and b!705502 res!469311) b!705493))

(assert (= (and b!705493 res!469300) b!705500))

(assert (= (and b!705500 res!469301) b!705507))

(assert (= (and b!705507 res!469315) b!705497))

(assert (= (and b!705497 res!469313) b!705496))

(assert (= (and b!705496 res!469306) b!705492))

(assert (= (and b!705492 res!469302) b!705501))

(assert (= (and b!705501 res!469310) b!705498))

(assert (= (and b!705498 res!469304) b!705494))

(declare-fun m!663635 () Bool)

(assert (=> b!705503 m!663635))

(declare-fun m!663637 () Bool)

(assert (=> b!705490 m!663637))

(declare-fun m!663639 () Bool)

(assert (=> b!705498 m!663639))

(declare-fun m!663641 () Bool)

(assert (=> b!705501 m!663641))

(declare-fun m!663643 () Bool)

(assert (=> b!705500 m!663643))

(declare-fun m!663645 () Bool)

(assert (=> b!705495 m!663645))

(declare-fun m!663647 () Bool)

(assert (=> b!705505 m!663647))

(declare-fun m!663649 () Bool)

(assert (=> b!705506 m!663649))

(declare-fun m!663651 () Bool)

(assert (=> b!705489 m!663651))

(declare-fun m!663653 () Bool)

(assert (=> b!705499 m!663653))

(declare-fun m!663655 () Bool)

(assert (=> b!705491 m!663655))

(declare-fun m!663657 () Bool)

(assert (=> b!705504 m!663657))

(declare-fun m!663659 () Bool)

(assert (=> b!705494 m!663659))

(declare-fun m!663661 () Bool)

(assert (=> b!705494 m!663661))

(declare-fun m!663663 () Bool)

(assert (=> b!705507 m!663663))

(declare-fun m!663665 () Bool)

(assert (=> b!705493 m!663665))

(declare-fun m!663667 () Bool)

(assert (=> b!705502 m!663667))

(declare-fun m!663669 () Bool)

(assert (=> b!705496 m!663669))

(assert (=> b!705496 m!663669))

(declare-fun m!663671 () Bool)

(assert (=> b!705496 m!663671))

(declare-fun m!663673 () Bool)

(assert (=> start!62566 m!663673))

(check-sat (not b!705490) (not b!705507) (not b!705500) (not b!705491) (not b!705502) (not b!705489) (not b!705495) (not b!705498) (not b!705496) (not start!62566) (not b!705505) (not b!705493) (not b!705499) (not b!705503) (not b!705504) (not b!705494) (not b!705501) (not b!705506))
(check-sat)
