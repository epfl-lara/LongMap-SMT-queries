; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30946 () Bool)

(assert start!30946)

(declare-fun b!310727 () Bool)

(declare-fun res!167187 () Bool)

(declare-fun e!193963 () Bool)

(assert (=> b!310727 (=> (not res!167187) (not e!193963))))

(declare-datatypes ((array!15848 0))(
  ( (array!15849 (arr!7506 (Array (_ BitVec 32) (_ BitVec 64))) (size!7858 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15848)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2646 0))(
  ( (MissingZero!2646 (index!12760 (_ BitVec 32))) (Found!2646 (index!12761 (_ BitVec 32))) (Intermediate!2646 (undefined!3458 Bool) (index!12762 (_ BitVec 32)) (x!30987 (_ BitVec 32))) (Undefined!2646) (MissingVacant!2646 (index!12763 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15848 (_ BitVec 32)) SeekEntryResult!2646)

(assert (=> b!310727 (= res!167187 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2646 i!1240)))))

(declare-fun res!167189 () Bool)

(assert (=> start!30946 (=> (not res!167189) (not e!193963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30946 (= res!167189 (validMask!0 mask!3709))))

(assert (=> start!30946 e!193963))

(declare-fun array_inv!5469 (array!15848) Bool)

(assert (=> start!30946 (array_inv!5469 a!3293)))

(assert (=> start!30946 true))

(declare-fun b!310728 () Bool)

(declare-fun res!167184 () Bool)

(assert (=> b!310728 (=> (not res!167184) (not e!193963))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15848 (_ BitVec 32)) Bool)

(assert (=> b!310728 (= res!167184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310729 () Bool)

(declare-fun res!167186 () Bool)

(assert (=> b!310729 (=> (not res!167186) (not e!193963))))

(assert (=> b!310729 (= res!167186 (and (= (size!7858 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7858 a!3293))))))

(declare-fun b!310730 () Bool)

(declare-fun lt!152070 () (_ BitVec 32))

(declare-fun e!193965 () Bool)

(declare-fun lt!152073 () array!15848)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15848 (_ BitVec 32)) SeekEntryResult!2646)

(assert (=> b!310730 (= e!193965 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152073 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152070 k0!2441 lt!152073 mask!3709)))))

(assert (=> b!310730 (= lt!152073 (array!15849 (store (arr!7506 a!3293) i!1240 k0!2441) (size!7858 a!3293)))))

(declare-fun b!310731 () Bool)

(declare-fun e!193962 () Bool)

(declare-fun e!193964 () Bool)

(assert (=> b!310731 (= e!193962 e!193964)))

(declare-fun res!167188 () Bool)

(assert (=> b!310731 (=> (not res!167188) (not e!193964))))

(declare-fun lt!152072 () SeekEntryResult!2646)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!152071 () SeekEntryResult!2646)

(assert (=> b!310731 (= res!167188 (and (= lt!152071 lt!152072) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7506 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310731 (= lt!152071 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310732 () Bool)

(assert (=> b!310732 (= e!193963 e!193962)))

(declare-fun res!167190 () Bool)

(assert (=> b!310732 (=> (not res!167190) (not e!193962))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310732 (= res!167190 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152072))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!310732 (= lt!152072 (Intermediate!2646 false resIndex!52 resX!52))))

(declare-fun b!310733 () Bool)

(declare-fun res!167185 () Bool)

(assert (=> b!310733 (=> (not res!167185) (not e!193962))))

(assert (=> b!310733 (= res!167185 (and (= (select (arr!7506 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7858 a!3293))))))

(declare-fun b!310734 () Bool)

(declare-fun res!167181 () Bool)

(assert (=> b!310734 (=> (not res!167181) (not e!193963))))

(declare-fun arrayContainsKey!0 (array!15848 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310734 (= res!167181 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310735 () Bool)

(assert (=> b!310735 (= e!193964 (not true))))

(assert (=> b!310735 e!193965))

(declare-fun res!167183 () Bool)

(assert (=> b!310735 (=> (not res!167183) (not e!193965))))

(assert (=> b!310735 (= res!167183 (= lt!152071 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152070 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310735 (= lt!152070 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310736 () Bool)

(declare-fun res!167182 () Bool)

(assert (=> b!310736 (=> (not res!167182) (not e!193963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310736 (= res!167182 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30946 res!167189) b!310729))

(assert (= (and b!310729 res!167186) b!310736))

(assert (= (and b!310736 res!167182) b!310734))

(assert (= (and b!310734 res!167181) b!310727))

(assert (= (and b!310727 res!167187) b!310728))

(assert (= (and b!310728 res!167184) b!310732))

(assert (= (and b!310732 res!167190) b!310733))

(assert (= (and b!310733 res!167185) b!310731))

(assert (= (and b!310731 res!167188) b!310735))

(assert (= (and b!310735 res!167183) b!310730))

(declare-fun m!320653 () Bool)

(assert (=> b!310727 m!320653))

(declare-fun m!320655 () Bool)

(assert (=> start!30946 m!320655))

(declare-fun m!320657 () Bool)

(assert (=> start!30946 m!320657))

(declare-fun m!320659 () Bool)

(assert (=> b!310730 m!320659))

(declare-fun m!320661 () Bool)

(assert (=> b!310730 m!320661))

(declare-fun m!320663 () Bool)

(assert (=> b!310730 m!320663))

(declare-fun m!320665 () Bool)

(assert (=> b!310736 m!320665))

(declare-fun m!320667 () Bool)

(assert (=> b!310732 m!320667))

(assert (=> b!310732 m!320667))

(declare-fun m!320669 () Bool)

(assert (=> b!310732 m!320669))

(declare-fun m!320671 () Bool)

(assert (=> b!310734 m!320671))

(declare-fun m!320673 () Bool)

(assert (=> b!310733 m!320673))

(declare-fun m!320675 () Bool)

(assert (=> b!310728 m!320675))

(declare-fun m!320677 () Bool)

(assert (=> b!310731 m!320677))

(declare-fun m!320679 () Bool)

(assert (=> b!310731 m!320679))

(declare-fun m!320681 () Bool)

(assert (=> b!310735 m!320681))

(declare-fun m!320683 () Bool)

(assert (=> b!310735 m!320683))

(check-sat (not b!310732) (not b!310731) (not b!310736) (not start!30946) (not b!310728) (not b!310734) (not b!310730) (not b!310727) (not b!310735))
(check-sat)
