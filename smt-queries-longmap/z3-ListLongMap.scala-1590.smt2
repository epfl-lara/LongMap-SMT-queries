; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30150 () Bool)

(assert start!30150)

(declare-fun b!302016 () Bool)

(declare-fun res!159680 () Bool)

(declare-fun e!190461 () Bool)

(assert (=> b!302016 (=> (not res!159680) (not e!190461))))

(declare-datatypes ((array!15314 0))(
  ( (array!15315 (arr!7246 (Array (_ BitVec 32) (_ BitVec 64))) (size!7598 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15314)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15314 (_ BitVec 32)) Bool)

(assert (=> b!302016 (= res!159680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!159675 () Bool)

(assert (=> start!30150 (=> (not res!159675) (not e!190461))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30150 (= res!159675 (validMask!0 mask!3709))))

(assert (=> start!30150 e!190461))

(declare-fun array_inv!5196 (array!15314) Bool)

(assert (=> start!30150 (array_inv!5196 a!3293)))

(assert (=> start!30150 true))

(declare-fun b!302017 () Bool)

(declare-fun res!159678 () Bool)

(assert (=> b!302017 (=> (not res!159678) (not e!190461))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!302017 (= res!159678 (validKeyInArray!0 k0!2441))))

(declare-fun b!302018 () Bool)

(declare-fun res!159677 () Bool)

(assert (=> b!302018 (=> (not res!159677) (not e!190461))))

(declare-fun arrayContainsKey!0 (array!15314 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!302018 (= res!159677 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun b!302019 () Bool)

(assert (=> b!302019 (= e!190461 (and (= (select (arr!7246 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7598 a!3293)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!302020 () Bool)

(declare-fun res!159681 () Bool)

(assert (=> b!302020 (=> (not res!159681) (not e!190461))))

(declare-datatypes ((SeekEntryResult!2351 0))(
  ( (MissingZero!2351 (index!11580 (_ BitVec 32))) (Found!2351 (index!11581 (_ BitVec 32))) (Intermediate!2351 (undefined!3163 Bool) (index!11582 (_ BitVec 32)) (x!29959 (_ BitVec 32))) (Undefined!2351) (MissingVacant!2351 (index!11583 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15314 (_ BitVec 32)) SeekEntryResult!2351)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!302020 (= res!159681 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2351 false resIndex!52 resX!52)))))

(declare-fun b!302021 () Bool)

(declare-fun res!159679 () Bool)

(assert (=> b!302021 (=> (not res!159679) (not e!190461))))

(assert (=> b!302021 (= res!159679 (and (= (size!7598 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7598 a!3293))))))

(declare-fun b!302022 () Bool)

(declare-fun res!159676 () Bool)

(assert (=> b!302022 (=> (not res!159676) (not e!190461))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15314 (_ BitVec 32)) SeekEntryResult!2351)

(assert (=> b!302022 (= res!159676 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2351 i!1240)))))

(assert (= (and start!30150 res!159675) b!302021))

(assert (= (and b!302021 res!159679) b!302017))

(assert (= (and b!302017 res!159678) b!302018))

(assert (= (and b!302018 res!159677) b!302022))

(assert (= (and b!302022 res!159676) b!302016))

(assert (= (and b!302016 res!159680) b!302020))

(assert (= (and b!302020 res!159681) b!302019))

(declare-fun m!313825 () Bool)

(assert (=> b!302017 m!313825))

(declare-fun m!313827 () Bool)

(assert (=> b!302016 m!313827))

(declare-fun m!313829 () Bool)

(assert (=> b!302018 m!313829))

(declare-fun m!313831 () Bool)

(assert (=> b!302020 m!313831))

(assert (=> b!302020 m!313831))

(declare-fun m!313833 () Bool)

(assert (=> b!302020 m!313833))

(declare-fun m!313835 () Bool)

(assert (=> b!302019 m!313835))

(declare-fun m!313837 () Bool)

(assert (=> start!30150 m!313837))

(declare-fun m!313839 () Bool)

(assert (=> start!30150 m!313839))

(declare-fun m!313841 () Bool)

(assert (=> b!302022 m!313841))

(check-sat (not b!302017) (not b!302016) (not start!30150) (not b!302020) (not b!302018) (not b!302022))
(check-sat)
