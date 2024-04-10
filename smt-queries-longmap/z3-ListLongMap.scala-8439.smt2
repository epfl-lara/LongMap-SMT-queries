; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102770 () Bool)

(assert start!102770)

(declare-fun b!1234959 () Bool)

(declare-fun e!700311 () Bool)

(declare-fun e!700310 () Bool)

(assert (=> b!1234959 (= e!700311 (not e!700310))))

(declare-fun res!823129 () Bool)

(assert (=> b!1234959 (=> res!823129 e!700310)))

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1234959 (= res!823129 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-datatypes ((List!27188 0))(
  ( (Nil!27185) (Cons!27184 (h!28393 (_ BitVec 64)) (t!40651 List!27188)) )
))
(declare-fun acc!846 () List!27188)

(declare-fun lt!560074 () List!27188)

(declare-fun subseq!522 (List!27188 List!27188) Bool)

(assert (=> b!1234959 (subseq!522 acc!846 lt!560074)))

(declare-datatypes ((Unit!40900 0))(
  ( (Unit!40901) )
))
(declare-fun lt!560071 () Unit!40900)

(declare-fun subseqTail!15 (List!27188 List!27188) Unit!40900)

(assert (=> b!1234959 (= lt!560071 (subseqTail!15 lt!560074 lt!560074))))

(assert (=> b!1234959 (subseq!522 lt!560074 lt!560074)))

(declare-fun lt!560073 () Unit!40900)

(declare-fun lemmaListSubSeqRefl!0 (List!27188) Unit!40900)

(assert (=> b!1234959 (= lt!560073 (lemmaListSubSeqRefl!0 lt!560074))))

