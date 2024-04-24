; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45998 () Bool)

(assert start!45998)

(declare-fun b!509345 () Bool)

(declare-fun res!310250 () Bool)

(declare-fun e!297870 () Bool)

(assert (=> b!509345 (=> (not res!310250) (not e!297870))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32710 0))(
  ( (array!32711 (arr!15733 (Array (_ BitVec 32) (_ BitVec 64))) (size!16097 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32710)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509345 (= res!310250 (and (= (size!16097 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16097 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16097 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509346 () Bool)

(declare-fun res!310247 () Bool)

(assert (=> b!509346 (=> (not res!310247) (not e!297870))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509346 (= res!310247 (validKeyInArray!0 k0!2280))))

(declare-fun res!310252 () Bool)

(assert (=> start!45998 (=> (not res!310252) (not e!297870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45998 (= res!310252 (validMask!0 mask!3524))))

(assert (=> start!45998 e!297870))

(assert (=> start!45998 true))

(declare-fun array_inv!11592 (array!32710) Bool)

(assert (=> start!45998 (array_inv!11592 a!3235)))

(declare-fun b!509347 () Bool)

(declare-fun e!297869 () Bool)

(assert (=> b!509347 (= e!297869 (not true))))

(declare-fun lt!232706 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4156 0))(
  ( (MissingZero!4156 (index!18812 (_ BitVec 32))) (Found!4156 (index!18813 (_ BitVec 32))) (Intermediate!4156 (undefined!4968 Bool) (index!18814 (_ BitVec 32)) (x!47930 (_ BitVec 32))) (Undefined!4156) (MissingVacant!4156 (index!18815 (_ BitVec 32))) )
))
(declare-fun lt!232707 () SeekEntryResult!4156)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32710 (_ BitVec 32)) SeekEntryResult!4156)

(assert (=> b!509347 (= lt!232707 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232706 (select (store (arr!15733 a!3235) i!1204 k0!2280) j!176) (array!32711 (store (arr!15733 a!3235) i!1204 k0!2280) (size!16097 a!3235)) mask!3524))))

(declare-fun lt!232708 () SeekEntryResult!4156)

(declare-fun lt!232710 () (_ BitVec 32))

(assert (=> b!509347 (= lt!232708 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232710 (select (arr!15733 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509347 (= lt!232706 (toIndex!0 (select (store (arr!15733 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509347 (= lt!232710 (toIndex!0 (select (arr!15733 a!3235) j!176) mask!3524))))

(declare-fun e!297867 () Bool)

(assert (=> b!509347 e!297867))

(declare-fun res!310248 () Bool)

(assert (=> b!509347 (=> (not res!310248) (not e!297867))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32710 (_ BitVec 32)) Bool)

(assert (=> b!509347 (= res!310248 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15631 0))(
  ( (Unit!15632) )
))
(declare-fun lt!232711 () Unit!15631)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32710 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15631)

(assert (=> b!509347 (= lt!232711 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509348 () Bool)

(declare-fun res!310246 () Bool)

(assert (=> b!509348 (=> (not res!310246) (not e!297869))))

(assert (=> b!509348 (= res!310246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509349 () Bool)

(declare-fun res!310245 () Bool)

(assert (=> b!509349 (=> (not res!310245) (not e!297869))))

(declare-datatypes ((List!9798 0))(
  ( (Nil!9795) (Cons!9794 (h!10671 (_ BitVec 64)) (t!16018 List!9798)) )
))
(declare-fun arrayNoDuplicates!0 (array!32710 (_ BitVec 32) List!9798) Bool)

(assert (=> b!509349 (= res!310245 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9795))))

(declare-fun b!509350 () Bool)

(declare-fun res!310244 () Bool)

(assert (=> b!509350 (=> (not res!310244) (not e!297870))))

(assert (=> b!509350 (= res!310244 (validKeyInArray!0 (select (arr!15733 a!3235) j!176)))))

(declare-fun b!509351 () Bool)

(assert (=> b!509351 (= e!297870 e!297869)))

(declare-fun res!310251 () Bool)

(assert (=> b!509351 (=> (not res!310251) (not e!297869))))

(declare-fun lt!232709 () SeekEntryResult!4156)

(assert (=> b!509351 (= res!310251 (or (= lt!232709 (MissingZero!4156 i!1204)) (= lt!232709 (MissingVacant!4156 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32710 (_ BitVec 32)) SeekEntryResult!4156)

(assert (=> b!509351 (= lt!232709 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509352 () Bool)

(declare-fun res!310249 () Bool)

(assert (=> b!509352 (=> (not res!310249) (not e!297870))))

(declare-fun arrayContainsKey!0 (array!32710 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509352 (= res!310249 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509353 () Bool)

(assert (=> b!509353 (= e!297867 (= (seekEntryOrOpen!0 (select (arr!15733 a!3235) j!176) a!3235 mask!3524) (Found!4156 j!176)))))

(assert (= (and start!45998 res!310252) b!509345))

(assert (= (and b!509345 res!310250) b!509350))

(assert (= (and b!509350 res!310244) b!509346))

(assert (= (and b!509346 res!310247) b!509352))

(assert (= (and b!509352 res!310249) b!509351))

(assert (= (and b!509351 res!310251) b!509348))

(assert (= (and b!509348 res!310246) b!509349))

(assert (= (and b!509349 res!310245) b!509347))

(assert (= (and b!509347 res!310248) b!509353))

(declare-fun m!490465 () Bool)

(assert (=> b!509350 m!490465))

(assert (=> b!509350 m!490465))

(declare-fun m!490467 () Bool)

(assert (=> b!509350 m!490467))

(declare-fun m!490469 () Bool)

(assert (=> start!45998 m!490469))

(declare-fun m!490471 () Bool)

(assert (=> start!45998 m!490471))

(declare-fun m!490473 () Bool)

(assert (=> b!509349 m!490473))

(declare-fun m!490475 () Bool)

(assert (=> b!509348 m!490475))

(declare-fun m!490477 () Bool)

(assert (=> b!509352 m!490477))

(assert (=> b!509353 m!490465))

(assert (=> b!509353 m!490465))

(declare-fun m!490479 () Bool)

(assert (=> b!509353 m!490479))

(declare-fun m!490481 () Bool)

(assert (=> b!509346 m!490481))

(assert (=> b!509347 m!490465))

(declare-fun m!490483 () Bool)

(assert (=> b!509347 m!490483))

(declare-fun m!490485 () Bool)

(assert (=> b!509347 m!490485))

(declare-fun m!490487 () Bool)

(assert (=> b!509347 m!490487))

(declare-fun m!490489 () Bool)

(assert (=> b!509347 m!490489))

(assert (=> b!509347 m!490465))

(declare-fun m!490491 () Bool)

(assert (=> b!509347 m!490491))

(assert (=> b!509347 m!490465))

(declare-fun m!490493 () Bool)

(assert (=> b!509347 m!490493))

(assert (=> b!509347 m!490489))

(declare-fun m!490495 () Bool)

(assert (=> b!509347 m!490495))

(assert (=> b!509347 m!490489))

(declare-fun m!490497 () Bool)

(assert (=> b!509347 m!490497))

(declare-fun m!490499 () Bool)

(assert (=> b!509351 m!490499))

(check-sat (not start!45998) (not b!509352) (not b!509353) (not b!509349) (not b!509346) (not b!509351) (not b!509347) (not b!509348) (not b!509350))
(check-sat)
