; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102764 () Bool)

(assert start!102764)

(declare-fun b!1234851 () Bool)

(declare-fun res!823023 () Bool)

(declare-fun e!700283 () Bool)

(assert (=> b!1234851 (=> (not res!823023) (not e!700283))))

(declare-datatypes ((List!27185 0))(
  ( (Nil!27182) (Cons!27181 (h!28390 (_ BitVec 64)) (t!40648 List!27185)) )
))
(declare-fun acc!846 () List!27185)

(declare-fun noDuplicate!1844 (List!27185) Bool)

(assert (=> b!1234851 (= res!823023 (noDuplicate!1844 acc!846))))

(declare-fun b!1234852 () Bool)

(declare-fun e!700284 () Bool)

(assert (=> b!1234852 (= e!700283 (not e!700284))))

(declare-fun res!823022 () Bool)

(assert (=> b!1234852 (=> res!823022 e!700284)))

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1234852 (= res!823022 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun lt!560026 () List!27185)

(declare-fun subseq!519 (List!27185 List!27185) Bool)

(assert (=> b!1234852 (subseq!519 acc!846 lt!560026)))

(declare-datatypes ((Unit!40894 0))(
  ( (Unit!40895) )
))
(declare-fun lt!560030 () Unit!40894)

(declare-fun subseqTail!12 (List!27185 List!27185) Unit!40894)

(assert (=> b!1234852 (= lt!560030 (subseqTail!12 lt!560026 lt!560026))))

(assert (=> b!1234852 (subseq!519 lt!560026 lt!560026)))

(declare-fun lt!560028 () Unit!40894)

(declare-fun lemmaListSubSeqRefl!0 (List!27185) Unit!40894)

(assert (=> b!1234852 (= lt!560028 (lemmaListSubSeqRefl!0 lt!560026))))

