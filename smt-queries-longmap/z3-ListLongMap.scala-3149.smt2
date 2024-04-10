; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44318 () Bool)

(assert start!44318)

(declare-fun b!487398 () Bool)

(declare-fun res!290786 () Bool)

(declare-fun e!286771 () Bool)

(assert (=> b!487398 (=> (not res!290786) (not e!286771))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487398 (= res!290786 (validKeyInArray!0 k0!2280))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31569 0))(
  ( (array!31570 (arr!15178 (Array (_ BitVec 32) (_ BitVec 64))) (size!15542 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31569)

(declare-fun b!487399 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!286770 () Bool)

(declare-datatypes ((SeekEntryResult!3645 0))(
  ( (MissingZero!3645 (index!16759 (_ BitVec 32))) (Found!3645 (index!16760 (_ BitVec 32))) (Intermediate!3645 (undefined!4457 Bool) (index!16761 (_ BitVec 32)) (x!45881 (_ BitVec 32))) (Undefined!3645) (MissingVacant!3645 (index!16762 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31569 (_ BitVec 32)) SeekEntryResult!3645)

(assert (=> b!487399 (= e!286770 (= (seekEntryOrOpen!0 (select (arr!15178 a!3235) j!176) a!3235 mask!3524) (Found!3645 j!176)))))

(declare-fun b!487400 () Bool)

(declare-fun res!290792 () Bool)

(declare-fun e!286773 () Bool)

(assert (=> b!487400 (=> (not res!290792) (not e!286773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31569 (_ BitVec 32)) Bool)

(assert (=> b!487400 (= res!290792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!290788 () Bool)

(assert (=> start!44318 (=> (not res!290788) (not e!286771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44318 (= res!290788 (validMask!0 mask!3524))))

(assert (=> start!44318 e!286771))

(assert (=> start!44318 true))

(declare-fun array_inv!10974 (array!31569) Bool)

(assert (=> start!44318 (array_inv!10974 a!3235)))

(declare-fun b!487401 () Bool)

(assert (=> b!487401 (= e!286773 (not (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111))))))

(assert (=> b!487401 e!286770))

(declare-fun res!290784 () Bool)

(assert (=> b!487401 (=> (not res!290784) (not e!286770))))

(assert (=> b!487401 (= res!290784 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14236 0))(
  ( (Unit!14237) )
))
(declare-fun lt!220012 () Unit!14236)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31569 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14236)

(assert (=> b!487401 (= lt!220012 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487402 () Bool)

(declare-fun res!290791 () Bool)

(assert (=> b!487402 (=> (not res!290791) (not e!286773))))

(declare-datatypes ((List!9336 0))(
  ( (Nil!9333) (Cons!9332 (h!10188 (_ BitVec 64)) (t!15564 List!9336)) )
))
(declare-fun arrayNoDuplicates!0 (array!31569 (_ BitVec 32) List!9336) Bool)

(assert (=> b!487402 (= res!290791 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9333))))

(declare-fun b!487403 () Bool)

(assert (=> b!487403 (= e!286771 e!286773)))

(declare-fun res!290785 () Bool)

(assert (=> b!487403 (=> (not res!290785) (not e!286773))))

(declare-fun lt!220011 () SeekEntryResult!3645)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487403 (= res!290785 (or (= lt!220011 (MissingZero!3645 i!1204)) (= lt!220011 (MissingVacant!3645 i!1204))))))

(assert (=> b!487403 (= lt!220011 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!487404 () Bool)

(declare-fun res!290787 () Bool)

(assert (=> b!487404 (=> (not res!290787) (not e!286771))))

(assert (=> b!487404 (= res!290787 (and (= (size!15542 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15542 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15542 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!487405 () Bool)

(declare-fun res!290790 () Bool)

(assert (=> b!487405 (=> (not res!290790) (not e!286771))))

(declare-fun arrayContainsKey!0 (array!31569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487405 (= res!290790 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487406 () Bool)

(declare-fun res!290789 () Bool)

(assert (=> b!487406 (=> (not res!290789) (not e!286771))))

(assert (=> b!487406 (= res!290789 (validKeyInArray!0 (select (arr!15178 a!3235) j!176)))))

(assert (= (and start!44318 res!290788) b!487404))

(assert (= (and b!487404 res!290787) b!487406))

(assert (= (and b!487406 res!290789) b!487398))

(assert (= (and b!487398 res!290786) b!487405))

(assert (= (and b!487405 res!290790) b!487403))

(assert (= (and b!487403 res!290785) b!487400))

(assert (= (and b!487400 res!290792) b!487402))

(assert (= (and b!487402 res!290791) b!487401))

(assert (= (and b!487401 res!290784) b!487399))

(declare-fun m!467217 () Bool)

(assert (=> b!487400 m!467217))

(declare-fun m!467219 () Bool)

(assert (=> b!487398 m!467219))

(declare-fun m!467221 () Bool)

(assert (=> b!487399 m!467221))

(assert (=> b!487399 m!467221))

(declare-fun m!467223 () Bool)

(assert (=> b!487399 m!467223))

(declare-fun m!467225 () Bool)

(assert (=> b!487401 m!467225))

(declare-fun m!467227 () Bool)

(assert (=> b!487401 m!467227))

(assert (=> b!487406 m!467221))

(assert (=> b!487406 m!467221))

(declare-fun m!467229 () Bool)

(assert (=> b!487406 m!467229))

(declare-fun m!467231 () Bool)

(assert (=> b!487402 m!467231))

(declare-fun m!467233 () Bool)

(assert (=> b!487405 m!467233))

(declare-fun m!467235 () Bool)

(assert (=> b!487403 m!467235))

(declare-fun m!467237 () Bool)

(assert (=> start!44318 m!467237))

(declare-fun m!467239 () Bool)

(assert (=> start!44318 m!467239))

(check-sat (not start!44318) (not b!487399) (not b!487398) (not b!487402) (not b!487400) (not b!487401) (not b!487403) (not b!487406) (not b!487405))
(check-sat)
(get-model)

(declare-fun d!77633 () Bool)

(assert (=> d!77633 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!487398 d!77633))

(declare-fun d!77635 () Bool)

(assert (=> d!77635 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44318 d!77635))

(declare-fun d!77637 () Bool)

(assert (=> d!77637 (= (array_inv!10974 a!3235) (bvsge (size!15542 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44318 d!77637))

(declare-fun b!487461 () Bool)

(declare-fun e!286804 () SeekEntryResult!3645)

(declare-fun lt!220025 () SeekEntryResult!3645)

(assert (=> b!487461 (= e!286804 (Found!3645 (index!16761 lt!220025)))))

(declare-fun e!286805 () SeekEntryResult!3645)

(declare-fun b!487462 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31569 (_ BitVec 32)) SeekEntryResult!3645)

(assert (=> b!487462 (= e!286805 (seekKeyOrZeroReturnVacant!0 (x!45881 lt!220025) (index!16761 lt!220025) (index!16761 lt!220025) k0!2280 a!3235 mask!3524))))

(declare-fun b!487463 () Bool)

(declare-fun e!286806 () SeekEntryResult!3645)

(assert (=> b!487463 (= e!286806 Undefined!3645)))

(declare-fun d!77641 () Bool)

(declare-fun lt!220027 () SeekEntryResult!3645)

(get-info :version)

(assert (=> d!77641 (and (or ((_ is Undefined!3645) lt!220027) (not ((_ is Found!3645) lt!220027)) (and (bvsge (index!16760 lt!220027) #b00000000000000000000000000000000) (bvslt (index!16760 lt!220027) (size!15542 a!3235)))) (or ((_ is Undefined!3645) lt!220027) ((_ is Found!3645) lt!220027) (not ((_ is MissingZero!3645) lt!220027)) (and (bvsge (index!16759 lt!220027) #b00000000000000000000000000000000) (bvslt (index!16759 lt!220027) (size!15542 a!3235)))) (or ((_ is Undefined!3645) lt!220027) ((_ is Found!3645) lt!220027) ((_ is MissingZero!3645) lt!220027) (not ((_ is MissingVacant!3645) lt!220027)) (and (bvsge (index!16762 lt!220027) #b00000000000000000000000000000000) (bvslt (index!16762 lt!220027) (size!15542 a!3235)))) (or ((_ is Undefined!3645) lt!220027) (ite ((_ is Found!3645) lt!220027) (= (select (arr!15178 a!3235) (index!16760 lt!220027)) k0!2280) (ite ((_ is MissingZero!3645) lt!220027) (= (select (arr!15178 a!3235) (index!16759 lt!220027)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3645) lt!220027) (= (select (arr!15178 a!3235) (index!16762 lt!220027)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77641 (= lt!220027 e!286806)))

(declare-fun c!58584 () Bool)

(assert (=> d!77641 (= c!58584 (and ((_ is Intermediate!3645) lt!220025) (undefined!4457 lt!220025)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31569 (_ BitVec 32)) SeekEntryResult!3645)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!77641 (= lt!220025 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!77641 (validMask!0 mask!3524)))

(assert (=> d!77641 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!220027)))

(declare-fun b!487464 () Bool)

(declare-fun c!58586 () Bool)

(declare-fun lt!220026 () (_ BitVec 64))

(assert (=> b!487464 (= c!58586 (= lt!220026 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!487464 (= e!286804 e!286805)))

(declare-fun b!487465 () Bool)

(assert (=> b!487465 (= e!286805 (MissingZero!3645 (index!16761 lt!220025)))))

(declare-fun b!487466 () Bool)

(assert (=> b!487466 (= e!286806 e!286804)))

(assert (=> b!487466 (= lt!220026 (select (arr!15178 a!3235) (index!16761 lt!220025)))))

(declare-fun c!58585 () Bool)

(assert (=> b!487466 (= c!58585 (= lt!220026 k0!2280))))

(assert (= (and d!77641 c!58584) b!487463))

(assert (= (and d!77641 (not c!58584)) b!487466))

(assert (= (and b!487466 c!58585) b!487461))

(assert (= (and b!487466 (not c!58585)) b!487464))

(assert (= (and b!487464 c!58586) b!487465))

(assert (= (and b!487464 (not c!58586)) b!487462))

(declare-fun m!467273 () Bool)

(assert (=> b!487462 m!467273))

(declare-fun m!467275 () Bool)

(assert (=> d!77641 m!467275))

(declare-fun m!467277 () Bool)

(assert (=> d!77641 m!467277))

(declare-fun m!467279 () Bool)

(assert (=> d!77641 m!467279))

(assert (=> d!77641 m!467237))

(declare-fun m!467281 () Bool)

(assert (=> d!77641 m!467281))

(declare-fun m!467283 () Bool)

(assert (=> d!77641 m!467283))

(assert (=> d!77641 m!467275))

(declare-fun m!467285 () Bool)

(assert (=> b!487466 m!467285))

(assert (=> b!487403 d!77641))

(declare-fun b!487467 () Bool)

(declare-fun e!286807 () SeekEntryResult!3645)

(declare-fun lt!220028 () SeekEntryResult!3645)

(assert (=> b!487467 (= e!286807 (Found!3645 (index!16761 lt!220028)))))

(declare-fun b!487468 () Bool)

(declare-fun e!286808 () SeekEntryResult!3645)

(assert (=> b!487468 (= e!286808 (seekKeyOrZeroReturnVacant!0 (x!45881 lt!220028) (index!16761 lt!220028) (index!16761 lt!220028) (select (arr!15178 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!487469 () Bool)

(declare-fun e!286809 () SeekEntryResult!3645)

(assert (=> b!487469 (= e!286809 Undefined!3645)))

(declare-fun d!77651 () Bool)

(declare-fun lt!220030 () SeekEntryResult!3645)

(assert (=> d!77651 (and (or ((_ is Undefined!3645) lt!220030) (not ((_ is Found!3645) lt!220030)) (and (bvsge (index!16760 lt!220030) #b00000000000000000000000000000000) (bvslt (index!16760 lt!220030) (size!15542 a!3235)))) (or ((_ is Undefined!3645) lt!220030) ((_ is Found!3645) lt!220030) (not ((_ is MissingZero!3645) lt!220030)) (and (bvsge (index!16759 lt!220030) #b00000000000000000000000000000000) (bvslt (index!16759 lt!220030) (size!15542 a!3235)))) (or ((_ is Undefined!3645) lt!220030) ((_ is Found!3645) lt!220030) ((_ is MissingZero!3645) lt!220030) (not ((_ is MissingVacant!3645) lt!220030)) (and (bvsge (index!16762 lt!220030) #b00000000000000000000000000000000) (bvslt (index!16762 lt!220030) (size!15542 a!3235)))) (or ((_ is Undefined!3645) lt!220030) (ite ((_ is Found!3645) lt!220030) (= (select (arr!15178 a!3235) (index!16760 lt!220030)) (select (arr!15178 a!3235) j!176)) (ite ((_ is MissingZero!3645) lt!220030) (= (select (arr!15178 a!3235) (index!16759 lt!220030)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3645) lt!220030) (= (select (arr!15178 a!3235) (index!16762 lt!220030)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77651 (= lt!220030 e!286809)))

(declare-fun c!58587 () Bool)

(assert (=> d!77651 (= c!58587 (and ((_ is Intermediate!3645) lt!220028) (undefined!4457 lt!220028)))))

(assert (=> d!77651 (= lt!220028 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15178 a!3235) j!176) mask!3524) (select (arr!15178 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!77651 (validMask!0 mask!3524)))

(assert (=> d!77651 (= (seekEntryOrOpen!0 (select (arr!15178 a!3235) j!176) a!3235 mask!3524) lt!220030)))

(declare-fun b!487470 () Bool)

(declare-fun c!58589 () Bool)

(declare-fun lt!220029 () (_ BitVec 64))

(assert (=> b!487470 (= c!58589 (= lt!220029 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!487470 (= e!286807 e!286808)))

(declare-fun b!487471 () Bool)

(assert (=> b!487471 (= e!286808 (MissingZero!3645 (index!16761 lt!220028)))))

(declare-fun b!487472 () Bool)

(assert (=> b!487472 (= e!286809 e!286807)))

(assert (=> b!487472 (= lt!220029 (select (arr!15178 a!3235) (index!16761 lt!220028)))))

(declare-fun c!58588 () Bool)

(assert (=> b!487472 (= c!58588 (= lt!220029 (select (arr!15178 a!3235) j!176)))))

(assert (= (and d!77651 c!58587) b!487469))

(assert (= (and d!77651 (not c!58587)) b!487472))

(assert (= (and b!487472 c!58588) b!487467))

(assert (= (and b!487472 (not c!58588)) b!487470))

(assert (= (and b!487470 c!58589) b!487471))

(assert (= (and b!487470 (not c!58589)) b!487468))

(assert (=> b!487468 m!467221))

(declare-fun m!467287 () Bool)

(assert (=> b!487468 m!467287))

(declare-fun m!467289 () Bool)

(assert (=> d!77651 m!467289))

(assert (=> d!77651 m!467221))

(declare-fun m!467291 () Bool)

(assert (=> d!77651 m!467291))

(declare-fun m!467293 () Bool)

(assert (=> d!77651 m!467293))

(assert (=> d!77651 m!467237))

(declare-fun m!467295 () Bool)

(assert (=> d!77651 m!467295))

(declare-fun m!467297 () Bool)

(assert (=> d!77651 m!467297))

(assert (=> d!77651 m!467221))

(assert (=> d!77651 m!467289))

(declare-fun m!467299 () Bool)

(assert (=> b!487472 m!467299))

(assert (=> b!487399 d!77651))

(declare-fun d!77653 () Bool)

(assert (=> d!77653 (= (validKeyInArray!0 (select (arr!15178 a!3235) j!176)) (and (not (= (select (arr!15178 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15178 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!487406 d!77653))

(declare-fun bm!31286 () Bool)

(declare-fun call!31289 () Bool)

(assert (=> bm!31286 (= call!31289 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!487481 () Bool)

(declare-fun e!286817 () Bool)

(declare-fun e!286818 () Bool)

(assert (=> b!487481 (= e!286817 e!286818)))

(declare-fun c!58592 () Bool)

(assert (=> b!487481 (= c!58592 (validKeyInArray!0 (select (arr!15178 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!77655 () Bool)

(declare-fun res!290834 () Bool)

(assert (=> d!77655 (=> res!290834 e!286817)))

(assert (=> d!77655 (= res!290834 (bvsge #b00000000000000000000000000000000 (size!15542 a!3235)))))

(assert (=> d!77655 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!286817)))

(declare-fun b!487482 () Bool)

(assert (=> b!487482 (= e!286818 call!31289)))

(declare-fun b!487483 () Bool)

(declare-fun e!286816 () Bool)

(assert (=> b!487483 (= e!286818 e!286816)))

(declare-fun lt!220038 () (_ BitVec 64))

(assert (=> b!487483 (= lt!220038 (select (arr!15178 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!220039 () Unit!14236)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31569 (_ BitVec 64) (_ BitVec 32)) Unit!14236)

(assert (=> b!487483 (= lt!220039 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220038 #b00000000000000000000000000000000))))

(assert (=> b!487483 (arrayContainsKey!0 a!3235 lt!220038 #b00000000000000000000000000000000)))

(declare-fun lt!220037 () Unit!14236)

(assert (=> b!487483 (= lt!220037 lt!220039)))

(declare-fun res!290833 () Bool)

(assert (=> b!487483 (= res!290833 (= (seekEntryOrOpen!0 (select (arr!15178 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3645 #b00000000000000000000000000000000)))))

(assert (=> b!487483 (=> (not res!290833) (not e!286816))))

(declare-fun b!487484 () Bool)

(assert (=> b!487484 (= e!286816 call!31289)))

(assert (= (and d!77655 (not res!290834)) b!487481))

(assert (= (and b!487481 c!58592) b!487483))

(assert (= (and b!487481 (not c!58592)) b!487482))

(assert (= (and b!487483 res!290833) b!487484))

(assert (= (or b!487484 b!487482) bm!31286))

(declare-fun m!467301 () Bool)

(assert (=> bm!31286 m!467301))

(declare-fun m!467303 () Bool)

(assert (=> b!487481 m!467303))

(assert (=> b!487481 m!467303))

(declare-fun m!467305 () Bool)

(assert (=> b!487481 m!467305))

(assert (=> b!487483 m!467303))

(declare-fun m!467307 () Bool)

(assert (=> b!487483 m!467307))

(declare-fun m!467309 () Bool)

(assert (=> b!487483 m!467309))

(assert (=> b!487483 m!467303))

(declare-fun m!467311 () Bool)

(assert (=> b!487483 m!467311))

(assert (=> b!487400 d!77655))

(declare-fun d!77657 () Bool)

(declare-fun res!290839 () Bool)

(declare-fun e!286835 () Bool)

(assert (=> d!77657 (=> res!290839 e!286835)))

(assert (=> d!77657 (= res!290839 (= (select (arr!15178 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!77657 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!286835)))

(declare-fun b!487513 () Bool)

(declare-fun e!286836 () Bool)

(assert (=> b!487513 (= e!286835 e!286836)))

(declare-fun res!290840 () Bool)

(assert (=> b!487513 (=> (not res!290840) (not e!286836))))

(assert (=> b!487513 (= res!290840 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15542 a!3235)))))

(declare-fun b!487514 () Bool)

(assert (=> b!487514 (= e!286836 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77657 (not res!290839)) b!487513))

(assert (= (and b!487513 res!290840) b!487514))

(assert (=> d!77657 m!467303))

(declare-fun m!467313 () Bool)

(assert (=> b!487514 m!467313))

(assert (=> b!487405 d!77657))

(declare-fun b!487541 () Bool)

(declare-fun e!286857 () Bool)

(declare-fun call!31292 () Bool)

(assert (=> b!487541 (= e!286857 call!31292)))

(declare-fun b!487542 () Bool)

(declare-fun e!286856 () Bool)

(assert (=> b!487542 (= e!286856 e!286857)))

(declare-fun c!58613 () Bool)

(assert (=> b!487542 (= c!58613 (validKeyInArray!0 (select (arr!15178 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31289 () Bool)

(assert (=> bm!31289 (= call!31292 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58613 (Cons!9332 (select (arr!15178 a!3235) #b00000000000000000000000000000000) Nil!9333) Nil!9333)))))

(declare-fun b!487543 () Bool)

(declare-fun e!286855 () Bool)

(declare-fun contains!2700 (List!9336 (_ BitVec 64)) Bool)

(assert (=> b!487543 (= e!286855 (contains!2700 Nil!9333 (select (arr!15178 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!77659 () Bool)

(declare-fun res!290853 () Bool)

(declare-fun e!286858 () Bool)

(assert (=> d!77659 (=> res!290853 e!286858)))

(assert (=> d!77659 (= res!290853 (bvsge #b00000000000000000000000000000000 (size!15542 a!3235)))))

(assert (=> d!77659 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9333) e!286858)))

(declare-fun b!487544 () Bool)

(assert (=> b!487544 (= e!286857 call!31292)))

(declare-fun b!487545 () Bool)

(assert (=> b!487545 (= e!286858 e!286856)))

(declare-fun res!290852 () Bool)

(assert (=> b!487545 (=> (not res!290852) (not e!286856))))

(assert (=> b!487545 (= res!290852 (not e!286855))))

(declare-fun res!290851 () Bool)

(assert (=> b!487545 (=> (not res!290851) (not e!286855))))

(assert (=> b!487545 (= res!290851 (validKeyInArray!0 (select (arr!15178 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!77659 (not res!290853)) b!487545))

(assert (= (and b!487545 res!290851) b!487543))

(assert (= (and b!487545 res!290852) b!487542))

(assert (= (and b!487542 c!58613) b!487541))

(assert (= (and b!487542 (not c!58613)) b!487544))

(assert (= (or b!487541 b!487544) bm!31289))

(assert (=> b!487542 m!467303))

(assert (=> b!487542 m!467303))

(assert (=> b!487542 m!467305))

(assert (=> bm!31289 m!467303))

(declare-fun m!467343 () Bool)

(assert (=> bm!31289 m!467343))

(assert (=> b!487543 m!467303))

(assert (=> b!487543 m!467303))

(declare-fun m!467345 () Bool)

(assert (=> b!487543 m!467345))

(assert (=> b!487545 m!467303))

(assert (=> b!487545 m!467303))

(assert (=> b!487545 m!467305))

(assert (=> b!487402 d!77659))

(declare-fun call!31293 () Bool)

(declare-fun bm!31290 () Bool)

(assert (=> bm!31290 (= call!31293 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!487548 () Bool)

(declare-fun e!286862 () Bool)

(declare-fun e!286863 () Bool)

(assert (=> b!487548 (= e!286862 e!286863)))

(declare-fun c!58614 () Bool)

(assert (=> b!487548 (= c!58614 (validKeyInArray!0 (select (arr!15178 a!3235) j!176)))))

(declare-fun d!77667 () Bool)

(declare-fun res!290857 () Bool)

(assert (=> d!77667 (=> res!290857 e!286862)))

(assert (=> d!77667 (= res!290857 (bvsge j!176 (size!15542 a!3235)))))

(assert (=> d!77667 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!286862)))

(declare-fun b!487549 () Bool)

(assert (=> b!487549 (= e!286863 call!31293)))

(declare-fun b!487550 () Bool)

(declare-fun e!286861 () Bool)

(assert (=> b!487550 (= e!286863 e!286861)))

(declare-fun lt!220059 () (_ BitVec 64))

(assert (=> b!487550 (= lt!220059 (select (arr!15178 a!3235) j!176))))

(declare-fun lt!220060 () Unit!14236)

(assert (=> b!487550 (= lt!220060 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!220059 j!176))))

(assert (=> b!487550 (arrayContainsKey!0 a!3235 lt!220059 #b00000000000000000000000000000000)))

(declare-fun lt!220058 () Unit!14236)

(assert (=> b!487550 (= lt!220058 lt!220060)))

(declare-fun res!290856 () Bool)

(assert (=> b!487550 (= res!290856 (= (seekEntryOrOpen!0 (select (arr!15178 a!3235) j!176) a!3235 mask!3524) (Found!3645 j!176)))))

(assert (=> b!487550 (=> (not res!290856) (not e!286861))))

(declare-fun b!487551 () Bool)

(assert (=> b!487551 (= e!286861 call!31293)))

(assert (= (and d!77667 (not res!290857)) b!487548))

(assert (= (and b!487548 c!58614) b!487550))

(assert (= (and b!487548 (not c!58614)) b!487549))

(assert (= (and b!487550 res!290856) b!487551))

(assert (= (or b!487551 b!487549) bm!31290))

(declare-fun m!467349 () Bool)

(assert (=> bm!31290 m!467349))

(assert (=> b!487548 m!467221))

(assert (=> b!487548 m!467221))

(assert (=> b!487548 m!467229))

(assert (=> b!487550 m!467221))

(declare-fun m!467351 () Bool)

(assert (=> b!487550 m!467351))

(declare-fun m!467353 () Bool)

(assert (=> b!487550 m!467353))

(assert (=> b!487550 m!467221))

(assert (=> b!487550 m!467223))

(assert (=> b!487401 d!77667))

(declare-fun d!77669 () Bool)

(assert (=> d!77669 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!220069 () Unit!14236)

(declare-fun choose!38 (array!31569 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14236)

(assert (=> d!77669 (= lt!220069 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!77669 (validMask!0 mask!3524)))

(assert (=> d!77669 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!220069)))

(declare-fun bs!15538 () Bool)

(assert (= bs!15538 d!77669))

(assert (=> bs!15538 m!467225))

(declare-fun m!467355 () Bool)

(assert (=> bs!15538 m!467355))

(assert (=> bs!15538 m!467237))

(assert (=> b!487401 d!77669))

(check-sat (not bm!31289) (not bm!31286) (not b!487545) (not b!487543) (not d!77651) (not d!77641) (not b!487550) (not bm!31290) (not b!487483) (not b!487462) (not b!487548) (not b!487481) (not b!487468) (not b!487514) (not b!487542) (not d!77669))
(check-sat)
