; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103234 () Bool)

(assert start!103234)

(declare-fun b!1238663 () Bool)

(declare-fun e!702143 () Bool)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1238663 (= e!702143 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!27290 0))(
  ( (Nil!27287) (Cons!27286 (h!28504 (_ BitVec 64)) (t!40745 List!27290)) )
))
(declare-fun acc!846 () List!27290)

(declare-fun lt!561498 () List!27290)

(declare-fun subseq!581 (List!27290 List!27290) Bool)

(assert (=> b!1238663 (subseq!581 acc!846 lt!561498)))

(declare-datatypes ((Unit!41031 0))(
  ( (Unit!41032) )
))
(declare-fun lt!561500 () Unit!41031)

(declare-fun subseqTail!68 (List!27290 List!27290) Unit!41031)

(assert (=> b!1238663 (= lt!561500 (subseqTail!68 lt!561498 lt!561498))))

(assert (=> b!1238663 (subseq!581 lt!561498 lt!561498)))

(declare-fun lt!561499 () Unit!41031)

(declare-fun lemmaListSubSeqRefl!0 (List!27290) Unit!41031)

(assert (=> b!1238663 (= lt!561499 (lemmaListSubSeqRefl!0 lt!561498))))

(declare-datatypes ((array!79808 0))(
  ( (array!79809 (arr!38504 (Array (_ BitVec 32) (_ BitVec 64))) (size!39041 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79808)

(assert (=> b!1238663 (= lt!561498 (Cons!27286 (select (arr!38504 a!3835) from!3213) acc!846))))

(declare-fun res!825742 () Bool)

(assert (=> start!103234 (=> (not res!825742) (not e!702143))))

(assert (=> start!103234 (= res!825742 (and (bvslt (size!39041 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39041 a!3835))))))

(assert (=> start!103234 e!702143))

(declare-fun array_inv!29442 (array!79808) Bool)

(assert (=> start!103234 (array_inv!29442 a!3835)))

(assert (=> start!103234 true))

(declare-fun b!1238664 () Bool)

(declare-fun res!825744 () Bool)

(assert (=> b!1238664 (=> (not res!825744) (not e!702143))))

(assert (=> b!1238664 (= res!825744 (not (= from!3213 (bvsub (size!39041 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1238665 () Bool)

(declare-fun res!825746 () Bool)

(assert (=> b!1238665 (=> (not res!825746) (not e!702143))))

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7361 (List!27290 (_ BitVec 64)) Bool)

(assert (=> b!1238665 (= res!825746 (contains!7361 acc!846 k0!2925))))

(declare-fun b!1238666 () Bool)

(declare-fun res!825745 () Bool)

(assert (=> b!1238666 (=> (not res!825745) (not e!702143))))

(assert (=> b!1238666 (= res!825745 (not (contains!7361 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238667 () Bool)

(declare-fun res!825741 () Bool)

(assert (=> b!1238667 (=> (not res!825741) (not e!702143))))

(assert (=> b!1238667 (= res!825741 (not (contains!7361 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1238668 () Bool)

(declare-fun res!825743 () Bool)

(assert (=> b!1238668 (=> (not res!825743) (not e!702143))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1238668 (= res!825743 (validKeyInArray!0 (select (arr!38504 a!3835) from!3213)))))

(declare-fun b!1238669 () Bool)

(declare-fun res!825747 () Bool)

(assert (=> b!1238669 (=> (not res!825747) (not e!702143))))

(declare-fun noDuplicate!1942 (List!27290) Bool)

(assert (=> b!1238669 (= res!825747 (noDuplicate!1942 acc!846))))

(declare-fun b!1238670 () Bool)

(declare-fun res!825740 () Bool)

(assert (=> b!1238670 (=> (not res!825740) (not e!702143))))

(declare-fun arrayNoDuplicates!0 (array!79808 (_ BitVec 32) List!27290) Bool)

(assert (=> b!1238670 (= res!825740 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(assert (= (and start!103234 res!825742) b!1238669))

(assert (= (and b!1238669 res!825747) b!1238667))

(assert (= (and b!1238667 res!825741) b!1238666))

(assert (= (and b!1238666 res!825745) b!1238670))

(assert (= (and b!1238670 res!825740) b!1238665))

(assert (= (and b!1238665 res!825746) b!1238664))

(assert (= (and b!1238664 res!825744) b!1238668))

(assert (= (and b!1238668 res!825743) b!1238663))

(declare-fun m!1142705 () Bool)

(assert (=> start!103234 m!1142705))

(declare-fun m!1142707 () Bool)

(assert (=> b!1238669 m!1142707))

(declare-fun m!1142709 () Bool)

(assert (=> b!1238666 m!1142709))

(declare-fun m!1142711 () Bool)

(assert (=> b!1238663 m!1142711))

(declare-fun m!1142713 () Bool)

(assert (=> b!1238663 m!1142713))

(declare-fun m!1142715 () Bool)

(assert (=> b!1238663 m!1142715))

(declare-fun m!1142717 () Bool)

(assert (=> b!1238663 m!1142717))

(declare-fun m!1142719 () Bool)

(assert (=> b!1238663 m!1142719))

(declare-fun m!1142721 () Bool)

(assert (=> b!1238665 m!1142721))

(declare-fun m!1142723 () Bool)

(assert (=> b!1238667 m!1142723))

(declare-fun m!1142725 () Bool)

(assert (=> b!1238670 m!1142725))

(assert (=> b!1238668 m!1142719))

(assert (=> b!1238668 m!1142719))

(declare-fun m!1142727 () Bool)

(assert (=> b!1238668 m!1142727))

(check-sat (not b!1238666) (not b!1238669) (not b!1238667) (not b!1238670) (not b!1238668) (not b!1238665) (not start!103234) (not b!1238663))
(check-sat)
