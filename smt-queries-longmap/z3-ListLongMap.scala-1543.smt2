; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29174 () Bool)

(assert start!29174)

(declare-fun b!295959 () Bool)

(declare-fun e!187053 () Bool)

(declare-fun e!187055 () Bool)

(assert (=> b!295959 (= e!187053 e!187055)))

(declare-fun res!155897 () Bool)

(assert (=> b!295959 (=> (not res!155897) (not e!187055))))

(declare-fun lt!146818 () Bool)

(assert (=> b!295959 (= res!155897 lt!146818)))

(declare-fun lt!146823 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2249 0))(
  ( (MissingZero!2249 (index!11166 (_ BitVec 32))) (Found!2249 (index!11167 (_ BitVec 32))) (Intermediate!2249 (undefined!3061 Bool) (index!11168 (_ BitVec 32)) (x!29393 (_ BitVec 32))) (Undefined!2249) (MissingVacant!2249 (index!11169 (_ BitVec 32))) )
))
(declare-fun lt!146819 () SeekEntryResult!2249)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14980 0))(
  ( (array!14981 (arr!7101 (Array (_ BitVec 32) (_ BitVec 64))) (size!7454 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14980)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14980 (_ BitVec 32)) SeekEntryResult!2249)

(assert (=> b!295959 (= lt!146819 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146823 k0!2524 (array!14981 (store (arr!7101 a!3312) i!1256 k0!2524) (size!7454 a!3312)) mask!3809))))

(declare-fun lt!146820 () SeekEntryResult!2249)

(assert (=> b!295959 (= lt!146820 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146823 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295959 (= lt!146823 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!295961 () Bool)

(declare-fun res!155899 () Bool)

(declare-fun e!187056 () Bool)

(assert (=> b!295961 (=> (not res!155899) (not e!187056))))

(declare-fun arrayContainsKey!0 (array!14980 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295961 (= res!155899 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295962 () Bool)

(declare-fun e!187057 () Bool)

(assert (=> b!295962 (= e!187055 e!187057)))

(declare-fun res!155900 () Bool)

(assert (=> b!295962 (=> (not res!155900) (not e!187057))))

(declare-fun lt!146821 () Bool)

(assert (=> b!295962 (= res!155900 (and (or lt!146821 (not (undefined!3061 lt!146820))) (or lt!146821 (not (= (select (arr!7101 a!3312) (index!11168 lt!146820)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146821 (not (= (select (arr!7101 a!3312) (index!11168 lt!146820)) k0!2524))) (not lt!146821)))))

(get-info :version)

(assert (=> b!295962 (= lt!146821 (not ((_ is Intermediate!2249) lt!146820)))))

(declare-fun b!295963 () Bool)

(declare-fun res!155898 () Bool)

(assert (=> b!295963 (=> (not res!155898) (not e!187056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295963 (= res!155898 (validKeyInArray!0 k0!2524))))

(declare-fun b!295964 () Bool)

(assert (=> b!295964 (= e!187057 (not true))))

(assert (=> b!295964 (and (= (select (arr!7101 a!3312) (index!11168 lt!146820)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11168 lt!146820) i!1256))))

(declare-fun b!295965 () Bool)

(declare-fun res!155901 () Bool)

(assert (=> b!295965 (=> (not res!155901) (not e!187056))))

(assert (=> b!295965 (= res!155901 (and (= (size!7454 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7454 a!3312))))))

(declare-fun b!295966 () Bool)

(declare-fun res!155895 () Bool)

(assert (=> b!295966 (=> (not res!155895) (not e!187053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14980 (_ BitVec 32)) Bool)

(assert (=> b!295966 (= res!155895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!155902 () Bool)

(assert (=> start!29174 (=> (not res!155902) (not e!187056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29174 (= res!155902 (validMask!0 mask!3809))))

(assert (=> start!29174 e!187056))

(assert (=> start!29174 true))

(declare-fun array_inv!5073 (array!14980) Bool)

(assert (=> start!29174 (array_inv!5073 a!3312)))

(declare-fun b!295960 () Bool)

(assert (=> b!295960 (= e!187056 e!187053)))

(declare-fun res!155896 () Bool)

(assert (=> b!295960 (=> (not res!155896) (not e!187053))))

(declare-fun lt!146822 () SeekEntryResult!2249)

(assert (=> b!295960 (= res!155896 (or lt!146818 (= lt!146822 (MissingVacant!2249 i!1256))))))

(assert (=> b!295960 (= lt!146818 (= lt!146822 (MissingZero!2249 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14980 (_ BitVec 32)) SeekEntryResult!2249)

(assert (=> b!295960 (= lt!146822 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!29174 res!155902) b!295965))

(assert (= (and b!295965 res!155901) b!295963))

(assert (= (and b!295963 res!155898) b!295961))

(assert (= (and b!295961 res!155899) b!295960))

(assert (= (and b!295960 res!155896) b!295966))

(assert (= (and b!295966 res!155895) b!295959))

(assert (= (and b!295959 res!155897) b!295962))

(assert (= (and b!295962 res!155900) b!295964))

(declare-fun m!308553 () Bool)

(assert (=> b!295961 m!308553))

(declare-fun m!308555 () Bool)

(assert (=> b!295960 m!308555))

(declare-fun m!308557 () Bool)

(assert (=> b!295966 m!308557))

(declare-fun m!308559 () Bool)

(assert (=> start!29174 m!308559))

(declare-fun m!308561 () Bool)

(assert (=> start!29174 m!308561))

(declare-fun m!308563 () Bool)

(assert (=> b!295964 m!308563))

(declare-fun m!308565 () Bool)

(assert (=> b!295963 m!308565))

(declare-fun m!308567 () Bool)

(assert (=> b!295959 m!308567))

(declare-fun m!308569 () Bool)

(assert (=> b!295959 m!308569))

(declare-fun m!308571 () Bool)

(assert (=> b!295959 m!308571))

(declare-fun m!308573 () Bool)

(assert (=> b!295959 m!308573))

(assert (=> b!295962 m!308563))

(check-sat (not b!295960) (not b!295966) (not b!295959) (not b!295961) (not start!29174) (not b!295963))
(check-sat)
