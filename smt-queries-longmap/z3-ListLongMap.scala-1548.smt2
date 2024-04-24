; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29308 () Bool)

(assert start!29308)

(declare-fun b!297063 () Bool)

(declare-fun e!187738 () Bool)

(declare-fun e!187739 () Bool)

(assert (=> b!297063 (= e!187738 e!187739)))

(declare-fun res!156551 () Bool)

(assert (=> b!297063 (=> (not res!156551) (not e!187739))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!147575 () Bool)

(declare-datatypes ((SeekEntryResult!2234 0))(
  ( (MissingZero!2234 (index!11106 (_ BitVec 32))) (Found!2234 (index!11107 (_ BitVec 32))) (Intermediate!2234 (undefined!3046 Bool) (index!11108 (_ BitVec 32)) (x!29435 (_ BitVec 32))) (Undefined!2234) (MissingVacant!2234 (index!11109 (_ BitVec 32))) )
))
(declare-fun lt!147574 () SeekEntryResult!2234)

(assert (=> b!297063 (= res!156551 (or lt!147575 (= lt!147574 (MissingVacant!2234 i!1256))))))

(assert (=> b!297063 (= lt!147575 (= lt!147574 (MissingZero!2234 i!1256)))))

(declare-datatypes ((array!15024 0))(
  ( (array!15025 (arr!7120 (Array (_ BitVec 32) (_ BitVec 64))) (size!7472 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15024)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15024 (_ BitVec 32)) SeekEntryResult!2234)

(assert (=> b!297063 (= lt!147574 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!297064 () Bool)

(declare-fun e!187736 () Bool)

(assert (=> b!297064 (= e!187739 e!187736)))

(declare-fun res!156558 () Bool)

(assert (=> b!297064 (=> (not res!156558) (not e!187736))))

(assert (=> b!297064 (= res!156558 lt!147575)))

(declare-fun lt!147571 () SeekEntryResult!2234)

(declare-fun lt!147572 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15024 (_ BitVec 32)) SeekEntryResult!2234)

(assert (=> b!297064 (= lt!147571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147572 k0!2524 (array!15025 (store (arr!7120 a!3312) i!1256 k0!2524) (size!7472 a!3312)) mask!3809))))

(declare-fun lt!147570 () SeekEntryResult!2234)

(assert (=> b!297064 (= lt!147570 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147572 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297064 (= lt!147572 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!297065 () Bool)

(declare-fun res!156553 () Bool)

(assert (=> b!297065 (=> (not res!156553) (not e!187738))))

(declare-fun arrayContainsKey!0 (array!15024 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297065 (= res!156553 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297066 () Bool)

(declare-fun res!156552 () Bool)

(assert (=> b!297066 (=> (not res!156552) (not e!187738))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297066 (= res!156552 (validKeyInArray!0 k0!2524))))

(declare-fun b!297067 () Bool)

(declare-fun res!156555 () Bool)

(assert (=> b!297067 (=> (not res!156555) (not e!187739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15024 (_ BitVec 32)) Bool)

(assert (=> b!297067 (= res!156555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297068 () Bool)

(declare-fun e!187737 () Bool)

(assert (=> b!297068 (= e!187736 e!187737)))

(declare-fun res!156557 () Bool)

(assert (=> b!297068 (=> (not res!156557) (not e!187737))))

(declare-fun lt!147576 () Bool)

(assert (=> b!297068 (= res!156557 (and (or lt!147576 (not (undefined!3046 lt!147570))) (or lt!147576 (not (= (select (arr!7120 a!3312) (index!11108 lt!147570)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147576 (not (= (select (arr!7120 a!3312) (index!11108 lt!147570)) k0!2524))) (not lt!147576)))))

(get-info :version)

(assert (=> b!297068 (= lt!147576 (not ((_ is Intermediate!2234) lt!147570)))))

(declare-fun res!156556 () Bool)

(assert (=> start!29308 (=> (not res!156556) (not e!187738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29308 (= res!156556 (validMask!0 mask!3809))))

(assert (=> start!29308 e!187738))

(assert (=> start!29308 true))

(declare-fun array_inv!5070 (array!15024) Bool)

(assert (=> start!29308 (array_inv!5070 a!3312)))

(declare-fun b!297069 () Bool)

(declare-fun res!156554 () Bool)

(assert (=> b!297069 (=> (not res!156554) (not e!187738))))

(assert (=> b!297069 (= res!156554 (and (= (size!7472 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7472 a!3312))))))

(declare-fun b!297070 () Bool)

(assert (=> b!297070 (= e!187737 (not true))))

(assert (=> b!297070 (= lt!147571 lt!147570)))

(declare-datatypes ((Unit!9196 0))(
  ( (Unit!9197) )
))
(declare-fun lt!147573 () Unit!9196)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15024 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9196)

(assert (=> b!297070 (= lt!147573 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!147572 (index!11108 lt!147570) (x!29435 lt!147570) mask!3809))))

(assert (=> b!297070 (and (= (select (arr!7120 a!3312) (index!11108 lt!147570)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11108 lt!147570) i!1256))))

(assert (= (and start!29308 res!156556) b!297069))

(assert (= (and b!297069 res!156554) b!297066))

(assert (= (and b!297066 res!156552) b!297065))

(assert (= (and b!297065 res!156553) b!297063))

(assert (= (and b!297063 res!156551) b!297067))

(assert (= (and b!297067 res!156555) b!297064))

(assert (= (and b!297064 res!156558) b!297068))

(assert (= (and b!297068 res!156557) b!297070))

(declare-fun m!310049 () Bool)

(assert (=> b!297065 m!310049))

(declare-fun m!310051 () Bool)

(assert (=> start!29308 m!310051))

(declare-fun m!310053 () Bool)

(assert (=> start!29308 m!310053))

(declare-fun m!310055 () Bool)

(assert (=> b!297066 m!310055))

(declare-fun m!310057 () Bool)

(assert (=> b!297068 m!310057))

(declare-fun m!310059 () Bool)

(assert (=> b!297070 m!310059))

(assert (=> b!297070 m!310057))

(declare-fun m!310061 () Bool)

(assert (=> b!297067 m!310061))

(declare-fun m!310063 () Bool)

(assert (=> b!297063 m!310063))

(declare-fun m!310065 () Bool)

(assert (=> b!297064 m!310065))

(declare-fun m!310067 () Bool)

(assert (=> b!297064 m!310067))

(declare-fun m!310069 () Bool)

(assert (=> b!297064 m!310069))

(declare-fun m!310071 () Bool)

(assert (=> b!297064 m!310071))

(check-sat (not start!29308) (not b!297070) (not b!297067) (not b!297065) (not b!297063) (not b!297064) (not b!297066))
(check-sat)