(declare-datatypes ((array!79615 0))(
  ( (array!79616 (arr!38415 (Array (_ BitVec 32) (_ BitVec 64))) (size!38951 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79615)

(assert (=> b!1234959 (= lt!560074 (Cons!27184 (select (arr!38415 a!3835) from!3213) acc!846))))

(declare-fun b!1234960 () Bool)

(declare-fun res!823122 () Bool)

(assert (=> b!1234960 (=> (not res!823122) (not e!700311))))

(declare-fun arrayNoDuplicates!0 (array!79615 (_ BitVec 32) List!27188) Bool)

(assert (=> b!1234960 (= res!823122 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1234961 () Bool)

(declare-fun res!823121 () Bool)

(assert (=> b!1234961 (=> res!823121 e!700310)))

(declare-fun contains!7250 (List!27188 (_ BitVec 64)) Bool)

(assert (=> b!1234961 (= res!823121 (contains!7250 lt!560074 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234962 () Bool)

(declare-fun res!823128 () Bool)

(assert (=> b!1234962 (=> (not res!823128) (not e!700311))))

(assert (=> b!1234962 (= res!823128 (not (= from!3213 (bvsub (size!38951 a!3835) #b00000000000000000000000000000001))))))

(declare-fun res!823131 () Bool)

(assert (=> start!102770 (=> (not res!823131) (not e!700311))))

(assert (=> start!102770 (= res!823131 (and (bvslt (size!38951 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38951 a!3835))))))

(assert (=> start!102770 e!700311))

(declare-fun array_inv!29263 (array!79615) Bool)

(assert (=> start!102770 (array_inv!29263 a!3835)))

(assert (=> start!102770 true))

(declare-fun b!1234963 () Bool)

(declare-fun res!823123 () Bool)

(assert (=> b!1234963 (=> (not res!823123) (not e!700311))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1234963 (= res!823123 (contains!7250 acc!846 k0!2925))))

(declare-fun b!1234964 () Bool)

(declare-fun res!823126 () Bool)

(assert (=> b!1234964 (=> res!823126 e!700310)))

(assert (=> b!1234964 (= res!823126 (contains!7250 lt!560074 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1234965 () Bool)

(declare-fun res!823124 () Bool)

(assert (=> b!1234965 (=> (not res!823124) (not e!700311))))

(assert (=> b!1234965 (= res!823124 (not (contains!7250 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234966 () Bool)

(declare-fun res!823132 () Bool)

(assert (=> b!1234966 (=> res!823132 e!700310)))

(declare-fun noDuplicate!1847 (List!27188) Bool)

(assert (=> b!1234966 (= res!823132 (not (noDuplicate!1847 lt!560074)))))

(declare-fun b!1234967 () Bool)

(declare-fun res!823127 () Bool)

(assert (=> b!1234967 (=> (not res!823127) (not e!700311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234967 (= res!823127 (validKeyInArray!0 (select (arr!38415 a!3835) from!3213)))))

(declare-fun b!1234968 () Bool)

(declare-fun res!823130 () Bool)

(assert (=> b!1234968 (=> (not res!823130) (not e!700311))))

(assert (=> b!1234968 (= res!823130 (not (contains!7250 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234969 () Bool)

(declare-fun res!823125 () Bool)

(assert (=> b!1234969 (=> (not res!823125) (not e!700311))))

(assert (=> b!1234969 (= res!823125 (noDuplicate!1847 acc!846))))

(declare-fun b!1234970 () Bool)

(assert (=> b!1234970 (= e!700310 true)))

(declare-fun lt!560072 () Bool)

(assert (=> b!1234970 (= lt!560072 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560074))))

(declare-fun lt!560075 () Unit!40900)

(declare-fun noDuplicateSubseq!69 (List!27188 List!27188) Unit!40900)

(assert (=> b!1234970 (= lt!560075 (noDuplicateSubseq!69 acc!846 lt!560074))))

(assert (= (and start!102770 res!823131) b!1234969))

(assert (= (and b!1234969 res!823125) b!1234965))

(assert (= (and b!1234965 res!823124) b!1234968))

(assert (= (and b!1234968 res!823130) b!1234960))

(assert (= (and b!1234960 res!823122) b!1234963))

(assert (= (and b!1234963 res!823123) b!1234962))

(assert (= (and b!1234962 res!823128) b!1234967))

(assert (= (and b!1234967 res!823127) b!1234959))

(assert (= (and b!1234959 (not res!823129)) b!1234966))

(assert (= (and b!1234966 (not res!823132)) b!1234961))

(assert (= (and b!1234961 (not res!823121)) b!1234964))

(assert (= (and b!1234964 (not res!823126)) b!1234970))

(declare-fun m!1138865 () Bool)

(assert (=> b!1234966 m!1138865))

(declare-fun m!1138867 () Bool)

(assert (=> b!1234959 m!1138867))

(declare-fun m!1138869 () Bool)

(assert (=> b!1234959 m!1138869))

(declare-fun m!1138871 () Bool)

(assert (=> b!1234959 m!1138871))

(declare-fun m!1138873 () Bool)

(assert (=> b!1234959 m!1138873))

(declare-fun m!1138875 () Bool)

(assert (=> b!1234959 m!1138875))

(declare-fun m!1138877 () Bool)

(assert (=> b!1234964 m!1138877))

(declare-fun m!1138879 () Bool)

(assert (=> start!102770 m!1138879))

(declare-fun m!1138881 () Bool)

(assert (=> b!1234968 m!1138881))

(declare-fun m!1138883 () Bool)

(assert (=> b!1234961 m!1138883))

(declare-fun m!1138885 () Bool)

(assert (=> b!1234965 m!1138885))

(declare-fun m!1138887 () Bool)

(assert (=> b!1234969 m!1138887))

(declare-fun m!1138889 () Bool)

(assert (=> b!1234963 m!1138889))

(assert (=> b!1234967 m!1138871))

(assert (=> b!1234967 m!1138871))

(declare-fun m!1138891 () Bool)

(assert (=> b!1234967 m!1138891))

(declare-fun m!1138893 () Bool)

(assert (=> b!1234970 m!1138893))

(declare-fun m!1138895 () Bool)

(assert (=> b!1234970 m!1138895))

(declare-fun m!1138897 () Bool)

(assert (=> b!1234960 m!1138897))

(check-sat (not b!1234970) (not start!102770) (not b!1234960) (not b!1234969) (not b!1234965) (not b!1234967) (not b!1234966) (not b!1234964) (not b!1234961) (not b!1234963) (not b!1234968) (not b!1234959))
(check-sat)
