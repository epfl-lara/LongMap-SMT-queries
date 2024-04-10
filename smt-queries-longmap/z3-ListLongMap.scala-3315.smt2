; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45836 () Bool)

(assert start!45836)

(declare-fun res!308541 () Bool)

(declare-fun e!297038 () Bool)

(assert (=> start!45836 (=> (not res!308541) (not e!297038))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45836 (= res!308541 (validMask!0 mask!3524))))

(assert (=> start!45836 e!297038))

(assert (=> start!45836 true))

(declare-datatypes ((array!32592 0))(
  ( (array!32593 (arr!15676 (Array (_ BitVec 32) (_ BitVec 64))) (size!16040 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32592)

(declare-fun array_inv!11472 (array!32592) Bool)

(assert (=> start!45836 (array_inv!11472 a!3235)))

(declare-fun b!507577 () Bool)

(declare-fun e!297037 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4143 0))(
  ( (MissingZero!4143 (index!18760 (_ BitVec 32))) (Found!4143 (index!18761 (_ BitVec 32))) (Intermediate!4143 (undefined!4955 Bool) (index!18762 (_ BitVec 32)) (x!47752 (_ BitVec 32))) (Undefined!4143) (MissingVacant!4143 (index!18763 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32592 (_ BitVec 32)) SeekEntryResult!4143)

(assert (=> b!507577 (= e!297037 (= (seekEntryOrOpen!0 (select (arr!15676 a!3235) j!176) a!3235 mask!3524) (Found!4143 j!176)))))

(declare-fun b!507578 () Bool)

(declare-fun e!297041 () Bool)

(assert (=> b!507578 (= e!297038 e!297041)))

(declare-fun res!308543 () Bool)

(assert (=> b!507578 (=> (not res!308543) (not e!297041))))

(declare-fun lt!231842 () SeekEntryResult!4143)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507578 (= res!308543 (or (= lt!231842 (MissingZero!4143 i!1204)) (= lt!231842 (MissingVacant!4143 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!507578 (= lt!231842 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!507579 () Bool)

(declare-fun e!297042 () Bool)

(assert (=> b!507579 (= e!297042 true)))

(declare-fun lt!231837 () (_ BitVec 64))

(declare-fun lt!231843 () array!32592)

(declare-fun lt!231839 () SeekEntryResult!4143)

(assert (=> b!507579 (= lt!231839 (seekEntryOrOpen!0 lt!231837 lt!231843 mask!3524))))

(assert (=> b!507579 false))

(declare-fun b!507580 () Bool)

(declare-fun res!308540 () Bool)

(assert (=> b!507580 (=> (not res!308540) (not e!297038))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507580 (= res!308540 (validKeyInArray!0 k0!2280))))

(declare-fun b!507581 () Bool)

(declare-fun e!297039 () Bool)

(assert (=> b!507581 (= e!297041 (not e!297039))))

(declare-fun res!308542 () Bool)

(assert (=> b!507581 (=> res!308542 e!297039)))

(declare-fun lt!231838 () SeekEntryResult!4143)

(declare-fun lt!231840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32592 (_ BitVec 32)) SeekEntryResult!4143)

(assert (=> b!507581 (= res!308542 (= lt!231838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231840 lt!231837 lt!231843 mask!3524)))))

(declare-fun lt!231836 () (_ BitVec 32))

(assert (=> b!507581 (= lt!231838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231836 (select (arr!15676 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507581 (= lt!231840 (toIndex!0 lt!231837 mask!3524))))

(assert (=> b!507581 (= lt!231837 (select (store (arr!15676 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!507581 (= lt!231836 (toIndex!0 (select (arr!15676 a!3235) j!176) mask!3524))))

(assert (=> b!507581 (= lt!231843 (array!32593 (store (arr!15676 a!3235) i!1204 k0!2280) (size!16040 a!3235)))))

(assert (=> b!507581 e!297037))

(declare-fun res!308537 () Bool)

(assert (=> b!507581 (=> (not res!308537) (not e!297037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32592 (_ BitVec 32)) Bool)

(assert (=> b!507581 (= res!308537 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15574 0))(
  ( (Unit!15575) )
))
(declare-fun lt!231844 () Unit!15574)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15574)

(assert (=> b!507581 (= lt!231844 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507582 () Bool)

(declare-fun res!308544 () Bool)

(assert (=> b!507582 (=> (not res!308544) (not e!297038))))

(assert (=> b!507582 (= res!308544 (and (= (size!16040 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16040 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16040 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507583 () Bool)

(declare-fun res!308546 () Bool)

(assert (=> b!507583 (=> (not res!308546) (not e!297038))))

(assert (=> b!507583 (= res!308546 (validKeyInArray!0 (select (arr!15676 a!3235) j!176)))))

(declare-fun b!507584 () Bool)

(assert (=> b!507584 (= e!297039 e!297042)))

(declare-fun res!308545 () Bool)

(assert (=> b!507584 (=> res!308545 e!297042)))

(declare-fun lt!231841 () Bool)

(assert (=> b!507584 (= res!308545 (or (and (not lt!231841) (undefined!4955 lt!231838)) (and (not lt!231841) (not (undefined!4955 lt!231838)))))))

(get-info :version)

(assert (=> b!507584 (= lt!231841 (not ((_ is Intermediate!4143) lt!231838)))))

(declare-fun b!507585 () Bool)

(declare-fun res!308536 () Bool)

(assert (=> b!507585 (=> (not res!308536) (not e!297041))))

(declare-datatypes ((List!9834 0))(
  ( (Nil!9831) (Cons!9830 (h!10707 (_ BitVec 64)) (t!16062 List!9834)) )
))
(declare-fun arrayNoDuplicates!0 (array!32592 (_ BitVec 32) List!9834) Bool)

(assert (=> b!507585 (= res!308536 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9831))))

(declare-fun b!507586 () Bool)

(declare-fun res!308538 () Bool)

(assert (=> b!507586 (=> (not res!308538) (not e!297041))))

(assert (=> b!507586 (= res!308538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507587 () Bool)

(declare-fun res!308539 () Bool)

(assert (=> b!507587 (=> (not res!308539) (not e!297038))))

(declare-fun arrayContainsKey!0 (array!32592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507587 (= res!308539 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45836 res!308541) b!507582))

(assert (= (and b!507582 res!308544) b!507583))

(assert (= (and b!507583 res!308546) b!507580))

(assert (= (and b!507580 res!308540) b!507587))

(assert (= (and b!507587 res!308539) b!507578))

(assert (= (and b!507578 res!308543) b!507586))

(assert (= (and b!507586 res!308538) b!507585))

(assert (= (and b!507585 res!308536) b!507581))

(assert (= (and b!507581 res!308537) b!507577))

(assert (= (and b!507581 (not res!308542)) b!507584))

(assert (= (and b!507584 (not res!308545)) b!507579))

(declare-fun m!488369 () Bool)

(assert (=> b!507580 m!488369))

(declare-fun m!488371 () Bool)

(assert (=> b!507577 m!488371))

(assert (=> b!507577 m!488371))

(declare-fun m!488373 () Bool)

(assert (=> b!507577 m!488373))

(declare-fun m!488375 () Bool)

(assert (=> b!507586 m!488375))

(declare-fun m!488377 () Bool)

(assert (=> b!507579 m!488377))

(declare-fun m!488379 () Bool)

(assert (=> start!45836 m!488379))

(declare-fun m!488381 () Bool)

(assert (=> start!45836 m!488381))

(declare-fun m!488383 () Bool)

(assert (=> b!507578 m!488383))

(declare-fun m!488385 () Bool)

(assert (=> b!507585 m!488385))

(assert (=> b!507583 m!488371))

(assert (=> b!507583 m!488371))

(declare-fun m!488387 () Bool)

(assert (=> b!507583 m!488387))

(declare-fun m!488389 () Bool)

(assert (=> b!507581 m!488389))

(declare-fun m!488391 () Bool)

(assert (=> b!507581 m!488391))

(declare-fun m!488393 () Bool)

(assert (=> b!507581 m!488393))

(assert (=> b!507581 m!488371))

(declare-fun m!488395 () Bool)

(assert (=> b!507581 m!488395))

(assert (=> b!507581 m!488371))

(declare-fun m!488397 () Bool)

(assert (=> b!507581 m!488397))

(declare-fun m!488399 () Bool)

(assert (=> b!507581 m!488399))

(assert (=> b!507581 m!488371))

(declare-fun m!488401 () Bool)

(assert (=> b!507581 m!488401))

(declare-fun m!488403 () Bool)

(assert (=> b!507581 m!488403))

(declare-fun m!488405 () Bool)

(assert (=> b!507587 m!488405))

(check-sat (not start!45836) (not b!507579) (not b!507586) (not b!507581) (not b!507583) (not b!507587) (not b!507578) (not b!507585) (not b!507580) (not b!507577))
(check-sat)
