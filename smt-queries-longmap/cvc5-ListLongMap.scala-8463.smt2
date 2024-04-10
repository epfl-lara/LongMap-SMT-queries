; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102984 () Bool)

(assert start!102984)

(declare-fun b!1237195 () Bool)

(declare-fun res!825067 () Bool)

(declare-fun e!701244 () Bool)

(assert (=> b!1237195 (=> (not res!825067) (not e!701244))))

(declare-datatypes ((List!27259 0))(
  ( (Nil!27256) (Cons!27255 (h!28464 (_ BitVec 64)) (t!40722 List!27259)) )
))
(declare-fun acc!846 () List!27259)

(declare-fun contains!7321 (List!27259 (_ BitVec 64)) Bool)

(assert (=> b!1237195 (= res!825067 (not (contains!7321 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237196 () Bool)

(assert (=> b!1237196 (= e!701244 (not true))))

(declare-fun lt!560958 () List!27259)

(declare-fun subseq!575 (List!27259 List!27259) Bool)

(assert (=> b!1237196 (subseq!575 acc!846 lt!560958)))

(declare-datatypes ((Unit!41048 0))(
  ( (Unit!41049) )
))
(declare-fun lt!560959 () Unit!41048)

(declare-fun subseqTail!62 (List!27259 List!27259) Unit!41048)

(assert (=> b!1237196 (= lt!560959 (subseqTail!62 lt!560958 lt!560958))))

(assert (=> b!1237196 (subseq!575 lt!560958 lt!560958)))

(declare-fun lt!560960 () Unit!41048)

(declare-fun lemmaListSubSeqRefl!0 (List!27259) Unit!41048)

(assert (=> b!1237196 (= lt!560960 (lemmaListSubSeqRefl!0 lt!560958))))

(declare-datatypes ((array!79760 0))(
  ( (array!79761 (arr!38486 (Array (_ BitVec 32) (_ BitVec 64))) (size!39022 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79760)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1237196 (= lt!560958 (Cons!27255 (select (arr!38486 a!3835) from!3213) acc!846))))

(declare-fun b!1237197 () Bool)

(declare-fun res!825070 () Bool)

(assert (=> b!1237197 (=> (not res!825070) (not e!701244))))

(declare-fun noDuplicate!1918 (List!27259) Bool)

(assert (=> b!1237197 (= res!825070 (noDuplicate!1918 acc!846))))

(declare-fun b!1237198 () Bool)

(declare-fun res!825066 () Bool)

(assert (=> b!1237198 (=> (not res!825066) (not e!701244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1237198 (= res!825066 (validKeyInArray!0 (select (arr!38486 a!3835) from!3213)))))

(declare-fun res!825065 () Bool)

(assert (=> start!102984 (=> (not res!825065) (not e!701244))))

(assert (=> start!102984 (= res!825065 (and (bvslt (size!39022 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39022 a!3835))))))

(assert (=> start!102984 e!701244))

(declare-fun array_inv!29334 (array!79760) Bool)

(assert (=> start!102984 (array_inv!29334 a!3835)))

(assert (=> start!102984 true))

(declare-fun b!1237199 () Bool)

(declare-fun res!825064 () Bool)

(assert (=> b!1237199 (=> (not res!825064) (not e!701244))))

(declare-fun arrayNoDuplicates!0 (array!79760 (_ BitVec 32) List!27259) Bool)

(assert (=> b!1237199 (= res!825064 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237200 () Bool)

(declare-fun res!825068 () Bool)

(assert (=> b!1237200 (=> (not res!825068) (not e!701244))))

(assert (=> b!1237200 (= res!825068 (not (= from!3213 (bvsub (size!39022 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1237201 () Bool)

(declare-fun res!825069 () Bool)

(assert (=> b!1237201 (=> (not res!825069) (not e!701244))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1237201 (= res!825069 (contains!7321 acc!846 k!2925))))

(declare-fun b!1237202 () Bool)

(declare-fun res!825063 () Bool)

(assert (=> b!1237202 (=> (not res!825063) (not e!701244))))

(assert (=> b!1237202 (= res!825063 (not (contains!7321 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102984 res!825065) b!1237197))

(assert (= (and b!1237197 res!825070) b!1237202))

(assert (= (and b!1237202 res!825063) b!1237195))

(assert (= (and b!1237195 res!825067) b!1237199))

(assert (= (and b!1237199 res!825064) b!1237201))

(assert (= (and b!1237201 res!825069) b!1237200))

(assert (= (and b!1237200 res!825068) b!1237198))

(assert (= (and b!1237198 res!825066) b!1237196))

(declare-fun m!1140913 () Bool)

(assert (=> b!1237197 m!1140913))

(declare-fun m!1140915 () Bool)

(assert (=> b!1237202 m!1140915))

(declare-fun m!1140917 () Bool)

(assert (=> start!102984 m!1140917))

(declare-fun m!1140919 () Bool)

(assert (=> b!1237199 m!1140919))

(declare-fun m!1140921 () Bool)

(assert (=> b!1237196 m!1140921))

(declare-fun m!1140923 () Bool)

(assert (=> b!1237196 m!1140923))

(declare-fun m!1140925 () Bool)

(assert (=> b!1237196 m!1140925))

(declare-fun m!1140927 () Bool)

(assert (=> b!1237196 m!1140927))

(declare-fun m!1140929 () Bool)

(assert (=> b!1237196 m!1140929))

(declare-fun m!1140931 () Bool)

(assert (=> b!1237195 m!1140931))

(declare-fun m!1140933 () Bool)

(assert (=> b!1237201 m!1140933))

(assert (=> b!1237198 m!1140929))

(assert (=> b!1237198 m!1140929))

(declare-fun m!1140935 () Bool)

(assert (=> b!1237198 m!1140935))

(push 1)

(assert (not b!1237201))

(assert (not b!1237199))

(assert (not b!1237195))

(assert (not start!102984))

(assert (not b!1237197))

(assert (not b!1237198))

(assert (not b!1237196))

(assert (not b!1237202))

(check-sat)

