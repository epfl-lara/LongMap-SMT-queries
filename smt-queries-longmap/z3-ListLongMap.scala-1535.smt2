; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29126 () Bool)

(assert start!29126)

(declare-fun b!295383 () Bool)

(declare-fun res!155320 () Bool)

(declare-fun e!186695 () Bool)

(assert (=> b!295383 (=> (not res!155320) (not e!186695))))

(declare-datatypes ((array!14932 0))(
  ( (array!14933 (arr!7077 (Array (_ BitVec 32) (_ BitVec 64))) (size!7430 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14932)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14932 (_ BitVec 32)) Bool)

(assert (=> b!295383 (= res!155320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295384 () Bool)

(declare-fun e!186697 () Bool)

(assert (=> b!295384 (= e!186695 e!186697)))

(declare-fun res!155322 () Bool)

(assert (=> b!295384 (=> (not res!155322) (not e!186697))))

(declare-fun lt!146388 () Bool)

(assert (=> b!295384 (= res!155322 lt!146388)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2225 0))(
  ( (MissingZero!2225 (index!11070 (_ BitVec 32))) (Found!2225 (index!11071 (_ BitVec 32))) (Intermediate!2225 (undefined!3037 Bool) (index!11072 (_ BitVec 32)) (x!29305 (_ BitVec 32))) (Undefined!2225) (MissingVacant!2225 (index!11073 (_ BitVec 32))) )
))
(declare-fun lt!146387 () SeekEntryResult!2225)

(declare-fun lt!146386 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14932 (_ BitVec 32)) SeekEntryResult!2225)

(assert (=> b!295384 (= lt!146387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146386 k0!2524 (array!14933 (store (arr!7077 a!3312) i!1256 k0!2524) (size!7430 a!3312)) mask!3809))))

(declare-fun lt!146390 () SeekEntryResult!2225)

(assert (=> b!295384 (= lt!146390 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146386 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295384 (= lt!146386 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!295385 () Bool)

(declare-fun res!155326 () Bool)

(declare-fun e!186694 () Bool)

(assert (=> b!295385 (=> (not res!155326) (not e!186694))))

(assert (=> b!295385 (= res!155326 (and (= (size!7430 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7430 a!3312))))))

(declare-fun b!295386 () Bool)

(assert (=> b!295386 (= e!186694 e!186695)))

(declare-fun res!155321 () Bool)

(assert (=> b!295386 (=> (not res!155321) (not e!186695))))

(declare-fun lt!146391 () SeekEntryResult!2225)

(assert (=> b!295386 (= res!155321 (or lt!146388 (= lt!146391 (MissingVacant!2225 i!1256))))))

(assert (=> b!295386 (= lt!146388 (= lt!146391 (MissingZero!2225 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14932 (_ BitVec 32)) SeekEntryResult!2225)

(assert (=> b!295386 (= lt!146391 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!295387 () Bool)

(declare-fun e!186693 () Bool)

(assert (=> b!295387 (= e!186693 (not true))))

(assert (=> b!295387 (and (= (select (arr!7077 a!3312) (index!11072 lt!146390)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11072 lt!146390) i!1256))))

(declare-fun b!295388 () Bool)

(assert (=> b!295388 (= e!186697 e!186693)))

(declare-fun res!155325 () Bool)

(assert (=> b!295388 (=> (not res!155325) (not e!186693))))

(declare-fun lt!146389 () Bool)

(assert (=> b!295388 (= res!155325 (and (or lt!146389 (not (undefined!3037 lt!146390))) (or lt!146389 (not (= (select (arr!7077 a!3312) (index!11072 lt!146390)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146389 (not (= (select (arr!7077 a!3312) (index!11072 lt!146390)) k0!2524))) (not lt!146389)))))

(get-info :version)

(assert (=> b!295388 (= lt!146389 (not ((_ is Intermediate!2225) lt!146390)))))

(declare-fun res!155324 () Bool)

(assert (=> start!29126 (=> (not res!155324) (not e!186694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29126 (= res!155324 (validMask!0 mask!3809))))

(assert (=> start!29126 e!186694))

(assert (=> start!29126 true))

(declare-fun array_inv!5049 (array!14932) Bool)

(assert (=> start!29126 (array_inv!5049 a!3312)))

(declare-fun b!295389 () Bool)

(declare-fun res!155323 () Bool)

(assert (=> b!295389 (=> (not res!155323) (not e!186694))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295389 (= res!155323 (validKeyInArray!0 k0!2524))))

(declare-fun b!295390 () Bool)

(declare-fun res!155319 () Bool)

(assert (=> b!295390 (=> (not res!155319) (not e!186694))))

(declare-fun arrayContainsKey!0 (array!14932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295390 (= res!155319 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29126 res!155324) b!295385))

(assert (= (and b!295385 res!155326) b!295389))

(assert (= (and b!295389 res!155323) b!295390))

(assert (= (and b!295390 res!155319) b!295386))

(assert (= (and b!295386 res!155321) b!295383))

(assert (= (and b!295383 res!155320) b!295384))

(assert (= (and b!295384 res!155322) b!295388))

(assert (= (and b!295388 res!155325) b!295387))

(declare-fun m!308025 () Bool)

(assert (=> b!295383 m!308025))

(declare-fun m!308027 () Bool)

(assert (=> b!295384 m!308027))

(declare-fun m!308029 () Bool)

(assert (=> b!295384 m!308029))

(declare-fun m!308031 () Bool)

(assert (=> b!295384 m!308031))

(declare-fun m!308033 () Bool)

(assert (=> b!295384 m!308033))

(declare-fun m!308035 () Bool)

(assert (=> b!295388 m!308035))

(declare-fun m!308037 () Bool)

(assert (=> b!295386 m!308037))

(declare-fun m!308039 () Bool)

(assert (=> b!295389 m!308039))

(declare-fun m!308041 () Bool)

(assert (=> b!295390 m!308041))

(declare-fun m!308043 () Bool)

(assert (=> start!29126 m!308043))

(declare-fun m!308045 () Bool)

(assert (=> start!29126 m!308045))

(assert (=> b!295387 m!308035))

(check-sat (not start!29126) (not b!295389) (not b!295390) (not b!295383) (not b!295386) (not b!295384))
(check-sat)
