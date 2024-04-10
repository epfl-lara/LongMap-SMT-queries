; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47394 () Bool)

(assert start!47394)

(declare-fun b!521242 () Bool)

(declare-fun res!319079 () Bool)

(declare-fun e!304122 () Bool)

(assert (=> b!521242 (=> (not res!319079) (not e!304122))))

(declare-datatypes ((array!33220 0))(
  ( (array!33221 (arr!15966 (Array (_ BitVec 32) (_ BitVec 64))) (size!16330 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33220)

(declare-datatypes ((List!10124 0))(
  ( (Nil!10121) (Cons!10120 (h!11042 (_ BitVec 64)) (t!16352 List!10124)) )
))
(declare-fun arrayNoDuplicates!0 (array!33220 (_ BitVec 32) List!10124) Bool)

(assert (=> b!521242 (= res!319079 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10121))))

(declare-fun b!521243 () Bool)

(declare-fun e!304121 () Bool)

(assert (=> b!521243 (= e!304121 true)))

(declare-datatypes ((SeekEntryResult!4433 0))(
  ( (MissingZero!4433 (index!19935 (_ BitVec 32))) (Found!4433 (index!19936 (_ BitVec 32))) (Intermediate!4433 (undefined!5245 Bool) (index!19937 (_ BitVec 32)) (x!48923 (_ BitVec 32))) (Undefined!4433) (MissingVacant!4433 (index!19938 (_ BitVec 32))) )
))
(declare-fun lt!238840 () SeekEntryResult!4433)

(assert (=> b!521243 (and (or (= (select (arr!15966 a!3235) (index!19937 lt!238840)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15966 a!3235) (index!19937 lt!238840)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15966 a!3235) (index!19937 lt!238840)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15966 a!3235) (index!19937 lt!238840)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16184 0))(
  ( (Unit!16185) )
))
(declare-fun lt!238834 () Unit!16184)

(declare-fun e!304118 () Unit!16184)

(assert (=> b!521243 (= lt!238834 e!304118)))

(declare-fun c!61388 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!521243 (= c!61388 (= (select (arr!15966 a!3235) (index!19937 lt!238840)) (select (arr!15966 a!3235) j!176)))))

(assert (=> b!521243 (and (bvslt (x!48923 lt!238840) #b01111111111111111111111111111110) (or (= (select (arr!15966 a!3235) (index!19937 lt!238840)) (select (arr!15966 a!3235) j!176)) (= (select (arr!15966 a!3235) (index!19937 lt!238840)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15966 a!3235) (index!19937 lt!238840)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521244 () Bool)

(declare-fun res!319078 () Bool)

(declare-fun e!304116 () Bool)

(assert (=> b!521244 (=> (not res!319078) (not e!304116))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521244 (= res!319078 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521245 () Bool)

(assert (=> b!521245 (= e!304122 (not e!304121))))

(declare-fun res!319070 () Bool)

(assert (=> b!521245 (=> res!319070 e!304121)))

(declare-fun lt!238838 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!238839 () (_ BitVec 32))

(declare-fun lt!238836 () array!33220)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33220 (_ BitVec 32)) SeekEntryResult!4433)

(assert (=> b!521245 (= res!319070 (= lt!238840 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238839 lt!238838 lt!238836 mask!3524)))))

(declare-fun lt!238833 () (_ BitVec 32))

(assert (=> b!521245 (= lt!238840 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238833 (select (arr!15966 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521245 (= lt!238839 (toIndex!0 lt!238838 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521245 (= lt!238838 (select (store (arr!15966 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!521245 (= lt!238833 (toIndex!0 (select (arr!15966 a!3235) j!176) mask!3524))))

(assert (=> b!521245 (= lt!238836 (array!33221 (store (arr!15966 a!3235) i!1204 k!2280) (size!16330 a!3235)))))

(declare-fun e!304119 () Bool)

(assert (=> b!521245 e!304119))

(declare-fun res!319073 () Bool)

(assert (=> b!521245 (=> (not res!319073) (not e!304119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33220 (_ BitVec 32)) Bool)

(assert (=> b!521245 (= res!319073 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238837 () Unit!16184)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16184)

(assert (=> b!521245 (= lt!238837 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!319074 () Bool)

(assert (=> start!47394 (=> (not res!319074) (not e!304116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47394 (= res!319074 (validMask!0 mask!3524))))

(assert (=> start!47394 e!304116))

(assert (=> start!47394 true))

(declare-fun array_inv!11762 (array!33220) Bool)

(assert (=> start!47394 (array_inv!11762 a!3235)))

(declare-fun b!521246 () Bool)

(declare-fun res!319077 () Bool)

(assert (=> b!521246 (=> (not res!319077) (not e!304116))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521246 (= res!319077 (validKeyInArray!0 k!2280))))

(declare-fun b!521247 () Bool)

(declare-fun e!304117 () Bool)

(assert (=> b!521247 (= e!304117 false)))

(declare-fun b!521248 () Bool)

(declare-fun res!319072 () Bool)

(assert (=> b!521248 (=> (not res!319072) (not e!304116))))

(assert (=> b!521248 (= res!319072 (and (= (size!16330 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16330 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16330 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!521249 () Bool)

(declare-fun Unit!16186 () Unit!16184)

(assert (=> b!521249 (= e!304118 Unit!16186)))

(declare-fun lt!238832 () Unit!16184)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33220 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16184)

(assert (=> b!521249 (= lt!238832 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!238833 #b00000000000000000000000000000000 (index!19937 lt!238840) (x!48923 lt!238840) mask!3524))))

(declare-fun res!319068 () Bool)

(assert (=> b!521249 (= res!319068 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238833 lt!238838 lt!238836 mask!3524) (Intermediate!4433 false (index!19937 lt!238840) (x!48923 lt!238840))))))

(assert (=> b!521249 (=> (not res!319068) (not e!304117))))

(assert (=> b!521249 e!304117))

(declare-fun b!521250 () Bool)

(declare-fun res!319075 () Bool)

(assert (=> b!521250 (=> (not res!319075) (not e!304116))))

(assert (=> b!521250 (= res!319075 (validKeyInArray!0 (select (arr!15966 a!3235) j!176)))))

(declare-fun b!521251 () Bool)

(assert (=> b!521251 (= e!304116 e!304122)))

(declare-fun res!319069 () Bool)

(assert (=> b!521251 (=> (not res!319069) (not e!304122))))

(declare-fun lt!238835 () SeekEntryResult!4433)

(assert (=> b!521251 (= res!319069 (or (= lt!238835 (MissingZero!4433 i!1204)) (= lt!238835 (MissingVacant!4433 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33220 (_ BitVec 32)) SeekEntryResult!4433)

(assert (=> b!521251 (= lt!238835 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!521252 () Bool)

(assert (=> b!521252 (= e!304119 (= (seekEntryOrOpen!0 (select (arr!15966 a!3235) j!176) a!3235 mask!3524) (Found!4433 j!176)))))

(declare-fun b!521253 () Bool)

(declare-fun Unit!16187 () Unit!16184)

(assert (=> b!521253 (= e!304118 Unit!16187)))

(declare-fun b!521254 () Bool)

(declare-fun res!319071 () Bool)

(assert (=> b!521254 (=> (not res!319071) (not e!304122))))

(assert (=> b!521254 (= res!319071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521255 () Bool)

(declare-fun res!319076 () Bool)

(assert (=> b!521255 (=> res!319076 e!304121)))

(assert (=> b!521255 (= res!319076 (or (undefined!5245 lt!238840) (not (is-Intermediate!4433 lt!238840))))))

(assert (= (and start!47394 res!319074) b!521248))

(assert (= (and b!521248 res!319072) b!521250))

(assert (= (and b!521250 res!319075) b!521246))

(assert (= (and b!521246 res!319077) b!521244))

(assert (= (and b!521244 res!319078) b!521251))

(assert (= (and b!521251 res!319069) b!521254))

(assert (= (and b!521254 res!319071) b!521242))

(assert (= (and b!521242 res!319079) b!521245))

(assert (= (and b!521245 res!319073) b!521252))

(assert (= (and b!521245 (not res!319070)) b!521255))

(assert (= (and b!521255 (not res!319076)) b!521243))

(assert (= (and b!521243 c!61388) b!521249))

(assert (= (and b!521243 (not c!61388)) b!521253))

(assert (= (and b!521249 res!319068) b!521247))

(declare-fun m!502155 () Bool)

(assert (=> b!521254 m!502155))

(declare-fun m!502157 () Bool)

(assert (=> b!521242 m!502157))

(declare-fun m!502159 () Bool)

(assert (=> start!47394 m!502159))

(declare-fun m!502161 () Bool)

(assert (=> start!47394 m!502161))

(declare-fun m!502163 () Bool)

(assert (=> b!521250 m!502163))

(assert (=> b!521250 m!502163))

(declare-fun m!502165 () Bool)

(assert (=> b!521250 m!502165))

(declare-fun m!502167 () Bool)

(assert (=> b!521245 m!502167))

(declare-fun m!502169 () Bool)

(assert (=> b!521245 m!502169))

(declare-fun m!502171 () Bool)

(assert (=> b!521245 m!502171))

(declare-fun m!502173 () Bool)

(assert (=> b!521245 m!502173))

(declare-fun m!502175 () Bool)

(assert (=> b!521245 m!502175))

(assert (=> b!521245 m!502163))

(declare-fun m!502177 () Bool)

(assert (=> b!521245 m!502177))

(assert (=> b!521245 m!502163))

(assert (=> b!521245 m!502163))

(declare-fun m!502179 () Bool)

(assert (=> b!521245 m!502179))

(declare-fun m!502181 () Bool)

(assert (=> b!521245 m!502181))

(declare-fun m!502183 () Bool)

(assert (=> b!521244 m!502183))

(assert (=> b!521252 m!502163))

(assert (=> b!521252 m!502163))

(declare-fun m!502185 () Bool)

(assert (=> b!521252 m!502185))

(declare-fun m!502187 () Bool)

(assert (=> b!521251 m!502187))

(declare-fun m!502189 () Bool)

(assert (=> b!521246 m!502189))

(declare-fun m!502191 () Bool)

(assert (=> b!521249 m!502191))

(declare-fun m!502193 () Bool)

(assert (=> b!521249 m!502193))

(declare-fun m!502195 () Bool)

(assert (=> b!521243 m!502195))

(assert (=> b!521243 m!502163))

(push 1)

