; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103438 () Bool)

(assert start!103438)

(declare-fun b!1240135 () Bool)

(declare-fun res!826951 () Bool)

(declare-fun e!702947 () Bool)

(assert (=> b!1240135 (=> (not res!826951) (not e!702947))))

(declare-datatypes ((List!27317 0))(
  ( (Nil!27314) (Cons!27313 (h!28531 (_ BitVec 64)) (t!40772 List!27317)) )
))
(declare-fun acc!846 () List!27317)

(declare-fun noDuplicate!1969 (List!27317) Bool)

(assert (=> b!1240135 (= res!826951 (noDuplicate!1969 acc!846))))

(declare-fun b!1240136 () Bool)

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79871 0))(
  ( (array!79872 (arr!38531 (Array (_ BitVec 32) (_ BitVec 64))) (size!39068 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79871)

(assert (=> b!1240136 (= e!702947 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!3213) (size!39068 a!3835))))))

(declare-datatypes ((Unit!41107 0))(
  ( (Unit!41108) )
))
(declare-fun lt!561931 () Unit!41107)

(declare-fun e!702945 () Unit!41107)

(assert (=> b!1240136 (= lt!561931 e!702945)))

(declare-fun c!121460 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1240136 (= c!121460 (validKeyInArray!0 (select (arr!38531 a!3835) from!3213)))))

(declare-fun b!1240137 () Bool)

(declare-fun res!826955 () Bool)

(assert (=> b!1240137 (=> (not res!826955) (not e!702947))))

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7388 (List!27317 (_ BitVec 64)) Bool)

(assert (=> b!1240137 (= res!826955 (contains!7388 acc!846 k0!2925))))

(declare-fun b!1240138 () Bool)

(declare-fun res!826953 () Bool)

(assert (=> b!1240138 (=> (not res!826953) (not e!702947))))

(assert (=> b!1240138 (= res!826953 (not (contains!7388 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1240139 () Bool)

(declare-fun res!826952 () Bool)

(assert (=> b!1240139 (=> (not res!826952) (not e!702947))))

(declare-fun arrayNoDuplicates!0 (array!79871 (_ BitVec 32) List!27317) Bool)

(assert (=> b!1240139 (= res!826952 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1240140 () Bool)

(declare-fun Unit!41109 () Unit!41107)

(assert (=> b!1240140 (= e!702945 Unit!41109)))

(declare-fun b!1240141 () Bool)

(declare-fun res!826956 () Bool)

(assert (=> b!1240141 (=> (not res!826956) (not e!702947))))

(assert (=> b!1240141 (= res!826956 (not (contains!7388 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1240142 () Bool)

(declare-fun lt!561932 () Unit!41107)

(assert (=> b!1240142 (= e!702945 lt!561932)))

(declare-fun lt!561928 () List!27317)

(assert (=> b!1240142 (= lt!561928 (Cons!27313 (select (arr!38531 a!3835) from!3213) acc!846))))

(declare-fun lt!561930 () Unit!41107)

(declare-fun lemmaListSubSeqRefl!0 (List!27317) Unit!41107)

(assert (=> b!1240142 (= lt!561930 (lemmaListSubSeqRefl!0 lt!561928))))

(declare-fun subseq!608 (List!27317 List!27317) Bool)

(assert (=> b!1240142 (subseq!608 lt!561928 lt!561928)))

(declare-fun lt!561929 () Unit!41107)

(declare-fun subseqTail!95 (List!27317 List!27317) Unit!41107)

(assert (=> b!1240142 (= lt!561929 (subseqTail!95 lt!561928 lt!561928))))

(assert (=> b!1240142 (subseq!608 acc!846 lt!561928)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79871 List!27317 List!27317 (_ BitVec 32)) Unit!41107)

(assert (=> b!1240142 (= lt!561932 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!561928 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1240142 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun res!826954 () Bool)

(assert (=> start!103438 (=> (not res!826954) (not e!702947))))

(assert (=> start!103438 (= res!826954 (and (bvslt (size!39068 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39068 a!3835))))))

(assert (=> start!103438 e!702947))

(declare-fun array_inv!29469 (array!79871) Bool)

(assert (=> start!103438 (array_inv!29469 a!3835)))

(assert (=> start!103438 true))

(declare-fun b!1240143 () Bool)

(declare-fun res!826950 () Bool)

(assert (=> b!1240143 (=> (not res!826950) (not e!702947))))

(assert (=> b!1240143 (= res!826950 (not (= from!3213 (bvsub (size!39068 a!3835) #b00000000000000000000000000000001))))))

(assert (= (and start!103438 res!826954) b!1240135))

(assert (= (and b!1240135 res!826951) b!1240138))

(assert (= (and b!1240138 res!826953) b!1240141))

(assert (= (and b!1240141 res!826956) b!1240139))

(assert (= (and b!1240139 res!826952) b!1240137))

(assert (= (and b!1240137 res!826955) b!1240143))

(assert (= (and b!1240143 res!826950) b!1240136))

(assert (= (and b!1240136 c!121460) b!1240142))

(assert (= (and b!1240136 (not c!121460)) b!1240140))

(declare-fun m!1143971 () Bool)

(assert (=> start!103438 m!1143971))

(declare-fun m!1143973 () Bool)

(assert (=> b!1240138 m!1143973))

(declare-fun m!1143975 () Bool)

(assert (=> b!1240136 m!1143975))

(assert (=> b!1240136 m!1143975))

(declare-fun m!1143977 () Bool)

(assert (=> b!1240136 m!1143977))

(declare-fun m!1143979 () Bool)

(assert (=> b!1240142 m!1143979))

(declare-fun m!1143981 () Bool)

(assert (=> b!1240142 m!1143981))

(declare-fun m!1143983 () Bool)

(assert (=> b!1240142 m!1143983))

(declare-fun m!1143985 () Bool)

(assert (=> b!1240142 m!1143985))

(assert (=> b!1240142 m!1143975))

(declare-fun m!1143987 () Bool)

(assert (=> b!1240142 m!1143987))

(declare-fun m!1143989 () Bool)

(assert (=> b!1240142 m!1143989))

(declare-fun m!1143991 () Bool)

(assert (=> b!1240137 m!1143991))

(declare-fun m!1143993 () Bool)

(assert (=> b!1240135 m!1143993))

(declare-fun m!1143995 () Bool)

(assert (=> b!1240139 m!1143995))

(declare-fun m!1143997 () Bool)

(assert (=> b!1240141 m!1143997))

(check-sat (not b!1240136) (not b!1240135) (not b!1240138) (not b!1240142) (not b!1240137) (not start!103438) (not b!1240139) (not b!1240141))
(check-sat)
