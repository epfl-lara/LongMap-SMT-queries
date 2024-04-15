; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30876 () Bool)

(assert start!30876)

(declare-fun b!309628 () Bool)

(declare-fun res!166235 () Bool)

(declare-fun e!193385 () Bool)

(assert (=> b!309628 (=> (not res!166235) (not e!193385))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309628 (= res!166235 (validKeyInArray!0 k0!2441))))

(declare-fun b!309629 () Bool)

(declare-fun res!166232 () Bool)

(assert (=> b!309629 (=> (not res!166232) (not e!193385))))

(declare-datatypes ((array!15782 0))(
  ( (array!15783 (arr!7473 (Array (_ BitVec 32) (_ BitVec 64))) (size!7826 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15782)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2612 0))(
  ( (MissingZero!2612 (index!12624 (_ BitVec 32))) (Found!2612 (index!12625 (_ BitVec 32))) (Intermediate!2612 (undefined!3424 Bool) (index!12626 (_ BitVec 32)) (x!30876 (_ BitVec 32))) (Undefined!2612) (MissingVacant!2612 (index!12627 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15782 (_ BitVec 32)) SeekEntryResult!2612)

(assert (=> b!309629 (= res!166232 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2612 i!1240)))))

(declare-fun res!166234 () Bool)

(assert (=> start!30876 (=> (not res!166234) (not e!193385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30876 (= res!166234 (validMask!0 mask!3709))))

(assert (=> start!30876 e!193385))

(declare-fun array_inv!5445 (array!15782) Bool)

(assert (=> start!30876 (array_inv!5445 a!3293)))

(assert (=> start!30876 true))

(declare-fun b!309630 () Bool)

(declare-fun e!193383 () Bool)

(assert (=> b!309630 (= e!193385 e!193383)))

(declare-fun res!166231 () Bool)

(assert (=> b!309630 (=> (not res!166231) (not e!193383))))

(declare-fun lt!151524 () SeekEntryResult!2612)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15782 (_ BitVec 32)) SeekEntryResult!2612)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309630 (= res!166231 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151524))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!309630 (= lt!151524 (Intermediate!2612 false resIndex!52 resX!52))))

(declare-fun b!309631 () Bool)

(declare-fun res!166229 () Bool)

(assert (=> b!309631 (=> (not res!166229) (not e!193383))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309631 (= res!166229 (and (= (select (arr!7473 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7826 a!3293))))))

(declare-fun b!309632 () Bool)

(declare-fun res!166233 () Bool)

(assert (=> b!309632 (=> (not res!166233) (not e!193385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15782 (_ BitVec 32)) Bool)

(assert (=> b!309632 (= res!166233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309633 () Bool)

(declare-fun e!193384 () Bool)

(assert (=> b!309633 (= e!193383 e!193384)))

(declare-fun res!166230 () Bool)

(assert (=> b!309633 (=> (not res!166230) (not e!193384))))

(declare-fun lt!151526 () SeekEntryResult!2612)

(assert (=> b!309633 (= res!166230 (and (= lt!151526 lt!151524) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7473 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309633 (= lt!151526 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!309634 () Bool)

(declare-fun res!166236 () Bool)

(assert (=> b!309634 (=> (not res!166236) (not e!193385))))

(declare-fun arrayContainsKey!0 (array!15782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309634 (= res!166236 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309635 () Bool)

(declare-fun res!166228 () Bool)

(assert (=> b!309635 (=> (not res!166228) (not e!193385))))

(assert (=> b!309635 (= res!166228 (and (= (size!7826 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7826 a!3293))))))

(declare-fun lt!151525 () (_ BitVec 32))

(declare-fun b!309636 () Bool)

(assert (=> b!309636 (= e!193384 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt lt!151525 #b00000000000000000000000000000000) (bvsge lt!151525 (bvadd #b00000000000000000000000000000001 mask!3709)) (and (bvsle (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000)))))))

(assert (=> b!309636 (= lt!151526 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151525 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309636 (= lt!151525 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!30876 res!166234) b!309635))

(assert (= (and b!309635 res!166228) b!309628))

(assert (= (and b!309628 res!166235) b!309634))

(assert (= (and b!309634 res!166236) b!309629))

(assert (= (and b!309629 res!166232) b!309632))

(assert (= (and b!309632 res!166233) b!309630))

(assert (= (and b!309630 res!166231) b!309631))

(assert (= (and b!309631 res!166229) b!309633))

(assert (= (and b!309633 res!166230) b!309636))

(declare-fun m!319063 () Bool)

(assert (=> b!309630 m!319063))

(assert (=> b!309630 m!319063))

(declare-fun m!319065 () Bool)

(assert (=> b!309630 m!319065))

(declare-fun m!319067 () Bool)

(assert (=> b!309634 m!319067))

(declare-fun m!319069 () Bool)

(assert (=> start!30876 m!319069))

(declare-fun m!319071 () Bool)

(assert (=> start!30876 m!319071))

(declare-fun m!319073 () Bool)

(assert (=> b!309632 m!319073))

(declare-fun m!319075 () Bool)

(assert (=> b!309628 m!319075))

(declare-fun m!319077 () Bool)

(assert (=> b!309633 m!319077))

(declare-fun m!319079 () Bool)

(assert (=> b!309633 m!319079))

(declare-fun m!319081 () Bool)

(assert (=> b!309631 m!319081))

(declare-fun m!319083 () Bool)

(assert (=> b!309636 m!319083))

(declare-fun m!319085 () Bool)

(assert (=> b!309636 m!319085))

(declare-fun m!319087 () Bool)

(assert (=> b!309629 m!319087))

(check-sat (not b!309636) (not b!309629) (not b!309634) (not b!309630) (not start!30876) (not b!309633) (not b!309628) (not b!309632))
(check-sat)
