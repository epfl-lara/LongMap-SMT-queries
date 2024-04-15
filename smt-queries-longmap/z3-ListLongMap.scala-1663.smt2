; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30798 () Bool)

(assert start!30798)

(declare-fun b!309061 () Bool)

(declare-fun e!193093 () Bool)

(assert (=> b!309061 (= e!193093 (not true))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2600 0))(
  ( (MissingZero!2600 (index!12576 (_ BitVec 32))) (Found!2600 (index!12577 (_ BitVec 32))) (Intermediate!2600 (undefined!3412 Bool) (index!12578 (_ BitVec 32)) (x!30823 (_ BitVec 32))) (Undefined!2600) (MissingVacant!2600 (index!12579 (_ BitVec 32))) )
))
(declare-fun lt!151331 () SeekEntryResult!2600)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((array!15755 0))(
  ( (array!15756 (arr!7461 (Array (_ BitVec 32) (_ BitVec 64))) (size!7814 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15755)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15755 (_ BitVec 32)) SeekEntryResult!2600)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309061 (= lt!151331 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!309062 () Bool)

(declare-fun res!165827 () Bool)

(declare-fun e!193094 () Bool)

(assert (=> b!309062 (=> (not res!165827) (not e!193094))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!309062 (= res!165827 (and (= (size!7814 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7814 a!3293))))))

(declare-fun b!309063 () Bool)

(declare-fun res!165826 () Bool)

(assert (=> b!309063 (=> (not res!165826) (not e!193094))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309063 (= res!165826 (validKeyInArray!0 k0!2441))))

(declare-fun b!309064 () Bool)

(declare-fun e!193091 () Bool)

(assert (=> b!309064 (= e!193091 e!193093)))

(declare-fun res!165825 () Bool)

(assert (=> b!309064 (=> (not res!165825) (not e!193093))))

(declare-fun lt!151330 () SeekEntryResult!2600)

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!309064 (= res!165825 (and (= lt!151331 lt!151330) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7461 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309064 (= lt!151331 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun res!165823 () Bool)

(assert (=> start!30798 (=> (not res!165823) (not e!193094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30798 (= res!165823 (validMask!0 mask!3709))))

(assert (=> start!30798 e!193094))

(declare-fun array_inv!5433 (array!15755) Bool)

(assert (=> start!30798 (array_inv!5433 a!3293)))

(assert (=> start!30798 true))

(declare-fun b!309065 () Bool)

(declare-fun res!165820 () Bool)

(assert (=> b!309065 (=> (not res!165820) (not e!193094))))

(declare-fun arrayContainsKey!0 (array!15755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309065 (= res!165820 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309066 () Bool)

(declare-fun res!165824 () Bool)

(assert (=> b!309066 (=> (not res!165824) (not e!193091))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!309066 (= res!165824 (and (= (select (arr!7461 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7814 a!3293))))))

(declare-fun b!309067 () Bool)

(declare-fun res!165822 () Bool)

(assert (=> b!309067 (=> (not res!165822) (not e!193094))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15755 (_ BitVec 32)) SeekEntryResult!2600)

(assert (=> b!309067 (= res!165822 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2600 i!1240)))))

(declare-fun b!309068 () Bool)

(declare-fun res!165821 () Bool)

(assert (=> b!309068 (=> (not res!165821) (not e!193094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15755 (_ BitVec 32)) Bool)

(assert (=> b!309068 (= res!165821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309069 () Bool)

(assert (=> b!309069 (= e!193094 e!193091)))

(declare-fun res!165828 () Bool)

(assert (=> b!309069 (=> (not res!165828) (not e!193091))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309069 (= res!165828 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151330))))

(assert (=> b!309069 (= lt!151330 (Intermediate!2600 false resIndex!52 resX!52))))

(assert (= (and start!30798 res!165823) b!309062))

(assert (= (and b!309062 res!165827) b!309063))

(assert (= (and b!309063 res!165826) b!309065))

(assert (= (and b!309065 res!165820) b!309067))

(assert (= (and b!309067 res!165822) b!309068))

(assert (= (and b!309068 res!165821) b!309069))

(assert (= (and b!309069 res!165828) b!309066))

(assert (= (and b!309066 res!165824) b!309064))

(assert (= (and b!309064 res!165825) b!309061))

(declare-fun m!318613 () Bool)

(assert (=> b!309069 m!318613))

(assert (=> b!309069 m!318613))

(declare-fun m!318615 () Bool)

(assert (=> b!309069 m!318615))

(declare-fun m!318617 () Bool)

(assert (=> b!309061 m!318617))

(assert (=> b!309061 m!318617))

(declare-fun m!318619 () Bool)

(assert (=> b!309061 m!318619))

(declare-fun m!318621 () Bool)

(assert (=> b!309063 m!318621))

(declare-fun m!318623 () Bool)

(assert (=> b!309067 m!318623))

(declare-fun m!318625 () Bool)

(assert (=> b!309068 m!318625))

(declare-fun m!318627 () Bool)

(assert (=> b!309065 m!318627))

(declare-fun m!318629 () Bool)

(assert (=> start!30798 m!318629))

(declare-fun m!318631 () Bool)

(assert (=> start!30798 m!318631))

(declare-fun m!318633 () Bool)

(assert (=> b!309064 m!318633))

(declare-fun m!318635 () Bool)

(assert (=> b!309064 m!318635))

(declare-fun m!318637 () Bool)

(assert (=> b!309066 m!318637))

(check-sat (not b!309064) (not b!309065) (not b!309067) (not b!309063) (not b!309069) (not b!309068) (not start!30798) (not b!309061))
(check-sat)
