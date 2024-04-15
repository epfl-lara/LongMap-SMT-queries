; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46704 () Bool)

(assert start!46704)

(declare-fun b!515406 () Bool)

(declare-fun res!315116 () Bool)

(declare-fun e!300883 () Bool)

(assert (=> b!515406 (=> res!315116 e!300883)))

(declare-datatypes ((SeekEntryResult!4345 0))(
  ( (MissingZero!4345 (index!19568 (_ BitVec 32))) (Found!4345 (index!19569 (_ BitVec 32))) (Intermediate!4345 (undefined!5157 Bool) (index!19570 (_ BitVec 32)) (x!48543 (_ BitVec 32))) (Undefined!4345) (MissingVacant!4345 (index!19571 (_ BitVec 32))) )
))
(declare-fun lt!235836 () SeekEntryResult!4345)

(get-info :version)

(assert (=> b!515406 (= res!315116 (or (undefined!5157 lt!235836) (not ((_ is Intermediate!4345) lt!235836))))))

(declare-fun b!515407 () Bool)

(declare-fun e!300885 () Bool)

(declare-fun e!300882 () Bool)

(assert (=> b!515407 (= e!300885 e!300882)))

(declare-fun res!315118 () Bool)

(assert (=> b!515407 (=> (not res!315118) (not e!300882))))

