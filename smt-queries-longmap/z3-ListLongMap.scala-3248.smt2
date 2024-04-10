; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45362 () Bool)

(assert start!45362)

(declare-fun b!498108 () Bool)

(declare-fun res!300258 () Bool)

(declare-fun e!291966 () Bool)

(assert (=> b!498108 (=> (not res!300258) (not e!291966))))

(declare-datatypes ((array!32187 0))(
  ( (array!32188 (arr!15475 (Array (_ BitVec 32) (_ BitVec 64))) (size!15839 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32187)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498108 (= res!300258 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498109 () Bool)

(declare-datatypes ((Unit!14844 0))(
  ( (Unit!14845) )
))
(declare-fun e!291960 () Unit!14844)

(declare-fun Unit!14846 () Unit!14844)

(assert (=> b!498109 (= e!291960 Unit!14846)))

(declare-datatypes ((SeekEntryResult!3942 0))(
  ( (MissingZero!3942 (index!17950 (_ BitVec 32))) (Found!3942 (index!17951 (_ BitVec 32))) (Intermediate!3942 (undefined!4754 Bool) (index!17952 (_ BitVec 32)) (x!47003 (_ BitVec 32))) (Undefined!3942) (MissingVacant!3942 (index!17953 (_ BitVec 32))) )
))
(declare-fun lt!225566 () SeekEntryResult!3942)

(declare-fun lt!225559 () Unit!14844)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!225562 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32187 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14844)

(assert (=> b!498109 (= lt!225559 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225562 #b00000000000000000000000000000000 (index!17952 lt!225566) (x!47003 lt!225566) mask!3524))))

(declare-fun lt!225560 () array!32187)

(declare-fun res!300251 () Bool)

(declare-fun lt!225561 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32187 (_ BitVec 32)) SeekEntryResult!3942)

(assert (=> b!498109 (= res!300251 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225562 lt!225561 lt!225560 mask!3524) (Intermediate!3942 false (index!17952 lt!225566) (x!47003 lt!225566))))))

(declare-fun e!291963 () Bool)

(assert (=> b!498109 (=> (not res!300251) (not e!291963))))

(assert (=> b!498109 e!291963))

(declare-fun b!498110 () Bool)

(declare-fun res!300255 () Bool)

(declare-fun e!291962 () Bool)

(assert (=> b!498110 (=> res!300255 e!291962)))

(get-info :version)

(assert (=> b!498110 (= res!300255 (or (undefined!4754 lt!225566) (not ((_ is Intermediate!3942) lt!225566))))))

(declare-fun b!498111 () Bool)

(declare-fun Unit!14847 () Unit!14844)

(assert (=> b!498111 (= e!291960 Unit!14847)))

(declare-fun b!498112 () Bool)

(declare-fun res!300248 () Bool)

(assert (=> b!498112 (=> (not res!300248) (not e!291966))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498112 (= res!300248 (validKeyInArray!0 k0!2280))))

(declare-fun b!498113 () Bool)

(declare-fun res!300257 () Bool)

(assert (=> b!498113 (=> (not res!300257) (not e!291966))))

(assert (=> b!498113 (= res!300257 (and (= (size!15839 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15839 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15839 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498114 () Bool)

(declare-fun e!291965 () Bool)

(assert (=> b!498114 (= e!291966 e!291965)))

(declare-fun res!300259 () Bool)

(assert (=> b!498114 (=> (not res!300259) (not e!291965))))

(declare-fun lt!225568 () SeekEntryResult!3942)

(assert (=> b!498114 (= res!300259 (or (= lt!225568 (MissingZero!3942 i!1204)) (= lt!225568 (MissingVacant!3942 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32187 (_ BitVec 32)) SeekEntryResult!3942)

(assert (=> b!498114 (= lt!225568 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!498115 () Bool)

(declare-fun e!291959 () Bool)

(assert (=> b!498115 (= e!291962 e!291959)))

(declare-fun res!300249 () Bool)

(assert (=> b!498115 (=> res!300249 e!291959)))

(assert (=> b!498115 (= res!300249 (or (bvsgt #b00000000000000000000000000000000 (x!47003 lt!225566)) (bvsgt (x!47003 lt!225566) #b01111111111111111111111111111110) (bvslt lt!225562 #b00000000000000000000000000000000) (bvsge lt!225562 (size!15839 a!3235)) (bvslt (index!17952 lt!225566) #b00000000000000000000000000000000) (bvsge (index!17952 lt!225566) (size!15839 a!3235)) (not (= lt!225566 (Intermediate!3942 false (index!17952 lt!225566) (x!47003 lt!225566))))))))

(assert (=> b!498115 (and (or (= (select (arr!15475 a!3235) (index!17952 lt!225566)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15475 a!3235) (index!17952 lt!225566)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15475 a!3235) (index!17952 lt!225566)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15475 a!3235) (index!17952 lt!225566)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225564 () Unit!14844)

(assert (=> b!498115 (= lt!225564 e!291960)))

(declare-fun c!59207 () Bool)

(assert (=> b!498115 (= c!59207 (= (select (arr!15475 a!3235) (index!17952 lt!225566)) (select (arr!15475 a!3235) j!176)))))

(assert (=> b!498115 (and (bvslt (x!47003 lt!225566) #b01111111111111111111111111111110) (or (= (select (arr!15475 a!3235) (index!17952 lt!225566)) (select (arr!15475 a!3235) j!176)) (= (select (arr!15475 a!3235) (index!17952 lt!225566)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15475 a!3235) (index!17952 lt!225566)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498116 () Bool)

(assert (=> b!498116 (= e!291965 (not e!291962))))

(declare-fun res!300253 () Bool)

(assert (=> b!498116 (=> res!300253 e!291962)))

(declare-fun lt!225565 () (_ BitVec 32))

(assert (=> b!498116 (= res!300253 (= lt!225566 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225565 lt!225561 lt!225560 mask!3524)))))

(assert (=> b!498116 (= lt!225566 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225562 (select (arr!15475 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498116 (= lt!225565 (toIndex!0 lt!225561 mask!3524))))

(assert (=> b!498116 (= lt!225561 (select (store (arr!15475 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!498116 (= lt!225562 (toIndex!0 (select (arr!15475 a!3235) j!176) mask!3524))))

(assert (=> b!498116 (= lt!225560 (array!32188 (store (arr!15475 a!3235) i!1204 k0!2280) (size!15839 a!3235)))))

(declare-fun e!291964 () Bool)

(assert (=> b!498116 e!291964))

(declare-fun res!300252 () Bool)

(assert (=> b!498116 (=> (not res!300252) (not e!291964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32187 (_ BitVec 32)) Bool)

(assert (=> b!498116 (= res!300252 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225563 () Unit!14844)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32187 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14844)

(assert (=> b!498116 (= lt!225563 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!498117 () Bool)

(assert (=> b!498117 (= e!291959 true)))

(declare-fun lt!225567 () SeekEntryResult!3942)

(assert (=> b!498117 (= lt!225567 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225562 lt!225561 lt!225560 mask!3524))))

(declare-fun res!300254 () Bool)

(assert (=> start!45362 (=> (not res!300254) (not e!291966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45362 (= res!300254 (validMask!0 mask!3524))))

(assert (=> start!45362 e!291966))

(assert (=> start!45362 true))

(declare-fun array_inv!11271 (array!32187) Bool)

(assert (=> start!45362 (array_inv!11271 a!3235)))

(declare-fun b!498118 () Bool)

(declare-fun res!300256 () Bool)

(assert (=> b!498118 (=> (not res!300256) (not e!291965))))

(declare-datatypes ((List!9633 0))(
  ( (Nil!9630) (Cons!9629 (h!10503 (_ BitVec 64)) (t!15861 List!9633)) )
))
(declare-fun arrayNoDuplicates!0 (array!32187 (_ BitVec 32) List!9633) Bool)

(assert (=> b!498118 (= res!300256 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9630))))

(declare-fun b!498119 () Bool)

(declare-fun res!300250 () Bool)

(assert (=> b!498119 (=> (not res!300250) (not e!291966))))

(assert (=> b!498119 (= res!300250 (validKeyInArray!0 (select (arr!15475 a!3235) j!176)))))

(declare-fun b!498120 () Bool)

(declare-fun res!300260 () Bool)

(assert (=> b!498120 (=> (not res!300260) (not e!291965))))

(assert (=> b!498120 (= res!300260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498121 () Bool)

(assert (=> b!498121 (= e!291963 false)))

(declare-fun b!498122 () Bool)

(assert (=> b!498122 (= e!291964 (= (seekEntryOrOpen!0 (select (arr!15475 a!3235) j!176) a!3235 mask!3524) (Found!3942 j!176)))))

(assert (= (and start!45362 res!300254) b!498113))

(assert (= (and b!498113 res!300257) b!498119))

(assert (= (and b!498119 res!300250) b!498112))

(assert (= (and b!498112 res!300248) b!498108))

(assert (= (and b!498108 res!300258) b!498114))

(assert (= (and b!498114 res!300259) b!498120))

(assert (= (and b!498120 res!300260) b!498118))

(assert (= (and b!498118 res!300256) b!498116))

(assert (= (and b!498116 res!300252) b!498122))

(assert (= (and b!498116 (not res!300253)) b!498110))

(assert (= (and b!498110 (not res!300255)) b!498115))

(assert (= (and b!498115 c!59207) b!498109))

(assert (= (and b!498115 (not c!59207)) b!498111))

(assert (= (and b!498109 res!300251) b!498121))

(assert (= (and b!498115 (not res!300249)) b!498117))

(declare-fun m!479397 () Bool)

(assert (=> b!498114 m!479397))

(declare-fun m!479399 () Bool)

(assert (=> b!498117 m!479399))

(declare-fun m!479401 () Bool)

(assert (=> b!498112 m!479401))

(declare-fun m!479403 () Bool)

(assert (=> b!498119 m!479403))

(assert (=> b!498119 m!479403))

(declare-fun m!479405 () Bool)

(assert (=> b!498119 m!479405))

(declare-fun m!479407 () Bool)

(assert (=> b!498109 m!479407))

(assert (=> b!498109 m!479399))

(declare-fun m!479409 () Bool)

(assert (=> b!498118 m!479409))

(assert (=> b!498122 m!479403))

(assert (=> b!498122 m!479403))

(declare-fun m!479411 () Bool)

(assert (=> b!498122 m!479411))

(declare-fun m!479413 () Bool)

(assert (=> b!498120 m!479413))

(declare-fun m!479415 () Bool)

(assert (=> b!498115 m!479415))

(assert (=> b!498115 m!479403))

(declare-fun m!479417 () Bool)

(assert (=> b!498108 m!479417))

(declare-fun m!479419 () Bool)

(assert (=> b!498116 m!479419))

(declare-fun m!479421 () Bool)

(assert (=> b!498116 m!479421))

(declare-fun m!479423 () Bool)

(assert (=> b!498116 m!479423))

(declare-fun m!479425 () Bool)

(assert (=> b!498116 m!479425))

(assert (=> b!498116 m!479403))

(declare-fun m!479427 () Bool)

(assert (=> b!498116 m!479427))

(assert (=> b!498116 m!479403))

(declare-fun m!479429 () Bool)

(assert (=> b!498116 m!479429))

(declare-fun m!479431 () Bool)

(assert (=> b!498116 m!479431))

(assert (=> b!498116 m!479403))

(declare-fun m!479433 () Bool)

(assert (=> b!498116 m!479433))

(declare-fun m!479435 () Bool)

(assert (=> start!45362 m!479435))

(declare-fun m!479437 () Bool)

(assert (=> start!45362 m!479437))

(check-sat (not b!498122) (not start!45362) (not b!498109) (not b!498114) (not b!498108) (not b!498112) (not b!498118) (not b!498116) (not b!498117) (not b!498120) (not b!498119))
(check-sat)
