; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45228 () Bool)

(assert start!45228)

(declare-fun b!496512 () Bool)

(declare-fun e!291106 () Bool)

(declare-fun e!291107 () Bool)

(assert (=> b!496512 (= e!291106 e!291107)))

(declare-fun res!299048 () Bool)

(assert (=> b!496512 (=> (not res!299048) (not e!291107))))

(declare-datatypes ((SeekEntryResult!3910 0))(
  ( (MissingZero!3910 (index!17819 (_ BitVec 32))) (Found!3910 (index!17820 (_ BitVec 32))) (Intermediate!3910 (undefined!4722 Bool) (index!17821 (_ BitVec 32)) (x!46885 (_ BitVec 32))) (Undefined!3910) (MissingVacant!3910 (index!17822 (_ BitVec 32))) )
))
(declare-fun lt!224667 () SeekEntryResult!3910)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!496512 (= res!299048 (or (= lt!224667 (MissingZero!3910 i!1204)) (= lt!224667 (MissingVacant!3910 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32126 0))(
  ( (array!32127 (arr!15446 (Array (_ BitVec 32) (_ BitVec 64))) (size!15811 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32126)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32126 (_ BitVec 32)) SeekEntryResult!3910)

(assert (=> b!496512 (= lt!224667 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!496513 () Bool)

(declare-fun res!299043 () Bool)

(assert (=> b!496513 (=> (not res!299043) (not e!291106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496513 (= res!299043 (validKeyInArray!0 k0!2280))))

(declare-fun b!496514 () Bool)

(declare-fun res!299051 () Bool)

(assert (=> b!496514 (=> (not res!299051) (not e!291106))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!496514 (= res!299051 (validKeyInArray!0 (select (arr!15446 a!3235) j!176)))))

(declare-fun b!496515 () Bool)

(declare-fun res!299047 () Bool)

(assert (=> b!496515 (=> (not res!299047) (not e!291107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32126 (_ BitVec 32)) Bool)

(assert (=> b!496515 (= res!299047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496516 () Bool)

(declare-fun res!299041 () Bool)

(assert (=> b!496516 (=> (not res!299041) (not e!291106))))

(assert (=> b!496516 (= res!299041 (and (= (size!15811 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15811 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15811 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496517 () Bool)

(declare-fun res!299045 () Bool)

(declare-fun e!291108 () Bool)

(assert (=> b!496517 (=> res!299045 e!291108)))

(declare-fun lt!224666 () SeekEntryResult!3910)

(get-info :version)

(assert (=> b!496517 (= res!299045 (or (undefined!4722 lt!224666) (not ((_ is Intermediate!3910) lt!224666))))))

(declare-fun res!299044 () Bool)

(assert (=> start!45228 (=> (not res!299044) (not e!291106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45228 (= res!299044 (validMask!0 mask!3524))))

(assert (=> start!45228 e!291106))

(assert (=> start!45228 true))

(declare-fun array_inv!11329 (array!32126) Bool)

(assert (=> start!45228 (array_inv!11329 a!3235)))

(declare-fun b!496518 () Bool)

(assert (=> b!496518 (= e!291108 true)))

(assert (=> b!496518 (and (bvslt (x!46885 lt!224666) #b01111111111111111111111111111110) (or (= (select (arr!15446 a!3235) (index!17821 lt!224666)) (select (arr!15446 a!3235) j!176)) (= (select (arr!15446 a!3235) (index!17821 lt!224666)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15446 a!3235) (index!17821 lt!224666)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496519 () Bool)

(assert (=> b!496519 (= e!291107 (not e!291108))))

(declare-fun res!299042 () Bool)

(assert (=> b!496519 (=> res!299042 e!291108)))

(declare-fun lt!224664 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32126 (_ BitVec 32)) SeekEntryResult!3910)

(assert (=> b!496519 (= res!299042 (= lt!224666 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224664 (select (store (arr!15446 a!3235) i!1204 k0!2280) j!176) (array!32127 (store (arr!15446 a!3235) i!1204 k0!2280) (size!15811 a!3235)) mask!3524)))))

(declare-fun lt!224665 () (_ BitVec 32))

(assert (=> b!496519 (= lt!224666 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224665 (select (arr!15446 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496519 (= lt!224664 (toIndex!0 (select (store (arr!15446 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496519 (= lt!224665 (toIndex!0 (select (arr!15446 a!3235) j!176) mask!3524))))

(declare-fun e!291104 () Bool)

(assert (=> b!496519 e!291104))

(declare-fun res!299049 () Bool)

(assert (=> b!496519 (=> (not res!299049) (not e!291104))))

(assert (=> b!496519 (= res!299049 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14752 0))(
  ( (Unit!14753) )
))
(declare-fun lt!224668 () Unit!14752)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32126 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14752)

(assert (=> b!496519 (= lt!224668 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496520 () Bool)

(assert (=> b!496520 (= e!291104 (= (seekEntryOrOpen!0 (select (arr!15446 a!3235) j!176) a!3235 mask!3524) (Found!3910 j!176)))))

(declare-fun b!496521 () Bool)

(declare-fun res!299046 () Bool)

(assert (=> b!496521 (=> (not res!299046) (not e!291107))))

(declare-datatypes ((List!9643 0))(
  ( (Nil!9640) (Cons!9639 (h!10510 (_ BitVec 64)) (t!15862 List!9643)) )
))
(declare-fun arrayNoDuplicates!0 (array!32126 (_ BitVec 32) List!9643) Bool)

(assert (=> b!496521 (= res!299046 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9640))))

(declare-fun b!496522 () Bool)

(declare-fun res!299050 () Bool)

(assert (=> b!496522 (=> (not res!299050) (not e!291106))))

(declare-fun arrayContainsKey!0 (array!32126 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496522 (= res!299050 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45228 res!299044) b!496516))

(assert (= (and b!496516 res!299041) b!496514))

(assert (= (and b!496514 res!299051) b!496513))

(assert (= (and b!496513 res!299043) b!496522))

(assert (= (and b!496522 res!299050) b!496512))

(assert (= (and b!496512 res!299048) b!496515))

(assert (= (and b!496515 res!299047) b!496521))

(assert (= (and b!496521 res!299046) b!496519))

(assert (= (and b!496519 res!299049) b!496520))

(assert (= (and b!496519 (not res!299042)) b!496517))

(assert (= (and b!496517 (not res!299045)) b!496518))

(declare-fun m!477319 () Bool)

(assert (=> b!496520 m!477319))

(assert (=> b!496520 m!477319))

(declare-fun m!477321 () Bool)

(assert (=> b!496520 m!477321))

(declare-fun m!477323 () Bool)

(assert (=> b!496522 m!477323))

(declare-fun m!477325 () Bool)

(assert (=> b!496513 m!477325))

(declare-fun m!477327 () Bool)

(assert (=> b!496518 m!477327))

(assert (=> b!496518 m!477319))

(declare-fun m!477329 () Bool)

(assert (=> b!496521 m!477329))

(assert (=> b!496514 m!477319))

(assert (=> b!496514 m!477319))

(declare-fun m!477331 () Bool)

(assert (=> b!496514 m!477331))

(declare-fun m!477333 () Bool)

(assert (=> b!496519 m!477333))

(declare-fun m!477335 () Bool)

(assert (=> b!496519 m!477335))

(assert (=> b!496519 m!477319))

(declare-fun m!477337 () Bool)

(assert (=> b!496519 m!477337))

(assert (=> b!496519 m!477319))

(declare-fun m!477339 () Bool)

(assert (=> b!496519 m!477339))

(assert (=> b!496519 m!477335))

(declare-fun m!477341 () Bool)

(assert (=> b!496519 m!477341))

(assert (=> b!496519 m!477319))

(declare-fun m!477343 () Bool)

(assert (=> b!496519 m!477343))

(assert (=> b!496519 m!477335))

(declare-fun m!477345 () Bool)

(assert (=> b!496519 m!477345))

(declare-fun m!477347 () Bool)

(assert (=> b!496519 m!477347))

(declare-fun m!477349 () Bool)

(assert (=> b!496515 m!477349))

(declare-fun m!477351 () Bool)

(assert (=> start!45228 m!477351))

(declare-fun m!477353 () Bool)

(assert (=> start!45228 m!477353))

(declare-fun m!477355 () Bool)

(assert (=> b!496512 m!477355))

(check-sat (not b!496515) (not b!496512) (not b!496521) (not start!45228) (not b!496520) (not b!496514) (not b!496513) (not b!496519) (not b!496522))
(check-sat)
