; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47786 () Bool)

(assert start!47786)

(declare-fun b!526455 () Bool)

(declare-fun res!323121 () Bool)

(declare-fun e!306864 () Bool)

(assert (=> b!526455 (=> (not res!323121) (not e!306864))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526455 (= res!323121 (validKeyInArray!0 k0!2280))))

(declare-fun b!526456 () Bool)

(declare-fun res!323129 () Bool)

(assert (=> b!526456 (=> (not res!323129) (not e!306864))))

(declare-datatypes ((array!33424 0))(
  ( (array!33425 (arr!16063 (Array (_ BitVec 32) (_ BitVec 64))) (size!16427 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33424)

(declare-fun arrayContainsKey!0 (array!33424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526456 (= res!323129 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!323130 () Bool)

(assert (=> start!47786 (=> (not res!323130) (not e!306864))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47786 (= res!323130 (validMask!0 mask!3524))))

(assert (=> start!47786 e!306864))

(assert (=> start!47786 true))

(declare-fun array_inv!11922 (array!33424) Bool)

(assert (=> start!47786 (array_inv!11922 a!3235)))

(declare-fun b!526457 () Bool)

(declare-fun res!323124 () Bool)

(assert (=> b!526457 (=> (not res!323124) (not e!306864))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!526457 (= res!323124 (validKeyInArray!0 (select (arr!16063 a!3235) j!176)))))

(declare-fun b!526458 () Bool)

(declare-fun res!323127 () Bool)

(declare-fun e!306859 () Bool)

(assert (=> b!526458 (=> (not res!323127) (not e!306859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33424 (_ BitVec 32)) Bool)

(assert (=> b!526458 (= res!323127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526459 () Bool)

(declare-fun e!306862 () Bool)

(assert (=> b!526459 (= e!306859 (not e!306862))))

(declare-fun res!323123 () Bool)

(assert (=> b!526459 (=> res!323123 e!306862)))

(declare-fun lt!242177 () (_ BitVec 64))

(declare-fun lt!242185 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4486 0))(
  ( (MissingZero!4486 (index!20156 (_ BitVec 32))) (Found!4486 (index!20157 (_ BitVec 32))) (Intermediate!4486 (undefined!5298 Bool) (index!20158 (_ BitVec 32)) (x!49272 (_ BitVec 32))) (Undefined!4486) (MissingVacant!4486 (index!20159 (_ BitVec 32))) )
))
(declare-fun lt!242182 () SeekEntryResult!4486)

(declare-fun lt!242180 () array!33424)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33424 (_ BitVec 32)) SeekEntryResult!4486)

(assert (=> b!526459 (= res!323123 (= lt!242182 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242185 lt!242177 lt!242180 mask!3524)))))

(declare-fun lt!242181 () (_ BitVec 32))

(assert (=> b!526459 (= lt!242182 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242181 (select (arr!16063 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526459 (= lt!242185 (toIndex!0 lt!242177 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!526459 (= lt!242177 (select (store (arr!16063 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!526459 (= lt!242181 (toIndex!0 (select (arr!16063 a!3235) j!176) mask!3524))))

(assert (=> b!526459 (= lt!242180 (array!33425 (store (arr!16063 a!3235) i!1204 k0!2280) (size!16427 a!3235)))))

(declare-fun e!306858 () Bool)

(assert (=> b!526459 e!306858))

(declare-fun res!323128 () Bool)

(assert (=> b!526459 (=> (not res!323128) (not e!306858))))

(assert (=> b!526459 (= res!323128 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16555 0))(
  ( (Unit!16556) )
))
(declare-fun lt!242179 () Unit!16555)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33424 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16555)

(assert (=> b!526459 (= lt!242179 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526460 () Bool)

(assert (=> b!526460 (= e!306862 true)))

(assert (=> b!526460 (= (index!20158 lt!242182) i!1204)))

(declare-fun lt!242176 () Unit!16555)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33424 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16555)

(assert (=> b!526460 (= lt!242176 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242181 #b00000000000000000000000000000000 (index!20158 lt!242182) (x!49272 lt!242182) mask!3524))))

(assert (=> b!526460 (and (or (= (select (arr!16063 a!3235) (index!20158 lt!242182)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16063 a!3235) (index!20158 lt!242182)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16063 a!3235) (index!20158 lt!242182)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16063 a!3235) (index!20158 lt!242182)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242183 () Unit!16555)

(declare-fun e!306861 () Unit!16555)

(assert (=> b!526460 (= lt!242183 e!306861)))

(declare-fun c!61973 () Bool)

(assert (=> b!526460 (= c!61973 (= (select (arr!16063 a!3235) (index!20158 lt!242182)) (select (arr!16063 a!3235) j!176)))))

(assert (=> b!526460 (and (bvslt (x!49272 lt!242182) #b01111111111111111111111111111110) (or (= (select (arr!16063 a!3235) (index!20158 lt!242182)) (select (arr!16063 a!3235) j!176)) (= (select (arr!16063 a!3235) (index!20158 lt!242182)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16063 a!3235) (index!20158 lt!242182)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526461 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33424 (_ BitVec 32)) SeekEntryResult!4486)

(assert (=> b!526461 (= e!306858 (= (seekEntryOrOpen!0 (select (arr!16063 a!3235) j!176) a!3235 mask!3524) (Found!4486 j!176)))))

(declare-fun b!526462 () Bool)

(declare-fun res!323122 () Bool)

(assert (=> b!526462 (=> (not res!323122) (not e!306859))))

(declare-datatypes ((List!10128 0))(
  ( (Nil!10125) (Cons!10124 (h!11055 (_ BitVec 64)) (t!16348 List!10128)) )
))
(declare-fun arrayNoDuplicates!0 (array!33424 (_ BitVec 32) List!10128) Bool)

(assert (=> b!526462 (= res!323122 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10125))))

(declare-fun b!526463 () Bool)

(declare-fun e!306863 () Bool)

(assert (=> b!526463 (= e!306863 false)))

(declare-fun b!526464 () Bool)

(declare-fun Unit!16557 () Unit!16555)

(assert (=> b!526464 (= e!306861 Unit!16557)))

(declare-fun lt!242178 () Unit!16555)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33424 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16555)

(assert (=> b!526464 (= lt!242178 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242181 #b00000000000000000000000000000000 (index!20158 lt!242182) (x!49272 lt!242182) mask!3524))))

(declare-fun res!323125 () Bool)

(assert (=> b!526464 (= res!323125 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242181 lt!242177 lt!242180 mask!3524) (Intermediate!4486 false (index!20158 lt!242182) (x!49272 lt!242182))))))

(assert (=> b!526464 (=> (not res!323125) (not e!306863))))

(assert (=> b!526464 e!306863))

(declare-fun b!526465 () Bool)

(assert (=> b!526465 (= e!306864 e!306859)))

(declare-fun res!323131 () Bool)

(assert (=> b!526465 (=> (not res!323131) (not e!306859))))

(declare-fun lt!242184 () SeekEntryResult!4486)

(assert (=> b!526465 (= res!323131 (or (= lt!242184 (MissingZero!4486 i!1204)) (= lt!242184 (MissingVacant!4486 i!1204))))))

(assert (=> b!526465 (= lt!242184 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!526466 () Bool)

(declare-fun Unit!16558 () Unit!16555)

(assert (=> b!526466 (= e!306861 Unit!16558)))

(declare-fun b!526467 () Bool)

(declare-fun res!323126 () Bool)

(assert (=> b!526467 (=> (not res!323126) (not e!306864))))

(assert (=> b!526467 (= res!323126 (and (= (size!16427 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16427 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16427 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526468 () Bool)

(declare-fun res!323120 () Bool)

(assert (=> b!526468 (=> res!323120 e!306862)))

(get-info :version)

(assert (=> b!526468 (= res!323120 (or (undefined!5298 lt!242182) (not ((_ is Intermediate!4486) lt!242182))))))

(assert (= (and start!47786 res!323130) b!526467))

(assert (= (and b!526467 res!323126) b!526457))

(assert (= (and b!526457 res!323124) b!526455))

(assert (= (and b!526455 res!323121) b!526456))

(assert (= (and b!526456 res!323129) b!526465))

(assert (= (and b!526465 res!323131) b!526458))

(assert (= (and b!526458 res!323127) b!526462))

(assert (= (and b!526462 res!323122) b!526459))

(assert (= (and b!526459 res!323128) b!526461))

(assert (= (and b!526459 (not res!323123)) b!526468))

(assert (= (and b!526468 (not res!323120)) b!526460))

(assert (= (and b!526460 c!61973) b!526464))

(assert (= (and b!526460 (not c!61973)) b!526466))

(assert (= (and b!526464 res!323125) b!526463))

(declare-fun m!507409 () Bool)

(assert (=> b!526461 m!507409))

(assert (=> b!526461 m!507409))

(declare-fun m!507411 () Bool)

(assert (=> b!526461 m!507411))

(declare-fun m!507413 () Bool)

(assert (=> b!526460 m!507413))

(declare-fun m!507415 () Bool)

(assert (=> b!526460 m!507415))

(assert (=> b!526460 m!507409))

(declare-fun m!507417 () Bool)

(assert (=> b!526455 m!507417))

(declare-fun m!507419 () Bool)

(assert (=> b!526456 m!507419))

(declare-fun m!507421 () Bool)

(assert (=> b!526464 m!507421))

(declare-fun m!507423 () Bool)

(assert (=> b!526464 m!507423))

(declare-fun m!507425 () Bool)

(assert (=> b!526465 m!507425))

(declare-fun m!507427 () Bool)

(assert (=> b!526462 m!507427))

(declare-fun m!507429 () Bool)

(assert (=> start!47786 m!507429))

(declare-fun m!507431 () Bool)

(assert (=> start!47786 m!507431))

(declare-fun m!507433 () Bool)

(assert (=> b!526459 m!507433))

(declare-fun m!507435 () Bool)

(assert (=> b!526459 m!507435))

(declare-fun m!507437 () Bool)

(assert (=> b!526459 m!507437))

(declare-fun m!507439 () Bool)

(assert (=> b!526459 m!507439))

(declare-fun m!507441 () Bool)

(assert (=> b!526459 m!507441))

(assert (=> b!526459 m!507409))

(declare-fun m!507443 () Bool)

(assert (=> b!526459 m!507443))

(assert (=> b!526459 m!507409))

(declare-fun m!507445 () Bool)

(assert (=> b!526459 m!507445))

(assert (=> b!526459 m!507409))

(declare-fun m!507447 () Bool)

(assert (=> b!526459 m!507447))

(declare-fun m!507449 () Bool)

(assert (=> b!526458 m!507449))

(assert (=> b!526457 m!507409))

(assert (=> b!526457 m!507409))

(declare-fun m!507451 () Bool)

(assert (=> b!526457 m!507451))

(check-sat (not start!47786) (not b!526465) (not b!526459) (not b!526456) (not b!526455) (not b!526464) (not b!526458) (not b!526461) (not b!526457) (not b!526460) (not b!526462))
(check-sat)
