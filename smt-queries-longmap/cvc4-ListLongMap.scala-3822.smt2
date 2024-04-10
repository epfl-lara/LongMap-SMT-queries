; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52422 () Bool)

(assert start!52422)

(declare-fun res!361710 () Bool)

(declare-fun e!329127 () Bool)

(assert (=> start!52422 (=> (not res!361710) (not e!329127))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52422 (= res!361710 (validMask!0 mask!3119))))

(assert (=> start!52422 e!329127))

(assert (=> start!52422 true))

(declare-datatypes ((array!35819 0))(
  ( (array!35820 (arr!17198 (Array (_ BitVec 32) (_ BitVec 64))) (size!17562 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35819)

(declare-fun array_inv!12994 (array!35819) Bool)

(assert (=> start!52422 (array_inv!12994 a!3118)))

(declare-fun b!572192 () Bool)

(declare-fun e!329128 () Bool)

(declare-fun e!329130 () Bool)

(assert (=> b!572192 (= e!329128 e!329130)))

(declare-fun res!361709 () Bool)

(assert (=> b!572192 (=> res!361709 e!329130)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!261069 () (_ BitVec 64))

(assert (=> b!572192 (= res!361709 (or (= lt!261069 (select (arr!17198 a!3118) j!142)) (= lt!261069 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5647 0))(
  ( (MissingZero!5647 (index!24815 (_ BitVec 32))) (Found!5647 (index!24816 (_ BitVec 32))) (Intermediate!5647 (undefined!6459 Bool) (index!24817 (_ BitVec 32)) (x!53684 (_ BitVec 32))) (Undefined!5647) (MissingVacant!5647 (index!24818 (_ BitVec 32))) )
))
(declare-fun lt!261073 () SeekEntryResult!5647)

(assert (=> b!572192 (= lt!261069 (select (arr!17198 a!3118) (index!24817 lt!261073)))))

(declare-fun b!572193 () Bool)

(declare-fun res!361711 () Bool)

(declare-fun e!329129 () Bool)

(assert (=> b!572193 (=> (not res!361711) (not e!329129))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35819 (_ BitVec 32)) Bool)

(assert (=> b!572193 (= res!361711 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572194 () Bool)

(declare-fun res!361703 () Bool)

(assert (=> b!572194 (=> (not res!361703) (not e!329127))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572194 (= res!361703 (validKeyInArray!0 k!1914))))

(declare-fun b!572195 () Bool)

(declare-fun res!361704 () Bool)

(assert (=> b!572195 (=> (not res!361704) (not e!329127))))

(declare-fun arrayContainsKey!0 (array!35819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572195 (= res!361704 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572196 () Bool)

(declare-fun e!329125 () Bool)

(assert (=> b!572196 (= e!329129 e!329125)))

(declare-fun res!361700 () Bool)

(assert (=> b!572196 (=> (not res!361700) (not e!329125))))

(declare-fun lt!261068 () (_ BitVec 64))

(declare-fun lt!261066 () array!35819)

(declare-fun lt!261072 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35819 (_ BitVec 32)) SeekEntryResult!5647)

(assert (=> b!572196 (= res!361700 (= lt!261073 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261072 lt!261068 lt!261066 mask!3119)))))

(declare-fun lt!261067 () (_ BitVec 32))

(assert (=> b!572196 (= lt!261073 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261067 (select (arr!17198 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572196 (= lt!261072 (toIndex!0 lt!261068 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572196 (= lt!261068 (select (store (arr!17198 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!572196 (= lt!261067 (toIndex!0 (select (arr!17198 a!3118) j!142) mask!3119))))

(assert (=> b!572196 (= lt!261066 (array!35820 (store (arr!17198 a!3118) i!1132 k!1914) (size!17562 a!3118)))))

(declare-fun b!572197 () Bool)

(declare-fun e!329124 () Bool)

(assert (=> b!572197 (= e!329130 e!329124)))

(declare-fun res!361708 () Bool)

(assert (=> b!572197 (=> (not res!361708) (not e!329124))))

(declare-fun lt!261070 () SeekEntryResult!5647)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35819 (_ BitVec 32)) SeekEntryResult!5647)

(assert (=> b!572197 (= res!361708 (= lt!261070 (seekKeyOrZeroReturnVacant!0 (x!53684 lt!261073) (index!24817 lt!261073) (index!24817 lt!261073) (select (arr!17198 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572198 () Bool)

(declare-fun res!361712 () Bool)

(assert (=> b!572198 (=> (not res!361712) (not e!329129))))

(declare-datatypes ((List!11278 0))(
  ( (Nil!11275) (Cons!11274 (h!12301 (_ BitVec 64)) (t!17506 List!11278)) )
))
(declare-fun arrayNoDuplicates!0 (array!35819 (_ BitVec 32) List!11278) Bool)

(assert (=> b!572198 (= res!361712 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11275))))

(declare-fun b!572199 () Bool)

(declare-fun res!361701 () Bool)

(assert (=> b!572199 (=> (not res!361701) (not e!329127))))

(assert (=> b!572199 (= res!361701 (and (= (size!17562 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17562 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17562 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572200 () Bool)

(assert (=> b!572200 (= e!329125 (not true))))

(declare-fun e!329123 () Bool)

(assert (=> b!572200 e!329123))

(declare-fun res!361705 () Bool)

(assert (=> b!572200 (=> (not res!361705) (not e!329123))))

(assert (=> b!572200 (= res!361705 (= lt!261070 (Found!5647 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35819 (_ BitVec 32)) SeekEntryResult!5647)

(assert (=> b!572200 (= lt!261070 (seekEntryOrOpen!0 (select (arr!17198 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!572200 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17996 0))(
  ( (Unit!17997) )
))
(declare-fun lt!261065 () Unit!17996)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35819 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17996)

(assert (=> b!572200 (= lt!261065 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572201 () Bool)

(assert (=> b!572201 (= e!329127 e!329129)))

(declare-fun res!361702 () Bool)

(assert (=> b!572201 (=> (not res!361702) (not e!329129))))

(declare-fun lt!261071 () SeekEntryResult!5647)

(assert (=> b!572201 (= res!361702 (or (= lt!261071 (MissingZero!5647 i!1132)) (= lt!261071 (MissingVacant!5647 i!1132))))))

(assert (=> b!572201 (= lt!261071 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!572202 () Bool)

(assert (=> b!572202 (= e!329124 (= (seekEntryOrOpen!0 lt!261068 lt!261066 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53684 lt!261073) (index!24817 lt!261073) (index!24817 lt!261073) lt!261068 lt!261066 mask!3119)))))

(declare-fun b!572203 () Bool)

(assert (=> b!572203 (= e!329123 e!329128)))

(declare-fun res!361707 () Bool)

(assert (=> b!572203 (=> res!361707 e!329128)))

(assert (=> b!572203 (= res!361707 (or (undefined!6459 lt!261073) (not (is-Intermediate!5647 lt!261073))))))

(declare-fun b!572204 () Bool)

(declare-fun res!361706 () Bool)

(assert (=> b!572204 (=> (not res!361706) (not e!329127))))

(assert (=> b!572204 (= res!361706 (validKeyInArray!0 (select (arr!17198 a!3118) j!142)))))

(assert (= (and start!52422 res!361710) b!572199))

(assert (= (and b!572199 res!361701) b!572204))

(assert (= (and b!572204 res!361706) b!572194))

(assert (= (and b!572194 res!361703) b!572195))

(assert (= (and b!572195 res!361704) b!572201))

(assert (= (and b!572201 res!361702) b!572193))

(assert (= (and b!572193 res!361711) b!572198))

(assert (= (and b!572198 res!361712) b!572196))

(assert (= (and b!572196 res!361700) b!572200))

(assert (= (and b!572200 res!361705) b!572203))

(assert (= (and b!572203 (not res!361707)) b!572192))

(assert (= (and b!572192 (not res!361709)) b!572197))

(assert (= (and b!572197 res!361708) b!572202))

(declare-fun m!551137 () Bool)

(assert (=> b!572193 m!551137))

(declare-fun m!551139 () Bool)

(assert (=> b!572204 m!551139))

(assert (=> b!572204 m!551139))

(declare-fun m!551141 () Bool)

(assert (=> b!572204 m!551141))

(declare-fun m!551143 () Bool)

(assert (=> b!572194 m!551143))

(declare-fun m!551145 () Bool)

(assert (=> b!572195 m!551145))

(assert (=> b!572200 m!551139))

(assert (=> b!572200 m!551139))

(declare-fun m!551147 () Bool)

(assert (=> b!572200 m!551147))

(declare-fun m!551149 () Bool)

(assert (=> b!572200 m!551149))

(declare-fun m!551151 () Bool)

(assert (=> b!572200 m!551151))

(assert (=> b!572197 m!551139))

(assert (=> b!572197 m!551139))

(declare-fun m!551153 () Bool)

(assert (=> b!572197 m!551153))

(declare-fun m!551155 () Bool)

(assert (=> b!572201 m!551155))

(assert (=> b!572192 m!551139))

(declare-fun m!551157 () Bool)

(assert (=> b!572192 m!551157))

(declare-fun m!551159 () Bool)

(assert (=> b!572198 m!551159))

(assert (=> b!572196 m!551139))

(declare-fun m!551161 () Bool)

(assert (=> b!572196 m!551161))

(assert (=> b!572196 m!551139))

(declare-fun m!551163 () Bool)

(assert (=> b!572196 m!551163))

(assert (=> b!572196 m!551139))

(declare-fun m!551165 () Bool)

(assert (=> b!572196 m!551165))

(declare-fun m!551167 () Bool)

(assert (=> b!572196 m!551167))

(declare-fun m!551169 () Bool)

(assert (=> b!572196 m!551169))

(declare-fun m!551171 () Bool)

(assert (=> b!572196 m!551171))

(declare-fun m!551173 () Bool)

(assert (=> b!572202 m!551173))

(declare-fun m!551175 () Bool)

(assert (=> b!572202 m!551175))

(declare-fun m!551177 () Bool)

(assert (=> start!52422 m!551177))

(declare-fun m!551179 () Bool)

(assert (=> start!52422 m!551179))

(push 1)

