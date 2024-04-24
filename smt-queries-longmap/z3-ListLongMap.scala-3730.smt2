; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51420 () Bool)

(assert start!51420)

(declare-fun b!561184 () Bool)

(declare-fun e!323370 () Bool)

(declare-fun e!323373 () Bool)

(assert (=> b!561184 (= e!323370 e!323373)))

(declare-fun res!352231 () Bool)

(assert (=> b!561184 (=> (not res!352231) (not e!323373))))

(declare-datatypes ((SeekEntryResult!5320 0))(
  ( (MissingZero!5320 (index!23507 (_ BitVec 32))) (Found!5320 (index!23508 (_ BitVec 32))) (Intermediate!5320 (undefined!6132 Bool) (index!23509 (_ BitVec 32)) (x!52570 (_ BitVec 32))) (Undefined!5320) (MissingVacant!5320 (index!23510 (_ BitVec 32))) )
))
(declare-fun lt!255312 () SeekEntryResult!5320)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561184 (= res!352231 (or (= lt!255312 (MissingZero!5320 i!1132)) (= lt!255312 (MissingVacant!5320 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35232 0))(
  ( (array!35233 (arr!16915 (Array (_ BitVec 32) (_ BitVec 64))) (size!17279 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35232)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35232 (_ BitVec 32)) SeekEntryResult!5320)

(assert (=> b!561184 (= lt!255312 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561185 () Bool)

(declare-fun res!352243 () Bool)

(assert (=> b!561185 (=> (not res!352243) (not e!323370))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561185 (= res!352243 (validKeyInArray!0 (select (arr!16915 a!3118) j!142)))))

(declare-fun b!561186 () Bool)

(declare-fun res!352241 () Bool)

(assert (=> b!561186 (=> (not res!352241) (not e!323373))))

(declare-datatypes ((List!10902 0))(
  ( (Nil!10899) (Cons!10898 (h!11904 (_ BitVec 64)) (t!17122 List!10902)) )
))
(declare-fun arrayNoDuplicates!0 (array!35232 (_ BitVec 32) List!10902) Bool)

(assert (=> b!561186 (= res!352241 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10899))))

(declare-fun b!561187 () Bool)

(declare-fun res!352235 () Bool)

(assert (=> b!561187 (=> (not res!352235) (not e!323370))))

(declare-fun arrayContainsKey!0 (array!35232 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561187 (= res!352235 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561188 () Bool)

(declare-fun e!323369 () Bool)

(declare-fun e!323374 () Bool)

(assert (=> b!561188 (= e!323369 e!323374)))

(declare-fun res!352242 () Bool)

(assert (=> b!561188 (=> res!352242 e!323374)))

(declare-fun lt!255308 () SeekEntryResult!5320)

(get-info :version)

(assert (=> b!561188 (= res!352242 (or (undefined!6132 lt!255308) (not ((_ is Intermediate!5320) lt!255308))))))

(declare-fun b!561189 () Bool)

(declare-fun e!323376 () Bool)

(assert (=> b!561189 (= e!323373 e!323376)))

(declare-fun res!352237 () Bool)

(assert (=> b!561189 (=> (not res!352237) (not e!323376))))

(declare-fun lt!255313 () (_ BitVec 64))

(declare-fun lt!255305 () (_ BitVec 32))

(declare-fun lt!255309 () array!35232)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35232 (_ BitVec 32)) SeekEntryResult!5320)

(assert (=> b!561189 (= res!352237 (= lt!255308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255305 lt!255313 lt!255309 mask!3119)))))

(declare-fun lt!255307 () (_ BitVec 32))

(assert (=> b!561189 (= lt!255308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255307 (select (arr!16915 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561189 (= lt!255305 (toIndex!0 lt!255313 mask!3119))))

(assert (=> b!561189 (= lt!255313 (select (store (arr!16915 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561189 (= lt!255307 (toIndex!0 (select (arr!16915 a!3118) j!142) mask!3119))))

(assert (=> b!561189 (= lt!255309 (array!35233 (store (arr!16915 a!3118) i!1132 k0!1914) (size!17279 a!3118)))))

(declare-fun b!561190 () Bool)

(declare-fun res!352233 () Bool)

(assert (=> b!561190 (=> (not res!352233) (not e!323370))))

(assert (=> b!561190 (= res!352233 (and (= (size!17279 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17279 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17279 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!352238 () Bool)

(assert (=> start!51420 (=> (not res!352238) (not e!323370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51420 (= res!352238 (validMask!0 mask!3119))))

(assert (=> start!51420 e!323370))

(assert (=> start!51420 true))

(declare-fun array_inv!12774 (array!35232) Bool)

(assert (=> start!51420 (array_inv!12774 a!3118)))

(declare-fun b!561191 () Bool)

(declare-fun e!323372 () Bool)

(assert (=> b!561191 (= e!323374 e!323372)))

(declare-fun res!352239 () Bool)

(assert (=> b!561191 (=> res!352239 e!323372)))

(declare-fun lt!255310 () (_ BitVec 64))

(assert (=> b!561191 (= res!352239 (or (= lt!255310 (select (arr!16915 a!3118) j!142)) (= lt!255310 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561191 (= lt!255310 (select (arr!16915 a!3118) (index!23509 lt!255308)))))

(declare-fun b!561192 () Bool)

(assert (=> b!561192 (= e!323376 (not true))))

(assert (=> b!561192 e!323369))

(declare-fun res!352232 () Bool)

(assert (=> b!561192 (=> (not res!352232) (not e!323369))))

(declare-fun lt!255306 () SeekEntryResult!5320)

(assert (=> b!561192 (= res!352232 (= lt!255306 (Found!5320 j!142)))))

(assert (=> b!561192 (= lt!255306 (seekEntryOrOpen!0 (select (arr!16915 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35232 (_ BitVec 32)) Bool)

(assert (=> b!561192 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17485 0))(
  ( (Unit!17486) )
))
(declare-fun lt!255311 () Unit!17485)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35232 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17485)

(assert (=> b!561192 (= lt!255311 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561193 () Bool)

(declare-fun res!352236 () Bool)

(assert (=> b!561193 (=> (not res!352236) (not e!323373))))

(assert (=> b!561193 (= res!352236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561194 () Bool)

(declare-fun res!352240 () Bool)

(assert (=> b!561194 (=> (not res!352240) (not e!323370))))

(assert (=> b!561194 (= res!352240 (validKeyInArray!0 k0!1914))))

(declare-fun e!323375 () Bool)

(declare-fun b!561195 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35232 (_ BitVec 32)) SeekEntryResult!5320)

(assert (=> b!561195 (= e!323375 (= (seekEntryOrOpen!0 lt!255313 lt!255309 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52570 lt!255308) (index!23509 lt!255308) (index!23509 lt!255308) lt!255313 lt!255309 mask!3119)))))

(declare-fun b!561196 () Bool)

(assert (=> b!561196 (= e!323372 e!323375)))

(declare-fun res!352234 () Bool)

(assert (=> b!561196 (=> (not res!352234) (not e!323375))))

(assert (=> b!561196 (= res!352234 (= lt!255306 (seekKeyOrZeroReturnVacant!0 (x!52570 lt!255308) (index!23509 lt!255308) (index!23509 lt!255308) (select (arr!16915 a!3118) j!142) a!3118 mask!3119)))))

(assert (= (and start!51420 res!352238) b!561190))

(assert (= (and b!561190 res!352233) b!561185))

(assert (= (and b!561185 res!352243) b!561194))

(assert (= (and b!561194 res!352240) b!561187))

(assert (= (and b!561187 res!352235) b!561184))

(assert (= (and b!561184 res!352231) b!561193))

(assert (= (and b!561193 res!352236) b!561186))

(assert (= (and b!561186 res!352241) b!561189))

(assert (= (and b!561189 res!352237) b!561192))

(assert (= (and b!561192 res!352232) b!561188))

(assert (= (and b!561188 (not res!352242)) b!561191))

(assert (= (and b!561191 (not res!352239)) b!561196))

(assert (= (and b!561196 res!352234) b!561195))

(declare-fun m!539159 () Bool)

(assert (=> b!561194 m!539159))

(declare-fun m!539161 () Bool)

(assert (=> b!561193 m!539161))

(declare-fun m!539163 () Bool)

(assert (=> b!561187 m!539163))

(declare-fun m!539165 () Bool)

(assert (=> b!561191 m!539165))

(declare-fun m!539167 () Bool)

(assert (=> b!561191 m!539167))

(assert (=> b!561196 m!539165))

(assert (=> b!561196 m!539165))

(declare-fun m!539169 () Bool)

(assert (=> b!561196 m!539169))

(assert (=> b!561189 m!539165))

(declare-fun m!539171 () Bool)

(assert (=> b!561189 m!539171))

(declare-fun m!539173 () Bool)

(assert (=> b!561189 m!539173))

(assert (=> b!561189 m!539165))

(declare-fun m!539175 () Bool)

(assert (=> b!561189 m!539175))

(declare-fun m!539177 () Bool)

(assert (=> b!561189 m!539177))

(declare-fun m!539179 () Bool)

(assert (=> b!561189 m!539179))

(assert (=> b!561189 m!539165))

(declare-fun m!539181 () Bool)

(assert (=> b!561189 m!539181))

(assert (=> b!561192 m!539165))

(assert (=> b!561192 m!539165))

(declare-fun m!539183 () Bool)

(assert (=> b!561192 m!539183))

(declare-fun m!539185 () Bool)

(assert (=> b!561192 m!539185))

(declare-fun m!539187 () Bool)

(assert (=> b!561192 m!539187))

(declare-fun m!539189 () Bool)

(assert (=> b!561184 m!539189))

(assert (=> b!561185 m!539165))

(assert (=> b!561185 m!539165))

(declare-fun m!539191 () Bool)

(assert (=> b!561185 m!539191))

(declare-fun m!539193 () Bool)

(assert (=> b!561195 m!539193))

(declare-fun m!539195 () Bool)

(assert (=> b!561195 m!539195))

(declare-fun m!539197 () Bool)

(assert (=> b!561186 m!539197))

(declare-fun m!539199 () Bool)

(assert (=> start!51420 m!539199))

(declare-fun m!539201 () Bool)

(assert (=> start!51420 m!539201))

(check-sat (not b!561194) (not b!561184) (not b!561193) (not b!561195) (not b!561196) (not b!561187) (not b!561185) (not b!561186) (not b!561192) (not b!561189) (not start!51420))
(check-sat)
