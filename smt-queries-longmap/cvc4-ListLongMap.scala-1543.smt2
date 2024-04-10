; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29192 () Bool)

(assert start!29192)

(declare-fun b!296254 () Bool)

(declare-fun e!187244 () Bool)

(declare-fun e!187245 () Bool)

(assert (=> b!296254 (= e!187244 e!187245)))

(declare-fun res!156067 () Bool)

(assert (=> b!296254 (=> (not res!156067) (not e!187245))))

(declare-fun lt!147080 () Bool)

(declare-datatypes ((SeekEntryResult!2257 0))(
  ( (MissingZero!2257 (index!11198 (_ BitVec 32))) (Found!2257 (index!11199 (_ BitVec 32))) (Intermediate!2257 (undefined!3069 Bool) (index!11200 (_ BitVec 32)) (x!29405 (_ BitVec 32))) (Undefined!2257) (MissingVacant!2257 (index!11201 (_ BitVec 32))) )
))
(declare-fun lt!147078 () SeekEntryResult!2257)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!296254 (= res!156067 (or lt!147080 (= lt!147078 (MissingVacant!2257 i!1256))))))

(assert (=> b!296254 (= lt!147080 (= lt!147078 (MissingZero!2257 i!1256)))))

(declare-datatypes ((array!14995 0))(
  ( (array!14996 (arr!7108 (Array (_ BitVec 32) (_ BitVec 64))) (size!7460 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14995)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14995 (_ BitVec 32)) SeekEntryResult!2257)

(assert (=> b!296254 (= lt!147078 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!296255 () Bool)

(declare-fun e!187246 () Bool)

(assert (=> b!296255 (= e!187245 e!187246)))

(declare-fun res!156066 () Bool)

(assert (=> b!296255 (=> (not res!156066) (not e!187246))))

(assert (=> b!296255 (= res!156066 lt!147080)))

(declare-fun lt!147081 () (_ BitVec 32))

(declare-fun lt!147079 () SeekEntryResult!2257)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14995 (_ BitVec 32)) SeekEntryResult!2257)

(assert (=> b!296255 (= lt!147079 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147081 k!2524 (array!14996 (store (arr!7108 a!3312) i!1256 k!2524) (size!7460 a!3312)) mask!3809))))

(declare-fun lt!147077 () SeekEntryResult!2257)

(assert (=> b!296255 (= lt!147077 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147081 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296255 (= lt!147081 (toIndex!0 k!2524 mask!3809))))

(declare-fun res!156064 () Bool)

(assert (=> start!29192 (=> (not res!156064) (not e!187244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29192 (= res!156064 (validMask!0 mask!3809))))

(assert (=> start!29192 e!187244))

(assert (=> start!29192 true))

(declare-fun array_inv!5071 (array!14995) Bool)

(assert (=> start!29192 (array_inv!5071 a!3312)))

(declare-fun b!296256 () Bool)

(declare-fun e!187242 () Bool)

(assert (=> b!296256 (= e!187242 (not true))))

(assert (=> b!296256 (and (= (select (arr!7108 a!3312) (index!11200 lt!147077)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11200 lt!147077) i!1256))))

(declare-fun b!296257 () Bool)

(assert (=> b!296257 (= e!187246 e!187242)))

(declare-fun res!156062 () Bool)

(assert (=> b!296257 (=> (not res!156062) (not e!187242))))

(declare-fun lt!147076 () Bool)

(assert (=> b!296257 (= res!156062 (and (or lt!147076 (not (undefined!3069 lt!147077))) (or lt!147076 (not (= (select (arr!7108 a!3312) (index!11200 lt!147077)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147076 (not (= (select (arr!7108 a!3312) (index!11200 lt!147077)) k!2524))) (not lt!147076)))))

(assert (=> b!296257 (= lt!147076 (not (is-Intermediate!2257 lt!147077)))))

(declare-fun b!296258 () Bool)

(declare-fun res!156063 () Bool)

(assert (=> b!296258 (=> (not res!156063) (not e!187244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296258 (= res!156063 (validKeyInArray!0 k!2524))))

(declare-fun b!296259 () Bool)

(declare-fun res!156068 () Bool)

(assert (=> b!296259 (=> (not res!156068) (not e!187244))))

(assert (=> b!296259 (= res!156068 (and (= (size!7460 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7460 a!3312))))))

(declare-fun b!296260 () Bool)

(declare-fun res!156065 () Bool)

(assert (=> b!296260 (=> (not res!156065) (not e!187244))))

(declare-fun arrayContainsKey!0 (array!14995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296260 (= res!156065 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296261 () Bool)

(declare-fun res!156069 () Bool)

(assert (=> b!296261 (=> (not res!156069) (not e!187245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14995 (_ BitVec 32)) Bool)

(assert (=> b!296261 (= res!156069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29192 res!156064) b!296259))

(assert (= (and b!296259 res!156068) b!296258))

(assert (= (and b!296258 res!156063) b!296260))

(assert (= (and b!296260 res!156065) b!296254))

(assert (= (and b!296254 res!156067) b!296261))

(assert (= (and b!296261 res!156069) b!296255))

(assert (= (and b!296255 res!156066) b!296257))

(assert (= (and b!296257 res!156062) b!296256))

(declare-fun m!309293 () Bool)

(assert (=> b!296260 m!309293))

(declare-fun m!309295 () Bool)

(assert (=> b!296257 m!309295))

(declare-fun m!309297 () Bool)

(assert (=> b!296258 m!309297))

(declare-fun m!309299 () Bool)

(assert (=> start!29192 m!309299))

(declare-fun m!309301 () Bool)

(assert (=> start!29192 m!309301))

(assert (=> b!296256 m!309295))

(declare-fun m!309303 () Bool)

(assert (=> b!296261 m!309303))

(declare-fun m!309305 () Bool)

(assert (=> b!296254 m!309305))

(declare-fun m!309307 () Bool)

(assert (=> b!296255 m!309307))

(declare-fun m!309309 () Bool)

(assert (=> b!296255 m!309309))

(declare-fun m!309311 () Bool)

(assert (=> b!296255 m!309311))

(declare-fun m!309313 () Bool)

(assert (=> b!296255 m!309313))

(push 1)

