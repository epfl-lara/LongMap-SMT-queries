; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52500 () Bool)

(assert start!52500)

(declare-fun b!573016 () Bool)

(declare-fun res!362426 () Bool)

(declare-fun e!329637 () Bool)

(assert (=> b!573016 (=> (not res!362426) (not e!329637))))

(declare-datatypes ((array!35844 0))(
  ( (array!35845 (arr!17209 (Array (_ BitVec 32) (_ BitVec 64))) (size!17573 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35844)

(declare-datatypes ((List!11196 0))(
  ( (Nil!11193) (Cons!11192 (h!12222 (_ BitVec 64)) (t!17416 List!11196)) )
))
(declare-fun arrayNoDuplicates!0 (array!35844 (_ BitVec 32) List!11196) Bool)

(assert (=> b!573016 (= res!362426 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11193))))

(declare-fun b!573017 () Bool)

(declare-fun res!362424 () Bool)

(declare-fun e!329638 () Bool)

(assert (=> b!573017 (=> (not res!362424) (not e!329638))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!573017 (= res!362424 (validKeyInArray!0 (select (arr!17209 a!3118) j!142)))))

(declare-fun res!362430 () Bool)

(assert (=> start!52500 (=> (not res!362430) (not e!329638))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52500 (= res!362430 (validMask!0 mask!3119))))

(assert (=> start!52500 e!329638))

(assert (=> start!52500 true))

(declare-fun array_inv!13068 (array!35844) Bool)

(assert (=> start!52500 (array_inv!13068 a!3118)))

(declare-fun b!573018 () Bool)

(declare-fun res!362429 () Bool)

(assert (=> b!573018 (=> (not res!362429) (not e!329637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35844 (_ BitVec 32)) Bool)

(assert (=> b!573018 (= res!362429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!573019 () Bool)

(declare-fun e!329643 () Bool)

(declare-fun e!329641 () Bool)

(assert (=> b!573019 (= e!329643 e!329641)))

(declare-fun res!362427 () Bool)

(assert (=> b!573019 (=> res!362427 e!329641)))

(declare-fun lt!261609 () (_ BitVec 64))

(assert (=> b!573019 (= res!362427 (or (= lt!261609 (select (arr!17209 a!3118) j!142)) (= lt!261609 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5614 0))(
  ( (MissingZero!5614 (index!24683 (_ BitVec 32))) (Found!5614 (index!24684 (_ BitVec 32))) (Intermediate!5614 (undefined!6426 Bool) (index!24685 (_ BitVec 32)) (x!53702 (_ BitVec 32))) (Undefined!5614) (MissingVacant!5614 (index!24686 (_ BitVec 32))) )
))
(declare-fun lt!261612 () SeekEntryResult!5614)

(assert (=> b!573019 (= lt!261609 (select (arr!17209 a!3118) (index!24685 lt!261612)))))

(declare-fun b!573020 () Bool)

(declare-fun e!329642 () Bool)

(assert (=> b!573020 (= e!329637 e!329642)))

(declare-fun res!362422 () Bool)

(assert (=> b!573020 (=> (not res!362422) (not e!329642))))

(declare-fun lt!261610 () (_ BitVec 32))

(declare-fun lt!261608 () array!35844)

(declare-fun lt!261616 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35844 (_ BitVec 32)) SeekEntryResult!5614)

(assert (=> b!573020 (= res!362422 (= lt!261612 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261610 lt!261616 lt!261608 mask!3119)))))

(declare-fun lt!261613 () (_ BitVec 32))

(assert (=> b!573020 (= lt!261612 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261613 (select (arr!17209 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!573020 (= lt!261610 (toIndex!0 lt!261616 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!573020 (= lt!261616 (select (store (arr!17209 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!573020 (= lt!261613 (toIndex!0 (select (arr!17209 a!3118) j!142) mask!3119))))

(assert (=> b!573020 (= lt!261608 (array!35845 (store (arr!17209 a!3118) i!1132 k0!1914) (size!17573 a!3118)))))

(declare-fun b!573021 () Bool)

(declare-fun e!329639 () Bool)

(assert (=> b!573021 (= e!329641 e!329639)))

(declare-fun res!362420 () Bool)

(assert (=> b!573021 (=> (not res!362420) (not e!329639))))

(declare-fun lt!261611 () SeekEntryResult!5614)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35844 (_ BitVec 32)) SeekEntryResult!5614)

(assert (=> b!573021 (= res!362420 (= lt!261611 (seekKeyOrZeroReturnVacant!0 (x!53702 lt!261612) (index!24685 lt!261612) (index!24685 lt!261612) (select (arr!17209 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!573022 () Bool)

(declare-fun res!362428 () Bool)

(assert (=> b!573022 (=> (not res!362428) (not e!329638))))

(assert (=> b!573022 (= res!362428 (and (= (size!17573 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17573 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17573 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!573023 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35844 (_ BitVec 32)) SeekEntryResult!5614)

(assert (=> b!573023 (= e!329639 (= (seekEntryOrOpen!0 lt!261616 lt!261608 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53702 lt!261612) (index!24685 lt!261612) (index!24685 lt!261612) lt!261616 lt!261608 mask!3119)))))

(declare-fun b!573024 () Bool)

(declare-fun res!362425 () Bool)

(assert (=> b!573024 (=> (not res!362425) (not e!329638))))

(declare-fun arrayContainsKey!0 (array!35844 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!573024 (= res!362425 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!573025 () Bool)

(assert (=> b!573025 (= e!329642 (not true))))

(declare-fun e!329640 () Bool)

(assert (=> b!573025 e!329640))

(declare-fun res!362419 () Bool)

(assert (=> b!573025 (=> (not res!362419) (not e!329640))))

(assert (=> b!573025 (= res!362419 (= lt!261611 (Found!5614 j!142)))))

(assert (=> b!573025 (= lt!261611 (seekEntryOrOpen!0 (select (arr!17209 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!573025 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18001 0))(
  ( (Unit!18002) )
))
(declare-fun lt!261614 () Unit!18001)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35844 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18001)

(assert (=> b!573025 (= lt!261614 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!573026 () Bool)

(assert (=> b!573026 (= e!329638 e!329637)))

(declare-fun res!362431 () Bool)

(assert (=> b!573026 (=> (not res!362431) (not e!329637))))

(declare-fun lt!261615 () SeekEntryResult!5614)

(assert (=> b!573026 (= res!362431 (or (= lt!261615 (MissingZero!5614 i!1132)) (= lt!261615 (MissingVacant!5614 i!1132))))))

(assert (=> b!573026 (= lt!261615 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!573027 () Bool)

(assert (=> b!573027 (= e!329640 e!329643)))

(declare-fun res!362421 () Bool)

(assert (=> b!573027 (=> res!362421 e!329643)))

(get-info :version)

(assert (=> b!573027 (= res!362421 (or (undefined!6426 lt!261612) (not ((_ is Intermediate!5614) lt!261612))))))

(declare-fun b!573028 () Bool)

(declare-fun res!362423 () Bool)

(assert (=> b!573028 (=> (not res!362423) (not e!329638))))

(assert (=> b!573028 (= res!362423 (validKeyInArray!0 k0!1914))))

(assert (= (and start!52500 res!362430) b!573022))

(assert (= (and b!573022 res!362428) b!573017))

(assert (= (and b!573017 res!362424) b!573028))

(assert (= (and b!573028 res!362423) b!573024))

(assert (= (and b!573024 res!362425) b!573026))

(assert (= (and b!573026 res!362431) b!573018))

(assert (= (and b!573018 res!362429) b!573016))

(assert (= (and b!573016 res!362426) b!573020))

(assert (= (and b!573020 res!362422) b!573025))

(assert (= (and b!573025 res!362419) b!573027))

(assert (= (and b!573027 (not res!362421)) b!573019))

(assert (= (and b!573019 (not res!362427)) b!573021))

(assert (= (and b!573021 res!362420) b!573023))

(declare-fun m!552179 () Bool)

(assert (=> b!573026 m!552179))

(declare-fun m!552181 () Bool)

(assert (=> b!573028 m!552181))

(declare-fun m!552183 () Bool)

(assert (=> b!573017 m!552183))

(assert (=> b!573017 m!552183))

(declare-fun m!552185 () Bool)

(assert (=> b!573017 m!552185))

(declare-fun m!552187 () Bool)

(assert (=> start!52500 m!552187))

(declare-fun m!552189 () Bool)

(assert (=> start!52500 m!552189))

(declare-fun m!552191 () Bool)

(assert (=> b!573018 m!552191))

(declare-fun m!552193 () Bool)

(assert (=> b!573024 m!552193))

(assert (=> b!573020 m!552183))

(declare-fun m!552195 () Bool)

(assert (=> b!573020 m!552195))

(assert (=> b!573020 m!552183))

(declare-fun m!552197 () Bool)

(assert (=> b!573020 m!552197))

(declare-fun m!552199 () Bool)

(assert (=> b!573020 m!552199))

(assert (=> b!573020 m!552183))

(declare-fun m!552201 () Bool)

(assert (=> b!573020 m!552201))

(declare-fun m!552203 () Bool)

(assert (=> b!573020 m!552203))

(declare-fun m!552205 () Bool)

(assert (=> b!573020 m!552205))

(assert (=> b!573019 m!552183))

(declare-fun m!552207 () Bool)

(assert (=> b!573019 m!552207))

(declare-fun m!552209 () Bool)

(assert (=> b!573023 m!552209))

(declare-fun m!552211 () Bool)

(assert (=> b!573023 m!552211))

(declare-fun m!552213 () Bool)

(assert (=> b!573016 m!552213))

(assert (=> b!573021 m!552183))

(assert (=> b!573021 m!552183))

(declare-fun m!552215 () Bool)

(assert (=> b!573021 m!552215))

(assert (=> b!573025 m!552183))

(assert (=> b!573025 m!552183))

(declare-fun m!552217 () Bool)

(assert (=> b!573025 m!552217))

(declare-fun m!552219 () Bool)

(assert (=> b!573025 m!552219))

(declare-fun m!552221 () Bool)

(assert (=> b!573025 m!552221))

(check-sat (not start!52500) (not b!573021) (not b!573028) (not b!573017) (not b!573026) (not b!573024) (not b!573025) (not b!573016) (not b!573023) (not b!573020) (not b!573018))
(check-sat)
