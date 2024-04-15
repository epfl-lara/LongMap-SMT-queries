; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27032 () Bool)

(assert start!27032)

(declare-fun b!279404 () Bool)

(declare-fun res!142622 () Bool)

(declare-fun e!178123 () Bool)

(assert (=> b!279404 (=> (not res!142622) (not e!178123))))

(declare-datatypes ((List!4369 0))(
  ( (Nil!4366) (Cons!4365 (h!5035 (_ BitVec 64)) (t!9442 List!4369)) )
))
(declare-fun contains!1948 (List!4369 (_ BitVec 64)) Bool)

(assert (=> b!279404 (= res!142622 (not (contains!1948 Nil!4366 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!279405 () Bool)

(declare-fun res!142627 () Bool)

(assert (=> b!279405 (=> (not res!142627) (not e!178123))))

(declare-datatypes ((array!13890 0))(
  ( (array!13891 (arr!6588 (Array (_ BitVec 32) (_ BitVec 64))) (size!6941 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13890)

(assert (=> b!279405 (= res!142627 (and (bvslt (size!6941 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6941 a!3325))))))

(declare-fun b!279406 () Bool)

(declare-fun res!142619 () Bool)

(assert (=> b!279406 (=> (not res!142619) (not e!178123))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!279406 (= res!142619 (validKeyInArray!0 (select (arr!6588 a!3325) startIndex!26)))))

(declare-fun b!279407 () Bool)

(declare-fun res!142615 () Bool)

(declare-fun e!178125 () Bool)

(assert (=> b!279407 (=> (not res!142615) (not e!178125))))

(declare-fun arrayNoDuplicates!0 (array!13890 (_ BitVec 32) List!4369) Bool)

(assert (=> b!279407 (= res!142615 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4366))))

(declare-fun b!279408 () Bool)

(declare-fun k0!2581 () (_ BitVec 64))

(assert (=> b!279408 (= e!178123 (contains!1948 Nil!4366 k0!2581))))

(declare-fun b!279409 () Bool)

(declare-fun res!142616 () Bool)

(assert (=> b!279409 (=> (not res!142616) (not e!178125))))

(declare-fun arrayContainsKey!0 (array!13890 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!279409 (= res!142616 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!279410 () Bool)

(assert (=> b!279410 (= e!178125 e!178123)))

(declare-fun res!142617 () Bool)

(assert (=> b!279410 (=> (not res!142617) (not e!178123))))

(declare-datatypes ((SeekEntryResult!1745 0))(
  ( (MissingZero!1745 (index!9150 (_ BitVec 32))) (Found!1745 (index!9151 (_ BitVec 32))) (Intermediate!1745 (undefined!2557 Bool) (index!9152 (_ BitVec 32)) (x!27414 (_ BitVec 32))) (Undefined!1745) (MissingVacant!1745 (index!9153 (_ BitVec 32))) )
))
(declare-fun lt!138477 () SeekEntryResult!1745)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!279410 (= res!142617 (or (= lt!138477 (MissingZero!1745 i!1267)) (= lt!138477 (MissingVacant!1745 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13890 (_ BitVec 32)) SeekEntryResult!1745)

(assert (=> b!279410 (= lt!138477 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!279411 () Bool)

(declare-fun res!142623 () Bool)

(assert (=> b!279411 (=> (not res!142623) (not e!178123))))

(assert (=> b!279411 (= res!142623 (not (= startIndex!26 i!1267)))))

(declare-fun b!279412 () Bool)

(declare-fun res!142620 () Bool)

(assert (=> b!279412 (=> (not res!142620) (not e!178123))))

(declare-fun noDuplicate!157 (List!4369) Bool)

(assert (=> b!279412 (= res!142620 (noDuplicate!157 Nil!4366))))

(declare-fun b!279413 () Bool)

(declare-fun res!142624 () Bool)

(assert (=> b!279413 (=> (not res!142624) (not e!178123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13890 (_ BitVec 32)) Bool)

(assert (=> b!279413 (= res!142624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!279415 () Bool)

(declare-fun res!142618 () Bool)

(assert (=> b!279415 (=> (not res!142618) (not e!178125))))

(assert (=> b!279415 (= res!142618 (and (= (size!6941 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6941 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6941 a!3325))))))

(declare-fun b!279416 () Bool)

(declare-fun res!142626 () Bool)

(assert (=> b!279416 (=> (not res!142626) (not e!178125))))

(assert (=> b!279416 (= res!142626 (validKeyInArray!0 k0!2581))))

(declare-fun res!142621 () Bool)

(assert (=> start!27032 (=> (not res!142621) (not e!178125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27032 (= res!142621 (validMask!0 mask!3868))))

(assert (=> start!27032 e!178125))

(declare-fun array_inv!4560 (array!13890) Bool)

(assert (=> start!27032 (array_inv!4560 a!3325)))

(assert (=> start!27032 true))

(declare-fun b!279414 () Bool)

(declare-fun res!142625 () Bool)

(assert (=> b!279414 (=> (not res!142625) (not e!178123))))

(assert (=> b!279414 (= res!142625 (not (contains!1948 Nil!4366 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!27032 res!142621) b!279415))

(assert (= (and b!279415 res!142618) b!279416))

(assert (= (and b!279416 res!142626) b!279407))

(assert (= (and b!279407 res!142615) b!279409))

(assert (= (and b!279409 res!142616) b!279410))

(assert (= (and b!279410 res!142617) b!279413))

(assert (= (and b!279413 res!142624) b!279411))

(assert (= (and b!279411 res!142623) b!279406))

(assert (= (and b!279406 res!142619) b!279405))

(assert (= (and b!279405 res!142627) b!279412))

(assert (= (and b!279412 res!142620) b!279404))

(assert (= (and b!279404 res!142622) b!279414))

(assert (= (and b!279414 res!142625) b!279408))

(declare-fun m!293669 () Bool)

(assert (=> b!279414 m!293669))

(declare-fun m!293671 () Bool)

(assert (=> start!27032 m!293671))

(declare-fun m!293673 () Bool)

(assert (=> start!27032 m!293673))

(declare-fun m!293675 () Bool)

(assert (=> b!279412 m!293675))

(declare-fun m!293677 () Bool)

(assert (=> b!279410 m!293677))

(declare-fun m!293679 () Bool)

(assert (=> b!279406 m!293679))

(assert (=> b!279406 m!293679))

(declare-fun m!293681 () Bool)

(assert (=> b!279406 m!293681))

(declare-fun m!293683 () Bool)

(assert (=> b!279407 m!293683))

(declare-fun m!293685 () Bool)

(assert (=> b!279413 m!293685))

(declare-fun m!293687 () Bool)

(assert (=> b!279404 m!293687))

(declare-fun m!293689 () Bool)

(assert (=> b!279409 m!293689))

(declare-fun m!293691 () Bool)

(assert (=> b!279408 m!293691))

(declare-fun m!293693 () Bool)

(assert (=> b!279416 m!293693))

(check-sat (not b!279409) (not b!279410) (not b!279412) (not b!279406) (not start!27032) (not b!279413) (not b!279407) (not b!279414) (not b!279404) (not b!279416) (not b!279408))
(check-sat)
(get-model)

(declare-fun b!279536 () Bool)

(declare-fun e!178175 () SeekEntryResult!1745)

(declare-fun e!178176 () SeekEntryResult!1745)

(assert (=> b!279536 (= e!178175 e!178176)))

(declare-fun lt!138497 () (_ BitVec 64))

(declare-fun lt!138496 () SeekEntryResult!1745)

(assert (=> b!279536 (= lt!138497 (select (arr!6588 a!3325) (index!9152 lt!138496)))))

(declare-fun c!45958 () Bool)

(assert (=> b!279536 (= c!45958 (= lt!138497 k0!2581))))

(declare-fun d!64957 () Bool)

(declare-fun lt!138498 () SeekEntryResult!1745)

(get-info :version)

(assert (=> d!64957 (and (or ((_ is Undefined!1745) lt!138498) (not ((_ is Found!1745) lt!138498)) (and (bvsge (index!9151 lt!138498) #b00000000000000000000000000000000) (bvslt (index!9151 lt!138498) (size!6941 a!3325)))) (or ((_ is Undefined!1745) lt!138498) ((_ is Found!1745) lt!138498) (not ((_ is MissingZero!1745) lt!138498)) (and (bvsge (index!9150 lt!138498) #b00000000000000000000000000000000) (bvslt (index!9150 lt!138498) (size!6941 a!3325)))) (or ((_ is Undefined!1745) lt!138498) ((_ is Found!1745) lt!138498) ((_ is MissingZero!1745) lt!138498) (not ((_ is MissingVacant!1745) lt!138498)) (and (bvsge (index!9153 lt!138498) #b00000000000000000000000000000000) (bvslt (index!9153 lt!138498) (size!6941 a!3325)))) (or ((_ is Undefined!1745) lt!138498) (ite ((_ is Found!1745) lt!138498) (= (select (arr!6588 a!3325) (index!9151 lt!138498)) k0!2581) (ite ((_ is MissingZero!1745) lt!138498) (= (select (arr!6588 a!3325) (index!9150 lt!138498)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1745) lt!138498) (= (select (arr!6588 a!3325) (index!9153 lt!138498)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64957 (= lt!138498 e!178175)))

(declare-fun c!45960 () Bool)

(assert (=> d!64957 (= c!45960 (and ((_ is Intermediate!1745) lt!138496) (undefined!2557 lt!138496)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13890 (_ BitVec 32)) SeekEntryResult!1745)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!64957 (= lt!138496 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868))))

(assert (=> d!64957 (validMask!0 mask!3868)))

(assert (=> d!64957 (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) lt!138498)))

(declare-fun b!279537 () Bool)

(assert (=> b!279537 (= e!178176 (Found!1745 (index!9152 lt!138496)))))

(declare-fun b!279538 () Bool)

(assert (=> b!279538 (= e!178175 Undefined!1745)))

(declare-fun b!279539 () Bool)

(declare-fun e!178174 () SeekEntryResult!1745)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!13890 (_ BitVec 32)) SeekEntryResult!1745)

(assert (=> b!279539 (= e!178174 (seekKeyOrZeroReturnVacant!0 (x!27414 lt!138496) (index!9152 lt!138496) (index!9152 lt!138496) k0!2581 a!3325 mask!3868))))

(declare-fun b!279540 () Bool)

(assert (=> b!279540 (= e!178174 (MissingZero!1745 (index!9152 lt!138496)))))

(declare-fun b!279541 () Bool)

(declare-fun c!45959 () Bool)

(assert (=> b!279541 (= c!45959 (= lt!138497 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!279541 (= e!178176 e!178174)))

(assert (= (and d!64957 c!45960) b!279538))

(assert (= (and d!64957 (not c!45960)) b!279536))

(assert (= (and b!279536 c!45958) b!279537))

(assert (= (and b!279536 (not c!45958)) b!279541))

(assert (= (and b!279541 c!45959) b!279540))

(assert (= (and b!279541 (not c!45959)) b!279539))

(declare-fun m!293759 () Bool)

(assert (=> b!279536 m!293759))

(declare-fun m!293761 () Bool)

(assert (=> d!64957 m!293761))

(declare-fun m!293763 () Bool)

(assert (=> d!64957 m!293763))

(declare-fun m!293765 () Bool)

(assert (=> d!64957 m!293765))

(declare-fun m!293767 () Bool)

(assert (=> d!64957 m!293767))

(assert (=> d!64957 m!293671))

(assert (=> d!64957 m!293765))

(declare-fun m!293769 () Bool)

(assert (=> d!64957 m!293769))

(declare-fun m!293771 () Bool)

(assert (=> b!279539 m!293771))

(assert (=> b!279410 d!64957))

(declare-fun d!64967 () Bool)

(assert (=> d!64967 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!279416 d!64967))

(declare-fun d!64969 () Bool)

(assert (=> d!64969 (= (validKeyInArray!0 (select (arr!6588 a!3325) startIndex!26)) (and (not (= (select (arr!6588 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6588 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!279406 d!64969))

(declare-fun d!64971 () Bool)

(assert (=> d!64971 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!27032 d!64971))

(declare-fun d!64981 () Bool)

(assert (=> d!64981 (= (array_inv!4560 a!3325) (bvsge (size!6941 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!27032 d!64981))

(declare-fun d!64983 () Bool)

(declare-fun res!142747 () Bool)

(declare-fun e!178202 () Bool)

(assert (=> d!64983 (=> res!142747 e!178202)))

(assert (=> d!64983 (= res!142747 ((_ is Nil!4366) Nil!4366))))

(assert (=> d!64983 (= (noDuplicate!157 Nil!4366) e!178202)))

(declare-fun b!279570 () Bool)

(declare-fun e!178203 () Bool)

(assert (=> b!279570 (= e!178202 e!178203)))

(declare-fun res!142748 () Bool)

(assert (=> b!279570 (=> (not res!142748) (not e!178203))))

(assert (=> b!279570 (= res!142748 (not (contains!1948 (t!9442 Nil!4366) (h!5035 Nil!4366))))))

(declare-fun b!279571 () Bool)

(assert (=> b!279571 (= e!178203 (noDuplicate!157 (t!9442 Nil!4366)))))

(assert (= (and d!64983 (not res!142747)) b!279570))

(assert (= (and b!279570 res!142748) b!279571))

(declare-fun m!293793 () Bool)

(assert (=> b!279570 m!293793))

(declare-fun m!293795 () Bool)

(assert (=> b!279571 m!293795))

(assert (=> b!279412 d!64983))

(declare-fun d!64985 () Bool)

(declare-fun res!142757 () Bool)

(declare-fun e!178223 () Bool)

(assert (=> d!64985 (=> res!142757 e!178223)))

(assert (=> d!64985 (= res!142757 (bvsge #b00000000000000000000000000000000 (size!6941 a!3325)))))

(assert (=> d!64985 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4366) e!178223)))

(declare-fun b!279598 () Bool)

(declare-fun e!178224 () Bool)

(assert (=> b!279598 (= e!178223 e!178224)))

(declare-fun res!142758 () Bool)

(assert (=> b!279598 (=> (not res!142758) (not e!178224))))

(declare-fun e!178221 () Bool)

(assert (=> b!279598 (= res!142758 (not e!178221))))

(declare-fun res!142759 () Bool)

(assert (=> b!279598 (=> (not res!142759) (not e!178221))))

(assert (=> b!279598 (= res!142759 (validKeyInArray!0 (select (arr!6588 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279599 () Bool)

(declare-fun e!178222 () Bool)

(assert (=> b!279599 (= e!178224 e!178222)))

(declare-fun c!45973 () Bool)

(assert (=> b!279599 (= c!45973 (validKeyInArray!0 (select (arr!6588 a!3325) #b00000000000000000000000000000000)))))

(declare-fun bm!25426 () Bool)

(declare-fun call!25429 () Bool)

(assert (=> bm!25426 (= call!25429 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!45973 (Cons!4365 (select (arr!6588 a!3325) #b00000000000000000000000000000000) Nil!4366) Nil!4366)))))

(declare-fun b!279600 () Bool)

(assert (=> b!279600 (= e!178222 call!25429)))

(declare-fun b!279601 () Bool)

(assert (=> b!279601 (= e!178221 (contains!1948 Nil!4366 (select (arr!6588 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!279602 () Bool)

(assert (=> b!279602 (= e!178222 call!25429)))

(assert (= (and d!64985 (not res!142757)) b!279598))

(assert (= (and b!279598 res!142759) b!279601))

(assert (= (and b!279598 res!142758) b!279599))

(assert (= (and b!279599 c!45973) b!279600))

(assert (= (and b!279599 (not c!45973)) b!279602))

(assert (= (or b!279600 b!279602) bm!25426))

(declare-fun m!293805 () Bool)

(assert (=> b!279598 m!293805))

(assert (=> b!279598 m!293805))

(declare-fun m!293807 () Bool)

(assert (=> b!279598 m!293807))

(assert (=> b!279599 m!293805))

(assert (=> b!279599 m!293805))

(assert (=> b!279599 m!293807))

(assert (=> bm!25426 m!293805))

(declare-fun m!293809 () Bool)

(assert (=> bm!25426 m!293809))

(assert (=> b!279601 m!293805))

(assert (=> b!279601 m!293805))

(declare-fun m!293811 () Bool)

(assert (=> b!279601 m!293811))

(assert (=> b!279407 d!64985))

(declare-fun b!279629 () Bool)

(declare-fun e!178248 () Bool)

(declare-fun e!178247 () Bool)

(assert (=> b!279629 (= e!178248 e!178247)))

(declare-fun lt!138532 () (_ BitVec 64))

(assert (=> b!279629 (= lt!138532 (select (arr!6588 a!3325) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8768 0))(
  ( (Unit!8769) )
))
(declare-fun lt!138533 () Unit!8768)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13890 (_ BitVec 64) (_ BitVec 32)) Unit!8768)

(assert (=> b!279629 (= lt!138533 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!138532 #b00000000000000000000000000000000))))

(assert (=> b!279629 (arrayContainsKey!0 a!3325 lt!138532 #b00000000000000000000000000000000)))

(declare-fun lt!138534 () Unit!8768)

(assert (=> b!279629 (= lt!138534 lt!138533)))

(declare-fun res!142776 () Bool)

(assert (=> b!279629 (= res!142776 (= (seekEntryOrOpen!0 (select (arr!6588 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1745 #b00000000000000000000000000000000)))))

(assert (=> b!279629 (=> (not res!142776) (not e!178247))))

(declare-fun b!279630 () Bool)

(declare-fun e!178246 () Bool)

(assert (=> b!279630 (= e!178246 e!178248)))

(declare-fun c!45979 () Bool)

(assert (=> b!279630 (= c!45979 (validKeyInArray!0 (select (arr!6588 a!3325) #b00000000000000000000000000000000)))))

(declare-fun d!64989 () Bool)

(declare-fun res!142777 () Bool)

(assert (=> d!64989 (=> res!142777 e!178246)))

(assert (=> d!64989 (= res!142777 (bvsge #b00000000000000000000000000000000 (size!6941 a!3325)))))

(assert (=> d!64989 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!178246)))

(declare-fun bm!25429 () Bool)

(declare-fun call!25432 () Bool)

(assert (=> bm!25429 (= call!25432 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun b!279631 () Bool)

(assert (=> b!279631 (= e!178248 call!25432)))

(declare-fun b!279632 () Bool)

(assert (=> b!279632 (= e!178247 call!25432)))

(assert (= (and d!64989 (not res!142777)) b!279630))

(assert (= (and b!279630 c!45979) b!279629))

(assert (= (and b!279630 (not c!45979)) b!279631))

(assert (= (and b!279629 res!142776) b!279632))

(assert (= (or b!279632 b!279631) bm!25429))

(assert (=> b!279629 m!293805))

(declare-fun m!293835 () Bool)

(assert (=> b!279629 m!293835))

(declare-fun m!293839 () Bool)

(assert (=> b!279629 m!293839))

(assert (=> b!279629 m!293805))

(declare-fun m!293843 () Bool)

(assert (=> b!279629 m!293843))

(assert (=> b!279630 m!293805))

(assert (=> b!279630 m!293805))

(assert (=> b!279630 m!293807))

(declare-fun m!293845 () Bool)

(assert (=> bm!25429 m!293845))

(assert (=> b!279413 d!64989))

(declare-fun d!64999 () Bool)

(declare-fun lt!138545 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!190 (List!4369) (InoxSet (_ BitVec 64)))

(assert (=> d!64999 (= lt!138545 (select (content!190 Nil!4366) k0!2581))))

(declare-fun e!178264 () Bool)

(assert (=> d!64999 (= lt!138545 e!178264)))

(declare-fun res!142787 () Bool)

(assert (=> d!64999 (=> (not res!142787) (not e!178264))))

(assert (=> d!64999 (= res!142787 ((_ is Cons!4365) Nil!4366))))

(assert (=> d!64999 (= (contains!1948 Nil!4366 k0!2581) lt!138545)))

(declare-fun b!279653 () Bool)

(declare-fun e!178263 () Bool)

(assert (=> b!279653 (= e!178264 e!178263)))

(declare-fun res!142786 () Bool)

(assert (=> b!279653 (=> res!142786 e!178263)))

(assert (=> b!279653 (= res!142786 (= (h!5035 Nil!4366) k0!2581))))

(declare-fun b!279654 () Bool)

(assert (=> b!279654 (= e!178263 (contains!1948 (t!9442 Nil!4366) k0!2581))))

(assert (= (and d!64999 res!142787) b!279653))

(assert (= (and b!279653 (not res!142786)) b!279654))

(declare-fun m!293851 () Bool)

(assert (=> d!64999 m!293851))

(declare-fun m!293853 () Bool)

(assert (=> d!64999 m!293853))

(declare-fun m!293855 () Bool)

(assert (=> b!279654 m!293855))

(assert (=> b!279408 d!64999))

(declare-fun d!65005 () Bool)

(declare-fun lt!138546 () Bool)

(assert (=> d!65005 (= lt!138546 (select (content!190 Nil!4366) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!178266 () Bool)

(assert (=> d!65005 (= lt!138546 e!178266)))

(declare-fun res!142789 () Bool)

(assert (=> d!65005 (=> (not res!142789) (not e!178266))))

(assert (=> d!65005 (= res!142789 ((_ is Cons!4365) Nil!4366))))

(assert (=> d!65005 (= (contains!1948 Nil!4366 #b1000000000000000000000000000000000000000000000000000000000000000) lt!138546)))

(declare-fun b!279655 () Bool)

(declare-fun e!178265 () Bool)

(assert (=> b!279655 (= e!178266 e!178265)))

(declare-fun res!142788 () Bool)

(assert (=> b!279655 (=> res!142788 e!178265)))

(assert (=> b!279655 (= res!142788 (= (h!5035 Nil!4366) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!279656 () Bool)

(assert (=> b!279656 (= e!178265 (contains!1948 (t!9442 Nil!4366) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!65005 res!142789) b!279655))

(assert (= (and b!279655 (not res!142788)) b!279656))

(assert (=> d!65005 m!293851))

(declare-fun m!293857 () Bool)

(assert (=> d!65005 m!293857))

(declare-fun m!293859 () Bool)

(assert (=> b!279656 m!293859))

(assert (=> b!279414 d!65005))

(declare-fun d!65007 () Bool)

(declare-fun res!142802 () Bool)

(declare-fun e!178284 () Bool)

(assert (=> d!65007 (=> res!142802 e!178284)))

(assert (=> d!65007 (= res!142802 (= (select (arr!6588 a!3325) #b00000000000000000000000000000000) k0!2581))))

(assert (=> d!65007 (= (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000) e!178284)))

(declare-fun b!279679 () Bool)

(declare-fun e!178285 () Bool)

(assert (=> b!279679 (= e!178284 e!178285)))

(declare-fun res!142803 () Bool)

(assert (=> b!279679 (=> (not res!142803) (not e!178285))))

(assert (=> b!279679 (= res!142803 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6941 a!3325)))))

(declare-fun b!279680 () Bool)

(assert (=> b!279680 (= e!178285 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65007 (not res!142802)) b!279679))

(assert (= (and b!279679 res!142803) b!279680))

(assert (=> d!65007 m!293805))

(declare-fun m!293879 () Bool)

(assert (=> b!279680 m!293879))

(assert (=> b!279409 d!65007))

(declare-fun d!65015 () Bool)

(declare-fun lt!138551 () Bool)

(assert (=> d!65015 (= lt!138551 (select (content!190 Nil!4366) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!178287 () Bool)

(assert (=> d!65015 (= lt!138551 e!178287)))

(declare-fun res!142805 () Bool)

(assert (=> d!65015 (=> (not res!142805) (not e!178287))))

(assert (=> d!65015 (= res!142805 ((_ is Cons!4365) Nil!4366))))

(assert (=> d!65015 (= (contains!1948 Nil!4366 #b0000000000000000000000000000000000000000000000000000000000000000) lt!138551)))

(declare-fun b!279681 () Bool)

(declare-fun e!178286 () Bool)

(assert (=> b!279681 (= e!178287 e!178286)))

(declare-fun res!142804 () Bool)

(assert (=> b!279681 (=> res!142804 e!178286)))

(assert (=> b!279681 (= res!142804 (= (h!5035 Nil!4366) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!279682 () Bool)

(assert (=> b!279682 (= e!178286 (contains!1948 (t!9442 Nil!4366) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!65015 res!142805) b!279681))

(assert (= (and b!279681 (not res!142804)) b!279682))

(assert (=> d!65015 m!293851))

(declare-fun m!293881 () Bool)

(assert (=> d!65015 m!293881))

(declare-fun m!293883 () Bool)

(assert (=> b!279682 m!293883))

(assert (=> b!279404 d!65015))

(check-sat (not b!279539) (not b!279599) (not b!279680) (not b!279654) (not d!65005) (not b!279629) (not b!279656) (not d!65015) (not b!279598) (not b!279682) (not b!279630) (not b!279601) (not bm!25429) (not b!279570) (not b!279571) (not d!64999) (not d!64957) (not bm!25426))
(check-sat)
