; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30126 () Bool)

(assert start!30126)

(declare-fun b!301789 () Bool)

(declare-fun res!159452 () Bool)

(declare-fun e!190389 () Bool)

(assert (=> b!301789 (=> (not res!159452) (not e!190389))))

(declare-datatypes ((array!15290 0))(
  ( (array!15291 (arr!7234 (Array (_ BitVec 32) (_ BitVec 64))) (size!7586 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15290)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301789 (= res!159452 (and (= (size!7586 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7586 a!3293))))))

(declare-fun b!301790 () Bool)

(declare-fun res!159451 () Bool)

(assert (=> b!301790 (=> (not res!159451) (not e!190389))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15290 (_ BitVec 32)) Bool)

(assert (=> b!301790 (= res!159451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301791 () Bool)

(declare-fun res!159448 () Bool)

(assert (=> b!301791 (=> (not res!159448) (not e!190389))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301791 (= res!159448 (validKeyInArray!0 k0!2441))))

(declare-fun b!301792 () Bool)

(assert (=> b!301792 (= e!190389 false)))

(declare-fun lt!149982 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301792 (= lt!149982 (toIndex!0 k0!2441 mask!3709))))

(declare-fun b!301793 () Bool)

(declare-fun res!159450 () Bool)

(assert (=> b!301793 (=> (not res!159450) (not e!190389))))

(declare-fun arrayContainsKey!0 (array!15290 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301793 (= res!159450 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!159449 () Bool)

(assert (=> start!30126 (=> (not res!159449) (not e!190389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30126 (= res!159449 (validMask!0 mask!3709))))

(assert (=> start!30126 e!190389))

(assert (=> start!30126 true))

(declare-fun array_inv!5184 (array!15290) Bool)

(assert (=> start!30126 (array_inv!5184 a!3293)))

(declare-fun b!301794 () Bool)

(declare-fun res!159453 () Bool)

(assert (=> b!301794 (=> (not res!159453) (not e!190389))))

(declare-datatypes ((SeekEntryResult!2339 0))(
  ( (MissingZero!2339 (index!11532 (_ BitVec 32))) (Found!2339 (index!11533 (_ BitVec 32))) (Intermediate!2339 (undefined!3151 Bool) (index!11534 (_ BitVec 32)) (x!29915 (_ BitVec 32))) (Undefined!2339) (MissingVacant!2339 (index!11535 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15290 (_ BitVec 32)) SeekEntryResult!2339)

(assert (=> b!301794 (= res!159453 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2339 i!1240)))))

(assert (= (and start!30126 res!159449) b!301789))

(assert (= (and b!301789 res!159452) b!301791))

(assert (= (and b!301791 res!159448) b!301793))

(assert (= (and b!301793 res!159450) b!301794))

(assert (= (and b!301794 res!159453) b!301790))

(assert (= (and b!301790 res!159451) b!301792))

(declare-fun m!313633 () Bool)

(assert (=> b!301793 m!313633))

(declare-fun m!313635 () Bool)

(assert (=> b!301794 m!313635))

(declare-fun m!313637 () Bool)

(assert (=> b!301792 m!313637))

(declare-fun m!313639 () Bool)

(assert (=> b!301791 m!313639))

(declare-fun m!313641 () Bool)

(assert (=> start!30126 m!313641))

(declare-fun m!313643 () Bool)

(assert (=> start!30126 m!313643))

(declare-fun m!313645 () Bool)

(assert (=> b!301790 m!313645))

(check-sat (not start!30126) (not b!301790) (not b!301794) (not b!301792) (not b!301793) (not b!301791))
(check-sat)
