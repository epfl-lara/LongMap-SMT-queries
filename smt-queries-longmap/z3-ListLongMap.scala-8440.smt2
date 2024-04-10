; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102776 () Bool)

(assert start!102776)

(declare-fun b!1235067 () Bool)

(declare-fun e!700336 () Bool)

(declare-fun e!700338 () Bool)

(assert (=> b!1235067 (= e!700336 (not e!700338))))

(declare-fun res!823239 () Bool)

(assert (=> b!1235067 (=> res!823239 e!700338)))

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1235067 (= res!823239 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-datatypes ((List!27191 0))(
  ( (Nil!27188) (Cons!27187 (h!28396 (_ BitVec 64)) (t!40654 List!27191)) )
))
(declare-fun acc!846 () List!27191)

(declare-fun lt!560118 () List!27191)

(declare-fun subseq!525 (List!27191 List!27191) Bool)

(assert (=> b!1235067 (subseq!525 acc!846 lt!560118)))

(declare-datatypes ((Unit!40906 0))(
  ( (Unit!40907) )
))
(declare-fun lt!560120 () Unit!40906)

(declare-fun subseqTail!18 (List!27191 List!27191) Unit!40906)

(assert (=> b!1235067 (= lt!560120 (subseqTail!18 lt!560118 lt!560118))))

(assert (=> b!1235067 (subseq!525 lt!560118 lt!560118)))

(declare-fun lt!560117 () Unit!40906)

(declare-fun lemmaListSubSeqRefl!0 (List!27191) Unit!40906)

(assert (=> b!1235067 (= lt!560117 (lemmaListSubSeqRefl!0 lt!560118))))

