; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48020 () Bool)

(assert start!48020)

(declare-fun b!529066 () Bool)

(declare-fun e!308293 () Bool)

(declare-fun e!308291 () Bool)

(assert (=> b!529066 (= e!308293 e!308291)))

(declare-fun res!325030 () Bool)

(assert (=> b!529066 (=> (not res!325030) (not e!308291))))

(declare-datatypes ((SeekEntryResult!4528 0))(
  ( (MissingZero!4528 (index!20336 (_ BitVec 32))) (Found!4528 (index!20337 (_ BitVec 32))) (Intermediate!4528 (undefined!5340 Bool) (index!20338 (_ BitVec 32)) (x!49453 (_ BitVec 32))) (Undefined!4528) (MissingVacant!4528 (index!20339 (_ BitVec 32))) )
))
(declare-fun lt!243900 () SeekEntryResult!4528)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!529066 (= res!325030 (or (= lt!243900 (MissingZero!4528 i!1204)) (= lt!243900 (MissingVacant!4528 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33514 0))(
  ( (array!33515 (arr!16105 (Array (_ BitVec 32) (_ BitVec 64))) (size!16469 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33514)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33514 (_ BitVec 32)) SeekEntryResult!4528)

(assert (=> b!529066 (= lt!243900 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!529067 () Bool)

(declare-fun res!325034 () Bool)

(assert (=> b!529067 (=> (not res!325034) (not e!308293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529067 (= res!325034 (validKeyInArray!0 k0!2280))))

(declare-fun res!325033 () Bool)

(assert (=> start!48020 (=> (not res!325033) (not e!308293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48020 (= res!325033 (validMask!0 mask!3524))))

(assert (=> start!48020 e!308293))

(assert (=> start!48020 true))

(declare-fun array_inv!11964 (array!33514) Bool)

(assert (=> start!48020 (array_inv!11964 a!3235)))

(declare-fun b!529068 () Bool)

(declare-fun res!325029 () Bool)

(declare-fun e!308294 () Bool)

(assert (=> b!529068 (=> res!325029 e!308294)))

(declare-fun e!308288 () Bool)

(assert (=> b!529068 (= res!325029 e!308288)))

(declare-fun res!325023 () Bool)

(assert (=> b!529068 (=> (not res!325023) (not e!308288))))

(declare-fun lt!243897 () SeekEntryResult!4528)

(assert (=> b!529068 (= res!325023 (bvsgt #b00000000000000000000000000000000 (x!49453 lt!243897)))))

(declare-fun b!529069 () Bool)

(declare-fun e!308289 () Bool)

(assert (=> b!529069 (= e!308289 false)))

(declare-fun b!529070 () Bool)

(declare-fun e!308295 () Bool)

(assert (=> b!529070 (= e!308295 e!308294)))

(declare-fun res!325032 () Bool)

(assert (=> b!529070 (=> res!325032 e!308294)))

(declare-fun lt!243894 () (_ BitVec 32))

(assert (=> b!529070 (= res!325032 (or (bvsgt (x!49453 lt!243897) #b01111111111111111111111111111110) (bvslt lt!243894 #b00000000000000000000000000000000) (bvsge lt!243894 (size!16469 a!3235)) (bvslt (index!20338 lt!243897) #b00000000000000000000000000000000) (bvsge (index!20338 lt!243897) (size!16469 a!3235)) (not (= lt!243897 (Intermediate!4528 false (index!20338 lt!243897) (x!49453 lt!243897))))))))

(assert (=> b!529070 (= (index!20338 lt!243897) i!1204)))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!16723 0))(
  ( (Unit!16724) )
))
(declare-fun lt!243893 () Unit!16723)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33514 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16723)

(assert (=> b!529070 (= lt!243893 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!243894 #b00000000000000000000000000000000 (index!20338 lt!243897) (x!49453 lt!243897) mask!3524))))

(assert (=> b!529070 (and (or (= (select (arr!16105 a!3235) (index!20338 lt!243897)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16105 a!3235) (index!20338 lt!243897)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16105 a!3235) (index!20338 lt!243897)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16105 a!3235) (index!20338 lt!243897)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243899 () Unit!16723)

(declare-fun e!308290 () Unit!16723)

(assert (=> b!529070 (= lt!243899 e!308290)))

(declare-fun c!62330 () Bool)

(assert (=> b!529070 (= c!62330 (= (select (arr!16105 a!3235) (index!20338 lt!243897)) (select (arr!16105 a!3235) j!176)))))

(assert (=> b!529070 (and (bvslt (x!49453 lt!243897) #b01111111111111111111111111111110) (or (= (select (arr!16105 a!3235) (index!20338 lt!243897)) (select (arr!16105 a!3235) j!176)) (= (select (arr!16105 a!3235) (index!20338 lt!243897)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16105 a!3235) (index!20338 lt!243897)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!529071 () Bool)

(declare-fun res!325028 () Bool)

(assert (=> b!529071 (=> (not res!325028) (not e!308291))))

(declare-datatypes ((List!10170 0))(
  ( (Nil!10167) (Cons!10166 (h!11103 (_ BitVec 64)) (t!16390 List!10170)) )
))
(declare-fun arrayNoDuplicates!0 (array!33514 (_ BitVec 32) List!10170) Bool)

(assert (=> b!529071 (= res!325028 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10167))))

(declare-fun lt!243889 () SeekEntryResult!4528)

(declare-fun b!529072 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33514 (_ BitVec 32)) SeekEntryResult!4528)

(assert (=> b!529072 (= e!308288 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243894 (index!20338 lt!243897) (select (arr!16105 a!3235) j!176) a!3235 mask!3524) lt!243889)))))

(declare-fun b!529073 () Bool)

(declare-fun res!325026 () Bool)

(assert (=> b!529073 (=> (not res!325026) (not e!308291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33514 (_ BitVec 32)) Bool)

(assert (=> b!529073 (= res!325026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529074 () Bool)

(declare-fun res!325027 () Bool)

(assert (=> b!529074 (=> (not res!325027) (not e!308293))))

(declare-fun arrayContainsKey!0 (array!33514 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529074 (= res!325027 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529075 () Bool)

(declare-fun lt!243887 () SeekEntryResult!4528)

(declare-fun lt!243896 () SeekEntryResult!4528)

(assert (=> b!529075 (= e!308294 (= lt!243887 lt!243896))))

(assert (=> b!529075 (= lt!243896 lt!243889)))

(declare-fun lt!243890 () array!33514)

(declare-fun lt!243888 () (_ BitVec 64))

(assert (=> b!529075 (= lt!243896 (seekEntryOrOpen!0 lt!243888 lt!243890 mask!3524))))

(declare-fun lt!243898 () Unit!16723)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33514 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16723)

(assert (=> b!529075 (= lt!243898 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!243894 #b00000000000000000000000000000000 (index!20338 lt!243897) (x!49453 lt!243897) mask!3524))))

(declare-fun b!529076 () Bool)

(assert (=> b!529076 (= e!308291 (not e!308295))))

(declare-fun res!325031 () Bool)

(assert (=> b!529076 (=> res!325031 e!308295)))

(declare-fun lt!243901 () SeekEntryResult!4528)

(get-info :version)

(assert (=> b!529076 (= res!325031 (or (= lt!243897 lt!243901) (undefined!5340 lt!243897) (not ((_ is Intermediate!4528) lt!243897))))))

(declare-fun lt!243891 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33514 (_ BitVec 32)) SeekEntryResult!4528)

(assert (=> b!529076 (= lt!243901 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243891 lt!243888 lt!243890 mask!3524))))

(assert (=> b!529076 (= lt!243897 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243894 (select (arr!16105 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529076 (= lt!243891 (toIndex!0 lt!243888 mask!3524))))

(assert (=> b!529076 (= lt!243888 (select (store (arr!16105 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!529076 (= lt!243894 (toIndex!0 (select (arr!16105 a!3235) j!176) mask!3524))))

(assert (=> b!529076 (= lt!243890 (array!33515 (store (arr!16105 a!3235) i!1204 k0!2280) (size!16469 a!3235)))))

(assert (=> b!529076 (= lt!243887 lt!243889)))

(assert (=> b!529076 (= lt!243889 (Found!4528 j!176))))

(assert (=> b!529076 (= lt!243887 (seekEntryOrOpen!0 (select (arr!16105 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!529076 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!243892 () Unit!16723)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33514 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16723)

(assert (=> b!529076 (= lt!243892 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529077 () Bool)

(declare-fun Unit!16725 () Unit!16723)

(assert (=> b!529077 (= e!308290 Unit!16725)))

(declare-fun b!529078 () Bool)

(declare-fun res!325024 () Bool)

(assert (=> b!529078 (=> (not res!325024) (not e!308293))))

(assert (=> b!529078 (= res!325024 (validKeyInArray!0 (select (arr!16105 a!3235) j!176)))))

(declare-fun b!529079 () Bool)

(declare-fun Unit!16726 () Unit!16723)

(assert (=> b!529079 (= e!308290 Unit!16726)))

(declare-fun lt!243895 () Unit!16723)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33514 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16723)

(assert (=> b!529079 (= lt!243895 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!243894 #b00000000000000000000000000000000 (index!20338 lt!243897) (x!49453 lt!243897) mask!3524))))

(declare-fun res!325035 () Bool)

(assert (=> b!529079 (= res!325035 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243894 lt!243888 lt!243890 mask!3524) (Intermediate!4528 false (index!20338 lt!243897) (x!49453 lt!243897))))))

(assert (=> b!529079 (=> (not res!325035) (not e!308289))))

(assert (=> b!529079 e!308289))

(declare-fun b!529080 () Bool)

(declare-fun res!325036 () Bool)

(assert (=> b!529080 (=> res!325036 e!308294)))

(assert (=> b!529080 (= res!325036 (not (= lt!243901 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243894 lt!243888 lt!243890 mask!3524))))))

(declare-fun b!529081 () Bool)

(declare-fun res!325025 () Bool)

(assert (=> b!529081 (=> (not res!325025) (not e!308293))))

(assert (=> b!529081 (= res!325025 (and (= (size!16469 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16469 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16469 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!48020 res!325033) b!529081))

(assert (= (and b!529081 res!325025) b!529078))

(assert (= (and b!529078 res!325024) b!529067))

(assert (= (and b!529067 res!325034) b!529074))

(assert (= (and b!529074 res!325027) b!529066))

(assert (= (and b!529066 res!325030) b!529073))

(assert (= (and b!529073 res!325026) b!529071))

(assert (= (and b!529071 res!325028) b!529076))

(assert (= (and b!529076 (not res!325031)) b!529070))

(assert (= (and b!529070 c!62330) b!529079))

(assert (= (and b!529070 (not c!62330)) b!529077))

(assert (= (and b!529079 res!325035) b!529069))

(assert (= (and b!529070 (not res!325032)) b!529068))

(assert (= (and b!529068 res!325023) b!529072))

(assert (= (and b!529068 (not res!325029)) b!529080))

(assert (= (and b!529080 (not res!325036)) b!529075))

(declare-fun m!509839 () Bool)

(assert (=> b!529079 m!509839))

(declare-fun m!509841 () Bool)

(assert (=> b!529079 m!509841))

(assert (=> b!529080 m!509841))

(declare-fun m!509843 () Bool)

(assert (=> start!48020 m!509843))

(declare-fun m!509845 () Bool)

(assert (=> start!48020 m!509845))

(declare-fun m!509847 () Bool)

(assert (=> b!529071 m!509847))

(declare-fun m!509849 () Bool)

(assert (=> b!529078 m!509849))

(assert (=> b!529078 m!509849))

(declare-fun m!509851 () Bool)

(assert (=> b!529078 m!509851))

(declare-fun m!509853 () Bool)

(assert (=> b!529073 m!509853))

(declare-fun m!509855 () Bool)

(assert (=> b!529076 m!509855))

(declare-fun m!509857 () Bool)

(assert (=> b!529076 m!509857))

(assert (=> b!529076 m!509849))

(declare-fun m!509859 () Bool)

(assert (=> b!529076 m!509859))

(assert (=> b!529076 m!509849))

(declare-fun m!509861 () Bool)

(assert (=> b!529076 m!509861))

(assert (=> b!529076 m!509849))

(declare-fun m!509863 () Bool)

(assert (=> b!529076 m!509863))

(assert (=> b!529076 m!509849))

(declare-fun m!509865 () Bool)

(assert (=> b!529076 m!509865))

(declare-fun m!509867 () Bool)

(assert (=> b!529076 m!509867))

(declare-fun m!509869 () Bool)

(assert (=> b!529076 m!509869))

(declare-fun m!509871 () Bool)

(assert (=> b!529076 m!509871))

(declare-fun m!509873 () Bool)

(assert (=> b!529075 m!509873))

(declare-fun m!509875 () Bool)

(assert (=> b!529075 m!509875))

(declare-fun m!509877 () Bool)

(assert (=> b!529067 m!509877))

(declare-fun m!509879 () Bool)

(assert (=> b!529066 m!509879))

(declare-fun m!509881 () Bool)

(assert (=> b!529070 m!509881))

(declare-fun m!509883 () Bool)

(assert (=> b!529070 m!509883))

(assert (=> b!529070 m!509849))

(declare-fun m!509885 () Bool)

(assert (=> b!529074 m!509885))

(assert (=> b!529072 m!509849))

(assert (=> b!529072 m!509849))

(declare-fun m!509887 () Bool)

(assert (=> b!529072 m!509887))

(check-sat (not b!529066) (not b!529071) (not start!48020) (not b!529075) (not b!529067) (not b!529070) (not b!529080) (not b!529076) (not b!529074) (not b!529072) (not b!529078) (not b!529079) (not b!529073))
(check-sat)
