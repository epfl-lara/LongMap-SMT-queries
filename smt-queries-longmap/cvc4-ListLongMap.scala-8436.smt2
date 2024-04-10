; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102754 () Bool)

(assert start!102754)

(declare-fun b!1234671 () Bool)

(declare-fun res!822834 () Bool)

(declare-fun e!700239 () Bool)

(assert (=> b!1234671 (=> (not res!822834) (not e!700239))))

(declare-datatypes ((List!27180 0))(
  ( (Nil!27177) (Cons!27176 (h!28385 (_ BitVec 64)) (t!40643 List!27180)) )
))
(declare-fun acc!846 () List!27180)

(declare-fun noDuplicate!1839 (List!27180) Bool)

(assert (=> b!1234671 (= res!822834 (noDuplicate!1839 acc!846))))

(declare-fun b!1234672 () Bool)

(declare-fun res!822835 () Bool)

(assert (=> b!1234672 (=> (not res!822835) (not e!700239))))

(declare-fun contains!7242 (List!27180 (_ BitVec 64)) Bool)

(assert (=> b!1234672 (= res!822835 (not (contains!7242 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234673 () Bool)

(declare-fun e!700238 () Bool)

(assert (=> b!1234673 (= e!700238 true)))

(declare-datatypes ((array!79599 0))(
  ( (array!79600 (arr!38407 (Array (_ BitVec 32) (_ BitVec 64))) (size!38943 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79599)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun lt!559951 () List!27180)

(declare-fun lt!559954 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79599 (_ BitVec 32) List!27180) Bool)

(assert (=> b!1234673 (= lt!559954 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!559951))))

(declare-datatypes ((Unit!40884 0))(
  ( (Unit!40885) )
))
(declare-fun lt!559955 () Unit!40884)

(declare-fun noDuplicateSubseq!61 (List!27180 List!27180) Unit!40884)

(assert (=> b!1234673 (= lt!559955 (noDuplicateSubseq!61 acc!846 lt!559951))))

(declare-fun res!822839 () Bool)

(assert (=> start!102754 (=> (not res!822839) (not e!700239))))

(assert (=> start!102754 (= res!822839 (and (bvslt (size!38943 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38943 a!3835))))))

(assert (=> start!102754 e!700239))

(declare-fun array_inv!29255 (array!79599) Bool)

(assert (=> start!102754 (array_inv!29255 a!3835)))

(assert (=> start!102754 true))

(declare-fun b!1234674 () Bool)

(declare-fun res!822840 () Bool)

(assert (=> b!1234674 (=> (not res!822840) (not e!700239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234674 (= res!822840 (validKeyInArray!0 (select (arr!38407 a!3835) from!3213)))))

(declare-fun b!1234675 () Bool)

(declare-fun res!822843 () Bool)

(assert (=> b!1234675 (=> res!822843 e!700238)))

(assert (=> b!1234675 (= res!822843 (contains!7242 lt!559951 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234676 () Bool)

(declare-fun res!822833 () Bool)

(assert (=> b!1234676 (=> (not res!822833) (not e!700239))))

(assert (=> b!1234676 (= res!822833 (not (contains!7242 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234677 () Bool)

(assert (=> b!1234677 (= e!700239 (not e!700238))))

(declare-fun res!822841 () Bool)

(assert (=> b!1234677 (=> res!822841 e!700238)))

(assert (=> b!1234677 (= res!822841 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!514 (List!27180 List!27180) Bool)

(assert (=> b!1234677 (subseq!514 acc!846 lt!559951)))

(declare-fun lt!559952 () Unit!40884)

(declare-fun subseqTail!7 (List!27180 List!27180) Unit!40884)

(assert (=> b!1234677 (= lt!559952 (subseqTail!7 lt!559951 lt!559951))))

(assert (=> b!1234677 (subseq!514 lt!559951 lt!559951)))

(declare-fun lt!559953 () Unit!40884)

(declare-fun lemmaListSubSeqRefl!0 (List!27180) Unit!40884)

(assert (=> b!1234677 (= lt!559953 (lemmaListSubSeqRefl!0 lt!559951))))

(assert (=> b!1234677 (= lt!559951 (Cons!27176 (select (arr!38407 a!3835) from!3213) acc!846))))

(declare-fun b!1234678 () Bool)

(declare-fun res!822837 () Bool)

(assert (=> b!1234678 (=> (not res!822837) (not e!700239))))

(assert (=> b!1234678 (= res!822837 (not (= from!3213 (bvsub (size!38943 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1234679 () Bool)

(declare-fun res!822838 () Bool)

(assert (=> b!1234679 (=> res!822838 e!700238)))

(assert (=> b!1234679 (= res!822838 (contains!7242 lt!559951 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234680 () Bool)

(declare-fun res!822844 () Bool)

(assert (=> b!1234680 (=> res!822844 e!700238)))

(assert (=> b!1234680 (= res!822844 (not (noDuplicate!1839 lt!559951)))))

(declare-fun b!1234681 () Bool)

(declare-fun res!822836 () Bool)

(assert (=> b!1234681 (=> (not res!822836) (not e!700239))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1234681 (= res!822836 (contains!7242 acc!846 k!2925))))

(declare-fun b!1234682 () Bool)

(declare-fun res!822842 () Bool)

(assert (=> b!1234682 (=> (not res!822842) (not e!700239))))

(assert (=> b!1234682 (= res!822842 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!102754 res!822839) b!1234671))

(assert (= (and b!1234671 res!822834) b!1234672))

(assert (= (and b!1234672 res!822835) b!1234676))

(assert (= (and b!1234676 res!822833) b!1234682))

(assert (= (and b!1234682 res!822842) b!1234681))

(assert (= (and b!1234681 res!822836) b!1234678))

(assert (= (and b!1234678 res!822837) b!1234674))

(assert (= (and b!1234674 res!822840) b!1234677))

(assert (= (and b!1234677 (not res!822841)) b!1234680))

(assert (= (and b!1234680 (not res!822844)) b!1234675))

(assert (= (and b!1234675 (not res!822843)) b!1234679))

(assert (= (and b!1234679 (not res!822838)) b!1234673))

(declare-fun m!1138593 () Bool)

(assert (=> start!102754 m!1138593))

(declare-fun m!1138595 () Bool)

(assert (=> b!1234682 m!1138595))

(declare-fun m!1138597 () Bool)

(assert (=> b!1234676 m!1138597))

(declare-fun m!1138599 () Bool)

(assert (=> b!1234675 m!1138599))

(declare-fun m!1138601 () Bool)

(assert (=> b!1234677 m!1138601))

(declare-fun m!1138603 () Bool)

(assert (=> b!1234677 m!1138603))

(declare-fun m!1138605 () Bool)

(assert (=> b!1234677 m!1138605))

(declare-fun m!1138607 () Bool)

(assert (=> b!1234677 m!1138607))

(declare-fun m!1138609 () Bool)

(assert (=> b!1234677 m!1138609))

(declare-fun m!1138611 () Bool)

(assert (=> b!1234680 m!1138611))

(declare-fun m!1138613 () Bool)

(assert (=> b!1234671 m!1138613))

(declare-fun m!1138615 () Bool)

(assert (=> b!1234679 m!1138615))

(assert (=> b!1234674 m!1138607))

(assert (=> b!1234674 m!1138607))

(declare-fun m!1138617 () Bool)

(assert (=> b!1234674 m!1138617))

(declare-fun m!1138619 () Bool)

(assert (=> b!1234672 m!1138619))

(declare-fun m!1138621 () Bool)

(assert (=> b!1234681 m!1138621))

(declare-fun m!1138623 () Bool)

(assert (=> b!1234673 m!1138623))

(declare-fun m!1138625 () Bool)

(assert (=> b!1234673 m!1138625))

(push 1)

(assert (not b!1234682))

(assert (not b!1234672))

(assert (not b!1234674))

(assert (not b!1234680))

(assert (not start!102754))

(assert (not b!1234679))

(assert (not b!1234673))

(assert (not b!1234676))

(assert (not b!1234671))

(assert (not b!1234677))

(assert (not b!1234681))

(assert (not b!1234675))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

