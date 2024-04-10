; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29184 () Bool)

(assert start!29184)

(declare-fun b!296158 () Bool)

(declare-fun res!155967 () Bool)

(declare-fun e!187184 () Bool)

(assert (=> b!296158 (=> (not res!155967) (not e!187184))))

(declare-datatypes ((array!14987 0))(
  ( (array!14988 (arr!7104 (Array (_ BitVec 32) (_ BitVec 64))) (size!7456 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14987)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14987 (_ BitVec 32)) Bool)

(assert (=> b!296158 (= res!155967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296159 () Bool)

(declare-fun e!187185 () Bool)

(assert (=> b!296159 (= e!187185 (not true))))

(declare-datatypes ((SeekEntryResult!2253 0))(
  ( (MissingZero!2253 (index!11182 (_ BitVec 32))) (Found!2253 (index!11183 (_ BitVec 32))) (Intermediate!2253 (undefined!3065 Bool) (index!11184 (_ BitVec 32)) (x!29393 (_ BitVec 32))) (Undefined!2253) (MissingVacant!2253 (index!11185 (_ BitVec 32))) )
))
(declare-fun lt!147009 () SeekEntryResult!2253)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!296159 (and (= (select (arr!7104 a!3312) (index!11184 lt!147009)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11184 lt!147009) i!1256))))

(declare-fun b!296160 () Bool)

(declare-fun e!187183 () Bool)

(assert (=> b!296160 (= e!187184 e!187183)))

(declare-fun res!155971 () Bool)

(assert (=> b!296160 (=> (not res!155971) (not e!187183))))

(declare-fun lt!147004 () Bool)

(assert (=> b!296160 (= res!155971 lt!147004)))

(declare-fun lt!147008 () SeekEntryResult!2253)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun lt!147007 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14987 (_ BitVec 32)) SeekEntryResult!2253)

(assert (=> b!296160 (= lt!147008 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147007 k0!2524 (array!14988 (store (arr!7104 a!3312) i!1256 k0!2524) (size!7456 a!3312)) mask!3809))))

(assert (=> b!296160 (= lt!147009 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147007 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296160 (= lt!147007 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!296161 () Bool)

(declare-fun res!155970 () Bool)

(declare-fun e!187186 () Bool)

(assert (=> b!296161 (=> (not res!155970) (not e!187186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296161 (= res!155970 (validKeyInArray!0 k0!2524))))

(declare-fun b!296162 () Bool)

(assert (=> b!296162 (= e!187183 e!187185)))

(declare-fun res!155972 () Bool)

(assert (=> b!296162 (=> (not res!155972) (not e!187185))))

(declare-fun lt!147006 () Bool)

(assert (=> b!296162 (= res!155972 (and (or lt!147006 (not (undefined!3065 lt!147009))) (or lt!147006 (not (= (select (arr!7104 a!3312) (index!11184 lt!147009)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147006 (not (= (select (arr!7104 a!3312) (index!11184 lt!147009)) k0!2524))) (not lt!147006)))))

(get-info :version)

(assert (=> b!296162 (= lt!147006 (not ((_ is Intermediate!2253) lt!147009)))))

(declare-fun b!296163 () Bool)

(assert (=> b!296163 (= e!187186 e!187184)))

(declare-fun res!155969 () Bool)

(assert (=> b!296163 (=> (not res!155969) (not e!187184))))

(declare-fun lt!147005 () SeekEntryResult!2253)

(assert (=> b!296163 (= res!155969 (or lt!147004 (= lt!147005 (MissingVacant!2253 i!1256))))))

(assert (=> b!296163 (= lt!147004 (= lt!147005 (MissingZero!2253 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14987 (_ BitVec 32)) SeekEntryResult!2253)

(assert (=> b!296163 (= lt!147005 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!155973 () Bool)

(assert (=> start!29184 (=> (not res!155973) (not e!187186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29184 (= res!155973 (validMask!0 mask!3809))))

(assert (=> start!29184 e!187186))

(assert (=> start!29184 true))

(declare-fun array_inv!5067 (array!14987) Bool)

(assert (=> start!29184 (array_inv!5067 a!3312)))

(declare-fun b!296164 () Bool)

(declare-fun res!155968 () Bool)

(assert (=> b!296164 (=> (not res!155968) (not e!187186))))

(assert (=> b!296164 (= res!155968 (and (= (size!7456 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7456 a!3312))))))

(declare-fun b!296165 () Bool)

(declare-fun res!155966 () Bool)

(assert (=> b!296165 (=> (not res!155966) (not e!187186))))

(declare-fun arrayContainsKey!0 (array!14987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296165 (= res!155966 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29184 res!155973) b!296164))

(assert (= (and b!296164 res!155968) b!296161))

(assert (= (and b!296161 res!155970) b!296165))

(assert (= (and b!296165 res!155966) b!296163))

(assert (= (and b!296163 res!155969) b!296158))

(assert (= (and b!296158 res!155967) b!296160))

(assert (= (and b!296160 res!155971) b!296162))

(assert (= (and b!296162 res!155972) b!296159))

(declare-fun m!309205 () Bool)

(assert (=> b!296161 m!309205))

(declare-fun m!309207 () Bool)

(assert (=> b!296160 m!309207))

(declare-fun m!309209 () Bool)

(assert (=> b!296160 m!309209))

(declare-fun m!309211 () Bool)

(assert (=> b!296160 m!309211))

(declare-fun m!309213 () Bool)

(assert (=> b!296160 m!309213))

(declare-fun m!309215 () Bool)

(assert (=> b!296158 m!309215))

(declare-fun m!309217 () Bool)

(assert (=> b!296162 m!309217))

(declare-fun m!309219 () Bool)

(assert (=> start!29184 m!309219))

(declare-fun m!309221 () Bool)

(assert (=> start!29184 m!309221))

(declare-fun m!309223 () Bool)

(assert (=> b!296165 m!309223))

(declare-fun m!309225 () Bool)

(assert (=> b!296163 m!309225))

(assert (=> b!296159 m!309217))

(check-sat (not b!296158) (not b!296165) (not b!296160) (not b!296161) (not start!29184) (not b!296163))
(check-sat)
