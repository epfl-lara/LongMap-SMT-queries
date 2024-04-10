; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62530 () Bool)

(assert start!62530)

(declare-fun res!468334 () Bool)

(declare-fun e!397728 () Bool)

(assert (=> start!62530 (=> (not res!468334) (not e!397728))))

(declare-datatypes ((array!40209 0))(
  ( (array!40210 (arr!19261 (Array (_ BitVec 32) (_ BitVec 64))) (size!19646 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40209)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62530 (= res!468334 (and (bvslt (size!19646 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19646 a!3591))))))

(assert (=> start!62530 e!397728))

(assert (=> start!62530 true))

(declare-fun array_inv!15057 (array!40209) Bool)

(assert (=> start!62530 (array_inv!15057 a!3591)))

(declare-fun b!704512 () Bool)

(declare-fun res!468336 () Bool)

(assert (=> b!704512 (=> (not res!468336) (not e!397728))))

(declare-datatypes ((List!13302 0))(
  ( (Nil!13299) (Cons!13298 (h!14343 (_ BitVec 64)) (t!19584 List!13302)) )
))
(declare-fun newAcc!49 () List!13302)

(declare-fun contains!3879 (List!13302 (_ BitVec 64)) Bool)

(assert (=> b!704512 (= res!468336 (not (contains!3879 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704513 () Bool)

(declare-fun res!468323 () Bool)

(assert (=> b!704513 (=> (not res!468323) (not e!397728))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704513 (= res!468323 (validKeyInArray!0 k0!2824))))

(declare-fun b!704514 () Bool)

(declare-fun res!468325 () Bool)

(assert (=> b!704514 (=> (not res!468325) (not e!397728))))

(declare-fun acc!652 () List!13302)

(assert (=> b!704514 (= res!468325 (not (contains!3879 acc!652 k0!2824)))))

(declare-fun b!704515 () Bool)

(declare-fun res!468333 () Bool)

(assert (=> b!704515 (=> (not res!468333) (not e!397728))))

(assert (=> b!704515 (= res!468333 (not (contains!3879 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704516 () Bool)

(declare-fun res!468339 () Bool)

(assert (=> b!704516 (=> (not res!468339) (not e!397728))))

(declare-fun arrayNoDuplicates!0 (array!40209 (_ BitVec 32) List!13302) Bool)

(assert (=> b!704516 (= res!468339 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!704517 () Bool)

(declare-fun res!468322 () Bool)

(assert (=> b!704517 (=> (not res!468322) (not e!397728))))

(declare-fun noDuplicate!1126 (List!13302) Bool)

(assert (=> b!704517 (= res!468322 (noDuplicate!1126 acc!652))))

(declare-fun b!704518 () Bool)

(declare-fun res!468330 () Bool)

(assert (=> b!704518 (=> (not res!468330) (not e!397728))))

(assert (=> b!704518 (= res!468330 (contains!3879 newAcc!49 k0!2824))))

(declare-fun b!704519 () Bool)

(declare-fun res!468332 () Bool)

(assert (=> b!704519 (=> (not res!468332) (not e!397728))))

(assert (=> b!704519 (= res!468332 (not (contains!3879 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704520 () Bool)

(declare-fun res!468335 () Bool)

(assert (=> b!704520 (=> (not res!468335) (not e!397728))))

(declare-fun arrayContainsKey!0 (array!40209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704520 (= res!468335 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!704521 () Bool)

(declare-fun res!468331 () Bool)

(assert (=> b!704521 (=> (not res!468331) (not e!397728))))

(assert (=> b!704521 (= res!468331 (noDuplicate!1126 newAcc!49))))

(declare-fun b!704522 () Bool)

(assert (=> b!704522 (= e!397728 false)))

(declare-fun lt!317847 () Bool)

(assert (=> b!704522 (= lt!317847 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704523 () Bool)

(declare-fun res!468326 () Bool)

(assert (=> b!704523 (=> (not res!468326) (not e!397728))))

(declare-fun -!289 (List!13302 (_ BitVec 64)) List!13302)

(assert (=> b!704523 (= res!468326 (= (-!289 newAcc!49 k0!2824) acc!652))))

(declare-fun b!704524 () Bool)

(declare-fun res!468327 () Bool)

(assert (=> b!704524 (=> (not res!468327) (not e!397728))))

(assert (=> b!704524 (= res!468327 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19646 a!3591)))))

(declare-fun b!704525 () Bool)

(declare-fun res!468324 () Bool)

(assert (=> b!704525 (=> (not res!468324) (not e!397728))))

(assert (=> b!704525 (= res!468324 (not (contains!3879 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704526 () Bool)

(declare-fun res!468329 () Bool)

(assert (=> b!704526 (=> (not res!468329) (not e!397728))))

(assert (=> b!704526 (= res!468329 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!704527 () Bool)

(declare-fun res!468337 () Bool)

(assert (=> b!704527 (=> (not res!468337) (not e!397728))))

(declare-fun subseq!324 (List!13302 List!13302) Bool)

(assert (=> b!704527 (= res!468337 (subseq!324 acc!652 newAcc!49))))

(declare-fun b!704528 () Bool)

(declare-fun res!468328 () Bool)

(assert (=> b!704528 (=> (not res!468328) (not e!397728))))

(assert (=> b!704528 (= res!468328 (not (validKeyInArray!0 (select (arr!19261 a!3591) from!2969))))))

(declare-fun b!704529 () Bool)

(declare-fun res!468338 () Bool)

(assert (=> b!704529 (=> (not res!468338) (not e!397728))))

(assert (=> b!704529 (= res!468338 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(assert (= (and start!62530 res!468334) b!704517))

(assert (= (and b!704517 res!468322) b!704521))

(assert (= (and b!704521 res!468331) b!704515))

(assert (= (and b!704515 res!468333) b!704525))

(assert (= (and b!704525 res!468324) b!704529))

(assert (= (and b!704529 res!468338) b!704514))

(assert (= (and b!704514 res!468325) b!704513))

(assert (= (and b!704513 res!468323) b!704516))

(assert (= (and b!704516 res!468339) b!704527))

(assert (= (and b!704527 res!468337) b!704518))

(assert (= (and b!704518 res!468330) b!704523))

(assert (= (and b!704523 res!468326) b!704512))

(assert (= (and b!704512 res!468336) b!704519))

(assert (= (and b!704519 res!468332) b!704524))

(assert (= (and b!704524 res!468327) b!704528))

(assert (= (and b!704528 res!468328) b!704526))

(assert (= (and b!704526 res!468329) b!704520))

(assert (= (and b!704520 res!468335) b!704522))

(declare-fun m!662983 () Bool)

(assert (=> b!704522 m!662983))

(declare-fun m!662985 () Bool)

(assert (=> b!704525 m!662985))

(declare-fun m!662987 () Bool)

(assert (=> b!704523 m!662987))

(declare-fun m!662989 () Bool)

(assert (=> b!704518 m!662989))

(declare-fun m!662991 () Bool)

(assert (=> b!704519 m!662991))

(declare-fun m!662993 () Bool)

(assert (=> b!704527 m!662993))

(declare-fun m!662995 () Bool)

(assert (=> b!704515 m!662995))

(declare-fun m!662997 () Bool)

(assert (=> start!62530 m!662997))

(declare-fun m!662999 () Bool)

(assert (=> b!704521 m!662999))

(declare-fun m!663001 () Bool)

(assert (=> b!704516 m!663001))

(declare-fun m!663003 () Bool)

(assert (=> b!704520 m!663003))

(declare-fun m!663005 () Bool)

(assert (=> b!704512 m!663005))

(declare-fun m!663007 () Bool)

(assert (=> b!704514 m!663007))

(declare-fun m!663009 () Bool)

(assert (=> b!704517 m!663009))

(declare-fun m!663011 () Bool)

(assert (=> b!704529 m!663011))

(declare-fun m!663013 () Bool)

(assert (=> b!704528 m!663013))

(assert (=> b!704528 m!663013))

(declare-fun m!663015 () Bool)

(assert (=> b!704528 m!663015))

(declare-fun m!663017 () Bool)

(assert (=> b!704513 m!663017))

(check-sat (not b!704514) (not b!704517) (not b!704512) (not b!704522) (not start!62530) (not b!704527) (not b!704518) (not b!704525) (not b!704516) (not b!704520) (not b!704519) (not b!704521) (not b!704513) (not b!704529) (not b!704515) (not b!704523) (not b!704528))
(check-sat)
