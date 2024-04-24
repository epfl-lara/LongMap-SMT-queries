; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30134 () Bool)

(assert start!30134)

(declare-fun b!301861 () Bool)

(declare-fun res!159525 () Bool)

(declare-fun e!190412 () Bool)

(assert (=> b!301861 (=> (not res!159525) (not e!190412))))

(declare-datatypes ((array!15298 0))(
  ( (array!15299 (arr!7238 (Array (_ BitVec 32) (_ BitVec 64))) (size!7590 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15298)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2343 0))(
  ( (MissingZero!2343 (index!11548 (_ BitVec 32))) (Found!2343 (index!11549 (_ BitVec 32))) (Intermediate!2343 (undefined!3155 Bool) (index!11550 (_ BitVec 32)) (x!29927 (_ BitVec 32))) (Undefined!2343) (MissingVacant!2343 (index!11551 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15298 (_ BitVec 32)) SeekEntryResult!2343)

(assert (=> b!301861 (= res!159525 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2343 i!1240)))))

(declare-fun b!301862 () Bool)

(assert (=> b!301862 (= e!190412 false)))

(declare-fun lt!149994 () SeekEntryResult!2343)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15298 (_ BitVec 32)) SeekEntryResult!2343)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301862 (= lt!149994 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!301863 () Bool)

(declare-fun res!159522 () Bool)

(assert (=> b!301863 (=> (not res!159522) (not e!190412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15298 (_ BitVec 32)) Bool)

(assert (=> b!301863 (= res!159522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301864 () Bool)

(declare-fun res!159524 () Bool)

(assert (=> b!301864 (=> (not res!159524) (not e!190412))))

(declare-fun arrayContainsKey!0 (array!15298 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301864 (= res!159524 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!159523 () Bool)

(assert (=> start!30134 (=> (not res!159523) (not e!190412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30134 (= res!159523 (validMask!0 mask!3709))))

(assert (=> start!30134 e!190412))

(assert (=> start!30134 true))

(declare-fun array_inv!5188 (array!15298) Bool)

(assert (=> start!30134 (array_inv!5188 a!3293)))

(declare-fun b!301865 () Bool)

(declare-fun res!159521 () Bool)

(assert (=> b!301865 (=> (not res!159521) (not e!190412))))

(assert (=> b!301865 (= res!159521 (and (= (size!7590 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7590 a!3293))))))

(declare-fun b!301866 () Bool)

(declare-fun res!159520 () Bool)

(assert (=> b!301866 (=> (not res!159520) (not e!190412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301866 (= res!159520 (validKeyInArray!0 k!2441))))

(assert (= (and start!30134 res!159523) b!301865))

(assert (= (and b!301865 res!159521) b!301866))

(assert (= (and b!301866 res!159520) b!301864))

(assert (= (and b!301864 res!159524) b!301861))

(assert (= (and b!301861 res!159525) b!301863))

(assert (= (and b!301863 res!159522) b!301862))

(declare-fun m!313691 () Bool)

(assert (=> start!30134 m!313691))

(declare-fun m!313693 () Bool)

(assert (=> start!30134 m!313693))

(declare-fun m!313695 () Bool)

(assert (=> b!301864 m!313695))

(declare-fun m!313697 () Bool)

(assert (=> b!301866 m!313697))

(declare-fun m!313699 () Bool)

(assert (=> b!301863 m!313699))

(declare-fun m!313701 () Bool)

(assert (=> b!301861 m!313701))

(declare-fun m!313703 () Bool)

(assert (=> b!301862 m!313703))

(assert (=> b!301862 m!313703))

(declare-fun m!313705 () Bool)

(assert (=> b!301862 m!313705))

(push 1)

(assert (not b!301862))

(assert (not b!301863))

(assert (not b!301864))

(assert (not b!301861))

(assert (not b!301866))

(assert (not start!30134))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

