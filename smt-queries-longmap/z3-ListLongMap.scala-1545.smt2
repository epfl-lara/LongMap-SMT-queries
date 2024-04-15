; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29234 () Bool)

(assert start!29234)

(declare-fun b!296319 () Bool)

(declare-fun e!187279 () Bool)

(declare-fun e!187278 () Bool)

(assert (=> b!296319 (= e!187279 e!187278)))

(declare-fun res!156120 () Bool)

(assert (=> b!296319 (=> (not res!156120) (not e!187278))))

(declare-datatypes ((SeekEntryResult!2255 0))(
  ( (MissingZero!2255 (index!11190 (_ BitVec 32))) (Found!2255 (index!11191 (_ BitVec 32))) (Intermediate!2255 (undefined!3067 Bool) (index!11192 (_ BitVec 32)) (x!29421 (_ BitVec 32))) (Undefined!2255) (MissingVacant!2255 (index!11193 (_ BitVec 32))) )
))
(declare-fun lt!147022 () SeekEntryResult!2255)

(declare-fun lt!147024 () Bool)

(declare-datatypes ((array!14995 0))(
  ( (array!14996 (arr!7107 (Array (_ BitVec 32) (_ BitVec 64))) (size!7460 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14995)

(declare-fun k0!2524 () (_ BitVec 64))

(assert (=> b!296319 (= res!156120 (and (or lt!147024 (not (undefined!3067 lt!147022))) (or lt!147024 (not (= (select (arr!7107 a!3312) (index!11192 lt!147022)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147024 (not (= (select (arr!7107 a!3312) (index!11192 lt!147022)) k0!2524))) (not lt!147024)))))

(get-info :version)

(assert (=> b!296319 (= lt!147024 (not ((_ is Intermediate!2255) lt!147022)))))

(declare-fun b!296320 () Bool)

(declare-fun e!187276 () Bool)

(assert (=> b!296320 (= e!187276 e!187279)))

(declare-fun res!156119 () Bool)

(assert (=> b!296320 (=> (not res!156119) (not e!187279))))

(declare-fun lt!147023 () Bool)

(assert (=> b!296320 (= res!156119 lt!147023)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!147026 () SeekEntryResult!2255)

(declare-fun lt!147025 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14995 (_ BitVec 32)) SeekEntryResult!2255)

(assert (=> b!296320 (= lt!147026 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147025 k0!2524 (array!14996 (store (arr!7107 a!3312) i!1256 k0!2524) (size!7460 a!3312)) mask!3809))))

(assert (=> b!296320 (= lt!147022 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147025 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296320 (= lt!147025 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!296321 () Bool)

(declare-fun res!156116 () Bool)

(assert (=> b!296321 (=> (not res!156116) (not e!187276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14995 (_ BitVec 32)) Bool)

(assert (=> b!296321 (= res!156116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296322 () Bool)

(assert (=> b!296322 (= e!187278 (not true))))

(assert (=> b!296322 (and (= (select (arr!7107 a!3312) (index!11192 lt!147022)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11192 lt!147022) i!1256))))

(declare-fun b!296323 () Bool)

(declare-fun res!156115 () Bool)

(declare-fun e!187277 () Bool)

(assert (=> b!296323 (=> (not res!156115) (not e!187277))))

(declare-fun arrayContainsKey!0 (array!14995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296323 (= res!156115 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296324 () Bool)

(assert (=> b!296324 (= e!187277 e!187276)))

(declare-fun res!156117 () Bool)

(assert (=> b!296324 (=> (not res!156117) (not e!187276))))

(declare-fun lt!147027 () SeekEntryResult!2255)

(assert (=> b!296324 (= res!156117 (or lt!147023 (= lt!147027 (MissingVacant!2255 i!1256))))))

(assert (=> b!296324 (= lt!147023 (= lt!147027 (MissingZero!2255 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14995 (_ BitVec 32)) SeekEntryResult!2255)

(assert (=> b!296324 (= lt!147027 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!296325 () Bool)

(declare-fun res!156114 () Bool)

(assert (=> b!296325 (=> (not res!156114) (not e!187277))))

(assert (=> b!296325 (= res!156114 (and (= (size!7460 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7460 a!3312))))))

(declare-fun b!296326 () Bool)

(declare-fun res!156121 () Bool)

(assert (=> b!296326 (=> (not res!156121) (not e!187277))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296326 (= res!156121 (validKeyInArray!0 k0!2524))))

(declare-fun res!156118 () Bool)

(assert (=> start!29234 (=> (not res!156118) (not e!187277))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29234 (= res!156118 (validMask!0 mask!3809))))

(assert (=> start!29234 e!187277))

(assert (=> start!29234 true))

(declare-fun array_inv!5079 (array!14995) Bool)

(assert (=> start!29234 (array_inv!5079 a!3312)))

(assert (= (and start!29234 res!156118) b!296325))

(assert (= (and b!296325 res!156114) b!296326))

(assert (= (and b!296326 res!156121) b!296323))

(assert (= (and b!296323 res!156115) b!296324))

(assert (= (and b!296324 res!156117) b!296321))

(assert (= (and b!296321 res!156116) b!296320))

(assert (= (and b!296320 res!156119) b!296319))

(assert (= (and b!296319 res!156120) b!296322))

(declare-fun m!308805 () Bool)

(assert (=> b!296320 m!308805))

(declare-fun m!308807 () Bool)

(assert (=> b!296320 m!308807))

(declare-fun m!308809 () Bool)

(assert (=> b!296320 m!308809))

(declare-fun m!308811 () Bool)

(assert (=> b!296320 m!308811))

(declare-fun m!308813 () Bool)

(assert (=> b!296319 m!308813))

(declare-fun m!308815 () Bool)

(assert (=> b!296323 m!308815))

(declare-fun m!308817 () Bool)

(assert (=> b!296321 m!308817))

(assert (=> b!296322 m!308813))

(declare-fun m!308819 () Bool)

(assert (=> start!29234 m!308819))

(declare-fun m!308821 () Bool)

(assert (=> start!29234 m!308821))

(declare-fun m!308823 () Bool)

(assert (=> b!296324 m!308823))

(declare-fun m!308825 () Bool)

(assert (=> b!296326 m!308825))

(check-sat (not b!296323) (not b!296321) (not b!296326) (not b!296320) (not b!296324) (not start!29234))
(check-sat)
