; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52452 () Bool)

(assert start!52452)

(declare-fun b!572080 () Bool)

(declare-fun res!361484 () Bool)

(declare-fun e!329067 () Bool)

(assert (=> b!572080 (=> (not res!361484) (not e!329067))))

(declare-datatypes ((array!35796 0))(
  ( (array!35797 (arr!17185 (Array (_ BitVec 32) (_ BitVec 64))) (size!17549 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35796)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572080 (= res!361484 (validKeyInArray!0 (select (arr!17185 a!3118) j!142)))))

(declare-fun b!572081 () Bool)

(declare-fun res!361491 () Bool)

(declare-fun e!329065 () Bool)

(assert (=> b!572081 (=> (not res!361491) (not e!329065))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35796 (_ BitVec 32)) Bool)

(assert (=> b!572081 (= res!361491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572082 () Bool)

(declare-fun res!361485 () Bool)

(assert (=> b!572082 (=> (not res!361485) (not e!329067))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35796 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572082 (= res!361485 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!361493 () Bool)

(assert (=> start!52452 (=> (not res!361493) (not e!329067))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52452 (= res!361493 (validMask!0 mask!3119))))

(assert (=> start!52452 e!329067))

(assert (=> start!52452 true))

(declare-fun array_inv!13044 (array!35796) Bool)

(assert (=> start!52452 (array_inv!13044 a!3118)))

(declare-fun b!572083 () Bool)

(assert (=> b!572083 (= e!329067 e!329065)))

(declare-fun res!361486 () Bool)

(assert (=> b!572083 (=> (not res!361486) (not e!329065))))

(declare-datatypes ((SeekEntryResult!5590 0))(
  ( (MissingZero!5590 (index!24587 (_ BitVec 32))) (Found!5590 (index!24588 (_ BitVec 32))) (Intermediate!5590 (undefined!6402 Bool) (index!24589 (_ BitVec 32)) (x!53614 (_ BitVec 32))) (Undefined!5590) (MissingVacant!5590 (index!24590 (_ BitVec 32))) )
))
(declare-fun lt!260961 () SeekEntryResult!5590)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572083 (= res!361486 (or (= lt!260961 (MissingZero!5590 i!1132)) (= lt!260961 (MissingVacant!5590 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35796 (_ BitVec 32)) SeekEntryResult!5590)

(assert (=> b!572083 (= lt!260961 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!572084 () Bool)

(declare-fun res!361492 () Bool)

(assert (=> b!572084 (=> (not res!361492) (not e!329065))))

(declare-datatypes ((List!11172 0))(
  ( (Nil!11169) (Cons!11168 (h!12198 (_ BitVec 64)) (t!17392 List!11172)) )
))
(declare-fun arrayNoDuplicates!0 (array!35796 (_ BitVec 32) List!11172) Bool)

(assert (=> b!572084 (= res!361492 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11169))))

(declare-fun b!572085 () Bool)

(declare-fun res!361490 () Bool)

(assert (=> b!572085 (=> (not res!361490) (not e!329067))))

(assert (=> b!572085 (= res!361490 (and (= (size!17549 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17549 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17549 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572086 () Bool)

(declare-fun res!361489 () Bool)

(assert (=> b!572086 (=> (not res!361489) (not e!329067))))

(assert (=> b!572086 (= res!361489 (validKeyInArray!0 k0!1914))))

(declare-fun b!572087 () Bool)

(declare-fun e!329062 () Bool)

(assert (=> b!572087 (= e!329065 e!329062)))

(declare-fun res!361494 () Bool)

(assert (=> b!572087 (=> (not res!361494) (not e!329062))))

(declare-fun lt!260968 () SeekEntryResult!5590)

(declare-fun lt!260963 () (_ BitVec 32))

(declare-fun lt!260965 () (_ BitVec 64))

(declare-fun lt!260962 () array!35796)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35796 (_ BitVec 32)) SeekEntryResult!5590)

(assert (=> b!572087 (= res!361494 (= lt!260968 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260963 lt!260965 lt!260962 mask!3119)))))

(declare-fun lt!260966 () (_ BitVec 32))

(assert (=> b!572087 (= lt!260968 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!260966 (select (arr!17185 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572087 (= lt!260963 (toIndex!0 lt!260965 mask!3119))))

(assert (=> b!572087 (= lt!260965 (select (store (arr!17185 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572087 (= lt!260966 (toIndex!0 (select (arr!17185 a!3118) j!142) mask!3119))))

(assert (=> b!572087 (= lt!260962 (array!35797 (store (arr!17185 a!3118) i!1132 k0!1914) (size!17549 a!3118)))))

(declare-fun b!572088 () Bool)

(declare-fun e!329064 () Bool)

(declare-fun e!329060 () Bool)

(assert (=> b!572088 (= e!329064 e!329060)))

(declare-fun res!361483 () Bool)

(assert (=> b!572088 (=> (not res!361483) (not e!329060))))

(declare-fun lt!260960 () SeekEntryResult!5590)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35796 (_ BitVec 32)) SeekEntryResult!5590)

(assert (=> b!572088 (= res!361483 (= lt!260960 (seekKeyOrZeroReturnVacant!0 (x!53614 lt!260968) (index!24589 lt!260968) (index!24589 lt!260968) (select (arr!17185 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572089 () Bool)

(declare-fun e!329061 () Bool)

(assert (=> b!572089 (= e!329061 e!329064)))

(declare-fun res!361488 () Bool)

(assert (=> b!572089 (=> res!361488 e!329064)))

(declare-fun lt!260967 () (_ BitVec 64))

(assert (=> b!572089 (= res!361488 (or (= lt!260967 (select (arr!17185 a!3118) j!142)) (= lt!260967 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572089 (= lt!260967 (select (arr!17185 a!3118) (index!24589 lt!260968)))))

(declare-fun b!572090 () Bool)

(declare-fun e!329066 () Bool)

(assert (=> b!572090 (= e!329066 e!329061)))

(declare-fun res!361487 () Bool)

(assert (=> b!572090 (=> res!361487 e!329061)))

(get-info :version)

(assert (=> b!572090 (= res!361487 (or (undefined!6402 lt!260968) (not ((_ is Intermediate!5590) lt!260968))))))

(declare-fun b!572091 () Bool)

(assert (=> b!572091 (= e!329060 (= (seekEntryOrOpen!0 lt!260965 lt!260962 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53614 lt!260968) (index!24589 lt!260968) (index!24589 lt!260968) lt!260965 lt!260962 mask!3119)))))

(declare-fun b!572092 () Bool)

(assert (=> b!572092 (= e!329062 (not true))))

(assert (=> b!572092 e!329066))

(declare-fun res!361495 () Bool)

(assert (=> b!572092 (=> (not res!361495) (not e!329066))))

(assert (=> b!572092 (= res!361495 (= lt!260960 (Found!5590 j!142)))))

(assert (=> b!572092 (= lt!260960 (seekEntryOrOpen!0 (select (arr!17185 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!572092 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17953 0))(
  ( (Unit!17954) )
))
(declare-fun lt!260964 () Unit!17953)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35796 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17953)

(assert (=> b!572092 (= lt!260964 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52452 res!361493) b!572085))

(assert (= (and b!572085 res!361490) b!572080))

(assert (= (and b!572080 res!361484) b!572086))

(assert (= (and b!572086 res!361489) b!572082))

(assert (= (and b!572082 res!361485) b!572083))

(assert (= (and b!572083 res!361486) b!572081))

(assert (= (and b!572081 res!361491) b!572084))

(assert (= (and b!572084 res!361492) b!572087))

(assert (= (and b!572087 res!361494) b!572092))

(assert (= (and b!572092 res!361495) b!572090))

(assert (= (and b!572090 (not res!361487)) b!572089))

(assert (= (and b!572089 (not res!361488)) b!572088))

(assert (= (and b!572088 res!361483) b!572091))

(declare-fun m!551123 () Bool)

(assert (=> b!572084 m!551123))

(declare-fun m!551125 () Bool)

(assert (=> b!572086 m!551125))

(declare-fun m!551127 () Bool)

(assert (=> start!52452 m!551127))

(declare-fun m!551129 () Bool)

(assert (=> start!52452 m!551129))

(declare-fun m!551131 () Bool)

(assert (=> b!572080 m!551131))

(assert (=> b!572080 m!551131))

(declare-fun m!551133 () Bool)

(assert (=> b!572080 m!551133))

(declare-fun m!551135 () Bool)

(assert (=> b!572083 m!551135))

(declare-fun m!551137 () Bool)

(assert (=> b!572091 m!551137))

(declare-fun m!551139 () Bool)

(assert (=> b!572091 m!551139))

(assert (=> b!572088 m!551131))

(assert (=> b!572088 m!551131))

(declare-fun m!551141 () Bool)

(assert (=> b!572088 m!551141))

(assert (=> b!572089 m!551131))

(declare-fun m!551143 () Bool)

(assert (=> b!572089 m!551143))

(assert (=> b!572092 m!551131))

(assert (=> b!572092 m!551131))

(declare-fun m!551145 () Bool)

(assert (=> b!572092 m!551145))

(declare-fun m!551147 () Bool)

(assert (=> b!572092 m!551147))

(declare-fun m!551149 () Bool)

(assert (=> b!572092 m!551149))

(assert (=> b!572087 m!551131))

(declare-fun m!551151 () Bool)

(assert (=> b!572087 m!551151))

(declare-fun m!551153 () Bool)

(assert (=> b!572087 m!551153))

(declare-fun m!551155 () Bool)

(assert (=> b!572087 m!551155))

(assert (=> b!572087 m!551131))

(declare-fun m!551157 () Bool)

(assert (=> b!572087 m!551157))

(declare-fun m!551159 () Bool)

(assert (=> b!572087 m!551159))

(declare-fun m!551161 () Bool)

(assert (=> b!572087 m!551161))

(assert (=> b!572087 m!551131))

(declare-fun m!551163 () Bool)

(assert (=> b!572081 m!551163))

(declare-fun m!551165 () Bool)

(assert (=> b!572082 m!551165))

(check-sat (not start!52452) (not b!572088) (not b!572092) (not b!572082) (not b!572083) (not b!572084) (not b!572086) (not b!572081) (not b!572087) (not b!572080) (not b!572091))
(check-sat)
