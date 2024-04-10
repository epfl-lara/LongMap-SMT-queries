; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30892 () Bool)

(assert start!30892)

(declare-fun b!309930 () Bool)

(declare-fun res!166390 () Bool)

(declare-fun e!193570 () Bool)

(assert (=> b!309930 (=> (not res!166390) (not e!193570))))

(declare-datatypes ((array!15794 0))(
  ( (array!15795 (arr!7479 (Array (_ BitVec 32) (_ BitVec 64))) (size!7831 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15794)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15794 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309930 (= res!166390 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309931 () Bool)

(declare-fun res!166391 () Bool)

(assert (=> b!309931 (=> (not res!166391) (not e!193570))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15794 (_ BitVec 32)) Bool)

(assert (=> b!309931 (= res!166391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309932 () Bool)

(declare-fun res!166386 () Bool)

(assert (=> b!309932 (=> (not res!166386) (not e!193570))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!309932 (= res!166386 (and (= (size!7831 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7831 a!3293))))))

(declare-fun b!309933 () Bool)

(declare-fun res!166385 () Bool)

(assert (=> b!309933 (=> (not res!166385) (not e!193570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309933 (= res!166385 (validKeyInArray!0 k0!2441))))

(declare-fun b!309934 () Bool)

(declare-fun e!193573 () Bool)

(assert (=> b!309934 (= e!193570 e!193573)))

(declare-fun res!166387 () Bool)

(assert (=> b!309934 (=> (not res!166387) (not e!193573))))

(declare-datatypes ((SeekEntryResult!2619 0))(
  ( (MissingZero!2619 (index!12652 (_ BitVec 32))) (Found!2619 (index!12653 (_ BitVec 32))) (Intermediate!2619 (undefined!3431 Bool) (index!12654 (_ BitVec 32)) (x!30888 (_ BitVec 32))) (Undefined!2619) (MissingVacant!2619 (index!12655 (_ BitVec 32))) )
))
(declare-fun lt!151770 () SeekEntryResult!2619)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15794 (_ BitVec 32)) SeekEntryResult!2619)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309934 (= res!166387 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151770))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!309934 (= lt!151770 (Intermediate!2619 false resIndex!52 resX!52))))

(declare-fun res!166384 () Bool)

(assert (=> start!30892 (=> (not res!166384) (not e!193570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30892 (= res!166384 (validMask!0 mask!3709))))

(assert (=> start!30892 e!193570))

(declare-fun array_inv!5442 (array!15794) Bool)

(assert (=> start!30892 (array_inv!5442 a!3293)))

(assert (=> start!30892 true))

(declare-fun b!309935 () Bool)

(declare-fun e!193571 () Bool)

(assert (=> b!309935 (= e!193573 e!193571)))

(declare-fun res!166392 () Bool)

(assert (=> b!309935 (=> (not res!166392) (not e!193571))))

(declare-fun lt!151768 () SeekEntryResult!2619)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309935 (= res!166392 (and (= lt!151768 lt!151770) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7479 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309935 (= lt!151768 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!309936 () Bool)

(declare-fun res!166388 () Bool)

(assert (=> b!309936 (=> (not res!166388) (not e!193573))))

(assert (=> b!309936 (= res!166388 (and (= (select (arr!7479 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7831 a!3293))))))

(declare-fun b!309937 () Bool)

(declare-fun res!166389 () Bool)

(assert (=> b!309937 (=> (not res!166389) (not e!193570))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15794 (_ BitVec 32)) SeekEntryResult!2619)

(assert (=> b!309937 (= res!166389 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2619 i!1240)))))

(declare-fun lt!151769 () (_ BitVec 32))

(declare-fun b!309938 () Bool)

(assert (=> b!309938 (= e!193571 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt lt!151769 #b00000000000000000000000000000000) (bvsge lt!151769 (bvadd #b00000000000000000000000000000001 mask!3709)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000)))))))

(assert (=> b!309938 (= lt!151768 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151769 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309938 (= lt!151769 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!30892 res!166384) b!309932))

(assert (= (and b!309932 res!166386) b!309933))

(assert (= (and b!309933 res!166385) b!309930))

(assert (= (and b!309930 res!166390) b!309937))

(assert (= (and b!309937 res!166389) b!309931))

(assert (= (and b!309931 res!166391) b!309934))

(assert (= (and b!309934 res!166387) b!309936))

(assert (= (and b!309936 res!166388) b!309935))

(assert (= (and b!309935 res!166392) b!309938))

(declare-fun m!319819 () Bool)

(assert (=> b!309931 m!319819))

(declare-fun m!319821 () Bool)

(assert (=> b!309934 m!319821))

(assert (=> b!309934 m!319821))

(declare-fun m!319823 () Bool)

(assert (=> b!309934 m!319823))

(declare-fun m!319825 () Bool)

(assert (=> b!309936 m!319825))

(declare-fun m!319827 () Bool)

(assert (=> start!30892 m!319827))

(declare-fun m!319829 () Bool)

(assert (=> start!30892 m!319829))

(declare-fun m!319831 () Bool)

(assert (=> b!309933 m!319831))

(declare-fun m!319833 () Bool)

(assert (=> b!309935 m!319833))

(declare-fun m!319835 () Bool)

(assert (=> b!309935 m!319835))

(declare-fun m!319837 () Bool)

(assert (=> b!309930 m!319837))

(declare-fun m!319839 () Bool)

(assert (=> b!309938 m!319839))

(declare-fun m!319841 () Bool)

(assert (=> b!309938 m!319841))

(declare-fun m!319843 () Bool)

(assert (=> b!309937 m!319843))

(check-sat (not b!309931) (not b!309934) (not b!309935) (not b!309933) (not b!309930) (not b!309937) (not b!309938) (not start!30892))
(check-sat)
