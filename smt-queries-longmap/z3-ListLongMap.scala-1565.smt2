; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29812 () Bool)

(assert start!29812)

(declare-fun b!299920 () Bool)

(declare-fun res!158100 () Bool)

(declare-fun e!189399 () Bool)

(assert (=> b!299920 (=> (not res!158100) (not e!189399))))

(declare-datatypes ((array!15142 0))(
  ( (array!15143 (arr!7167 (Array (_ BitVec 32) (_ BitVec 64))) (size!7520 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15142)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15142 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!299920 (= res!158100 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!299921 () Bool)

(declare-fun res!158103 () Bool)

(assert (=> b!299921 (=> (not res!158103) (not e!189399))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!299921 (= res!158103 (and (= (size!7520 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7520 a!3312))))))

(declare-fun b!299922 () Bool)

(declare-fun e!189400 () Bool)

(assert (=> b!299922 (= e!189400 false)))

(declare-fun lt!149076 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2315 0))(
  ( (MissingZero!2315 (index!11436 (_ BitVec 32))) (Found!2315 (index!11437 (_ BitVec 32))) (Intermediate!2315 (undefined!3127 Bool) (index!11438 (_ BitVec 32)) (x!29706 (_ BitVec 32))) (Undefined!2315) (MissingVacant!2315 (index!11439 (_ BitVec 32))) )
))
(declare-fun lt!149075 () SeekEntryResult!2315)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15142 (_ BitVec 32)) SeekEntryResult!2315)

(assert (=> b!299922 (= lt!149075 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149076 k0!2524 (array!15143 (store (arr!7167 a!3312) i!1256 k0!2524) (size!7520 a!3312)) mask!3809))))

(declare-fun lt!149077 () SeekEntryResult!2315)

(assert (=> b!299922 (= lt!149077 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149076 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299922 (= lt!149076 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!158098 () Bool)

(assert (=> start!29812 (=> (not res!158098) (not e!189399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29812 (= res!158098 (validMask!0 mask!3809))))

(assert (=> start!29812 e!189399))

(assert (=> start!29812 true))

(declare-fun array_inv!5139 (array!15142) Bool)

(assert (=> start!29812 (array_inv!5139 a!3312)))

(declare-fun b!299923 () Bool)

(declare-fun res!158099 () Bool)

(assert (=> b!299923 (=> (not res!158099) (not e!189400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15142 (_ BitVec 32)) Bool)

(assert (=> b!299923 (= res!158099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!299924 () Bool)

(declare-fun res!158102 () Bool)

(assert (=> b!299924 (=> (not res!158102) (not e!189399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!299924 (= res!158102 (validKeyInArray!0 k0!2524))))

(declare-fun b!299925 () Bool)

(assert (=> b!299925 (= e!189399 e!189400)))

(declare-fun res!158101 () Bool)

(assert (=> b!299925 (=> (not res!158101) (not e!189400))))

(declare-fun lt!149078 () SeekEntryResult!2315)

(assert (=> b!299925 (= res!158101 (or (= lt!149078 (MissingZero!2315 i!1256)) (= lt!149078 (MissingVacant!2315 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15142 (_ BitVec 32)) SeekEntryResult!2315)

(assert (=> b!299925 (= lt!149078 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!29812 res!158098) b!299921))

(assert (= (and b!299921 res!158103) b!299924))

(assert (= (and b!299924 res!158102) b!299920))

(assert (= (and b!299920 res!158100) b!299925))

(assert (= (and b!299925 res!158101) b!299923))

(assert (= (and b!299923 res!158099) b!299922))

(declare-fun m!311503 () Bool)

(assert (=> b!299925 m!311503))

(declare-fun m!311505 () Bool)

(assert (=> b!299924 m!311505))

(declare-fun m!311507 () Bool)

(assert (=> start!29812 m!311507))

(declare-fun m!311509 () Bool)

(assert (=> start!29812 m!311509))

(declare-fun m!311511 () Bool)

(assert (=> b!299920 m!311511))

(declare-fun m!311513 () Bool)

(assert (=> b!299923 m!311513))

(declare-fun m!311515 () Bool)

(assert (=> b!299922 m!311515))

(declare-fun m!311517 () Bool)

(assert (=> b!299922 m!311517))

(declare-fun m!311519 () Bool)

(assert (=> b!299922 m!311519))

(declare-fun m!311521 () Bool)

(assert (=> b!299922 m!311521))

(check-sat (not start!29812) (not b!299922) (not b!299923) (not b!299925) (not b!299920) (not b!299924))
(check-sat)
