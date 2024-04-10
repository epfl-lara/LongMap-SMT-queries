; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44880 () Bool)

(assert start!44880)

(declare-fun b!492500 () Bool)

(declare-fun res!295259 () Bool)

(declare-fun e!289307 () Bool)

(assert (=> b!492500 (=> (not res!295259) (not e!289307))))

(declare-datatypes ((array!31882 0))(
  ( (array!31883 (arr!15327 (Array (_ BitVec 32) (_ BitVec 64))) (size!15691 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31882)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492500 (= res!295259 (validKeyInArray!0 (select (arr!15327 a!3235) j!176)))))

(declare-fun b!492501 () Bool)

(declare-fun e!289308 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!222657 () (_ BitVec 32))

(assert (=> b!492501 (= e!289308 (or (bvslt mask!3524 #b00000000000000000000000000000000) (and (bvsge lt!222657 #b00000000000000000000000000000000) (bvslt lt!222657 (bvadd #b00000000000000000000000000000001 mask!3524)))))))

(declare-fun b!492502 () Bool)

(declare-fun res!295254 () Bool)

(declare-fun e!289306 () Bool)

(assert (=> b!492502 (=> (not res!295254) (not e!289306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31882 (_ BitVec 32)) Bool)

(assert (=> b!492502 (= res!295254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!295253 () Bool)

(assert (=> start!44880 (=> (not res!295253) (not e!289307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44880 (= res!295253 (validMask!0 mask!3524))))

(assert (=> start!44880 e!289307))

(assert (=> start!44880 true))

(declare-fun array_inv!11123 (array!31882) Bool)

(assert (=> start!44880 (array_inv!11123 a!3235)))

(declare-fun b!492503 () Bool)

(declare-fun res!295255 () Bool)

(assert (=> b!492503 (=> (not res!295255) (not e!289306))))

(declare-datatypes ((List!9485 0))(
  ( (Nil!9482) (Cons!9481 (h!10346 (_ BitVec 64)) (t!15713 List!9485)) )
))
(declare-fun arrayNoDuplicates!0 (array!31882 (_ BitVec 32) List!9485) Bool)

(assert (=> b!492503 (= res!295255 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9482))))

(declare-fun b!492504 () Bool)

(declare-fun res!295262 () Bool)

(assert (=> b!492504 (=> (not res!295262) (not e!289307))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!492504 (= res!295262 (validKeyInArray!0 k!2280))))

(declare-fun b!492505 () Bool)

(declare-fun e!289304 () Bool)

(declare-datatypes ((SeekEntryResult!3794 0))(
  ( (MissingZero!3794 (index!17355 (_ BitVec 32))) (Found!3794 (index!17356 (_ BitVec 32))) (Intermediate!3794 (undefined!4606 Bool) (index!17357 (_ BitVec 32)) (x!46442 (_ BitVec 32))) (Undefined!3794) (MissingVacant!3794 (index!17358 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31882 (_ BitVec 32)) SeekEntryResult!3794)

(assert (=> b!492505 (= e!289304 (= (seekEntryOrOpen!0 (select (arr!15327 a!3235) j!176) a!3235 mask!3524) (Found!3794 j!176)))))

(declare-fun b!492506 () Bool)

(declare-fun res!295257 () Bool)

(assert (=> b!492506 (=> (not res!295257) (not e!289307))))

(declare-fun arrayContainsKey!0 (array!31882 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492506 (= res!295257 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492507 () Bool)

(assert (=> b!492507 (= e!289306 (not e!289308))))

(declare-fun res!295260 () Bool)

(assert (=> b!492507 (=> res!295260 e!289308)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31882 (_ BitVec 32)) SeekEntryResult!3794)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492507 (= res!295260 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222657 (select (arr!15327 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15327 a!3235) i!1204 k!2280) j!176) mask!3524) (select (store (arr!15327 a!3235) i!1204 k!2280) j!176) (array!31883 (store (arr!15327 a!3235) i!1204 k!2280) (size!15691 a!3235)) mask!3524)))))

(assert (=> b!492507 (= lt!222657 (toIndex!0 (select (arr!15327 a!3235) j!176) mask!3524))))

(assert (=> b!492507 e!289304))

(declare-fun res!295261 () Bool)

(assert (=> b!492507 (=> (not res!295261) (not e!289304))))

(assert (=> b!492507 (= res!295261 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14534 0))(
  ( (Unit!14535) )
))
(declare-fun lt!222656 () Unit!14534)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31882 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14534)

(assert (=> b!492507 (= lt!222656 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492508 () Bool)

(assert (=> b!492508 (= e!289307 e!289306)))

(declare-fun res!295256 () Bool)

(assert (=> b!492508 (=> (not res!295256) (not e!289306))))

(declare-fun lt!222658 () SeekEntryResult!3794)

(assert (=> b!492508 (= res!295256 (or (= lt!222658 (MissingZero!3794 i!1204)) (= lt!222658 (MissingVacant!3794 i!1204))))))

(assert (=> b!492508 (= lt!222658 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!492509 () Bool)

(declare-fun res!295258 () Bool)

(assert (=> b!492509 (=> (not res!295258) (not e!289307))))

(assert (=> b!492509 (= res!295258 (and (= (size!15691 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15691 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15691 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44880 res!295253) b!492509))

(assert (= (and b!492509 res!295258) b!492500))

(assert (= (and b!492500 res!295259) b!492504))

(assert (= (and b!492504 res!295262) b!492506))

(assert (= (and b!492506 res!295257) b!492508))

(assert (= (and b!492508 res!295256) b!492502))

(assert (= (and b!492502 res!295254) b!492503))

(assert (= (and b!492503 res!295255) b!492507))

(assert (= (and b!492507 res!295261) b!492505))

(assert (= (and b!492507 (not res!295260)) b!492501))

(declare-fun m!473247 () Bool)

(assert (=> b!492502 m!473247))

(declare-fun m!473249 () Bool)

(assert (=> b!492508 m!473249))

(declare-fun m!473251 () Bool)

(assert (=> b!492506 m!473251))

(declare-fun m!473253 () Bool)

(assert (=> b!492507 m!473253))

(declare-fun m!473255 () Bool)

(assert (=> b!492507 m!473255))

(declare-fun m!473257 () Bool)

(assert (=> b!492507 m!473257))

(declare-fun m!473259 () Bool)

(assert (=> b!492507 m!473259))

(declare-fun m!473261 () Bool)

(assert (=> b!492507 m!473261))

(assert (=> b!492507 m!473259))

(declare-fun m!473263 () Bool)

(assert (=> b!492507 m!473263))

(declare-fun m!473265 () Bool)

(assert (=> b!492507 m!473265))

(assert (=> b!492507 m!473257))

(declare-fun m!473267 () Bool)

(assert (=> b!492507 m!473267))

(assert (=> b!492507 m!473259))

(declare-fun m!473269 () Bool)

(assert (=> b!492507 m!473269))

(assert (=> b!492507 m!473257))

(assert (=> b!492507 m!473265))

(assert (=> b!492500 m!473259))

(assert (=> b!492500 m!473259))

(declare-fun m!473271 () Bool)

(assert (=> b!492500 m!473271))

(declare-fun m!473273 () Bool)

(assert (=> b!492504 m!473273))

(declare-fun m!473275 () Bool)

(assert (=> b!492503 m!473275))

(assert (=> b!492505 m!473259))

(assert (=> b!492505 m!473259))

(declare-fun m!473277 () Bool)

(assert (=> b!492505 m!473277))

(declare-fun m!473279 () Bool)

(assert (=> start!44880 m!473279))

(declare-fun m!473281 () Bool)

(assert (=> start!44880 m!473281))

(push 1)

(assert (not b!492500))

(assert (not b!492506))

(assert (not b!492508))

(assert (not b!492503))

(assert (not b!492507))

(assert (not start!44880))

(assert (not b!492505))

(assert (not b!492502))

(assert (not b!492504))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!492630 () Bool)

(declare-fun e!289379 () SeekEntryResult!3794)

(declare-fun lt!222726 () SeekEntryResult!3794)

(assert (=> b!492630 (= e!289379 (Found!3794 (index!17357 lt!222726)))))

(declare-fun b!492631 () Bool)

(declare-fun e!289380 () SeekEntryResult!3794)

(assert (=> b!492631 (= e!289380 (MissingZero!3794 (index!17357 lt!222726)))))

(declare-fun b!492632 () Bool)

(declare-fun e!289378 () SeekEntryResult!3794)

(assert (=> b!492632 (= e!289378 e!289379)))

(declare-fun lt!222727 () (_ BitVec 64))

(assert (=> b!492632 (= lt!222727 (select (arr!15327 a!3235) (index!17357 lt!222726)))))

(declare-fun c!58918 () Bool)

(assert (=> b!492632 (= c!58918 (= lt!222727 (select (arr!15327 a!3235) j!176)))))

(declare-fun b!492633 () Bool)

(assert (=> b!492633 (= e!289378 Undefined!3794)))

(declare-fun b!492635 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31882 (_ BitVec 32)) SeekEntryResult!3794)

(assert (=> b!492635 (= e!289380 (seekKeyOrZeroReturnVacant!0 (x!46442 lt!222726) (index!17357 lt!222726) (index!17357 lt!222726) (select (arr!15327 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!492634 () Bool)

(declare-fun c!58919 () Bool)

(assert (=> b!492634 (= c!58919 (= lt!222727 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!492634 (= e!289379 e!289380)))

(declare-fun d!78109 () Bool)

(declare-fun lt!222725 () SeekEntryResult!3794)

(assert (=> d!78109 (and (or (is-Undefined!3794 lt!222725) (not (is-Found!3794 lt!222725)) (and (bvsge (index!17356 lt!222725) #b00000000000000000000000000000000) (bvslt (index!17356 lt!222725) (size!15691 a!3235)))) (or (is-Undefined!3794 lt!222725) (is-Found!3794 lt!222725) (not (is-MissingZero!3794 lt!222725)) (and (bvsge (index!17355 lt!222725) #b00000000000000000000000000000000) (bvslt (index!17355 lt!222725) (size!15691 a!3235)))) (or (is-Undefined!3794 lt!222725) (is-Found!3794 lt!222725) (is-MissingZero!3794 lt!222725) (not (is-MissingVacant!3794 lt!222725)) (and (bvsge (index!17358 lt!222725) #b00000000000000000000000000000000) (bvslt (index!17358 lt!222725) (size!15691 a!3235)))) (or (is-Undefined!3794 lt!222725) (ite (is-Found!3794 lt!222725) (= (select (arr!15327 a!3235) (index!17356 lt!222725)) (select (arr!15327 a!3235) j!176)) (ite (is-MissingZero!3794 lt!222725) (= (select (arr!15327 a!3235) (index!17355 lt!222725)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3794 lt!222725) (= (select (arr!15327 a!3235) (index!17358 lt!222725)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78109 (= lt!222725 e!289378)))

(declare-fun c!58917 () Bool)

(assert (=> d!78109 (= c!58917 (and (is-Intermediate!3794 lt!222726) (undefined!4606 lt!222726)))))

(assert (=> d!78109 (= lt!222726 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15327 a!3235) j!176) mask!3524) (select (arr!15327 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78109 (validMask!0 mask!3524)))

(assert (=> d!78109 (= (seekEntryOrOpen!0 (select (arr!15327 a!3235) j!176) a!3235 mask!3524) lt!222725)))

(assert (= (and d!78109 c!58917) b!492633))

(assert (= (and d!78109 (not c!58917)) b!492632))

(assert (= (and b!492632 c!58918) b!492630))

(assert (= (and b!492632 (not c!58918)) b!492634))

(assert (= (and b!492634 c!58919) b!492631))

(assert (= (and b!492634 (not c!58919)) b!492635))

(declare-fun m!473391 () Bool)

(assert (=> b!492632 m!473391))

(assert (=> b!492635 m!473259))

(declare-fun m!473393 () Bool)

(assert (=> b!492635 m!473393))

(assert (=> d!78109 m!473279))

(declare-fun m!473395 () Bool)

(assert (=> d!78109 m!473395))

(assert (=> d!78109 m!473259))

(assert (=> d!78109 m!473263))

(declare-fun m!473397 () Bool)

(assert (=> d!78109 m!473397))

(declare-fun m!473399 () Bool)

(assert (=> d!78109 m!473399))

(assert (=> d!78109 m!473263))

(assert (=> d!78109 m!473259))

(declare-fun m!473401 () Bool)

(assert (=> d!78109 m!473401))

(assert (=> b!492505 d!78109))

(declare-fun d!78125 () Bool)

(assert (=> d!78125 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44880 d!78125))

(declare-fun d!78127 () Bool)

(assert (=> d!78127 (= (array_inv!11123 a!3235) (bvsge (size!15691 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44880 d!78127))

(declare-fun d!78129 () Bool)

(assert (=> d!78129 (= (validKeyInArray!0 (select (arr!15327 a!3235) j!176)) (and (not (= (select (arr!15327 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15327 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!492500 d!78129))

(declare-fun b!492700 () Bool)

(declare-fun e!289421 () Bool)

(declare-fun e!289422 () Bool)

(assert (=> b!492700 (= e!289421 e!289422)))

(declare-fun res!295368 () Bool)

(assert (=> b!492700 (=> (not res!295368) (not e!289422))))

(declare-fun e!289419 () Bool)

(assert (=> b!492700 (= res!295368 (not e!289419))))

(declare-fun res!295367 () Bool)

(assert (=> b!492700 (=> (not res!295367) (not e!289419))))

(assert (=> b!492700 (= res!295367 (validKeyInArray!0 (select (arr!15327 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!492701 () Bool)

(declare-fun e!289420 () Bool)

(declare-fun call!31397 () Bool)

(assert (=> b!492701 (= e!289420 call!31397)))

(declare-fun b!492702 () Bool)

(assert (=> b!492702 (= e!289422 e!289420)))

(declare-fun c!58940 () Bool)

(assert (=> b!492702 (= c!58940 (validKeyInArray!0 (select (arr!15327 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31394 () Bool)

(assert (=> bm!31394 (= call!31397 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58940 (Cons!9481 (select (arr!15327 a!3235) #b00000000000000000000000000000000) Nil!9482) Nil!9482)))))

(declare-fun b!492703 () Bool)

(declare-fun contains!2711 (List!9485 (_ BitVec 64)) Bool)

(assert (=> b!492703 (= e!289419 (contains!2711 Nil!9482 (select (arr!15327 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!78131 () Bool)

(declare-fun res!295369 () Bool)

(assert (=> d!78131 (=> res!295369 e!289421)))

(assert (=> d!78131 (= res!295369 (bvsge #b00000000000000000000000000000000 (size!15691 a!3235)))))

(assert (=> d!78131 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9482) e!289421)))

(declare-fun b!492704 () Bool)

(assert (=> b!492704 (= e!289420 call!31397)))

(assert (= (and d!78131 (not res!295369)) b!492700))

(assert (= (and b!492700 res!295367) b!492703))

(assert (= (and b!492700 res!295368) b!492702))

(assert (= (and b!492702 c!58940) b!492701))

(assert (= (and b!492702 (not c!58940)) b!492704))

(assert (= (or b!492701 b!492704) bm!31394))

(declare-fun m!473419 () Bool)

(assert (=> b!492700 m!473419))

(assert (=> b!492700 m!473419))

(declare-fun m!473421 () Bool)

(assert (=> b!492700 m!473421))

(assert (=> b!492702 m!473419))

(assert (=> b!492702 m!473419))

(assert (=> b!492702 m!473421))

(assert (=> bm!31394 m!473419))

(declare-fun m!473423 () Bool)

(assert (=> bm!31394 m!473423))

(assert (=> b!492703 m!473419))

(assert (=> b!492703 m!473419))

(declare-fun m!473425 () Bool)

(assert (=> b!492703 m!473425))

(assert (=> b!492503 d!78131))

(declare-fun d!78139 () Bool)

(assert (=> d!78139 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!492504 d!78139))

(declare-fun d!78141 () Bool)

(declare-fun lt!222752 () (_ BitVec 32))

(declare-fun lt!222751 () (_ BitVec 32))

(assert (=> d!78141 (= lt!222752 (bvmul (bvxor lt!222751 (bvlshr lt!222751 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78141 (= lt!222751 ((_ extract 31 0) (bvand (bvxor (select (arr!15327 a!3235) j!176) (bvlshr (select (arr!15327 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78141 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!295370 (let ((h!10351 ((_ extract 31 0) (bvand (bvxor (select (arr!15327 a!3235) j!176) (bvlshr (select (arr!15327 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46449 (bvmul (bvxor h!10351 (bvlshr h!10351 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46449 (bvlshr x!46449 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!295370 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!295370 #b00000000000000000000000000000000))))))

(assert (=> d!78141 (= (toIndex!0 (select (arr!15327 a!3235) j!176) mask!3524) (bvand (bvxor lt!222752 (bvlshr lt!222752 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!492507 d!78141))

(declare-fun b!492754 () Bool)

(declare-fun e!289459 () Bool)

(declare-fun call!31405 () Bool)

(assert (=> b!492754 (= e!289459 call!31405)))

(declare-fun bm!31402 () Bool)

(assert (=> bm!31402 (= call!31405 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!492755 () Bool)

(declare-fun e!289457 () Bool)

(assert (=> b!492755 (= e!289457 e!289459)))

(declare-fun c!58954 () Bool)

(assert (=> b!492755 (= c!58954 (validKeyInArray!0 (select (arr!15327 a!3235) j!176)))))

(declare-fun d!78149 () Bool)

(declare-fun res!295395 () Bool)

(assert (=> d!78149 (=> res!295395 e!289457)))

(assert (=> d!78149 (= res!295395 (bvsge j!176 (size!15691 a!3235)))))

(assert (=> d!78149 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!289457)))

(declare-fun b!492756 () Bool)

(declare-fun e!289458 () Bool)

(assert (=> b!492756 (= e!289459 e!289458)))

(declare-fun lt!222770 () (_ BitVec 64))

(assert (=> b!492756 (= lt!222770 (select (arr!15327 a!3235) j!176))))

(declare-fun lt!222771 () Unit!14534)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31882 (_ BitVec 64) (_ BitVec 32)) Unit!14534)

(assert (=> b!492756 (= lt!222771 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!222770 j!176))))

(assert (=> b!492756 (arrayContainsKey!0 a!3235 lt!222770 #b00000000000000000000000000000000)))

(declare-fun lt!222769 () Unit!14534)

(assert (=> b!492756 (= lt!222769 lt!222771)))

(declare-fun res!295394 () Bool)

(assert (=> b!492756 (= res!295394 (= (seekEntryOrOpen!0 (select (arr!15327 a!3235) j!176) a!3235 mask!3524) (Found!3794 j!176)))))

(assert (=> b!492756 (=> (not res!295394) (not e!289458))))

(declare-fun b!492757 () Bool)

(assert (=> b!492757 (= e!289458 call!31405)))

(assert (= (and d!78149 (not res!295395)) b!492755))

(assert (= (and b!492755 c!58954) b!492756))

(assert (= (and b!492755 (not c!58954)) b!492754))

(assert (= (and b!492756 res!295394) b!492757))

(assert (= (or b!492757 b!492754) bm!31402))

(declare-fun m!473465 () Bool)

(assert (=> bm!31402 m!473465))

(assert (=> b!492755 m!473259))

(assert (=> b!492755 m!473259))

(assert (=> b!492755 m!473271))

(assert (=> b!492756 m!473259))

(declare-fun m!473467 () Bool)

(assert (=> b!492756 m!473467))

(declare-fun m!473469 () Bool)

(assert (=> b!492756 m!473469))

(assert (=> b!492756 m!473259))

(assert (=> b!492756 m!473277))

(assert (=> b!492507 d!78149))

(declare-fun b!492816 () Bool)

(declare-fun lt!222788 () SeekEntryResult!3794)

(assert (=> b!492816 (and (bvsge (index!17357 lt!222788) #b00000000000000000000000000000000) (bvslt (index!17357 lt!222788) (size!15691 a!3235)))))

(declare-fun res!295412 () Bool)

(assert (=> b!492816 (= res!295412 (= (select (arr!15327 a!3235) (index!17357 lt!222788)) (select (arr!15327 a!3235) j!176)))))

(declare-fun e!289494 () Bool)

(assert (=> b!492816 (=> res!295412 e!289494)))

(declare-fun e!289496 () Bool)

(assert (=> b!492816 (= e!289496 e!289494)))

(declare-fun b!492817 () Bool)

(declare-fun e!289495 () SeekEntryResult!3794)

(declare-fun e!289498 () SeekEntryResult!3794)

(assert (=> b!492817 (= e!289495 e!289498)))

(declare-fun lt!222789 () (_ BitVec 64))

(declare-fun c!58977 () Bool)

(assert (=> b!492817 (= c!58977 (or (= lt!222789 (select (arr!15327 a!3235) j!176)) (= (bvadd lt!222789 lt!222789) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!492818 () Bool)

(assert (=> b!492818 (and (bvsge (index!17357 lt!222788) #b00000000000000000000000000000000) (bvslt (index!17357 lt!222788) (size!15691 a!3235)))))

(declare-fun res!295413 () Bool)

(assert (=> b!492818 (= res!295413 (= (select (arr!15327 a!3235) (index!17357 lt!222788)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!492818 (=> res!295413 e!289494)))

(declare-fun b!492819 () Bool)

(assert (=> b!492819 (= e!289495 (Intermediate!3794 true lt!222657 #b00000000000000000000000000000000))))

(declare-fun b!492820 () Bool)

(declare-fun e!289497 () Bool)

(assert (=> b!492820 (= e!289497 (bvsge (x!46442 lt!222788) #b01111111111111111111111111111110))))

(declare-fun b!492821 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492821 (= e!289498 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!222657 #b00000000000000000000000000000000 mask!3524) (select (arr!15327 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!78167 () Bool)

(assert (=> d!78167 e!289497))

(declare-fun c!58976 () Bool)

(assert (=> d!78167 (= c!58976 (and (is-Intermediate!3794 lt!222788) (undefined!4606 lt!222788)))))

(assert (=> d!78167 (= lt!222788 e!289495)))

(declare-fun c!58978 () Bool)

(assert (=> d!78167 (= c!58978 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78167 (= lt!222789 (select (arr!15327 a!3235) lt!222657))))

(assert (=> d!78167 (validMask!0 mask!3524)))

(assert (=> d!78167 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222657 (select (arr!15327 a!3235) j!176) a!3235 mask!3524) lt!222788)))

(declare-fun b!492815 () Bool)

(assert (=> b!492815 (and (bvsge (index!17357 lt!222788) #b00000000000000000000000000000000) (bvslt (index!17357 lt!222788) (size!15691 a!3235)))))

(assert (=> b!492815 (= e!289494 (= (select (arr!15327 a!3235) (index!17357 lt!222788)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!492822 () Bool)

(assert (=> b!492822 (= e!289497 e!289496)))

(declare-fun res!295411 () Bool)

(assert (=> b!492822 (= res!295411 (and (is-Intermediate!3794 lt!222788) (not (undefined!4606 lt!222788)) (bvslt (x!46442 lt!222788) #b01111111111111111111111111111110) (bvsge (x!46442 lt!222788) #b00000000000000000000000000000000) (bvsge (x!46442 lt!222788) #b00000000000000000000000000000000)))))

(assert (=> b!492822 (=> (not res!295411) (not e!289496))))

(declare-fun b!492823 () Bool)

(assert (=> b!492823 (= e!289498 (Intermediate!3794 false lt!222657 #b00000000000000000000000000000000))))

(assert (= (and d!78167 c!58978) b!492819))

(assert (= (and d!78167 (not c!58978)) b!492817))

(assert (= (and b!492817 c!58977) b!492823))

(assert (= (and b!492817 (not c!58977)) b!492821))

(assert (= (and d!78167 c!58976) b!492820))

(assert (= (and d!78167 (not c!58976)) b!492822))

(assert (= (and b!492822 res!295411) b!492816))

(assert (= (and b!492816 (not res!295412)) b!492818))

(assert (= (and b!492818 (not res!295413)) b!492815))

(declare-fun m!473503 () Bool)

(assert (=> b!492821 m!473503))

(assert (=> b!492821 m!473503))

(assert (=> b!492821 m!473259))

(declare-fun m!473505 () Bool)

(assert (=> b!492821 m!473505))

(declare-fun m!473507 () Bool)

(assert (=> d!78167 m!473507))

(assert (=> d!78167 m!473279))

(declare-fun m!473509 () Bool)

(assert (=> b!492815 m!473509))

(assert (=> b!492816 m!473509))

(assert (=> b!492818 m!473509))

(assert (=> b!492507 d!78167))

(declare-fun d!78173 () Bool)

(assert (=> d!78173 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222795 () Unit!14534)

(declare-fun choose!38 (array!31882 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14534)

(assert (=> d!78173 (= lt!222795 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78173 (validMask!0 mask!3524)))

(assert (=> d!78173 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!222795)))

(declare-fun bs!15705 () Bool)

(assert (= bs!15705 d!78173))

(assert (=> bs!15705 m!473269))

(declare-fun m!473525 () Bool)

(assert (=> bs!15705 m!473525))

(assert (=> bs!15705 m!473279))

(assert (=> b!492507 d!78173))

(declare-fun d!78179 () Bool)

(declare-fun lt!222797 () (_ BitVec 32))

(declare-fun lt!222796 () (_ BitVec 32))

(assert (=> d!78179 (= lt!222797 (bvmul (bvxor lt!222796 (bvlshr lt!222796 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78179 (= lt!222796 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15327 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15327 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78179 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!295370 (let ((h!10351 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15327 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15327 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46449 (bvmul (bvxor h!10351 (bvlshr h!10351 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46449 (bvlshr x!46449 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!295370 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!295370 #b00000000000000000000000000000000))))))

(assert (=> d!78179 (= (toIndex!0 (select (store (arr!15327 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!222797 (bvlshr lt!222797 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!492507 d!78179))

(declare-fun lt!222798 () SeekEntryResult!3794)

(declare-fun b!492837 () Bool)

(assert (=> b!492837 (and (bvsge (index!17357 lt!222798) #b00000000000000000000000000000000) (bvslt (index!17357 lt!222798) (size!15691 (array!31883 (store (arr!15327 a!3235) i!1204 k!2280) (size!15691 a!3235)))))))

(declare-fun res!295421 () Bool)

(assert (=> b!492837 (= res!295421 (= (select (arr!15327 (array!31883 (store (arr!15327 a!3235) i!1204 k!2280) (size!15691 a!3235))) (index!17357 lt!222798)) (select (store (arr!15327 a!3235) i!1204 k!2280) j!176)))))

(declare-fun e!289508 () Bool)

(assert (=> b!492837 (=> res!295421 e!289508)))

(declare-fun e!289510 () Bool)

(assert (=> b!492837 (= e!289510 e!289508)))

(declare-fun b!492838 () Bool)

(declare-fun e!289509 () SeekEntryResult!3794)

(declare-fun e!289512 () SeekEntryResult!3794)

(assert (=> b!492838 (= e!289509 e!289512)))

(declare-fun lt!222799 () (_ BitVec 64))

(declare-fun c!58983 () Bool)

(assert (=> b!492838 (= c!58983 (or (= lt!222799 (select (store (arr!15327 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!222799 lt!222799) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!492839 () Bool)

(assert (=> b!492839 (and (bvsge (index!17357 lt!222798) #b00000000000000000000000000000000) (bvslt (index!17357 lt!222798) (size!15691 (array!31883 (store (arr!15327 a!3235) i!1204 k!2280) (size!15691 a!3235)))))))

(declare-fun res!295422 () Bool)

(assert (=> b!492839 (= res!295422 (= (select (arr!15327 (array!31883 (store (arr!15327 a!3235) i!1204 k!2280) (size!15691 a!3235))) (index!17357 lt!222798)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!492839 (=> res!295422 e!289508)))

(declare-fun b!492840 () Bool)

(assert (=> b!492840 (= e!289509 (Intermediate!3794 true (toIndex!0 (select (store (arr!15327 a!3235) i!1204 k!2280) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun b!492841 () Bool)

(declare-fun e!289511 () Bool)

(assert (=> b!492841 (= e!289511 (bvsge (x!46442 lt!222798) #b01111111111111111111111111111110))))

(declare-fun b!492842 () Bool)

(assert (=> b!492842 (= e!289512 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!15327 a!3235) i!1204 k!2280) j!176) mask!3524) #b00000000000000000000000000000000 mask!3524) (select (store (arr!15327 a!3235) i!1204 k!2280) j!176) (array!31883 (store (arr!15327 a!3235) i!1204 k!2280) (size!15691 a!3235)) mask!3524))))

(declare-fun d!78181 () Bool)

(assert (=> d!78181 e!289511))

(declare-fun c!58982 () Bool)

(assert (=> d!78181 (= c!58982 (and (is-Intermediate!3794 lt!222798) (undefined!4606 lt!222798)))))

(assert (=> d!78181 (= lt!222798 e!289509)))

(declare-fun c!58984 () Bool)

(assert (=> d!78181 (= c!58984 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78181 (= lt!222799 (select (arr!15327 (array!31883 (store (arr!15327 a!3235) i!1204 k!2280) (size!15691 a!3235))) (toIndex!0 (select (store (arr!15327 a!3235) i!1204 k!2280) j!176) mask!3524)))))

(assert (=> d!78181 (validMask!0 mask!3524)))

(assert (=> d!78181 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15327 a!3235) i!1204 k!2280) j!176) mask!3524) (select (store (arr!15327 a!3235) i!1204 k!2280) j!176) (array!31883 (store (arr!15327 a!3235) i!1204 k!2280) (size!15691 a!3235)) mask!3524) lt!222798)))

(declare-fun b!492836 () Bool)

(assert (=> b!492836 (and (bvsge (index!17357 lt!222798) #b00000000000000000000000000000000) (bvslt (index!17357 lt!222798) (size!15691 (array!31883 (store (arr!15327 a!3235) i!1204 k!2280) (size!15691 a!3235)))))))

(assert (=> b!492836 (= e!289508 (= (select (arr!15327 (array!31883 (store (arr!15327 a!3235) i!1204 k!2280) (size!15691 a!3235))) (index!17357 lt!222798)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!492843 () Bool)

(assert (=> b!492843 (= e!289511 e!289510)))

(declare-fun res!295420 () Bool)

(assert (=> b!492843 (= res!295420 (and (is-Intermediate!3794 lt!222798) (not (undefined!4606 lt!222798)) (bvslt (x!46442 lt!222798) #b01111111111111111111111111111110) (bvsge (x!46442 lt!222798) #b00000000000000000000000000000000) (bvsge (x!46442 lt!222798) #b00000000000000000000000000000000)))))

(assert (=> b!492843 (=> (not res!295420) (not e!289510))))

(declare-fun b!492844 () Bool)

(assert (=> b!492844 (= e!289512 (Intermediate!3794 false (toIndex!0 (select (store (arr!15327 a!3235) i!1204 k!2280) j!176) mask!3524) #b00000000000000000000000000000000))))

(assert (= (and d!78181 c!58984) b!492840))

(assert (= (and d!78181 (not c!58984)) b!492838))

(assert (= (and b!492838 c!58983) b!492844))

(assert (= (and b!492838 (not c!58983)) b!492842))

(assert (= (and d!78181 c!58982) b!492841))

(assert (= (and d!78181 (not c!58982)) b!492843))

(assert (= (and b!492843 res!295420) b!492837))

(assert (= (and b!492837 (not res!295421)) b!492839))

(assert (= (and b!492839 (not res!295422)) b!492836))

(assert (=> b!492842 m!473265))

(declare-fun m!473527 () Bool)

(assert (=> b!492842 m!473527))

(assert (=> b!492842 m!473527))

(assert (=> b!492842 m!473257))

(declare-fun m!473529 () Bool)

(assert (=> b!492842 m!473529))

(assert (=> d!78181 m!473265))

(declare-fun m!473531 () Bool)

(assert (=> d!78181 m!473531))

(assert (=> d!78181 m!473279))

(declare-fun m!473533 () Bool)

(assert (=> b!492836 m!473533))

(assert (=> b!492837 m!473533))

(assert (=> b!492839 m!473533))

(assert (=> b!492507 d!78181))

(declare-fun b!492845 () Bool)

(declare-fun e!289515 () Bool)

(declare-fun call!31409 () Bool)

(assert (=> b!492845 (= e!289515 call!31409)))

(declare-fun bm!31406 () Bool)

(assert (=> bm!31406 (= call!31409 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!492846 () Bool)

(declare-fun e!289513 () Bool)

(assert (=> b!492846 (= e!289513 e!289515)))

(declare-fun c!58985 () Bool)

(assert (=> b!492846 (= c!58985 (validKeyInArray!0 (select (arr!15327 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!78183 () Bool)

(declare-fun res!295424 () Bool)

(assert (=> d!78183 (=> res!295424 e!289513)))

(assert (=> d!78183 (= res!295424 (bvsge #b00000000000000000000000000000000 (size!15691 a!3235)))))

(assert (=> d!78183 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!289513)))

(declare-fun b!492847 () Bool)

(declare-fun e!289514 () Bool)

(assert (=> b!492847 (= e!289515 e!289514)))

(declare-fun lt!222801 () (_ BitVec 64))

(assert (=> b!492847 (= lt!222801 (select (arr!15327 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!222802 () Unit!14534)

(assert (=> b!492847 (= lt!222802 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!222801 #b00000000000000000000000000000000))))

(assert (=> b!492847 (arrayContainsKey!0 a!3235 lt!222801 #b00000000000000000000000000000000)))

(declare-fun lt!222800 () Unit!14534)

(assert (=> b!492847 (= lt!222800 lt!222802)))

(declare-fun res!295423 () Bool)

(assert (=> b!492847 (= res!295423 (= (seekEntryOrOpen!0 (select (arr!15327 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3794 #b00000000000000000000000000000000)))))

(assert (=> b!492847 (=> (not res!295423) (not e!289514))))

(declare-fun b!492848 () Bool)

(assert (=> b!492848 (= e!289514 call!31409)))

(assert (= (and d!78183 (not res!295424)) b!492846))

(assert (= (and b!492846 c!58985) b!492847))

(assert (= (and b!492846 (not c!58985)) b!492845))

(assert (= (and b!492847 res!295423) b!492848))

(assert (= (or b!492848 b!492845) bm!31406))

(declare-fun m!473535 () Bool)

(assert (=> bm!31406 m!473535))

(assert (=> b!492846 m!473419))

(assert (=> b!492846 m!473419))

(assert (=> b!492846 m!473421))

(assert (=> b!492847 m!473419))

(declare-fun m!473537 () Bool)

(assert (=> b!492847 m!473537))

(declare-fun m!473539 () Bool)

(assert (=> b!492847 m!473539))

(assert (=> b!492847 m!473419))

(declare-fun m!473541 () Bool)

(assert (=> b!492847 m!473541))

(assert (=> b!492502 d!78183))

(declare-fun b!492849 () Bool)

(declare-fun e!289517 () SeekEntryResult!3794)

(declare-fun lt!222804 () SeekEntryResult!3794)

(assert (=> b!492849 (= e!289517 (Found!3794 (index!17357 lt!222804)))))

(declare-fun b!492850 () Bool)

(declare-fun e!289518 () SeekEntryResult!3794)

(assert (=> b!492850 (= e!289518 (MissingZero!3794 (index!17357 lt!222804)))))

(declare-fun b!492851 () Bool)

(declare-fun e!289516 () SeekEntryResult!3794)

(assert (=> b!492851 (= e!289516 e!289517)))

(declare-fun lt!222805 () (_ BitVec 64))

(assert (=> b!492851 (= lt!222805 (select (arr!15327 a!3235) (index!17357 lt!222804)))))

(declare-fun c!58987 () Bool)

(assert (=> b!492851 (= c!58987 (= lt!222805 k!2280))))

(declare-fun b!492852 () Bool)

(assert (=> b!492852 (= e!289516 Undefined!3794)))

(declare-fun b!492854 () Bool)

(assert (=> b!492854 (= e!289518 (seekKeyOrZeroReturnVacant!0 (x!46442 lt!222804) (index!17357 lt!222804) (index!17357 lt!222804) k!2280 a!3235 mask!3524))))

(declare-fun b!492853 () Bool)

(declare-fun c!58988 () Bool)

(assert (=> b!492853 (= c!58988 (= lt!222805 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!492853 (= e!289517 e!289518)))

(declare-fun d!78185 () Bool)

(declare-fun lt!222803 () SeekEntryResult!3794)

(assert (=> d!78185 (and (or (is-Undefined!3794 lt!222803) (not (is-Found!3794 lt!222803)) (and (bvsge (index!17356 lt!222803) #b00000000000000000000000000000000) (bvslt (index!17356 lt!222803) (size!15691 a!3235)))) (or (is-Undefined!3794 lt!222803) (is-Found!3794 lt!222803) (not (is-MissingZero!3794 lt!222803)) (and (bvsge (index!17355 lt!222803) #b00000000000000000000000000000000) (bvslt (index!17355 lt!222803) (size!15691 a!3235)))) (or (is-Undefined!3794 lt!222803) (is-Found!3794 lt!222803) (is-MissingZero!3794 lt!222803) (not (is-MissingVacant!3794 lt!222803)) (and (bvsge (index!17358 lt!222803) #b00000000000000000000000000000000) (bvslt (index!17358 lt!222803) (size!15691 a!3235)))) (or (is-Undefined!3794 lt!222803) (ite (is-Found!3794 lt!222803) (= (select (arr!15327 a!3235) (index!17356 lt!222803)) k!2280) (ite (is-MissingZero!3794 lt!222803) (= (select (arr!15327 a!3235) (index!17355 lt!222803)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3794 lt!222803) (= (select (arr!15327 a!3235) (index!17358 lt!222803)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78185 (= lt!222803 e!289516)))

(declare-fun c!58986 () Bool)

(assert (=> d!78185 (= c!58986 (and (is-Intermediate!3794 lt!222804) (undefined!4606 lt!222804)))))

(assert (=> d!78185 (= lt!222804 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!78185 (validMask!0 mask!3524)))

(assert (=> d!78185 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!222803)))

(assert (= (and d!78185 c!58986) b!492852))

(assert (= (and d!78185 (not c!58986)) b!492851))

(assert (= (and b!492851 c!58987) b!492849))

(assert (= (and b!492851 (not c!58987)) b!492853))

(assert (= (and b!492853 c!58988) b!492850))

(assert (= (and b!492853 (not c!58988)) b!492854))

(declare-fun m!473543 () Bool)

(assert (=> b!492851 m!473543))

(declare-fun m!473545 () Bool)

(assert (=> b!492854 m!473545))

(assert (=> d!78185 m!473279))

(declare-fun m!473547 () Bool)

(assert (=> d!78185 m!473547))

(declare-fun m!473549 () Bool)

(assert (=> d!78185 m!473549))

(declare-fun m!473551 () Bool)

(assert (=> d!78185 m!473551))

(declare-fun m!473553 () Bool)

(assert (=> d!78185 m!473553))

(assert (=> d!78185 m!473549))

(declare-fun m!473555 () Bool)

(assert (=> d!78185 m!473555))

(assert (=> b!492508 d!78185))

(declare-fun d!78187 () Bool)

(declare-fun res!295429 () Bool)

(declare-fun e!289523 () Bool)

(assert (=> d!78187 (=> res!295429 e!289523)))

(assert (=> d!78187 (= res!295429 (= (select (arr!15327 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!78187 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!289523)))

(declare-fun b!492859 () Bool)

(declare-fun e!289524 () Bool)

(assert (=> b!492859 (= e!289523 e!289524)))

(declare-fun res!295430 () Bool)

(assert (=> b!492859 (=> (not res!295430) (not e!289524))))

(assert (=> b!492859 (= res!295430 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15691 a!3235)))))

(declare-fun b!492860 () Bool)

(assert (=> b!492860 (= e!289524 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78187 (not res!295429)) b!492859))

(assert (= (and b!492859 res!295430) b!492860))

(assert (=> d!78187 m!473419))

(declare-fun m!473557 () Bool)

(assert (=> b!492860 m!473557))

(assert (=> b!492506 d!78187))

(push 1)

(assert (not b!492703))

(assert (not bm!31402))

(assert (not b!492847))

(assert (not b!492854))

(assert (not bm!31394))

(assert (not bm!31406))

(assert (not d!78167))

(assert (not b!492846))

(assert (not d!78109))

(assert (not b!492755))

(assert (not d!78181))

(assert (not b!492756))

(assert (not d!78173))

(assert (not b!492821))

(assert (not d!78185))

(assert (not b!492842))

(assert (not b!492700))

(assert (not b!492702))

(assert (not b!492860))

(assert (not b!492635))

(check-sat)

(pop 1)

(push 1)

(check-sat)

