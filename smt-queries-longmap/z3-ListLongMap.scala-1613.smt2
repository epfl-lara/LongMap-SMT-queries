; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30390 () Bool)

(assert start!30390)

(declare-fun res!161472 () Bool)

(declare-fun e!191100 () Bool)

(assert (=> start!30390 (=> (not res!161472) (not e!191100))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30390 (= res!161472 (validMask!0 mask!3709))))

(assert (=> start!30390 e!191100))

(declare-datatypes ((array!15449 0))(
  ( (array!15450 (arr!7311 (Array (_ BitVec 32) (_ BitVec 64))) (size!7664 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15449)

(declare-fun array_inv!5283 (array!15449) Bool)

(assert (=> start!30390 (array_inv!5283 a!3293)))

(assert (=> start!30390 true))

(declare-fun b!303978 () Bool)

(declare-fun res!161477 () Bool)

(assert (=> b!303978 (=> (not res!161477) (not e!191100))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15449 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303978 (= res!161477 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303979 () Bool)

(declare-fun res!161471 () Bool)

(declare-fun e!191102 () Bool)

(assert (=> b!303979 (=> (not res!161471) (not e!191102))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303979 (= res!161471 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7311 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7311 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7311 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!303980 () Bool)

(declare-fun res!161474 () Bool)

(assert (=> b!303980 (=> (not res!161474) (not e!191100))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303980 (= res!161474 (and (= (size!7664 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7664 a!3293))))))

(declare-fun b!303981 () Bool)

(declare-fun res!161476 () Bool)

(assert (=> b!303981 (=> (not res!161476) (not e!191102))))

(declare-datatypes ((SeekEntryResult!2450 0))(
  ( (MissingZero!2450 (index!11976 (_ BitVec 32))) (Found!2450 (index!11977 (_ BitVec 32))) (Intermediate!2450 (undefined!3262 Bool) (index!11978 (_ BitVec 32)) (x!30255 (_ BitVec 32))) (Undefined!2450) (MissingVacant!2450 (index!11979 (_ BitVec 32))) )
))
(declare-fun lt!150178 () SeekEntryResult!2450)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15449 (_ BitVec 32)) SeekEntryResult!2450)

(assert (=> b!303981 (= res!161476 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150178))))

(declare-fun b!303982 () Bool)

(declare-fun res!161478 () Bool)

(assert (=> b!303982 (=> (not res!161478) (not e!191100))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15449 (_ BitVec 32)) Bool)

(assert (=> b!303982 (= res!161478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun lt!150179 () (_ BitVec 32))

(declare-fun b!303983 () Bool)

(assert (=> b!303983 (= e!191102 (and (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge lt!150179 #b00000000000000000000000000000000) (bvslt lt!150179 (bvadd #b00000000000000000000000000000001 mask!3709)) (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303983 (= lt!150179 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!303984 () Bool)

(declare-fun res!161473 () Bool)

(assert (=> b!303984 (=> (not res!161473) (not e!191102))))

(assert (=> b!303984 (= res!161473 (and (= (select (arr!7311 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7664 a!3293))))))

(declare-fun b!303985 () Bool)

(declare-fun res!161469 () Bool)

(assert (=> b!303985 (=> (not res!161469) (not e!191100))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303985 (= res!161469 (validKeyInArray!0 k0!2441))))

(declare-fun b!303986 () Bool)

(declare-fun res!161475 () Bool)

(assert (=> b!303986 (=> (not res!161475) (not e!191100))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15449 (_ BitVec 32)) SeekEntryResult!2450)

(assert (=> b!303986 (= res!161475 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2450 i!1240)))))

(declare-fun b!303987 () Bool)

(assert (=> b!303987 (= e!191100 e!191102)))

(declare-fun res!161470 () Bool)

(assert (=> b!303987 (=> (not res!161470) (not e!191102))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303987 (= res!161470 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150178))))

(assert (=> b!303987 (= lt!150178 (Intermediate!2450 false resIndex!52 resX!52))))

(assert (= (and start!30390 res!161472) b!303980))

(assert (= (and b!303980 res!161474) b!303985))

(assert (= (and b!303985 res!161469) b!303978))

(assert (= (and b!303978 res!161477) b!303986))

(assert (= (and b!303986 res!161475) b!303982))

(assert (= (and b!303982 res!161478) b!303987))

(assert (= (and b!303987 res!161470) b!303984))

(assert (= (and b!303984 res!161473) b!303981))

(assert (= (and b!303981 res!161476) b!303979))

(assert (= (and b!303979 res!161471) b!303983))

(declare-fun m!314653 () Bool)

(assert (=> b!303987 m!314653))

(assert (=> b!303987 m!314653))

(declare-fun m!314655 () Bool)

(assert (=> b!303987 m!314655))

(declare-fun m!314657 () Bool)

(assert (=> start!30390 m!314657))

(declare-fun m!314659 () Bool)

(assert (=> start!30390 m!314659))

(declare-fun m!314661 () Bool)

(assert (=> b!303981 m!314661))

(declare-fun m!314663 () Bool)

(assert (=> b!303982 m!314663))

(declare-fun m!314665 () Bool)

(assert (=> b!303979 m!314665))

(declare-fun m!314667 () Bool)

(assert (=> b!303983 m!314667))

(declare-fun m!314669 () Bool)

(assert (=> b!303985 m!314669))

(declare-fun m!314671 () Bool)

(assert (=> b!303984 m!314671))

(declare-fun m!314673 () Bool)

(assert (=> b!303978 m!314673))

(declare-fun m!314675 () Bool)

(assert (=> b!303986 m!314675))

(check-sat (not b!303978) (not b!303987) (not b!303985) (not b!303981) (not b!303982) (not start!30390) (not b!303983) (not b!303986))
(check-sat)
