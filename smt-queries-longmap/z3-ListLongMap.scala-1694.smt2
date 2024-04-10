; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31054 () Bool)

(assert start!31054)

(declare-fun b!312347 () Bool)

(declare-fun res!168810 () Bool)

(declare-fun e!194774 () Bool)

(assert (=> b!312347 (=> (not res!168810) (not e!194774))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((array!15956 0))(
  ( (array!15957 (arr!7560 (Array (_ BitVec 32) (_ BitVec 64))) (size!7912 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15956)

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!312347 (= res!168810 (and (= (size!7912 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7912 a!3293))))))

(declare-fun b!312348 () Bool)

(declare-fun e!194776 () Bool)

(declare-fun e!194775 () Bool)

(assert (=> b!312348 (= e!194776 e!194775)))

(declare-fun res!168805 () Bool)

(assert (=> b!312348 (=> (not res!168805) (not e!194775))))

(declare-datatypes ((SeekEntryResult!2700 0))(
  ( (MissingZero!2700 (index!12976 (_ BitVec 32))) (Found!2700 (index!12977 (_ BitVec 32))) (Intermediate!2700 (undefined!3512 Bool) (index!12978 (_ BitVec 32)) (x!31185 (_ BitVec 32))) (Undefined!2700) (MissingVacant!2700 (index!12979 (_ BitVec 32))) )
))
(declare-fun lt!152960 () SeekEntryResult!2700)

(declare-fun lt!152955 () SeekEntryResult!2700)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312348 (= res!168805 (and (= lt!152955 lt!152960) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7560 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15956 (_ BitVec 32)) SeekEntryResult!2700)

(assert (=> b!312348 (= lt!152955 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!312349 () Bool)

(declare-fun res!168802 () Bool)

(assert (=> b!312349 (=> (not res!168802) (not e!194774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15956 (_ BitVec 32)) Bool)

(assert (=> b!312349 (= res!168802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312350 () Bool)

(assert (=> b!312350 (= e!194774 e!194776)))

(declare-fun res!168806 () Bool)

(assert (=> b!312350 (=> (not res!168806) (not e!194776))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312350 (= res!168806 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152960))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!312350 (= lt!152960 (Intermediate!2700 false resIndex!52 resX!52))))

(declare-fun res!168807 () Bool)

(assert (=> start!31054 (=> (not res!168807) (not e!194774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31054 (= res!168807 (validMask!0 mask!3709))))

(assert (=> start!31054 e!194774))

(declare-fun array_inv!5523 (array!15956) Bool)

(assert (=> start!31054 (array_inv!5523 a!3293)))

(assert (=> start!31054 true))

(declare-fun b!312351 () Bool)

(declare-fun res!168803 () Bool)

(assert (=> b!312351 (=> (not res!168803) (not e!194776))))

(assert (=> b!312351 (= res!168803 (and (= (select (arr!7560 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7912 a!3293))))))

(declare-fun b!312352 () Bool)

(declare-fun e!194773 () Bool)

(assert (=> b!312352 (= e!194775 (not e!194773))))

(declare-fun res!168809 () Bool)

(assert (=> b!312352 (=> res!168809 e!194773)))

(declare-fun lt!152957 () SeekEntryResult!2700)

(declare-fun lt!152954 () (_ BitVec 32))

(assert (=> b!312352 (= res!168809 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152954 #b00000000000000000000000000000000) (bvsge lt!152954 (size!7912 a!3293)) (not (= lt!152957 lt!152960))))))

(declare-fun lt!152959 () SeekEntryResult!2700)

(declare-fun lt!152961 () SeekEntryResult!2700)

(assert (=> b!312352 (= lt!152959 lt!152961)))

(declare-fun lt!152956 () array!15956)

(assert (=> b!312352 (= lt!152961 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152954 k0!2441 lt!152956 mask!3709))))

(assert (=> b!312352 (= lt!152959 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152956 mask!3709))))

(assert (=> b!312352 (= lt!152956 (array!15957 (store (arr!7560 a!3293) i!1240 k0!2441) (size!7912 a!3293)))))

(assert (=> b!312352 (= lt!152955 lt!152957)))

(assert (=> b!312352 (= lt!152957 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152954 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312352 (= lt!152954 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312353 () Bool)

(declare-fun res!168804 () Bool)

(assert (=> b!312353 (=> (not res!168804) (not e!194774))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312353 (= res!168804 (validKeyInArray!0 k0!2441))))

(declare-fun b!312354 () Bool)

(declare-fun res!168808 () Bool)

(assert (=> b!312354 (=> (not res!168808) (not e!194774))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15956 (_ BitVec 32)) SeekEntryResult!2700)

(assert (=> b!312354 (= res!168808 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2700 i!1240)))))

(declare-fun b!312355 () Bool)

(assert (=> b!312355 (= e!194773 true)))

(assert (=> b!312355 (= lt!152961 lt!152957)))

(declare-datatypes ((Unit!9631 0))(
  ( (Unit!9632) )
))
(declare-fun lt!152958 () Unit!9631)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15956 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9631)

(assert (=> b!312355 (= lt!152958 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152954 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312356 () Bool)

(declare-fun res!168801 () Bool)

(assert (=> b!312356 (=> (not res!168801) (not e!194774))))

(declare-fun arrayContainsKey!0 (array!15956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312356 (= res!168801 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!31054 res!168807) b!312347))

(assert (= (and b!312347 res!168810) b!312353))

(assert (= (and b!312353 res!168804) b!312356))

(assert (= (and b!312356 res!168801) b!312354))

(assert (= (and b!312354 res!168808) b!312349))

(assert (= (and b!312349 res!168802) b!312350))

(assert (= (and b!312350 res!168806) b!312351))

(assert (= (and b!312351 res!168803) b!312348))

(assert (= (and b!312348 res!168805) b!312352))

(assert (= (and b!312352 (not res!168809)) b!312355))

(declare-fun m!322419 () Bool)

(assert (=> b!312356 m!322419))

(declare-fun m!322421 () Bool)

(assert (=> b!312352 m!322421))

(declare-fun m!322423 () Bool)

(assert (=> b!312352 m!322423))

(declare-fun m!322425 () Bool)

(assert (=> b!312352 m!322425))

(declare-fun m!322427 () Bool)

(assert (=> b!312352 m!322427))

(declare-fun m!322429 () Bool)

(assert (=> b!312352 m!322429))

(declare-fun m!322431 () Bool)

(assert (=> b!312353 m!322431))

(declare-fun m!322433 () Bool)

(assert (=> b!312355 m!322433))

(declare-fun m!322435 () Bool)

(assert (=> b!312349 m!322435))

(declare-fun m!322437 () Bool)

(assert (=> b!312348 m!322437))

(declare-fun m!322439 () Bool)

(assert (=> b!312348 m!322439))

(declare-fun m!322441 () Bool)

(assert (=> start!31054 m!322441))

(declare-fun m!322443 () Bool)

(assert (=> start!31054 m!322443))

(declare-fun m!322445 () Bool)

(assert (=> b!312354 m!322445))

(declare-fun m!322447 () Bool)

(assert (=> b!312350 m!322447))

(assert (=> b!312350 m!322447))

(declare-fun m!322449 () Bool)

(assert (=> b!312350 m!322449))

(declare-fun m!322451 () Bool)

(assert (=> b!312351 m!322451))

(check-sat (not start!31054) (not b!312355) (not b!312354) (not b!312350) (not b!312352) (not b!312356) (not b!312349) (not b!312348) (not b!312353))
(check-sat)
