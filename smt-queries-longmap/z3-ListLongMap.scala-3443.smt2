; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47766 () Bool)

(assert start!47766)

(declare-fun b!525867 () Bool)

(declare-fun res!322675 () Bool)

(declare-fun e!306535 () Bool)

(assert (=> b!525867 (=> (not res!322675) (not e!306535))))

(declare-datatypes ((array!33413 0))(
  ( (array!33414 (arr!16058 (Array (_ BitVec 32) (_ BitVec 64))) (size!16423 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33413)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525867 (= res!322675 (validKeyInArray!0 (select (arr!16058 a!3235) j!176)))))

(declare-fun b!525868 () Bool)

(declare-fun res!322676 () Bool)

(declare-fun e!306538 () Bool)

(assert (=> b!525868 (=> (not res!322676) (not e!306538))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33413 (_ BitVec 32)) Bool)

(assert (=> b!525868 (= res!322676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525869 () Bool)

(declare-fun e!306537 () Bool)

(assert (=> b!525869 (= e!306537 true)))

(declare-datatypes ((SeekEntryResult!4522 0))(
  ( (MissingZero!4522 (index!20300 (_ BitVec 32))) (Found!4522 (index!20301 (_ BitVec 32))) (Intermediate!4522 (undefined!5334 Bool) (index!20302 (_ BitVec 32)) (x!49282 (_ BitVec 32))) (Undefined!4522) (MissingVacant!4522 (index!20303 (_ BitVec 32))) )
))
(declare-fun lt!241667 () SeekEntryResult!4522)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!525869 (= (index!20302 lt!241667) i!1204)))

(declare-fun lt!241669 () (_ BitVec 32))

(declare-datatypes ((Unit!16534 0))(
  ( (Unit!16535) )
))
(declare-fun lt!241665 () Unit!16534)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33413 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16534)

(assert (=> b!525869 (= lt!241665 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241669 #b00000000000000000000000000000000 (index!20302 lt!241667) (x!49282 lt!241667) mask!3524))))

(assert (=> b!525869 (and (or (= (select (arr!16058 a!3235) (index!20302 lt!241667)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16058 a!3235) (index!20302 lt!241667)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16058 a!3235) (index!20302 lt!241667)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16058 a!3235) (index!20302 lt!241667)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241662 () Unit!16534)

(declare-fun e!306534 () Unit!16534)

(assert (=> b!525869 (= lt!241662 e!306534)))

(declare-fun c!61902 () Bool)

(assert (=> b!525869 (= c!61902 (= (select (arr!16058 a!3235) (index!20302 lt!241667)) (select (arr!16058 a!3235) j!176)))))

(assert (=> b!525869 (and (bvslt (x!49282 lt!241667) #b01111111111111111111111111111110) (or (= (select (arr!16058 a!3235) (index!20302 lt!241667)) (select (arr!16058 a!3235) j!176)) (= (select (arr!16058 a!3235) (index!20302 lt!241667)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16058 a!3235) (index!20302 lt!241667)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525870 () Bool)

(declare-fun res!322681 () Bool)

(assert (=> b!525870 (=> (not res!322681) (not e!306538))))

(declare-datatypes ((List!10255 0))(
  ( (Nil!10252) (Cons!10251 (h!11182 (_ BitVec 64)) (t!16474 List!10255)) )
))
(declare-fun arrayNoDuplicates!0 (array!33413 (_ BitVec 32) List!10255) Bool)

(assert (=> b!525870 (= res!322681 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10252))))

(declare-fun b!525871 () Bool)

(assert (=> b!525871 (= e!306538 (not e!306537))))

(declare-fun res!322683 () Bool)

(assert (=> b!525871 (=> res!322683 e!306537)))

(declare-fun lt!241668 () array!33413)

(declare-fun lt!241661 () (_ BitVec 64))

(declare-fun lt!241660 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33413 (_ BitVec 32)) SeekEntryResult!4522)

(assert (=> b!525871 (= res!322683 (= lt!241667 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241660 lt!241661 lt!241668 mask!3524)))))

(assert (=> b!525871 (= lt!241667 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241669 (select (arr!16058 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525871 (= lt!241660 (toIndex!0 lt!241661 mask!3524))))

(assert (=> b!525871 (= lt!241661 (select (store (arr!16058 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525871 (= lt!241669 (toIndex!0 (select (arr!16058 a!3235) j!176) mask!3524))))

(assert (=> b!525871 (= lt!241668 (array!33414 (store (arr!16058 a!3235) i!1204 k0!2280) (size!16423 a!3235)))))

(declare-fun e!306539 () Bool)

(assert (=> b!525871 e!306539))

(declare-fun res!322680 () Bool)

(assert (=> b!525871 (=> (not res!322680) (not e!306539))))

(assert (=> b!525871 (= res!322680 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241666 () Unit!16534)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33413 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16534)

(assert (=> b!525871 (= lt!241666 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!322685 () Bool)

(assert (=> start!47766 (=> (not res!322685) (not e!306535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47766 (= res!322685 (validMask!0 mask!3524))))

(assert (=> start!47766 e!306535))

(assert (=> start!47766 true))

(declare-fun array_inv!11941 (array!33413) Bool)

(assert (=> start!47766 (array_inv!11941 a!3235)))

(declare-fun b!525872 () Bool)

(declare-fun Unit!16536 () Unit!16534)

(assert (=> b!525872 (= e!306534 Unit!16536)))

(declare-fun lt!241664 () Unit!16534)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33413 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16534)

(assert (=> b!525872 (= lt!241664 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241669 #b00000000000000000000000000000000 (index!20302 lt!241667) (x!49282 lt!241667) mask!3524))))

(declare-fun res!322684 () Bool)

(assert (=> b!525872 (= res!322684 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241669 lt!241661 lt!241668 mask!3524) (Intermediate!4522 false (index!20302 lt!241667) (x!49282 lt!241667))))))

(declare-fun e!306540 () Bool)

(assert (=> b!525872 (=> (not res!322684) (not e!306540))))

(assert (=> b!525872 e!306540))

(declare-fun b!525873 () Bool)

(declare-fun res!322677 () Bool)

(assert (=> b!525873 (=> (not res!322677) (not e!306535))))

(assert (=> b!525873 (= res!322677 (and (= (size!16423 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16423 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16423 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525874 () Bool)

(declare-fun res!322678 () Bool)

(assert (=> b!525874 (=> (not res!322678) (not e!306535))))

(assert (=> b!525874 (= res!322678 (validKeyInArray!0 k0!2280))))

(declare-fun b!525875 () Bool)

(assert (=> b!525875 (= e!306540 false)))

(declare-fun b!525876 () Bool)

(declare-fun Unit!16537 () Unit!16534)

(assert (=> b!525876 (= e!306534 Unit!16537)))

(declare-fun b!525877 () Bool)

(declare-fun res!322682 () Bool)

(assert (=> b!525877 (=> res!322682 e!306537)))

(get-info :version)

(assert (=> b!525877 (= res!322682 (or (undefined!5334 lt!241667) (not ((_ is Intermediate!4522) lt!241667))))))

(declare-fun b!525878 () Bool)

(assert (=> b!525878 (= e!306535 e!306538)))

(declare-fun res!322674 () Bool)

(assert (=> b!525878 (=> (not res!322674) (not e!306538))))

(declare-fun lt!241663 () SeekEntryResult!4522)

(assert (=> b!525878 (= res!322674 (or (= lt!241663 (MissingZero!4522 i!1204)) (= lt!241663 (MissingVacant!4522 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33413 (_ BitVec 32)) SeekEntryResult!4522)

(assert (=> b!525878 (= lt!241663 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!525879 () Bool)

(declare-fun res!322679 () Bool)

(assert (=> b!525879 (=> (not res!322679) (not e!306535))))

(declare-fun arrayContainsKey!0 (array!33413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525879 (= res!322679 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525880 () Bool)

(assert (=> b!525880 (= e!306539 (= (seekEntryOrOpen!0 (select (arr!16058 a!3235) j!176) a!3235 mask!3524) (Found!4522 j!176)))))

(assert (= (and start!47766 res!322685) b!525873))

(assert (= (and b!525873 res!322677) b!525867))

(assert (= (and b!525867 res!322675) b!525874))

(assert (= (and b!525874 res!322678) b!525879))

(assert (= (and b!525879 res!322679) b!525878))

(assert (= (and b!525878 res!322674) b!525868))

(assert (= (and b!525868 res!322676) b!525870))

(assert (= (and b!525870 res!322681) b!525871))

(assert (= (and b!525871 res!322680) b!525880))

(assert (= (and b!525871 (not res!322683)) b!525877))

(assert (= (and b!525877 (not res!322682)) b!525869))

(assert (= (and b!525869 c!61902) b!525872))

(assert (= (and b!525869 (not c!61902)) b!525876))

(assert (= (and b!525872 res!322684) b!525875))

(declare-fun m!506077 () Bool)

(assert (=> b!525870 m!506077))

(declare-fun m!506079 () Bool)

(assert (=> b!525869 m!506079))

(declare-fun m!506081 () Bool)

(assert (=> b!525869 m!506081))

(declare-fun m!506083 () Bool)

(assert (=> b!525869 m!506083))

(assert (=> b!525867 m!506083))

(assert (=> b!525867 m!506083))

(declare-fun m!506085 () Bool)

(assert (=> b!525867 m!506085))

(assert (=> b!525880 m!506083))

(assert (=> b!525880 m!506083))

(declare-fun m!506087 () Bool)

(assert (=> b!525880 m!506087))

(declare-fun m!506089 () Bool)

(assert (=> b!525879 m!506089))

(assert (=> b!525871 m!506083))

(declare-fun m!506091 () Bool)

(assert (=> b!525871 m!506091))

(declare-fun m!506093 () Bool)

(assert (=> b!525871 m!506093))

(declare-fun m!506095 () Bool)

(assert (=> b!525871 m!506095))

(declare-fun m!506097 () Bool)

(assert (=> b!525871 m!506097))

(declare-fun m!506099 () Bool)

(assert (=> b!525871 m!506099))

(assert (=> b!525871 m!506083))

(declare-fun m!506101 () Bool)

(assert (=> b!525871 m!506101))

(declare-fun m!506103 () Bool)

(assert (=> b!525871 m!506103))

(assert (=> b!525871 m!506083))

(declare-fun m!506105 () Bool)

(assert (=> b!525871 m!506105))

(declare-fun m!506107 () Bool)

(assert (=> b!525872 m!506107))

(declare-fun m!506109 () Bool)

(assert (=> b!525872 m!506109))

(declare-fun m!506111 () Bool)

(assert (=> b!525874 m!506111))

(declare-fun m!506113 () Bool)

(assert (=> start!47766 m!506113))

(declare-fun m!506115 () Bool)

(assert (=> start!47766 m!506115))

(declare-fun m!506117 () Bool)

(assert (=> b!525878 m!506117))

(declare-fun m!506119 () Bool)

(assert (=> b!525868 m!506119))

(check-sat (not b!525880) (not b!525879) (not b!525872) (not b!525869) (not b!525878) (not start!47766) (not b!525871) (not b!525867) (not b!525870) (not b!525868) (not b!525874))
(check-sat)