(declare-datatypes ((array!79609 0))(
  ( (array!79610 (arr!38412 (Array (_ BitVec 32) (_ BitVec 64))) (size!38948 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79609)

(assert (=> b!1234852 (= lt!560026 (Cons!27181 (select (arr!38412 a!3835) from!3213) acc!846))))

(declare-fun b!1234853 () Bool)

(declare-fun res!823020 () Bool)

(assert (=> b!1234853 (=> res!823020 e!700284)))

(declare-fun contains!7247 (List!27185 (_ BitVec 64)) Bool)

(assert (=> b!1234853 (= res!823020 (contains!7247 lt!560026 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234854 () Bool)

(declare-fun res!823016 () Bool)

(assert (=> b!1234854 (=> res!823016 e!700284)))

(assert (=> b!1234854 (= res!823016 (contains!7247 lt!560026 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234855 () Bool)

(declare-fun res!823021 () Bool)

(assert (=> b!1234855 (=> (not res!823021) (not e!700283))))

(assert (=> b!1234855 (= res!823021 (not (contains!7247 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234856 () Bool)

(declare-fun res!823019 () Bool)

(assert (=> b!1234856 (=> (not res!823019) (not e!700283))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1234856 (= res!823019 (contains!7247 acc!846 k0!2925))))

(declare-fun b!1234857 () Bool)

(declare-fun res!823014 () Bool)

(assert (=> b!1234857 (=> (not res!823014) (not e!700283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234857 (= res!823014 (validKeyInArray!0 (select (arr!38412 a!3835) from!3213)))))

(declare-fun b!1234858 () Bool)

(assert (=> b!1234858 (= e!700284 true)))

(declare-fun lt!560029 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79609 (_ BitVec 32) List!27185) Bool)

(assert (=> b!1234858 (= lt!560029 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560026))))

(declare-fun lt!560027 () Unit!40894)

(declare-fun noDuplicateSubseq!66 (List!27185 List!27185) Unit!40894)

(assert (=> b!1234858 (= lt!560027 (noDuplicateSubseq!66 acc!846 lt!560026))))

(declare-fun b!1234859 () Bool)

(declare-fun res!823017 () Bool)

(assert (=> b!1234859 (=> (not res!823017) (not e!700283))))

(assert (=> b!1234859 (= res!823017 (not (contains!7247 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234860 () Bool)

(declare-fun res!823013 () Bool)

(assert (=> b!1234860 (=> (not res!823013) (not e!700283))))

(assert (=> b!1234860 (= res!823013 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun res!823015 () Bool)

(assert (=> start!102764 (=> (not res!823015) (not e!700283))))

(assert (=> start!102764 (= res!823015 (and (bvslt (size!38948 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38948 a!3835))))))

(assert (=> start!102764 e!700283))

(declare-fun array_inv!29260 (array!79609) Bool)

(assert (=> start!102764 (array_inv!29260 a!3835)))

(assert (=> start!102764 true))

(declare-fun b!1234861 () Bool)

(declare-fun res!823024 () Bool)

(assert (=> b!1234861 (=> res!823024 e!700284)))

(assert (=> b!1234861 (= res!823024 (not (noDuplicate!1844 lt!560026)))))

(declare-fun b!1234862 () Bool)

(declare-fun res!823018 () Bool)

(assert (=> b!1234862 (=> (not res!823018) (not e!700283))))

(assert (=> b!1234862 (= res!823018 (not (= from!3213 (bvsub (size!38948 a!3835) #b00000000000000000000000000000001))))))

(assert (= (and start!102764 res!823015) b!1234851))

(assert (= (and b!1234851 res!823023) b!1234859))

(assert (= (and b!1234859 res!823017) b!1234855))

(assert (= (and b!1234855 res!823021) b!1234860))

(assert (= (and b!1234860 res!823013) b!1234856))

(assert (= (and b!1234856 res!823019) b!1234862))

(assert (= (and b!1234862 res!823018) b!1234857))

(assert (= (and b!1234857 res!823014) b!1234852))

(assert (= (and b!1234852 (not res!823022)) b!1234861))

(assert (= (and b!1234861 (not res!823024)) b!1234854))

(assert (= (and b!1234854 (not res!823016)) b!1234853))

(assert (= (and b!1234853 (not res!823020)) b!1234858))

(declare-fun m!1138763 () Bool)

(assert (=> b!1234859 m!1138763))

(declare-fun m!1138765 () Bool)

(assert (=> b!1234861 m!1138765))

(declare-fun m!1138767 () Bool)

(assert (=> b!1234851 m!1138767))

(declare-fun m!1138769 () Bool)

(assert (=> b!1234857 m!1138769))

(assert (=> b!1234857 m!1138769))

(declare-fun m!1138771 () Bool)

(assert (=> b!1234857 m!1138771))

(declare-fun m!1138773 () Bool)

(assert (=> b!1234856 m!1138773))

(declare-fun m!1138775 () Bool)

(assert (=> start!102764 m!1138775))

(declare-fun m!1138777 () Bool)

(assert (=> b!1234858 m!1138777))

(declare-fun m!1138779 () Bool)

(assert (=> b!1234858 m!1138779))

(declare-fun m!1138781 () Bool)

(assert (=> b!1234855 m!1138781))

(declare-fun m!1138783 () Bool)

(assert (=> b!1234853 m!1138783))

(declare-fun m!1138785 () Bool)

(assert (=> b!1234852 m!1138785))

(declare-fun m!1138787 () Bool)

(assert (=> b!1234852 m!1138787))

(declare-fun m!1138789 () Bool)

(assert (=> b!1234852 m!1138789))

(declare-fun m!1138791 () Bool)

(assert (=> b!1234852 m!1138791))

(assert (=> b!1234852 m!1138769))

(declare-fun m!1138793 () Bool)

(assert (=> b!1234854 m!1138793))

(declare-fun m!1138795 () Bool)

(assert (=> b!1234860 m!1138795))

(check-sat (not b!1234856) (not b!1234851) (not b!1234858) (not b!1234857) (not b!1234855) (not b!1234860) (not b!1234852) (not b!1234859) (not b!1234853) (not start!102764) (not b!1234861) (not b!1234854))
(check-sat)