(declare-datatypes ((array!79621 0))(
  ( (array!79622 (arr!38418 (Array (_ BitVec 32) (_ BitVec 64))) (size!38954 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79621)

(assert (=> b!1235067 (= lt!560118 (Cons!27187 (select (arr!38418 a!3835) from!3213) acc!846))))

(declare-fun b!1235068 () Bool)

(declare-fun res!823230 () Bool)

(assert (=> b!1235068 (=> (not res!823230) (not e!700336))))

(declare-fun contains!7253 (List!27191 (_ BitVec 64)) Bool)

(assert (=> b!1235068 (= res!823230 (not (contains!7253 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235069 () Bool)

(declare-fun res!823229 () Bool)

(assert (=> b!1235069 (=> (not res!823229) (not e!700336))))

(declare-fun noDuplicate!1850 (List!27191) Bool)

(assert (=> b!1235069 (= res!823229 (noDuplicate!1850 acc!846))))

(declare-fun b!1235070 () Bool)

(declare-fun res!823236 () Bool)

(assert (=> b!1235070 (=> res!823236 e!700338)))

(assert (=> b!1235070 (= res!823236 (contains!7253 lt!560118 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235071 () Bool)

(declare-fun res!823235 () Bool)

(assert (=> b!1235071 (=> (not res!823235) (not e!700336))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1235071 (= res!823235 (contains!7253 acc!846 k0!2925))))

(declare-fun b!1235072 () Bool)

(assert (=> b!1235072 (= e!700338 true)))

(declare-fun lt!560116 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79621 (_ BitVec 32) List!27191) Bool)

(assert (=> b!1235072 (= lt!560116 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560118))))

(declare-fun lt!560119 () Unit!40906)

(declare-fun noDuplicateSubseq!72 (List!27191 List!27191) Unit!40906)

(assert (=> b!1235072 (= lt!560119 (noDuplicateSubseq!72 acc!846 lt!560118))))

(declare-fun res!823232 () Bool)

(assert (=> start!102776 (=> (not res!823232) (not e!700336))))

(assert (=> start!102776 (= res!823232 (and (bvslt (size!38954 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38954 a!3835))))))

(assert (=> start!102776 e!700336))

(declare-fun array_inv!29266 (array!79621) Bool)

(assert (=> start!102776 (array_inv!29266 a!3835)))

(assert (=> start!102776 true))

(declare-fun b!1235073 () Bool)

(declare-fun res!823233 () Bool)

(assert (=> b!1235073 (=> (not res!823233) (not e!700336))))

(assert (=> b!1235073 (= res!823233 (not (contains!7253 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235074 () Bool)

(declare-fun res!823231 () Bool)

(assert (=> b!1235074 (=> res!823231 e!700338)))

(assert (=> b!1235074 (= res!823231 (not (noDuplicate!1850 lt!560118)))))

(declare-fun b!1235075 () Bool)

(declare-fun res!823240 () Bool)

(assert (=> b!1235075 (=> res!823240 e!700338)))

(assert (=> b!1235075 (= res!823240 (contains!7253 lt!560118 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235076 () Bool)

(declare-fun res!823234 () Bool)

(assert (=> b!1235076 (=> (not res!823234) (not e!700336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235076 (= res!823234 (validKeyInArray!0 (select (arr!38418 a!3835) from!3213)))))

(declare-fun b!1235077 () Bool)

(declare-fun res!823238 () Bool)

(assert (=> b!1235077 (=> (not res!823238) (not e!700336))))

(assert (=> b!1235077 (= res!823238 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235078 () Bool)

(declare-fun res!823237 () Bool)

(assert (=> b!1235078 (=> (not res!823237) (not e!700336))))

(assert (=> b!1235078 (= res!823237 (not (= from!3213 (bvsub (size!38954 a!3835) #b00000000000000000000000000000001))))))

(assert (= (and start!102776 res!823232) b!1235069))

(assert (= (and b!1235069 res!823229) b!1235068))

(assert (= (and b!1235068 res!823230) b!1235073))

(assert (= (and b!1235073 res!823233) b!1235077))

(assert (= (and b!1235077 res!823238) b!1235071))

(assert (= (and b!1235071 res!823235) b!1235078))

(assert (= (and b!1235078 res!823237) b!1235076))

(assert (= (and b!1235076 res!823234) b!1235067))

(assert (= (and b!1235067 (not res!823239)) b!1235074))

(assert (= (and b!1235074 (not res!823231)) b!1235075))

(assert (= (and b!1235075 (not res!823240)) b!1235070))

(assert (= (and b!1235070 (not res!823236)) b!1235072))

(declare-fun m!1138967 () Bool)

(assert (=> b!1235073 m!1138967))

(declare-fun m!1138969 () Bool)

(assert (=> b!1235077 m!1138969))

(declare-fun m!1138971 () Bool)

(assert (=> b!1235076 m!1138971))

(assert (=> b!1235076 m!1138971))

(declare-fun m!1138973 () Bool)

(assert (=> b!1235076 m!1138973))

(declare-fun m!1138975 () Bool)

(assert (=> b!1235067 m!1138975))

(declare-fun m!1138977 () Bool)

(assert (=> b!1235067 m!1138977))

(declare-fun m!1138979 () Bool)

(assert (=> b!1235067 m!1138979))

(assert (=> b!1235067 m!1138971))

(declare-fun m!1138981 () Bool)

(assert (=> b!1235067 m!1138981))

(declare-fun m!1138983 () Bool)

(assert (=> start!102776 m!1138983))

(declare-fun m!1138985 () Bool)

(assert (=> b!1235069 m!1138985))

(declare-fun m!1138987 () Bool)

(assert (=> b!1235075 m!1138987))

(declare-fun m!1138989 () Bool)

(assert (=> b!1235074 m!1138989))

(declare-fun m!1138991 () Bool)

(assert (=> b!1235068 m!1138991))

(declare-fun m!1138993 () Bool)

(assert (=> b!1235070 m!1138993))

(declare-fun m!1138995 () Bool)

(assert (=> b!1235072 m!1138995))

(declare-fun m!1138997 () Bool)

(assert (=> b!1235072 m!1138997))

(declare-fun m!1138999 () Bool)

(assert (=> b!1235071 m!1138999))

(check-sat (not b!1235072) (not b!1235073) (not b!1235069) (not b!1235068) (not start!102776) (not b!1235076) (not b!1235077) (not b!1235075) (not b!1235070) (not b!1235074) (not b!1235067) (not b!1235071))
