; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119364 () Bool)

(assert start!119364)

(declare-fun b!1391481 () Bool)

(declare-fun res!931399 () Bool)

(declare-fun e!787953 () Bool)

(assert (=> b!1391481 (=> (not res!931399) (not e!787953))))

(declare-datatypes ((array!95152 0))(
  ( (array!95153 (arr!45939 (Array (_ BitVec 32) (_ BitVec 64))) (size!46491 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95152)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391481 (= res!931399 (validKeyInArray!0 (select (arr!45939 a!2901) j!112)))))

(declare-fun b!1391482 () Bool)

(declare-datatypes ((SeekEntryResult!10282 0))(
  ( (MissingZero!10282 (index!43499 (_ BitVec 32))) (Found!10282 (index!43500 (_ BitVec 32))) (Intermediate!10282 (undefined!11094 Bool) (index!43501 (_ BitVec 32)) (x!125169 (_ BitVec 32))) (Undefined!10282) (MissingVacant!10282 (index!43502 (_ BitVec 32))) )
))
(declare-fun lt!611051 () SeekEntryResult!10282)

(declare-fun mask!2840 () (_ BitVec 32))

(assert (=> b!1391482 (= e!787953 (not (or (not (is-Intermediate!10282 lt!611051)) (undefined!11094 lt!611051) (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111))))))

(declare-fun e!787955 () Bool)

(assert (=> b!1391482 e!787955))

(declare-fun res!931403 () Bool)

(assert (=> b!1391482 (=> (not res!931403) (not e!787955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95152 (_ BitVec 32)) Bool)

(assert (=> b!1391482 (= res!931403 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46411 0))(
  ( (Unit!46412) )
))
(declare-fun lt!611050 () Unit!46411)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46411)

(assert (=> b!1391482 (= lt!611050 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95152 (_ BitVec 32)) SeekEntryResult!10282)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391482 (= lt!611051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45939 a!2901) j!112) mask!2840) (select (arr!45939 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391483 () Bool)

(declare-fun res!931404 () Bool)

(assert (=> b!1391483 (=> (not res!931404) (not e!787953))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1391483 (= res!931404 (validKeyInArray!0 (select (arr!45939 a!2901) i!1037)))))

(declare-fun b!1391484 () Bool)

(declare-fun res!931402 () Bool)

(assert (=> b!1391484 (=> (not res!931402) (not e!787953))))

(declare-datatypes ((List!32536 0))(
  ( (Nil!32533) (Cons!32532 (h!33756 (_ BitVec 64)) (t!47222 List!32536)) )
))
(declare-fun arrayNoDuplicates!0 (array!95152 (_ BitVec 32) List!32536) Bool)

(assert (=> b!1391484 (= res!931402 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32533))))

(declare-fun b!1391485 () Bool)

(declare-fun res!931401 () Bool)

(assert (=> b!1391485 (=> (not res!931401) (not e!787953))))

(assert (=> b!1391485 (= res!931401 (and (= (size!46491 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46491 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46491 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391486 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95152 (_ BitVec 32)) SeekEntryResult!10282)

(assert (=> b!1391486 (= e!787955 (= (seekEntryOrOpen!0 (select (arr!45939 a!2901) j!112) a!2901 mask!2840) (Found!10282 j!112)))))

(declare-fun res!931405 () Bool)

(assert (=> start!119364 (=> (not res!931405) (not e!787953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119364 (= res!931405 (validMask!0 mask!2840))))

(assert (=> start!119364 e!787953))

(assert (=> start!119364 true))

(declare-fun array_inv!35172 (array!95152) Bool)

(assert (=> start!119364 (array_inv!35172 a!2901)))

(declare-fun b!1391487 () Bool)

(declare-fun res!931400 () Bool)

(assert (=> b!1391487 (=> (not res!931400) (not e!787953))))

(assert (=> b!1391487 (= res!931400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119364 res!931405) b!1391485))

(assert (= (and b!1391485 res!931401) b!1391483))

(assert (= (and b!1391483 res!931404) b!1391481))

(assert (= (and b!1391481 res!931399) b!1391487))

(assert (= (and b!1391487 res!931400) b!1391484))

(assert (= (and b!1391484 res!931402) b!1391482))

(assert (= (and b!1391482 res!931403) b!1391486))

(declare-fun m!1276835 () Bool)

(assert (=> b!1391481 m!1276835))

(assert (=> b!1391481 m!1276835))

(declare-fun m!1276837 () Bool)

(assert (=> b!1391481 m!1276837))

(declare-fun m!1276839 () Bool)

(assert (=> b!1391484 m!1276839))

(declare-fun m!1276841 () Bool)

(assert (=> start!119364 m!1276841))

(declare-fun m!1276843 () Bool)

(assert (=> start!119364 m!1276843))

(declare-fun m!1276845 () Bool)

(assert (=> b!1391483 m!1276845))

(assert (=> b!1391483 m!1276845))

(declare-fun m!1276847 () Bool)

(assert (=> b!1391483 m!1276847))

(declare-fun m!1276849 () Bool)

(assert (=> b!1391487 m!1276849))

(assert (=> b!1391482 m!1276835))

(declare-fun m!1276851 () Bool)

(assert (=> b!1391482 m!1276851))

(assert (=> b!1391482 m!1276835))

(declare-fun m!1276853 () Bool)

(assert (=> b!1391482 m!1276853))

(assert (=> b!1391482 m!1276851))

(assert (=> b!1391482 m!1276835))

(declare-fun m!1276855 () Bool)

(assert (=> b!1391482 m!1276855))

(declare-fun m!1276857 () Bool)

(assert (=> b!1391482 m!1276857))

(assert (=> b!1391486 m!1276835))

(assert (=> b!1391486 m!1276835))

(declare-fun m!1276859 () Bool)

(assert (=> b!1391486 m!1276859))

(push 1)

(assert (not b!1391482))

(assert (not start!119364))

(assert (not b!1391481))

(assert (not b!1391486))

(assert (not b!1391484))

(assert (not b!1391487))

(assert (not b!1391483))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1391533 () Bool)

(declare-fun e!787991 () Bool)

(declare-fun e!787990 () Bool)

(assert (=> b!1391533 (= e!787991 e!787990)))

(declare-fun c!129501 () Bool)

(assert (=> b!1391533 (= c!129501 (validKeyInArray!0 (select (arr!45939 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1391534 () Bool)

(declare-fun e!787992 () Bool)

(declare-fun call!66728 () Bool)

(assert (=> b!1391534 (= e!787992 call!66728)))

(declare-fun b!1391535 () Bool)

(assert (=> b!1391535 (= e!787990 e!787992)))

(declare-fun lt!611064 () (_ BitVec 64))

(assert (=> b!1391535 (= lt!611064 (select (arr!45939 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!611066 () Unit!46411)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95152 (_ BitVec 64) (_ BitVec 32)) Unit!46411)

(assert (=> b!1391535 (= lt!611066 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611064 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95152 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1391535 (arrayContainsKey!0 a!2901 lt!611064 #b00000000000000000000000000000000)))

(declare-fun lt!611065 () Unit!46411)

(assert (=> b!1391535 (= lt!611065 lt!611066)))

(declare-fun res!931431 () Bool)

(assert (=> b!1391535 (= res!931431 (= (seekEntryOrOpen!0 (select (arr!45939 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10282 #b00000000000000000000000000000000)))))

(assert (=> b!1391535 (=> (not res!931431) (not e!787992))))

(declare-fun bm!66725 () Bool)

(assert (=> bm!66725 (= call!66728 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!150223 () Bool)

(declare-fun res!931430 () Bool)

(assert (=> d!150223 (=> res!931430 e!787991)))

(assert (=> d!150223 (= res!931430 (bvsge #b00000000000000000000000000000000 (size!46491 a!2901)))))

(assert (=> d!150223 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!787991)))

(declare-fun b!1391532 () Bool)

(assert (=> b!1391532 (= e!787990 call!66728)))

(assert (= (and d!150223 (not res!931430)) b!1391533))

(assert (= (and b!1391533 c!129501) b!1391535))

(assert (= (and b!1391533 (not c!129501)) b!1391532))

(assert (= (and b!1391535 res!931431) b!1391534))

(assert (= (or b!1391534 b!1391532) bm!66725))

(declare-fun m!1276875 () Bool)

(assert (=> b!1391533 m!1276875))

(assert (=> b!1391533 m!1276875))

(declare-fun m!1276879 () Bool)

(assert (=> b!1391533 m!1276879))

(assert (=> b!1391535 m!1276875))

(declare-fun m!1276881 () Bool)

(assert (=> b!1391535 m!1276881))

(declare-fun m!1276883 () Bool)

(assert (=> b!1391535 m!1276883))

(assert (=> b!1391535 m!1276875))

(declare-fun m!1276885 () Bool)

(assert (=> b!1391535 m!1276885))

(declare-fun m!1276887 () Bool)

(assert (=> bm!66725 m!1276887))

(assert (=> b!1391487 d!150223))

(declare-fun b!1391554 () Bool)

(declare-fun e!788004 () SeekEntryResult!10282)

(assert (=> b!1391554 (= e!788004 Undefined!10282)))

(declare-fun b!1391555 () Bool)

(declare-fun e!788005 () SeekEntryResult!10282)

(declare-fun lt!611079 () SeekEntryResult!10282)

(assert (=> b!1391555 (= e!788005 (MissingZero!10282 (index!43501 lt!611079)))))

(declare-fun d!150231 () Bool)

(declare-fun lt!611080 () SeekEntryResult!10282)

(assert (=> d!150231 (and (or (is-Undefined!10282 lt!611080) (not (is-Found!10282 lt!611080)) (and (bvsge (index!43500 lt!611080) #b00000000000000000000000000000000) (bvslt (index!43500 lt!611080) (size!46491 a!2901)))) (or (is-Undefined!10282 lt!611080) (is-Found!10282 lt!611080) (not (is-MissingZero!10282 lt!611080)) (and (bvsge (index!43499 lt!611080) #b00000000000000000000000000000000) (bvslt (index!43499 lt!611080) (size!46491 a!2901)))) (or (is-Undefined!10282 lt!611080) (is-Found!10282 lt!611080) (is-MissingZero!10282 lt!611080) (not (is-MissingVacant!10282 lt!611080)) (and (bvsge (index!43502 lt!611080) #b00000000000000000000000000000000) (bvslt (index!43502 lt!611080) (size!46491 a!2901)))) (or (is-Undefined!10282 lt!611080) (ite (is-Found!10282 lt!611080) (= (select (arr!45939 a!2901) (index!43500 lt!611080)) (select (arr!45939 a!2901) j!112)) (ite (is-MissingZero!10282 lt!611080) (= (select (arr!45939 a!2901) (index!43499 lt!611080)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10282 lt!611080) (= (select (arr!45939 a!2901) (index!43502 lt!611080)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150231 (= lt!611080 e!788004)))

(declare-fun c!129510 () Bool)

(assert (=> d!150231 (= c!129510 (and (is-Intermediate!10282 lt!611079) (undefined!11094 lt!611079)))))

(assert (=> d!150231 (= lt!611079 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45939 a!2901) j!112) mask!2840) (select (arr!45939 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150231 (validMask!0 mask!2840)))

(assert (=> d!150231 (= (seekEntryOrOpen!0 (select (arr!45939 a!2901) j!112) a!2901 mask!2840) lt!611080)))

(declare-fun b!1391556 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95152 (_ BitVec 32)) SeekEntryResult!10282)

(assert (=> b!1391556 (= e!788005 (seekKeyOrZeroReturnVacant!0 (x!125169 lt!611079) (index!43501 lt!611079) (index!43501 lt!611079) (select (arr!45939 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391557 () Bool)

(declare-fun e!788006 () SeekEntryResult!10282)

(assert (=> b!1391557 (= e!788004 e!788006)))

(declare-fun lt!611081 () (_ BitVec 64))

(assert (=> b!1391557 (= lt!611081 (select (arr!45939 a!2901) (index!43501 lt!611079)))))

(declare-fun c!129511 () Bool)

(assert (=> b!1391557 (= c!129511 (= lt!611081 (select (arr!45939 a!2901) j!112)))))

(declare-fun b!1391558 () Bool)

(assert (=> b!1391558 (= e!788006 (Found!10282 (index!43501 lt!611079)))))

(declare-fun b!1391559 () Bool)

(declare-fun c!129509 () Bool)

(assert (=> b!1391559 (= c!129509 (= lt!611081 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1391559 (= e!788006 e!788005)))

(assert (= (and d!150231 c!129510) b!1391554))

(assert (= (and d!150231 (not c!129510)) b!1391557))

(assert (= (and b!1391557 c!129511) b!1391558))

(assert (= (and b!1391557 (not c!129511)) b!1391559))

(assert (= (and b!1391559 c!129509) b!1391555))

(assert (= (and b!1391559 (not c!129509)) b!1391556))

(assert (=> d!150231 m!1276851))

(assert (=> d!150231 m!1276835))

(assert (=> d!150231 m!1276855))

(declare-fun m!1276897 () Bool)

(assert (=> d!150231 m!1276897))

(declare-fun m!1276899 () Bool)

(assert (=> d!150231 m!1276899))

(assert (=> d!150231 m!1276841))

(assert (=> d!150231 m!1276835))

(assert (=> d!150231 m!1276851))

(declare-fun m!1276901 () Bool)

(assert (=> d!150231 m!1276901))

(assert (=> b!1391556 m!1276835))

(declare-fun m!1276903 () Bool)

(assert (=> b!1391556 m!1276903))

(declare-fun m!1276905 () Bool)

(assert (=> b!1391557 m!1276905))

(assert (=> b!1391486 d!150231))

(declare-fun d!150243 () Bool)

(assert (=> d!150243 (= (validKeyInArray!0 (select (arr!45939 a!2901) j!112)) (and (not (= (select (arr!45939 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45939 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1391481 d!150243))

(declare-fun b!1391610 () Bool)

(declare-fun e!788037 () Bool)

(declare-fun e!788036 () Bool)

(assert (=> b!1391610 (= e!788037 e!788036)))

(declare-fun res!931453 () Bool)

(assert (=> b!1391610 (=> (not res!931453) (not e!788036))))

(declare-fun e!788038 () Bool)

(assert (=> b!1391610 (= res!931453 (not e!788038))))

(declare-fun res!931452 () Bool)

(assert (=> b!1391610 (=> (not res!931452) (not e!788038))))

(assert (=> b!1391610 (= res!931452 (validKeyInArray!0 (select (arr!45939 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1391611 () Bool)

(declare-fun e!788039 () Bool)

(declare-fun call!66734 () Bool)

(assert (=> b!1391611 (= e!788039 call!66734)))

(declare-fun b!1391612 () Bool)

(assert (=> b!1391612 (= e!788036 e!788039)))

(declare-fun c!129529 () Bool)

(assert (=> b!1391612 (= c!129529 (validKeyInArray!0 (select (arr!45939 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66731 () Bool)

(assert (=> bm!66731 (= call!66734 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129529 (Cons!32532 (select (arr!45939 a!2901) #b00000000000000000000000000000000) Nil!32533) Nil!32533)))))

(declare-fun b!1391613 () Bool)

(declare-fun contains!9730 (List!32536 (_ BitVec 64)) Bool)

(assert (=> b!1391613 (= e!788038 (contains!9730 Nil!32533 (select (arr!45939 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1391609 () Bool)

(assert (=> b!1391609 (= e!788039 call!66734)))

(declare-fun d!150245 () Bool)

(declare-fun res!931451 () Bool)

(assert (=> d!150245 (=> res!931451 e!788037)))

(assert (=> d!150245 (= res!931451 (bvsge #b00000000000000000000000000000000 (size!46491 a!2901)))))

(assert (=> d!150245 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32533) e!788037)))

(assert (= (and d!150245 (not res!931451)) b!1391610))

(assert (= (and b!1391610 res!931452) b!1391613))

(assert (= (and b!1391610 res!931453) b!1391612))

(assert (= (and b!1391612 c!129529) b!1391611))

(assert (= (and b!1391612 (not c!129529)) b!1391609))

(assert (= (or b!1391611 b!1391609) bm!66731))

(assert (=> b!1391610 m!1276875))

(assert (=> b!1391610 m!1276875))

(assert (=> b!1391610 m!1276879))

(assert (=> b!1391612 m!1276875))

(assert (=> b!1391612 m!1276875))

(assert (=> b!1391612 m!1276879))

(assert (=> bm!66731 m!1276875))

(declare-fun m!1276909 () Bool)

(assert (=> bm!66731 m!1276909))

(assert (=> b!1391613 m!1276875))

(assert (=> b!1391613 m!1276875))

(declare-fun m!1276913 () Bool)

(assert (=> b!1391613 m!1276913))

(assert (=> b!1391484 d!150245))

(declare-fun d!150247 () Bool)

(assert (=> d!150247 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119364 d!150247))

(declare-fun d!150257 () Bool)

(assert (=> d!150257 (= (array_inv!35172 a!2901) (bvsge (size!46491 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119364 d!150257))

(declare-fun d!150259 () Bool)

(assert (=> d!150259 (= (validKeyInArray!0 (select (arr!45939 a!2901) i!1037)) (and (not (= (select (arr!45939 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45939 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1391483 d!150259))

(declare-fun b!1391633 () Bool)

(declare-fun e!788053 () Bool)

(declare-fun e!788052 () Bool)

(assert (=> b!1391633 (= e!788053 e!788052)))

(declare-fun c!129536 () Bool)

(assert (=> b!1391633 (= c!129536 (validKeyInArray!0 (select (arr!45939 a!2901) j!112)))))

(declare-fun b!1391634 () Bool)

(declare-fun e!788054 () Bool)

(declare-fun call!66738 () Bool)

(assert (=> b!1391634 (= e!788054 call!66738)))

(declare-fun b!1391635 () Bool)

(assert (=> b!1391635 (= e!788052 e!788054)))

(declare-fun lt!611112 () (_ BitVec 64))

(assert (=> b!1391635 (= lt!611112 (select (arr!45939 a!2901) j!112))))

(declare-fun lt!611114 () Unit!46411)

(assert (=> b!1391635 (= lt!611114 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611112 j!112))))

(assert (=> b!1391635 (arrayContainsKey!0 a!2901 lt!611112 #b00000000000000000000000000000000)))

(declare-fun lt!611113 () Unit!46411)

(assert (=> b!1391635 (= lt!611113 lt!611114)))

(declare-fun res!931462 () Bool)

(assert (=> b!1391635 (= res!931462 (= (seekEntryOrOpen!0 (select (arr!45939 a!2901) j!112) a!2901 mask!2840) (Found!10282 j!112)))))

(assert (=> b!1391635 (=> (not res!931462) (not e!788054))))

(declare-fun bm!66735 () Bool)

(assert (=> bm!66735 (= call!66738 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!150261 () Bool)

(declare-fun res!931461 () Bool)

(assert (=> d!150261 (=> res!931461 e!788053)))

(assert (=> d!150261 (= res!931461 (bvsge j!112 (size!46491 a!2901)))))

(assert (=> d!150261 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!788053)))

(declare-fun b!1391632 () Bool)

(assert (=> b!1391632 (= e!788052 call!66738)))

(assert (= (and d!150261 (not res!931461)) b!1391633))

(assert (= (and b!1391633 c!129536) b!1391635))

(assert (= (and b!1391633 (not c!129536)) b!1391632))

(assert (= (and b!1391635 res!931462) b!1391634))

(assert (= (or b!1391634 b!1391632) bm!66735))

(assert (=> b!1391633 m!1276835))

(assert (=> b!1391633 m!1276835))

(assert (=> b!1391633 m!1276837))

(assert (=> b!1391635 m!1276835))

(declare-fun m!1276937 () Bool)

(assert (=> b!1391635 m!1276937))

(declare-fun m!1276939 () Bool)

(assert (=> b!1391635 m!1276939))

(assert (=> b!1391635 m!1276835))

(assert (=> b!1391635 m!1276859))

(declare-fun m!1276941 () Bool)

(assert (=> bm!66735 m!1276941))

(assert (=> b!1391482 d!150261))

(declare-fun d!150263 () Bool)

(assert (=> d!150263 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!611120 () Unit!46411)

(declare-fun choose!38 (array!95152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46411)

(assert (=> d!150263 (= lt!611120 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150263 (validMask!0 mask!2840)))

(assert (=> d!150263 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!611120)))

(declare-fun bs!40457 () Bool)

(assert (= bs!40457 d!150263))

(assert (=> bs!40457 m!1276857))

(declare-fun m!1276949 () Bool)

(assert (=> bs!40457 m!1276949))

(assert (=> bs!40457 m!1276841))

(assert (=> b!1391482 d!150263))

(declare-fun b!1391688 () Bool)

(declare-fun e!788086 () SeekEntryResult!10282)

(assert (=> b!1391688 (= e!788086 (Intermediate!10282 false (toIndex!0 (select (arr!45939 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1391689 () Bool)

(declare-fun e!788084 () SeekEntryResult!10282)

(assert (=> b!1391689 (= e!788084 e!788086)))

(declare-fun c!129557 () Bool)

(declare-fun lt!611139 () (_ BitVec 64))

(assert (=> b!1391689 (= c!129557 (or (= lt!611139 (select (arr!45939 a!2901) j!112)) (= (bvadd lt!611139 lt!611139) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1391690 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391690 (= e!788086 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45939 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!45939 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391691 () Bool)

(declare-fun lt!611138 () SeekEntryResult!10282)

(assert (=> b!1391691 (and (bvsge (index!43501 lt!611138) #b00000000000000000000000000000000) (bvslt (index!43501 lt!611138) (size!46491 a!2901)))))

(declare-fun e!788088 () Bool)

(assert (=> b!1391691 (= e!788088 (= (select (arr!45939 a!2901) (index!43501 lt!611138)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1391692 () Bool)

(assert (=> b!1391692 (= e!788084 (Intermediate!10282 true (toIndex!0 (select (arr!45939 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1391693 () Bool)

(declare-fun e!788085 () Bool)

(assert (=> b!1391693 (= e!788085 (bvsge (x!125169 lt!611138) #b01111111111111111111111111111110))))

(declare-fun b!1391694 () Bool)

(assert (=> b!1391694 (and (bvsge (index!43501 lt!611138) #b00000000000000000000000000000000) (bvslt (index!43501 lt!611138) (size!46491 a!2901)))))

(declare-fun res!931478 () Bool)

(assert (=> b!1391694 (= res!931478 (= (select (arr!45939 a!2901) (index!43501 lt!611138)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1391694 (=> res!931478 e!788088)))

(declare-fun b!1391695 () Bool)

(declare-fun e!788087 () Bool)

(assert (=> b!1391695 (= e!788085 e!788087)))

(declare-fun res!931479 () Bool)

(assert (=> b!1391695 (= res!931479 (and (is-Intermediate!10282 lt!611138) (not (undefined!11094 lt!611138)) (bvslt (x!125169 lt!611138) #b01111111111111111111111111111110) (bvsge (x!125169 lt!611138) #b00000000000000000000000000000000) (bvsge (x!125169 lt!611138) #b00000000000000000000000000000000)))))

(assert (=> b!1391695 (=> (not res!931479) (not e!788087))))

(declare-fun d!150269 () Bool)

(assert (=> d!150269 e!788085))

(declare-fun c!129556 () Bool)

(assert (=> d!150269 (= c!129556 (and (is-Intermediate!10282 lt!611138) (undefined!11094 lt!611138)))))

(assert (=> d!150269 (= lt!611138 e!788084)))

(declare-fun c!129558 () Bool)

(assert (=> d!150269 (= c!129558 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150269 (= lt!611139 (select (arr!45939 a!2901) (toIndex!0 (select (arr!45939 a!2901) j!112) mask!2840)))))

(assert (=> d!150269 (validMask!0 mask!2840)))

(assert (=> d!150269 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45939 a!2901) j!112) mask!2840) (select (arr!45939 a!2901) j!112) a!2901 mask!2840) lt!611138)))

(declare-fun b!1391696 () Bool)

(assert (=> b!1391696 (and (bvsge (index!43501 lt!611138) #b00000000000000000000000000000000) (bvslt (index!43501 lt!611138) (size!46491 a!2901)))))

(declare-fun res!931477 () Bool)

(assert (=> b!1391696 (= res!931477 (= (select (arr!45939 a!2901) (index!43501 lt!611138)) (select (arr!45939 a!2901) j!112)))))

(assert (=> b!1391696 (=> res!931477 e!788088)))

(assert (=> b!1391696 (= e!788087 e!788088)))

(assert (= (and d!150269 c!129558) b!1391692))

(assert (= (and d!150269 (not c!129558)) b!1391689))

(assert (= (and b!1391689 c!129557) b!1391688))

(assert (= (and b!1391689 (not c!129557)) b!1391690))

(assert (= (and d!150269 c!129556) b!1391693))

(assert (= (and d!150269 (not c!129556)) b!1391695))

(assert (= (and b!1391695 res!931479) b!1391696))

(assert (= (and b!1391696 (not res!931477)) b!1391694))

(assert (= (and b!1391694 (not res!931478)) b!1391691))

(declare-fun m!1276953 () Bool)

(assert (=> b!1391691 m!1276953))

(assert (=> b!1391690 m!1276851))

(declare-fun m!1276955 () Bool)

(assert (=> b!1391690 m!1276955))

(assert (=> b!1391690 m!1276955))

(assert (=> b!1391690 m!1276835))

(declare-fun m!1276957 () Bool)

(assert (=> b!1391690 m!1276957))

(assert (=> d!150269 m!1276851))

(declare-fun m!1276959 () Bool)

(assert (=> d!150269 m!1276959))

(assert (=> d!150269 m!1276841))

(assert (=> b!1391696 m!1276953))

(assert (=> b!1391694 m!1276953))

(assert (=> b!1391482 d!150269))

(declare-fun d!150275 () Bool)

(declare-fun lt!611150 () (_ BitVec 32))

(declare-fun lt!611149 () (_ BitVec 32))

(assert (=> d!150275 (= lt!611150 (bvmul (bvxor lt!611149 (bvlshr lt!611149 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150275 (= lt!611149 ((_ extract 31 0) (bvand (bvxor (select (arr!45939 a!2901) j!112) (bvlshr (select (arr!45939 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150275 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!931480 (let ((h!33758 ((_ extract 31 0) (bvand (bvxor (select (arr!45939 a!2901) j!112) (bvlshr (select (arr!45939 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125174 (bvmul (bvxor h!33758 (bvlshr h!33758 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125174 (bvlshr x!125174 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!931480 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!931480 #b00000000000000000000000000000000))))))

(assert (=> d!150275 (= (toIndex!0 (select (arr!45939 a!2901) j!112) mask!2840) (bvand (bvxor lt!611150 (bvlshr lt!611150 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1391482 d!150275))

(push 1)

(assert (not bm!66735))

(assert (not b!1391610))

(assert (not d!150231))

(assert (not b!1391690))

(assert (not b!1391613))

(assert (not b!1391612))

(assert (not b!1391635))

(assert (not b!1391633))

(assert (not b!1391556))

(assert (not bm!66725))

(assert (not b!1391535))

(assert (not b!1391533))

(assert (not d!150269))

(assert (not d!150263))

(assert (not bm!66731))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

