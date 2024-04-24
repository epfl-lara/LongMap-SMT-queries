; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29314 () Bool)

(assert start!29314)

(declare-fun b!297135 () Bool)

(declare-fun res!156625 () Bool)

(declare-fun e!187784 () Bool)

(assert (=> b!297135 (=> (not res!156625) (not e!187784))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297135 (= res!156625 (validKeyInArray!0 k0!2524))))

(declare-fun b!297136 () Bool)

(declare-fun e!187782 () Bool)

(declare-fun e!187783 () Bool)

(assert (=> b!297136 (= e!187782 e!187783)))

(declare-fun res!156623 () Bool)

(assert (=> b!297136 (=> (not res!156623) (not e!187783))))

(declare-datatypes ((SeekEntryResult!2237 0))(
  ( (MissingZero!2237 (index!11118 (_ BitVec 32))) (Found!2237 (index!11119 (_ BitVec 32))) (Intermediate!2237 (undefined!3049 Bool) (index!11120 (_ BitVec 32)) (x!29446 (_ BitVec 32))) (Undefined!2237) (MissingVacant!2237 (index!11121 (_ BitVec 32))) )
))
(declare-fun lt!147635 () SeekEntryResult!2237)

(declare-fun lt!147638 () Bool)

(declare-datatypes ((array!15030 0))(
  ( (array!15031 (arr!7123 (Array (_ BitVec 32) (_ BitVec 64))) (size!7475 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15030)

(assert (=> b!297136 (= res!156623 (and (or lt!147638 (not (undefined!3049 lt!147635))) (or lt!147638 (not (= (select (arr!7123 a!3312) (index!11120 lt!147635)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147638 (not (= (select (arr!7123 a!3312) (index!11120 lt!147635)) k0!2524))) (not lt!147638)))))

(get-info :version)

(assert (=> b!297136 (= lt!147638 (not ((_ is Intermediate!2237) lt!147635)))))

(declare-fun res!156627 () Bool)

(assert (=> start!29314 (=> (not res!156627) (not e!187784))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29314 (= res!156627 (validMask!0 mask!3809))))

(assert (=> start!29314 e!187784))

(assert (=> start!29314 true))

(declare-fun array_inv!5073 (array!15030) Bool)

(assert (=> start!29314 (array_inv!5073 a!3312)))

(declare-fun b!297137 () Bool)

(declare-fun res!156626 () Bool)

(declare-fun e!187781 () Bool)

(assert (=> b!297137 (=> (not res!156626) (not e!187781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15030 (_ BitVec 32)) Bool)

(assert (=> b!297137 (= res!156626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297138 () Bool)

(assert (=> b!297138 (= e!187784 e!187781)))

(declare-fun res!156629 () Bool)

(assert (=> b!297138 (=> (not res!156629) (not e!187781))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!147637 () Bool)

(declare-fun lt!147633 () SeekEntryResult!2237)

(assert (=> b!297138 (= res!156629 (or lt!147637 (= lt!147633 (MissingVacant!2237 i!1256))))))

(assert (=> b!297138 (= lt!147637 (= lt!147633 (MissingZero!2237 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15030 (_ BitVec 32)) SeekEntryResult!2237)

(assert (=> b!297138 (= lt!147633 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!297139 () Bool)

(assert (=> b!297139 (= e!187781 e!187782)))

(declare-fun res!156628 () Bool)

(assert (=> b!297139 (=> (not res!156628) (not e!187782))))

(assert (=> b!297139 (= res!156628 lt!147637)))

(declare-fun lt!147639 () SeekEntryResult!2237)

(declare-fun lt!147636 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15030 (_ BitVec 32)) SeekEntryResult!2237)

(assert (=> b!297139 (= lt!147639 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147636 k0!2524 (array!15031 (store (arr!7123 a!3312) i!1256 k0!2524) (size!7475 a!3312)) mask!3809))))

(assert (=> b!297139 (= lt!147635 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147636 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297139 (= lt!147636 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!297140 () Bool)

(assert (=> b!297140 (= e!187783 (not (and (bvsge (index!11120 lt!147635) #b00000000000000000000000000000000) (bvslt (index!11120 lt!147635) (size!7475 a!3312)))))))

(assert (=> b!297140 (= lt!147639 lt!147635)))

(declare-datatypes ((Unit!9202 0))(
  ( (Unit!9203) )
))
(declare-fun lt!147634 () Unit!9202)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15030 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9202)

(assert (=> b!297140 (= lt!147634 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!147636 (index!11120 lt!147635) (x!29446 lt!147635) mask!3809))))

(assert (=> b!297140 (and (= (select (arr!7123 a!3312) (index!11120 lt!147635)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11120 lt!147635) i!1256))))

(declare-fun b!297141 () Bool)

(declare-fun res!156630 () Bool)

(assert (=> b!297141 (=> (not res!156630) (not e!187784))))

(assert (=> b!297141 (= res!156630 (and (= (size!7475 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7475 a!3312))))))

(declare-fun b!297142 () Bool)

(declare-fun res!156624 () Bool)

(assert (=> b!297142 (=> (not res!156624) (not e!187784))))

(declare-fun arrayContainsKey!0 (array!15030 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297142 (= res!156624 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29314 res!156627) b!297141))

(assert (= (and b!297141 res!156630) b!297135))

(assert (= (and b!297135 res!156625) b!297142))

(assert (= (and b!297142 res!156624) b!297138))

(assert (= (and b!297138 res!156629) b!297137))

(assert (= (and b!297137 res!156626) b!297139))

(assert (= (and b!297139 res!156628) b!297136))

(assert (= (and b!297136 res!156623) b!297140))

(declare-fun m!310121 () Bool)

(assert (=> b!297142 m!310121))

(declare-fun m!310123 () Bool)

(assert (=> b!297139 m!310123))

(declare-fun m!310125 () Bool)

(assert (=> b!297139 m!310125))

(declare-fun m!310127 () Bool)

(assert (=> b!297139 m!310127))

(declare-fun m!310129 () Bool)

(assert (=> b!297139 m!310129))

(declare-fun m!310131 () Bool)

(assert (=> start!29314 m!310131))

(declare-fun m!310133 () Bool)

(assert (=> start!29314 m!310133))

(declare-fun m!310135 () Bool)

(assert (=> b!297140 m!310135))

(declare-fun m!310137 () Bool)

(assert (=> b!297140 m!310137))

(declare-fun m!310139 () Bool)

(assert (=> b!297138 m!310139))

(declare-fun m!310141 () Bool)

(assert (=> b!297137 m!310141))

(declare-fun m!310143 () Bool)

(assert (=> b!297135 m!310143))

(assert (=> b!297136 m!310137))

(check-sat (not b!297142) (not b!297135) (not b!297139) (not start!29314) (not b!297137) (not b!297140) (not b!297138))
(check-sat)
