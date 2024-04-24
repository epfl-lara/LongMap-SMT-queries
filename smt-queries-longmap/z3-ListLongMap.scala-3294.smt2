; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45698 () Bool)

(assert start!45698)

(declare-fun b!504922 () Bool)

(declare-fun e!295605 () Bool)

(assert (=> b!504922 (= e!295605 false)))

(declare-fun b!504923 () Bool)

(declare-fun res!306105 () Bool)

(declare-fun e!295607 () Bool)

(assert (=> b!504923 (=> (not res!306105) (not e!295607))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32455 0))(
  ( (array!32456 (arr!15607 (Array (_ BitVec 32) (_ BitVec 64))) (size!15971 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32455)

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!504923 (= res!306105 (and (= (size!15971 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15971 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15971 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504924 () Bool)

(declare-fun res!306100 () Bool)

(declare-fun e!295608 () Bool)

(assert (=> b!504924 (=> (not res!306100) (not e!295608))))

(declare-datatypes ((List!9672 0))(
  ( (Nil!9669) (Cons!9668 (h!10545 (_ BitVec 64)) (t!15892 List!9672)) )
))
(declare-fun arrayNoDuplicates!0 (array!32455 (_ BitVec 32) List!9672) Bool)

(assert (=> b!504924 (= res!306100 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9669))))

(declare-fun b!504925 () Bool)

(declare-fun res!306092 () Bool)

(assert (=> b!504925 (=> (not res!306092) (not e!295607))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504925 (= res!306092 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504926 () Bool)

(declare-fun res!306102 () Bool)

(assert (=> b!504926 (=> (not res!306102) (not e!295607))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504926 (= res!306102 (validKeyInArray!0 (select (arr!15607 a!3235) j!176)))))

(declare-fun b!504927 () Bool)

(declare-fun e!295606 () Bool)

(assert (=> b!504927 (= e!295608 (not e!295606))))

(declare-fun res!306101 () Bool)

(assert (=> b!504927 (=> res!306101 e!295606)))

(declare-fun lt!230038 () (_ BitVec 64))

(declare-fun lt!230040 () array!32455)

(declare-fun lt!230043 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4030 0))(
  ( (MissingZero!4030 (index!18308 (_ BitVec 32))) (Found!4030 (index!18309 (_ BitVec 32))) (Intermediate!4030 (undefined!4842 Bool) (index!18310 (_ BitVec 32)) (x!47468 (_ BitVec 32))) (Undefined!4030) (MissingVacant!4030 (index!18311 (_ BitVec 32))) )
))
(declare-fun lt!230044 () SeekEntryResult!4030)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32455 (_ BitVec 32)) SeekEntryResult!4030)

(assert (=> b!504927 (= res!306101 (= lt!230044 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230043 lt!230038 lt!230040 mask!3524)))))

(declare-fun lt!230035 () (_ BitVec 32))

(assert (=> b!504927 (= lt!230044 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230035 (select (arr!15607 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504927 (= lt!230043 (toIndex!0 lt!230038 mask!3524))))

(assert (=> b!504927 (= lt!230038 (select (store (arr!15607 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!504927 (= lt!230035 (toIndex!0 (select (arr!15607 a!3235) j!176) mask!3524))))

(assert (=> b!504927 (= lt!230040 (array!32456 (store (arr!15607 a!3235) i!1204 k0!2280) (size!15971 a!3235)))))

(declare-fun e!295603 () Bool)

(assert (=> b!504927 e!295603))

(declare-fun res!306104 () Bool)

(assert (=> b!504927 (=> (not res!306104) (not e!295603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32455 (_ BitVec 32)) Bool)

(assert (=> b!504927 (= res!306104 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15355 0))(
  ( (Unit!15356) )
))
(declare-fun lt!230034 () Unit!15355)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32455 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15355)

(assert (=> b!504927 (= lt!230034 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504928 () Bool)

(declare-fun e!295602 () Unit!15355)

(declare-fun Unit!15357 () Unit!15355)

(assert (=> b!504928 (= e!295602 Unit!15357)))

(declare-fun lt!230039 () Unit!15355)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32455 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15355)

(assert (=> b!504928 (= lt!230039 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230035 #b00000000000000000000000000000000 (index!18310 lt!230044) (x!47468 lt!230044) mask!3524))))

(declare-fun res!306095 () Bool)

(assert (=> b!504928 (= res!306095 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230035 lt!230038 lt!230040 mask!3524) (Intermediate!4030 false (index!18310 lt!230044) (x!47468 lt!230044))))))

(assert (=> b!504928 (=> (not res!306095) (not e!295605))))

(assert (=> b!504928 e!295605))

(declare-fun b!504929 () Bool)

(declare-fun e!295601 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32455 (_ BitVec 32)) SeekEntryResult!4030)

(assert (=> b!504929 (= e!295601 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230035 (index!18310 lt!230044) (select (arr!15607 a!3235) j!176) a!3235 mask!3524) (Found!4030 j!176))))))

(declare-fun b!504921 () Bool)

(declare-fun e!295600 () Bool)

(assert (=> b!504921 (= e!295606 e!295600)))

(declare-fun res!306094 () Bool)

(assert (=> b!504921 (=> res!306094 e!295600)))

(assert (=> b!504921 (= res!306094 (or (bvsgt (x!47468 lt!230044) #b01111111111111111111111111111110) (bvslt lt!230035 #b00000000000000000000000000000000) (bvsge lt!230035 (size!15971 a!3235)) (bvslt (index!18310 lt!230044) #b00000000000000000000000000000000) (bvsge (index!18310 lt!230044) (size!15971 a!3235)) (not (= lt!230044 (Intermediate!4030 false (index!18310 lt!230044) (x!47468 lt!230044))))))))

(assert (=> b!504921 (= (index!18310 lt!230044) i!1204)))

(declare-fun lt!230042 () Unit!15355)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32455 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15355)

(assert (=> b!504921 (= lt!230042 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230035 #b00000000000000000000000000000000 (index!18310 lt!230044) (x!47468 lt!230044) mask!3524))))

(assert (=> b!504921 (and (or (= (select (arr!15607 a!3235) (index!18310 lt!230044)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15607 a!3235) (index!18310 lt!230044)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15607 a!3235) (index!18310 lt!230044)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15607 a!3235) (index!18310 lt!230044)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230036 () Unit!15355)

(assert (=> b!504921 (= lt!230036 e!295602)))

(declare-fun c!59693 () Bool)

(assert (=> b!504921 (= c!59693 (= (select (arr!15607 a!3235) (index!18310 lt!230044)) (select (arr!15607 a!3235) j!176)))))

(assert (=> b!504921 (and (bvslt (x!47468 lt!230044) #b01111111111111111111111111111110) (or (= (select (arr!15607 a!3235) (index!18310 lt!230044)) (select (arr!15607 a!3235) j!176)) (= (select (arr!15607 a!3235) (index!18310 lt!230044)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15607 a!3235) (index!18310 lt!230044)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!306098 () Bool)

(assert (=> start!45698 (=> (not res!306098) (not e!295607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45698 (= res!306098 (validMask!0 mask!3524))))

(assert (=> start!45698 e!295607))

(assert (=> start!45698 true))

(declare-fun array_inv!11466 (array!32455) Bool)

(assert (=> start!45698 (array_inv!11466 a!3235)))

(declare-fun b!504930 () Bool)

(declare-fun res!306099 () Bool)

(assert (=> b!504930 (=> (not res!306099) (not e!295608))))

(assert (=> b!504930 (= res!306099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504931 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32455 (_ BitVec 32)) SeekEntryResult!4030)

(assert (=> b!504931 (= e!295603 (= (seekEntryOrOpen!0 (select (arr!15607 a!3235) j!176) a!3235 mask!3524) (Found!4030 j!176)))))

(declare-fun b!504932 () Bool)

(declare-fun res!306096 () Bool)

(assert (=> b!504932 (=> (not res!306096) (not e!295607))))

(assert (=> b!504932 (= res!306096 (validKeyInArray!0 k0!2280))))

(declare-fun b!504933 () Bool)

(declare-fun res!306106 () Bool)

(assert (=> b!504933 (=> res!306106 e!295606)))

(get-info :version)

(assert (=> b!504933 (= res!306106 (or (undefined!4842 lt!230044) (not ((_ is Intermediate!4030) lt!230044))))))

(declare-fun b!504934 () Bool)

(assert (=> b!504934 (= e!295607 e!295608)))

(declare-fun res!306097 () Bool)

(assert (=> b!504934 (=> (not res!306097) (not e!295608))))

(declare-fun lt!230037 () SeekEntryResult!4030)

(assert (=> b!504934 (= res!306097 (or (= lt!230037 (MissingZero!4030 i!1204)) (= lt!230037 (MissingVacant!4030 i!1204))))))

(assert (=> b!504934 (= lt!230037 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!504935 () Bool)

(declare-fun Unit!15358 () Unit!15355)

(assert (=> b!504935 (= e!295602 Unit!15358)))

(declare-fun b!504936 () Bool)

(declare-fun res!306103 () Bool)

(assert (=> b!504936 (=> res!306103 e!295600)))

(assert (=> b!504936 (= res!306103 e!295601)))

(declare-fun res!306093 () Bool)

(assert (=> b!504936 (=> (not res!306093) (not e!295601))))

(assert (=> b!504936 (= res!306093 (bvsgt #b00000000000000000000000000000000 (x!47468 lt!230044)))))

(declare-fun b!504937 () Bool)

(assert (=> b!504937 (= e!295600 true)))

(declare-fun lt!230041 () SeekEntryResult!4030)

(assert (=> b!504937 (= lt!230041 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230035 lt!230038 lt!230040 mask!3524))))

(assert (= (and start!45698 res!306098) b!504923))

(assert (= (and b!504923 res!306105) b!504926))

(assert (= (and b!504926 res!306102) b!504932))

(assert (= (and b!504932 res!306096) b!504925))

(assert (= (and b!504925 res!306092) b!504934))

(assert (= (and b!504934 res!306097) b!504930))

(assert (= (and b!504930 res!306099) b!504924))

(assert (= (and b!504924 res!306100) b!504927))

(assert (= (and b!504927 res!306104) b!504931))

(assert (= (and b!504927 (not res!306101)) b!504933))

(assert (= (and b!504933 (not res!306106)) b!504921))

(assert (= (and b!504921 c!59693) b!504928))

(assert (= (and b!504921 (not c!59693)) b!504935))

(assert (= (and b!504928 res!306095) b!504922))

(assert (= (and b!504921 (not res!306094)) b!504936))

(assert (= (and b!504936 res!306093) b!504929))

(assert (= (and b!504936 (not res!306103)) b!504937))

(declare-fun m!485851 () Bool)

(assert (=> b!504924 m!485851))

(declare-fun m!485853 () Bool)

(assert (=> start!45698 m!485853))

(declare-fun m!485855 () Bool)

(assert (=> start!45698 m!485855))

(declare-fun m!485857 () Bool)

(assert (=> b!504937 m!485857))

(declare-fun m!485859 () Bool)

(assert (=> b!504927 m!485859))

(declare-fun m!485861 () Bool)

(assert (=> b!504927 m!485861))

(declare-fun m!485863 () Bool)

(assert (=> b!504927 m!485863))

(declare-fun m!485865 () Bool)

(assert (=> b!504927 m!485865))

(declare-fun m!485867 () Bool)

(assert (=> b!504927 m!485867))

(declare-fun m!485869 () Bool)

(assert (=> b!504927 m!485869))

(declare-fun m!485871 () Bool)

(assert (=> b!504927 m!485871))

(assert (=> b!504927 m!485867))

(declare-fun m!485873 () Bool)

(assert (=> b!504927 m!485873))

(assert (=> b!504927 m!485867))

(declare-fun m!485875 () Bool)

(assert (=> b!504927 m!485875))

(declare-fun m!485877 () Bool)

(assert (=> b!504928 m!485877))

(assert (=> b!504928 m!485857))

(declare-fun m!485879 () Bool)

(assert (=> b!504934 m!485879))

(declare-fun m!485881 () Bool)

(assert (=> b!504925 m!485881))

(assert (=> b!504926 m!485867))

(assert (=> b!504926 m!485867))

(declare-fun m!485883 () Bool)

(assert (=> b!504926 m!485883))

(assert (=> b!504929 m!485867))

(assert (=> b!504929 m!485867))

(declare-fun m!485885 () Bool)

(assert (=> b!504929 m!485885))

(declare-fun m!485887 () Bool)

(assert (=> b!504932 m!485887))

(declare-fun m!485889 () Bool)

(assert (=> b!504930 m!485889))

(assert (=> b!504931 m!485867))

(assert (=> b!504931 m!485867))

(declare-fun m!485891 () Bool)

(assert (=> b!504931 m!485891))

(declare-fun m!485893 () Bool)

(assert (=> b!504921 m!485893))

(declare-fun m!485895 () Bool)

(assert (=> b!504921 m!485895))

(assert (=> b!504921 m!485867))

(check-sat (not b!504926) (not b!504931) (not b!504929) (not b!504927) (not b!504932) (not b!504924) (not b!504934) (not b!504925) (not b!504921) (not start!45698) (not b!504930) (not b!504937) (not b!504928))
(check-sat)
