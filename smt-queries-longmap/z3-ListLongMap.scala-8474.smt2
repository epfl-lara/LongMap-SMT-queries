; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103198 () Bool)

(assert start!103198)

(declare-fun b!1238743 () Bool)

(declare-fun res!826386 () Bool)

(declare-fun e!702049 () Bool)

(assert (=> b!1238743 (=> (not res!826386) (not e!702049))))

(declare-datatypes ((List!27354 0))(
  ( (Nil!27351) (Cons!27350 (h!28559 (_ BitVec 64)) (t!40808 List!27354)) )
))
(declare-fun acc!846 () List!27354)

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7326 (List!27354 (_ BitVec 64)) Bool)

(assert (=> b!1238743 (= res!826386 (contains!7326 acc!846 k0!2925))))

(declare-fun res!826387 () Bool)

(assert (=> start!103198 (=> (not res!826387) (not e!702049))))

(declare-datatypes ((array!79756 0))(
  ( (array!79757 (arr!38480 (Array (_ BitVec 32) (_ BitVec 64))) (size!39018 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79756)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> start!103198 (= res!826387 (and (bvslt (size!39018 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39018 a!3835))))))

(assert (=> start!103198 e!702049))

(declare-fun array_inv!29463 (array!79756) Bool)

(assert (=> start!103198 (array_inv!29463 a!3835)))

(assert (=> start!103198 true))

(declare-fun b!1238744 () Bool)

(declare-fun res!826385 () Bool)

(assert (=> b!1238744 (=> (not res!826385) (not e!702049))))

(declare-fun arrayNoDuplicates!0 (array!79756 (_ BitVec 32) List!27354) Bool)

(assert (=> b!1238744 (= res!826385 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238745 () Bool)

(declare-fun res!826389 () Bool)

(assert (=> b!1238745 (=> (not res!826389) (not e!702049))))

(assert (=> b!1238745 (= res!826389 (not (contains!7326 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238746 () Bool)

(declare-datatypes ((Unit!40979 0))(
  ( (Unit!40980) )
))
(declare-fun e!702050 () Unit!40979)

(declare-fun Unit!40981 () Unit!40979)

(assert (=> b!1238746 (= e!702050 Unit!40981)))

(declare-fun b!1238747 () Bool)

(declare-fun res!826388 () Bool)

(assert (=> b!1238747 (=> (not res!826388) (not e!702049))))

(assert (=> b!1238747 (= res!826388 (not (= from!3213 (bvsub (size!39018 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238748 () Bool)

(declare-fun lt!561272 () Unit!40979)

(assert (=> b!1238748 (= e!702050 lt!561272)))

(declare-fun lt!561269 () List!27354)

(assert (=> b!1238748 (= lt!561269 (Cons!27350 (select (arr!38480 a!3835) from!3213) acc!846))))

(declare-fun lt!561271 () Unit!40979)

(declare-fun lemmaListSubSeqRefl!0 (List!27354) Unit!40979)

(assert (=> b!1238748 (= lt!561271 (lemmaListSubSeqRefl!0 lt!561269))))

(declare-fun subseq!608 (List!27354 List!27354) Bool)

(assert (=> b!1238748 (subseq!608 lt!561269 lt!561269)))

(declare-fun lt!561270 () Unit!40979)

(declare-fun subseqTail!95 (List!27354 List!27354) Unit!40979)

(assert (=> b!1238748 (= lt!561270 (subseqTail!95 lt!561269 lt!561269))))

(assert (=> b!1238748 (subseq!608 acc!846 lt!561269)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79756 List!27354 List!27354 (_ BitVec 32)) Unit!40979)

(assert (=> b!1238748 (= lt!561272 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561269 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1238748 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun b!1238749 () Bool)

(declare-fun res!826391 () Bool)

(assert (=> b!1238749 (=> (not res!826391) (not e!702049))))

(declare-fun noDuplicate!1969 (List!27354) Bool)

(assert (=> b!1238749 (= res!826391 (noDuplicate!1969 acc!846))))

(declare-fun b!1238750 () Bool)

(declare-fun res!826390 () Bool)

(assert (=> b!1238750 (=> (not res!826390) (not e!702049))))

(assert (=> b!1238750 (= res!826390 (not (contains!7326 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238751 () Bool)

(assert (=> b!1238751 (= e!702049 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!3213) (size!39018 a!3835))))))

(declare-fun lt!561268 () Unit!40979)

(assert (=> b!1238751 (= lt!561268 e!702050)))

(declare-fun c!121042 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238751 (= c!121042 (validKeyInArray!0 (select (arr!38480 a!3835) from!3213)))))

(assert (= (and start!103198 res!826387) b!1238749))

(assert (= (and b!1238749 res!826391) b!1238745))

(assert (= (and b!1238745 res!826389) b!1238750))

(assert (= (and b!1238750 res!826390) b!1238744))

(assert (= (and b!1238744 res!826385) b!1238743))

(assert (= (and b!1238743 res!826386) b!1238747))

(assert (= (and b!1238747 res!826388) b!1238751))

(assert (= (and b!1238751 c!121042) b!1238748))

(assert (= (and b!1238751 (not c!121042)) b!1238746))

(declare-fun m!1141827 () Bool)

(assert (=> start!103198 m!1141827))

(declare-fun m!1141829 () Bool)

(assert (=> b!1238743 m!1141829))

(declare-fun m!1141831 () Bool)

(assert (=> b!1238750 m!1141831))

(declare-fun m!1141833 () Bool)

(assert (=> b!1238751 m!1141833))

(assert (=> b!1238751 m!1141833))

(declare-fun m!1141835 () Bool)

(assert (=> b!1238751 m!1141835))

(declare-fun m!1141837 () Bool)

(assert (=> b!1238749 m!1141837))

(declare-fun m!1141839 () Bool)

(assert (=> b!1238745 m!1141839))

(declare-fun m!1141841 () Bool)

(assert (=> b!1238748 m!1141841))

(declare-fun m!1141843 () Bool)

(assert (=> b!1238748 m!1141843))

(declare-fun m!1141845 () Bool)

(assert (=> b!1238748 m!1141845))

(declare-fun m!1141847 () Bool)

(assert (=> b!1238748 m!1141847))

(declare-fun m!1141849 () Bool)

(assert (=> b!1238748 m!1141849))

(declare-fun m!1141851 () Bool)

(assert (=> b!1238748 m!1141851))

(assert (=> b!1238748 m!1141833))

(declare-fun m!1141853 () Bool)

(assert (=> b!1238744 m!1141853))

(check-sat (not b!1238751) (not b!1238745) (not start!103198) (not b!1238748) (not b!1238749) (not b!1238744) (not b!1238750) (not b!1238743))
(check-sat)