(declare-fun lt!235840 () SeekEntryResult!4345)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515407 (= res!315118 (or (= lt!235840 (MissingZero!4345 i!1204)) (= lt!235840 (MissingVacant!4345 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33026 0))(
  ( (array!33027 (arr!15881 (Array (_ BitVec 32) (_ BitVec 64))) (size!16246 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33026)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33026 (_ BitVec 32)) SeekEntryResult!4345)

(assert (=> b!515407 (= lt!235840 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!515408 () Bool)

(declare-fun res!315114 () Bool)

(assert (=> b!515408 (=> (not res!315114) (not e!300885))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515408 (= res!315114 (validKeyInArray!0 (select (arr!15881 a!3235) j!176)))))

(declare-fun b!515409 () Bool)

(declare-fun res!315121 () Bool)

(assert (=> b!515409 (=> (not res!315121) (not e!300885))))

(assert (=> b!515409 (= res!315121 (validKeyInArray!0 k0!2280))))

(declare-fun b!515410 () Bool)

(assert (=> b!515410 (= e!300883 true)))

(assert (=> b!515410 (and (bvslt (x!48543 lt!235836) #b01111111111111111111111111111110) (or (= (select (arr!15881 a!3235) (index!19570 lt!235836)) (select (arr!15881 a!3235) j!176)) (= (select (arr!15881 a!3235) (index!19570 lt!235836)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15881 a!3235) (index!19570 lt!235836)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!300884 () Bool)

(declare-fun b!515411 () Bool)

(assert (=> b!515411 (= e!300884 (= (seekEntryOrOpen!0 (select (arr!15881 a!3235) j!176) a!3235 mask!3524) (Found!4345 j!176)))))

(declare-fun b!515412 () Bool)

(declare-fun res!315112 () Bool)

(assert (=> b!515412 (=> (not res!315112) (not e!300882))))

(declare-datatypes ((List!10078 0))(
  ( (Nil!10075) (Cons!10074 (h!10972 (_ BitVec 64)) (t!16297 List!10078)) )
))
(declare-fun arrayNoDuplicates!0 (array!33026 (_ BitVec 32) List!10078) Bool)

(assert (=> b!515412 (= res!315112 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10075))))

(declare-fun b!515413 () Bool)

(declare-fun res!315119 () Bool)

(assert (=> b!515413 (=> (not res!315119) (not e!300885))))

(declare-fun arrayContainsKey!0 (array!33026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515413 (= res!315119 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515414 () Bool)

(declare-fun res!315117 () Bool)

(assert (=> b!515414 (=> (not res!315117) (not e!300882))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33026 (_ BitVec 32)) Bool)

(assert (=> b!515414 (= res!315117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!315113 () Bool)

(assert (=> start!46704 (=> (not res!315113) (not e!300885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46704 (= res!315113 (validMask!0 mask!3524))))

(assert (=> start!46704 e!300885))

(assert (=> start!46704 true))

(declare-fun array_inv!11764 (array!33026) Bool)

(assert (=> start!46704 (array_inv!11764 a!3235)))

(declare-fun b!515415 () Bool)

(assert (=> b!515415 (= e!300882 (not e!300883))))

(declare-fun res!315120 () Bool)

(assert (=> b!515415 (=> res!315120 e!300883)))

(declare-fun lt!235837 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33026 (_ BitVec 32)) SeekEntryResult!4345)

(assert (=> b!515415 (= res!315120 (= lt!235836 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235837 (select (store (arr!15881 a!3235) i!1204 k0!2280) j!176) (array!33027 (store (arr!15881 a!3235) i!1204 k0!2280) (size!16246 a!3235)) mask!3524)))))

(declare-fun lt!235838 () (_ BitVec 32))

(assert (=> b!515415 (= lt!235836 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235838 (select (arr!15881 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515415 (= lt!235837 (toIndex!0 (select (store (arr!15881 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515415 (= lt!235838 (toIndex!0 (select (arr!15881 a!3235) j!176) mask!3524))))

(assert (=> b!515415 e!300884))

(declare-fun res!315115 () Bool)

(assert (=> b!515415 (=> (not res!315115) (not e!300884))))

(assert (=> b!515415 (= res!315115 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15934 0))(
  ( (Unit!15935) )
))
(declare-fun lt!235839 () Unit!15934)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15934)

(assert (=> b!515415 (= lt!235839 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515416 () Bool)

(declare-fun res!315122 () Bool)

(assert (=> b!515416 (=> (not res!315122) (not e!300885))))

(assert (=> b!515416 (= res!315122 (and (= (size!16246 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16246 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16246 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46704 res!315113) b!515416))

(assert (= (and b!515416 res!315122) b!515408))

(assert (= (and b!515408 res!315114) b!515409))

(assert (= (and b!515409 res!315121) b!515413))

(assert (= (and b!515413 res!315119) b!515407))

(assert (= (and b!515407 res!315118) b!515414))

(assert (= (and b!515414 res!315117) b!515412))

(assert (= (and b!515412 res!315112) b!515415))

(assert (= (and b!515415 res!315115) b!515411))

(assert (= (and b!515415 (not res!315120)) b!515406))

(assert (= (and b!515406 (not res!315116)) b!515410))

(declare-fun m!496297 () Bool)

(assert (=> b!515411 m!496297))

(assert (=> b!515411 m!496297))

(declare-fun m!496299 () Bool)

(assert (=> b!515411 m!496299))

(declare-fun m!496301 () Bool)

(assert (=> b!515407 m!496301))

(declare-fun m!496303 () Bool)

(assert (=> b!515414 m!496303))

(declare-fun m!496305 () Bool)

(assert (=> b!515410 m!496305))

(assert (=> b!515410 m!496297))

(assert (=> b!515408 m!496297))

(assert (=> b!515408 m!496297))

(declare-fun m!496307 () Bool)

(assert (=> b!515408 m!496307))

(declare-fun m!496309 () Bool)

(assert (=> start!46704 m!496309))

(declare-fun m!496311 () Bool)

(assert (=> start!46704 m!496311))

(declare-fun m!496313 () Bool)

(assert (=> b!515415 m!496313))

(declare-fun m!496315 () Bool)

(assert (=> b!515415 m!496315))

(declare-fun m!496317 () Bool)

(assert (=> b!515415 m!496317))

(declare-fun m!496319 () Bool)

(assert (=> b!515415 m!496319))

(assert (=> b!515415 m!496315))

(assert (=> b!515415 m!496297))

(declare-fun m!496321 () Bool)

(assert (=> b!515415 m!496321))

(assert (=> b!515415 m!496297))

(declare-fun m!496323 () Bool)

(assert (=> b!515415 m!496323))

(assert (=> b!515415 m!496297))

(declare-fun m!496325 () Bool)

(assert (=> b!515415 m!496325))

(assert (=> b!515415 m!496315))

(declare-fun m!496327 () Bool)

(assert (=> b!515415 m!496327))

(declare-fun m!496329 () Bool)

(assert (=> b!515413 m!496329))

(declare-fun m!496331 () Bool)

(assert (=> b!515409 m!496331))

(declare-fun m!496333 () Bool)

(assert (=> b!515412 m!496333))

(check-sat (not b!515412) (not b!515413) (not b!515411) (not b!515414) (not b!515408) (not b!515409) (not start!46704) (not b!515415) (not b!515407))
(check-sat)
