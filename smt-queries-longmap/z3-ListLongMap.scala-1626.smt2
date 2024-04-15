; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30522 () Bool)

(assert start!30522)

(declare-fun b!305345 () Bool)

(declare-fun res!162634 () Bool)

(declare-fun e!191711 () Bool)

(assert (=> b!305345 (=> (not res!162634) (not e!191711))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-datatypes ((array!15530 0))(
  ( (array!15531 (arr!7350 (Array (_ BitVec 32) (_ BitVec 64))) (size!7703 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15530)

(assert (=> b!305345 (= res!162634 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7350 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!305346 () Bool)

(declare-fun res!162640 () Bool)

(declare-fun e!191712 () Bool)

(assert (=> b!305346 (=> (not res!162640) (not e!191712))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!305346 (= res!162640 (and (= (size!7703 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7703 a!3293))))))

(declare-fun b!305347 () Bool)

(declare-fun res!162635 () Bool)

(assert (=> b!305347 (=> (not res!162635) (not e!191712))))

(declare-datatypes ((SeekEntryResult!2489 0))(
  ( (MissingZero!2489 (index!12132 (_ BitVec 32))) (Found!2489 (index!12133 (_ BitVec 32))) (Intermediate!2489 (undefined!3301 Bool) (index!12134 (_ BitVec 32)) (x!30407 (_ BitVec 32))) (Undefined!2489) (MissingVacant!2489 (index!12135 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15530 (_ BitVec 32)) SeekEntryResult!2489)

(assert (=> b!305347 (= res!162635 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2489 i!1240)))))

(declare-fun b!305348 () Bool)

(declare-fun res!162637 () Bool)

(assert (=> b!305348 (=> (not res!162637) (not e!191712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15530 (_ BitVec 32)) Bool)

(assert (=> b!305348 (= res!162637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305349 () Bool)

(declare-datatypes ((Unit!9376 0))(
  ( (Unit!9377) )
))
(declare-fun e!191710 () Unit!9376)

(declare-fun e!191713 () Unit!9376)

(assert (=> b!305349 (= e!191710 e!191713)))

(declare-fun c!48959 () Bool)

(assert (=> b!305349 (= c!48959 (or (= (select (arr!7350 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7350 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305350 () Bool)

(assert (=> b!305350 false))

(declare-fun lt!150553 () SeekEntryResult!2489)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15530 (_ BitVec 32)) SeekEntryResult!2489)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305350 (= lt!150553 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9378 () Unit!9376)

(assert (=> b!305350 (= e!191713 Unit!9378)))

(declare-fun b!305351 () Bool)

(assert (=> b!305351 false))

(declare-fun Unit!9379 () Unit!9376)

(assert (=> b!305351 (= e!191713 Unit!9379)))

(declare-fun b!305352 () Bool)

(declare-fun res!162639 () Bool)

(assert (=> b!305352 (=> (not res!162639) (not e!191712))))

(declare-fun arrayContainsKey!0 (array!15530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305352 (= res!162639 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305353 () Bool)

(declare-fun res!162636 () Bool)

(assert (=> b!305353 (=> (not res!162636) (not e!191711))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!305353 (= res!162636 (and (= (select (arr!7350 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7703 a!3293))))))

(declare-fun b!305354 () Bool)

(assert (=> b!305354 (= e!191711 (not (or (not (= (select (arr!7350 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000))))))

(assert (=> b!305354 (= index!1781 resIndex!52)))

(declare-fun lt!150552 () Unit!9376)

(assert (=> b!305354 (= lt!150552 e!191710)))

(declare-fun c!48958 () Bool)

(assert (=> b!305354 (= c!48958 (not (= resIndex!52 index!1781)))))

(declare-fun res!162633 () Bool)

(assert (=> start!30522 (=> (not res!162633) (not e!191712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30522 (= res!162633 (validMask!0 mask!3709))))

(assert (=> start!30522 e!191712))

(declare-fun array_inv!5322 (array!15530) Bool)

(assert (=> start!30522 (array_inv!5322 a!3293)))

(assert (=> start!30522 true))

(declare-fun b!305355 () Bool)

(declare-fun res!162642 () Bool)

(assert (=> b!305355 (=> (not res!162642) (not e!191711))))

(declare-fun lt!150554 () SeekEntryResult!2489)

(assert (=> b!305355 (= res!162642 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150554))))

(declare-fun b!305356 () Bool)

(declare-fun Unit!9380 () Unit!9376)

(assert (=> b!305356 (= e!191710 Unit!9380)))

(declare-fun b!305357 () Bool)

(assert (=> b!305357 (= e!191712 e!191711)))

(declare-fun res!162641 () Bool)

(assert (=> b!305357 (=> (not res!162641) (not e!191711))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305357 (= res!162641 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150554))))

(assert (=> b!305357 (= lt!150554 (Intermediate!2489 false resIndex!52 resX!52))))

(declare-fun b!305358 () Bool)

(declare-fun res!162638 () Bool)

(assert (=> b!305358 (=> (not res!162638) (not e!191712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305358 (= res!162638 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30522 res!162633) b!305346))

(assert (= (and b!305346 res!162640) b!305358))

(assert (= (and b!305358 res!162638) b!305352))

(assert (= (and b!305352 res!162639) b!305347))

(assert (= (and b!305347 res!162635) b!305348))

(assert (= (and b!305348 res!162637) b!305357))

(assert (= (and b!305357 res!162641) b!305353))

(assert (= (and b!305353 res!162636) b!305355))

(assert (= (and b!305355 res!162642) b!305345))

(assert (= (and b!305345 res!162634) b!305354))

(assert (= (and b!305354 c!48958) b!305349))

(assert (= (and b!305354 (not c!48958)) b!305356))

(assert (= (and b!305349 c!48959) b!305351))

(assert (= (and b!305349 (not c!48959)) b!305350))

(declare-fun m!315793 () Bool)

(assert (=> b!305350 m!315793))

(assert (=> b!305350 m!315793))

(declare-fun m!315795 () Bool)

(assert (=> b!305350 m!315795))

(declare-fun m!315797 () Bool)

(assert (=> start!30522 m!315797))

(declare-fun m!315799 () Bool)

(assert (=> start!30522 m!315799))

(declare-fun m!315801 () Bool)

(assert (=> b!305355 m!315801))

(declare-fun m!315803 () Bool)

(assert (=> b!305349 m!315803))

(declare-fun m!315805 () Bool)

(assert (=> b!305347 m!315805))

(declare-fun m!315807 () Bool)

(assert (=> b!305348 m!315807))

(assert (=> b!305354 m!315803))

(declare-fun m!315809 () Bool)

(assert (=> b!305358 m!315809))

(declare-fun m!315811 () Bool)

(assert (=> b!305353 m!315811))

(declare-fun m!315813 () Bool)

(assert (=> b!305357 m!315813))

(assert (=> b!305357 m!315813))

(declare-fun m!315815 () Bool)

(assert (=> b!305357 m!315815))

(assert (=> b!305345 m!315803))

(declare-fun m!315817 () Bool)

(assert (=> b!305352 m!315817))

(check-sat (not b!305357) (not b!305352) (not start!30522) (not b!305347) (not b!305348) (not b!305350) (not b!305358) (not b!305355))
(check-sat)
