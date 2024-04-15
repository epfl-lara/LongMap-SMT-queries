; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45720 () Bool)

(assert start!45720)

(declare-fun b!505324 () Bool)

(declare-fun res!306516 () Bool)

(declare-fun e!295797 () Bool)

(assert (=> b!505324 (=> res!306516 e!295797)))

(declare-fun e!295794 () Bool)

(assert (=> b!505324 (= res!306516 e!295794)))

(declare-fun res!306510 () Bool)

(assert (=> b!505324 (=> (not res!306510) (not e!295794))))

(declare-datatypes ((SeekEntryResult!4087 0))(
  ( (MissingZero!4087 (index!18536 (_ BitVec 32))) (Found!4087 (index!18537 (_ BitVec 32))) (Intermediate!4087 (undefined!4899 Bool) (index!18538 (_ BitVec 32)) (x!47555 (_ BitVec 32))) (Undefined!4087) (MissingVacant!4087 (index!18539 (_ BitVec 32))) )
))
(declare-fun lt!230249 () SeekEntryResult!4087)

(assert (=> b!505324 (= res!306510 (bvsgt #b00000000000000000000000000000000 (x!47555 lt!230249)))))

(declare-fun b!505325 () Bool)

(declare-fun res!306513 () Bool)

(declare-fun e!295796 () Bool)

(assert (=> b!505325 (=> (not res!306513) (not e!295796))))

(declare-datatypes ((array!32486 0))(
  ( (array!32487 (arr!15623 (Array (_ BitVec 32) (_ BitVec 64))) (size!15988 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32486)

(declare-datatypes ((List!9820 0))(
  ( (Nil!9817) (Cons!9816 (h!10693 (_ BitVec 64)) (t!16039 List!9820)) )
))
(declare-fun arrayNoDuplicates!0 (array!32486 (_ BitVec 32) List!9820) Bool)

(assert (=> b!505325 (= res!306513 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9817))))

(declare-fun b!505326 () Bool)

(declare-fun res!306512 () Bool)

(declare-fun e!295795 () Bool)

(assert (=> b!505326 (=> (not res!306512) (not e!295795))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505326 (= res!306512 (validKeyInArray!0 k0!2280))))

(declare-fun b!505327 () Bool)

(declare-fun res!306517 () Bool)

(assert (=> b!505327 (=> (not res!306517) (not e!295795))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!505327 (= res!306517 (and (= (size!15988 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15988 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15988 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505328 () Bool)

(declare-fun e!295789 () Bool)

(assert (=> b!505328 (= e!295796 (not e!295789))))

(declare-fun res!306523 () Bool)

(assert (=> b!505328 (=> res!306523 e!295789)))

(declare-fun lt!230247 () SeekEntryResult!4087)

(get-info :version)

(assert (=> b!505328 (= res!306523 (or (= lt!230249 lt!230247) (undefined!4899 lt!230249) (not ((_ is Intermediate!4087) lt!230249))))))

(declare-fun lt!230248 () (_ BitVec 64))

(declare-fun lt!230242 () (_ BitVec 32))

(declare-fun lt!230246 () array!32486)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32486 (_ BitVec 32)) SeekEntryResult!4087)

(assert (=> b!505328 (= lt!230247 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230242 lt!230248 lt!230246 mask!3524))))

(declare-fun lt!230250 () (_ BitVec 32))

(assert (=> b!505328 (= lt!230249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230250 (select (arr!15623 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505328 (= lt!230242 (toIndex!0 lt!230248 mask!3524))))

(assert (=> b!505328 (= lt!230248 (select (store (arr!15623 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!505328 (= lt!230250 (toIndex!0 (select (arr!15623 a!3235) j!176) mask!3524))))

(assert (=> b!505328 (= lt!230246 (array!32487 (store (arr!15623 a!3235) i!1204 k0!2280) (size!15988 a!3235)))))

(declare-fun lt!230251 () SeekEntryResult!4087)

(assert (=> b!505328 (= lt!230251 (Found!4087 j!176))))

(declare-fun e!295791 () Bool)

(assert (=> b!505328 e!295791))

(declare-fun res!306518 () Bool)

(assert (=> b!505328 (=> (not res!306518) (not e!295791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32486 (_ BitVec 32)) Bool)

(assert (=> b!505328 (= res!306518 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15418 0))(
  ( (Unit!15419) )
))
(declare-fun lt!230244 () Unit!15418)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32486 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15418)

(assert (=> b!505328 (= lt!230244 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!306515 () Bool)

(assert (=> start!45720 (=> (not res!306515) (not e!295795))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45720 (= res!306515 (validMask!0 mask!3524))))

(assert (=> start!45720 e!295795))

(assert (=> start!45720 true))

(declare-fun array_inv!11506 (array!32486) Bool)

(assert (=> start!45720 (array_inv!11506 a!3235)))

(declare-fun b!505323 () Bool)

(declare-fun res!306519 () Bool)

(assert (=> b!505323 (=> (not res!306519) (not e!295795))))

(assert (=> b!505323 (= res!306519 (validKeyInArray!0 (select (arr!15623 a!3235) j!176)))))

(declare-fun b!505329 () Bool)

(declare-fun res!306514 () Bool)

(assert (=> b!505329 (=> (not res!306514) (not e!295796))))

(assert (=> b!505329 (= res!306514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505330 () Bool)

(declare-fun res!306522 () Bool)

(assert (=> b!505330 (=> res!306522 e!295797)))

(assert (=> b!505330 (= res!306522 (not (= lt!230247 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230250 lt!230248 lt!230246 mask!3524))))))

(declare-fun b!505331 () Bool)

(declare-fun e!295793 () Unit!15418)

(declare-fun Unit!15420 () Unit!15418)

(assert (=> b!505331 (= e!295793 Unit!15420)))

(declare-fun b!505332 () Bool)

(assert (=> b!505332 (= e!295797 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32486 (_ BitVec 32)) SeekEntryResult!4087)

(assert (=> b!505332 (= (seekEntryOrOpen!0 lt!230248 lt!230246 mask!3524) lt!230251)))

(declare-fun lt!230245 () Unit!15418)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32486 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15418)

(assert (=> b!505332 (= lt!230245 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230250 #b00000000000000000000000000000000 (index!18538 lt!230249) (x!47555 lt!230249) mask!3524))))

(declare-fun b!505333 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32486 (_ BitVec 32)) SeekEntryResult!4087)

(assert (=> b!505333 (= e!295794 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230250 (index!18538 lt!230249) (select (arr!15623 a!3235) j!176) a!3235 mask!3524) lt!230251)))))

(declare-fun b!505334 () Bool)

(declare-fun Unit!15421 () Unit!15418)

(assert (=> b!505334 (= e!295793 Unit!15421)))

(declare-fun lt!230252 () Unit!15418)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32486 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15418)

(assert (=> b!505334 (= lt!230252 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230250 #b00000000000000000000000000000000 (index!18538 lt!230249) (x!47555 lt!230249) mask!3524))))

(declare-fun res!306521 () Bool)

(assert (=> b!505334 (= res!306521 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230250 lt!230248 lt!230246 mask!3524) (Intermediate!4087 false (index!18538 lt!230249) (x!47555 lt!230249))))))

(declare-fun e!295792 () Bool)

(assert (=> b!505334 (=> (not res!306521) (not e!295792))))

(assert (=> b!505334 e!295792))

(declare-fun b!505335 () Bool)

(assert (=> b!505335 (= e!295791 (= (seekEntryOrOpen!0 (select (arr!15623 a!3235) j!176) a!3235 mask!3524) (Found!4087 j!176)))))

(declare-fun b!505336 () Bool)

(assert (=> b!505336 (= e!295789 e!295797)))

(declare-fun res!306511 () Bool)

(assert (=> b!505336 (=> res!306511 e!295797)))

(assert (=> b!505336 (= res!306511 (or (bvsgt (x!47555 lt!230249) #b01111111111111111111111111111110) (bvslt lt!230250 #b00000000000000000000000000000000) (bvsge lt!230250 (size!15988 a!3235)) (bvslt (index!18538 lt!230249) #b00000000000000000000000000000000) (bvsge (index!18538 lt!230249) (size!15988 a!3235)) (not (= lt!230249 (Intermediate!4087 false (index!18538 lt!230249) (x!47555 lt!230249))))))))

(assert (=> b!505336 (= (index!18538 lt!230249) i!1204)))

(declare-fun lt!230243 () Unit!15418)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32486 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15418)

(assert (=> b!505336 (= lt!230243 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230250 #b00000000000000000000000000000000 (index!18538 lt!230249) (x!47555 lt!230249) mask!3524))))

(assert (=> b!505336 (and (or (= (select (arr!15623 a!3235) (index!18538 lt!230249)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15623 a!3235) (index!18538 lt!230249)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15623 a!3235) (index!18538 lt!230249)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15623 a!3235) (index!18538 lt!230249)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230254 () Unit!15418)

(assert (=> b!505336 (= lt!230254 e!295793)))

(declare-fun c!59685 () Bool)

(assert (=> b!505336 (= c!59685 (= (select (arr!15623 a!3235) (index!18538 lt!230249)) (select (arr!15623 a!3235) j!176)))))

(assert (=> b!505336 (and (bvslt (x!47555 lt!230249) #b01111111111111111111111111111110) (or (= (select (arr!15623 a!3235) (index!18538 lt!230249)) (select (arr!15623 a!3235) j!176)) (= (select (arr!15623 a!3235) (index!18538 lt!230249)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15623 a!3235) (index!18538 lt!230249)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505337 () Bool)

(declare-fun res!306524 () Bool)

(assert (=> b!505337 (=> (not res!306524) (not e!295795))))

(declare-fun arrayContainsKey!0 (array!32486 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505337 (= res!306524 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505338 () Bool)

(assert (=> b!505338 (= e!295792 false)))

(declare-fun b!505339 () Bool)

(assert (=> b!505339 (= e!295795 e!295796)))

(declare-fun res!306520 () Bool)

(assert (=> b!505339 (=> (not res!306520) (not e!295796))))

(declare-fun lt!230253 () SeekEntryResult!4087)

(assert (=> b!505339 (= res!306520 (or (= lt!230253 (MissingZero!4087 i!1204)) (= lt!230253 (MissingVacant!4087 i!1204))))))

(assert (=> b!505339 (= lt!230253 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45720 res!306515) b!505327))

(assert (= (and b!505327 res!306517) b!505323))

(assert (= (and b!505323 res!306519) b!505326))

(assert (= (and b!505326 res!306512) b!505337))

(assert (= (and b!505337 res!306524) b!505339))

(assert (= (and b!505339 res!306520) b!505329))

(assert (= (and b!505329 res!306514) b!505325))

(assert (= (and b!505325 res!306513) b!505328))

(assert (= (and b!505328 res!306518) b!505335))

(assert (= (and b!505328 (not res!306523)) b!505336))

(assert (= (and b!505336 c!59685) b!505334))

(assert (= (and b!505336 (not c!59685)) b!505331))

(assert (= (and b!505334 res!306521) b!505338))

(assert (= (and b!505336 (not res!306511)) b!505324))

(assert (= (and b!505324 res!306510) b!505333))

(assert (= (and b!505324 (not res!306516)) b!505330))

(assert (= (and b!505330 (not res!306522)) b!505332))

(declare-fun m!485503 () Bool)

(assert (=> b!505335 m!485503))

(assert (=> b!505335 m!485503))

(declare-fun m!485505 () Bool)

(assert (=> b!505335 m!485505))

(assert (=> b!505333 m!485503))

(assert (=> b!505333 m!485503))

(declare-fun m!485507 () Bool)

(assert (=> b!505333 m!485507))

(declare-fun m!485509 () Bool)

(assert (=> start!45720 m!485509))

(declare-fun m!485511 () Bool)

(assert (=> start!45720 m!485511))

(declare-fun m!485513 () Bool)

(assert (=> b!505330 m!485513))

(declare-fun m!485515 () Bool)

(assert (=> b!505326 m!485515))

(declare-fun m!485517 () Bool)

(assert (=> b!505332 m!485517))

(declare-fun m!485519 () Bool)

(assert (=> b!505332 m!485519))

(declare-fun m!485521 () Bool)

(assert (=> b!505328 m!485521))

(declare-fun m!485523 () Bool)

(assert (=> b!505328 m!485523))

(declare-fun m!485525 () Bool)

(assert (=> b!505328 m!485525))

(declare-fun m!485527 () Bool)

(assert (=> b!505328 m!485527))

(assert (=> b!505328 m!485503))

(declare-fun m!485529 () Bool)

(assert (=> b!505328 m!485529))

(assert (=> b!505328 m!485503))

(declare-fun m!485531 () Bool)

(assert (=> b!505328 m!485531))

(assert (=> b!505328 m!485503))

(declare-fun m!485533 () Bool)

(assert (=> b!505328 m!485533))

(declare-fun m!485535 () Bool)

(assert (=> b!505328 m!485535))

(declare-fun m!485537 () Bool)

(assert (=> b!505329 m!485537))

(assert (=> b!505323 m!485503))

(assert (=> b!505323 m!485503))

(declare-fun m!485539 () Bool)

(assert (=> b!505323 m!485539))

(declare-fun m!485541 () Bool)

(assert (=> b!505337 m!485541))

(declare-fun m!485543 () Bool)

(assert (=> b!505336 m!485543))

(declare-fun m!485545 () Bool)

(assert (=> b!505336 m!485545))

(assert (=> b!505336 m!485503))

(declare-fun m!485547 () Bool)

(assert (=> b!505339 m!485547))

(declare-fun m!485549 () Bool)

(assert (=> b!505325 m!485549))

(declare-fun m!485551 () Bool)

(assert (=> b!505334 m!485551))

(assert (=> b!505334 m!485513))

(check-sat (not b!505330) (not b!505337) (not b!505332) (not b!505328) (not b!505325) (not b!505333) (not b!505335) (not b!505329) (not start!45720) (not b!505326) (not b!505336) (not b!505339) (not b!505323) (not b!505334))
(check-sat)
