; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46694 () Bool)

(assert start!46694)

(declare-fun b!515314 () Bool)

(declare-fun e!300892 () Bool)

(declare-fun e!300891 () Bool)

(assert (=> b!515314 (= e!300892 e!300891)))

(declare-fun res!314880 () Bool)

(assert (=> b!515314 (=> (not res!314880) (not e!300891))))

(declare-datatypes ((SeekEntryResult!4338 0))(
  ( (MissingZero!4338 (index!19540 (_ BitVec 32))) (Found!4338 (index!19541 (_ BitVec 32))) (Intermediate!4338 (undefined!5150 Bool) (index!19542 (_ BitVec 32)) (x!48509 (_ BitVec 32))) (Undefined!4338) (MissingVacant!4338 (index!19543 (_ BitVec 32))) )
))
(declare-fun lt!235906 () SeekEntryResult!4338)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515314 (= res!314880 (or (= lt!235906 (MissingZero!4338 i!1204)) (= lt!235906 (MissingVacant!4338 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33006 0))(
  ( (array!33007 (arr!15871 (Array (_ BitVec 32) (_ BitVec 64))) (size!16235 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33006)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33006 (_ BitVec 32)) SeekEntryResult!4338)

(assert (=> b!515314 (= lt!235906 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!515315 () Bool)

(declare-fun res!314882 () Bool)

(assert (=> b!515315 (=> (not res!314882) (not e!300891))))

(declare-datatypes ((List!10029 0))(
  ( (Nil!10026) (Cons!10025 (h!10923 (_ BitVec 64)) (t!16257 List!10029)) )
))
(declare-fun arrayNoDuplicates!0 (array!33006 (_ BitVec 32) List!10029) Bool)

(assert (=> b!515315 (= res!314882 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10026))))

(declare-fun b!515316 () Bool)

(declare-fun e!300894 () Bool)

(assert (=> b!515316 (= e!300894 true)))

(declare-fun lt!235907 () SeekEntryResult!4338)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!515316 (and (bvslt (x!48509 lt!235907) #b01111111111111111111111111111110) (or (= (select (arr!15871 a!3235) (index!19542 lt!235907)) (select (arr!15871 a!3235) j!176)) (= (select (arr!15871 a!3235) (index!19542 lt!235907)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15871 a!3235) (index!19542 lt!235907)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515317 () Bool)

(declare-fun res!314884 () Bool)

(assert (=> b!515317 (=> (not res!314884) (not e!300892))))

(declare-fun arrayContainsKey!0 (array!33006 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515317 (= res!314884 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515318 () Bool)

(assert (=> b!515318 (= e!300891 (not e!300894))))

(declare-fun res!314881 () Bool)

(assert (=> b!515318 (=> res!314881 e!300894)))

(declare-fun lt!235908 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33006 (_ BitVec 32)) SeekEntryResult!4338)

(assert (=> b!515318 (= res!314881 (= lt!235907 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235908 (select (store (arr!15871 a!3235) i!1204 k0!2280) j!176) (array!33007 (store (arr!15871 a!3235) i!1204 k0!2280) (size!16235 a!3235)) mask!3524)))))

(declare-fun lt!235909 () (_ BitVec 32))

(assert (=> b!515318 (= lt!235907 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235909 (select (arr!15871 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515318 (= lt!235908 (toIndex!0 (select (store (arr!15871 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!515318 (= lt!235909 (toIndex!0 (select (arr!15871 a!3235) j!176) mask!3524))))

(declare-fun e!300893 () Bool)

(assert (=> b!515318 e!300893))

(declare-fun res!314885 () Bool)

(assert (=> b!515318 (=> (not res!314885) (not e!300893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33006 (_ BitVec 32)) Bool)

(assert (=> b!515318 (= res!314885 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15934 0))(
  ( (Unit!15935) )
))
(declare-fun lt!235905 () Unit!15934)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33006 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15934)

(assert (=> b!515318 (= lt!235905 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515319 () Bool)

(assert (=> b!515319 (= e!300893 (= (seekEntryOrOpen!0 (select (arr!15871 a!3235) j!176) a!3235 mask!3524) (Found!4338 j!176)))))

(declare-fun b!515320 () Bool)

(declare-fun res!314883 () Bool)

(assert (=> b!515320 (=> (not res!314883) (not e!300892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515320 (= res!314883 (validKeyInArray!0 k0!2280))))

(declare-fun b!515321 () Bool)

(declare-fun res!314886 () Bool)

(assert (=> b!515321 (=> (not res!314886) (not e!300892))))

(assert (=> b!515321 (= res!314886 (validKeyInArray!0 (select (arr!15871 a!3235) j!176)))))

(declare-fun b!515322 () Bool)

(declare-fun res!314888 () Bool)

(assert (=> b!515322 (=> (not res!314888) (not e!300892))))

(assert (=> b!515322 (= res!314888 (and (= (size!16235 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16235 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16235 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!314879 () Bool)

(assert (=> start!46694 (=> (not res!314879) (not e!300892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46694 (= res!314879 (validMask!0 mask!3524))))

(assert (=> start!46694 e!300892))

(assert (=> start!46694 true))

(declare-fun array_inv!11667 (array!33006) Bool)

(assert (=> start!46694 (array_inv!11667 a!3235)))

(declare-fun b!515323 () Bool)

(declare-fun res!314887 () Bool)

(assert (=> b!515323 (=> res!314887 e!300894)))

(get-info :version)

(assert (=> b!515323 (= res!314887 (or (undefined!5150 lt!235907) (not ((_ is Intermediate!4338) lt!235907))))))

(declare-fun b!515324 () Bool)

(declare-fun res!314878 () Bool)

(assert (=> b!515324 (=> (not res!314878) (not e!300891))))

(assert (=> b!515324 (= res!314878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46694 res!314879) b!515322))

(assert (= (and b!515322 res!314888) b!515321))

(assert (= (and b!515321 res!314886) b!515320))

(assert (= (and b!515320 res!314883) b!515317))

(assert (= (and b!515317 res!314884) b!515314))

(assert (= (and b!515314 res!314880) b!515324))

(assert (= (and b!515324 res!314878) b!515315))

(assert (= (and b!515315 res!314882) b!515318))

(assert (= (and b!515318 res!314885) b!515319))

(assert (= (and b!515318 (not res!314881)) b!515323))

(assert (= (and b!515323 (not res!314887)) b!515316))

(declare-fun m!496631 () Bool)

(assert (=> b!515314 m!496631))

(declare-fun m!496633 () Bool)

(assert (=> start!46694 m!496633))

(declare-fun m!496635 () Bool)

(assert (=> start!46694 m!496635))

(declare-fun m!496637 () Bool)

(assert (=> b!515320 m!496637))

(declare-fun m!496639 () Bool)

(assert (=> b!515319 m!496639))

(assert (=> b!515319 m!496639))

(declare-fun m!496641 () Bool)

(assert (=> b!515319 m!496641))

(assert (=> b!515318 m!496639))

(declare-fun m!496643 () Bool)

(assert (=> b!515318 m!496643))

(declare-fun m!496645 () Bool)

(assert (=> b!515318 m!496645))

(declare-fun m!496647 () Bool)

(assert (=> b!515318 m!496647))

(declare-fun m!496649 () Bool)

(assert (=> b!515318 m!496649))

(declare-fun m!496651 () Bool)

(assert (=> b!515318 m!496651))

(assert (=> b!515318 m!496647))

(assert (=> b!515318 m!496639))

(declare-fun m!496653 () Bool)

(assert (=> b!515318 m!496653))

(assert (=> b!515318 m!496639))

(declare-fun m!496655 () Bool)

(assert (=> b!515318 m!496655))

(assert (=> b!515318 m!496647))

(declare-fun m!496657 () Bool)

(assert (=> b!515318 m!496657))

(declare-fun m!496659 () Bool)

(assert (=> b!515324 m!496659))

(declare-fun m!496661 () Bool)

(assert (=> b!515316 m!496661))

(assert (=> b!515316 m!496639))

(assert (=> b!515321 m!496639))

(assert (=> b!515321 m!496639))

(declare-fun m!496663 () Bool)

(assert (=> b!515321 m!496663))

(declare-fun m!496665 () Bool)

(assert (=> b!515317 m!496665))

(declare-fun m!496667 () Bool)

(assert (=> b!515315 m!496667))

(check-sat (not b!515317) (not b!515318) (not b!515314) (not b!515315) (not b!515321) (not b!515319) (not b!515324) (not b!515320) (not start!46694))
(check-sat)
