; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45248 () Bool)

(assert start!45248)

(declare-fun b!497019 () Bool)

(declare-fun e!291377 () Bool)

(assert (=> b!497019 (= e!291377 true)))

(declare-datatypes ((SeekEntryResult!3874 0))(
  ( (MissingZero!3874 (index!17675 (_ BitVec 32))) (Found!3874 (index!17676 (_ BitVec 32))) (Intermediate!3874 (undefined!4686 Bool) (index!17677 (_ BitVec 32)) (x!46875 (_ BitVec 32))) (Undefined!3874) (MissingVacant!3874 (index!17678 (_ BitVec 32))) )
))
(declare-fun lt!225049 () SeekEntryResult!3874)

(declare-datatypes ((array!32137 0))(
  ( (array!32138 (arr!15451 (Array (_ BitVec 32) (_ BitVec 64))) (size!15815 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32137)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!497019 (and (bvslt (x!46875 lt!225049) #b01111111111111111111111111111110) (or (= (select (arr!15451 a!3235) (index!17677 lt!225049)) (select (arr!15451 a!3235) j!176)) (= (select (arr!15451 a!3235) (index!17677 lt!225049)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15451 a!3235) (index!17677 lt!225049)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497020 () Bool)

(declare-fun res!299464 () Bool)

(declare-fun e!291378 () Bool)

(assert (=> b!497020 (=> (not res!299464) (not e!291378))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497020 (= res!299464 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497021 () Bool)

(declare-fun res!299466 () Bool)

(declare-fun e!291375 () Bool)

(assert (=> b!497021 (=> (not res!299466) (not e!291375))))

(declare-datatypes ((List!9516 0))(
  ( (Nil!9513) (Cons!9512 (h!10383 (_ BitVec 64)) (t!15736 List!9516)) )
))
(declare-fun arrayNoDuplicates!0 (array!32137 (_ BitVec 32) List!9516) Bool)

(assert (=> b!497021 (= res!299466 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9513))))

(declare-fun b!497022 () Bool)

(assert (=> b!497022 (= e!291378 e!291375)))

(declare-fun res!299465 () Bool)

(assert (=> b!497022 (=> (not res!299465) (not e!291375))))

(declare-fun lt!225048 () SeekEntryResult!3874)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!497022 (= res!299465 (or (= lt!225048 (MissingZero!3874 i!1204)) (= lt!225048 (MissingVacant!3874 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32137 (_ BitVec 32)) SeekEntryResult!3874)

(assert (=> b!497022 (= lt!225048 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!497023 () Bool)

(assert (=> b!497023 (= e!291375 (not e!291377))))

(declare-fun res!299468 () Bool)

(assert (=> b!497023 (=> res!299468 e!291377)))

(declare-fun lt!225046 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32137 (_ BitVec 32)) SeekEntryResult!3874)

(assert (=> b!497023 (= res!299468 (= lt!225049 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225046 (select (store (arr!15451 a!3235) i!1204 k0!2280) j!176) (array!32138 (store (arr!15451 a!3235) i!1204 k0!2280) (size!15815 a!3235)) mask!3524)))))

(declare-fun lt!225047 () (_ BitVec 32))

(assert (=> b!497023 (= lt!225049 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225047 (select (arr!15451 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497023 (= lt!225046 (toIndex!0 (select (store (arr!15451 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!497023 (= lt!225047 (toIndex!0 (select (arr!15451 a!3235) j!176) mask!3524))))

(declare-fun e!291376 () Bool)

(assert (=> b!497023 e!291376))

(declare-fun res!299467 () Bool)

(assert (=> b!497023 (=> (not res!299467) (not e!291376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32137 (_ BitVec 32)) Bool)

(assert (=> b!497023 (= res!299467 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14755 0))(
  ( (Unit!14756) )
))
(declare-fun lt!225045 () Unit!14755)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32137 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14755)

(assert (=> b!497023 (= lt!225045 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!299469 () Bool)

(assert (=> start!45248 (=> (not res!299469) (not e!291378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45248 (= res!299469 (validMask!0 mask!3524))))

(assert (=> start!45248 e!291378))

(assert (=> start!45248 true))

(declare-fun array_inv!11310 (array!32137) Bool)

(assert (=> start!45248 (array_inv!11310 a!3235)))

(declare-fun b!497024 () Bool)

(declare-fun res!299461 () Bool)

(assert (=> b!497024 (=> (not res!299461) (not e!291378))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497024 (= res!299461 (validKeyInArray!0 k0!2280))))

(declare-fun b!497025 () Bool)

(assert (=> b!497025 (= e!291376 (= (seekEntryOrOpen!0 (select (arr!15451 a!3235) j!176) a!3235 mask!3524) (Found!3874 j!176)))))

(declare-fun b!497026 () Bool)

(declare-fun res!299462 () Bool)

(assert (=> b!497026 (=> (not res!299462) (not e!291378))))

(assert (=> b!497026 (= res!299462 (validKeyInArray!0 (select (arr!15451 a!3235) j!176)))))

(declare-fun b!497027 () Bool)

(declare-fun res!299460 () Bool)

(assert (=> b!497027 (=> (not res!299460) (not e!291375))))

(assert (=> b!497027 (= res!299460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497028 () Bool)

(declare-fun res!299463 () Bool)

(assert (=> b!497028 (=> res!299463 e!291377)))

(get-info :version)

(assert (=> b!497028 (= res!299463 (or (undefined!4686 lt!225049) (not ((_ is Intermediate!3874) lt!225049))))))

(declare-fun b!497029 () Bool)

(declare-fun res!299470 () Bool)

(assert (=> b!497029 (=> (not res!299470) (not e!291378))))

(assert (=> b!497029 (= res!299470 (and (= (size!15815 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15815 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15815 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45248 res!299469) b!497029))

(assert (= (and b!497029 res!299470) b!497026))

(assert (= (and b!497026 res!299462) b!497024))

(assert (= (and b!497024 res!299461) b!497020))

(assert (= (and b!497020 res!299464) b!497022))

(assert (= (and b!497022 res!299465) b!497027))

(assert (= (and b!497027 res!299460) b!497021))

(assert (= (and b!497021 res!299466) b!497023))

(assert (= (and b!497023 res!299467) b!497025))

(assert (= (and b!497023 (not res!299468)) b!497028))

(assert (= (and b!497028 (not res!299463)) b!497019))

(declare-fun m!478597 () Bool)

(assert (=> b!497020 m!478597))

(declare-fun m!478599 () Bool)

(assert (=> b!497025 m!478599))

(assert (=> b!497025 m!478599))

(declare-fun m!478601 () Bool)

(assert (=> b!497025 m!478601))

(assert (=> b!497026 m!478599))

(assert (=> b!497026 m!478599))

(declare-fun m!478603 () Bool)

(assert (=> b!497026 m!478603))

(declare-fun m!478605 () Bool)

(assert (=> b!497019 m!478605))

(assert (=> b!497019 m!478599))

(declare-fun m!478607 () Bool)

(assert (=> start!45248 m!478607))

(declare-fun m!478609 () Bool)

(assert (=> start!45248 m!478609))

(declare-fun m!478611 () Bool)

(assert (=> b!497024 m!478611))

(declare-fun m!478613 () Bool)

(assert (=> b!497027 m!478613))

(declare-fun m!478615 () Bool)

(assert (=> b!497023 m!478615))

(declare-fun m!478617 () Bool)

(assert (=> b!497023 m!478617))

(declare-fun m!478619 () Bool)

(assert (=> b!497023 m!478619))

(assert (=> b!497023 m!478599))

(declare-fun m!478621 () Bool)

(assert (=> b!497023 m!478621))

(assert (=> b!497023 m!478599))

(declare-fun m!478623 () Bool)

(assert (=> b!497023 m!478623))

(assert (=> b!497023 m!478619))

(declare-fun m!478625 () Bool)

(assert (=> b!497023 m!478625))

(assert (=> b!497023 m!478599))

(declare-fun m!478627 () Bool)

(assert (=> b!497023 m!478627))

(assert (=> b!497023 m!478619))

(declare-fun m!478629 () Bool)

(assert (=> b!497023 m!478629))

(declare-fun m!478631 () Bool)

(assert (=> b!497022 m!478631))

(declare-fun m!478633 () Bool)

(assert (=> b!497021 m!478633))

(check-sat (not b!497025) (not b!497022) (not b!497026) (not b!497020) (not b!497024) (not b!497021) (not b!497027) (not start!45248) (not b!497023))
(check-sat)
