; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102762 () Bool)

(assert start!102762)

(declare-fun b!1234815 () Bool)

(declare-fun res!822985 () Bool)

(declare-fun e!700273 () Bool)

(assert (=> b!1234815 (=> (not res!822985) (not e!700273))))

(declare-datatypes ((array!79607 0))(
  ( (array!79608 (arr!38411 (Array (_ BitVec 32) (_ BitVec 64))) (size!38947 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79607)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234815 (= res!822985 (validKeyInArray!0 (select (arr!38411 a!3835) from!3213)))))

(declare-fun b!1234816 () Bool)

(declare-fun e!700275 () Bool)

(assert (=> b!1234816 (= e!700273 (not e!700275))))

(declare-fun res!822980 () Bool)

(assert (=> b!1234816 (=> res!822980 e!700275)))

(assert (=> b!1234816 (= res!822980 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-datatypes ((List!27184 0))(
  ( (Nil!27181) (Cons!27180 (h!28389 (_ BitVec 64)) (t!40647 List!27184)) )
))
(declare-fun acc!846 () List!27184)

(declare-fun lt!560011 () List!27184)

(declare-fun subseq!518 (List!27184 List!27184) Bool)

(assert (=> b!1234816 (subseq!518 acc!846 lt!560011)))

(declare-datatypes ((Unit!40892 0))(
  ( (Unit!40893) )
))
(declare-fun lt!560013 () Unit!40892)

(declare-fun subseqTail!11 (List!27184 List!27184) Unit!40892)

(assert (=> b!1234816 (= lt!560013 (subseqTail!11 lt!560011 lt!560011))))

(assert (=> b!1234816 (subseq!518 lt!560011 lt!560011)))

(declare-fun lt!560014 () Unit!40892)

(declare-fun lemmaListSubSeqRefl!0 (List!27184) Unit!40892)

(assert (=> b!1234816 (= lt!560014 (lemmaListSubSeqRefl!0 lt!560011))))

(assert (=> b!1234816 (= lt!560011 (Cons!27180 (select (arr!38411 a!3835) from!3213) acc!846))))

(declare-fun b!1234817 () Bool)

(declare-fun res!822979 () Bool)

(assert (=> b!1234817 (=> (not res!822979) (not e!700273))))

(declare-fun contains!7246 (List!27184 (_ BitVec 64)) Bool)

(assert (=> b!1234817 (= res!822979 (not (contains!7246 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234818 () Bool)

(declare-fun res!822978 () Bool)

(assert (=> b!1234818 (=> (not res!822978) (not e!700273))))

(assert (=> b!1234818 (= res!822978 (not (contains!7246 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234819 () Bool)

(declare-fun res!822986 () Bool)

(assert (=> b!1234819 (=> (not res!822986) (not e!700273))))

(declare-fun noDuplicate!1843 (List!27184) Bool)

(assert (=> b!1234819 (= res!822986 (noDuplicate!1843 acc!846))))

(declare-fun b!1234820 () Bool)

(declare-fun res!822982 () Bool)

(assert (=> b!1234820 (=> res!822982 e!700275)))

(assert (=> b!1234820 (= res!822982 (contains!7246 lt!560011 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234821 () Bool)

(declare-fun res!822984 () Bool)

(assert (=> b!1234821 (=> res!822984 e!700275)))

(assert (=> b!1234821 (= res!822984 (not (noDuplicate!1843 lt!560011)))))

(declare-fun b!1234822 () Bool)

(assert (=> b!1234822 (= e!700275 true)))

(declare-fun lt!560012 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79607 (_ BitVec 32) List!27184) Bool)

(assert (=> b!1234822 (= lt!560012 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560011))))

(declare-fun lt!560015 () Unit!40892)

(declare-fun noDuplicateSubseq!65 (List!27184 List!27184) Unit!40892)

(assert (=> b!1234822 (= lt!560015 (noDuplicateSubseq!65 acc!846 lt!560011))))

(declare-fun b!1234823 () Bool)

(declare-fun res!822977 () Bool)

(assert (=> b!1234823 (=> (not res!822977) (not e!700273))))

(assert (=> b!1234823 (= res!822977 (not (= from!3213 (bvsub (size!38947 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1234824 () Bool)

(declare-fun res!822987 () Bool)

(assert (=> b!1234824 (=> res!822987 e!700275)))

(assert (=> b!1234824 (= res!822987 (contains!7246 lt!560011 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234825 () Bool)

(declare-fun res!822981 () Bool)

(assert (=> b!1234825 (=> (not res!822981) (not e!700273))))

(assert (=> b!1234825 (= res!822981 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!822983 () Bool)

(assert (=> start!102762 (=> (not res!822983) (not e!700273))))

(assert (=> start!102762 (= res!822983 (and (bvslt (size!38947 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38947 a!3835))))))

(assert (=> start!102762 e!700273))

(declare-fun array_inv!29259 (array!79607) Bool)

(assert (=> start!102762 (array_inv!29259 a!3835)))

(assert (=> start!102762 true))

(declare-fun b!1234826 () Bool)

(declare-fun res!822988 () Bool)

(assert (=> b!1234826 (=> (not res!822988) (not e!700273))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1234826 (= res!822988 (contains!7246 acc!846 k!2925))))

(assert (= (and start!102762 res!822983) b!1234819))

(assert (= (and b!1234819 res!822986) b!1234818))

(assert (= (and b!1234818 res!822978) b!1234817))

(assert (= (and b!1234817 res!822979) b!1234825))

(assert (= (and b!1234825 res!822981) b!1234826))

(assert (= (and b!1234826 res!822988) b!1234823))

(assert (= (and b!1234823 res!822977) b!1234815))

(assert (= (and b!1234815 res!822985) b!1234816))

(assert (= (and b!1234816 (not res!822980)) b!1234821))

(assert (= (and b!1234821 (not res!822984)) b!1234820))

(assert (= (and b!1234820 (not res!822982)) b!1234824))

(assert (= (and b!1234824 (not res!822987)) b!1234822))

(declare-fun m!1138729 () Bool)

(assert (=> b!1234816 m!1138729))

(declare-fun m!1138731 () Bool)

(assert (=> b!1234816 m!1138731))

(declare-fun m!1138733 () Bool)

(assert (=> b!1234816 m!1138733))

(declare-fun m!1138735 () Bool)

(assert (=> b!1234816 m!1138735))

(declare-fun m!1138737 () Bool)

(assert (=> b!1234816 m!1138737))

(declare-fun m!1138739 () Bool)

(assert (=> b!1234818 m!1138739))

(declare-fun m!1138741 () Bool)

(assert (=> b!1234822 m!1138741))

(declare-fun m!1138743 () Bool)

(assert (=> b!1234822 m!1138743))

(declare-fun m!1138745 () Bool)

(assert (=> b!1234825 m!1138745))

(declare-fun m!1138747 () Bool)

(assert (=> b!1234826 m!1138747))

(declare-fun m!1138749 () Bool)

(assert (=> b!1234820 m!1138749))

(declare-fun m!1138751 () Bool)

(assert (=> b!1234817 m!1138751))

(declare-fun m!1138753 () Bool)

(assert (=> b!1234819 m!1138753))

(assert (=> b!1234815 m!1138737))

(assert (=> b!1234815 m!1138737))

(declare-fun m!1138755 () Bool)

(assert (=> b!1234815 m!1138755))

(declare-fun m!1138757 () Bool)

(assert (=> b!1234824 m!1138757))

(declare-fun m!1138759 () Bool)

(assert (=> start!102762 m!1138759))

(declare-fun m!1138761 () Bool)

(assert (=> b!1234821 m!1138761))

(push 1)

(assert (not b!1234816))

(assert (not b!1234824))

(assert (not b!1234826))

(assert (not b!1234821))

(assert (not b!1234825))

(assert (not b!1234815))

(assert (not b!1234818))

(assert (not b!1234819))

(assert (not b!1234822))

(assert (not start!102762))

(assert (not b!1234820))

(assert (not b!1234817))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

