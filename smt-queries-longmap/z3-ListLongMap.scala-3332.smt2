; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45974 () Bool)

(assert start!45974)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32686 0))(
  ( (array!32687 (arr!15721 (Array (_ BitVec 32) (_ BitVec 64))) (size!16085 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32686)

(declare-fun e!297723 () Bool)

(declare-fun b!509021 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4144 0))(
  ( (MissingZero!4144 (index!18764 (_ BitVec 32))) (Found!4144 (index!18765 (_ BitVec 32))) (Intermediate!4144 (undefined!4956 Bool) (index!18766 (_ BitVec 32)) (x!47886 (_ BitVec 32))) (Undefined!4144) (MissingVacant!4144 (index!18767 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32686 (_ BitVec 32)) SeekEntryResult!4144)

(assert (=> b!509021 (= e!297723 (= (seekEntryOrOpen!0 (select (arr!15721 a!3235) j!176) a!3235 mask!3524) (Found!4144 j!176)))))

(declare-fun b!509022 () Bool)

(declare-fun res!309921 () Bool)

(declare-fun e!297724 () Bool)

(assert (=> b!509022 (=> (not res!309921) (not e!297724))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509022 (= res!309921 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509024 () Bool)

(declare-fun res!309928 () Bool)

(declare-fun e!297726 () Bool)

(assert (=> b!509024 (=> (not res!309928) (not e!297726))))

(declare-datatypes ((List!9786 0))(
  ( (Nil!9783) (Cons!9782 (h!10659 (_ BitVec 64)) (t!16006 List!9786)) )
))
(declare-fun arrayNoDuplicates!0 (array!32686 (_ BitVec 32) List!9786) Bool)

(assert (=> b!509024 (= res!309928 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9783))))

(declare-fun b!509025 () Bool)

(assert (=> b!509025 (= e!297724 e!297726)))

(declare-fun res!309925 () Bool)

(assert (=> b!509025 (=> (not res!309925) (not e!297726))))

(declare-fun lt!232493 () SeekEntryResult!4144)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509025 (= res!309925 (or (= lt!232493 (MissingZero!4144 i!1204)) (= lt!232493 (MissingVacant!4144 i!1204))))))

(assert (=> b!509025 (= lt!232493 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509026 () Bool)

(declare-fun res!309924 () Bool)

(assert (=> b!509026 (=> (not res!309924) (not e!297724))))

(assert (=> b!509026 (= res!309924 (and (= (size!16085 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16085 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16085 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509027 () Bool)

(declare-fun res!309922 () Bool)

(assert (=> b!509027 (=> (not res!309922) (not e!297726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32686 (_ BitVec 32)) Bool)

(assert (=> b!509027 (= res!309922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509028 () Bool)

(assert (=> b!509028 (= e!297726 (not true))))

(declare-fun lt!232495 () SeekEntryResult!4144)

(declare-fun lt!232491 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32686 (_ BitVec 32)) SeekEntryResult!4144)

(assert (=> b!509028 (= lt!232495 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232491 (select (store (arr!15721 a!3235) i!1204 k0!2280) j!176) (array!32687 (store (arr!15721 a!3235) i!1204 k0!2280) (size!16085 a!3235)) mask!3524))))

(declare-fun lt!232494 () SeekEntryResult!4144)

(declare-fun lt!232492 () (_ BitVec 32))

(assert (=> b!509028 (= lt!232494 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232492 (select (arr!15721 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509028 (= lt!232491 (toIndex!0 (select (store (arr!15721 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509028 (= lt!232492 (toIndex!0 (select (arr!15721 a!3235) j!176) mask!3524))))

(assert (=> b!509028 e!297723))

(declare-fun res!309927 () Bool)

(assert (=> b!509028 (=> (not res!309927) (not e!297723))))

(assert (=> b!509028 (= res!309927 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15607 0))(
  ( (Unit!15608) )
))
(declare-fun lt!232490 () Unit!15607)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15607)

(assert (=> b!509028 (= lt!232490 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509029 () Bool)

(declare-fun res!309923 () Bool)

(assert (=> b!509029 (=> (not res!309923) (not e!297724))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509029 (= res!309923 (validKeyInArray!0 k0!2280))))

(declare-fun res!309920 () Bool)

(assert (=> start!45974 (=> (not res!309920) (not e!297724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45974 (= res!309920 (validMask!0 mask!3524))))

(assert (=> start!45974 e!297724))

(assert (=> start!45974 true))

(declare-fun array_inv!11580 (array!32686) Bool)

(assert (=> start!45974 (array_inv!11580 a!3235)))

(declare-fun b!509023 () Bool)

(declare-fun res!309926 () Bool)

(assert (=> b!509023 (=> (not res!309926) (not e!297724))))

(assert (=> b!509023 (= res!309926 (validKeyInArray!0 (select (arr!15721 a!3235) j!176)))))

(assert (= (and start!45974 res!309920) b!509026))

(assert (= (and b!509026 res!309924) b!509023))

(assert (= (and b!509023 res!309926) b!509029))

(assert (= (and b!509029 res!309923) b!509022))

(assert (= (and b!509022 res!309921) b!509025))

(assert (= (and b!509025 res!309925) b!509027))

(assert (= (and b!509027 res!309922) b!509024))

(assert (= (and b!509024 res!309928) b!509028))

(assert (= (and b!509028 res!309927) b!509021))

(declare-fun m!490033 () Bool)

(assert (=> start!45974 m!490033))

(declare-fun m!490035 () Bool)

(assert (=> start!45974 m!490035))

(declare-fun m!490037 () Bool)

(assert (=> b!509023 m!490037))

(assert (=> b!509023 m!490037))

(declare-fun m!490039 () Bool)

(assert (=> b!509023 m!490039))

(declare-fun m!490041 () Bool)

(assert (=> b!509028 m!490041))

(assert (=> b!509028 m!490037))

(declare-fun m!490043 () Bool)

(assert (=> b!509028 m!490043))

(declare-fun m!490045 () Bool)

(assert (=> b!509028 m!490045))

(declare-fun m!490047 () Bool)

(assert (=> b!509028 m!490047))

(assert (=> b!509028 m!490037))

(declare-fun m!490049 () Bool)

(assert (=> b!509028 m!490049))

(assert (=> b!509028 m!490047))

(declare-fun m!490051 () Bool)

(assert (=> b!509028 m!490051))

(assert (=> b!509028 m!490037))

(declare-fun m!490053 () Bool)

(assert (=> b!509028 m!490053))

(assert (=> b!509028 m!490047))

(declare-fun m!490055 () Bool)

(assert (=> b!509028 m!490055))

(declare-fun m!490057 () Bool)

(assert (=> b!509027 m!490057))

(declare-fun m!490059 () Bool)

(assert (=> b!509029 m!490059))

(declare-fun m!490061 () Bool)

(assert (=> b!509025 m!490061))

(declare-fun m!490063 () Bool)

(assert (=> b!509022 m!490063))

(assert (=> b!509021 m!490037))

(assert (=> b!509021 m!490037))

(declare-fun m!490065 () Bool)

(assert (=> b!509021 m!490065))

(declare-fun m!490067 () Bool)

(assert (=> b!509024 m!490067))

(check-sat (not b!509022) (not b!509027) (not b!509024) (not b!509028) (not start!45974) (not b!509029) (not b!509023) (not b!509025) (not b!509021))
(check-sat)
