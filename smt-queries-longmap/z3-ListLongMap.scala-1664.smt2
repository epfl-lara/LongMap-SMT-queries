; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30804 () Bool)

(assert start!30804)

(declare-fun b!309142 () Bool)

(declare-fun e!193129 () Bool)

(declare-fun e!193130 () Bool)

(assert (=> b!309142 (= e!193129 e!193130)))

(declare-fun res!165906 () Bool)

(assert (=> b!309142 (=> (not res!165906) (not e!193130))))

(declare-datatypes ((array!15761 0))(
  ( (array!15762 (arr!7464 (Array (_ BitVec 32) (_ BitVec 64))) (size!7817 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15761)

(declare-datatypes ((SeekEntryResult!2603 0))(
  ( (MissingZero!2603 (index!12588 (_ BitVec 32))) (Found!2603 (index!12589 (_ BitVec 32))) (Intermediate!2603 (undefined!3415 Bool) (index!12590 (_ BitVec 32)) (x!30834 (_ BitVec 32))) (Undefined!2603) (MissingVacant!2603 (index!12591 (_ BitVec 32))) )
))
(declare-fun lt!151349 () SeekEntryResult!2603)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15761 (_ BitVec 32)) SeekEntryResult!2603)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309142 (= res!165906 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151349))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!309142 (= lt!151349 (Intermediate!2603 false resIndex!52 resX!52))))

(declare-fun res!165903 () Bool)

(assert (=> start!30804 (=> (not res!165903) (not e!193129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30804 (= res!165903 (validMask!0 mask!3709))))

(assert (=> start!30804 e!193129))

(declare-fun array_inv!5436 (array!15761) Bool)

(assert (=> start!30804 (array_inv!5436 a!3293)))

(assert (=> start!30804 true))

(declare-fun b!309143 () Bool)

(declare-fun res!165905 () Bool)

(assert (=> b!309143 (=> (not res!165905) (not e!193130))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309143 (= res!165905 (and (= (select (arr!7464 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7817 a!3293))))))

(declare-fun b!309144 () Bool)

(declare-fun res!165904 () Bool)

(assert (=> b!309144 (=> (not res!165904) (not e!193129))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15761 (_ BitVec 32)) Bool)

(assert (=> b!309144 (= res!165904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309145 () Bool)

(declare-fun res!165908 () Bool)

(assert (=> b!309145 (=> (not res!165908) (not e!193129))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309145 (= res!165908 (validKeyInArray!0 k0!2441))))

(declare-fun b!309146 () Bool)

(declare-fun e!193128 () Bool)

(assert (=> b!309146 (= e!193130 e!193128)))

(declare-fun res!165909 () Bool)

(assert (=> b!309146 (=> (not res!165909) (not e!193128))))

(declare-fun lt!151348 () SeekEntryResult!2603)

(assert (=> b!309146 (= res!165909 (and (= lt!151348 lt!151349) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7464 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309146 (= lt!151348 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!309147 () Bool)

(declare-fun res!165902 () Bool)

(assert (=> b!309147 (=> (not res!165902) (not e!193129))))

(assert (=> b!309147 (= res!165902 (and (= (size!7817 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7817 a!3293))))))

(declare-fun b!309148 () Bool)

(assert (=> b!309148 (= e!193128 (not (bvsge mask!3709 #b00000000000000000000000000000000)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309148 (= lt!151348 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!309149 () Bool)

(declare-fun res!165907 () Bool)

(assert (=> b!309149 (=> (not res!165907) (not e!193129))))

(declare-fun arrayContainsKey!0 (array!15761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309149 (= res!165907 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309150 () Bool)

(declare-fun res!165901 () Bool)

(assert (=> b!309150 (=> (not res!165901) (not e!193129))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15761 (_ BitVec 32)) SeekEntryResult!2603)

(assert (=> b!309150 (= res!165901 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2603 i!1240)))))

(assert (= (and start!30804 res!165903) b!309147))

(assert (= (and b!309147 res!165902) b!309145))

(assert (= (and b!309145 res!165908) b!309149))

(assert (= (and b!309149 res!165907) b!309150))

(assert (= (and b!309150 res!165901) b!309144))

(assert (= (and b!309144 res!165904) b!309142))

(assert (= (and b!309142 res!165906) b!309143))

(assert (= (and b!309143 res!165905) b!309146))

(assert (= (and b!309146 res!165909) b!309148))

(declare-fun m!318691 () Bool)

(assert (=> b!309143 m!318691))

(declare-fun m!318693 () Bool)

(assert (=> start!30804 m!318693))

(declare-fun m!318695 () Bool)

(assert (=> start!30804 m!318695))

(declare-fun m!318697 () Bool)

(assert (=> b!309146 m!318697))

(declare-fun m!318699 () Bool)

(assert (=> b!309146 m!318699))

(declare-fun m!318701 () Bool)

(assert (=> b!309148 m!318701))

(assert (=> b!309148 m!318701))

(declare-fun m!318703 () Bool)

(assert (=> b!309148 m!318703))

(declare-fun m!318705 () Bool)

(assert (=> b!309142 m!318705))

(assert (=> b!309142 m!318705))

(declare-fun m!318707 () Bool)

(assert (=> b!309142 m!318707))

(declare-fun m!318709 () Bool)

(assert (=> b!309144 m!318709))

(declare-fun m!318711 () Bool)

(assert (=> b!309150 m!318711))

(declare-fun m!318713 () Bool)

(assert (=> b!309149 m!318713))

(declare-fun m!318715 () Bool)

(assert (=> b!309145 m!318715))

(check-sat (not b!309145) (not b!309144) (not b!309149) (not b!309142) (not b!309148) (not b!309146) (not b!309150) (not start!30804))
(check-sat)
