; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30304 () Bool)

(assert start!30304)

(declare-fun res!160869 () Bool)

(declare-fun e!190941 () Bool)

(assert (=> start!30304 (=> (not res!160869) (not e!190941))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30304 (= res!160869 (validMask!0 mask!3709))))

(assert (=> start!30304 e!190941))

(declare-datatypes ((array!15410 0))(
  ( (array!15411 (arr!7293 (Array (_ BitVec 32) (_ BitVec 64))) (size!7645 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15410)

(declare-fun array_inv!5256 (array!15410) Bool)

(assert (=> start!30304 (array_inv!5256 a!3293)))

(assert (=> start!30304 true))

(declare-fun b!303382 () Bool)

(declare-fun res!160875 () Bool)

(assert (=> b!303382 (=> (not res!160875) (not e!190941))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303382 (= res!160875 (validKeyInArray!0 k0!2441))))

(declare-fun b!303383 () Bool)

(declare-fun res!160874 () Bool)

(assert (=> b!303383 (=> (not res!160874) (not e!190941))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303383 (= res!160874 (and (= (select (arr!7293 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7645 a!3293))))))

(declare-fun b!303384 () Bool)

(declare-fun res!160872 () Bool)

(assert (=> b!303384 (=> (not res!160872) (not e!190941))))

(assert (=> b!303384 (= res!160872 (and (= (size!7645 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7645 a!3293))))))

(declare-fun b!303385 () Bool)

(assert (=> b!303385 (= e!190941 false)))

(declare-datatypes ((SeekEntryResult!2433 0))(
  ( (MissingZero!2433 (index!11908 (_ BitVec 32))) (Found!2433 (index!11909 (_ BitVec 32))) (Intermediate!2433 (undefined!3245 Bool) (index!11910 (_ BitVec 32)) (x!30170 (_ BitVec 32))) (Undefined!2433) (MissingVacant!2433 (index!11911 (_ BitVec 32))) )
))
(declare-fun lt!150201 () SeekEntryResult!2433)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15410 (_ BitVec 32)) SeekEntryResult!2433)

(assert (=> b!303385 (= lt!150201 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!303386 () Bool)

(declare-fun res!160871 () Bool)

(assert (=> b!303386 (=> (not res!160871) (not e!190941))))

(declare-fun arrayContainsKey!0 (array!15410 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303386 (= res!160871 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303387 () Bool)

(declare-fun res!160868 () Bool)

(assert (=> b!303387 (=> (not res!160868) (not e!190941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15410 (_ BitVec 32)) Bool)

(assert (=> b!303387 (= res!160868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303388 () Bool)

(declare-fun res!160870 () Bool)

(assert (=> b!303388 (=> (not res!160870) (not e!190941))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15410 (_ BitVec 32)) SeekEntryResult!2433)

(assert (=> b!303388 (= res!160870 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2433 i!1240)))))

(declare-fun b!303389 () Bool)

(declare-fun res!160873 () Bool)

(assert (=> b!303389 (=> (not res!160873) (not e!190941))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303389 (= res!160873 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2433 false resIndex!52 resX!52)))))

(assert (= (and start!30304 res!160869) b!303384))

(assert (= (and b!303384 res!160872) b!303382))

(assert (= (and b!303382 res!160875) b!303386))

(assert (= (and b!303386 res!160871) b!303388))

(assert (= (and b!303388 res!160870) b!303387))

(assert (= (and b!303387 res!160868) b!303389))

(assert (= (and b!303389 res!160873) b!303383))

(assert (= (and b!303383 res!160874) b!303385))

(declare-fun m!314743 () Bool)

(assert (=> b!303383 m!314743))

(declare-fun m!314745 () Bool)

(assert (=> b!303382 m!314745))

(declare-fun m!314747 () Bool)

(assert (=> b!303389 m!314747))

(assert (=> b!303389 m!314747))

(declare-fun m!314749 () Bool)

(assert (=> b!303389 m!314749))

(declare-fun m!314751 () Bool)

(assert (=> b!303385 m!314751))

(declare-fun m!314753 () Bool)

(assert (=> b!303387 m!314753))

(declare-fun m!314755 () Bool)

(assert (=> start!30304 m!314755))

(declare-fun m!314757 () Bool)

(assert (=> start!30304 m!314757))

(declare-fun m!314759 () Bool)

(assert (=> b!303388 m!314759))

(declare-fun m!314761 () Bool)

(assert (=> b!303386 m!314761))

(check-sat (not b!303385) (not start!30304) (not b!303387) (not b!303386) (not b!303382) (not b!303388) (not b!303389))
