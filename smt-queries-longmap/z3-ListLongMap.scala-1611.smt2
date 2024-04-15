; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30324 () Bool)

(assert start!30324)

(declare-fun b!303582 () Bool)

(declare-fun res!161222 () Bool)

(declare-fun e!190915 () Bool)

(assert (=> b!303582 (=> (not res!161222) (not e!190915))))

(declare-datatypes ((array!15434 0))(
  ( (array!15435 (arr!7305 (Array (_ BitVec 32) (_ BitVec 64))) (size!7658 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15434)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2444 0))(
  ( (MissingZero!2444 (index!11952 (_ BitVec 32))) (Found!2444 (index!11953 (_ BitVec 32))) (Intermediate!2444 (undefined!3256 Bool) (index!11954 (_ BitVec 32)) (x!30224 (_ BitVec 32))) (Undefined!2444) (MissingVacant!2444 (index!11955 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15434 (_ BitVec 32)) SeekEntryResult!2444)

(assert (=> b!303582 (= res!161222 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2444 i!1240)))))

(declare-fun b!303583 () Bool)

(declare-fun res!161216 () Bool)

(declare-fun e!190914 () Bool)

(assert (=> b!303583 (=> (not res!161216) (not e!190914))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!303583 (= res!161216 (and (= (select (arr!7305 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7658 a!3293))))))

(declare-fun b!303584 () Bool)

(assert (=> b!303584 (= e!190914 false)))

(declare-fun lt!150037 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303584 (= lt!150037 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!161220 () Bool)

(assert (=> start!30324 (=> (not res!161220) (not e!190915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30324 (= res!161220 (validMask!0 mask!3709))))

(assert (=> start!30324 e!190915))

(declare-fun array_inv!5277 (array!15434) Bool)

(assert (=> start!30324 (array_inv!5277 a!3293)))

(assert (=> start!30324 true))

(declare-fun b!303585 () Bool)

(declare-fun res!161217 () Bool)

(assert (=> b!303585 (=> (not res!161217) (not e!190915))))

(declare-fun arrayContainsKey!0 (array!15434 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303585 (= res!161217 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303586 () Bool)

(declare-fun res!161218 () Bool)

(assert (=> b!303586 (=> (not res!161218) (not e!190915))))

(assert (=> b!303586 (= res!161218 (and (= (size!7658 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7658 a!3293))))))

(declare-fun b!303587 () Bool)

(declare-fun res!161215 () Bool)

(assert (=> b!303587 (=> (not res!161215) (not e!190915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303587 (= res!161215 (validKeyInArray!0 k0!2441))))

(declare-fun b!303588 () Bool)

(declare-fun res!161214 () Bool)

(assert (=> b!303588 (=> (not res!161214) (not e!190915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15434 (_ BitVec 32)) Bool)

(assert (=> b!303588 (= res!161214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303589 () Bool)

(declare-fun res!161219 () Bool)

(assert (=> b!303589 (=> (not res!161219) (not e!190914))))

(assert (=> b!303589 (= res!161219 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7305 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7305 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7305 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!303590 () Bool)

(declare-fun res!161221 () Bool)

(assert (=> b!303590 (=> (not res!161221) (not e!190914))))

(declare-fun lt!150038 () SeekEntryResult!2444)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15434 (_ BitVec 32)) SeekEntryResult!2444)

(assert (=> b!303590 (= res!161221 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150038))))

(declare-fun b!303591 () Bool)

(assert (=> b!303591 (= e!190915 e!190914)))

(declare-fun res!161223 () Bool)

(assert (=> b!303591 (=> (not res!161223) (not e!190914))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303591 (= res!161223 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150038))))

(assert (=> b!303591 (= lt!150038 (Intermediate!2444 false resIndex!52 resX!52))))

(assert (= (and start!30324 res!161220) b!303586))

(assert (= (and b!303586 res!161218) b!303587))

(assert (= (and b!303587 res!161215) b!303585))

(assert (= (and b!303585 res!161217) b!303582))

(assert (= (and b!303582 res!161222) b!303588))

(assert (= (and b!303588 res!161214) b!303591))

(assert (= (and b!303591 res!161223) b!303583))

(assert (= (and b!303583 res!161216) b!303590))

(assert (= (and b!303590 res!161221) b!303589))

(assert (= (and b!303589 res!161219) b!303584))

(declare-fun m!314395 () Bool)

(assert (=> b!303585 m!314395))

(declare-fun m!314397 () Bool)

(assert (=> b!303588 m!314397))

(declare-fun m!314399 () Bool)

(assert (=> b!303583 m!314399))

(declare-fun m!314401 () Bool)

(assert (=> b!303591 m!314401))

(assert (=> b!303591 m!314401))

(declare-fun m!314403 () Bool)

(assert (=> b!303591 m!314403))

(declare-fun m!314405 () Bool)

(assert (=> b!303587 m!314405))

(declare-fun m!314407 () Bool)

(assert (=> b!303590 m!314407))

(declare-fun m!314409 () Bool)

(assert (=> b!303584 m!314409))

(declare-fun m!314411 () Bool)

(assert (=> start!30324 m!314411))

(declare-fun m!314413 () Bool)

(assert (=> start!30324 m!314413))

(declare-fun m!314415 () Bool)

(assert (=> b!303582 m!314415))

(declare-fun m!314417 () Bool)

(assert (=> b!303589 m!314417))

(check-sat (not start!30324) (not b!303582) (not b!303591) (not b!303584) (not b!303588) (not b!303585) (not b!303587) (not b!303590))
(check-sat)
