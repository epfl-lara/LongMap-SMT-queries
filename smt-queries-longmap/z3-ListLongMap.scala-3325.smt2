; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45882 () Bool)

(assert start!45882)

(declare-fun b!508068 () Bool)

(declare-fun e!297219 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32648 0))(
  ( (array!32649 (arr!15704 (Array (_ BitVec 32) (_ BitVec 64))) (size!16069 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32648)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4168 0))(
  ( (MissingZero!4168 (index!18860 (_ BitVec 32))) (Found!4168 (index!18861 (_ BitVec 32))) (Intermediate!4168 (undefined!4980 Bool) (index!18862 (_ BitVec 32)) (x!47852 (_ BitVec 32))) (Undefined!4168) (MissingVacant!4168 (index!18863 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32648 (_ BitVec 32)) SeekEntryResult!4168)

(assert (=> b!508068 (= e!297219 (not (= (seekEntryOrOpen!0 (select (arr!15704 a!3235) j!176) a!3235 mask!3524) (Found!4168 j!176))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32648 (_ BitVec 32)) Bool)

(assert (=> b!508068 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15580 0))(
  ( (Unit!15581) )
))
(declare-fun lt!231975 () Unit!15580)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32648 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15580)

(assert (=> b!508068 (= lt!231975 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!508069 () Bool)

(declare-fun res!309175 () Bool)

(declare-fun e!297218 () Bool)

(assert (=> b!508069 (=> (not res!309175) (not e!297218))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!508069 (= res!309175 (and (= (size!16069 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16069 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16069 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!508070 () Bool)

(declare-fun res!309170 () Bool)

(assert (=> b!508070 (=> (not res!309170) (not e!297218))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!508070 (= res!309170 (validKeyInArray!0 k0!2280))))

(declare-fun b!508071 () Bool)

(declare-fun res!309171 () Bool)

(assert (=> b!508071 (=> (not res!309171) (not e!297218))))

(declare-fun arrayContainsKey!0 (array!32648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!508071 (= res!309171 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!508072 () Bool)

(declare-fun res!309174 () Bool)

(assert (=> b!508072 (=> (not res!309174) (not e!297219))))

(declare-datatypes ((List!9901 0))(
  ( (Nil!9898) (Cons!9897 (h!10774 (_ BitVec 64)) (t!16120 List!9901)) )
))
(declare-fun arrayNoDuplicates!0 (array!32648 (_ BitVec 32) List!9901) Bool)

(assert (=> b!508072 (= res!309174 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9898))))

(declare-fun res!309176 () Bool)

(assert (=> start!45882 (=> (not res!309176) (not e!297218))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45882 (= res!309176 (validMask!0 mask!3524))))

(assert (=> start!45882 e!297218))

(assert (=> start!45882 true))

(declare-fun array_inv!11587 (array!32648) Bool)

(assert (=> start!45882 (array_inv!11587 a!3235)))

(declare-fun b!508073 () Bool)

(assert (=> b!508073 (= e!297218 e!297219)))

(declare-fun res!309169 () Bool)

(assert (=> b!508073 (=> (not res!309169) (not e!297219))))

(declare-fun lt!231976 () SeekEntryResult!4168)

(assert (=> b!508073 (= res!309169 (or (= lt!231976 (MissingZero!4168 i!1204)) (= lt!231976 (MissingVacant!4168 i!1204))))))

(assert (=> b!508073 (= lt!231976 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!508074 () Bool)

(declare-fun res!309173 () Bool)

(assert (=> b!508074 (=> (not res!309173) (not e!297218))))

(assert (=> b!508074 (= res!309173 (validKeyInArray!0 (select (arr!15704 a!3235) j!176)))))

(declare-fun b!508075 () Bool)

(declare-fun res!309172 () Bool)

(assert (=> b!508075 (=> (not res!309172) (not e!297219))))

(assert (=> b!508075 (= res!309172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45882 res!309176) b!508069))

(assert (= (and b!508069 res!309175) b!508074))

(assert (= (and b!508074 res!309173) b!508070))

(assert (= (and b!508070 res!309170) b!508071))

(assert (= (and b!508071 res!309171) b!508073))

(assert (= (and b!508073 res!309169) b!508075))

(assert (= (and b!508075 res!309172) b!508072))

(assert (= (and b!508072 res!309174) b!508068))

(declare-fun m!488371 () Bool)

(assert (=> b!508075 m!488371))

(declare-fun m!488373 () Bool)

(assert (=> b!508068 m!488373))

(assert (=> b!508068 m!488373))

(declare-fun m!488375 () Bool)

(assert (=> b!508068 m!488375))

(declare-fun m!488377 () Bool)

(assert (=> b!508068 m!488377))

(declare-fun m!488379 () Bool)

(assert (=> b!508068 m!488379))

(declare-fun m!488381 () Bool)

(assert (=> start!45882 m!488381))

(declare-fun m!488383 () Bool)

(assert (=> start!45882 m!488383))

(declare-fun m!488385 () Bool)

(assert (=> b!508072 m!488385))

(declare-fun m!488387 () Bool)

(assert (=> b!508070 m!488387))

(declare-fun m!488389 () Bool)

(assert (=> b!508073 m!488389))

(assert (=> b!508074 m!488373))

(assert (=> b!508074 m!488373))

(declare-fun m!488391 () Bool)

(assert (=> b!508074 m!488391))

(declare-fun m!488393 () Bool)

(assert (=> b!508071 m!488393))

(check-sat (not b!508071) (not b!508070) (not b!508074) (not start!45882) (not b!508072) (not b!508075) (not b!508073) (not b!508068))
(check-sat)
(get-model)

(declare-fun b!508134 () Bool)

(declare-fun e!297246 () Bool)

(declare-fun call!31450 () Bool)

(assert (=> b!508134 (= e!297246 call!31450)))

(declare-fun b!508135 () Bool)

(assert (=> b!508135 (= e!297246 call!31450)))

(declare-fun b!508136 () Bool)

(declare-fun e!297248 () Bool)

(assert (=> b!508136 (= e!297248 e!297246)))

(declare-fun c!59730 () Bool)

(assert (=> b!508136 (= c!59730 (validKeyInArray!0 (select (arr!15704 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!78537 () Bool)

(declare-fun res!309231 () Bool)

(declare-fun e!297247 () Bool)

(assert (=> d!78537 (=> res!309231 e!297247)))

(assert (=> d!78537 (= res!309231 (bvsge #b00000000000000000000000000000000 (size!16069 a!3235)))))

(assert (=> d!78537 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9898) e!297247)))

(declare-fun b!508137 () Bool)

(assert (=> b!508137 (= e!297247 e!297248)))

(declare-fun res!309233 () Bool)

(assert (=> b!508137 (=> (not res!309233) (not e!297248))))

(declare-fun e!297249 () Bool)

(assert (=> b!508137 (= res!309233 (not e!297249))))

(declare-fun res!309232 () Bool)

(assert (=> b!508137 (=> (not res!309232) (not e!297249))))

(assert (=> b!508137 (= res!309232 (validKeyInArray!0 (select (arr!15704 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!508138 () Bool)

(declare-fun contains!2705 (List!9901 (_ BitVec 64)) Bool)

(assert (=> b!508138 (= e!297249 (contains!2705 Nil!9898 (select (arr!15704 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31447 () Bool)

(assert (=> bm!31447 (= call!31450 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59730 (Cons!9897 (select (arr!15704 a!3235) #b00000000000000000000000000000000) Nil!9898) Nil!9898)))))

(assert (= (and d!78537 (not res!309231)) b!508137))

(assert (= (and b!508137 res!309232) b!508138))

(assert (= (and b!508137 res!309233) b!508136))

(assert (= (and b!508136 c!59730) b!508135))

(assert (= (and b!508136 (not c!59730)) b!508134))

(assert (= (or b!508135 b!508134) bm!31447))

(declare-fun m!488443 () Bool)

(assert (=> b!508136 m!488443))

(assert (=> b!508136 m!488443))

(declare-fun m!488445 () Bool)

(assert (=> b!508136 m!488445))

(assert (=> b!508137 m!488443))

(assert (=> b!508137 m!488443))

(assert (=> b!508137 m!488445))

(assert (=> b!508138 m!488443))

(assert (=> b!508138 m!488443))

(declare-fun m!488447 () Bool)

(assert (=> b!508138 m!488447))

(assert (=> bm!31447 m!488443))

(declare-fun m!488449 () Bool)

(assert (=> bm!31447 m!488449))

(assert (=> b!508072 d!78537))

(declare-fun lt!232012 () SeekEntryResult!4168)

(declare-fun b!508191 () Bool)

(declare-fun e!297285 () SeekEntryResult!4168)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32648 (_ BitVec 32)) SeekEntryResult!4168)

(assert (=> b!508191 (= e!297285 (seekKeyOrZeroReturnVacant!0 (x!47852 lt!232012) (index!18862 lt!232012) (index!18862 lt!232012) k0!2280 a!3235 mask!3524))))

(declare-fun b!508192 () Bool)

(declare-fun c!59749 () Bool)

(declare-fun lt!232010 () (_ BitVec 64))

(assert (=> b!508192 (= c!59749 (= lt!232010 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!297286 () SeekEntryResult!4168)

(assert (=> b!508192 (= e!297286 e!297285)))

(declare-fun b!508193 () Bool)

(assert (=> b!508193 (= e!297286 (Found!4168 (index!18862 lt!232012)))))

(declare-fun b!508194 () Bool)

(declare-fun e!297287 () SeekEntryResult!4168)

(assert (=> b!508194 (= e!297287 e!297286)))

(assert (=> b!508194 (= lt!232010 (select (arr!15704 a!3235) (index!18862 lt!232012)))))

(declare-fun c!59750 () Bool)

(assert (=> b!508194 (= c!59750 (= lt!232010 k0!2280))))

(declare-fun d!78539 () Bool)

(declare-fun lt!232011 () SeekEntryResult!4168)

(get-info :version)

(assert (=> d!78539 (and (or ((_ is Undefined!4168) lt!232011) (not ((_ is Found!4168) lt!232011)) (and (bvsge (index!18861 lt!232011) #b00000000000000000000000000000000) (bvslt (index!18861 lt!232011) (size!16069 a!3235)))) (or ((_ is Undefined!4168) lt!232011) ((_ is Found!4168) lt!232011) (not ((_ is MissingZero!4168) lt!232011)) (and (bvsge (index!18860 lt!232011) #b00000000000000000000000000000000) (bvslt (index!18860 lt!232011) (size!16069 a!3235)))) (or ((_ is Undefined!4168) lt!232011) ((_ is Found!4168) lt!232011) ((_ is MissingZero!4168) lt!232011) (not ((_ is MissingVacant!4168) lt!232011)) (and (bvsge (index!18863 lt!232011) #b00000000000000000000000000000000) (bvslt (index!18863 lt!232011) (size!16069 a!3235)))) (or ((_ is Undefined!4168) lt!232011) (ite ((_ is Found!4168) lt!232011) (= (select (arr!15704 a!3235) (index!18861 lt!232011)) k0!2280) (ite ((_ is MissingZero!4168) lt!232011) (= (select (arr!15704 a!3235) (index!18860 lt!232011)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4168) lt!232011) (= (select (arr!15704 a!3235) (index!18863 lt!232011)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78539 (= lt!232011 e!297287)))

(declare-fun c!59748 () Bool)

(assert (=> d!78539 (= c!59748 (and ((_ is Intermediate!4168) lt!232012) (undefined!4980 lt!232012)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32648 (_ BitVec 32)) SeekEntryResult!4168)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!78539 (= lt!232012 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!78539 (validMask!0 mask!3524)))

(assert (=> d!78539 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!232011)))

(declare-fun b!508195 () Bool)

(assert (=> b!508195 (= e!297287 Undefined!4168)))

(declare-fun b!508196 () Bool)

(assert (=> b!508196 (= e!297285 (MissingZero!4168 (index!18862 lt!232012)))))

(assert (= (and d!78539 c!59748) b!508195))

(assert (= (and d!78539 (not c!59748)) b!508194))

(assert (= (and b!508194 c!59750) b!508193))

(assert (= (and b!508194 (not c!59750)) b!508192))

(assert (= (and b!508192 c!59749) b!508196))

(assert (= (and b!508192 (not c!59749)) b!508191))

(declare-fun m!488465 () Bool)

(assert (=> b!508191 m!488465))

(declare-fun m!488467 () Bool)

(assert (=> b!508194 m!488467))

(declare-fun m!488469 () Bool)

(assert (=> d!78539 m!488469))

(declare-fun m!488471 () Bool)

(assert (=> d!78539 m!488471))

(assert (=> d!78539 m!488469))

(declare-fun m!488473 () Bool)

(assert (=> d!78539 m!488473))

(declare-fun m!488475 () Bool)

(assert (=> d!78539 m!488475))

(declare-fun m!488477 () Bool)

(assert (=> d!78539 m!488477))

(assert (=> d!78539 m!488381))

(assert (=> b!508073 d!78539))

(declare-fun d!78549 () Bool)

(declare-fun res!309259 () Bool)

(declare-fun e!297299 () Bool)

(assert (=> d!78549 (=> res!309259 e!297299)))

(assert (=> d!78549 (= res!309259 (= (select (arr!15704 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!78549 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!297299)))

(declare-fun b!508212 () Bool)

(declare-fun e!297300 () Bool)

(assert (=> b!508212 (= e!297299 e!297300)))

(declare-fun res!309260 () Bool)

(assert (=> b!508212 (=> (not res!309260) (not e!297300))))

(assert (=> b!508212 (= res!309260 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16069 a!3235)))))

(declare-fun b!508213 () Bool)

(assert (=> b!508213 (= e!297300 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78549 (not res!309259)) b!508212))

(assert (= (and b!508212 res!309260) b!508213))

(assert (=> d!78549 m!488443))

(declare-fun m!488497 () Bool)

(assert (=> b!508213 m!488497))

(assert (=> b!508071 d!78549))

(declare-fun d!78555 () Bool)

(assert (=> d!78555 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!45882 d!78555))

(declare-fun d!78559 () Bool)

(assert (=> d!78559 (= (array_inv!11587 a!3235) (bvsge (size!16069 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!45882 d!78559))

(declare-fun b!508258 () Bool)

(declare-fun e!297329 () Bool)

(declare-fun call!31462 () Bool)

(assert (=> b!508258 (= e!297329 call!31462)))

(declare-fun bm!31459 () Bool)

(assert (=> bm!31459 (= call!31462 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!508259 () Bool)

(declare-fun e!297330 () Bool)

(assert (=> b!508259 (= e!297330 e!297329)))

(declare-fun lt!232048 () (_ BitVec 64))

(assert (=> b!508259 (= lt!232048 (select (arr!15704 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!232046 () Unit!15580)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32648 (_ BitVec 64) (_ BitVec 32)) Unit!15580)

(assert (=> b!508259 (= lt!232046 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!232048 #b00000000000000000000000000000000))))

(assert (=> b!508259 (arrayContainsKey!0 a!3235 lt!232048 #b00000000000000000000000000000000)))

(declare-fun lt!232047 () Unit!15580)

(assert (=> b!508259 (= lt!232047 lt!232046)))

(declare-fun res!309271 () Bool)

(assert (=> b!508259 (= res!309271 (= (seekEntryOrOpen!0 (select (arr!15704 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4168 #b00000000000000000000000000000000)))))

(assert (=> b!508259 (=> (not res!309271) (not e!297329))))

(declare-fun d!78561 () Bool)

(declare-fun res!309272 () Bool)

(declare-fun e!297328 () Bool)

(assert (=> d!78561 (=> res!309272 e!297328)))

(assert (=> d!78561 (= res!309272 (bvsge #b00000000000000000000000000000000 (size!16069 a!3235)))))

(assert (=> d!78561 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!297328)))

(declare-fun b!508260 () Bool)

(assert (=> b!508260 (= e!297330 call!31462)))

(declare-fun b!508261 () Bool)

(assert (=> b!508261 (= e!297328 e!297330)))

(declare-fun c!59772 () Bool)

(assert (=> b!508261 (= c!59772 (validKeyInArray!0 (select (arr!15704 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!78561 (not res!309272)) b!508261))

(assert (= (and b!508261 c!59772) b!508259))

(assert (= (and b!508261 (not c!59772)) b!508260))

(assert (= (and b!508259 res!309271) b!508258))

(assert (= (or b!508258 b!508260) bm!31459))

(declare-fun m!488523 () Bool)

(assert (=> bm!31459 m!488523))

(assert (=> b!508259 m!488443))

(declare-fun m!488529 () Bool)

(assert (=> b!508259 m!488529))

(declare-fun m!488533 () Bool)

(assert (=> b!508259 m!488533))

(assert (=> b!508259 m!488443))

(declare-fun m!488537 () Bool)

(assert (=> b!508259 m!488537))

(assert (=> b!508261 m!488443))

(assert (=> b!508261 m!488443))

(assert (=> b!508261 m!488445))

(assert (=> b!508075 d!78561))

(declare-fun d!78569 () Bool)

(assert (=> d!78569 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!508070 d!78569))

(declare-fun e!297331 () SeekEntryResult!4168)

(declare-fun b!508262 () Bool)

(declare-fun lt!232051 () SeekEntryResult!4168)

(assert (=> b!508262 (= e!297331 (seekKeyOrZeroReturnVacant!0 (x!47852 lt!232051) (index!18862 lt!232051) (index!18862 lt!232051) (select (arr!15704 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!508263 () Bool)

(declare-fun c!59774 () Bool)

(declare-fun lt!232049 () (_ BitVec 64))

(assert (=> b!508263 (= c!59774 (= lt!232049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!297332 () SeekEntryResult!4168)

(assert (=> b!508263 (= e!297332 e!297331)))

(declare-fun b!508264 () Bool)

(assert (=> b!508264 (= e!297332 (Found!4168 (index!18862 lt!232051)))))

(declare-fun b!508265 () Bool)

(declare-fun e!297333 () SeekEntryResult!4168)

(assert (=> b!508265 (= e!297333 e!297332)))

(assert (=> b!508265 (= lt!232049 (select (arr!15704 a!3235) (index!18862 lt!232051)))))

(declare-fun c!59775 () Bool)

(assert (=> b!508265 (= c!59775 (= lt!232049 (select (arr!15704 a!3235) j!176)))))

(declare-fun d!78571 () Bool)

(declare-fun lt!232050 () SeekEntryResult!4168)

(assert (=> d!78571 (and (or ((_ is Undefined!4168) lt!232050) (not ((_ is Found!4168) lt!232050)) (and (bvsge (index!18861 lt!232050) #b00000000000000000000000000000000) (bvslt (index!18861 lt!232050) (size!16069 a!3235)))) (or ((_ is Undefined!4168) lt!232050) ((_ is Found!4168) lt!232050) (not ((_ is MissingZero!4168) lt!232050)) (and (bvsge (index!18860 lt!232050) #b00000000000000000000000000000000) (bvslt (index!18860 lt!232050) (size!16069 a!3235)))) (or ((_ is Undefined!4168) lt!232050) ((_ is Found!4168) lt!232050) ((_ is MissingZero!4168) lt!232050) (not ((_ is MissingVacant!4168) lt!232050)) (and (bvsge (index!18863 lt!232050) #b00000000000000000000000000000000) (bvslt (index!18863 lt!232050) (size!16069 a!3235)))) (or ((_ is Undefined!4168) lt!232050) (ite ((_ is Found!4168) lt!232050) (= (select (arr!15704 a!3235) (index!18861 lt!232050)) (select (arr!15704 a!3235) j!176)) (ite ((_ is MissingZero!4168) lt!232050) (= (select (arr!15704 a!3235) (index!18860 lt!232050)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4168) lt!232050) (= (select (arr!15704 a!3235) (index!18863 lt!232050)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78571 (= lt!232050 e!297333)))

(declare-fun c!59773 () Bool)

(assert (=> d!78571 (= c!59773 (and ((_ is Intermediate!4168) lt!232051) (undefined!4980 lt!232051)))))

(assert (=> d!78571 (= lt!232051 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15704 a!3235) j!176) mask!3524) (select (arr!15704 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78571 (validMask!0 mask!3524)))

(assert (=> d!78571 (= (seekEntryOrOpen!0 (select (arr!15704 a!3235) j!176) a!3235 mask!3524) lt!232050)))

(declare-fun b!508266 () Bool)

(assert (=> b!508266 (= e!297333 Undefined!4168)))

(declare-fun b!508267 () Bool)

(assert (=> b!508267 (= e!297331 (MissingZero!4168 (index!18862 lt!232051)))))

(assert (= (and d!78571 c!59773) b!508266))

(assert (= (and d!78571 (not c!59773)) b!508265))

(assert (= (and b!508265 c!59775) b!508264))

(assert (= (and b!508265 (not c!59775)) b!508263))

(assert (= (and b!508263 c!59774) b!508267))

(assert (= (and b!508263 (not c!59774)) b!508262))

(assert (=> b!508262 m!488373))

(declare-fun m!488543 () Bool)

(assert (=> b!508262 m!488543))

(declare-fun m!488545 () Bool)

(assert (=> b!508265 m!488545))

(declare-fun m!488547 () Bool)

(assert (=> d!78571 m!488547))

(assert (=> d!78571 m!488373))

(declare-fun m!488549 () Bool)

(assert (=> d!78571 m!488549))

(assert (=> d!78571 m!488373))

(assert (=> d!78571 m!488547))

(declare-fun m!488551 () Bool)

(assert (=> d!78571 m!488551))

(declare-fun m!488553 () Bool)

(assert (=> d!78571 m!488553))

(declare-fun m!488555 () Bool)

(assert (=> d!78571 m!488555))

(assert (=> d!78571 m!488381))

(assert (=> b!508068 d!78571))

(declare-fun b!508268 () Bool)

(declare-fun e!297335 () Bool)

(declare-fun call!31463 () Bool)

(assert (=> b!508268 (= e!297335 call!31463)))

(declare-fun bm!31460 () Bool)

(assert (=> bm!31460 (= call!31463 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!508269 () Bool)

(declare-fun e!297336 () Bool)

(assert (=> b!508269 (= e!297336 e!297335)))

(declare-fun lt!232054 () (_ BitVec 64))

(assert (=> b!508269 (= lt!232054 (select (arr!15704 a!3235) j!176))))

(declare-fun lt!232052 () Unit!15580)

(assert (=> b!508269 (= lt!232052 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!232054 j!176))))

(assert (=> b!508269 (arrayContainsKey!0 a!3235 lt!232054 #b00000000000000000000000000000000)))

(declare-fun lt!232053 () Unit!15580)

(assert (=> b!508269 (= lt!232053 lt!232052)))

(declare-fun res!309273 () Bool)

(assert (=> b!508269 (= res!309273 (= (seekEntryOrOpen!0 (select (arr!15704 a!3235) j!176) a!3235 mask!3524) (Found!4168 j!176)))))

(assert (=> b!508269 (=> (not res!309273) (not e!297335))))

(declare-fun d!78573 () Bool)

(declare-fun res!309274 () Bool)

(declare-fun e!297334 () Bool)

(assert (=> d!78573 (=> res!309274 e!297334)))

(assert (=> d!78573 (= res!309274 (bvsge j!176 (size!16069 a!3235)))))

(assert (=> d!78573 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!297334)))

(declare-fun b!508270 () Bool)

(assert (=> b!508270 (= e!297336 call!31463)))

(declare-fun b!508271 () Bool)

(assert (=> b!508271 (= e!297334 e!297336)))

(declare-fun c!59776 () Bool)

(assert (=> b!508271 (= c!59776 (validKeyInArray!0 (select (arr!15704 a!3235) j!176)))))

(assert (= (and d!78573 (not res!309274)) b!508271))

(assert (= (and b!508271 c!59776) b!508269))

(assert (= (and b!508271 (not c!59776)) b!508270))

(assert (= (and b!508269 res!309273) b!508268))

(assert (= (or b!508268 b!508270) bm!31460))

(declare-fun m!488557 () Bool)

(assert (=> bm!31460 m!488557))

(assert (=> b!508269 m!488373))

(declare-fun m!488559 () Bool)

(assert (=> b!508269 m!488559))

(declare-fun m!488561 () Bool)

(assert (=> b!508269 m!488561))

(assert (=> b!508269 m!488373))

(assert (=> b!508269 m!488375))

(assert (=> b!508271 m!488373))

(assert (=> b!508271 m!488373))

(assert (=> b!508271 m!488391))

(assert (=> b!508068 d!78573))

(declare-fun d!78575 () Bool)

(assert (=> d!78575 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!232060 () Unit!15580)

(declare-fun choose!38 (array!32648 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15580)

(assert (=> d!78575 (= lt!232060 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78575 (validMask!0 mask!3524)))

(assert (=> d!78575 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!232060)))

(declare-fun bs!16067 () Bool)

(assert (= bs!16067 d!78575))

(assert (=> bs!16067 m!488377))

(declare-fun m!488575 () Bool)

(assert (=> bs!16067 m!488575))

(assert (=> bs!16067 m!488381))

(assert (=> b!508068 d!78575))

(declare-fun d!78587 () Bool)

(assert (=> d!78587 (= (validKeyInArray!0 (select (arr!15704 a!3235) j!176)) (and (not (= (select (arr!15704 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15704 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!508074 d!78587))

(check-sat (not b!508262) (not b!508137) (not bm!31460) (not b!508136) (not d!78575) (not b!508138) (not b!508261) (not d!78571) (not d!78539) (not b!508213) (not b!508271) (not bm!31447) (not bm!31459) (not b!508269) (not b!508191) (not b!508259))
(check-sat)
