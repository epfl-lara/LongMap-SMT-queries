; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102758 () Bool)

(assert start!102758)

(declare-fun b!1234711 () Bool)

(declare-fun res!822915 () Bool)

(declare-fun e!700232 () Bool)

(assert (=> b!1234711 (=> (not res!822915) (not e!700232))))

(declare-datatypes ((List!27245 0))(
  ( (Nil!27242) (Cons!27241 (h!28450 (_ BitVec 64)) (t!40699 List!27245)) )
))
(declare-fun acc!846 () List!27245)

(declare-fun contains!7217 (List!27245 (_ BitVec 64)) Bool)

(assert (=> b!1234711 (= res!822915 (not (contains!7217 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234712 () Bool)

(declare-fun res!822913 () Bool)

(declare-fun e!700231 () Bool)

(assert (=> b!1234712 (=> res!822913 e!700231)))

(declare-fun lt!559824 () List!27245)

(assert (=> b!1234712 (= res!822913 (contains!7217 lt!559824 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!822912 () Bool)

(assert (=> start!102758 (=> (not res!822912) (not e!700232))))

(declare-datatypes ((array!79526 0))(
  ( (array!79527 (arr!38371 (Array (_ BitVec 32) (_ BitVec 64))) (size!38909 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79526)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!102758 (= res!822912 (and (bvslt (size!38909 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38909 a!3835))))))

(assert (=> start!102758 e!700232))

(declare-fun array_inv!29354 (array!79526) Bool)

(assert (=> start!102758 (array_inv!29354 a!3835)))

(assert (=> start!102758 true))

(declare-fun b!1234713 () Bool)

(declare-fun res!822910 () Bool)

(assert (=> b!1234713 (=> (not res!822910) (not e!700232))))

(assert (=> b!1234713 (= res!822910 (not (= from!3213 (bvsub (size!38909 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1234714 () Bool)

(declare-fun res!822916 () Bool)

(assert (=> b!1234714 (=> (not res!822916) (not e!700232))))

(assert (=> b!1234714 (= res!822916 (not (contains!7217 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234715 () Bool)

(declare-fun res!822918 () Bool)

(assert (=> b!1234715 (=> res!822918 e!700231)))

(assert (=> b!1234715 (= res!822918 (contains!7217 lt!559824 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234716 () Bool)

(declare-fun res!822917 () Bool)

(assert (=> b!1234716 (=> (not res!822917) (not e!700232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234716 (= res!822917 (validKeyInArray!0 (select (arr!38371 a!3835) from!3213)))))

(declare-fun b!1234717 () Bool)

(declare-fun res!822920 () Bool)

(assert (=> b!1234717 (=> res!822920 e!700231)))

(declare-fun noDuplicate!1860 (List!27245) Bool)

(assert (=> b!1234717 (= res!822920 (not (noDuplicate!1860 lt!559824)))))

(declare-fun b!1234718 () Bool)

(declare-fun res!822919 () Bool)

(assert (=> b!1234718 (=> (not res!822919) (not e!700232))))

(declare-fun arrayNoDuplicates!0 (array!79526 (_ BitVec 32) List!27245) Bool)

(assert (=> b!1234718 (= res!822919 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1234719 () Bool)

(declare-fun res!822911 () Bool)

(assert (=> b!1234719 (=> (not res!822911) (not e!700232))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1234719 (= res!822911 (contains!7217 acc!846 k!2925))))

(declare-fun b!1234720 () Bool)

(declare-fun res!822914 () Bool)

(assert (=> b!1234720 (=> (not res!822914) (not e!700232))))

(assert (=> b!1234720 (= res!822914 (noDuplicate!1860 acc!846))))

(declare-fun b!1234721 () Bool)

(assert (=> b!1234721 (= e!700231 true)))

(declare-fun lt!559826 () Bool)

(assert (=> b!1234721 (= lt!559826 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!559824))))

(declare-datatypes ((Unit!40737 0))(
  ( (Unit!40738) )
))
(declare-fun lt!559823 () Unit!40737)

(declare-fun noDuplicateSubseq!64 (List!27245 List!27245) Unit!40737)

(assert (=> b!1234721 (= lt!559823 (noDuplicateSubseq!64 acc!846 lt!559824))))

(declare-fun b!1234722 () Bool)

(assert (=> b!1234722 (= e!700232 (not e!700231))))

(declare-fun res!822909 () Bool)

(assert (=> b!1234722 (=> res!822909 e!700231)))

(assert (=> b!1234722 (= res!822909 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!517 (List!27245 List!27245) Bool)

(assert (=> b!1234722 (subseq!517 acc!846 lt!559824)))

(declare-fun lt!559825 () Unit!40737)

(declare-fun subseqTail!10 (List!27245 List!27245) Unit!40737)

(assert (=> b!1234722 (= lt!559825 (subseqTail!10 lt!559824 lt!559824))))

(assert (=> b!1234722 (subseq!517 lt!559824 lt!559824)))

(declare-fun lt!559822 () Unit!40737)

(declare-fun lemmaListSubSeqRefl!0 (List!27245) Unit!40737)

(assert (=> b!1234722 (= lt!559822 (lemmaListSubSeqRefl!0 lt!559824))))

(assert (=> b!1234722 (= lt!559824 (Cons!27241 (select (arr!38371 a!3835) from!3213) acc!846))))

(assert (= (and start!102758 res!822912) b!1234720))

(assert (= (and b!1234720 res!822914) b!1234714))

(assert (= (and b!1234714 res!822916) b!1234711))

(assert (= (and b!1234711 res!822915) b!1234718))

(assert (= (and b!1234718 res!822919) b!1234719))

(assert (= (and b!1234719 res!822911) b!1234713))

(assert (= (and b!1234713 res!822910) b!1234716))

(assert (= (and b!1234716 res!822917) b!1234722))

(assert (= (and b!1234722 (not res!822909)) b!1234717))

(assert (= (and b!1234717 (not res!822920)) b!1234715))

(assert (= (and b!1234715 (not res!822918)) b!1234712))

(assert (= (and b!1234712 (not res!822913)) b!1234721))

(declare-fun m!1138199 () Bool)

(assert (=> b!1234715 m!1138199))

(declare-fun m!1138201 () Bool)

(assert (=> b!1234720 m!1138201))

(declare-fun m!1138203 () Bool)

(assert (=> b!1234721 m!1138203))

(declare-fun m!1138205 () Bool)

(assert (=> b!1234721 m!1138205))

(declare-fun m!1138207 () Bool)

(assert (=> b!1234711 m!1138207))

(declare-fun m!1138209 () Bool)

(assert (=> b!1234718 m!1138209))

(declare-fun m!1138211 () Bool)

(assert (=> b!1234712 m!1138211))

(declare-fun m!1138213 () Bool)

(assert (=> b!1234719 m!1138213))

(declare-fun m!1138215 () Bool)

(assert (=> start!102758 m!1138215))

(declare-fun m!1138217 () Bool)

(assert (=> b!1234714 m!1138217))

(declare-fun m!1138219 () Bool)

(assert (=> b!1234717 m!1138219))

(declare-fun m!1138221 () Bool)

(assert (=> b!1234716 m!1138221))

(assert (=> b!1234716 m!1138221))

(declare-fun m!1138223 () Bool)

(assert (=> b!1234716 m!1138223))

(declare-fun m!1138225 () Bool)

(assert (=> b!1234722 m!1138225))

(declare-fun m!1138227 () Bool)

(assert (=> b!1234722 m!1138227))

(declare-fun m!1138229 () Bool)

(assert (=> b!1234722 m!1138229))

(declare-fun m!1138231 () Bool)

(assert (=> b!1234722 m!1138231))

(assert (=> b!1234722 m!1138221))

(push 1)

(assert (not b!1234720))

(assert (not b!1234712))

(assert (not b!1234711))

(assert (not b!1234715))

(assert (not start!102758))

(assert (not b!1234716))

(assert (not b!1234721))

(assert (not b!1234714))

(assert (not b!1234719))

(assert (not b!1234722))

(assert (not b!1234717))

(assert (not b!1234718))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

