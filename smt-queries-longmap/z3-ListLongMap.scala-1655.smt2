; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30766 () Bool)

(assert start!30766)

(declare-fun b!308715 () Bool)

(declare-fun e!192992 () Bool)

(assert (=> b!308715 (= e!192992 (not true))))

(declare-datatypes ((array!15719 0))(
  ( (array!15720 (arr!7443 (Array (_ BitVec 32) (_ BitVec 64))) (size!7795 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15719)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2583 0))(
  ( (MissingZero!2583 (index!12508 (_ BitVec 32))) (Found!2583 (index!12509 (_ BitVec 32))) (Intermediate!2583 (undefined!3395 Bool) (index!12510 (_ BitVec 32)) (x!30747 (_ BitVec 32))) (Undefined!2583) (MissingVacant!2583 (index!12511 (_ BitVec 32))) )
))
(declare-fun lt!151427 () SeekEntryResult!2583)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15719 (_ BitVec 32)) SeekEntryResult!2583)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308715 (= lt!151427 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!308716 () Bool)

(declare-fun res!165330 () Bool)

(declare-fun e!192993 () Bool)

(assert (=> b!308716 (=> (not res!165330) (not e!192993))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15719 (_ BitVec 32)) Bool)

(assert (=> b!308716 (= res!165330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!308717 () Bool)

(declare-fun res!165336 () Bool)

(declare-fun e!192991 () Bool)

(assert (=> b!308717 (=> (not res!165336) (not e!192991))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!308717 (= res!165336 (and (= (select (arr!7443 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7795 a!3293))))))

(declare-fun b!308718 () Bool)

(declare-fun res!165329 () Bool)

(assert (=> b!308718 (=> (not res!165329) (not e!192993))))

(assert (=> b!308718 (= res!165329 (and (= (size!7795 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7795 a!3293))))))

(declare-fun res!165333 () Bool)

(assert (=> start!30766 (=> (not res!165333) (not e!192993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30766 (= res!165333 (validMask!0 mask!3709))))

(assert (=> start!30766 e!192993))

(declare-fun array_inv!5406 (array!15719) Bool)

(assert (=> start!30766 (array_inv!5406 a!3293)))

(assert (=> start!30766 true))

(declare-fun b!308719 () Bool)

(declare-fun res!165328 () Bool)

(assert (=> b!308719 (=> (not res!165328) (not e!192993))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15719 (_ BitVec 32)) SeekEntryResult!2583)

(assert (=> b!308719 (= res!165328 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2583 i!1240)))))

(declare-fun b!308720 () Bool)

(assert (=> b!308720 (= e!192993 e!192991)))

(declare-fun res!165331 () Bool)

(assert (=> b!308720 (=> (not res!165331) (not e!192991))))

(declare-fun lt!151428 () SeekEntryResult!2583)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!308720 (= res!165331 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151428))))

(assert (=> b!308720 (= lt!151428 (Intermediate!2583 false resIndex!52 resX!52))))

(declare-fun b!308721 () Bool)

(assert (=> b!308721 (= e!192991 e!192992)))

(declare-fun res!165332 () Bool)

(assert (=> b!308721 (=> (not res!165332) (not e!192992))))

(assert (=> b!308721 (= res!165332 (and (= lt!151427 lt!151428) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7443 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!308721 (= lt!151427 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!308722 () Bool)

(declare-fun res!165334 () Bool)

(assert (=> b!308722 (=> (not res!165334) (not e!192993))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!308722 (= res!165334 (validKeyInArray!0 k0!2441))))

(declare-fun b!308723 () Bool)

(declare-fun res!165335 () Bool)

(assert (=> b!308723 (=> (not res!165335) (not e!192993))))

(declare-fun arrayContainsKey!0 (array!15719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!308723 (= res!165335 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30766 res!165333) b!308718))

(assert (= (and b!308718 res!165329) b!308722))

(assert (= (and b!308722 res!165334) b!308723))

(assert (= (and b!308723 res!165335) b!308719))

(assert (= (and b!308719 res!165328) b!308716))

(assert (= (and b!308716 res!165330) b!308720))

(assert (= (and b!308720 res!165331) b!308717))

(assert (= (and b!308717 res!165336) b!308721))

(assert (= (and b!308721 res!165332) b!308715))

(declare-fun m!318745 () Bool)

(assert (=> start!30766 m!318745))

(declare-fun m!318747 () Bool)

(assert (=> start!30766 m!318747))

(declare-fun m!318749 () Bool)

(assert (=> b!308717 m!318749))

(declare-fun m!318751 () Bool)

(assert (=> b!308720 m!318751))

(assert (=> b!308720 m!318751))

(declare-fun m!318753 () Bool)

(assert (=> b!308720 m!318753))

(declare-fun m!318755 () Bool)

(assert (=> b!308715 m!318755))

(assert (=> b!308715 m!318755))

(declare-fun m!318757 () Bool)

(assert (=> b!308715 m!318757))

(declare-fun m!318759 () Bool)

(assert (=> b!308719 m!318759))

(declare-fun m!318761 () Bool)

(assert (=> b!308723 m!318761))

(declare-fun m!318763 () Bool)

(assert (=> b!308716 m!318763))

(declare-fun m!318765 () Bool)

(assert (=> b!308722 m!318765))

(declare-fun m!318767 () Bool)

(assert (=> b!308721 m!318767))

(declare-fun m!318769 () Bool)

(assert (=> b!308721 m!318769))

(check-sat (not b!308720) (not b!308715) (not start!30766) (not b!308716) (not b!308721) (not b!308719) (not b!308723) (not b!308722))
(check-sat)
