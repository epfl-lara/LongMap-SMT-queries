; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30768 () Bool)

(assert start!30768)

(declare-fun b!308878 () Bool)

(declare-fun e!193056 () Bool)

(declare-fun e!193053 () Bool)

(assert (=> b!308878 (= e!193056 e!193053)))

(declare-fun res!165543 () Bool)

(assert (=> b!308878 (=> (not res!165543) (not e!193053))))

(declare-datatypes ((SeekEntryResult!2555 0))(
  ( (MissingZero!2555 (index!12396 (_ BitVec 32))) (Found!2555 (index!12397 (_ BitVec 32))) (Intermediate!2555 (undefined!3367 Bool) (index!12398 (_ BitVec 32)) (x!30740 (_ BitVec 32))) (Undefined!2555) (MissingVacant!2555 (index!12399 (_ BitVec 32))) )
))
(declare-fun lt!151494 () SeekEntryResult!2555)

(declare-datatypes ((array!15734 0))(
  ( (array!15735 (arr!7450 (Array (_ BitVec 32) (_ BitVec 64))) (size!7802 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15734)

(declare-fun lt!151493 () SeekEntryResult!2555)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(assert (=> b!308878 (= res!165543 (and (= lt!151494 lt!151493) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7450 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15734 (_ BitVec 32)) SeekEntryResult!2555)

(assert (=> b!308878 (= lt!151494 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!308879 () Bool)

(declare-fun res!165545 () Bool)

(declare-fun e!193055 () Bool)

(assert (=> b!308879 (=> (not res!165545) (not e!193055))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308879 (= res!165545 (and (= (size!7802 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7802 a!3293))))))

(declare-fun b!308880 () Bool)

(declare-fun res!165548 () Bool)

(assert (=> b!308880 (=> (not res!165548) (not e!193055))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15734 (_ BitVec 32)) SeekEntryResult!2555)

(assert (=> b!308880 (= res!165548 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2555 i!1240)))))

(declare-fun b!308881 () Bool)

(declare-fun res!165541 () Bool)

(assert (=> b!308881 (=> (not res!165541) (not e!193055))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15734 (_ BitVec 32)) Bool)

(assert (=> b!308881 (= res!165541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308882 () Bool)

(declare-fun res!165542 () Bool)

(assert (=> b!308882 (=> (not res!165542) (not e!193056))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!308882 (= res!165542 (and (= (select (arr!7450 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7802 a!3293))))))

(declare-fun b!308883 () Bool)

(assert (=> b!308883 (= e!193055 e!193056)))

(declare-fun res!165546 () Bool)

(assert (=> b!308883 (=> (not res!165546) (not e!193056))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308883 (= res!165546 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151493))))

(assert (=> b!308883 (= lt!151493 (Intermediate!2555 false resIndex!52 resX!52))))

(declare-fun res!165547 () Bool)

(assert (=> start!30768 (=> (not res!165547) (not e!193055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30768 (= res!165547 (validMask!0 mask!3709))))

(assert (=> start!30768 e!193055))

(declare-fun array_inv!5400 (array!15734) Bool)

(assert (=> start!30768 (array_inv!5400 a!3293)))

(assert (=> start!30768 true))

(declare-fun b!308884 () Bool)

(declare-fun res!165549 () Bool)

(assert (=> b!308884 (=> (not res!165549) (not e!193055))))

(declare-fun arrayContainsKey!0 (array!15734 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308884 (= res!165549 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!308885 () Bool)

(assert (=> b!308885 (= e!193053 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308885 (= lt!151494 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!308886 () Bool)

(declare-fun res!165544 () Bool)

(assert (=> b!308886 (=> (not res!165544) (not e!193055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308886 (= res!165544 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30768 res!165547) b!308879))

(assert (= (and b!308879 res!165545) b!308886))

(assert (= (and b!308886 res!165544) b!308884))

(assert (= (and b!308884 res!165549) b!308880))

(assert (= (and b!308880 res!165548) b!308881))

(assert (= (and b!308881 res!165541) b!308883))

(assert (= (and b!308883 res!165546) b!308882))

(assert (= (and b!308882 res!165542) b!308878))

(assert (= (and b!308878 res!165543) b!308885))

(declare-fun m!319081 () Bool)

(assert (=> b!308878 m!319081))

(declare-fun m!319083 () Bool)

(assert (=> b!308878 m!319083))

(declare-fun m!319085 () Bool)

(assert (=> b!308884 m!319085))

(declare-fun m!319087 () Bool)

(assert (=> b!308880 m!319087))

(declare-fun m!319089 () Bool)

(assert (=> b!308886 m!319089))

(declare-fun m!319091 () Bool)

(assert (=> b!308885 m!319091))

(assert (=> b!308885 m!319091))

(declare-fun m!319093 () Bool)

(assert (=> b!308885 m!319093))

(declare-fun m!319095 () Bool)

(assert (=> b!308881 m!319095))

(declare-fun m!319097 () Bool)

(assert (=> b!308882 m!319097))

(declare-fun m!319099 () Bool)

(assert (=> b!308883 m!319099))

(assert (=> b!308883 m!319099))

(declare-fun m!319101 () Bool)

(assert (=> b!308883 m!319101))

(declare-fun m!319103 () Bool)

(assert (=> start!30768 m!319103))

(declare-fun m!319105 () Bool)

(assert (=> start!30768 m!319105))

(check-sat (not b!308886) (not b!308881) (not b!308880) (not b!308883) (not b!308884) (not start!30768) (not b!308885) (not b!308878))
(check-sat)
