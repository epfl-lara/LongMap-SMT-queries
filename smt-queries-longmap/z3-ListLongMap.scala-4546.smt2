; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63412 () Bool)

(assert start!63412)

(declare-fun b!713803 () Bool)

(declare-fun res!476765 () Bool)

(declare-fun e!401439 () Bool)

(assert (=> b!713803 (=> (not res!476765) (not e!401439))))

(declare-datatypes ((List!13311 0))(
  ( (Nil!13308) (Cons!13307 (h!14355 (_ BitVec 64)) (t!19618 List!13311)) )
))
(declare-fun acc!652 () List!13311)

(declare-fun contains!3963 (List!13311 (_ BitVec 64)) Bool)

(assert (=> b!713803 (= res!476765 (not (contains!3963 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!476773 () Bool)

(assert (=> start!63412 (=> (not res!476773) (not e!401439))))

(declare-datatypes ((array!40452 0))(
  ( (array!40453 (arr!19363 (Array (_ BitVec 32) (_ BitVec 64))) (size!19775 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40452)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!63412 (= res!476773 (and (bvslt (size!19775 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19775 a!3591))))))

(assert (=> start!63412 e!401439))

(assert (=> start!63412 true))

(declare-fun array_inv!15222 (array!40452) Bool)

(assert (=> start!63412 (array_inv!15222 a!3591)))

(declare-fun b!713804 () Bool)

(declare-fun res!476764 () Bool)

(assert (=> b!713804 (=> (not res!476764) (not e!401439))))

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!713804 (= res!476764 (not (contains!3963 acc!652 k0!2824)))))

(declare-fun b!713805 () Bool)

(declare-fun res!476770 () Bool)

(assert (=> b!713805 (=> (not res!476770) (not e!401439))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!713805 (= res!476770 (validKeyInArray!0 k0!2824))))

(declare-fun b!713806 () Bool)

(declare-fun res!476768 () Bool)

(assert (=> b!713806 (=> (not res!476768) (not e!401439))))

(declare-fun newAcc!49 () List!13311)

(declare-fun -!395 (List!13311 (_ BitVec 64)) List!13311)

(assert (=> b!713806 (= res!476768 (= (-!395 newAcc!49 k0!2824) acc!652))))

(declare-fun b!713807 () Bool)

(declare-fun res!476771 () Bool)

(assert (=> b!713807 (=> (not res!476771) (not e!401439))))

(assert (=> b!713807 (= res!476771 (contains!3963 newAcc!49 k0!2824))))

(declare-fun b!713808 () Bool)

(declare-fun res!476774 () Bool)

(assert (=> b!713808 (=> (not res!476774) (not e!401439))))

(declare-fun subseq!431 (List!13311 List!13311) Bool)

(assert (=> b!713808 (= res!476774 (subseq!431 acc!652 newAcc!49))))

(declare-fun b!713809 () Bool)

(declare-fun res!476775 () Bool)

(assert (=> b!713809 (=> (not res!476775) (not e!401439))))

(declare-fun arrayNoDuplicates!0 (array!40452 (_ BitVec 32) List!13311) Bool)

(assert (=> b!713809 (= res!476775 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!713810 () Bool)

(declare-fun res!476766 () Bool)

(assert (=> b!713810 (=> (not res!476766) (not e!401439))))

(declare-fun noDuplicate!1237 (List!13311) Bool)

(assert (=> b!713810 (= res!476766 (noDuplicate!1237 acc!652))))

(declare-fun b!713811 () Bool)

(declare-fun res!476769 () Bool)

(assert (=> b!713811 (=> (not res!476769) (not e!401439))))

(declare-fun arrayContainsKey!0 (array!40452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!713811 (= res!476769 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!713812 () Bool)

(declare-fun res!476767 () Bool)

(assert (=> b!713812 (=> (not res!476767) (not e!401439))))

(assert (=> b!713812 (= res!476767 (noDuplicate!1237 newAcc!49))))

(declare-fun b!713813 () Bool)

(declare-fun res!476772 () Bool)

(assert (=> b!713813 (=> (not res!476772) (not e!401439))))

(assert (=> b!713813 (= res!476772 (not (contains!3963 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713814 () Bool)

(declare-fun res!476776 () Bool)

(assert (=> b!713814 (=> (not res!476776) (not e!401439))))

(assert (=> b!713814 (= res!476776 (not (contains!3963 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!713815 () Bool)

(assert (=> b!713815 (= e!401439 false)))

(declare-fun lt!318813 () Bool)

(assert (=> b!713815 (= lt!318813 (contains!3963 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!63412 res!476773) b!713810))

(assert (= (and b!713810 res!476766) b!713812))

(assert (= (and b!713812 res!476767) b!713803))

(assert (= (and b!713803 res!476765) b!713813))

(assert (= (and b!713813 res!476772) b!713811))

(assert (= (and b!713811 res!476769) b!713804))

(assert (= (and b!713804 res!476764) b!713805))

(assert (= (and b!713805 res!476770) b!713809))

(assert (= (and b!713809 res!476775) b!713808))

(assert (= (and b!713808 res!476774) b!713807))

(assert (= (and b!713807 res!476771) b!713806))

(assert (= (and b!713806 res!476768) b!713814))

(assert (= (and b!713814 res!476776) b!713815))

(declare-fun m!671073 () Bool)

(assert (=> b!713811 m!671073))

(declare-fun m!671075 () Bool)

(assert (=> b!713813 m!671075))

(declare-fun m!671077 () Bool)

(assert (=> b!713808 m!671077))

(declare-fun m!671079 () Bool)

(assert (=> b!713812 m!671079))

(declare-fun m!671081 () Bool)

(assert (=> b!713807 m!671081))

(declare-fun m!671083 () Bool)

(assert (=> b!713809 m!671083))

(declare-fun m!671085 () Bool)

(assert (=> b!713805 m!671085))

(declare-fun m!671087 () Bool)

(assert (=> start!63412 m!671087))

(declare-fun m!671089 () Bool)

(assert (=> b!713806 m!671089))

(declare-fun m!671091 () Bool)

(assert (=> b!713803 m!671091))

(declare-fun m!671093 () Bool)

(assert (=> b!713810 m!671093))

(declare-fun m!671095 () Bool)

(assert (=> b!713814 m!671095))

(declare-fun m!671097 () Bool)

(assert (=> b!713804 m!671097))

(declare-fun m!671099 () Bool)

(assert (=> b!713815 m!671099))

(check-sat (not b!713806) (not b!713813) (not b!713810) (not b!713807) (not b!713814) (not b!713805) (not b!713803) (not b!713804) (not b!713808) (not start!63412) (not b!713815) (not b!713809) (not b!713812) (not b!713811))
(check-sat)
