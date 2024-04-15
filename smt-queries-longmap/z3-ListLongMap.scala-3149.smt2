; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44304 () Bool)

(assert start!44304)

(declare-fun b!487100 () Bool)

(declare-fun res!290628 () Bool)

(declare-fun e!286587 () Bool)

(assert (=> b!487100 (=> (not res!290628) (not e!286587))))

(declare-datatypes ((array!31565 0))(
  ( (array!31566 (arr!15176 (Array (_ BitVec 32) (_ BitVec 64))) (size!15541 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31565)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487100 (= res!290628 (validKeyInArray!0 (select (arr!15176 a!3235) j!176)))))

(declare-fun b!487101 () Bool)

(declare-fun res!290636 () Bool)

(declare-fun e!286585 () Bool)

(assert (=> b!487101 (=> (not res!290636) (not e!286585))))

(declare-datatypes ((List!9373 0))(
  ( (Nil!9370) (Cons!9369 (h!10225 (_ BitVec 64)) (t!15592 List!9373)) )
))
(declare-fun arrayNoDuplicates!0 (array!31565 (_ BitVec 32) List!9373) Bool)

(assert (=> b!487101 (= res!290636 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9370))))

(declare-fun res!290635 () Bool)

(assert (=> start!44304 (=> (not res!290635) (not e!286587))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44304 (= res!290635 (validMask!0 mask!3524))))

(assert (=> start!44304 e!286587))

(assert (=> start!44304 true))

(declare-fun array_inv!11059 (array!31565) Bool)

(assert (=> start!44304 (array_inv!11059 a!3235)))

(declare-fun b!487102 () Bool)

(declare-fun res!290630 () Bool)

(assert (=> b!487102 (=> (not res!290630) (not e!286587))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!487102 (= res!290630 (validKeyInArray!0 k0!2280))))

(declare-fun b!487103 () Bool)

(declare-fun res!290633 () Bool)

(assert (=> b!487103 (=> (not res!290633) (not e!286587))))

(declare-fun arrayContainsKey!0 (array!31565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487103 (= res!290633 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487104 () Bool)

(declare-fun res!290632 () Bool)

(assert (=> b!487104 (=> (not res!290632) (not e!286587))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487104 (= res!290632 (and (= (size!15541 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15541 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15541 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!286584 () Bool)

(declare-fun b!487105 () Bool)

(declare-datatypes ((SeekEntryResult!3640 0))(
  ( (MissingZero!3640 (index!16739 (_ BitVec 32))) (Found!3640 (index!16740 (_ BitVec 32))) (Intermediate!3640 (undefined!4452 Bool) (index!16741 (_ BitVec 32)) (x!45871 (_ BitVec 32))) (Undefined!3640) (MissingVacant!3640 (index!16742 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31565 (_ BitVec 32)) SeekEntryResult!3640)

(assert (=> b!487105 (= e!286584 (= (seekEntryOrOpen!0 (select (arr!15176 a!3235) j!176) a!3235 mask!3524) (Found!3640 j!176)))))

(declare-fun b!487106 () Bool)

(assert (=> b!487106 (= e!286587 e!286585)))

(declare-fun res!290631 () Bool)

(assert (=> b!487106 (=> (not res!290631) (not e!286585))))

(declare-fun lt!219772 () SeekEntryResult!3640)

(assert (=> b!487106 (= res!290631 (or (= lt!219772 (MissingZero!3640 i!1204)) (= lt!219772 (MissingVacant!3640 i!1204))))))

(assert (=> b!487106 (= lt!219772 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!487107 () Bool)

(declare-fun res!290634 () Bool)

(assert (=> b!487107 (=> (not res!290634) (not e!286585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31565 (_ BitVec 32)) Bool)

(assert (=> b!487107 (= res!290634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487108 () Bool)

(assert (=> b!487108 (= e!286585 (not (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111))))))

(assert (=> b!487108 e!286584))

(declare-fun res!290629 () Bool)

(assert (=> b!487108 (=> (not res!290629) (not e!286584))))

(assert (=> b!487108 (= res!290629 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14212 0))(
  ( (Unit!14213) )
))
(declare-fun lt!219771 () Unit!14212)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14212)

(assert (=> b!487108 (= lt!219771 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44304 res!290635) b!487104))

(assert (= (and b!487104 res!290632) b!487100))

(assert (= (and b!487100 res!290628) b!487102))

(assert (= (and b!487102 res!290630) b!487103))

(assert (= (and b!487103 res!290633) b!487106))

(assert (= (and b!487106 res!290631) b!487107))

(assert (= (and b!487107 res!290634) b!487101))

(assert (= (and b!487101 res!290636) b!487108))

(assert (= (and b!487108 res!290629) b!487105))

(declare-fun m!466441 () Bool)

(assert (=> b!487107 m!466441))

(declare-fun m!466443 () Bool)

(assert (=> b!487108 m!466443))

(declare-fun m!466445 () Bool)

(assert (=> b!487108 m!466445))

(declare-fun m!466447 () Bool)

(assert (=> b!487101 m!466447))

(declare-fun m!466449 () Bool)

(assert (=> b!487106 m!466449))

(declare-fun m!466451 () Bool)

(assert (=> b!487105 m!466451))

(assert (=> b!487105 m!466451))

(declare-fun m!466453 () Bool)

(assert (=> b!487105 m!466453))

(declare-fun m!466455 () Bool)

(assert (=> b!487103 m!466455))

(declare-fun m!466457 () Bool)

(assert (=> start!44304 m!466457))

(declare-fun m!466459 () Bool)

(assert (=> start!44304 m!466459))

(declare-fun m!466461 () Bool)

(assert (=> b!487102 m!466461))

(assert (=> b!487100 m!466451))

(assert (=> b!487100 m!466451))

(declare-fun m!466463 () Bool)

(assert (=> b!487100 m!466463))

(check-sat (not b!487102) (not b!487106) (not b!487100) (not b!487105) (not b!487103) (not b!487108) (not start!44304) (not b!487107) (not b!487101))
(check-sat)
(get-model)

(declare-fun b!487171 () Bool)

(declare-fun e!286618 () Bool)

(declare-fun call!31261 () Bool)

(assert (=> b!487171 (= e!286618 call!31261)))

(declare-fun d!77429 () Bool)

(declare-fun res!290696 () Bool)

(declare-fun e!286619 () Bool)

(assert (=> d!77429 (=> res!290696 e!286619)))

(assert (=> d!77429 (= res!290696 (bvsge j!176 (size!15541 a!3235)))))

(assert (=> d!77429 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!286619)))

(declare-fun b!487172 () Bool)

(assert (=> b!487172 (= e!286619 e!286618)))

(declare-fun c!58506 () Bool)

(assert (=> b!487172 (= c!58506 (validKeyInArray!0 (select (arr!15176 a!3235) j!176)))))

(declare-fun bm!31258 () Bool)

(assert (=> bm!31258 (= call!31261 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!487173 () Bool)

(declare-fun e!286620 () Bool)

(assert (=> b!487173 (= e!286620 call!31261)))

(declare-fun b!487174 () Bool)

(assert (=> b!487174 (= e!286618 e!286620)))

(declare-fun lt!219792 () (_ BitVec 64))

(assert (=> b!487174 (= lt!219792 (select (arr!15176 a!3235) j!176))))

(declare-fun lt!219793 () Unit!14212)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31565 (_ BitVec 64) (_ BitVec 32)) Unit!14212)

(assert (=> b!487174 (= lt!219793 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!219792 j!176))))

(assert (=> b!487174 (arrayContainsKey!0 a!3235 lt!219792 #b00000000000000000000000000000000)))

(declare-fun lt!219791 () Unit!14212)

(assert (=> b!487174 (= lt!219791 lt!219793)))

(declare-fun res!290695 () Bool)

(assert (=> b!487174 (= res!290695 (= (seekEntryOrOpen!0 (select (arr!15176 a!3235) j!176) a!3235 mask!3524) (Found!3640 j!176)))))

(assert (=> b!487174 (=> (not res!290695) (not e!286620))))

(assert (= (and d!77429 (not res!290696)) b!487172))

(assert (= (and b!487172 c!58506) b!487174))

(assert (= (and b!487172 (not c!58506)) b!487171))

(assert (= (and b!487174 res!290695) b!487173))

(assert (= (or b!487173 b!487171) bm!31258))

(assert (=> b!487172 m!466451))

(assert (=> b!487172 m!466451))

(assert (=> b!487172 m!466463))

(declare-fun m!466513 () Bool)

(assert (=> bm!31258 m!466513))

(assert (=> b!487174 m!466451))

(declare-fun m!466515 () Bool)

(assert (=> b!487174 m!466515))

(declare-fun m!466517 () Bool)

(assert (=> b!487174 m!466517))

(assert (=> b!487174 m!466451))

(assert (=> b!487174 m!466453))

(assert (=> b!487108 d!77429))

(declare-fun d!77431 () Bool)

(assert (=> d!77431 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!219796 () Unit!14212)

(declare-fun choose!38 (array!31565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14212)

(assert (=> d!77431 (= lt!219796 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!77431 (validMask!0 mask!3524)))

(assert (=> d!77431 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!219796)))

(declare-fun bs!15508 () Bool)

(assert (= bs!15508 d!77431))

(assert (=> bs!15508 m!466443))

(declare-fun m!466523 () Bool)

(assert (=> bs!15508 m!466523))

(assert (=> bs!15508 m!466457))

(assert (=> b!487108 d!77431))

(declare-fun d!77439 () Bool)

(declare-fun res!290707 () Bool)

(declare-fun e!286631 () Bool)

(assert (=> d!77439 (=> res!290707 e!286631)))

(assert (=> d!77439 (= res!290707 (= (select (arr!15176 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!77439 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!286631)))

(declare-fun b!487185 () Bool)

(declare-fun e!286632 () Bool)

(assert (=> b!487185 (= e!286631 e!286632)))

(declare-fun res!290708 () Bool)

(assert (=> b!487185 (=> (not res!290708) (not e!286632))))

(assert (=> b!487185 (= res!290708 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15541 a!3235)))))

(declare-fun b!487186 () Bool)

(assert (=> b!487186 (= e!286632 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77439 (not res!290707)) b!487185))

(assert (= (and b!487185 res!290708) b!487186))

(declare-fun m!466525 () Bool)

(assert (=> d!77439 m!466525))

(declare-fun m!466527 () Bool)

(assert (=> b!487186 m!466527))

(assert (=> b!487103 d!77439))

(declare-fun b!487209 () Bool)

(declare-fun e!286650 () Bool)

(declare-fun e!286651 () Bool)

(assert (=> b!487209 (= e!286650 e!286651)))

(declare-fun res!290722 () Bool)

(assert (=> b!487209 (=> (not res!290722) (not e!286651))))

(declare-fun e!286653 () Bool)

(assert (=> b!487209 (= res!290722 (not e!286653))))

(declare-fun res!290721 () Bool)

(assert (=> b!487209 (=> (not res!290721) (not e!286653))))

(assert (=> b!487209 (= res!290721 (validKeyInArray!0 (select (arr!15176 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!487210 () Bool)

(declare-fun e!286652 () Bool)

(declare-fun call!31267 () Bool)

(assert (=> b!487210 (= e!286652 call!31267)))

(declare-fun b!487211 () Bool)

(assert (=> b!487211 (= e!286651 e!286652)))

(declare-fun c!58512 () Bool)

(assert (=> b!487211 (= c!58512 (validKeyInArray!0 (select (arr!15176 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!487212 () Bool)

(declare-fun contains!2682 (List!9373 (_ BitVec 64)) Bool)

(assert (=> b!487212 (= e!286653 (contains!2682 Nil!9370 (select (arr!15176 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31264 () Bool)

(assert (=> bm!31264 (= call!31267 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58512 (Cons!9369 (select (arr!15176 a!3235) #b00000000000000000000000000000000) Nil!9370) Nil!9370)))))

(declare-fun b!487213 () Bool)

(assert (=> b!487213 (= e!286652 call!31267)))

(declare-fun d!77441 () Bool)

(declare-fun res!290723 () Bool)

(assert (=> d!77441 (=> res!290723 e!286650)))

(assert (=> d!77441 (= res!290723 (bvsge #b00000000000000000000000000000000 (size!15541 a!3235)))))

(assert (=> d!77441 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9370) e!286650)))

(assert (= (and d!77441 (not res!290723)) b!487209))

(assert (= (and b!487209 res!290721) b!487212))

(assert (= (and b!487209 res!290722) b!487211))

(assert (= (and b!487211 c!58512) b!487210))

(assert (= (and b!487211 (not c!58512)) b!487213))

(assert (= (or b!487210 b!487213) bm!31264))

(assert (=> b!487209 m!466525))

(assert (=> b!487209 m!466525))

(declare-fun m!466539 () Bool)

(assert (=> b!487209 m!466539))

(assert (=> b!487211 m!466525))

(assert (=> b!487211 m!466525))

(assert (=> b!487211 m!466539))

(assert (=> b!487212 m!466525))

(assert (=> b!487212 m!466525))

(declare-fun m!466541 () Bool)

(assert (=> b!487212 m!466541))

(assert (=> bm!31264 m!466525))

(declare-fun m!466543 () Bool)

(assert (=> bm!31264 m!466543))

(assert (=> b!487101 d!77441))

(declare-fun b!487214 () Bool)

(declare-fun e!286654 () Bool)

(declare-fun call!31268 () Bool)

(assert (=> b!487214 (= e!286654 call!31268)))

(declare-fun d!77445 () Bool)

(declare-fun res!290725 () Bool)

(declare-fun e!286655 () Bool)

(assert (=> d!77445 (=> res!290725 e!286655)))

(assert (=> d!77445 (= res!290725 (bvsge #b00000000000000000000000000000000 (size!15541 a!3235)))))

(assert (=> d!77445 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!286655)))

(declare-fun b!487215 () Bool)

(assert (=> b!487215 (= e!286655 e!286654)))

(declare-fun c!58513 () Bool)

(assert (=> b!487215 (= c!58513 (validKeyInArray!0 (select (arr!15176 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31265 () Bool)

(assert (=> bm!31265 (= call!31268 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!487216 () Bool)

(declare-fun e!286656 () Bool)

(assert (=> b!487216 (= e!286656 call!31268)))

(declare-fun b!487217 () Bool)

(assert (=> b!487217 (= e!286654 e!286656)))

(declare-fun lt!219807 () (_ BitVec 64))

(assert (=> b!487217 (= lt!219807 (select (arr!15176 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!219808 () Unit!14212)

(assert (=> b!487217 (= lt!219808 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!219807 #b00000000000000000000000000000000))))

(assert (=> b!487217 (arrayContainsKey!0 a!3235 lt!219807 #b00000000000000000000000000000000)))

(declare-fun lt!219806 () Unit!14212)

(assert (=> b!487217 (= lt!219806 lt!219808)))

(declare-fun res!290724 () Bool)

(assert (=> b!487217 (= res!290724 (= (seekEntryOrOpen!0 (select (arr!15176 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3640 #b00000000000000000000000000000000)))))

(assert (=> b!487217 (=> (not res!290724) (not e!286656))))

(assert (= (and d!77445 (not res!290725)) b!487215))

(assert (= (and b!487215 c!58513) b!487217))

(assert (= (and b!487215 (not c!58513)) b!487214))

(assert (= (and b!487217 res!290724) b!487216))

(assert (= (or b!487216 b!487214) bm!31265))

(assert (=> b!487215 m!466525))

(assert (=> b!487215 m!466525))

(assert (=> b!487215 m!466539))

(declare-fun m!466545 () Bool)

(assert (=> bm!31265 m!466545))

(assert (=> b!487217 m!466525))

(declare-fun m!466547 () Bool)

(assert (=> b!487217 m!466547))

(declare-fun m!466549 () Bool)

(assert (=> b!487217 m!466549))

(assert (=> b!487217 m!466525))

(declare-fun m!466551 () Bool)

(assert (=> b!487217 m!466551))

(assert (=> b!487107 d!77445))

(declare-fun d!77449 () Bool)

(assert (=> d!77449 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!487102 d!77449))

(declare-fun lt!219842 () SeekEntryResult!3640)

(declare-fun e!286697 () SeekEntryResult!3640)

(declare-fun b!487286 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31565 (_ BitVec 32)) SeekEntryResult!3640)

(assert (=> b!487286 (= e!286697 (seekKeyOrZeroReturnVacant!0 (x!45871 lt!219842) (index!16741 lt!219842) (index!16741 lt!219842) (select (arr!15176 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!487287 () Bool)

(declare-fun e!286696 () SeekEntryResult!3640)

(declare-fun e!286698 () SeekEntryResult!3640)

(assert (=> b!487287 (= e!286696 e!286698)))

(declare-fun lt!219844 () (_ BitVec 64))

(assert (=> b!487287 (= lt!219844 (select (arr!15176 a!3235) (index!16741 lt!219842)))))

(declare-fun c!58543 () Bool)

(assert (=> b!487287 (= c!58543 (= lt!219844 (select (arr!15176 a!3235) j!176)))))

(declare-fun b!487288 () Bool)

(assert (=> b!487288 (= e!286697 (MissingZero!3640 (index!16741 lt!219842)))))

(declare-fun d!77451 () Bool)

(declare-fun lt!219843 () SeekEntryResult!3640)

(get-info :version)

(assert (=> d!77451 (and (or ((_ is Undefined!3640) lt!219843) (not ((_ is Found!3640) lt!219843)) (and (bvsge (index!16740 lt!219843) #b00000000000000000000000000000000) (bvslt (index!16740 lt!219843) (size!15541 a!3235)))) (or ((_ is Undefined!3640) lt!219843) ((_ is Found!3640) lt!219843) (not ((_ is MissingZero!3640) lt!219843)) (and (bvsge (index!16739 lt!219843) #b00000000000000000000000000000000) (bvslt (index!16739 lt!219843) (size!15541 a!3235)))) (or ((_ is Undefined!3640) lt!219843) ((_ is Found!3640) lt!219843) ((_ is MissingZero!3640) lt!219843) (not ((_ is MissingVacant!3640) lt!219843)) (and (bvsge (index!16742 lt!219843) #b00000000000000000000000000000000) (bvslt (index!16742 lt!219843) (size!15541 a!3235)))) (or ((_ is Undefined!3640) lt!219843) (ite ((_ is Found!3640) lt!219843) (= (select (arr!15176 a!3235) (index!16740 lt!219843)) (select (arr!15176 a!3235) j!176)) (ite ((_ is MissingZero!3640) lt!219843) (= (select (arr!15176 a!3235) (index!16739 lt!219843)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3640) lt!219843) (= (select (arr!15176 a!3235) (index!16742 lt!219843)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77451 (= lt!219843 e!286696)))

(declare-fun c!58544 () Bool)

(assert (=> d!77451 (= c!58544 (and ((_ is Intermediate!3640) lt!219842) (undefined!4452 lt!219842)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31565 (_ BitVec 32)) SeekEntryResult!3640)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!77451 (= lt!219842 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15176 a!3235) j!176) mask!3524) (select (arr!15176 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!77451 (validMask!0 mask!3524)))

(assert (=> d!77451 (= (seekEntryOrOpen!0 (select (arr!15176 a!3235) j!176) a!3235 mask!3524) lt!219843)))

(declare-fun b!487289 () Bool)

(declare-fun c!58545 () Bool)

(assert (=> b!487289 (= c!58545 (= lt!219844 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!487289 (= e!286698 e!286697)))

(declare-fun b!487290 () Bool)

(assert (=> b!487290 (= e!286698 (Found!3640 (index!16741 lt!219842)))))

(declare-fun b!487291 () Bool)

(assert (=> b!487291 (= e!286696 Undefined!3640)))

(assert (= (and d!77451 c!58544) b!487291))

(assert (= (and d!77451 (not c!58544)) b!487287))

(assert (= (and b!487287 c!58543) b!487290))

(assert (= (and b!487287 (not c!58543)) b!487289))

(assert (= (and b!487289 c!58545) b!487288))

(assert (= (and b!487289 (not c!58545)) b!487286))

(assert (=> b!487286 m!466451))

(declare-fun m!466599 () Bool)

(assert (=> b!487286 m!466599))

(declare-fun m!466601 () Bool)

(assert (=> b!487287 m!466601))

(assert (=> d!77451 m!466457))

(declare-fun m!466603 () Bool)

(assert (=> d!77451 m!466603))

(declare-fun m!466605 () Bool)

(assert (=> d!77451 m!466605))

(assert (=> d!77451 m!466451))

(declare-fun m!466609 () Bool)

(assert (=> d!77451 m!466609))

(assert (=> d!77451 m!466451))

(assert (=> d!77451 m!466605))

(declare-fun m!466613 () Bool)

(assert (=> d!77451 m!466613))

(declare-fun m!466617 () Bool)

(assert (=> d!77451 m!466617))

(assert (=> b!487105 d!77451))

(declare-fun d!77465 () Bool)

(assert (=> d!77465 (= (validKeyInArray!0 (select (arr!15176 a!3235) j!176)) (and (not (= (select (arr!15176 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15176 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!487100 d!77465))

(declare-fun d!77469 () Bool)

(assert (=> d!77469 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44304 d!77469))

(declare-fun d!77481 () Bool)

(assert (=> d!77481 (= (array_inv!11059 a!3235) (bvsge (size!15541 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44304 d!77481))

(declare-fun e!286720 () SeekEntryResult!3640)

(declare-fun lt!219863 () SeekEntryResult!3640)

(declare-fun b!487320 () Bool)

(assert (=> b!487320 (= e!286720 (seekKeyOrZeroReturnVacant!0 (x!45871 lt!219863) (index!16741 lt!219863) (index!16741 lt!219863) k0!2280 a!3235 mask!3524))))

(declare-fun b!487321 () Bool)

(declare-fun e!286719 () SeekEntryResult!3640)

(declare-fun e!286721 () SeekEntryResult!3640)

(assert (=> b!487321 (= e!286719 e!286721)))

(declare-fun lt!219865 () (_ BitVec 64))

(assert (=> b!487321 (= lt!219865 (select (arr!15176 a!3235) (index!16741 lt!219863)))))

(declare-fun c!58554 () Bool)

(assert (=> b!487321 (= c!58554 (= lt!219865 k0!2280))))

(declare-fun b!487322 () Bool)

(assert (=> b!487322 (= e!286720 (MissingZero!3640 (index!16741 lt!219863)))))

(declare-fun d!77483 () Bool)

(declare-fun lt!219864 () SeekEntryResult!3640)

(assert (=> d!77483 (and (or ((_ is Undefined!3640) lt!219864) (not ((_ is Found!3640) lt!219864)) (and (bvsge (index!16740 lt!219864) #b00000000000000000000000000000000) (bvslt (index!16740 lt!219864) (size!15541 a!3235)))) (or ((_ is Undefined!3640) lt!219864) ((_ is Found!3640) lt!219864) (not ((_ is MissingZero!3640) lt!219864)) (and (bvsge (index!16739 lt!219864) #b00000000000000000000000000000000) (bvslt (index!16739 lt!219864) (size!15541 a!3235)))) (or ((_ is Undefined!3640) lt!219864) ((_ is Found!3640) lt!219864) ((_ is MissingZero!3640) lt!219864) (not ((_ is MissingVacant!3640) lt!219864)) (and (bvsge (index!16742 lt!219864) #b00000000000000000000000000000000) (bvslt (index!16742 lt!219864) (size!15541 a!3235)))) (or ((_ is Undefined!3640) lt!219864) (ite ((_ is Found!3640) lt!219864) (= (select (arr!15176 a!3235) (index!16740 lt!219864)) k0!2280) (ite ((_ is MissingZero!3640) lt!219864) (= (select (arr!15176 a!3235) (index!16739 lt!219864)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3640) lt!219864) (= (select (arr!15176 a!3235) (index!16742 lt!219864)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77483 (= lt!219864 e!286719)))

(declare-fun c!58555 () Bool)

(assert (=> d!77483 (= c!58555 (and ((_ is Intermediate!3640) lt!219863) (undefined!4452 lt!219863)))))

(assert (=> d!77483 (= lt!219863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!77483 (validMask!0 mask!3524)))

(assert (=> d!77483 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!219864)))

(declare-fun b!487323 () Bool)

(declare-fun c!58556 () Bool)

(assert (=> b!487323 (= c!58556 (= lt!219865 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!487323 (= e!286721 e!286720)))

(declare-fun b!487324 () Bool)

(assert (=> b!487324 (= e!286721 (Found!3640 (index!16741 lt!219863)))))

(declare-fun b!487325 () Bool)

(assert (=> b!487325 (= e!286719 Undefined!3640)))

(assert (= (and d!77483 c!58555) b!487325))

(assert (= (and d!77483 (not c!58555)) b!487321))

(assert (= (and b!487321 c!58554) b!487324))

(assert (= (and b!487321 (not c!58554)) b!487323))

(assert (= (and b!487323 c!58556) b!487322))

(assert (= (and b!487323 (not c!58556)) b!487320))

(declare-fun m!466653 () Bool)

(assert (=> b!487320 m!466653))

(declare-fun m!466655 () Bool)

(assert (=> b!487321 m!466655))

(assert (=> d!77483 m!466457))

(declare-fun m!466657 () Bool)

(assert (=> d!77483 m!466657))

(declare-fun m!466659 () Bool)

(assert (=> d!77483 m!466659))

(declare-fun m!466661 () Bool)

(assert (=> d!77483 m!466661))

(assert (=> d!77483 m!466659))

(declare-fun m!466663 () Bool)

(assert (=> d!77483 m!466663))

(declare-fun m!466665 () Bool)

(assert (=> d!77483 m!466665))

(assert (=> b!487106 d!77483))

(check-sat (not d!77451) (not b!487212) (not bm!31258) (not b!487209) (not b!487211) (not b!487217) (not bm!31265) (not d!77483) (not b!487215) (not b!487172) (not b!487186) (not d!77431) (not bm!31264) (not b!487286) (not b!487320) (not b!487174))
(check-sat)
