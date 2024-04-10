; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102830 () Bool)

(assert start!102830)

(declare-fun b!1235921 () Bool)

(declare-fun res!823965 () Bool)

(declare-fun e!700640 () Bool)

(assert (=> b!1235921 (=> (not res!823965) (not e!700640))))

(declare-datatypes ((List!27218 0))(
  ( (Nil!27215) (Cons!27214 (h!28423 (_ BitVec 64)) (t!40681 List!27218)) )
))
(declare-fun acc!846 () List!27218)

(declare-fun noDuplicate!1877 (List!27218) Bool)

(assert (=> b!1235921 (= res!823965 (noDuplicate!1877 acc!846))))

(declare-fun b!1235922 () Bool)

(declare-fun res!823969 () Bool)

(assert (=> b!1235922 (=> (not res!823969) (not e!700640))))

(declare-fun contains!7280 (List!27218 (_ BitVec 64)) Bool)

(assert (=> b!1235922 (= res!823969 (not (contains!7280 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235923 () Bool)

(declare-fun res!823971 () Bool)

(assert (=> b!1235923 (=> (not res!823971) (not e!700640))))

(declare-datatypes ((array!79675 0))(
  ( (array!79676 (arr!38445 (Array (_ BitVec 32) (_ BitVec 64))) (size!38981 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79675)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79675 (_ BitVec 32) List!27218) Bool)

(assert (=> b!1235923 (= res!823971 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235924 () Bool)

(declare-datatypes ((Unit!40979 0))(
  ( (Unit!40980) )
))
(declare-fun e!700638 () Unit!40979)

(declare-fun lt!560585 () Unit!40979)

(assert (=> b!1235924 (= e!700638 lt!560585)))

(declare-fun lt!560581 () List!27218)

(assert (=> b!1235924 (= lt!560581 (Cons!27214 (select (arr!38445 a!3835) from!3213) acc!846))))

(declare-fun lt!560584 () Unit!40979)

(declare-fun lemmaListSubSeqRefl!0 (List!27218) Unit!40979)

(assert (=> b!1235924 (= lt!560584 (lemmaListSubSeqRefl!0 lt!560581))))

(declare-fun subseq!552 (List!27218 List!27218) Bool)

(assert (=> b!1235924 (subseq!552 lt!560581 lt!560581)))

(declare-fun lt!560583 () Unit!40979)

(declare-fun subseqTail!45 (List!27218 List!27218) Unit!40979)

(assert (=> b!1235924 (= lt!560583 (subseqTail!45 lt!560581 lt!560581))))

(assert (=> b!1235924 (subseq!552 acc!846 lt!560581)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79675 List!27218 List!27218 (_ BitVec 32)) Unit!40979)

(assert (=> b!1235924 (= lt!560585 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560581 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(assert (=> b!1235924 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun res!823966 () Bool)

(assert (=> start!102830 (=> (not res!823966) (not e!700640))))

(assert (=> start!102830 (= res!823966 (and (bvslt (size!38981 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38981 a!3835))))))

(assert (=> start!102830 e!700640))

(declare-fun array_inv!29293 (array!79675) Bool)

(assert (=> start!102830 (array_inv!29293 a!3835)))

(assert (=> start!102830 true))

(declare-fun b!1235925 () Bool)

(declare-fun res!823970 () Bool)

(assert (=> b!1235925 (=> (not res!823970) (not e!700640))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1235925 (= res!823970 (contains!7280 acc!846 k0!2925))))

(declare-fun b!1235926 () Bool)

(declare-fun Unit!40981 () Unit!40979)

(assert (=> b!1235926 (= e!700638 Unit!40981)))

(declare-fun b!1235927 () Bool)

(declare-fun e!700641 () Bool)

(assert (=> b!1235927 (= e!700641 false)))

(declare-fun lt!560582 () Bool)

(assert (=> b!1235927 (= lt!560582 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235928 () Bool)

(declare-fun res!823967 () Bool)

(assert (=> b!1235928 (=> (not res!823967) (not e!700640))))

(assert (=> b!1235928 (= res!823967 (not (contains!7280 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235929 () Bool)

(assert (=> b!1235929 (= e!700640 e!700641)))

(declare-fun res!823968 () Bool)

(assert (=> b!1235929 (=> (not res!823968) (not e!700641))))

(assert (=> b!1235929 (= res!823968 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38981 a!3835))))))

(declare-fun lt!560580 () Unit!40979)

(assert (=> b!1235929 (= lt!560580 e!700638)))

(declare-fun c!120838 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235929 (= c!120838 (validKeyInArray!0 (select (arr!38445 a!3835) from!3213)))))

(declare-fun b!1235930 () Bool)

(declare-fun res!823972 () Bool)

(assert (=> b!1235930 (=> (not res!823972) (not e!700640))))

(assert (=> b!1235930 (= res!823972 (not (= from!3213 (bvsub (size!38981 a!3835) #b00000000000000000000000000000001))))))

(assert (= (and start!102830 res!823966) b!1235921))

(assert (= (and b!1235921 res!823965) b!1235922))

(assert (= (and b!1235922 res!823969) b!1235928))

(assert (= (and b!1235928 res!823967) b!1235923))

(assert (= (and b!1235923 res!823971) b!1235925))

(assert (= (and b!1235925 res!823970) b!1235930))

(assert (= (and b!1235930 res!823972) b!1235929))

(assert (= (and b!1235929 c!120838) b!1235924))

(assert (= (and b!1235929 (not c!120838)) b!1235926))

(assert (= (and b!1235929 res!823968) b!1235927))

(declare-fun m!1139771 () Bool)

(assert (=> start!102830 m!1139771))

(declare-fun m!1139773 () Bool)

(assert (=> b!1235929 m!1139773))

(assert (=> b!1235929 m!1139773))

(declare-fun m!1139775 () Bool)

(assert (=> b!1235929 m!1139775))

(declare-fun m!1139777 () Bool)

(assert (=> b!1235921 m!1139777))

(declare-fun m!1139779 () Bool)

(assert (=> b!1235927 m!1139779))

(declare-fun m!1139781 () Bool)

(assert (=> b!1235923 m!1139781))

(declare-fun m!1139783 () Bool)

(assert (=> b!1235922 m!1139783))

(declare-fun m!1139785 () Bool)

(assert (=> b!1235924 m!1139785))

(declare-fun m!1139787 () Bool)

(assert (=> b!1235924 m!1139787))

(declare-fun m!1139789 () Bool)

(assert (=> b!1235924 m!1139789))

(declare-fun m!1139791 () Bool)

(assert (=> b!1235924 m!1139791))

(declare-fun m!1139793 () Bool)

(assert (=> b!1235924 m!1139793))

(assert (=> b!1235924 m!1139779))

(assert (=> b!1235924 m!1139773))

(declare-fun m!1139795 () Bool)

(assert (=> b!1235928 m!1139795))

(declare-fun m!1139797 () Bool)

(assert (=> b!1235925 m!1139797))

(check-sat (not b!1235923) (not b!1235924) (not start!102830) (not b!1235921) (not b!1235929) (not b!1235922) (not b!1235927) (not b!1235928) (not b!1235925))
(check-sat)
