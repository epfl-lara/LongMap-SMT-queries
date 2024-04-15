; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52142 () Bool)

(assert start!52142)

(declare-fun b!568967 () Bool)

(declare-fun res!359128 () Bool)

(declare-fun e!327316 () Bool)

(assert (=> b!568967 (=> (not res!359128) (not e!327316))))

(declare-datatypes ((array!35674 0))(
  ( (array!35675 (arr!17129 (Array (_ BitVec 32) (_ BitVec 64))) (size!17494 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35674)

(declare-datatypes ((List!11248 0))(
  ( (Nil!11245) (Cons!11244 (h!12265 (_ BitVec 64)) (t!17467 List!11248)) )
))
(declare-fun arrayNoDuplicates!0 (array!35674 (_ BitVec 32) List!11248) Bool)

(assert (=> b!568967 (= res!359128 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11245))))

(declare-fun res!359132 () Bool)

(declare-fun e!327315 () Bool)

(assert (=> start!52142 (=> (not res!359132) (not e!327315))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52142 (= res!359132 (validMask!0 mask!3119))))

(assert (=> start!52142 e!327315))

(assert (=> start!52142 true))

(declare-fun array_inv!13012 (array!35674) Bool)

(assert (=> start!52142 (array_inv!13012 a!3118)))

(declare-fun b!568968 () Bool)

(declare-fun res!359133 () Bool)

(assert (=> b!568968 (=> (not res!359133) (not e!327316))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35674 (_ BitVec 32)) Bool)

(assert (=> b!568968 (= res!359133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!568969 () Bool)

(declare-fun e!327318 () Bool)

(assert (=> b!568969 (= e!327316 e!327318)))

(declare-fun res!359127 () Bool)

(assert (=> b!568969 (=> (not res!359127) (not e!327318))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!259177 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5575 0))(
  ( (MissingZero!5575 (index!24527 (_ BitVec 32))) (Found!5575 (index!24528 (_ BitVec 32))) (Intermediate!5575 (undefined!6387 Bool) (index!24529 (_ BitVec 32)) (x!53413 (_ BitVec 32))) (Undefined!5575) (MissingVacant!5575 (index!24530 (_ BitVec 32))) )
))
(declare-fun lt!259176 () SeekEntryResult!5575)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35674 (_ BitVec 32)) SeekEntryResult!5575)

(assert (=> b!568969 (= res!359127 (= lt!259176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259177 (select (store (arr!17129 a!3118) i!1132 k0!1914) j!142) (array!35675 (store (arr!17129 a!3118) i!1132 k0!1914) (size!17494 a!3118)) mask!3119)))))

(declare-fun lt!259178 () (_ BitVec 32))

(assert (=> b!568969 (= lt!259176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!259178 (select (arr!17129 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568969 (= lt!259177 (toIndex!0 (select (store (arr!17129 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!568969 (= lt!259178 (toIndex!0 (select (arr!17129 a!3118) j!142) mask!3119))))

(declare-fun b!568970 () Bool)

(declare-fun res!359129 () Bool)

(assert (=> b!568970 (=> (not res!359129) (not e!327315))))

(assert (=> b!568970 (= res!359129 (and (= (size!17494 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17494 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17494 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!568971 () Bool)

(assert (=> b!568971 (= e!327315 e!327316)))

(declare-fun res!359130 () Bool)

(assert (=> b!568971 (=> (not res!359130) (not e!327316))))

(declare-fun lt!259179 () SeekEntryResult!5575)

(assert (=> b!568971 (= res!359130 (or (= lt!259179 (MissingZero!5575 i!1132)) (= lt!259179 (MissingVacant!5575 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35674 (_ BitVec 32)) SeekEntryResult!5575)

(assert (=> b!568971 (= lt!259179 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!568972 () Bool)

(declare-fun res!359134 () Bool)

(assert (=> b!568972 (=> (not res!359134) (not e!327315))))

(declare-fun arrayContainsKey!0 (array!35674 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568972 (= res!359134 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!568973 () Bool)

(declare-fun res!359135 () Bool)

(assert (=> b!568973 (=> (not res!359135) (not e!327315))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568973 (= res!359135 (validKeyInArray!0 (select (arr!17129 a!3118) j!142)))))

(declare-fun b!568974 () Bool)

(declare-fun res!359131 () Bool)

(assert (=> b!568974 (=> (not res!359131) (not e!327315))))

(assert (=> b!568974 (= res!359131 (validKeyInArray!0 k0!1914))))

(declare-fun b!568975 () Bool)

(assert (=> b!568975 (= e!327318 (not true))))

(declare-fun lt!259175 () SeekEntryResult!5575)

(get-info :version)

(assert (=> b!568975 (and (= lt!259175 (Found!5575 j!142)) (or (undefined!6387 lt!259176) (not ((_ is Intermediate!5575) lt!259176)) (= (select (arr!17129 a!3118) (index!24529 lt!259176)) (select (arr!17129 a!3118) j!142)) (not (= (select (arr!17129 a!3118) (index!24529 lt!259176)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!259175 (MissingZero!5575 (index!24529 lt!259176)))))))

(assert (=> b!568975 (= lt!259175 (seekEntryOrOpen!0 (select (arr!17129 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!568975 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17838 0))(
  ( (Unit!17839) )
))
(declare-fun lt!259180 () Unit!17838)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35674 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17838)

(assert (=> b!568975 (= lt!259180 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52142 res!359132) b!568970))

(assert (= (and b!568970 res!359129) b!568973))

(assert (= (and b!568973 res!359135) b!568974))

(assert (= (and b!568974 res!359131) b!568972))

(assert (= (and b!568972 res!359134) b!568971))

(assert (= (and b!568971 res!359130) b!568968))

(assert (= (and b!568968 res!359133) b!568967))

(assert (= (and b!568967 res!359128) b!568969))

(assert (= (and b!568969 res!359127) b!568975))

(declare-fun m!547115 () Bool)

(assert (=> b!568968 m!547115))

(declare-fun m!547117 () Bool)

(assert (=> b!568973 m!547117))

(assert (=> b!568973 m!547117))

(declare-fun m!547119 () Bool)

(assert (=> b!568973 m!547119))

(assert (=> b!568969 m!547117))

(declare-fun m!547121 () Bool)

(assert (=> b!568969 m!547121))

(declare-fun m!547123 () Bool)

(assert (=> b!568969 m!547123))

(declare-fun m!547125 () Bool)

(assert (=> b!568969 m!547125))

(assert (=> b!568969 m!547117))

(assert (=> b!568969 m!547123))

(assert (=> b!568969 m!547117))

(declare-fun m!547127 () Bool)

(assert (=> b!568969 m!547127))

(declare-fun m!547129 () Bool)

(assert (=> b!568969 m!547129))

(assert (=> b!568969 m!547123))

(declare-fun m!547131 () Bool)

(assert (=> b!568969 m!547131))

(declare-fun m!547133 () Bool)

(assert (=> b!568971 m!547133))

(declare-fun m!547135 () Bool)

(assert (=> b!568972 m!547135))

(declare-fun m!547137 () Bool)

(assert (=> b!568974 m!547137))

(assert (=> b!568975 m!547117))

(declare-fun m!547139 () Bool)

(assert (=> b!568975 m!547139))

(declare-fun m!547141 () Bool)

(assert (=> b!568975 m!547141))

(declare-fun m!547143 () Bool)

(assert (=> b!568975 m!547143))

(assert (=> b!568975 m!547117))

(declare-fun m!547145 () Bool)

(assert (=> b!568975 m!547145))

(declare-fun m!547147 () Bool)

(assert (=> start!52142 m!547147))

(declare-fun m!547149 () Bool)

(assert (=> start!52142 m!547149))

(declare-fun m!547151 () Bool)

(assert (=> b!568967 m!547151))

(check-sat (not b!568974) (not b!568975) (not b!568973) (not b!568971) (not b!568972) (not b!568969) (not b!568968) (not b!568967) (not start!52142))
(check-sat)
