; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47772 () Bool)

(assert start!47772)

(declare-fun b!526012 () Bool)

(declare-fun e!306648 () Bool)

(assert (=> b!526012 (= e!306648 true)))

(declare-datatypes ((SeekEntryResult!4523 0))(
  ( (MissingZero!4523 (index!20304 (_ BitVec 32))) (Found!4523 (index!20305 (_ BitVec 32))) (Intermediate!4523 (undefined!5335 Bool) (index!20306 (_ BitVec 32)) (x!49280 (_ BitVec 32))) (Undefined!4523) (MissingVacant!4523 (index!20307 (_ BitVec 32))) )
))
(declare-fun lt!241806 () SeekEntryResult!4523)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!526012 (= (index!20306 lt!241806) i!1204)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33409 0))(
  ( (array!33410 (arr!16056 (Array (_ BitVec 32) (_ BitVec 64))) (size!16420 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33409)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!16544 0))(
  ( (Unit!16545) )
))
(declare-fun lt!241808 () Unit!16544)

(declare-fun lt!241811 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33409 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16544)

(assert (=> b!526012 (= lt!241808 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!241811 #b00000000000000000000000000000000 (index!20306 lt!241806) (x!49280 lt!241806) mask!3524))))

(assert (=> b!526012 (and (or (= (select (arr!16056 a!3235) (index!20306 lt!241806)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16056 a!3235) (index!20306 lt!241806)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16056 a!3235) (index!20306 lt!241806)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16056 a!3235) (index!20306 lt!241806)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241812 () Unit!16544)

(declare-fun e!306650 () Unit!16544)

(assert (=> b!526012 (= lt!241812 e!306650)))

(declare-fun c!61964 () Bool)

(assert (=> b!526012 (= c!61964 (= (select (arr!16056 a!3235) (index!20306 lt!241806)) (select (arr!16056 a!3235) j!176)))))

(assert (=> b!526012 (and (bvslt (x!49280 lt!241806) #b01111111111111111111111111111110) (or (= (select (arr!16056 a!3235) (index!20306 lt!241806)) (select (arr!16056 a!3235) j!176)) (= (select (arr!16056 a!3235) (index!20306 lt!241806)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16056 a!3235) (index!20306 lt!241806)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526013 () Bool)

(declare-fun e!306649 () Bool)

(assert (=> b!526013 (= e!306649 false)))

(declare-fun b!526014 () Bool)

(declare-fun Unit!16546 () Unit!16544)

(assert (=> b!526014 (= e!306650 Unit!16546)))

(declare-fun b!526015 () Bool)

(declare-fun res!322704 () Bool)

(assert (=> b!526015 (=> res!322704 e!306648)))

(assert (=> b!526015 (= res!322704 (or (undefined!5335 lt!241806) (not (is-Intermediate!4523 lt!241806))))))

(declare-fun b!526016 () Bool)

(declare-fun res!322702 () Bool)

(declare-fun e!306646 () Bool)

(assert (=> b!526016 (=> (not res!322702) (not e!306646))))

(declare-datatypes ((List!10214 0))(
  ( (Nil!10211) (Cons!10210 (h!11141 (_ BitVec 64)) (t!16442 List!10214)) )
))
(declare-fun arrayNoDuplicates!0 (array!33409 (_ BitVec 32) List!10214) Bool)

(assert (=> b!526016 (= res!322702 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10211))))

(declare-fun b!526017 () Bool)

(declare-fun res!322705 () Bool)

(declare-fun e!306651 () Bool)

(assert (=> b!526017 (=> (not res!322705) (not e!306651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526017 (= res!322705 (validKeyInArray!0 k!2280))))

(declare-fun b!526018 () Bool)

(declare-fun res!322699 () Bool)

(assert (=> b!526018 (=> (not res!322699) (not e!306651))))

(assert (=> b!526018 (= res!322699 (validKeyInArray!0 (select (arr!16056 a!3235) j!176)))))

(declare-fun b!526019 () Bool)

(declare-fun res!322697 () Bool)

(assert (=> b!526019 (=> (not res!322697) (not e!306651))))

(declare-fun arrayContainsKey!0 (array!33409 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526019 (= res!322697 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526020 () Bool)

(assert (=> b!526020 (= e!306651 e!306646)))

(declare-fun res!322698 () Bool)

(assert (=> b!526020 (=> (not res!322698) (not e!306646))))

(declare-fun lt!241809 () SeekEntryResult!4523)

(assert (=> b!526020 (= res!322698 (or (= lt!241809 (MissingZero!4523 i!1204)) (= lt!241809 (MissingVacant!4523 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33409 (_ BitVec 32)) SeekEntryResult!4523)

(assert (=> b!526020 (= lt!241809 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!526021 () Bool)

(declare-fun e!306647 () Bool)

(assert (=> b!526021 (= e!306647 (= (seekEntryOrOpen!0 (select (arr!16056 a!3235) j!176) a!3235 mask!3524) (Found!4523 j!176)))))

(declare-fun res!322701 () Bool)

(assert (=> start!47772 (=> (not res!322701) (not e!306651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47772 (= res!322701 (validMask!0 mask!3524))))

(assert (=> start!47772 e!306651))

(assert (=> start!47772 true))

(declare-fun array_inv!11852 (array!33409) Bool)

(assert (=> start!47772 (array_inv!11852 a!3235)))

(declare-fun b!526022 () Bool)

(declare-fun Unit!16547 () Unit!16544)

(assert (=> b!526022 (= e!306650 Unit!16547)))

(declare-fun lt!241810 () Unit!16544)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33409 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16544)

(assert (=> b!526022 (= lt!241810 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!241811 #b00000000000000000000000000000000 (index!20306 lt!241806) (x!49280 lt!241806) mask!3524))))

(declare-fun lt!241807 () (_ BitVec 64))

(declare-fun res!322706 () Bool)

(declare-fun lt!241805 () array!33409)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33409 (_ BitVec 32)) SeekEntryResult!4523)

(assert (=> b!526022 (= res!322706 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241811 lt!241807 lt!241805 mask!3524) (Intermediate!4523 false (index!20306 lt!241806) (x!49280 lt!241806))))))

(assert (=> b!526022 (=> (not res!322706) (not e!306649))))

(assert (=> b!526022 e!306649))

(declare-fun b!526023 () Bool)

(declare-fun res!322695 () Bool)

(assert (=> b!526023 (=> (not res!322695) (not e!306651))))

(assert (=> b!526023 (= res!322695 (and (= (size!16420 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16420 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16420 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526024 () Bool)

(assert (=> b!526024 (= e!306646 (not e!306648))))

(declare-fun res!322700 () Bool)

(assert (=> b!526024 (=> res!322700 e!306648)))

(declare-fun lt!241813 () (_ BitVec 32))

(assert (=> b!526024 (= res!322700 (= lt!241806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241813 lt!241807 lt!241805 mask!3524)))))

(assert (=> b!526024 (= lt!241806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241811 (select (arr!16056 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526024 (= lt!241813 (toIndex!0 lt!241807 mask!3524))))

(assert (=> b!526024 (= lt!241807 (select (store (arr!16056 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!526024 (= lt!241811 (toIndex!0 (select (arr!16056 a!3235) j!176) mask!3524))))

(assert (=> b!526024 (= lt!241805 (array!33410 (store (arr!16056 a!3235) i!1204 k!2280) (size!16420 a!3235)))))

(assert (=> b!526024 e!306647))

(declare-fun res!322703 () Bool)

(assert (=> b!526024 (=> (not res!322703) (not e!306647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33409 (_ BitVec 32)) Bool)

(assert (=> b!526024 (= res!322703 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241804 () Unit!16544)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33409 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16544)

(assert (=> b!526024 (= lt!241804 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526025 () Bool)

(declare-fun res!322696 () Bool)

(assert (=> b!526025 (=> (not res!322696) (not e!306646))))

(assert (=> b!526025 (= res!322696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!47772 res!322701) b!526023))

(assert (= (and b!526023 res!322695) b!526018))

(assert (= (and b!526018 res!322699) b!526017))

(assert (= (and b!526017 res!322705) b!526019))

(assert (= (and b!526019 res!322697) b!526020))

(assert (= (and b!526020 res!322698) b!526025))

(assert (= (and b!526025 res!322696) b!526016))

(assert (= (and b!526016 res!322702) b!526024))

(assert (= (and b!526024 res!322703) b!526021))

(assert (= (and b!526024 (not res!322700)) b!526015))

(assert (= (and b!526015 (not res!322704)) b!526012))

(assert (= (and b!526012 c!61964) b!526022))

(assert (= (and b!526012 (not c!61964)) b!526014))

(assert (= (and b!526022 res!322706) b!526013))

(declare-fun m!506697 () Bool)

(assert (=> b!526016 m!506697))

(declare-fun m!506699 () Bool)

(assert (=> b!526021 m!506699))

(assert (=> b!526021 m!506699))

(declare-fun m!506701 () Bool)

(assert (=> b!526021 m!506701))

(assert (=> b!526018 m!506699))

(assert (=> b!526018 m!506699))

(declare-fun m!506703 () Bool)

(assert (=> b!526018 m!506703))

(declare-fun m!506705 () Bool)

(assert (=> b!526022 m!506705))

(declare-fun m!506707 () Bool)

(assert (=> b!526022 m!506707))

(declare-fun m!506709 () Bool)

(assert (=> b!526012 m!506709))

(declare-fun m!506711 () Bool)

(assert (=> b!526012 m!506711))

(assert (=> b!526012 m!506699))

(declare-fun m!506713 () Bool)

(assert (=> b!526024 m!506713))

(declare-fun m!506715 () Bool)

(assert (=> b!526024 m!506715))

(assert (=> b!526024 m!506699))

(declare-fun m!506717 () Bool)

(assert (=> b!526024 m!506717))

(declare-fun m!506719 () Bool)

(assert (=> b!526024 m!506719))

(assert (=> b!526024 m!506699))

(declare-fun m!506721 () Bool)

(assert (=> b!526024 m!506721))

(declare-fun m!506723 () Bool)

(assert (=> b!526024 m!506723))

(declare-fun m!506725 () Bool)

(assert (=> b!526024 m!506725))

(declare-fun m!506727 () Bool)

(assert (=> b!526024 m!506727))

(assert (=> b!526024 m!506699))

(declare-fun m!506729 () Bool)

(assert (=> b!526020 m!506729))

(declare-fun m!506731 () Bool)

(assert (=> b!526017 m!506731))

(declare-fun m!506733 () Bool)

(assert (=> b!526025 m!506733))

(declare-fun m!506735 () Bool)

(assert (=> start!47772 m!506735))

(declare-fun m!506737 () Bool)

(assert (=> start!47772 m!506737))

(declare-fun m!506739 () Bool)

(assert (=> b!526019 m!506739))

(push 1)

