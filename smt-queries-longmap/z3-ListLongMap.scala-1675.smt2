; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30924 () Bool)

(assert start!30924)

(declare-fun b!310332 () Bool)

(declare-fun e!193727 () Bool)

(declare-fun e!193728 () Bool)

(assert (=> b!310332 (= e!193727 e!193728)))

(declare-fun res!166937 () Bool)

(assert (=> b!310332 (=> (not res!166937) (not e!193728))))

(declare-datatypes ((array!15830 0))(
  ( (array!15831 (arr!7497 (Array (_ BitVec 32) (_ BitVec 64))) (size!7850 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15830)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2636 0))(
  ( (MissingZero!2636 (index!12720 (_ BitVec 32))) (Found!2636 (index!12721 (_ BitVec 32))) (Intermediate!2636 (undefined!3448 Bool) (index!12722 (_ BitVec 32)) (x!30964 (_ BitVec 32))) (Undefined!2636) (MissingVacant!2636 (index!12723 (_ BitVec 32))) )
))
(declare-fun lt!151790 () SeekEntryResult!2636)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!151789 () SeekEntryResult!2636)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310332 (= res!166937 (and (= lt!151790 lt!151789) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7497 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15830 (_ BitVec 32)) SeekEntryResult!2636)

(assert (=> b!310332 (= lt!151790 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310333 () Bool)

(declare-fun e!193730 () Bool)

(assert (=> b!310333 (= e!193730 e!193727)))

(declare-fun res!166932 () Bool)

(assert (=> b!310333 (=> (not res!166932) (not e!193727))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310333 (= res!166932 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151789))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!310333 (= lt!151789 (Intermediate!2636 false resIndex!52 resX!52))))

(declare-fun b!310334 () Bool)

(declare-fun res!166934 () Bool)

(assert (=> b!310334 (=> (not res!166934) (not e!193730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15830 (_ BitVec 32)) Bool)

(assert (=> b!310334 (= res!166934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!166941 () Bool)

(assert (=> start!30924 (=> (not res!166941) (not e!193730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30924 (= res!166941 (validMask!0 mask!3709))))

(assert (=> start!30924 e!193730))

(declare-fun array_inv!5469 (array!15830) Bool)

(assert (=> start!30924 (array_inv!5469 a!3293)))

(assert (=> start!30924 true))

(declare-fun b!310335 () Bool)

(declare-fun res!166933 () Bool)

(assert (=> b!310335 (=> (not res!166933) (not e!193730))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15830 (_ BitVec 32)) SeekEntryResult!2636)

(assert (=> b!310335 (= res!166933 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2636 i!1240)))))

(declare-fun b!310336 () Bool)

(declare-fun res!166939 () Bool)

(assert (=> b!310336 (=> (not res!166939) (not e!193727))))

(assert (=> b!310336 (= res!166939 (and (= (select (arr!7497 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7850 a!3293))))))

(declare-fun b!310337 () Bool)

(declare-fun res!166940 () Bool)

(assert (=> b!310337 (=> (not res!166940) (not e!193730))))

(declare-fun arrayContainsKey!0 (array!15830 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310337 (= res!166940 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310338 () Bool)

(declare-fun res!166938 () Bool)

(assert (=> b!310338 (=> (not res!166938) (not e!193730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310338 (= res!166938 (validKeyInArray!0 k0!2441))))

(declare-fun lt!151787 () array!15830)

(declare-fun lt!151788 () (_ BitVec 32))

(declare-fun b!310339 () Bool)

(declare-fun e!193729 () Bool)

(assert (=> b!310339 (= e!193729 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!151787 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151788 k0!2441 lt!151787 mask!3709)))))

(assert (=> b!310339 (= lt!151787 (array!15831 (store (arr!7497 a!3293) i!1240 k0!2441) (size!7850 a!3293)))))

(declare-fun b!310340 () Bool)

(assert (=> b!310340 (= e!193728 (not true))))

(assert (=> b!310340 e!193729))

(declare-fun res!166935 () Bool)

(assert (=> b!310340 (=> (not res!166935) (not e!193729))))

(assert (=> b!310340 (= res!166935 (= lt!151790 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151788 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310340 (= lt!151788 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310341 () Bool)

(declare-fun res!166936 () Bool)

(assert (=> b!310341 (=> (not res!166936) (not e!193730))))

(assert (=> b!310341 (= res!166936 (and (= (size!7850 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7850 a!3293))))))

(assert (= (and start!30924 res!166941) b!310341))

(assert (= (and b!310341 res!166936) b!310338))

(assert (= (and b!310338 res!166938) b!310337))

(assert (= (and b!310337 res!166940) b!310335))

(assert (= (and b!310335 res!166933) b!310334))

(assert (= (and b!310334 res!166934) b!310333))

(assert (= (and b!310333 res!166932) b!310336))

(assert (= (and b!310336 res!166939) b!310332))

(assert (= (and b!310332 res!166937) b!310340))

(assert (= (and b!310340 res!166935) b!310339))

(declare-fun m!319795 () Bool)

(assert (=> b!310335 m!319795))

(declare-fun m!319797 () Bool)

(assert (=> b!310337 m!319797))

(declare-fun m!319799 () Bool)

(assert (=> b!310338 m!319799))

(declare-fun m!319801 () Bool)

(assert (=> start!30924 m!319801))

(declare-fun m!319803 () Bool)

(assert (=> start!30924 m!319803))

(declare-fun m!319805 () Bool)

(assert (=> b!310334 m!319805))

(declare-fun m!319807 () Bool)

(assert (=> b!310340 m!319807))

(declare-fun m!319809 () Bool)

(assert (=> b!310340 m!319809))

(declare-fun m!319811 () Bool)

(assert (=> b!310336 m!319811))

(declare-fun m!319813 () Bool)

(assert (=> b!310333 m!319813))

(assert (=> b!310333 m!319813))

(declare-fun m!319815 () Bool)

(assert (=> b!310333 m!319815))

(declare-fun m!319817 () Bool)

(assert (=> b!310339 m!319817))

(declare-fun m!319819 () Bool)

(assert (=> b!310339 m!319819))

(declare-fun m!319821 () Bool)

(assert (=> b!310339 m!319821))

(declare-fun m!319823 () Bool)

(assert (=> b!310332 m!319823))

(declare-fun m!319825 () Bool)

(assert (=> b!310332 m!319825))

(check-sat (not b!310338) (not b!310337) (not b!310333) (not b!310339) (not start!30924) (not b!310332) (not b!310340) (not b!310334) (not b!310335))
(check-sat)
