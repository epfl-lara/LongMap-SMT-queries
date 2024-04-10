; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48116 () Bool)

(assert start!48116)

(declare-fun b!529873 () Bool)

(declare-fun res!325584 () Bool)

(declare-fun e!308753 () Bool)

(assert (=> b!529873 (=> (not res!325584) (not e!308753))))

(declare-datatypes ((array!33552 0))(
  ( (array!33553 (arr!16123 (Array (_ BitVec 32) (_ BitVec 64))) (size!16487 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33552)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33552 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529873 (= res!325584 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529874 () Bool)

(declare-fun res!325583 () Bool)

(declare-fun e!308752 () Bool)

(assert (=> b!529874 (=> (not res!325583) (not e!308752))))

(declare-datatypes ((List!10281 0))(
  ( (Nil!10278) (Cons!10277 (h!11217 (_ BitVec 64)) (t!16509 List!10281)) )
))
(declare-fun arrayNoDuplicates!0 (array!33552 (_ BitVec 32) List!10281) Bool)

(assert (=> b!529874 (= res!325583 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10278))))

(declare-fun b!529875 () Bool)

(assert (=> b!529875 (= e!308753 e!308752)))

(declare-fun res!325589 () Bool)

(assert (=> b!529875 (=> (not res!325589) (not e!308752))))

(declare-datatypes ((SeekEntryResult!4590 0))(
  ( (MissingZero!4590 (index!20584 (_ BitVec 32))) (Found!4590 (index!20585 (_ BitVec 32))) (Intermediate!4590 (undefined!5402 Bool) (index!20586 (_ BitVec 32)) (x!49556 (_ BitVec 32))) (Undefined!4590) (MissingVacant!4590 (index!20587 (_ BitVec 32))) )
))
(declare-fun lt!244320 () SeekEntryResult!4590)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!529875 (= res!325589 (or (= lt!244320 (MissingZero!4590 i!1204)) (= lt!244320 (MissingVacant!4590 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33552 (_ BitVec 32)) SeekEntryResult!4590)

(assert (=> b!529875 (= lt!244320 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!529876 () Bool)

(declare-fun e!308757 () Bool)

(declare-fun e!308755 () Bool)

(assert (=> b!529876 (= e!308757 e!308755)))

(declare-fun res!325585 () Bool)

(assert (=> b!529876 (=> res!325585 e!308755)))

(declare-fun lt!244323 () Bool)

(declare-fun lt!244316 () SeekEntryResult!4590)

(assert (=> b!529876 (= res!325585 (or (and (not lt!244323) (undefined!5402 lt!244316)) (and (not lt!244323) (not (undefined!5402 lt!244316)))))))

(get-info :version)

(assert (=> b!529876 (= lt!244323 (not ((_ is Intermediate!4590) lt!244316)))))

(declare-fun b!529877 () Bool)

(declare-fun res!325579 () Bool)

(assert (=> b!529877 (=> (not res!325579) (not e!308753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529877 (= res!325579 (validKeyInArray!0 k0!2280))))

(declare-fun res!325580 () Bool)

(assert (=> start!48116 (=> (not res!325580) (not e!308753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48116 (= res!325580 (validMask!0 mask!3524))))

(assert (=> start!48116 e!308753))

(assert (=> start!48116 true))

(declare-fun array_inv!11919 (array!33552) Bool)

(assert (=> start!48116 (array_inv!11919 a!3235)))

(declare-fun b!529878 () Bool)

(assert (=> b!529878 (= e!308752 (not e!308757))))

(declare-fun res!325588 () Bool)

(assert (=> b!529878 (=> res!325588 e!308757)))

(declare-fun lt!244319 () array!33552)

(declare-fun lt!244321 () (_ BitVec 64))

(declare-fun lt!244322 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33552 (_ BitVec 32)) SeekEntryResult!4590)

(assert (=> b!529878 (= res!325588 (= lt!244316 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244322 lt!244321 lt!244319 mask!3524)))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!244317 () (_ BitVec 32))

(assert (=> b!529878 (= lt!244316 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244317 (select (arr!16123 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529878 (= lt!244322 (toIndex!0 lt!244321 mask!3524))))

(assert (=> b!529878 (= lt!244321 (select (store (arr!16123 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!529878 (= lt!244317 (toIndex!0 (select (arr!16123 a!3235) j!176) mask!3524))))

(assert (=> b!529878 (= lt!244319 (array!33553 (store (arr!16123 a!3235) i!1204 k0!2280) (size!16487 a!3235)))))

(declare-fun e!308756 () Bool)

(assert (=> b!529878 e!308756))

(declare-fun res!325582 () Bool)

(assert (=> b!529878 (=> (not res!325582) (not e!308756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33552 (_ BitVec 32)) Bool)

(assert (=> b!529878 (= res!325582 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16792 0))(
  ( (Unit!16793) )
))
(declare-fun lt!244324 () Unit!16792)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16792)

(assert (=> b!529878 (= lt!244324 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529879 () Bool)

(declare-fun res!325586 () Bool)

(assert (=> b!529879 (=> (not res!325586) (not e!308753))))

(assert (=> b!529879 (= res!325586 (and (= (size!16487 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16487 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16487 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529880 () Bool)

(assert (=> b!529880 (= e!308756 (= (seekEntryOrOpen!0 (select (arr!16123 a!3235) j!176) a!3235 mask!3524) (Found!4590 j!176)))))

(declare-fun b!529881 () Bool)

(declare-fun res!325581 () Bool)

(assert (=> b!529881 (=> (not res!325581) (not e!308753))))

(assert (=> b!529881 (= res!325581 (validKeyInArray!0 (select (arr!16123 a!3235) j!176)))))

(declare-fun b!529882 () Bool)

(declare-fun res!325587 () Bool)

(assert (=> b!529882 (=> (not res!325587) (not e!308752))))

(assert (=> b!529882 (= res!325587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529883 () Bool)

(assert (=> b!529883 (= e!308755 true)))

(declare-fun lt!244318 () SeekEntryResult!4590)

(assert (=> b!529883 (= lt!244318 (seekEntryOrOpen!0 lt!244321 lt!244319 mask!3524))))

(assert (=> b!529883 false))

(assert (= (and start!48116 res!325580) b!529879))

(assert (= (and b!529879 res!325586) b!529881))

(assert (= (and b!529881 res!325581) b!529877))

(assert (= (and b!529877 res!325579) b!529873))

(assert (= (and b!529873 res!325584) b!529875))

(assert (= (and b!529875 res!325589) b!529882))

(assert (= (and b!529882 res!325587) b!529874))

(assert (= (and b!529874 res!325583) b!529878))

(assert (= (and b!529878 res!325582) b!529880))

(assert (= (and b!529878 (not res!325588)) b!529876))

(assert (= (and b!529876 (not res!325585)) b!529883))

(declare-fun m!510371 () Bool)

(assert (=> b!529880 m!510371))

(assert (=> b!529880 m!510371))

(declare-fun m!510373 () Bool)

(assert (=> b!529880 m!510373))

(declare-fun m!510375 () Bool)

(assert (=> b!529877 m!510375))

(declare-fun m!510377 () Bool)

(assert (=> b!529883 m!510377))

(assert (=> b!529881 m!510371))

(assert (=> b!529881 m!510371))

(declare-fun m!510379 () Bool)

(assert (=> b!529881 m!510379))

(declare-fun m!510381 () Bool)

(assert (=> b!529878 m!510381))

(assert (=> b!529878 m!510371))

(declare-fun m!510383 () Bool)

(assert (=> b!529878 m!510383))

(declare-fun m!510385 () Bool)

(assert (=> b!529878 m!510385))

(declare-fun m!510387 () Bool)

(assert (=> b!529878 m!510387))

(declare-fun m!510389 () Bool)

(assert (=> b!529878 m!510389))

(assert (=> b!529878 m!510371))

(declare-fun m!510391 () Bool)

(assert (=> b!529878 m!510391))

(declare-fun m!510393 () Bool)

(assert (=> b!529878 m!510393))

(assert (=> b!529878 m!510371))

(declare-fun m!510395 () Bool)

(assert (=> b!529878 m!510395))

(declare-fun m!510397 () Bool)

(assert (=> b!529873 m!510397))

(declare-fun m!510399 () Bool)

(assert (=> b!529875 m!510399))

(declare-fun m!510401 () Bool)

(assert (=> b!529874 m!510401))

(declare-fun m!510403 () Bool)

(assert (=> b!529882 m!510403))

(declare-fun m!510405 () Bool)

(assert (=> start!48116 m!510405))

(declare-fun m!510407 () Bool)

(assert (=> start!48116 m!510407))

(check-sat (not b!529881) (not b!529873) (not b!529875) (not b!529880) (not start!48116) (not b!529882) (not b!529874) (not b!529878) (not b!529883) (not b!529877))
(check-sat)
