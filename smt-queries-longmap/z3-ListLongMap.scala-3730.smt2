; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51362 () Bool)

(assert start!51362)

(declare-fun b!560714 () Bool)

(declare-fun res!352013 () Bool)

(declare-fun e!323072 () Bool)

(assert (=> b!560714 (=> (not res!352013) (not e!323072))))

(declare-datatypes ((array!35236 0))(
  ( (array!35237 (arr!16919 (Array (_ BitVec 32) (_ BitVec 64))) (size!17284 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35236)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35236 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560714 (= res!352013 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560715 () Bool)

(declare-fun res!352008 () Bool)

(assert (=> b!560715 (=> (not res!352008) (not e!323072))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560715 (= res!352008 (validKeyInArray!0 (select (arr!16919 a!3118) j!142)))))

(declare-fun b!560716 () Bool)

(declare-fun res!352019 () Bool)

(assert (=> b!560716 (=> (not res!352019) (not e!323072))))

(assert (=> b!560716 (= res!352019 (validKeyInArray!0 k0!1914))))

(declare-fun b!560717 () Bool)

(declare-fun e!323067 () Bool)

(declare-fun e!323070 () Bool)

(assert (=> b!560717 (= e!323067 e!323070)))

(declare-fun res!352010 () Bool)

(assert (=> b!560717 (=> res!352010 e!323070)))

(declare-fun lt!254967 () (_ BitVec 64))

(assert (=> b!560717 (= res!352010 (or (= lt!254967 (select (arr!16919 a!3118) j!142)) (= lt!254967 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5365 0))(
  ( (MissingZero!5365 (index!23687 (_ BitVec 32))) (Found!5365 (index!23688 (_ BitVec 32))) (Intermediate!5365 (undefined!6177 Bool) (index!23689 (_ BitVec 32)) (x!52607 (_ BitVec 32))) (Undefined!5365) (MissingVacant!5365 (index!23690 (_ BitVec 32))) )
))
(declare-fun lt!254965 () SeekEntryResult!5365)

(assert (=> b!560717 (= lt!254967 (select (arr!16919 a!3118) (index!23689 lt!254965)))))

(declare-fun b!560718 () Bool)

(declare-fun e!323073 () Bool)

(assert (=> b!560718 (= e!323073 e!323067)))

(declare-fun res!352017 () Bool)

(assert (=> b!560718 (=> res!352017 e!323067)))

(get-info :version)

(assert (=> b!560718 (= res!352017 (or (undefined!6177 lt!254965) (not ((_ is Intermediate!5365) lt!254965))))))

(declare-fun b!560719 () Bool)

(declare-fun res!352016 () Bool)

(assert (=> b!560719 (=> (not res!352016) (not e!323072))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560719 (= res!352016 (and (= (size!17284 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17284 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17284 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560720 () Bool)

(declare-fun e!323071 () Bool)

(declare-fun e!323066 () Bool)

(assert (=> b!560720 (= e!323071 e!323066)))

(declare-fun res!352018 () Bool)

(assert (=> b!560720 (=> (not res!352018) (not e!323066))))

(declare-fun lt!254968 () (_ BitVec 64))

(declare-fun lt!254964 () (_ BitVec 32))

(declare-fun lt!254960 () array!35236)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35236 (_ BitVec 32)) SeekEntryResult!5365)

(assert (=> b!560720 (= res!352018 (= lt!254965 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254964 lt!254968 lt!254960 mask!3119)))))

(declare-fun lt!254966 () (_ BitVec 32))

(assert (=> b!560720 (= lt!254965 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254966 (select (arr!16919 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560720 (= lt!254964 (toIndex!0 lt!254968 mask!3119))))

(assert (=> b!560720 (= lt!254968 (select (store (arr!16919 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!560720 (= lt!254966 (toIndex!0 (select (arr!16919 a!3118) j!142) mask!3119))))

(assert (=> b!560720 (= lt!254960 (array!35237 (store (arr!16919 a!3118) i!1132 k0!1914) (size!17284 a!3118)))))

(declare-fun b!560721 () Bool)

(declare-fun e!323069 () Bool)

(assert (=> b!560721 (= e!323070 e!323069)))

(declare-fun res!352011 () Bool)

(assert (=> b!560721 (=> (not res!352011) (not e!323069))))

(declare-fun lt!254961 () SeekEntryResult!5365)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35236 (_ BitVec 32)) SeekEntryResult!5365)

(assert (=> b!560721 (= res!352011 (= lt!254961 (seekKeyOrZeroReturnVacant!0 (x!52607 lt!254965) (index!23689 lt!254965) (index!23689 lt!254965) (select (arr!16919 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560722 () Bool)

(declare-fun res!352014 () Bool)

(assert (=> b!560722 (=> (not res!352014) (not e!323071))))

(declare-datatypes ((List!11038 0))(
  ( (Nil!11035) (Cons!11034 (h!12037 (_ BitVec 64)) (t!17257 List!11038)) )
))
(declare-fun arrayNoDuplicates!0 (array!35236 (_ BitVec 32) List!11038) Bool)

(assert (=> b!560722 (= res!352014 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11035))))

(declare-fun b!560723 () Bool)

(declare-fun res!352015 () Bool)

(assert (=> b!560723 (=> (not res!352015) (not e!323071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35236 (_ BitVec 32)) Bool)

(assert (=> b!560723 (= res!352015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560713 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35236 (_ BitVec 32)) SeekEntryResult!5365)

(assert (=> b!560713 (= e!323069 (= (seekEntryOrOpen!0 lt!254968 lt!254960 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52607 lt!254965) (index!23689 lt!254965) (index!23689 lt!254965) lt!254968 lt!254960 mask!3119)))))

(declare-fun res!352012 () Bool)

(assert (=> start!51362 (=> (not res!352012) (not e!323072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51362 (= res!352012 (validMask!0 mask!3119))))

(assert (=> start!51362 e!323072))

(assert (=> start!51362 true))

(declare-fun array_inv!12802 (array!35236) Bool)

(assert (=> start!51362 (array_inv!12802 a!3118)))

(declare-fun b!560724 () Bool)

(assert (=> b!560724 (= e!323066 (not true))))

(assert (=> b!560724 e!323073))

(declare-fun res!352007 () Bool)

(assert (=> b!560724 (=> (not res!352007) (not e!323073))))

(assert (=> b!560724 (= res!352007 (= lt!254961 (Found!5365 j!142)))))

(assert (=> b!560724 (= lt!254961 (seekEntryOrOpen!0 (select (arr!16919 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!560724 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17490 0))(
  ( (Unit!17491) )
))
(declare-fun lt!254962 () Unit!17490)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35236 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17490)

(assert (=> b!560724 (= lt!254962 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560725 () Bool)

(assert (=> b!560725 (= e!323072 e!323071)))

(declare-fun res!352009 () Bool)

(assert (=> b!560725 (=> (not res!352009) (not e!323071))))

(declare-fun lt!254963 () SeekEntryResult!5365)

(assert (=> b!560725 (= res!352009 (or (= lt!254963 (MissingZero!5365 i!1132)) (= lt!254963 (MissingVacant!5365 i!1132))))))

(assert (=> b!560725 (= lt!254963 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!51362 res!352012) b!560719))

(assert (= (and b!560719 res!352016) b!560715))

(assert (= (and b!560715 res!352008) b!560716))

(assert (= (and b!560716 res!352019) b!560714))

(assert (= (and b!560714 res!352013) b!560725))

(assert (= (and b!560725 res!352009) b!560723))

(assert (= (and b!560723 res!352015) b!560722))

(assert (= (and b!560722 res!352014) b!560720))

(assert (= (and b!560720 res!352018) b!560724))

(assert (= (and b!560724 res!352007) b!560718))

(assert (= (and b!560718 (not res!352017)) b!560717))

(assert (= (and b!560717 (not res!352010)) b!560721))

(assert (= (and b!560721 res!352011) b!560713))

(declare-fun m!538049 () Bool)

(assert (=> b!560716 m!538049))

(declare-fun m!538051 () Bool)

(assert (=> start!51362 m!538051))

(declare-fun m!538053 () Bool)

(assert (=> start!51362 m!538053))

(declare-fun m!538055 () Bool)

(assert (=> b!560722 m!538055))

(declare-fun m!538057 () Bool)

(assert (=> b!560714 m!538057))

(declare-fun m!538059 () Bool)

(assert (=> b!560721 m!538059))

(assert (=> b!560721 m!538059))

(declare-fun m!538061 () Bool)

(assert (=> b!560721 m!538061))

(assert (=> b!560724 m!538059))

(assert (=> b!560724 m!538059))

(declare-fun m!538063 () Bool)

(assert (=> b!560724 m!538063))

(declare-fun m!538065 () Bool)

(assert (=> b!560724 m!538065))

(declare-fun m!538067 () Bool)

(assert (=> b!560724 m!538067))

(assert (=> b!560720 m!538059))

(declare-fun m!538069 () Bool)

(assert (=> b!560720 m!538069))

(assert (=> b!560720 m!538059))

(declare-fun m!538071 () Bool)

(assert (=> b!560720 m!538071))

(assert (=> b!560720 m!538059))

(declare-fun m!538073 () Bool)

(assert (=> b!560720 m!538073))

(declare-fun m!538075 () Bool)

(assert (=> b!560720 m!538075))

(declare-fun m!538077 () Bool)

(assert (=> b!560720 m!538077))

(declare-fun m!538079 () Bool)

(assert (=> b!560720 m!538079))

(declare-fun m!538081 () Bool)

(assert (=> b!560723 m!538081))

(assert (=> b!560717 m!538059))

(declare-fun m!538083 () Bool)

(assert (=> b!560717 m!538083))

(declare-fun m!538085 () Bool)

(assert (=> b!560725 m!538085))

(assert (=> b!560715 m!538059))

(assert (=> b!560715 m!538059))

(declare-fun m!538087 () Bool)

(assert (=> b!560715 m!538087))

(declare-fun m!538089 () Bool)

(assert (=> b!560713 m!538089))

(declare-fun m!538091 () Bool)

(assert (=> b!560713 m!538091))

(check-sat (not b!560722) (not b!560724) (not start!51362) (not b!560721) (not b!560713) (not b!560715) (not b!560720) (not b!560725) (not b!560723) (not b!560716) (not b!560714))
(check-sat)
