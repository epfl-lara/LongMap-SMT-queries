; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30120 () Bool)

(assert start!30120)

(declare-fun b!301735 () Bool)

(declare-fun res!159396 () Bool)

(declare-fun e!190371 () Bool)

(assert (=> b!301735 (=> (not res!159396) (not e!190371))))

(declare-datatypes ((array!15284 0))(
  ( (array!15285 (arr!7231 (Array (_ BitVec 32) (_ BitVec 64))) (size!7583 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15284)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15284 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301735 (= res!159396 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301736 () Bool)

(assert (=> b!301736 (= e!190371 false)))

(declare-fun lt!149973 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301736 (= lt!149973 (toIndex!0 k0!2441 mask!3709))))

(declare-fun b!301737 () Bool)

(declare-fun res!159394 () Bool)

(assert (=> b!301737 (=> (not res!159394) (not e!190371))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2336 0))(
  ( (MissingZero!2336 (index!11520 (_ BitVec 32))) (Found!2336 (index!11521 (_ BitVec 32))) (Intermediate!2336 (undefined!3148 Bool) (index!11522 (_ BitVec 32)) (x!29904 (_ BitVec 32))) (Undefined!2336) (MissingVacant!2336 (index!11523 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15284 (_ BitVec 32)) SeekEntryResult!2336)

(assert (=> b!301737 (= res!159394 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2336 i!1240)))))

(declare-fun b!301738 () Bool)

(declare-fun res!159397 () Bool)

(assert (=> b!301738 (=> (not res!159397) (not e!190371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15284 (_ BitVec 32)) Bool)

(assert (=> b!301738 (= res!159397 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301739 () Bool)

(declare-fun res!159398 () Bool)

(assert (=> b!301739 (=> (not res!159398) (not e!190371))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301739 (= res!159398 (validKeyInArray!0 k0!2441))))

(declare-fun b!301740 () Bool)

(declare-fun res!159399 () Bool)

(assert (=> b!301740 (=> (not res!159399) (not e!190371))))

(assert (=> b!301740 (= res!159399 (and (= (size!7583 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7583 a!3293))))))

(declare-fun res!159395 () Bool)

(assert (=> start!30120 (=> (not res!159395) (not e!190371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30120 (= res!159395 (validMask!0 mask!3709))))

(assert (=> start!30120 e!190371))

(assert (=> start!30120 true))

(declare-fun array_inv!5181 (array!15284) Bool)

(assert (=> start!30120 (array_inv!5181 a!3293)))

(assert (= (and start!30120 res!159395) b!301740))

(assert (= (and b!301740 res!159399) b!301739))

(assert (= (and b!301739 res!159398) b!301735))

(assert (= (and b!301735 res!159396) b!301737))

(assert (= (and b!301737 res!159394) b!301738))

(assert (= (and b!301738 res!159397) b!301736))

(declare-fun m!313591 () Bool)

(assert (=> b!301735 m!313591))

(declare-fun m!313593 () Bool)

(assert (=> start!30120 m!313593))

(declare-fun m!313595 () Bool)

(assert (=> start!30120 m!313595))

(declare-fun m!313597 () Bool)

(assert (=> b!301736 m!313597))

(declare-fun m!313599 () Bool)

(assert (=> b!301739 m!313599))

(declare-fun m!313601 () Bool)

(assert (=> b!301738 m!313601))

(declare-fun m!313603 () Bool)

(assert (=> b!301737 m!313603))

(check-sat (not start!30120) (not b!301738) (not b!301737) (not b!301739) (not b!301735) (not b!301736))
(check-sat)
