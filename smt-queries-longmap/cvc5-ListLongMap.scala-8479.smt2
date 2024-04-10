; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103284 () Bool)

(assert start!103284)

(declare-fun b!1239457 () Bool)

(declare-fun res!826899 () Bool)

(declare-fun e!702418 () Bool)

(assert (=> b!1239457 (=> (not res!826899) (not e!702418))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79868 0))(
  ( (array!79869 (arr!38534 (Array (_ BitVec 32) (_ BitVec 64))) (size!39070 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79868)

(assert (=> b!1239457 (= res!826899 (not (= from!3213 (bvsub (size!39070 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1239458 () Bool)

(declare-datatypes ((Unit!41183 0))(
  ( (Unit!41184) )
))
(declare-fun e!702419 () Unit!41183)

(declare-fun lt!561722 () Unit!41183)

(assert (=> b!1239458 (= e!702419 lt!561722)))

(declare-datatypes ((List!27307 0))(
  ( (Nil!27304) (Cons!27303 (h!28512 (_ BitVec 64)) (t!40770 List!27307)) )
))
(declare-fun lt!561718 () List!27307)

(declare-fun acc!846 () List!27307)

(assert (=> b!1239458 (= lt!561718 (Cons!27303 (select (arr!38534 a!3835) from!3213) acc!846))))

(declare-fun lt!561719 () Unit!41183)

(declare-fun lemmaListSubSeqRefl!0 (List!27307) Unit!41183)

(assert (=> b!1239458 (= lt!561719 (lemmaListSubSeqRefl!0 lt!561718))))

(declare-fun subseq!623 (List!27307 List!27307) Bool)

(assert (=> b!1239458 (subseq!623 lt!561718 lt!561718)))

(declare-fun lt!561721 () Unit!41183)

(declare-fun subseqTail!110 (List!27307 List!27307) Unit!41183)

(assert (=> b!1239458 (= lt!561721 (subseqTail!110 lt!561718 lt!561718))))

(assert (=> b!1239458 (subseq!623 acc!846 lt!561718)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79868 List!27307 List!27307 (_ BitVec 32)) Unit!41183)

(assert (=> b!1239458 (= lt!561722 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561718 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79868 (_ BitVec 32) List!27307) Bool)

(assert (=> b!1239458 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1239459 () Bool)

(declare-fun res!826896 () Bool)

(assert (=> b!1239459 (=> (not res!826896) (not e!702418))))

(declare-fun contains!7369 (List!27307 (_ BitVec 64)) Bool)

(assert (=> b!1239459 (= res!826896 (not (contains!7369 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239460 () Bool)

(declare-fun Unit!41185 () Unit!41183)

(assert (=> b!1239460 (= e!702419 Unit!41185)))

(declare-fun b!1239461 () Bool)

(declare-fun e!702417 () Bool)

(assert (=> b!1239461 (= e!702417 (bvsge (bvsub (size!39070 a!3835) (bvadd #b00000000000000000000000000000001 from!3213)) (bvsub (size!39070 a!3835) from!3213)))))

(declare-fun b!1239462 () Bool)

(declare-fun res!826901 () Bool)

(assert (=> b!1239462 (=> (not res!826901) (not e!702418))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1239462 (= res!826901 (contains!7369 acc!846 k!2925))))

(declare-fun b!1239463 () Bool)

(declare-fun res!826897 () Bool)

(assert (=> b!1239463 (=> (not res!826897) (not e!702417))))

(assert (=> b!1239463 (= res!826897 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1239464 () Bool)

(declare-fun res!826895 () Bool)

(assert (=> b!1239464 (=> (not res!826895) (not e!702418))))

(assert (=> b!1239464 (= res!826895 (not (contains!7369 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1239465 () Bool)

(assert (=> b!1239465 (= e!702418 e!702417)))

(declare-fun res!826898 () Bool)

(assert (=> b!1239465 (=> (not res!826898) (not e!702417))))

(assert (=> b!1239465 (= res!826898 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!39070 a!3835))))))

(declare-fun lt!561720 () Unit!41183)

(assert (=> b!1239465 (= lt!561720 e!702419)))

(declare-fun c!121141 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1239465 (= c!121141 (validKeyInArray!0 (select (arr!38534 a!3835) from!3213)))))

(declare-fun res!826903 () Bool)

(assert (=> start!103284 (=> (not res!826903) (not e!702418))))

(assert (=> start!103284 (= res!826903 (and (bvslt (size!39070 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39070 a!3835))))))

(assert (=> start!103284 e!702418))

(declare-fun array_inv!29382 (array!79868) Bool)

(assert (=> start!103284 (array_inv!29382 a!3835)))

(assert (=> start!103284 true))

(declare-fun b!1239466 () Bool)

(declare-fun res!826900 () Bool)

(assert (=> b!1239466 (=> (not res!826900) (not e!702418))))

(assert (=> b!1239466 (= res!826900 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1239467 () Bool)

(declare-fun res!826902 () Bool)

(assert (=> b!1239467 (=> (not res!826902) (not e!702418))))

(declare-fun noDuplicate!1966 (List!27307) Bool)

(assert (=> b!1239467 (= res!826902 (noDuplicate!1966 acc!846))))

(assert (= (and start!103284 res!826903) b!1239467))

(assert (= (and b!1239467 res!826902) b!1239459))

(assert (= (and b!1239459 res!826896) b!1239464))

(assert (= (and b!1239464 res!826895) b!1239466))

(assert (= (and b!1239466 res!826900) b!1239462))

(assert (= (and b!1239462 res!826901) b!1239457))

(assert (= (and b!1239457 res!826899) b!1239465))

(assert (= (and b!1239465 c!121141) b!1239458))

(assert (= (and b!1239465 (not c!121141)) b!1239460))

(assert (= (and b!1239465 res!826898) b!1239463))

(assert (= (and b!1239463 res!826897) b!1239461))

(declare-fun m!1142899 () Bool)

(assert (=> b!1239462 m!1142899))

(declare-fun m!1142901 () Bool)

(assert (=> start!103284 m!1142901))

(declare-fun m!1142903 () Bool)

(assert (=> b!1239458 m!1142903))

(declare-fun m!1142905 () Bool)

(assert (=> b!1239458 m!1142905))

(declare-fun m!1142907 () Bool)

(assert (=> b!1239458 m!1142907))

(declare-fun m!1142909 () Bool)

(assert (=> b!1239458 m!1142909))

(declare-fun m!1142911 () Bool)

(assert (=> b!1239458 m!1142911))

(declare-fun m!1142913 () Bool)

(assert (=> b!1239458 m!1142913))

(declare-fun m!1142915 () Bool)

(assert (=> b!1239458 m!1142915))

(assert (=> b!1239465 m!1142911))

(assert (=> b!1239465 m!1142911))

(declare-fun m!1142917 () Bool)

(assert (=> b!1239465 m!1142917))

(declare-fun m!1142919 () Bool)

(assert (=> b!1239464 m!1142919))

(declare-fun m!1142921 () Bool)

(assert (=> b!1239459 m!1142921))

(declare-fun m!1142923 () Bool)

(assert (=> b!1239467 m!1142923))

(declare-fun m!1142925 () Bool)

(assert (=> b!1239466 m!1142925))

(assert (=> b!1239463 m!1142915))

(push 1)

(assert (not b!1239462))

(assert (not b!1239467))

(assert (not start!103284))

(assert (not b!1239465))

(assert (not b!1239466))

(assert (not b!1239463))

(assert (not b!1239458))

(assert (not b!1239459))

(assert (not b!1239464))

(check-sat)

(pop 1)

(push 1)

(check-sat)

