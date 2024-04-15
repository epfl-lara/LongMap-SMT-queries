; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46260 () Bool)

(assert start!46260)

(declare-fun b!512297 () Bool)

(declare-fun res!313105 () Bool)

(declare-fun e!299145 () Bool)

(assert (=> b!512297 (=> (not res!313105) (not e!299145))))

(declare-datatypes ((array!32924 0))(
  ( (array!32925 (arr!15839 (Array (_ BitVec 32) (_ BitVec 64))) (size!16204 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32924)

(declare-datatypes ((List!10036 0))(
  ( (Nil!10033) (Cons!10032 (h!10912 (_ BitVec 64)) (t!16255 List!10036)) )
))
(declare-fun arrayNoDuplicates!0 (array!32924 (_ BitVec 32) List!10036) Bool)

(assert (=> b!512297 (= res!313105 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10033))))

(declare-fun b!512298 () Bool)

(declare-fun res!313108 () Bool)

(declare-fun e!299144 () Bool)

(assert (=> b!512298 (=> (not res!313108) (not e!299144))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512298 (= res!313108 (validKeyInArray!0 (select (arr!15839 a!3235) j!176)))))

(declare-fun b!512300 () Bool)

(declare-fun res!313109 () Bool)

(assert (=> b!512300 (=> (not res!313109) (not e!299144))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32924 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512300 (= res!313109 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512301 () Bool)

(declare-fun res!313106 () Bool)

(assert (=> b!512301 (=> (not res!313106) (not e!299144))))

(assert (=> b!512301 (= res!313106 (validKeyInArray!0 k0!2280))))

(declare-fun e!299142 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!512302 () Bool)

(declare-datatypes ((SeekEntryResult!4303 0))(
  ( (MissingZero!4303 (index!19400 (_ BitVec 32))) (Found!4303 (index!19401 (_ BitVec 32))) (Intermediate!4303 (undefined!5115 Bool) (index!19402 (_ BitVec 32)) (x!48353 (_ BitVec 32))) (Undefined!4303) (MissingVacant!4303 (index!19403 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32924 (_ BitVec 32)) SeekEntryResult!4303)

(assert (=> b!512302 (= e!299142 (= (seekEntryOrOpen!0 (select (arr!15839 a!3235) j!176) a!3235 mask!3524) (Found!4303 j!176)))))

(declare-fun b!512303 () Bool)

(declare-fun res!313103 () Bool)

(assert (=> b!512303 (=> (not res!313103) (not e!299145))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32924 (_ BitVec 32)) Bool)

(assert (=> b!512303 (= res!313103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512304 () Bool)

(assert (=> b!512304 (= e!299145 (not true))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!234425 () SeekEntryResult!4303)

(declare-fun lt!234428 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32924 (_ BitVec 32)) SeekEntryResult!4303)

(assert (=> b!512304 (= lt!234425 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234428 (select (store (arr!15839 a!3235) i!1204 k0!2280) j!176) (array!32925 (store (arr!15839 a!3235) i!1204 k0!2280) (size!16204 a!3235)) mask!3524))))

(declare-fun lt!234430 () SeekEntryResult!4303)

(declare-fun lt!234426 () (_ BitVec 32))

(assert (=> b!512304 (= lt!234430 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234426 (select (arr!15839 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512304 (= lt!234428 (toIndex!0 (select (store (arr!15839 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!512304 (= lt!234426 (toIndex!0 (select (arr!15839 a!3235) j!176) mask!3524))))

(assert (=> b!512304 e!299142))

(declare-fun res!313101 () Bool)

(assert (=> b!512304 (=> (not res!313101) (not e!299142))))

(assert (=> b!512304 (= res!313101 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15850 0))(
  ( (Unit!15851) )
))
(declare-fun lt!234429 () Unit!15850)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15850)

(assert (=> b!512304 (= lt!234429 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512305 () Bool)

(assert (=> b!512305 (= e!299144 e!299145)))

(declare-fun res!313102 () Bool)

(assert (=> b!512305 (=> (not res!313102) (not e!299145))))

(declare-fun lt!234427 () SeekEntryResult!4303)

(assert (=> b!512305 (= res!313102 (or (= lt!234427 (MissingZero!4303 i!1204)) (= lt!234427 (MissingVacant!4303 i!1204))))))

(assert (=> b!512305 (= lt!234427 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!512299 () Bool)

(declare-fun res!313107 () Bool)

(assert (=> b!512299 (=> (not res!313107) (not e!299144))))

(assert (=> b!512299 (= res!313107 (and (= (size!16204 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16204 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16204 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!313104 () Bool)

(assert (=> start!46260 (=> (not res!313104) (not e!299144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46260 (= res!313104 (validMask!0 mask!3524))))

(assert (=> start!46260 e!299144))

(assert (=> start!46260 true))

(declare-fun array_inv!11722 (array!32924) Bool)

(assert (=> start!46260 (array_inv!11722 a!3235)))

(assert (= (and start!46260 res!313104) b!512299))

(assert (= (and b!512299 res!313107) b!512298))

(assert (= (and b!512298 res!313108) b!512301))

(assert (= (and b!512301 res!313106) b!512300))

(assert (= (and b!512300 res!313109) b!512305))

(assert (= (and b!512305 res!313102) b!512303))

(assert (= (and b!512303 res!313103) b!512297))

(assert (= (and b!512297 res!313105) b!512304))

(assert (= (and b!512304 res!313101) b!512302))

(declare-fun m!493501 () Bool)

(assert (=> b!512302 m!493501))

(assert (=> b!512302 m!493501))

(declare-fun m!493503 () Bool)

(assert (=> b!512302 m!493503))

(declare-fun m!493505 () Bool)

(assert (=> b!512304 m!493505))

(declare-fun m!493507 () Bool)

(assert (=> b!512304 m!493507))

(declare-fun m!493509 () Bool)

(assert (=> b!512304 m!493509))

(declare-fun m!493511 () Bool)

(assert (=> b!512304 m!493511))

(assert (=> b!512304 m!493507))

(assert (=> b!512304 m!493501))

(declare-fun m!493513 () Bool)

(assert (=> b!512304 m!493513))

(assert (=> b!512304 m!493501))

(declare-fun m!493515 () Bool)

(assert (=> b!512304 m!493515))

(assert (=> b!512304 m!493501))

(declare-fun m!493517 () Bool)

(assert (=> b!512304 m!493517))

(assert (=> b!512304 m!493507))

(declare-fun m!493519 () Bool)

(assert (=> b!512304 m!493519))

(declare-fun m!493521 () Bool)

(assert (=> b!512305 m!493521))

(declare-fun m!493523 () Bool)

(assert (=> b!512301 m!493523))

(declare-fun m!493525 () Bool)

(assert (=> b!512297 m!493525))

(declare-fun m!493527 () Bool)

(assert (=> b!512300 m!493527))

(assert (=> b!512298 m!493501))

(assert (=> b!512298 m!493501))

(declare-fun m!493529 () Bool)

(assert (=> b!512298 m!493529))

(declare-fun m!493531 () Bool)

(assert (=> start!46260 m!493531))

(declare-fun m!493533 () Bool)

(assert (=> start!46260 m!493533))

(declare-fun m!493535 () Bool)

(assert (=> b!512303 m!493535))

(check-sat (not b!512305) (not b!512298) (not b!512300) (not b!512303) (not start!46260) (not b!512301) (not b!512304) (not b!512302) (not b!512297))
(check-sat)
