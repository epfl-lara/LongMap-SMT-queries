; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103024 () Bool)

(assert start!103024)

(declare-fun b!1236571 () Bool)

(declare-fun res!823949 () Bool)

(declare-fun e!701244 () Bool)

(assert (=> b!1236571 (=> (not res!823949) (not e!701244))))

(declare-datatypes ((array!79667 0))(
  ( (array!79668 (arr!38435 (Array (_ BitVec 32) (_ BitVec 64))) (size!38972 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79667)

(declare-datatypes ((List!27221 0))(
  ( (Nil!27218) (Cons!27217 (h!28435 (_ BitVec 64)) (t!40676 List!27221)) )
))
(declare-fun acc!846 () List!27221)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79667 (_ BitVec 32) List!27221) Bool)

(assert (=> b!1236571 (= res!823949 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236572 () Bool)

(declare-fun e!701245 () Bool)

(assert (=> b!1236572 (= e!701244 (not e!701245))))

(declare-fun res!823946 () Bool)

(assert (=> b!1236572 (=> res!823946 e!701245)))

(assert (=> b!1236572 (= res!823946 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun lt!560681 () List!27221)

(declare-fun subseq!530 (List!27221 List!27221) Bool)

(assert (=> b!1236572 (subseq!530 acc!846 lt!560681)))

(declare-datatypes ((Unit!40889 0))(
  ( (Unit!40890) )
))
(declare-fun lt!560678 () Unit!40889)

(declare-fun subseqTail!23 (List!27221 List!27221) Unit!40889)

(assert (=> b!1236572 (= lt!560678 (subseqTail!23 lt!560681 lt!560681))))

(assert (=> b!1236572 (subseq!530 lt!560681 lt!560681)))

(declare-fun lt!560679 () Unit!40889)

(declare-fun lemmaListSubSeqRefl!0 (List!27221) Unit!40889)

(assert (=> b!1236572 (= lt!560679 (lemmaListSubSeqRefl!0 lt!560681))))

(assert (=> b!1236572 (= lt!560681 (Cons!27217 (select (arr!38435 a!3835) from!3213) acc!846))))

(declare-fun res!823947 () Bool)

(assert (=> start!103024 (=> (not res!823947) (not e!701244))))

(assert (=> start!103024 (= res!823947 (and (bvslt (size!38972 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38972 a!3835))))))

(assert (=> start!103024 e!701244))

(declare-fun array_inv!29373 (array!79667) Bool)

(assert (=> start!103024 (array_inv!29373 a!3835)))

(assert (=> start!103024 true))

(declare-fun b!1236573 () Bool)

(declare-fun res!823945 () Bool)

(assert (=> b!1236573 (=> (not res!823945) (not e!701244))))

(declare-fun contains!7292 (List!27221 (_ BitVec 64)) Bool)

(assert (=> b!1236573 (= res!823945 (not (contains!7292 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236574 () Bool)

(declare-fun res!823951 () Bool)

(assert (=> b!1236574 (=> (not res!823951) (not e!701244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236574 (= res!823951 (validKeyInArray!0 (select (arr!38435 a!3835) from!3213)))))

(declare-fun b!1236575 () Bool)

(declare-fun res!823953 () Bool)

(assert (=> b!1236575 (=> res!823953 e!701245)))

(assert (=> b!1236575 (= res!823953 (contains!7292 lt!560681 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1236576 () Bool)

(declare-fun res!823950 () Bool)

(assert (=> b!1236576 (=> (not res!823950) (not e!701244))))

(assert (=> b!1236576 (= res!823950 (not (contains!7292 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236577 () Bool)

(assert (=> b!1236577 (= e!701245 true)))

(declare-fun lt!560680 () Bool)

(assert (=> b!1236577 (= lt!560680 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560681))))

(declare-fun lt!560677 () Unit!40889)

(declare-fun noDuplicateSubseq!77 (List!27221 List!27221) Unit!40889)

(assert (=> b!1236577 (= lt!560677 (noDuplicateSubseq!77 acc!846 lt!560681))))

(declare-fun b!1236578 () Bool)

(declare-fun res!823952 () Bool)

(assert (=> b!1236578 (=> (not res!823952) (not e!701244))))

(assert (=> b!1236578 (= res!823952 (not (= from!3213 (bvsub (size!38972 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236579 () Bool)

(declare-fun res!823943 () Bool)

(assert (=> b!1236579 (=> (not res!823943) (not e!701244))))

(declare-fun noDuplicate!1873 (List!27221) Bool)

(assert (=> b!1236579 (= res!823943 (noDuplicate!1873 acc!846))))

(declare-fun b!1236580 () Bool)

(declare-fun res!823948 () Bool)

(assert (=> b!1236580 (=> res!823948 e!701245)))

(assert (=> b!1236580 (= res!823948 (contains!7292 lt!560681 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1236581 () Bool)

(declare-fun res!823944 () Bool)

(assert (=> b!1236581 (=> res!823944 e!701245)))

(assert (=> b!1236581 (= res!823944 (not (noDuplicate!1873 lt!560681)))))

(declare-fun b!1236582 () Bool)

(declare-fun res!823942 () Bool)

(assert (=> b!1236582 (=> (not res!823942) (not e!701244))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1236582 (= res!823942 (contains!7292 acc!846 k0!2925))))

(assert (= (and start!103024 res!823947) b!1236579))

(assert (= (and b!1236579 res!823943) b!1236576))

(assert (= (and b!1236576 res!823950) b!1236573))

(assert (= (and b!1236573 res!823945) b!1236571))

(assert (= (and b!1236571 res!823949) b!1236582))

(assert (= (and b!1236582 res!823942) b!1236578))

(assert (= (and b!1236578 res!823952) b!1236574))

(assert (= (and b!1236574 res!823951) b!1236572))

(assert (= (and b!1236572 (not res!823946)) b!1236581))

(assert (= (and b!1236581 (not res!823944)) b!1236580))

(assert (= (and b!1236580 (not res!823948)) b!1236575))

(assert (= (and b!1236575 (not res!823953)) b!1236577))

(declare-fun m!1140785 () Bool)

(assert (=> b!1236573 m!1140785))

(declare-fun m!1140787 () Bool)

(assert (=> b!1236580 m!1140787))

(declare-fun m!1140789 () Bool)

(assert (=> start!103024 m!1140789))

(declare-fun m!1140791 () Bool)

(assert (=> b!1236571 m!1140791))

(declare-fun m!1140793 () Bool)

(assert (=> b!1236581 m!1140793))

(declare-fun m!1140795 () Bool)

(assert (=> b!1236574 m!1140795))

(assert (=> b!1236574 m!1140795))

(declare-fun m!1140797 () Bool)

(assert (=> b!1236574 m!1140797))

(declare-fun m!1140799 () Bool)

(assert (=> b!1236582 m!1140799))

(declare-fun m!1140801 () Bool)

(assert (=> b!1236575 m!1140801))

(declare-fun m!1140803 () Bool)

(assert (=> b!1236579 m!1140803))

(declare-fun m!1140805 () Bool)

(assert (=> b!1236576 m!1140805))

(declare-fun m!1140807 () Bool)

(assert (=> b!1236572 m!1140807))

(declare-fun m!1140809 () Bool)

(assert (=> b!1236572 m!1140809))

(declare-fun m!1140811 () Bool)

(assert (=> b!1236572 m!1140811))

(declare-fun m!1140813 () Bool)

(assert (=> b!1236572 m!1140813))

(assert (=> b!1236572 m!1140795))

(declare-fun m!1140815 () Bool)

(assert (=> b!1236577 m!1140815))

(declare-fun m!1140817 () Bool)

(assert (=> b!1236577 m!1140817))

(check-sat (not b!1236576) (not b!1236577) (not b!1236575) (not b!1236574) (not start!103024) (not b!1236572) (not b!1236581) (not b!1236573) (not b!1236580) (not b!1236582) (not b!1236571) (not b!1236579))
(check-sat)
