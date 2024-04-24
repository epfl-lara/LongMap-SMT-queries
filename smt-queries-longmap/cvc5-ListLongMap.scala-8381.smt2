; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102202 () Bool)

(assert start!102202)

(declare-fun b!1228807 () Bool)

(declare-fun e!697833 () Bool)

(declare-fun e!697834 () Bool)

(assert (=> b!1228807 (= e!697833 (not e!697834))))

(declare-fun res!816650 () Bool)

(assert (=> b!1228807 (=> res!816650 e!697834)))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79275 0))(
  ( (array!79276 (arr!38254 (Array (_ BitVec 32) (_ BitVec 64))) (size!38791 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79275)

(assert (=> b!1228807 (= res!816650 (bvsgt from!3184 (size!38791 a!3806)))))

(declare-datatypes ((List!27040 0))(
  ( (Nil!27037) (Cons!27036 (h!28254 (_ BitVec 64)) (t!40495 List!27040)) )
))
(declare-fun acc!823 () List!27040)

(declare-fun arrayNoDuplicates!0 (array!79275 (_ BitVec 32) List!27040) Bool)

(assert (=> b!1228807 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27036 (select (arr!38254 a!3806) from!3184) acc!823))))

(declare-fun b!1228808 () Bool)

(declare-fun res!816639 () Bool)

(assert (=> b!1228808 (=> (not res!816639) (not e!697833))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228808 (= res!816639 (validKeyInArray!0 k!2913))))

(declare-fun res!816638 () Bool)

(assert (=> start!102202 (=> (not res!816638) (not e!697833))))

(assert (=> start!102202 (= res!816638 (bvslt (size!38791 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102202 e!697833))

(declare-fun array_inv!29192 (array!79275) Bool)

(assert (=> start!102202 (array_inv!29192 a!3806)))

(assert (=> start!102202 true))

(declare-fun b!1228809 () Bool)

(declare-fun res!816643 () Bool)

(assert (=> b!1228809 (=> (not res!816643) (not e!697833))))

(assert (=> b!1228809 (= res!816643 (validKeyInArray!0 (select (arr!38254 a!3806) from!3184)))))

(declare-fun b!1228810 () Bool)

(assert (=> b!1228810 (= e!697834 true)))

(declare-datatypes ((Unit!40623 0))(
  ( (Unit!40624) )
))
(declare-fun lt!559401 () Unit!40623)

(declare-fun noDuplicateSubseq!34 (List!27040 List!27040) Unit!40623)

(assert (=> b!1228810 (= lt!559401 (noDuplicateSubseq!34 Nil!27037 acc!823))))

(declare-fun b!1228811 () Bool)

(declare-fun res!816640 () Bool)

(assert (=> b!1228811 (=> res!816640 e!697834)))

(declare-fun contains!7111 (List!27040 (_ BitVec 64)) Bool)

(assert (=> b!1228811 (= res!816640 (contains!7111 Nil!27037 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228812 () Bool)

(declare-fun res!816644 () Bool)

(assert (=> b!1228812 (=> (not res!816644) (not e!697833))))

(assert (=> b!1228812 (= res!816644 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228813 () Bool)

(declare-fun res!816647 () Bool)

(assert (=> b!1228813 (=> (not res!816647) (not e!697833))))

(declare-fun noDuplicate!1692 (List!27040) Bool)

(assert (=> b!1228813 (= res!816647 (noDuplicate!1692 acc!823))))

(declare-fun b!1228814 () Bool)

(declare-fun res!816648 () Bool)

(assert (=> b!1228814 (=> res!816648 e!697834)))

(declare-fun subseq!481 (List!27040 List!27040) Bool)

(assert (=> b!1228814 (= res!816648 (not (subseq!481 Nil!27037 acc!823)))))

(declare-fun b!1228815 () Bool)

(declare-fun res!816641 () Bool)

(assert (=> b!1228815 (=> (not res!816641) (not e!697833))))

(assert (=> b!1228815 (= res!816641 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38791 a!3806)) (bvslt from!3184 (size!38791 a!3806))))))

(declare-fun b!1228816 () Bool)

(declare-fun res!816646 () Bool)

(assert (=> b!1228816 (=> (not res!816646) (not e!697833))))

(assert (=> b!1228816 (= res!816646 (not (contains!7111 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228817 () Bool)

(declare-fun res!816649 () Bool)

(assert (=> b!1228817 (=> res!816649 e!697834)))

(assert (=> b!1228817 (= res!816649 (contains!7111 Nil!27037 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228818 () Bool)

(declare-fun res!816642 () Bool)

(assert (=> b!1228818 (=> (not res!816642) (not e!697833))))

(declare-fun arrayContainsKey!0 (array!79275 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228818 (= res!816642 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228819 () Bool)

(declare-fun res!816645 () Bool)

(assert (=> b!1228819 (=> (not res!816645) (not e!697833))))

(assert (=> b!1228819 (= res!816645 (not (contains!7111 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102202 res!816638) b!1228808))

(assert (= (and b!1228808 res!816639) b!1228815))

(assert (= (and b!1228815 res!816641) b!1228813))

(assert (= (and b!1228813 res!816647) b!1228816))

(assert (= (and b!1228816 res!816646) b!1228819))

(assert (= (and b!1228819 res!816645) b!1228818))

(assert (= (and b!1228818 res!816642) b!1228812))

(assert (= (and b!1228812 res!816644) b!1228809))

(assert (= (and b!1228809 res!816643) b!1228807))

(assert (= (and b!1228807 (not res!816650)) b!1228811))

(assert (= (and b!1228811 (not res!816640)) b!1228817))

(assert (= (and b!1228817 (not res!816649)) b!1228814))

(assert (= (and b!1228814 (not res!816648)) b!1228810))

(declare-fun m!1133873 () Bool)

(assert (=> b!1228814 m!1133873))

(declare-fun m!1133875 () Bool)

(assert (=> b!1228810 m!1133875))

(declare-fun m!1133877 () Bool)

(assert (=> b!1228812 m!1133877))

(declare-fun m!1133879 () Bool)

(assert (=> b!1228808 m!1133879))

(declare-fun m!1133881 () Bool)

(assert (=> b!1228813 m!1133881))

(declare-fun m!1133883 () Bool)

(assert (=> b!1228809 m!1133883))

(assert (=> b!1228809 m!1133883))

(declare-fun m!1133885 () Bool)

(assert (=> b!1228809 m!1133885))

(assert (=> b!1228807 m!1133883))

(declare-fun m!1133887 () Bool)

(assert (=> b!1228807 m!1133887))

(declare-fun m!1133889 () Bool)

(assert (=> b!1228816 m!1133889))

(declare-fun m!1133891 () Bool)

(assert (=> b!1228811 m!1133891))

(declare-fun m!1133893 () Bool)

(assert (=> b!1228817 m!1133893))

(declare-fun m!1133895 () Bool)

(assert (=> b!1228818 m!1133895))

(declare-fun m!1133897 () Bool)

(assert (=> b!1228819 m!1133897))

(declare-fun m!1133899 () Bool)

(assert (=> start!102202 m!1133899))

(push 1)

(assert (not b!1228811))

(assert (not b!1228818))

(assert (not start!102202))

(assert (not b!1228814))

(assert (not b!1228817))

(assert (not b!1228813))

(assert (not b!1228812))

(assert (not b!1228816))

(assert (not b!1228808))

(assert (not b!1228807))

(assert (not b!1228819))

(assert (not b!1228810))

(assert (not b!1228809))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

