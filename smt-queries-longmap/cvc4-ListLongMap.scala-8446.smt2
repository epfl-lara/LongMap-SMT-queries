; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102814 () Bool)

(assert start!102814)

(declare-fun b!1235681 () Bool)

(declare-fun res!823779 () Bool)

(declare-fun e!700542 () Bool)

(assert (=> b!1235681 (=> (not res!823779) (not e!700542))))

(declare-datatypes ((List!27210 0))(
  ( (Nil!27207) (Cons!27206 (h!28415 (_ BitVec 64)) (t!40673 List!27210)) )
))
(declare-fun acc!846 () List!27210)

(declare-fun contains!7272 (List!27210 (_ BitVec 64)) Bool)

(assert (=> b!1235681 (= res!823779 (not (contains!7272 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!823778 () Bool)

(assert (=> start!102814 (=> (not res!823778) (not e!700542))))

(declare-datatypes ((array!79659 0))(
  ( (array!79660 (arr!38437 (Array (_ BitVec 32) (_ BitVec 64))) (size!38973 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79659)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102814 (= res!823778 (and (bvslt (size!38973 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38973 a!3835))))))

(assert (=> start!102814 e!700542))

(declare-fun array_inv!29285 (array!79659) Bool)

(assert (=> start!102814 (array_inv!29285 a!3835)))

(assert (=> start!102814 true))

(declare-fun b!1235682 () Bool)

(declare-fun res!823780 () Bool)

(assert (=> b!1235682 (=> (not res!823780) (not e!700542))))

(assert (=> b!1235682 (= res!823780 (not (contains!7272 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235683 () Bool)

(declare-fun res!823776 () Bool)

(assert (=> b!1235683 (=> (not res!823776) (not e!700542))))

(assert (=> b!1235683 (= res!823776 (not (= from!3213 (bvsub (size!38973 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235684 () Bool)

(declare-datatypes ((Unit!40955 0))(
  ( (Unit!40956) )
))
(declare-fun e!700545 () Unit!40955)

(declare-fun lt!560436 () Unit!40955)

(assert (=> b!1235684 (= e!700545 lt!560436)))

(declare-fun lt!560437 () List!27210)

(assert (=> b!1235684 (= lt!560437 (Cons!27206 (select (arr!38437 a!3835) from!3213) acc!846))))

(declare-fun lt!560441 () Unit!40955)

(declare-fun lemmaListSubSeqRefl!0 (List!27210) Unit!40955)

(assert (=> b!1235684 (= lt!560441 (lemmaListSubSeqRefl!0 lt!560437))))

(declare-fun subseq!544 (List!27210 List!27210) Bool)

(assert (=> b!1235684 (subseq!544 lt!560437 lt!560437)))

(declare-fun lt!560439 () Unit!40955)

(declare-fun subseqTail!37 (List!27210 List!27210) Unit!40955)

(assert (=> b!1235684 (= lt!560439 (subseqTail!37 lt!560437 lt!560437))))

(assert (=> b!1235684 (subseq!544 acc!846 lt!560437)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79659 List!27210 List!27210 (_ BitVec 32)) Unit!40955)

(assert (=> b!1235684 (= lt!560436 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560437 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79659 (_ BitVec 32) List!27210) Bool)

(assert (=> b!1235684 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235685 () Bool)

(declare-fun res!823775 () Bool)

(assert (=> b!1235685 (=> (not res!823775) (not e!700542))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1235685 (= res!823775 (contains!7272 acc!846 k!2925))))

(declare-fun b!1235686 () Bool)

(declare-fun e!700544 () Bool)

(assert (=> b!1235686 (= e!700542 e!700544)))

(declare-fun res!823773 () Bool)

(assert (=> b!1235686 (=> (not res!823773) (not e!700544))))

(assert (=> b!1235686 (= res!823773 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38973 a!3835))))))

(declare-fun lt!560438 () Unit!40955)

(assert (=> b!1235686 (= lt!560438 e!700545)))

(declare-fun c!120814 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235686 (= c!120814 (validKeyInArray!0 (select (arr!38437 a!3835) from!3213)))))

(declare-fun b!1235687 () Bool)

(declare-fun res!823777 () Bool)

(assert (=> b!1235687 (=> (not res!823777) (not e!700542))))

(declare-fun noDuplicate!1869 (List!27210) Bool)

(assert (=> b!1235687 (= res!823777 (noDuplicate!1869 acc!846))))

(declare-fun b!1235688 () Bool)

(declare-fun Unit!40957 () Unit!40955)

(assert (=> b!1235688 (= e!700545 Unit!40957)))

(declare-fun b!1235689 () Bool)

(declare-fun res!823774 () Bool)

(assert (=> b!1235689 (=> (not res!823774) (not e!700542))))

(assert (=> b!1235689 (= res!823774 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235690 () Bool)

(assert (=> b!1235690 (= e!700544 false)))

(declare-fun lt!560440 () Bool)

(assert (=> b!1235690 (= lt!560440 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(assert (= (and start!102814 res!823778) b!1235687))

(assert (= (and b!1235687 res!823777) b!1235682))

(assert (= (and b!1235682 res!823780) b!1235681))

(assert (= (and b!1235681 res!823779) b!1235689))

(assert (= (and b!1235689 res!823774) b!1235685))

(assert (= (and b!1235685 res!823775) b!1235683))

(assert (= (and b!1235683 res!823776) b!1235686))

(assert (= (and b!1235686 c!120814) b!1235684))

(assert (= (and b!1235686 (not c!120814)) b!1235688))

(assert (= (and b!1235686 res!823773) b!1235690))

(declare-fun m!1139547 () Bool)

(assert (=> b!1235690 m!1139547))

(declare-fun m!1139549 () Bool)

(assert (=> b!1235681 m!1139549))

(declare-fun m!1139551 () Bool)

(assert (=> b!1235687 m!1139551))

(declare-fun m!1139553 () Bool)

(assert (=> b!1235689 m!1139553))

(declare-fun m!1139555 () Bool)

(assert (=> b!1235686 m!1139555))

(assert (=> b!1235686 m!1139555))

(declare-fun m!1139557 () Bool)

(assert (=> b!1235686 m!1139557))

(declare-fun m!1139559 () Bool)

(assert (=> b!1235684 m!1139559))

(declare-fun m!1139561 () Bool)

(assert (=> b!1235684 m!1139561))

(declare-fun m!1139563 () Bool)

(assert (=> b!1235684 m!1139563))

(assert (=> b!1235684 m!1139547))

(assert (=> b!1235684 m!1139555))

(declare-fun m!1139565 () Bool)

(assert (=> b!1235684 m!1139565))

(declare-fun m!1139567 () Bool)

(assert (=> b!1235684 m!1139567))

(declare-fun m!1139569 () Bool)

(assert (=> b!1235682 m!1139569))

(declare-fun m!1139571 () Bool)

(assert (=> start!102814 m!1139571))

(declare-fun m!1139573 () Bool)

(assert (=> b!1235685 m!1139573))

(push 1)

(assert (not b!1235684))

(assert (not b!1235687))

(assert (not b!1235690))

(assert (not b!1235685))

(assert (not b!1235682))

(assert (not b!1235681))

(assert (not start!102814))

(assert (not b!1235686))

