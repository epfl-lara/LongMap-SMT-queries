; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30300 () Bool)

(assert start!30300)

(declare-fun b!303238 () Bool)

(declare-fun e!190806 () Bool)

(declare-fun e!190807 () Bool)

(assert (=> b!303238 (= e!190806 e!190807)))

(declare-fun res!160877 () Bool)

(assert (=> b!303238 (=> (not res!160877) (not e!190807))))

(declare-datatypes ((array!15410 0))(
  ( (array!15411 (arr!7293 (Array (_ BitVec 32) (_ BitVec 64))) (size!7646 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15410)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2432 0))(
  ( (MissingZero!2432 (index!11904 (_ BitVec 32))) (Found!2432 (index!11905 (_ BitVec 32))) (Intermediate!2432 (undefined!3244 Bool) (index!11906 (_ BitVec 32)) (x!30180 (_ BitVec 32))) (Undefined!2432) (MissingVacant!2432 (index!11907 (_ BitVec 32))) )
))
(declare-fun lt!149981 () SeekEntryResult!2432)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15410 (_ BitVec 32)) SeekEntryResult!2432)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303238 (= res!160877 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!149981))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!303238 (= lt!149981 (Intermediate!2432 false resIndex!52 resX!52))))

(declare-fun b!303239 () Bool)

(declare-fun res!160875 () Bool)

(assert (=> b!303239 (=> (not res!160875) (not e!190806))))

(declare-fun arrayContainsKey!0 (array!15410 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303239 (= res!160875 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!160870 () Bool)

(assert (=> start!30300 (=> (not res!160870) (not e!190806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30300 (= res!160870 (validMask!0 mask!3709))))

(assert (=> start!30300 e!190806))

(declare-fun array_inv!5265 (array!15410) Bool)

(assert (=> start!30300 (array_inv!5265 a!3293)))

(assert (=> start!30300 true))

(declare-fun b!303240 () Bool)

(declare-fun res!160872 () Bool)

(assert (=> b!303240 (=> (not res!160872) (not e!190807))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303240 (= res!160872 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!149981))))

(declare-fun b!303241 () Bool)

(declare-fun res!160878 () Bool)

(assert (=> b!303241 (=> (not res!160878) (not e!190807))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303241 (= res!160878 (and (= (select (arr!7293 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7646 a!3293))))))

(declare-fun b!303242 () Bool)

(declare-fun res!160876 () Bool)

(assert (=> b!303242 (=> (not res!160876) (not e!190806))))

(assert (=> b!303242 (= res!160876 (and (= (size!7646 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7646 a!3293))))))

(declare-fun b!303243 () Bool)

(declare-fun res!160873 () Bool)

(assert (=> b!303243 (=> (not res!160873) (not e!190806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15410 (_ BitVec 32)) Bool)

(assert (=> b!303243 (= res!160873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303244 () Bool)

(assert (=> b!303244 (= e!190807 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7293 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7293 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7293 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!303245 () Bool)

(declare-fun res!160874 () Bool)

(assert (=> b!303245 (=> (not res!160874) (not e!190806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303245 (= res!160874 (validKeyInArray!0 k0!2441))))

(declare-fun b!303246 () Bool)

(declare-fun res!160871 () Bool)

(assert (=> b!303246 (=> (not res!160871) (not e!190806))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15410 (_ BitVec 32)) SeekEntryResult!2432)

(assert (=> b!303246 (= res!160871 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2432 i!1240)))))

(assert (= (and start!30300 res!160870) b!303242))

(assert (= (and b!303242 res!160876) b!303245))

(assert (= (and b!303245 res!160874) b!303239))

(assert (= (and b!303239 res!160875) b!303246))

(assert (= (and b!303246 res!160871) b!303243))

(assert (= (and b!303243 res!160873) b!303238))

(assert (= (and b!303238 res!160877) b!303241))

(assert (= (and b!303241 res!160878) b!303240))

(assert (= (and b!303240 res!160872) b!303244))

(declare-fun m!314119 () Bool)

(assert (=> b!303244 m!314119))

(declare-fun m!314121 () Bool)

(assert (=> b!303245 m!314121))

(declare-fun m!314123 () Bool)

(assert (=> b!303238 m!314123))

(assert (=> b!303238 m!314123))

(declare-fun m!314125 () Bool)

(assert (=> b!303238 m!314125))

(declare-fun m!314127 () Bool)

(assert (=> b!303246 m!314127))

(declare-fun m!314129 () Bool)

(assert (=> start!30300 m!314129))

(declare-fun m!314131 () Bool)

(assert (=> start!30300 m!314131))

(declare-fun m!314133 () Bool)

(assert (=> b!303241 m!314133))

(declare-fun m!314135 () Bool)

(assert (=> b!303243 m!314135))

(declare-fun m!314137 () Bool)

(assert (=> b!303239 m!314137))

(declare-fun m!314139 () Bool)

(assert (=> b!303240 m!314139))

(check-sat (not b!303246) (not b!303245) (not b!303243) (not b!303240) (not start!30300) (not b!303238) (not b!303239))
(check-sat)
