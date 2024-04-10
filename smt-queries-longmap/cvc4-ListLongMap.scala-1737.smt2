; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31932 () Bool)

(assert start!31932)

(declare-fun b!319109 () Bool)

(declare-fun res!173501 () Bool)

(declare-fun e!198230 () Bool)

(assert (=> b!319109 (=> (not res!173501) (not e!198230))))

(declare-datatypes ((array!16252 0))(
  ( (array!16253 (arr!7690 (Array (_ BitVec 32) (_ BitVec 64))) (size!8042 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16252)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!319109 (= res!173501 (and (= (size!8042 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8042 a!3293))))))

(declare-fun b!319110 () Bool)

(declare-fun res!173498 () Bool)

(assert (=> b!319110 (=> (not res!173498) (not e!198230))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16252 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319110 (= res!173498 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun lt!155639 () array!16252)

(declare-fun e!198229 () Bool)

(declare-fun b!319112 () Bool)

(declare-fun lt!155642 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2830 0))(
  ( (MissingZero!2830 (index!13496 (_ BitVec 32))) (Found!2830 (index!13497 (_ BitVec 32))) (Intermediate!2830 (undefined!3642 Bool) (index!13498 (_ BitVec 32)) (x!31752 (_ BitVec 32))) (Undefined!2830) (MissingVacant!2830 (index!13499 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16252 (_ BitVec 32)) SeekEntryResult!2830)

(assert (=> b!319112 (= e!198229 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155639 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155642 k!2441 lt!155639 mask!3709)))))

(assert (=> b!319112 (= lt!155639 (array!16253 (store (arr!7690 a!3293) i!1240 k!2441) (size!8042 a!3293)))))

(declare-fun b!319113 () Bool)

(declare-fun e!198228 () Bool)

(declare-fun e!198231 () Bool)

(assert (=> b!319113 (= e!198228 e!198231)))

(declare-fun res!173500 () Bool)

(assert (=> b!319113 (=> (not res!173500) (not e!198231))))

(declare-fun lt!155643 () SeekEntryResult!2830)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!155641 () SeekEntryResult!2830)

(assert (=> b!319113 (= res!173500 (and (= lt!155643 lt!155641) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7690 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!319113 (= lt!155643 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!319114 () Bool)

(declare-fun res!173496 () Bool)

(assert (=> b!319114 (=> (not res!173496) (not e!198230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319114 (= res!173496 (validKeyInArray!0 k!2441))))

(declare-fun b!319115 () Bool)

(declare-fun res!173495 () Bool)

(assert (=> b!319115 (=> (not res!173495) (not e!198230))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16252 (_ BitVec 32)) SeekEntryResult!2830)

(assert (=> b!319115 (= res!173495 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2830 i!1240)))))

(declare-fun b!319116 () Bool)

(declare-fun lt!155640 () SeekEntryResult!2830)

(assert (=> b!319116 (= e!198231 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!155642 #b00000000000000000000000000000000) (bvsge lt!155642 (size!8042 a!3293)) (not (= lt!155640 lt!155641)) (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1427)) (bvsub #b01111111111111111111111111111110 x!1427)))))))

(assert (=> b!319116 e!198229))

(declare-fun res!173502 () Bool)

(assert (=> b!319116 (=> (not res!173502) (not e!198229))))

(assert (=> b!319116 (= res!173502 (= lt!155643 lt!155640))))

(assert (=> b!319116 (= lt!155640 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155642 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319116 (= lt!155642 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!319111 () Bool)

(declare-fun res!173493 () Bool)

(assert (=> b!319111 (=> (not res!173493) (not e!198230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16252 (_ BitVec 32)) Bool)

(assert (=> b!319111 (= res!173493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!173497 () Bool)

(assert (=> start!31932 (=> (not res!173497) (not e!198230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31932 (= res!173497 (validMask!0 mask!3709))))

(assert (=> start!31932 e!198230))

(declare-fun array_inv!5653 (array!16252) Bool)

(assert (=> start!31932 (array_inv!5653 a!3293)))

(assert (=> start!31932 true))

(declare-fun b!319117 () Bool)

(assert (=> b!319117 (= e!198230 e!198228)))

(declare-fun res!173494 () Bool)

(assert (=> b!319117 (=> (not res!173494) (not e!198228))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319117 (= res!173494 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155641))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!319117 (= lt!155641 (Intermediate!2830 false resIndex!52 resX!52))))

(declare-fun b!319118 () Bool)

(declare-fun res!173499 () Bool)

(assert (=> b!319118 (=> (not res!173499) (not e!198228))))

(assert (=> b!319118 (= res!173499 (and (= (select (arr!7690 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8042 a!3293))))))

(assert (= (and start!31932 res!173497) b!319109))

(assert (= (and b!319109 res!173501) b!319114))

(assert (= (and b!319114 res!173496) b!319110))

(assert (= (and b!319110 res!173498) b!319115))

(assert (= (and b!319115 res!173495) b!319111))

(assert (= (and b!319111 res!173493) b!319117))

(assert (= (and b!319117 res!173494) b!319118))

(assert (= (and b!319118 res!173499) b!319113))

(assert (= (and b!319113 res!173500) b!319116))

(assert (= (and b!319116 res!173502) b!319112))

(declare-fun m!327711 () Bool)

(assert (=> b!319114 m!327711))

(declare-fun m!327713 () Bool)

(assert (=> b!319113 m!327713))

(declare-fun m!327715 () Bool)

(assert (=> b!319113 m!327715))

(declare-fun m!327717 () Bool)

(assert (=> b!319115 m!327717))

(declare-fun m!327719 () Bool)

(assert (=> b!319117 m!327719))

(assert (=> b!319117 m!327719))

(declare-fun m!327721 () Bool)

(assert (=> b!319117 m!327721))

(declare-fun m!327723 () Bool)

(assert (=> b!319111 m!327723))

(declare-fun m!327725 () Bool)

(assert (=> b!319118 m!327725))

(declare-fun m!327727 () Bool)

(assert (=> b!319112 m!327727))

(declare-fun m!327729 () Bool)

(assert (=> b!319112 m!327729))

(declare-fun m!327731 () Bool)

(assert (=> b!319112 m!327731))

(declare-fun m!327733 () Bool)

(assert (=> b!319116 m!327733))

(declare-fun m!327735 () Bool)

(assert (=> b!319116 m!327735))

(declare-fun m!327737 () Bool)

(assert (=> b!319110 m!327737))

(declare-fun m!327739 () Bool)

(assert (=> start!31932 m!327739))

(declare-fun m!327741 () Bool)

(assert (=> start!31932 m!327741))

(push 1)

(assert (not b!319115))

(assert (not b!319117))

(assert (not b!319116))

(assert (not b!319114))

(assert (not b!319110))

(assert (not b!319113))

(assert (not b!319112))

(assert (not start!31932))

(assert (not b!319111))

(check-sat)

(pop 1)

(push 1)

(check-sat)

