; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30966 () Bool)

(assert start!30966)

(declare-fun res!167568 () Bool)

(declare-fun e!194045 () Bool)

(assert (=> start!30966 (=> (not res!167568) (not e!194045))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30966 (= res!167568 (validMask!0 mask!3709))))

(assert (=> start!30966 e!194045))

(declare-datatypes ((array!15872 0))(
  ( (array!15873 (arr!7518 (Array (_ BitVec 32) (_ BitVec 64))) (size!7871 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15872)

(declare-fun array_inv!5490 (array!15872) Bool)

(assert (=> start!30966 (array_inv!5490 a!3293)))

(assert (=> start!30966 true))

(declare-fun b!310962 () Bool)

(declare-fun e!194043 () Bool)

(declare-fun e!194041 () Bool)

(assert (=> b!310962 (= e!194043 e!194041)))

(declare-fun res!167567 () Bool)

(assert (=> b!310962 (=> (not res!167567) (not e!194041))))

(declare-datatypes ((SeekEntryResult!2657 0))(
  ( (MissingZero!2657 (index!12804 (_ BitVec 32))) (Found!2657 (index!12805 (_ BitVec 32))) (Intermediate!2657 (undefined!3469 Bool) (index!12806 (_ BitVec 32)) (x!31041 (_ BitVec 32))) (Undefined!2657) (MissingVacant!2657 (index!12807 (_ BitVec 32))) )
))
(declare-fun lt!152041 () SeekEntryResult!2657)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!152040 () SeekEntryResult!2657)

(assert (=> b!310962 (= res!167567 (and (= lt!152040 lt!152041) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7518 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15872 (_ BitVec 32)) SeekEntryResult!2657)

(assert (=> b!310962 (= lt!152040 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310963 () Bool)

(declare-fun res!167569 () Bool)

(assert (=> b!310963 (=> (not res!167569) (not e!194045))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!310963 (= res!167569 (and (= (size!7871 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7871 a!3293))))))

(declare-fun b!310964 () Bool)

(declare-fun res!167563 () Bool)

(assert (=> b!310964 (=> (not res!167563) (not e!194043))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!310964 (= res!167563 (and (= (select (arr!7518 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7871 a!3293))))))

(declare-fun b!310965 () Bool)

(declare-fun res!167570 () Bool)

(assert (=> b!310965 (=> (not res!167570) (not e!194045))))

(declare-fun arrayContainsKey!0 (array!15872 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310965 (= res!167570 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310966 () Bool)

(declare-fun res!167562 () Bool)

(assert (=> b!310966 (=> (not res!167562) (not e!194045))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310966 (= res!167562 (validKeyInArray!0 k0!2441))))

(declare-fun b!310967 () Bool)

(assert (=> b!310967 (= e!194041 (not true))))

(declare-fun e!194044 () Bool)

(assert (=> b!310967 e!194044))

(declare-fun res!167565 () Bool)

(assert (=> b!310967 (=> (not res!167565) (not e!194044))))

(declare-fun lt!152042 () (_ BitVec 32))

(assert (=> b!310967 (= res!167565 (= lt!152040 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152042 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310967 (= lt!152042 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!310968 () Bool)

(declare-fun res!167564 () Bool)

(assert (=> b!310968 (=> (not res!167564) (not e!194045))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15872 (_ BitVec 32)) SeekEntryResult!2657)

(assert (=> b!310968 (= res!167564 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2657 i!1240)))))

(declare-fun b!310969 () Bool)

(assert (=> b!310969 (= e!194045 e!194043)))

(declare-fun res!167566 () Bool)

(assert (=> b!310969 (=> (not res!167566) (not e!194043))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310969 (= res!167566 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152041))))

(assert (=> b!310969 (= lt!152041 (Intermediate!2657 false resIndex!52 resX!52))))

(declare-fun b!310970 () Bool)

(declare-fun res!167571 () Bool)

(assert (=> b!310970 (=> (not res!167571) (not e!194045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15872 (_ BitVec 32)) Bool)

(assert (=> b!310970 (= res!167571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun lt!152039 () array!15872)

(declare-fun b!310971 () Bool)

(assert (=> b!310971 (= e!194044 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152039 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152042 k0!2441 lt!152039 mask!3709)))))

(assert (=> b!310971 (= lt!152039 (array!15873 (store (arr!7518 a!3293) i!1240 k0!2441) (size!7871 a!3293)))))

(assert (= (and start!30966 res!167568) b!310963))

(assert (= (and b!310963 res!167569) b!310966))

(assert (= (and b!310966 res!167562) b!310965))

(assert (= (and b!310965 res!167570) b!310968))

(assert (= (and b!310968 res!167564) b!310970))

(assert (= (and b!310970 res!167571) b!310969))

(assert (= (and b!310969 res!167566) b!310964))

(assert (= (and b!310964 res!167563) b!310962))

(assert (= (and b!310962 res!167567) b!310967))

(assert (= (and b!310967 res!167565) b!310971))

(declare-fun m!320467 () Bool)

(assert (=> b!310965 m!320467))

(declare-fun m!320469 () Bool)

(assert (=> b!310966 m!320469))

(declare-fun m!320471 () Bool)

(assert (=> b!310964 m!320471))

(declare-fun m!320473 () Bool)

(assert (=> b!310969 m!320473))

(assert (=> b!310969 m!320473))

(declare-fun m!320475 () Bool)

(assert (=> b!310969 m!320475))

(declare-fun m!320477 () Bool)

(assert (=> b!310971 m!320477))

(declare-fun m!320479 () Bool)

(assert (=> b!310971 m!320479))

(declare-fun m!320481 () Bool)

(assert (=> b!310971 m!320481))

(declare-fun m!320483 () Bool)

(assert (=> start!30966 m!320483))

(declare-fun m!320485 () Bool)

(assert (=> start!30966 m!320485))

(declare-fun m!320487 () Bool)

(assert (=> b!310970 m!320487))

(declare-fun m!320489 () Bool)

(assert (=> b!310962 m!320489))

(declare-fun m!320491 () Bool)

(assert (=> b!310962 m!320491))

(declare-fun m!320493 () Bool)

(assert (=> b!310968 m!320493))

(declare-fun m!320495 () Bool)

(assert (=> b!310967 m!320495))

(declare-fun m!320497 () Bool)

(assert (=> b!310967 m!320497))

(check-sat (not b!310962) (not b!310967) (not b!310966) (not b!310970) (not b!310968) (not start!30966) (not b!310971) (not b!310965) (not b!310969))
(check-sat)
