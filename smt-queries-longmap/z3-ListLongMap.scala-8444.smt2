; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102796 () Bool)

(assert start!102796)

(declare-fun b!1235373 () Bool)

(declare-datatypes ((Unit!40778 0))(
  ( (Unit!40779) )
))
(declare-fun e!700413 () Unit!40778)

(declare-fun lt!560118 () Unit!40778)

(assert (=> b!1235373 (= e!700413 lt!560118)))

(declare-datatypes ((List!27264 0))(
  ( (Nil!27261) (Cons!27260 (h!28469 (_ BitVec 64)) (t!40718 List!27264)) )
))
(declare-fun lt!560119 () List!27264)

(declare-datatypes ((array!79564 0))(
  ( (array!79565 (arr!38390 (Array (_ BitVec 32) (_ BitVec 64))) (size!38928 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79564)

(declare-fun acc!846 () List!27264)

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1235373 (= lt!560119 (Cons!27260 (select (arr!38390 a!3835) from!3213) acc!846))))

(declare-fun lt!560122 () Unit!40778)

(declare-fun lemmaListSubSeqRefl!0 (List!27264) Unit!40778)

(assert (=> b!1235373 (= lt!560122 (lemmaListSubSeqRefl!0 lt!560119))))

(declare-fun subseq!536 (List!27264 List!27264) Bool)

(assert (=> b!1235373 (subseq!536 lt!560119 lt!560119)))

(declare-fun lt!560120 () Unit!40778)

(declare-fun subseqTail!29 (List!27264 List!27264) Unit!40778)

(assert (=> b!1235373 (= lt!560120 (subseqTail!29 lt!560119 lt!560119))))

(assert (=> b!1235373 (subseq!536 acc!846 lt!560119)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79564 List!27264 List!27264 (_ BitVec 32)) Unit!40778)

(assert (=> b!1235373 (= lt!560118 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3835 lt!560119 acc!846 (bvadd #b00000000000000000000000000000001 from!3213)))))

(declare-fun arrayNoDuplicates!0 (array!79564 (_ BitVec 32) List!27264) Bool)

(assert (=> b!1235373 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846)))

(declare-fun res!823554 () Bool)

(declare-fun e!700415 () Bool)

(assert (=> start!102796 (=> (not res!823554) (not e!700415))))

(assert (=> start!102796 (= res!823554 (and (bvslt (size!38928 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38928 a!3835))))))

(assert (=> start!102796 e!700415))

(declare-fun array_inv!29373 (array!79564) Bool)

(assert (=> start!102796 (array_inv!29373 a!3835)))

(assert (=> start!102796 true))

(declare-fun b!1235374 () Bool)

(declare-fun res!823555 () Bool)

(assert (=> b!1235374 (=> (not res!823555) (not e!700415))))

(assert (=> b!1235374 (= res!823555 (not (= from!3213 (bvsub (size!38928 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1235375 () Bool)

(declare-fun e!700414 () Bool)

(assert (=> b!1235375 (= e!700414 false)))

(declare-fun lt!560123 () Bool)

(assert (=> b!1235375 (= lt!560123 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) acc!846))))

(declare-fun b!1235376 () Bool)

(declare-fun Unit!40780 () Unit!40778)

(assert (=> b!1235376 (= e!700413 Unit!40780)))

(declare-fun b!1235377 () Bool)

(declare-fun res!823551 () Bool)

(assert (=> b!1235377 (=> (not res!823551) (not e!700415))))

(declare-fun contains!7236 (List!27264 (_ BitVec 64)) Bool)

(assert (=> b!1235377 (= res!823551 (not (contains!7236 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235378 () Bool)

(declare-fun res!823550 () Bool)

(assert (=> b!1235378 (=> (not res!823550) (not e!700415))))

(declare-fun noDuplicate!1879 (List!27264) Bool)

(assert (=> b!1235378 (= res!823550 (noDuplicate!1879 acc!846))))

(declare-fun b!1235379 () Bool)

(declare-fun res!823552 () Bool)

(assert (=> b!1235379 (=> (not res!823552) (not e!700415))))

(assert (=> b!1235379 (= res!823552 (not (contains!7236 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235380 () Bool)

(declare-fun res!823549 () Bool)

(assert (=> b!1235380 (=> (not res!823549) (not e!700415))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1235380 (= res!823549 (contains!7236 acc!846 k0!2925))))

(declare-fun b!1235381 () Bool)

(declare-fun res!823553 () Bool)

(assert (=> b!1235381 (=> (not res!823553) (not e!700415))))

(assert (=> b!1235381 (= res!823553 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235382 () Bool)

(assert (=> b!1235382 (= e!700415 e!700414)))

(declare-fun res!823556 () Bool)

(assert (=> b!1235382 (=> (not res!823556) (not e!700414))))

(assert (=> b!1235382 (= res!823556 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3213) (size!38928 a!3835))))))

(declare-fun lt!560121 () Unit!40778)

(assert (=> b!1235382 (= lt!560121 e!700413)))

(declare-fun c!120775 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235382 (= c!120775 (validKeyInArray!0 (select (arr!38390 a!3835) from!3213)))))

(assert (= (and start!102796 res!823554) b!1235378))

(assert (= (and b!1235378 res!823550) b!1235379))

(assert (= (and b!1235379 res!823552) b!1235377))

(assert (= (and b!1235377 res!823551) b!1235381))

(assert (= (and b!1235381 res!823553) b!1235380))

(assert (= (and b!1235380 res!823549) b!1235374))

(assert (= (and b!1235374 res!823555) b!1235382))

(assert (= (and b!1235382 c!120775) b!1235373))

(assert (= (and b!1235382 (not c!120775)) b!1235376))

(assert (= (and b!1235382 res!823556) b!1235375))

(declare-fun m!1138827 () Bool)

(assert (=> b!1235382 m!1138827))

(assert (=> b!1235382 m!1138827))

(declare-fun m!1138829 () Bool)

(assert (=> b!1235382 m!1138829))

(declare-fun m!1138831 () Bool)

(assert (=> b!1235378 m!1138831))

(declare-fun m!1138833 () Bool)

(assert (=> b!1235381 m!1138833))

(declare-fun m!1138835 () Bool)

(assert (=> start!102796 m!1138835))

(declare-fun m!1138837 () Bool)

(assert (=> b!1235379 m!1138837))

(declare-fun m!1138839 () Bool)

(assert (=> b!1235375 m!1138839))

(declare-fun m!1138841 () Bool)

(assert (=> b!1235380 m!1138841))

(declare-fun m!1138843 () Bool)

(assert (=> b!1235373 m!1138843))

(declare-fun m!1138845 () Bool)

(assert (=> b!1235373 m!1138845))

(assert (=> b!1235373 m!1138839))

(declare-fun m!1138847 () Bool)

(assert (=> b!1235373 m!1138847))

(assert (=> b!1235373 m!1138827))

(declare-fun m!1138849 () Bool)

(assert (=> b!1235373 m!1138849))

(declare-fun m!1138851 () Bool)

(assert (=> b!1235373 m!1138851))

(declare-fun m!1138853 () Bool)

(assert (=> b!1235377 m!1138853))

(check-sat (not b!1235378) (not b!1235382) (not b!1235377) (not b!1235381) (not b!1235380) (not b!1235375) (not b!1235373) (not b!1235379) (not start!102796))
(check-sat)
