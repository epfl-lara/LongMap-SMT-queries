; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45744 () Bool)

(assert start!45744)

(declare-fun b!505937 () Bool)

(declare-fun e!296123 () Bool)

(declare-fun e!296122 () Bool)

(assert (=> b!505937 (= e!296123 (not e!296122))))

(declare-fun res!307061 () Bool)

(assert (=> b!505937 (=> res!307061 e!296122)))

(declare-datatypes ((SeekEntryResult!4099 0))(
  ( (MissingZero!4099 (index!18584 (_ BitVec 32))) (Found!4099 (index!18585 (_ BitVec 32))) (Intermediate!4099 (undefined!4911 Bool) (index!18586 (_ BitVec 32)) (x!47599 (_ BitVec 32))) (Undefined!4099) (MissingVacant!4099 (index!18587 (_ BitVec 32))) )
))
(declare-fun lt!230717 () SeekEntryResult!4099)

(declare-fun lt!230716 () SeekEntryResult!4099)

(get-info :version)

(assert (=> b!505937 (= res!307061 (or (= lt!230717 lt!230716) (undefined!4911 lt!230717) (not ((_ is Intermediate!4099) lt!230717))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32510 0))(
  ( (array!32511 (arr!15635 (Array (_ BitVec 32) (_ BitVec 64))) (size!16000 (_ BitVec 32))) )
))
(declare-fun lt!230712 () array!32510)

(declare-fun lt!230719 () (_ BitVec 32))

(declare-fun lt!230722 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32510 (_ BitVec 32)) SeekEntryResult!4099)

(assert (=> b!505937 (= lt!230716 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230719 lt!230722 lt!230712 mask!3524))))

(declare-fun lt!230710 () (_ BitVec 32))

