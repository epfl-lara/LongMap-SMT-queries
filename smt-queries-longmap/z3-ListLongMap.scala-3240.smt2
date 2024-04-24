; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45236 () Bool)

(assert start!45236)

(declare-fun b!496821 () Bool)

(declare-fun res!299265 () Bool)

(declare-fun e!291286 () Bool)

(assert (=> b!496821 (=> res!299265 e!291286)))

(declare-datatypes ((SeekEntryResult!3868 0))(
  ( (MissingZero!3868 (index!17651 (_ BitVec 32))) (Found!3868 (index!17652 (_ BitVec 32))) (Intermediate!3868 (undefined!4680 Bool) (index!17653 (_ BitVec 32)) (x!46853 (_ BitVec 32))) (Undefined!3868) (MissingVacant!3868 (index!17654 (_ BitVec 32))) )
))
(declare-fun lt!224959 () SeekEntryResult!3868)

(get-info :version)

(assert (=> b!496821 (= res!299265 (or (undefined!4680 lt!224959) (not ((_ is Intermediate!3868) lt!224959))))))

(declare-fun res!299272 () Bool)

(declare-fun e!291288 () Bool)

(assert (=> start!45236 (=> (not res!299272) (not e!291288))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45236 (= res!299272 (validMask!0 mask!3524))))

(assert (=> start!45236 e!291288))

(assert (=> start!45236 true))

