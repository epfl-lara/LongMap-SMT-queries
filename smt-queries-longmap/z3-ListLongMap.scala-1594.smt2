; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30238 () Bool)

(assert start!30238)

(declare-datatypes ((array!15344 0))(
  ( (array!15345 (arr!7260 (Array (_ BitVec 32) (_ BitVec 64))) (size!7612 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15344)

(declare-fun e!190694 () Bool)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun b!302541 () Bool)

(assert (=> b!302541 (= e!190694 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7260 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7260 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7260 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun b!302543 () Bool)

(declare-fun e!190696 () Bool)

(assert (=> b!302543 (= e!190696 e!190694)))

(declare-fun res!160034 () Bool)

(assert (=> b!302543 (=> (not res!160034) (not e!190694))))

(declare-datatypes ((SeekEntryResult!2400 0))(
  ( (MissingZero!2400 (index!11776 (_ BitVec 32))) (Found!2400 (index!11777 (_ BitVec 32))) (Intermediate!2400 (undefined!3212 Bool) (index!11778 (_ BitVec 32)) (x!30049 (_ BitVec 32))) (Undefined!2400) (MissingVacant!2400 (index!11779 (_ BitVec 32))) )
))
(declare-fun lt!150102 () SeekEntryResult!2400)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15344 (_ BitVec 32)) SeekEntryResult!2400)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302543 (= res!160034 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150102))))

(assert (=> b!302543 (= lt!150102 (Intermediate!2400 false resIndex!52 resX!52))))

(declare-fun b!302544 () Bool)

(declare-fun res!160030 () Bool)

(assert (=> b!302544 (=> (not res!160030) (not e!190696))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302544 (= res!160030 (validKeyInArray!0 k0!2441))))

(declare-fun b!302545 () Bool)

(declare-fun res!160028 () Bool)

(assert (=> b!302545 (=> (not res!160028) (not e!190696))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!302545 (= res!160028 (and (= (size!7612 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7612 a!3293))))))

(declare-fun b!302546 () Bool)

(declare-fun res!160032 () Bool)

(assert (=> b!302546 (=> (not res!160032) (not e!190696))))

(declare-fun arrayContainsKey!0 (array!15344 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302546 (= res!160032 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302547 () Bool)

(declare-fun res!160029 () Bool)

(assert (=> b!302547 (=> (not res!160029) (not e!190696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15344 (_ BitVec 32)) Bool)

(assert (=> b!302547 (= res!160029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!302548 () Bool)

(declare-fun res!160035 () Bool)

(assert (=> b!302548 (=> (not res!160035) (not e!190694))))

(assert (=> b!302548 (= res!160035 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150102))))

(declare-fun b!302549 () Bool)

(declare-fun res!160031 () Bool)

(assert (=> b!302549 (=> (not res!160031) (not e!190694))))

(assert (=> b!302549 (= res!160031 (and (= (select (arr!7260 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7612 a!3293))))))

(declare-fun b!302542 () Bool)

(declare-fun res!160033 () Bool)

(assert (=> b!302542 (=> (not res!160033) (not e!190696))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15344 (_ BitVec 32)) SeekEntryResult!2400)

(assert (=> b!302542 (= res!160033 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2400 i!1240)))))

(declare-fun res!160027 () Bool)

(assert (=> start!30238 (=> (not res!160027) (not e!190696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30238 (= res!160027 (validMask!0 mask!3709))))

(assert (=> start!30238 e!190696))

(declare-fun array_inv!5223 (array!15344) Bool)

(assert (=> start!30238 (array_inv!5223 a!3293)))

(assert (=> start!30238 true))

(assert (= (and start!30238 res!160027) b!302545))

(assert (= (and b!302545 res!160028) b!302544))

(assert (= (and b!302544 res!160030) b!302546))

(assert (= (and b!302546 res!160032) b!302542))

(assert (= (and b!302542 res!160033) b!302547))

(assert (= (and b!302547 res!160029) b!302543))

(assert (= (and b!302543 res!160034) b!302549))

(assert (= (and b!302549 res!160031) b!302548))

(assert (= (and b!302548 res!160035) b!302541))

(declare-fun m!314049 () Bool)

(assert (=> b!302543 m!314049))

(assert (=> b!302543 m!314049))

(declare-fun m!314051 () Bool)

(assert (=> b!302543 m!314051))

(declare-fun m!314053 () Bool)

(assert (=> b!302549 m!314053))

(declare-fun m!314055 () Bool)

(assert (=> b!302548 m!314055))

(declare-fun m!314057 () Bool)

(assert (=> b!302547 m!314057))

(declare-fun m!314059 () Bool)

(assert (=> b!302542 m!314059))

(declare-fun m!314061 () Bool)

(assert (=> start!30238 m!314061))

(declare-fun m!314063 () Bool)

(assert (=> start!30238 m!314063))

(declare-fun m!314065 () Bool)

(assert (=> b!302546 m!314065))

(declare-fun m!314067 () Bool)

(assert (=> b!302544 m!314067))

(declare-fun m!314069 () Bool)

(assert (=> b!302541 m!314069))

(check-sat (not b!302546) (not start!30238) (not b!302548) (not b!302542) (not b!302547) (not b!302543) (not b!302544))
(check-sat)
