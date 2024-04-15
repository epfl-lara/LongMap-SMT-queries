; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30136 () Bool)

(assert start!30136)

(declare-fun res!159415 () Bool)

(declare-fun e!190277 () Bool)

(assert (=> start!30136 (=> (not res!159415) (not e!190277))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30136 (= res!159415 (validMask!0 mask!3709))))

(assert (=> start!30136 e!190277))

(assert (=> start!30136 true))

(declare-datatypes ((array!15291 0))(
  ( (array!15292 (arr!7235 (Array (_ BitVec 32) (_ BitVec 64))) (size!7588 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15291)

(declare-fun array_inv!5207 (array!15291) Bool)

(assert (=> start!30136 (array_inv!5207 a!3293)))

(declare-fun b!301657 () Bool)

(declare-fun res!159416 () Bool)

(assert (=> b!301657 (=> (not res!159416) (not e!190277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15291 (_ BitVec 32)) Bool)

(assert (=> b!301657 (= res!159416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301658 () Bool)

(declare-fun res!159412 () Bool)

(assert (=> b!301658 (=> (not res!159412) (not e!190277))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301658 (= res!159412 (and (= (size!7588 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7588 a!3293))))))

(declare-fun b!301659 () Bool)

(declare-fun res!159417 () Bool)

(assert (=> b!301659 (=> (not res!159417) (not e!190277))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301659 (= res!159417 (validKeyInArray!0 k!2441))))

(declare-fun b!301660 () Bool)

(declare-fun res!159413 () Bool)

(assert (=> b!301660 (=> (not res!159413) (not e!190277))))

(declare-datatypes ((SeekEntryResult!2374 0))(
  ( (MissingZero!2374 (index!11672 (_ BitVec 32))) (Found!2374 (index!11673 (_ BitVec 32))) (Intermediate!2374 (undefined!3186 Bool) (index!11674 (_ BitVec 32)) (x!29956 (_ BitVec 32))) (Undefined!2374) (MissingVacant!2374 (index!11675 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15291 (_ BitVec 32)) SeekEntryResult!2374)

(assert (=> b!301660 (= res!159413 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2374 i!1240)))))

(declare-fun b!301661 () Bool)

(assert (=> b!301661 (= e!190277 false)))

(declare-fun lt!149744 () SeekEntryResult!2374)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15291 (_ BitVec 32)) SeekEntryResult!2374)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301661 (= lt!149744 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!301662 () Bool)

(declare-fun res!159414 () Bool)

(assert (=> b!301662 (=> (not res!159414) (not e!190277))))

(declare-fun arrayContainsKey!0 (array!15291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301662 (= res!159414 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30136 res!159415) b!301658))

(assert (= (and b!301658 res!159412) b!301659))

(assert (= (and b!301659 res!159417) b!301662))

(assert (= (and b!301662 res!159414) b!301660))

(assert (= (and b!301660 res!159413) b!301657))

(assert (= (and b!301657 res!159416) b!301661))

(declare-fun m!312867 () Bool)

(assert (=> b!301662 m!312867))

(declare-fun m!312869 () Bool)

(assert (=> b!301661 m!312869))

(assert (=> b!301661 m!312869))

(declare-fun m!312871 () Bool)

(assert (=> b!301661 m!312871))

(declare-fun m!312873 () Bool)

(assert (=> b!301659 m!312873))

(declare-fun m!312875 () Bool)

(assert (=> start!30136 m!312875))

(declare-fun m!312877 () Bool)

(assert (=> start!30136 m!312877))

(declare-fun m!312879 () Bool)

(assert (=> b!301660 m!312879))

(declare-fun m!312881 () Bool)

(assert (=> b!301657 m!312881))

(push 1)

(assert (not start!30136))

(assert (not b!301662))

(assert (not b!301660))

(assert (not b!301659))

(assert (not b!301661))

(assert (not b!301657))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

