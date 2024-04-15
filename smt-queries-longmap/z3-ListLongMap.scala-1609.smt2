; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30312 () Bool)

(assert start!30312)

(declare-fun b!303402 () Bool)

(declare-fun res!161039 () Bool)

(declare-fun e!190861 () Bool)

(assert (=> b!303402 (=> (not res!161039) (not e!190861))))

(declare-datatypes ((array!15422 0))(
  ( (array!15423 (arr!7299 (Array (_ BitVec 32) (_ BitVec 64))) (size!7652 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15422)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!303402 (= res!161039 (and (= (select (arr!7299 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7652 a!3293))))))

(declare-fun b!303403 () Bool)

(declare-fun res!161040 () Bool)

(declare-fun e!190860 () Bool)

(assert (=> b!303403 (=> (not res!161040) (not e!190860))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2438 0))(
  ( (MissingZero!2438 (index!11928 (_ BitVec 32))) (Found!2438 (index!11929 (_ BitVec 32))) (Intermediate!2438 (undefined!3250 Bool) (index!11930 (_ BitVec 32)) (x!30202 (_ BitVec 32))) (Undefined!2438) (MissingVacant!2438 (index!11931 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15422 (_ BitVec 32)) SeekEntryResult!2438)

(assert (=> b!303403 (= res!161040 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2438 i!1240)))))

(declare-fun b!303404 () Bool)

(declare-fun res!161043 () Bool)

(assert (=> b!303404 (=> (not res!161043) (not e!190860))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!303404 (= res!161043 (validKeyInArray!0 k0!2441))))

(declare-fun b!303405 () Bool)

(declare-fun res!161037 () Bool)

(assert (=> b!303405 (=> (not res!161037) (not e!190861))))

(assert (=> b!303405 (= res!161037 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7299 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7299 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7299 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!303406 () Bool)

(declare-fun res!161038 () Bool)

(assert (=> b!303406 (=> (not res!161038) (not e!190860))))

(declare-fun arrayContainsKey!0 (array!15422 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!303406 (= res!161038 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!303407 () Bool)

(assert (=> b!303407 (= e!190860 e!190861)))

(declare-fun res!161035 () Bool)

(assert (=> b!303407 (=> (not res!161035) (not e!190861))))

(declare-fun lt!150002 () SeekEntryResult!2438)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15422 (_ BitVec 32)) SeekEntryResult!2438)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303407 (= res!161035 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150002))))

(assert (=> b!303407 (= lt!150002 (Intermediate!2438 false resIndex!52 resX!52))))

(declare-fun b!303408 () Bool)

(assert (=> b!303408 (= e!190861 false)))

(declare-fun lt!150001 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!303408 (= lt!150001 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!161042 () Bool)

(assert (=> start!30312 (=> (not res!161042) (not e!190860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30312 (= res!161042 (validMask!0 mask!3709))))

(assert (=> start!30312 e!190860))

(declare-fun array_inv!5271 (array!15422) Bool)

(assert (=> start!30312 (array_inv!5271 a!3293)))

(assert (=> start!30312 true))

(declare-fun b!303409 () Bool)

(declare-fun res!161036 () Bool)

(assert (=> b!303409 (=> (not res!161036) (not e!190860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15422 (_ BitVec 32)) Bool)

(assert (=> b!303409 (= res!161036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!303410 () Bool)

(declare-fun res!161041 () Bool)

(assert (=> b!303410 (=> (not res!161041) (not e!190861))))

(assert (=> b!303410 (= res!161041 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150002))))

(declare-fun b!303411 () Bool)

(declare-fun res!161034 () Bool)

(assert (=> b!303411 (=> (not res!161034) (not e!190860))))

(assert (=> b!303411 (= res!161034 (and (= (size!7652 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7652 a!3293))))))

(assert (= (and start!30312 res!161042) b!303411))

(assert (= (and b!303411 res!161034) b!303404))

(assert (= (and b!303404 res!161043) b!303406))

(assert (= (and b!303406 res!161038) b!303403))

(assert (= (and b!303403 res!161040) b!303409))

(assert (= (and b!303409 res!161036) b!303407))

(assert (= (and b!303407 res!161035) b!303402))

(assert (= (and b!303402 res!161039) b!303410))

(assert (= (and b!303410 res!161041) b!303405))

(assert (= (and b!303405 res!161037) b!303408))

(declare-fun m!314251 () Bool)

(assert (=> start!30312 m!314251))

(declare-fun m!314253 () Bool)

(assert (=> start!30312 m!314253))

(declare-fun m!314255 () Bool)

(assert (=> b!303405 m!314255))

(declare-fun m!314257 () Bool)

(assert (=> b!303406 m!314257))

(declare-fun m!314259 () Bool)

(assert (=> b!303409 m!314259))

(declare-fun m!314261 () Bool)

(assert (=> b!303407 m!314261))

(assert (=> b!303407 m!314261))

(declare-fun m!314263 () Bool)

(assert (=> b!303407 m!314263))

(declare-fun m!314265 () Bool)

(assert (=> b!303403 m!314265))

(declare-fun m!314267 () Bool)

(assert (=> b!303404 m!314267))

(declare-fun m!314269 () Bool)

(assert (=> b!303410 m!314269))

(declare-fun m!314271 () Bool)

(assert (=> b!303408 m!314271))

(declare-fun m!314273 () Bool)

(assert (=> b!303402 m!314273))

(check-sat (not b!303407) (not b!303403) (not start!30312) (not b!303408) (not b!303409) (not b!303404) (not b!303406) (not b!303410))
(check-sat)
