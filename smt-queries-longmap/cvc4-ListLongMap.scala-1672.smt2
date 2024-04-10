; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30924 () Bool)

(assert start!30924)

(declare-fun b!310397 () Bool)

(declare-fun res!166860 () Bool)

(declare-fun e!193798 () Bool)

(assert (=> b!310397 (=> (not res!166860) (not e!193798))))

(declare-datatypes ((array!15826 0))(
  ( (array!15827 (arr!7495 (Array (_ BitVec 32) (_ BitVec 64))) (size!7847 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15826)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15826 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310397 (= res!166860 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!166851 () Bool)

(assert (=> start!30924 (=> (not res!166851) (not e!193798))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30924 (= res!166851 (validMask!0 mask!3709))))

(assert (=> start!30924 e!193798))

(declare-fun array_inv!5458 (array!15826) Bool)

(assert (=> start!30924 (array_inv!5458 a!3293)))

(assert (=> start!30924 true))

(declare-fun lt!151940 () array!15826)

(declare-fun b!310398 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!151939 () (_ BitVec 32))

(declare-fun e!193799 () Bool)

(declare-datatypes ((SeekEntryResult!2635 0))(
  ( (MissingZero!2635 (index!12716 (_ BitVec 32))) (Found!2635 (index!12717 (_ BitVec 32))) (Intermediate!2635 (undefined!3447 Bool) (index!12718 (_ BitVec 32)) (x!30944 (_ BitVec 32))) (Undefined!2635) (MissingVacant!2635 (index!12719 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15826 (_ BitVec 32)) SeekEntryResult!2635)

(assert (=> b!310398 (= e!193799 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!151940 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151939 k!2441 lt!151940 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!310398 (= lt!151940 (array!15827 (store (arr!7495 a!3293) i!1240 k!2441) (size!7847 a!3293)))))

(declare-fun b!310399 () Bool)

(declare-fun e!193801 () Bool)

(assert (=> b!310399 (= e!193801 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(assert (=> b!310399 e!193799))

(declare-fun res!166852 () Bool)

(assert (=> b!310399 (=> (not res!166852) (not e!193799))))

(declare-fun lt!151938 () SeekEntryResult!2635)

(assert (=> b!310399 (= res!166852 (= lt!151938 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151939 k!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310399 (= lt!151939 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310400 () Bool)

(declare-fun e!193797 () Bool)

(assert (=> b!310400 (= e!193798 e!193797)))

(declare-fun res!166853 () Bool)

(assert (=> b!310400 (=> (not res!166853) (not e!193797))))

(declare-fun lt!151941 () SeekEntryResult!2635)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310400 (= res!166853 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151941))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310400 (= lt!151941 (Intermediate!2635 false resIndex!52 resX!52))))

(declare-fun b!310401 () Bool)

(declare-fun res!166855 () Bool)

(assert (=> b!310401 (=> (not res!166855) (not e!193798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310401 (= res!166855 (validKeyInArray!0 k!2441))))

(declare-fun b!310402 () Bool)

(declare-fun res!166858 () Bool)

(assert (=> b!310402 (=> (not res!166858) (not e!193798))))

(assert (=> b!310402 (= res!166858 (and (= (size!7847 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7847 a!3293))))))

(declare-fun b!310403 () Bool)

(declare-fun res!166859 () Bool)

(assert (=> b!310403 (=> (not res!166859) (not e!193797))))

(assert (=> b!310403 (= res!166859 (and (= (select (arr!7495 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7847 a!3293))))))

(declare-fun b!310404 () Bool)

(declare-fun res!166856 () Bool)

(assert (=> b!310404 (=> (not res!166856) (not e!193798))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15826 (_ BitVec 32)) SeekEntryResult!2635)

(assert (=> b!310404 (= res!166856 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2635 i!1240)))))

(declare-fun b!310405 () Bool)

(assert (=> b!310405 (= e!193797 e!193801)))

(declare-fun res!166854 () Bool)

(assert (=> b!310405 (=> (not res!166854) (not e!193801))))

(assert (=> b!310405 (= res!166854 (and (= lt!151938 lt!151941) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7495 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310405 (= lt!151938 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!310406 () Bool)

(declare-fun res!166857 () Bool)

(assert (=> b!310406 (=> (not res!166857) (not e!193798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15826 (_ BitVec 32)) Bool)

(assert (=> b!310406 (= res!166857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30924 res!166851) b!310402))

(assert (= (and b!310402 res!166858) b!310401))

(assert (= (and b!310401 res!166855) b!310397))

(assert (= (and b!310397 res!166860) b!310404))

(assert (= (and b!310404 res!166856) b!310406))

(assert (= (and b!310406 res!166857) b!310400))

(assert (= (and b!310400 res!166853) b!310403))

(assert (= (and b!310403 res!166859) b!310405))

(assert (= (and b!310405 res!166854) b!310399))

(assert (= (and b!310399 res!166852) b!310398))

(declare-fun m!320301 () Bool)

(assert (=> b!310403 m!320301))

(declare-fun m!320303 () Bool)

(assert (=> b!310400 m!320303))

(assert (=> b!310400 m!320303))

(declare-fun m!320305 () Bool)

(assert (=> b!310400 m!320305))

(declare-fun m!320307 () Bool)

(assert (=> b!310399 m!320307))

(declare-fun m!320309 () Bool)

(assert (=> b!310399 m!320309))

(declare-fun m!320311 () Bool)

(assert (=> start!30924 m!320311))

(declare-fun m!320313 () Bool)

(assert (=> start!30924 m!320313))

(declare-fun m!320315 () Bool)

(assert (=> b!310401 m!320315))

(declare-fun m!320317 () Bool)

(assert (=> b!310397 m!320317))

(declare-fun m!320319 () Bool)

(assert (=> b!310404 m!320319))

(declare-fun m!320321 () Bool)

(assert (=> b!310398 m!320321))

(declare-fun m!320323 () Bool)

(assert (=> b!310398 m!320323))

(declare-fun m!320325 () Bool)

(assert (=> b!310398 m!320325))

(declare-fun m!320327 () Bool)

(assert (=> b!310405 m!320327))

(declare-fun m!320329 () Bool)

(assert (=> b!310405 m!320329))

(declare-fun m!320331 () Bool)

(assert (=> b!310406 m!320331))

(push 1)

(assert (not b!310399))

(assert (not b!310398))

(assert (not b!310397))

(assert (not b!310400))

(assert (not b!310406))

