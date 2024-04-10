; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30292 () Bool)

(assert start!30292)

(declare-fun e!190902 () Bool)

(declare-datatypes ((array!15398 0))(
  ( (array!15399 (arr!7287 (Array (_ BitVec 32) (_ BitVec 64))) (size!7639 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15398)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun b!303234 () Bool)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!303234 (= e!190902 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7287 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7287 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7287 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun b!303235 () Bool)

(declare-fun res!160727 () Bool)

(declare-fun e!190903 () Bool)

(assert (=> b!303235 (=> (not res!160727) (not e!190903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15398 (_ BitVec 32)) Bool)

(assert (=> b!303235 (= res!160727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!160721 () Bool)

(assert (=> start!30292 (=> (not res!160721) (not e!190903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30292 (= res!160721 (validMask!0 mask!3709))))

(assert (=> start!30292 e!190903))

(declare-fun array_inv!5250 (array!15398) Bool)

(assert (=> start!30292 (array_inv!5250 a!3293)))

(assert (=> start!30292 true))

(declare-fun b!303236 () Bool)

(declare-fun res!160720 () Bool)

(assert (=> b!303236 (=> (not res!160720) (not e!190903))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!303236 (= res!160720 (and (= (size!7639 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7639 a!3293))))))

(declare-fun b!303237 () Bool)

(declare-fun res!160728 () Bool)

(assert (=> b!303237 (=> (not res!160728) (not e!190903))))

(declare-datatypes ((SeekEntryResult!2427 0))(
  ( (MissingZero!2427 (index!11884 (_ BitVec 32))) (Found!2427 (index!11885 (_ BitVec 32))) (Intermediate!2427 (undefined!3239 Bool) (index!11886 (_ BitVec 32)) (x!30148 (_ BitVec 32))) (Undefined!2427) (MissingVacant!2427 (index!11887 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15398 (_ BitVec 32)) SeekEntryResult!2427)

(assert (=> b!303237 (= res!160728 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2427 i!1240)))))

(declare-fun b!303238 () Bool)

(declare-fun res!160722 () Bool)

(assert (=> b!303238 (=> (not res!160722) (not e!190902))))

(declare-fun lt!150183 () SeekEntryResult!2427)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15398 (_ BitVec 32)) SeekEntryResult!2427)

(assert (=> b!303238 (= res!160722 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150183))))

(declare-fun b!303239 () Bool)

(assert (=> b!303239 (= e!190903 e!190902)))

(declare-fun res!160724 () Bool)

(assert (=> b!303239 (=> (not res!160724) (not e!190902))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303239 (= res!160724 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150183))))

(assert (=> b!303239 (= lt!150183 (Intermediate!2427 false resIndex!52 resX!52))))

(declare-fun b!303240 () Bool)

(declare-fun res!160725 () Bool)

(assert (=> b!303240 (=> (not res!160725) (not e!190902))))

(assert (=> b!303240 (= res!160725 (and (= (select (arr!7287 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7639 a!3293))))))

(declare-fun b!303241 () Bool)

(declare-fun res!160726 () Bool)

(assert (=> b!303241 (=> (not res!160726) (not e!190903))))

(declare-fun arrayContainsKey!0 (array!15398 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303241 (= res!160726 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303242 () Bool)

(declare-fun res!160723 () Bool)

(assert (=> b!303242 (=> (not res!160723) (not e!190903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303242 (= res!160723 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30292 res!160721) b!303236))

(assert (= (and b!303236 res!160720) b!303242))

(assert (= (and b!303242 res!160723) b!303241))

(assert (= (and b!303241 res!160726) b!303237))

(assert (= (and b!303237 res!160728) b!303235))

(assert (= (and b!303235 res!160727) b!303239))

(assert (= (and b!303239 res!160724) b!303240))

(assert (= (and b!303240 res!160725) b!303238))

(assert (= (and b!303238 res!160722) b!303234))

(declare-fun m!314619 () Bool)

(assert (=> b!303237 m!314619))

(declare-fun m!314621 () Bool)

(assert (=> start!30292 m!314621))

(declare-fun m!314623 () Bool)

(assert (=> start!30292 m!314623))

(declare-fun m!314625 () Bool)

(assert (=> b!303240 m!314625))

(declare-fun m!314627 () Bool)

(assert (=> b!303234 m!314627))

(declare-fun m!314629 () Bool)

(assert (=> b!303241 m!314629))

(declare-fun m!314631 () Bool)

(assert (=> b!303235 m!314631))

(declare-fun m!314633 () Bool)

(assert (=> b!303239 m!314633))

(assert (=> b!303239 m!314633))

(declare-fun m!314635 () Bool)

(assert (=> b!303239 m!314635))

(declare-fun m!314637 () Bool)

(assert (=> b!303242 m!314637))

(declare-fun m!314639 () Bool)

(assert (=> b!303238 m!314639))

(check-sat (not b!303239) (not b!303241) (not b!303237) (not b!303242) (not b!303238) (not b!303235) (not start!30292))
(check-sat)
