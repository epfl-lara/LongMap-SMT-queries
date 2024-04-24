; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30642 () Bool)

(assert start!30642)

(declare-fun res!164444 () Bool)

(declare-fun e!192551 () Bool)

(assert (=> start!30642 (=> (not res!164444) (not e!192551))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30642 (= res!164444 (validMask!0 mask!3709))))

(assert (=> start!30642 e!192551))

(declare-datatypes ((array!15659 0))(
  ( (array!15660 (arr!7414 (Array (_ BitVec 32) (_ BitVec 64))) (size!7766 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15659)

(declare-fun array_inv!5364 (array!15659) Bool)

(assert (=> start!30642 (array_inv!5364 a!3293)))

(assert (=> start!30642 true))

(declare-fun b!307636 () Bool)

(declare-fun res!164447 () Bool)

(declare-fun e!192552 () Bool)

(assert (=> b!307636 (=> (not res!164447) (not e!192552))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2519 0))(
  ( (MissingZero!2519 (index!12252 (_ BitVec 32))) (Found!2519 (index!12253 (_ BitVec 32))) (Intermediate!2519 (undefined!3331 Bool) (index!12254 (_ BitVec 32)) (x!30599 (_ BitVec 32))) (Undefined!2519) (MissingVacant!2519 (index!12255 (_ BitVec 32))) )
))
(declare-fun lt!151179 () SeekEntryResult!2519)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15659 (_ BitVec 32)) SeekEntryResult!2519)

(assert (=> b!307636 (= res!164447 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151179))))

(declare-fun b!307637 () Bool)

(declare-fun res!164446 () Bool)

(assert (=> b!307637 (=> (not res!164446) (not e!192551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307637 (= res!164446 (validKeyInArray!0 k0!2441))))

(declare-fun b!307638 () Bool)

(declare-fun res!164442 () Bool)

(assert (=> b!307638 (=> (not res!164442) (not e!192552))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!307638 (= res!164442 (and (= (select (arr!7414 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7766 a!3293))))))

(declare-fun b!307639 () Bool)

(assert (=> b!307639 (= e!192552 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7414 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000))))))

(declare-fun b!307640 () Bool)

(declare-fun res!164445 () Bool)

(assert (=> b!307640 (=> (not res!164445) (not e!192551))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15659 (_ BitVec 32)) SeekEntryResult!2519)

(assert (=> b!307640 (= res!164445 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2519 i!1240)))))

(declare-fun b!307641 () Bool)

(declare-fun res!164448 () Bool)

(assert (=> b!307641 (=> (not res!164448) (not e!192551))))

(assert (=> b!307641 (= res!164448 (and (= (size!7766 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7766 a!3293))))))

(declare-fun b!307642 () Bool)

(declare-fun res!164441 () Bool)

(assert (=> b!307642 (=> (not res!164441) (not e!192551))))

(declare-fun arrayContainsKey!0 (array!15659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307642 (= res!164441 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307643 () Bool)

(declare-fun res!164440 () Bool)

(assert (=> b!307643 (=> (not res!164440) (not e!192551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15659 (_ BitVec 32)) Bool)

(assert (=> b!307643 (= res!164440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307644 () Bool)

(assert (=> b!307644 (= e!192551 e!192552)))

(declare-fun res!164443 () Bool)

(assert (=> b!307644 (=> (not res!164443) (not e!192552))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307644 (= res!164443 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151179))))

(assert (=> b!307644 (= lt!151179 (Intermediate!2519 false resIndex!52 resX!52))))

(assert (= (and start!30642 res!164444) b!307641))

(assert (= (and b!307641 res!164448) b!307637))

(assert (= (and b!307637 res!164446) b!307642))

(assert (= (and b!307642 res!164441) b!307640))

(assert (= (and b!307640 res!164445) b!307643))

(assert (= (and b!307643 res!164440) b!307644))

(assert (= (and b!307644 res!164443) b!307638))

(assert (= (and b!307638 res!164442) b!307636))

(assert (= (and b!307636 res!164447) b!307639))

(declare-fun m!318073 () Bool)

(assert (=> b!307637 m!318073))

(declare-fun m!318075 () Bool)

(assert (=> b!307642 m!318075))

(declare-fun m!318077 () Bool)

(assert (=> b!307639 m!318077))

(declare-fun m!318079 () Bool)

(assert (=> b!307638 m!318079))

(declare-fun m!318081 () Bool)

(assert (=> start!30642 m!318081))

(declare-fun m!318083 () Bool)

(assert (=> start!30642 m!318083))

(declare-fun m!318085 () Bool)

(assert (=> b!307643 m!318085))

(declare-fun m!318087 () Bool)

(assert (=> b!307640 m!318087))

(declare-fun m!318089 () Bool)

(assert (=> b!307644 m!318089))

(assert (=> b!307644 m!318089))

(declare-fun m!318091 () Bool)

(assert (=> b!307644 m!318091))

(declare-fun m!318093 () Bool)

(assert (=> b!307636 m!318093))

(check-sat (not b!307644) (not b!307640) (not b!307643) (not b!307642) (not b!307637) (not b!307636) (not start!30642))
(check-sat)
