; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52314 () Bool)

(assert start!52314)

(declare-fun b!570985 () Bool)

(declare-fun e!328383 () Bool)

(declare-fun e!328384 () Bool)

(assert (=> b!570985 (= e!328383 e!328384)))

(declare-fun res!360766 () Bool)

(assert (=> b!570985 (=> (not res!360766) (not e!328384))))

(declare-fun lt!260332 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5626 0))(
  ( (MissingZero!5626 (index!24731 (_ BitVec 32))) (Found!5626 (index!24732 (_ BitVec 32))) (Intermediate!5626 (undefined!6438 Bool) (index!24733 (_ BitVec 32)) (x!53598 (_ BitVec 32))) (Undefined!5626) (MissingVacant!5626 (index!24734 (_ BitVec 32))) )
))
(declare-fun lt!260330 () SeekEntryResult!5626)

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35774 0))(
  ( (array!35775 (arr!17177 (Array (_ BitVec 32) (_ BitVec 64))) (size!17541 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35774)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35774 (_ BitVec 32)) SeekEntryResult!5626)

(assert (=> b!570985 (= res!360766 (= lt!260330 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260332 (select (store (arr!17177 a!3118) i!1132 k!1914) j!142) (array!35775 (store (arr!17177 a!3118) i!1132 k!1914) (size!17541 a!3118)) mask!3119)))))

(declare-fun lt!260333 () (_ BitVec 32))

