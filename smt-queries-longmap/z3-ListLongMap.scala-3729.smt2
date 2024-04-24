; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51414 () Bool)

(assert start!51414)

(declare-fun b!561067 () Bool)

(declare-fun res!352116 () Bool)

(declare-fun e!323299 () Bool)

(assert (=> b!561067 (=> (not res!352116) (not e!323299))))

(declare-datatypes ((array!35226 0))(
  ( (array!35227 (arr!16912 (Array (_ BitVec 32) (_ BitVec 64))) (size!17276 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35226)

(declare-datatypes ((List!10899 0))(
  ( (Nil!10896) (Cons!10895 (h!11901 (_ BitVec 64)) (t!17119 List!10899)) )
))
(declare-fun arrayNoDuplicates!0 (array!35226 (_ BitVec 32) List!10899) Bool)

(assert (=> b!561067 (= res!352116 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10896))))

(declare-fun b!561068 () Bool)

(declare-fun res!352123 () Bool)

(declare-fun e!323303 () Bool)

(assert (=> b!561068 (=> (not res!352123) (not e!323303))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561068 (= res!352123 (validKeyInArray!0 (select (arr!16912 a!3118) j!142)))))

(declare-fun b!561069 () Bool)

(declare-fun e!323301 () Bool)

(declare-fun e!323297 () Bool)

(assert (=> b!561069 (= e!323301 e!323297)))

(declare-fun res!352120 () Bool)

(assert (=> b!561069 (=> res!352120 e!323297)))

(declare-datatypes ((SeekEntryResult!5317 0))(
  ( (MissingZero!5317 (index!23495 (_ BitVec 32))) (Found!5317 (index!23496 (_ BitVec 32))) (Intermediate!5317 (undefined!6129 Bool) (index!23497 (_ BitVec 32)) (x!52559 (_ BitVec 32))) (Undefined!5317) (MissingVacant!5317 (index!23498 (_ BitVec 32))) )
))
(declare-fun lt!255228 () SeekEntryResult!5317)

(get-info :version)

(assert (=> b!561069 (= res!352120 (or (undefined!6129 lt!255228) (not ((_ is Intermediate!5317) lt!255228))))))

(declare-fun b!561070 () Bool)

(declare-fun e!323304 () Bool)

(assert (=> b!561070 (= e!323297 e!323304)))

(declare-fun res!352126 () Bool)

(assert (=> b!561070 (=> res!352126 e!323304)))

(declare-fun lt!255226 () (_ BitVec 64))

(assert (=> b!561070 (= res!352126 (or (= lt!255226 (select (arr!16912 a!3118) j!142)) (= lt!255226 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561070 (= lt!255226 (select (arr!16912 a!3118) (index!23497 lt!255228)))))

(declare-fun res!352119 () Bool)

(assert (=> start!51414 (=> (not res!352119) (not e!323303))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51414 (= res!352119 (validMask!0 mask!3119))))

(assert (=> start!51414 e!323303))

(assert (=> start!51414 true))

(declare-fun array_inv!12771 (array!35226) Bool)

(assert (=> start!51414 (array_inv!12771 a!3118)))

(declare-fun b!561071 () Bool)

(declare-fun res!352114 () Bool)

(assert (=> b!561071 (=> (not res!352114) (not e!323303))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!561071 (= res!352114 (validKeyInArray!0 k0!1914))))

(declare-fun b!561072 () Bool)

(declare-fun e!323298 () Bool)

(assert (=> b!561072 (= e!323298 (not true))))

(assert (=> b!561072 e!323301))

(declare-fun res!352118 () Bool)

(assert (=> b!561072 (=> (not res!352118) (not e!323301))))

(declare-fun lt!255232 () SeekEntryResult!5317)

(assert (=> b!561072 (= res!352118 (= lt!255232 (Found!5317 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35226 (_ BitVec 32)) SeekEntryResult!5317)

(assert (=> b!561072 (= lt!255232 (seekEntryOrOpen!0 (select (arr!16912 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35226 (_ BitVec 32)) Bool)

(assert (=> b!561072 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17479 0))(
  ( (Unit!17480) )
))
(declare-fun lt!255230 () Unit!17479)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35226 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17479)

(assert (=> b!561072 (= lt!255230 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561073 () Bool)

(assert (=> b!561073 (= e!323303 e!323299)))

(declare-fun res!352125 () Bool)

(assert (=> b!561073 (=> (not res!352125) (not e!323299))))

(declare-fun lt!255227 () SeekEntryResult!5317)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561073 (= res!352125 (or (= lt!255227 (MissingZero!5317 i!1132)) (= lt!255227 (MissingVacant!5317 i!1132))))))

(assert (=> b!561073 (= lt!255227 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561074 () Bool)

(declare-fun e!323300 () Bool)

(assert (=> b!561074 (= e!323304 e!323300)))

(declare-fun res!352117 () Bool)

(assert (=> b!561074 (=> (not res!352117) (not e!323300))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35226 (_ BitVec 32)) SeekEntryResult!5317)

(assert (=> b!561074 (= res!352117 (= lt!255232 (seekKeyOrZeroReturnVacant!0 (x!52559 lt!255228) (index!23497 lt!255228) (index!23497 lt!255228) (select (arr!16912 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561075 () Bool)

(declare-fun res!352115 () Bool)

(assert (=> b!561075 (=> (not res!352115) (not e!323299))))

(assert (=> b!561075 (= res!352115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun lt!255224 () (_ BitVec 64))

(declare-fun lt!255231 () array!35226)

(declare-fun b!561076 () Bool)

(assert (=> b!561076 (= e!323300 (= (seekEntryOrOpen!0 lt!255224 lt!255231 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52559 lt!255228) (index!23497 lt!255228) (index!23497 lt!255228) lt!255224 lt!255231 mask!3119)))))

(declare-fun b!561077 () Bool)

(declare-fun res!352122 () Bool)

(assert (=> b!561077 (=> (not res!352122) (not e!323303))))

(declare-fun arrayContainsKey!0 (array!35226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561077 (= res!352122 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561078 () Bool)

(declare-fun res!352124 () Bool)

(assert (=> b!561078 (=> (not res!352124) (not e!323303))))

(assert (=> b!561078 (= res!352124 (and (= (size!17276 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17276 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17276 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!561079 () Bool)

(assert (=> b!561079 (= e!323299 e!323298)))

(declare-fun res!352121 () Bool)

(assert (=> b!561079 (=> (not res!352121) (not e!323298))))

(declare-fun lt!255229 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35226 (_ BitVec 32)) SeekEntryResult!5317)

(assert (=> b!561079 (= res!352121 (= lt!255228 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255229 lt!255224 lt!255231 mask!3119)))))

(declare-fun lt!255225 () (_ BitVec 32))

(assert (=> b!561079 (= lt!255228 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255225 (select (arr!16912 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561079 (= lt!255229 (toIndex!0 lt!255224 mask!3119))))

(assert (=> b!561079 (= lt!255224 (select (store (arr!16912 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561079 (= lt!255225 (toIndex!0 (select (arr!16912 a!3118) j!142) mask!3119))))

(assert (=> b!561079 (= lt!255231 (array!35227 (store (arr!16912 a!3118) i!1132 k0!1914) (size!17276 a!3118)))))

(assert (= (and start!51414 res!352119) b!561078))

(assert (= (and b!561078 res!352124) b!561068))

(assert (= (and b!561068 res!352123) b!561071))

(assert (= (and b!561071 res!352114) b!561077))

(assert (= (and b!561077 res!352122) b!561073))

(assert (= (and b!561073 res!352125) b!561075))

(assert (= (and b!561075 res!352115) b!561067))

(assert (= (and b!561067 res!352116) b!561079))

(assert (= (and b!561079 res!352121) b!561072))

(assert (= (and b!561072 res!352118) b!561069))

(assert (= (and b!561069 (not res!352120)) b!561070))

(assert (= (and b!561070 (not res!352126)) b!561074))

(assert (= (and b!561074 res!352117) b!561076))

(declare-fun m!539027 () Bool)

(assert (=> b!561075 m!539027))

(declare-fun m!539029 () Bool)

(assert (=> b!561074 m!539029))

(assert (=> b!561074 m!539029))

(declare-fun m!539031 () Bool)

(assert (=> b!561074 m!539031))

(assert (=> b!561070 m!539029))

(declare-fun m!539033 () Bool)

(assert (=> b!561070 m!539033))

(assert (=> b!561072 m!539029))

(assert (=> b!561072 m!539029))

(declare-fun m!539035 () Bool)

(assert (=> b!561072 m!539035))

(declare-fun m!539037 () Bool)

(assert (=> b!561072 m!539037))

(declare-fun m!539039 () Bool)

(assert (=> b!561072 m!539039))

(declare-fun m!539041 () Bool)

(assert (=> b!561073 m!539041))

(declare-fun m!539043 () Bool)

(assert (=> b!561067 m!539043))

(assert (=> b!561079 m!539029))

(declare-fun m!539045 () Bool)

(assert (=> b!561079 m!539045))

(declare-fun m!539047 () Bool)

(assert (=> b!561079 m!539047))

(assert (=> b!561079 m!539029))

(declare-fun m!539049 () Bool)

(assert (=> b!561079 m!539049))

(declare-fun m!539051 () Bool)

(assert (=> b!561079 m!539051))

(assert (=> b!561079 m!539029))

(declare-fun m!539053 () Bool)

(assert (=> b!561079 m!539053))

(declare-fun m!539055 () Bool)

(assert (=> b!561079 m!539055))

(declare-fun m!539057 () Bool)

(assert (=> start!51414 m!539057))

(declare-fun m!539059 () Bool)

(assert (=> start!51414 m!539059))

(assert (=> b!561068 m!539029))

(assert (=> b!561068 m!539029))

(declare-fun m!539061 () Bool)

(assert (=> b!561068 m!539061))

(declare-fun m!539063 () Bool)

(assert (=> b!561071 m!539063))

(declare-fun m!539065 () Bool)

(assert (=> b!561076 m!539065))

(declare-fun m!539067 () Bool)

(assert (=> b!561076 m!539067))

(declare-fun m!539069 () Bool)

(assert (=> b!561077 m!539069))

(check-sat (not b!561077) (not b!561079) (not b!561076) (not start!51414) (not b!561068) (not b!561067) (not b!561072) (not b!561075) (not b!561073) (not b!561074) (not b!561071))
(check-sat)
