; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62536 () Bool)

(assert start!62536)

(declare-fun b!704674 () Bool)

(declare-fun res!468487 () Bool)

(declare-fun e!397747 () Bool)

(assert (=> b!704674 (=> (not res!468487) (not e!397747))))

(declare-datatypes ((List!13305 0))(
  ( (Nil!13302) (Cons!13301 (h!14346 (_ BitVec 64)) (t!19587 List!13305)) )
))
(declare-fun newAcc!49 () List!13305)

(declare-fun contains!3882 (List!13305 (_ BitVec 64)) Bool)

(assert (=> b!704674 (= res!468487 (not (contains!3882 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704675 () Bool)

(declare-fun res!468496 () Bool)

(assert (=> b!704675 (=> (not res!468496) (not e!397747))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun acc!652 () List!13305)

(declare-fun -!292 (List!13305 (_ BitVec 64)) List!13305)

(assert (=> b!704675 (= res!468496 (= (-!292 newAcc!49 k0!2824) acc!652))))

(declare-fun b!704676 () Bool)

(declare-fun res!468484 () Bool)

(assert (=> b!704676 (=> (not res!468484) (not e!397747))))

(assert (=> b!704676 (= res!468484 (not (contains!3882 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704677 () Bool)

(declare-fun res!468488 () Bool)

(assert (=> b!704677 (=> (not res!468488) (not e!397747))))

(declare-fun subseq!327 (List!13305 List!13305) Bool)

(assert (=> b!704677 (= res!468488 (subseq!327 acc!652 newAcc!49))))

(declare-fun res!468493 () Bool)

(assert (=> start!62536 (=> (not res!468493) (not e!397747))))

(declare-datatypes ((array!40215 0))(
  ( (array!40216 (arr!19264 (Array (_ BitVec 32) (_ BitVec 64))) (size!19649 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40215)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62536 (= res!468493 (and (bvslt (size!19649 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19649 a!3591))))))

(assert (=> start!62536 e!397747))

(assert (=> start!62536 true))

(declare-fun array_inv!15060 (array!40215) Bool)

(assert (=> start!62536 (array_inv!15060 a!3591)))

(declare-fun b!704678 () Bool)

(declare-fun res!468500 () Bool)

(assert (=> b!704678 (=> (not res!468500) (not e!397747))))

(assert (=> b!704678 (= res!468500 (contains!3882 newAcc!49 k0!2824))))

(declare-fun b!704679 () Bool)

(declare-fun res!468491 () Bool)

(assert (=> b!704679 (=> (not res!468491) (not e!397747))))

(declare-fun noDuplicate!1129 (List!13305) Bool)

(assert (=> b!704679 (= res!468491 (noDuplicate!1129 newAcc!49))))

(declare-fun b!704680 () Bool)

(declare-fun res!468499 () Bool)

(assert (=> b!704680 (=> (not res!468499) (not e!397747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704680 (= res!468499 (not (validKeyInArray!0 (select (arr!19264 a!3591) from!2969))))))

(declare-fun b!704681 () Bool)

(declare-fun res!468492 () Bool)

(assert (=> b!704681 (=> (not res!468492) (not e!397747))))

(assert (=> b!704681 (= res!468492 (validKeyInArray!0 k0!2824))))

(declare-fun b!704682 () Bool)

(declare-fun res!468494 () Bool)

(assert (=> b!704682 (=> (not res!468494) (not e!397747))))

(declare-fun arrayContainsKey!0 (array!40215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704682 (= res!468494 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!704683 () Bool)

(declare-fun res!468497 () Bool)

(assert (=> b!704683 (=> (not res!468497) (not e!397747))))

(assert (=> b!704683 (= res!468497 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!704684 () Bool)

(declare-fun res!468501 () Bool)

(assert (=> b!704684 (=> (not res!468501) (not e!397747))))

(assert (=> b!704684 (= res!468501 (not (contains!3882 acc!652 k0!2824)))))

(declare-fun b!704685 () Bool)

(declare-fun res!468498 () Bool)

(assert (=> b!704685 (=> (not res!468498) (not e!397747))))

(assert (=> b!704685 (= res!468498 (not (contains!3882 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704686 () Bool)

(declare-fun res!468485 () Bool)

(assert (=> b!704686 (=> (not res!468485) (not e!397747))))

(assert (=> b!704686 (= res!468485 (not (contains!3882 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704687 () Bool)

(declare-fun res!468490 () Bool)

(assert (=> b!704687 (=> (not res!468490) (not e!397747))))

(assert (=> b!704687 (= res!468490 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19649 a!3591)))))

(declare-fun b!704688 () Bool)

(declare-fun res!468495 () Bool)

(assert (=> b!704688 (=> (not res!468495) (not e!397747))))

(declare-fun arrayNoDuplicates!0 (array!40215 (_ BitVec 32) List!13305) Bool)

(assert (=> b!704688 (= res!468495 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!704689 () Bool)

(assert (=> b!704689 (= e!397747 false)))

(declare-fun lt!317856 () Bool)

(assert (=> b!704689 (= lt!317856 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704690 () Bool)

(declare-fun res!468486 () Bool)

(assert (=> b!704690 (=> (not res!468486) (not e!397747))))

(assert (=> b!704690 (= res!468486 (noDuplicate!1129 acc!652))))

(declare-fun b!704691 () Bool)

(declare-fun res!468489 () Bool)

(assert (=> b!704691 (=> (not res!468489) (not e!397747))))

(assert (=> b!704691 (= res!468489 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(assert (= (and start!62536 res!468493) b!704690))

(assert (= (and b!704690 res!468486) b!704679))

(assert (= (and b!704679 res!468491) b!704686))

(assert (= (and b!704686 res!468485) b!704676))

(assert (= (and b!704676 res!468484) b!704682))

(assert (= (and b!704682 res!468494) b!704684))

(assert (= (and b!704684 res!468501) b!704681))

(assert (= (and b!704681 res!468492) b!704688))

(assert (= (and b!704688 res!468495) b!704677))

(assert (= (and b!704677 res!468488) b!704678))

(assert (= (and b!704678 res!468500) b!704675))

(assert (= (and b!704675 res!468496) b!704674))

(assert (= (and b!704674 res!468487) b!704685))

(assert (= (and b!704685 res!468498) b!704687))

(assert (= (and b!704687 res!468490) b!704680))

(assert (= (and b!704680 res!468499) b!704691))

(assert (= (and b!704691 res!468489) b!704683))

(assert (= (and b!704683 res!468497) b!704689))

(declare-fun m!663091 () Bool)

(assert (=> b!704683 m!663091))

(declare-fun m!663093 () Bool)

(assert (=> b!704681 m!663093))

(declare-fun m!663095 () Bool)

(assert (=> b!704677 m!663095))

(declare-fun m!663097 () Bool)

(assert (=> b!704675 m!663097))

(declare-fun m!663099 () Bool)

(assert (=> b!704682 m!663099))

(declare-fun m!663101 () Bool)

(assert (=> b!704676 m!663101))

(declare-fun m!663103 () Bool)

(assert (=> b!704679 m!663103))

(declare-fun m!663105 () Bool)

(assert (=> b!704688 m!663105))

(declare-fun m!663107 () Bool)

(assert (=> b!704689 m!663107))

(declare-fun m!663109 () Bool)

(assert (=> start!62536 m!663109))

(declare-fun m!663111 () Bool)

(assert (=> b!704684 m!663111))

(declare-fun m!663113 () Bool)

(assert (=> b!704685 m!663113))

(declare-fun m!663115 () Bool)

(assert (=> b!704686 m!663115))

(declare-fun m!663117 () Bool)

(assert (=> b!704680 m!663117))

(assert (=> b!704680 m!663117))

(declare-fun m!663119 () Bool)

(assert (=> b!704680 m!663119))

(declare-fun m!663121 () Bool)

(assert (=> b!704678 m!663121))

(declare-fun m!663123 () Bool)

(assert (=> b!704690 m!663123))

(declare-fun m!663125 () Bool)

(assert (=> b!704674 m!663125))

(check-sat (not b!704678) (not b!704682) (not b!704690) (not start!62536) (not b!704684) (not b!704688) (not b!704689) (not b!704674) (not b!704686) (not b!704677) (not b!704683) (not b!704679) (not b!704675) (not b!704680) (not b!704681) (not b!704685) (not b!704676))
(check-sat)
