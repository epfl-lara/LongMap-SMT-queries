; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52268 () Bool)

(assert start!52268)

(declare-fun b!570153 () Bool)

(declare-fun e!327902 () Bool)

(declare-fun e!327901 () Bool)

(assert (=> b!570153 (= e!327902 e!327901)))

(declare-fun res!360078 () Bool)

(assert (=> b!570153 (=> (not res!360078) (not e!327901))))

(declare-datatypes ((SeekEntryResult!5605 0))(
  ( (MissingZero!5605 (index!24647 (_ BitVec 32))) (Found!5605 (index!24648 (_ BitVec 32))) (Intermediate!5605 (undefined!6417 Bool) (index!24649 (_ BitVec 32)) (x!53532 (_ BitVec 32))) (Undefined!5605) (MissingVacant!5605 (index!24650 (_ BitVec 32))) )
))
(declare-fun lt!259792 () SeekEntryResult!5605)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!570153 (= res!360078 (or (= lt!259792 (MissingZero!5605 i!1132)) (= lt!259792 (MissingVacant!5605 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35737 0))(
  ( (array!35738 (arr!17159 (Array (_ BitVec 32) (_ BitVec 64))) (size!17524 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35737)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35737 (_ BitVec 32)) SeekEntryResult!5605)

(assert (=> b!570153 (= lt!259792 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!570154 () Bool)

(declare-fun res!360084 () Bool)

(assert (=> b!570154 (=> (not res!360084) (not e!327902))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!570154 (= res!360084 (validKeyInArray!0 (select (arr!17159 a!3118) j!142)))))

(declare-fun b!570155 () Bool)

(declare-fun lt!259791 () SeekEntryResult!5605)

(declare-fun lt!259794 () SeekEntryResult!5605)

(declare-fun e!327905 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35737 (_ BitVec 32)) SeekEntryResult!5605)

(assert (=> b!570155 (= e!327905 (= lt!259794 (seekKeyOrZeroReturnVacant!0 (x!53532 lt!259791) (index!24649 lt!259791) (index!24649 lt!259791) (select (arr!17159 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!570156 () Bool)

(declare-fun res!360082 () Bool)

(assert (=> b!570156 (=> (not res!360082) (not e!327901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35737 (_ BitVec 32)) Bool)

(assert (=> b!570156 (= res!360082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!570157 () Bool)

(declare-fun e!327903 () Bool)

(assert (=> b!570157 (= e!327903 (not true))))

(declare-fun e!327906 () Bool)

(assert (=> b!570157 e!327906))

(declare-fun res!360083 () Bool)

(assert (=> b!570157 (=> (not res!360083) (not e!327906))))

(assert (=> b!570157 (= res!360083 (= lt!259794 (Found!5605 j!142)))))

(assert (=> b!570157 (= lt!259794 (seekEntryOrOpen!0 (select (arr!17159 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!570157 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17898 0))(
  ( (Unit!17899) )
))
(declare-fun lt!259790 () Unit!17898)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35737 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17898)

(assert (=> b!570157 (= lt!259790 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!570158 () Bool)

(declare-fun res!360086 () Bool)

(assert (=> b!570158 (=> (not res!360086) (not e!327902))))

(declare-fun arrayContainsKey!0 (array!35737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!570158 (= res!360086 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!360085 () Bool)

(assert (=> start!52268 (=> (not res!360085) (not e!327902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52268 (= res!360085 (validMask!0 mask!3119))))

(assert (=> start!52268 e!327902))

(assert (=> start!52268 true))

(declare-fun array_inv!13042 (array!35737) Bool)

(assert (=> start!52268 (array_inv!13042 a!3118)))

(declare-fun b!570159 () Bool)

(declare-fun res!360077 () Bool)

(assert (=> b!570159 (=> (not res!360077) (not e!327902))))

(assert (=> b!570159 (= res!360077 (validKeyInArray!0 k0!1914))))

(declare-fun b!570160 () Bool)

(assert (=> b!570160 (= e!327901 e!327903)))

(declare-fun res!360079 () Bool)

(assert (=> b!570160 (=> (not res!360079) (not e!327903))))

(declare-fun lt!259795 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35737 (_ BitVec 32)) SeekEntryResult!5605)

(assert (=> b!570160 (= res!360079 (= lt!259791 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259795 (select (store (arr!17159 a!3118) i!1132 k0!1914) j!142) (array!35738 (store (arr!17159 a!3118) i!1132 k0!1914) (size!17524 a!3118)) mask!3119)))))

(declare-fun lt!259793 () (_ BitVec 32))

(assert (=> b!570160 (= lt!259791 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259793 (select (arr!17159 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!570160 (= lt!259795 (toIndex!0 (select (store (arr!17159 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!570160 (= lt!259793 (toIndex!0 (select (arr!17159 a!3118) j!142) mask!3119))))

(declare-fun b!570161 () Bool)

(declare-fun res!360080 () Bool)

(assert (=> b!570161 (=> (not res!360080) (not e!327902))))

(assert (=> b!570161 (= res!360080 (and (= (size!17524 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17524 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17524 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!570162 () Bool)

(declare-fun res!360076 () Bool)

(assert (=> b!570162 (=> (not res!360076) (not e!327901))))

(declare-datatypes ((List!11278 0))(
  ( (Nil!11275) (Cons!11274 (h!12298 (_ BitVec 64)) (t!17497 List!11278)) )
))
(declare-fun arrayNoDuplicates!0 (array!35737 (_ BitVec 32) List!11278) Bool)

(assert (=> b!570162 (= res!360076 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11275))))

(declare-fun b!570163 () Bool)

(assert (=> b!570163 (= e!327906 e!327905)))

(declare-fun res!360081 () Bool)

(assert (=> b!570163 (=> res!360081 e!327905)))

(get-info :version)

(assert (=> b!570163 (= res!360081 (or (undefined!6417 lt!259791) (not ((_ is Intermediate!5605) lt!259791)) (= (select (arr!17159 a!3118) (index!24649 lt!259791)) (select (arr!17159 a!3118) j!142)) (= (select (arr!17159 a!3118) (index!24649 lt!259791)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!52268 res!360085) b!570161))

(assert (= (and b!570161 res!360080) b!570154))

(assert (= (and b!570154 res!360084) b!570159))

(assert (= (and b!570159 res!360077) b!570158))

(assert (= (and b!570158 res!360086) b!570153))

(assert (= (and b!570153 res!360078) b!570156))

(assert (= (and b!570156 res!360082) b!570162))

(assert (= (and b!570162 res!360076) b!570160))

(assert (= (and b!570160 res!360079) b!570157))

(assert (= (and b!570157 res!360083) b!570163))

(assert (= (and b!570163 (not res!360081)) b!570155))

(declare-fun m!548477 () Bool)

(assert (=> b!570154 m!548477))

(assert (=> b!570154 m!548477))

(declare-fun m!548479 () Bool)

(assert (=> b!570154 m!548479))

(assert (=> b!570155 m!548477))

(assert (=> b!570155 m!548477))

(declare-fun m!548481 () Bool)

(assert (=> b!570155 m!548481))

(declare-fun m!548483 () Bool)

(assert (=> b!570156 m!548483))

(declare-fun m!548485 () Bool)

(assert (=> b!570153 m!548485))

(declare-fun m!548487 () Bool)

(assert (=> start!52268 m!548487))

(declare-fun m!548489 () Bool)

(assert (=> start!52268 m!548489))

(declare-fun m!548491 () Bool)

(assert (=> b!570158 m!548491))

(declare-fun m!548493 () Bool)

(assert (=> b!570159 m!548493))

(declare-fun m!548495 () Bool)

(assert (=> b!570162 m!548495))

(assert (=> b!570157 m!548477))

(assert (=> b!570157 m!548477))

(declare-fun m!548497 () Bool)

(assert (=> b!570157 m!548497))

(declare-fun m!548499 () Bool)

(assert (=> b!570157 m!548499))

(declare-fun m!548501 () Bool)

(assert (=> b!570157 m!548501))

(declare-fun m!548503 () Bool)

(assert (=> b!570163 m!548503))

(assert (=> b!570163 m!548477))

(assert (=> b!570160 m!548477))

(declare-fun m!548505 () Bool)

(assert (=> b!570160 m!548505))

(assert (=> b!570160 m!548477))

(declare-fun m!548507 () Bool)

(assert (=> b!570160 m!548507))

(assert (=> b!570160 m!548477))

(declare-fun m!548509 () Bool)

(assert (=> b!570160 m!548509))

(declare-fun m!548511 () Bool)

(assert (=> b!570160 m!548511))

(assert (=> b!570160 m!548509))

(declare-fun m!548513 () Bool)

(assert (=> b!570160 m!548513))

(assert (=> b!570160 m!548509))

(declare-fun m!548515 () Bool)

(assert (=> b!570160 m!548515))

(check-sat (not b!570159) (not b!570158) (not b!570155) (not b!570153) (not b!570154) (not start!52268) (not b!570156) (not b!570160) (not b!570162) (not b!570157))
(check-sat)
