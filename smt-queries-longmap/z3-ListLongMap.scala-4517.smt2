; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62626 () Bool)

(assert start!62626)

(declare-fun b!705796 () Bool)

(declare-fun res!469509 () Bool)

(declare-fun e!397965 () Bool)

(assert (=> b!705796 (=> (not res!469509) (not e!397965))))

(declare-datatypes ((List!13224 0))(
  ( (Nil!13221) (Cons!13220 (h!14268 (_ BitVec 64)) (t!19498 List!13224)) )
))
(declare-fun newAcc!49 () List!13224)

(declare-fun contains!3876 (List!13224 (_ BitVec 64)) Bool)

(assert (=> b!705796 (= res!469509 (not (contains!3876 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705797 () Bool)

(declare-fun res!469525 () Bool)

(assert (=> b!705797 (=> (not res!469525) (not e!397965))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!705797 (= res!469525 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705798 () Bool)

(declare-fun res!469517 () Bool)

(assert (=> b!705798 (=> (not res!469517) (not e!397965))))

(declare-fun acc!652 () List!13224)

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!705798 (= res!469517 (not (contains!3876 acc!652 k0!2824)))))

(declare-fun b!705799 () Bool)

(declare-fun res!469523 () Bool)

(assert (=> b!705799 (=> (not res!469523) (not e!397965))))

(declare-datatypes ((array!40245 0))(
  ( (array!40246 (arr!19276 (Array (_ BitVec 32) (_ BitVec 64))) (size!19659 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40245)

(declare-fun arrayNoDuplicates!0 (array!40245 (_ BitVec 32) List!13224) Bool)

(assert (=> b!705799 (= res!469523 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705800 () Bool)

(declare-fun res!469511 () Bool)

(assert (=> b!705800 (=> (not res!469511) (not e!397965))))

(assert (=> b!705800 (= res!469511 (not (contains!3876 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705801 () Bool)

(declare-fun res!469519 () Bool)

(assert (=> b!705801 (=> (not res!469519) (not e!397965))))

(declare-fun -!308 (List!13224 (_ BitVec 64)) List!13224)

(assert (=> b!705801 (= res!469519 (= (-!308 newAcc!49 k0!2824) acc!652))))

(declare-fun b!705802 () Bool)

(declare-fun res!469513 () Bool)

(assert (=> b!705802 (=> (not res!469513) (not e!397965))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705802 (= res!469513 (validKeyInArray!0 k0!2824))))

(declare-fun b!705803 () Bool)

(declare-fun res!469514 () Bool)

(assert (=> b!705803 (=> (not res!469514) (not e!397965))))

(assert (=> b!705803 (= res!469514 (not (contains!3876 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705804 () Bool)

(declare-fun res!469518 () Bool)

(assert (=> b!705804 (=> (not res!469518) (not e!397965))))

(assert (=> b!705804 (= res!469518 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19659 a!3591)))))

(declare-fun res!469516 () Bool)

(assert (=> start!62626 (=> (not res!469516) (not e!397965))))

(assert (=> start!62626 (= res!469516 (and (bvslt (size!19659 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19659 a!3591))))))

(assert (=> start!62626 e!397965))

(assert (=> start!62626 true))

(declare-fun array_inv!15135 (array!40245) Bool)

(assert (=> start!62626 (array_inv!15135 a!3591)))

(declare-fun b!705805 () Bool)

(declare-fun res!469521 () Bool)

(assert (=> b!705805 (=> (not res!469521) (not e!397965))))

(assert (=> b!705805 (= res!469521 (not (validKeyInArray!0 (select (arr!19276 a!3591) from!2969))))))

(declare-fun b!705806 () Bool)

(declare-fun res!469520 () Bool)

(assert (=> b!705806 (=> (not res!469520) (not e!397965))))

(declare-fun subseq!344 (List!13224 List!13224) Bool)

(assert (=> b!705806 (= res!469520 (subseq!344 acc!652 newAcc!49))))

(declare-fun b!705807 () Bool)

(declare-fun res!469508 () Bool)

(assert (=> b!705807 (=> (not res!469508) (not e!397965))))

(declare-fun noDuplicate!1150 (List!13224) Bool)

(assert (=> b!705807 (= res!469508 (noDuplicate!1150 newAcc!49))))

(declare-fun b!705808 () Bool)

(declare-fun res!469515 () Bool)

(assert (=> b!705808 (=> (not res!469515) (not e!397965))))

(declare-fun arrayContainsKey!0 (array!40245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705808 (= res!469515 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705809 () Bool)

(declare-fun res!469522 () Bool)

(assert (=> b!705809 (=> (not res!469522) (not e!397965))))

(assert (=> b!705809 (= res!469522 (contains!3876 newAcc!49 k0!2824))))

(declare-fun b!705810 () Bool)

(declare-fun res!469507 () Bool)

(assert (=> b!705810 (=> (not res!469507) (not e!397965))))

(assert (=> b!705810 (= res!469507 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!705811 () Bool)

(assert (=> b!705811 (= e!397965 (not true))))

(assert (=> b!705811 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) newAcc!49)))

(declare-datatypes ((Unit!24591 0))(
  ( (Unit!24592) )
))
(declare-fun lt!318006 () Unit!24591)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!40245 (_ BitVec 64) (_ BitVec 32) List!13224 List!13224) Unit!24591)

(assert (=> b!705811 (= lt!318006 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969) acc!652 newAcc!49))))

(declare-fun b!705812 () Bool)

(declare-fun res!469524 () Bool)

(assert (=> b!705812 (=> (not res!469524) (not e!397965))))

(assert (=> b!705812 (= res!469524 (noDuplicate!1150 acc!652))))

(declare-fun b!705813 () Bool)

(declare-fun res!469510 () Bool)

(assert (=> b!705813 (=> (not res!469510) (not e!397965))))

(assert (=> b!705813 (= res!469510 (not (contains!3876 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705814 () Bool)

(declare-fun res!469512 () Bool)

(assert (=> b!705814 (=> (not res!469512) (not e!397965))))

(assert (=> b!705814 (= res!469512 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(assert (= (and start!62626 res!469516) b!705812))

(assert (= (and b!705812 res!469524) b!705807))

(assert (= (and b!705807 res!469508) b!705800))

(assert (= (and b!705800 res!469511) b!705803))

(assert (= (and b!705803 res!469514) b!705810))

(assert (= (and b!705810 res!469507) b!705798))

(assert (= (and b!705798 res!469517) b!705802))

(assert (= (and b!705802 res!469513) b!705814))

(assert (= (and b!705814 res!469512) b!705806))

(assert (= (and b!705806 res!469520) b!705809))

(assert (= (and b!705809 res!469522) b!705801))

(assert (= (and b!705801 res!469519) b!705796))

(assert (= (and b!705796 res!469509) b!705813))

(assert (= (and b!705813 res!469510) b!705804))

(assert (= (and b!705804 res!469518) b!705805))

(assert (= (and b!705805 res!469521) b!705797))

(assert (= (and b!705797 res!469525) b!705808))

(assert (= (and b!705808 res!469515) b!705799))

(assert (= (and b!705799 res!469523) b!705811))

(declare-fun m!664371 () Bool)

(assert (=> b!705803 m!664371))

(declare-fun m!664373 () Bool)

(assert (=> b!705805 m!664373))

(assert (=> b!705805 m!664373))

(declare-fun m!664375 () Bool)

(assert (=> b!705805 m!664375))

(declare-fun m!664377 () Bool)

(assert (=> b!705811 m!664377))

(declare-fun m!664379 () Bool)

(assert (=> b!705811 m!664379))

(declare-fun m!664381 () Bool)

(assert (=> b!705810 m!664381))

(declare-fun m!664383 () Bool)

(assert (=> b!705813 m!664383))

(declare-fun m!664385 () Bool)

(assert (=> b!705799 m!664385))

(declare-fun m!664387 () Bool)

(assert (=> b!705807 m!664387))

(declare-fun m!664389 () Bool)

(assert (=> b!705800 m!664389))

(declare-fun m!664391 () Bool)

(assert (=> b!705806 m!664391))

(declare-fun m!664393 () Bool)

(assert (=> b!705812 m!664393))

(declare-fun m!664395 () Bool)

(assert (=> b!705796 m!664395))

(declare-fun m!664397 () Bool)

(assert (=> b!705798 m!664397))

(declare-fun m!664399 () Bool)

(assert (=> start!62626 m!664399))

(declare-fun m!664401 () Bool)

(assert (=> b!705808 m!664401))

(declare-fun m!664403 () Bool)

(assert (=> b!705814 m!664403))

(declare-fun m!664405 () Bool)

(assert (=> b!705802 m!664405))

(declare-fun m!664407 () Bool)

(assert (=> b!705809 m!664407))

(declare-fun m!664409 () Bool)

(assert (=> b!705801 m!664409))

(check-sat (not b!705806) (not b!705801) (not b!705813) (not b!705798) (not b!705810) (not b!705803) (not b!705808) (not b!705796) (not b!705812) (not b!705800) (not b!705799) (not b!705809) (not b!705811) (not b!705802) (not b!705807) (not b!705805) (not b!705814) (not start!62626))
(check-sat)
