; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102982 () Bool)

(assert start!102982)

(declare-fun b!1235815 () Bool)

(declare-fun res!823197 () Bool)

(declare-fun e!701055 () Bool)

(assert (=> b!1235815 (=> (not res!823197) (not e!701055))))

(declare-datatypes ((List!27200 0))(
  ( (Nil!27197) (Cons!27196 (h!28414 (_ BitVec 64)) (t!40655 List!27200)) )
))
(declare-fun acc!846 () List!27200)

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79625 0))(
  ( (array!79626 (arr!38414 (Array (_ BitVec 32) (_ BitVec 64))) (size!38951 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79625)

(declare-fun arrayNoDuplicates!0 (array!79625 (_ BitVec 32) List!27200) Bool)

(assert (=> b!1235815 (= res!823197 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235816 () Bool)

(declare-fun res!823191 () Bool)

(assert (=> b!1235816 (=> (not res!823191) (not e!701055))))

(declare-fun k0!2925 () (_ BitVec 64))

(declare-fun contains!7271 (List!27200 (_ BitVec 64)) Bool)

(assert (=> b!1235816 (= res!823191 (contains!7271 acc!846 k0!2925))))

(declare-fun b!1235817 () Bool)

(declare-fun res!823194 () Bool)

(declare-fun e!701056 () Bool)

(assert (=> b!1235817 (=> res!823194 e!701056)))

(declare-fun lt!560365 () List!27200)

(assert (=> b!1235817 (= res!823194 (contains!7271 lt!560365 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235818 () Bool)

(declare-fun res!823190 () Bool)

(assert (=> b!1235818 (=> (not res!823190) (not e!701055))))

(declare-fun noDuplicate!1852 (List!27200) Bool)

(assert (=> b!1235818 (= res!823190 (noDuplicate!1852 acc!846))))

(declare-fun res!823192 () Bool)

(assert (=> start!102982 (=> (not res!823192) (not e!701055))))

(assert (=> start!102982 (= res!823192 (and (bvslt (size!38951 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38951 a!3835))))))

(assert (=> start!102982 e!701055))

(declare-fun array_inv!29352 (array!79625) Bool)

(assert (=> start!102982 (array_inv!29352 a!3835)))

(assert (=> start!102982 true))

(declare-fun b!1235819 () Bool)

(declare-fun res!823186 () Bool)

(assert (=> b!1235819 (=> res!823186 e!701056)))

(assert (=> b!1235819 (= res!823186 (contains!7271 lt!560365 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235820 () Bool)

(declare-fun res!823193 () Bool)

(assert (=> b!1235820 (=> (not res!823193) (not e!701055))))

(assert (=> b!1235820 (= res!823193 (not (= from!3213 (bvsub (size!38951 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235821 () Bool)

(declare-fun res!823187 () Bool)

(assert (=> b!1235821 (=> (not res!823187) (not e!701055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235821 (= res!823187 (validKeyInArray!0 (select (arr!38414 a!3835) from!3213)))))

(declare-fun b!1235822 () Bool)

(declare-fun res!823196 () Bool)

(assert (=> b!1235822 (=> (not res!823196) (not e!701055))))

(assert (=> b!1235822 (= res!823196 (not (contains!7271 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235823 () Bool)

(assert (=> b!1235823 (= e!701055 (not e!701056))))

(declare-fun res!823189 () Bool)

(assert (=> b!1235823 (=> res!823189 e!701056)))

(assert (=> b!1235823 (= res!823189 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!509 (List!27200 List!27200) Bool)

(assert (=> b!1235823 (subseq!509 acc!846 lt!560365)))

(declare-datatypes ((Unit!40847 0))(
  ( (Unit!40848) )
))
(declare-fun lt!560362 () Unit!40847)

(declare-fun subseqTail!2 (List!27200 List!27200) Unit!40847)

(assert (=> b!1235823 (= lt!560362 (subseqTail!2 lt!560365 lt!560365))))

(assert (=> b!1235823 (subseq!509 lt!560365 lt!560365)))

(declare-fun lt!560363 () Unit!40847)

(declare-fun lemmaListSubSeqRefl!0 (List!27200) Unit!40847)

(assert (=> b!1235823 (= lt!560363 (lemmaListSubSeqRefl!0 lt!560365))))

(assert (=> b!1235823 (= lt!560365 (Cons!27196 (select (arr!38414 a!3835) from!3213) acc!846))))

(declare-fun b!1235824 () Bool)

(assert (=> b!1235824 (= e!701056 true)))

(declare-fun lt!560364 () Bool)

(assert (=> b!1235824 (= lt!560364 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560365))))

(declare-fun lt!560366 () Unit!40847)

(declare-fun noDuplicateSubseq!56 (List!27200 List!27200) Unit!40847)

(assert (=> b!1235824 (= lt!560366 (noDuplicateSubseq!56 acc!846 lt!560365))))

(declare-fun b!1235825 () Bool)

(declare-fun res!823188 () Bool)

(assert (=> b!1235825 (=> res!823188 e!701056)))

(assert (=> b!1235825 (= res!823188 (not (noDuplicate!1852 lt!560365)))))

(declare-fun b!1235826 () Bool)

(declare-fun res!823195 () Bool)

(assert (=> b!1235826 (=> (not res!823195) (not e!701055))))

(assert (=> b!1235826 (= res!823195 (not (contains!7271 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102982 res!823192) b!1235818))

(assert (= (and b!1235818 res!823190) b!1235822))

(assert (= (and b!1235822 res!823196) b!1235826))

(assert (= (and b!1235826 res!823195) b!1235815))

(assert (= (and b!1235815 res!823197) b!1235816))

(assert (= (and b!1235816 res!823191) b!1235820))

(assert (= (and b!1235820 res!823193) b!1235821))

(assert (= (and b!1235821 res!823187) b!1235823))

(assert (= (and b!1235823 (not res!823189)) b!1235825))

(assert (= (and b!1235825 (not res!823188)) b!1235819))

(assert (= (and b!1235819 (not res!823186)) b!1235817))

(assert (= (and b!1235817 (not res!823194)) b!1235824))

(declare-fun m!1140071 () Bool)

(assert (=> b!1235825 m!1140071))

(declare-fun m!1140073 () Bool)

(assert (=> b!1235826 m!1140073))

(declare-fun m!1140075 () Bool)

(assert (=> b!1235819 m!1140075))

(declare-fun m!1140077 () Bool)

(assert (=> b!1235818 m!1140077))

(declare-fun m!1140079 () Bool)

(assert (=> b!1235816 m!1140079))

(declare-fun m!1140081 () Bool)

(assert (=> b!1235823 m!1140081))

(declare-fun m!1140083 () Bool)

(assert (=> b!1235823 m!1140083))

(declare-fun m!1140085 () Bool)

(assert (=> b!1235823 m!1140085))

(declare-fun m!1140087 () Bool)

(assert (=> b!1235823 m!1140087))

(declare-fun m!1140089 () Bool)

(assert (=> b!1235823 m!1140089))

(assert (=> b!1235821 m!1140089))

(assert (=> b!1235821 m!1140089))

(declare-fun m!1140091 () Bool)

(assert (=> b!1235821 m!1140091))

(declare-fun m!1140093 () Bool)

(assert (=> b!1235815 m!1140093))

(declare-fun m!1140095 () Bool)

(assert (=> start!102982 m!1140095))

(declare-fun m!1140097 () Bool)

(assert (=> b!1235824 m!1140097))

(declare-fun m!1140099 () Bool)

(assert (=> b!1235824 m!1140099))

(declare-fun m!1140101 () Bool)

(assert (=> b!1235817 m!1140101))

(declare-fun m!1140103 () Bool)

(assert (=> b!1235822 m!1140103))

(check-sat (not b!1235815) (not b!1235817) (not b!1235821) (not b!1235818) (not b!1235819) (not b!1235816) (not start!102982) (not b!1235823) (not b!1235826) (not b!1235825) (not b!1235824) (not b!1235822))
(check-sat)
