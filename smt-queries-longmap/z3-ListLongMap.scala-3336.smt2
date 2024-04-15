; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45996 () Bool)

(assert start!45996)

(declare-fun b!509135 () Bool)

(declare-fun res!310129 () Bool)

(declare-fun e!297733 () Bool)

(assert (=> b!509135 (=> (not res!310129) (not e!297733))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509135 (= res!310129 (validKeyInArray!0 k0!2280))))

(declare-fun b!509136 () Bool)

(declare-fun res!310128 () Bool)

(declare-fun e!297734 () Bool)

(assert (=> b!509136 (=> (not res!310128) (not e!297734))))

(declare-datatypes ((array!32717 0))(
  ( (array!32718 (arr!15737 (Array (_ BitVec 32) (_ BitVec 64))) (size!16102 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32717)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32717 (_ BitVec 32)) Bool)

(assert (=> b!509136 (= res!310128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509137 () Bool)

(declare-fun res!310122 () Bool)

(assert (=> b!509137 (=> (not res!310122) (not e!297734))))

(declare-datatypes ((List!9934 0))(
  ( (Nil!9931) (Cons!9930 (h!10807 (_ BitVec 64)) (t!16153 List!9934)) )
))
(declare-fun arrayNoDuplicates!0 (array!32717 (_ BitVec 32) List!9934) Bool)

(assert (=> b!509137 (= res!310122 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9931))))

(declare-fun e!297735 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!509138 () Bool)

(declare-datatypes ((SeekEntryResult!4201 0))(
  ( (MissingZero!4201 (index!18992 (_ BitVec 32))) (Found!4201 (index!18993 (_ BitVec 32))) (Intermediate!4201 (undefined!5013 Bool) (index!18994 (_ BitVec 32)) (x!47973 (_ BitVec 32))) (Undefined!4201) (MissingVacant!4201 (index!18995 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32717 (_ BitVec 32)) SeekEntryResult!4201)

(assert (=> b!509138 (= e!297735 (= (seekEntryOrOpen!0 (select (arr!15737 a!3235) j!176) a!3235 mask!3524) (Found!4201 j!176)))))

(declare-fun res!310127 () Bool)

(assert (=> start!45996 (=> (not res!310127) (not e!297733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45996 (= res!310127 (validMask!0 mask!3524))))

(assert (=> start!45996 e!297733))

(assert (=> start!45996 true))

(declare-fun array_inv!11620 (array!32717) Bool)

(assert (=> start!45996 (array_inv!11620 a!3235)))

(declare-fun b!509139 () Bool)

(assert (=> b!509139 (= e!297734 (not true))))

(declare-fun lt!232460 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!232462 () SeekEntryResult!4201)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32717 (_ BitVec 32)) SeekEntryResult!4201)

(assert (=> b!509139 (= lt!232462 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232460 (select (store (arr!15737 a!3235) i!1204 k0!2280) j!176) (array!32718 (store (arr!15737 a!3235) i!1204 k0!2280) (size!16102 a!3235)) mask!3524))))

(declare-fun lt!232461 () (_ BitVec 32))

(declare-fun lt!232464 () SeekEntryResult!4201)

(assert (=> b!509139 (= lt!232464 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232461 (select (arr!15737 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509139 (= lt!232460 (toIndex!0 (select (store (arr!15737 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509139 (= lt!232461 (toIndex!0 (select (arr!15737 a!3235) j!176) mask!3524))))

(assert (=> b!509139 e!297735))

(declare-fun res!310123 () Bool)

(assert (=> b!509139 (=> (not res!310123) (not e!297735))))

(assert (=> b!509139 (= res!310123 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15646 0))(
  ( (Unit!15647) )
))
(declare-fun lt!232463 () Unit!15646)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32717 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15646)

(assert (=> b!509139 (= lt!232463 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509140 () Bool)

(declare-fun res!310124 () Bool)

(assert (=> b!509140 (=> (not res!310124) (not e!297733))))

(assert (=> b!509140 (= res!310124 (validKeyInArray!0 (select (arr!15737 a!3235) j!176)))))

(declare-fun b!509141 () Bool)

(declare-fun res!310126 () Bool)

(assert (=> b!509141 (=> (not res!310126) (not e!297733))))

(declare-fun arrayContainsKey!0 (array!32717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509141 (= res!310126 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509142 () Bool)

(assert (=> b!509142 (= e!297733 e!297734)))

(declare-fun res!310130 () Bool)

(assert (=> b!509142 (=> (not res!310130) (not e!297734))))

(declare-fun lt!232465 () SeekEntryResult!4201)

(assert (=> b!509142 (= res!310130 (or (= lt!232465 (MissingZero!4201 i!1204)) (= lt!232465 (MissingVacant!4201 i!1204))))))

(assert (=> b!509142 (= lt!232465 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509143 () Bool)

(declare-fun res!310125 () Bool)

(assert (=> b!509143 (=> (not res!310125) (not e!297733))))

(assert (=> b!509143 (= res!310125 (and (= (size!16102 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16102 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16102 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45996 res!310127) b!509143))

(assert (= (and b!509143 res!310125) b!509140))

(assert (= (and b!509140 res!310124) b!509135))

(assert (= (and b!509135 res!310129) b!509141))

(assert (= (and b!509141 res!310126) b!509142))

(assert (= (and b!509142 res!310130) b!509136))

(assert (= (and b!509136 res!310128) b!509137))

(assert (= (and b!509137 res!310122) b!509139))

(assert (= (and b!509139 res!310123) b!509138))

(declare-fun m!489529 () Bool)

(assert (=> b!509142 m!489529))

(declare-fun m!489531 () Bool)

(assert (=> start!45996 m!489531))

(declare-fun m!489533 () Bool)

(assert (=> start!45996 m!489533))

(declare-fun m!489535 () Bool)

(assert (=> b!509137 m!489535))

(declare-fun m!489537 () Bool)

(assert (=> b!509139 m!489537))

(declare-fun m!489539 () Bool)

(assert (=> b!509139 m!489539))

(declare-fun m!489541 () Bool)

(assert (=> b!509139 m!489541))

(declare-fun m!489543 () Bool)

(assert (=> b!509139 m!489543))

(declare-fun m!489545 () Bool)

(assert (=> b!509139 m!489545))

(assert (=> b!509139 m!489543))

(declare-fun m!489547 () Bool)

(assert (=> b!509139 m!489547))

(assert (=> b!509139 m!489543))

(declare-fun m!489549 () Bool)

(assert (=> b!509139 m!489549))

(assert (=> b!509139 m!489541))

(declare-fun m!489551 () Bool)

(assert (=> b!509139 m!489551))

(assert (=> b!509139 m!489541))

(declare-fun m!489553 () Bool)

(assert (=> b!509139 m!489553))

(declare-fun m!489555 () Bool)

(assert (=> b!509136 m!489555))

(assert (=> b!509140 m!489543))

(assert (=> b!509140 m!489543))

(declare-fun m!489557 () Bool)

(assert (=> b!509140 m!489557))

(declare-fun m!489559 () Bool)

(assert (=> b!509135 m!489559))

(assert (=> b!509138 m!489543))

(assert (=> b!509138 m!489543))

(declare-fun m!489561 () Bool)

(assert (=> b!509138 m!489561))

(declare-fun m!489563 () Bool)

(assert (=> b!509141 m!489563))

(check-sat (not b!509142) (not b!509135) (not b!509140) (not b!509138) (not b!509136) (not b!509141) (not b!509139) (not start!45996) (not b!509137))
(check-sat)
