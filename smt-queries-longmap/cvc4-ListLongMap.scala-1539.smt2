; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29168 () Bool)

(assert start!29168)

(declare-fun b!295966 () Bool)

(declare-fun e!187063 () Bool)

(assert (=> b!295966 (= e!187063 (not true))))

(declare-datatypes ((array!14971 0))(
  ( (array!14972 (arr!7096 (Array (_ BitVec 32) (_ BitVec 64))) (size!7448 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14971)

(declare-datatypes ((SeekEntryResult!2245 0))(
  ( (MissingZero!2245 (index!11150 (_ BitVec 32))) (Found!2245 (index!11151 (_ BitVec 32))) (Intermediate!2245 (undefined!3057 Bool) (index!11152 (_ BitVec 32)) (x!29361 (_ BitVec 32))) (Undefined!2245) (MissingVacant!2245 (index!11153 (_ BitVec 32))) )
))
(declare-fun lt!146860 () SeekEntryResult!2245)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!295966 (and (= (select (arr!7096 a!3312) (index!11152 lt!146860)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11152 lt!146860) i!1256))))

(declare-fun b!295967 () Bool)

(declare-fun res!155781 () Bool)

(declare-fun e!187062 () Bool)

(assert (=> b!295967 (=> (not res!155781) (not e!187062))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295967 (= res!155781 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295968 () Bool)

(declare-fun res!155776 () Bool)

(assert (=> b!295968 (=> (not res!155776) (not e!187062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295968 (= res!155776 (validKeyInArray!0 k!2524))))

(declare-fun res!155774 () Bool)

(assert (=> start!29168 (=> (not res!155774) (not e!187062))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29168 (= res!155774 (validMask!0 mask!3809))))

(assert (=> start!29168 e!187062))

(assert (=> start!29168 true))

(declare-fun array_inv!5059 (array!14971) Bool)

(assert (=> start!29168 (array_inv!5059 a!3312)))

(declare-fun b!295969 () Bool)

(declare-fun e!187065 () Bool)

(declare-fun e!187066 () Bool)

(assert (=> b!295969 (= e!187065 e!187066)))

(declare-fun res!155780 () Bool)

(assert (=> b!295969 (=> (not res!155780) (not e!187066))))

(declare-fun lt!146863 () Bool)

(assert (=> b!295969 (= res!155780 lt!146863)))

(declare-fun lt!146865 () SeekEntryResult!2245)

(declare-fun lt!146864 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14971 (_ BitVec 32)) SeekEntryResult!2245)

(assert (=> b!295969 (= lt!146865 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146864 k!2524 (array!14972 (store (arr!7096 a!3312) i!1256 k!2524) (size!7448 a!3312)) mask!3809))))

(assert (=> b!295969 (= lt!146860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146864 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295969 (= lt!146864 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!295970 () Bool)

(declare-fun res!155779 () Bool)

(assert (=> b!295970 (=> (not res!155779) (not e!187062))))

(assert (=> b!295970 (= res!155779 (and (= (size!7448 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7448 a!3312))))))

(declare-fun b!295971 () Bool)

(assert (=> b!295971 (= e!187066 e!187063)))

(declare-fun res!155778 () Bool)

(assert (=> b!295971 (=> (not res!155778) (not e!187063))))

(declare-fun lt!146861 () Bool)

(assert (=> b!295971 (= res!155778 (and (or lt!146861 (not (undefined!3057 lt!146860))) (or lt!146861 (not (= (select (arr!7096 a!3312) (index!11152 lt!146860)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146861 (not (= (select (arr!7096 a!3312) (index!11152 lt!146860)) k!2524))) (not lt!146861)))))

(assert (=> b!295971 (= lt!146861 (not (is-Intermediate!2245 lt!146860)))))

(declare-fun b!295972 () Bool)

(declare-fun res!155777 () Bool)

(assert (=> b!295972 (=> (not res!155777) (not e!187065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14971 (_ BitVec 32)) Bool)

(assert (=> b!295972 (= res!155777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295973 () Bool)

(assert (=> b!295973 (= e!187062 e!187065)))

(declare-fun res!155775 () Bool)

(assert (=> b!295973 (=> (not res!155775) (not e!187065))))

(declare-fun lt!146862 () SeekEntryResult!2245)

(assert (=> b!295973 (= res!155775 (or lt!146863 (= lt!146862 (MissingVacant!2245 i!1256))))))

(assert (=> b!295973 (= lt!146863 (= lt!146862 (MissingZero!2245 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14971 (_ BitVec 32)) SeekEntryResult!2245)

(assert (=> b!295973 (= lt!146862 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!29168 res!155774) b!295970))

(assert (= (and b!295970 res!155779) b!295968))

(assert (= (and b!295968 res!155776) b!295967))

(assert (= (and b!295967 res!155781) b!295973))

(assert (= (and b!295973 res!155775) b!295972))

(assert (= (and b!295972 res!155777) b!295969))

(assert (= (and b!295969 res!155780) b!295971))

(assert (= (and b!295971 res!155778) b!295966))

(declare-fun m!309029 () Bool)

(assert (=> b!295967 m!309029))

(declare-fun m!309031 () Bool)

(assert (=> start!29168 m!309031))

(declare-fun m!309033 () Bool)

(assert (=> start!29168 m!309033))

(declare-fun m!309035 () Bool)

(assert (=> b!295972 m!309035))

(declare-fun m!309037 () Bool)

(assert (=> b!295971 m!309037))

(declare-fun m!309039 () Bool)

(assert (=> b!295969 m!309039))

(declare-fun m!309041 () Bool)

(assert (=> b!295969 m!309041))

(declare-fun m!309043 () Bool)

(assert (=> b!295969 m!309043))

(declare-fun m!309045 () Bool)

(assert (=> b!295969 m!309045))

(declare-fun m!309047 () Bool)

(assert (=> b!295973 m!309047))

(declare-fun m!309049 () Bool)

(assert (=> b!295968 m!309049))

(assert (=> b!295966 m!309037))

(push 1)

