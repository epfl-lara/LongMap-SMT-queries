; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26972 () Bool)

(assert start!26972)

(declare-fun b!279282 () Bool)

(declare-fun res!142532 () Bool)

(declare-fun e!178054 () Bool)

(assert (=> b!279282 (=> (not res!142532) (not e!178054))))

(declare-datatypes ((array!13892 0))(
  ( (array!13893 (arr!6591 (Array (_ BitVec 32) (_ BitVec 64))) (size!6943 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13892)

(assert (=> b!279282 (= res!142532 (and (bvslt (size!6943 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6943 a!3325))))))

(declare-fun b!279283 () Bool)

(declare-fun res!142538 () Bool)

(assert (=> b!279283 (=> (not res!142538) (not e!178054))))

(declare-datatypes ((List!4399 0))(
  ( (Nil!4396) (Cons!4395 (h!5065 (_ BitVec 64)) (t!9481 List!4399)) )
))
(declare-fun noDuplicate!153 (List!4399) Bool)

(assert (=> b!279283 (= res!142538 (noDuplicate!153 Nil!4396))))

(declare-fun b!279284 () Bool)

(declare-fun res!142535 () Bool)

(declare-fun e!178055 () Bool)

(assert (=> b!279284 (=> (not res!142535) (not e!178055))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!279284 (= res!142535 (validKeyInArray!0 k0!2581))))

(declare-fun b!279285 () Bool)

(declare-fun res!142537 () Bool)

(assert (=> b!279285 (=> (not res!142537) (not e!178055))))

(declare-fun arrayNoDuplicates!0 (array!13892 (_ BitVec 32) List!4399) Bool)

(assert (=> b!279285 (= res!142537 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4396))))

(declare-fun b!279286 () Bool)

(declare-fun res!142539 () Bool)

(assert (=> b!279286 (=> (not res!142539) (not e!178054))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!279286 (= res!142539 (not (= startIndex!26 i!1267)))))

(declare-fun b!279287 () Bool)

(declare-fun e!178052 () Bool)

(declare-fun contains!1971 (List!4399 (_ BitVec 64)) Bool)

(assert (=> b!279287 (= e!178052 (contains!1971 Nil!4396 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!142542 () Bool)

(assert (=> start!26972 (=> (not res!142542) (not e!178055))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26972 (= res!142542 (validMask!0 mask!3868))))

(assert (=> start!26972 e!178055))

(declare-fun array_inv!4554 (array!13892) Bool)

(assert (=> start!26972 (array_inv!4554 a!3325)))

(assert (=> start!26972 true))

(declare-fun b!279288 () Bool)

(declare-fun res!142536 () Bool)

(assert (=> b!279288 (=> (not res!142536) (not e!178054))))

(assert (=> b!279288 (= res!142536 (validKeyInArray!0 (select (arr!6591 a!3325) startIndex!26)))))

(declare-fun b!279289 () Bool)

(declare-fun res!142531 () Bool)

(assert (=> b!279289 (=> (not res!142531) (not e!178055))))

(declare-fun arrayContainsKey!0 (array!13892 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!279289 (= res!142531 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!279290 () Bool)

(assert (=> b!279290 (= e!178054 e!178052)))

(declare-fun res!142534 () Bool)

(assert (=> b!279290 (=> res!142534 e!178052)))

(assert (=> b!279290 (= res!142534 (contains!1971 Nil!4396 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!279291 () Bool)

(declare-fun res!142533 () Bool)

(assert (=> b!279291 (=> (not res!142533) (not e!178055))))

(assert (=> b!279291 (= res!142533 (and (= (size!6943 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6943 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6943 a!3325))))))

(declare-fun b!279292 () Bool)

(declare-fun res!142541 () Bool)

(assert (=> b!279292 (=> (not res!142541) (not e!178054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13892 (_ BitVec 32)) Bool)

(assert (=> b!279292 (= res!142541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!279293 () Bool)

(assert (=> b!279293 (= e!178055 e!178054)))

(declare-fun res!142540 () Bool)

(assert (=> b!279293 (=> (not res!142540) (not e!178054))))

(declare-datatypes ((SeekEntryResult!1749 0))(
  ( (MissingZero!1749 (index!9166 (_ BitVec 32))) (Found!1749 (index!9167 (_ BitVec 32))) (Intermediate!1749 (undefined!2561 Bool) (index!9168 (_ BitVec 32)) (x!27411 (_ BitVec 32))) (Undefined!1749) (MissingVacant!1749 (index!9169 (_ BitVec 32))) )
))
(declare-fun lt!138586 () SeekEntryResult!1749)

(assert (=> b!279293 (= res!142540 (or (= lt!138586 (MissingZero!1749 i!1267)) (= lt!138586 (MissingVacant!1749 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13892 (_ BitVec 32)) SeekEntryResult!1749)

(assert (=> b!279293 (= lt!138586 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26972 res!142542) b!279291))

(assert (= (and b!279291 res!142533) b!279284))

(assert (= (and b!279284 res!142535) b!279285))

(assert (= (and b!279285 res!142537) b!279289))

(assert (= (and b!279289 res!142531) b!279293))

(assert (= (and b!279293 res!142540) b!279292))

(assert (= (and b!279292 res!142541) b!279286))

(assert (= (and b!279286 res!142539) b!279288))

(assert (= (and b!279288 res!142536) b!279282))

(assert (= (and b!279282 res!142532) b!279283))

(assert (= (and b!279283 res!142538) b!279290))

(assert (= (and b!279290 (not res!142534)) b!279287))

(declare-fun m!294075 () Bool)

(assert (=> b!279283 m!294075))

(declare-fun m!294077 () Bool)

(assert (=> b!279288 m!294077))

(assert (=> b!279288 m!294077))

(declare-fun m!294079 () Bool)

(assert (=> b!279288 m!294079))

(declare-fun m!294081 () Bool)

(assert (=> b!279284 m!294081))

(declare-fun m!294083 () Bool)

(assert (=> b!279292 m!294083))

(declare-fun m!294085 () Bool)

(assert (=> b!279293 m!294085))

(declare-fun m!294087 () Bool)

(assert (=> start!26972 m!294087))

(declare-fun m!294089 () Bool)

(assert (=> start!26972 m!294089))

(declare-fun m!294091 () Bool)

(assert (=> b!279290 m!294091))

(declare-fun m!294093 () Bool)

(assert (=> b!279289 m!294093))

(declare-fun m!294095 () Bool)

(assert (=> b!279287 m!294095))

(declare-fun m!294097 () Bool)

(assert (=> b!279285 m!294097))

(check-sat (not b!279287) (not b!279290) (not b!279283) (not b!279293) (not b!279284) (not b!279285) (not b!279289) (not start!26972) (not b!279288) (not b!279292))
(check-sat)
(get-model)

(declare-fun b!279367 () Bool)

(declare-fun e!178095 () SeekEntryResult!1749)

(declare-fun lt!138605 () SeekEntryResult!1749)

(assert (=> b!279367 (= e!178095 (Found!1749 (index!9168 lt!138605)))))

(declare-fun d!65039 () Bool)

(declare-fun lt!138604 () SeekEntryResult!1749)

(get-info :version)

(assert (=> d!65039 (and (or ((_ is Undefined!1749) lt!138604) (not ((_ is Found!1749) lt!138604)) (and (bvsge (index!9167 lt!138604) #b00000000000000000000000000000000) (bvslt (index!9167 lt!138604) (size!6943 a!3325)))) (or ((_ is Undefined!1749) lt!138604) ((_ is Found!1749) lt!138604) (not ((_ is MissingZero!1749) lt!138604)) (and (bvsge (index!9166 lt!138604) #b00000000000000000000000000000000) (bvslt (index!9166 lt!138604) (size!6943 a!3325)))) (or ((_ is Undefined!1749) lt!138604) ((_ is Found!1749) lt!138604) ((_ is MissingZero!1749) lt!138604) (not ((_ is MissingVacant!1749) lt!138604)) (and (bvsge (index!9169 lt!138604) #b00000000000000000000000000000000) (bvslt (index!9169 lt!138604) (size!6943 a!3325)))) (or ((_ is Undefined!1749) lt!138604) (ite ((_ is Found!1749) lt!138604) (= (select (arr!6591 a!3325) (index!9167 lt!138604)) k0!2581) (ite ((_ is MissingZero!1749) lt!138604) (= (select (arr!6591 a!3325) (index!9166 lt!138604)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1749) lt!138604) (= (select (arr!6591 a!3325) (index!9169 lt!138604)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!178094 () SeekEntryResult!1749)

(assert (=> d!65039 (= lt!138604 e!178094)))

(declare-fun c!45941 () Bool)

(assert (=> d!65039 (= c!45941 (and ((_ is Intermediate!1749) lt!138605) (undefined!2561 lt!138605)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13892 (_ BitVec 32)) SeekEntryResult!1749)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65039 (= lt!138605 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868))))

(assert (=> d!65039 (validMask!0 mask!3868)))

(assert (=> d!65039 (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) lt!138604)))

(declare-fun b!279368 () Bool)

(assert (=> b!279368 (= e!178094 Undefined!1749)))

(declare-fun b!279369 () Bool)

(assert (=> b!279369 (= e!178094 e!178095)))

(declare-fun lt!138606 () (_ BitVec 64))

(assert (=> b!279369 (= lt!138606 (select (arr!6591 a!3325) (index!9168 lt!138605)))))

(declare-fun c!45939 () Bool)

(assert (=> b!279369 (= c!45939 (= lt!138606 k0!2581))))

(declare-fun b!279370 () Bool)

(declare-fun e!178096 () SeekEntryResult!1749)

(assert (=> b!279370 (= e!178096 (MissingZero!1749 (index!9168 lt!138605)))))

(declare-fun b!279371 () Bool)

(declare-fun c!45940 () Bool)

(assert (=> b!279371 (= c!45940 (= lt!138606 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!279371 (= e!178095 e!178096)))

(declare-fun b!279372 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13892 (_ BitVec 32)) SeekEntryResult!1749)

(assert (=> b!279372 (= e!178096 (seekKeyOrZeroReturnVacant!0 (x!27411 lt!138605) (index!9168 lt!138605) (index!9168 lt!138605) k0!2581 a!3325 mask!3868))))

(assert (= (and d!65039 c!45941) b!279368))

(assert (= (and d!65039 (not c!45941)) b!279369))

(assert (= (and b!279369 c!45939) b!279367))

(assert (= (and b!279369 (not c!45939)) b!279371))

(assert (= (and b!279371 c!45940) b!279370))

(assert (= (and b!279371 (not c!45940)) b!279372))

(declare-fun m!294131 () Bool)

(assert (=> d!65039 m!294131))

(declare-fun m!294133 () Bool)

(assert (=> d!65039 m!294133))

(declare-fun m!294135 () Bool)

(assert (=> d!65039 m!294135))

(declare-fun m!294137 () Bool)

(assert (=> d!65039 m!294137))

(assert (=> d!65039 m!294135))

(declare-fun m!294139 () Bool)

(assert (=> d!65039 m!294139))

(assert (=> d!65039 m!294087))

(declare-fun m!294141 () Bool)

(assert (=> b!279369 m!294141))

(declare-fun m!294147 () Bool)

(assert (=> b!279372 m!294147))

(assert (=> b!279293 d!65039))

(declare-fun d!65047 () Bool)

(declare-fun lt!138613 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!186 (List!4399) (InoxSet (_ BitVec 64)))

(assert (=> d!65047 (= lt!138613 (select (content!186 Nil!4396) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!178108 () Bool)

(assert (=> d!65047 (= lt!138613 e!178108)))

(declare-fun res!142605 () Bool)

(assert (=> d!65047 (=> (not res!142605) (not e!178108))))

(assert (=> d!65047 (= res!142605 ((_ is Cons!4395) Nil!4396))))

(assert (=> d!65047 (= (contains!1971 Nil!4396 #b1000000000000000000000000000000000000000000000000000000000000000) lt!138613)))

(declare-fun b!279385 () Bool)

(declare-fun e!178109 () Bool)

(assert (=> b!279385 (= e!178108 e!178109)))

(declare-fun res!142604 () Bool)

(assert (=> b!279385 (=> res!142604 e!178109)))

(assert (=> b!279385 (= res!142604 (= (h!5065 Nil!4396) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!279386 () Bool)

(assert (=> b!279386 (= e!178109 (contains!1971 (t!9481 Nil!4396) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!65047 res!142605) b!279385))

(assert (= (and b!279385 (not res!142604)) b!279386))

(declare-fun m!294163 () Bool)

(assert (=> d!65047 m!294163))

(declare-fun m!294165 () Bool)

(assert (=> d!65047 m!294165))

(declare-fun m!294167 () Bool)

(assert (=> b!279386 m!294167))

(assert (=> b!279287 d!65047))

(declare-fun b!279409 () Bool)

(declare-fun e!178128 () Bool)

(declare-fun call!25435 () Bool)

(assert (=> b!279409 (= e!178128 call!25435)))

(declare-fun b!279410 () Bool)

(declare-fun e!178127 () Bool)

(assert (=> b!279410 (= e!178128 e!178127)))

(declare-fun lt!138631 () (_ BitVec 64))

(assert (=> b!279410 (= lt!138631 (select (arr!6591 a!3325) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8812 0))(
  ( (Unit!8813) )
))
(declare-fun lt!138632 () Unit!8812)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13892 (_ BitVec 64) (_ BitVec 32)) Unit!8812)

(assert (=> b!279410 (= lt!138632 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138631 #b00000000000000000000000000000000))))

(assert (=> b!279410 (arrayContainsKey!0 a!3325 lt!138631 #b00000000000000000000000000000000)))

(declare-fun lt!138630 () Unit!8812)

(assert (=> b!279410 (= lt!138630 lt!138632)))

(declare-fun res!142618 () Bool)

(assert (=> b!279410 (= res!142618 (= (seekEntryOrOpen!0 (select (arr!6591 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1749 #b00000000000000000000000000000000)))))

(assert (=> b!279410 (=> (not res!142618) (not e!178127))))

(declare-fun bm!25432 () Bool)

(assert (=> bm!25432 (= call!25435 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!279412 () Bool)

(declare-fun e!178129 () Bool)

(assert (=> b!279412 (= e!178129 e!178128)))

(declare-fun c!45948 () Bool)

(assert (=> b!279412 (= c!45948 (validKeyInArray!0 (select (arr!6591 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!65053 () Bool)

(declare-fun res!142619 () Bool)

(assert (=> d!65053 (=> res!142619 e!178129)))

(assert (=> d!65053 (= res!142619 (bvsge #b00000000000000000000000000000000 (size!6943 a!3325)))))

(assert (=> d!65053 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!178129)))

(declare-fun b!279411 () Bool)

(assert (=> b!279411 (= e!178127 call!25435)))

(assert (= (and d!65053 (not res!142619)) b!279412))

(assert (= (and b!279412 c!45948) b!279410))

(assert (= (and b!279412 (not c!45948)) b!279409))

(assert (= (and b!279410 res!142618) b!279411))

(assert (= (or b!279411 b!279409) bm!25432))

(declare-fun m!294181 () Bool)

(assert (=> b!279410 m!294181))

(declare-fun m!294183 () Bool)

(assert (=> b!279410 m!294183))

(declare-fun m!294185 () Bool)

(assert (=> b!279410 m!294185))

(assert (=> b!279410 m!294181))

(declare-fun m!294187 () Bool)

(assert (=> b!279410 m!294187))

(declare-fun m!294189 () Bool)

(assert (=> bm!25432 m!294189))

(assert (=> b!279412 m!294181))

(assert (=> b!279412 m!294181))

(declare-fun m!294191 () Bool)

(assert (=> b!279412 m!294191))

(assert (=> b!279292 d!65053))

(declare-fun d!65063 () Bool)

(assert (=> d!65063 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!26972 d!65063))

(declare-fun d!65073 () Bool)

(assert (=> d!65073 (= (array_inv!4554 a!3325) (bvsge (size!6943 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!26972 d!65073))

(declare-fun d!65075 () Bool)

(declare-fun res!142652 () Bool)

(declare-fun e!178172 () Bool)

(assert (=> d!65075 (=> res!142652 e!178172)))

(assert (=> d!65075 (= res!142652 (bvsge #b00000000000000000000000000000000 (size!6943 a!3325)))))

(assert (=> d!65075 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4396) e!178172)))

(declare-fun b!279465 () Bool)

(declare-fun e!178171 () Bool)

(declare-fun call!25438 () Bool)

(assert (=> b!279465 (= e!178171 call!25438)))

(declare-fun b!279466 () Bool)

(declare-fun e!178173 () Bool)

(assert (=> b!279466 (= e!178172 e!178173)))

(declare-fun res!142650 () Bool)

(assert (=> b!279466 (=> (not res!142650) (not e!178173))))

(declare-fun e!178174 () Bool)

(assert (=> b!279466 (= res!142650 (not e!178174))))

(declare-fun res!142651 () Bool)

(assert (=> b!279466 (=> (not res!142651) (not e!178174))))

(assert (=> b!279466 (= res!142651 (validKeyInArray!0 (select (arr!6591 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279467 () Bool)

(assert (=> b!279467 (= e!178171 call!25438)))

(declare-fun b!279468 () Bool)

(assert (=> b!279468 (= e!178174 (contains!1971 Nil!4396 (select (arr!6591 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25435 () Bool)

(declare-fun c!45960 () Bool)

(assert (=> bm!25435 (= call!25438 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45960 (Cons!4395 (select (arr!6591 a!3325) #b00000000000000000000000000000000) Nil!4396) Nil!4396)))))

(declare-fun b!279469 () Bool)

(assert (=> b!279469 (= e!178173 e!178171)))

(assert (=> b!279469 (= c!45960 (validKeyInArray!0 (select (arr!6591 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65075 (not res!142652)) b!279466))

(assert (= (and b!279466 res!142651) b!279468))

(assert (= (and b!279466 res!142650) b!279469))

(assert (= (and b!279469 c!45960) b!279465))

(assert (= (and b!279469 (not c!45960)) b!279467))

(assert (= (or b!279465 b!279467) bm!25435))

(assert (=> b!279466 m!294181))

(assert (=> b!279466 m!294181))

(assert (=> b!279466 m!294191))

(assert (=> b!279468 m!294181))

(assert (=> b!279468 m!294181))

(declare-fun m!294221 () Bool)

(assert (=> b!279468 m!294221))

(assert (=> bm!25435 m!294181))

(declare-fun m!294223 () Bool)

(assert (=> bm!25435 m!294223))

(assert (=> b!279469 m!294181))

(assert (=> b!279469 m!294181))

(assert (=> b!279469 m!294191))

(assert (=> b!279285 d!65075))

(declare-fun d!65081 () Bool)

(declare-fun lt!138645 () Bool)

(assert (=> d!65081 (= lt!138645 (select (content!186 Nil!4396) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!178175 () Bool)

(assert (=> d!65081 (= lt!138645 e!178175)))

(declare-fun res!142654 () Bool)

(assert (=> d!65081 (=> (not res!142654) (not e!178175))))

(assert (=> d!65081 (= res!142654 ((_ is Cons!4395) Nil!4396))))

(assert (=> d!65081 (= (contains!1971 Nil!4396 #b0000000000000000000000000000000000000000000000000000000000000000) lt!138645)))

(declare-fun b!279470 () Bool)

(declare-fun e!178176 () Bool)

(assert (=> b!279470 (= e!178175 e!178176)))

(declare-fun res!142653 () Bool)

(assert (=> b!279470 (=> res!142653 e!178176)))

(assert (=> b!279470 (= res!142653 (= (h!5065 Nil!4396) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!279471 () Bool)

(assert (=> b!279471 (= e!178176 (contains!1971 (t!9481 Nil!4396) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!65081 res!142654) b!279470))

(assert (= (and b!279470 (not res!142653)) b!279471))

(assert (=> d!65081 m!294163))

(declare-fun m!294225 () Bool)

(assert (=> d!65081 m!294225))

(declare-fun m!294227 () Bool)

(assert (=> b!279471 m!294227))

(assert (=> b!279290 d!65081))

(declare-fun d!65083 () Bool)

(assert (=> d!65083 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!279284 d!65083))

(declare-fun d!65085 () Bool)

(declare-fun res!142665 () Bool)

(declare-fun e!178195 () Bool)

(assert (=> d!65085 (=> res!142665 e!178195)))

(assert (=> d!65085 (= res!142665 (= (select (arr!6591 a!3325) #b00000000000000000000000000000000) k0!2581))))

(assert (=> d!65085 (= (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000) e!178195)))

(declare-fun b!279498 () Bool)

(declare-fun e!178196 () Bool)

(assert (=> b!279498 (= e!178195 e!178196)))

(declare-fun res!142666 () Bool)

(assert (=> b!279498 (=> (not res!142666) (not e!178196))))

(assert (=> b!279498 (= res!142666 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6943 a!3325)))))

(declare-fun b!279499 () Bool)

(assert (=> b!279499 (= e!178196 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65085 (not res!142665)) b!279498))

(assert (= (and b!279498 res!142666) b!279499))

(assert (=> d!65085 m!294181))

(declare-fun m!294229 () Bool)

(assert (=> b!279499 m!294229))

(assert (=> b!279289 d!65085))

(declare-fun d!65087 () Bool)

(declare-fun res!142674 () Bool)

(declare-fun e!178205 () Bool)

(assert (=> d!65087 (=> res!142674 e!178205)))

(assert (=> d!65087 (= res!142674 ((_ is Nil!4396) Nil!4396))))

(assert (=> d!65087 (= (noDuplicate!153 Nil!4396) e!178205)))

(declare-fun b!279509 () Bool)

(declare-fun e!178206 () Bool)

(assert (=> b!279509 (= e!178205 e!178206)))

(declare-fun res!142675 () Bool)

(assert (=> b!279509 (=> (not res!142675) (not e!178206))))

(assert (=> b!279509 (= res!142675 (not (contains!1971 (t!9481 Nil!4396) (h!5065 Nil!4396))))))

(declare-fun b!279510 () Bool)

(assert (=> b!279510 (= e!178206 (noDuplicate!153 (t!9481 Nil!4396)))))

(assert (= (and d!65087 (not res!142674)) b!279509))

(assert (= (and b!279509 res!142675) b!279510))

(declare-fun m!294235 () Bool)

(assert (=> b!279509 m!294235))

(declare-fun m!294237 () Bool)

(assert (=> b!279510 m!294237))

(assert (=> b!279283 d!65087))

(declare-fun d!65091 () Bool)

(assert (=> d!65091 (= (validKeyInArray!0 (select (arr!6591 a!3325) startIndex!26)) (and (not (= (select (arr!6591 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6591 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!279288 d!65091))

(check-sat (not b!279412) (not b!279499) (not bm!25432) (not b!279372) (not bm!25435) (not b!279469) (not b!279509) (not d!65047) (not b!279466) (not b!279386) (not b!279471) (not d!65039) (not b!279468) (not b!279410) (not d!65081) (not b!279510))
(check-sat)
