; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63484 () Bool)

(assert start!63484)

(declare-fun res!477864 () Bool)

(declare-fun e!401622 () Bool)

(assert (=> start!63484 (=> (not res!477864) (not e!401622))))

(declare-datatypes ((array!40509 0))(
  ( (array!40510 (arr!19391 (Array (_ BitVec 32) (_ BitVec 64))) (size!19806 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40509)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63484 (= res!477864 (and (bvslt (size!19806 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19806 a!3591))))))

(assert (=> start!63484 e!401622))

(assert (=> start!63484 true))

(declare-fun array_inv!15274 (array!40509) Bool)

(assert (=> start!63484 (array_inv!15274 a!3591)))

(declare-fun b!714723 () Bool)

(declare-fun res!477868 () Bool)

(assert (=> b!714723 (=> (not res!477868) (not e!401622))))

(declare-datatypes ((List!13471 0))(
  ( (Nil!13468) (Cons!13467 (h!14512 (_ BitVec 64)) (t!19777 List!13471)) )
))
(declare-fun acc!652 () List!13471)

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3993 (List!13471 (_ BitVec 64)) Bool)

(assert (=> b!714723 (= res!477868 (not (contains!3993 acc!652 k0!2824)))))

(declare-fun b!714724 () Bool)

(declare-fun res!477873 () Bool)

(assert (=> b!714724 (=> (not res!477873) (not e!401622))))

(declare-fun newAcc!49 () List!13471)

(assert (=> b!714724 (= res!477873 (not (contains!3993 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714725 () Bool)

(declare-fun res!477861 () Bool)

(assert (=> b!714725 (=> (not res!477861) (not e!401622))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!714725 (= res!477861 (not (validKeyInArray!0 (select (arr!19391 a!3591) from!2969))))))

(declare-fun b!714726 () Bool)

(declare-fun res!477872 () Bool)

(assert (=> b!714726 (=> (not res!477872) (not e!401622))))

(assert (=> b!714726 (= res!477872 (not (contains!3993 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714727 () Bool)

(declare-fun res!477860 () Bool)

(assert (=> b!714727 (=> (not res!477860) (not e!401622))))

(declare-fun arrayContainsKey!0 (array!40509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!714727 (= res!477860 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!714728 () Bool)

(declare-fun res!477875 () Bool)

(assert (=> b!714728 (=> (not res!477875) (not e!401622))))

(declare-fun noDuplicate!1262 (List!13471) Bool)

(assert (=> b!714728 (= res!477875 (noDuplicate!1262 acc!652))))

(declare-fun b!714729 () Bool)

(declare-fun res!477869 () Bool)

(assert (=> b!714729 (=> (not res!477869) (not e!401622))))

(assert (=> b!714729 (= res!477869 (not (contains!3993 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714730 () Bool)

(declare-fun res!477862 () Bool)

(assert (=> b!714730 (=> (not res!477862) (not e!401622))))

(assert (=> b!714730 (= res!477862 (validKeyInArray!0 k0!2824))))

(declare-fun b!714731 () Bool)

(declare-fun res!477867 () Bool)

(assert (=> b!714731 (=> (not res!477867) (not e!401622))))

(assert (=> b!714731 (= res!477867 (contains!3993 newAcc!49 k0!2824))))

(declare-fun b!714732 () Bool)

(declare-fun res!477876 () Bool)

(assert (=> b!714732 (=> (not res!477876) (not e!401622))))

(assert (=> b!714732 (= res!477876 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19806 a!3591)))))

(declare-fun b!714733 () Bool)

(assert (=> b!714733 (= e!401622 false)))

(declare-fun lt!318563 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40509 (_ BitVec 32) List!13471) Bool)

(assert (=> b!714733 (= lt!318563 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!714734 () Bool)

(declare-fun res!477865 () Bool)

(assert (=> b!714734 (=> (not res!477865) (not e!401622))))

(assert (=> b!714734 (= res!477865 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!714735 () Bool)

(declare-fun res!477874 () Bool)

(assert (=> b!714735 (=> (not res!477874) (not e!401622))))

(assert (=> b!714735 (= res!477874 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!714736 () Bool)

(declare-fun res!477863 () Bool)

(assert (=> b!714736 (=> (not res!477863) (not e!401622))))

(assert (=> b!714736 (= res!477863 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!714737 () Bool)

(declare-fun res!477859 () Bool)

(assert (=> b!714737 (=> (not res!477859) (not e!401622))))

(declare-fun subseq!455 (List!13471 List!13471) Bool)

(assert (=> b!714737 (= res!477859 (subseq!455 acc!652 newAcc!49))))

(declare-fun b!714738 () Bool)

(declare-fun res!477866 () Bool)

(assert (=> b!714738 (=> (not res!477866) (not e!401622))))

(assert (=> b!714738 (= res!477866 (not (contains!3993 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714739 () Bool)

(declare-fun res!477870 () Bool)

(assert (=> b!714739 (=> (not res!477870) (not e!401622))))

(assert (=> b!714739 (= res!477870 (noDuplicate!1262 newAcc!49))))

(declare-fun b!714740 () Bool)

(declare-fun res!477871 () Bool)

(assert (=> b!714740 (=> (not res!477871) (not e!401622))))

(declare-fun -!420 (List!13471 (_ BitVec 64)) List!13471)

(assert (=> b!714740 (= res!477871 (= (-!420 newAcc!49 k0!2824) acc!652))))

(assert (= (and start!63484 res!477864) b!714728))

(assert (= (and b!714728 res!477875) b!714739))

(assert (= (and b!714739 res!477870) b!714729))

(assert (= (and b!714729 res!477869) b!714726))

(assert (= (and b!714726 res!477872) b!714727))

(assert (= (and b!714727 res!477860) b!714723))

(assert (= (and b!714723 res!477868) b!714730))

(assert (= (and b!714730 res!477862) b!714734))

(assert (= (and b!714734 res!477865) b!714737))

(assert (= (and b!714737 res!477859) b!714731))

(assert (= (and b!714731 res!477867) b!714740))

(assert (= (and b!714740 res!477871) b!714724))

(assert (= (and b!714724 res!477873) b!714738))

(assert (= (and b!714738 res!477866) b!714732))

(assert (= (and b!714732 res!477876) b!714725))

(assert (= (and b!714725 res!477861) b!714735))

(assert (= (and b!714735 res!477874) b!714736))

(assert (= (and b!714736 res!477863) b!714733))

(declare-fun m!670617 () Bool)

(assert (=> b!714737 m!670617))

(declare-fun m!670619 () Bool)

(assert (=> b!714726 m!670619))

(declare-fun m!670621 () Bool)

(assert (=> b!714729 m!670621))

(declare-fun m!670623 () Bool)

(assert (=> b!714736 m!670623))

(declare-fun m!670625 () Bool)

(assert (=> b!714730 m!670625))

(declare-fun m!670627 () Bool)

(assert (=> start!63484 m!670627))

(declare-fun m!670629 () Bool)

(assert (=> b!714731 m!670629))

(declare-fun m!670631 () Bool)

(assert (=> b!714738 m!670631))

(declare-fun m!670633 () Bool)

(assert (=> b!714728 m!670633))

(declare-fun m!670635 () Bool)

(assert (=> b!714739 m!670635))

(declare-fun m!670637 () Bool)

(assert (=> b!714740 m!670637))

(declare-fun m!670639 () Bool)

(assert (=> b!714724 m!670639))

(declare-fun m!670641 () Bool)

(assert (=> b!714733 m!670641))

(declare-fun m!670643 () Bool)

(assert (=> b!714727 m!670643))

(declare-fun m!670645 () Bool)

(assert (=> b!714734 m!670645))

(declare-fun m!670647 () Bool)

(assert (=> b!714723 m!670647))

(declare-fun m!670649 () Bool)

(assert (=> b!714725 m!670649))

(assert (=> b!714725 m!670649))

(declare-fun m!670651 () Bool)

(assert (=> b!714725 m!670651))

(check-sat (not b!714738) (not b!714734) (not b!714740) (not b!714736) (not b!714725) (not b!714731) (not b!714730) (not b!714739) (not b!714737) (not b!714724) (not b!714729) (not b!714733) (not b!714723) (not b!714727) (not b!714726) (not start!63484) (not b!714728))
(check-sat)
