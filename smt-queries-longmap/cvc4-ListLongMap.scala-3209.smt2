; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45004 () Bool)

(assert start!45004)

(declare-fun b!493706 () Bool)

(declare-fun res!296278 () Bool)

(declare-fun e!289892 () Bool)

(assert (=> b!493706 (=> res!296278 e!289892)))

(declare-datatypes ((SeekEntryResult!3826 0))(
  ( (MissingZero!3826 (index!17483 (_ BitVec 32))) (Found!3826 (index!17484 (_ BitVec 32))) (Intermediate!3826 (undefined!4638 Bool) (index!17485 (_ BitVec 32)) (x!46560 (_ BitVec 32))) (Undefined!3826) (MissingVacant!3826 (index!17486 (_ BitVec 32))) )
))
(declare-fun lt!223331 () SeekEntryResult!3826)

(assert (=> b!493706 (= res!296278 (or (not (is-Intermediate!3826 lt!223331)) (not (undefined!4638 lt!223331))))))

(declare-fun b!493707 () Bool)

(declare-fun res!296285 () Bool)

(declare-fun e!289893 () Bool)

(assert (=> b!493707 (=> (not res!296285) (not e!289893))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!31949 0))(
  ( (array!31950 (arr!15359 (Array (_ BitVec 32) (_ BitVec 64))) (size!15723 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31949)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!493707 (= res!296285 (and (= (size!15723 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15723 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15723 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493708 () Bool)

(declare-fun e!289891 () Bool)

(assert (=> b!493708 (= e!289893 e!289891)))

(declare-fun res!296277 () Bool)

(assert (=> b!493708 (=> (not res!296277) (not e!289891))))

(declare-fun lt!223333 () SeekEntryResult!3826)

(assert (=> b!493708 (= res!296277 (or (= lt!223333 (MissingZero!3826 i!1204)) (= lt!223333 (MissingVacant!3826 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31949 (_ BitVec 32)) SeekEntryResult!3826)

(assert (=> b!493708 (= lt!223333 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!296279 () Bool)

(assert (=> start!45004 (=> (not res!296279) (not e!289893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45004 (= res!296279 (validMask!0 mask!3524))))

(assert (=> start!45004 e!289893))

(assert (=> start!45004 true))

(declare-fun array_inv!11155 (array!31949) Bool)

(assert (=> start!45004 (array_inv!11155 a!3235)))

(declare-fun b!493709 () Bool)

(declare-fun res!296283 () Bool)

(assert (=> b!493709 (=> (not res!296283) (not e!289891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31949 (_ BitVec 32)) Bool)

(assert (=> b!493709 (= res!296283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493710 () Bool)

(assert (=> b!493710 (= e!289892 true)))

(declare-fun lt!223335 () SeekEntryResult!3826)

(assert (=> b!493710 (= lt!223335 Undefined!3826)))

(declare-fun b!493711 () Bool)

(declare-fun res!296280 () Bool)

(assert (=> b!493711 (=> (not res!296280) (not e!289893))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493711 (= res!296280 (validKeyInArray!0 k!2280))))

(declare-fun b!493712 () Bool)

(assert (=> b!493712 (= e!289891 (not e!289892))))

(declare-fun res!296281 () Bool)

(assert (=> b!493712 (=> res!296281 e!289892)))

(declare-fun lt!223336 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31949 (_ BitVec 32)) SeekEntryResult!3826)

(assert (=> b!493712 (= res!296281 (= lt!223331 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223336 (select (store (arr!15359 a!3235) i!1204 k!2280) j!176) (array!31950 (store (arr!15359 a!3235) i!1204 k!2280) (size!15723 a!3235)) mask!3524)))))

(declare-fun lt!223334 () (_ BitVec 32))

(assert (=> b!493712 (= lt!223331 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223334 (select (arr!15359 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493712 (= lt!223336 (toIndex!0 (select (store (arr!15359 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!493712 (= lt!223334 (toIndex!0 (select (arr!15359 a!3235) j!176) mask!3524))))

(assert (=> b!493712 (= lt!223335 (Found!3826 j!176))))

(assert (=> b!493712 (= lt!223335 (seekEntryOrOpen!0 (select (arr!15359 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!493712 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14598 0))(
  ( (Unit!14599) )
))
(declare-fun lt!223332 () Unit!14598)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31949 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14598)

(assert (=> b!493712 (= lt!223332 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493713 () Bool)

(declare-fun res!296284 () Bool)

(assert (=> b!493713 (=> (not res!296284) (not e!289893))))

(declare-fun arrayContainsKey!0 (array!31949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493713 (= res!296284 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493714 () Bool)

(declare-fun res!296276 () Bool)

(assert (=> b!493714 (=> (not res!296276) (not e!289893))))

(assert (=> b!493714 (= res!296276 (validKeyInArray!0 (select (arr!15359 a!3235) j!176)))))

(declare-fun b!493715 () Bool)

(declare-fun res!296282 () Bool)

(assert (=> b!493715 (=> (not res!296282) (not e!289891))))

(declare-datatypes ((List!9517 0))(
  ( (Nil!9514) (Cons!9513 (h!10381 (_ BitVec 64)) (t!15745 List!9517)) )
))
(declare-fun arrayNoDuplicates!0 (array!31949 (_ BitVec 32) List!9517) Bool)

(assert (=> b!493715 (= res!296282 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9514))))

(assert (= (and start!45004 res!296279) b!493707))

(assert (= (and b!493707 res!296285) b!493714))

(assert (= (and b!493714 res!296276) b!493711))

(assert (= (and b!493711 res!296280) b!493713))

(assert (= (and b!493713 res!296284) b!493708))

(assert (= (and b!493708 res!296277) b!493709))

(assert (= (and b!493709 res!296283) b!493715))

(assert (= (and b!493715 res!296282) b!493712))

(assert (= (and b!493712 (not res!296281)) b!493706))

(assert (= (and b!493706 (not res!296278)) b!493710))

(declare-fun m!474603 () Bool)

(assert (=> start!45004 m!474603))

(declare-fun m!474605 () Bool)

(assert (=> start!45004 m!474605))

(declare-fun m!474607 () Bool)

(assert (=> b!493709 m!474607))

(declare-fun m!474609 () Bool)

(assert (=> b!493708 m!474609))

(declare-fun m!474611 () Bool)

(assert (=> b!493713 m!474611))

(declare-fun m!474613 () Bool)

(assert (=> b!493715 m!474613))

(declare-fun m!474615 () Bool)

(assert (=> b!493712 m!474615))

(declare-fun m!474617 () Bool)

(assert (=> b!493712 m!474617))

(declare-fun m!474619 () Bool)

(assert (=> b!493712 m!474619))

(declare-fun m!474621 () Bool)

(assert (=> b!493712 m!474621))

(declare-fun m!474623 () Bool)

(assert (=> b!493712 m!474623))

(assert (=> b!493712 m!474621))

(declare-fun m!474625 () Bool)

(assert (=> b!493712 m!474625))

(assert (=> b!493712 m!474621))

(declare-fun m!474627 () Bool)

(assert (=> b!493712 m!474627))

(assert (=> b!493712 m!474619))

(declare-fun m!474629 () Bool)

(assert (=> b!493712 m!474629))

(assert (=> b!493712 m!474621))

(declare-fun m!474631 () Bool)

(assert (=> b!493712 m!474631))

(assert (=> b!493712 m!474619))

(declare-fun m!474633 () Bool)

(assert (=> b!493712 m!474633))

(assert (=> b!493714 m!474621))

(assert (=> b!493714 m!474621))

(declare-fun m!474635 () Bool)

(assert (=> b!493714 m!474635))

(declare-fun m!474637 () Bool)

(assert (=> b!493711 m!474637))

(push 1)

