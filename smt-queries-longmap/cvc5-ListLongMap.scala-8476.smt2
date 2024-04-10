; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103212 () Bool)

(assert start!103212)

(declare-fun b!1238973 () Bool)

(declare-fun res!826547 () Bool)

(declare-fun e!702138 () Bool)

(assert (=> b!1238973 (=> (not res!826547) (not e!702138))))

(declare-datatypes ((List!27298 0))(
  ( (Nil!27295) (Cons!27294 (h!28503 (_ BitVec 64)) (t!40761 List!27298)) )
))
(declare-fun acc!846 () List!27298)

(declare-fun contains!7360 (List!27298 (_ BitVec 64)) Bool)

(assert (=> b!1238973 (= res!826547 (not (contains!7360 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238974 () Bool)

(declare-fun res!826548 () Bool)

(assert (=> b!1238974 (=> (not res!826548) (not e!702138))))

(declare-fun noDuplicate!1957 (List!27298) Bool)

(assert (=> b!1238974 (= res!826548 (noDuplicate!1957 acc!846))))

(declare-fun b!1238975 () Bool)

(declare-fun res!826543 () Bool)

(assert (=> b!1238975 (=> (not res!826543) (not e!702138))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1238975 (= res!826543 (contains!7360 acc!846 k!2925))))

(declare-fun b!1238976 () Bool)

(declare-fun res!826544 () Bool)

(assert (=> b!1238976 (=> (not res!826544) (not e!702138))))

(assert (=> b!1238976 (= res!826544 (not (contains!7360 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238977 () Bool)

(declare-datatypes ((Unit!41152 0))(
  ( (Unit!41153) )
))
(declare-fun e!702137 () Unit!41152)

(declare-fun Unit!41154 () Unit!41152)

(assert (=> b!1238977 (= e!702137 Unit!41154)))

(declare-fun b!1238978 () Bool)

(declare-fun res!826545 () Bool)

(assert (=> b!1238978 (=> (not res!826545) (not e!702138))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79847 0))(
  ( (array!79848 (arr!38525 (Array (_ BitVec 32) (_ BitVec 64))) (size!39061 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79847)

(declare-fun arrayNoDuplicates!0 (array!79847 (_ BitVec 32) List!27298) Bool)

(assert (=> b!1238978 (= res!826545 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238979 () Bool)

(declare-fun lt!561536 () Unit!41152)

(assert (=> b!1238979 (= e!702137 lt!561536)))

(declare-fun lt!561533 () List!27298)

(assert (=> b!1238979 (= lt!561533 (Cons!27294 (select (arr!38525 a!3835) from!3213) acc!846))))

(declare-fun lt!561535 () Unit!41152)

(declare-fun lemmaListSubSeqRefl!0 (List!27298) Unit!41152)

(assert (=> b!1238979 (= lt!561535 (lemmaListSubSeqRefl!0 lt!561533))))

(declare-fun subseq!614 (List!27298 List!27298) Bool)

(assert (=> b!1238979 (subseq!614 lt!561533 lt!561533)))

(declare-fun lt!561532 () Unit!41152)

(declare-fun subseqTail!101 (List!27298 List!27298) Unit!41152)

(assert (=> b!1238979 (= lt!561532 (subseqTail!101 lt!561533 lt!561533))))

(assert (=> b!1238979 (subseq!614 acc!846 lt!561533)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79847 List!27298 List!27298 (_ BitVec 32)) Unit!41152)

(assert (=> b!1238979 (= lt!561536 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561533 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1238979 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1238981 () Bool)

(declare-fun res!826549 () Bool)

(assert (=> b!1238981 (=> (not res!826549) (not e!702138))))

(assert (=> b!1238981 (= res!826549 (not (= from!3213 (bvsub (size!39061 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238980 () Bool)

(assert (=> b!1238980 (= e!702138 false)))

(declare-fun lt!561534 () Unit!41152)

(assert (=> b!1238980 (= lt!561534 e!702137)))

(declare-fun c!121075 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238980 (= c!121075 (validKeyInArray!0 (select (arr!38525 a!3835) from!3213)))))

(declare-fun res!826546 () Bool)

(assert (=> start!103212 (=> (not res!826546) (not e!702138))))

(assert (=> start!103212 (= res!826546 (and (bvslt (size!39061 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39061 a!3835))))))

(assert (=> start!103212 e!702138))

(declare-fun array_inv!29373 (array!79847) Bool)

(assert (=> start!103212 (array_inv!29373 a!3835)))

(assert (=> start!103212 true))

(assert (= (and start!103212 res!826546) b!1238974))

(assert (= (and b!1238974 res!826548) b!1238973))

(assert (= (and b!1238973 res!826547) b!1238976))

(assert (= (and b!1238976 res!826544) b!1238978))

(assert (= (and b!1238978 res!826545) b!1238975))

(assert (= (and b!1238975 res!826543) b!1238981))

(assert (= (and b!1238981 res!826549) b!1238980))

(assert (= (and b!1238980 c!121075) b!1238979))

(assert (= (and b!1238980 (not c!121075)) b!1238977))

(declare-fun m!1142491 () Bool)

(assert (=> b!1238979 m!1142491))

(declare-fun m!1142493 () Bool)

(assert (=> b!1238979 m!1142493))

(declare-fun m!1142495 () Bool)

(assert (=> b!1238979 m!1142495))

(declare-fun m!1142497 () Bool)

(assert (=> b!1238979 m!1142497))

(declare-fun m!1142499 () Bool)

(assert (=> b!1238979 m!1142499))

(declare-fun m!1142501 () Bool)

(assert (=> b!1238979 m!1142501))

(declare-fun m!1142503 () Bool)

(assert (=> b!1238979 m!1142503))

(declare-fun m!1142505 () Bool)

(assert (=> b!1238975 m!1142505))

(assert (=> b!1238980 m!1142503))

(assert (=> b!1238980 m!1142503))

(declare-fun m!1142507 () Bool)

(assert (=> b!1238980 m!1142507))

(declare-fun m!1142509 () Bool)

(assert (=> start!103212 m!1142509))

(declare-fun m!1142511 () Bool)

(assert (=> b!1238976 m!1142511))

(declare-fun m!1142513 () Bool)

(assert (=> b!1238974 m!1142513))

(declare-fun m!1142515 () Bool)

(assert (=> b!1238973 m!1142515))

(declare-fun m!1142517 () Bool)

(assert (=> b!1238978 m!1142517))

(push 1)

(assert (not b!1238974))

(assert (not b!1238979))

(assert (not b!1238980))

(assert (not start!103212))

(assert (not b!1238976))

(assert (not b!1238975))

(assert (not b!1238973))

(assert (not b!1238978))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