(declare-datatypes ((array!32125 0))(
  ( (array!32126 (arr!15445 (Array (_ BitVec 32) (_ BitVec 64))) (size!15809 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32125)

(declare-fun array_inv!11304 (array!32125) Bool)

(assert (=> start!45236 (array_inv!11304 a!3235)))

(declare-fun b!496822 () Bool)

(declare-fun e!291284 () Bool)

(assert (=> b!496822 (= e!291288 e!291284)))

(declare-fun res!299267 () Bool)

(assert (=> b!496822 (=> (not res!299267) (not e!291284))))

(declare-fun lt!224955 () SeekEntryResult!3868)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!496822 (= res!299267 (or (= lt!224955 (MissingZero!3868 i!1204)) (= lt!224955 (MissingVacant!3868 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32125 (_ BitVec 32)) SeekEntryResult!3868)

(assert (=> b!496822 (= lt!224955 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!496823 () Bool)

(declare-fun res!299268 () Bool)

(assert (=> b!496823 (=> (not res!299268) (not e!291288))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!496823 (= res!299268 (and (= (size!15809 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15809 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15809 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496824 () Bool)

(declare-fun res!299263 () Bool)

(assert (=> b!496824 (=> (not res!299263) (not e!291288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496824 (= res!299263 (validKeyInArray!0 k0!2280))))

(declare-fun b!496825 () Bool)

(declare-fun res!299262 () Bool)

(assert (=> b!496825 (=> (not res!299262) (not e!291284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32125 (_ BitVec 32)) Bool)

(assert (=> b!496825 (= res!299262 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496826 () Bool)

(declare-fun res!299271 () Bool)

(assert (=> b!496826 (=> (not res!299271) (not e!291288))))

(declare-fun arrayContainsKey!0 (array!32125 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496826 (= res!299271 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496827 () Bool)

(assert (=> b!496827 (= e!291286 true)))

(assert (=> b!496827 (and (bvslt (x!46853 lt!224959) #b01111111111111111111111111111110) (or (= (select (arr!15445 a!3235) (index!17653 lt!224959)) (select (arr!15445 a!3235) j!176)) (= (select (arr!15445 a!3235) (index!17653 lt!224959)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15445 a!3235) (index!17653 lt!224959)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!291285 () Bool)

(declare-fun b!496828 () Bool)

(assert (=> b!496828 (= e!291285 (= (seekEntryOrOpen!0 (select (arr!15445 a!3235) j!176) a!3235 mask!3524) (Found!3868 j!176)))))

(declare-fun b!496829 () Bool)

(assert (=> b!496829 (= e!291284 (not e!291286))))

(declare-fun res!299264 () Bool)

(assert (=> b!496829 (=> res!299264 e!291286)))

(declare-fun lt!224956 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32125 (_ BitVec 32)) SeekEntryResult!3868)

(assert (=> b!496829 (= res!299264 (= lt!224959 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224956 (select (store (arr!15445 a!3235) i!1204 k0!2280) j!176) (array!32126 (store (arr!15445 a!3235) i!1204 k0!2280) (size!15809 a!3235)) mask!3524)))))

(declare-fun lt!224958 () (_ BitVec 32))

(assert (=> b!496829 (= lt!224959 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224958 (select (arr!15445 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496829 (= lt!224956 (toIndex!0 (select (store (arr!15445 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496829 (= lt!224958 (toIndex!0 (select (arr!15445 a!3235) j!176) mask!3524))))

(assert (=> b!496829 e!291285))

(declare-fun res!299270 () Bool)

(assert (=> b!496829 (=> (not res!299270) (not e!291285))))

(assert (=> b!496829 (= res!299270 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14743 0))(
  ( (Unit!14744) )
))
(declare-fun lt!224957 () Unit!14743)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32125 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14743)

(assert (=> b!496829 (= lt!224957 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496830 () Bool)

(declare-fun res!299269 () Bool)

(assert (=> b!496830 (=> (not res!299269) (not e!291288))))

(assert (=> b!496830 (= res!299269 (validKeyInArray!0 (select (arr!15445 a!3235) j!176)))))

(declare-fun b!496831 () Bool)

(declare-fun res!299266 () Bool)

(assert (=> b!496831 (=> (not res!299266) (not e!291284))))

(declare-datatypes ((List!9510 0))(
  ( (Nil!9507) (Cons!9506 (h!10377 (_ BitVec 64)) (t!15730 List!9510)) )
))
(declare-fun arrayNoDuplicates!0 (array!32125 (_ BitVec 32) List!9510) Bool)

(assert (=> b!496831 (= res!299266 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9507))))

(assert (= (and start!45236 res!299272) b!496823))

(assert (= (and b!496823 res!299268) b!496830))

(assert (= (and b!496830 res!299269) b!496824))

(assert (= (and b!496824 res!299263) b!496826))

(assert (= (and b!496826 res!299271) b!496822))

(assert (= (and b!496822 res!299267) b!496825))

(assert (= (and b!496825 res!299262) b!496831))

(assert (= (and b!496831 res!299266) b!496829))

(assert (= (and b!496829 res!299270) b!496828))

(assert (= (and b!496829 (not res!299264)) b!496821))

(assert (= (and b!496821 (not res!299265)) b!496827))

(declare-fun m!478369 () Bool)

(assert (=> b!496831 m!478369))

(declare-fun m!478371 () Bool)

(assert (=> b!496829 m!478371))

(declare-fun m!478373 () Bool)

(assert (=> b!496829 m!478373))

(assert (=> b!496829 m!478373))

(declare-fun m!478375 () Bool)

(assert (=> b!496829 m!478375))

(declare-fun m!478377 () Bool)

(assert (=> b!496829 m!478377))

(declare-fun m!478379 () Bool)

(assert (=> b!496829 m!478379))

(assert (=> b!496829 m!478377))

(declare-fun m!478381 () Bool)

(assert (=> b!496829 m!478381))

(assert (=> b!496829 m!478373))

(declare-fun m!478383 () Bool)

(assert (=> b!496829 m!478383))

(declare-fun m!478385 () Bool)

(assert (=> b!496829 m!478385))

(assert (=> b!496829 m!478377))

(declare-fun m!478387 () Bool)

(assert (=> b!496829 m!478387))

(assert (=> b!496828 m!478377))

(assert (=> b!496828 m!478377))

(declare-fun m!478389 () Bool)

(assert (=> b!496828 m!478389))

(declare-fun m!478391 () Bool)

(assert (=> b!496827 m!478391))

(assert (=> b!496827 m!478377))

(declare-fun m!478393 () Bool)

(assert (=> b!496825 m!478393))

(assert (=> b!496830 m!478377))

(assert (=> b!496830 m!478377))

(declare-fun m!478395 () Bool)

(assert (=> b!496830 m!478395))

(declare-fun m!478397 () Bool)

(assert (=> b!496822 m!478397))

(declare-fun m!478399 () Bool)

(assert (=> b!496826 m!478399))

(declare-fun m!478401 () Bool)

(assert (=> b!496824 m!478401))

(declare-fun m!478403 () Bool)

(assert (=> start!45236 m!478403))

(declare-fun m!478405 () Bool)

(assert (=> start!45236 m!478405))

(check-sat (not b!496824) (not b!496828) (not b!496831) (not b!496826) (not b!496829) (not start!45236) (not b!496830) (not b!496825) (not b!496822))
(check-sat)
