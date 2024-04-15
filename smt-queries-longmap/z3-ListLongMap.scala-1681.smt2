; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30960 () Bool)

(assert start!30960)

(declare-fun res!167475 () Bool)

(declare-fun e!193997 () Bool)

(assert (=> start!30960 (=> (not res!167475) (not e!193997))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30960 (= res!167475 (validMask!0 mask!3709))))

(assert (=> start!30960 e!193997))

(declare-datatypes ((array!15866 0))(
  ( (array!15867 (arr!7515 (Array (_ BitVec 32) (_ BitVec 64))) (size!7868 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15866)

(declare-fun array_inv!5487 (array!15866) Bool)

(assert (=> start!30960 (array_inv!5487 a!3293)))

(assert (=> start!30960 true))

(declare-fun b!310872 () Bool)

(declare-fun res!167474 () Bool)

(assert (=> b!310872 (=> (not res!167474) (not e!193997))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!310872 (= res!167474 (and (= (size!7868 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7868 a!3293))))))

(declare-fun b!310873 () Bool)

(declare-fun res!167481 () Bool)

(assert (=> b!310873 (=> (not res!167481) (not e!193997))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310873 (= res!167481 (validKeyInArray!0 k0!2441))))

(declare-fun b!310874 () Bool)

(declare-fun lt!152006 () (_ BitVec 32))

(declare-fun e!193998 () Bool)

(declare-fun lt!152005 () array!15866)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2654 0))(
  ( (MissingZero!2654 (index!12792 (_ BitVec 32))) (Found!2654 (index!12793 (_ BitVec 32))) (Intermediate!2654 (undefined!3466 Bool) (index!12794 (_ BitVec 32)) (x!31030 (_ BitVec 32))) (Undefined!2654) (MissingVacant!2654 (index!12795 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15866 (_ BitVec 32)) SeekEntryResult!2654)

(assert (=> b!310874 (= e!193998 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152005 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152006 k0!2441 lt!152005 mask!3709)))))

(assert (=> b!310874 (= lt!152005 (array!15867 (store (arr!7515 a!3293) i!1240 k0!2441) (size!7868 a!3293)))))

(declare-fun b!310875 () Bool)

(declare-fun res!167478 () Bool)

(assert (=> b!310875 (=> (not res!167478) (not e!193997))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15866 (_ BitVec 32)) SeekEntryResult!2654)

(assert (=> b!310875 (= res!167478 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2654 i!1240)))))

(declare-fun b!310876 () Bool)

(declare-fun res!167479 () Bool)

(assert (=> b!310876 (=> (not res!167479) (not e!193997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15866 (_ BitVec 32)) Bool)

(assert (=> b!310876 (= res!167479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310877 () Bool)

(declare-fun res!167480 () Bool)

(assert (=> b!310877 (=> (not res!167480) (not e!193997))))

(declare-fun arrayContainsKey!0 (array!15866 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310877 (= res!167480 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310878 () Bool)

(declare-fun e!193999 () Bool)

(assert (=> b!310878 (= e!193999 (not true))))

(assert (=> b!310878 e!193998))

(declare-fun res!167476 () Bool)

(assert (=> b!310878 (=> (not res!167476) (not e!193998))))

(declare-fun lt!152004 () SeekEntryResult!2654)

(assert (=> b!310878 (= res!167476 (= lt!152004 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152006 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310878 (= lt!152006 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310879 () Bool)

(declare-fun res!167472 () Bool)

(declare-fun e!193996 () Bool)

(assert (=> b!310879 (=> (not res!167472) (not e!193996))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310879 (= res!167472 (and (= (select (arr!7515 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7868 a!3293))))))

(declare-fun b!310880 () Bool)

(assert (=> b!310880 (= e!193997 e!193996)))

(declare-fun res!167473 () Bool)

(assert (=> b!310880 (=> (not res!167473) (not e!193996))))

(declare-fun lt!152003 () SeekEntryResult!2654)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310880 (= res!167473 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152003))))

(assert (=> b!310880 (= lt!152003 (Intermediate!2654 false resIndex!52 resX!52))))

(declare-fun b!310881 () Bool)

(assert (=> b!310881 (= e!193996 e!193999)))

(declare-fun res!167477 () Bool)

(assert (=> b!310881 (=> (not res!167477) (not e!193999))))

(assert (=> b!310881 (= res!167477 (and (= lt!152004 lt!152003) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7515 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310881 (= lt!152004 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(assert (= (and start!30960 res!167475) b!310872))

(assert (= (and b!310872 res!167474) b!310873))

(assert (= (and b!310873 res!167481) b!310877))

(assert (= (and b!310877 res!167480) b!310875))

(assert (= (and b!310875 res!167478) b!310876))

(assert (= (and b!310876 res!167479) b!310880))

(assert (= (and b!310880 res!167473) b!310879))

(assert (= (and b!310879 res!167472) b!310881))

(assert (= (and b!310881 res!167477) b!310878))

(assert (= (and b!310878 res!167476) b!310874))

(declare-fun m!320371 () Bool)

(assert (=> start!30960 m!320371))

(declare-fun m!320373 () Bool)

(assert (=> start!30960 m!320373))

(declare-fun m!320375 () Bool)

(assert (=> b!310878 m!320375))

(declare-fun m!320377 () Bool)

(assert (=> b!310878 m!320377))

(declare-fun m!320379 () Bool)

(assert (=> b!310875 m!320379))

(declare-fun m!320381 () Bool)

(assert (=> b!310873 m!320381))

(declare-fun m!320383 () Bool)

(assert (=> b!310877 m!320383))

(declare-fun m!320385 () Bool)

(assert (=> b!310874 m!320385))

(declare-fun m!320387 () Bool)

(assert (=> b!310874 m!320387))

(declare-fun m!320389 () Bool)

(assert (=> b!310874 m!320389))

(declare-fun m!320391 () Bool)

(assert (=> b!310880 m!320391))

(assert (=> b!310880 m!320391))

(declare-fun m!320393 () Bool)

(assert (=> b!310880 m!320393))

(declare-fun m!320395 () Bool)

(assert (=> b!310876 m!320395))

(declare-fun m!320397 () Bool)

(assert (=> b!310881 m!320397))

(declare-fun m!320399 () Bool)

(assert (=> b!310881 m!320399))

(declare-fun m!320401 () Bool)

(assert (=> b!310879 m!320401))

(check-sat (not b!310874) (not b!310873) (not b!310877) (not b!310881) (not b!310878) (not b!310880) (not start!30960) (not b!310876) (not b!310875))
(check-sat)
