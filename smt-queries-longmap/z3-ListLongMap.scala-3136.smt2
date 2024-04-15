; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44100 () Bool)

(assert start!44100)

(declare-fun b!485803 () Bool)

(declare-fun res!289549 () Bool)

(declare-fun e!285939 () Bool)

(assert (=> b!485803 (=> (not res!289549) (not e!285939))))

(declare-datatypes ((array!31478 0))(
  ( (array!31479 (arr!15137 (Array (_ BitVec 32) (_ BitVec 64))) (size!15502 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31478)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485803 (= res!289549 (validKeyInArray!0 (select (arr!15137 a!3235) j!176)))))

(declare-fun res!289553 () Bool)

(assert (=> start!44100 (=> (not res!289553) (not e!285939))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44100 (= res!289553 (validMask!0 mask!3524))))

(assert (=> start!44100 e!285939))

(assert (=> start!44100 true))

(declare-fun array_inv!11020 (array!31478) Bool)

(assert (=> start!44100 (array_inv!11020 a!3235)))

(declare-fun b!485804 () Bool)

(declare-fun res!289548 () Bool)

(assert (=> b!485804 (=> (not res!289548) (not e!285939))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!485804 (= res!289548 (validKeyInArray!0 k0!2280))))

(declare-fun b!485805 () Bool)

(declare-fun res!289552 () Bool)

(declare-fun e!285938 () Bool)

(assert (=> b!485805 (=> (not res!289552) (not e!285938))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31478 (_ BitVec 32)) Bool)

(assert (=> b!485805 (= res!289552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!485806 () Bool)

(assert (=> b!485806 (= e!285939 e!285938)))

(declare-fun res!289547 () Bool)

(assert (=> b!485806 (=> (not res!289547) (not e!285938))))

(declare-datatypes ((SeekEntryResult!3601 0))(
  ( (MissingZero!3601 (index!16583 (_ BitVec 32))) (Found!3601 (index!16584 (_ BitVec 32))) (Intermediate!3601 (undefined!4413 Bool) (index!16585 (_ BitVec 32)) (x!45728 (_ BitVec 32))) (Undefined!3601) (MissingVacant!3601 (index!16586 (_ BitVec 32))) )
))
(declare-fun lt!219388 () SeekEntryResult!3601)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!485806 (= res!289547 (or (= lt!219388 (MissingZero!3601 i!1204)) (= lt!219388 (MissingVacant!3601 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31478 (_ BitVec 32)) SeekEntryResult!3601)

(assert (=> b!485806 (= lt!219388 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!485807 () Bool)

(declare-fun res!289550 () Bool)

(assert (=> b!485807 (=> (not res!289550) (not e!285939))))

(assert (=> b!485807 (= res!289550 (and (= (size!15502 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15502 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15502 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485808 () Bool)

(declare-fun res!289551 () Bool)

(assert (=> b!485808 (=> (not res!289551) (not e!285939))))

(declare-fun arrayContainsKey!0 (array!31478 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485808 (= res!289551 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485809 () Bool)

(assert (=> b!485809 (= e!285938 (and (bvsle #b00000000000000000000000000000000 (size!15502 a!3235)) (bvsge (size!15502 a!3235) #b01111111111111111111111111111111)))))

(assert (= (and start!44100 res!289553) b!485807))

(assert (= (and b!485807 res!289550) b!485803))

(assert (= (and b!485803 res!289549) b!485804))

(assert (= (and b!485804 res!289548) b!485808))

(assert (= (and b!485808 res!289551) b!485806))

(assert (= (and b!485806 res!289547) b!485805))

(assert (= (and b!485805 res!289552) b!485809))

(declare-fun m!465381 () Bool)

(assert (=> start!44100 m!465381))

(declare-fun m!465383 () Bool)

(assert (=> start!44100 m!465383))

(declare-fun m!465385 () Bool)

(assert (=> b!485808 m!465385))

(declare-fun m!465387 () Bool)

(assert (=> b!485803 m!465387))

(assert (=> b!485803 m!465387))

(declare-fun m!465389 () Bool)

(assert (=> b!485803 m!465389))

(declare-fun m!465391 () Bool)

(assert (=> b!485804 m!465391))

(declare-fun m!465393 () Bool)

(assert (=> b!485806 m!465393))

(declare-fun m!465395 () Bool)

(assert (=> b!485805 m!465395))

(check-sat (not b!485805) (not b!485804) (not b!485806) (not start!44100) (not b!485803) (not b!485808))
(check-sat)
(get-model)

(declare-fun b!485860 () Bool)

(declare-fun e!285966 () Bool)

(declare-fun e!285965 () Bool)

(assert (=> b!485860 (= e!285966 e!285965)))

(declare-fun c!58398 () Bool)

(assert (=> b!485860 (= c!58398 (validKeyInArray!0 (select (arr!15137 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!485861 () Bool)

(declare-fun call!31234 () Bool)

(assert (=> b!485861 (= e!285965 call!31234)))

(declare-fun b!485862 () Bool)

(declare-fun e!285964 () Bool)

(assert (=> b!485862 (= e!285965 e!285964)))

(declare-fun lt!219401 () (_ BitVec 64))

(assert (=> b!485862 (= lt!219401 (select (arr!15137 a!3235) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14170 0))(
  ( (Unit!14171) )
))
(declare-fun lt!219403 () Unit!14170)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31478 (_ BitVec 64) (_ BitVec 32)) Unit!14170)

(assert (=> b!485862 (= lt!219403 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!219401 #b00000000000000000000000000000000))))

(assert (=> b!485862 (arrayContainsKey!0 a!3235 lt!219401 #b00000000000000000000000000000000)))

(declare-fun lt!219402 () Unit!14170)

(assert (=> b!485862 (= lt!219402 lt!219403)))

(declare-fun res!289601 () Bool)

(assert (=> b!485862 (= res!289601 (= (seekEntryOrOpen!0 (select (arr!15137 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3601 #b00000000000000000000000000000000)))))

(assert (=> b!485862 (=> (not res!289601) (not e!285964))))

(declare-fun d!77255 () Bool)

(declare-fun res!289600 () Bool)

(assert (=> d!77255 (=> res!289600 e!285966)))

(assert (=> d!77255 (= res!289600 (bvsge #b00000000000000000000000000000000 (size!15502 a!3235)))))

(assert (=> d!77255 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!285966)))

(declare-fun b!485863 () Bool)

(assert (=> b!485863 (= e!285964 call!31234)))

(declare-fun bm!31231 () Bool)

(assert (=> bm!31231 (= call!31234 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!77255 (not res!289600)) b!485860))

(assert (= (and b!485860 c!58398) b!485862))

(assert (= (and b!485860 (not c!58398)) b!485861))

(assert (= (and b!485862 res!289601) b!485863))

(assert (= (or b!485863 b!485861) bm!31231))

(declare-fun m!465429 () Bool)

(assert (=> b!485860 m!465429))

(assert (=> b!485860 m!465429))

(declare-fun m!465431 () Bool)

(assert (=> b!485860 m!465431))

(assert (=> b!485862 m!465429))

(declare-fun m!465433 () Bool)

(assert (=> b!485862 m!465433))

(declare-fun m!465435 () Bool)

(assert (=> b!485862 m!465435))

(assert (=> b!485862 m!465429))

(declare-fun m!465437 () Bool)

(assert (=> b!485862 m!465437))

(declare-fun m!465439 () Bool)

(assert (=> bm!31231 m!465439))

(assert (=> b!485805 d!77255))

(declare-fun d!77259 () Bool)

(assert (=> d!77259 (= (validKeyInArray!0 (select (arr!15137 a!3235) j!176)) (and (not (= (select (arr!15137 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15137 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!485803 d!77259))

(declare-fun d!77261 () Bool)

(assert (=> d!77261 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44100 d!77261))

(declare-fun d!77271 () Bool)

(assert (=> d!77271 (= (array_inv!11020 a!3235) (bvsge (size!15502 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44100 d!77271))

(declare-fun d!77275 () Bool)

(assert (=> d!77275 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!485804 d!77275))

(declare-fun d!77277 () Bool)

(declare-fun res!289606 () Bool)

(declare-fun e!285971 () Bool)

(assert (=> d!77277 (=> res!289606 e!285971)))

(assert (=> d!77277 (= res!289606 (= (select (arr!15137 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!77277 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!285971)))

(declare-fun b!485868 () Bool)

(declare-fun e!285972 () Bool)

(assert (=> b!485868 (= e!285971 e!285972)))

(declare-fun res!289607 () Bool)

(assert (=> b!485868 (=> (not res!289607) (not e!285972))))

(assert (=> b!485868 (= res!289607 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15502 a!3235)))))

(declare-fun b!485869 () Bool)

(assert (=> b!485869 (= e!285972 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77277 (not res!289606)) b!485868))

(assert (= (and b!485868 res!289607) b!485869))

(assert (=> d!77277 m!465429))

(declare-fun m!465441 () Bool)

(assert (=> b!485869 m!465441))

(assert (=> b!485808 d!77277))

(declare-fun b!485926 () Bool)

(declare-fun e!286009 () SeekEntryResult!3601)

(declare-fun e!286011 () SeekEntryResult!3601)

(assert (=> b!485926 (= e!286009 e!286011)))

(declare-fun lt!219435 () (_ BitVec 64))

(declare-fun lt!219436 () SeekEntryResult!3601)

(assert (=> b!485926 (= lt!219435 (select (arr!15137 a!3235) (index!16585 lt!219436)))))

(declare-fun c!58420 () Bool)

(assert (=> b!485926 (= c!58420 (= lt!219435 k0!2280))))

(declare-fun b!485927 () Bool)

(assert (=> b!485927 (= e!286011 (Found!3601 (index!16585 lt!219436)))))

(declare-fun b!485928 () Bool)

(assert (=> b!485928 (= e!286009 Undefined!3601)))

(declare-fun b!485929 () Bool)

(declare-fun c!58419 () Bool)

(assert (=> b!485929 (= c!58419 (= lt!219435 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!286010 () SeekEntryResult!3601)

(assert (=> b!485929 (= e!286011 e!286010)))

(declare-fun d!77279 () Bool)

(declare-fun lt!219434 () SeekEntryResult!3601)

(get-info :version)

(assert (=> d!77279 (and (or ((_ is Undefined!3601) lt!219434) (not ((_ is Found!3601) lt!219434)) (and (bvsge (index!16584 lt!219434) #b00000000000000000000000000000000) (bvslt (index!16584 lt!219434) (size!15502 a!3235)))) (or ((_ is Undefined!3601) lt!219434) ((_ is Found!3601) lt!219434) (not ((_ is MissingZero!3601) lt!219434)) (and (bvsge (index!16583 lt!219434) #b00000000000000000000000000000000) (bvslt (index!16583 lt!219434) (size!15502 a!3235)))) (or ((_ is Undefined!3601) lt!219434) ((_ is Found!3601) lt!219434) ((_ is MissingZero!3601) lt!219434) (not ((_ is MissingVacant!3601) lt!219434)) (and (bvsge (index!16586 lt!219434) #b00000000000000000000000000000000) (bvslt (index!16586 lt!219434) (size!15502 a!3235)))) (or ((_ is Undefined!3601) lt!219434) (ite ((_ is Found!3601) lt!219434) (= (select (arr!15137 a!3235) (index!16584 lt!219434)) k0!2280) (ite ((_ is MissingZero!3601) lt!219434) (= (select (arr!15137 a!3235) (index!16583 lt!219434)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3601) lt!219434) (= (select (arr!15137 a!3235) (index!16586 lt!219434)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77279 (= lt!219434 e!286009)))

(declare-fun c!58421 () Bool)

(assert (=> d!77279 (= c!58421 (and ((_ is Intermediate!3601) lt!219436) (undefined!4413 lt!219436)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31478 (_ BitVec 32)) SeekEntryResult!3601)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!77279 (= lt!219436 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!77279 (validMask!0 mask!3524)))

(assert (=> d!77279 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!219434)))

(declare-fun b!485930 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31478 (_ BitVec 32)) SeekEntryResult!3601)

(assert (=> b!485930 (= e!286010 (seekKeyOrZeroReturnVacant!0 (x!45728 lt!219436) (index!16585 lt!219436) (index!16585 lt!219436) k0!2280 a!3235 mask!3524))))

(declare-fun b!485931 () Bool)

(assert (=> b!485931 (= e!286010 (MissingZero!3601 (index!16585 lt!219436)))))

(assert (= (and d!77279 c!58421) b!485928))

(assert (= (and d!77279 (not c!58421)) b!485926))

(assert (= (and b!485926 c!58420) b!485927))

(assert (= (and b!485926 (not c!58420)) b!485929))

(assert (= (and b!485929 c!58419) b!485931))

(assert (= (and b!485929 (not c!58419)) b!485930))

(declare-fun m!465471 () Bool)

(assert (=> b!485926 m!465471))

(declare-fun m!465473 () Bool)

(assert (=> d!77279 m!465473))

(assert (=> d!77279 m!465381))

(declare-fun m!465475 () Bool)

(assert (=> d!77279 m!465475))

(declare-fun m!465477 () Bool)

(assert (=> d!77279 m!465477))

(declare-fun m!465479 () Bool)

(assert (=> d!77279 m!465479))

(assert (=> d!77279 m!465477))

(declare-fun m!465481 () Bool)

(assert (=> d!77279 m!465481))

(declare-fun m!465483 () Bool)

(assert (=> b!485930 m!465483))

(assert (=> b!485806 d!77279))

(check-sat (not b!485862) (not b!485860) (not b!485930) (not b!485869) (not d!77279) (not bm!31231))
(check-sat)
