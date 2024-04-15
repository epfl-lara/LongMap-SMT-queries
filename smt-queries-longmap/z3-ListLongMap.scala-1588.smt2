; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30138 () Bool)

(assert start!30138)

(declare-fun b!301677 () Bool)

(declare-fun res!159438 () Bool)

(declare-fun e!190282 () Bool)

(assert (=> b!301677 (=> (not res!159438) (not e!190282))))

(declare-datatypes ((array!15293 0))(
  ( (array!15294 (arr!7236 (Array (_ BitVec 32) (_ BitVec 64))) (size!7589 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15293)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15293 (_ BitVec 32)) Bool)

(assert (=> b!301677 (= res!159438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301678 () Bool)

(declare-fun res!159432 () Bool)

(assert (=> b!301678 (=> (not res!159432) (not e!190282))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301678 (= res!159432 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301679 () Bool)

(declare-fun res!159437 () Bool)

(assert (=> b!301679 (=> (not res!159437) (not e!190282))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2375 0))(
  ( (MissingZero!2375 (index!11676 (_ BitVec 32))) (Found!2375 (index!11677 (_ BitVec 32))) (Intermediate!2375 (undefined!3187 Bool) (index!11678 (_ BitVec 32)) (x!29965 (_ BitVec 32))) (Undefined!2375) (MissingVacant!2375 (index!11679 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15293 (_ BitVec 32)) SeekEntryResult!2375)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!301679 (= res!159437 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2375 false resIndex!52 resX!52)))))

(declare-fun b!301680 () Bool)

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!301680 (= e!190282 (and (= (select (arr!7236 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7589 a!3293)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun b!301681 () Bool)

(declare-fun res!159435 () Bool)

(assert (=> b!301681 (=> (not res!159435) (not e!190282))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15293 (_ BitVec 32)) SeekEntryResult!2375)

(assert (=> b!301681 (= res!159435 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2375 i!1240)))))

(declare-fun res!159434 () Bool)

(assert (=> start!30138 (=> (not res!159434) (not e!190282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30138 (= res!159434 (validMask!0 mask!3709))))

(assert (=> start!30138 e!190282))

(declare-fun array_inv!5208 (array!15293) Bool)

(assert (=> start!30138 (array_inv!5208 a!3293)))

(assert (=> start!30138 true))

(declare-fun b!301682 () Bool)

(declare-fun res!159433 () Bool)

(assert (=> b!301682 (=> (not res!159433) (not e!190282))))

(assert (=> b!301682 (= res!159433 (and (= (size!7589 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7589 a!3293))))))

(declare-fun b!301683 () Bool)

(declare-fun res!159436 () Bool)

(assert (=> b!301683 (=> (not res!159436) (not e!190282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301683 (= res!159436 (validKeyInArray!0 k0!2441))))

(assert (= (and start!30138 res!159434) b!301682))

(assert (= (and b!301682 res!159433) b!301683))

(assert (= (and b!301683 res!159436) b!301678))

(assert (= (and b!301678 res!159432) b!301681))

(assert (= (and b!301681 res!159435) b!301677))

(assert (= (and b!301677 res!159438) b!301679))

(assert (= (and b!301679 res!159437) b!301680))

(declare-fun m!312883 () Bool)

(assert (=> start!30138 m!312883))

(declare-fun m!312885 () Bool)

(assert (=> start!30138 m!312885))

(declare-fun m!312887 () Bool)

(assert (=> b!301679 m!312887))

(assert (=> b!301679 m!312887))

(declare-fun m!312889 () Bool)

(assert (=> b!301679 m!312889))

(declare-fun m!312891 () Bool)

(assert (=> b!301678 m!312891))

(declare-fun m!312893 () Bool)

(assert (=> b!301681 m!312893))

(declare-fun m!312895 () Bool)

(assert (=> b!301680 m!312895))

(declare-fun m!312897 () Bool)

(assert (=> b!301683 m!312897))

(declare-fun m!312899 () Bool)

(assert (=> b!301677 m!312899))

(check-sat (not b!301681) (not start!30138) (not b!301677) (not b!301683) (not b!301678) (not b!301679))
(check-sat)
