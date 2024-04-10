; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29178 () Bool)

(assert start!29178)

(declare-fun b!296086 () Bool)

(declare-fun e!187141 () Bool)

(declare-fun e!187140 () Bool)

(assert (=> b!296086 (= e!187141 e!187140)))

(declare-fun res!155894 () Bool)

(assert (=> b!296086 (=> (not res!155894) (not e!187140))))

(declare-fun lt!146955 () Bool)

(assert (=> b!296086 (= res!155894 lt!146955)))

(declare-fun lt!146952 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2250 0))(
  ( (MissingZero!2250 (index!11170 (_ BitVec 32))) (Found!2250 (index!11171 (_ BitVec 32))) (Intermediate!2250 (undefined!3062 Bool) (index!11172 (_ BitVec 32)) (x!29382 (_ BitVec 32))) (Undefined!2250) (MissingVacant!2250 (index!11173 (_ BitVec 32))) )
))
(declare-fun lt!146954 () SeekEntryResult!2250)

(declare-datatypes ((array!14981 0))(
  ( (array!14982 (arr!7101 (Array (_ BitVec 32) (_ BitVec 64))) (size!7453 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14981)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14981 (_ BitVec 32)) SeekEntryResult!2250)

(assert (=> b!296086 (= lt!146954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146952 k0!2524 (array!14982 (store (arr!7101 a!3312) i!1256 k0!2524) (size!7453 a!3312)) mask!3809))))

(declare-fun lt!146953 () SeekEntryResult!2250)

(assert (=> b!296086 (= lt!146953 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146952 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296086 (= lt!146952 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!296087 () Bool)

(declare-fun e!187138 () Bool)

(assert (=> b!296087 (= e!187140 e!187138)))

(declare-fun res!155895 () Bool)

(assert (=> b!296087 (=> (not res!155895) (not e!187138))))

(declare-fun lt!146950 () Bool)

(assert (=> b!296087 (= res!155895 (and (or lt!146950 (not (undefined!3062 lt!146953))) (or lt!146950 (not (= (select (arr!7101 a!3312) (index!11172 lt!146953)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146950 (not (= (select (arr!7101 a!3312) (index!11172 lt!146953)) k0!2524))) (not lt!146950)))))

(get-info :version)

(assert (=> b!296087 (= lt!146950 (not ((_ is Intermediate!2250) lt!146953)))))

(declare-fun b!296088 () Bool)

(declare-fun res!155898 () Bool)

(declare-fun e!187137 () Bool)

(assert (=> b!296088 (=> (not res!155898) (not e!187137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296088 (= res!155898 (validKeyInArray!0 k0!2524))))

(declare-fun res!155901 () Bool)

(assert (=> start!29178 (=> (not res!155901) (not e!187137))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29178 (= res!155901 (validMask!0 mask!3809))))

(assert (=> start!29178 e!187137))

(assert (=> start!29178 true))

(declare-fun array_inv!5064 (array!14981) Bool)

(assert (=> start!29178 (array_inv!5064 a!3312)))

(declare-fun b!296089 () Bool)

(declare-fun res!155900 () Bool)

(assert (=> b!296089 (=> (not res!155900) (not e!187137))))

(assert (=> b!296089 (= res!155900 (and (= (size!7453 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7453 a!3312))))))

(declare-fun b!296090 () Bool)

(declare-fun res!155899 () Bool)

(assert (=> b!296090 (=> (not res!155899) (not e!187137))))

(declare-fun arrayContainsKey!0 (array!14981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296090 (= res!155899 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296091 () Bool)

(assert (=> b!296091 (= e!187137 e!187141)))

(declare-fun res!155897 () Bool)

(assert (=> b!296091 (=> (not res!155897) (not e!187141))))

(declare-fun lt!146951 () SeekEntryResult!2250)

(assert (=> b!296091 (= res!155897 (or lt!146955 (= lt!146951 (MissingVacant!2250 i!1256))))))

(assert (=> b!296091 (= lt!146955 (= lt!146951 (MissingZero!2250 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14981 (_ BitVec 32)) SeekEntryResult!2250)

(assert (=> b!296091 (= lt!146951 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!296092 () Bool)

(assert (=> b!296092 (= e!187138 (not (= lt!146953 (Intermediate!2250 false (index!11172 lt!146953) (x!29382 lt!146953)))))))

(assert (=> b!296092 (and (= (select (arr!7101 a!3312) (index!11172 lt!146953)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11172 lt!146953) i!1256))))

(declare-fun b!296093 () Bool)

(declare-fun res!155896 () Bool)

(assert (=> b!296093 (=> (not res!155896) (not e!187141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14981 (_ BitVec 32)) Bool)

(assert (=> b!296093 (= res!155896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29178 res!155901) b!296089))

(assert (= (and b!296089 res!155900) b!296088))

(assert (= (and b!296088 res!155898) b!296090))

(assert (= (and b!296090 res!155899) b!296091))

(assert (= (and b!296091 res!155897) b!296093))

(assert (= (and b!296093 res!155896) b!296086))

(assert (= (and b!296086 res!155894) b!296087))

(assert (= (and b!296087 res!155895) b!296092))

(declare-fun m!309139 () Bool)

(assert (=> b!296090 m!309139))

(declare-fun m!309141 () Bool)

(assert (=> b!296086 m!309141))

(declare-fun m!309143 () Bool)

(assert (=> b!296086 m!309143))

(declare-fun m!309145 () Bool)

(assert (=> b!296086 m!309145))

(declare-fun m!309147 () Bool)

(assert (=> b!296086 m!309147))

(declare-fun m!309149 () Bool)

(assert (=> b!296092 m!309149))

(assert (=> b!296087 m!309149))

(declare-fun m!309151 () Bool)

(assert (=> b!296091 m!309151))

(declare-fun m!309153 () Bool)

(assert (=> start!29178 m!309153))

(declare-fun m!309155 () Bool)

(assert (=> start!29178 m!309155))

(declare-fun m!309157 () Bool)

(assert (=> b!296093 m!309157))

(declare-fun m!309159 () Bool)

(assert (=> b!296088 m!309159))

(check-sat (not b!296093) (not start!29178) (not b!296086) (not b!296091) (not b!296088) (not b!296090))
(check-sat)
