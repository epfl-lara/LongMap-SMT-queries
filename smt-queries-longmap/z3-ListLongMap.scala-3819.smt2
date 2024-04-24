; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52446 () Bool)

(assert start!52446)

(declare-fun b!571963 () Bool)

(declare-fun res!361378 () Bool)

(declare-fun e!328994 () Bool)

(assert (=> b!571963 (=> (not res!361378) (not e!328994))))

(declare-datatypes ((array!35790 0))(
  ( (array!35791 (arr!17182 (Array (_ BitVec 32) (_ BitVec 64))) (size!17546 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35790)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35790 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571963 (= res!361378 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571964 () Bool)

(declare-fun e!328995 () Bool)

(declare-fun e!328988 () Bool)

(assert (=> b!571964 (= e!328995 e!328988)))

(declare-fun res!361371 () Bool)

(assert (=> b!571964 (=> (not res!361371) (not e!328988))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!260879 () (_ BitVec 32))

(declare-fun lt!260884 () (_ BitVec 64))

(declare-fun lt!260885 () array!35790)

(declare-datatypes ((SeekEntryResult!5587 0))(
  ( (MissingZero!5587 (index!24575 (_ BitVec 32))) (Found!5587 (index!24576 (_ BitVec 32))) (Intermediate!5587 (undefined!6399 Bool) (index!24577 (_ BitVec 32)) (x!53603 (_ BitVec 32))) (Undefined!5587) (MissingVacant!5587 (index!24578 (_ BitVec 32))) )
))
(declare-fun lt!260886 () SeekEntryResult!5587)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35790 (_ BitVec 32)) SeekEntryResult!5587)

(assert (=> b!571964 (= res!361371 (= lt!260886 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260879 lt!260884 lt!260885 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!260880 () (_ BitVec 32))

(assert (=> b!571964 (= lt!260886 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260880 (select (arr!17182 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571964 (= lt!260879 (toIndex!0 lt!260884 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571964 (= lt!260884 (select (store (arr!17182 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!571964 (= lt!260880 (toIndex!0 (select (arr!17182 a!3118) j!142) mask!3119))))

(assert (=> b!571964 (= lt!260885 (array!35791 (store (arr!17182 a!3118) i!1132 k0!1914) (size!17546 a!3118)))))

(declare-fun b!571965 () Bool)

(declare-fun res!361375 () Bool)

(assert (=> b!571965 (=> (not res!361375) (not e!328994))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571965 (= res!361375 (validKeyInArray!0 k0!1914))))

(declare-fun b!571966 () Bool)

(assert (=> b!571966 (= e!328994 e!328995)))

(declare-fun res!361372 () Bool)

(assert (=> b!571966 (=> (not res!361372) (not e!328995))))

(declare-fun lt!260887 () SeekEntryResult!5587)

(assert (=> b!571966 (= res!361372 (or (= lt!260887 (MissingZero!5587 i!1132)) (= lt!260887 (MissingVacant!5587 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35790 (_ BitVec 32)) SeekEntryResult!5587)

(assert (=> b!571966 (= lt!260887 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!361373 () Bool)

(assert (=> start!52446 (=> (not res!361373) (not e!328994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52446 (= res!361373 (validMask!0 mask!3119))))

(assert (=> start!52446 e!328994))

(assert (=> start!52446 true))

(declare-fun array_inv!13041 (array!35790) Bool)

(assert (=> start!52446 (array_inv!13041 a!3118)))

(declare-fun e!328989 () Bool)

(declare-fun b!571967 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35790 (_ BitVec 32)) SeekEntryResult!5587)

(assert (=> b!571967 (= e!328989 (= (seekEntryOrOpen!0 lt!260884 lt!260885 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53603 lt!260886) (index!24577 lt!260886) (index!24577 lt!260886) lt!260884 lt!260885 mask!3119)))))

(declare-fun b!571968 () Bool)

(declare-fun res!361377 () Bool)

(assert (=> b!571968 (=> (not res!361377) (not e!328995))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35790 (_ BitVec 32)) Bool)

(assert (=> b!571968 (= res!361377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571969 () Bool)

(declare-fun e!328992 () Bool)

(assert (=> b!571969 (= e!328992 e!328989)))

(declare-fun res!361368 () Bool)

(assert (=> b!571969 (=> (not res!361368) (not e!328989))))

(declare-fun lt!260883 () SeekEntryResult!5587)

(assert (=> b!571969 (= res!361368 (= lt!260883 (seekKeyOrZeroReturnVacant!0 (x!53603 lt!260886) (index!24577 lt!260886) (index!24577 lt!260886) (select (arr!17182 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571970 () Bool)

(declare-fun e!328991 () Bool)

(assert (=> b!571970 (= e!328991 e!328992)))

(declare-fun res!361367 () Bool)

(assert (=> b!571970 (=> res!361367 e!328992)))

(declare-fun lt!260881 () (_ BitVec 64))

(assert (=> b!571970 (= res!361367 (or (= lt!260881 (select (arr!17182 a!3118) j!142)) (= lt!260881 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571970 (= lt!260881 (select (arr!17182 a!3118) (index!24577 lt!260886)))))

(declare-fun b!571971 () Bool)

(assert (=> b!571971 (= e!328988 (not true))))

(declare-fun e!328993 () Bool)

(assert (=> b!571971 e!328993))

(declare-fun res!361374 () Bool)

(assert (=> b!571971 (=> (not res!361374) (not e!328993))))

(assert (=> b!571971 (= res!361374 (= lt!260883 (Found!5587 j!142)))))

(assert (=> b!571971 (= lt!260883 (seekEntryOrOpen!0 (select (arr!17182 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!571971 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17947 0))(
  ( (Unit!17948) )
))
(declare-fun lt!260882 () Unit!17947)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17947)

(assert (=> b!571971 (= lt!260882 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571972 () Bool)

(declare-fun res!361366 () Bool)

(assert (=> b!571972 (=> (not res!361366) (not e!328994))))

(assert (=> b!571972 (= res!361366 (and (= (size!17546 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17546 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17546 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571973 () Bool)

(declare-fun res!361369 () Bool)

(assert (=> b!571973 (=> (not res!361369) (not e!328995))))

(declare-datatypes ((List!11169 0))(
  ( (Nil!11166) (Cons!11165 (h!12195 (_ BitVec 64)) (t!17389 List!11169)) )
))
(declare-fun arrayNoDuplicates!0 (array!35790 (_ BitVec 32) List!11169) Bool)

(assert (=> b!571973 (= res!361369 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11166))))

(declare-fun b!571974 () Bool)

(declare-fun res!361376 () Bool)

(assert (=> b!571974 (=> (not res!361376) (not e!328994))))

(assert (=> b!571974 (= res!361376 (validKeyInArray!0 (select (arr!17182 a!3118) j!142)))))

(declare-fun b!571975 () Bool)

(assert (=> b!571975 (= e!328993 e!328991)))

(declare-fun res!361370 () Bool)

(assert (=> b!571975 (=> res!361370 e!328991)))

(get-info :version)

(assert (=> b!571975 (= res!361370 (or (undefined!6399 lt!260886) (not ((_ is Intermediate!5587) lt!260886))))))

(assert (= (and start!52446 res!361373) b!571972))

(assert (= (and b!571972 res!361366) b!571974))

(assert (= (and b!571974 res!361376) b!571965))

(assert (= (and b!571965 res!361375) b!571963))

(assert (= (and b!571963 res!361378) b!571966))

(assert (= (and b!571966 res!361372) b!571968))

(assert (= (and b!571968 res!361377) b!571973))

(assert (= (and b!571973 res!361369) b!571964))

(assert (= (and b!571964 res!361371) b!571971))

(assert (= (and b!571971 res!361374) b!571975))

(assert (= (and b!571975 (not res!361370)) b!571970))

(assert (= (and b!571970 (not res!361367)) b!571969))

(assert (= (and b!571969 res!361368) b!571967))

(declare-fun m!550991 () Bool)

(assert (=> b!571974 m!550991))

(assert (=> b!571974 m!550991))

(declare-fun m!550993 () Bool)

(assert (=> b!571974 m!550993))

(declare-fun m!550995 () Bool)

(assert (=> b!571967 m!550995))

(declare-fun m!550997 () Bool)

(assert (=> b!571967 m!550997))

(declare-fun m!550999 () Bool)

(assert (=> b!571963 m!550999))

(assert (=> b!571971 m!550991))

(assert (=> b!571971 m!550991))

(declare-fun m!551001 () Bool)

(assert (=> b!571971 m!551001))

(declare-fun m!551003 () Bool)

(assert (=> b!571971 m!551003))

(declare-fun m!551005 () Bool)

(assert (=> b!571971 m!551005))

(assert (=> b!571970 m!550991))

(declare-fun m!551007 () Bool)

(assert (=> b!571970 m!551007))

(declare-fun m!551009 () Bool)

(assert (=> b!571973 m!551009))

(declare-fun m!551011 () Bool)

(assert (=> b!571965 m!551011))

(declare-fun m!551013 () Bool)

(assert (=> start!52446 m!551013))

(declare-fun m!551015 () Bool)

(assert (=> start!52446 m!551015))

(assert (=> b!571964 m!550991))

(declare-fun m!551017 () Bool)

(assert (=> b!571964 m!551017))

(declare-fun m!551019 () Bool)

(assert (=> b!571964 m!551019))

(assert (=> b!571964 m!550991))

(declare-fun m!551021 () Bool)

(assert (=> b!571964 m!551021))

(declare-fun m!551023 () Bool)

(assert (=> b!571964 m!551023))

(declare-fun m!551025 () Bool)

(assert (=> b!571964 m!551025))

(declare-fun m!551027 () Bool)

(assert (=> b!571964 m!551027))

(assert (=> b!571964 m!550991))

(declare-fun m!551029 () Bool)

(assert (=> b!571968 m!551029))

(declare-fun m!551031 () Bool)

(assert (=> b!571966 m!551031))

(assert (=> b!571969 m!550991))

(assert (=> b!571969 m!550991))

(declare-fun m!551033 () Bool)

(assert (=> b!571969 m!551033))

(check-sat (not b!571971) (not b!571974) (not b!571963) (not b!571967) (not b!571966) (not b!571973) (not b!571964) (not b!571965) (not b!571968) (not b!571969) (not start!52446))
(check-sat)
