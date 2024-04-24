; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30732 () Bool)

(assert start!30732)

(declare-fun b!308385 () Bool)

(declare-fun res!165055 () Bool)

(declare-fun e!192845 () Bool)

(assert (=> b!308385 (=> (not res!165055) (not e!192845))))

(declare-datatypes ((array!15698 0))(
  ( (array!15699 (arr!7432 (Array (_ BitVec 32) (_ BitVec 64))) (size!7784 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15698)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2537 0))(
  ( (MissingZero!2537 (index!12324 (_ BitVec 32))) (Found!2537 (index!12325 (_ BitVec 32))) (Intermediate!2537 (undefined!3349 Bool) (index!12326 (_ BitVec 32)) (x!30674 (_ BitVec 32))) (Undefined!2537) (MissingVacant!2537 (index!12327 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15698 (_ BitVec 32)) SeekEntryResult!2537)

(assert (=> b!308385 (= res!165055 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2537 i!1240)))))

(declare-fun b!308386 () Bool)

(declare-fun e!192846 () Bool)

(assert (=> b!308386 (= e!192846 false)))

(declare-fun lt!151385 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308386 (= lt!151385 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!308387 () Bool)

(declare-fun res!165054 () Bool)

(assert (=> b!308387 (=> (not res!165054) (not e!192846))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!308387 (= res!165054 (and (= (select (arr!7432 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7784 a!3293))))))

(declare-fun b!308388 () Bool)

(declare-fun res!165056 () Bool)

(assert (=> b!308388 (=> (not res!165056) (not e!192846))))

(assert (=> b!308388 (= res!165056 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7432 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun b!308389 () Bool)

(declare-fun res!165053 () Bool)

(assert (=> b!308389 (=> (not res!165053) (not e!192845))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15698 (_ BitVec 32)) Bool)

(assert (=> b!308389 (= res!165053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308390 () Bool)

(assert (=> b!308390 (= e!192845 e!192846)))

(declare-fun res!165057 () Bool)

(assert (=> b!308390 (=> (not res!165057) (not e!192846))))

(declare-fun lt!151386 () SeekEntryResult!2537)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15698 (_ BitVec 32)) SeekEntryResult!2537)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308390 (= res!165057 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151386))))

(assert (=> b!308390 (= lt!151386 (Intermediate!2537 false resIndex!52 resX!52))))

(declare-fun b!308391 () Bool)

(declare-fun res!165048 () Bool)

(assert (=> b!308391 (=> (not res!165048) (not e!192845))))

(assert (=> b!308391 (= res!165048 (and (= (size!7784 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7784 a!3293))))))

(declare-fun b!308393 () Bool)

(declare-fun res!165049 () Bool)

(assert (=> b!308393 (=> (not res!165049) (not e!192845))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308393 (= res!165049 (validKeyInArray!0 k0!2441))))

(declare-fun b!308394 () Bool)

(declare-fun res!165052 () Bool)

(assert (=> b!308394 (=> (not res!165052) (not e!192846))))

(assert (=> b!308394 (= res!165052 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151386))))

(declare-fun b!308392 () Bool)

(declare-fun res!165050 () Bool)

(assert (=> b!308392 (=> (not res!165050) (not e!192845))))

(declare-fun arrayContainsKey!0 (array!15698 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308392 (= res!165050 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!165051 () Bool)

(assert (=> start!30732 (=> (not res!165051) (not e!192845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30732 (= res!165051 (validMask!0 mask!3709))))

(assert (=> start!30732 e!192845))

(declare-fun array_inv!5382 (array!15698) Bool)

(assert (=> start!30732 (array_inv!5382 a!3293)))

(assert (=> start!30732 true))

(assert (= (and start!30732 res!165051) b!308391))

(assert (= (and b!308391 res!165048) b!308393))

(assert (= (and b!308393 res!165049) b!308392))

(assert (= (and b!308392 res!165050) b!308385))

(assert (= (and b!308385 res!165055) b!308389))

(assert (= (and b!308389 res!165053) b!308390))

(assert (= (and b!308390 res!165057) b!308387))

(assert (= (and b!308387 res!165054) b!308394))

(assert (= (and b!308394 res!165052) b!308388))

(assert (= (and b!308388 res!165056) b!308386))

(declare-fun m!318619 () Bool)

(assert (=> b!308389 m!318619))

(declare-fun m!318621 () Bool)

(assert (=> b!308392 m!318621))

(declare-fun m!318623 () Bool)

(assert (=> b!308388 m!318623))

(declare-fun m!318625 () Bool)

(assert (=> b!308393 m!318625))

(declare-fun m!318627 () Bool)

(assert (=> b!308385 m!318627))

(declare-fun m!318629 () Bool)

(assert (=> b!308386 m!318629))

(declare-fun m!318631 () Bool)

(assert (=> b!308390 m!318631))

(assert (=> b!308390 m!318631))

(declare-fun m!318633 () Bool)

(assert (=> b!308390 m!318633))

(declare-fun m!318635 () Bool)

(assert (=> b!308387 m!318635))

(declare-fun m!318637 () Bool)

(assert (=> start!30732 m!318637))

(declare-fun m!318639 () Bool)

(assert (=> start!30732 m!318639))

(declare-fun m!318641 () Bool)

(assert (=> b!308394 m!318641))

(check-sat (not b!308386) (not b!308390) (not b!308385) (not b!308393) (not start!30732) (not b!308389) (not b!308394) (not b!308392))
(check-sat)
