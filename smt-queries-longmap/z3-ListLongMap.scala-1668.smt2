; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30882 () Bool)

(assert start!30882)

(declare-fun b!309931 () Bool)

(declare-fun e!193563 () Bool)

(declare-fun e!193561 () Bool)

(assert (=> b!309931 (= e!193563 e!193561)))

(declare-fun res!166443 () Bool)

(assert (=> b!309931 (=> (not res!166443) (not e!193561))))

(declare-datatypes ((array!15797 0))(
  ( (array!15798 (arr!7480 (Array (_ BitVec 32) (_ BitVec 64))) (size!7832 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15797)

(declare-datatypes ((SeekEntryResult!2585 0))(
  ( (MissingZero!2585 (index!12516 (_ BitVec 32))) (Found!2585 (index!12517 (_ BitVec 32))) (Intermediate!2585 (undefined!3397 Bool) (index!12518 (_ BitVec 32)) (x!30859 (_ BitVec 32))) (Undefined!2585) (MissingVacant!2585 (index!12519 (_ BitVec 32))) )
))
(declare-fun lt!151803 () SeekEntryResult!2585)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!151802 () SeekEntryResult!2585)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309931 (= res!166443 (and (= lt!151803 lt!151802) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7480 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15797 (_ BitVec 32)) SeekEntryResult!2585)

(assert (=> b!309931 (= lt!151803 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!309932 () Bool)

(declare-fun res!166436 () Bool)

(declare-fun e!193562 () Bool)

(assert (=> b!309932 (=> (not res!166436) (not e!193562))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309932 (= res!166436 (validKeyInArray!0 k0!2441))))

(declare-fun b!309933 () Bool)

(declare-fun res!166435 () Bool)

(assert (=> b!309933 (=> (not res!166435) (not e!193562))))

(declare-fun arrayContainsKey!0 (array!15797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309933 (= res!166435 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309934 () Bool)

(declare-fun res!166439 () Bool)

(assert (=> b!309934 (=> (not res!166439) (not e!193562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15797 (_ BitVec 32)) Bool)

(assert (=> b!309934 (= res!166439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309935 () Bool)

(assert (=> b!309935 (= e!193562 e!193563)))

(declare-fun res!166437 () Bool)

(assert (=> b!309935 (=> (not res!166437) (not e!193563))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309935 (= res!166437 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151802))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!309935 (= lt!151802 (Intermediate!2585 false resIndex!52 resX!52))))

(declare-fun res!166441 () Bool)

(assert (=> start!30882 (=> (not res!166441) (not e!193562))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30882 (= res!166441 (validMask!0 mask!3709))))

(assert (=> start!30882 e!193562))

(declare-fun array_inv!5430 (array!15797) Bool)

(assert (=> start!30882 (array_inv!5430 a!3293)))

(assert (=> start!30882 true))

(declare-fun b!309936 () Bool)

(assert (=> b!309936 (= e!193561 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309936 (= lt!151803 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!309937 () Bool)

(declare-fun res!166442 () Bool)

(assert (=> b!309937 (=> (not res!166442) (not e!193563))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!309937 (= res!166442 (and (= (select (arr!7480 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7832 a!3293))))))

(declare-fun b!309938 () Bool)

(declare-fun res!166438 () Bool)

(assert (=> b!309938 (=> (not res!166438) (not e!193562))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15797 (_ BitVec 32)) SeekEntryResult!2585)

(assert (=> b!309938 (= res!166438 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2585 i!1240)))))

(declare-fun b!309939 () Bool)

(declare-fun res!166440 () Bool)

(assert (=> b!309939 (=> (not res!166440) (not e!193562))))

(assert (=> b!309939 (= res!166440 (and (= (size!7832 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7832 a!3293))))))

(assert (= (and start!30882 res!166441) b!309939))

(assert (= (and b!309939 res!166440) b!309932))

(assert (= (and b!309932 res!166436) b!309933))

(assert (= (and b!309933 res!166435) b!309938))

(assert (= (and b!309938 res!166438) b!309934))

(assert (= (and b!309934 res!166439) b!309935))

(assert (= (and b!309935 res!166437) b!309937))

(assert (= (and b!309937 res!166442) b!309931))

(assert (= (and b!309931 res!166443) b!309936))

(declare-fun m!320005 () Bool)

(assert (=> b!309934 m!320005))

(declare-fun m!320007 () Bool)

(assert (=> b!309937 m!320007))

(declare-fun m!320009 () Bool)

(assert (=> b!309936 m!320009))

(assert (=> b!309936 m!320009))

(declare-fun m!320011 () Bool)

(assert (=> b!309936 m!320011))

(declare-fun m!320013 () Bool)

(assert (=> b!309933 m!320013))

(declare-fun m!320015 () Bool)

(assert (=> b!309931 m!320015))

(declare-fun m!320017 () Bool)

(assert (=> b!309931 m!320017))

(declare-fun m!320019 () Bool)

(assert (=> start!30882 m!320019))

(declare-fun m!320021 () Bool)

(assert (=> start!30882 m!320021))

(declare-fun m!320023 () Bool)

(assert (=> b!309935 m!320023))

(assert (=> b!309935 m!320023))

(declare-fun m!320025 () Bool)

(assert (=> b!309935 m!320025))

(declare-fun m!320027 () Bool)

(assert (=> b!309932 m!320027))

(declare-fun m!320029 () Bool)

(assert (=> b!309938 m!320029))

(check-sat (not b!309932) (not b!309938) (not b!309935) (not b!309931) (not start!30882) (not b!309933) (not b!309936) (not b!309934))
(check-sat)
