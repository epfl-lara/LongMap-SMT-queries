; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30984 () Bool)

(assert start!30984)

(declare-fun res!167837 () Bool)

(declare-fun e!194178 () Bool)

(assert (=> start!30984 (=> (not res!167837) (not e!194178))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30984 (= res!167837 (validMask!0 mask!3709))))

(assert (=> start!30984 e!194178))

(declare-datatypes ((array!15890 0))(
  ( (array!15891 (arr!7527 (Array (_ BitVec 32) (_ BitVec 64))) (size!7880 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15890)

(declare-fun array_inv!5499 (array!15890) Bool)

(assert (=> start!30984 (array_inv!5499 a!3293)))

(assert (=> start!30984 true))

(declare-fun b!311232 () Bool)

(declare-fun e!194179 () Bool)

(declare-fun lt!152150 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun lt!152149 () array!15890)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2666 0))(
  ( (MissingZero!2666 (index!12840 (_ BitVec 32))) (Found!2666 (index!12841 (_ BitVec 32))) (Intermediate!2666 (undefined!3478 Bool) (index!12842 (_ BitVec 32)) (x!31074 (_ BitVec 32))) (Undefined!2666) (MissingVacant!2666 (index!12843 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15890 (_ BitVec 32)) SeekEntryResult!2666)

(assert (=> b!311232 (= e!194179 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152149 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152150 k0!2441 lt!152149 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311232 (= lt!152149 (array!15891 (store (arr!7527 a!3293) i!1240 k0!2441) (size!7880 a!3293)))))

(declare-fun b!311233 () Bool)

(declare-fun res!167840 () Bool)

(declare-fun e!194177 () Bool)

(assert (=> b!311233 (=> (not res!167840) (not e!194177))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311233 (= res!167840 (and (= (select (arr!7527 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7880 a!3293))))))

(declare-fun b!311234 () Bool)

(assert (=> b!311234 (= e!194178 e!194177)))

(declare-fun res!167833 () Bool)

(assert (=> b!311234 (=> (not res!167833) (not e!194177))))

(declare-fun lt!152147 () SeekEntryResult!2666)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311234 (= res!167833 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152147))))

(assert (=> b!311234 (= lt!152147 (Intermediate!2666 false resIndex!52 resX!52))))

(declare-fun b!311235 () Bool)

(declare-fun res!167838 () Bool)

(assert (=> b!311235 (=> (not res!167838) (not e!194178))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15890 (_ BitVec 32)) SeekEntryResult!2666)

(assert (=> b!311235 (= res!167838 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2666 i!1240)))))

(declare-fun b!311236 () Bool)

(declare-fun res!167836 () Bool)

(assert (=> b!311236 (=> (not res!167836) (not e!194178))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15890 (_ BitVec 32)) Bool)

(assert (=> b!311236 (= res!167836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311237 () Bool)

(declare-fun e!194176 () Bool)

(assert (=> b!311237 (= e!194177 e!194176)))

(declare-fun res!167835 () Bool)

(assert (=> b!311237 (=> (not res!167835) (not e!194176))))

(declare-fun lt!152148 () SeekEntryResult!2666)

(assert (=> b!311237 (= res!167835 (and (= lt!152148 lt!152147) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7527 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311237 (= lt!152148 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311238 () Bool)

(declare-fun res!167839 () Bool)

(assert (=> b!311238 (=> (not res!167839) (not e!194178))))

(declare-fun arrayContainsKey!0 (array!15890 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311238 (= res!167839 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311239 () Bool)

(assert (=> b!311239 (= e!194176 (not true))))

(assert (=> b!311239 e!194179))

(declare-fun res!167832 () Bool)

(assert (=> b!311239 (=> (not res!167832) (not e!194179))))

(assert (=> b!311239 (= res!167832 (= lt!152148 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152150 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311239 (= lt!152150 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311240 () Bool)

(declare-fun res!167841 () Bool)

(assert (=> b!311240 (=> (not res!167841) (not e!194178))))

(assert (=> b!311240 (= res!167841 (and (= (size!7880 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7880 a!3293))))))

(declare-fun b!311241 () Bool)

(declare-fun res!167834 () Bool)

(assert (=> b!311241 (=> (not res!167834) (not e!194178))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311241 (= res!167834 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30984 res!167837) b!311240))

(assert (= (and b!311240 res!167841) b!311241))

(assert (= (and b!311241 res!167834) b!311238))

(assert (= (and b!311238 res!167839) b!311235))

(assert (= (and b!311235 res!167838) b!311236))

(assert (= (and b!311236 res!167836) b!311234))

(assert (= (and b!311234 res!167833) b!311233))

(assert (= (and b!311233 res!167840) b!311237))

(assert (= (and b!311237 res!167835) b!311239))

(assert (= (and b!311239 res!167832) b!311232))

(declare-fun m!320755 () Bool)

(assert (=> b!311234 m!320755))

(assert (=> b!311234 m!320755))

(declare-fun m!320757 () Bool)

(assert (=> b!311234 m!320757))

(declare-fun m!320759 () Bool)

(assert (=> start!30984 m!320759))

(declare-fun m!320761 () Bool)

(assert (=> start!30984 m!320761))

(declare-fun m!320763 () Bool)

(assert (=> b!311238 m!320763))

(declare-fun m!320765 () Bool)

(assert (=> b!311233 m!320765))

(declare-fun m!320767 () Bool)

(assert (=> b!311236 m!320767))

(declare-fun m!320769 () Bool)

(assert (=> b!311241 m!320769))

(declare-fun m!320771 () Bool)

(assert (=> b!311235 m!320771))

(declare-fun m!320773 () Bool)

(assert (=> b!311237 m!320773))

(declare-fun m!320775 () Bool)

(assert (=> b!311237 m!320775))

(declare-fun m!320777 () Bool)

(assert (=> b!311232 m!320777))

(declare-fun m!320779 () Bool)

(assert (=> b!311232 m!320779))

(declare-fun m!320781 () Bool)

(assert (=> b!311232 m!320781))

(declare-fun m!320783 () Bool)

(assert (=> b!311239 m!320783))

(declare-fun m!320785 () Bool)

(assert (=> b!311239 m!320785))

(check-sat (not b!311236) (not b!311232) (not b!311238) (not b!311235) (not start!30984) (not b!311241) (not b!311234) (not b!311237) (not b!311239))
(check-sat)
