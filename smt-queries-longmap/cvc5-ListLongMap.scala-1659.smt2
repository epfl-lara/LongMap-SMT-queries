; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30788 () Bool)

(assert start!30788)

(declare-fun b!309012 () Bool)

(declare-fun res!165633 () Bool)

(declare-fun e!193123 () Bool)

(assert (=> b!309012 (=> (not res!165633) (not e!193123))))

(declare-datatypes ((array!15741 0))(
  ( (array!15742 (arr!7454 (Array (_ BitVec 32) (_ BitVec 64))) (size!7806 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15741)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309012 (= res!165633 (and (= (select (arr!7454 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7806 a!3293))))))

(declare-fun b!309013 () Bool)

(declare-fun res!165626 () Bool)

(declare-fun e!193125 () Bool)

(assert (=> b!309013 (=> (not res!165626) (not e!193125))))

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!309013 (= res!165626 (and (= (size!7806 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7806 a!3293))))))

(declare-fun b!309014 () Bool)

(declare-fun res!165631 () Bool)

(assert (=> b!309014 (=> (not res!165631) (not e!193125))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2594 0))(
  ( (MissingZero!2594 (index!12552 (_ BitVec 32))) (Found!2594 (index!12553 (_ BitVec 32))) (Intermediate!2594 (undefined!3406 Bool) (index!12554 (_ BitVec 32)) (x!30790 (_ BitVec 32))) (Undefined!2594) (MissingVacant!2594 (index!12555 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15741 (_ BitVec 32)) SeekEntryResult!2594)

(assert (=> b!309014 (= res!165631 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2594 i!1240)))))

(declare-fun b!309015 () Bool)

(declare-fun res!165632 () Bool)

(assert (=> b!309015 (=> (not res!165632) (not e!193125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15741 (_ BitVec 32)) Bool)

(assert (=> b!309015 (= res!165632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309016 () Bool)

(declare-fun e!193126 () Bool)

(assert (=> b!309016 (= e!193123 e!193126)))

(declare-fun res!165629 () Bool)

(assert (=> b!309016 (=> (not res!165629) (not e!193126))))

(declare-fun lt!151494 () SeekEntryResult!2594)

(declare-fun lt!151493 () SeekEntryResult!2594)

(assert (=> b!309016 (= res!165629 (and (= lt!151494 lt!151493) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7454 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15741 (_ BitVec 32)) SeekEntryResult!2594)

(assert (=> b!309016 (= lt!151494 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!309017 () Bool)

(assert (=> b!309017 (= e!193125 e!193123)))

(declare-fun res!165625 () Bool)

(assert (=> b!309017 (=> (not res!165625) (not e!193123))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309017 (= res!165625 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151493))))

(assert (=> b!309017 (= lt!151493 (Intermediate!2594 false resIndex!52 resX!52))))

(declare-fun res!165627 () Bool)

(assert (=> start!30788 (=> (not res!165627) (not e!193125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30788 (= res!165627 (validMask!0 mask!3709))))

(assert (=> start!30788 e!193125))

(declare-fun array_inv!5417 (array!15741) Bool)

(assert (=> start!30788 (array_inv!5417 a!3293)))

(assert (=> start!30788 true))

(declare-fun b!309018 () Bool)

(declare-fun res!165630 () Bool)

(assert (=> b!309018 (=> (not res!165630) (not e!193125))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309018 (= res!165630 (validKeyInArray!0 k!2441))))

(declare-fun b!309019 () Bool)

(assert (=> b!309019 (= e!193126 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309019 (= lt!151494 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!309020 () Bool)

(declare-fun res!165628 () Bool)

(assert (=> b!309020 (=> (not res!165628) (not e!193125))))

(declare-fun arrayContainsKey!0 (array!15741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309020 (= res!165628 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30788 res!165627) b!309013))

(assert (= (and b!309013 res!165626) b!309018))

(assert (= (and b!309018 res!165630) b!309020))

(assert (= (and b!309020 res!165628) b!309014))

(assert (= (and b!309014 res!165631) b!309015))

(assert (= (and b!309015 res!165632) b!309017))

(assert (= (and b!309017 res!165625) b!309012))

(assert (= (and b!309012 res!165633) b!309016))

(assert (= (and b!309016 res!165629) b!309019))

(declare-fun m!319031 () Bool)

(assert (=> b!309017 m!319031))

(assert (=> b!309017 m!319031))

(declare-fun m!319033 () Bool)

(assert (=> b!309017 m!319033))

(declare-fun m!319035 () Bool)

(assert (=> b!309015 m!319035))

(declare-fun m!319037 () Bool)

(assert (=> b!309016 m!319037))

(declare-fun m!319039 () Bool)

(assert (=> b!309016 m!319039))

(declare-fun m!319041 () Bool)

(assert (=> b!309020 m!319041))

(declare-fun m!319043 () Bool)

(assert (=> start!30788 m!319043))

(declare-fun m!319045 () Bool)

(assert (=> start!30788 m!319045))

(declare-fun m!319047 () Bool)

(assert (=> b!309019 m!319047))

(assert (=> b!309019 m!319047))

(declare-fun m!319049 () Bool)

(assert (=> b!309019 m!319049))

(declare-fun m!319051 () Bool)

(assert (=> b!309012 m!319051))

(declare-fun m!319053 () Bool)

(assert (=> b!309018 m!319053))

(declare-fun m!319055 () Bool)

(assert (=> b!309014 m!319055))

(push 1)

