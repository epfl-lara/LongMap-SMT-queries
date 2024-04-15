; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46248 () Bool)

(assert start!46248)

(declare-fun b!512119 () Bool)

(declare-fun e!299073 () Bool)

(assert (=> b!512119 (= e!299073 true)))

(declare-datatypes ((SeekEntryResult!4297 0))(
  ( (MissingZero!4297 (index!19376 (_ BitVec 32))) (Found!4297 (index!19377 (_ BitVec 32))) (Intermediate!4297 (undefined!5109 Bool) (index!19378 (_ BitVec 32)) (x!48331 (_ BitVec 32))) (Undefined!4297) (MissingVacant!4297 (index!19379 (_ BitVec 32))) )
))
(declare-fun lt!234319 () SeekEntryResult!4297)

(assert (=> b!512119 (= lt!234319 Undefined!4297)))

(declare-fun b!512120 () Bool)

(declare-fun res!312924 () Bool)

(declare-fun e!299071 () Bool)

(assert (=> b!512120 (=> (not res!312924) (not e!299071))))

(declare-datatypes ((array!32912 0))(
  ( (array!32913 (arr!15833 (Array (_ BitVec 32) (_ BitVec 64))) (size!16198 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32912)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32912 (_ BitVec 32)) Bool)

(assert (=> b!512120 (= res!312924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512121 () Bool)

(declare-fun res!312923 () Bool)

(declare-fun e!299070 () Bool)

(assert (=> b!512121 (=> (not res!312923) (not e!299070))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!512121 (= res!312923 (and (= (size!16198 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16198 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16198 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512122 () Bool)

(assert (=> b!512122 (= e!299071 (not e!299073))))

(declare-fun res!312931 () Bool)

(assert (=> b!512122 (=> res!312931 e!299073)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!234321 () SeekEntryResult!4297)

(declare-fun lt!234318 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32912 (_ BitVec 32)) SeekEntryResult!4297)

(assert (=> b!512122 (= res!312931 (= lt!234321 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234318 (select (store (arr!15833 a!3235) i!1204 k0!2280) j!176) (array!32913 (store (arr!15833 a!3235) i!1204 k0!2280) (size!16198 a!3235)) mask!3524)))))

(declare-fun lt!234322 () (_ BitVec 32))

(assert (=> b!512122 (= lt!234321 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234322 (select (arr!15833 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512122 (= lt!234318 (toIndex!0 (select (store (arr!15833 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!512122 (= lt!234322 (toIndex!0 (select (arr!15833 a!3235) j!176) mask!3524))))

(assert (=> b!512122 (= lt!234319 (Found!4297 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32912 (_ BitVec 32)) SeekEntryResult!4297)

(assert (=> b!512122 (= lt!234319 (seekEntryOrOpen!0 (select (arr!15833 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!512122 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15838 0))(
  ( (Unit!15839) )
))
(declare-fun lt!234320 () Unit!15838)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32912 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15838)

(assert (=> b!512122 (= lt!234320 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512123 () Bool)

(declare-fun res!312930 () Bool)

(assert (=> b!512123 (=> (not res!312930) (not e!299070))))

(declare-fun arrayContainsKey!0 (array!32912 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512123 (= res!312930 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!312927 () Bool)

(assert (=> start!46248 (=> (not res!312927) (not e!299070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46248 (= res!312927 (validMask!0 mask!3524))))

(assert (=> start!46248 e!299070))

(assert (=> start!46248 true))

(declare-fun array_inv!11716 (array!32912) Bool)

(assert (=> start!46248 (array_inv!11716 a!3235)))

(declare-fun b!512124 () Bool)

(assert (=> b!512124 (= e!299070 e!299071)))

(declare-fun res!312925 () Bool)

(assert (=> b!512124 (=> (not res!312925) (not e!299071))))

(declare-fun lt!234317 () SeekEntryResult!4297)

(assert (=> b!512124 (= res!312925 (or (= lt!234317 (MissingZero!4297 i!1204)) (= lt!234317 (MissingVacant!4297 i!1204))))))

(assert (=> b!512124 (= lt!234317 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!512125 () Bool)

(declare-fun res!312928 () Bool)

(assert (=> b!512125 (=> (not res!312928) (not e!299071))))

(declare-datatypes ((List!10030 0))(
  ( (Nil!10027) (Cons!10026 (h!10906 (_ BitVec 64)) (t!16249 List!10030)) )
))
(declare-fun arrayNoDuplicates!0 (array!32912 (_ BitVec 32) List!10030) Bool)

(assert (=> b!512125 (= res!312928 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10027))))

(declare-fun b!512126 () Bool)

(declare-fun res!312926 () Bool)

(assert (=> b!512126 (=> (not res!312926) (not e!299070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512126 (= res!312926 (validKeyInArray!0 k0!2280))))

(declare-fun b!512127 () Bool)

(declare-fun res!312929 () Bool)

(assert (=> b!512127 (=> res!312929 e!299073)))

(get-info :version)

(assert (=> b!512127 (= res!312929 (or (not ((_ is Intermediate!4297) lt!234321)) (not (undefined!5109 lt!234321))))))

(declare-fun b!512128 () Bool)

(declare-fun res!312932 () Bool)

(assert (=> b!512128 (=> (not res!312932) (not e!299070))))

(assert (=> b!512128 (= res!312932 (validKeyInArray!0 (select (arr!15833 a!3235) j!176)))))

(assert (= (and start!46248 res!312927) b!512121))

(assert (= (and b!512121 res!312923) b!512128))

(assert (= (and b!512128 res!312932) b!512126))

(assert (= (and b!512126 res!312926) b!512123))

(assert (= (and b!512123 res!312930) b!512124))

(assert (= (and b!512124 res!312925) b!512120))

(assert (= (and b!512120 res!312924) b!512125))

(assert (= (and b!512125 res!312928) b!512122))

(assert (= (and b!512122 (not res!312931)) b!512127))

(assert (= (and b!512127 (not res!312929)) b!512119))

(declare-fun m!493285 () Bool)

(assert (=> start!46248 m!493285))

(declare-fun m!493287 () Bool)

(assert (=> start!46248 m!493287))

(declare-fun m!493289 () Bool)

(assert (=> b!512126 m!493289))

(declare-fun m!493291 () Bool)

(assert (=> b!512122 m!493291))

(declare-fun m!493293 () Bool)

(assert (=> b!512122 m!493293))

(declare-fun m!493295 () Bool)

(assert (=> b!512122 m!493295))

(declare-fun m!493297 () Bool)

(assert (=> b!512122 m!493297))

(declare-fun m!493299 () Bool)

(assert (=> b!512122 m!493299))

(assert (=> b!512122 m!493297))

(declare-fun m!493301 () Bool)

(assert (=> b!512122 m!493301))

(assert (=> b!512122 m!493297))

(declare-fun m!493303 () Bool)

(assert (=> b!512122 m!493303))

(assert (=> b!512122 m!493297))

(declare-fun m!493305 () Bool)

(assert (=> b!512122 m!493305))

(assert (=> b!512122 m!493295))

(declare-fun m!493307 () Bool)

(assert (=> b!512122 m!493307))

(assert (=> b!512122 m!493295))

(declare-fun m!493309 () Bool)

(assert (=> b!512122 m!493309))

(declare-fun m!493311 () Bool)

(assert (=> b!512120 m!493311))

(declare-fun m!493313 () Bool)

(assert (=> b!512123 m!493313))

(assert (=> b!512128 m!493297))

(assert (=> b!512128 m!493297))

(declare-fun m!493315 () Bool)

(assert (=> b!512128 m!493315))

(declare-fun m!493317 () Bool)

(assert (=> b!512125 m!493317))

(declare-fun m!493319 () Bool)

(assert (=> b!512124 m!493319))

(check-sat (not b!512123) (not b!512125) (not b!512126) (not b!512120) (not b!512124) (not start!46248) (not b!512122) (not b!512128))
(check-sat)
