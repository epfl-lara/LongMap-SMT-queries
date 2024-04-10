; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51374 () Bool)

(assert start!51374)

(declare-fun b!560984 () Bool)

(declare-fun e!323245 () Bool)

(assert (=> b!560984 (= e!323245 (not true))))

(declare-fun e!323246 () Bool)

(assert (=> b!560984 e!323246))

(declare-fun res!352139 () Bool)

(assert (=> b!560984 (=> (not res!352139) (not e!323246))))

(declare-datatypes ((SeekEntryResult!5369 0))(
  ( (MissingZero!5369 (index!23703 (_ BitVec 32))) (Found!5369 (index!23704 (_ BitVec 32))) (Intermediate!5369 (undefined!6181 Bool) (index!23705 (_ BitVec 32)) (x!52616 (_ BitVec 32))) (Undefined!5369) (MissingVacant!5369 (index!23706 (_ BitVec 32))) )
))
(declare-fun lt!255198 () SeekEntryResult!5369)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!560984 (= res!352139 (= lt!255198 (Found!5369 j!142)))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35239 0))(
  ( (array!35240 (arr!16920 (Array (_ BitVec 32) (_ BitVec 64))) (size!17284 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35239)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35239 (_ BitVec 32)) SeekEntryResult!5369)

(assert (=> b!560984 (= lt!255198 (seekEntryOrOpen!0 (select (arr!16920 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35239 (_ BitVec 32)) Bool)

(assert (=> b!560984 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17512 0))(
  ( (Unit!17513) )
))
(declare-fun lt!255196 () Unit!17512)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35239 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17512)

(assert (=> b!560984 (= lt!255196 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!560985 () Bool)

(declare-fun res!352141 () Bool)

(declare-fun e!323247 () Bool)

(assert (=> b!560985 (=> (not res!352141) (not e!323247))))

(assert (=> b!560985 (= res!352141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!560986 () Bool)

(assert (=> b!560986 (= e!323247 e!323245)))

(declare-fun res!352147 () Bool)

(assert (=> b!560986 (=> (not res!352147) (not e!323245))))

(declare-fun lt!255202 () SeekEntryResult!5369)

(declare-fun lt!255195 () array!35239)

(declare-fun lt!255201 () (_ BitVec 32))

(declare-fun lt!255199 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35239 (_ BitVec 32)) SeekEntryResult!5369)

(assert (=> b!560986 (= res!352147 (= lt!255202 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255201 lt!255199 lt!255195 mask!3119)))))

(declare-fun lt!255194 () (_ BitVec 32))

(assert (=> b!560986 (= lt!255202 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255194 (select (arr!16920 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!560986 (= lt!255201 (toIndex!0 lt!255199 mask!3119))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!560986 (= lt!255199 (select (store (arr!16920 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!560986 (= lt!255194 (toIndex!0 (select (arr!16920 a!3118) j!142) mask!3119))))

(assert (=> b!560986 (= lt!255195 (array!35240 (store (arr!16920 a!3118) i!1132 k!1914) (size!17284 a!3118)))))

(declare-fun b!560987 () Bool)

(declare-fun e!323243 () Bool)

(declare-fun e!323244 () Bool)

(assert (=> b!560987 (= e!323243 e!323244)))

(declare-fun res!352148 () Bool)

(assert (=> b!560987 (=> (not res!352148) (not e!323244))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35239 (_ BitVec 32)) SeekEntryResult!5369)

(assert (=> b!560987 (= res!352148 (= lt!255198 (seekKeyOrZeroReturnVacant!0 (x!52616 lt!255202) (index!23705 lt!255202) (index!23705 lt!255202) (select (arr!16920 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!560988 () Bool)

(declare-fun res!352146 () Bool)

(declare-fun e!323242 () Bool)

(assert (=> b!560988 (=> (not res!352146) (not e!323242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!560988 (= res!352146 (validKeyInArray!0 (select (arr!16920 a!3118) j!142)))))

(declare-fun res!352136 () Bool)

(assert (=> start!51374 (=> (not res!352136) (not e!323242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51374 (= res!352136 (validMask!0 mask!3119))))

(assert (=> start!51374 e!323242))

(assert (=> start!51374 true))

(declare-fun array_inv!12716 (array!35239) Bool)

(assert (=> start!51374 (array_inv!12716 a!3118)))

(declare-fun b!560989 () Bool)

(assert (=> b!560989 (= e!323242 e!323247)))

(declare-fun res!352142 () Bool)

(assert (=> b!560989 (=> (not res!352142) (not e!323247))))

(declare-fun lt!255200 () SeekEntryResult!5369)

(assert (=> b!560989 (= res!352142 (or (= lt!255200 (MissingZero!5369 i!1132)) (= lt!255200 (MissingVacant!5369 i!1132))))))

(assert (=> b!560989 (= lt!255200 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!560990 () Bool)

(declare-fun e!323240 () Bool)

(assert (=> b!560990 (= e!323240 e!323243)))

(declare-fun res!352143 () Bool)

(assert (=> b!560990 (=> res!352143 e!323243)))

(declare-fun lt!255197 () (_ BitVec 64))

(assert (=> b!560990 (= res!352143 (or (= lt!255197 (select (arr!16920 a!3118) j!142)) (= lt!255197 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!560990 (= lt!255197 (select (arr!16920 a!3118) (index!23705 lt!255202)))))

(declare-fun b!560991 () Bool)

(declare-fun res!352138 () Bool)

(assert (=> b!560991 (=> (not res!352138) (not e!323242))))

(assert (=> b!560991 (= res!352138 (validKeyInArray!0 k!1914))))

(declare-fun b!560992 () Bool)

(declare-fun res!352137 () Bool)

(assert (=> b!560992 (=> (not res!352137) (not e!323242))))

(assert (=> b!560992 (= res!352137 (and (= (size!17284 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17284 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17284 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!560993 () Bool)

(assert (=> b!560993 (= e!323244 (= (seekEntryOrOpen!0 lt!255199 lt!255195 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52616 lt!255202) (index!23705 lt!255202) (index!23705 lt!255202) lt!255199 lt!255195 mask!3119)))))

(declare-fun b!560994 () Bool)

(declare-fun res!352145 () Bool)

(assert (=> b!560994 (=> (not res!352145) (not e!323242))))

(declare-fun arrayContainsKey!0 (array!35239 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!560994 (= res!352145 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!560995 () Bool)

(assert (=> b!560995 (= e!323246 e!323240)))

(declare-fun res!352140 () Bool)

(assert (=> b!560995 (=> res!352140 e!323240)))

(assert (=> b!560995 (= res!352140 (or (undefined!6181 lt!255202) (not (is-Intermediate!5369 lt!255202))))))

(declare-fun b!560996 () Bool)

(declare-fun res!352144 () Bool)

(assert (=> b!560996 (=> (not res!352144) (not e!323247))))

(declare-datatypes ((List!11000 0))(
  ( (Nil!10997) (Cons!10996 (h!11999 (_ BitVec 64)) (t!17228 List!11000)) )
))
(declare-fun arrayNoDuplicates!0 (array!35239 (_ BitVec 32) List!11000) Bool)

(assert (=> b!560996 (= res!352144 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10997))))

(assert (= (and start!51374 res!352136) b!560992))

(assert (= (and b!560992 res!352137) b!560988))

(assert (= (and b!560988 res!352146) b!560991))

(assert (= (and b!560991 res!352138) b!560994))

(assert (= (and b!560994 res!352145) b!560989))

(assert (= (and b!560989 res!352142) b!560985))

(assert (= (and b!560985 res!352141) b!560996))

(assert (= (and b!560996 res!352144) b!560986))

(assert (= (and b!560986 res!352147) b!560984))

(assert (= (and b!560984 res!352139) b!560995))

(assert (= (and b!560995 (not res!352140)) b!560990))

(assert (= (and b!560990 (not res!352143)) b!560987))

(assert (= (and b!560987 res!352148) b!560993))

(declare-fun m!538821 () Bool)

(assert (=> b!560991 m!538821))

(declare-fun m!538823 () Bool)

(assert (=> b!560990 m!538823))

(declare-fun m!538825 () Bool)

(assert (=> b!560990 m!538825))

(assert (=> b!560987 m!538823))

(assert (=> b!560987 m!538823))

(declare-fun m!538827 () Bool)

(assert (=> b!560987 m!538827))

(declare-fun m!538829 () Bool)

(assert (=> b!560993 m!538829))

(declare-fun m!538831 () Bool)

(assert (=> b!560993 m!538831))

(declare-fun m!538833 () Bool)

(assert (=> b!560989 m!538833))

(declare-fun m!538835 () Bool)

(assert (=> b!560994 m!538835))

(assert (=> b!560988 m!538823))

(assert (=> b!560988 m!538823))

(declare-fun m!538837 () Bool)

(assert (=> b!560988 m!538837))

(declare-fun m!538839 () Bool)

(assert (=> start!51374 m!538839))

(declare-fun m!538841 () Bool)

(assert (=> start!51374 m!538841))

(assert (=> b!560986 m!538823))

(declare-fun m!538843 () Bool)

(assert (=> b!560986 m!538843))

(assert (=> b!560986 m!538823))

(declare-fun m!538845 () Bool)

(assert (=> b!560986 m!538845))

(declare-fun m!538847 () Bool)

(assert (=> b!560986 m!538847))

(declare-fun m!538849 () Bool)

(assert (=> b!560986 m!538849))

(declare-fun m!538851 () Bool)

(assert (=> b!560986 m!538851))

(assert (=> b!560986 m!538823))

(declare-fun m!538853 () Bool)

(assert (=> b!560986 m!538853))

(assert (=> b!560984 m!538823))

(assert (=> b!560984 m!538823))

(declare-fun m!538855 () Bool)

(assert (=> b!560984 m!538855))

(declare-fun m!538857 () Bool)

(assert (=> b!560984 m!538857))

(declare-fun m!538859 () Bool)

(assert (=> b!560984 m!538859))

(declare-fun m!538861 () Bool)

(assert (=> b!560985 m!538861))

(declare-fun m!538863 () Bool)

(assert (=> b!560996 m!538863))

(push 1)

