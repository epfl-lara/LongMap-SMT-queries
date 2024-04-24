; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30906 () Bool)

(assert start!30906)

(declare-fun b!310284 () Bool)

(declare-fun res!166795 () Bool)

(declare-fun e!193733 () Bool)

(assert (=> b!310284 (=> (not res!166795) (not e!193733))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310284 (= res!166795 (validKeyInArray!0 k0!2441))))

(declare-fun b!310285 () Bool)

(declare-fun e!193734 () Bool)

(assert (=> b!310285 (= e!193733 e!193734)))

(declare-fun res!166791 () Bool)

(assert (=> b!310285 (=> (not res!166791) (not e!193734))))

(declare-datatypes ((array!15821 0))(
  ( (array!15822 (arr!7492 (Array (_ BitVec 32) (_ BitVec 64))) (size!7844 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15821)

(declare-datatypes ((SeekEntryResult!2597 0))(
  ( (MissingZero!2597 (index!12564 (_ BitVec 32))) (Found!2597 (index!12565 (_ BitVec 32))) (Intermediate!2597 (undefined!3409 Bool) (index!12566 (_ BitVec 32)) (x!30903 (_ BitVec 32))) (Undefined!2597) (MissingVacant!2597 (index!12567 (_ BitVec 32))) )
))
(declare-fun lt!151934 () SeekEntryResult!2597)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15821 (_ BitVec 32)) SeekEntryResult!2597)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310285 (= res!166791 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151934))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!310285 (= lt!151934 (Intermediate!2597 false resIndex!52 resX!52))))

(declare-fun b!310287 () Bool)

(declare-fun res!166796 () Bool)

(assert (=> b!310287 (=> (not res!166796) (not e!193733))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15821 (_ BitVec 32)) SeekEntryResult!2597)

(assert (=> b!310287 (= res!166796 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2597 i!1240)))))

(declare-fun b!310288 () Bool)

(declare-fun res!166797 () Bool)

(assert (=> b!310288 (=> (not res!166797) (not e!193733))))

(declare-fun arrayContainsKey!0 (array!15821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310288 (= res!166797 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310289 () Bool)

(declare-fun res!166792 () Bool)

(assert (=> b!310289 (=> (not res!166792) (not e!193734))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310289 (= res!166792 (and (= (select (arr!7492 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7844 a!3293))))))

(declare-fun lt!151932 () (_ BitVec 32))

(declare-fun b!310290 () Bool)

(declare-fun lt!151933 () array!15821)

(declare-fun e!193735 () Bool)

(assert (=> b!310290 (= e!193735 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!151933 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151932 k0!2441 lt!151933 mask!3709)))))

(assert (=> b!310290 (= lt!151933 (array!15822 (store (arr!7492 a!3293) i!1240 k0!2441) (size!7844 a!3293)))))

(declare-fun b!310291 () Bool)

(declare-fun res!166790 () Bool)

(assert (=> b!310291 (=> (not res!166790) (not e!193733))))

(assert (=> b!310291 (= res!166790 (and (= (size!7844 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7844 a!3293))))))

(declare-fun res!166793 () Bool)

(assert (=> start!30906 (=> (not res!166793) (not e!193733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30906 (= res!166793 (validMask!0 mask!3709))))

(assert (=> start!30906 e!193733))

(declare-fun array_inv!5442 (array!15821) Bool)

(assert (=> start!30906 (array_inv!5442 a!3293)))

(assert (=> start!30906 true))

(declare-fun b!310286 () Bool)

(declare-fun e!193736 () Bool)

(assert (=> b!310286 (= e!193736 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000)))))))

(assert (=> b!310286 e!193735))

(declare-fun res!166794 () Bool)

(assert (=> b!310286 (=> (not res!166794) (not e!193735))))

(declare-fun lt!151935 () SeekEntryResult!2597)

(assert (=> b!310286 (= res!166794 (= lt!151935 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151932 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310286 (= lt!151932 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!310292 () Bool)

(declare-fun res!166789 () Bool)

(assert (=> b!310292 (=> (not res!166789) (not e!193733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15821 (_ BitVec 32)) Bool)

(assert (=> b!310292 (= res!166789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310293 () Bool)

(assert (=> b!310293 (= e!193734 e!193736)))

(declare-fun res!166788 () Bool)

(assert (=> b!310293 (=> (not res!166788) (not e!193736))))

(assert (=> b!310293 (= res!166788 (and (= lt!151935 lt!151934) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7492 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310293 (= lt!151935 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(assert (= (and start!30906 res!166793) b!310291))

(assert (= (and b!310291 res!166790) b!310284))

(assert (= (and b!310284 res!166795) b!310288))

(assert (= (and b!310288 res!166797) b!310287))

(assert (= (and b!310287 res!166796) b!310292))

(assert (= (and b!310292 res!166789) b!310285))

(assert (= (and b!310285 res!166791) b!310289))

(assert (= (and b!310289 res!166792) b!310293))

(assert (= (and b!310293 res!166788) b!310286))

(assert (= (and b!310286 res!166794) b!310290))

(declare-fun m!320371 () Bool)

(assert (=> b!310292 m!320371))

(declare-fun m!320373 () Bool)

(assert (=> b!310288 m!320373))

(declare-fun m!320375 () Bool)

(assert (=> b!310290 m!320375))

(declare-fun m!320377 () Bool)

(assert (=> b!310290 m!320377))

(declare-fun m!320379 () Bool)

(assert (=> b!310290 m!320379))

(declare-fun m!320381 () Bool)

(assert (=> b!310289 m!320381))

(declare-fun m!320383 () Bool)

(assert (=> b!310293 m!320383))

(declare-fun m!320385 () Bool)

(assert (=> b!310293 m!320385))

(declare-fun m!320387 () Bool)

(assert (=> b!310285 m!320387))

(assert (=> b!310285 m!320387))

(declare-fun m!320389 () Bool)

(assert (=> b!310285 m!320389))

(declare-fun m!320391 () Bool)

(assert (=> b!310286 m!320391))

(declare-fun m!320393 () Bool)

(assert (=> b!310286 m!320393))

(declare-fun m!320395 () Bool)

(assert (=> start!30906 m!320395))

(declare-fun m!320397 () Bool)

(assert (=> start!30906 m!320397))

(declare-fun m!320399 () Bool)

(assert (=> b!310284 m!320399))

(declare-fun m!320401 () Bool)

(assert (=> b!310287 m!320401))

(check-sat (not start!30906) (not b!310290) (not b!310293) (not b!310288) (not b!310286) (not b!310285) (not b!310287) (not b!310284) (not b!310292))
(check-sat)
