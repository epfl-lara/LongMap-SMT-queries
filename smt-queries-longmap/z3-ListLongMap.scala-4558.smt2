; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63522 () Bool)

(assert start!63522)

(declare-fun b!715735 () Bool)

(declare-fun res!478706 () Bool)

(declare-fun e!401897 () Bool)

(assert (=> b!715735 (=> (not res!478706) (not e!401897))))

(declare-datatypes ((array!40536 0))(
  ( (array!40537 (arr!19405 (Array (_ BitVec 32) (_ BitVec 64))) (size!19821 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40536)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40536 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!715735 (= res!478706 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!715736 () Bool)

(declare-fun res!478705 () Bool)

(assert (=> b!715736 (=> (not res!478705) (not e!401897))))

(declare-datatypes ((List!13446 0))(
  ( (Nil!13443) (Cons!13442 (h!14487 (_ BitVec 64)) (t!19761 List!13446)) )
))
(declare-fun acc!652 () List!13446)

(declare-fun arrayNoDuplicates!0 (array!40536 (_ BitVec 32) List!13446) Bool)

(assert (=> b!715736 (= res!478705 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!715737 () Bool)

(declare-fun res!478710 () Bool)

(assert (=> b!715737 (=> (not res!478710) (not e!401897))))

(declare-fun newAcc!49 () List!13446)

(declare-fun contains!4023 (List!13446 (_ BitVec 64)) Bool)

(assert (=> b!715737 (= res!478710 (not (contains!4023 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715738 () Bool)

(assert (=> b!715738 (= e!401897 (bvsge (bvsub (size!19821 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) (bvsub (size!19821 a!3591) from!2969)))))

(declare-fun b!715739 () Bool)

(declare-fun res!478712 () Bool)

(assert (=> b!715739 (=> (not res!478712) (not e!401897))))

(declare-fun noDuplicate!1270 (List!13446) Bool)

(assert (=> b!715739 (= res!478712 (noDuplicate!1270 newAcc!49))))

(declare-fun b!715741 () Bool)

(declare-fun res!478722 () Bool)

(assert (=> b!715741 (=> (not res!478722) (not e!401897))))

(assert (=> b!715741 (= res!478722 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19821 a!3591)))))

(declare-fun b!715742 () Bool)

(declare-fun res!478721 () Bool)

(assert (=> b!715742 (=> (not res!478721) (not e!401897))))

(assert (=> b!715742 (= res!478721 (not (contains!4023 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715743 () Bool)

(declare-fun res!478719 () Bool)

(assert (=> b!715743 (=> (not res!478719) (not e!401897))))

(assert (=> b!715743 (= res!478719 (noDuplicate!1270 acc!652))))

(declare-fun b!715744 () Bool)

(declare-fun res!478707 () Bool)

(assert (=> b!715744 (=> (not res!478707) (not e!401897))))

(assert (=> b!715744 (= res!478707 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!715745 () Bool)

(declare-fun res!478714 () Bool)

(assert (=> b!715745 (=> (not res!478714) (not e!401897))))

(assert (=> b!715745 (= res!478714 (contains!4023 newAcc!49 k0!2824))))

(declare-fun b!715746 () Bool)

(declare-fun res!478708 () Bool)

(assert (=> b!715746 (=> (not res!478708) (not e!401897))))

(assert (=> b!715746 (= res!478708 (not (contains!4023 acc!652 k0!2824)))))

(declare-fun b!715740 () Bool)

(declare-fun res!478715 () Bool)

(assert (=> b!715740 (=> (not res!478715) (not e!401897))))

(assert (=> b!715740 (= res!478715 (not (contains!4023 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!478716 () Bool)

(assert (=> start!63522 (=> (not res!478716) (not e!401897))))

(assert (=> start!63522 (= res!478716 (and (bvslt (size!19821 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19821 a!3591))))))

(assert (=> start!63522 e!401897))

(assert (=> start!63522 true))

(declare-fun array_inv!15201 (array!40536) Bool)

(assert (=> start!63522 (array_inv!15201 a!3591)))

(declare-fun b!715747 () Bool)

(declare-fun res!478720 () Bool)

(assert (=> b!715747 (=> (not res!478720) (not e!401897))))

(declare-fun -!433 (List!13446 (_ BitVec 64)) List!13446)

(assert (=> b!715747 (= res!478720 (= (-!433 newAcc!49 k0!2824) acc!652))))

(declare-fun b!715748 () Bool)

(declare-fun res!478717 () Bool)

(assert (=> b!715748 (=> (not res!478717) (not e!401897))))

(assert (=> b!715748 (= res!478717 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!715749 () Bool)

(declare-fun res!478711 () Bool)

(assert (=> b!715749 (=> (not res!478711) (not e!401897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!715749 (= res!478711 (validKeyInArray!0 k0!2824))))

(declare-fun b!715750 () Bool)

(declare-fun res!478709 () Bool)

(assert (=> b!715750 (=> (not res!478709) (not e!401897))))

(assert (=> b!715750 (= res!478709 (not (validKeyInArray!0 (select (arr!19405 a!3591) from!2969))))))

(declare-fun b!715751 () Bool)

(declare-fun res!478723 () Bool)

(assert (=> b!715751 (=> (not res!478723) (not e!401897))))

(declare-fun subseq!468 (List!13446 List!13446) Bool)

(assert (=> b!715751 (= res!478723 (subseq!468 acc!652 newAcc!49))))

(declare-fun b!715752 () Bool)

(declare-fun res!478718 () Bool)

(assert (=> b!715752 (=> (not res!478718) (not e!401897))))

(assert (=> b!715752 (= res!478718 (not (contains!4023 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!715753 () Bool)

(declare-fun res!478713 () Bool)

(assert (=> b!715753 (=> (not res!478713) (not e!401897))))

(assert (=> b!715753 (= res!478713 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(assert (= (and start!63522 res!478716) b!715743))

(assert (= (and b!715743 res!478719) b!715739))

(assert (= (and b!715739 res!478712) b!715742))

(assert (= (and b!715742 res!478721) b!715740))

(assert (= (and b!715740 res!478715) b!715735))

(assert (= (and b!715735 res!478706) b!715746))

(assert (= (and b!715746 res!478708) b!715749))

(assert (= (and b!715749 res!478711) b!715748))

(assert (= (and b!715748 res!478717) b!715751))

(assert (= (and b!715751 res!478723) b!715745))

(assert (= (and b!715745 res!478714) b!715747))

(assert (= (and b!715747 res!478720) b!715752))

(assert (= (and b!715752 res!478718) b!715737))

(assert (= (and b!715737 res!478710) b!715741))

(assert (= (and b!715741 res!478722) b!715750))

(assert (= (and b!715750 res!478709) b!715753))

(assert (= (and b!715753 res!478713) b!715744))

(assert (= (and b!715744 res!478707) b!715736))

(assert (= (and b!715736 res!478705) b!715738))

(declare-fun m!671875 () Bool)

(assert (=> start!63522 m!671875))

(declare-fun m!671877 () Bool)

(assert (=> b!715745 m!671877))

(declare-fun m!671879 () Bool)

(assert (=> b!715750 m!671879))

(assert (=> b!715750 m!671879))

(declare-fun m!671881 () Bool)

(assert (=> b!715750 m!671881))

(declare-fun m!671883 () Bool)

(assert (=> b!715752 m!671883))

(declare-fun m!671885 () Bool)

(assert (=> b!715744 m!671885))

(declare-fun m!671887 () Bool)

(assert (=> b!715742 m!671887))

(declare-fun m!671889 () Bool)

(assert (=> b!715739 m!671889))

(declare-fun m!671891 () Bool)

(assert (=> b!715735 m!671891))

(declare-fun m!671893 () Bool)

(assert (=> b!715746 m!671893))

(declare-fun m!671895 () Bool)

(assert (=> b!715743 m!671895))

(declare-fun m!671897 () Bool)

(assert (=> b!715736 m!671897))

(declare-fun m!671899 () Bool)

(assert (=> b!715747 m!671899))

(declare-fun m!671901 () Bool)

(assert (=> b!715740 m!671901))

(declare-fun m!671903 () Bool)

(assert (=> b!715748 m!671903))

(declare-fun m!671905 () Bool)

(assert (=> b!715751 m!671905))

(declare-fun m!671907 () Bool)

(assert (=> b!715749 m!671907))

(declare-fun m!671909 () Bool)

(assert (=> b!715737 m!671909))

(check-sat (not b!715748) (not b!715744) (not b!715742) (not b!715737) (not b!715752) (not b!715749) (not b!715747) (not start!63522) (not b!715739) (not b!715743) (not b!715735) (not b!715746) (not b!715740) (not b!715745) (not b!715750) (not b!715736) (not b!715751))
(check-sat)
