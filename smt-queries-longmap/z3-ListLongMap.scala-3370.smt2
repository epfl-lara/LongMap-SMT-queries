; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46274 () Bool)

(assert start!46274)

(declare-fun b!512595 () Bool)

(declare-fun res!313259 () Bool)

(declare-fun e!299328 () Bool)

(assert (=> b!512595 (=> (not res!313259) (not e!299328))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512595 (= res!313259 (validKeyInArray!0 k0!2280))))

(declare-fun res!313257 () Bool)

(assert (=> start!46274 (=> (not res!313257) (not e!299328))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46274 (= res!313257 (validMask!0 mask!3524))))

(assert (=> start!46274 e!299328))

(assert (=> start!46274 true))

(declare-datatypes ((array!32928 0))(
  ( (array!32929 (arr!15841 (Array (_ BitVec 32) (_ BitVec 64))) (size!16205 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32928)

(declare-fun array_inv!11637 (array!32928) Bool)

(assert (=> start!46274 (array_inv!11637 a!3235)))

(declare-fun b!512596 () Bool)

(declare-fun res!313264 () Bool)

(declare-fun e!299331 () Bool)

(assert (=> b!512596 (=> (not res!313264) (not e!299331))))

(declare-datatypes ((List!9999 0))(
  ( (Nil!9996) (Cons!9995 (h!10875 (_ BitVec 64)) (t!16227 List!9999)) )
))
(declare-fun arrayNoDuplicates!0 (array!32928 (_ BitVec 32) List!9999) Bool)

(assert (=> b!512596 (= res!313264 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9996))))

(declare-fun b!512597 () Bool)

(declare-fun e!299329 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4308 0))(
  ( (MissingZero!4308 (index!19420 (_ BitVec 32))) (Found!4308 (index!19421 (_ BitVec 32))) (Intermediate!4308 (undefined!5120 Bool) (index!19422 (_ BitVec 32)) (x!48363 (_ BitVec 32))) (Undefined!4308) (MissingVacant!4308 (index!19423 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32928 (_ BitVec 32)) SeekEntryResult!4308)

(assert (=> b!512597 (= e!299329 (= (seekEntryOrOpen!0 (select (arr!15841 a!3235) j!176) a!3235 mask!3524) (Found!4308 j!176)))))

(declare-fun b!512598 () Bool)

(declare-fun res!313262 () Bool)

(assert (=> b!512598 (=> (not res!313262) (not e!299328))))

(declare-fun arrayContainsKey!0 (array!32928 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512598 (= res!313262 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512599 () Bool)

(assert (=> b!512599 (= e!299331 (not true))))

(declare-fun lt!234678 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!234681 () SeekEntryResult!4308)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32928 (_ BitVec 32)) SeekEntryResult!4308)

(assert (=> b!512599 (= lt!234681 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234678 (select (store (arr!15841 a!3235) i!1204 k0!2280) j!176) (array!32929 (store (arr!15841 a!3235) i!1204 k0!2280) (size!16205 a!3235)) mask!3524))))

(declare-fun lt!234677 () SeekEntryResult!4308)

(declare-fun lt!234680 () (_ BitVec 32))

(assert (=> b!512599 (= lt!234677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234680 (select (arr!15841 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512599 (= lt!234678 (toIndex!0 (select (store (arr!15841 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!512599 (= lt!234680 (toIndex!0 (select (arr!15841 a!3235) j!176) mask!3524))))

(assert (=> b!512599 e!299329))

(declare-fun res!313258 () Bool)

(assert (=> b!512599 (=> (not res!313258) (not e!299329))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32928 (_ BitVec 32)) Bool)

(assert (=> b!512599 (= res!313258 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15874 0))(
  ( (Unit!15875) )
))
(declare-fun lt!234679 () Unit!15874)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32928 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15874)

(assert (=> b!512599 (= lt!234679 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512600 () Bool)

(declare-fun res!313265 () Bool)

(assert (=> b!512600 (=> (not res!313265) (not e!299328))))

(assert (=> b!512600 (= res!313265 (and (= (size!16205 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16205 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16205 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512601 () Bool)

(assert (=> b!512601 (= e!299328 e!299331)))

(declare-fun res!313260 () Bool)

(assert (=> b!512601 (=> (not res!313260) (not e!299331))))

(declare-fun lt!234682 () SeekEntryResult!4308)

(assert (=> b!512601 (= res!313260 (or (= lt!234682 (MissingZero!4308 i!1204)) (= lt!234682 (MissingVacant!4308 i!1204))))))

(assert (=> b!512601 (= lt!234682 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!512602 () Bool)

(declare-fun res!313263 () Bool)

(assert (=> b!512602 (=> (not res!313263) (not e!299328))))

(assert (=> b!512602 (= res!313263 (validKeyInArray!0 (select (arr!15841 a!3235) j!176)))))

(declare-fun b!512603 () Bool)

(declare-fun res!313261 () Bool)

(assert (=> b!512603 (=> (not res!313261) (not e!299331))))

(assert (=> b!512603 (= res!313261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46274 res!313257) b!512600))

(assert (= (and b!512600 res!313265) b!512602))

(assert (= (and b!512602 res!313263) b!512595))

(assert (= (and b!512595 res!313259) b!512598))

(assert (= (and b!512598 res!313262) b!512601))

(assert (= (and b!512601 res!313260) b!512603))

(assert (= (and b!512603 res!313261) b!512596))

(assert (= (and b!512596 res!313264) b!512599))

(assert (= (and b!512599 res!313258) b!512597))

(declare-fun m!494289 () Bool)

(assert (=> b!512595 m!494289))

(declare-fun m!494291 () Bool)

(assert (=> b!512596 m!494291))

(declare-fun m!494293 () Bool)

(assert (=> start!46274 m!494293))

(declare-fun m!494295 () Bool)

(assert (=> start!46274 m!494295))

(declare-fun m!494297 () Bool)

(assert (=> b!512603 m!494297))

(declare-fun m!494299 () Bool)

(assert (=> b!512598 m!494299))

(declare-fun m!494301 () Bool)

(assert (=> b!512597 m!494301))

(assert (=> b!512597 m!494301))

(declare-fun m!494303 () Bool)

(assert (=> b!512597 m!494303))

(assert (=> b!512602 m!494301))

(assert (=> b!512602 m!494301))

(declare-fun m!494305 () Bool)

(assert (=> b!512602 m!494305))

(declare-fun m!494307 () Bool)

(assert (=> b!512601 m!494307))

(declare-fun m!494309 () Bool)

(assert (=> b!512599 m!494309))

(declare-fun m!494311 () Bool)

(assert (=> b!512599 m!494311))

(declare-fun m!494313 () Bool)

(assert (=> b!512599 m!494313))

(assert (=> b!512599 m!494313))

(declare-fun m!494315 () Bool)

(assert (=> b!512599 m!494315))

(assert (=> b!512599 m!494301))

(declare-fun m!494317 () Bool)

(assert (=> b!512599 m!494317))

(assert (=> b!512599 m!494301))

(declare-fun m!494319 () Bool)

(assert (=> b!512599 m!494319))

(assert (=> b!512599 m!494301))

(declare-fun m!494321 () Bool)

(assert (=> b!512599 m!494321))

(assert (=> b!512599 m!494313))

(declare-fun m!494323 () Bool)

(assert (=> b!512599 m!494323))

(check-sat (not b!512599) (not start!46274) (not b!512596) (not b!512595) (not b!512598) (not b!512603) (not b!512602) (not b!512601) (not b!512597))
(check-sat)
