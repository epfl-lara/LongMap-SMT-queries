; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45192 () Bool)

(assert start!45192)

(declare-fun b!495918 () Bool)

(declare-fun res!298457 () Bool)

(declare-fun e!290836 () Bool)

(assert (=> b!495918 (=> (not res!298457) (not e!290836))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32090 0))(
  ( (array!32091 (arr!15428 (Array (_ BitVec 32) (_ BitVec 64))) (size!15793 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32090)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!495918 (= res!298457 (and (= (size!15793 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15793 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15793 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!495919 () Bool)

(declare-fun res!298455 () Bool)

(assert (=> b!495919 (=> (not res!298455) (not e!290836))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!495919 (= res!298455 (validKeyInArray!0 k0!2280))))

(declare-fun b!495920 () Bool)

(declare-fun res!298451 () Bool)

(declare-fun e!290835 () Bool)

(assert (=> b!495920 (=> res!298451 e!290835)))

(declare-datatypes ((SeekEntryResult!3892 0))(
  ( (MissingZero!3892 (index!17747 (_ BitVec 32))) (Found!3892 (index!17748 (_ BitVec 32))) (Intermediate!3892 (undefined!4704 Bool) (index!17749 (_ BitVec 32)) (x!46819 (_ BitVec 32))) (Undefined!3892) (MissingVacant!3892 (index!17750 (_ BitVec 32))) )
))
(declare-fun lt!224397 () SeekEntryResult!3892)

(get-info :version)

(assert (=> b!495920 (= res!298451 (or (undefined!4704 lt!224397) (not ((_ is Intermediate!3892) lt!224397))))))

(declare-fun res!298452 () Bool)

(assert (=> start!45192 (=> (not res!298452) (not e!290836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45192 (= res!298452 (validMask!0 mask!3524))))

(assert (=> start!45192 e!290836))

(assert (=> start!45192 true))

(declare-fun array_inv!11311 (array!32090) Bool)

(assert (=> start!45192 (array_inv!11311 a!3235)))

(declare-fun b!495921 () Bool)

(declare-fun res!298450 () Bool)

(declare-fun e!290837 () Bool)

(assert (=> b!495921 (=> (not res!298450) (not e!290837))))

(declare-datatypes ((List!9625 0))(
  ( (Nil!9622) (Cons!9621 (h!10492 (_ BitVec 64)) (t!15844 List!9625)) )
))
(declare-fun arrayNoDuplicates!0 (array!32090 (_ BitVec 32) List!9625) Bool)

(assert (=> b!495921 (= res!298450 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9622))))

(declare-fun b!495922 () Bool)

(declare-fun res!298448 () Bool)

(assert (=> b!495922 (=> (not res!298448) (not e!290836))))

(assert (=> b!495922 (= res!298448 (validKeyInArray!0 (select (arr!15428 a!3235) j!176)))))

(declare-fun e!290838 () Bool)

(declare-fun b!495923 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32090 (_ BitVec 32)) SeekEntryResult!3892)

(assert (=> b!495923 (= e!290838 (= (seekEntryOrOpen!0 (select (arr!15428 a!3235) j!176) a!3235 mask!3524) (Found!3892 j!176)))))

(declare-fun b!495924 () Bool)

(assert (=> b!495924 (= e!290836 e!290837)))

(declare-fun res!298456 () Bool)

(assert (=> b!495924 (=> (not res!298456) (not e!290837))))

(declare-fun lt!224395 () SeekEntryResult!3892)

(assert (=> b!495924 (= res!298456 (or (= lt!224395 (MissingZero!3892 i!1204)) (= lt!224395 (MissingVacant!3892 i!1204))))))

(assert (=> b!495924 (= lt!224395 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!495925 () Bool)

(assert (=> b!495925 (= e!290837 (not e!290835))))

(declare-fun res!298449 () Bool)

(assert (=> b!495925 (=> res!298449 e!290835)))

(declare-fun lt!224396 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32090 (_ BitVec 32)) SeekEntryResult!3892)

(assert (=> b!495925 (= res!298449 (= lt!224397 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224396 (select (store (arr!15428 a!3235) i!1204 k0!2280) j!176) (array!32091 (store (arr!15428 a!3235) i!1204 k0!2280) (size!15793 a!3235)) mask!3524)))))

(declare-fun lt!224398 () (_ BitVec 32))

(assert (=> b!495925 (= lt!224397 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224398 (select (arr!15428 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!495925 (= lt!224396 (toIndex!0 (select (store (arr!15428 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!495925 (= lt!224398 (toIndex!0 (select (arr!15428 a!3235) j!176) mask!3524))))

(assert (=> b!495925 e!290838))

(declare-fun res!298454 () Bool)

(assert (=> b!495925 (=> (not res!298454) (not e!290838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32090 (_ BitVec 32)) Bool)

(assert (=> b!495925 (= res!298454 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14716 0))(
  ( (Unit!14717) )
))
(declare-fun lt!224394 () Unit!14716)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32090 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14716)

(assert (=> b!495925 (= lt!224394 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!495926 () Bool)

(declare-fun res!298447 () Bool)

(assert (=> b!495926 (=> (not res!298447) (not e!290837))))

(assert (=> b!495926 (= res!298447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!495927 () Bool)

(declare-fun res!298453 () Bool)

(assert (=> b!495927 (=> (not res!298453) (not e!290836))))

(declare-fun arrayContainsKey!0 (array!32090 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!495927 (= res!298453 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!495928 () Bool)

(assert (=> b!495928 (= e!290835 true)))

(assert (=> b!495928 (and (bvslt (x!46819 lt!224397) #b01111111111111111111111111111110) (or (= (select (arr!15428 a!3235) (index!17749 lt!224397)) (select (arr!15428 a!3235) j!176)) (= (select (arr!15428 a!3235) (index!17749 lt!224397)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15428 a!3235) (index!17749 lt!224397)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!45192 res!298452) b!495918))

(assert (= (and b!495918 res!298457) b!495922))

(assert (= (and b!495922 res!298448) b!495919))

(assert (= (and b!495919 res!298455) b!495927))

(assert (= (and b!495927 res!298453) b!495924))

(assert (= (and b!495924 res!298456) b!495926))

(assert (= (and b!495926 res!298447) b!495921))

(assert (= (and b!495921 res!298450) b!495925))

(assert (= (and b!495925 res!298454) b!495923))

(assert (= (and b!495925 (not res!298449)) b!495920))

(assert (= (and b!495920 (not res!298451)) b!495928))

(declare-fun m!476635 () Bool)

(assert (=> b!495925 m!476635))

(declare-fun m!476637 () Bool)

(assert (=> b!495925 m!476637))

(declare-fun m!476639 () Bool)

(assert (=> b!495925 m!476639))

(declare-fun m!476641 () Bool)

(assert (=> b!495925 m!476641))

(assert (=> b!495925 m!476639))

(declare-fun m!476643 () Bool)

(assert (=> b!495925 m!476643))

(assert (=> b!495925 m!476639))

(declare-fun m!476645 () Bool)

(assert (=> b!495925 m!476645))

(declare-fun m!476647 () Bool)

(assert (=> b!495925 m!476647))

(assert (=> b!495925 m!476647))

(declare-fun m!476649 () Bool)

(assert (=> b!495925 m!476649))

(assert (=> b!495925 m!476647))

(declare-fun m!476651 () Bool)

(assert (=> b!495925 m!476651))

(assert (=> b!495922 m!476639))

(assert (=> b!495922 m!476639))

(declare-fun m!476653 () Bool)

(assert (=> b!495922 m!476653))

(declare-fun m!476655 () Bool)

(assert (=> b!495919 m!476655))

(declare-fun m!476657 () Bool)

(assert (=> start!45192 m!476657))

(declare-fun m!476659 () Bool)

(assert (=> start!45192 m!476659))

(declare-fun m!476661 () Bool)

(assert (=> b!495924 m!476661))

(declare-fun m!476663 () Bool)

(assert (=> b!495928 m!476663))

(assert (=> b!495928 m!476639))

(declare-fun m!476665 () Bool)

(assert (=> b!495927 m!476665))

(declare-fun m!476667 () Bool)

(assert (=> b!495921 m!476667))

(assert (=> b!495923 m!476639))

(assert (=> b!495923 m!476639))

(declare-fun m!476669 () Bool)

(assert (=> b!495923 m!476669))

(declare-fun m!476671 () Bool)

(assert (=> b!495926 m!476671))

(check-sat (not b!495926) (not b!495927) (not b!495923) (not b!495924) (not b!495922) (not b!495921) (not b!495919) (not start!45192) (not b!495925))
(check-sat)
