; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51382 () Bool)

(assert start!51382)

(declare-fun b!561140 () Bool)

(declare-fun e!323337 () Bool)

(declare-fun e!323338 () Bool)

(assert (=> b!561140 (= e!323337 e!323338)))

(declare-fun res!352304 () Bool)

(assert (=> b!561140 (=> res!352304 e!323338)))

(declare-datatypes ((SeekEntryResult!5373 0))(
  ( (MissingZero!5373 (index!23719 (_ BitVec 32))) (Found!5373 (index!23720 (_ BitVec 32))) (Intermediate!5373 (undefined!6185 Bool) (index!23721 (_ BitVec 32)) (x!52628 (_ BitVec 32))) (Undefined!5373) (MissingVacant!5373 (index!23722 (_ BitVec 32))) )
))
(declare-fun lt!255305 () SeekEntryResult!5373)

(get-info :version)

(assert (=> b!561140 (= res!352304 (or (undefined!6185 lt!255305) (not ((_ is Intermediate!5373) lt!255305))))))

(declare-fun b!561141 () Bool)

(declare-fun e!323342 () Bool)

(declare-fun e!323339 () Bool)

(assert (=> b!561141 (= e!323342 e!323339)))

(declare-fun res!352296 () Bool)

(assert (=> b!561141 (=> (not res!352296) (not e!323339))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!255307 () SeekEntryResult!5373)

(declare-datatypes ((array!35247 0))(
  ( (array!35248 (arr!16924 (Array (_ BitVec 32) (_ BitVec 64))) (size!17288 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35247)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35247 (_ BitVec 32)) SeekEntryResult!5373)

(assert (=> b!561141 (= res!352296 (= lt!255307 (seekKeyOrZeroReturnVacant!0 (x!52628 lt!255305) (index!23721 lt!255305) (index!23721 lt!255305) (select (arr!16924 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561142 () Bool)

(declare-fun res!352301 () Bool)

(declare-fun e!323340 () Bool)

(assert (=> b!561142 (=> (not res!352301) (not e!323340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561142 (= res!352301 (validKeyInArray!0 (select (arr!16924 a!3118) j!142)))))

(declare-fun b!561143 () Bool)

(declare-fun res!352302 () Bool)

(declare-fun e!323336 () Bool)

(assert (=> b!561143 (=> (not res!352302) (not e!323336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35247 (_ BitVec 32)) Bool)

(assert (=> b!561143 (= res!352302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561144 () Bool)

(declare-fun res!352297 () Bool)

(assert (=> b!561144 (=> (not res!352297) (not e!323340))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561144 (= res!352297 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun lt!255303 () array!35247)

(declare-fun lt!255304 () (_ BitVec 64))

(declare-fun b!561145 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35247 (_ BitVec 32)) SeekEntryResult!5373)

(assert (=> b!561145 (= e!323339 (= (seekEntryOrOpen!0 lt!255304 lt!255303 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52628 lt!255305) (index!23721 lt!255305) (index!23721 lt!255305) lt!255304 lt!255303 mask!3119)))))

(declare-fun b!561146 () Bool)

(declare-fun res!352292 () Bool)

(assert (=> b!561146 (=> (not res!352292) (not e!323340))))

(assert (=> b!561146 (= res!352292 (validKeyInArray!0 k0!1914))))

(declare-fun b!561147 () Bool)

(declare-fun e!323341 () Bool)

(assert (=> b!561147 (= e!323341 (not true))))

(assert (=> b!561147 e!323337))

(declare-fun res!352294 () Bool)

(assert (=> b!561147 (=> (not res!352294) (not e!323337))))

(assert (=> b!561147 (= res!352294 (= lt!255307 (Found!5373 j!142)))))

(assert (=> b!561147 (= lt!255307 (seekEntryOrOpen!0 (select (arr!16924 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!561147 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17520 0))(
  ( (Unit!17521) )
))
(declare-fun lt!255309 () Unit!17520)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35247 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17520)

(assert (=> b!561147 (= lt!255309 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!352300 () Bool)

(assert (=> start!51382 (=> (not res!352300) (not e!323340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51382 (= res!352300 (validMask!0 mask!3119))))

(assert (=> start!51382 e!323340))

(assert (=> start!51382 true))

(declare-fun array_inv!12720 (array!35247) Bool)

(assert (=> start!51382 (array_inv!12720 a!3118)))

(declare-fun b!561148 () Bool)

(declare-fun res!352303 () Bool)

(assert (=> b!561148 (=> (not res!352303) (not e!323336))))

(declare-datatypes ((List!11004 0))(
  ( (Nil!11001) (Cons!11000 (h!12003 (_ BitVec 64)) (t!17232 List!11004)) )
))
(declare-fun arrayNoDuplicates!0 (array!35247 (_ BitVec 32) List!11004) Bool)

(assert (=> b!561148 (= res!352303 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11001))))

(declare-fun b!561149 () Bool)

(assert (=> b!561149 (= e!323336 e!323341)))

(declare-fun res!352298 () Bool)

(assert (=> b!561149 (=> (not res!352298) (not e!323341))))

(declare-fun lt!255302 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35247 (_ BitVec 32)) SeekEntryResult!5373)

(assert (=> b!561149 (= res!352298 (= lt!255305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255302 lt!255304 lt!255303 mask!3119)))))

(declare-fun lt!255308 () (_ BitVec 32))

(assert (=> b!561149 (= lt!255305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255308 (select (arr!16924 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561149 (= lt!255302 (toIndex!0 lt!255304 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561149 (= lt!255304 (select (store (arr!16924 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561149 (= lt!255308 (toIndex!0 (select (arr!16924 a!3118) j!142) mask!3119))))

(assert (=> b!561149 (= lt!255303 (array!35248 (store (arr!16924 a!3118) i!1132 k0!1914) (size!17288 a!3118)))))

(declare-fun b!561150 () Bool)

(declare-fun res!352293 () Bool)

(assert (=> b!561150 (=> (not res!352293) (not e!323340))))

(assert (=> b!561150 (= res!352293 (and (= (size!17288 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17288 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17288 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561151 () Bool)

(assert (=> b!561151 (= e!323340 e!323336)))

(declare-fun res!352299 () Bool)

(assert (=> b!561151 (=> (not res!352299) (not e!323336))))

(declare-fun lt!255306 () SeekEntryResult!5373)

(assert (=> b!561151 (= res!352299 (or (= lt!255306 (MissingZero!5373 i!1132)) (= lt!255306 (MissingVacant!5373 i!1132))))))

(assert (=> b!561151 (= lt!255306 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561152 () Bool)

(assert (=> b!561152 (= e!323338 e!323342)))

(declare-fun res!352295 () Bool)

(assert (=> b!561152 (=> res!352295 e!323342)))

(declare-fun lt!255310 () (_ BitVec 64))

(assert (=> b!561152 (= res!352295 (or (= lt!255310 (select (arr!16924 a!3118) j!142)) (= lt!255310 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561152 (= lt!255310 (select (arr!16924 a!3118) (index!23721 lt!255305)))))

(assert (= (and start!51382 res!352300) b!561150))

(assert (= (and b!561150 res!352293) b!561142))

(assert (= (and b!561142 res!352301) b!561146))

(assert (= (and b!561146 res!352292) b!561144))

(assert (= (and b!561144 res!352297) b!561151))

(assert (= (and b!561151 res!352299) b!561143))

(assert (= (and b!561143 res!352302) b!561148))

(assert (= (and b!561148 res!352303) b!561149))

(assert (= (and b!561149 res!352298) b!561147))

(assert (= (and b!561147 res!352294) b!561140))

(assert (= (and b!561140 (not res!352304)) b!561152))

(assert (= (and b!561152 (not res!352295)) b!561141))

(assert (= (and b!561141 res!352296) b!561145))

(declare-fun m!538997 () Bool)

(assert (=> b!561151 m!538997))

(declare-fun m!538999 () Bool)

(assert (=> b!561147 m!538999))

(assert (=> b!561147 m!538999))

(declare-fun m!539001 () Bool)

(assert (=> b!561147 m!539001))

(declare-fun m!539003 () Bool)

(assert (=> b!561147 m!539003))

(declare-fun m!539005 () Bool)

(assert (=> b!561147 m!539005))

(assert (=> b!561152 m!538999))

(declare-fun m!539007 () Bool)

(assert (=> b!561152 m!539007))

(declare-fun m!539009 () Bool)

(assert (=> b!561144 m!539009))

(declare-fun m!539011 () Bool)

(assert (=> b!561145 m!539011))

(declare-fun m!539013 () Bool)

(assert (=> b!561145 m!539013))

(declare-fun m!539015 () Bool)

(assert (=> b!561143 m!539015))

(assert (=> b!561142 m!538999))

(assert (=> b!561142 m!538999))

(declare-fun m!539017 () Bool)

(assert (=> b!561142 m!539017))

(declare-fun m!539019 () Bool)

(assert (=> start!51382 m!539019))

(declare-fun m!539021 () Bool)

(assert (=> start!51382 m!539021))

(assert (=> b!561141 m!538999))

(assert (=> b!561141 m!538999))

(declare-fun m!539023 () Bool)

(assert (=> b!561141 m!539023))

(declare-fun m!539025 () Bool)

(assert (=> b!561146 m!539025))

(declare-fun m!539027 () Bool)

(assert (=> b!561148 m!539027))

(assert (=> b!561149 m!538999))

(declare-fun m!539029 () Bool)

(assert (=> b!561149 m!539029))

(assert (=> b!561149 m!538999))

(declare-fun m!539031 () Bool)

(assert (=> b!561149 m!539031))

(assert (=> b!561149 m!538999))

(declare-fun m!539033 () Bool)

(assert (=> b!561149 m!539033))

(declare-fun m!539035 () Bool)

(assert (=> b!561149 m!539035))

(declare-fun m!539037 () Bool)

(assert (=> b!561149 m!539037))

(declare-fun m!539039 () Bool)

(assert (=> b!561149 m!539039))

(check-sat (not b!561151) (not b!561141) (not b!561149) (not b!561143) (not b!561142) (not b!561144) (not b!561145) (not b!561147) (not b!561148) (not b!561146) (not start!51382))
(check-sat)
