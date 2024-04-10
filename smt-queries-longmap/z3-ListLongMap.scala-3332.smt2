; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45986 () Bool)

(assert start!45986)

(declare-fun b!509109 () Bool)

(declare-fun res!309962 () Bool)

(declare-fun e!297774 () Bool)

(assert (=> b!509109 (=> (not res!309962) (not e!297774))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32697 0))(
  ( (array!32698 (arr!15727 (Array (_ BitVec 32) (_ BitVec 64))) (size!16091 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32697)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509109 (= res!309962 (and (= (size!16091 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16091 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16091 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509110 () Bool)

(declare-fun res!309958 () Bool)

(declare-fun e!297776 () Bool)

(assert (=> b!509110 (=> (not res!309958) (not e!297776))))

(declare-datatypes ((List!9885 0))(
  ( (Nil!9882) (Cons!9881 (h!10758 (_ BitVec 64)) (t!16113 List!9885)) )
))
(declare-fun arrayNoDuplicates!0 (array!32697 (_ BitVec 32) List!9885) Bool)

(assert (=> b!509110 (= res!309958 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9882))))

(declare-fun b!509111 () Bool)

(assert (=> b!509111 (= e!297776 (not true))))

(declare-datatypes ((SeekEntryResult!4194 0))(
  ( (MissingZero!4194 (index!18964 (_ BitVec 32))) (Found!4194 (index!18965 (_ BitVec 32))) (Intermediate!4194 (undefined!5006 Bool) (index!18966 (_ BitVec 32)) (x!47939 (_ BitVec 32))) (Undefined!4194) (MissingVacant!4194 (index!18967 (_ BitVec 32))) )
))
(declare-fun lt!232499 () SeekEntryResult!4194)

(declare-fun lt!232500 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32697 (_ BitVec 32)) SeekEntryResult!4194)

(assert (=> b!509111 (= lt!232499 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232500 (select (store (arr!15727 a!3235) i!1204 k0!2280) j!176) (array!32698 (store (arr!15727 a!3235) i!1204 k0!2280) (size!16091 a!3235)) mask!3524))))

(declare-fun lt!232501 () SeekEntryResult!4194)

(declare-fun lt!232498 () (_ BitVec 32))

(assert (=> b!509111 (= lt!232501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232498 (select (arr!15727 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509111 (= lt!232500 (toIndex!0 (select (store (arr!15727 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509111 (= lt!232498 (toIndex!0 (select (arr!15727 a!3235) j!176) mask!3524))))

(declare-fun e!297775 () Bool)

(assert (=> b!509111 e!297775))

(declare-fun res!309959 () Bool)

(assert (=> b!509111 (=> (not res!309959) (not e!297775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32697 (_ BitVec 32)) Bool)

(assert (=> b!509111 (= res!309959 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15646 0))(
  ( (Unit!15647) )
))
(declare-fun lt!232496 () Unit!15646)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32697 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15646)

(assert (=> b!509111 (= lt!232496 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509112 () Bool)

(declare-fun res!309960 () Bool)

(assert (=> b!509112 (=> (not res!309960) (not e!297774))))

(declare-fun arrayContainsKey!0 (array!32697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509112 (= res!309960 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!309956 () Bool)

(assert (=> start!45986 (=> (not res!309956) (not e!297774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45986 (= res!309956 (validMask!0 mask!3524))))

(assert (=> start!45986 e!297774))

(assert (=> start!45986 true))

(declare-fun array_inv!11523 (array!32697) Bool)

(assert (=> start!45986 (array_inv!11523 a!3235)))

(declare-fun b!509113 () Bool)

(declare-fun res!309955 () Bool)

(assert (=> b!509113 (=> (not res!309955) (not e!297774))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509113 (= res!309955 (validKeyInArray!0 (select (arr!15727 a!3235) j!176)))))

(declare-fun b!509114 () Bool)

(assert (=> b!509114 (= e!297774 e!297776)))

(declare-fun res!309954 () Bool)

(assert (=> b!509114 (=> (not res!309954) (not e!297776))))

(declare-fun lt!232497 () SeekEntryResult!4194)

(assert (=> b!509114 (= res!309954 (or (= lt!232497 (MissingZero!4194 i!1204)) (= lt!232497 (MissingVacant!4194 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32697 (_ BitVec 32)) SeekEntryResult!4194)

(assert (=> b!509114 (= lt!232497 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509115 () Bool)

(assert (=> b!509115 (= e!297775 (= (seekEntryOrOpen!0 (select (arr!15727 a!3235) j!176) a!3235 mask!3524) (Found!4194 j!176)))))

(declare-fun b!509116 () Bool)

(declare-fun res!309957 () Bool)

(assert (=> b!509116 (=> (not res!309957) (not e!297776))))

(assert (=> b!509116 (= res!309957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509117 () Bool)

(declare-fun res!309961 () Bool)

(assert (=> b!509117 (=> (not res!309961) (not e!297774))))

(assert (=> b!509117 (= res!309961 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45986 res!309956) b!509109))

(assert (= (and b!509109 res!309962) b!509113))

(assert (= (and b!509113 res!309955) b!509117))

(assert (= (and b!509117 res!309961) b!509112))

(assert (= (and b!509112 res!309960) b!509114))

(assert (= (and b!509114 res!309954) b!509116))

(assert (= (and b!509116 res!309957) b!509110))

(assert (= (and b!509110 res!309958) b!509111))

(assert (= (and b!509111 res!309959) b!509115))

(declare-fun m!489885 () Bool)

(assert (=> b!509110 m!489885))

(declare-fun m!489887 () Bool)

(assert (=> b!509112 m!489887))

(declare-fun m!489889 () Bool)

(assert (=> start!45986 m!489889))

(declare-fun m!489891 () Bool)

(assert (=> start!45986 m!489891))

(declare-fun m!489893 () Bool)

(assert (=> b!509115 m!489893))

(assert (=> b!509115 m!489893))

(declare-fun m!489895 () Bool)

(assert (=> b!509115 m!489895))

(assert (=> b!509113 m!489893))

(assert (=> b!509113 m!489893))

(declare-fun m!489897 () Bool)

(assert (=> b!509113 m!489897))

(declare-fun m!489899 () Bool)

(assert (=> b!509111 m!489899))

(declare-fun m!489901 () Bool)

(assert (=> b!509111 m!489901))

(assert (=> b!509111 m!489893))

(declare-fun m!489903 () Bool)

(assert (=> b!509111 m!489903))

(assert (=> b!509111 m!489893))

(assert (=> b!509111 m!489893))

(declare-fun m!489905 () Bool)

(assert (=> b!509111 m!489905))

(declare-fun m!489907 () Bool)

(assert (=> b!509111 m!489907))

(declare-fun m!489909 () Bool)

(assert (=> b!509111 m!489909))

(declare-fun m!489911 () Bool)

(assert (=> b!509111 m!489911))

(assert (=> b!509111 m!489909))

(declare-fun m!489913 () Bool)

(assert (=> b!509111 m!489913))

(assert (=> b!509111 m!489909))

(declare-fun m!489915 () Bool)

(assert (=> b!509116 m!489915))

(declare-fun m!489917 () Bool)

(assert (=> b!509114 m!489917))

(declare-fun m!489919 () Bool)

(assert (=> b!509117 m!489919))

(check-sat (not b!509110) (not b!509116) (not b!509112) (not b!509114) (not start!45986) (not b!509113) (not b!509111) (not b!509117) (not b!509115))
(check-sat)
