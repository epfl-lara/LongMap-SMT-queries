; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45638 () Bool)

(assert start!45638)

(declare-fun b!503391 () Bool)

(declare-fun res!304749 () Bool)

(declare-fun e!294790 () Bool)

(assert (=> b!503391 (=> (not res!304749) (not e!294790))))

(declare-datatypes ((array!32395 0))(
  ( (array!32396 (arr!15577 (Array (_ BitVec 32) (_ BitVec 64))) (size!15941 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32395)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503391 (= res!304749 (validKeyInArray!0 (select (arr!15577 a!3235) j!176)))))

(declare-fun b!503392 () Bool)

(declare-fun res!304743 () Bool)

(assert (=> b!503392 (=> (not res!304743) (not e!294790))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503392 (= res!304743 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503393 () Bool)

(declare-fun res!304753 () Bool)

(declare-fun e!294797 () Bool)

(assert (=> b!503393 (=> res!304753 e!294797)))

(declare-datatypes ((SeekEntryResult!4000 0))(
  ( (MissingZero!4000 (index!18188 (_ BitVec 32))) (Found!4000 (index!18189 (_ BitVec 32))) (Intermediate!4000 (undefined!4812 Bool) (index!18190 (_ BitVec 32)) (x!47358 (_ BitVec 32))) (Undefined!4000) (MissingVacant!4000 (index!18191 (_ BitVec 32))) )
))
(declare-fun lt!229045 () SeekEntryResult!4000)

(get-info :version)

(assert (=> b!503393 (= res!304753 (or (undefined!4812 lt!229045) (not ((_ is Intermediate!4000) lt!229045))))))

(declare-fun b!503394 () Bool)

(declare-fun res!304752 () Bool)

(assert (=> b!503394 (=> (not res!304752) (not e!294790))))

(assert (=> b!503394 (= res!304752 (validKeyInArray!0 k0!2280))))

(declare-fun b!503395 () Bool)

(declare-fun e!294793 () Bool)

(assert (=> b!503395 (= e!294790 e!294793)))

(declare-fun res!304750 () Bool)

(assert (=> b!503395 (=> (not res!304750) (not e!294793))))

(declare-fun lt!229046 () SeekEntryResult!4000)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503395 (= res!304750 (or (= lt!229046 (MissingZero!4000 i!1204)) (= lt!229046 (MissingVacant!4000 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32395 (_ BitVec 32)) SeekEntryResult!4000)

(assert (=> b!503395 (= lt!229046 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!503396 () Bool)

(assert (=> b!503396 (= e!294793 (not e!294797))))

(declare-fun res!304744 () Bool)

(assert (=> b!503396 (=> res!304744 e!294797)))

(declare-fun lt!229050 () array!32395)

(declare-fun lt!229047 () (_ BitVec 32))

(declare-fun lt!229051 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32395 (_ BitVec 32)) SeekEntryResult!4000)

(assert (=> b!503396 (= res!304744 (= lt!229045 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229047 lt!229051 lt!229050 mask!3524)))))

(declare-fun lt!229048 () (_ BitVec 32))

(assert (=> b!503396 (= lt!229045 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229048 (select (arr!15577 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503396 (= lt!229047 (toIndex!0 lt!229051 mask!3524))))

(assert (=> b!503396 (= lt!229051 (select (store (arr!15577 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!503396 (= lt!229048 (toIndex!0 (select (arr!15577 a!3235) j!176) mask!3524))))

(assert (=> b!503396 (= lt!229050 (array!32396 (store (arr!15577 a!3235) i!1204 k0!2280) (size!15941 a!3235)))))

(declare-fun e!294795 () Bool)

(assert (=> b!503396 e!294795))

(declare-fun res!304747 () Bool)

(assert (=> b!503396 (=> (not res!304747) (not e!294795))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32395 (_ BitVec 32)) Bool)

(assert (=> b!503396 (= res!304747 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15235 0))(
  ( (Unit!15236) )
))
(declare-fun lt!229049 () Unit!15235)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32395 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15235)

(assert (=> b!503396 (= lt!229049 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503397 () Bool)

(declare-fun e!294798 () Unit!15235)

(declare-fun Unit!15237 () Unit!15235)

(assert (=> b!503397 (= e!294798 Unit!15237)))

(declare-fun lt!229044 () Unit!15235)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32395 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15235)

(assert (=> b!503397 (= lt!229044 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229048 #b00000000000000000000000000000000 (index!18190 lt!229045) (x!47358 lt!229045) mask!3524))))

(declare-fun res!304754 () Bool)

(assert (=> b!503397 (= res!304754 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229048 lt!229051 lt!229050 mask!3524) (Intermediate!4000 false (index!18190 lt!229045) (x!47358 lt!229045))))))

(declare-fun e!294792 () Bool)

(assert (=> b!503397 (=> (not res!304754) (not e!294792))))

(assert (=> b!503397 e!294792))

(declare-fun b!503398 () Bool)

(declare-fun Unit!15238 () Unit!15235)

(assert (=> b!503398 (= e!294798 Unit!15238)))

(declare-fun res!304745 () Bool)

(assert (=> start!45638 (=> (not res!304745) (not e!294790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45638 (= res!304745 (validMask!0 mask!3524))))

(assert (=> start!45638 e!294790))

(assert (=> start!45638 true))

(declare-fun array_inv!11436 (array!32395) Bool)

(assert (=> start!45638 (array_inv!11436 a!3235)))

(declare-fun b!503399 () Bool)

(assert (=> b!503399 (= e!294792 false)))

(declare-fun b!503400 () Bool)

(declare-fun res!304746 () Bool)

(assert (=> b!503400 (=> (not res!304746) (not e!294793))))

(assert (=> b!503400 (= res!304746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503401 () Bool)

(declare-fun res!304756 () Bool)

(declare-fun e!294794 () Bool)

(assert (=> b!503401 (=> res!304756 e!294794)))

(declare-fun e!294791 () Bool)

(assert (=> b!503401 (= res!304756 e!294791)))

(declare-fun res!304751 () Bool)

(assert (=> b!503401 (=> (not res!304751) (not e!294791))))

(assert (=> b!503401 (= res!304751 (bvsgt #b00000000000000000000000000000000 (x!47358 lt!229045)))))

(declare-fun b!503402 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32395 (_ BitVec 32)) SeekEntryResult!4000)

(assert (=> b!503402 (= e!294791 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229048 (index!18190 lt!229045) (select (arr!15577 a!3235) j!176) a!3235 mask!3524) (Found!4000 j!176))))))

(declare-fun b!503403 () Bool)

(assert (=> b!503403 (= e!294795 (= (seekEntryOrOpen!0 (select (arr!15577 a!3235) j!176) a!3235 mask!3524) (Found!4000 j!176)))))

(declare-fun b!503404 () Bool)

(declare-fun res!304742 () Bool)

(assert (=> b!503404 (=> (not res!304742) (not e!294790))))

(assert (=> b!503404 (= res!304742 (and (= (size!15941 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15941 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15941 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503405 () Bool)

(assert (=> b!503405 (= e!294794 true)))

(declare-fun lt!229052 () SeekEntryResult!4000)

(assert (=> b!503405 (= lt!229052 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229048 lt!229051 lt!229050 mask!3524))))

(declare-fun b!503406 () Bool)

(assert (=> b!503406 (= e!294797 e!294794)))

(declare-fun res!304748 () Bool)

(assert (=> b!503406 (=> res!304748 e!294794)))

(assert (=> b!503406 (= res!304748 (or (bvsgt (x!47358 lt!229045) #b01111111111111111111111111111110) (bvslt lt!229048 #b00000000000000000000000000000000) (bvsge lt!229048 (size!15941 a!3235)) (bvslt (index!18190 lt!229045) #b00000000000000000000000000000000) (bvsge (index!18190 lt!229045) (size!15941 a!3235)) (not (= lt!229045 (Intermediate!4000 false (index!18190 lt!229045) (x!47358 lt!229045))))))))

(assert (=> b!503406 (= (index!18190 lt!229045) i!1204)))

(declare-fun lt!229053 () Unit!15235)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32395 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15235)

(assert (=> b!503406 (= lt!229053 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229048 #b00000000000000000000000000000000 (index!18190 lt!229045) (x!47358 lt!229045) mask!3524))))

(assert (=> b!503406 (and (or (= (select (arr!15577 a!3235) (index!18190 lt!229045)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15577 a!3235) (index!18190 lt!229045)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15577 a!3235) (index!18190 lt!229045)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15577 a!3235) (index!18190 lt!229045)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229054 () Unit!15235)

(assert (=> b!503406 (= lt!229054 e!294798)))

(declare-fun c!59603 () Bool)

(assert (=> b!503406 (= c!59603 (= (select (arr!15577 a!3235) (index!18190 lt!229045)) (select (arr!15577 a!3235) j!176)))))

(assert (=> b!503406 (and (bvslt (x!47358 lt!229045) #b01111111111111111111111111111110) (or (= (select (arr!15577 a!3235) (index!18190 lt!229045)) (select (arr!15577 a!3235) j!176)) (= (select (arr!15577 a!3235) (index!18190 lt!229045)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15577 a!3235) (index!18190 lt!229045)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503407 () Bool)

(declare-fun res!304755 () Bool)

(assert (=> b!503407 (=> (not res!304755) (not e!294793))))

(declare-datatypes ((List!9642 0))(
  ( (Nil!9639) (Cons!9638 (h!10515 (_ BitVec 64)) (t!15862 List!9642)) )
))
(declare-fun arrayNoDuplicates!0 (array!32395 (_ BitVec 32) List!9642) Bool)

(assert (=> b!503407 (= res!304755 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9639))))

(assert (= (and start!45638 res!304745) b!503404))

(assert (= (and b!503404 res!304742) b!503391))

(assert (= (and b!503391 res!304749) b!503394))

(assert (= (and b!503394 res!304752) b!503392))

(assert (= (and b!503392 res!304743) b!503395))

(assert (= (and b!503395 res!304750) b!503400))

(assert (= (and b!503400 res!304746) b!503407))

(assert (= (and b!503407 res!304755) b!503396))

(assert (= (and b!503396 res!304747) b!503403))

(assert (= (and b!503396 (not res!304744)) b!503393))

(assert (= (and b!503393 (not res!304753)) b!503406))

(assert (= (and b!503406 c!59603) b!503397))

(assert (= (and b!503406 (not c!59603)) b!503398))

(assert (= (and b!503397 res!304754) b!503399))

(assert (= (and b!503406 (not res!304748)) b!503401))

(assert (= (and b!503401 res!304751) b!503402))

(assert (= (and b!503401 (not res!304756)) b!503405))

(declare-fun m!484471 () Bool)

(assert (=> b!503395 m!484471))

(declare-fun m!484473 () Bool)

(assert (=> b!503396 m!484473))

(declare-fun m!484475 () Bool)

(assert (=> b!503396 m!484475))

(declare-fun m!484477 () Bool)

(assert (=> b!503396 m!484477))

(declare-fun m!484479 () Bool)

(assert (=> b!503396 m!484479))

(assert (=> b!503396 m!484477))

(declare-fun m!484481 () Bool)

(assert (=> b!503396 m!484481))

(assert (=> b!503396 m!484477))

(declare-fun m!484483 () Bool)

(assert (=> b!503396 m!484483))

(declare-fun m!484485 () Bool)

(assert (=> b!503396 m!484485))

(declare-fun m!484487 () Bool)

(assert (=> b!503396 m!484487))

(declare-fun m!484489 () Bool)

(assert (=> b!503396 m!484489))

(declare-fun m!484491 () Bool)

(assert (=> b!503394 m!484491))

(assert (=> b!503402 m!484477))

(assert (=> b!503402 m!484477))

(declare-fun m!484493 () Bool)

(assert (=> b!503402 m!484493))

(declare-fun m!484495 () Bool)

(assert (=> b!503397 m!484495))

(declare-fun m!484497 () Bool)

(assert (=> b!503397 m!484497))

(assert (=> b!503405 m!484497))

(declare-fun m!484499 () Bool)

(assert (=> b!503400 m!484499))

(declare-fun m!484501 () Bool)

(assert (=> b!503406 m!484501))

(declare-fun m!484503 () Bool)

(assert (=> b!503406 m!484503))

(assert (=> b!503406 m!484477))

(assert (=> b!503391 m!484477))

(assert (=> b!503391 m!484477))

(declare-fun m!484505 () Bool)

(assert (=> b!503391 m!484505))

(assert (=> b!503403 m!484477))

(assert (=> b!503403 m!484477))

(declare-fun m!484507 () Bool)

(assert (=> b!503403 m!484507))

(declare-fun m!484509 () Bool)

(assert (=> start!45638 m!484509))

(declare-fun m!484511 () Bool)

(assert (=> start!45638 m!484511))

(declare-fun m!484513 () Bool)

(assert (=> b!503407 m!484513))

(declare-fun m!484515 () Bool)

(assert (=> b!503392 m!484515))

(check-sat (not start!45638) (not b!503403) (not b!503392) (not b!503394) (not b!503400) (not b!503405) (not b!503407) (not b!503395) (not b!503397) (not b!503402) (not b!503406) (not b!503391) (not b!503396))
(check-sat)
