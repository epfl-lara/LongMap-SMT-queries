; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51468 () Bool)

(assert start!51468)

(declare-fun b!562120 () Bool)

(declare-fun e!323947 () Bool)

(declare-fun e!323949 () Bool)

(assert (=> b!562120 (= e!323947 e!323949)))

(declare-fun res!353170 () Bool)

(assert (=> b!562120 (=> (not res!353170) (not e!323949))))

(declare-datatypes ((array!35280 0))(
  ( (array!35281 (arr!16939 (Array (_ BitVec 32) (_ BitVec 64))) (size!17303 (_ BitVec 32))) )
))
(declare-fun lt!255960 () array!35280)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5344 0))(
  ( (MissingZero!5344 (index!23603 (_ BitVec 32))) (Found!5344 (index!23604 (_ BitVec 32))) (Intermediate!5344 (undefined!6156 Bool) (index!23605 (_ BitVec 32)) (x!52658 (_ BitVec 32))) (Undefined!5344) (MissingVacant!5344 (index!23606 (_ BitVec 32))) )
))
(declare-fun lt!255956 () SeekEntryResult!5344)

(declare-fun lt!255958 () (_ BitVec 64))

(declare-fun lt!255954 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35280 (_ BitVec 32)) SeekEntryResult!5344)

