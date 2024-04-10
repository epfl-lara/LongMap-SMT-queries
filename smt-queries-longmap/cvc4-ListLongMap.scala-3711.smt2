; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51066 () Bool)

(assert start!51066)

(declare-fun b!557950 () Bool)

(declare-fun res!349820 () Bool)

(declare-fun e!321427 () Bool)

(assert (=> b!557950 (=> (not res!349820) (not e!321427))))

(declare-datatypes ((array!35120 0))(
  ( (array!35121 (arr!16865 (Array (_ BitVec 32) (_ BitVec 64))) (size!17229 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35120)

(declare-datatypes ((List!10945 0))(
  ( (Nil!10942) (Cons!10941 (h!11935 (_ BitVec 64)) (t!17173 List!10945)) )
))
(declare-fun arrayNoDuplicates!0 (array!35120 (_ BitVec 32) List!10945) Bool)

(assert (=> b!557950 (= res!349820 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10942))))

(declare-fun b!557951 () Bool)

(declare-fun res!349823 () Bool)

(assert (=> b!557951 (=> (not res!349823) (not e!321427))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35120 (_ BitVec 32)) Bool)

(assert (=> b!557951 (= res!349823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!557952 () Bool)

(declare-fun res!349822 () Bool)

(declare-fun e!321428 () Bool)

(assert (=> b!557952 (=> (not res!349822) (not e!321428))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557952 (= res!349822 (validKeyInArray!0 k!1914))))

(declare-fun b!557953 () Bool)

(declare-fun e!321430 () Bool)

(assert (=> b!557953 (= e!321430 (not true))))

(declare-fun e!321431 () Bool)

(assert (=> b!557953 e!321431))

(declare-fun res!349813 () Bool)

(assert (=> b!557953 (=> (not res!349813) (not e!321431))))

(declare-datatypes ((SeekEntryResult!5314 0))(
  ( (MissingZero!5314 (index!23483 (_ BitVec 32))) (Found!5314 (index!23484 (_ BitVec 32))) (Intermediate!5314 (undefined!6126 Bool) (index!23485 (_ BitVec 32)) (x!52382 (_ BitVec 32))) (Undefined!5314) (MissingVacant!5314 (index!23486 (_ BitVec 32))) )
))
(declare-fun lt!253518 () SeekEntryResult!5314)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!557953 (= res!349813 (= lt!253518 (Found!5314 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35120 (_ BitVec 32)) SeekEntryResult!5314)

(assert (=> b!557953 (= lt!253518 (seekEntryOrOpen!0 (select (arr!16865 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!557953 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17402 0))(
  ( (Unit!17403) )
))
(declare-fun lt!253517 () Unit!17402)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17402)

(assert (=> b!557953 (= lt!253517 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!557954 () Bool)

(assert (=> b!557954 (= e!321427 e!321430)))

(declare-fun res!349814 () Bool)

(assert (=> b!557954 (=> (not res!349814) (not e!321430))))

(declare-fun lt!253519 () SeekEntryResult!5314)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!253516 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35120 (_ BitVec 32)) SeekEntryResult!5314)

(assert (=> b!557954 (= res!349814 (= lt!253519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253516 (select (store (arr!16865 a!3118) i!1132 k!1914) j!142) (array!35121 (store (arr!16865 a!3118) i!1132 k!1914) (size!17229 a!3118)) mask!3119)))))

(declare-fun lt!253514 () (_ BitVec 32))

(assert (=> b!557954 (= lt!253519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253514 (select (arr!16865 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557954 (= lt!253516 (toIndex!0 (select (store (arr!16865 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!557954 (= lt!253514 (toIndex!0 (select (arr!16865 a!3118) j!142) mask!3119))))

(declare-fun b!557955 () Bool)

(declare-fun res!349819 () Bool)

(assert (=> b!557955 (=> (not res!349819) (not e!321428))))

(assert (=> b!557955 (= res!349819 (validKeyInArray!0 (select (arr!16865 a!3118) j!142)))))

(declare-fun b!557956 () Bool)

(declare-fun e!321432 () Bool)

(assert (=> b!557956 (= e!321431 e!321432)))

(declare-fun res!349818 () Bool)

(assert (=> b!557956 (=> res!349818 e!321432)))

(assert (=> b!557956 (= res!349818 (or (undefined!6126 lt!253519) (not (is-Intermediate!5314 lt!253519)) (= (select (arr!16865 a!3118) (index!23485 lt!253519)) (select (arr!16865 a!3118) j!142)) (= (select (arr!16865 a!3118) (index!23485 lt!253519)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!349815 () Bool)

(assert (=> start!51066 (=> (not res!349815) (not e!321428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51066 (= res!349815 (validMask!0 mask!3119))))

(assert (=> start!51066 e!321428))

(assert (=> start!51066 true))

(declare-fun array_inv!12661 (array!35120) Bool)

(assert (=> start!51066 (array_inv!12661 a!3118)))

(declare-fun b!557957 () Bool)

(declare-fun res!349821 () Bool)

(assert (=> b!557957 (=> (not res!349821) (not e!321428))))

(assert (=> b!557957 (= res!349821 (and (= (size!17229 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17229 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17229 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!557958 () Bool)

(assert (=> b!557958 (= e!321428 e!321427)))

(declare-fun res!349817 () Bool)

(assert (=> b!557958 (=> (not res!349817) (not e!321427))))

(declare-fun lt!253515 () SeekEntryResult!5314)

(assert (=> b!557958 (= res!349817 (or (= lt!253515 (MissingZero!5314 i!1132)) (= lt!253515 (MissingVacant!5314 i!1132))))))

(assert (=> b!557958 (= lt!253515 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!557959 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35120 (_ BitVec 32)) SeekEntryResult!5314)

(assert (=> b!557959 (= e!321432 (= lt!253518 (seekKeyOrZeroReturnVacant!0 (x!52382 lt!253519) (index!23485 lt!253519) (index!23485 lt!253519) (select (arr!16865 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!557960 () Bool)

(declare-fun res!349816 () Bool)

(assert (=> b!557960 (=> (not res!349816) (not e!321428))))

(declare-fun arrayContainsKey!0 (array!35120 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557960 (= res!349816 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51066 res!349815) b!557957))

(assert (= (and b!557957 res!349821) b!557955))

(assert (= (and b!557955 res!349819) b!557952))

(assert (= (and b!557952 res!349822) b!557960))

(assert (= (and b!557960 res!349816) b!557958))

(assert (= (and b!557958 res!349817) b!557951))

(assert (= (and b!557951 res!349823) b!557950))

(assert (= (and b!557950 res!349820) b!557954))

(assert (= (and b!557954 res!349814) b!557953))

(assert (= (and b!557953 res!349813) b!557956))

(assert (= (and b!557956 (not res!349818)) b!557959))

(declare-fun m!535829 () Bool)

(assert (=> b!557951 m!535829))

(declare-fun m!535831 () Bool)

(assert (=> b!557958 m!535831))

(declare-fun m!535833 () Bool)

(assert (=> b!557950 m!535833))

(declare-fun m!535835 () Bool)

(assert (=> start!51066 m!535835))

(declare-fun m!535837 () Bool)

(assert (=> start!51066 m!535837))

(declare-fun m!535839 () Bool)

(assert (=> b!557952 m!535839))

(declare-fun m!535841 () Bool)

(assert (=> b!557959 m!535841))

(assert (=> b!557959 m!535841))

(declare-fun m!535843 () Bool)

(assert (=> b!557959 m!535843))

(declare-fun m!535845 () Bool)

(assert (=> b!557960 m!535845))

(assert (=> b!557954 m!535841))

(declare-fun m!535847 () Bool)

(assert (=> b!557954 m!535847))

(assert (=> b!557954 m!535841))

(assert (=> b!557954 m!535841))

(declare-fun m!535849 () Bool)

(assert (=> b!557954 m!535849))

(declare-fun m!535851 () Bool)

(assert (=> b!557954 m!535851))

(assert (=> b!557954 m!535851))

(declare-fun m!535853 () Bool)

(assert (=> b!557954 m!535853))

(declare-fun m!535855 () Bool)

(assert (=> b!557954 m!535855))

(assert (=> b!557954 m!535851))

(declare-fun m!535857 () Bool)

(assert (=> b!557954 m!535857))

(assert (=> b!557953 m!535841))

(assert (=> b!557953 m!535841))

(declare-fun m!535859 () Bool)

(assert (=> b!557953 m!535859))

(declare-fun m!535861 () Bool)

(assert (=> b!557953 m!535861))

(declare-fun m!535863 () Bool)

(assert (=> b!557953 m!535863))

(declare-fun m!535865 () Bool)

(assert (=> b!557956 m!535865))

(assert (=> b!557956 m!535841))

(assert (=> b!557955 m!535841))

(assert (=> b!557955 m!535841))

(declare-fun m!535867 () Bool)

(assert (=> b!557955 m!535867))

(push 1)

