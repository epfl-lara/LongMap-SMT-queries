; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45006 () Bool)

(assert start!45006)

(declare-fun b!493645 () Bool)

(declare-fun res!296357 () Bool)

(declare-fun e!289803 () Bool)

(assert (=> b!493645 (=> res!296357 e!289803)))

(declare-datatypes ((SeekEntryResult!3829 0))(
  ( (MissingZero!3829 (index!17495 (_ BitVec 32))) (Found!3829 (index!17496 (_ BitVec 32))) (Intermediate!3829 (undefined!4641 Bool) (index!17497 (_ BitVec 32)) (x!46582 (_ BitVec 32))) (Undefined!3829) (MissingVacant!3829 (index!17498 (_ BitVec 32))) )
))
(declare-fun lt!223226 () SeekEntryResult!3829)

(get-info :version)

(assert (=> b!493645 (= res!296357 (or (not ((_ is Intermediate!3829) lt!223226)) (not (undefined!4641 lt!223226))))))

(declare-fun b!493646 () Bool)

(declare-fun e!289801 () Bool)

(declare-fun e!289800 () Bool)

(assert (=> b!493646 (= e!289801 e!289800)))

(declare-fun res!296363 () Bool)

(assert (=> b!493646 (=> (not res!296363) (not e!289800))))

