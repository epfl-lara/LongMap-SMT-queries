; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26918 () Bool)

(assert start!26918)

(declare-fun res!142358 () Bool)

(declare-fun e!177895 () Bool)

(assert (=> start!26918 (=> (not res!142358) (not e!177895))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26918 (= res!142358 (validMask!0 mask!3868))))

(assert (=> start!26918 e!177895))

(declare-datatypes ((array!13883 0))(
  ( (array!13884 (arr!6588 (Array (_ BitVec 32) (_ BitVec 64))) (size!6940 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13883)

(declare-fun array_inv!4551 (array!13883) Bool)

(assert (=> start!26918 (array_inv!4551 a!3325)))

(assert (=> start!26918 true))

(declare-fun b!279011 () Bool)

(declare-fun res!142357 () Bool)

(assert (=> b!279011 (=> (not res!142357) (not e!177895))))

(declare-datatypes ((List!4396 0))(
  ( (Nil!4393) (Cons!4392 (h!5062 (_ BitVec 64)) (t!9478 List!4396)) )
))
(declare-fun arrayNoDuplicates!0 (array!13883 (_ BitVec 32) List!4396) Bool)

(assert (=> b!279011 (= res!142357 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4393))))

(declare-fun b!279012 () Bool)

(declare-fun res!142352 () Bool)

(declare-fun e!177894 () Bool)

(assert (=> b!279012 (=> (not res!142352) (not e!177894))))

(assert (=> b!279012 (= res!142352 (and (bvslt (size!6940 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6940 a!3325))))))

(declare-fun b!279013 () Bool)

(declare-fun res!142359 () Bool)

(assert (=> b!279013 (=> (not res!142359) (not e!177895))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!279013 (= res!142359 (and (= (size!6940 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6940 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6940 a!3325))))))

(declare-fun b!279014 () Bool)

(declare-fun res!142350 () Bool)

(assert (=> b!279014 (=> (not res!142350) (not e!177894))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13883 (_ BitVec 32)) Bool)

(assert (=> b!279014 (= res!142350 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!279015 () Bool)

(declare-fun res!142355 () Bool)

(assert (=> b!279015 (=> (not res!142355) (not e!177894))))

(assert (=> b!279015 (= res!142355 (not (= startIndex!26 i!1267)))))

(declare-fun b!279016 () Bool)

(declare-fun res!142356 () Bool)

(assert (=> b!279016 (=> (not res!142356) (not e!177894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!279016 (= res!142356 (validKeyInArray!0 (select (arr!6588 a!3325) startIndex!26)))))

(declare-fun b!279017 () Bool)

(declare-fun noDuplicate!150 (List!4396) Bool)

(assert (=> b!279017 (= e!177894 (not (noDuplicate!150 Nil!4393)))))

(declare-fun b!279018 () Bool)

(assert (=> b!279018 (= e!177895 e!177894)))

(declare-fun res!142351 () Bool)

(assert (=> b!279018 (=> (not res!142351) (not e!177894))))

(declare-datatypes ((SeekEntryResult!1746 0))(
  ( (MissingZero!1746 (index!9154 (_ BitVec 32))) (Found!1746 (index!9155 (_ BitVec 32))) (Intermediate!1746 (undefined!2558 Bool) (index!9156 (_ BitVec 32)) (x!27400 (_ BitVec 32))) (Undefined!1746) (MissingVacant!1746 (index!9157 (_ BitVec 32))) )
))
(declare-fun lt!138523 () SeekEntryResult!1746)

(assert (=> b!279018 (= res!142351 (or (= lt!138523 (MissingZero!1746 i!1267)) (= lt!138523 (MissingVacant!1746 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13883 (_ BitVec 32)) SeekEntryResult!1746)

(assert (=> b!279018 (= lt!138523 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!279019 () Bool)

(declare-fun res!142354 () Bool)

(assert (=> b!279019 (=> (not res!142354) (not e!177895))))

(declare-fun arrayContainsKey!0 (array!13883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!279019 (= res!142354 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!279020 () Bool)

(declare-fun res!142353 () Bool)

(assert (=> b!279020 (=> (not res!142353) (not e!177895))))

(assert (=> b!279020 (= res!142353 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26918 res!142358) b!279013))

(assert (= (and b!279013 res!142359) b!279020))

(assert (= (and b!279020 res!142353) b!279011))

(assert (= (and b!279011 res!142357) b!279019))

(assert (= (and b!279019 res!142354) b!279018))

(assert (= (and b!279018 res!142351) b!279014))

(assert (= (and b!279014 res!142350) b!279015))

(assert (= (and b!279015 res!142355) b!279016))

(assert (= (and b!279016 res!142356) b!279012))

(assert (= (and b!279012 res!142352) b!279017))

(declare-fun m!293903 () Bool)

(assert (=> b!279016 m!293903))

(assert (=> b!279016 m!293903))

(declare-fun m!293905 () Bool)

(assert (=> b!279016 m!293905))

(declare-fun m!293907 () Bool)

(assert (=> b!279019 m!293907))

(declare-fun m!293909 () Bool)

(assert (=> b!279011 m!293909))

(declare-fun m!293911 () Bool)

(assert (=> start!26918 m!293911))

(declare-fun m!293913 () Bool)

(assert (=> start!26918 m!293913))

(declare-fun m!293915 () Bool)

(assert (=> b!279014 m!293915))

(declare-fun m!293917 () Bool)

(assert (=> b!279018 m!293917))

(declare-fun m!293919 () Bool)

(assert (=> b!279017 m!293919))

(declare-fun m!293921 () Bool)

(assert (=> b!279020 m!293921))

(check-sat (not b!279017) (not b!279016) (not b!279020) (not b!279018) (not b!279011) (not b!279014) (not start!26918) (not b!279019))
(check-sat)
(get-model)

(declare-fun d!64983 () Bool)

(assert (=> d!64983 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!26918 d!64983))

(declare-fun d!64985 () Bool)

(assert (=> d!64985 (= (array_inv!4551 a!3325) (bvsge (size!6940 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!26918 d!64985))

(declare-fun d!64991 () Bool)

(declare-fun res!142394 () Bool)

(declare-fun e!177910 () Bool)

(assert (=> d!64991 (=> res!142394 e!177910)))

(get-info :version)

(assert (=> d!64991 (= res!142394 ((_ is Nil!4393) Nil!4393))))

(assert (=> d!64991 (= (noDuplicate!150 Nil!4393) e!177910)))

(declare-fun b!279055 () Bool)

(declare-fun e!177911 () Bool)

(assert (=> b!279055 (= e!177910 e!177911)))

(declare-fun res!142395 () Bool)

(assert (=> b!279055 (=> (not res!142395) (not e!177911))))

(declare-fun contains!1967 (List!4396 (_ BitVec 64)) Bool)

(assert (=> b!279055 (= res!142395 (not (contains!1967 (t!9478 Nil!4393) (h!5062 Nil!4393))))))

(declare-fun b!279056 () Bool)

(assert (=> b!279056 (= e!177911 (noDuplicate!150 (t!9478 Nil!4393)))))

(assert (= (and d!64991 (not res!142394)) b!279055))

(assert (= (and b!279055 res!142395) b!279056))

(declare-fun m!293943 () Bool)

(assert (=> b!279055 m!293943))

(declare-fun m!293945 () Bool)

(assert (=> b!279056 m!293945))

(assert (=> b!279017 d!64991))

(declare-fun b!279105 () Bool)

(declare-fun e!177949 () SeekEntryResult!1746)

(assert (=> b!279105 (= e!177949 Undefined!1746)))

(declare-fun b!279106 () Bool)

(declare-fun e!177948 () SeekEntryResult!1746)

(declare-fun lt!138533 () SeekEntryResult!1746)

(assert (=> b!279106 (= e!177948 (MissingZero!1746 (index!9156 lt!138533)))))

(declare-fun b!279107 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13883 (_ BitVec 32)) SeekEntryResult!1746)

(assert (=> b!279107 (= e!177948 (seekKeyOrZeroReturnVacant!0 (x!27400 lt!138533) (index!9156 lt!138533) (index!9156 lt!138533) k0!2581 a!3325 mask!3868))))

(declare-fun b!279108 () Bool)

(declare-fun c!45896 () Bool)

(declare-fun lt!138534 () (_ BitVec 64))

(assert (=> b!279108 (= c!45896 (= lt!138534 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!177950 () SeekEntryResult!1746)

(assert (=> b!279108 (= e!177950 e!177948)))

(declare-fun d!64995 () Bool)

(declare-fun lt!138535 () SeekEntryResult!1746)

(assert (=> d!64995 (and (or ((_ is Undefined!1746) lt!138535) (not ((_ is Found!1746) lt!138535)) (and (bvsge (index!9155 lt!138535) #b00000000000000000000000000000000) (bvslt (index!9155 lt!138535) (size!6940 a!3325)))) (or ((_ is Undefined!1746) lt!138535) ((_ is Found!1746) lt!138535) (not ((_ is MissingZero!1746) lt!138535)) (and (bvsge (index!9154 lt!138535) #b00000000000000000000000000000000) (bvslt (index!9154 lt!138535) (size!6940 a!3325)))) (or ((_ is Undefined!1746) lt!138535) ((_ is Found!1746) lt!138535) ((_ is MissingZero!1746) lt!138535) (not ((_ is MissingVacant!1746) lt!138535)) (and (bvsge (index!9157 lt!138535) #b00000000000000000000000000000000) (bvslt (index!9157 lt!138535) (size!6940 a!3325)))) (or ((_ is Undefined!1746) lt!138535) (ite ((_ is Found!1746) lt!138535) (= (select (arr!6588 a!3325) (index!9155 lt!138535)) k0!2581) (ite ((_ is MissingZero!1746) lt!138535) (= (select (arr!6588 a!3325) (index!9154 lt!138535)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1746) lt!138535) (= (select (arr!6588 a!3325) (index!9157 lt!138535)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64995 (= lt!138535 e!177949)))

(declare-fun c!45897 () Bool)

(assert (=> d!64995 (= c!45897 (and ((_ is Intermediate!1746) lt!138533) (undefined!2558 lt!138533)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13883 (_ BitVec 32)) SeekEntryResult!1746)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!64995 (= lt!138533 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868))))

(assert (=> d!64995 (validMask!0 mask!3868)))

(assert (=> d!64995 (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) lt!138535)))

(declare-fun b!279109 () Bool)

(assert (=> b!279109 (= e!177950 (Found!1746 (index!9156 lt!138533)))))

(declare-fun b!279110 () Bool)

(assert (=> b!279110 (= e!177949 e!177950)))

(assert (=> b!279110 (= lt!138534 (select (arr!6588 a!3325) (index!9156 lt!138533)))))

(declare-fun c!45895 () Bool)

(assert (=> b!279110 (= c!45895 (= lt!138534 k0!2581))))

(assert (= (and d!64995 c!45897) b!279105))

(assert (= (and d!64995 (not c!45897)) b!279110))

(assert (= (and b!279110 c!45895) b!279109))

(assert (= (and b!279110 (not c!45895)) b!279108))

(assert (= (and b!279108 c!45896) b!279106))

(assert (= (and b!279108 (not c!45896)) b!279107))

(declare-fun m!293967 () Bool)

(assert (=> b!279107 m!293967))

(declare-fun m!293969 () Bool)

(assert (=> d!64995 m!293969))

(declare-fun m!293971 () Bool)

(assert (=> d!64995 m!293971))

(declare-fun m!293973 () Bool)

(assert (=> d!64995 m!293973))

(assert (=> d!64995 m!293969))

(declare-fun m!293975 () Bool)

(assert (=> d!64995 m!293975))

(declare-fun m!293977 () Bool)

(assert (=> d!64995 m!293977))

(assert (=> d!64995 m!293911))

(declare-fun m!293979 () Bool)

(assert (=> b!279110 m!293979))

(assert (=> b!279018 d!64995))

(declare-fun b!279149 () Bool)

(declare-fun e!177983 () Bool)

(declare-fun e!177982 () Bool)

(assert (=> b!279149 (= e!177983 e!177982)))

(declare-fun lt!138560 () (_ BitVec 64))

(assert (=> b!279149 (= lt!138560 (select (arr!6588 a!3325) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8806 0))(
  ( (Unit!8807) )
))
(declare-fun lt!138562 () Unit!8806)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13883 (_ BitVec 64) (_ BitVec 32)) Unit!8806)

(assert (=> b!279149 (= lt!138562 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138560 #b00000000000000000000000000000000))))

(assert (=> b!279149 (arrayContainsKey!0 a!3325 lt!138560 #b00000000000000000000000000000000)))

(declare-fun lt!138561 () Unit!8806)

(assert (=> b!279149 (= lt!138561 lt!138562)))

(declare-fun res!142443 () Bool)

(assert (=> b!279149 (= res!142443 (= (seekEntryOrOpen!0 (select (arr!6588 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1746 #b00000000000000000000000000000000)))))

(assert (=> b!279149 (=> (not res!142443) (not e!177982))))

(declare-fun b!279150 () Bool)

(declare-fun call!25420 () Bool)

(assert (=> b!279150 (= e!177982 call!25420)))

(declare-fun bm!25417 () Bool)

(assert (=> bm!25417 (= call!25420 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun d!65013 () Bool)

(declare-fun res!142442 () Bool)

(declare-fun e!177980 () Bool)

(assert (=> d!65013 (=> res!142442 e!177980)))

(assert (=> d!65013 (= res!142442 (bvsge #b00000000000000000000000000000000 (size!6940 a!3325)))))

(assert (=> d!65013 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!177980)))

(declare-fun b!279151 () Bool)

(assert (=> b!279151 (= e!177980 e!177983)))

(declare-fun c!45906 () Bool)

(assert (=> b!279151 (= c!45906 (validKeyInArray!0 (select (arr!6588 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279152 () Bool)

(assert (=> b!279152 (= e!177983 call!25420)))

(assert (= (and d!65013 (not res!142442)) b!279151))

(assert (= (and b!279151 c!45906) b!279149))

(assert (= (and b!279151 (not c!45906)) b!279152))

(assert (= (and b!279149 res!142443) b!279150))

(assert (= (or b!279150 b!279152) bm!25417))

(declare-fun m!293999 () Bool)

(assert (=> b!279149 m!293999))

(declare-fun m!294001 () Bool)

(assert (=> b!279149 m!294001))

(declare-fun m!294003 () Bool)

(assert (=> b!279149 m!294003))

(assert (=> b!279149 m!293999))

(declare-fun m!294005 () Bool)

(assert (=> b!279149 m!294005))

(declare-fun m!294007 () Bool)

(assert (=> bm!25417 m!294007))

(assert (=> b!279151 m!293999))

(assert (=> b!279151 m!293999))

(declare-fun m!294009 () Bool)

(assert (=> b!279151 m!294009))

(assert (=> b!279014 d!65013))

(declare-fun d!65023 () Bool)

(declare-fun res!142448 () Bool)

(declare-fun e!177988 () Bool)

(assert (=> d!65023 (=> res!142448 e!177988)))

(assert (=> d!65023 (= res!142448 (= (select (arr!6588 a!3325) #b00000000000000000000000000000000) k0!2581))))

(assert (=> d!65023 (= (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000) e!177988)))

(declare-fun b!279157 () Bool)

(declare-fun e!177989 () Bool)

(assert (=> b!279157 (= e!177988 e!177989)))

(declare-fun res!142449 () Bool)

(assert (=> b!279157 (=> (not res!142449) (not e!177989))))

(assert (=> b!279157 (= res!142449 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6940 a!3325)))))

(declare-fun b!279158 () Bool)

(assert (=> b!279158 (= e!177989 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65023 (not res!142448)) b!279157))

(assert (= (and b!279157 res!142449) b!279158))

(assert (=> d!65023 m!293999))

(declare-fun m!294011 () Bool)

(assert (=> b!279158 m!294011))

(assert (=> b!279019 d!65023))

(declare-fun d!65025 () Bool)

(assert (=> d!65025 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!279020 d!65025))

(declare-fun d!65027 () Bool)

(assert (=> d!65027 (= (validKeyInArray!0 (select (arr!6588 a!3325) startIndex!26)) (and (not (= (select (arr!6588 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6588 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!279016 d!65027))

(declare-fun b!279173 () Bool)

(declare-fun e!178002 () Bool)

(declare-fun call!25423 () Bool)

(assert (=> b!279173 (= e!178002 call!25423)))

(declare-fun b!279174 () Bool)

(declare-fun e!178001 () Bool)

(declare-fun e!178003 () Bool)

(assert (=> b!279174 (= e!178001 e!178003)))

(declare-fun res!142457 () Bool)

(assert (=> b!279174 (=> (not res!142457) (not e!178003))))

(declare-fun e!178000 () Bool)

(assert (=> b!279174 (= res!142457 (not e!178000))))

(declare-fun res!142456 () Bool)

(assert (=> b!279174 (=> (not res!142456) (not e!178000))))

(assert (=> b!279174 (= res!142456 (validKeyInArray!0 (select (arr!6588 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!65029 () Bool)

(declare-fun res!142458 () Bool)

(assert (=> d!65029 (=> res!142458 e!178001)))

(assert (=> d!65029 (= res!142458 (bvsge #b00000000000000000000000000000000 (size!6940 a!3325)))))

(assert (=> d!65029 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4393) e!178001)))

(declare-fun b!279175 () Bool)

(assert (=> b!279175 (= e!178002 call!25423)))

(declare-fun b!279176 () Bool)

(assert (=> b!279176 (= e!178000 (contains!1967 Nil!4393 (select (arr!6588 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25420 () Bool)

(declare-fun c!45911 () Bool)

(assert (=> bm!25420 (= call!25423 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45911 (Cons!4392 (select (arr!6588 a!3325) #b00000000000000000000000000000000) Nil!4393) Nil!4393)))))

(declare-fun b!279177 () Bool)

(assert (=> b!279177 (= e!178003 e!178002)))

(assert (=> b!279177 (= c!45911 (validKeyInArray!0 (select (arr!6588 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65029 (not res!142458)) b!279174))

(assert (= (and b!279174 res!142456) b!279176))

(assert (= (and b!279174 res!142457) b!279177))

(assert (= (and b!279177 c!45911) b!279175))

(assert (= (and b!279177 (not c!45911)) b!279173))

(assert (= (or b!279175 b!279173) bm!25420))

(assert (=> b!279174 m!293999))

(assert (=> b!279174 m!293999))

(assert (=> b!279174 m!294009))

(assert (=> b!279176 m!293999))

(assert (=> b!279176 m!293999))

(declare-fun m!294013 () Bool)

(assert (=> b!279176 m!294013))

(assert (=> bm!25420 m!293999))

(declare-fun m!294015 () Bool)

(assert (=> bm!25420 m!294015))

(assert (=> b!279177 m!293999))

(assert (=> b!279177 m!293999))

(assert (=> b!279177 m!294009))

(assert (=> b!279011 d!65029))

(check-sat (not b!279149) (not b!279107) (not bm!25420) (not d!64995) (not b!279056) (not b!279177) (not b!279176) (not b!279151) (not b!279174) (not b!279055) (not bm!25417) (not b!279158))
(check-sat)
