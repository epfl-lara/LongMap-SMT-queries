; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59916 () Bool)

(assert start!59916)

(declare-fun b!662002 () Bool)

(declare-fun res!429952 () Bool)

(declare-fun e!380211 () Bool)

(assert (=> b!662002 (=> res!429952 e!380211)))

(declare-datatypes ((List!12588 0))(
  ( (Nil!12585) (Cons!12584 (h!13632 (_ BitVec 64)) (t!18808 List!12588)) )
))
(declare-fun lt!308934 () List!12588)

(declare-fun contains!3240 (List!12588 (_ BitVec 64)) Bool)

(assert (=> b!662002 (= res!429952 (contains!3240 lt!308934 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662003 () Bool)

(declare-fun res!429957 () Bool)

(assert (=> b!662003 (=> res!429957 e!380211)))

(declare-fun noDuplicate!514 (List!12588) Bool)

(assert (=> b!662003 (= res!429957 (not (noDuplicate!514 lt!308934)))))

(declare-fun b!662004 () Bool)

(declare-fun res!429963 () Bool)

(declare-fun e!380210 () Bool)

(assert (=> b!662004 (=> (not res!429963) (not e!380210))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38901 0))(
  ( (array!38902 (arr!18640 (Array (_ BitVec 32) (_ BitVec 64))) (size!19004 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38901)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!662004 (= res!429963 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19004 a!3626)) (= from!3004 i!1382)))))

(declare-fun res!429951 () Bool)

(assert (=> start!59916 (=> (not res!429951) (not e!380210))))

(assert (=> start!59916 (= res!429951 (and (bvslt (size!19004 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19004 a!3626))))))

(assert (=> start!59916 e!380210))

(assert (=> start!59916 true))

(declare-fun array_inv!14499 (array!38901) Bool)

(assert (=> start!59916 (array_inv!14499 a!3626)))

(declare-fun b!662005 () Bool)

(assert (=> b!662005 (= e!380211 true)))

(declare-fun lt!308938 () Bool)

(declare-fun arrayNoDuplicates!0 (array!38901 (_ BitVec 32) List!12588) Bool)

(assert (=> b!662005 (= lt!308938 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!308934))))

(declare-datatypes ((Unit!22953 0))(
  ( (Unit!22954) )
))
(declare-fun lt!308933 () Unit!22953)

(declare-fun acc!681 () List!12588)

(declare-fun noDuplicateSubseq!2 (List!12588 List!12588) Unit!22953)

(assert (=> b!662005 (= lt!308933 (noDuplicateSubseq!2 acc!681 lt!308934))))

(declare-fun b!662006 () Bool)

(declare-fun res!429955 () Bool)

(assert (=> b!662006 (=> (not res!429955) (not e!380210))))

(assert (=> b!662006 (= res!429955 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19004 a!3626))))))

(declare-fun b!662007 () Bool)

(declare-fun res!429960 () Bool)

(assert (=> b!662007 (=> (not res!429960) (not e!380210))))

