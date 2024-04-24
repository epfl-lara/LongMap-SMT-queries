; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44726 () Bool)

(assert start!44726)

(declare-fun res!293961 () Bool)

(declare-fun e!288533 () Bool)

(assert (=> start!44726 (=> (not res!293961) (not e!288533))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44726 (= res!293961 (validMask!0 mask!3524))))

(assert (=> start!44726 e!288533))

(assert (=> start!44726 true))

(declare-datatypes ((array!31786 0))(
  ( (array!31787 (arr!15280 (Array (_ BitVec 32) (_ BitVec 64))) (size!15644 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31786)

(declare-fun array_inv!11139 (array!31786) Bool)

(assert (=> start!44726 (array_inv!11139 a!3235)))

(declare-fun b!490969 () Bool)

(declare-fun res!293962 () Bool)

(assert (=> b!490969 (=> (not res!293962) (not e!288533))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!490969 (= res!293962 (and (= (size!15644 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15644 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15644 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490970 () Bool)

(declare-fun res!293965 () Bool)

(assert (=> b!490970 (=> (not res!293965) (not e!288533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490970 (= res!293965 (validKeyInArray!0 (select (arr!15280 a!3235) j!176)))))

(declare-fun b!490971 () Bool)

(declare-fun e!288532 () Bool)

(declare-fun e!288531 () Bool)

(assert (=> b!490971 (= e!288532 e!288531)))

(declare-fun res!293963 () Bool)

(assert (=> b!490971 (=> res!293963 e!288531)))

(assert (=> b!490971 (= res!293963 (bvslt mask!3524 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!3703 0))(
  ( (MissingZero!3703 (index!16991 (_ BitVec 32))) (Found!3703 (index!16992 (_ BitVec 32))) (Intermediate!3703 (undefined!4515 Bool) (index!16993 (_ BitVec 32)) (x!46230 (_ BitVec 32))) (Undefined!3703) (MissingVacant!3703 (index!16994 (_ BitVec 32))) )
))
(declare-fun lt!221902 () SeekEntryResult!3703)

(declare-fun lt!221899 () (_ BitVec 64))

(declare-fun lt!221898 () array!31786)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31786 (_ BitVec 32)) SeekEntryResult!3703)

(assert (=> b!490971 (= lt!221902 (seekEntryOrOpen!0 lt!221899 lt!221898 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((Unit!14413 0))(
  ( (Unit!14414) )
))
(declare-fun lt!221900 () Unit!14413)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31786 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14413)

(assert (=> b!490971 (= lt!221900 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!490972 () Bool)

(declare-fun res!293967 () Bool)

(assert (=> b!490972 (=> (not res!293967) (not e!288533))))

(declare-fun arrayContainsKey!0 (array!31786 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490972 (= res!293967 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490973 () Bool)

(declare-fun res!293959 () Bool)

(assert (=> b!490973 (=> (not res!293959) (not e!288533))))

(assert (=> b!490973 (= res!293959 (validKeyInArray!0 k0!2280))))

(declare-fun b!490974 () Bool)

(declare-fun e!288534 () Bool)

(assert (=> b!490974 (= e!288534 (not e!288532))))

(declare-fun res!293968 () Bool)

(assert (=> b!490974 (=> res!293968 e!288532)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31786 (_ BitVec 32)) SeekEntryResult!3703)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490974 (= res!293968 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15280 a!3235) j!176) mask!3524) (select (arr!15280 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221899 mask!3524) lt!221899 lt!221898 mask!3524))))))

(assert (=> b!490974 (= lt!221899 (select (store (arr!15280 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490974 (= lt!221898 (array!31787 (store (arr!15280 a!3235) i!1204 k0!2280) (size!15644 a!3235)))))

(assert (=> b!490974 (= lt!221902 (Found!3703 j!176))))

(assert (=> b!490974 (= lt!221902 (seekEntryOrOpen!0 (select (arr!15280 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31786 (_ BitVec 32)) Bool)

(assert (=> b!490974 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221897 () Unit!14413)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31786 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14413)

(assert (=> b!490974 (= lt!221897 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490975 () Bool)

(declare-fun res!293966 () Bool)

(assert (=> b!490975 (=> (not res!293966) (not e!288534))))

(assert (=> b!490975 (= res!293966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490976 () Bool)

(assert (=> b!490976 (= e!288531 (validKeyInArray!0 lt!221899))))

(declare-fun b!490977 () Bool)

(assert (=> b!490977 (= e!288533 e!288534)))

(declare-fun res!293960 () Bool)

(assert (=> b!490977 (=> (not res!293960) (not e!288534))))

(declare-fun lt!221901 () SeekEntryResult!3703)

(assert (=> b!490977 (= res!293960 (or (= lt!221901 (MissingZero!3703 i!1204)) (= lt!221901 (MissingVacant!3703 i!1204))))))

(assert (=> b!490977 (= lt!221901 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490978 () Bool)

(declare-fun res!293964 () Bool)

(assert (=> b!490978 (=> (not res!293964) (not e!288534))))

(declare-datatypes ((List!9345 0))(
  ( (Nil!9342) (Cons!9341 (h!10203 (_ BitVec 64)) (t!15565 List!9345)) )
))
(declare-fun arrayNoDuplicates!0 (array!31786 (_ BitVec 32) List!9345) Bool)

(assert (=> b!490978 (= res!293964 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9342))))

(assert (= (and start!44726 res!293961) b!490969))

(assert (= (and b!490969 res!293962) b!490970))

(assert (= (and b!490970 res!293965) b!490973))

(assert (= (and b!490973 res!293959) b!490972))

(assert (= (and b!490972 res!293967) b!490977))

(assert (= (and b!490977 res!293960) b!490975))

(assert (= (and b!490975 res!293966) b!490978))

(assert (= (and b!490978 res!293964) b!490974))

(assert (= (and b!490974 (not res!293968)) b!490971))

(assert (= (and b!490971 (not res!293963)) b!490976))

(declare-fun m!471601 () Bool)

(assert (=> b!490977 m!471601))

(declare-fun m!471603 () Bool)

(assert (=> b!490976 m!471603))

(declare-fun m!471605 () Bool)

(assert (=> b!490971 m!471605))

(declare-fun m!471607 () Bool)

(assert (=> b!490971 m!471607))

(declare-fun m!471609 () Bool)

(assert (=> b!490975 m!471609))

(declare-fun m!471611 () Bool)

(assert (=> start!44726 m!471611))

(declare-fun m!471613 () Bool)

(assert (=> start!44726 m!471613))

(declare-fun m!471615 () Bool)

(assert (=> b!490972 m!471615))

(declare-fun m!471617 () Bool)

(assert (=> b!490973 m!471617))

(declare-fun m!471619 () Bool)

(assert (=> b!490978 m!471619))

(declare-fun m!471621 () Bool)

(assert (=> b!490974 m!471621))

(declare-fun m!471623 () Bool)

(assert (=> b!490974 m!471623))

(declare-fun m!471625 () Bool)

(assert (=> b!490974 m!471625))

(declare-fun m!471627 () Bool)

(assert (=> b!490974 m!471627))

(declare-fun m!471629 () Bool)

(assert (=> b!490974 m!471629))

(declare-fun m!471631 () Bool)

(assert (=> b!490974 m!471631))

(declare-fun m!471633 () Bool)

(assert (=> b!490974 m!471633))

(declare-fun m!471635 () Bool)

(assert (=> b!490974 m!471635))

(assert (=> b!490974 m!471633))

(assert (=> b!490974 m!471631))

(assert (=> b!490974 m!471623))

(assert (=> b!490974 m!471633))

(declare-fun m!471637 () Bool)

(assert (=> b!490974 m!471637))

(assert (=> b!490974 m!471633))

(declare-fun m!471639 () Bool)

(assert (=> b!490974 m!471639))

(assert (=> b!490970 m!471633))

(assert (=> b!490970 m!471633))

(declare-fun m!471641 () Bool)

(assert (=> b!490970 m!471641))

(check-sat (not b!490974) (not b!490970) (not b!490976) (not b!490977) (not start!44726) (not b!490971) (not b!490978) (not b!490973) (not b!490975) (not b!490972))
(check-sat)
