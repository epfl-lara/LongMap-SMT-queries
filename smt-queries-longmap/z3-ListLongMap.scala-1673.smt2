; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30912 () Bool)

(assert start!30912)

(declare-fun b!310152 () Bool)

(declare-fun res!166752 () Bool)

(declare-fun e!193637 () Bool)

(assert (=> b!310152 (=> (not res!166752) (not e!193637))))

(declare-datatypes ((array!15818 0))(
  ( (array!15819 (arr!7491 (Array (_ BitVec 32) (_ BitVec 64))) (size!7844 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15818)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15818 (_ BitVec 32)) Bool)

(assert (=> b!310152 (= res!166752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!166755 () Bool)

(assert (=> start!30912 (=> (not res!166755) (not e!193637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30912 (= res!166755 (validMask!0 mask!3709))))

(assert (=> start!30912 e!193637))

(declare-fun array_inv!5463 (array!15818) Bool)

(assert (=> start!30912 (array_inv!5463 a!3293)))

(assert (=> start!30912 true))

(declare-fun b!310153 () Bool)

(declare-fun res!166760 () Bool)

(assert (=> b!310153 (=> (not res!166760) (not e!193637))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2630 0))(
  ( (MissingZero!2630 (index!12696 (_ BitVec 32))) (Found!2630 (index!12697 (_ BitVec 32))) (Intermediate!2630 (undefined!3442 Bool) (index!12698 (_ BitVec 32)) (x!30942 (_ BitVec 32))) (Undefined!2630) (MissingVacant!2630 (index!12699 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15818 (_ BitVec 32)) SeekEntryResult!2630)

(assert (=> b!310153 (= res!166760 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2630 i!1240)))))

(declare-fun b!310154 () Bool)

(declare-fun res!166761 () Bool)

(assert (=> b!310154 (=> (not res!166761) (not e!193637))))

(assert (=> b!310154 (= res!166761 (and (= (size!7844 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7844 a!3293))))))

(declare-fun b!310155 () Bool)

(declare-fun res!166754 () Bool)

(assert (=> b!310155 (=> (not res!166754) (not e!193637))))

(declare-fun arrayContainsKey!0 (array!15818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310155 (= res!166754 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310156 () Bool)

(declare-fun e!193638 () Bool)

(assert (=> b!310156 (= e!193637 e!193638)))

(declare-fun res!166753 () Bool)

(assert (=> b!310156 (=> (not res!166753) (not e!193638))))

(declare-fun lt!151717 () SeekEntryResult!2630)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15818 (_ BitVec 32)) SeekEntryResult!2630)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310156 (= res!166753 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151717))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310156 (= lt!151717 (Intermediate!2630 false resIndex!52 resX!52))))

(declare-fun b!310157 () Bool)

(declare-fun res!166758 () Bool)

(assert (=> b!310157 (=> (not res!166758) (not e!193638))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310157 (= res!166758 (and (= (select (arr!7491 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7844 a!3293))))))

(declare-fun b!310158 () Bool)

(declare-fun e!193636 () Bool)

(assert (=> b!310158 (= e!193636 (not true))))

(declare-fun e!193639 () Bool)

(assert (=> b!310158 e!193639))

(declare-fun res!166757 () Bool)

(assert (=> b!310158 (=> (not res!166757) (not e!193639))))

(declare-fun lt!151715 () SeekEntryResult!2630)

(declare-fun lt!151716 () (_ BitVec 32))

(assert (=> b!310158 (= res!166757 (= lt!151715 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151716 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310158 (= lt!151716 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310159 () Bool)

(assert (=> b!310159 (= e!193638 e!193636)))

(declare-fun res!166756 () Bool)

(assert (=> b!310159 (=> (not res!166756) (not e!193636))))

(assert (=> b!310159 (= res!166756 (and (= lt!151715 lt!151717) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7491 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310159 (= lt!151715 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310160 () Bool)

(declare-fun res!166759 () Bool)

(assert (=> b!310160 (=> (not res!166759) (not e!193637))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310160 (= res!166759 (validKeyInArray!0 k0!2441))))

(declare-fun lt!151718 () array!15818)

(declare-fun b!310161 () Bool)

(assert (=> b!310161 (= e!193639 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!151718 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151716 k0!2441 lt!151718 mask!3709)))))

(assert (=> b!310161 (= lt!151718 (array!15819 (store (arr!7491 a!3293) i!1240 k0!2441) (size!7844 a!3293)))))

(assert (= (and start!30912 res!166755) b!310154))

(assert (= (and b!310154 res!166761) b!310160))

(assert (= (and b!310160 res!166759) b!310155))

(assert (= (and b!310155 res!166754) b!310153))

(assert (= (and b!310153 res!166760) b!310152))

(assert (= (and b!310152 res!166752) b!310156))

(assert (= (and b!310156 res!166753) b!310157))

(assert (= (and b!310157 res!166758) b!310159))

(assert (= (and b!310159 res!166756) b!310158))

(assert (= (and b!310158 res!166757) b!310161))

(declare-fun m!319603 () Bool)

(assert (=> b!310160 m!319603))

(declare-fun m!319605 () Bool)

(assert (=> b!310152 m!319605))

(declare-fun m!319607 () Bool)

(assert (=> b!310158 m!319607))

(declare-fun m!319609 () Bool)

(assert (=> b!310158 m!319609))

(declare-fun m!319611 () Bool)

(assert (=> b!310156 m!319611))

(assert (=> b!310156 m!319611))

(declare-fun m!319613 () Bool)

(assert (=> b!310156 m!319613))

(declare-fun m!319615 () Bool)

(assert (=> b!310159 m!319615))

(declare-fun m!319617 () Bool)

(assert (=> b!310159 m!319617))

(declare-fun m!319619 () Bool)

(assert (=> b!310155 m!319619))

(declare-fun m!319621 () Bool)

(assert (=> b!310161 m!319621))

(declare-fun m!319623 () Bool)

(assert (=> b!310161 m!319623))

(declare-fun m!319625 () Bool)

(assert (=> b!310161 m!319625))

(declare-fun m!319627 () Bool)

(assert (=> start!30912 m!319627))

(declare-fun m!319629 () Bool)

(assert (=> start!30912 m!319629))

(declare-fun m!319631 () Bool)

(assert (=> b!310153 m!319631))

(declare-fun m!319633 () Bool)

(assert (=> b!310157 m!319633))

(check-sat (not b!310160) (not b!310156) (not b!310152) (not b!310155) (not b!310159) (not b!310158) (not b!310161) (not b!310153) (not start!30912))
(check-sat)
