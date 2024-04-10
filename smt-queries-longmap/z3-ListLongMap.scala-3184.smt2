; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44732 () Bool)

(assert start!44732)

(declare-fun b!490974 () Bool)

(declare-fun res!293918 () Bool)

(declare-fun e!288545 () Bool)

(assert (=> b!490974 (=> (not res!293918) (not e!288545))))

(declare-datatypes ((array!31791 0))(
  ( (array!31792 (arr!15283 (Array (_ BitVec 32) (_ BitVec 64))) (size!15647 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31791)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31791 (_ BitVec 32)) Bool)

(assert (=> b!490974 (= res!293918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!293917 () Bool)

(declare-fun e!288544 () Bool)

(assert (=> start!44732 (=> (not res!293917) (not e!288544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44732 (= res!293917 (validMask!0 mask!3524))))

(assert (=> start!44732 e!288544))

(assert (=> start!44732 true))

(declare-fun array_inv!11079 (array!31791) Bool)

(assert (=> start!44732 (array_inv!11079 a!3235)))

(declare-fun b!490975 () Bool)

(declare-fun res!293910 () Bool)

(assert (=> b!490975 (=> (not res!293910) (not e!288544))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!490975 (= res!293910 (and (= (size!15647 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15647 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15647 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490976 () Bool)

(declare-fun res!293916 () Bool)

(assert (=> b!490976 (=> (not res!293916) (not e!288544))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490976 (= res!293916 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490977 () Bool)

(assert (=> b!490977 (= e!288544 e!288545)))

(declare-fun res!293914 () Bool)

(assert (=> b!490977 (=> (not res!293914) (not e!288545))))

(declare-datatypes ((SeekEntryResult!3750 0))(
  ( (MissingZero!3750 (index!17179 (_ BitVec 32))) (Found!3750 (index!17180 (_ BitVec 32))) (Intermediate!3750 (undefined!4562 Bool) (index!17181 (_ BitVec 32)) (x!46272 (_ BitVec 32))) (Undefined!3750) (MissingVacant!3750 (index!17182 (_ BitVec 32))) )
))
(declare-fun lt!221852 () SeekEntryResult!3750)

(assert (=> b!490977 (= res!293914 (or (= lt!221852 (MissingZero!3750 i!1204)) (= lt!221852 (MissingVacant!3750 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31791 (_ BitVec 32)) SeekEntryResult!3750)

(assert (=> b!490977 (= lt!221852 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490978 () Bool)

(declare-fun res!293912 () Bool)

(assert (=> b!490978 (=> (not res!293912) (not e!288544))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490978 (= res!293912 (validKeyInArray!0 (select (arr!15283 a!3235) j!176)))))

(declare-fun b!490979 () Bool)

(declare-fun res!293911 () Bool)

(assert (=> b!490979 (=> (not res!293911) (not e!288545))))

(declare-datatypes ((List!9441 0))(
  ( (Nil!9438) (Cons!9437 (h!10299 (_ BitVec 64)) (t!15669 List!9441)) )
))
(declare-fun arrayNoDuplicates!0 (array!31791 (_ BitVec 32) List!9441) Bool)

(assert (=> b!490979 (= res!293911 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9438))))

(declare-fun b!490980 () Bool)

(declare-fun res!293913 () Bool)

(assert (=> b!490980 (=> (not res!293913) (not e!288544))))

(assert (=> b!490980 (= res!293913 (validKeyInArray!0 k0!2280))))

(declare-fun b!490981 () Bool)

(declare-fun e!288543 () Bool)

(assert (=> b!490981 (= e!288545 (not e!288543))))

(declare-fun res!293915 () Bool)

(assert (=> b!490981 (=> res!293915 e!288543)))

(declare-fun lt!221854 () (_ BitVec 64))

(declare-fun lt!221850 () array!31791)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31791 (_ BitVec 32)) SeekEntryResult!3750)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490981 (= res!293915 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15283 a!3235) j!176) mask!3524) (select (arr!15283 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221854 mask!3524) lt!221854 lt!221850 mask!3524))))))

(assert (=> b!490981 (= lt!221854 (select (store (arr!15283 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490981 (= lt!221850 (array!31792 (store (arr!15283 a!3235) i!1204 k0!2280) (size!15647 a!3235)))))

(declare-fun lt!221853 () SeekEntryResult!3750)

(assert (=> b!490981 (= lt!221853 (Found!3750 j!176))))

(assert (=> b!490981 (= lt!221853 (seekEntryOrOpen!0 (select (arr!15283 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!490981 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14446 0))(
  ( (Unit!14447) )
))
(declare-fun lt!221851 () Unit!14446)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31791 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14446)

(assert (=> b!490981 (= lt!221851 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490982 () Bool)

(assert (=> b!490982 (= e!288543 true)))

(assert (=> b!490982 (= lt!221853 (seekEntryOrOpen!0 lt!221854 lt!221850 mask!3524))))

(declare-fun lt!221849 () Unit!14446)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31791 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14446)

(assert (=> b!490982 (= lt!221849 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(assert (= (and start!44732 res!293917) b!490975))

(assert (= (and b!490975 res!293910) b!490978))

(assert (= (and b!490978 res!293912) b!490980))

(assert (= (and b!490980 res!293913) b!490976))

(assert (= (and b!490976 res!293916) b!490977))

(assert (= (and b!490977 res!293914) b!490974))

(assert (= (and b!490974 res!293918) b!490979))

(assert (= (and b!490979 res!293911) b!490981))

(assert (= (and b!490981 (not res!293915)) b!490982))

(declare-fun m!471337 () Bool)

(assert (=> b!490980 m!471337))

(declare-fun m!471339 () Bool)

(assert (=> b!490979 m!471339))

(declare-fun m!471341 () Bool)

(assert (=> b!490974 m!471341))

(declare-fun m!471343 () Bool)

(assert (=> b!490977 m!471343))

(declare-fun m!471345 () Bool)

(assert (=> b!490981 m!471345))

(declare-fun m!471347 () Bool)

(assert (=> b!490981 m!471347))

(declare-fun m!471349 () Bool)

(assert (=> b!490981 m!471349))

(declare-fun m!471351 () Bool)

(assert (=> b!490981 m!471351))

(declare-fun m!471353 () Bool)

(assert (=> b!490981 m!471353))

(declare-fun m!471355 () Bool)

(assert (=> b!490981 m!471355))

(assert (=> b!490981 m!471353))

(assert (=> b!490981 m!471351))

(assert (=> b!490981 m!471353))

(declare-fun m!471357 () Bool)

(assert (=> b!490981 m!471357))

(declare-fun m!471359 () Bool)

(assert (=> b!490981 m!471359))

(assert (=> b!490981 m!471353))

(declare-fun m!471361 () Bool)

(assert (=> b!490981 m!471361))

(assert (=> b!490981 m!471359))

(declare-fun m!471363 () Bool)

(assert (=> b!490981 m!471363))

(declare-fun m!471365 () Bool)

(assert (=> b!490976 m!471365))

(assert (=> b!490978 m!471353))

(assert (=> b!490978 m!471353))

(declare-fun m!471367 () Bool)

(assert (=> b!490978 m!471367))

(declare-fun m!471369 () Bool)

(assert (=> start!44732 m!471369))

(declare-fun m!471371 () Bool)

(assert (=> start!44732 m!471371))

(declare-fun m!471373 () Bool)

(assert (=> b!490982 m!471373))

(declare-fun m!471375 () Bool)

(assert (=> b!490982 m!471375))

(check-sat (not b!490978) (not b!490982) (not b!490981) (not b!490980) (not b!490974) (not start!44732) (not b!490979) (not b!490977) (not b!490976))
(check-sat)
