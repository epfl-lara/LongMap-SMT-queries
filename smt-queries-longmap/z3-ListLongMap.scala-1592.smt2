; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30210 () Bool)

(assert start!30210)

(declare-fun b!302329 () Bool)

(declare-fun res!159868 () Bool)

(declare-fun e!190614 () Bool)

(assert (=> b!302329 (=> (not res!159868) (not e!190614))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302329 (= res!159868 (validKeyInArray!0 k0!2441))))

(declare-fun b!302330 () Bool)

(declare-fun res!159867 () Bool)

(assert (=> b!302330 (=> (not res!159867) (not e!190614))))

(declare-datatypes ((array!15329 0))(
  ( (array!15330 (arr!7252 (Array (_ BitVec 32) (_ BitVec 64))) (size!7604 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15329)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15329 (_ BitVec 32)) Bool)

(assert (=> b!302330 (= res!159867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!159866 () Bool)

(assert (=> start!30210 (=> (not res!159866) (not e!190614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30210 (= res!159866 (validMask!0 mask!3709))))

(assert (=> start!30210 e!190614))

(assert (=> start!30210 true))

(declare-fun array_inv!5202 (array!15329) Bool)

(assert (=> start!30210 (array_inv!5202 a!3293)))

(declare-fun b!302331 () Bool)

(assert (=> b!302331 (= e!190614 false)))

(declare-datatypes ((SeekEntryResult!2357 0))(
  ( (MissingZero!2357 (index!11604 (_ BitVec 32))) (Found!2357 (index!11605 (_ BitVec 32))) (Intermediate!2357 (undefined!3169 Bool) (index!11606 (_ BitVec 32)) (x!29987 (_ BitVec 32))) (Undefined!2357) (MissingVacant!2357 (index!11607 (_ BitVec 32))) )
))
(declare-fun lt!150099 () SeekEntryResult!2357)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15329 (_ BitVec 32)) SeekEntryResult!2357)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302331 (= lt!150099 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!302332 () Bool)

(declare-fun res!159865 () Bool)

(assert (=> b!302332 (=> (not res!159865) (not e!190614))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15329 (_ BitVec 32)) SeekEntryResult!2357)

(assert (=> b!302332 (= res!159865 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2357 i!1240)))))

(declare-fun b!302333 () Bool)

(declare-fun res!159869 () Bool)

(assert (=> b!302333 (=> (not res!159869) (not e!190614))))

(assert (=> b!302333 (= res!159869 (and (= (size!7604 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7604 a!3293))))))

(declare-fun b!302334 () Bool)

(declare-fun res!159870 () Bool)

(assert (=> b!302334 (=> (not res!159870) (not e!190614))))

(declare-fun arrayContainsKey!0 (array!15329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302334 (= res!159870 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30210 res!159866) b!302333))

(assert (= (and b!302333 res!159869) b!302329))

(assert (= (and b!302329 res!159868) b!302334))

(assert (= (and b!302334 res!159870) b!302332))

(assert (= (and b!302332 res!159865) b!302330))

(assert (= (and b!302330 res!159867) b!302331))

(declare-fun m!314029 () Bool)

(assert (=> start!30210 m!314029))

(declare-fun m!314031 () Bool)

(assert (=> start!30210 m!314031))

(declare-fun m!314033 () Bool)

(assert (=> b!302329 m!314033))

(declare-fun m!314035 () Bool)

(assert (=> b!302332 m!314035))

(declare-fun m!314037 () Bool)

(assert (=> b!302331 m!314037))

(assert (=> b!302331 m!314037))

(declare-fun m!314039 () Bool)

(assert (=> b!302331 m!314039))

(declare-fun m!314041 () Bool)

(assert (=> b!302330 m!314041))

(declare-fun m!314043 () Bool)

(assert (=> b!302334 m!314043))

(check-sat (not b!302331) (not b!302332) (not b!302330) (not b!302334) (not start!30210) (not b!302329))
(check-sat)
