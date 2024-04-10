; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103204 () Bool)

(assert start!103204)

(declare-fun b!1238865 () Bool)

(declare-fun e!702102 () Bool)

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79839 0))(
  ( (array!79840 (arr!38521 (Array (_ BitVec 32) (_ BitVec 64))) (size!39057 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79839)

(assert (=> b!1238865 (= e!702102 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!3213) (size!39057 a!3835))))))

(declare-datatypes ((Unit!41140 0))(
  ( (Unit!41141) )
))
(declare-fun lt!561472 () Unit!41140)

(declare-fun e!702100 () Unit!41140)

(assert (=> b!1238865 (= lt!561472 e!702100)))

(declare-fun c!121063 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238865 (= c!121063 (validKeyInArray!0 (select (arr!38521 a!3835) from!3213)))))

(declare-fun b!1238866 () Bool)

(declare-fun res!826464 () Bool)

(assert (=> b!1238866 (=> (not res!826464) (not e!702102))))

(declare-datatypes ((List!27294 0))(
  ( (Nil!27291) (Cons!27290 (h!28499 (_ BitVec 64)) (t!40757 List!27294)) )
))
(declare-fun acc!846 () List!27294)

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7356 (List!27294 (_ BitVec 64)) Bool)

(assert (=> b!1238866 (= res!826464 (contains!7356 acc!846 k!2925))))

(declare-fun b!1238867 () Bool)

(declare-fun res!826461 () Bool)

(assert (=> b!1238867 (=> (not res!826461) (not e!702102))))

(declare-fun arrayNoDuplicates!0 (array!79839 (_ BitVec 32) List!27294) Bool)

(assert (=> b!1238867 (= res!826461 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238868 () Bool)

(declare-fun res!826465 () Bool)

(assert (=> b!1238868 (=> (not res!826465) (not e!702102))))

(assert (=> b!1238868 (= res!826465 (not (contains!7356 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!826462 () Bool)

(assert (=> start!103204 (=> (not res!826462) (not e!702102))))

(assert (=> start!103204 (= res!826462 (and (bvslt (size!39057 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39057 a!3835))))))

(assert (=> start!103204 e!702102))

(declare-fun array_inv!29369 (array!79839) Bool)

(assert (=> start!103204 (array_inv!29369 a!3835)))

(assert (=> start!103204 true))

(declare-fun b!1238869 () Bool)

(declare-fun res!826463 () Bool)

(assert (=> b!1238869 (=> (not res!826463) (not e!702102))))

(assert (=> b!1238869 (= res!826463 (not (contains!7356 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238870 () Bool)

(declare-fun res!826459 () Bool)

(assert (=> b!1238870 (=> (not res!826459) (not e!702102))))

(assert (=> b!1238870 (= res!826459 (not (= from!3213 (bvsub (size!39057 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238871 () Bool)

(declare-fun res!826460 () Bool)

(assert (=> b!1238871 (=> (not res!826460) (not e!702102))))

(declare-fun noDuplicate!1953 (List!27294) Bool)

(assert (=> b!1238871 (= res!826460 (noDuplicate!1953 acc!846))))

(declare-fun b!1238872 () Bool)

(declare-fun lt!561475 () Unit!41140)

(assert (=> b!1238872 (= e!702100 lt!561475)))

(declare-fun lt!561473 () List!27294)

(assert (=> b!1238872 (= lt!561473 (Cons!27290 (select (arr!38521 a!3835) from!3213) acc!846))))

(declare-fun lt!561476 () Unit!41140)

(declare-fun lemmaListSubSeqRefl!0 (List!27294) Unit!41140)

(assert (=> b!1238872 (= lt!561476 (lemmaListSubSeqRefl!0 lt!561473))))

(declare-fun subseq!610 (List!27294 List!27294) Bool)

(assert (=> b!1238872 (subseq!610 lt!561473 lt!561473)))

(declare-fun lt!561474 () Unit!41140)

(declare-fun subseqTail!97 (List!27294 List!27294) Unit!41140)

(assert (=> b!1238872 (= lt!561474 (subseqTail!97 lt!561473 lt!561473))))

(assert (=> b!1238872 (subseq!610 acc!846 lt!561473)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79839 List!27294 List!27294 (_ BitVec 32)) Unit!41140)

(assert (=> b!1238872 (= lt!561475 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561473 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1238872 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1238873 () Bool)

(declare-fun Unit!41142 () Unit!41140)

(assert (=> b!1238873 (= e!702100 Unit!41142)))

(assert (= (and start!103204 res!826462) b!1238871))

(assert (= (and b!1238871 res!826460) b!1238869))

(assert (= (and b!1238869 res!826463) b!1238868))

(assert (= (and b!1238868 res!826465) b!1238867))

(assert (= (and b!1238867 res!826461) b!1238866))

(assert (= (and b!1238866 res!826464) b!1238870))

(assert (= (and b!1238870 res!826459) b!1238865))

(assert (= (and b!1238865 c!121063) b!1238872))

(assert (= (and b!1238865 (not c!121063)) b!1238873))

(declare-fun m!1142379 () Bool)

(assert (=> b!1238865 m!1142379))

(assert (=> b!1238865 m!1142379))

(declare-fun m!1142381 () Bool)

(assert (=> b!1238865 m!1142381))

(declare-fun m!1142383 () Bool)

(assert (=> b!1238871 m!1142383))

(declare-fun m!1142385 () Bool)

(assert (=> start!103204 m!1142385))

(declare-fun m!1142387 () Bool)

(assert (=> b!1238867 m!1142387))

(declare-fun m!1142389 () Bool)

(assert (=> b!1238866 m!1142389))

(declare-fun m!1142391 () Bool)

(assert (=> b!1238869 m!1142391))

(declare-fun m!1142393 () Bool)

(assert (=> b!1238872 m!1142393))

(declare-fun m!1142395 () Bool)

(assert (=> b!1238872 m!1142395))

(declare-fun m!1142397 () Bool)

(assert (=> b!1238872 m!1142397))

(declare-fun m!1142399 () Bool)

(assert (=> b!1238872 m!1142399))

(declare-fun m!1142401 () Bool)

(assert (=> b!1238872 m!1142401))

(declare-fun m!1142403 () Bool)

(assert (=> b!1238872 m!1142403))

(assert (=> b!1238872 m!1142379))

(declare-fun m!1142405 () Bool)

(assert (=> b!1238868 m!1142405))

(push 1)

(assert (not b!1238865))

(assert (not b!1238871))

(assert (not b!1238872))

(assert (not b!1238868))

(assert (not b!1238867))

(assert (not b!1238866))

(assert (not b!1238869))

(assert (not start!103204))

(check-sat)

(pop 1)

(push 1)

(check-sat)

