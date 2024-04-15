; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30996 () Bool)

(assert start!30996)

(declare-fun b!311412 () Bool)

(declare-fun e!194268 () Bool)

(declare-fun e!194267 () Bool)

(assert (=> b!311412 (= e!194268 e!194267)))

(declare-fun res!168020 () Bool)

(assert (=> b!311412 (=> (not res!168020) (not e!194267))))

(declare-datatypes ((array!15902 0))(
  ( (array!15903 (arr!7533 (Array (_ BitVec 32) (_ BitVec 64))) (size!7886 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15902)

(declare-datatypes ((SeekEntryResult!2672 0))(
  ( (MissingZero!2672 (index!12864 (_ BitVec 32))) (Found!2672 (index!12865 (_ BitVec 32))) (Intermediate!2672 (undefined!3484 Bool) (index!12866 (_ BitVec 32)) (x!31096 (_ BitVec 32))) (Undefined!2672) (MissingVacant!2672 (index!12867 (_ BitVec 32))) )
))
(declare-fun lt!152219 () SeekEntryResult!2672)

(declare-fun lt!152221 () SeekEntryResult!2672)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!311412 (= res!168020 (and (= lt!152221 lt!152219) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7533 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15902 (_ BitVec 32)) SeekEntryResult!2672)

(assert (=> b!311412 (= lt!152221 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311413 () Bool)

(declare-fun res!168019 () Bool)

(declare-fun e!194269 () Bool)

(assert (=> b!311413 (=> (not res!168019) (not e!194269))))

(declare-fun arrayContainsKey!0 (array!15902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311413 (= res!168019 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311414 () Bool)

(declare-fun res!168013 () Bool)

(assert (=> b!311414 (=> (not res!168013) (not e!194269))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15902 (_ BitVec 32)) SeekEntryResult!2672)

(assert (=> b!311414 (= res!168013 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2672 i!1240)))))

(declare-fun b!311415 () Bool)

(declare-fun res!168015 () Bool)

(assert (=> b!311415 (=> (not res!168015) (not e!194269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15902 (_ BitVec 32)) Bool)

(assert (=> b!311415 (= res!168015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!168018 () Bool)

(assert (=> start!30996 (=> (not res!168018) (not e!194269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30996 (= res!168018 (validMask!0 mask!3709))))

(assert (=> start!30996 e!194269))

(declare-fun array_inv!5505 (array!15902) Bool)

(assert (=> start!30996 (array_inv!5505 a!3293)))

(assert (=> start!30996 true))

(declare-fun b!311416 () Bool)

(declare-fun res!168021 () Bool)

(assert (=> b!311416 (=> (not res!168021) (not e!194269))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311416 (= res!168021 (validKeyInArray!0 k0!2441))))

(declare-fun b!311417 () Bool)

(declare-fun res!168017 () Bool)

(assert (=> b!311417 (=> (not res!168017) (not e!194268))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!311417 (= res!168017 (and (= (select (arr!7533 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7886 a!3293))))))

(declare-fun b!311418 () Bool)

(assert (=> b!311418 (= e!194269 e!194268)))

(declare-fun res!168016 () Bool)

(assert (=> b!311418 (=> (not res!168016) (not e!194268))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311418 (= res!168016 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152219))))

(assert (=> b!311418 (= lt!152219 (Intermediate!2672 false resIndex!52 resX!52))))

(declare-fun b!311419 () Bool)

(assert (=> b!311419 (= e!194267 (not true))))

(declare-fun e!194270 () Bool)

(assert (=> b!311419 e!194270))

(declare-fun res!168014 () Bool)

(assert (=> b!311419 (=> (not res!168014) (not e!194270))))

(declare-fun lt!152220 () (_ BitVec 32))

(assert (=> b!311419 (= res!168014 (= lt!152221 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152220 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311419 (= lt!152220 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun lt!152222 () array!15902)

(declare-fun b!311420 () Bool)

(assert (=> b!311420 (= e!194270 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152222 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152220 k0!2441 lt!152222 mask!3709)))))

(assert (=> b!311420 (= lt!152222 (array!15903 (store (arr!7533 a!3293) i!1240 k0!2441) (size!7886 a!3293)))))

(declare-fun b!311421 () Bool)

(declare-fun res!168012 () Bool)

(assert (=> b!311421 (=> (not res!168012) (not e!194269))))

(assert (=> b!311421 (= res!168012 (and (= (size!7886 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7886 a!3293))))))

(assert (= (and start!30996 res!168018) b!311421))

(assert (= (and b!311421 res!168012) b!311416))

(assert (= (and b!311416 res!168021) b!311413))

(assert (= (and b!311413 res!168019) b!311414))

(assert (= (and b!311414 res!168013) b!311415))

(assert (= (and b!311415 res!168015) b!311418))

(assert (= (and b!311418 res!168016) b!311417))

(assert (= (and b!311417 res!168017) b!311412))

(assert (= (and b!311412 res!168020) b!311419))

(assert (= (and b!311419 res!168014) b!311420))

(declare-fun m!320947 () Bool)

(assert (=> b!311420 m!320947))

(declare-fun m!320949 () Bool)

(assert (=> b!311420 m!320949))

(declare-fun m!320951 () Bool)

(assert (=> b!311420 m!320951))

(declare-fun m!320953 () Bool)

(assert (=> b!311415 m!320953))

(declare-fun m!320955 () Bool)

(assert (=> start!30996 m!320955))

(declare-fun m!320957 () Bool)

(assert (=> start!30996 m!320957))

(declare-fun m!320959 () Bool)

(assert (=> b!311413 m!320959))

(declare-fun m!320961 () Bool)

(assert (=> b!311414 m!320961))

(declare-fun m!320963 () Bool)

(assert (=> b!311417 m!320963))

(declare-fun m!320965 () Bool)

(assert (=> b!311416 m!320965))

(declare-fun m!320967 () Bool)

(assert (=> b!311418 m!320967))

(assert (=> b!311418 m!320967))

(declare-fun m!320969 () Bool)

(assert (=> b!311418 m!320969))

(declare-fun m!320971 () Bool)

(assert (=> b!311412 m!320971))

(declare-fun m!320973 () Bool)

(assert (=> b!311412 m!320973))

(declare-fun m!320975 () Bool)

(assert (=> b!311419 m!320975))

(declare-fun m!320977 () Bool)

(assert (=> b!311419 m!320977))

(check-sat (not start!30996) (not b!311416) (not b!311419) (not b!311420) (not b!311412) (not b!311418) (not b!311415) (not b!311414) (not b!311413))
(check-sat)
