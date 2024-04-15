; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46758 () Bool)

(assert start!46758)

(declare-fun res!316005 () Bool)

(declare-fun e!301287 () Bool)

(assert (=> start!46758 (=> (not res!316005) (not e!301287))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46758 (= res!316005 (validMask!0 mask!3524))))

(assert (=> start!46758 e!301287))

(assert (=> start!46758 true))

(declare-datatypes ((array!33080 0))(
  ( (array!33081 (arr!15908 (Array (_ BitVec 32) (_ BitVec 64))) (size!16273 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33080)

(declare-fun array_inv!11791 (array!33080) Bool)

(assert (=> start!46758 (array_inv!11791 a!3235)))

(declare-fun b!516297 () Bool)

(declare-fun res!316004 () Bool)

(declare-fun e!301286 () Bool)

(assert (=> b!516297 (=> (not res!316004) (not e!301286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33080 (_ BitVec 32)) Bool)

(assert (=> b!516297 (= res!316004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516298 () Bool)

(assert (=> b!516298 (= e!301287 e!301286)))

(declare-fun res!316006 () Bool)

(assert (=> b!516298 (=> (not res!316006) (not e!301286))))

(declare-datatypes ((SeekEntryResult!4372 0))(
  ( (MissingZero!4372 (index!19676 (_ BitVec 32))) (Found!4372 (index!19677 (_ BitVec 32))) (Intermediate!4372 (undefined!5184 Bool) (index!19678 (_ BitVec 32)) (x!48642 (_ BitVec 32))) (Undefined!4372) (MissingVacant!4372 (index!19679 (_ BitVec 32))) )
))
(declare-fun lt!236245 () SeekEntryResult!4372)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!516298 (= res!316006 (or (= lt!236245 (MissingZero!4372 i!1204)) (= lt!236245 (MissingVacant!4372 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33080 (_ BitVec 32)) SeekEntryResult!4372)

(assert (=> b!516298 (= lt!236245 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!516299 () Bool)

(declare-fun res!316003 () Bool)

(assert (=> b!516299 (=> (not res!316003) (not e!301286))))

(declare-datatypes ((List!10105 0))(
  ( (Nil!10102) (Cons!10101 (h!10999 (_ BitVec 64)) (t!16324 List!10105)) )
))
(declare-fun arrayNoDuplicates!0 (array!33080 (_ BitVec 32) List!10105) Bool)

(assert (=> b!516299 (= res!316003 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10102))))

(declare-fun b!516300 () Bool)

(declare-fun e!301290 () Bool)

(assert (=> b!516300 (= e!301286 (not e!301290))))

(declare-fun res!316013 () Bool)

(assert (=> b!516300 (=> res!316013 e!301290)))

(declare-fun lt!236243 () SeekEntryResult!4372)

(declare-fun lt!236241 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33080 (_ BitVec 32)) SeekEntryResult!4372)

(assert (=> b!516300 (= res!316013 (= lt!236243 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236241 (select (store (arr!15908 a!3235) i!1204 k0!2280) j!176) (array!33081 (store (arr!15908 a!3235) i!1204 k0!2280) (size!16273 a!3235)) mask!3524)))))

(declare-fun lt!236244 () (_ BitVec 32))

(assert (=> b!516300 (= lt!236243 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236244 (select (arr!15908 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516300 (= lt!236241 (toIndex!0 (select (store (arr!15908 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!516300 (= lt!236244 (toIndex!0 (select (arr!15908 a!3235) j!176) mask!3524))))

(declare-fun e!301288 () Bool)

(assert (=> b!516300 e!301288))

(declare-fun res!316012 () Bool)

(assert (=> b!516300 (=> (not res!316012) (not e!301288))))

(assert (=> b!516300 (= res!316012 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15988 0))(
  ( (Unit!15989) )
))
(declare-fun lt!236242 () Unit!15988)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33080 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15988)

(assert (=> b!516300 (= lt!236242 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516301 () Bool)

(declare-fun res!316008 () Bool)

(assert (=> b!516301 (=> (not res!316008) (not e!301287))))

(assert (=> b!516301 (= res!316008 (and (= (size!16273 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16273 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16273 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516302 () Bool)

(declare-fun res!316009 () Bool)

(assert (=> b!516302 (=> (not res!316009) (not e!301287))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516302 (= res!316009 (validKeyInArray!0 k0!2280))))

(declare-fun b!516303 () Bool)

(assert (=> b!516303 (= e!301290 (or (not (= (select (arr!15908 a!3235) (index!19678 lt!236243)) (select (arr!15908 a!3235) j!176))) (bvsle (x!48642 lt!236243) #b01111111111111111111111111111110)))))

(assert (=> b!516303 (and (bvslt (x!48642 lt!236243) #b01111111111111111111111111111110) (or (= (select (arr!15908 a!3235) (index!19678 lt!236243)) (select (arr!15908 a!3235) j!176)) (= (select (arr!15908 a!3235) (index!19678 lt!236243)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15908 a!3235) (index!19678 lt!236243)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516304 () Bool)

(declare-fun res!316007 () Bool)

(assert (=> b!516304 (=> res!316007 e!301290)))

(get-info :version)

(assert (=> b!516304 (= res!316007 (or (undefined!5184 lt!236243) (not ((_ is Intermediate!4372) lt!236243))))))

(declare-fun b!516305 () Bool)

(declare-fun res!316011 () Bool)

(assert (=> b!516305 (=> (not res!316011) (not e!301287))))

(assert (=> b!516305 (= res!316011 (validKeyInArray!0 (select (arr!15908 a!3235) j!176)))))

(declare-fun b!516306 () Bool)

(declare-fun res!316010 () Bool)

(assert (=> b!516306 (=> (not res!316010) (not e!301287))))

(declare-fun arrayContainsKey!0 (array!33080 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516306 (= res!316010 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516307 () Bool)

(assert (=> b!516307 (= e!301288 (= (seekEntryOrOpen!0 (select (arr!15908 a!3235) j!176) a!3235 mask!3524) (Found!4372 j!176)))))

(assert (= (and start!46758 res!316005) b!516301))

(assert (= (and b!516301 res!316008) b!516305))

(assert (= (and b!516305 res!316011) b!516302))

(assert (= (and b!516302 res!316009) b!516306))

(assert (= (and b!516306 res!316010) b!516298))

(assert (= (and b!516298 res!316006) b!516297))

(assert (= (and b!516297 res!316004) b!516299))

(assert (= (and b!516299 res!316003) b!516300))

(assert (= (and b!516300 res!316012) b!516307))

(assert (= (and b!516300 (not res!316013)) b!516304))

(assert (= (and b!516304 (not res!316007)) b!516303))

(declare-fun m!497323 () Bool)

(assert (=> b!516297 m!497323))

(declare-fun m!497325 () Bool)

(assert (=> b!516306 m!497325))

(declare-fun m!497327 () Bool)

(assert (=> b!516298 m!497327))

(declare-fun m!497329 () Bool)

(assert (=> b!516305 m!497329))

(assert (=> b!516305 m!497329))

(declare-fun m!497331 () Bool)

(assert (=> b!516305 m!497331))

(assert (=> b!516307 m!497329))

(assert (=> b!516307 m!497329))

(declare-fun m!497333 () Bool)

(assert (=> b!516307 m!497333))

(declare-fun m!497335 () Bool)

(assert (=> b!516302 m!497335))

(declare-fun m!497337 () Bool)

(assert (=> start!46758 m!497337))

(declare-fun m!497339 () Bool)

(assert (=> start!46758 m!497339))

(declare-fun m!497341 () Bool)

(assert (=> b!516303 m!497341))

(assert (=> b!516303 m!497329))

(declare-fun m!497343 () Bool)

(assert (=> b!516300 m!497343))

(assert (=> b!516300 m!497329))

(declare-fun m!497345 () Bool)

(assert (=> b!516300 m!497345))

(declare-fun m!497347 () Bool)

(assert (=> b!516300 m!497347))

(declare-fun m!497349 () Bool)

(assert (=> b!516300 m!497349))

(assert (=> b!516300 m!497329))

(declare-fun m!497351 () Bool)

(assert (=> b!516300 m!497351))

(assert (=> b!516300 m!497349))

(declare-fun m!497353 () Bool)

(assert (=> b!516300 m!497353))

(assert (=> b!516300 m!497329))

(declare-fun m!497355 () Bool)

(assert (=> b!516300 m!497355))

(assert (=> b!516300 m!497349))

(declare-fun m!497357 () Bool)

(assert (=> b!516300 m!497357))

(declare-fun m!497359 () Bool)

(assert (=> b!516299 m!497359))

(check-sat (not b!516300) (not start!46758) (not b!516307) (not b!516302) (not b!516299) (not b!516297) (not b!516298) (not b!516305) (not b!516306))
(check-sat)
