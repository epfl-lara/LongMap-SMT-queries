; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45260 () Bool)

(assert start!45260)

(declare-fun b!497113 () Bool)

(declare-fun res!299507 () Bool)

(declare-fun e!291432 () Bool)

(assert (=> b!497113 (=> res!299507 e!291432)))

(declare-datatypes ((SeekEntryResult!3924 0))(
  ( (MissingZero!3924 (index!17875 (_ BitVec 32))) (Found!3924 (index!17876 (_ BitVec 32))) (Intermediate!3924 (undefined!4736 Bool) (index!17877 (_ BitVec 32)) (x!46928 (_ BitVec 32))) (Undefined!3924) (MissingVacant!3924 (index!17878 (_ BitVec 32))) )
))
(declare-fun lt!225048 () SeekEntryResult!3924)

(get-info :version)

(assert (=> b!497113 (= res!299507 (or (undefined!4736 lt!225048) (not ((_ is Intermediate!3924) lt!225048))))))

(declare-fun b!497114 () Bool)

(declare-fun res!299505 () Bool)

(declare-fun e!291430 () Bool)

(assert (=> b!497114 (=> (not res!299505) (not e!291430))))

(declare-datatypes ((array!32148 0))(
  ( (array!32149 (arr!15457 (Array (_ BitVec 32) (_ BitVec 64))) (size!15821 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32148)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497114 (= res!299505 (validKeyInArray!0 (select (arr!15457 a!3235) j!176)))))

(declare-fun res!299509 () Bool)

(assert (=> start!45260 (=> (not res!299509) (not e!291430))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45260 (= res!299509 (validMask!0 mask!3524))))

(assert (=> start!45260 e!291430))

(assert (=> start!45260 true))

(declare-fun array_inv!11253 (array!32148) Bool)

(assert (=> start!45260 (array_inv!11253 a!3235)))

(declare-fun b!497115 () Bool)

(assert (=> b!497115 (= e!291432 true)))

(assert (=> b!497115 (and (bvslt (x!46928 lt!225048) #b01111111111111111111111111111110) (or (= (select (arr!15457 a!3235) (index!17877 lt!225048)) (select (arr!15457 a!3235) j!176)) (= (select (arr!15457 a!3235) (index!17877 lt!225048)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15457 a!3235) (index!17877 lt!225048)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497116 () Bool)

(declare-fun e!291429 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32148 (_ BitVec 32)) SeekEntryResult!3924)

(assert (=> b!497116 (= e!291429 (= (seekEntryOrOpen!0 (select (arr!15457 a!3235) j!176) a!3235 mask!3524) (Found!3924 j!176)))))

(declare-fun b!497117 () Bool)

(declare-fun res!299500 () Bool)

(assert (=> b!497117 (=> (not res!299500) (not e!291430))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!497117 (= res!299500 (and (= (size!15821 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15821 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15821 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497118 () Bool)

(declare-fun res!299502 () Bool)

(assert (=> b!497118 (=> (not res!299502) (not e!291430))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32148 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497118 (= res!299502 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497119 () Bool)

(declare-fun res!299510 () Bool)

(declare-fun e!291431 () Bool)

(assert (=> b!497119 (=> (not res!299510) (not e!291431))))

(declare-datatypes ((List!9615 0))(
  ( (Nil!9612) (Cons!9611 (h!10482 (_ BitVec 64)) (t!15843 List!9615)) )
))
(declare-fun arrayNoDuplicates!0 (array!32148 (_ BitVec 32) List!9615) Bool)

(assert (=> b!497119 (= res!299510 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9612))))

(declare-fun b!497120 () Bool)

(declare-fun res!299508 () Bool)

(assert (=> b!497120 (=> (not res!299508) (not e!291430))))

(assert (=> b!497120 (= res!299508 (validKeyInArray!0 k0!2280))))

(declare-fun b!497121 () Bool)

(assert (=> b!497121 (= e!291430 e!291431)))

(declare-fun res!299506 () Bool)

(assert (=> b!497121 (=> (not res!299506) (not e!291431))))

(declare-fun lt!225049 () SeekEntryResult!3924)

(assert (=> b!497121 (= res!299506 (or (= lt!225049 (MissingZero!3924 i!1204)) (= lt!225049 (MissingVacant!3924 i!1204))))))

(assert (=> b!497121 (= lt!225049 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!497122 () Bool)

(assert (=> b!497122 (= e!291431 (not e!291432))))

(declare-fun res!299504 () Bool)

(assert (=> b!497122 (=> res!299504 e!291432)))

(declare-fun lt!225050 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32148 (_ BitVec 32)) SeekEntryResult!3924)

(assert (=> b!497122 (= res!299504 (= lt!225048 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225050 (select (store (arr!15457 a!3235) i!1204 k0!2280) j!176) (array!32149 (store (arr!15457 a!3235) i!1204 k0!2280) (size!15821 a!3235)) mask!3524)))))

(declare-fun lt!225051 () (_ BitVec 32))

(assert (=> b!497122 (= lt!225048 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225051 (select (arr!15457 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497122 (= lt!225050 (toIndex!0 (select (store (arr!15457 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!497122 (= lt!225051 (toIndex!0 (select (arr!15457 a!3235) j!176) mask!3524))))

(assert (=> b!497122 e!291429))

(declare-fun res!299503 () Bool)

(assert (=> b!497122 (=> (not res!299503) (not e!291429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32148 (_ BitVec 32)) Bool)

(assert (=> b!497122 (= res!299503 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14794 0))(
  ( (Unit!14795) )
))
(declare-fun lt!225052 () Unit!14794)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32148 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14794)

(assert (=> b!497122 (= lt!225052 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497123 () Bool)

(declare-fun res!299501 () Bool)

(assert (=> b!497123 (=> (not res!299501) (not e!291431))))

(assert (=> b!497123 (= res!299501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45260 res!299509) b!497117))

(assert (= (and b!497117 res!299500) b!497114))

(assert (= (and b!497114 res!299505) b!497120))

(assert (= (and b!497120 res!299508) b!497118))

(assert (= (and b!497118 res!299502) b!497121))

(assert (= (and b!497121 res!299506) b!497123))

(assert (= (and b!497123 res!299501) b!497119))

(assert (= (and b!497119 res!299510) b!497122))

(assert (= (and b!497122 res!299503) b!497116))

(assert (= (and b!497122 (not res!299504)) b!497113))

(assert (= (and b!497113 (not res!299507)) b!497115))

(declare-fun m!478451 () Bool)

(assert (=> start!45260 m!478451))

(declare-fun m!478453 () Bool)

(assert (=> start!45260 m!478453))

(declare-fun m!478455 () Bool)

(assert (=> b!497121 m!478455))

(declare-fun m!478457 () Bool)

(assert (=> b!497123 m!478457))

(declare-fun m!478459 () Bool)

(assert (=> b!497119 m!478459))

(declare-fun m!478461 () Bool)

(assert (=> b!497122 m!478461))

(declare-fun m!478463 () Bool)

(assert (=> b!497122 m!478463))

(declare-fun m!478465 () Bool)

(assert (=> b!497122 m!478465))

(declare-fun m!478467 () Bool)

(assert (=> b!497122 m!478467))

(assert (=> b!497122 m!478465))

(declare-fun m!478469 () Bool)

(assert (=> b!497122 m!478469))

(declare-fun m!478471 () Bool)

(assert (=> b!497122 m!478471))

(declare-fun m!478473 () Bool)

(assert (=> b!497122 m!478473))

(assert (=> b!497122 m!478465))

(declare-fun m!478475 () Bool)

(assert (=> b!497122 m!478475))

(assert (=> b!497122 m!478471))

(declare-fun m!478477 () Bool)

(assert (=> b!497122 m!478477))

(assert (=> b!497122 m!478471))

(declare-fun m!478479 () Bool)

(assert (=> b!497118 m!478479))

(assert (=> b!497114 m!478465))

(assert (=> b!497114 m!478465))

(declare-fun m!478481 () Bool)

(assert (=> b!497114 m!478481))

(assert (=> b!497116 m!478465))

(assert (=> b!497116 m!478465))

(declare-fun m!478483 () Bool)

(assert (=> b!497116 m!478483))

(declare-fun m!478485 () Bool)

(assert (=> b!497120 m!478485))

(declare-fun m!478487 () Bool)

(assert (=> b!497115 m!478487))

(assert (=> b!497115 m!478465))

(check-sat (not b!497123) (not b!497121) (not b!497122) (not b!497120) (not b!497119) (not b!497116) (not b!497114) (not start!45260) (not b!497118))
(check-sat)