(declare-fun a!3235 () array!32510)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!505937 (= lt!230717 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230710 (select (arr!15635 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505937 (= lt!230719 (toIndex!0 lt!230722 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!505937 (= lt!230722 (select (store (arr!15635 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!505937 (= lt!230710 (toIndex!0 (select (arr!15635 a!3235) j!176) mask!3524))))

(assert (=> b!505937 (= lt!230712 (array!32511 (store (arr!15635 a!3235) i!1204 k0!2280) (size!16000 a!3235)))))

(declare-fun lt!230718 () SeekEntryResult!4099)

(assert (=> b!505937 (= lt!230718 (Found!4099 j!176))))

(declare-fun e!296118 () Bool)

(assert (=> b!505937 e!296118))

(declare-fun res!307058 () Bool)

(assert (=> b!505937 (=> (not res!307058) (not e!296118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32510 (_ BitVec 32)) Bool)

(assert (=> b!505937 (= res!307058 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15466 0))(
  ( (Unit!15467) )
))
(declare-fun lt!230714 () Unit!15466)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32510 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15466)

(assert (=> b!505937 (= lt!230714 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505938 () Bool)

(declare-fun e!296120 () Bool)

(declare-fun e!296117 () Bool)

(assert (=> b!505938 (= e!296120 e!296117)))

(declare-fun res!307053 () Bool)

(assert (=> b!505938 (=> res!307053 e!296117)))

(assert (=> b!505938 (= res!307053 (bvslt mask!3524 #b00000000000000000000000000000000))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32510 (_ BitVec 32)) SeekEntryResult!4099)

(assert (=> b!505938 (= (seekEntryOrOpen!0 lt!230722 lt!230712 mask!3524) lt!230718)))

(declare-fun lt!230711 () Unit!15466)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32510 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15466)

(assert (=> b!505938 (= lt!230711 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!230710 #b00000000000000000000000000000000 (index!18586 lt!230717) (x!47599 lt!230717) mask!3524))))

(declare-fun b!505939 () Bool)

(declare-fun e!296121 () Unit!15466)

(declare-fun Unit!15468 () Unit!15466)

(assert (=> b!505939 (= e!296121 Unit!15468)))

(declare-fun b!505940 () Bool)

(declare-fun res!307063 () Bool)

(assert (=> b!505940 (=> (not res!307063) (not e!296123))))

(declare-datatypes ((List!9832 0))(
  ( (Nil!9829) (Cons!9828 (h!10705 (_ BitVec 64)) (t!16051 List!9832)) )
))
(declare-fun arrayNoDuplicates!0 (array!32510 (_ BitVec 32) List!9832) Bool)

(assert (=> b!505940 (= res!307063 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9829))))

(declare-fun b!505941 () Bool)

(assert (=> b!505941 (= e!296118 (= (seekEntryOrOpen!0 (select (arr!15635 a!3235) j!176) a!3235 mask!3524) (Found!4099 j!176)))))

(declare-fun b!505942 () Bool)

(declare-fun e!296119 () Bool)

(assert (=> b!505942 (= e!296119 false)))

(declare-fun b!505943 () Bool)

(declare-fun res!307054 () Bool)

(assert (=> b!505943 (=> res!307054 e!296120)))

(assert (=> b!505943 (= res!307054 (not (= lt!230716 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230710 lt!230722 lt!230712 mask!3524))))))

(declare-fun e!296116 () Bool)

(declare-fun b!505944 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32510 (_ BitVec 32)) SeekEntryResult!4099)

(assert (=> b!505944 (= e!296116 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230710 (index!18586 lt!230717) (select (arr!15635 a!3235) j!176) a!3235 mask!3524) lt!230718)))))

(declare-fun b!505945 () Bool)

(assert (=> b!505945 (= e!296122 e!296120)))

(declare-fun res!307059 () Bool)

(assert (=> b!505945 (=> res!307059 e!296120)))

(assert (=> b!505945 (= res!307059 (or (bvsgt (x!47599 lt!230717) #b01111111111111111111111111111110) (bvslt lt!230710 #b00000000000000000000000000000000) (bvsge lt!230710 (size!16000 a!3235)) (bvslt (index!18586 lt!230717) #b00000000000000000000000000000000) (bvsge (index!18586 lt!230717) (size!16000 a!3235)) (not (= lt!230717 (Intermediate!4099 false (index!18586 lt!230717) (x!47599 lt!230717))))))))

(assert (=> b!505945 (= (index!18586 lt!230717) i!1204)))

(declare-fun lt!230713 () Unit!15466)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32510 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15466)

(assert (=> b!505945 (= lt!230713 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!230710 #b00000000000000000000000000000000 (index!18586 lt!230717) (x!47599 lt!230717) mask!3524))))

(assert (=> b!505945 (and (or (= (select (arr!15635 a!3235) (index!18586 lt!230717)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15635 a!3235) (index!18586 lt!230717)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15635 a!3235) (index!18586 lt!230717)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15635 a!3235) (index!18586 lt!230717)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230720 () Unit!15466)

(assert (=> b!505945 (= lt!230720 e!296121)))

(declare-fun c!59721 () Bool)

(assert (=> b!505945 (= c!59721 (= (select (arr!15635 a!3235) (index!18586 lt!230717)) (select (arr!15635 a!3235) j!176)))))

(assert (=> b!505945 (and (bvslt (x!47599 lt!230717) #b01111111111111111111111111111110) (or (= (select (arr!15635 a!3235) (index!18586 lt!230717)) (select (arr!15635 a!3235) j!176)) (= (select (arr!15635 a!3235) (index!18586 lt!230717)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15635 a!3235) (index!18586 lt!230717)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!307067 () Bool)

(declare-fun e!296124 () Bool)

(assert (=> start!45744 (=> (not res!307067) (not e!296124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45744 (= res!307067 (validMask!0 mask!3524))))

(assert (=> start!45744 e!296124))

(assert (=> start!45744 true))

(declare-fun array_inv!11518 (array!32510) Bool)

(assert (=> start!45744 (array_inv!11518 a!3235)))

(declare-fun b!505946 () Bool)

(declare-fun res!307056 () Bool)

(assert (=> b!505946 (=> (not res!307056) (not e!296124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505946 (= res!307056 (validKeyInArray!0 (select (arr!15635 a!3235) j!176)))))

(declare-fun b!505947 () Bool)

(assert (=> b!505947 (= e!296117 (validKeyInArray!0 lt!230722))))

(declare-fun b!505948 () Bool)

(declare-fun res!307055 () Bool)

(assert (=> b!505948 (=> (not res!307055) (not e!296123))))

(assert (=> b!505948 (= res!307055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505949 () Bool)

(assert (=> b!505949 (= e!296124 e!296123)))

(declare-fun res!307065 () Bool)

(assert (=> b!505949 (=> (not res!307065) (not e!296123))))

(declare-fun lt!230715 () SeekEntryResult!4099)

(assert (=> b!505949 (= res!307065 (or (= lt!230715 (MissingZero!4099 i!1204)) (= lt!230715 (MissingVacant!4099 i!1204))))))

(assert (=> b!505949 (= lt!230715 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!505950 () Bool)

(declare-fun res!307052 () Bool)

(assert (=> b!505950 (=> (not res!307052) (not e!296124))))

(assert (=> b!505950 (= res!307052 (validKeyInArray!0 k0!2280))))

(declare-fun b!505951 () Bool)

(declare-fun Unit!15469 () Unit!15466)

(assert (=> b!505951 (= e!296121 Unit!15469)))

(declare-fun lt!230721 () Unit!15466)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32510 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15466)

(assert (=> b!505951 (= lt!230721 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!230710 #b00000000000000000000000000000000 (index!18586 lt!230717) (x!47599 lt!230717) mask!3524))))

(declare-fun res!307066 () Bool)

(assert (=> b!505951 (= res!307066 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230710 lt!230722 lt!230712 mask!3524) (Intermediate!4099 false (index!18586 lt!230717) (x!47599 lt!230717))))))

(assert (=> b!505951 (=> (not res!307066) (not e!296119))))

(assert (=> b!505951 e!296119))

(declare-fun b!505952 () Bool)

(declare-fun res!307062 () Bool)

(assert (=> b!505952 (=> res!307062 e!296120)))

(assert (=> b!505952 (= res!307062 e!296116)))

(declare-fun res!307060 () Bool)

(assert (=> b!505952 (=> (not res!307060) (not e!296116))))

(assert (=> b!505952 (= res!307060 (bvsgt #b00000000000000000000000000000000 (x!47599 lt!230717)))))

(declare-fun b!505953 () Bool)

(declare-fun res!307057 () Bool)

(assert (=> b!505953 (=> (not res!307057) (not e!296124))))

(declare-fun arrayContainsKey!0 (array!32510 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505953 (= res!307057 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505954 () Bool)

(declare-fun res!307064 () Bool)

(assert (=> b!505954 (=> (not res!307064) (not e!296124))))

(assert (=> b!505954 (= res!307064 (and (= (size!16000 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16000 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16000 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!45744 res!307067) b!505954))

(assert (= (and b!505954 res!307064) b!505946))

(assert (= (and b!505946 res!307056) b!505950))

(assert (= (and b!505950 res!307052) b!505953))

(assert (= (and b!505953 res!307057) b!505949))

(assert (= (and b!505949 res!307065) b!505948))

(assert (= (and b!505948 res!307055) b!505940))

(assert (= (and b!505940 res!307063) b!505937))

(assert (= (and b!505937 res!307058) b!505941))

(assert (= (and b!505937 (not res!307061)) b!505945))

(assert (= (and b!505945 c!59721) b!505951))

(assert (= (and b!505945 (not c!59721)) b!505939))

(assert (= (and b!505951 res!307066) b!505942))

(assert (= (and b!505945 (not res!307059)) b!505952))

(assert (= (and b!505952 res!307060) b!505944))

(assert (= (and b!505952 (not res!307062)) b!505943))

(assert (= (and b!505943 (not res!307054)) b!505938))

(assert (= (and b!505938 (not res!307053)) b!505947))

(declare-fun m!486103 () Bool)

(assert (=> b!505946 m!486103))

(assert (=> b!505946 m!486103))

(declare-fun m!486105 () Bool)

(assert (=> b!505946 m!486105))

(declare-fun m!486107 () Bool)

(assert (=> b!505937 m!486107))

(declare-fun m!486109 () Bool)

(assert (=> b!505937 m!486109))

(declare-fun m!486111 () Bool)

(assert (=> b!505937 m!486111))

(declare-fun m!486113 () Bool)

(assert (=> b!505937 m!486113))

(assert (=> b!505937 m!486103))

(declare-fun m!486115 () Bool)

(assert (=> b!505937 m!486115))

(assert (=> b!505937 m!486103))

(declare-fun m!486117 () Bool)

(assert (=> b!505937 m!486117))

(assert (=> b!505937 m!486103))

(declare-fun m!486119 () Bool)

(assert (=> b!505937 m!486119))

(declare-fun m!486121 () Bool)

(assert (=> b!505937 m!486121))

(declare-fun m!486123 () Bool)

(assert (=> b!505953 m!486123))

(declare-fun m!486125 () Bool)

(assert (=> b!505948 m!486125))

(declare-fun m!486127 () Bool)

(assert (=> b!505938 m!486127))

(declare-fun m!486129 () Bool)

(assert (=> b!505938 m!486129))

(declare-fun m!486131 () Bool)

(assert (=> b!505943 m!486131))

(declare-fun m!486133 () Bool)

(assert (=> b!505951 m!486133))

(assert (=> b!505951 m!486131))

(assert (=> b!505941 m!486103))

(assert (=> b!505941 m!486103))

(declare-fun m!486135 () Bool)

(assert (=> b!505941 m!486135))

(declare-fun m!486137 () Bool)

(assert (=> b!505950 m!486137))

(declare-fun m!486139 () Bool)

(assert (=> b!505949 m!486139))

(assert (=> b!505944 m!486103))

(assert (=> b!505944 m!486103))

(declare-fun m!486141 () Bool)

(assert (=> b!505944 m!486141))

(declare-fun m!486143 () Bool)

(assert (=> b!505940 m!486143))

(declare-fun m!486145 () Bool)

(assert (=> b!505945 m!486145))

(declare-fun m!486147 () Bool)

(assert (=> b!505945 m!486147))

(assert (=> b!505945 m!486103))

(declare-fun m!486149 () Bool)

(assert (=> start!45744 m!486149))

(declare-fun m!486151 () Bool)

(assert (=> start!45744 m!486151))

(declare-fun m!486153 () Bool)

(assert (=> b!505947 m!486153))

(check-sat (not b!505945) (not b!505938) (not b!505953) (not b!505948) (not b!505949) (not start!45744) (not b!505947) (not b!505951) (not b!505937) (not b!505940) (not b!505943) (not b!505941) (not b!505946) (not b!505944) (not b!505950))
(check-sat)
