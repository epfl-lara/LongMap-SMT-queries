; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52410 () Bool)

(assert start!52410)

(declare-fun b!571958 () Bool)

(declare-fun res!361472 () Bool)

(declare-fun e!328981 () Bool)

(assert (=> b!571958 (=> (not res!361472) (not e!328981))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35807 0))(
  ( (array!35808 (arr!17192 (Array (_ BitVec 32) (_ BitVec 64))) (size!17556 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35807)

(assert (=> b!571958 (= res!361472 (and (= (size!17556 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17556 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17556 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571959 () Bool)

(declare-fun e!328986 () Bool)

(declare-fun e!328985 () Bool)

(assert (=> b!571959 (= e!328986 e!328985)))

(declare-fun res!361475 () Bool)

(assert (=> b!571959 (=> res!361475 e!328985)))

(declare-datatypes ((SeekEntryResult!5641 0))(
  ( (MissingZero!5641 (index!24791 (_ BitVec 32))) (Found!5641 (index!24792 (_ BitVec 32))) (Intermediate!5641 (undefined!6453 Bool) (index!24793 (_ BitVec 32)) (x!53662 (_ BitVec 32))) (Undefined!5641) (MissingVacant!5641 (index!24794 (_ BitVec 32))) )
))
(declare-fun lt!260909 () SeekEntryResult!5641)

(assert (=> b!571959 (= res!361475 (or (undefined!6453 lt!260909) (not (is-Intermediate!5641 lt!260909))))))

(declare-fun b!571960 () Bool)

(declare-fun e!328982 () Bool)

(declare-fun e!328984 () Bool)

(assert (=> b!571960 (= e!328982 e!328984)))

(declare-fun res!361477 () Bool)

(assert (=> b!571960 (=> (not res!361477) (not e!328984))))

(declare-fun lt!260904 () (_ BitVec 32))

(declare-fun lt!260905 () array!35807)

(declare-fun lt!260903 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35807 (_ BitVec 32)) SeekEntryResult!5641)

(assert (=> b!571960 (= res!361477 (= lt!260909 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260904 lt!260903 lt!260905 mask!3119)))))

(declare-fun lt!260908 () (_ BitVec 32))

(assert (=> b!571960 (= lt!260909 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260908 (select (arr!17192 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571960 (= lt!260904 (toIndex!0 lt!260903 mask!3119))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!571960 (= lt!260903 (select (store (arr!17192 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!571960 (= lt!260908 (toIndex!0 (select (arr!17192 a!3118) j!142) mask!3119))))

(assert (=> b!571960 (= lt!260905 (array!35808 (store (arr!17192 a!3118) i!1132 k!1914) (size!17556 a!3118)))))

(declare-fun b!571961 () Bool)

(declare-fun res!361476 () Bool)

(assert (=> b!571961 (=> (not res!361476) (not e!328981))))

(declare-fun arrayContainsKey!0 (array!35807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571961 (= res!361476 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571962 () Bool)

(declare-fun res!361478 () Bool)

(assert (=> b!571962 (=> (not res!361478) (not e!328981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571962 (= res!361478 (validKeyInArray!0 k!1914))))

(declare-fun b!571963 () Bool)

(assert (=> b!571963 (= e!328984 (not true))))

(assert (=> b!571963 e!328986))

(declare-fun res!361469 () Bool)

(assert (=> b!571963 (=> (not res!361469) (not e!328986))))

(declare-fun lt!260910 () SeekEntryResult!5641)

(assert (=> b!571963 (= res!361469 (= lt!260910 (Found!5641 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35807 (_ BitVec 32)) SeekEntryResult!5641)

(assert (=> b!571963 (= lt!260910 (seekEntryOrOpen!0 (select (arr!17192 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35807 (_ BitVec 32)) Bool)

(assert (=> b!571963 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17984 0))(
  ( (Unit!17985) )
))
(declare-fun lt!260911 () Unit!17984)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35807 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17984)

(assert (=> b!571963 (= lt!260911 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!361471 () Bool)

(assert (=> start!52410 (=> (not res!361471) (not e!328981))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52410 (= res!361471 (validMask!0 mask!3119))))

(assert (=> start!52410 e!328981))

(assert (=> start!52410 true))

(declare-fun array_inv!12988 (array!35807) Bool)

(assert (=> start!52410 (array_inv!12988 a!3118)))

(declare-fun b!571964 () Bool)

(declare-fun e!328983 () Bool)

(assert (=> b!571964 (= e!328985 e!328983)))

(declare-fun res!361468 () Bool)

(assert (=> b!571964 (=> res!361468 e!328983)))

(declare-fun lt!260906 () (_ BitVec 64))

(assert (=> b!571964 (= res!361468 (or (= lt!260906 (select (arr!17192 a!3118) j!142)) (= lt!260906 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571964 (= lt!260906 (select (arr!17192 a!3118) (index!24793 lt!260909)))))

(declare-fun b!571965 () Bool)

(declare-fun res!361470 () Bool)

(assert (=> b!571965 (=> (not res!361470) (not e!328981))))

(assert (=> b!571965 (= res!361470 (validKeyInArray!0 (select (arr!17192 a!3118) j!142)))))

(declare-fun b!571966 () Bool)

(declare-fun res!361473 () Bool)

(assert (=> b!571966 (=> (not res!361473) (not e!328982))))

(declare-datatypes ((List!11272 0))(
  ( (Nil!11269) (Cons!11268 (h!12295 (_ BitVec 64)) (t!17500 List!11272)) )
))
(declare-fun arrayNoDuplicates!0 (array!35807 (_ BitVec 32) List!11272) Bool)

(assert (=> b!571966 (= res!361473 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11269))))

(declare-fun b!571967 () Bool)

(declare-fun res!361466 () Bool)

(assert (=> b!571967 (=> (not res!361466) (not e!328982))))

(assert (=> b!571967 (= res!361466 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571968 () Bool)

(assert (=> b!571968 (= e!328981 e!328982)))

(declare-fun res!361467 () Bool)

(assert (=> b!571968 (=> (not res!361467) (not e!328982))))

(declare-fun lt!260907 () SeekEntryResult!5641)

(assert (=> b!571968 (= res!361467 (or (= lt!260907 (MissingZero!5641 i!1132)) (= lt!260907 (MissingVacant!5641 i!1132))))))

(assert (=> b!571968 (= lt!260907 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!571969 () Bool)

(declare-fun e!328979 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35807 (_ BitVec 32)) SeekEntryResult!5641)

(assert (=> b!571969 (= e!328979 (= (seekEntryOrOpen!0 lt!260903 lt!260905 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53662 lt!260909) (index!24793 lt!260909) (index!24793 lt!260909) lt!260903 lt!260905 mask!3119)))))

(declare-fun b!571970 () Bool)

(assert (=> b!571970 (= e!328983 e!328979)))

(declare-fun res!361474 () Bool)

(assert (=> b!571970 (=> (not res!361474) (not e!328979))))

(assert (=> b!571970 (= res!361474 (= lt!260910 (seekKeyOrZeroReturnVacant!0 (x!53662 lt!260909) (index!24793 lt!260909) (index!24793 lt!260909) (select (arr!17192 a!3118) j!142) a!3118 mask!3119)))))

(assert (= (and start!52410 res!361471) b!571958))

(assert (= (and b!571958 res!361472) b!571965))

(assert (= (and b!571965 res!361470) b!571962))

(assert (= (and b!571962 res!361478) b!571961))

(assert (= (and b!571961 res!361476) b!571968))

(assert (= (and b!571968 res!361467) b!571967))

(assert (= (and b!571967 res!361466) b!571966))

(assert (= (and b!571966 res!361473) b!571960))

(assert (= (and b!571960 res!361477) b!571963))

(assert (= (and b!571963 res!361469) b!571959))

(assert (= (and b!571959 (not res!361475)) b!571964))

(assert (= (and b!571964 (not res!361468)) b!571970))

(assert (= (and b!571970 res!361474) b!571969))

(declare-fun m!550873 () Bool)

(assert (=> b!571966 m!550873))

(declare-fun m!550875 () Bool)

(assert (=> b!571970 m!550875))

(assert (=> b!571970 m!550875))

(declare-fun m!550877 () Bool)

(assert (=> b!571970 m!550877))

(declare-fun m!550879 () Bool)

(assert (=> b!571968 m!550879))

(assert (=> b!571960 m!550875))

(declare-fun m!550881 () Bool)

(assert (=> b!571960 m!550881))

(assert (=> b!571960 m!550875))

(declare-fun m!550883 () Bool)

(assert (=> b!571960 m!550883))

(assert (=> b!571960 m!550875))

(declare-fun m!550885 () Bool)

(assert (=> b!571960 m!550885))

(declare-fun m!550887 () Bool)

(assert (=> b!571960 m!550887))

(declare-fun m!550889 () Bool)

(assert (=> b!571960 m!550889))

(declare-fun m!550891 () Bool)

(assert (=> b!571960 m!550891))

(declare-fun m!550893 () Bool)

(assert (=> start!52410 m!550893))

(declare-fun m!550895 () Bool)

(assert (=> start!52410 m!550895))

(declare-fun m!550897 () Bool)

(assert (=> b!571962 m!550897))

(assert (=> b!571965 m!550875))

(assert (=> b!571965 m!550875))

(declare-fun m!550899 () Bool)

(assert (=> b!571965 m!550899))

(assert (=> b!571963 m!550875))

(assert (=> b!571963 m!550875))

(declare-fun m!550901 () Bool)

(assert (=> b!571963 m!550901))

(declare-fun m!550903 () Bool)

(assert (=> b!571963 m!550903))

(declare-fun m!550905 () Bool)

(assert (=> b!571963 m!550905))

(assert (=> b!571964 m!550875))

(declare-fun m!550907 () Bool)

(assert (=> b!571964 m!550907))

(declare-fun m!550909 () Bool)

(assert (=> b!571969 m!550909))

(declare-fun m!550911 () Bool)

(assert (=> b!571969 m!550911))

(declare-fun m!550913 () Bool)

(assert (=> b!571967 m!550913))

(declare-fun m!550915 () Bool)

(assert (=> b!571961 m!550915))

(push 1)

