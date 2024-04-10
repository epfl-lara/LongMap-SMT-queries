; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51478 () Bool)

(assert start!51478)

(declare-fun b!562962 () Bool)

(declare-fun res!354124 () Bool)

(declare-fun e!324438 () Bool)

(assert (=> b!562962 (=> (not res!354124) (not e!324438))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35343 0))(
  ( (array!35344 (arr!16972 (Array (_ BitVec 32) (_ BitVec 64))) (size!17336 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35343)

(assert (=> b!562962 (= res!354124 (and (= (size!17336 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17336 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17336 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562963 () Bool)

(declare-fun e!324442 () Bool)

(assert (=> b!562963 (= e!324442 (bvsge mask!3119 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!5421 0))(
  ( (MissingZero!5421 (index!23911 (_ BitVec 32))) (Found!5421 (index!23912 (_ BitVec 32))) (Intermediate!5421 (undefined!6233 Bool) (index!23913 (_ BitVec 32)) (x!52804 (_ BitVec 32))) (Undefined!5421) (MissingVacant!5421 (index!23914 (_ BitVec 32))) )
))
(declare-fun lt!256850 () SeekEntryResult!5421)

(declare-fun lt!256859 () SeekEntryResult!5421)

(assert (=> b!562963 (= lt!256850 lt!256859)))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun lt!256853 () SeekEntryResult!5421)

(declare-datatypes ((Unit!17616 0))(
  ( (Unit!17617) )
))
(declare-fun lt!256858 () Unit!17616)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!35343 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17616)

(assert (=> b!562963 (= lt!256858 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!3118 i!1132 k0!1914 j!142 (x!52804 lt!256853) (index!23913 lt!256853) (index!23913 lt!256853) mask!3119))))

(declare-fun b!562964 () Bool)

(declare-fun res!354125 () Bool)

(assert (=> b!562964 (=> (not res!354125) (not e!324438))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562964 (= res!354125 (validKeyInArray!0 k0!1914))))

(declare-fun b!562965 () Bool)

(declare-fun res!354117 () Bool)

(declare-fun e!324441 () Bool)

(assert (=> b!562965 (=> (not res!354117) (not e!324441))))

(declare-datatypes ((List!11052 0))(
  ( (Nil!11049) (Cons!11048 (h!12051 (_ BitVec 64)) (t!17280 List!11052)) )
))
(declare-fun arrayNoDuplicates!0 (array!35343 (_ BitVec 32) List!11052) Bool)

(assert (=> b!562965 (= res!354117 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11049))))

(declare-fun b!562966 () Bool)

(declare-fun res!354119 () Bool)

(assert (=> b!562966 (=> (not res!354119) (not e!324438))))

(assert (=> b!562966 (= res!354119 (validKeyInArray!0 (select (arr!16972 a!3118) j!142)))))

(declare-fun b!562967 () Bool)

(declare-fun res!354122 () Bool)

(assert (=> b!562967 (=> (not res!354122) (not e!324441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35343 (_ BitVec 32)) Bool)

(assert (=> b!562967 (= res!354122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!354114 () Bool)

(assert (=> start!51478 (=> (not res!354114) (not e!324438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51478 (= res!354114 (validMask!0 mask!3119))))

(assert (=> start!51478 e!324438))

(assert (=> start!51478 true))

(declare-fun array_inv!12768 (array!35343) Bool)

(assert (=> start!51478 (array_inv!12768 a!3118)))

(declare-fun b!562968 () Bool)

(declare-fun res!354118 () Bool)

(assert (=> b!562968 (=> (not res!354118) (not e!324438))))

(declare-fun arrayContainsKey!0 (array!35343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562968 (= res!354118 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562969 () Bool)

(declare-fun e!324440 () Bool)

(declare-fun e!324443 () Bool)

(assert (=> b!562969 (= e!324440 e!324443)))

(declare-fun res!354121 () Bool)

(assert (=> b!562969 (=> res!354121 e!324443)))

(declare-fun lt!256856 () (_ BitVec 64))

(assert (=> b!562969 (= res!354121 (or (= lt!256856 (select (arr!16972 a!3118) j!142)) (= lt!256856 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562969 (= lt!256856 (select (arr!16972 a!3118) (index!23913 lt!256853)))))

(declare-fun b!562970 () Bool)

(assert (=> b!562970 (= e!324443 e!324442)))

(declare-fun res!354115 () Bool)

(assert (=> b!562970 (=> res!354115 e!324442)))

(declare-fun lt!256852 () SeekEntryResult!5421)

(assert (=> b!562970 (= res!354115 (or (bvslt (index!23913 lt!256853) #b00000000000000000000000000000000) (bvsge (index!23913 lt!256853) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!52804 lt!256853) #b01111111111111111111111111111110) (bvslt (x!52804 lt!256853) #b00000000000000000000000000000000) (not (= lt!256856 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!16972 a!3118) i!1132 k0!1914) (index!23913 lt!256853)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!256850 lt!256852))))))

(declare-fun lt!256857 () SeekEntryResult!5421)

(assert (=> b!562970 (= lt!256857 lt!256859)))

(declare-fun lt!256860 () array!35343)

(declare-fun lt!256854 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35343 (_ BitVec 32)) SeekEntryResult!5421)

(assert (=> b!562970 (= lt!256859 (seekKeyOrZeroReturnVacant!0 (x!52804 lt!256853) (index!23913 lt!256853) (index!23913 lt!256853) lt!256854 lt!256860 mask!3119))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35343 (_ BitVec 32)) SeekEntryResult!5421)

(assert (=> b!562970 (= lt!256857 (seekEntryOrOpen!0 lt!256854 lt!256860 mask!3119))))

(declare-fun lt!256855 () SeekEntryResult!5421)

(assert (=> b!562970 (= lt!256855 lt!256850)))

(assert (=> b!562970 (= lt!256850 (seekKeyOrZeroReturnVacant!0 (x!52804 lt!256853) (index!23913 lt!256853) (index!23913 lt!256853) (select (arr!16972 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!562971 () Bool)

(declare-fun e!324439 () Bool)

(assert (=> b!562971 (= e!324441 e!324439)))

(declare-fun res!354120 () Bool)

(assert (=> b!562971 (=> (not res!354120) (not e!324439))))

(declare-fun lt!256851 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35343 (_ BitVec 32)) SeekEntryResult!5421)

(assert (=> b!562971 (= res!354120 (= lt!256853 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256851 lt!256854 lt!256860 mask!3119)))))

(declare-fun lt!256861 () (_ BitVec 32))

(assert (=> b!562971 (= lt!256853 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!256861 (select (arr!16972 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562971 (= lt!256851 (toIndex!0 lt!256854 mask!3119))))

(assert (=> b!562971 (= lt!256854 (select (store (arr!16972 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562971 (= lt!256861 (toIndex!0 (select (arr!16972 a!3118) j!142) mask!3119))))

(assert (=> b!562971 (= lt!256860 (array!35344 (store (arr!16972 a!3118) i!1132 k0!1914) (size!17336 a!3118)))))

(declare-fun b!562972 () Bool)

(assert (=> b!562972 (= e!324438 e!324441)))

(declare-fun res!354116 () Bool)

(assert (=> b!562972 (=> (not res!354116) (not e!324441))))

(declare-fun lt!256849 () SeekEntryResult!5421)

(assert (=> b!562972 (= res!354116 (or (= lt!256849 (MissingZero!5421 i!1132)) (= lt!256849 (MissingVacant!5421 i!1132))))))

(assert (=> b!562972 (= lt!256849 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!562973 () Bool)

(assert (=> b!562973 (= e!324439 (not e!324440))))

(declare-fun res!354123 () Bool)

(assert (=> b!562973 (=> res!354123 e!324440)))

(get-info :version)

(assert (=> b!562973 (= res!354123 (or (undefined!6233 lt!256853) (not ((_ is Intermediate!5421) lt!256853))))))

(assert (=> b!562973 (= lt!256855 lt!256852)))

(assert (=> b!562973 (= lt!256852 (Found!5421 j!142))))

(assert (=> b!562973 (= lt!256855 (seekEntryOrOpen!0 (select (arr!16972 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!562973 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!256848 () Unit!17616)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35343 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17616)

(assert (=> b!562973 (= lt!256848 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51478 res!354114) b!562962))

(assert (= (and b!562962 res!354124) b!562966))

(assert (= (and b!562966 res!354119) b!562964))

(assert (= (and b!562964 res!354125) b!562968))

(assert (= (and b!562968 res!354118) b!562972))

(assert (= (and b!562972 res!354116) b!562967))

(assert (= (and b!562967 res!354122) b!562965))

(assert (= (and b!562965 res!354117) b!562971))

(assert (= (and b!562971 res!354120) b!562973))

(assert (= (and b!562973 (not res!354123)) b!562969))

(assert (= (and b!562969 (not res!354121)) b!562970))

(assert (= (and b!562970 (not res!354115)) b!562963))

(declare-fun m!541173 () Bool)

(assert (=> start!51478 m!541173))

(declare-fun m!541175 () Bool)

(assert (=> start!51478 m!541175))

(declare-fun m!541177 () Bool)

(assert (=> b!562972 m!541177))

(declare-fun m!541179 () Bool)

(assert (=> b!562970 m!541179))

(declare-fun m!541181 () Bool)

(assert (=> b!562970 m!541181))

(declare-fun m!541183 () Bool)

(assert (=> b!562970 m!541183))

(declare-fun m!541185 () Bool)

(assert (=> b!562970 m!541185))

(assert (=> b!562970 m!541179))

(declare-fun m!541187 () Bool)

(assert (=> b!562970 m!541187))

(declare-fun m!541189 () Bool)

(assert (=> b!562970 m!541189))

(declare-fun m!541191 () Bool)

(assert (=> b!562963 m!541191))

(assert (=> b!562969 m!541179))

(declare-fun m!541193 () Bool)

(assert (=> b!562969 m!541193))

(assert (=> b!562971 m!541179))

(declare-fun m!541195 () Bool)

(assert (=> b!562971 m!541195))

(declare-fun m!541197 () Bool)

(assert (=> b!562971 m!541197))

(assert (=> b!562971 m!541179))

(assert (=> b!562971 m!541179))

(declare-fun m!541199 () Bool)

(assert (=> b!562971 m!541199))

(assert (=> b!562971 m!541181))

(declare-fun m!541201 () Bool)

(assert (=> b!562971 m!541201))

(declare-fun m!541203 () Bool)

(assert (=> b!562971 m!541203))

(assert (=> b!562966 m!541179))

(assert (=> b!562966 m!541179))

(declare-fun m!541205 () Bool)

(assert (=> b!562966 m!541205))

(assert (=> b!562973 m!541179))

(assert (=> b!562973 m!541179))

(declare-fun m!541207 () Bool)

(assert (=> b!562973 m!541207))

(declare-fun m!541209 () Bool)

(assert (=> b!562973 m!541209))

(declare-fun m!541211 () Bool)

(assert (=> b!562973 m!541211))

(declare-fun m!541213 () Bool)

(assert (=> b!562964 m!541213))

(declare-fun m!541215 () Bool)

(assert (=> b!562968 m!541215))

(declare-fun m!541217 () Bool)

(assert (=> b!562965 m!541217))

(declare-fun m!541219 () Bool)

(assert (=> b!562967 m!541219))

(check-sat (not b!562970) (not start!51478) (not b!562965) (not b!562971) (not b!562963) (not b!562966) (not b!562972) (not b!562973) (not b!562964) (not b!562967) (not b!562968))
(check-sat)
