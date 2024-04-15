; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103192 () Bool)

(assert start!103192)

(declare-fun b!1238662 () Bool)

(declare-datatypes ((Unit!40970 0))(
  ( (Unit!40971) )
))
(declare-fun e!702023 () Unit!40970)

(declare-fun Unit!40972 () Unit!40970)

(assert (=> b!1238662 (= e!702023 Unit!40972)))

(declare-fun b!1238663 () Bool)

(declare-fun e!702022 () Bool)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1238663 (= e!702022 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun lt!561223 () Unit!40970)

(assert (=> b!1238663 (= lt!561223 e!702023)))

(declare-fun c!121033 () Bool)

(declare-datatypes ((array!79750 0))(
  ( (array!79751 (arr!38477 (Array (_ BitVec 32) (_ BitVec 64))) (size!39015 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79750)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238663 (= c!121033 (validKeyInArray!0 (select (arr!38477 a!3835) from!3213)))))

(declare-fun b!1238664 () Bool)

(declare-fun res!826325 () Bool)

(assert (=> b!1238664 (=> (not res!826325) (not e!702022))))

(assert (=> b!1238664 (= res!826325 (not (= from!3213 (bvsub (size!39015 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238665 () Bool)

(declare-fun lt!561227 () Unit!40970)

(assert (=> b!1238665 (= e!702023 lt!561227)))

(declare-datatypes ((List!27351 0))(
  ( (Nil!27348) (Cons!27347 (h!28556 (_ BitVec 64)) (t!40805 List!27351)) )
))
(declare-fun lt!561224 () List!27351)

(declare-fun acc!846 () List!27351)

(assert (=> b!1238665 (= lt!561224 (Cons!27347 (select (arr!38477 a!3835) from!3213) acc!846))))

(declare-fun lt!561225 () Unit!40970)

(declare-fun lemmaListSubSeqRefl!0 (List!27351) Unit!40970)

(assert (=> b!1238665 (= lt!561225 (lemmaListSubSeqRefl!0 lt!561224))))

(declare-fun subseq!605 (List!27351 List!27351) Bool)

(assert (=> b!1238665 (subseq!605 lt!561224 lt!561224)))

(declare-fun lt!561226 () Unit!40970)

(declare-fun subseqTail!92 (List!27351 List!27351) Unit!40970)

(assert (=> b!1238665 (= lt!561226 (subseqTail!92 lt!561224 lt!561224))))

(assert (=> b!1238665 (subseq!605 acc!846 lt!561224)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79750 List!27351 List!27351 (_ BitVec 32)) Unit!40970)

(assert (=> b!1238665 (= lt!561227 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561224 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79750 (_ BitVec 32) List!27351) Bool)

(assert (=> b!1238665 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun res!826326 () Bool)

(assert (=> start!103192 (=> (not res!826326) (not e!702022))))

(assert (=> start!103192 (= res!826326 (and (bvslt (size!39015 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39015 a!3835))))))

(assert (=> start!103192 e!702022))

(declare-fun array_inv!29460 (array!79750) Bool)

(assert (=> start!103192 (array_inv!29460 a!3835)))

(assert (=> start!103192 true))

(declare-fun b!1238666 () Bool)

(declare-fun res!826322 () Bool)

(assert (=> b!1238666 (=> (not res!826322) (not e!702022))))

(assert (=> b!1238666 (= res!826322 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1238667 () Bool)

(declare-fun res!826323 () Bool)

(assert (=> b!1238667 (=> (not res!826323) (not e!702022))))

(declare-fun contains!7323 (List!27351 (_ BitVec 64)) Bool)

(assert (=> b!1238667 (= res!826323 (not (contains!7323 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238668 () Bool)

(declare-fun res!826328 () Bool)

(assert (=> b!1238668 (=> (not res!826328) (not e!702022))))

(declare-fun noDuplicate!1966 (List!27351) Bool)

(assert (=> b!1238668 (= res!826328 (noDuplicate!1966 acc!846))))

(declare-fun b!1238669 () Bool)

(declare-fun res!826324 () Bool)

(assert (=> b!1238669 (=> (not res!826324) (not e!702022))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1238669 (= res!826324 (contains!7323 acc!846 k0!2925))))

(declare-fun b!1238670 () Bool)

(declare-fun res!826327 () Bool)

(assert (=> b!1238670 (=> (not res!826327) (not e!702022))))

(assert (=> b!1238670 (= res!826327 (not (contains!7323 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!103192 res!826326) b!1238668))

(assert (= (and b!1238668 res!826328) b!1238667))

(assert (= (and b!1238667 res!826323) b!1238670))

(assert (= (and b!1238670 res!826327) b!1238666))

(assert (= (and b!1238666 res!826322) b!1238669))

(assert (= (and b!1238669 res!826324) b!1238664))

(assert (= (and b!1238664 res!826325) b!1238663))

(assert (= (and b!1238663 c!121033) b!1238665))

(assert (= (and b!1238663 (not c!121033)) b!1238662))

(declare-fun m!1141743 () Bool)

(assert (=> b!1238667 m!1141743))

(declare-fun m!1141745 () Bool)

(assert (=> b!1238668 m!1141745))

(declare-fun m!1141747 () Bool)

(assert (=> b!1238669 m!1141747))

(declare-fun m!1141749 () Bool)

(assert (=> b!1238666 m!1141749))

(declare-fun m!1141751 () Bool)

(assert (=> start!103192 m!1141751))

(declare-fun m!1141753 () Bool)

(assert (=> b!1238663 m!1141753))

(assert (=> b!1238663 m!1141753))

(declare-fun m!1141755 () Bool)

(assert (=> b!1238663 m!1141755))

(declare-fun m!1141757 () Bool)

(assert (=> b!1238670 m!1141757))

(declare-fun m!1141759 () Bool)

(assert (=> b!1238665 m!1141759))

(declare-fun m!1141761 () Bool)

(assert (=> b!1238665 m!1141761))

(declare-fun m!1141763 () Bool)

(assert (=> b!1238665 m!1141763))

(declare-fun m!1141765 () Bool)

(assert (=> b!1238665 m!1141765))

(assert (=> b!1238665 m!1141753))

(declare-fun m!1141767 () Bool)

(assert (=> b!1238665 m!1141767))

(declare-fun m!1141769 () Bool)

(assert (=> b!1238665 m!1141769))

(check-sat (not b!1238669) (not b!1238665) (not b!1238663) (not b!1238666) (not b!1238668) (not start!103192) (not b!1238670) (not b!1238667))
(check-sat)
