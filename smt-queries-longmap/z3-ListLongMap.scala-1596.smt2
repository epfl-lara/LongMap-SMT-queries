; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30234 () Bool)

(assert start!30234)

(declare-fun b!302392 () Bool)

(declare-fun res!160027 () Bool)

(declare-fun e!190555 () Bool)

(assert (=> b!302392 (=> (not res!160027) (not e!190555))))

(declare-datatypes ((array!15344 0))(
  ( (array!15345 (arr!7260 (Array (_ BitVec 32) (_ BitVec 64))) (size!7613 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15344)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!302392 (= res!160027 (and (= (select (arr!7260 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7613 a!3293))))))

(declare-fun b!302393 () Bool)

(declare-fun e!190556 () Bool)

(assert (=> b!302393 (= e!190556 e!190555)))

(declare-fun res!160032 () Bool)

(assert (=> b!302393 (=> (not res!160032) (not e!190555))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2399 0))(
  ( (MissingZero!2399 (index!11772 (_ BitVec 32))) (Found!2399 (index!11773 (_ BitVec 32))) (Intermediate!2399 (undefined!3211 Bool) (index!11774 (_ BitVec 32)) (x!30059 (_ BitVec 32))) (Undefined!2399) (MissingVacant!2399 (index!11775 (_ BitVec 32))) )
))
(declare-fun lt!149882 () SeekEntryResult!2399)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15344 (_ BitVec 32)) SeekEntryResult!2399)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302393 (= res!160032 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!149882))))

(assert (=> b!302393 (= lt!149882 (Intermediate!2399 false resIndex!52 resX!52))))

(declare-fun b!302394 () Bool)

(declare-fun res!160031 () Bool)

(assert (=> b!302394 (=> (not res!160031) (not e!190556))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15344 (_ BitVec 32)) SeekEntryResult!2399)

(assert (=> b!302394 (= res!160031 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2399 i!1240)))))

(declare-fun b!302395 () Bool)

(declare-fun res!160028 () Bool)

(assert (=> b!302395 (=> (not res!160028) (not e!190556))))

(assert (=> b!302395 (= res!160028 (and (= (size!7613 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7613 a!3293))))))

(declare-fun b!302396 () Bool)

(declare-fun res!160029 () Bool)

(assert (=> b!302396 (=> (not res!160029) (not e!190555))))

(assert (=> b!302396 (= res!160029 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!149882))))

(declare-fun b!302397 () Bool)

(declare-fun res!160026 () Bool)

(assert (=> b!302397 (=> (not res!160026) (not e!190556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15344 (_ BitVec 32)) Bool)

(assert (=> b!302397 (= res!160026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!160024 () Bool)

(assert (=> start!30234 (=> (not res!160024) (not e!190556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30234 (= res!160024 (validMask!0 mask!3709))))

(assert (=> start!30234 e!190556))

(declare-fun array_inv!5232 (array!15344) Bool)

(assert (=> start!30234 (array_inv!5232 a!3293)))

(assert (=> start!30234 true))

(declare-fun b!302398 () Bool)

(declare-fun res!160025 () Bool)

(assert (=> b!302398 (=> (not res!160025) (not e!190556))))

(declare-fun arrayContainsKey!0 (array!15344 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302398 (= res!160025 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!302399 () Bool)

(assert (=> b!302399 (= e!190555 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7260 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (or (= (select (arr!7260 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7260 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!302400 () Bool)

(declare-fun res!160030 () Bool)

(assert (=> b!302400 (=> (not res!160030) (not e!190556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302400 (= res!160030 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30234 res!160024) b!302395))

(assert (= (and b!302395 res!160028) b!302400))

(assert (= (and b!302400 res!160030) b!302398))

(assert (= (and b!302398 res!160025) b!302394))

(assert (= (and b!302394 res!160031) b!302397))

(assert (= (and b!302397 res!160026) b!302393))

(assert (= (and b!302393 res!160032) b!302392))

(assert (= (and b!302392 res!160027) b!302396))

(assert (= (and b!302396 res!160029) b!302399))

(declare-fun m!313423 () Bool)

(assert (=> b!302393 m!313423))

(assert (=> b!302393 m!313423))

(declare-fun m!313425 () Bool)

(assert (=> b!302393 m!313425))

(declare-fun m!313427 () Bool)

(assert (=> b!302400 m!313427))

(declare-fun m!313429 () Bool)

(assert (=> b!302397 m!313429))

(declare-fun m!313431 () Bool)

(assert (=> b!302398 m!313431))

(declare-fun m!313433 () Bool)

(assert (=> b!302394 m!313433))

(declare-fun m!313435 () Bool)

(assert (=> b!302396 m!313435))

(declare-fun m!313437 () Bool)

(assert (=> start!30234 m!313437))

(declare-fun m!313439 () Bool)

(assert (=> start!30234 m!313439))

(declare-fun m!313441 () Bool)

(assert (=> b!302392 m!313441))

(declare-fun m!313443 () Bool)

(assert (=> b!302399 m!313443))

(check-sat (not start!30234) (not b!302393) (not b!302396) (not b!302400) (not b!302397) (not b!302398) (not b!302394))
(check-sat)