(assert (=> b!662007 (= res!429960 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!662008 () Bool)

(declare-fun e!380209 () Unit!22953)

(declare-fun Unit!22955 () Unit!22953)

(assert (=> b!662008 (= e!380209 Unit!22955)))

(declare-fun b!662009 () Bool)

(declare-fun res!429966 () Bool)

(assert (=> b!662009 (=> (not res!429966) (not e!380210))))

(assert (=> b!662009 (= res!429966 (not (contains!3240 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662010 () Bool)

(declare-fun e!380206 () Bool)

(assert (=> b!662010 (= e!380210 (not e!380206))))

(declare-fun res!429961 () Bool)

(assert (=> b!662010 (=> res!429961 e!380206)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!662010 (= res!429961 (not (validKeyInArray!0 (select (arr!18640 a!3626) from!3004))))))

(declare-fun lt!308936 () Unit!22953)

(assert (=> b!662010 (= lt!308936 e!380209)))

(declare-fun c!76394 () Bool)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!662010 (= c!76394 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!662010 (arrayContainsKey!0 (array!38902 (store (arr!18640 a!3626) i!1382 k0!2843) (size!19004 a!3626)) k0!2843 from!3004)))

(declare-fun b!662011 () Bool)

(declare-fun e!380205 () Bool)

(declare-fun e!380208 () Bool)

(assert (=> b!662011 (= e!380205 e!380208)))

(declare-fun res!429970 () Bool)

(assert (=> b!662011 (=> (not res!429970) (not e!380208))))

(assert (=> b!662011 (= res!429970 (bvsle from!3004 i!1382))))

(declare-fun b!662012 () Bool)

(declare-fun res!429954 () Bool)

(assert (=> b!662012 (=> res!429954 e!380211)))

(assert (=> b!662012 (= res!429954 (contains!3240 lt!308934 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!662013 () Bool)

(declare-fun e!380204 () Bool)

(assert (=> b!662013 (= e!380204 (contains!3240 acc!681 k0!2843))))

(declare-fun b!662014 () Bool)

(declare-fun res!429967 () Bool)

(assert (=> b!662014 (=> (not res!429967) (not e!380210))))

(assert (=> b!662014 (= res!429967 e!380205)))

(declare-fun res!429959 () Bool)

(assert (=> b!662014 (=> res!429959 e!380205)))

(assert (=> b!662014 (= res!429959 e!380204)))

(declare-fun res!429958 () Bool)

(assert (=> b!662014 (=> (not res!429958) (not e!380204))))

(assert (=> b!662014 (= res!429958 (bvsgt from!3004 i!1382))))

(declare-fun b!662015 () Bool)

(declare-fun res!429964 () Bool)

(assert (=> b!662015 (=> (not res!429964) (not e!380210))))

(assert (=> b!662015 (= res!429964 (not (contains!3240 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!662016 () Bool)

(declare-fun res!429962 () Bool)

(assert (=> b!662016 (=> (not res!429962) (not e!380210))))

(assert (=> b!662016 (= res!429962 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!662017 () Bool)

(declare-fun res!429965 () Bool)

(assert (=> b!662017 (=> (not res!429965) (not e!380210))))

(assert (=> b!662017 (= res!429965 (noDuplicate!514 acc!681))))

(declare-fun b!662018 () Bool)

(assert (=> b!662018 (= e!380208 (not (contains!3240 acc!681 k0!2843)))))

(declare-fun b!662019 () Bool)

(assert (=> b!662019 (= e!380206 e!380211)))

(declare-fun res!429953 () Bool)

(assert (=> b!662019 (=> res!429953 e!380211)))

(assert (=> b!662019 (= res!429953 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!131 (List!12588 (_ BitVec 64)) List!12588)

(assert (=> b!662019 (= lt!308934 ($colon$colon!131 acc!681 (select (arr!18640 a!3626) from!3004)))))

(declare-fun subseq!2 (List!12588 List!12588) Bool)

(assert (=> b!662019 (subseq!2 acc!681 acc!681)))

(declare-fun lt!308937 () Unit!22953)

(declare-fun lemmaListSubSeqRefl!0 (List!12588) Unit!22953)

(assert (=> b!662019 (= lt!308937 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!662020 () Bool)

(declare-fun res!429969 () Bool)

(assert (=> b!662020 (=> (not res!429969) (not e!380210))))

(assert (=> b!662020 (= res!429969 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12585))))

(declare-fun b!662021 () Bool)

(declare-fun res!429968 () Bool)

(assert (=> b!662021 (=> (not res!429968) (not e!380210))))

(assert (=> b!662021 (= res!429968 (validKeyInArray!0 k0!2843))))

(declare-fun b!662022 () Bool)

(declare-fun res!429956 () Bool)

(assert (=> b!662022 (=> res!429956 e!380211)))

(assert (=> b!662022 (= res!429956 (not (subseq!2 acc!681 lt!308934)))))

(declare-fun b!662023 () Bool)

(declare-fun Unit!22956 () Unit!22953)

(assert (=> b!662023 (= e!380209 Unit!22956)))

(declare-fun lt!308935 () Unit!22953)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38901 (_ BitVec 64) (_ BitVec 32)) Unit!22953)

(assert (=> b!662023 (= lt!308935 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!662023 false))

(assert (= (and start!59916 res!429951) b!662017))

(assert (= (and b!662017 res!429965) b!662015))

(assert (= (and b!662015 res!429964) b!662009))

(assert (= (and b!662009 res!429966) b!662014))

(assert (= (and b!662014 res!429958) b!662013))

(assert (= (and b!662014 (not res!429959)) b!662011))

(assert (= (and b!662011 res!429970) b!662018))

(assert (= (and b!662014 res!429967) b!662020))

(assert (= (and b!662020 res!429969) b!662007))

(assert (= (and b!662007 res!429960) b!662006))

(assert (= (and b!662006 res!429955) b!662021))

(assert (= (and b!662021 res!429968) b!662016))

(assert (= (and b!662016 res!429962) b!662004))

(assert (= (and b!662004 res!429963) b!662010))

(assert (= (and b!662010 c!76394) b!662023))

(assert (= (and b!662010 (not c!76394)) b!662008))

(assert (= (and b!662010 (not res!429961)) b!662019))

(assert (= (and b!662019 (not res!429953)) b!662003))

(assert (= (and b!662003 (not res!429957)) b!662012))

(assert (= (and b!662012 (not res!429954)) b!662002))

(assert (= (and b!662002 (not res!429952)) b!662022))

(assert (= (and b!662022 (not res!429956)) b!662005))

(declare-fun m!634495 () Bool)

(assert (=> b!662010 m!634495))

(declare-fun m!634497 () Bool)

(assert (=> b!662010 m!634497))

(declare-fun m!634499 () Bool)

(assert (=> b!662010 m!634499))

(assert (=> b!662010 m!634495))

(declare-fun m!634501 () Bool)

(assert (=> b!662010 m!634501))

(declare-fun m!634503 () Bool)

(assert (=> b!662010 m!634503))

(assert (=> b!662019 m!634495))

(assert (=> b!662019 m!634495))

(declare-fun m!634505 () Bool)

(assert (=> b!662019 m!634505))

(declare-fun m!634507 () Bool)

(assert (=> b!662019 m!634507))

(declare-fun m!634509 () Bool)

(assert (=> b!662019 m!634509))

(declare-fun m!634511 () Bool)

(assert (=> b!662023 m!634511))

(declare-fun m!634513 () Bool)

(assert (=> b!662013 m!634513))

(declare-fun m!634515 () Bool)

(assert (=> start!59916 m!634515))

(declare-fun m!634517 () Bool)

(assert (=> b!662021 m!634517))

(declare-fun m!634519 () Bool)

(assert (=> b!662020 m!634519))

(declare-fun m!634521 () Bool)

(assert (=> b!662003 m!634521))

(declare-fun m!634523 () Bool)

(assert (=> b!662022 m!634523))

(declare-fun m!634525 () Bool)

(assert (=> b!662012 m!634525))

(declare-fun m!634527 () Bool)

(assert (=> b!662009 m!634527))

(declare-fun m!634529 () Bool)

(assert (=> b!662017 m!634529))

(declare-fun m!634531 () Bool)

(assert (=> b!662015 m!634531))

(declare-fun m!634533 () Bool)

(assert (=> b!662005 m!634533))

(declare-fun m!634535 () Bool)

(assert (=> b!662005 m!634535))

(declare-fun m!634537 () Bool)

(assert (=> b!662007 m!634537))

(declare-fun m!634539 () Bool)

(assert (=> b!662002 m!634539))

(assert (=> b!662018 m!634513))

(declare-fun m!634541 () Bool)

(assert (=> b!662016 m!634541))

(check-sat (not b!662003) (not b!662017) (not b!662010) (not b!662005) (not start!59916) (not b!662020) (not b!662013) (not b!662019) (not b!662012) (not b!662022) (not b!662002) (not b!662009) (not b!662015) (not b!662021) (not b!662018) (not b!662007) (not b!662016) (not b!662023))
(check-sat)
