; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51068 () Bool)

(assert start!51068)

(declare-fun b!557984 () Bool)

(declare-fun e!321448 () Bool)

(declare-fun e!321450 () Bool)

(assert (=> b!557984 (= e!321448 e!321450)))

(declare-fun res!349851 () Bool)

(assert (=> b!557984 (=> res!349851 e!321450)))

(declare-datatypes ((SeekEntryResult!5315 0))(
  ( (MissingZero!5315 (index!23487 (_ BitVec 32))) (Found!5315 (index!23488 (_ BitVec 32))) (Intermediate!5315 (undefined!6127 Bool) (index!23489 (_ BitVec 32)) (x!52391 (_ BitVec 32))) (Undefined!5315) (MissingVacant!5315 (index!23490 (_ BitVec 32))) )
))
(declare-fun lt!253532 () SeekEntryResult!5315)

(declare-datatypes ((array!35122 0))(
  ( (array!35123 (arr!16866 (Array (_ BitVec 32) (_ BitVec 64))) (size!17230 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35122)

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!557984 (= res!349851 (or (undefined!6127 lt!253532) (not (is-Intermediate!5315 lt!253532)) (= (select (arr!16866 a!3118) (index!23489 lt!253532)) (select (arr!16866 a!3118) j!142)) (= (select (arr!16866 a!3118) (index!23489 lt!253532)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!557985 () Bool)

(declare-fun res!349847 () Bool)

(declare-fun e!321445 () Bool)

(assert (=> b!557985 (=> (not res!349847) (not e!321445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!557985 (= res!349847 (validKeyInArray!0 (select (arr!16866 a!3118) j!142)))))

(declare-fun b!557986 () Bool)

(declare-fun res!349853 () Bool)

(assert (=> b!557986 (=> (not res!349853) (not e!321445))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35122 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!557986 (= res!349853 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!557987 () Bool)

(declare-fun res!349846 () Bool)

(assert (=> b!557987 (=> (not res!349846) (not e!321445))))

(assert (=> b!557987 (= res!349846 (validKeyInArray!0 k!1914))))

(declare-fun lt!253533 () SeekEntryResult!5315)

(declare-fun b!557988 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35122 (_ BitVec 32)) SeekEntryResult!5315)

(assert (=> b!557988 (= e!321450 (= lt!253533 (seekKeyOrZeroReturnVacant!0 (x!52391 lt!253532) (index!23489 lt!253532) (index!23489 lt!253532) (select (arr!16866 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun e!321449 () Bool)

(declare-fun b!557989 () Bool)

(assert (=> b!557989 (= e!321449 (not (or (undefined!6127 lt!253532) (not (is-Intermediate!5315 lt!253532)) (= (select (arr!16866 a!3118) (index!23489 lt!253532)) (select (arr!16866 a!3118) j!142)) (= (select (arr!16866 a!3118) (index!23489 lt!253532)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!557989 e!321448))

(declare-fun res!349854 () Bool)

(assert (=> b!557989 (=> (not res!349854) (not e!321448))))

(assert (=> b!557989 (= res!349854 (= lt!253533 (Found!5315 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35122 (_ BitVec 32)) SeekEntryResult!5315)

(assert (=> b!557989 (= lt!253533 (seekEntryOrOpen!0 (select (arr!16866 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35122 (_ BitVec 32)) Bool)

(assert (=> b!557989 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17404 0))(
  ( (Unit!17405) )
))
(declare-fun lt!253537 () Unit!17404)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17404)

(assert (=> b!557989 (= lt!253537 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!557990 () Bool)

(declare-fun e!321447 () Bool)

(assert (=> b!557990 (= e!321445 e!321447)))

(declare-fun res!349852 () Bool)

(assert (=> b!557990 (=> (not res!349852) (not e!321447))))

(declare-fun lt!253536 () SeekEntryResult!5315)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!557990 (= res!349852 (or (= lt!253536 (MissingZero!5315 i!1132)) (= lt!253536 (MissingVacant!5315 i!1132))))))

(assert (=> b!557990 (= lt!253536 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!557991 () Bool)

(declare-fun res!349849 () Bool)

(assert (=> b!557991 (=> (not res!349849) (not e!321447))))

(assert (=> b!557991 (= res!349849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!557983 () Bool)

(declare-fun res!349848 () Bool)

(assert (=> b!557983 (=> (not res!349848) (not e!321445))))

(assert (=> b!557983 (= res!349848 (and (= (size!17230 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17230 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17230 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!349856 () Bool)

(assert (=> start!51068 (=> (not res!349856) (not e!321445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51068 (= res!349856 (validMask!0 mask!3119))))

(assert (=> start!51068 e!321445))

(assert (=> start!51068 true))

(declare-fun array_inv!12662 (array!35122) Bool)

(assert (=> start!51068 (array_inv!12662 a!3118)))

(declare-fun b!557992 () Bool)

(declare-fun res!349855 () Bool)

(assert (=> b!557992 (=> (not res!349855) (not e!321447))))

(declare-datatypes ((List!10946 0))(
  ( (Nil!10943) (Cons!10942 (h!11936 (_ BitVec 64)) (t!17174 List!10946)) )
))
(declare-fun arrayNoDuplicates!0 (array!35122 (_ BitVec 32) List!10946) Bool)

(assert (=> b!557992 (= res!349855 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10943))))

(declare-fun b!557993 () Bool)

(assert (=> b!557993 (= e!321447 e!321449)))

(declare-fun res!349850 () Bool)

(assert (=> b!557993 (=> (not res!349850) (not e!321449))))

(declare-fun lt!253534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35122 (_ BitVec 32)) SeekEntryResult!5315)

(assert (=> b!557993 (= res!349850 (= lt!253532 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253534 (select (store (arr!16866 a!3118) i!1132 k!1914) j!142) (array!35123 (store (arr!16866 a!3118) i!1132 k!1914) (size!17230 a!3118)) mask!3119)))))

(declare-fun lt!253535 () (_ BitVec 32))

(assert (=> b!557993 (= lt!253532 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253535 (select (arr!16866 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557993 (= lt!253534 (toIndex!0 (select (store (arr!16866 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!557993 (= lt!253535 (toIndex!0 (select (arr!16866 a!3118) j!142) mask!3119))))

(assert (= (and start!51068 res!349856) b!557983))

(assert (= (and b!557983 res!349848) b!557985))

(assert (= (and b!557985 res!349847) b!557987))

(assert (= (and b!557987 res!349846) b!557986))

(assert (= (and b!557986 res!349853) b!557990))

(assert (= (and b!557990 res!349852) b!557991))

(assert (= (and b!557991 res!349849) b!557992))

(assert (= (and b!557992 res!349855) b!557993))

(assert (= (and b!557993 res!349850) b!557989))

(assert (= (and b!557989 res!349854) b!557984))

(assert (= (and b!557984 (not res!349851)) b!557988))

(declare-fun m!535869 () Bool)

(assert (=> b!557986 m!535869))

(declare-fun m!535871 () Bool)

(assert (=> b!557990 m!535871))

(declare-fun m!535873 () Bool)

(assert (=> b!557992 m!535873))

(declare-fun m!535875 () Bool)

(assert (=> start!51068 m!535875))

(declare-fun m!535877 () Bool)

(assert (=> start!51068 m!535877))

(declare-fun m!535879 () Bool)

(assert (=> b!557987 m!535879))

(declare-fun m!535881 () Bool)

(assert (=> b!557984 m!535881))

(declare-fun m!535883 () Bool)

(assert (=> b!557984 m!535883))

(assert (=> b!557993 m!535883))

(declare-fun m!535885 () Bool)

(assert (=> b!557993 m!535885))

(declare-fun m!535887 () Bool)

(assert (=> b!557993 m!535887))

(declare-fun m!535889 () Bool)

(assert (=> b!557993 m!535889))

(assert (=> b!557993 m!535883))

(declare-fun m!535891 () Bool)

(assert (=> b!557993 m!535891))

(assert (=> b!557993 m!535887))

(declare-fun m!535893 () Bool)

(assert (=> b!557993 m!535893))

(assert (=> b!557993 m!535887))

(assert (=> b!557993 m!535883))

(declare-fun m!535895 () Bool)

(assert (=> b!557993 m!535895))

(assert (=> b!557988 m!535883))

(assert (=> b!557988 m!535883))

(declare-fun m!535897 () Bool)

(assert (=> b!557988 m!535897))

(assert (=> b!557985 m!535883))

(assert (=> b!557985 m!535883))

(declare-fun m!535899 () Bool)

(assert (=> b!557985 m!535899))

(assert (=> b!557989 m!535883))

(declare-fun m!535901 () Bool)

(assert (=> b!557989 m!535901))

(assert (=> b!557989 m!535881))

(declare-fun m!535903 () Bool)

(assert (=> b!557989 m!535903))

(assert (=> b!557989 m!535883))

(declare-fun m!535905 () Bool)

(assert (=> b!557989 m!535905))

(declare-fun m!535907 () Bool)

(assert (=> b!557991 m!535907))

(push 1)

