; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30420 () Bool)

(assert start!30420)

(declare-fun b!304399 () Bool)

(declare-fun res!161891 () Bool)

(declare-fun e!191264 () Bool)

(assert (=> b!304399 (=> (not res!161891) (not e!191264))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!304399 (= res!161891 (validKeyInArray!0 k0!2441))))

(declare-fun b!304400 () Bool)

(declare-fun e!191267 () Bool)

(assert (=> b!304400 (= e!191264 e!191267)))

(declare-fun res!161890 () Bool)

(assert (=> b!304400 (=> (not res!161890) (not e!191267))))

(declare-datatypes ((array!15479 0))(
  ( (array!15480 (arr!7326 (Array (_ BitVec 32) (_ BitVec 64))) (size!7679 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15479)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2465 0))(
  ( (MissingZero!2465 (index!12036 (_ BitVec 32))) (Found!2465 (index!12037 (_ BitVec 32))) (Intermediate!2465 (undefined!3277 Bool) (index!12038 (_ BitVec 32)) (x!30310 (_ BitVec 32))) (Undefined!2465) (MissingVacant!2465 (index!12039 (_ BitVec 32))) )
))
(declare-fun lt!150268 () SeekEntryResult!2465)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15479 (_ BitVec 32)) SeekEntryResult!2465)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304400 (= res!161890 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150268))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!304400 (= lt!150268 (Intermediate!2465 false resIndex!52 resX!52))))

(declare-fun res!161892 () Bool)

(assert (=> start!30420 (=> (not res!161892) (not e!191264))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30420 (= res!161892 (validMask!0 mask!3709))))

(assert (=> start!30420 e!191264))

(declare-fun array_inv!5298 (array!15479) Bool)

(assert (=> start!30420 (array_inv!5298 a!3293)))

(assert (=> start!30420 true))

(declare-fun b!304401 () Bool)

(declare-fun res!161895 () Bool)

(assert (=> b!304401 (=> (not res!161895) (not e!191264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15479 (_ BitVec 32)) Bool)

(assert (=> b!304401 (= res!161895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!304402 () Bool)

(declare-fun res!161896 () Bool)

(assert (=> b!304402 (=> (not res!161896) (not e!191264))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15479 (_ BitVec 32)) SeekEntryResult!2465)

(assert (=> b!304402 (= res!161896 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2465 i!1240)))))

(declare-fun e!191266 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun b!304403 () Bool)

(assert (=> b!304403 (= e!191266 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(declare-fun lt!150269 () SeekEntryResult!2465)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!304403 (= lt!150269 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!304404 () Bool)

(declare-fun res!161893 () Bool)

(assert (=> b!304404 (=> (not res!161893) (not e!191267))))

(assert (=> b!304404 (= res!161893 (and (= (select (arr!7326 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7679 a!3293))))))

(declare-fun b!304405 () Bool)

(declare-fun res!161898 () Bool)

(assert (=> b!304405 (=> (not res!161898) (not e!191264))))

(assert (=> b!304405 (= res!161898 (and (= (size!7679 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7679 a!3293))))))

(declare-fun b!304406 () Bool)

(declare-fun res!161894 () Bool)

(assert (=> b!304406 (=> (not res!161894) (not e!191264))))

(declare-fun arrayContainsKey!0 (array!15479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!304406 (= res!161894 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!304407 () Bool)

(assert (=> b!304407 (= e!191267 e!191266)))

(declare-fun res!161897 () Bool)

(assert (=> b!304407 (=> (not res!161897) (not e!191266))))

(assert (=> b!304407 (= res!161897 (and (= lt!150269 lt!150268) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7326 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7326 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7326 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!304407 (= lt!150269 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(assert (= (and start!30420 res!161892) b!304405))

(assert (= (and b!304405 res!161898) b!304399))

(assert (= (and b!304399 res!161891) b!304406))

(assert (= (and b!304406 res!161894) b!304402))

(assert (= (and b!304402 res!161896) b!304401))

(assert (= (and b!304401 res!161895) b!304400))

(assert (= (and b!304400 res!161890) b!304404))

(assert (= (and b!304404 res!161893) b!304407))

(assert (= (and b!304407 res!161897) b!304403))

(declare-fun m!315031 () Bool)

(assert (=> b!304400 m!315031))

(assert (=> b!304400 m!315031))

(declare-fun m!315033 () Bool)

(assert (=> b!304400 m!315033))

(declare-fun m!315035 () Bool)

(assert (=> b!304401 m!315035))

(declare-fun m!315037 () Bool)

(assert (=> start!30420 m!315037))

(declare-fun m!315039 () Bool)

(assert (=> start!30420 m!315039))

(declare-fun m!315041 () Bool)

(assert (=> b!304407 m!315041))

(declare-fun m!315043 () Bool)

(assert (=> b!304407 m!315043))

(declare-fun m!315045 () Bool)

(assert (=> b!304403 m!315045))

(assert (=> b!304403 m!315045))

(declare-fun m!315047 () Bool)

(assert (=> b!304403 m!315047))

(declare-fun m!315049 () Bool)

(assert (=> b!304404 m!315049))

(declare-fun m!315051 () Bool)

(assert (=> b!304406 m!315051))

(declare-fun m!315053 () Bool)

(assert (=> b!304399 m!315053))

(declare-fun m!315055 () Bool)

(assert (=> b!304402 m!315055))

(check-sat (not b!304399) (not b!304401) (not b!304407) (not start!30420) (not b!304403) (not b!304400) (not b!304406) (not b!304402))
(check-sat)
