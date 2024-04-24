; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30948 () Bool)

(assert start!30948)

(declare-fun b!310914 () Bool)

(declare-fun e!194051 () Bool)

(declare-fun e!194048 () Bool)

(assert (=> b!310914 (= e!194051 e!194048)))

(declare-fun res!167421 () Bool)

(assert (=> b!310914 (=> (not res!167421) (not e!194048))))

(declare-datatypes ((array!15863 0))(
  ( (array!15864 (arr!7513 (Array (_ BitVec 32) (_ BitVec 64))) (size!7865 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15863)

(declare-datatypes ((SeekEntryResult!2618 0))(
  ( (MissingZero!2618 (index!12648 (_ BitVec 32))) (Found!2618 (index!12649 (_ BitVec 32))) (Intermediate!2618 (undefined!3430 Bool) (index!12650 (_ BitVec 32)) (x!30980 (_ BitVec 32))) (Undefined!2618) (MissingVacant!2618 (index!12651 (_ BitVec 32))) )
))
(declare-fun lt!152184 () SeekEntryResult!2618)

(declare-fun lt!152187 () SeekEntryResult!2618)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310914 (= res!167421 (and (= lt!152187 lt!152184) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7513 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15863 (_ BitVec 32)) SeekEntryResult!2618)

(assert (=> b!310914 (= lt!152187 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310915 () Bool)

(assert (=> b!310915 (= e!194048 (not true))))

(declare-fun e!194049 () Bool)

(assert (=> b!310915 e!194049))

(declare-fun res!167426 () Bool)

(assert (=> b!310915 (=> (not res!167426) (not e!194049))))

(declare-fun lt!152186 () (_ BitVec 32))

(assert (=> b!310915 (= res!167426 (= lt!152187 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152186 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310915 (= lt!152186 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!310916 () Bool)

(declare-fun res!167418 () Bool)

(declare-fun e!194052 () Bool)

(assert (=> b!310916 (=> (not res!167418) (not e!194052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15863 (_ BitVec 32)) Bool)

(assert (=> b!310916 (= res!167418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310917 () Bool)

(declare-fun res!167427 () Bool)

(assert (=> b!310917 (=> (not res!167427) (not e!194052))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15863 (_ BitVec 32)) SeekEntryResult!2618)

(assert (=> b!310917 (= res!167427 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2618 i!1240)))))

(declare-fun b!310918 () Bool)

(declare-fun res!167423 () Bool)

(assert (=> b!310918 (=> (not res!167423) (not e!194051))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!310918 (= res!167423 (and (= (select (arr!7513 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7865 a!3293))))))

(declare-fun b!310919 () Bool)

(declare-fun res!167425 () Bool)

(assert (=> b!310919 (=> (not res!167425) (not e!194052))))

(assert (=> b!310919 (= res!167425 (and (= (size!7865 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7865 a!3293))))))

(declare-fun b!310920 () Bool)

(declare-fun res!167419 () Bool)

(assert (=> b!310920 (=> (not res!167419) (not e!194052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310920 (= res!167419 (validKeyInArray!0 k0!2441))))

(declare-fun b!310921 () Bool)

(declare-fun lt!152185 () array!15863)

(assert (=> b!310921 (= e!194049 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152185 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152186 k0!2441 lt!152185 mask!3709)))))

(assert (=> b!310921 (= lt!152185 (array!15864 (store (arr!7513 a!3293) i!1240 k0!2441) (size!7865 a!3293)))))

(declare-fun res!167420 () Bool)

(assert (=> start!30948 (=> (not res!167420) (not e!194052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30948 (= res!167420 (validMask!0 mask!3709))))

(assert (=> start!30948 e!194052))

(declare-fun array_inv!5463 (array!15863) Bool)

(assert (=> start!30948 (array_inv!5463 a!3293)))

(assert (=> start!30948 true))

(declare-fun b!310922 () Bool)

(assert (=> b!310922 (= e!194052 e!194051)))

(declare-fun res!167424 () Bool)

(assert (=> b!310922 (=> (not res!167424) (not e!194051))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310922 (= res!167424 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152184))))

(assert (=> b!310922 (= lt!152184 (Intermediate!2618 false resIndex!52 resX!52))))

(declare-fun b!310923 () Bool)

(declare-fun res!167422 () Bool)

(assert (=> b!310923 (=> (not res!167422) (not e!194052))))

(declare-fun arrayContainsKey!0 (array!15863 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310923 (= res!167422 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30948 res!167420) b!310919))

(assert (= (and b!310919 res!167425) b!310920))

(assert (= (and b!310920 res!167419) b!310923))

(assert (= (and b!310923 res!167422) b!310917))

(assert (= (and b!310917 res!167427) b!310916))

(assert (= (and b!310916 res!167418) b!310922))

(assert (= (and b!310922 res!167424) b!310918))

(assert (= (and b!310918 res!167423) b!310914))

(assert (= (and b!310914 res!167421) b!310915))

(assert (= (and b!310915 res!167426) b!310921))

(declare-fun m!321043 () Bool)

(assert (=> b!310918 m!321043))

(declare-fun m!321045 () Bool)

(assert (=> b!310923 m!321045))

(declare-fun m!321047 () Bool)

(assert (=> b!310914 m!321047))

(declare-fun m!321049 () Bool)

(assert (=> b!310914 m!321049))

(declare-fun m!321051 () Bool)

(assert (=> b!310922 m!321051))

(assert (=> b!310922 m!321051))

(declare-fun m!321053 () Bool)

(assert (=> b!310922 m!321053))

(declare-fun m!321055 () Bool)

(assert (=> b!310921 m!321055))

(declare-fun m!321057 () Bool)

(assert (=> b!310921 m!321057))

(declare-fun m!321059 () Bool)

(assert (=> b!310921 m!321059))

(declare-fun m!321061 () Bool)

(assert (=> b!310916 m!321061))

(declare-fun m!321063 () Bool)

(assert (=> start!30948 m!321063))

(declare-fun m!321065 () Bool)

(assert (=> start!30948 m!321065))

(declare-fun m!321067 () Bool)

(assert (=> b!310920 m!321067))

(declare-fun m!321069 () Bool)

(assert (=> b!310915 m!321069))

(declare-fun m!321071 () Bool)

(assert (=> b!310915 m!321071))

(declare-fun m!321073 () Bool)

(assert (=> b!310917 m!321073))

(check-sat (not b!310922) (not start!30948) (not b!310921) (not b!310915) (not b!310920) (not b!310914) (not b!310917) (not b!310916) (not b!310923))
(check-sat)
