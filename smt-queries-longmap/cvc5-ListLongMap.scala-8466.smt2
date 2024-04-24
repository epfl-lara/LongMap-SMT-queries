; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103244 () Bool)

(assert start!103244)

(declare-fun b!1238783 () Bool)

(declare-fun e!702172 () Bool)

(assert (=> b!1238783 (= e!702172 (not true))))

(declare-datatypes ((List!27295 0))(
  ( (Nil!27292) (Cons!27291 (h!28509 (_ BitVec 64)) (t!40750 List!27295)) )
))
(declare-fun acc!846 () List!27295)

(declare-fun lt!561545 () List!27295)

(declare-fun subseq!586 (List!27295 List!27295) Bool)

(assert (=> b!1238783 (subseq!586 acc!846 lt!561545)))

(declare-datatypes ((Unit!41041 0))(
  ( (Unit!41042) )
))
(declare-fun lt!561543 () Unit!41041)

(declare-fun subseqTail!73 (List!27295 List!27295) Unit!41041)

(assert (=> b!1238783 (= lt!561543 (subseqTail!73 lt!561545 lt!561545))))

(assert (=> b!1238783 (subseq!586 lt!561545 lt!561545)))

(declare-fun lt!561544 () Unit!41041)

(declare-fun lemmaListSubSeqRefl!0 (List!27295) Unit!41041)

(assert (=> b!1238783 (= lt!561544 (lemmaListSubSeqRefl!0 lt!561545))))

(declare-datatypes ((array!79818 0))(
  ( (array!79819 (arr!38509 (Array (_ BitVec 32) (_ BitVec 64))) (size!39046 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79818)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1238783 (= lt!561545 (Cons!27291 (select (arr!38509 a!3835) from!3213) acc!846))))

(declare-fun b!1238784 () Bool)

(declare-fun res!825867 () Bool)

(assert (=> b!1238784 (=> (not res!825867) (not e!702172))))

(declare-fun contains!7366 (List!27295 (_ BitVec 64)) Bool)

(assert (=> b!1238784 (= res!825867 (not (contains!7366 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238785 () Bool)

(declare-fun res!825866 () Bool)

(assert (=> b!1238785 (=> (not res!825866) (not e!702172))))

(assert (=> b!1238785 (= res!825866 (not (contains!7366 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238786 () Bool)

(declare-fun res!825863 () Bool)

(assert (=> b!1238786 (=> (not res!825863) (not e!702172))))

(assert (=> b!1238786 (= res!825863 (not (= from!3213 (bvsub (size!39046 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238787 () Bool)

(declare-fun res!825862 () Bool)

(assert (=> b!1238787 (=> (not res!825862) (not e!702172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238787 (= res!825862 (validKeyInArray!0 (select (arr!38509 a!3835) from!3213)))))

(declare-fun b!1238788 () Bool)

(declare-fun res!825864 () Bool)

(assert (=> b!1238788 (=> (not res!825864) (not e!702172))))

(declare-fun arrayNoDuplicates!0 (array!79818 (_ BitVec 32) List!27295) Bool)

(assert (=> b!1238788 (= res!825864 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!825860 () Bool)

(assert (=> start!103244 (=> (not res!825860) (not e!702172))))

(assert (=> start!103244 (= res!825860 (and (bvslt (size!39046 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39046 a!3835))))))

(assert (=> start!103244 e!702172))

(declare-fun array_inv!29447 (array!79818) Bool)

(assert (=> start!103244 (array_inv!29447 a!3835)))

(assert (=> start!103244 true))

(declare-fun b!1238789 () Bool)

(declare-fun res!825861 () Bool)

(assert (=> b!1238789 (=> (not res!825861) (not e!702172))))

(declare-fun noDuplicate!1947 (List!27295) Bool)

(assert (=> b!1238789 (= res!825861 (noDuplicate!1947 acc!846))))

(declare-fun b!1238790 () Bool)

(declare-fun res!825865 () Bool)

(assert (=> b!1238790 (=> (not res!825865) (not e!702172))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1238790 (= res!825865 (contains!7366 acc!846 k!2925))))

(assert (= (and start!103244 res!825860) b!1238789))

(assert (= (and b!1238789 res!825861) b!1238785))

(assert (= (and b!1238785 res!825866) b!1238784))

(assert (= (and b!1238784 res!825867) b!1238788))

(assert (= (and b!1238788 res!825864) b!1238790))

(assert (= (and b!1238790 res!825865) b!1238786))

(assert (= (and b!1238786 res!825863) b!1238787))

(assert (= (and b!1238787 res!825862) b!1238783))

(declare-fun m!1142825 () Bool)

(assert (=> start!103244 m!1142825))

(declare-fun m!1142827 () Bool)

(assert (=> b!1238785 m!1142827))

(declare-fun m!1142829 () Bool)

(assert (=> b!1238788 m!1142829))

(declare-fun m!1142831 () Bool)

(assert (=> b!1238783 m!1142831))

(declare-fun m!1142833 () Bool)

(assert (=> b!1238783 m!1142833))

(declare-fun m!1142835 () Bool)

(assert (=> b!1238783 m!1142835))

(declare-fun m!1142837 () Bool)

(assert (=> b!1238783 m!1142837))

(declare-fun m!1142839 () Bool)

(assert (=> b!1238783 m!1142839))

(assert (=> b!1238787 m!1142839))

(assert (=> b!1238787 m!1142839))

(declare-fun m!1142841 () Bool)

(assert (=> b!1238787 m!1142841))

(declare-fun m!1142843 () Bool)

(assert (=> b!1238789 m!1142843))

(declare-fun m!1142845 () Bool)

(assert (=> b!1238784 m!1142845))

(declare-fun m!1142847 () Bool)

(assert (=> b!1238790 m!1142847))

(push 1)

(assert (not b!1238787))

(assert (not b!1238784))

(assert (not b!1238789))

(assert (not b!1238788))

(assert (not b!1238790))

(assert (not b!1238783))

(assert (not start!103244))

(assert (not b!1238785))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

