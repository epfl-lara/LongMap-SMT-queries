; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103030 () Bool)

(assert start!103030)

(declare-fun b!1236675 () Bool)

(declare-fun e!701273 () Bool)

(assert (=> b!1236675 (= e!701273 false)))

(declare-fun lt!560724 () Bool)

(declare-datatypes ((array!79673 0))(
  ( (array!79674 (arr!38438 (Array (_ BitVec 32) (_ BitVec 64))) (size!38975 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79673)

(declare-datatypes ((List!27224 0))(
  ( (Nil!27221) (Cons!27220 (h!28438 (_ BitVec 64)) (t!40679 List!27224)) )
))
(declare-fun acc!846 () List!27224)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79673 (_ BitVec 32) List!27224) Bool)

(assert (=> b!1236675 (= lt!560724 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1236676 () Bool)

(declare-datatypes ((Unit!40895 0))(
  ( (Unit!40896) )
))
(declare-fun e!701276 () Unit!40895)

(declare-fun lt!560729 () Unit!40895)

(assert (=> b!1236676 (= e!701276 lt!560729)))

(declare-fun lt!560726 () List!27224)

(assert (=> b!1236676 (= lt!560726 (Cons!27220 (select (arr!38438 a!3835) from!3213) acc!846))))

(declare-fun lt!560727 () Unit!40895)

(declare-fun lemmaListSubSeqRefl!0 (List!27224) Unit!40895)

(assert (=> b!1236676 (= lt!560727 (lemmaListSubSeqRefl!0 lt!560726))))

(declare-fun subseq!533 (List!27224 List!27224) Bool)

(assert (=> b!1236676 (subseq!533 lt!560726 lt!560726)))

(declare-fun lt!560728 () Unit!40895)

(declare-fun subseqTail!26 (List!27224 List!27224) Unit!40895)

(assert (=> b!1236676 (= lt!560728 (subseqTail!26 lt!560726 lt!560726))))

(assert (=> b!1236676 (subseq!533 acc!846 lt!560726)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79673 List!27224 List!27224 (_ BitVec 32)) Unit!40895)

(assert (=> b!1236676 (= lt!560729 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560726 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1236676 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1236677 () Bool)

(declare-fun res!824042 () Bool)

(declare-fun e!701274 () Bool)

(assert (=> b!1236677 (=> (not res!824042) (not e!701274))))

(assert (=> b!1236677 (= res!824042 (not (= from!3213 (bvsub (size!38975 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236678 () Bool)

(declare-fun Unit!40897 () Unit!40895)

(assert (=> b!1236678 (= e!701276 Unit!40897)))

(declare-fun b!1236679 () Bool)

(declare-fun res!824044 () Bool)

(assert (=> b!1236679 (=> (not res!824044) (not e!701274))))

(declare-fun contains!7295 (List!27224 (_ BitVec 64)) Bool)

(assert (=> b!1236679 (= res!824044 (not (contains!7295 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236680 () Bool)

(declare-fun res!824043 () Bool)

(assert (=> b!1236680 (=> (not res!824043) (not e!701274))))

(assert (=> b!1236680 (= res!824043 (not (contains!7295 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236681 () Bool)

(declare-fun res!824046 () Bool)

(assert (=> b!1236681 (=> (not res!824046) (not e!701274))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1236681 (= res!824046 (contains!7295 acc!846 k0!2925))))

(declare-fun res!824045 () Bool)

(assert (=> start!103030 (=> (not res!824045) (not e!701274))))

(assert (=> start!103030 (= res!824045 (and (bvslt (size!38975 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38975 a!3835))))))

(assert (=> start!103030 e!701274))

(declare-fun array_inv!29376 (array!79673) Bool)

(assert (=> start!103030 (array_inv!29376 a!3835)))

(assert (=> start!103030 true))

(declare-fun b!1236682 () Bool)

(declare-fun res!824048 () Bool)

(assert (=> b!1236682 (=> (not res!824048) (not e!701274))))

(declare-fun noDuplicate!1876 (List!27224) Bool)

(assert (=> b!1236682 (= res!824048 (noDuplicate!1876 acc!846))))

(declare-fun b!1236683 () Bool)

(assert (=> b!1236683 (= e!701274 e!701273)))

(declare-fun res!824049 () Bool)

(assert (=> b!1236683 (=> (not res!824049) (not e!701273))))

(assert (=> b!1236683 (= res!824049 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38975 a!3835))))))

(declare-fun lt!560725 () Unit!40895)

(assert (=> b!1236683 (= lt!560725 e!701276)))

(declare-fun c!121184 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236683 (= c!121184 (validKeyInArray!0 (select (arr!38438 a!3835) from!3213)))))

(declare-fun b!1236684 () Bool)

(declare-fun res!824047 () Bool)

(assert (=> b!1236684 (=> (not res!824047) (not e!701274))))

(assert (=> b!1236684 (= res!824047 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!103030 res!824045) b!1236682))

(assert (= (and b!1236682 res!824048) b!1236680))

(assert (= (and b!1236680 res!824043) b!1236679))

(assert (= (and b!1236679 res!824044) b!1236684))

(assert (= (and b!1236684 res!824047) b!1236681))

(assert (= (and b!1236681 res!824046) b!1236677))

(assert (= (and b!1236677 res!824042) b!1236683))

(assert (= (and b!1236683 c!121184) b!1236676))

(assert (= (and b!1236683 (not c!121184)) b!1236678))

(assert (= (and b!1236683 res!824049) b!1236675))

(declare-fun m!1140887 () Bool)

(assert (=> b!1236679 m!1140887))

(declare-fun m!1140889 () Bool)

(assert (=> b!1236683 m!1140889))

(assert (=> b!1236683 m!1140889))

(declare-fun m!1140891 () Bool)

(assert (=> b!1236683 m!1140891))

(declare-fun m!1140893 () Bool)

(assert (=> start!103030 m!1140893))

(declare-fun m!1140895 () Bool)

(assert (=> b!1236680 m!1140895))

(declare-fun m!1140897 () Bool)

(assert (=> b!1236681 m!1140897))

(declare-fun m!1140899 () Bool)

(assert (=> b!1236684 m!1140899))

(declare-fun m!1140901 () Bool)

(assert (=> b!1236675 m!1140901))

(declare-fun m!1140903 () Bool)

(assert (=> b!1236676 m!1140903))

(declare-fun m!1140905 () Bool)

(assert (=> b!1236676 m!1140905))

(assert (=> b!1236676 m!1140889))

(declare-fun m!1140907 () Bool)

(assert (=> b!1236676 m!1140907))

(declare-fun m!1140909 () Bool)

(assert (=> b!1236676 m!1140909))

(declare-fun m!1140911 () Bool)

(assert (=> b!1236676 m!1140911))

(assert (=> b!1236676 m!1140901))

(declare-fun m!1140913 () Bool)

(assert (=> b!1236682 m!1140913))

(check-sat (not b!1236679) (not b!1236682) (not b!1236681) (not b!1236675) (not b!1236676) (not b!1236683) (not start!103030) (not b!1236684) (not b!1236680))
(check-sat)
