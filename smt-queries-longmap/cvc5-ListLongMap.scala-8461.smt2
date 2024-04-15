; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102902 () Bool)

(assert start!102902)

(declare-fun b!1236677 () Bool)

(declare-fun res!824701 () Bool)

(declare-fun e!700888 () Bool)

(assert (=> b!1236677 (=> (not res!824701) (not e!700888))))

(declare-datatypes ((array!79670 0))(
  ( (array!79671 (arr!38443 (Array (_ BitVec 32) (_ BitVec 64))) (size!38981 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79670)

(declare-datatypes ((List!27317 0))(
  ( (Nil!27314) (Cons!27313 (h!28522 (_ BitVec 64)) (t!40771 List!27317)) )
))
(declare-fun acc!846 () List!27317)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79670 (_ BitVec 32) List!27317) Bool)

(assert (=> b!1236677 (= res!824701 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236678 () Bool)

(declare-fun res!824700 () Bool)

(assert (=> b!1236678 (=> (not res!824700) (not e!700888))))

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7289 (List!27317 (_ BitVec 64)) Bool)

(assert (=> b!1236678 (= res!824700 (contains!7289 acc!846 k!2925))))

(declare-fun res!824698 () Bool)

(assert (=> start!102902 (=> (not res!824698) (not e!700888))))

(assert (=> start!102902 (= res!824698 (and (bvslt (size!38981 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38981 a!3835))))))

(assert (=> start!102902 e!700888))

(declare-fun array_inv!29426 (array!79670) Bool)

(assert (=> start!102902 (array_inv!29426 a!3835)))

(assert (=> start!102902 true))

(declare-fun b!1236679 () Bool)

(declare-fun res!824699 () Bool)

(assert (=> b!1236679 (=> (not res!824699) (not e!700888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236679 (= res!824699 (validKeyInArray!0 (select (arr!38443 a!3835) from!3213)))))

(declare-fun b!1236680 () Bool)

(declare-fun res!824702 () Bool)

(assert (=> b!1236680 (=> (not res!824702) (not e!700888))))

(assert (=> b!1236680 (= res!824702 (not (= from!3213 (bvsub (size!38981 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236681 () Bool)

(declare-fun res!824696 () Bool)

(assert (=> b!1236681 (=> (not res!824696) (not e!700888))))

(assert (=> b!1236681 (= res!824696 (not (contains!7289 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236682 () Bool)

(declare-fun res!824697 () Bool)

(assert (=> b!1236682 (=> (not res!824697) (not e!700888))))

(assert (=> b!1236682 (= res!824697 (not (contains!7289 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236683 () Bool)

(declare-fun res!824695 () Bool)

(assert (=> b!1236683 (=> (not res!824695) (not e!700888))))

(declare-fun noDuplicate!1932 (List!27317) Bool)

(assert (=> b!1236683 (= res!824695 (noDuplicate!1932 acc!846))))

(declare-fun b!1236684 () Bool)

(assert (=> b!1236684 (= e!700888 (not true))))

(declare-datatypes ((Unit!40875 0))(
  ( (Unit!40876) )
))
(declare-fun lt!560698 () Unit!40875)

(declare-fun lt!560699 () List!27317)

(declare-fun subseqTail!58 (List!27317 List!27317) Unit!40875)

(assert (=> b!1236684 (= lt!560698 (subseqTail!58 lt!560699 lt!560699))))

(declare-fun subseq!571 (List!27317 List!27317) Bool)

(assert (=> b!1236684 (subseq!571 lt!560699 lt!560699)))

(declare-fun lt!560697 () Unit!40875)

(declare-fun lemmaListSubSeqRefl!0 (List!27317) Unit!40875)

(assert (=> b!1236684 (= lt!560697 (lemmaListSubSeqRefl!0 lt!560699))))

(assert (=> b!1236684 (= lt!560699 (Cons!27313 (select (arr!38443 a!3835) from!3213) acc!846))))

(assert (= (and start!102902 res!824698) b!1236683))

(assert (= (and b!1236683 res!824695) b!1236682))

(assert (= (and b!1236682 res!824697) b!1236681))

(assert (= (and b!1236681 res!824696) b!1236677))

(assert (= (and b!1236677 res!824701) b!1236678))

(assert (= (and b!1236678 res!824700) b!1236680))

(assert (= (and b!1236680 res!824702) b!1236679))

(assert (= (and b!1236679 res!824699) b!1236684))

(declare-fun m!1139999 () Bool)

(assert (=> b!1236682 m!1139999))

(declare-fun m!1140001 () Bool)

(assert (=> b!1236684 m!1140001))

(declare-fun m!1140003 () Bool)

(assert (=> b!1236684 m!1140003))

(declare-fun m!1140005 () Bool)

(assert (=> b!1236684 m!1140005))

(declare-fun m!1140007 () Bool)

(assert (=> b!1236684 m!1140007))

(declare-fun m!1140009 () Bool)

(assert (=> b!1236681 m!1140009))

(declare-fun m!1140011 () Bool)

(assert (=> b!1236683 m!1140011))

(declare-fun m!1140013 () Bool)

(assert (=> b!1236677 m!1140013))

(declare-fun m!1140015 () Bool)

(assert (=> start!102902 m!1140015))

(declare-fun m!1140017 () Bool)

(assert (=> b!1236678 m!1140017))

(assert (=> b!1236679 m!1140007))

(assert (=> b!1236679 m!1140007))

(declare-fun m!1140019 () Bool)

(assert (=> b!1236679 m!1140019))

(push 1)

(assert (not b!1236677))

(assert (not b!1236682))

(assert (not b!1236683))

(assert (not start!102902))

(assert (not b!1236681))

(assert (not b!1236678))

(assert (not b!1236684))

(assert (not b!1236679))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

