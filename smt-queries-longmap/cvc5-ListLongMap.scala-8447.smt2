; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102816 () Bool)

(assert start!102816)

(declare-fun b!1235711 () Bool)

(declare-fun res!823804 () Bool)

(declare-fun e!700556 () Bool)

(assert (=> b!1235711 (=> (not res!823804) (not e!700556))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79661 0))(
  ( (array!79662 (arr!38438 (Array (_ BitVec 32) (_ BitVec 64))) (size!38974 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79661)

(assert (=> b!1235711 (= res!823804 (not (= from!3213 (bvsub (size!38974 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235712 () Bool)

(declare-fun res!823802 () Bool)

(assert (=> b!1235712 (=> (not res!823802) (not e!700556))))

(declare-datatypes ((List!27211 0))(
  ( (Nil!27208) (Cons!27207 (h!28416 (_ BitVec 64)) (t!40674 List!27211)) )
))
(declare-fun acc!846 () List!27211)

(declare-fun arrayNoDuplicates!0 (array!79661 (_ BitVec 32) List!27211) Bool)

(assert (=> b!1235712 (= res!823802 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235713 () Bool)

(declare-datatypes ((Unit!40958 0))(
  ( (Unit!40959) )
))
(declare-fun e!700555 () Unit!40958)

(declare-fun Unit!40960 () Unit!40958)

(assert (=> b!1235713 (= e!700555 Unit!40960)))

(declare-fun b!1235714 () Bool)

(declare-fun e!700554 () Bool)

(assert (=> b!1235714 (= e!700556 e!700554)))

(declare-fun res!823797 () Bool)

(assert (=> b!1235714 (=> (not res!823797) (not e!700554))))

(assert (=> b!1235714 (= res!823797 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38974 a!3835))))))

(declare-fun lt!560455 () Unit!40958)

(assert (=> b!1235714 (= lt!560455 e!700555)))

(declare-fun c!120817 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235714 (= c!120817 (validKeyInArray!0 (select (arr!38438 a!3835) from!3213)))))

(declare-fun res!823799 () Bool)

(assert (=> start!102816 (=> (not res!823799) (not e!700556))))

(assert (=> start!102816 (= res!823799 (and (bvslt (size!38974 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38974 a!3835))))))

(assert (=> start!102816 e!700556))

(declare-fun array_inv!29286 (array!79661) Bool)

(assert (=> start!102816 (array_inv!29286 a!3835)))

(assert (=> start!102816 true))

(declare-fun b!1235715 () Bool)

(declare-fun res!823801 () Bool)

(assert (=> b!1235715 (=> (not res!823801) (not e!700556))))

(declare-fun noDuplicate!1870 (List!27211) Bool)

(assert (=> b!1235715 (= res!823801 (noDuplicate!1870 acc!846))))

(declare-fun b!1235716 () Bool)

(declare-fun lt!560459 () Unit!40958)

(assert (=> b!1235716 (= e!700555 lt!560459)))

(declare-fun lt!560454 () List!27211)

(assert (=> b!1235716 (= lt!560454 (Cons!27207 (select (arr!38438 a!3835) from!3213) acc!846))))

(declare-fun lt!560458 () Unit!40958)

(declare-fun lemmaListSubSeqRefl!0 (List!27211) Unit!40958)

(assert (=> b!1235716 (= lt!560458 (lemmaListSubSeqRefl!0 lt!560454))))

(declare-fun subseq!545 (List!27211 List!27211) Bool)

(assert (=> b!1235716 (subseq!545 lt!560454 lt!560454)))

(declare-fun lt!560456 () Unit!40958)

(declare-fun subseqTail!38 (List!27211 List!27211) Unit!40958)

(assert (=> b!1235716 (= lt!560456 (subseqTail!38 lt!560454 lt!560454))))

(assert (=> b!1235716 (subseq!545 acc!846 lt!560454)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79661 List!27211 List!27211 (_ BitVec 32)) Unit!40958)

(assert (=> b!1235716 (= lt!560459 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560454 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1235716 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1235717 () Bool)

(declare-fun res!823798 () Bool)

(assert (=> b!1235717 (=> (not res!823798) (not e!700556))))

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7273 (List!27211 (_ BitVec 64)) Bool)

(assert (=> b!1235717 (= res!823798 (contains!7273 acc!846 k!2925))))

(declare-fun b!1235718 () Bool)

(declare-fun res!823800 () Bool)

(assert (=> b!1235718 (=> (not res!823800) (not e!700556))))

(assert (=> b!1235718 (= res!823800 (not (contains!7273 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235719 () Bool)

(declare-fun res!823803 () Bool)

(assert (=> b!1235719 (=> (not res!823803) (not e!700556))))

(assert (=> b!1235719 (= res!823803 (not (contains!7273 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235720 () Bool)

(assert (=> b!1235720 (= e!700554 false)))

(declare-fun lt!560457 () Bool)

(assert (=> b!1235720 (= lt!560457 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(assert (= (and start!102816 res!823799) b!1235715))

(assert (= (and b!1235715 res!823801) b!1235719))

(assert (= (and b!1235719 res!823803) b!1235718))

(assert (= (and b!1235718 res!823800) b!1235712))

(assert (= (and b!1235712 res!823802) b!1235717))

(assert (= (and b!1235717 res!823798) b!1235711))

(assert (= (and b!1235711 res!823804) b!1235714))

(assert (= (and b!1235714 c!120817) b!1235716))

(assert (= (and b!1235714 (not c!120817)) b!1235713))

(assert (= (and b!1235714 res!823797) b!1235720))

(declare-fun m!1139575 () Bool)

(assert (=> b!1235719 m!1139575))

(declare-fun m!1139577 () Bool)

(assert (=> b!1235712 m!1139577))

(declare-fun m!1139579 () Bool)

(assert (=> b!1235716 m!1139579))

(declare-fun m!1139581 () Bool)

(assert (=> b!1235716 m!1139581))

(declare-fun m!1139583 () Bool)

(assert (=> b!1235716 m!1139583))

(declare-fun m!1139585 () Bool)

(assert (=> b!1235716 m!1139585))

(declare-fun m!1139587 () Bool)

(assert (=> b!1235716 m!1139587))

(declare-fun m!1139589 () Bool)

(assert (=> b!1235716 m!1139589))

(declare-fun m!1139591 () Bool)

(assert (=> b!1235716 m!1139591))

(declare-fun m!1139593 () Bool)

(assert (=> b!1235717 m!1139593))

(declare-fun m!1139595 () Bool)

(assert (=> b!1235718 m!1139595))

(declare-fun m!1139597 () Bool)

(assert (=> b!1235715 m!1139597))

(assert (=> b!1235720 m!1139585))

(declare-fun m!1139599 () Bool)

(assert (=> start!102816 m!1139599))

(assert (=> b!1235714 m!1139587))

(assert (=> b!1235714 m!1139587))

(declare-fun m!1139601 () Bool)

(assert (=> b!1235714 m!1139601))

(push 1)

