; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29122 () Bool)

(assert start!29122)

(declare-fun b!295551 () Bool)

(declare-fun e!186798 () Bool)

(declare-fun e!186799 () Bool)

(assert (=> b!295551 (= e!186798 e!186799)))

(declare-fun res!155326 () Bool)

(assert (=> b!295551 (=> (not res!155326) (not e!186799))))

(declare-fun lt!146569 () Bool)

(assert (=> b!295551 (= res!155326 lt!146569)))

(declare-fun lt!146566 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2189 0))(
  ( (MissingZero!2189 (index!10926 (_ BitVec 32))) (Found!2189 (index!10927 (_ BitVec 32))) (Intermediate!2189 (undefined!3001 Bool) (index!10928 (_ BitVec 32)) (x!29258 (_ BitVec 32))) (Undefined!2189) (MissingVacant!2189 (index!10929 (_ BitVec 32))) )
))
(declare-fun lt!146571 () SeekEntryResult!2189)

(declare-datatypes ((array!14928 0))(
  ( (array!14929 (arr!7075 (Array (_ BitVec 32) (_ BitVec 64))) (size!7427 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14928)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14928 (_ BitVec 32)) SeekEntryResult!2189)

(assert (=> b!295551 (= lt!146571 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146566 k0!2524 (array!14929 (store (arr!7075 a!3312) i!1256 k0!2524) (size!7427 a!3312)) mask!3809))))

(declare-fun lt!146570 () SeekEntryResult!2189)

(assert (=> b!295551 (= lt!146570 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146566 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295551 (= lt!146566 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!295552 () Bool)

(declare-fun res!155325 () Bool)

(declare-fun e!186800 () Bool)

(assert (=> b!295552 (=> (not res!155325) (not e!186800))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295552 (= res!155325 (validKeyInArray!0 k0!2524))))

(declare-fun b!295553 () Bool)

(declare-fun e!186796 () Bool)

(assert (=> b!295553 (= e!186799 e!186796)))

(declare-fun res!155321 () Bool)

(assert (=> b!295553 (=> (not res!155321) (not e!186796))))

(declare-fun lt!146567 () Bool)

(assert (=> b!295553 (= res!155321 (and (or lt!146567 (not (undefined!3001 lt!146570))) (or lt!146567 (not (= (select (arr!7075 a!3312) (index!10928 lt!146570)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146567 (not (= (select (arr!7075 a!3312) (index!10928 lt!146570)) k0!2524))) (not lt!146567)))))

(get-info :version)

(assert (=> b!295553 (= lt!146567 (not ((_ is Intermediate!2189) lt!146570)))))

(declare-fun b!295554 () Bool)

(assert (=> b!295554 (= e!186800 e!186798)))

(declare-fun res!155328 () Bool)

(assert (=> b!295554 (=> (not res!155328) (not e!186798))))

(declare-fun lt!146568 () SeekEntryResult!2189)

(assert (=> b!295554 (= res!155328 (or lt!146569 (= lt!146568 (MissingVacant!2189 i!1256))))))

(assert (=> b!295554 (= lt!146569 (= lt!146568 (MissingZero!2189 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14928 (_ BitVec 32)) SeekEntryResult!2189)

(assert (=> b!295554 (= lt!146568 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!295555 () Bool)

(declare-fun res!155324 () Bool)

(assert (=> b!295555 (=> (not res!155324) (not e!186800))))

(assert (=> b!295555 (= res!155324 (and (= (size!7427 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7427 a!3312))))))

(declare-fun b!295556 () Bool)

(declare-fun res!155323 () Bool)

(assert (=> b!295556 (=> (not res!155323) (not e!186798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14928 (_ BitVec 32)) Bool)

(assert (=> b!295556 (= res!155323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295557 () Bool)

(declare-fun res!155322 () Bool)

(assert (=> b!295557 (=> (not res!155322) (not e!186800))))

(declare-fun arrayContainsKey!0 (array!14928 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295557 (= res!155322 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!155327 () Bool)

(assert (=> start!29122 (=> (not res!155327) (not e!186800))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29122 (= res!155327 (validMask!0 mask!3809))))

(assert (=> start!29122 e!186800))

(assert (=> start!29122 true))

(declare-fun array_inv!5025 (array!14928) Bool)

(assert (=> start!29122 (array_inv!5025 a!3312)))

(declare-fun b!295558 () Bool)

(assert (=> b!295558 (= e!186796 (not true))))

(assert (=> b!295558 (and (= (select (arr!7075 a!3312) (index!10928 lt!146570)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10928 lt!146570) i!1256))))

(assert (= (and start!29122 res!155327) b!295555))

(assert (= (and b!295555 res!155324) b!295552))

(assert (= (and b!295552 res!155325) b!295557))

(assert (= (and b!295557 res!155322) b!295554))

(assert (= (and b!295554 res!155328) b!295556))

(assert (= (and b!295556 res!155323) b!295551))

(assert (= (and b!295551 res!155326) b!295553))

(assert (= (and b!295553 res!155321) b!295558))

(declare-fun m!308819 () Bool)

(assert (=> b!295553 m!308819))

(declare-fun m!308821 () Bool)

(assert (=> b!295556 m!308821))

(declare-fun m!308823 () Bool)

(assert (=> b!295557 m!308823))

(declare-fun m!308825 () Bool)

(assert (=> b!295552 m!308825))

(declare-fun m!308827 () Bool)

(assert (=> b!295554 m!308827))

(declare-fun m!308829 () Bool)

(assert (=> start!29122 m!308829))

(declare-fun m!308831 () Bool)

(assert (=> start!29122 m!308831))

(declare-fun m!308833 () Bool)

(assert (=> b!295551 m!308833))

(declare-fun m!308835 () Bool)

(assert (=> b!295551 m!308835))

(declare-fun m!308837 () Bool)

(assert (=> b!295551 m!308837))

(declare-fun m!308839 () Bool)

(assert (=> b!295551 m!308839))

(assert (=> b!295558 m!308819))

(check-sat (not b!295552) (not b!295557) (not b!295556) (not b!295551) (not start!29122) (not b!295554))
(check-sat)
