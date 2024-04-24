; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29182 () Bool)

(assert start!29182)

(declare-fun b!296271 () Bool)

(declare-fun e!187246 () Bool)

(declare-fun e!187250 () Bool)

(assert (=> b!296271 (= e!187246 e!187250)))

(declare-fun res!156045 () Bool)

(assert (=> b!296271 (=> (not res!156045) (not e!187250))))

(declare-fun lt!147110 () Bool)

(assert (=> b!296271 (= res!156045 lt!147110)))

(declare-fun lt!147107 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2219 0))(
  ( (MissingZero!2219 (index!11046 (_ BitVec 32))) (Found!2219 (index!11047 (_ BitVec 32))) (Intermediate!2219 (undefined!3031 Bool) (index!11048 (_ BitVec 32)) (x!29368 (_ BitVec 32))) (Undefined!2219) (MissingVacant!2219 (index!11049 (_ BitVec 32))) )
))
(declare-fun lt!147106 () SeekEntryResult!2219)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14988 0))(
  ( (array!14989 (arr!7105 (Array (_ BitVec 32) (_ BitVec 64))) (size!7457 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14988)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14988 (_ BitVec 32)) SeekEntryResult!2219)

(assert (=> b!296271 (= lt!147106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147107 k0!2524 (array!14989 (store (arr!7105 a!3312) i!1256 k0!2524) (size!7457 a!3312)) mask!3809))))

(declare-fun lt!147111 () SeekEntryResult!2219)

(assert (=> b!296271 (= lt!147111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147107 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296271 (= lt!147107 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!296272 () Bool)

(declare-fun res!156044 () Bool)

(declare-fun e!187248 () Bool)

(assert (=> b!296272 (=> (not res!156044) (not e!187248))))

(assert (=> b!296272 (= res!156044 (and (= (size!7457 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7457 a!3312))))))

(declare-fun b!296274 () Bool)

(declare-fun e!187247 () Bool)

(assert (=> b!296274 (= e!187250 e!187247)))

(declare-fun res!156041 () Bool)

(assert (=> b!296274 (=> (not res!156041) (not e!187247))))

(declare-fun lt!147108 () Bool)

(assert (=> b!296274 (= res!156041 (and (or lt!147108 (not (undefined!3031 lt!147111))) (or lt!147108 (not (= (select (arr!7105 a!3312) (index!11048 lt!147111)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147108 (not (= (select (arr!7105 a!3312) (index!11048 lt!147111)) k0!2524))) (not lt!147108)))))

(get-info :version)

(assert (=> b!296274 (= lt!147108 (not ((_ is Intermediate!2219) lt!147111)))))

(declare-fun b!296275 () Bool)

(declare-fun res!156042 () Bool)

(assert (=> b!296275 (=> (not res!156042) (not e!187248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296275 (= res!156042 (validKeyInArray!0 k0!2524))))

(declare-fun b!296276 () Bool)

(declare-fun res!156043 () Bool)

(assert (=> b!296276 (=> (not res!156043) (not e!187246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14988 (_ BitVec 32)) Bool)

(assert (=> b!296276 (= res!156043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296277 () Bool)

(assert (=> b!296277 (= e!187247 (not true))))

(assert (=> b!296277 (and (= (select (arr!7105 a!3312) (index!11048 lt!147111)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11048 lt!147111) i!1256))))

(declare-fun b!296278 () Bool)

(declare-fun res!156048 () Bool)

(assert (=> b!296278 (=> (not res!156048) (not e!187248))))

(declare-fun arrayContainsKey!0 (array!14988 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296278 (= res!156048 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!156047 () Bool)

(assert (=> start!29182 (=> (not res!156047) (not e!187248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29182 (= res!156047 (validMask!0 mask!3809))))

(assert (=> start!29182 e!187248))

(assert (=> start!29182 true))

(declare-fun array_inv!5055 (array!14988) Bool)

(assert (=> start!29182 (array_inv!5055 a!3312)))

(declare-fun b!296273 () Bool)

(assert (=> b!296273 (= e!187248 e!187246)))

(declare-fun res!156046 () Bool)

(assert (=> b!296273 (=> (not res!156046) (not e!187246))))

(declare-fun lt!147109 () SeekEntryResult!2219)

(assert (=> b!296273 (= res!156046 (or lt!147110 (= lt!147109 (MissingVacant!2219 i!1256))))))

(assert (=> b!296273 (= lt!147110 (= lt!147109 (MissingZero!2219 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14988 (_ BitVec 32)) SeekEntryResult!2219)

(assert (=> b!296273 (= lt!147109 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!29182 res!156047) b!296272))

(assert (= (and b!296272 res!156044) b!296275))

(assert (= (and b!296275 res!156042) b!296278))

(assert (= (and b!296278 res!156048) b!296273))

(assert (= (and b!296273 res!156046) b!296276))

(assert (= (and b!296276 res!156043) b!296271))

(assert (= (and b!296271 res!156045) b!296274))

(assert (= (and b!296274 res!156041) b!296277))

(declare-fun m!309479 () Bool)

(assert (=> b!296271 m!309479))

(declare-fun m!309481 () Bool)

(assert (=> b!296271 m!309481))

(declare-fun m!309483 () Bool)

(assert (=> b!296271 m!309483))

(declare-fun m!309485 () Bool)

(assert (=> b!296271 m!309485))

(declare-fun m!309487 () Bool)

(assert (=> b!296278 m!309487))

(declare-fun m!309489 () Bool)

(assert (=> b!296275 m!309489))

(declare-fun m!309491 () Bool)

(assert (=> b!296277 m!309491))

(declare-fun m!309493 () Bool)

(assert (=> b!296273 m!309493))

(declare-fun m!309495 () Bool)

(assert (=> b!296276 m!309495))

(assert (=> b!296274 m!309491))

(declare-fun m!309497 () Bool)

(assert (=> start!29182 m!309497))

(declare-fun m!309499 () Bool)

(assert (=> start!29182 m!309499))

(check-sat (not b!296276) (not start!29182) (not b!296278) (not b!296275) (not b!296273) (not b!296271))
(check-sat)
