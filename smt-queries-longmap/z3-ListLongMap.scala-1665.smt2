; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30826 () Bool)

(assert start!30826)

(declare-fun b!309525 () Bool)

(declare-fun res!166139 () Bool)

(declare-fun e!193354 () Bool)

(assert (=> b!309525 (=> (not res!166139) (not e!193354))))

(declare-datatypes ((array!15779 0))(
  ( (array!15780 (arr!7473 (Array (_ BitVec 32) (_ BitVec 64))) (size!7825 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15779)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2613 0))(
  ( (MissingZero!2613 (index!12628 (_ BitVec 32))) (Found!2613 (index!12629 (_ BitVec 32))) (Intermediate!2613 (undefined!3425 Bool) (index!12630 (_ BitVec 32)) (x!30857 (_ BitVec 32))) (Undefined!2613) (MissingVacant!2613 (index!12631 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15779 (_ BitVec 32)) SeekEntryResult!2613)

(assert (=> b!309525 (= res!166139 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2613 i!1240)))))

(declare-fun b!309526 () Bool)

(declare-fun e!193351 () Bool)

(assert (=> b!309526 (= e!193354 e!193351)))

(declare-fun res!166143 () Bool)

(assert (=> b!309526 (=> (not res!166143) (not e!193351))))

(declare-fun lt!151607 () SeekEntryResult!2613)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15779 (_ BitVec 32)) SeekEntryResult!2613)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309526 (= res!166143 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151607))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!309526 (= lt!151607 (Intermediate!2613 false resIndex!52 resX!52))))

(declare-fun b!309527 () Bool)

(declare-fun res!166138 () Bool)

(assert (=> b!309527 (=> (not res!166138) (not e!193351))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!309527 (= res!166138 (and (= (select (arr!7473 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7825 a!3293))))))

(declare-fun res!166146 () Bool)

(assert (=> start!30826 (=> (not res!166146) (not e!193354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30826 (= res!166146 (validMask!0 mask!3709))))

(assert (=> start!30826 e!193354))

(declare-fun array_inv!5436 (array!15779) Bool)

(assert (=> start!30826 (array_inv!5436 a!3293)))

(assert (=> start!30826 true))

(declare-fun b!309528 () Bool)

(declare-fun res!166144 () Bool)

(assert (=> b!309528 (=> (not res!166144) (not e!193354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15779 (_ BitVec 32)) Bool)

(assert (=> b!309528 (= res!166144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!309529 () Bool)

(declare-fun res!166141 () Bool)

(assert (=> b!309529 (=> (not res!166141) (not e!193354))))

(declare-fun arrayContainsKey!0 (array!15779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!309529 (= res!166141 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!309530 () Bool)

(declare-fun e!193353 () Bool)

(assert (=> b!309530 (= e!193351 e!193353)))

(declare-fun res!166140 () Bool)

(assert (=> b!309530 (=> (not res!166140) (not e!193353))))

(declare-fun lt!151608 () SeekEntryResult!2613)

(assert (=> b!309530 (= res!166140 (and (= lt!151608 lt!151607) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7473 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!309530 (= lt!151608 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!309531 () Bool)

(declare-fun res!166142 () Bool)

(assert (=> b!309531 (=> (not res!166142) (not e!193354))))

(assert (=> b!309531 (= res!166142 (and (= (size!7825 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7825 a!3293))))))

(declare-fun b!309532 () Bool)

(declare-fun res!166145 () Bool)

(assert (=> b!309532 (=> (not res!166145) (not e!193354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!309532 (= res!166145 (validKeyInArray!0 k0!2441))))

(declare-fun b!309533 () Bool)

(assert (=> b!309533 (= e!193353 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!309533 (= lt!151608 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (= (and start!30826 res!166146) b!309531))

(assert (= (and b!309531 res!166142) b!309532))

(assert (= (and b!309532 res!166145) b!309529))

(assert (= (and b!309529 res!166141) b!309525))

(assert (= (and b!309525 res!166139) b!309528))

(assert (= (and b!309528 res!166144) b!309526))

(assert (= (and b!309526 res!166143) b!309527))

(assert (= (and b!309527 res!166138) b!309530))

(assert (= (and b!309530 res!166140) b!309533))

(declare-fun m!319525 () Bool)

(assert (=> b!309528 m!319525))

(declare-fun m!319527 () Bool)

(assert (=> b!309525 m!319527))

(declare-fun m!319529 () Bool)

(assert (=> b!309530 m!319529))

(declare-fun m!319531 () Bool)

(assert (=> b!309530 m!319531))

(declare-fun m!319533 () Bool)

(assert (=> b!309526 m!319533))

(assert (=> b!309526 m!319533))

(declare-fun m!319535 () Bool)

(assert (=> b!309526 m!319535))

(declare-fun m!319537 () Bool)

(assert (=> b!309532 m!319537))

(declare-fun m!319539 () Bool)

(assert (=> start!30826 m!319539))

(declare-fun m!319541 () Bool)

(assert (=> start!30826 m!319541))

(declare-fun m!319543 () Bool)

(assert (=> b!309533 m!319543))

(assert (=> b!309533 m!319543))

(declare-fun m!319545 () Bool)

(assert (=> b!309533 m!319545))

(declare-fun m!319547 () Bool)

(assert (=> b!309527 m!319547))

(declare-fun m!319549 () Bool)

(assert (=> b!309529 m!319549))

(check-sat (not b!309526) (not start!30826) (not b!309529) (not b!309532) (not b!309525) (not b!309533) (not b!309528) (not b!309530))
(check-sat)