(declare-fun lt!223224 () SeekEntryResult!3829)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493646 (= res!296363 (or (= lt!223224 (MissingZero!3829 i!1204)) (= lt!223224 (MissingVacant!3829 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31961 0))(
  ( (array!31962 (arr!15365 (Array (_ BitVec 32) (_ BitVec 64))) (size!15730 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31961)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31961 (_ BitVec 32)) SeekEntryResult!3829)

(assert (=> b!493646 (= lt!223224 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493647 () Bool)

(declare-fun res!296359 () Bool)

(assert (=> b!493647 (=> (not res!296359) (not e!289801))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493647 (= res!296359 (validKeyInArray!0 (select (arr!15365 a!3235) j!176)))))

(declare-fun b!493648 () Bool)

(declare-fun res!296360 () Bool)

(assert (=> b!493648 (=> (not res!296360) (not e!289800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31961 (_ BitVec 32)) Bool)

(assert (=> b!493648 (= res!296360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493649 () Bool)

(assert (=> b!493649 (= e!289803 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-fun lt!223228 () SeekEntryResult!3829)

(assert (=> b!493649 (= lt!223228 Undefined!3829)))

(declare-fun b!493650 () Bool)

(declare-fun res!296358 () Bool)

(assert (=> b!493650 (=> (not res!296358) (not e!289801))))

(assert (=> b!493650 (= res!296358 (validKeyInArray!0 k0!2280))))

(declare-fun res!296365 () Bool)

(assert (=> start!45006 (=> (not res!296365) (not e!289801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45006 (= res!296365 (validMask!0 mask!3524))))

(assert (=> start!45006 e!289801))

(assert (=> start!45006 true))

(declare-fun array_inv!11248 (array!31961) Bool)

(assert (=> start!45006 (array_inv!11248 a!3235)))

(declare-fun b!493651 () Bool)

(declare-fun res!296362 () Bool)

(assert (=> b!493651 (=> (not res!296362) (not e!289801))))

(declare-fun arrayContainsKey!0 (array!31961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493651 (= res!296362 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493652 () Bool)

(declare-fun res!296364 () Bool)

(assert (=> b!493652 (=> (not res!296364) (not e!289801))))

(assert (=> b!493652 (= res!296364 (and (= (size!15730 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15730 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15730 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493653 () Bool)

(declare-fun res!296361 () Bool)

(assert (=> b!493653 (=> (not res!296361) (not e!289800))))

(declare-datatypes ((List!9562 0))(
  ( (Nil!9559) (Cons!9558 (h!10426 (_ BitVec 64)) (t!15781 List!9562)) )
))
(declare-fun arrayNoDuplicates!0 (array!31961 (_ BitVec 32) List!9562) Bool)

(assert (=> b!493653 (= res!296361 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9559))))

(declare-fun b!493654 () Bool)

(assert (=> b!493654 (= e!289800 (not e!289803))))

(declare-fun res!296366 () Bool)

(assert (=> b!493654 (=> res!296366 e!289803)))

(declare-fun lt!223227 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31961 (_ BitVec 32)) SeekEntryResult!3829)

(assert (=> b!493654 (= res!296366 (= lt!223226 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223227 (select (store (arr!15365 a!3235) i!1204 k0!2280) j!176) (array!31962 (store (arr!15365 a!3235) i!1204 k0!2280) (size!15730 a!3235)) mask!3524)))))

(declare-fun lt!223223 () (_ BitVec 32))

(assert (=> b!493654 (= lt!223226 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223223 (select (arr!15365 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493654 (= lt!223227 (toIndex!0 (select (store (arr!15365 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493654 (= lt!223223 (toIndex!0 (select (arr!15365 a!3235) j!176) mask!3524))))

(assert (=> b!493654 (= lt!223228 (Found!3829 j!176))))

(assert (=> b!493654 (= lt!223228 (seekEntryOrOpen!0 (select (arr!15365 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!493654 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14590 0))(
  ( (Unit!14591) )
))
(declare-fun lt!223225 () Unit!14590)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31961 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14590)

(assert (=> b!493654 (= lt!223225 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45006 res!296365) b!493652))

(assert (= (and b!493652 res!296364) b!493647))

(assert (= (and b!493647 res!296359) b!493650))

(assert (= (and b!493650 res!296358) b!493651))

(assert (= (and b!493651 res!296362) b!493646))

(assert (= (and b!493646 res!296363) b!493648))

(assert (= (and b!493648 res!296360) b!493653))

(assert (= (and b!493653 res!296361) b!493654))

(assert (= (and b!493654 (not res!296366)) b!493645))

(assert (= (and b!493645 (not res!296357)) b!493649))

(declare-fun m!474103 () Bool)

(assert (=> b!493647 m!474103))

(assert (=> b!493647 m!474103))

(declare-fun m!474105 () Bool)

(assert (=> b!493647 m!474105))

(declare-fun m!474107 () Bool)

(assert (=> b!493654 m!474107))

(declare-fun m!474109 () Bool)

(assert (=> b!493654 m!474109))

(declare-fun m!474111 () Bool)

(assert (=> b!493654 m!474111))

(assert (=> b!493654 m!474103))

(declare-fun m!474113 () Bool)

(assert (=> b!493654 m!474113))

(assert (=> b!493654 m!474103))

(declare-fun m!474115 () Bool)

(assert (=> b!493654 m!474115))

(assert (=> b!493654 m!474103))

(declare-fun m!474117 () Bool)

(assert (=> b!493654 m!474117))

(assert (=> b!493654 m!474111))

(declare-fun m!474119 () Bool)

(assert (=> b!493654 m!474119))

(assert (=> b!493654 m!474103))

(declare-fun m!474121 () Bool)

(assert (=> b!493654 m!474121))

(assert (=> b!493654 m!474111))

(declare-fun m!474123 () Bool)

(assert (=> b!493654 m!474123))

(declare-fun m!474125 () Bool)

(assert (=> b!493646 m!474125))

(declare-fun m!474127 () Bool)

(assert (=> b!493648 m!474127))

(declare-fun m!474129 () Bool)

(assert (=> b!493653 m!474129))

(declare-fun m!474131 () Bool)

(assert (=> b!493650 m!474131))

(declare-fun m!474133 () Bool)

(assert (=> start!45006 m!474133))

(declare-fun m!474135 () Bool)

(assert (=> start!45006 m!474135))

(declare-fun m!474137 () Bool)

(assert (=> b!493651 m!474137))

(check-sat (not b!493651) (not b!493647) (not start!45006) (not b!493650) (not b!493648) (not b!493653) (not b!493646) (not b!493654))
(check-sat)
