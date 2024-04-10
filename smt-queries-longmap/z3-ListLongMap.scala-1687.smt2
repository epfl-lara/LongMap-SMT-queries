; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31012 () Bool)

(assert start!31012)

(declare-fun b!311717 () Bool)

(declare-fun res!168175 () Bool)

(declare-fun e!194458 () Bool)

(assert (=> b!311717 (=> (not res!168175) (not e!194458))))

(declare-datatypes ((array!15914 0))(
  ( (array!15915 (arr!7539 (Array (_ BitVec 32) (_ BitVec 64))) (size!7891 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15914)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15914 (_ BitVec 32)) Bool)

(assert (=> b!311717 (= res!168175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311719 () Bool)

(declare-fun res!168171 () Bool)

(declare-fun e!194457 () Bool)

(assert (=> b!311719 (=> (not res!168171) (not e!194457))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311719 (= res!168171 (and (= (select (arr!7539 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7891 a!3293))))))

(declare-fun b!311720 () Bool)

(assert (=> b!311720 (= e!194458 e!194457)))

(declare-fun res!168179 () Bool)

(assert (=> b!311720 (=> (not res!168179) (not e!194457))))

(declare-datatypes ((SeekEntryResult!2679 0))(
  ( (MissingZero!2679 (index!12892 (_ BitVec 32))) (Found!2679 (index!12893 (_ BitVec 32))) (Intermediate!2679 (undefined!3491 Bool) (index!12894 (_ BitVec 32)) (x!31108 (_ BitVec 32))) (Undefined!2679) (MissingVacant!2679 (index!12895 (_ BitVec 32))) )
))
(declare-fun lt!152469 () SeekEntryResult!2679)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15914 (_ BitVec 32)) SeekEntryResult!2679)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311720 (= res!168179 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152469))))

(assert (=> b!311720 (= lt!152469 (Intermediate!2679 false resIndex!52 resX!52))))

(declare-fun b!311721 () Bool)

(declare-fun res!168177 () Bool)

(assert (=> b!311721 (=> (not res!168177) (not e!194458))))

(declare-fun arrayContainsKey!0 (array!15914 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311721 (= res!168177 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311722 () Bool)

(declare-fun res!168176 () Bool)

(assert (=> b!311722 (=> (not res!168176) (not e!194458))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311722 (= res!168176 (validKeyInArray!0 k0!2441))))

(declare-fun b!311723 () Bool)

(declare-fun res!168174 () Bool)

(assert (=> b!311723 (=> (not res!168174) (not e!194458))))

(assert (=> b!311723 (= res!168174 (and (= (size!7891 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7891 a!3293))))))

(declare-fun b!311724 () Bool)

(declare-fun e!194460 () Bool)

(declare-fun lt!152467 () (_ BitVec 32))

(declare-fun lt!152466 () array!15914)

(assert (=> b!311724 (= e!194460 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152466 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152467 k0!2441 lt!152466 mask!3709)))))

(assert (=> b!311724 (= lt!152466 (array!15915 (store (arr!7539 a!3293) i!1240 k0!2441) (size!7891 a!3293)))))

(declare-fun b!311725 () Bool)

(declare-fun res!168173 () Bool)

(assert (=> b!311725 (=> (not res!168173) (not e!194458))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15914 (_ BitVec 32)) SeekEntryResult!2679)

(assert (=> b!311725 (= res!168173 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2679 i!1240)))))

(declare-fun b!311726 () Bool)

(declare-fun e!194459 () Bool)

(assert (=> b!311726 (= e!194457 e!194459)))

(declare-fun res!168180 () Bool)

(assert (=> b!311726 (=> (not res!168180) (not e!194459))))

(declare-fun lt!152468 () SeekEntryResult!2679)

(assert (=> b!311726 (= res!168180 (and (= lt!152468 lt!152469) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7539 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311726 (= lt!152468 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311718 () Bool)

(assert (=> b!311718 (= e!194459 (not true))))

(assert (=> b!311718 e!194460))

(declare-fun res!168178 () Bool)

(assert (=> b!311718 (=> (not res!168178) (not e!194460))))

(assert (=> b!311718 (= res!168178 (= lt!152468 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152467 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311718 (= lt!152467 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!168172 () Bool)

(assert (=> start!31012 (=> (not res!168172) (not e!194458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31012 (= res!168172 (validMask!0 mask!3709))))

(assert (=> start!31012 e!194458))

(declare-fun array_inv!5502 (array!15914) Bool)

(assert (=> start!31012 (array_inv!5502 a!3293)))

(assert (=> start!31012 true))

(assert (= (and start!31012 res!168172) b!311723))

(assert (= (and b!311723 res!168174) b!311722))

(assert (= (and b!311722 res!168176) b!311721))

(assert (= (and b!311721 res!168177) b!311725))

(assert (= (and b!311725 res!168173) b!311717))

(assert (= (and b!311717 res!168175) b!311720))

(assert (= (and b!311720 res!168179) b!311719))

(assert (= (and b!311719 res!168171) b!311726))

(assert (= (and b!311726 res!168180) b!311718))

(assert (= (and b!311718 res!168178) b!311724))

(declare-fun m!321709 () Bool)

(assert (=> start!31012 m!321709))

(declare-fun m!321711 () Bool)

(assert (=> start!31012 m!321711))

(declare-fun m!321713 () Bool)

(assert (=> b!311726 m!321713))

(declare-fun m!321715 () Bool)

(assert (=> b!311726 m!321715))

(declare-fun m!321717 () Bool)

(assert (=> b!311718 m!321717))

(declare-fun m!321719 () Bool)

(assert (=> b!311718 m!321719))

(declare-fun m!321721 () Bool)

(assert (=> b!311724 m!321721))

(declare-fun m!321723 () Bool)

(assert (=> b!311724 m!321723))

(declare-fun m!321725 () Bool)

(assert (=> b!311724 m!321725))

(declare-fun m!321727 () Bool)

(assert (=> b!311719 m!321727))

(declare-fun m!321729 () Bool)

(assert (=> b!311721 m!321729))

(declare-fun m!321731 () Bool)

(assert (=> b!311720 m!321731))

(assert (=> b!311720 m!321731))

(declare-fun m!321733 () Bool)

(assert (=> b!311720 m!321733))

(declare-fun m!321735 () Bool)

(assert (=> b!311725 m!321735))

(declare-fun m!321737 () Bool)

(assert (=> b!311717 m!321737))

(declare-fun m!321739 () Bool)

(assert (=> b!311722 m!321739))

(check-sat (not b!311720) (not start!31012) (not b!311725) (not b!311717) (not b!311718) (not b!311722) (not b!311726) (not b!311721) (not b!311724))
(check-sat)