(assert (=> b!570985 (= lt!260330 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260333 (select (arr!17177 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570985 (= lt!260332 (toIndex!0 (select (store (arr!17177 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!570985 (= lt!260333 (toIndex!0 (select (arr!17177 a!3118) j!142) mask!3119))))

(declare-fun b!570986 () Bool)

(declare-fun e!328385 () Bool)

(assert (=> b!570986 (= e!328385 e!328383)))

(declare-fun res!360768 () Bool)

(assert (=> b!570986 (=> (not res!360768) (not e!328383))))

(declare-fun lt!260334 () SeekEntryResult!5626)

(assert (=> b!570986 (= res!360768 (or (= lt!260334 (MissingZero!5626 i!1132)) (= lt!260334 (MissingVacant!5626 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35774 (_ BitVec 32)) SeekEntryResult!5626)

(assert (=> b!570986 (= lt!260334 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!570987 () Bool)

(assert (=> b!570987 (= e!328384 (not true))))

(declare-fun e!328381 () Bool)

(assert (=> b!570987 e!328381))

(declare-fun res!360770 () Bool)

(assert (=> b!570987 (=> (not res!360770) (not e!328381))))

(declare-fun lt!260331 () SeekEntryResult!5626)

(assert (=> b!570987 (= res!360770 (= lt!260331 (Found!5626 j!142)))))

(assert (=> b!570987 (= lt!260331 (seekEntryOrOpen!0 (select (arr!17177 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35774 (_ BitVec 32)) Bool)

(assert (=> b!570987 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17954 0))(
  ( (Unit!17955) )
))
(declare-fun lt!260335 () Unit!17954)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35774 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17954)

(assert (=> b!570987 (= lt!260335 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570988 () Bool)

(declare-fun res!360773 () Bool)

(assert (=> b!570988 (=> (not res!360773) (not e!328385))))

(declare-fun arrayContainsKey!0 (array!35774 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570988 (= res!360773 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!570989 () Bool)

(declare-fun e!328386 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35774 (_ BitVec 32)) SeekEntryResult!5626)

(assert (=> b!570989 (= e!328386 (= lt!260331 (seekKeyOrZeroReturnVacant!0 (x!53598 lt!260330) (index!24733 lt!260330) (index!24733 lt!260330) (select (arr!17177 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570990 () Bool)

(declare-fun res!360776 () Bool)

(assert (=> b!570990 (=> (not res!360776) (not e!328385))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570990 (= res!360776 (validKeyInArray!0 (select (arr!17177 a!3118) j!142)))))

(declare-fun b!570991 () Bool)

(declare-fun res!360771 () Bool)

(assert (=> b!570991 (=> (not res!360771) (not e!328383))))

(assert (=> b!570991 (= res!360771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570992 () Bool)

(declare-fun res!360772 () Bool)

(assert (=> b!570992 (=> (not res!360772) (not e!328385))))

(assert (=> b!570992 (= res!360772 (and (= (size!17541 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17541 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17541 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570993 () Bool)

(declare-fun res!360769 () Bool)

(assert (=> b!570993 (=> (not res!360769) (not e!328385))))

(assert (=> b!570993 (= res!360769 (validKeyInArray!0 k!1914))))

(declare-fun res!360767 () Bool)

(assert (=> start!52314 (=> (not res!360767) (not e!328385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52314 (= res!360767 (validMask!0 mask!3119))))

(assert (=> start!52314 e!328385))

(assert (=> start!52314 true))

(declare-fun array_inv!12973 (array!35774) Bool)

(assert (=> start!52314 (array_inv!12973 a!3118)))

(declare-fun b!570994 () Bool)

(assert (=> b!570994 (= e!328381 e!328386)))

(declare-fun res!360775 () Bool)

(assert (=> b!570994 (=> res!360775 e!328386)))

(assert (=> b!570994 (= res!360775 (or (undefined!6438 lt!260330) (not (is-Intermediate!5626 lt!260330)) (= (select (arr!17177 a!3118) (index!24733 lt!260330)) (select (arr!17177 a!3118) j!142)) (= (select (arr!17177 a!3118) (index!24733 lt!260330)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!570995 () Bool)

(declare-fun res!360774 () Bool)

(assert (=> b!570995 (=> (not res!360774) (not e!328383))))

(declare-datatypes ((List!11257 0))(
  ( (Nil!11254) (Cons!11253 (h!12277 (_ BitVec 64)) (t!17485 List!11257)) )
))
(declare-fun arrayNoDuplicates!0 (array!35774 (_ BitVec 32) List!11257) Bool)

(assert (=> b!570995 (= res!360774 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11254))))

(assert (= (and start!52314 res!360767) b!570992))

(assert (= (and b!570992 res!360772) b!570990))

(assert (= (and b!570990 res!360776) b!570993))

(assert (= (and b!570993 res!360769) b!570988))

(assert (= (and b!570988 res!360773) b!570986))

(assert (= (and b!570986 res!360768) b!570991))

(assert (= (and b!570991 res!360771) b!570995))

(assert (= (and b!570995 res!360774) b!570985))

(assert (= (and b!570985 res!360766) b!570987))

(assert (= (and b!570987 res!360770) b!570994))

(assert (= (and b!570994 (not res!360775)) b!570989))

(declare-fun m!549929 () Bool)

(assert (=> b!570985 m!549929))

(declare-fun m!549931 () Bool)

(assert (=> b!570985 m!549931))

(assert (=> b!570985 m!549929))

(declare-fun m!549933 () Bool)

(assert (=> b!570985 m!549933))

(assert (=> b!570985 m!549929))

(declare-fun m!549935 () Bool)

(assert (=> b!570985 m!549935))

(declare-fun m!549937 () Bool)

(assert (=> b!570985 m!549937))

(assert (=> b!570985 m!549933))

(declare-fun m!549939 () Bool)

(assert (=> b!570985 m!549939))

(assert (=> b!570985 m!549933))

(declare-fun m!549941 () Bool)

(assert (=> b!570985 m!549941))

(declare-fun m!549943 () Bool)

(assert (=> b!570995 m!549943))

(declare-fun m!549945 () Bool)

(assert (=> b!570986 m!549945))

(declare-fun m!549947 () Bool)

(assert (=> b!570993 m!549947))

(declare-fun m!549949 () Bool)

(assert (=> start!52314 m!549949))

(declare-fun m!549951 () Bool)

(assert (=> start!52314 m!549951))

(assert (=> b!570989 m!549929))

(assert (=> b!570989 m!549929))

(declare-fun m!549953 () Bool)

(assert (=> b!570989 m!549953))

(declare-fun m!549955 () Bool)

(assert (=> b!570991 m!549955))

(assert (=> b!570990 m!549929))

(assert (=> b!570990 m!549929))

(declare-fun m!549957 () Bool)

(assert (=> b!570990 m!549957))

(assert (=> b!570987 m!549929))

(assert (=> b!570987 m!549929))

(declare-fun m!549959 () Bool)

(assert (=> b!570987 m!549959))

(declare-fun m!549961 () Bool)

(assert (=> b!570987 m!549961))

(declare-fun m!549963 () Bool)

(assert (=> b!570987 m!549963))

(declare-fun m!549965 () Bool)

(assert (=> b!570994 m!549965))

(assert (=> b!570994 m!549929))

(declare-fun m!549967 () Bool)

(assert (=> b!570988 m!549967))

(push 1)

