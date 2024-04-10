; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30076 () Bool)

(assert start!30076)

(declare-fun b!301536 () Bool)

(declare-fun res!159214 () Bool)

(declare-fun e!190284 () Bool)

(assert (=> b!301536 (=> (not res!159214) (not e!190284))))

(declare-datatypes ((array!15266 0))(
  ( (array!15267 (arr!7224 (Array (_ BitVec 32) (_ BitVec 64))) (size!7576 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15266)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15266 (_ BitVec 32)) Bool)

(assert (=> b!301536 (= res!159214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301537 () Bool)

(declare-fun res!159217 () Bool)

(assert (=> b!301537 (=> (not res!159217) (not e!190284))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301537 (= res!159217 (and (= (size!7576 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7576 a!3293))))))

(declare-fun b!301538 () Bool)

(declare-fun res!159215 () Bool)

(assert (=> b!301538 (=> (not res!159215) (not e!190284))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15266 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301538 (= res!159215 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301539 () Bool)

(declare-fun res!159219 () Bool)

(assert (=> b!301539 (=> (not res!159219) (not e!190284))))

(declare-datatypes ((SeekEntryResult!2364 0))(
  ( (MissingZero!2364 (index!11632 (_ BitVec 32))) (Found!2364 (index!11633 (_ BitVec 32))) (Intermediate!2364 (undefined!3176 Bool) (index!11634 (_ BitVec 32)) (x!29908 (_ BitVec 32))) (Undefined!2364) (MissingVacant!2364 (index!11635 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15266 (_ BitVec 32)) SeekEntryResult!2364)

(assert (=> b!301539 (= res!159219 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2364 i!1240)))))

(declare-fun res!159218 () Bool)

(assert (=> start!30076 (=> (not res!159218) (not e!190284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30076 (= res!159218 (validMask!0 mask!3709))))

(assert (=> start!30076 e!190284))

(assert (=> start!30076 true))

(declare-fun array_inv!5187 (array!15266) Bool)

(assert (=> start!30076 (array_inv!5187 a!3293)))

(declare-fun b!301540 () Bool)

(assert (=> b!301540 (= e!190284 (bvslt mask!3709 #b00000000000000000000000000000000))))

(declare-fun lt!149859 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301540 (= lt!149859 (toIndex!0 k0!2441 mask!3709))))

(declare-fun b!301541 () Bool)

(declare-fun res!159216 () Bool)

(assert (=> b!301541 (=> (not res!159216) (not e!190284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301541 (= res!159216 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30076 res!159218) b!301537))

(assert (= (and b!301537 res!159217) b!301541))

(assert (= (and b!301541 res!159216) b!301538))

(assert (= (and b!301538 res!159215) b!301539))

(assert (= (and b!301539 res!159219) b!301536))

(assert (= (and b!301536 res!159214) b!301540))

(declare-fun m!313291 () Bool)

(assert (=> b!301540 m!313291))

(declare-fun m!313293 () Bool)

(assert (=> b!301541 m!313293))

(declare-fun m!313295 () Bool)

(assert (=> start!30076 m!313295))

(declare-fun m!313297 () Bool)

(assert (=> start!30076 m!313297))

(declare-fun m!313299 () Bool)

(assert (=> b!301536 m!313299))

(declare-fun m!313301 () Bool)

(assert (=> b!301539 m!313301))

(declare-fun m!313303 () Bool)

(assert (=> b!301538 m!313303))

(check-sat (not b!301540) (not b!301538) (not b!301539) (not start!30076) (not b!301536) (not b!301541))
(check-sat)
