; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30936 () Bool)

(assert start!30936)

(declare-fun b!310734 () Bool)

(declare-fun res!167238 () Bool)

(declare-fun e!193960 () Bool)

(assert (=> b!310734 (=> (not res!167238) (not e!193960))))

(declare-datatypes ((array!15851 0))(
  ( (array!15852 (arr!7507 (Array (_ BitVec 32) (_ BitVec 64))) (size!7859 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15851)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!310734 (= res!167238 (and (= (size!7859 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7859 a!3293))))))

(declare-fun b!310735 () Bool)

(declare-fun res!167246 () Bool)

(assert (=> b!310735 (=> (not res!167246) (not e!193960))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310735 (= res!167246 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!167243 () Bool)

(assert (=> start!30936 (=> (not res!167243) (not e!193960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30936 (= res!167243 (validMask!0 mask!3709))))

(assert (=> start!30936 e!193960))

(declare-fun array_inv!5457 (array!15851) Bool)

(assert (=> start!30936 (array_inv!5457 a!3293)))

(assert (=> start!30936 true))

(declare-fun b!310736 () Bool)

(declare-fun res!167244 () Bool)

(assert (=> b!310736 (=> (not res!167244) (not e!193960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15851 (_ BitVec 32)) Bool)

(assert (=> b!310736 (= res!167244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310737 () Bool)

(declare-fun e!193962 () Bool)

(assert (=> b!310737 (= e!193960 e!193962)))

(declare-fun res!167241 () Bool)

(assert (=> b!310737 (=> (not res!167241) (not e!193962))))

(declare-datatypes ((SeekEntryResult!2612 0))(
  ( (MissingZero!2612 (index!12624 (_ BitVec 32))) (Found!2612 (index!12625 (_ BitVec 32))) (Intermediate!2612 (undefined!3424 Bool) (index!12626 (_ BitVec 32)) (x!30958 (_ BitVec 32))) (Undefined!2612) (MissingVacant!2612 (index!12627 (_ BitVec 32))) )
))
(declare-fun lt!152112 () SeekEntryResult!2612)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15851 (_ BitVec 32)) SeekEntryResult!2612)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310737 (= res!167241 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152112))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310737 (= lt!152112 (Intermediate!2612 false resIndex!52 resX!52))))

(declare-fun e!193959 () Bool)

(declare-fun b!310738 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!152113 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!152115 () array!15851)

(assert (=> b!310738 (= e!193959 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152115 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152113 k0!2441 lt!152115 mask!3709)))))

(assert (=> b!310738 (= lt!152115 (array!15852 (store (arr!7507 a!3293) i!1240 k0!2441) (size!7859 a!3293)))))

(declare-fun b!310739 () Bool)

(declare-fun res!167247 () Bool)

(assert (=> b!310739 (=> (not res!167247) (not e!193960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310739 (= res!167247 (validKeyInArray!0 k0!2441))))

(declare-fun b!310740 () Bool)

(declare-fun e!193961 () Bool)

(assert (=> b!310740 (= e!193961 (not true))))

(assert (=> b!310740 e!193959))

(declare-fun res!167239 () Bool)

(assert (=> b!310740 (=> (not res!167239) (not e!193959))))

(declare-fun lt!152114 () SeekEntryResult!2612)

(assert (=> b!310740 (= res!167239 (= lt!152114 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152113 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310740 (= lt!152113 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!310741 () Bool)

(declare-fun res!167240 () Bool)

(assert (=> b!310741 (=> (not res!167240) (not e!193960))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15851 (_ BitVec 32)) SeekEntryResult!2612)

(assert (=> b!310741 (= res!167240 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2612 i!1240)))))

(declare-fun b!310742 () Bool)

(declare-fun res!167242 () Bool)

(assert (=> b!310742 (=> (not res!167242) (not e!193962))))

(assert (=> b!310742 (= res!167242 (and (= (select (arr!7507 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7859 a!3293))))))

(declare-fun b!310743 () Bool)

(assert (=> b!310743 (= e!193962 e!193961)))

(declare-fun res!167245 () Bool)

(assert (=> b!310743 (=> (not res!167245) (not e!193961))))

(assert (=> b!310743 (= res!167245 (and (= lt!152114 lt!152112) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7507 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310743 (= lt!152114 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(assert (= (and start!30936 res!167243) b!310734))

(assert (= (and b!310734 res!167238) b!310739))

(assert (= (and b!310739 res!167247) b!310735))

(assert (= (and b!310735 res!167246) b!310741))

(assert (= (and b!310741 res!167240) b!310736))

(assert (= (and b!310736 res!167244) b!310737))

(assert (= (and b!310737 res!167241) b!310742))

(assert (= (and b!310742 res!167242) b!310743))

(assert (= (and b!310743 res!167245) b!310740))

(assert (= (and b!310740 res!167239) b!310738))

(declare-fun m!320851 () Bool)

(assert (=> b!310738 m!320851))

(declare-fun m!320853 () Bool)

(assert (=> b!310738 m!320853))

(declare-fun m!320855 () Bool)

(assert (=> b!310738 m!320855))

(declare-fun m!320857 () Bool)

(assert (=> b!310735 m!320857))

(declare-fun m!320859 () Bool)

(assert (=> b!310743 m!320859))

(declare-fun m!320861 () Bool)

(assert (=> b!310743 m!320861))

(declare-fun m!320863 () Bool)

(assert (=> b!310739 m!320863))

(declare-fun m!320865 () Bool)

(assert (=> b!310736 m!320865))

(declare-fun m!320867 () Bool)

(assert (=> b!310740 m!320867))

(declare-fun m!320869 () Bool)

(assert (=> b!310740 m!320869))

(declare-fun m!320871 () Bool)

(assert (=> b!310737 m!320871))

(assert (=> b!310737 m!320871))

(declare-fun m!320873 () Bool)

(assert (=> b!310737 m!320873))

(declare-fun m!320875 () Bool)

(assert (=> b!310742 m!320875))

(declare-fun m!320877 () Bool)

(assert (=> b!310741 m!320877))

(declare-fun m!320879 () Bool)

(assert (=> start!30936 m!320879))

(declare-fun m!320881 () Bool)

(assert (=> start!30936 m!320881))

(check-sat (not b!310739) (not b!310738) (not b!310735) (not b!310737) (not b!310743) (not b!310741) (not b!310736) (not b!310740) (not start!30936))
(check-sat)
