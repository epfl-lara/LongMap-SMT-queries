; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44606 () Bool)

(assert start!44606)

(declare-fun b!489347 () Bool)

(declare-fun res!292341 () Bool)

(declare-fun e!287808 () Bool)

(assert (=> b!489347 (=> (not res!292341) (not e!287808))))

(declare-datatypes ((array!31666 0))(
  ( (array!31667 (arr!15220 (Array (_ BitVec 32) (_ BitVec 64))) (size!15584 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31666)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31666 (_ BitVec 32)) Bool)

(assert (=> b!489347 (= res!292341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!489348 () Bool)

(declare-fun res!292338 () Bool)

(declare-fun e!287809 () Bool)

(assert (=> b!489348 (=> (not res!292338) (not e!287809))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31666 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!489348 (= res!292338 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!489349 () Bool)

(declare-fun res!292340 () Bool)

(assert (=> b!489349 (=> (not res!292340) (not e!287808))))

(declare-datatypes ((List!9285 0))(
  ( (Nil!9282) (Cons!9281 (h!10143 (_ BitVec 64)) (t!15505 List!9285)) )
))
(declare-fun arrayNoDuplicates!0 (array!31666 (_ BitVec 32) List!9285) Bool)

(assert (=> b!489349 (= res!292340 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9282))))

(declare-fun b!489350 () Bool)

(assert (=> b!489350 (= e!287808 (not true))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3643 0))(
  ( (MissingZero!3643 (index!16751 (_ BitVec 32))) (Found!3643 (index!16752 (_ BitVec 32))) (Intermediate!3643 (undefined!4455 Bool) (index!16753 (_ BitVec 32)) (x!46010 (_ BitVec 32))) (Undefined!3643) (MissingVacant!3643 (index!16754 (_ BitVec 32))) )
))
(declare-fun lt!220822 () SeekEntryResult!3643)

(declare-fun lt!220821 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31666 (_ BitVec 32)) SeekEntryResult!3643)

(assert (=> b!489350 (= lt!220822 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220821 (select (store (arr!15220 a!3235) i!1204 k0!2280) j!176) (array!31667 (store (arr!15220 a!3235) i!1204 k0!2280) (size!15584 a!3235)) mask!3524))))

(declare-fun lt!220818 () (_ BitVec 32))

(declare-fun lt!220819 () SeekEntryResult!3643)

(assert (=> b!489350 (= lt!220819 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!220818 (select (arr!15220 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!489350 (= lt!220821 (toIndex!0 (select (store (arr!15220 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!489350 (= lt!220818 (toIndex!0 (select (arr!15220 a!3235) j!176) mask!3524))))

(declare-fun e!287810 () Bool)

(assert (=> b!489350 e!287810))

(declare-fun res!292343 () Bool)

(assert (=> b!489350 (=> (not res!292343) (not e!287810))))

(assert (=> b!489350 (= res!292343 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14293 0))(
  ( (Unit!14294) )
))
(declare-fun lt!220817 () Unit!14293)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31666 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14293)

(assert (=> b!489350 (= lt!220817 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!292342 () Bool)

(assert (=> start!44606 (=> (not res!292342) (not e!287809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44606 (= res!292342 (validMask!0 mask!3524))))

(assert (=> start!44606 e!287809))

(assert (=> start!44606 true))

(declare-fun array_inv!11079 (array!31666) Bool)

(assert (=> start!44606 (array_inv!11079 a!3235)))

(declare-fun b!489351 () Bool)

(declare-fun res!292337 () Bool)

(assert (=> b!489351 (=> (not res!292337) (not e!287809))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!489351 (= res!292337 (validKeyInArray!0 (select (arr!15220 a!3235) j!176)))))

(declare-fun b!489352 () Bool)

(assert (=> b!489352 (= e!287809 e!287808)))

(declare-fun res!292344 () Bool)

(assert (=> b!489352 (=> (not res!292344) (not e!287808))))

(declare-fun lt!220820 () SeekEntryResult!3643)

(assert (=> b!489352 (= res!292344 (or (= lt!220820 (MissingZero!3643 i!1204)) (= lt!220820 (MissingVacant!3643 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31666 (_ BitVec 32)) SeekEntryResult!3643)

(assert (=> b!489352 (= lt!220820 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!489353 () Bool)

(declare-fun res!292345 () Bool)

(assert (=> b!489353 (=> (not res!292345) (not e!287809))))

(assert (=> b!489353 (= res!292345 (validKeyInArray!0 k0!2280))))

(declare-fun b!489354 () Bool)

(assert (=> b!489354 (= e!287810 (= (seekEntryOrOpen!0 (select (arr!15220 a!3235) j!176) a!3235 mask!3524) (Found!3643 j!176)))))

(declare-fun b!489355 () Bool)

(declare-fun res!292339 () Bool)

(assert (=> b!489355 (=> (not res!292339) (not e!287809))))

(assert (=> b!489355 (= res!292339 (and (= (size!15584 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15584 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15584 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44606 res!292342) b!489355))

(assert (= (and b!489355 res!292339) b!489351))

(assert (= (and b!489351 res!292337) b!489353))

(assert (= (and b!489353 res!292345) b!489348))

(assert (= (and b!489348 res!292338) b!489352))

(assert (= (and b!489352 res!292344) b!489347))

(assert (= (and b!489347 res!292341) b!489349))

(assert (= (and b!489349 res!292340) b!489350))

(assert (= (and b!489350 res!292343) b!489354))

(declare-fun m!469357 () Bool)

(assert (=> b!489354 m!469357))

(assert (=> b!489354 m!469357))

(declare-fun m!469359 () Bool)

(assert (=> b!489354 m!469359))

(declare-fun m!469361 () Bool)

(assert (=> b!489350 m!469361))

(declare-fun m!469363 () Bool)

(assert (=> b!489350 m!469363))

(declare-fun m!469365 () Bool)

(assert (=> b!489350 m!469365))

(assert (=> b!489350 m!469357))

(declare-fun m!469367 () Bool)

(assert (=> b!489350 m!469367))

(assert (=> b!489350 m!469365))

(declare-fun m!469369 () Bool)

(assert (=> b!489350 m!469369))

(assert (=> b!489350 m!469365))

(declare-fun m!469371 () Bool)

(assert (=> b!489350 m!469371))

(assert (=> b!489350 m!469357))

(declare-fun m!469373 () Bool)

(assert (=> b!489350 m!469373))

(assert (=> b!489350 m!469357))

(declare-fun m!469375 () Bool)

(assert (=> b!489350 m!469375))

(assert (=> b!489351 m!469357))

(assert (=> b!489351 m!469357))

(declare-fun m!469377 () Bool)

(assert (=> b!489351 m!469377))

(declare-fun m!469379 () Bool)

(assert (=> b!489353 m!469379))

(declare-fun m!469381 () Bool)

(assert (=> b!489349 m!469381))

(declare-fun m!469383 () Bool)

(assert (=> b!489348 m!469383))

(declare-fun m!469385 () Bool)

(assert (=> start!44606 m!469385))

(declare-fun m!469387 () Bool)

(assert (=> start!44606 m!469387))

(declare-fun m!469389 () Bool)

(assert (=> b!489352 m!469389))

(declare-fun m!469391 () Bool)

(assert (=> b!489347 m!469391))

(check-sat (not b!489352) (not b!489353) (not b!489348) (not b!489350) (not b!489351) (not b!489349) (not start!44606) (not b!489354) (not b!489347))
(check-sat)
