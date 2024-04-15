; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52412 () Bool)

(assert start!52412)

(declare-fun b!571960 () Bool)

(declare-datatypes ((SeekEntryResult!5644 0))(
  ( (MissingZero!5644 (index!24803 (_ BitVec 32))) (Found!5644 (index!24804 (_ BitVec 32))) (Intermediate!5644 (undefined!6456 Bool) (index!24805 (_ BitVec 32)) (x!53684 (_ BitVec 32))) (Undefined!5644) (MissingVacant!5644 (index!24806 (_ BitVec 32))) )
))
(declare-fun lt!260861 () SeekEntryResult!5644)

(declare-fun e!328974 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35818 0))(
  ( (array!35819 (arr!17198 (Array (_ BitVec 32) (_ BitVec 64))) (size!17563 (_ BitVec 32))) )
))
(declare-fun lt!260858 () array!35818)

(declare-fun lt!260859 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35818 (_ BitVec 32)) SeekEntryResult!5644)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35818 (_ BitVec 32)) SeekEntryResult!5644)

(assert (=> b!571960 (= e!328974 (= (seekEntryOrOpen!0 lt!260859 lt!260858 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53684 lt!260861) (index!24805 lt!260861) (index!24805 lt!260861) lt!260859 lt!260858 mask!3119)))))

(declare-fun res!361619 () Bool)

(declare-fun e!328979 () Bool)

