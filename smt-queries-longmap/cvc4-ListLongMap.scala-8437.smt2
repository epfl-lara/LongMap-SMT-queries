; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102760 () Bool)

(assert start!102760)

(declare-fun b!1234779 () Bool)

(declare-fun e!700265 () Bool)

(assert (=> b!1234779 (= e!700265 true)))

(declare-fun lt!559999 () Bool)

(declare-datatypes ((array!79605 0))(
  ( (array!79606 (arr!38410 (Array (_ BitVec 32) (_ BitVec 64))) (size!38946 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79605)

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((List!27183 0))(
  ( (Nil!27180) (Cons!27179 (h!28388 (_ BitVec 64)) (t!40646 List!27183)) )
))
(declare-fun lt!559997 () List!27183)

(declare-fun arrayNoDuplicates!0 (array!79605 (_ BitVec 32) List!27183) Bool)

(assert (=> b!1234779 (= lt!559999 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!559997))))

(declare-datatypes ((Unit!40890 0))(
  ( (Unit!40891) )
))
(declare-fun lt!559998 () Unit!40890)

(declare-fun acc!846 () List!27183)

(declare-fun noDuplicateSubseq!64 (List!27183 List!27183) Unit!40890)

(assert (=> b!1234779 (= lt!559998 (noDuplicateSubseq!64 acc!846 lt!559997))))

(declare-fun b!1234780 () Bool)

(declare-fun res!822952 () Bool)

(assert (=> b!1234780 (=> res!822952 e!700265)))

(declare-fun noDuplicate!1842 (List!27183) Bool)

(assert (=> b!1234780 (= res!822952 (not (noDuplicate!1842 lt!559997)))))

(declare-fun b!1234781 () Bool)

(declare-fun res!822951 () Bool)

(declare-fun e!700266 () Bool)

(assert (=> b!1234781 (=> (not res!822951) (not e!700266))))

(assert (=> b!1234781 (= res!822951 (noDuplicate!1842 acc!846))))

(declare-fun b!1234782 () Bool)

(declare-fun res!822945 () Bool)

(assert (=> b!1234782 (=> (not res!822945) (not e!700266))))

(declare-fun contains!7245 (List!27183 (_ BitVec 64)) Bool)

(assert (=> b!1234782 (= res!822945 (not (contains!7245 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234783 () Bool)

(declare-fun res!822941 () Bool)

(assert (=> b!1234783 (=> res!822941 e!700265)))

(assert (=> b!1234783 (= res!822941 (contains!7245 lt!559997 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!822942 () Bool)

(assert (=> start!102760 (=> (not res!822942) (not e!700266))))

(assert (=> start!102760 (= res!822942 (and (bvslt (size!38946 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38946 a!3835))))))

(assert (=> start!102760 e!700266))

(declare-fun array_inv!29258 (array!79605) Bool)

(assert (=> start!102760 (array_inv!29258 a!3835)))

(assert (=> start!102760 true))

(declare-fun b!1234784 () Bool)

(assert (=> b!1234784 (= e!700266 (not e!700265))))

(declare-fun res!822944 () Bool)

(assert (=> b!1234784 (=> res!822944 e!700265)))

(assert (=> b!1234784 (= res!822944 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!517 (List!27183 List!27183) Bool)

(assert (=> b!1234784 (subseq!517 acc!846 lt!559997)))

(declare-fun lt!559996 () Unit!40890)

(declare-fun subseqTail!10 (List!27183 List!27183) Unit!40890)

(assert (=> b!1234784 (= lt!559996 (subseqTail!10 lt!559997 lt!559997))))

(assert (=> b!1234784 (subseq!517 lt!559997 lt!559997)))

(declare-fun lt!560000 () Unit!40890)

(declare-fun lemmaListSubSeqRefl!0 (List!27183) Unit!40890)

(assert (=> b!1234784 (= lt!560000 (lemmaListSubSeqRefl!0 lt!559997))))

(assert (=> b!1234784 (= lt!559997 (Cons!27179 (select (arr!38410 a!3835) from!3213) acc!846))))

(declare-fun b!1234785 () Bool)

(declare-fun res!822948 () Bool)

(assert (=> b!1234785 (=> (not res!822948) (not e!700266))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1234785 (= res!822948 (contains!7245 acc!846 k!2925))))

(declare-fun b!1234786 () Bool)

(declare-fun res!822946 () Bool)

(assert (=> b!1234786 (=> res!822946 e!700265)))

(assert (=> b!1234786 (= res!822946 (contains!7245 lt!559997 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234787 () Bool)

(declare-fun res!822947 () Bool)

(assert (=> b!1234787 (=> (not res!822947) (not e!700266))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234787 (= res!822947 (validKeyInArray!0 (select (arr!38410 a!3835) from!3213)))))

(declare-fun b!1234788 () Bool)

(declare-fun res!822943 () Bool)

(assert (=> b!1234788 (=> (not res!822943) (not e!700266))))

(assert (=> b!1234788 (= res!822943 (not (= from!3213 (bvsub (size!38946 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1234789 () Bool)

(declare-fun res!822950 () Bool)

(assert (=> b!1234789 (=> (not res!822950) (not e!700266))))

(assert (=> b!1234789 (= res!822950 (not (contains!7245 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234790 () Bool)

(declare-fun res!822949 () Bool)

(assert (=> b!1234790 (=> (not res!822949) (not e!700266))))

(assert (=> b!1234790 (= res!822949 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!102760 res!822942) b!1234781))

(assert (= (and b!1234781 res!822951) b!1234789))

(assert (= (and b!1234789 res!822950) b!1234782))

(assert (= (and b!1234782 res!822945) b!1234790))

(assert (= (and b!1234790 res!822949) b!1234785))

(assert (= (and b!1234785 res!822948) b!1234788))

(assert (= (and b!1234788 res!822943) b!1234787))

(assert (= (and b!1234787 res!822947) b!1234784))

(assert (= (and b!1234784 (not res!822944)) b!1234780))

(assert (= (and b!1234780 (not res!822952)) b!1234783))

(assert (= (and b!1234783 (not res!822941)) b!1234786))

(assert (= (and b!1234786 (not res!822946)) b!1234779))

(declare-fun m!1138695 () Bool)

(assert (=> b!1234787 m!1138695))

(assert (=> b!1234787 m!1138695))

(declare-fun m!1138697 () Bool)

(assert (=> b!1234787 m!1138697))

(declare-fun m!1138699 () Bool)

(assert (=> b!1234781 m!1138699))

(declare-fun m!1138701 () Bool)

(assert (=> b!1234779 m!1138701))

(declare-fun m!1138703 () Bool)

(assert (=> b!1234779 m!1138703))

(declare-fun m!1138705 () Bool)

(assert (=> b!1234790 m!1138705))

(declare-fun m!1138707 () Bool)

(assert (=> start!102760 m!1138707))

(declare-fun m!1138709 () Bool)

(assert (=> b!1234780 m!1138709))

(declare-fun m!1138711 () Bool)

(assert (=> b!1234785 m!1138711))

(declare-fun m!1138713 () Bool)

(assert (=> b!1234786 m!1138713))

(declare-fun m!1138715 () Bool)

(assert (=> b!1234789 m!1138715))

(declare-fun m!1138717 () Bool)

(assert (=> b!1234782 m!1138717))

(declare-fun m!1138719 () Bool)

(assert (=> b!1234783 m!1138719))

(declare-fun m!1138721 () Bool)

(assert (=> b!1234784 m!1138721))

(declare-fun m!1138723 () Bool)

(assert (=> b!1234784 m!1138723))

(declare-fun m!1138725 () Bool)

(assert (=> b!1234784 m!1138725))

(assert (=> b!1234784 m!1138695))

(declare-fun m!1138727 () Bool)

(assert (=> b!1234784 m!1138727))

(push 1)

(assert (not b!1234785))

(assert (not start!102760))

(assert (not b!1234780))

(assert (not b!1234781))

(assert (not b!1234786))

(assert (not b!1234787))

(assert (not b!1234790))

(assert (not b!1234783))

(assert (not b!1234782))

(assert (not b!1234779))

(assert (not b!1234784))

(assert (not b!1234789))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

