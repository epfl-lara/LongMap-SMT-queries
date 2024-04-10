; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30976 () Bool)

(assert start!30976)

(declare-fun b!311177 () Bool)

(declare-fun res!167634 () Bool)

(declare-fun e!194189 () Bool)

(assert (=> b!311177 (=> (not res!167634) (not e!194189))))

(declare-datatypes ((array!15878 0))(
  ( (array!15879 (arr!7521 (Array (_ BitVec 32) (_ BitVec 64))) (size!7873 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15878)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15878 (_ BitVec 32)) Bool)

(assert (=> b!311177 (= res!167634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311178 () Bool)

(declare-fun res!167632 () Bool)

(assert (=> b!311178 (=> (not res!167632) (not e!194189))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15878 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311178 (= res!167632 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311180 () Bool)

(declare-fun e!194188 () Bool)

(declare-fun e!194190 () Bool)

(assert (=> b!311180 (= e!194188 e!194190)))

(declare-fun res!167638 () Bool)

(assert (=> b!311180 (=> (not res!167638) (not e!194190))))

(declare-datatypes ((SeekEntryResult!2661 0))(
  ( (MissingZero!2661 (index!12820 (_ BitVec 32))) (Found!2661 (index!12821 (_ BitVec 32))) (Intermediate!2661 (undefined!3473 Bool) (index!12822 (_ BitVec 32)) (x!31042 (_ BitVec 32))) (Undefined!2661) (MissingVacant!2661 (index!12823 (_ BitVec 32))) )
))
(declare-fun lt!152250 () SeekEntryResult!2661)

(declare-fun lt!152253 () SeekEntryResult!2661)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311180 (= res!167638 (and (= lt!152250 lt!152253) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7521 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15878 (_ BitVec 32)) SeekEntryResult!2661)

(assert (=> b!311180 (= lt!152250 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311181 () Bool)

(declare-fun res!167633 () Bool)

(assert (=> b!311181 (=> (not res!167633) (not e!194189))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15878 (_ BitVec 32)) SeekEntryResult!2661)

(assert (=> b!311181 (= res!167633 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2661 i!1240)))))

(declare-fun b!311182 () Bool)

(assert (=> b!311182 (= e!194190 (not true))))

(declare-fun e!194191 () Bool)

(assert (=> b!311182 e!194191))

(declare-fun res!167636 () Bool)

(assert (=> b!311182 (=> (not res!167636) (not e!194191))))

(declare-fun lt!152251 () (_ BitVec 32))

(assert (=> b!311182 (= res!167636 (= lt!152250 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152251 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311182 (= lt!152251 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311183 () Bool)

(declare-fun res!167631 () Bool)

(assert (=> b!311183 (=> (not res!167631) (not e!194188))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!311183 (= res!167631 (and (= (select (arr!7521 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7873 a!3293))))))

(declare-fun b!311184 () Bool)

(declare-fun res!167635 () Bool)

(assert (=> b!311184 (=> (not res!167635) (not e!194189))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311184 (= res!167635 (validKeyInArray!0 k0!2441))))

(declare-fun b!311179 () Bool)

(declare-fun res!167639 () Bool)

(assert (=> b!311179 (=> (not res!167639) (not e!194189))))

(assert (=> b!311179 (= res!167639 (and (= (size!7873 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7873 a!3293))))))

(declare-fun res!167640 () Bool)

(assert (=> start!30976 (=> (not res!167640) (not e!194189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30976 (= res!167640 (validMask!0 mask!3709))))

(assert (=> start!30976 e!194189))

(declare-fun array_inv!5484 (array!15878) Bool)

(assert (=> start!30976 (array_inv!5484 a!3293)))

(assert (=> start!30976 true))

(declare-fun lt!152252 () array!15878)

(declare-fun b!311185 () Bool)

(assert (=> b!311185 (= e!194191 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152252 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152251 k0!2441 lt!152252 mask!3709)))))

(assert (=> b!311185 (= lt!152252 (array!15879 (store (arr!7521 a!3293) i!1240 k0!2441) (size!7873 a!3293)))))

(declare-fun b!311186 () Bool)

(assert (=> b!311186 (= e!194189 e!194188)))

(declare-fun res!167637 () Bool)

(assert (=> b!311186 (=> (not res!167637) (not e!194188))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311186 (= res!167637 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152253))))

(assert (=> b!311186 (= lt!152253 (Intermediate!2661 false resIndex!52 resX!52))))

(assert (= (and start!30976 res!167640) b!311179))

(assert (= (and b!311179 res!167639) b!311184))

(assert (= (and b!311184 res!167635) b!311178))

(assert (= (and b!311178 res!167632) b!311181))

(assert (= (and b!311181 res!167633) b!311177))

(assert (= (and b!311177 res!167634) b!311186))

(assert (= (and b!311186 res!167637) b!311183))

(assert (= (and b!311183 res!167631) b!311180))

(assert (= (and b!311180 res!167638) b!311182))

(assert (= (and b!311182 res!167636) b!311185))

(declare-fun m!321133 () Bool)

(assert (=> b!311182 m!321133))

(declare-fun m!321135 () Bool)

(assert (=> b!311182 m!321135))

(declare-fun m!321137 () Bool)

(assert (=> b!311181 m!321137))

(declare-fun m!321139 () Bool)

(assert (=> b!311177 m!321139))

(declare-fun m!321141 () Bool)

(assert (=> b!311186 m!321141))

(assert (=> b!311186 m!321141))

(declare-fun m!321143 () Bool)

(assert (=> b!311186 m!321143))

(declare-fun m!321145 () Bool)

(assert (=> start!30976 m!321145))

(declare-fun m!321147 () Bool)

(assert (=> start!30976 m!321147))

(declare-fun m!321149 () Bool)

(assert (=> b!311180 m!321149))

(declare-fun m!321151 () Bool)

(assert (=> b!311180 m!321151))

(declare-fun m!321153 () Bool)

(assert (=> b!311178 m!321153))

(declare-fun m!321155 () Bool)

(assert (=> b!311183 m!321155))

(declare-fun m!321157 () Bool)

(assert (=> b!311184 m!321157))

(declare-fun m!321159 () Bool)

(assert (=> b!311185 m!321159))

(declare-fun m!321161 () Bool)

(assert (=> b!311185 m!321161))

(declare-fun m!321163 () Bool)

(assert (=> b!311185 m!321163))

(check-sat (not b!311186) (not b!311181) (not b!311180) (not b!311182) (not b!311177) (not b!311178) (not start!30976) (not b!311184) (not b!311185))
(check-sat)
