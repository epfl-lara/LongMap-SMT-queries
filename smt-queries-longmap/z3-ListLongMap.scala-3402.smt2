; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46994 () Bool)

(assert start!46994)

(declare-fun b!518286 () Bool)

(declare-datatypes ((Unit!16027 0))(
  ( (Unit!16028) )
))
(declare-fun e!302399 () Unit!16027)

(declare-fun Unit!16029 () Unit!16027)

(assert (=> b!518286 (= e!302399 Unit!16029)))

(declare-fun b!518287 () Bool)

(declare-fun res!317359 () Bool)

(declare-fun e!302402 () Bool)

(assert (=> b!518287 (=> (not res!317359) (not e!302402))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518287 (= res!317359 (validKeyInArray!0 k0!2280))))

(declare-fun b!518288 () Bool)

(declare-fun res!317362 () Bool)

(declare-fun e!302403 () Bool)

(assert (=> b!518288 (=> (not res!317362) (not e!302403))))

(declare-datatypes ((array!33136 0))(
  ( (array!33137 (arr!15931 (Array (_ BitVec 32) (_ BitVec 64))) (size!16295 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33136)

(declare-datatypes ((List!9996 0))(
  ( (Nil!9993) (Cons!9992 (h!10899 (_ BitVec 64)) (t!16216 List!9996)) )
))
(declare-fun arrayNoDuplicates!0 (array!33136 (_ BitVec 32) List!9996) Bool)

(assert (=> b!518288 (= res!317362 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9993))))

(declare-fun b!518289 () Bool)

(declare-fun e!302398 () Bool)

(declare-datatypes ((SeekEntryResult!4354 0))(
  ( (MissingZero!4354 (index!19604 (_ BitVec 32))) (Found!4354 (index!19605 (_ BitVec 32))) (Intermediate!4354 (undefined!5166 Bool) (index!19606 (_ BitVec 32)) (x!48716 (_ BitVec 32))) (Undefined!4354) (MissingVacant!4354 (index!19607 (_ BitVec 32))) )
))
(declare-fun lt!237317 () SeekEntryResult!4354)

(assert (=> b!518289 (= e!302398 (and (bvsge (index!19606 lt!237317) #b00000000000000000000000000000000) (bvslt (index!19606 lt!237317) (size!16295 a!3235))))))

(declare-fun lt!237316 () Unit!16027)

(assert (=> b!518289 (= lt!237316 e!302399)))

(declare-fun c!60761 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!518289 (= c!60761 (= (select (arr!15931 a!3235) (index!19606 lt!237317)) (select (arr!15931 a!3235) j!176)))))

(assert (=> b!518289 (and (bvslt (x!48716 lt!237317) #b01111111111111111111111111111110) (or (= (select (arr!15931 a!3235) (index!19606 lt!237317)) (select (arr!15931 a!3235) j!176)) (= (select (arr!15931 a!3235) (index!19606 lt!237317)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15931 a!3235) (index!19606 lt!237317)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518290 () Bool)

(declare-fun res!317351 () Bool)

(assert (=> b!518290 (=> (not res!317351) (not e!302402))))

(declare-fun arrayContainsKey!0 (array!33136 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518290 (= res!317351 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!302397 () Bool)

(declare-fun b!518291 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33136 (_ BitVec 32)) SeekEntryResult!4354)

(assert (=> b!518291 (= e!302397 (= (seekEntryOrOpen!0 (select (arr!15931 a!3235) j!176) a!3235 mask!3524) (Found!4354 j!176)))))

(declare-fun res!317361 () Bool)

(assert (=> start!46994 (=> (not res!317361) (not e!302402))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46994 (= res!317361 (validMask!0 mask!3524))))

(assert (=> start!46994 e!302402))

(assert (=> start!46994 true))

(declare-fun array_inv!11790 (array!33136) Bool)

(assert (=> start!46994 (array_inv!11790 a!3235)))

(declare-fun b!518292 () Bool)

(declare-fun res!317354 () Bool)

(assert (=> b!518292 (=> res!317354 e!302398)))

(get-info :version)

(assert (=> b!518292 (= res!317354 (or (undefined!5166 lt!237317) (not ((_ is Intermediate!4354) lt!237317))))))

(declare-fun b!518293 () Bool)

(assert (=> b!518293 (= e!302402 e!302403)))

(declare-fun res!317355 () Bool)

(assert (=> b!518293 (=> (not res!317355) (not e!302403))))

(declare-fun lt!237322 () SeekEntryResult!4354)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!518293 (= res!317355 (or (= lt!237322 (MissingZero!4354 i!1204)) (= lt!237322 (MissingVacant!4354 i!1204))))))

(assert (=> b!518293 (= lt!237322 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!518294 () Bool)

(declare-fun res!317357 () Bool)

(assert (=> b!518294 (=> (not res!317357) (not e!302402))))

(assert (=> b!518294 (= res!317357 (validKeyInArray!0 (select (arr!15931 a!3235) j!176)))))

(declare-fun b!518295 () Bool)

(declare-fun e!302400 () Bool)

(assert (=> b!518295 (= e!302400 false)))

(declare-fun b!518296 () Bool)

(assert (=> b!518296 (= e!302403 (not e!302398))))

(declare-fun res!317353 () Bool)

(assert (=> b!518296 (=> res!317353 e!302398)))

(declare-fun lt!237318 () array!33136)

(declare-fun lt!237314 () (_ BitVec 32))

(declare-fun lt!237320 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33136 (_ BitVec 32)) SeekEntryResult!4354)

(assert (=> b!518296 (= res!317353 (= lt!237317 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237314 lt!237320 lt!237318 mask!3524)))))

(declare-fun lt!237315 () (_ BitVec 32))

(assert (=> b!518296 (= lt!237317 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237315 (select (arr!15931 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518296 (= lt!237314 (toIndex!0 lt!237320 mask!3524))))

(assert (=> b!518296 (= lt!237320 (select (store (arr!15931 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!518296 (= lt!237315 (toIndex!0 (select (arr!15931 a!3235) j!176) mask!3524))))

(assert (=> b!518296 (= lt!237318 (array!33137 (store (arr!15931 a!3235) i!1204 k0!2280) (size!16295 a!3235)))))

(assert (=> b!518296 e!302397))

(declare-fun res!317360 () Bool)

(assert (=> b!518296 (=> (not res!317360) (not e!302397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33136 (_ BitVec 32)) Bool)

(assert (=> b!518296 (= res!317360 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!237321 () Unit!16027)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33136 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16027)

(assert (=> b!518296 (= lt!237321 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!518297 () Bool)

(declare-fun Unit!16030 () Unit!16027)

(assert (=> b!518297 (= e!302399 Unit!16030)))

(declare-fun lt!237319 () Unit!16027)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33136 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16027)

(assert (=> b!518297 (= lt!237319 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237315 #b00000000000000000000000000000000 (index!19606 lt!237317) (x!48716 lt!237317) mask!3524))))

(declare-fun res!317356 () Bool)

(assert (=> b!518297 (= res!317356 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237315 lt!237320 lt!237318 mask!3524) (Intermediate!4354 false (index!19606 lt!237317) (x!48716 lt!237317))))))

(assert (=> b!518297 (=> (not res!317356) (not e!302400))))

(assert (=> b!518297 e!302400))

(declare-fun b!518298 () Bool)

(declare-fun res!317358 () Bool)

(assert (=> b!518298 (=> (not res!317358) (not e!302402))))

(assert (=> b!518298 (= res!317358 (and (= (size!16295 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16295 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16295 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!518299 () Bool)

(declare-fun res!317352 () Bool)

(assert (=> b!518299 (=> (not res!317352) (not e!302403))))

(assert (=> b!518299 (= res!317352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46994 res!317361) b!518298))

(assert (= (and b!518298 res!317358) b!518294))

(assert (= (and b!518294 res!317357) b!518287))

(assert (= (and b!518287 res!317359) b!518290))

(assert (= (and b!518290 res!317351) b!518293))

(assert (= (and b!518293 res!317355) b!518299))

(assert (= (and b!518299 res!317352) b!518288))

(assert (= (and b!518288 res!317362) b!518296))

(assert (= (and b!518296 res!317360) b!518291))

(assert (= (and b!518296 (not res!317353)) b!518292))

(assert (= (and b!518292 (not res!317354)) b!518289))

(assert (= (and b!518289 c!60761) b!518297))

(assert (= (and b!518289 (not c!60761)) b!518286))

(assert (= (and b!518297 res!317356) b!518295))

(declare-fun m!499909 () Bool)

(assert (=> b!518291 m!499909))

(assert (=> b!518291 m!499909))

(declare-fun m!499911 () Bool)

(assert (=> b!518291 m!499911))

(declare-fun m!499913 () Bool)

(assert (=> b!518293 m!499913))

(declare-fun m!499915 () Bool)

(assert (=> b!518297 m!499915))

(declare-fun m!499917 () Bool)

(assert (=> b!518297 m!499917))

(declare-fun m!499919 () Bool)

(assert (=> b!518299 m!499919))

(declare-fun m!499921 () Bool)

(assert (=> b!518287 m!499921))

(declare-fun m!499923 () Bool)

(assert (=> b!518289 m!499923))

(assert (=> b!518289 m!499909))

(declare-fun m!499925 () Bool)

(assert (=> b!518288 m!499925))

(declare-fun m!499927 () Bool)

(assert (=> b!518290 m!499927))

(assert (=> b!518294 m!499909))

(assert (=> b!518294 m!499909))

(declare-fun m!499929 () Bool)

(assert (=> b!518294 m!499929))

(declare-fun m!499931 () Bool)

(assert (=> b!518296 m!499931))

(declare-fun m!499933 () Bool)

(assert (=> b!518296 m!499933))

(declare-fun m!499935 () Bool)

(assert (=> b!518296 m!499935))

(declare-fun m!499937 () Bool)

(assert (=> b!518296 m!499937))

(assert (=> b!518296 m!499909))

(declare-fun m!499939 () Bool)

(assert (=> b!518296 m!499939))

(assert (=> b!518296 m!499909))

(declare-fun m!499941 () Bool)

(assert (=> b!518296 m!499941))

(assert (=> b!518296 m!499909))

(declare-fun m!499943 () Bool)

(assert (=> b!518296 m!499943))

(declare-fun m!499945 () Bool)

(assert (=> b!518296 m!499945))

(declare-fun m!499947 () Bool)

(assert (=> start!46994 m!499947))

(declare-fun m!499949 () Bool)

(assert (=> start!46994 m!499949))

(check-sat (not start!46994) (not b!518288) (not b!518287) (not b!518293) (not b!518290) (not b!518296) (not b!518291) (not b!518299) (not b!518294) (not b!518297))
(check-sat)
(get-model)

(declare-fun d!79895 () Bool)

(assert (=> d!79895 (= (validKeyInArray!0 (select (arr!15931 a!3235) j!176)) (and (not (= (select (arr!15931 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15931 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!518294 d!79895))

(declare-fun d!79897 () Bool)

(declare-fun res!317440 () Bool)

(declare-fun e!302453 () Bool)

(assert (=> d!79897 (=> res!317440 e!302453)))

(assert (=> d!79897 (= res!317440 (bvsge #b00000000000000000000000000000000 (size!16295 a!3235)))))

(assert (=> d!79897 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!302453)))

(declare-fun b!518392 () Bool)

(declare-fun e!302452 () Bool)

(declare-fun e!302454 () Bool)

(assert (=> b!518392 (= e!302452 e!302454)))

(declare-fun lt!237383 () (_ BitVec 64))

(assert (=> b!518392 (= lt!237383 (select (arr!15931 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!237385 () Unit!16027)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33136 (_ BitVec 64) (_ BitVec 32)) Unit!16027)

(assert (=> b!518392 (= lt!237385 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237383 #b00000000000000000000000000000000))))

(assert (=> b!518392 (arrayContainsKey!0 a!3235 lt!237383 #b00000000000000000000000000000000)))

(declare-fun lt!237384 () Unit!16027)

(assert (=> b!518392 (= lt!237384 lt!237385)))

(declare-fun res!317439 () Bool)

(assert (=> b!518392 (= res!317439 (= (seekEntryOrOpen!0 (select (arr!15931 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4354 #b00000000000000000000000000000000)))))

(assert (=> b!518392 (=> (not res!317439) (not e!302454))))

(declare-fun bm!31689 () Bool)

(declare-fun call!31692 () Bool)

(assert (=> bm!31689 (= call!31692 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!518393 () Bool)

(assert (=> b!518393 (= e!302454 call!31692)))

(declare-fun b!518394 () Bool)

(assert (=> b!518394 (= e!302453 e!302452)))

(declare-fun c!60770 () Bool)

(assert (=> b!518394 (= c!60770 (validKeyInArray!0 (select (arr!15931 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!518395 () Bool)

(assert (=> b!518395 (= e!302452 call!31692)))

(assert (= (and d!79897 (not res!317440)) b!518394))

(assert (= (and b!518394 c!60770) b!518392))

(assert (= (and b!518394 (not c!60770)) b!518395))

(assert (= (and b!518392 res!317439) b!518393))

(assert (= (or b!518393 b!518395) bm!31689))

(declare-fun m!500035 () Bool)

(assert (=> b!518392 m!500035))

(declare-fun m!500037 () Bool)

(assert (=> b!518392 m!500037))

(declare-fun m!500039 () Bool)

(assert (=> b!518392 m!500039))

(assert (=> b!518392 m!500035))

(declare-fun m!500041 () Bool)

(assert (=> b!518392 m!500041))

(declare-fun m!500043 () Bool)

(assert (=> bm!31689 m!500043))

(assert (=> b!518394 m!500035))

(assert (=> b!518394 m!500035))

(declare-fun m!500045 () Bool)

(assert (=> b!518394 m!500045))

(assert (=> b!518299 d!79897))

(declare-fun d!79899 () Bool)

(assert (=> d!79899 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46994 d!79899))

(declare-fun d!79901 () Bool)

(assert (=> d!79901 (= (array_inv!11790 a!3235) (bvsge (size!16295 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46994 d!79901))

(declare-fun d!79903 () Bool)

(assert (=> d!79903 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!518287 d!79903))

(declare-fun b!518406 () Bool)

(declare-fun e!302463 () Bool)

(declare-fun e!302466 () Bool)

(assert (=> b!518406 (= e!302463 e!302466)))

(declare-fun c!60773 () Bool)

(assert (=> b!518406 (= c!60773 (validKeyInArray!0 (select (arr!15931 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79905 () Bool)

(declare-fun res!317447 () Bool)

(declare-fun e!302464 () Bool)

(assert (=> d!79905 (=> res!317447 e!302464)))

(assert (=> d!79905 (= res!317447 (bvsge #b00000000000000000000000000000000 (size!16295 a!3235)))))

(assert (=> d!79905 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9993) e!302464)))

(declare-fun b!518407 () Bool)

(assert (=> b!518407 (= e!302464 e!302463)))

(declare-fun res!317449 () Bool)

(assert (=> b!518407 (=> (not res!317449) (not e!302463))))

(declare-fun e!302465 () Bool)

(assert (=> b!518407 (= res!317449 (not e!302465))))

(declare-fun res!317448 () Bool)

(assert (=> b!518407 (=> (not res!317448) (not e!302465))))

(assert (=> b!518407 (= res!317448 (validKeyInArray!0 (select (arr!15931 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!518408 () Bool)

(declare-fun contains!2727 (List!9996 (_ BitVec 64)) Bool)

(assert (=> b!518408 (= e!302465 (contains!2727 Nil!9993 (select (arr!15931 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31692 () Bool)

(declare-fun call!31695 () Bool)

(assert (=> bm!31692 (= call!31695 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60773 (Cons!9992 (select (arr!15931 a!3235) #b00000000000000000000000000000000) Nil!9993) Nil!9993)))))

(declare-fun b!518409 () Bool)

(assert (=> b!518409 (= e!302466 call!31695)))

(declare-fun b!518410 () Bool)

(assert (=> b!518410 (= e!302466 call!31695)))

(assert (= (and d!79905 (not res!317447)) b!518407))

(assert (= (and b!518407 res!317448) b!518408))

(assert (= (and b!518407 res!317449) b!518406))

(assert (= (and b!518406 c!60773) b!518409))

(assert (= (and b!518406 (not c!60773)) b!518410))

(assert (= (or b!518409 b!518410) bm!31692))

(assert (=> b!518406 m!500035))

(assert (=> b!518406 m!500035))

(assert (=> b!518406 m!500045))

(assert (=> b!518407 m!500035))

(assert (=> b!518407 m!500035))

(assert (=> b!518407 m!500045))

(assert (=> b!518408 m!500035))

(assert (=> b!518408 m!500035))

(declare-fun m!500047 () Bool)

(assert (=> b!518408 m!500047))

(assert (=> bm!31692 m!500035))

(declare-fun m!500049 () Bool)

(assert (=> bm!31692 m!500049))

(assert (=> b!518288 d!79905))

(declare-fun b!518462 () Bool)

(declare-fun e!302497 () SeekEntryResult!4354)

(declare-fun lt!237414 () SeekEntryResult!4354)

(assert (=> b!518462 (= e!302497 (Found!4354 (index!19606 lt!237414)))))

(declare-fun b!518463 () Bool)

(declare-fun e!302498 () SeekEntryResult!4354)

(assert (=> b!518463 (= e!302498 (MissingZero!4354 (index!19606 lt!237414)))))

(declare-fun b!518464 () Bool)

(declare-fun e!302499 () SeekEntryResult!4354)

(assert (=> b!518464 (= e!302499 e!302497)))

(declare-fun lt!237413 () (_ BitVec 64))

(assert (=> b!518464 (= lt!237413 (select (arr!15931 a!3235) (index!19606 lt!237414)))))

(declare-fun c!60792 () Bool)

(assert (=> b!518464 (= c!60792 (= lt!237413 k0!2280))))

(declare-fun b!518465 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33136 (_ BitVec 32)) SeekEntryResult!4354)

(assert (=> b!518465 (= e!302498 (seekKeyOrZeroReturnVacant!0 (x!48716 lt!237414) (index!19606 lt!237414) (index!19606 lt!237414) k0!2280 a!3235 mask!3524))))

(declare-fun b!518466 () Bool)

(declare-fun c!60794 () Bool)

(assert (=> b!518466 (= c!60794 (= lt!237413 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!518466 (= e!302497 e!302498)))

(declare-fun d!79907 () Bool)

(declare-fun lt!237415 () SeekEntryResult!4354)

(assert (=> d!79907 (and (or ((_ is Undefined!4354) lt!237415) (not ((_ is Found!4354) lt!237415)) (and (bvsge (index!19605 lt!237415) #b00000000000000000000000000000000) (bvslt (index!19605 lt!237415) (size!16295 a!3235)))) (or ((_ is Undefined!4354) lt!237415) ((_ is Found!4354) lt!237415) (not ((_ is MissingZero!4354) lt!237415)) (and (bvsge (index!19604 lt!237415) #b00000000000000000000000000000000) (bvslt (index!19604 lt!237415) (size!16295 a!3235)))) (or ((_ is Undefined!4354) lt!237415) ((_ is Found!4354) lt!237415) ((_ is MissingZero!4354) lt!237415) (not ((_ is MissingVacant!4354) lt!237415)) (and (bvsge (index!19607 lt!237415) #b00000000000000000000000000000000) (bvslt (index!19607 lt!237415) (size!16295 a!3235)))) (or ((_ is Undefined!4354) lt!237415) (ite ((_ is Found!4354) lt!237415) (= (select (arr!15931 a!3235) (index!19605 lt!237415)) k0!2280) (ite ((_ is MissingZero!4354) lt!237415) (= (select (arr!15931 a!3235) (index!19604 lt!237415)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4354) lt!237415) (= (select (arr!15931 a!3235) (index!19607 lt!237415)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79907 (= lt!237415 e!302499)))

(declare-fun c!60793 () Bool)

(assert (=> d!79907 (= c!60793 (and ((_ is Intermediate!4354) lt!237414) (undefined!5166 lt!237414)))))

(assert (=> d!79907 (= lt!237414 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79907 (validMask!0 mask!3524)))

(assert (=> d!79907 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!237415)))

(declare-fun b!518467 () Bool)

(assert (=> b!518467 (= e!302499 Undefined!4354)))

(assert (= (and d!79907 c!60793) b!518467))

(assert (= (and d!79907 (not c!60793)) b!518464))

(assert (= (and b!518464 c!60792) b!518462))

(assert (= (and b!518464 (not c!60792)) b!518466))

(assert (= (and b!518466 c!60794) b!518463))

(assert (= (and b!518466 (not c!60794)) b!518465))

(declare-fun m!500065 () Bool)

(assert (=> b!518464 m!500065))

(declare-fun m!500067 () Bool)

(assert (=> b!518465 m!500067))

(declare-fun m!500069 () Bool)

(assert (=> d!79907 m!500069))

(declare-fun m!500071 () Bool)

(assert (=> d!79907 m!500071))

(declare-fun m!500073 () Bool)

(assert (=> d!79907 m!500073))

(declare-fun m!500075 () Bool)

(assert (=> d!79907 m!500075))

(assert (=> d!79907 m!499947))

(assert (=> d!79907 m!500073))

(declare-fun m!500077 () Bool)

(assert (=> d!79907 m!500077))

(assert (=> b!518293 d!79907))

(declare-fun b!518468 () Bool)

(declare-fun e!302500 () SeekEntryResult!4354)

(declare-fun lt!237423 () SeekEntryResult!4354)

(assert (=> b!518468 (= e!302500 (Found!4354 (index!19606 lt!237423)))))

(declare-fun b!518469 () Bool)

(declare-fun e!302501 () SeekEntryResult!4354)

(assert (=> b!518469 (= e!302501 (MissingZero!4354 (index!19606 lt!237423)))))

(declare-fun b!518470 () Bool)

(declare-fun e!302502 () SeekEntryResult!4354)

(assert (=> b!518470 (= e!302502 e!302500)))

(declare-fun lt!237420 () (_ BitVec 64))

(assert (=> b!518470 (= lt!237420 (select (arr!15931 a!3235) (index!19606 lt!237423)))))

(declare-fun c!60795 () Bool)

(assert (=> b!518470 (= c!60795 (= lt!237420 (select (arr!15931 a!3235) j!176)))))

(declare-fun b!518471 () Bool)

(assert (=> b!518471 (= e!302501 (seekKeyOrZeroReturnVacant!0 (x!48716 lt!237423) (index!19606 lt!237423) (index!19606 lt!237423) (select (arr!15931 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!518472 () Bool)

(declare-fun c!60797 () Bool)

(assert (=> b!518472 (= c!60797 (= lt!237420 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!518472 (= e!302500 e!302501)))

(declare-fun d!79921 () Bool)

(declare-fun lt!237424 () SeekEntryResult!4354)

(assert (=> d!79921 (and (or ((_ is Undefined!4354) lt!237424) (not ((_ is Found!4354) lt!237424)) (and (bvsge (index!19605 lt!237424) #b00000000000000000000000000000000) (bvslt (index!19605 lt!237424) (size!16295 a!3235)))) (or ((_ is Undefined!4354) lt!237424) ((_ is Found!4354) lt!237424) (not ((_ is MissingZero!4354) lt!237424)) (and (bvsge (index!19604 lt!237424) #b00000000000000000000000000000000) (bvslt (index!19604 lt!237424) (size!16295 a!3235)))) (or ((_ is Undefined!4354) lt!237424) ((_ is Found!4354) lt!237424) ((_ is MissingZero!4354) lt!237424) (not ((_ is MissingVacant!4354) lt!237424)) (and (bvsge (index!19607 lt!237424) #b00000000000000000000000000000000) (bvslt (index!19607 lt!237424) (size!16295 a!3235)))) (or ((_ is Undefined!4354) lt!237424) (ite ((_ is Found!4354) lt!237424) (= (select (arr!15931 a!3235) (index!19605 lt!237424)) (select (arr!15931 a!3235) j!176)) (ite ((_ is MissingZero!4354) lt!237424) (= (select (arr!15931 a!3235) (index!19604 lt!237424)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4354) lt!237424) (= (select (arr!15931 a!3235) (index!19607 lt!237424)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79921 (= lt!237424 e!302502)))

(declare-fun c!60796 () Bool)

(assert (=> d!79921 (= c!60796 (and ((_ is Intermediate!4354) lt!237423) (undefined!5166 lt!237423)))))

(assert (=> d!79921 (= lt!237423 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15931 a!3235) j!176) mask!3524) (select (arr!15931 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79921 (validMask!0 mask!3524)))

(assert (=> d!79921 (= (seekEntryOrOpen!0 (select (arr!15931 a!3235) j!176) a!3235 mask!3524) lt!237424)))

(declare-fun b!518473 () Bool)

(assert (=> b!518473 (= e!302502 Undefined!4354)))

(assert (= (and d!79921 c!60796) b!518473))

(assert (= (and d!79921 (not c!60796)) b!518470))

(assert (= (and b!518470 c!60795) b!518468))

(assert (= (and b!518470 (not c!60795)) b!518472))

(assert (= (and b!518472 c!60797) b!518469))

(assert (= (and b!518472 (not c!60797)) b!518471))

(declare-fun m!500079 () Bool)

(assert (=> b!518470 m!500079))

(assert (=> b!518471 m!499909))

(declare-fun m!500081 () Bool)

(assert (=> b!518471 m!500081))

(declare-fun m!500083 () Bool)

(assert (=> d!79921 m!500083))

(declare-fun m!500085 () Bool)

(assert (=> d!79921 m!500085))

(assert (=> d!79921 m!499909))

(assert (=> d!79921 m!499939))

(declare-fun m!500087 () Bool)

(assert (=> d!79921 m!500087))

(assert (=> d!79921 m!499947))

(assert (=> d!79921 m!499939))

(assert (=> d!79921 m!499909))

(declare-fun m!500089 () Bool)

(assert (=> d!79921 m!500089))

(assert (=> b!518291 d!79921))

(declare-fun d!79925 () Bool)

(declare-fun e!302537 () Bool)

(assert (=> d!79925 e!302537))

(declare-fun res!317490 () Bool)

(assert (=> d!79925 (=> (not res!317490) (not e!302537))))

(assert (=> d!79925 (= res!317490 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16295 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16295 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16295 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16295 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16295 a!3235))))))

(declare-fun lt!237447 () Unit!16027)

(declare-fun choose!47 (array!33136 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16027)

(assert (=> d!79925 (= lt!237447 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!237315 #b00000000000000000000000000000000 (index!19606 lt!237317) (x!48716 lt!237317) mask!3524))))

(assert (=> d!79925 (validMask!0 mask!3524)))

(assert (=> d!79925 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237315 #b00000000000000000000000000000000 (index!19606 lt!237317) (x!48716 lt!237317) mask!3524) lt!237447)))

(declare-fun b!518525 () Bool)

(assert (=> b!518525 (= e!302537 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237315 (select (store (arr!15931 a!3235) i!1204 k0!2280) j!176) (array!33137 (store (arr!15931 a!3235) i!1204 k0!2280) (size!16295 a!3235)) mask!3524) (Intermediate!4354 false (index!19606 lt!237317) (x!48716 lt!237317))))))

(assert (= (and d!79925 res!317490) b!518525))

(declare-fun m!500107 () Bool)

(assert (=> d!79925 m!500107))

(assert (=> d!79925 m!499947))

(assert (=> b!518525 m!499931))

(assert (=> b!518525 m!499935))

(assert (=> b!518525 m!499935))

(declare-fun m!500109 () Bool)

(assert (=> b!518525 m!500109))

(assert (=> b!518297 d!79925))

(declare-fun b!518604 () Bool)

(declare-fun e!302593 () Bool)

(declare-fun e!302592 () Bool)

(assert (=> b!518604 (= e!302593 e!302592)))

(declare-fun res!317530 () Bool)

(declare-fun lt!237469 () SeekEntryResult!4354)

(assert (=> b!518604 (= res!317530 (and ((_ is Intermediate!4354) lt!237469) (not (undefined!5166 lt!237469)) (bvslt (x!48716 lt!237469) #b01111111111111111111111111111110) (bvsge (x!48716 lt!237469) #b00000000000000000000000000000000) (bvsge (x!48716 lt!237469) #b00000000000000000000000000000000)))))

(assert (=> b!518604 (=> (not res!317530) (not e!302592))))

(declare-fun b!518605 () Bool)

(declare-fun e!302595 () SeekEntryResult!4354)

(assert (=> b!518605 (= e!302595 (Intermediate!4354 false lt!237315 #b00000000000000000000000000000000))))

(declare-fun b!518606 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518606 (= e!302595 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237315 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!237320 lt!237318 mask!3524))))

(declare-fun b!518607 () Bool)

(assert (=> b!518607 (= e!302593 (bvsge (x!48716 lt!237469) #b01111111111111111111111111111110))))

(declare-fun b!518608 () Bool)

(declare-fun e!302591 () SeekEntryResult!4354)

(assert (=> b!518608 (= e!302591 e!302595)))

(declare-fun c!60834 () Bool)

(declare-fun lt!237470 () (_ BitVec 64))

(assert (=> b!518608 (= c!60834 (or (= lt!237470 lt!237320) (= (bvadd lt!237470 lt!237470) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!79935 () Bool)

(assert (=> d!79935 e!302593))

(declare-fun c!60832 () Bool)

(assert (=> d!79935 (= c!60832 (and ((_ is Intermediate!4354) lt!237469) (undefined!5166 lt!237469)))))

(assert (=> d!79935 (= lt!237469 e!302591)))

(declare-fun c!60833 () Bool)

(assert (=> d!79935 (= c!60833 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79935 (= lt!237470 (select (arr!15931 lt!237318) lt!237315))))

(assert (=> d!79935 (validMask!0 mask!3524)))

(assert (=> d!79935 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237315 lt!237320 lt!237318 mask!3524) lt!237469)))

(declare-fun b!518609 () Bool)

(assert (=> b!518609 (and (bvsge (index!19606 lt!237469) #b00000000000000000000000000000000) (bvslt (index!19606 lt!237469) (size!16295 lt!237318)))))

(declare-fun res!317531 () Bool)

(assert (=> b!518609 (= res!317531 (= (select (arr!15931 lt!237318) (index!19606 lt!237469)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302594 () Bool)

(assert (=> b!518609 (=> res!317531 e!302594)))

(declare-fun b!518610 () Bool)

(assert (=> b!518610 (and (bvsge (index!19606 lt!237469) #b00000000000000000000000000000000) (bvslt (index!19606 lt!237469) (size!16295 lt!237318)))))

(declare-fun res!317529 () Bool)

(assert (=> b!518610 (= res!317529 (= (select (arr!15931 lt!237318) (index!19606 lt!237469)) lt!237320))))

(assert (=> b!518610 (=> res!317529 e!302594)))

(assert (=> b!518610 (= e!302592 e!302594)))

(declare-fun b!518611 () Bool)

(assert (=> b!518611 (= e!302591 (Intermediate!4354 true lt!237315 #b00000000000000000000000000000000))))

(declare-fun b!518612 () Bool)

(assert (=> b!518612 (and (bvsge (index!19606 lt!237469) #b00000000000000000000000000000000) (bvslt (index!19606 lt!237469) (size!16295 lt!237318)))))

(assert (=> b!518612 (= e!302594 (= (select (arr!15931 lt!237318) (index!19606 lt!237469)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!79935 c!60833) b!518611))

(assert (= (and d!79935 (not c!60833)) b!518608))

(assert (= (and b!518608 c!60834) b!518605))

(assert (= (and b!518608 (not c!60834)) b!518606))

(assert (= (and d!79935 c!60832) b!518607))

(assert (= (and d!79935 (not c!60832)) b!518604))

(assert (= (and b!518604 res!317530) b!518610))

(assert (= (and b!518610 (not res!317529)) b!518609))

(assert (= (and b!518609 (not res!317531)) b!518612))

(declare-fun m!500165 () Bool)

(assert (=> b!518610 m!500165))

(declare-fun m!500167 () Bool)

(assert (=> b!518606 m!500167))

(assert (=> b!518606 m!500167))

(declare-fun m!500169 () Bool)

(assert (=> b!518606 m!500169))

(declare-fun m!500171 () Bool)

(assert (=> d!79935 m!500171))

(assert (=> d!79935 m!499947))

(assert (=> b!518609 m!500165))

(assert (=> b!518612 m!500165))

(assert (=> b!518297 d!79935))

(declare-fun d!79963 () Bool)

(declare-fun res!317536 () Bool)

(declare-fun e!302600 () Bool)

(assert (=> d!79963 (=> res!317536 e!302600)))

(assert (=> d!79963 (= res!317536 (= (select (arr!15931 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79963 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!302600)))

(declare-fun b!518617 () Bool)

(declare-fun e!302601 () Bool)

(assert (=> b!518617 (= e!302600 e!302601)))

(declare-fun res!317537 () Bool)

(assert (=> b!518617 (=> (not res!317537) (not e!302601))))

(assert (=> b!518617 (= res!317537 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16295 a!3235)))))

(declare-fun b!518618 () Bool)

(assert (=> b!518618 (= e!302601 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79963 (not res!317536)) b!518617))

(assert (= (and b!518617 res!317537) b!518618))

(assert (=> d!79963 m!500035))

(declare-fun m!500173 () Bool)

(assert (=> b!518618 m!500173))

(assert (=> b!518290 d!79963))

(declare-fun d!79965 () Bool)

(declare-fun lt!237482 () (_ BitVec 32))

(declare-fun lt!237481 () (_ BitVec 32))

(assert (=> d!79965 (= lt!237482 (bvmul (bvxor lt!237481 (bvlshr lt!237481 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79965 (= lt!237481 ((_ extract 31 0) (bvand (bvxor lt!237320 (bvlshr lt!237320 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79965 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!317538 (let ((h!10904 ((_ extract 31 0) (bvand (bvxor lt!237320 (bvlshr lt!237320 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48726 (bvmul (bvxor h!10904 (bvlshr h!10904 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48726 (bvlshr x!48726 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!317538 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!317538 #b00000000000000000000000000000000))))))

(assert (=> d!79965 (= (toIndex!0 lt!237320 mask!3524) (bvand (bvxor lt!237482 (bvlshr lt!237482 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!518296 d!79965))

(declare-fun d!79967 () Bool)

(declare-fun lt!237484 () (_ BitVec 32))

(declare-fun lt!237483 () (_ BitVec 32))

(assert (=> d!79967 (= lt!237484 (bvmul (bvxor lt!237483 (bvlshr lt!237483 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79967 (= lt!237483 ((_ extract 31 0) (bvand (bvxor (select (arr!15931 a!3235) j!176) (bvlshr (select (arr!15931 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79967 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!317538 (let ((h!10904 ((_ extract 31 0) (bvand (bvxor (select (arr!15931 a!3235) j!176) (bvlshr (select (arr!15931 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48726 (bvmul (bvxor h!10904 (bvlshr h!10904 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48726 (bvlshr x!48726 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!317538 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!317538 #b00000000000000000000000000000000))))))

(assert (=> d!79967 (= (toIndex!0 (select (arr!15931 a!3235) j!176) mask!3524) (bvand (bvxor lt!237484 (bvlshr lt!237484 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!518296 d!79967))

(declare-fun b!518631 () Bool)

(declare-fun e!302610 () Bool)

(declare-fun e!302609 () Bool)

(assert (=> b!518631 (= e!302610 e!302609)))

(declare-fun res!317540 () Bool)

(declare-fun lt!237485 () SeekEntryResult!4354)

(assert (=> b!518631 (= res!317540 (and ((_ is Intermediate!4354) lt!237485) (not (undefined!5166 lt!237485)) (bvslt (x!48716 lt!237485) #b01111111111111111111111111111110) (bvsge (x!48716 lt!237485) #b00000000000000000000000000000000) (bvsge (x!48716 lt!237485) #b00000000000000000000000000000000)))))

(assert (=> b!518631 (=> (not res!317540) (not e!302609))))

(declare-fun b!518632 () Bool)

(declare-fun e!302612 () SeekEntryResult!4354)

(assert (=> b!518632 (= e!302612 (Intermediate!4354 false lt!237314 #b00000000000000000000000000000000))))

(declare-fun b!518633 () Bool)

(assert (=> b!518633 (= e!302612 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237314 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!237320 lt!237318 mask!3524))))

(declare-fun b!518634 () Bool)

(assert (=> b!518634 (= e!302610 (bvsge (x!48716 lt!237485) #b01111111111111111111111111111110))))

(declare-fun b!518635 () Bool)

(declare-fun e!302608 () SeekEntryResult!4354)

(assert (=> b!518635 (= e!302608 e!302612)))

(declare-fun c!60843 () Bool)

(declare-fun lt!237486 () (_ BitVec 64))

(assert (=> b!518635 (= c!60843 (or (= lt!237486 lt!237320) (= (bvadd lt!237486 lt!237486) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!79969 () Bool)

(assert (=> d!79969 e!302610))

(declare-fun c!60841 () Bool)

(assert (=> d!79969 (= c!60841 (and ((_ is Intermediate!4354) lt!237485) (undefined!5166 lt!237485)))))

(assert (=> d!79969 (= lt!237485 e!302608)))

(declare-fun c!60842 () Bool)

(assert (=> d!79969 (= c!60842 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79969 (= lt!237486 (select (arr!15931 lt!237318) lt!237314))))

(assert (=> d!79969 (validMask!0 mask!3524)))

(assert (=> d!79969 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237314 lt!237320 lt!237318 mask!3524) lt!237485)))

(declare-fun b!518636 () Bool)

(assert (=> b!518636 (and (bvsge (index!19606 lt!237485) #b00000000000000000000000000000000) (bvslt (index!19606 lt!237485) (size!16295 lt!237318)))))

(declare-fun res!317541 () Bool)

(assert (=> b!518636 (= res!317541 (= (select (arr!15931 lt!237318) (index!19606 lt!237485)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302611 () Bool)

(assert (=> b!518636 (=> res!317541 e!302611)))

(declare-fun b!518637 () Bool)

(assert (=> b!518637 (and (bvsge (index!19606 lt!237485) #b00000000000000000000000000000000) (bvslt (index!19606 lt!237485) (size!16295 lt!237318)))))

(declare-fun res!317539 () Bool)

(assert (=> b!518637 (= res!317539 (= (select (arr!15931 lt!237318) (index!19606 lt!237485)) lt!237320))))

(assert (=> b!518637 (=> res!317539 e!302611)))

(assert (=> b!518637 (= e!302609 e!302611)))

(declare-fun b!518638 () Bool)

(assert (=> b!518638 (= e!302608 (Intermediate!4354 true lt!237314 #b00000000000000000000000000000000))))

(declare-fun b!518639 () Bool)

(assert (=> b!518639 (and (bvsge (index!19606 lt!237485) #b00000000000000000000000000000000) (bvslt (index!19606 lt!237485) (size!16295 lt!237318)))))

(assert (=> b!518639 (= e!302611 (= (select (arr!15931 lt!237318) (index!19606 lt!237485)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!79969 c!60842) b!518638))

(assert (= (and d!79969 (not c!60842)) b!518635))

(assert (= (and b!518635 c!60843) b!518632))

(assert (= (and b!518635 (not c!60843)) b!518633))

(assert (= (and d!79969 c!60841) b!518634))

(assert (= (and d!79969 (not c!60841)) b!518631))

(assert (= (and b!518631 res!317540) b!518637))

(assert (= (and b!518637 (not res!317539)) b!518636))

(assert (= (and b!518636 (not res!317541)) b!518639))

(declare-fun m!500175 () Bool)

(assert (=> b!518637 m!500175))

(declare-fun m!500177 () Bool)

(assert (=> b!518633 m!500177))

(assert (=> b!518633 m!500177))

(declare-fun m!500179 () Bool)

(assert (=> b!518633 m!500179))

(declare-fun m!500181 () Bool)

(assert (=> d!79969 m!500181))

(assert (=> d!79969 m!499947))

(assert (=> b!518636 m!500175))

(assert (=> b!518639 m!500175))

(assert (=> b!518296 d!79969))

(declare-fun d!79971 () Bool)

(declare-fun res!317543 () Bool)

(declare-fun e!302614 () Bool)

(assert (=> d!79971 (=> res!317543 e!302614)))

(assert (=> d!79971 (= res!317543 (bvsge j!176 (size!16295 a!3235)))))

(assert (=> d!79971 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!302614)))

(declare-fun b!518640 () Bool)

(declare-fun e!302613 () Bool)

(declare-fun e!302615 () Bool)

(assert (=> b!518640 (= e!302613 e!302615)))

(declare-fun lt!237487 () (_ BitVec 64))

(assert (=> b!518640 (= lt!237487 (select (arr!15931 a!3235) j!176))))

(declare-fun lt!237489 () Unit!16027)

(assert (=> b!518640 (= lt!237489 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237487 j!176))))

(assert (=> b!518640 (arrayContainsKey!0 a!3235 lt!237487 #b00000000000000000000000000000000)))

(declare-fun lt!237488 () Unit!16027)

(assert (=> b!518640 (= lt!237488 lt!237489)))

(declare-fun res!317542 () Bool)

(assert (=> b!518640 (= res!317542 (= (seekEntryOrOpen!0 (select (arr!15931 a!3235) j!176) a!3235 mask!3524) (Found!4354 j!176)))))

(assert (=> b!518640 (=> (not res!317542) (not e!302615))))

(declare-fun bm!31706 () Bool)

(declare-fun call!31709 () Bool)

(assert (=> bm!31706 (= call!31709 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!518641 () Bool)

(assert (=> b!518641 (= e!302615 call!31709)))

(declare-fun b!518642 () Bool)

(assert (=> b!518642 (= e!302614 e!302613)))

(declare-fun c!60844 () Bool)

(assert (=> b!518642 (= c!60844 (validKeyInArray!0 (select (arr!15931 a!3235) j!176)))))

(declare-fun b!518643 () Bool)

(assert (=> b!518643 (= e!302613 call!31709)))

(assert (= (and d!79971 (not res!317543)) b!518642))

(assert (= (and b!518642 c!60844) b!518640))

(assert (= (and b!518642 (not c!60844)) b!518643))

(assert (= (and b!518640 res!317542) b!518641))

(assert (= (or b!518641 b!518643) bm!31706))

(assert (=> b!518640 m!499909))

(declare-fun m!500183 () Bool)

(assert (=> b!518640 m!500183))

(declare-fun m!500185 () Bool)

(assert (=> b!518640 m!500185))

(assert (=> b!518640 m!499909))

(assert (=> b!518640 m!499911))

(declare-fun m!500189 () Bool)

(assert (=> bm!31706 m!500189))

(assert (=> b!518642 m!499909))

(assert (=> b!518642 m!499909))

(assert (=> b!518642 m!499929))

(assert (=> b!518296 d!79971))

(declare-fun b!518650 () Bool)

(declare-fun e!302621 () Bool)

(declare-fun e!302620 () Bool)

(assert (=> b!518650 (= e!302621 e!302620)))

(declare-fun res!317545 () Bool)

(declare-fun lt!237493 () SeekEntryResult!4354)

(assert (=> b!518650 (= res!317545 (and ((_ is Intermediate!4354) lt!237493) (not (undefined!5166 lt!237493)) (bvslt (x!48716 lt!237493) #b01111111111111111111111111111110) (bvsge (x!48716 lt!237493) #b00000000000000000000000000000000) (bvsge (x!48716 lt!237493) #b00000000000000000000000000000000)))))

(assert (=> b!518650 (=> (not res!317545) (not e!302620))))

(declare-fun b!518651 () Bool)

(declare-fun e!302623 () SeekEntryResult!4354)

(assert (=> b!518651 (= e!302623 (Intermediate!4354 false lt!237315 #b00000000000000000000000000000000))))

(declare-fun b!518652 () Bool)

(assert (=> b!518652 (= e!302623 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237315 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!15931 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!518653 () Bool)

(assert (=> b!518653 (= e!302621 (bvsge (x!48716 lt!237493) #b01111111111111111111111111111110))))

(declare-fun b!518654 () Bool)

(declare-fun e!302619 () SeekEntryResult!4354)

(assert (=> b!518654 (= e!302619 e!302623)))

(declare-fun c!60850 () Bool)

(declare-fun lt!237494 () (_ BitVec 64))

(assert (=> b!518654 (= c!60850 (or (= lt!237494 (select (arr!15931 a!3235) j!176)) (= (bvadd lt!237494 lt!237494) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!79973 () Bool)

(assert (=> d!79973 e!302621))

(declare-fun c!60848 () Bool)

(assert (=> d!79973 (= c!60848 (and ((_ is Intermediate!4354) lt!237493) (undefined!5166 lt!237493)))))

(assert (=> d!79973 (= lt!237493 e!302619)))

(declare-fun c!60849 () Bool)

(assert (=> d!79973 (= c!60849 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79973 (= lt!237494 (select (arr!15931 a!3235) lt!237315))))

(assert (=> d!79973 (validMask!0 mask!3524)))

(assert (=> d!79973 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237315 (select (arr!15931 a!3235) j!176) a!3235 mask!3524) lt!237493)))

(declare-fun b!518655 () Bool)

(assert (=> b!518655 (and (bvsge (index!19606 lt!237493) #b00000000000000000000000000000000) (bvslt (index!19606 lt!237493) (size!16295 a!3235)))))

(declare-fun res!317546 () Bool)

(assert (=> b!518655 (= res!317546 (= (select (arr!15931 a!3235) (index!19606 lt!237493)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302622 () Bool)

(assert (=> b!518655 (=> res!317546 e!302622)))

(declare-fun b!518656 () Bool)

(assert (=> b!518656 (and (bvsge (index!19606 lt!237493) #b00000000000000000000000000000000) (bvslt (index!19606 lt!237493) (size!16295 a!3235)))))

(declare-fun res!317544 () Bool)

(assert (=> b!518656 (= res!317544 (= (select (arr!15931 a!3235) (index!19606 lt!237493)) (select (arr!15931 a!3235) j!176)))))

(assert (=> b!518656 (=> res!317544 e!302622)))

(assert (=> b!518656 (= e!302620 e!302622)))

(declare-fun b!518657 () Bool)

(assert (=> b!518657 (= e!302619 (Intermediate!4354 true lt!237315 #b00000000000000000000000000000000))))

(declare-fun b!518658 () Bool)

(assert (=> b!518658 (and (bvsge (index!19606 lt!237493) #b00000000000000000000000000000000) (bvslt (index!19606 lt!237493) (size!16295 a!3235)))))

(assert (=> b!518658 (= e!302622 (= (select (arr!15931 a!3235) (index!19606 lt!237493)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!79973 c!60849) b!518657))

(assert (= (and d!79973 (not c!60849)) b!518654))

(assert (= (and b!518654 c!60850) b!518651))

(assert (= (and b!518654 (not c!60850)) b!518652))

(assert (= (and d!79973 c!60848) b!518653))

(assert (= (and d!79973 (not c!60848)) b!518650))

(assert (= (and b!518650 res!317545) b!518656))

(assert (= (and b!518656 (not res!317544)) b!518655))

(assert (= (and b!518655 (not res!317546)) b!518658))

(declare-fun m!500215 () Bool)

(assert (=> b!518656 m!500215))

(assert (=> b!518652 m!500167))

(assert (=> b!518652 m!500167))

(assert (=> b!518652 m!499909))

(declare-fun m!500217 () Bool)

(assert (=> b!518652 m!500217))

(declare-fun m!500219 () Bool)

(assert (=> d!79973 m!500219))

(assert (=> d!79973 m!499947))

(assert (=> b!518655 m!500215))

(assert (=> b!518658 m!500215))

(assert (=> b!518296 d!79973))

(declare-fun d!79979 () Bool)

(assert (=> d!79979 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!237509 () Unit!16027)

(declare-fun choose!38 (array!33136 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16027)

(assert (=> d!79979 (= lt!237509 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79979 (validMask!0 mask!3524)))

(assert (=> d!79979 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!237509)))

(declare-fun bs!16378 () Bool)

(assert (= bs!16378 d!79979))

(assert (=> bs!16378 m!499941))

(declare-fun m!500221 () Bool)

(assert (=> bs!16378 m!500221))

(assert (=> bs!16378 m!499947))

(assert (=> b!518296 d!79979))

(check-sat (not b!518394) (not b!518392) (not b!518471) (not d!79969) (not b!518652) (not d!79935) (not d!79921) (not b!518406) (not b!518640) (not d!79907) (not b!518606) (not bm!31706) (not b!518525) (not b!518465) (not b!518642) (not bm!31692) (not d!79979) (not b!518633) (not b!518408) (not d!79925) (not d!79973) (not bm!31689) (not b!518618) (not b!518407))
(check-sat)