(assert (=> start!52412 (=> (not res!361619) (not e!328979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52412 (= res!361619 (validMask!0 mask!3119))))

(assert (=> start!52412 e!328979))

(assert (=> start!52412 true))

(declare-fun a!3118 () array!35818)

(declare-fun array_inv!13081 (array!35818) Bool)

(assert (=> start!52412 (array_inv!13081 a!3118)))

(declare-fun b!571961 () Bool)

(declare-fun res!361618 () Bool)

(declare-fun e!328978 () Bool)

(assert (=> b!571961 (=> (not res!361618) (not e!328978))))

(declare-datatypes ((List!11317 0))(
  ( (Nil!11314) (Cons!11313 (h!12340 (_ BitVec 64)) (t!17536 List!11317)) )
))
(declare-fun arrayNoDuplicates!0 (array!35818 (_ BitVec 32) List!11317) Bool)

(assert (=> b!571961 (= res!361618 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11314))))

(declare-fun b!571962 () Bool)

(declare-fun res!361620 () Bool)

(assert (=> b!571962 (=> (not res!361620) (not e!328979))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!571962 (= res!361620 (validKeyInArray!0 k0!1914))))

(declare-fun b!571963 () Bool)

(declare-fun res!361621 () Bool)

(assert (=> b!571963 (=> (not res!361621) (not e!328978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35818 (_ BitVec 32)) Bool)

(assert (=> b!571963 (= res!361621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!571964 () Bool)

(assert (=> b!571964 (= e!328979 e!328978)))

(declare-fun res!361613 () Bool)

(assert (=> b!571964 (=> (not res!361613) (not e!328978))))

(declare-fun lt!260865 () SeekEntryResult!5644)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!571964 (= res!361613 (or (= lt!260865 (MissingZero!5644 i!1132)) (= lt!260865 (MissingVacant!5644 i!1132))))))

(assert (=> b!571964 (= lt!260865 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!571965 () Bool)

(declare-fun e!328973 () Bool)

(assert (=> b!571965 (= e!328978 e!328973)))

(declare-fun res!361617 () Bool)

(assert (=> b!571965 (=> (not res!361617) (not e!328973))))

(declare-fun lt!260863 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35818 (_ BitVec 32)) SeekEntryResult!5644)

(assert (=> b!571965 (= res!361617 (= lt!260861 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260863 lt!260859 lt!260858 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!260860 () (_ BitVec 32))

(assert (=> b!571965 (= lt!260861 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260860 (select (arr!17198 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!571965 (= lt!260863 (toIndex!0 lt!260859 mask!3119))))

(assert (=> b!571965 (= lt!260859 (select (store (arr!17198 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!571965 (= lt!260860 (toIndex!0 (select (arr!17198 a!3118) j!142) mask!3119))))

(assert (=> b!571965 (= lt!260858 (array!35819 (store (arr!17198 a!3118) i!1132 k0!1914) (size!17563 a!3118)))))

(declare-fun b!571966 () Bool)

(declare-fun res!361610 () Bool)

(assert (=> b!571966 (=> (not res!361610) (not e!328979))))

(declare-fun arrayContainsKey!0 (array!35818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!571966 (= res!361610 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!571967 () Bool)

(declare-fun res!361612 () Bool)

(assert (=> b!571967 (=> (not res!361612) (not e!328979))))

(assert (=> b!571967 (= res!361612 (and (= (size!17563 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17563 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17563 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!571968 () Bool)

(declare-fun e!328975 () Bool)

(declare-fun e!328980 () Bool)

(assert (=> b!571968 (= e!328975 e!328980)))

(declare-fun res!361622 () Bool)

(assert (=> b!571968 (=> res!361622 e!328980)))

(get-info :version)

(assert (=> b!571968 (= res!361622 (or (undefined!6456 lt!260861) (not ((_ is Intermediate!5644) lt!260861))))))

(declare-fun b!571969 () Bool)

(assert (=> b!571969 (= e!328973 (not true))))

(assert (=> b!571969 e!328975))

(declare-fun res!361611 () Bool)

(assert (=> b!571969 (=> (not res!361611) (not e!328975))))

(declare-fun lt!260862 () SeekEntryResult!5644)

(assert (=> b!571969 (= res!361611 (= lt!260862 (Found!5644 j!142)))))

(assert (=> b!571969 (= lt!260862 (seekEntryOrOpen!0 (select (arr!17198 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!571969 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17976 0))(
  ( (Unit!17977) )
))
(declare-fun lt!260864 () Unit!17976)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35818 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17976)

(assert (=> b!571969 (= lt!260864 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!571970 () Bool)

(declare-fun e!328977 () Bool)

(assert (=> b!571970 (= e!328977 e!328974)))

(declare-fun res!361616 () Bool)

(assert (=> b!571970 (=> (not res!361616) (not e!328974))))

(assert (=> b!571970 (= res!361616 (= lt!260862 (seekKeyOrZeroReturnVacant!0 (x!53684 lt!260861) (index!24805 lt!260861) (index!24805 lt!260861) (select (arr!17198 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!571971 () Bool)

(assert (=> b!571971 (= e!328980 e!328977)))

(declare-fun res!361615 () Bool)

(assert (=> b!571971 (=> res!361615 e!328977)))

(declare-fun lt!260866 () (_ BitVec 64))

(assert (=> b!571971 (= res!361615 (or (= lt!260866 (select (arr!17198 a!3118) j!142)) (= lt!260866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!571971 (= lt!260866 (select (arr!17198 a!3118) (index!24805 lt!260861)))))

(declare-fun b!571972 () Bool)

(declare-fun res!361614 () Bool)

(assert (=> b!571972 (=> (not res!361614) (not e!328979))))

(assert (=> b!571972 (= res!361614 (validKeyInArray!0 (select (arr!17198 a!3118) j!142)))))

(assert (= (and start!52412 res!361619) b!571967))

(assert (= (and b!571967 res!361612) b!571972))

(assert (= (and b!571972 res!361614) b!571962))

(assert (= (and b!571962 res!361620) b!571966))

(assert (= (and b!571966 res!361610) b!571964))

(assert (= (and b!571964 res!361613) b!571963))

(assert (= (and b!571963 res!361621) b!571961))

(assert (= (and b!571961 res!361618) b!571965))

(assert (= (and b!571965 res!361617) b!571969))

(assert (= (and b!571969 res!361611) b!571968))

(assert (= (and b!571968 (not res!361622)) b!571971))

(assert (= (and b!571971 (not res!361615)) b!571970))

(assert (= (and b!571970 res!361616) b!571960))

(declare-fun m!550409 () Bool)

(assert (=> b!571972 m!550409))

(assert (=> b!571972 m!550409))

(declare-fun m!550411 () Bool)

(assert (=> b!571972 m!550411))

(assert (=> b!571969 m!550409))

(assert (=> b!571969 m!550409))

(declare-fun m!550413 () Bool)

(assert (=> b!571969 m!550413))

(declare-fun m!550415 () Bool)

(assert (=> b!571969 m!550415))

(declare-fun m!550417 () Bool)

(assert (=> b!571969 m!550417))

(declare-fun m!550419 () Bool)

(assert (=> b!571962 m!550419))

(assert (=> b!571971 m!550409))

(declare-fun m!550421 () Bool)

(assert (=> b!571971 m!550421))

(declare-fun m!550423 () Bool)

(assert (=> b!571964 m!550423))

(declare-fun m!550425 () Bool)

(assert (=> start!52412 m!550425))

(declare-fun m!550427 () Bool)

(assert (=> start!52412 m!550427))

(assert (=> b!571965 m!550409))

(declare-fun m!550429 () Bool)

(assert (=> b!571965 m!550429))

(declare-fun m!550431 () Bool)

(assert (=> b!571965 m!550431))

(declare-fun m!550433 () Bool)

(assert (=> b!571965 m!550433))

(declare-fun m!550435 () Bool)

(assert (=> b!571965 m!550435))

(assert (=> b!571965 m!550409))

(declare-fun m!550437 () Bool)

(assert (=> b!571965 m!550437))

(assert (=> b!571965 m!550409))

(declare-fun m!550439 () Bool)

(assert (=> b!571965 m!550439))

(declare-fun m!550441 () Bool)

(assert (=> b!571961 m!550441))

(declare-fun m!550443 () Bool)

(assert (=> b!571963 m!550443))

(declare-fun m!550445 () Bool)

(assert (=> b!571966 m!550445))

(assert (=> b!571970 m!550409))

(assert (=> b!571970 m!550409))

(declare-fun m!550447 () Bool)

(assert (=> b!571970 m!550447))

(declare-fun m!550449 () Bool)

(assert (=> b!571960 m!550449))

(declare-fun m!550451 () Bool)

(assert (=> b!571960 m!550451))

(check-sat (not b!571970) (not b!571960) (not b!571966) (not b!571963) (not b!571961) (not start!52412) (not b!571969) (not b!571965) (not b!571972) (not b!571962) (not b!571964))
(check-sat)
