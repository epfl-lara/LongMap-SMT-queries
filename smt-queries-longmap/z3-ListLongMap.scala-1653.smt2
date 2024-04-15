; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30738 () Bool)

(assert start!30738)

(declare-fun b!308251 () Bool)

(declare-fun e!192731 () Bool)

(assert (=> b!308251 (= e!192731 (not true))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2570 0))(
  ( (MissingZero!2570 (index!12456 (_ BitVec 32))) (Found!2570 (index!12457 (_ BitVec 32))) (Intermediate!2570 (undefined!3382 Bool) (index!12458 (_ BitVec 32)) (x!30713 (_ BitVec 32))) (Undefined!2570) (MissingVacant!2570 (index!12459 (_ BitVec 32))) )
))
(declare-fun lt!151150 () SeekEntryResult!2570)

(declare-datatypes ((array!15695 0))(
  ( (array!15696 (arr!7431 (Array (_ BitVec 32) (_ BitVec 64))) (size!7784 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15695)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15695 (_ BitVec 32)) SeekEntryResult!2570)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308251 (= lt!151150 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!308253 () Bool)

(declare-fun res!165017 () Bool)

(declare-fun e!192733 () Bool)

(assert (=> b!308253 (=> (not res!165017) (not e!192733))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308253 (= res!165017 (and (= (select (arr!7431 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7784 a!3293))))))

(declare-fun b!308254 () Bool)

(declare-fun res!165010 () Bool)

(declare-fun e!192732 () Bool)

(assert (=> b!308254 (=> (not res!165010) (not e!192732))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15695 (_ BitVec 32)) SeekEntryResult!2570)

(assert (=> b!308254 (= res!165010 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2570 i!1240)))))

(declare-fun b!308255 () Bool)

(assert (=> b!308255 (= e!192733 e!192731)))

(declare-fun res!165012 () Bool)

(assert (=> b!308255 (=> (not res!165012) (not e!192731))))

(declare-fun lt!151151 () SeekEntryResult!2570)

(assert (=> b!308255 (= res!165012 (and (= lt!151150 lt!151151) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7431 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308255 (= lt!151150 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!308256 () Bool)

(declare-fun res!165013 () Bool)

(assert (=> b!308256 (=> (not res!165013) (not e!192732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15695 (_ BitVec 32)) Bool)

(assert (=> b!308256 (= res!165013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308257 () Bool)

(assert (=> b!308257 (= e!192732 e!192733)))

(declare-fun res!165011 () Bool)

(assert (=> b!308257 (=> (not res!165011) (not e!192733))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308257 (= res!165011 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151151))))

(assert (=> b!308257 (= lt!151151 (Intermediate!2570 false resIndex!52 resX!52))))

(declare-fun res!165018 () Bool)

(assert (=> start!30738 (=> (not res!165018) (not e!192732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30738 (= res!165018 (validMask!0 mask!3709))))

(assert (=> start!30738 e!192732))

(declare-fun array_inv!5403 (array!15695) Bool)

(assert (=> start!30738 (array_inv!5403 a!3293)))

(assert (=> start!30738 true))

(declare-fun b!308252 () Bool)

(declare-fun res!165015 () Bool)

(assert (=> b!308252 (=> (not res!165015) (not e!192732))))

(assert (=> b!308252 (= res!165015 (and (= (size!7784 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7784 a!3293))))))

(declare-fun b!308258 () Bool)

(declare-fun res!165016 () Bool)

(assert (=> b!308258 (=> (not res!165016) (not e!192732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308258 (= res!165016 (validKeyInArray!0 k0!2441))))

(declare-fun b!308259 () Bool)

(declare-fun res!165014 () Bool)

(assert (=> b!308259 (=> (not res!165014) (not e!192732))))

(declare-fun arrayContainsKey!0 (array!15695 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308259 (= res!165014 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30738 res!165018) b!308252))

(assert (= (and b!308252 res!165015) b!308258))

(assert (= (and b!308258 res!165016) b!308259))

(assert (= (and b!308259 res!165014) b!308254))

(assert (= (and b!308254 res!165010) b!308256))

(assert (= (and b!308256 res!165013) b!308257))

(assert (= (and b!308257 res!165011) b!308253))

(assert (= (and b!308253 res!165017) b!308255))

(assert (= (and b!308255 res!165012) b!308251))

(declare-fun m!317833 () Bool)

(assert (=> b!308255 m!317833))

(declare-fun m!317835 () Bool)

(assert (=> b!308255 m!317835))

(declare-fun m!317837 () Bool)

(assert (=> b!308259 m!317837))

(declare-fun m!317839 () Bool)

(assert (=> start!30738 m!317839))

(declare-fun m!317841 () Bool)

(assert (=> start!30738 m!317841))

(declare-fun m!317843 () Bool)

(assert (=> b!308257 m!317843))

(assert (=> b!308257 m!317843))

(declare-fun m!317845 () Bool)

(assert (=> b!308257 m!317845))

(declare-fun m!317847 () Bool)

(assert (=> b!308253 m!317847))

(declare-fun m!317849 () Bool)

(assert (=> b!308256 m!317849))

(declare-fun m!317851 () Bool)

(assert (=> b!308258 m!317851))

(declare-fun m!317853 () Bool)

(assert (=> b!308254 m!317853))

(declare-fun m!317855 () Bool)

(assert (=> b!308251 m!317855))

(assert (=> b!308251 m!317855))

(declare-fun m!317857 () Bool)

(assert (=> b!308251 m!317857))

(check-sat (not b!308254) (not b!308256) (not b!308251) (not b!308258) (not b!308259) (not b!308255) (not b!308257) (not start!30738))
(check-sat)
