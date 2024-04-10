; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47006 () Bool)

(assert start!47006)

(declare-fun b!518390 () Bool)

(declare-fun e!302463 () Bool)

(assert (=> b!518390 (= e!302463 false)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!518391 () Bool)

(declare-datatypes ((array!33147 0))(
  ( (array!33148 (arr!15937 (Array (_ BitVec 32) (_ BitVec 64))) (size!16301 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33147)

(declare-fun e!302460 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4404 0))(
  ( (MissingZero!4404 (index!19804 (_ BitVec 32))) (Found!4404 (index!19805 (_ BitVec 32))) (Intermediate!4404 (undefined!5216 Bool) (index!19806 (_ BitVec 32)) (x!48769 (_ BitVec 32))) (Undefined!4404) (MissingVacant!4404 (index!19807 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33147 (_ BitVec 32)) SeekEntryResult!4404)

(assert (=> b!518391 (= e!302460 (= (seekEntryOrOpen!0 (select (arr!15937 a!3235) j!176) a!3235 mask!3524) (Found!4404 j!176)))))

(declare-fun b!518392 () Bool)

(declare-datatypes ((Unit!16068 0))(
  ( (Unit!16069) )
))
(declare-fun e!302458 () Unit!16068)

(declare-fun Unit!16070 () Unit!16068)

(assert (=> b!518392 (= e!302458 Unit!16070)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!237332 () Unit!16068)

(declare-fun lt!237336 () (_ BitVec 32))

(declare-fun lt!237335 () SeekEntryResult!4404)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33147 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16068)

(assert (=> b!518392 (= lt!237332 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237336 #b00000000000000000000000000000000 (index!19806 lt!237335) (x!48769 lt!237335) mask!3524))))

(declare-fun lt!237331 () array!33147)

(declare-fun lt!237337 () (_ BitVec 64))

(declare-fun res!317402 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33147 (_ BitVec 32)) SeekEntryResult!4404)

(assert (=> b!518392 (= res!317402 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237336 lt!237337 lt!237331 mask!3524) (Intermediate!4404 false (index!19806 lt!237335) (x!48769 lt!237335))))))

(assert (=> b!518392 (=> (not res!317402) (not e!302463))))

(assert (=> b!518392 e!302463))

(declare-fun b!518393 () Bool)

(declare-fun res!317399 () Bool)

(declare-fun e!302462 () Bool)

(assert (=> b!518393 (=> (not res!317399) (not e!302462))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!518393 (= res!317399 (validKeyInArray!0 k0!2280))))

(declare-fun b!518394 () Bool)

(declare-fun Unit!16071 () Unit!16068)

(assert (=> b!518394 (= e!302458 Unit!16071)))

(declare-fun b!518395 () Bool)

(declare-fun res!317400 () Bool)

(assert (=> b!518395 (=> (not res!317400) (not e!302462))))

(declare-fun arrayContainsKey!0 (array!33147 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!518395 (= res!317400 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!518396 () Bool)

(declare-fun e!302457 () Bool)

(assert (=> b!518396 (= e!302457 (and (bvsge (index!19806 lt!237335) #b00000000000000000000000000000000) (bvslt (index!19806 lt!237335) (size!16301 a!3235))))))

(declare-fun lt!237334 () Unit!16068)

(assert (=> b!518396 (= lt!237334 e!302458)))

(declare-fun c!60791 () Bool)

(assert (=> b!518396 (= c!60791 (= (select (arr!15937 a!3235) (index!19806 lt!237335)) (select (arr!15937 a!3235) j!176)))))

(assert (=> b!518396 (and (bvslt (x!48769 lt!237335) #b01111111111111111111111111111110) (or (= (select (arr!15937 a!3235) (index!19806 lt!237335)) (select (arr!15937 a!3235) j!176)) (= (select (arr!15937 a!3235) (index!19806 lt!237335)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15937 a!3235) (index!19806 lt!237335)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518397 () Bool)

(declare-fun res!317405 () Bool)

(declare-fun e!302461 () Bool)

(assert (=> b!518397 (=> (not res!317405) (not e!302461))))

(declare-datatypes ((List!10095 0))(
  ( (Nil!10092) (Cons!10091 (h!10998 (_ BitVec 64)) (t!16323 List!10095)) )
))
(declare-fun arrayNoDuplicates!0 (array!33147 (_ BitVec 32) List!10095) Bool)

(assert (=> b!518397 (= res!317405 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10092))))

(declare-fun b!518398 () Bool)

(declare-fun res!317398 () Bool)

(assert (=> b!518398 (=> (not res!317398) (not e!302462))))

(assert (=> b!518398 (= res!317398 (and (= (size!16301 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16301 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16301 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!518399 () Bool)

(assert (=> b!518399 (= e!302461 (not e!302457))))

(declare-fun res!317397 () Bool)

(assert (=> b!518399 (=> res!317397 e!302457)))

(declare-fun lt!237333 () (_ BitVec 32))

(assert (=> b!518399 (= res!317397 (= lt!237335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237333 lt!237337 lt!237331 mask!3524)))))

(assert (=> b!518399 (= lt!237335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237336 (select (arr!15937 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518399 (= lt!237333 (toIndex!0 lt!237337 mask!3524))))

(assert (=> b!518399 (= lt!237337 (select (store (arr!15937 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!518399 (= lt!237336 (toIndex!0 (select (arr!15937 a!3235) j!176) mask!3524))))

(assert (=> b!518399 (= lt!237331 (array!33148 (store (arr!15937 a!3235) i!1204 k0!2280) (size!16301 a!3235)))))

(assert (=> b!518399 e!302460))

(declare-fun res!317403 () Bool)

(assert (=> b!518399 (=> (not res!317403) (not e!302460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33147 (_ BitVec 32)) Bool)

(assert (=> b!518399 (= res!317403 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!237330 () Unit!16068)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33147 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16068)

(assert (=> b!518399 (= lt!237330 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!518400 () Bool)

(assert (=> b!518400 (= e!302462 e!302461)))

(declare-fun res!317395 () Bool)

(assert (=> b!518400 (=> (not res!317395) (not e!302461))))

(declare-fun lt!237329 () SeekEntryResult!4404)

(assert (=> b!518400 (= res!317395 (or (= lt!237329 (MissingZero!4404 i!1204)) (= lt!237329 (MissingVacant!4404 i!1204))))))

(assert (=> b!518400 (= lt!237329 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!518389 () Bool)

(declare-fun res!317396 () Bool)

(assert (=> b!518389 (=> res!317396 e!302457)))

(get-info :version)

(assert (=> b!518389 (= res!317396 (or (undefined!5216 lt!237335) (not ((_ is Intermediate!4404) lt!237335))))))

(declare-fun res!317401 () Bool)

(assert (=> start!47006 (=> (not res!317401) (not e!302462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47006 (= res!317401 (validMask!0 mask!3524))))

(assert (=> start!47006 e!302462))

(assert (=> start!47006 true))

(declare-fun array_inv!11733 (array!33147) Bool)

(assert (=> start!47006 (array_inv!11733 a!3235)))

(declare-fun b!518401 () Bool)

(declare-fun res!317394 () Bool)

(assert (=> b!518401 (=> (not res!317394) (not e!302461))))

(assert (=> b!518401 (= res!317394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!518402 () Bool)

(declare-fun res!317404 () Bool)

(assert (=> b!518402 (=> (not res!317404) (not e!302462))))

(assert (=> b!518402 (= res!317404 (validKeyInArray!0 (select (arr!15937 a!3235) j!176)))))

(assert (= (and start!47006 res!317401) b!518398))

(assert (= (and b!518398 res!317398) b!518402))

(assert (= (and b!518402 res!317404) b!518393))

(assert (= (and b!518393 res!317399) b!518395))

(assert (= (and b!518395 res!317400) b!518400))

(assert (= (and b!518400 res!317395) b!518401))

(assert (= (and b!518401 res!317394) b!518397))

(assert (= (and b!518397 res!317405) b!518399))

(assert (= (and b!518399 res!317403) b!518391))

(assert (= (and b!518399 (not res!317397)) b!518389))

(assert (= (and b!518389 (not res!317396)) b!518396))

(assert (= (and b!518396 c!60791) b!518392))

(assert (= (and b!518396 (not c!60791)) b!518394))

(assert (= (and b!518392 res!317402) b!518390))

(declare-fun m!499767 () Bool)

(assert (=> b!518397 m!499767))

(declare-fun m!499769 () Bool)

(assert (=> b!518402 m!499769))

(assert (=> b!518402 m!499769))

(declare-fun m!499771 () Bool)

(assert (=> b!518402 m!499771))

(declare-fun m!499773 () Bool)

(assert (=> b!518392 m!499773))

(declare-fun m!499775 () Bool)

(assert (=> b!518392 m!499775))

(declare-fun m!499777 () Bool)

(assert (=> b!518399 m!499777))

(declare-fun m!499779 () Bool)

(assert (=> b!518399 m!499779))

(declare-fun m!499781 () Bool)

(assert (=> b!518399 m!499781))

(declare-fun m!499783 () Bool)

(assert (=> b!518399 m!499783))

(assert (=> b!518399 m!499769))

(declare-fun m!499785 () Bool)

(assert (=> b!518399 m!499785))

(assert (=> b!518399 m!499769))

(declare-fun m!499787 () Bool)

(assert (=> b!518399 m!499787))

(assert (=> b!518399 m!499769))

(declare-fun m!499789 () Bool)

(assert (=> b!518399 m!499789))

(declare-fun m!499791 () Bool)

(assert (=> b!518399 m!499791))

(declare-fun m!499793 () Bool)

(assert (=> start!47006 m!499793))

(declare-fun m!499795 () Bool)

(assert (=> start!47006 m!499795))

(declare-fun m!499797 () Bool)

(assert (=> b!518396 m!499797))

(assert (=> b!518396 m!499769))

(declare-fun m!499799 () Bool)

(assert (=> b!518400 m!499799))

(declare-fun m!499801 () Bool)

(assert (=> b!518393 m!499801))

(declare-fun m!499803 () Bool)

(assert (=> b!518395 m!499803))

(declare-fun m!499805 () Bool)

(assert (=> b!518401 m!499805))

(assert (=> b!518391 m!499769))

(assert (=> b!518391 m!499769))

(declare-fun m!499807 () Bool)

(assert (=> b!518391 m!499807))

(check-sat (not b!518399) (not b!518395) (not b!518393) (not b!518401) (not b!518397) (not b!518392) (not b!518402) (not start!47006) (not b!518391) (not b!518400))
(check-sat)
(get-model)

(declare-fun d!79861 () Bool)

(assert (=> d!79861 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47006 d!79861))

(declare-fun d!79863 () Bool)

(assert (=> d!79863 (= (array_inv!11733 a!3235) (bvsge (size!16301 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47006 d!79863))

(declare-fun d!79865 () Bool)

(declare-fun res!317446 () Bool)

(declare-fun e!302489 () Bool)

(assert (=> d!79865 (=> res!317446 e!302489)))

(assert (=> d!79865 (= res!317446 (= (select (arr!15937 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79865 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!302489)))

(declare-fun b!518449 () Bool)

(declare-fun e!302490 () Bool)

(assert (=> b!518449 (= e!302489 e!302490)))

(declare-fun res!317447 () Bool)

(assert (=> b!518449 (=> (not res!317447) (not e!302490))))

(assert (=> b!518449 (= res!317447 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16301 a!3235)))))

(declare-fun b!518450 () Bool)

(assert (=> b!518450 (= e!302490 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79865 (not res!317446)) b!518449))

(assert (= (and b!518449 res!317447) b!518450))

(declare-fun m!499851 () Bool)

(assert (=> d!79865 m!499851))

(declare-fun m!499853 () Bool)

(assert (=> b!518450 m!499853))

(assert (=> b!518395 d!79865))

(declare-fun b!518463 () Bool)

(declare-fun e!302498 () SeekEntryResult!4404)

(declare-fun lt!237373 () SeekEntryResult!4404)

(assert (=> b!518463 (= e!302498 (MissingZero!4404 (index!19806 lt!237373)))))

(declare-fun b!518464 () Bool)

(declare-fun e!302497 () SeekEntryResult!4404)

(assert (=> b!518464 (= e!302497 Undefined!4404)))

(declare-fun b!518465 () Bool)

(declare-fun e!302499 () SeekEntryResult!4404)

(assert (=> b!518465 (= e!302499 (Found!4404 (index!19806 lt!237373)))))

(declare-fun b!518466 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33147 (_ BitVec 32)) SeekEntryResult!4404)

(assert (=> b!518466 (= e!302498 (seekKeyOrZeroReturnVacant!0 (x!48769 lt!237373) (index!19806 lt!237373) (index!19806 lt!237373) k0!2280 a!3235 mask!3524))))

(declare-fun b!518467 () Bool)

(assert (=> b!518467 (= e!302497 e!302499)))

(declare-fun lt!237371 () (_ BitVec 64))

(assert (=> b!518467 (= lt!237371 (select (arr!15937 a!3235) (index!19806 lt!237373)))))

(declare-fun c!60802 () Bool)

(assert (=> b!518467 (= c!60802 (= lt!237371 k0!2280))))

(declare-fun d!79867 () Bool)

(declare-fun lt!237372 () SeekEntryResult!4404)

(assert (=> d!79867 (and (or ((_ is Undefined!4404) lt!237372) (not ((_ is Found!4404) lt!237372)) (and (bvsge (index!19805 lt!237372) #b00000000000000000000000000000000) (bvslt (index!19805 lt!237372) (size!16301 a!3235)))) (or ((_ is Undefined!4404) lt!237372) ((_ is Found!4404) lt!237372) (not ((_ is MissingZero!4404) lt!237372)) (and (bvsge (index!19804 lt!237372) #b00000000000000000000000000000000) (bvslt (index!19804 lt!237372) (size!16301 a!3235)))) (or ((_ is Undefined!4404) lt!237372) ((_ is Found!4404) lt!237372) ((_ is MissingZero!4404) lt!237372) (not ((_ is MissingVacant!4404) lt!237372)) (and (bvsge (index!19807 lt!237372) #b00000000000000000000000000000000) (bvslt (index!19807 lt!237372) (size!16301 a!3235)))) (or ((_ is Undefined!4404) lt!237372) (ite ((_ is Found!4404) lt!237372) (= (select (arr!15937 a!3235) (index!19805 lt!237372)) k0!2280) (ite ((_ is MissingZero!4404) lt!237372) (= (select (arr!15937 a!3235) (index!19804 lt!237372)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4404) lt!237372) (= (select (arr!15937 a!3235) (index!19807 lt!237372)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79867 (= lt!237372 e!302497)))

(declare-fun c!60801 () Bool)

(assert (=> d!79867 (= c!60801 (and ((_ is Intermediate!4404) lt!237373) (undefined!5216 lt!237373)))))

(assert (=> d!79867 (= lt!237373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79867 (validMask!0 mask!3524)))

(assert (=> d!79867 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!237372)))

(declare-fun b!518468 () Bool)

(declare-fun c!60803 () Bool)

(assert (=> b!518468 (= c!60803 (= lt!237371 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!518468 (= e!302499 e!302498)))

(assert (= (and d!79867 c!60801) b!518464))

(assert (= (and d!79867 (not c!60801)) b!518467))

(assert (= (and b!518467 c!60802) b!518465))

(assert (= (and b!518467 (not c!60802)) b!518468))

(assert (= (and b!518468 c!60803) b!518463))

(assert (= (and b!518468 (not c!60803)) b!518466))

(declare-fun m!499855 () Bool)

(assert (=> b!518466 m!499855))

(declare-fun m!499857 () Bool)

(assert (=> b!518467 m!499857))

(declare-fun m!499859 () Bool)

(assert (=> d!79867 m!499859))

(declare-fun m!499861 () Bool)

(assert (=> d!79867 m!499861))

(declare-fun m!499863 () Bool)

(assert (=> d!79867 m!499863))

(declare-fun m!499865 () Bool)

(assert (=> d!79867 m!499865))

(declare-fun m!499867 () Bool)

(assert (=> d!79867 m!499867))

(assert (=> d!79867 m!499859))

(assert (=> d!79867 m!499793))

(assert (=> b!518400 d!79867))

(declare-fun d!79873 () Bool)

(assert (=> d!79873 (= (validKeyInArray!0 (select (arr!15937 a!3235) j!176)) (and (not (= (select (arr!15937 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15937 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!518402 d!79873))

(declare-fun b!518469 () Bool)

(declare-fun e!302501 () SeekEntryResult!4404)

(declare-fun lt!237376 () SeekEntryResult!4404)

(assert (=> b!518469 (= e!302501 (MissingZero!4404 (index!19806 lt!237376)))))

(declare-fun b!518470 () Bool)

(declare-fun e!302500 () SeekEntryResult!4404)

(assert (=> b!518470 (= e!302500 Undefined!4404)))

(declare-fun b!518471 () Bool)

(declare-fun e!302502 () SeekEntryResult!4404)

(assert (=> b!518471 (= e!302502 (Found!4404 (index!19806 lt!237376)))))

(declare-fun b!518472 () Bool)

(assert (=> b!518472 (= e!302501 (seekKeyOrZeroReturnVacant!0 (x!48769 lt!237376) (index!19806 lt!237376) (index!19806 lt!237376) (select (arr!15937 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!518473 () Bool)

(assert (=> b!518473 (= e!302500 e!302502)))

(declare-fun lt!237374 () (_ BitVec 64))

(assert (=> b!518473 (= lt!237374 (select (arr!15937 a!3235) (index!19806 lt!237376)))))

(declare-fun c!60805 () Bool)

(assert (=> b!518473 (= c!60805 (= lt!237374 (select (arr!15937 a!3235) j!176)))))

(declare-fun d!79875 () Bool)

(declare-fun lt!237375 () SeekEntryResult!4404)

(assert (=> d!79875 (and (or ((_ is Undefined!4404) lt!237375) (not ((_ is Found!4404) lt!237375)) (and (bvsge (index!19805 lt!237375) #b00000000000000000000000000000000) (bvslt (index!19805 lt!237375) (size!16301 a!3235)))) (or ((_ is Undefined!4404) lt!237375) ((_ is Found!4404) lt!237375) (not ((_ is MissingZero!4404) lt!237375)) (and (bvsge (index!19804 lt!237375) #b00000000000000000000000000000000) (bvslt (index!19804 lt!237375) (size!16301 a!3235)))) (or ((_ is Undefined!4404) lt!237375) ((_ is Found!4404) lt!237375) ((_ is MissingZero!4404) lt!237375) (not ((_ is MissingVacant!4404) lt!237375)) (and (bvsge (index!19807 lt!237375) #b00000000000000000000000000000000) (bvslt (index!19807 lt!237375) (size!16301 a!3235)))) (or ((_ is Undefined!4404) lt!237375) (ite ((_ is Found!4404) lt!237375) (= (select (arr!15937 a!3235) (index!19805 lt!237375)) (select (arr!15937 a!3235) j!176)) (ite ((_ is MissingZero!4404) lt!237375) (= (select (arr!15937 a!3235) (index!19804 lt!237375)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4404) lt!237375) (= (select (arr!15937 a!3235) (index!19807 lt!237375)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79875 (= lt!237375 e!302500)))

(declare-fun c!60804 () Bool)

(assert (=> d!79875 (= c!60804 (and ((_ is Intermediate!4404) lt!237376) (undefined!5216 lt!237376)))))

(assert (=> d!79875 (= lt!237376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15937 a!3235) j!176) mask!3524) (select (arr!15937 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79875 (validMask!0 mask!3524)))

(assert (=> d!79875 (= (seekEntryOrOpen!0 (select (arr!15937 a!3235) j!176) a!3235 mask!3524) lt!237375)))

(declare-fun b!518474 () Bool)

(declare-fun c!60806 () Bool)

(assert (=> b!518474 (= c!60806 (= lt!237374 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!518474 (= e!302502 e!302501)))

(assert (= (and d!79875 c!60804) b!518470))

(assert (= (and d!79875 (not c!60804)) b!518473))

(assert (= (and b!518473 c!60805) b!518471))

(assert (= (and b!518473 (not c!60805)) b!518474))

(assert (= (and b!518474 c!60806) b!518469))

(assert (= (and b!518474 (not c!60806)) b!518472))

(assert (=> b!518472 m!499769))

(declare-fun m!499869 () Bool)

(assert (=> b!518472 m!499869))

(declare-fun m!499871 () Bool)

(assert (=> b!518473 m!499871))

(assert (=> d!79875 m!499787))

(assert (=> d!79875 m!499769))

(declare-fun m!499873 () Bool)

(assert (=> d!79875 m!499873))

(declare-fun m!499875 () Bool)

(assert (=> d!79875 m!499875))

(declare-fun m!499877 () Bool)

(assert (=> d!79875 m!499877))

(declare-fun m!499879 () Bool)

(assert (=> d!79875 m!499879))

(assert (=> d!79875 m!499769))

(assert (=> d!79875 m!499787))

(assert (=> d!79875 m!499793))

(assert (=> b!518391 d!79875))

(declare-fun b!518489 () Bool)

(declare-fun e!302515 () Bool)

(declare-fun e!302516 () Bool)

(assert (=> b!518489 (= e!302515 e!302516)))

(declare-fun c!60809 () Bool)

(assert (=> b!518489 (= c!60809 (validKeyInArray!0 (select (arr!15937 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!518490 () Bool)

(declare-fun e!302517 () Bool)

(declare-fun call!31706 () Bool)

(assert (=> b!518490 (= e!302517 call!31706)))

(declare-fun b!518491 () Bool)

(assert (=> b!518491 (= e!302516 e!302517)))

(declare-fun lt!237385 () (_ BitVec 64))

(assert (=> b!518491 (= lt!237385 (select (arr!15937 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!237384 () Unit!16068)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33147 (_ BitVec 64) (_ BitVec 32)) Unit!16068)

(assert (=> b!518491 (= lt!237384 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237385 #b00000000000000000000000000000000))))

(assert (=> b!518491 (arrayContainsKey!0 a!3235 lt!237385 #b00000000000000000000000000000000)))

(declare-fun lt!237383 () Unit!16068)

(assert (=> b!518491 (= lt!237383 lt!237384)))

(declare-fun res!317459 () Bool)

(assert (=> b!518491 (= res!317459 (= (seekEntryOrOpen!0 (select (arr!15937 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4404 #b00000000000000000000000000000000)))))

(assert (=> b!518491 (=> (not res!317459) (not e!302517))))

(declare-fun b!518492 () Bool)

(assert (=> b!518492 (= e!302516 call!31706)))

(declare-fun bm!31703 () Bool)

(assert (=> bm!31703 (= call!31706 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!79877 () Bool)

(declare-fun res!317458 () Bool)

(assert (=> d!79877 (=> res!317458 e!302515)))

(assert (=> d!79877 (= res!317458 (bvsge #b00000000000000000000000000000000 (size!16301 a!3235)))))

(assert (=> d!79877 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!302515)))

(assert (= (and d!79877 (not res!317458)) b!518489))

(assert (= (and b!518489 c!60809) b!518491))

(assert (= (and b!518489 (not c!60809)) b!518492))

(assert (= (and b!518491 res!317459) b!518490))

(assert (= (or b!518490 b!518492) bm!31703))

(assert (=> b!518489 m!499851))

(assert (=> b!518489 m!499851))

(declare-fun m!499885 () Bool)

(assert (=> b!518489 m!499885))

(assert (=> b!518491 m!499851))

(declare-fun m!499887 () Bool)

(assert (=> b!518491 m!499887))

(declare-fun m!499889 () Bool)

(assert (=> b!518491 m!499889))

(assert (=> b!518491 m!499851))

(declare-fun m!499891 () Bool)

(assert (=> b!518491 m!499891))

(declare-fun m!499893 () Bool)

(assert (=> bm!31703 m!499893))

(assert (=> b!518401 d!79877))

(declare-fun d!79885 () Bool)

(declare-fun e!302533 () Bool)

(assert (=> d!79885 e!302533))

(declare-fun res!317464 () Bool)

(assert (=> d!79885 (=> (not res!317464) (not e!302533))))

(assert (=> d!79885 (= res!317464 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16301 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16301 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16301 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16301 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16301 a!3235))))))

(declare-fun lt!237397 () Unit!16068)

(declare-fun choose!47 (array!33147 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16068)

(assert (=> d!79885 (= lt!237397 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!237336 #b00000000000000000000000000000000 (index!19806 lt!237335) (x!48769 lt!237335) mask!3524))))

(assert (=> d!79885 (validMask!0 mask!3524)))

(assert (=> d!79885 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237336 #b00000000000000000000000000000000 (index!19806 lt!237335) (x!48769 lt!237335) mask!3524) lt!237397)))

(declare-fun b!518519 () Bool)

(assert (=> b!518519 (= e!302533 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237336 (select (store (arr!15937 a!3235) i!1204 k0!2280) j!176) (array!33148 (store (arr!15937 a!3235) i!1204 k0!2280) (size!16301 a!3235)) mask!3524) (Intermediate!4404 false (index!19806 lt!237335) (x!48769 lt!237335))))))

(assert (= (and d!79885 res!317464) b!518519))

(declare-fun m!499909 () Bool)

(assert (=> d!79885 m!499909))

(assert (=> d!79885 m!499793))

(assert (=> b!518519 m!499779))

(assert (=> b!518519 m!499783))

(assert (=> b!518519 m!499783))

(declare-fun m!499911 () Bool)

(assert (=> b!518519 m!499911))

(assert (=> b!518392 d!79885))

(declare-fun d!79889 () Bool)

(declare-fun e!302575 () Bool)

(assert (=> d!79889 e!302575))

(declare-fun c!60842 () Bool)

(declare-fun lt!237431 () SeekEntryResult!4404)

(assert (=> d!79889 (= c!60842 (and ((_ is Intermediate!4404) lt!237431) (undefined!5216 lt!237431)))))

(declare-fun e!302574 () SeekEntryResult!4404)

(assert (=> d!79889 (= lt!237431 e!302574)))

(declare-fun c!60841 () Bool)

(assert (=> d!79889 (= c!60841 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!237430 () (_ BitVec 64))

(assert (=> d!79889 (= lt!237430 (select (arr!15937 lt!237331) lt!237336))))

(assert (=> d!79889 (validMask!0 mask!3524)))

(assert (=> d!79889 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237336 lt!237337 lt!237331 mask!3524) lt!237431)))

(declare-fun b!518583 () Bool)

(assert (=> b!518583 (and (bvsge (index!19806 lt!237431) #b00000000000000000000000000000000) (bvslt (index!19806 lt!237431) (size!16301 lt!237331)))))

(declare-fun e!302573 () Bool)

(assert (=> b!518583 (= e!302573 (= (select (arr!15937 lt!237331) (index!19806 lt!237431)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!518584 () Bool)

(declare-fun e!302572 () SeekEntryResult!4404)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!518584 (= e!302572 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237336 #b00000000000000000000000000000000 mask!3524) lt!237337 lt!237331 mask!3524))))

(declare-fun b!518585 () Bool)

(assert (=> b!518585 (and (bvsge (index!19806 lt!237431) #b00000000000000000000000000000000) (bvslt (index!19806 lt!237431) (size!16301 lt!237331)))))

(declare-fun res!317491 () Bool)

(assert (=> b!518585 (= res!317491 (= (select (arr!15937 lt!237331) (index!19806 lt!237431)) lt!237337))))

(assert (=> b!518585 (=> res!317491 e!302573)))

(declare-fun e!302576 () Bool)

(assert (=> b!518585 (= e!302576 e!302573)))

(declare-fun b!518586 () Bool)

(assert (=> b!518586 (= e!302574 (Intermediate!4404 true lt!237336 #b00000000000000000000000000000000))))

(declare-fun b!518587 () Bool)

(assert (=> b!518587 (= e!302575 e!302576)))

(declare-fun res!317493 () Bool)

(assert (=> b!518587 (= res!317493 (and ((_ is Intermediate!4404) lt!237431) (not (undefined!5216 lt!237431)) (bvslt (x!48769 lt!237431) #b01111111111111111111111111111110) (bvsge (x!48769 lt!237431) #b00000000000000000000000000000000) (bvsge (x!48769 lt!237431) #b00000000000000000000000000000000)))))

(assert (=> b!518587 (=> (not res!317493) (not e!302576))))

(declare-fun b!518588 () Bool)

(assert (=> b!518588 (= e!302574 e!302572)))

(declare-fun c!60840 () Bool)

(assert (=> b!518588 (= c!60840 (or (= lt!237430 lt!237337) (= (bvadd lt!237430 lt!237430) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518589 () Bool)

(assert (=> b!518589 (= e!302575 (bvsge (x!48769 lt!237431) #b01111111111111111111111111111110))))

(declare-fun b!518590 () Bool)

(assert (=> b!518590 (= e!302572 (Intermediate!4404 false lt!237336 #b00000000000000000000000000000000))))

(declare-fun b!518591 () Bool)

(assert (=> b!518591 (and (bvsge (index!19806 lt!237431) #b00000000000000000000000000000000) (bvslt (index!19806 lt!237431) (size!16301 lt!237331)))))

(declare-fun res!317492 () Bool)

(assert (=> b!518591 (= res!317492 (= (select (arr!15937 lt!237331) (index!19806 lt!237431)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!518591 (=> res!317492 e!302573)))

(assert (= (and d!79889 c!60841) b!518586))

(assert (= (and d!79889 (not c!60841)) b!518588))

(assert (= (and b!518588 c!60840) b!518590))

(assert (= (and b!518588 (not c!60840)) b!518584))

(assert (= (and d!79889 c!60842) b!518589))

(assert (= (and d!79889 (not c!60842)) b!518587))

(assert (= (and b!518587 res!317493) b!518585))

(assert (= (and b!518585 (not res!317491)) b!518591))

(assert (= (and b!518591 (not res!317492)) b!518583))

(declare-fun m!499945 () Bool)

(assert (=> d!79889 m!499945))

(assert (=> d!79889 m!499793))

(declare-fun m!499947 () Bool)

(assert (=> b!518583 m!499947))

(assert (=> b!518591 m!499947))

(declare-fun m!499949 () Bool)

(assert (=> b!518584 m!499949))

(assert (=> b!518584 m!499949))

(declare-fun m!499951 () Bool)

(assert (=> b!518584 m!499951))

(assert (=> b!518585 m!499947))

(assert (=> b!518392 d!79889))

(declare-fun b!518614 () Bool)

(declare-fun e!302594 () Bool)

(declare-fun call!31715 () Bool)

(assert (=> b!518614 (= e!302594 call!31715)))

(declare-fun b!518615 () Bool)

(declare-fun e!302596 () Bool)

(assert (=> b!518615 (= e!302596 e!302594)))

(declare-fun c!60848 () Bool)

(assert (=> b!518615 (= c!60848 (validKeyInArray!0 (select (arr!15937 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!518616 () Bool)

(assert (=> b!518616 (= e!302594 call!31715)))

(declare-fun d!79903 () Bool)

(declare-fun res!317508 () Bool)

(declare-fun e!302595 () Bool)

(assert (=> d!79903 (=> res!317508 e!302595)))

(assert (=> d!79903 (= res!317508 (bvsge #b00000000000000000000000000000000 (size!16301 a!3235)))))

(assert (=> d!79903 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10092) e!302595)))

(declare-fun b!518617 () Bool)

(declare-fun e!302597 () Bool)

(declare-fun contains!2749 (List!10095 (_ BitVec 64)) Bool)

(assert (=> b!518617 (= e!302597 (contains!2749 Nil!10092 (select (arr!15937 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31712 () Bool)

(assert (=> bm!31712 (= call!31715 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60848 (Cons!10091 (select (arr!15937 a!3235) #b00000000000000000000000000000000) Nil!10092) Nil!10092)))))

(declare-fun b!518618 () Bool)

(assert (=> b!518618 (= e!302595 e!302596)))

(declare-fun res!317506 () Bool)

(assert (=> b!518618 (=> (not res!317506) (not e!302596))))

(assert (=> b!518618 (= res!317506 (not e!302597))))

(declare-fun res!317507 () Bool)

(assert (=> b!518618 (=> (not res!317507) (not e!302597))))

(assert (=> b!518618 (= res!317507 (validKeyInArray!0 (select (arr!15937 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79903 (not res!317508)) b!518618))

(assert (= (and b!518618 res!317507) b!518617))

(assert (= (and b!518618 res!317506) b!518615))

(assert (= (and b!518615 c!60848) b!518616))

(assert (= (and b!518615 (not c!60848)) b!518614))

(assert (= (or b!518616 b!518614) bm!31712))

(assert (=> b!518615 m!499851))

(assert (=> b!518615 m!499851))

(assert (=> b!518615 m!499885))

(assert (=> b!518617 m!499851))

(assert (=> b!518617 m!499851))

(declare-fun m!499959 () Bool)

(assert (=> b!518617 m!499959))

(assert (=> bm!31712 m!499851))

(declare-fun m!499961 () Bool)

(assert (=> bm!31712 m!499961))

(assert (=> b!518618 m!499851))

(assert (=> b!518618 m!499851))

(assert (=> b!518618 m!499885))

(assert (=> b!518397 d!79903))

(declare-fun d!79907 () Bool)

(declare-fun lt!237453 () (_ BitVec 32))

(declare-fun lt!237452 () (_ BitVec 32))

(assert (=> d!79907 (= lt!237453 (bvmul (bvxor lt!237452 (bvlshr lt!237452 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79907 (= lt!237452 ((_ extract 31 0) (bvand (bvxor (select (arr!15937 a!3235) j!176) (bvlshr (select (arr!15937 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79907 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!317509 (let ((h!11001 ((_ extract 31 0) (bvand (bvxor (select (arr!15937 a!3235) j!176) (bvlshr (select (arr!15937 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48776 (bvmul (bvxor h!11001 (bvlshr h!11001 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48776 (bvlshr x!48776 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!317509 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!317509 #b00000000000000000000000000000000))))))

(assert (=> d!79907 (= (toIndex!0 (select (arr!15937 a!3235) j!176) mask!3524) (bvand (bvxor lt!237453 (bvlshr lt!237453 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!518399 d!79907))

(declare-fun b!518637 () Bool)

(declare-fun e!302608 () Bool)

(declare-fun e!302609 () Bool)

(assert (=> b!518637 (= e!302608 e!302609)))

(declare-fun c!60855 () Bool)

(assert (=> b!518637 (= c!60855 (validKeyInArray!0 (select (arr!15937 a!3235) j!176)))))

(declare-fun b!518638 () Bool)

(declare-fun e!302610 () Bool)

(declare-fun call!31716 () Bool)

(assert (=> b!518638 (= e!302610 call!31716)))

(declare-fun b!518639 () Bool)

(assert (=> b!518639 (= e!302609 e!302610)))

(declare-fun lt!237456 () (_ BitVec 64))

(assert (=> b!518639 (= lt!237456 (select (arr!15937 a!3235) j!176))))

(declare-fun lt!237455 () Unit!16068)

(assert (=> b!518639 (= lt!237455 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237456 j!176))))

(assert (=> b!518639 (arrayContainsKey!0 a!3235 lt!237456 #b00000000000000000000000000000000)))

(declare-fun lt!237454 () Unit!16068)

(assert (=> b!518639 (= lt!237454 lt!237455)))

(declare-fun res!317517 () Bool)

(assert (=> b!518639 (= res!317517 (= (seekEntryOrOpen!0 (select (arr!15937 a!3235) j!176) a!3235 mask!3524) (Found!4404 j!176)))))

(assert (=> b!518639 (=> (not res!317517) (not e!302610))))

(declare-fun b!518640 () Bool)

(assert (=> b!518640 (= e!302609 call!31716)))

(declare-fun bm!31713 () Bool)

(assert (=> bm!31713 (= call!31716 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!79911 () Bool)

(declare-fun res!317516 () Bool)

(assert (=> d!79911 (=> res!317516 e!302608)))

(assert (=> d!79911 (= res!317516 (bvsge j!176 (size!16301 a!3235)))))

(assert (=> d!79911 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!302608)))

(assert (= (and d!79911 (not res!317516)) b!518637))

(assert (= (and b!518637 c!60855) b!518639))

(assert (= (and b!518637 (not c!60855)) b!518640))

(assert (= (and b!518639 res!317517) b!518638))

(assert (= (or b!518638 b!518640) bm!31713))

(assert (=> b!518637 m!499769))

(assert (=> b!518637 m!499769))

(assert (=> b!518637 m!499771))

(assert (=> b!518639 m!499769))

(declare-fun m!499965 () Bool)

(assert (=> b!518639 m!499965))

(declare-fun m!499967 () Bool)

(assert (=> b!518639 m!499967))

(assert (=> b!518639 m!499769))

(assert (=> b!518639 m!499807))

(declare-fun m!499969 () Bool)

(assert (=> bm!31713 m!499969))

(assert (=> b!518399 d!79911))

(declare-fun d!79913 () Bool)

(declare-fun lt!237458 () (_ BitVec 32))

(declare-fun lt!237457 () (_ BitVec 32))

(assert (=> d!79913 (= lt!237458 (bvmul (bvxor lt!237457 (bvlshr lt!237457 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79913 (= lt!237457 ((_ extract 31 0) (bvand (bvxor lt!237337 (bvlshr lt!237337 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79913 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!317509 (let ((h!11001 ((_ extract 31 0) (bvand (bvxor lt!237337 (bvlshr lt!237337 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48776 (bvmul (bvxor h!11001 (bvlshr h!11001 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48776 (bvlshr x!48776 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!317509 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!317509 #b00000000000000000000000000000000))))))

(assert (=> d!79913 (= (toIndex!0 lt!237337 mask!3524) (bvand (bvxor lt!237458 (bvlshr lt!237458 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!518399 d!79913))

(declare-fun d!79915 () Bool)

(declare-fun e!302614 () Bool)

(assert (=> d!79915 e!302614))

(declare-fun c!60858 () Bool)

(declare-fun lt!237460 () SeekEntryResult!4404)

(assert (=> d!79915 (= c!60858 (and ((_ is Intermediate!4404) lt!237460) (undefined!5216 lt!237460)))))

(declare-fun e!302613 () SeekEntryResult!4404)

(assert (=> d!79915 (= lt!237460 e!302613)))

(declare-fun c!60857 () Bool)

(assert (=> d!79915 (= c!60857 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!237459 () (_ BitVec 64))

(assert (=> d!79915 (= lt!237459 (select (arr!15937 lt!237331) lt!237333))))

(assert (=> d!79915 (validMask!0 mask!3524)))

(assert (=> d!79915 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237333 lt!237337 lt!237331 mask!3524) lt!237460)))

(declare-fun b!518641 () Bool)

(assert (=> b!518641 (and (bvsge (index!19806 lt!237460) #b00000000000000000000000000000000) (bvslt (index!19806 lt!237460) (size!16301 lt!237331)))))

(declare-fun e!302612 () Bool)

(assert (=> b!518641 (= e!302612 (= (select (arr!15937 lt!237331) (index!19806 lt!237460)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!518642 () Bool)

(declare-fun e!302611 () SeekEntryResult!4404)

(assert (=> b!518642 (= e!302611 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237333 #b00000000000000000000000000000000 mask!3524) lt!237337 lt!237331 mask!3524))))

(declare-fun b!518643 () Bool)

(assert (=> b!518643 (and (bvsge (index!19806 lt!237460) #b00000000000000000000000000000000) (bvslt (index!19806 lt!237460) (size!16301 lt!237331)))))

(declare-fun res!317518 () Bool)

(assert (=> b!518643 (= res!317518 (= (select (arr!15937 lt!237331) (index!19806 lt!237460)) lt!237337))))

(assert (=> b!518643 (=> res!317518 e!302612)))

(declare-fun e!302615 () Bool)

(assert (=> b!518643 (= e!302615 e!302612)))

(declare-fun b!518644 () Bool)

(assert (=> b!518644 (= e!302613 (Intermediate!4404 true lt!237333 #b00000000000000000000000000000000))))

(declare-fun b!518645 () Bool)

(assert (=> b!518645 (= e!302614 e!302615)))

(declare-fun res!317520 () Bool)

(assert (=> b!518645 (= res!317520 (and ((_ is Intermediate!4404) lt!237460) (not (undefined!5216 lt!237460)) (bvslt (x!48769 lt!237460) #b01111111111111111111111111111110) (bvsge (x!48769 lt!237460) #b00000000000000000000000000000000) (bvsge (x!48769 lt!237460) #b00000000000000000000000000000000)))))

(assert (=> b!518645 (=> (not res!317520) (not e!302615))))

(declare-fun b!518646 () Bool)

(assert (=> b!518646 (= e!302613 e!302611)))

(declare-fun c!60856 () Bool)

(assert (=> b!518646 (= c!60856 (or (= lt!237459 lt!237337) (= (bvadd lt!237459 lt!237459) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518647 () Bool)

(assert (=> b!518647 (= e!302614 (bvsge (x!48769 lt!237460) #b01111111111111111111111111111110))))

(declare-fun b!518648 () Bool)

(assert (=> b!518648 (= e!302611 (Intermediate!4404 false lt!237333 #b00000000000000000000000000000000))))

(declare-fun b!518649 () Bool)

(assert (=> b!518649 (and (bvsge (index!19806 lt!237460) #b00000000000000000000000000000000) (bvslt (index!19806 lt!237460) (size!16301 lt!237331)))))

(declare-fun res!317519 () Bool)

(assert (=> b!518649 (= res!317519 (= (select (arr!15937 lt!237331) (index!19806 lt!237460)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!518649 (=> res!317519 e!302612)))

(assert (= (and d!79915 c!60857) b!518644))

(assert (= (and d!79915 (not c!60857)) b!518646))

(assert (= (and b!518646 c!60856) b!518648))

(assert (= (and b!518646 (not c!60856)) b!518642))

(assert (= (and d!79915 c!60858) b!518647))

(assert (= (and d!79915 (not c!60858)) b!518645))

(assert (= (and b!518645 res!317520) b!518643))

(assert (= (and b!518643 (not res!317518)) b!518649))

(assert (= (and b!518649 (not res!317519)) b!518641))

(declare-fun m!499971 () Bool)

(assert (=> d!79915 m!499971))

(assert (=> d!79915 m!499793))

(declare-fun m!499973 () Bool)

(assert (=> b!518641 m!499973))

(assert (=> b!518649 m!499973))

(declare-fun m!499975 () Bool)

(assert (=> b!518642 m!499975))

(assert (=> b!518642 m!499975))

(declare-fun m!499977 () Bool)

(assert (=> b!518642 m!499977))

(assert (=> b!518643 m!499973))

(assert (=> b!518399 d!79915))

(declare-fun d!79917 () Bool)

(assert (=> d!79917 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!237467 () Unit!16068)

(declare-fun choose!38 (array!33147 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16068)

(assert (=> d!79917 (= lt!237467 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79917 (validMask!0 mask!3524)))

(assert (=> d!79917 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!237467)))

(declare-fun bs!16361 () Bool)

(assert (= bs!16361 d!79917))

(assert (=> bs!16361 m!499789))

(declare-fun m!499987 () Bool)

(assert (=> bs!16361 m!499987))

(assert (=> bs!16361 m!499793))

(assert (=> b!518399 d!79917))

(declare-fun d!79921 () Bool)

(declare-fun e!302626 () Bool)

(assert (=> d!79921 e!302626))

(declare-fun c!60864 () Bool)

(declare-fun lt!237471 () SeekEntryResult!4404)

(assert (=> d!79921 (= c!60864 (and ((_ is Intermediate!4404) lt!237471) (undefined!5216 lt!237471)))))

(declare-fun e!302625 () SeekEntryResult!4404)

(assert (=> d!79921 (= lt!237471 e!302625)))

(declare-fun c!60863 () Bool)

(assert (=> d!79921 (= c!60863 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!237470 () (_ BitVec 64))

(assert (=> d!79921 (= lt!237470 (select (arr!15937 a!3235) lt!237336))))

(assert (=> d!79921 (validMask!0 mask!3524)))

(assert (=> d!79921 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237336 (select (arr!15937 a!3235) j!176) a!3235 mask!3524) lt!237471)))

(declare-fun b!518661 () Bool)

(assert (=> b!518661 (and (bvsge (index!19806 lt!237471) #b00000000000000000000000000000000) (bvslt (index!19806 lt!237471) (size!16301 a!3235)))))

(declare-fun e!302624 () Bool)

(assert (=> b!518661 (= e!302624 (= (select (arr!15937 a!3235) (index!19806 lt!237471)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!518662 () Bool)

(declare-fun e!302623 () SeekEntryResult!4404)

(assert (=> b!518662 (= e!302623 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237336 #b00000000000000000000000000000000 mask!3524) (select (arr!15937 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!518663 () Bool)

(assert (=> b!518663 (and (bvsge (index!19806 lt!237471) #b00000000000000000000000000000000) (bvslt (index!19806 lt!237471) (size!16301 a!3235)))))

(declare-fun res!317527 () Bool)

(assert (=> b!518663 (= res!317527 (= (select (arr!15937 a!3235) (index!19806 lt!237471)) (select (arr!15937 a!3235) j!176)))))

(assert (=> b!518663 (=> res!317527 e!302624)))

(declare-fun e!302627 () Bool)

(assert (=> b!518663 (= e!302627 e!302624)))

(declare-fun b!518664 () Bool)

(assert (=> b!518664 (= e!302625 (Intermediate!4404 true lt!237336 #b00000000000000000000000000000000))))

(declare-fun b!518665 () Bool)

(assert (=> b!518665 (= e!302626 e!302627)))

(declare-fun res!317529 () Bool)

(assert (=> b!518665 (= res!317529 (and ((_ is Intermediate!4404) lt!237471) (not (undefined!5216 lt!237471)) (bvslt (x!48769 lt!237471) #b01111111111111111111111111111110) (bvsge (x!48769 lt!237471) #b00000000000000000000000000000000) (bvsge (x!48769 lt!237471) #b00000000000000000000000000000000)))))

(assert (=> b!518665 (=> (not res!317529) (not e!302627))))

(declare-fun b!518666 () Bool)

(assert (=> b!518666 (= e!302625 e!302623)))

(declare-fun c!60862 () Bool)

(assert (=> b!518666 (= c!60862 (or (= lt!237470 (select (arr!15937 a!3235) j!176)) (= (bvadd lt!237470 lt!237470) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!518667 () Bool)

(assert (=> b!518667 (= e!302626 (bvsge (x!48769 lt!237471) #b01111111111111111111111111111110))))

(declare-fun b!518668 () Bool)

(assert (=> b!518668 (= e!302623 (Intermediate!4404 false lt!237336 #b00000000000000000000000000000000))))

(declare-fun b!518669 () Bool)

(assert (=> b!518669 (and (bvsge (index!19806 lt!237471) #b00000000000000000000000000000000) (bvslt (index!19806 lt!237471) (size!16301 a!3235)))))

(declare-fun res!317528 () Bool)

(assert (=> b!518669 (= res!317528 (= (select (arr!15937 a!3235) (index!19806 lt!237471)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!518669 (=> res!317528 e!302624)))

(assert (= (and d!79921 c!60863) b!518664))

(assert (= (and d!79921 (not c!60863)) b!518666))

(assert (= (and b!518666 c!60862) b!518668))

(assert (= (and b!518666 (not c!60862)) b!518662))

(assert (= (and d!79921 c!60864) b!518667))

(assert (= (and d!79921 (not c!60864)) b!518665))

(assert (= (and b!518665 res!317529) b!518663))

(assert (= (and b!518663 (not res!317527)) b!518669))

(assert (= (and b!518669 (not res!317528)) b!518661))

(declare-fun m!499989 () Bool)

(assert (=> d!79921 m!499989))

(assert (=> d!79921 m!499793))

(declare-fun m!499991 () Bool)

(assert (=> b!518661 m!499991))

(assert (=> b!518669 m!499991))

(assert (=> b!518662 m!499949))

(assert (=> b!518662 m!499949))

(assert (=> b!518662 m!499769))

(declare-fun m!499993 () Bool)

(assert (=> b!518662 m!499993))

(assert (=> b!518663 m!499991))

(assert (=> b!518399 d!79921))

(declare-fun d!79923 () Bool)

(assert (=> d!79923 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!518393 d!79923))

(check-sat (not b!518617) (not bm!31703) (not b!518584) (not b!518642) (not b!518637) (not d!79917) (not b!518491) (not b!518519) (not d!79921) (not d!79867) (not b!518639) (not d!79889) (not bm!31712) (not b!518662) (not bm!31713) (not b!518615) (not d!79885) (not b!518489) (not d!79875) (not b!518450) (not d!79915) (not b!518472) (not b!518466) (not b!518618))
(check-sat)
