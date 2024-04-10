; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29148 () Bool)

(assert start!29148)

(declare-fun b!295727 () Bool)

(declare-fun res!155541 () Bool)

(declare-fun e!186913 () Bool)

(assert (=> b!295727 (=> (not res!155541) (not e!186913))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14951 0))(
  ( (array!14952 (arr!7086 (Array (_ BitVec 32) (_ BitVec 64))) (size!7438 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14951)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!295727 (= res!155541 (and (= (size!7438 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7438 a!3312))))))

(declare-fun b!295728 () Bool)

(declare-fun res!155540 () Bool)

(declare-fun e!186912 () Bool)

(assert (=> b!295728 (=> (not res!155540) (not e!186912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14951 (_ BitVec 32)) Bool)

(assert (=> b!295728 (= res!155540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295729 () Bool)

(declare-fun res!155536 () Bool)

(assert (=> b!295729 (=> (not res!155536) (not e!186913))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295729 (= res!155536 (validKeyInArray!0 k0!2524))))

(declare-fun b!295730 () Bool)

(declare-fun e!186915 () Bool)

(assert (=> b!295730 (= e!186912 e!186915)))

(declare-fun res!155537 () Bool)

(assert (=> b!295730 (=> (not res!155537) (not e!186915))))

(declare-fun lt!146681 () Bool)

(assert (=> b!295730 (= res!155537 lt!146681)))

(declare-datatypes ((SeekEntryResult!2235 0))(
  ( (MissingZero!2235 (index!11110 (_ BitVec 32))) (Found!2235 (index!11111 (_ BitVec 32))) (Intermediate!2235 (undefined!3047 Bool) (index!11112 (_ BitVec 32)) (x!29327 (_ BitVec 32))) (Undefined!2235) (MissingVacant!2235 (index!11113 (_ BitVec 32))) )
))
(declare-fun lt!146684 () SeekEntryResult!2235)

(declare-fun lt!146683 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14951 (_ BitVec 32)) SeekEntryResult!2235)

(assert (=> b!295730 (= lt!146684 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146683 k0!2524 (array!14952 (store (arr!7086 a!3312) i!1256 k0!2524) (size!7438 a!3312)) mask!3809))))

(declare-fun lt!146680 () SeekEntryResult!2235)

(assert (=> b!295730 (= lt!146680 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146683 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295730 (= lt!146683 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!295731 () Bool)

(declare-fun res!155539 () Bool)

(assert (=> b!295731 (=> (not res!155539) (not e!186913))))

(declare-fun arrayContainsKey!0 (array!14951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295731 (= res!155539 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!155538 () Bool)

(assert (=> start!29148 (=> (not res!155538) (not e!186913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29148 (= res!155538 (validMask!0 mask!3809))))

(assert (=> start!29148 e!186913))

(assert (=> start!29148 true))

(declare-fun array_inv!5049 (array!14951) Bool)

(assert (=> start!29148 (array_inv!5049 a!3312)))

(declare-fun b!295726 () Bool)

(declare-fun e!186914 () Bool)

(assert (=> b!295726 (= e!186915 e!186914)))

(declare-fun res!155535 () Bool)

(assert (=> b!295726 (=> (not res!155535) (not e!186914))))

(declare-fun lt!146685 () Bool)

(assert (=> b!295726 (= res!155535 (and (or lt!146685 (not (undefined!3047 lt!146680))) (or lt!146685 (not (= (select (arr!7086 a!3312) (index!11112 lt!146680)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146685 (not (= (select (arr!7086 a!3312) (index!11112 lt!146680)) k0!2524))) (not lt!146685)))))

(get-info :version)

(assert (=> b!295726 (= lt!146685 (not ((_ is Intermediate!2235) lt!146680)))))

(declare-fun b!295732 () Bool)

(assert (=> b!295732 (= e!186914 (not true))))

(assert (=> b!295732 (and (= (select (arr!7086 a!3312) (index!11112 lt!146680)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11112 lt!146680) i!1256))))

(declare-fun b!295733 () Bool)

(assert (=> b!295733 (= e!186913 e!186912)))

(declare-fun res!155534 () Bool)

(assert (=> b!295733 (=> (not res!155534) (not e!186912))))

(declare-fun lt!146682 () SeekEntryResult!2235)

(assert (=> b!295733 (= res!155534 (or lt!146681 (= lt!146682 (MissingVacant!2235 i!1256))))))

(assert (=> b!295733 (= lt!146681 (= lt!146682 (MissingZero!2235 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14951 (_ BitVec 32)) SeekEntryResult!2235)

(assert (=> b!295733 (= lt!146682 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!29148 res!155538) b!295727))

(assert (= (and b!295727 res!155541) b!295729))

(assert (= (and b!295729 res!155536) b!295731))

(assert (= (and b!295731 res!155539) b!295733))

(assert (= (and b!295733 res!155534) b!295728))

(assert (= (and b!295728 res!155540) b!295730))

(assert (= (and b!295730 res!155537) b!295726))

(assert (= (and b!295726 res!155535) b!295732))

(declare-fun m!308809 () Bool)

(assert (=> b!295726 m!308809))

(assert (=> b!295732 m!308809))

(declare-fun m!308811 () Bool)

(assert (=> b!295733 m!308811))

(declare-fun m!308813 () Bool)

(assert (=> start!29148 m!308813))

(declare-fun m!308815 () Bool)

(assert (=> start!29148 m!308815))

(declare-fun m!308817 () Bool)

(assert (=> b!295731 m!308817))

(declare-fun m!308819 () Bool)

(assert (=> b!295728 m!308819))

(declare-fun m!308821 () Bool)

(assert (=> b!295730 m!308821))

(declare-fun m!308823 () Bool)

(assert (=> b!295730 m!308823))

(declare-fun m!308825 () Bool)

(assert (=> b!295730 m!308825))

(declare-fun m!308827 () Bool)

(assert (=> b!295730 m!308827))

(declare-fun m!308829 () Bool)

(assert (=> b!295729 m!308829))

(check-sat (not b!295730) (not b!295728) (not b!295729) (not start!29148) (not b!295731) (not b!295733))
(check-sat)
