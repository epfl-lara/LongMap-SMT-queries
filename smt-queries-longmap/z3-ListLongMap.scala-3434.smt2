; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47714 () Bool)

(assert start!47714)

(declare-fun b!524943 () Bool)

(declare-datatypes ((Unit!16411 0))(
  ( (Unit!16412) )
))
(declare-fun e!306102 () Unit!16411)

(declare-fun Unit!16413 () Unit!16411)

(assert (=> b!524943 (= e!306102 Unit!16413)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!306108 () Bool)

(declare-datatypes ((array!33352 0))(
  ( (array!33353 (arr!16027 (Array (_ BitVec 32) (_ BitVec 64))) (size!16391 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33352)

(declare-fun b!524944 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4450 0))(
  ( (MissingZero!4450 (index!20012 (_ BitVec 32))) (Found!4450 (index!20013 (_ BitVec 32))) (Intermediate!4450 (undefined!5262 Bool) (index!20014 (_ BitVec 32)) (x!49140 (_ BitVec 32))) (Undefined!4450) (MissingVacant!4450 (index!20015 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33352 (_ BitVec 32)) SeekEntryResult!4450)

(assert (=> b!524944 (= e!306108 (= (seekEntryOrOpen!0 (select (arr!16027 a!3235) j!176) a!3235 mask!3524) (Found!4450 j!176)))))

(declare-fun b!524945 () Bool)

(declare-fun e!306104 () Bool)

(declare-fun e!306103 () Bool)

(assert (=> b!524945 (= e!306104 (not e!306103))))

(declare-fun res!321827 () Bool)

(assert (=> b!524945 (=> res!321827 e!306103)))

(declare-fun lt!241096 () (_ BitVec 32))

(declare-fun lt!241102 () array!33352)

(declare-fun lt!241098 () SeekEntryResult!4450)

(declare-fun lt!241103 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33352 (_ BitVec 32)) SeekEntryResult!4450)

(assert (=> b!524945 (= res!321827 (= lt!241098 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241096 lt!241103 lt!241102 mask!3524)))))

(declare-fun lt!241099 () (_ BitVec 32))

(assert (=> b!524945 (= lt!241098 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241099 (select (arr!16027 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524945 (= lt!241096 (toIndex!0 lt!241103 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524945 (= lt!241103 (select (store (arr!16027 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!524945 (= lt!241099 (toIndex!0 (select (arr!16027 a!3235) j!176) mask!3524))))

(assert (=> b!524945 (= lt!241102 (array!33353 (store (arr!16027 a!3235) i!1204 k0!2280) (size!16391 a!3235)))))

(assert (=> b!524945 e!306108))

(declare-fun res!321830 () Bool)

(assert (=> b!524945 (=> (not res!321830) (not e!306108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33352 (_ BitVec 32)) Bool)

(assert (=> b!524945 (= res!321830 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241101 () Unit!16411)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33352 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16411)

(assert (=> b!524945 (= lt!241101 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524946 () Bool)

(declare-fun e!306107 () Bool)

(assert (=> b!524946 (= e!306107 false)))

(declare-fun b!524947 () Bool)

(declare-fun res!321834 () Bool)

(declare-fun e!306106 () Bool)

(assert (=> b!524947 (=> (not res!321834) (not e!306106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524947 (= res!321834 (validKeyInArray!0 k0!2280))))

(declare-fun b!524948 () Bool)

(declare-fun res!321835 () Bool)

(assert (=> b!524948 (=> (not res!321835) (not e!306106))))

(assert (=> b!524948 (= res!321835 (validKeyInArray!0 (select (arr!16027 a!3235) j!176)))))

(declare-fun res!321831 () Bool)

(assert (=> start!47714 (=> (not res!321831) (not e!306106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47714 (= res!321831 (validMask!0 mask!3524))))

(assert (=> start!47714 e!306106))

(assert (=> start!47714 true))

(declare-fun array_inv!11886 (array!33352) Bool)

(assert (=> start!47714 (array_inv!11886 a!3235)))

(declare-fun b!524949 () Bool)

(declare-fun res!321824 () Bool)

(assert (=> b!524949 (=> res!321824 e!306103)))

(get-info :version)

(assert (=> b!524949 (= res!321824 (or (undefined!5262 lt!241098) (not ((_ is Intermediate!4450) lt!241098))))))

(declare-fun b!524950 () Bool)

(declare-fun res!321832 () Bool)

(assert (=> b!524950 (=> (not res!321832) (not e!306104))))

(declare-datatypes ((List!10092 0))(
  ( (Nil!10089) (Cons!10088 (h!11019 (_ BitVec 64)) (t!16312 List!10092)) )
))
(declare-fun arrayNoDuplicates!0 (array!33352 (_ BitVec 32) List!10092) Bool)

(assert (=> b!524950 (= res!321832 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10089))))

(declare-fun b!524951 () Bool)

(declare-fun res!321829 () Bool)

(assert (=> b!524951 (=> (not res!321829) (not e!306106))))

(declare-fun arrayContainsKey!0 (array!33352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524951 (= res!321829 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524952 () Bool)

(declare-fun res!321826 () Bool)

(assert (=> b!524952 (=> (not res!321826) (not e!306104))))

(assert (=> b!524952 (= res!321826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524953 () Bool)

(declare-fun res!321828 () Bool)

(assert (=> b!524953 (=> (not res!321828) (not e!306106))))

(assert (=> b!524953 (= res!321828 (and (= (size!16391 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16391 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16391 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524954 () Bool)

(assert (=> b!524954 (= e!306106 e!306104)))

(declare-fun res!321825 () Bool)

(assert (=> b!524954 (=> (not res!321825) (not e!306104))))

(declare-fun lt!241097 () SeekEntryResult!4450)

(assert (=> b!524954 (= res!321825 (or (= lt!241097 (MissingZero!4450 i!1204)) (= lt!241097 (MissingVacant!4450 i!1204))))))

(assert (=> b!524954 (= lt!241097 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!524955 () Bool)

(declare-fun Unit!16414 () Unit!16411)

(assert (=> b!524955 (= e!306102 Unit!16414)))

(declare-fun lt!241105 () Unit!16411)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33352 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16411)

(assert (=> b!524955 (= lt!241105 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241099 #b00000000000000000000000000000000 (index!20014 lt!241098) (x!49140 lt!241098) mask!3524))))

(declare-fun res!321833 () Bool)

(assert (=> b!524955 (= res!321833 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241099 lt!241103 lt!241102 mask!3524) (Intermediate!4450 false (index!20014 lt!241098) (x!49140 lt!241098))))))

(assert (=> b!524955 (=> (not res!321833) (not e!306107))))

(assert (=> b!524955 e!306107))

(declare-fun b!524956 () Bool)

(assert (=> b!524956 (= e!306103 true)))

(assert (=> b!524956 (= (index!20014 lt!241098) i!1204)))

(declare-fun lt!241104 () Unit!16411)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33352 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16411)

(assert (=> b!524956 (= lt!241104 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241099 #b00000000000000000000000000000000 (index!20014 lt!241098) (x!49140 lt!241098) mask!3524))))

(assert (=> b!524956 (and (or (= (select (arr!16027 a!3235) (index!20014 lt!241098)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16027 a!3235) (index!20014 lt!241098)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16027 a!3235) (index!20014 lt!241098)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16027 a!3235) (index!20014 lt!241098)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241100 () Unit!16411)

(assert (=> b!524956 (= lt!241100 e!306102)))

(declare-fun c!61865 () Bool)

(assert (=> b!524956 (= c!61865 (= (select (arr!16027 a!3235) (index!20014 lt!241098)) (select (arr!16027 a!3235) j!176)))))

(assert (=> b!524956 (and (bvslt (x!49140 lt!241098) #b01111111111111111111111111111110) (or (= (select (arr!16027 a!3235) (index!20014 lt!241098)) (select (arr!16027 a!3235) j!176)) (= (select (arr!16027 a!3235) (index!20014 lt!241098)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16027 a!3235) (index!20014 lt!241098)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!47714 res!321831) b!524953))

(assert (= (and b!524953 res!321828) b!524948))

(assert (= (and b!524948 res!321835) b!524947))

(assert (= (and b!524947 res!321834) b!524951))

(assert (= (and b!524951 res!321829) b!524954))

(assert (= (and b!524954 res!321825) b!524952))

(assert (= (and b!524952 res!321826) b!524950))

(assert (= (and b!524950 res!321832) b!524945))

(assert (= (and b!524945 res!321830) b!524944))

(assert (= (and b!524945 (not res!321827)) b!524949))

(assert (= (and b!524949 (not res!321824)) b!524956))

(assert (= (and b!524956 c!61865) b!524955))

(assert (= (and b!524956 (not c!61865)) b!524943))

(assert (= (and b!524955 res!321833) b!524946))

(declare-fun m!505825 () Bool)

(assert (=> b!524954 m!505825))

(declare-fun m!505827 () Bool)

(assert (=> b!524951 m!505827))

(declare-fun m!505829 () Bool)

(assert (=> b!524948 m!505829))

(assert (=> b!524948 m!505829))

(declare-fun m!505831 () Bool)

(assert (=> b!524948 m!505831))

(declare-fun m!505833 () Bool)

(assert (=> b!524947 m!505833))

(declare-fun m!505835 () Bool)

(assert (=> b!524955 m!505835))

(declare-fun m!505837 () Bool)

(assert (=> b!524955 m!505837))

(declare-fun m!505839 () Bool)

(assert (=> start!47714 m!505839))

(declare-fun m!505841 () Bool)

(assert (=> start!47714 m!505841))

(assert (=> b!524944 m!505829))

(assert (=> b!524944 m!505829))

(declare-fun m!505843 () Bool)

(assert (=> b!524944 m!505843))

(declare-fun m!505845 () Bool)

(assert (=> b!524945 m!505845))

(declare-fun m!505847 () Bool)

(assert (=> b!524945 m!505847))

(declare-fun m!505849 () Bool)

(assert (=> b!524945 m!505849))

(declare-fun m!505851 () Bool)

(assert (=> b!524945 m!505851))

(assert (=> b!524945 m!505829))

(declare-fun m!505853 () Bool)

(assert (=> b!524945 m!505853))

(assert (=> b!524945 m!505829))

(declare-fun m!505855 () Bool)

(assert (=> b!524945 m!505855))

(declare-fun m!505857 () Bool)

(assert (=> b!524945 m!505857))

(assert (=> b!524945 m!505829))

(declare-fun m!505859 () Bool)

(assert (=> b!524945 m!505859))

(declare-fun m!505861 () Bool)

(assert (=> b!524950 m!505861))

(declare-fun m!505863 () Bool)

(assert (=> b!524952 m!505863))

(declare-fun m!505865 () Bool)

(assert (=> b!524956 m!505865))

(declare-fun m!505867 () Bool)

(assert (=> b!524956 m!505867))

(assert (=> b!524956 m!505829))

(check-sat (not b!524955) (not b!524944) (not b!524952) (not start!47714) (not b!524954) (not b!524950) (not b!524947) (not b!524945) (not b!524956) (not b!524948) (not b!524951))
(check-sat)
