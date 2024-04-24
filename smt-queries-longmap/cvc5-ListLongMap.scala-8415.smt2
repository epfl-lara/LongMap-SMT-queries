; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102670 () Bool)

(assert start!102670)

(declare-fun b!1233340 () Bool)

(declare-fun res!820934 () Bool)

(declare-fun e!699731 () Bool)

(assert (=> b!1233340 (=> (not res!820934) (not e!699731))))

(declare-datatypes ((List!27142 0))(
  ( (Nil!27139) (Cons!27138 (h!28356 (_ BitVec 64)) (t!40597 List!27142)) )
))
(declare-fun acc!823 () List!27142)

(declare-fun contains!7213 (List!27142 (_ BitVec 64)) Bool)

(assert (=> b!1233340 (= res!820934 (not (contains!7213 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233341 () Bool)

(declare-fun res!820932 () Bool)

(assert (=> b!1233341 (=> (not res!820932) (not e!699731))))

(declare-datatypes ((array!79497 0))(
  ( (array!79498 (arr!38356 (Array (_ BitVec 32) (_ BitVec 64))) (size!38893 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79497)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233341 (= res!820932 (validKeyInArray!0 (select (arr!38356 a!3806) from!3184)))))

(declare-fun b!1233343 () Bool)

(declare-fun e!699730 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79497 (_ BitVec 32) List!27142) Bool)

(assert (=> b!1233343 (= e!699730 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27138 (select (arr!38356 a!3806) from!3184) Nil!27139)))))

(declare-fun b!1233344 () Bool)

(declare-fun res!820929 () Bool)

(assert (=> b!1233344 (=> (not res!820929) (not e!699731))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1233344 (= res!820929 (validKeyInArray!0 k!2913))))

(declare-fun b!1233345 () Bool)

(declare-fun res!820927 () Bool)

(assert (=> b!1233345 (=> (not res!820927) (not e!699731))))

(assert (=> b!1233345 (= res!820927 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233346 () Bool)

(declare-fun res!820925 () Bool)

(assert (=> b!1233346 (=> (not res!820925) (not e!699731))))

(declare-fun arrayContainsKey!0 (array!79497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233346 (= res!820925 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233347 () Bool)

(declare-fun res!820928 () Bool)

(assert (=> b!1233347 (=> (not res!820928) (not e!699731))))

(assert (=> b!1233347 (= res!820928 (not (contains!7213 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233348 () Bool)

(declare-fun res!820931 () Bool)

(assert (=> b!1233348 (=> (not res!820931) (not e!699731))))

(declare-fun noDuplicate!1794 (List!27142) Bool)

(assert (=> b!1233348 (= res!820931 (noDuplicate!1794 acc!823))))

(declare-fun b!1233349 () Bool)

(declare-fun res!820933 () Bool)

(assert (=> b!1233349 (=> (not res!820933) (not e!699731))))

(assert (=> b!1233349 (= res!820933 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38893 a!3806)) (bvslt from!3184 (size!38893 a!3806))))))

(declare-fun res!820930 () Bool)

(assert (=> start!102670 (=> (not res!820930) (not e!699731))))

(assert (=> start!102670 (= res!820930 (bvslt (size!38893 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102670 e!699731))

(declare-fun array_inv!29294 (array!79497) Bool)

(assert (=> start!102670 (array_inv!29294 a!3806)))

(assert (=> start!102670 true))

(declare-fun b!1233342 () Bool)

(assert (=> b!1233342 (= e!699731 (not true))))

(assert (=> b!1233342 e!699730))

(declare-fun res!820926 () Bool)

(assert (=> b!1233342 (=> (not res!820926) (not e!699730))))

(assert (=> b!1233342 (= res!820926 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27139))))

(declare-datatypes ((Unit!40767 0))(
  ( (Unit!40768) )
))
(declare-fun lt!559962 () Unit!40767)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79497 List!27142 List!27142 (_ BitVec 32)) Unit!40767)

(assert (=> b!1233342 (= lt!559962 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27139 from!3184))))

(assert (=> b!1233342 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27138 (select (arr!38356 a!3806) from!3184) acc!823))))

(assert (= (and start!102670 res!820930) b!1233344))

(assert (= (and b!1233344 res!820929) b!1233349))

(assert (= (and b!1233349 res!820933) b!1233348))

(assert (= (and b!1233348 res!820931) b!1233347))

(assert (= (and b!1233347 res!820928) b!1233340))

(assert (= (and b!1233340 res!820934) b!1233346))

(assert (= (and b!1233346 res!820925) b!1233345))

(assert (= (and b!1233345 res!820927) b!1233341))

(assert (= (and b!1233341 res!820932) b!1233342))

(assert (= (and b!1233342 res!820926) b!1233343))

(declare-fun m!1137715 () Bool)

(assert (=> b!1233347 m!1137715))

(declare-fun m!1137717 () Bool)

(assert (=> b!1233340 m!1137717))

(declare-fun m!1137719 () Bool)

(assert (=> b!1233346 m!1137719))

(declare-fun m!1137721 () Bool)

(assert (=> b!1233343 m!1137721))

(declare-fun m!1137723 () Bool)

(assert (=> b!1233343 m!1137723))

(declare-fun m!1137725 () Bool)

(assert (=> b!1233345 m!1137725))

(declare-fun m!1137727 () Bool)

(assert (=> b!1233342 m!1137727))

(declare-fun m!1137729 () Bool)

(assert (=> b!1233342 m!1137729))

(assert (=> b!1233342 m!1137721))

(declare-fun m!1137731 () Bool)

(assert (=> b!1233342 m!1137731))

(declare-fun m!1137733 () Bool)

(assert (=> start!102670 m!1137733))

(declare-fun m!1137735 () Bool)

(assert (=> b!1233344 m!1137735))

(declare-fun m!1137737 () Bool)

(assert (=> b!1233348 m!1137737))

(assert (=> b!1233341 m!1137721))

(assert (=> b!1233341 m!1137721))

(declare-fun m!1137739 () Bool)

(assert (=> b!1233341 m!1137739))

(push 1)

(assert (not b!1233345))

(assert (not b!1233343))

(assert (not b!1233340))

(assert (not b!1233342))

(assert (not b!1233347))

(assert (not b!1233341))

(assert (not b!1233344))

(assert (not b!1233346))

(assert (not start!102670))

(assert (not b!1233348))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