(assert (=> b!562120 (= res!353170 (= lt!255956 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255954 lt!255958 lt!255960 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun a!3118 () array!35280)

(declare-fun lt!255957 () (_ BitVec 32))

(assert (=> b!562120 (= lt!255956 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255957 (select (arr!16939 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!562120 (= lt!255954 (toIndex!0 lt!255958 mask!3119))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!562120 (= lt!255958 (select (store (arr!16939 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!562120 (= lt!255957 (toIndex!0 (select (arr!16939 a!3118) j!142) mask!3119))))

(assert (=> b!562120 (= lt!255960 (array!35281 (store (arr!16939 a!3118) i!1132 k0!1914) (size!17303 a!3118)))))

(declare-fun b!562121 () Bool)

(declare-fun res!353179 () Bool)

(declare-fun e!323950 () Bool)

(assert (=> b!562121 (=> (not res!353179) (not e!323950))))

(assert (=> b!562121 (= res!353179 (and (= (size!17303 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17303 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17303 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!562122 () Bool)

(declare-fun res!353174 () Bool)

(assert (=> b!562122 (=> (not res!353174) (not e!323947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35280 (_ BitVec 32)) Bool)

(assert (=> b!562122 (= res!353174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!562123 () Bool)

(declare-fun e!323945 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35280 (_ BitVec 32)) SeekEntryResult!5344)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35280 (_ BitVec 32)) SeekEntryResult!5344)

(assert (=> b!562123 (= e!323945 (= (seekEntryOrOpen!0 lt!255958 lt!255960 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52658 lt!255956) (index!23605 lt!255956) (index!23605 lt!255956) lt!255958 lt!255960 mask!3119)))))

(declare-fun b!562124 () Bool)

(declare-fun e!323948 () Bool)

(assert (=> b!562124 (= e!323948 e!323945)))

(declare-fun res!353178 () Bool)

(assert (=> b!562124 (=> (not res!353178) (not e!323945))))

(declare-fun lt!255959 () SeekEntryResult!5344)

(assert (=> b!562124 (= res!353178 (= lt!255959 (seekKeyOrZeroReturnVacant!0 (x!52658 lt!255956) (index!23605 lt!255956) (index!23605 lt!255956) (select (arr!16939 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!353176 () Bool)

(assert (=> start!51468 (=> (not res!353176) (not e!323950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51468 (= res!353176 (validMask!0 mask!3119))))

(assert (=> start!51468 e!323950))

(assert (=> start!51468 true))

(declare-fun array_inv!12798 (array!35280) Bool)

(assert (=> start!51468 (array_inv!12798 a!3118)))

(declare-fun b!562125 () Bool)

(declare-fun e!323952 () Bool)

(declare-fun e!323946 () Bool)

(assert (=> b!562125 (= e!323952 e!323946)))

(declare-fun res!353173 () Bool)

(assert (=> b!562125 (=> res!353173 e!323946)))

(get-info :version)

(assert (=> b!562125 (= res!353173 (or (undefined!6156 lt!255956) (not ((_ is Intermediate!5344) lt!255956))))))

(declare-fun b!562126 () Bool)

(declare-fun res!353172 () Bool)

(assert (=> b!562126 (=> (not res!353172) (not e!323950))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!562126 (= res!353172 (validKeyInArray!0 (select (arr!16939 a!3118) j!142)))))

(declare-fun b!562127 () Bool)

(declare-fun res!353171 () Bool)

(assert (=> b!562127 (=> (not res!353171) (not e!323950))))

(declare-fun arrayContainsKey!0 (array!35280 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!562127 (= res!353171 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!562128 () Bool)

(declare-fun res!353168 () Bool)

(assert (=> b!562128 (=> (not res!353168) (not e!323950))))

(assert (=> b!562128 (= res!353168 (validKeyInArray!0 k0!1914))))

(declare-fun b!562129 () Bool)

(assert (=> b!562129 (= e!323949 (not true))))

(assert (=> b!562129 e!323952))

(declare-fun res!353177 () Bool)

(assert (=> b!562129 (=> (not res!353177) (not e!323952))))

(assert (=> b!562129 (= res!353177 (= lt!255959 (Found!5344 j!142)))))

(assert (=> b!562129 (= lt!255959 (seekEntryOrOpen!0 (select (arr!16939 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!562129 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17533 0))(
  ( (Unit!17534) )
))
(declare-fun lt!255961 () Unit!17533)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35280 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17533)

(assert (=> b!562129 (= lt!255961 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!562130 () Bool)

(declare-fun res!353169 () Bool)

(assert (=> b!562130 (=> (not res!353169) (not e!323947))))

(declare-datatypes ((List!10926 0))(
  ( (Nil!10923) (Cons!10922 (h!11928 (_ BitVec 64)) (t!17146 List!10926)) )
))
(declare-fun arrayNoDuplicates!0 (array!35280 (_ BitVec 32) List!10926) Bool)

(assert (=> b!562130 (= res!353169 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10923))))

(declare-fun b!562131 () Bool)

(assert (=> b!562131 (= e!323946 e!323948)))

(declare-fun res!353167 () Bool)

(assert (=> b!562131 (=> res!353167 e!323948)))

(declare-fun lt!255955 () (_ BitVec 64))

(assert (=> b!562131 (= res!353167 (or (= lt!255955 (select (arr!16939 a!3118) j!142)) (= lt!255955 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!562131 (= lt!255955 (select (arr!16939 a!3118) (index!23605 lt!255956)))))

(declare-fun b!562132 () Bool)

(assert (=> b!562132 (= e!323950 e!323947)))

(declare-fun res!353175 () Bool)

(assert (=> b!562132 (=> (not res!353175) (not e!323947))))

(declare-fun lt!255953 () SeekEntryResult!5344)

(assert (=> b!562132 (= res!353175 (or (= lt!255953 (MissingZero!5344 i!1132)) (= lt!255953 (MissingVacant!5344 i!1132))))))

(assert (=> b!562132 (= lt!255953 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!51468 res!353176) b!562121))

(assert (= (and b!562121 res!353179) b!562126))

(assert (= (and b!562126 res!353172) b!562128))

(assert (= (and b!562128 res!353168) b!562127))

(assert (= (and b!562127 res!353171) b!562132))

(assert (= (and b!562132 res!353175) b!562122))

(assert (= (and b!562122 res!353174) b!562130))

(assert (= (and b!562130 res!353169) b!562120))

(assert (= (and b!562120 res!353170) b!562129))

(assert (= (and b!562129 res!353177) b!562125))

(assert (= (and b!562125 (not res!353173)) b!562131))

(assert (= (and b!562131 (not res!353167)) b!562124))

(assert (= (and b!562124 res!353178) b!562123))

(declare-fun m!540215 () Bool)

(assert (=> b!562128 m!540215))

(declare-fun m!540217 () Bool)

(assert (=> b!562123 m!540217))

(declare-fun m!540219 () Bool)

(assert (=> b!562123 m!540219))

(declare-fun m!540221 () Bool)

(assert (=> b!562132 m!540221))

(declare-fun m!540223 () Bool)

(assert (=> b!562126 m!540223))

(assert (=> b!562126 m!540223))

(declare-fun m!540225 () Bool)

(assert (=> b!562126 m!540225))

(assert (=> b!562131 m!540223))

(declare-fun m!540227 () Bool)

(assert (=> b!562131 m!540227))

(assert (=> b!562120 m!540223))

(declare-fun m!540229 () Bool)

(assert (=> b!562120 m!540229))

(assert (=> b!562120 m!540223))

(declare-fun m!540231 () Bool)

(assert (=> b!562120 m!540231))

(declare-fun m!540233 () Bool)

(assert (=> b!562120 m!540233))

(assert (=> b!562120 m!540223))

(declare-fun m!540235 () Bool)

(assert (=> b!562120 m!540235))

(declare-fun m!540237 () Bool)

(assert (=> b!562120 m!540237))

(declare-fun m!540239 () Bool)

(assert (=> b!562120 m!540239))

(declare-fun m!540241 () Bool)

(assert (=> b!562130 m!540241))

(declare-fun m!540243 () Bool)

(assert (=> b!562127 m!540243))

(assert (=> b!562129 m!540223))

(assert (=> b!562129 m!540223))

(declare-fun m!540245 () Bool)

(assert (=> b!562129 m!540245))

(declare-fun m!540247 () Bool)

(assert (=> b!562129 m!540247))

(declare-fun m!540249 () Bool)

(assert (=> b!562129 m!540249))

(assert (=> b!562124 m!540223))

(assert (=> b!562124 m!540223))

(declare-fun m!540251 () Bool)

(assert (=> b!562124 m!540251))

(declare-fun m!540253 () Bool)

(assert (=> start!51468 m!540253))

(declare-fun m!540255 () Bool)

(assert (=> start!51468 m!540255))

(declare-fun m!540257 () Bool)

(assert (=> b!562122 m!540257))

(check-sat (not b!562122) (not b!562128) (not b!562127) (not start!51468) (not b!562123) (not b!562120) (not b!562132) (not b!562130) (not b!562126) (not b!562129) (not b!562124))
(check-sat)
