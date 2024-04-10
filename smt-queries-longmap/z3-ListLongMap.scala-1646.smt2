; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30658 () Bool)

(assert start!30658)

(declare-fun b!307716 () Bool)

(declare-fun res!164475 () Bool)

(declare-fun e!192595 () Bool)

(assert (=> b!307716 (=> (not res!164475) (not e!192595))))

(declare-datatypes ((array!15662 0))(
  ( (array!15663 (arr!7416 (Array (_ BitVec 32) (_ BitVec 64))) (size!7768 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15662)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15662 (_ BitVec 32)) Bool)

(assert (=> b!307716 (= res!164475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307717 () Bool)

(declare-fun res!164476 () Bool)

(assert (=> b!307717 (=> (not res!164476) (not e!192595))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2556 0))(
  ( (MissingZero!2556 (index!12400 (_ BitVec 32))) (Found!2556 (index!12401 (_ BitVec 32))) (Intermediate!2556 (undefined!3368 Bool) (index!12402 (_ BitVec 32)) (x!30639 (_ BitVec 32))) (Undefined!2556) (MissingVacant!2556 (index!12403 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15662 (_ BitVec 32)) SeekEntryResult!2556)

(assert (=> b!307717 (= res!164476 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2556 i!1240)))))

(declare-fun e!192593 () Bool)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun b!307718 () Bool)

(assert (=> b!307718 (= e!192593 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7416 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun b!307719 () Bool)

(declare-fun res!164470 () Bool)

(assert (=> b!307719 (=> (not res!164470) (not e!192595))))

(declare-fun arrayContainsKey!0 (array!15662 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307719 (= res!164470 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!164478 () Bool)

(assert (=> start!30658 (=> (not res!164478) (not e!192595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30658 (= res!164478 (validMask!0 mask!3709))))

(assert (=> start!30658 e!192595))

(declare-fun array_inv!5379 (array!15662) Bool)

(assert (=> start!30658 (array_inv!5379 a!3293)))

(assert (=> start!30658 true))

(declare-fun b!307720 () Bool)

(declare-fun res!164474 () Bool)

(assert (=> b!307720 (=> (not res!164474) (not e!192593))))

(declare-fun lt!151164 () SeekEntryResult!2556)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15662 (_ BitVec 32)) SeekEntryResult!2556)

(assert (=> b!307720 (= res!164474 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151164))))

(declare-fun b!307721 () Bool)

(assert (=> b!307721 (= e!192595 e!192593)))

(declare-fun res!164472 () Bool)

(assert (=> b!307721 (=> (not res!164472) (not e!192593))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307721 (= res!164472 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151164))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!307721 (= lt!151164 (Intermediate!2556 false resIndex!52 resX!52))))

(declare-fun b!307722 () Bool)

(declare-fun res!164471 () Bool)

(assert (=> b!307722 (=> (not res!164471) (not e!192595))))

(assert (=> b!307722 (= res!164471 (and (= (size!7768 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7768 a!3293))))))

(declare-fun b!307723 () Bool)

(declare-fun res!164477 () Bool)

(assert (=> b!307723 (=> (not res!164477) (not e!192593))))

(assert (=> b!307723 (= res!164477 (and (= (select (arr!7416 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7768 a!3293))))))

(declare-fun b!307724 () Bool)

(declare-fun res!164473 () Bool)

(assert (=> b!307724 (=> (not res!164473) (not e!192595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307724 (= res!164473 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30658 res!164478) b!307722))

(assert (= (and b!307722 res!164471) b!307724))

(assert (= (and b!307724 res!164473) b!307719))

(assert (= (and b!307719 res!164470) b!307717))

(assert (= (and b!307717 res!164476) b!307716))

(assert (= (and b!307716 res!164475) b!307721))

(assert (= (and b!307721 res!164472) b!307723))

(assert (= (and b!307723 res!164477) b!307720))

(assert (= (and b!307720 res!164474) b!307718))

(declare-fun m!317973 () Bool)

(assert (=> b!307717 m!317973))

(declare-fun m!317975 () Bool)

(assert (=> b!307721 m!317975))

(assert (=> b!307721 m!317975))

(declare-fun m!317977 () Bool)

(assert (=> b!307721 m!317977))

(declare-fun m!317979 () Bool)

(assert (=> b!307719 m!317979))

(declare-fun m!317981 () Bool)

(assert (=> b!307724 m!317981))

(declare-fun m!317983 () Bool)

(assert (=> b!307723 m!317983))

(declare-fun m!317985 () Bool)

(assert (=> start!30658 m!317985))

(declare-fun m!317987 () Bool)

(assert (=> start!30658 m!317987))

(declare-fun m!317989 () Bool)

(assert (=> b!307718 m!317989))

(declare-fun m!317991 () Bool)

(assert (=> b!307716 m!317991))

(declare-fun m!317993 () Bool)

(assert (=> b!307720 m!317993))

(check-sat (not b!307724) (not b!307720) (not b!307721) (not b!307719) (not b!307717) (not b!307716) (not start!30658))
(check-sat)
