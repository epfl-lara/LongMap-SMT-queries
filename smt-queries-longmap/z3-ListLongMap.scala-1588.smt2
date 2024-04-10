; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30154 () Bool)

(assert start!30154)

(declare-fun b!301973 () Bool)

(declare-fun res!159588 () Bool)

(declare-fun e!190464 () Bool)

(assert (=> b!301973 (=> (not res!159588) (not e!190464))))

(declare-datatypes ((array!15305 0))(
  ( (array!15306 (arr!7242 (Array (_ BitVec 32) (_ BitVec 64))) (size!7594 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15305)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15305 (_ BitVec 32)) Bool)

(assert (=> b!301973 (= res!159588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301974 () Bool)

(declare-fun res!159585 () Bool)

(assert (=> b!301974 (=> (not res!159585) (not e!190464))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2382 0))(
  ( (MissingZero!2382 (index!11704 (_ BitVec 32))) (Found!2382 (index!11705 (_ BitVec 32))) (Intermediate!2382 (undefined!3194 Bool) (index!11706 (_ BitVec 32)) (x!29977 (_ BitVec 32))) (Undefined!2382) (MissingVacant!2382 (index!11707 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15305 (_ BitVec 32)) SeekEntryResult!2382)

(assert (=> b!301974 (= res!159585 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2382 i!1240)))))

(declare-fun res!159584 () Bool)

(assert (=> start!30154 (=> (not res!159584) (not e!190464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30154 (= res!159584 (validMask!0 mask!3709))))

(assert (=> start!30154 e!190464))

(declare-fun array_inv!5205 (array!15305) Bool)

(assert (=> start!30154 (array_inv!5205 a!3293)))

(assert (=> start!30154 true))

(declare-fun b!301975 () Bool)

(declare-fun res!159582 () Bool)

(assert (=> b!301975 (=> (not res!159582) (not e!190464))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301975 (= res!159582 (validKeyInArray!0 k0!2441))))

(declare-fun b!301976 () Bool)

(declare-fun res!159587 () Bool)

(assert (=> b!301976 (=> (not res!159587) (not e!190464))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15305 (_ BitVec 32)) SeekEntryResult!2382)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301976 (= res!159587 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2382 false resIndex!52 resX!52)))))

(declare-fun b!301977 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!301977 (= e!190464 (and (= (select (arr!7242 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7594 a!3293)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun b!301978 () Bool)

(declare-fun res!159583 () Bool)

(assert (=> b!301978 (=> (not res!159583) (not e!190464))))

(assert (=> b!301978 (= res!159583 (and (= (size!7594 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7594 a!3293))))))

(declare-fun b!301979 () Bool)

(declare-fun res!159586 () Bool)

(assert (=> b!301979 (=> (not res!159586) (not e!190464))))

(declare-fun arrayContainsKey!0 (array!15305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301979 (= res!159586 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30154 res!159584) b!301978))

(assert (= (and b!301978 res!159583) b!301975))

(assert (= (and b!301975 res!159582) b!301979))

(assert (= (and b!301979 res!159586) b!301974))

(assert (= (and b!301974 res!159585) b!301973))

(assert (= (and b!301973 res!159588) b!301976))

(assert (= (and b!301976 res!159587) b!301977))

(declare-fun m!313631 () Bool)

(assert (=> b!301976 m!313631))

(assert (=> b!301976 m!313631))

(declare-fun m!313633 () Bool)

(assert (=> b!301976 m!313633))

(declare-fun m!313635 () Bool)

(assert (=> b!301975 m!313635))

(declare-fun m!313637 () Bool)

(assert (=> start!30154 m!313637))

(declare-fun m!313639 () Bool)

(assert (=> start!30154 m!313639))

(declare-fun m!313641 () Bool)

(assert (=> b!301977 m!313641))

(declare-fun m!313643 () Bool)

(assert (=> b!301979 m!313643))

(declare-fun m!313645 () Bool)

(assert (=> b!301974 m!313645))

(declare-fun m!313647 () Bool)

(assert (=> b!301973 m!313647))

(check-sat (not b!301973) (not b!301976) (not b!301975) (not start!30154) (not b!301979) (not b!301974))
(check-sat)
