; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29190 () Bool)

(assert start!29190)

(declare-fun res!156045 () Bool)

(declare-fun e!187228 () Bool)

(assert (=> start!29190 (=> (not res!156045) (not e!187228))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29190 (= res!156045 (validMask!0 mask!3809))))

(assert (=> start!29190 e!187228))

(assert (=> start!29190 true))

(declare-datatypes ((array!14993 0))(
  ( (array!14994 (arr!7107 (Array (_ BitVec 32) (_ BitVec 64))) (size!7459 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14993)

(declare-fun array_inv!5070 (array!14993) Bool)

(assert (=> start!29190 (array_inv!5070 a!3312)))

(declare-fun b!296230 () Bool)

(declare-fun res!156043 () Bool)

(assert (=> b!296230 (=> (not res!156043) (not e!187228))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296230 (= res!156043 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296231 () Bool)

(declare-fun res!156044 () Bool)

(assert (=> b!296231 (=> (not res!156044) (not e!187228))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!296231 (= res!156044 (and (= (size!7459 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7459 a!3312))))))

(declare-fun b!296232 () Bool)

(declare-fun e!187231 () Bool)

(declare-fun e!187227 () Bool)

(assert (=> b!296232 (= e!187231 e!187227)))

(declare-fun res!156042 () Bool)

(assert (=> b!296232 (=> (not res!156042) (not e!187227))))

(declare-datatypes ((SeekEntryResult!2256 0))(
  ( (MissingZero!2256 (index!11194 (_ BitVec 32))) (Found!2256 (index!11195 (_ BitVec 32))) (Intermediate!2256 (undefined!3068 Bool) (index!11196 (_ BitVec 32)) (x!29404 (_ BitVec 32))) (Undefined!2256) (MissingVacant!2256 (index!11197 (_ BitVec 32))) )
))
(declare-fun lt!147060 () SeekEntryResult!2256)

(declare-fun lt!147058 () Bool)

(assert (=> b!296232 (= res!156042 (and (or lt!147058 (not (undefined!3068 lt!147060))) (or lt!147058 (not (= (select (arr!7107 a!3312) (index!11196 lt!147060)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147058 (not (= (select (arr!7107 a!3312) (index!11196 lt!147060)) k0!2524))) (not lt!147058)))))

(get-info :version)

(assert (=> b!296232 (= lt!147058 (not ((_ is Intermediate!2256) lt!147060)))))

(declare-fun b!296233 () Bool)

(declare-fun e!187230 () Bool)

(assert (=> b!296233 (= e!187230 e!187231)))

(declare-fun res!156040 () Bool)

(assert (=> b!296233 (=> (not res!156040) (not e!187231))))

(declare-fun lt!147063 () Bool)

(assert (=> b!296233 (= res!156040 lt!147063)))

(declare-fun lt!147062 () (_ BitVec 32))

(declare-fun lt!147061 () SeekEntryResult!2256)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14993 (_ BitVec 32)) SeekEntryResult!2256)

(assert (=> b!296233 (= lt!147061 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147062 k0!2524 (array!14994 (store (arr!7107 a!3312) i!1256 k0!2524) (size!7459 a!3312)) mask!3809))))

(assert (=> b!296233 (= lt!147060 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147062 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296233 (= lt!147062 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!296234 () Bool)

(declare-fun res!156041 () Bool)

(assert (=> b!296234 (=> (not res!156041) (not e!187228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296234 (= res!156041 (validKeyInArray!0 k0!2524))))

(declare-fun b!296235 () Bool)

(declare-fun res!156039 () Bool)

(assert (=> b!296235 (=> (not res!156039) (not e!187230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14993 (_ BitVec 32)) Bool)

(assert (=> b!296235 (= res!156039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296236 () Bool)

(assert (=> b!296236 (= e!187228 e!187230)))

(declare-fun res!156038 () Bool)

(assert (=> b!296236 (=> (not res!156038) (not e!187230))))

(declare-fun lt!147059 () SeekEntryResult!2256)

(assert (=> b!296236 (= res!156038 (or lt!147063 (= lt!147059 (MissingVacant!2256 i!1256))))))

(assert (=> b!296236 (= lt!147063 (= lt!147059 (MissingZero!2256 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14993 (_ BitVec 32)) SeekEntryResult!2256)

(assert (=> b!296236 (= lt!147059 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!296237 () Bool)

(assert (=> b!296237 (= e!187227 (not true))))

(assert (=> b!296237 (and (= (select (arr!7107 a!3312) (index!11196 lt!147060)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11196 lt!147060) i!1256))))

(assert (= (and start!29190 res!156045) b!296231))

(assert (= (and b!296231 res!156044) b!296234))

(assert (= (and b!296234 res!156041) b!296230))

(assert (= (and b!296230 res!156043) b!296236))

(assert (= (and b!296236 res!156038) b!296235))

(assert (= (and b!296235 res!156039) b!296233))

(assert (= (and b!296233 res!156040) b!296232))

(assert (= (and b!296232 res!156042) b!296237))

(declare-fun m!309271 () Bool)

(assert (=> b!296235 m!309271))

(declare-fun m!309273 () Bool)

(assert (=> b!296232 m!309273))

(declare-fun m!309275 () Bool)

(assert (=> b!296236 m!309275))

(declare-fun m!309277 () Bool)

(assert (=> b!296234 m!309277))

(declare-fun m!309279 () Bool)

(assert (=> b!296233 m!309279))

(declare-fun m!309281 () Bool)

(assert (=> b!296233 m!309281))

(declare-fun m!309283 () Bool)

(assert (=> b!296233 m!309283))

(declare-fun m!309285 () Bool)

(assert (=> b!296233 m!309285))

(declare-fun m!309287 () Bool)

(assert (=> start!29190 m!309287))

(declare-fun m!309289 () Bool)

(assert (=> start!29190 m!309289))

(declare-fun m!309291 () Bool)

(assert (=> b!296230 m!309291))

(assert (=> b!296237 m!309273))

(check-sat (not start!29190) (not b!296230) (not b!296234) (not b!296235) (not b!296236) (not b!296233))
(check-sat)
