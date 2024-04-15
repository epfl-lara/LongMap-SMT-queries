; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51482 () Bool)

(assert start!51482)

(declare-fun b!562984 () Bool)

(declare-fun e!324436 () Bool)

(declare-fun e!324438 () Bool)

(assert (=> b!562984 (= e!324436 e!324438)))

(declare-fun res!354287 () Bool)

(assert (=> b!562984 (=> (not res!354287) (not e!324438))))

(declare-datatypes ((SeekEntryResult!5425 0))(
  ( (MissingZero!5425 (index!23927 (_ BitVec 32))) (Found!5425 (index!23928 (_ BitVec 32))) (Intermediate!5425 (undefined!6237 Bool) (index!23929 (_ BitVec 32)) (x!52827 (_ BitVec 32))) (Undefined!5425) (MissingVacant!5425 (index!23930 (_ BitVec 32))) )
))
(declare-fun lt!256927 () SeekEntryResult!5425)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562984 (= res!354287 (or (= lt!256927 (MissingZero!5425 i!1132)) (= lt!256927 (MissingVacant!5425 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35356 0))(
  ( (array!35357 (arr!16979 (Array (_ BitVec 32) (_ BitVec 64))) (size!17344 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35356)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35356 (_ BitVec 32)) SeekEntryResult!5425)

(assert (=> b!562984 (= lt!256927 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!324435 () Bool)

(declare-fun b!562985 () Bool)

(assert (=> b!562985 (= e!324435 (= (seekEntryOrOpen!0 (select (arr!16979 a!3118) j!142) a!3118 mask!3119) (Found!5425 j!142)))))

(declare-fun b!562986 () Bool)

(declare-fun res!354284 () Bool)

(assert (=> b!562986 (=> (not res!354284) (not e!324436))))

(declare-fun arrayContainsKey!0 (array!35356 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562986 (= res!354284 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562987 () Bool)

(declare-fun res!354279 () Bool)

(assert (=> b!562987 (=> (not res!354279) (not e!324436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562987 (= res!354279 (validKeyInArray!0 k0!1914))))

(declare-fun b!562988 () Bool)

(declare-fun res!354286 () Bool)

(assert (=> b!562988 (=> (not res!354286) (not e!324438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35356 (_ BitVec 32)) Bool)

(assert (=> b!562988 (= res!354286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!354281 () Bool)

(assert (=> start!51482 (=> (not res!354281) (not e!324436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51482 (= res!354281 (validMask!0 mask!3119))))

(assert (=> start!51482 e!324436))

(assert (=> start!51482 true))

(declare-fun array_inv!12862 (array!35356) Bool)

(assert (=> start!51482 (array_inv!12862 a!3118)))

(declare-fun b!562989 () Bool)

(declare-fun res!354278 () Bool)

(assert (=> b!562989 (=> (not res!354278) (not e!324436))))

(assert (=> b!562989 (= res!354278 (and (= (size!17344 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17344 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17344 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562990 () Bool)

(assert (=> b!562990 (= e!324438 (not true))))

(assert (=> b!562990 e!324435))

(declare-fun res!354283 () Bool)

(assert (=> b!562990 (=> (not res!354283) (not e!324435))))

(assert (=> b!562990 (= res!354283 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17610 0))(
  ( (Unit!17611) )
))
(declare-fun lt!256926 () Unit!17610)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35356 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17610)

(assert (=> b!562990 (= lt!256926 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562991 () Bool)

(declare-fun res!354285 () Bool)

(assert (=> b!562991 (=> (not res!354285) (not e!324436))))

(assert (=> b!562991 (= res!354285 (validKeyInArray!0 (select (arr!16979 a!3118) j!142)))))

(declare-fun b!562992 () Bool)

(declare-fun res!354282 () Bool)

(assert (=> b!562992 (=> (not res!354282) (not e!324438))))

(declare-datatypes ((List!11098 0))(
  ( (Nil!11095) (Cons!11094 (h!12097 (_ BitVec 64)) (t!17317 List!11098)) )
))
(declare-fun arrayNoDuplicates!0 (array!35356 (_ BitVec 32) List!11098) Bool)

(assert (=> b!562992 (= res!354282 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11095))))

(declare-fun b!562993 () Bool)

(declare-fun res!354280 () Bool)

(assert (=> b!562993 (=> (not res!354280) (not e!324438))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35356 (_ BitVec 32)) SeekEntryResult!5425)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562993 (= res!354280 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16979 a!3118) j!142) mask!3119) (select (arr!16979 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16979 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16979 a!3118) i!1132 k0!1914) j!142) (array!35357 (store (arr!16979 a!3118) i!1132 k0!1914) (size!17344 a!3118)) mask!3119)))))

(assert (= (and start!51482 res!354281) b!562989))

(assert (= (and b!562989 res!354278) b!562991))

(assert (= (and b!562991 res!354285) b!562987))

(assert (= (and b!562987 res!354279) b!562986))

(assert (= (and b!562986 res!354284) b!562984))

(assert (= (and b!562984 res!354287) b!562988))

(assert (= (and b!562988 res!354286) b!562992))

(assert (= (and b!562992 res!354282) b!562993))

(assert (= (and b!562993 res!354280) b!562990))

(assert (= (and b!562990 res!354283) b!562985))

(declare-fun m!540791 () Bool)

(assert (=> b!562993 m!540791))

(declare-fun m!540793 () Bool)

(assert (=> b!562993 m!540793))

(assert (=> b!562993 m!540791))

(declare-fun m!540795 () Bool)

(assert (=> b!562993 m!540795))

(declare-fun m!540797 () Bool)

(assert (=> b!562993 m!540797))

(assert (=> b!562993 m!540795))

(declare-fun m!540799 () Bool)

(assert (=> b!562993 m!540799))

(assert (=> b!562993 m!540793))

(assert (=> b!562993 m!540791))

(declare-fun m!540801 () Bool)

(assert (=> b!562993 m!540801))

(declare-fun m!540803 () Bool)

(assert (=> b!562993 m!540803))

(assert (=> b!562993 m!540795))

(assert (=> b!562993 m!540797))

(assert (=> b!562991 m!540791))

(assert (=> b!562991 m!540791))

(declare-fun m!540805 () Bool)

(assert (=> b!562991 m!540805))

(assert (=> b!562985 m!540791))

(assert (=> b!562985 m!540791))

(declare-fun m!540807 () Bool)

(assert (=> b!562985 m!540807))

(declare-fun m!540809 () Bool)

(assert (=> b!562987 m!540809))

(declare-fun m!540811 () Bool)

(assert (=> start!51482 m!540811))

(declare-fun m!540813 () Bool)

(assert (=> start!51482 m!540813))

(declare-fun m!540815 () Bool)

(assert (=> b!562986 m!540815))

(declare-fun m!540817 () Bool)

(assert (=> b!562992 m!540817))

(declare-fun m!540819 () Bool)

(assert (=> b!562988 m!540819))

(declare-fun m!540821 () Bool)

(assert (=> b!562984 m!540821))

(declare-fun m!540823 () Bool)

(assert (=> b!562990 m!540823))

(declare-fun m!540825 () Bool)

(assert (=> b!562990 m!540825))

(check-sat (not b!562993) (not b!562988) (not b!562984) (not b!562992) (not b!562991) (not start!51482) (not b!562990) (not b!562986) (not b!562985) (not b!562987))
(check-sat)
