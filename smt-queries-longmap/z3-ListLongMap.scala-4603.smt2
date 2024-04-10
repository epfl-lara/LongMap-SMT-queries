; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64194 () Bool)

(assert start!64194)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40832 0))(
  ( (array!40833 (arr!19540 (Array (_ BitVec 32) (_ BitVec 64))) (size!19961 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40832)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!721037 () Bool)

(declare-fun e!404335 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7140 0))(
  ( (MissingZero!7140 (index!30928 (_ BitVec 32))) (Found!7140 (index!30929 (_ BitVec 32))) (Intermediate!7140 (undefined!7952 Bool) (index!30930 (_ BitVec 32)) (x!61932 (_ BitVec 32))) (Undefined!7140) (MissingVacant!7140 (index!30931 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40832 (_ BitVec 32)) SeekEntryResult!7140)

(assert (=> b!721037 (= e!404335 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19540 a!3186) j!159) a!3186 mask!3328) (Found!7140 j!159)))))

(declare-fun b!721038 () Bool)

(declare-fun res!483124 () Bool)

(declare-fun e!404334 () Bool)

(assert (=> b!721038 (=> (not res!483124) (not e!404334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721038 (= res!483124 (validKeyInArray!0 (select (arr!19540 a!3186) j!159)))))

(declare-fun b!721039 () Bool)

(declare-fun res!483126 () Bool)

(declare-fun e!404336 () Bool)

(assert (=> b!721039 (=> (not res!483126) (not e!404336))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721039 (= res!483126 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19961 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19961 a!3186))))))

(declare-fun b!721040 () Bool)

(declare-fun e!404332 () Bool)

(declare-fun lt!319944 () (_ BitVec 32))

(assert (=> b!721040 (= e!404332 (and (bvsge mask!3328 #b00000000000000000000000000000000) (or (bvslt lt!319944 #b00000000000000000000000000000000) (bvsge lt!319944 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721040 (= lt!319944 (toIndex!0 (select (store (arr!19540 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(declare-fun b!721041 () Bool)

(declare-fun res!483127 () Bool)

(assert (=> b!721041 (=> (not res!483127) (not e!404334))))

(declare-fun arrayContainsKey!0 (array!40832 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721041 (= res!483127 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!483117 () Bool)

(assert (=> start!64194 (=> (not res!483117) (not e!404334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64194 (= res!483117 (validMask!0 mask!3328))))

(assert (=> start!64194 e!404334))

(assert (=> start!64194 true))

(declare-fun array_inv!15336 (array!40832) Bool)

(assert (=> start!64194 (array_inv!15336 a!3186)))

(declare-fun b!721042 () Bool)

(assert (=> b!721042 (= e!404334 e!404336)))

(declare-fun res!483123 () Bool)

(assert (=> b!721042 (=> (not res!483123) (not e!404336))))

(declare-fun lt!319945 () SeekEntryResult!7140)

(assert (=> b!721042 (= res!483123 (or (= lt!319945 (MissingZero!7140 i!1173)) (= lt!319945 (MissingVacant!7140 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40832 (_ BitVec 32)) SeekEntryResult!7140)

(assert (=> b!721042 (= lt!319945 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!721043 () Bool)

(declare-fun res!483122 () Bool)

(assert (=> b!721043 (=> (not res!483122) (not e!404336))))

(declare-datatypes ((List!13542 0))(
  ( (Nil!13539) (Cons!13538 (h!14589 (_ BitVec 64)) (t!19857 List!13542)) )
))
(declare-fun arrayNoDuplicates!0 (array!40832 (_ BitVec 32) List!13542) Bool)

(assert (=> b!721043 (= res!483122 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13539))))

(declare-fun b!721044 () Bool)

(declare-fun res!483120 () Bool)

(assert (=> b!721044 (=> (not res!483120) (not e!404334))))

(assert (=> b!721044 (= res!483120 (validKeyInArray!0 k0!2102))))

(declare-fun b!721045 () Bool)

(declare-fun res!483121 () Bool)

(assert (=> b!721045 (=> (not res!483121) (not e!404332))))

(assert (=> b!721045 (= res!483121 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19540 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721046 () Bool)

(assert (=> b!721046 (= e!404336 e!404332)))

(declare-fun res!483128 () Bool)

(assert (=> b!721046 (=> (not res!483128) (not e!404332))))

(declare-fun lt!319946 () SeekEntryResult!7140)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40832 (_ BitVec 32)) SeekEntryResult!7140)

(assert (=> b!721046 (= res!483128 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19540 a!3186) j!159) mask!3328) (select (arr!19540 a!3186) j!159) a!3186 mask!3328) lt!319946))))

(assert (=> b!721046 (= lt!319946 (Intermediate!7140 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721047 () Bool)

(assert (=> b!721047 (= e!404335 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19540 a!3186) j!159) a!3186 mask!3328) lt!319946))))

(declare-fun b!721048 () Bool)

(declare-fun res!483118 () Bool)

(assert (=> b!721048 (=> (not res!483118) (not e!404336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40832 (_ BitVec 32)) Bool)

(assert (=> b!721048 (= res!483118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721049 () Bool)

(declare-fun res!483125 () Bool)

(assert (=> b!721049 (=> (not res!483125) (not e!404334))))

(assert (=> b!721049 (= res!483125 (and (= (size!19961 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19961 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19961 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!721050 () Bool)

(declare-fun res!483119 () Bool)

(assert (=> b!721050 (=> (not res!483119) (not e!404332))))

(assert (=> b!721050 (= res!483119 e!404335)))

(declare-fun c!79330 () Bool)

(assert (=> b!721050 (= c!79330 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64194 res!483117) b!721049))

(assert (= (and b!721049 res!483125) b!721038))

(assert (= (and b!721038 res!483124) b!721044))

(assert (= (and b!721044 res!483120) b!721041))

(assert (= (and b!721041 res!483127) b!721042))

(assert (= (and b!721042 res!483123) b!721048))

(assert (= (and b!721048 res!483118) b!721043))

(assert (= (and b!721043 res!483122) b!721039))

(assert (= (and b!721039 res!483126) b!721046))

(assert (= (and b!721046 res!483128) b!721045))

(assert (= (and b!721045 res!483121) b!721050))

(assert (= (and b!721050 c!79330) b!721047))

(assert (= (and b!721050 (not c!79330)) b!721037))

(assert (= (and b!721050 res!483119) b!721040))

(declare-fun m!676001 () Bool)

(assert (=> b!721043 m!676001))

(declare-fun m!676003 () Bool)

(assert (=> b!721040 m!676003))

(declare-fun m!676005 () Bool)

(assert (=> b!721040 m!676005))

(assert (=> b!721040 m!676005))

(declare-fun m!676007 () Bool)

(assert (=> b!721040 m!676007))

(declare-fun m!676009 () Bool)

(assert (=> start!64194 m!676009))

(declare-fun m!676011 () Bool)

(assert (=> start!64194 m!676011))

(declare-fun m!676013 () Bool)

(assert (=> b!721037 m!676013))

(assert (=> b!721037 m!676013))

(declare-fun m!676015 () Bool)

(assert (=> b!721037 m!676015))

(declare-fun m!676017 () Bool)

(assert (=> b!721042 m!676017))

(declare-fun m!676019 () Bool)

(assert (=> b!721041 m!676019))

(assert (=> b!721038 m!676013))

(assert (=> b!721038 m!676013))

(declare-fun m!676021 () Bool)

(assert (=> b!721038 m!676021))

(assert (=> b!721046 m!676013))

(assert (=> b!721046 m!676013))

(declare-fun m!676023 () Bool)

(assert (=> b!721046 m!676023))

(assert (=> b!721046 m!676023))

(assert (=> b!721046 m!676013))

(declare-fun m!676025 () Bool)

(assert (=> b!721046 m!676025))

(declare-fun m!676027 () Bool)

(assert (=> b!721045 m!676027))

(assert (=> b!721047 m!676013))

(assert (=> b!721047 m!676013))

(declare-fun m!676029 () Bool)

(assert (=> b!721047 m!676029))

(declare-fun m!676031 () Bool)

(assert (=> b!721044 m!676031))

(declare-fun m!676033 () Bool)

(assert (=> b!721048 m!676033))

(check-sat (not b!721037) (not b!721047) (not b!721044) (not b!721040) (not b!721046) (not b!721038) (not b!721048) (not b!721041) (not b!721042) (not b!721043) (not start!64194))
(check-sat)
(get-model)

(declare-fun d!99183 () Bool)

(assert (=> d!99183 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!721044 d!99183))

(declare-fun b!721129 () Bool)

(declare-fun e!404381 () Bool)

(declare-fun e!404377 () Bool)

(assert (=> b!721129 (= e!404381 e!404377)))

(declare-fun res!483183 () Bool)

(declare-fun lt!319970 () SeekEntryResult!7140)

(get-info :version)

(assert (=> b!721129 (= res!483183 (and ((_ is Intermediate!7140) lt!319970) (not (undefined!7952 lt!319970)) (bvslt (x!61932 lt!319970) #b01111111111111111111111111111110) (bvsge (x!61932 lt!319970) #b00000000000000000000000000000000) (bvsge (x!61932 lt!319970) #b00000000000000000000000000000000)))))

(assert (=> b!721129 (=> (not res!483183) (not e!404377))))

(declare-fun b!721130 () Bool)

(declare-fun e!404380 () SeekEntryResult!7140)

(declare-fun e!404379 () SeekEntryResult!7140)

(assert (=> b!721130 (= e!404380 e!404379)))

(declare-fun lt!319969 () (_ BitVec 64))

(declare-fun c!79343 () Bool)

(assert (=> b!721130 (= c!79343 (or (= lt!319969 (select (arr!19540 a!3186) j!159)) (= (bvadd lt!319969 lt!319969) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721132 () Bool)

(assert (=> b!721132 (and (bvsge (index!30930 lt!319970) #b00000000000000000000000000000000) (bvslt (index!30930 lt!319970) (size!19961 a!3186)))))

(declare-fun res!483184 () Bool)

(assert (=> b!721132 (= res!483184 (= (select (arr!19540 a!3186) (index!30930 lt!319970)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!404378 () Bool)

(assert (=> b!721132 (=> res!483184 e!404378)))

(declare-fun b!721133 () Bool)

(assert (=> b!721133 (= e!404380 (Intermediate!7140 true (toIndex!0 (select (arr!19540 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!721134 () Bool)

(assert (=> b!721134 (and (bvsge (index!30930 lt!319970) #b00000000000000000000000000000000) (bvslt (index!30930 lt!319970) (size!19961 a!3186)))))

(declare-fun res!483185 () Bool)

(assert (=> b!721134 (= res!483185 (= (select (arr!19540 a!3186) (index!30930 lt!319970)) (select (arr!19540 a!3186) j!159)))))

(assert (=> b!721134 (=> res!483185 e!404378)))

(assert (=> b!721134 (= e!404377 e!404378)))

(declare-fun b!721135 () Bool)

(assert (=> b!721135 (= e!404381 (bvsge (x!61932 lt!319970) #b01111111111111111111111111111110))))

(declare-fun b!721136 () Bool)

(assert (=> b!721136 (= e!404379 (Intermediate!7140 false (toIndex!0 (select (arr!19540 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!721137 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721137 (= e!404379 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19540 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19540 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!721131 () Bool)

(assert (=> b!721131 (and (bvsge (index!30930 lt!319970) #b00000000000000000000000000000000) (bvslt (index!30930 lt!319970) (size!19961 a!3186)))))

(assert (=> b!721131 (= e!404378 (= (select (arr!19540 a!3186) (index!30930 lt!319970)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!99185 () Bool)

(assert (=> d!99185 e!404381))

(declare-fun c!79344 () Bool)

(assert (=> d!99185 (= c!79344 (and ((_ is Intermediate!7140) lt!319970) (undefined!7952 lt!319970)))))

(assert (=> d!99185 (= lt!319970 e!404380)))

(declare-fun c!79345 () Bool)

(assert (=> d!99185 (= c!79345 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!99185 (= lt!319969 (select (arr!19540 a!3186) (toIndex!0 (select (arr!19540 a!3186) j!159) mask!3328)))))

(assert (=> d!99185 (validMask!0 mask!3328)))

(assert (=> d!99185 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19540 a!3186) j!159) mask!3328) (select (arr!19540 a!3186) j!159) a!3186 mask!3328) lt!319970)))

(assert (= (and d!99185 c!79345) b!721133))

(assert (= (and d!99185 (not c!79345)) b!721130))

(assert (= (and b!721130 c!79343) b!721136))

(assert (= (and b!721130 (not c!79343)) b!721137))

(assert (= (and d!99185 c!79344) b!721135))

(assert (= (and d!99185 (not c!79344)) b!721129))

(assert (= (and b!721129 res!483183) b!721134))

(assert (= (and b!721134 (not res!483185)) b!721132))

(assert (= (and b!721132 (not res!483184)) b!721131))

(assert (=> b!721137 m!676023))

(declare-fun m!676083 () Bool)

(assert (=> b!721137 m!676083))

(assert (=> b!721137 m!676083))

(assert (=> b!721137 m!676013))

(declare-fun m!676085 () Bool)

(assert (=> b!721137 m!676085))

(declare-fun m!676087 () Bool)

(assert (=> b!721134 m!676087))

(assert (=> d!99185 m!676023))

(declare-fun m!676089 () Bool)

(assert (=> d!99185 m!676089))

(assert (=> d!99185 m!676009))

(assert (=> b!721132 m!676087))

(assert (=> b!721131 m!676087))

(assert (=> b!721046 d!99185))

(declare-fun d!99195 () Bool)

(declare-fun lt!319980 () (_ BitVec 32))

(declare-fun lt!319979 () (_ BitVec 32))

(assert (=> d!99195 (= lt!319980 (bvmul (bvxor lt!319979 (bvlshr lt!319979 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99195 (= lt!319979 ((_ extract 31 0) (bvand (bvxor (select (arr!19540 a!3186) j!159) (bvlshr (select (arr!19540 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99195 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!483186 (let ((h!14591 ((_ extract 31 0) (bvand (bvxor (select (arr!19540 a!3186) j!159) (bvlshr (select (arr!19540 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!61935 (bvmul (bvxor h!14591 (bvlshr h!14591 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!61935 (bvlshr x!61935 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!483186 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!483186 #b00000000000000000000000000000000))))))

(assert (=> d!99195 (= (toIndex!0 (select (arr!19540 a!3186) j!159) mask!3328) (bvand (bvxor lt!319980 (bvlshr lt!319980 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!721046 d!99195))

(declare-fun d!99197 () Bool)

(declare-fun res!483197 () Bool)

(declare-fun e!404396 () Bool)

(assert (=> d!99197 (=> res!483197 e!404396)))

(assert (=> d!99197 (= res!483197 (= (select (arr!19540 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!99197 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!404396)))

(declare-fun b!721160 () Bool)

(declare-fun e!404397 () Bool)

(assert (=> b!721160 (= e!404396 e!404397)))

(declare-fun res!483198 () Bool)

(assert (=> b!721160 (=> (not res!483198) (not e!404397))))

(assert (=> b!721160 (= res!483198 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19961 a!3186)))))

(declare-fun b!721161 () Bool)

(assert (=> b!721161 (= e!404397 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99197 (not res!483197)) b!721160))

(assert (= (and b!721160 res!483198) b!721161))

(declare-fun m!676091 () Bool)

(assert (=> d!99197 m!676091))

(declare-fun m!676093 () Bool)

(assert (=> b!721161 m!676093))

(assert (=> b!721041 d!99197))

(declare-fun d!99199 () Bool)

(assert (=> d!99199 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64194 d!99199))

(declare-fun d!99205 () Bool)

(assert (=> d!99205 (= (array_inv!15336 a!3186) (bvsge (size!19961 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64194 d!99205))

(declare-fun d!99207 () Bool)

(declare-fun lt!319990 () (_ BitVec 32))

(declare-fun lt!319989 () (_ BitVec 32))

(assert (=> d!99207 (= lt!319990 (bvmul (bvxor lt!319989 (bvlshr lt!319989 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99207 (= lt!319989 ((_ extract 31 0) (bvand (bvxor (select (store (arr!19540 a!3186) i!1173 k0!2102) j!159) (bvlshr (select (store (arr!19540 a!3186) i!1173 k0!2102) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99207 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!483186 (let ((h!14591 ((_ extract 31 0) (bvand (bvxor (select (store (arr!19540 a!3186) i!1173 k0!2102) j!159) (bvlshr (select (store (arr!19540 a!3186) i!1173 k0!2102) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!61935 (bvmul (bvxor h!14591 (bvlshr h!14591 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!61935 (bvlshr x!61935 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!483186 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!483186 #b00000000000000000000000000000000))))))

(assert (=> d!99207 (= (toIndex!0 (select (store (arr!19540 a!3186) i!1173 k0!2102) j!159) mask!3328) (bvand (bvxor lt!319990 (bvlshr lt!319990 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!721040 d!99207))

(declare-fun b!721246 () Bool)

(declare-fun e!404451 () SeekEntryResult!7140)

(declare-fun lt!320015 () SeekEntryResult!7140)

(assert (=> b!721246 (= e!404451 (seekKeyOrZeroReturnVacant!0 (x!61932 lt!320015) (index!30930 lt!320015) (index!30930 lt!320015) k0!2102 a!3186 mask!3328))))

(declare-fun b!721247 () Bool)

(assert (=> b!721247 (= e!404451 (MissingZero!7140 (index!30930 lt!320015)))))

(declare-fun b!721248 () Bool)

(declare-fun c!79382 () Bool)

(declare-fun lt!320014 () (_ BitVec 64))

(assert (=> b!721248 (= c!79382 (= lt!320014 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!404450 () SeekEntryResult!7140)

(assert (=> b!721248 (= e!404450 e!404451)))

(declare-fun b!721249 () Bool)

(assert (=> b!721249 (= e!404450 (Found!7140 (index!30930 lt!320015)))))

(declare-fun b!721250 () Bool)

(declare-fun e!404449 () SeekEntryResult!7140)

(assert (=> b!721250 (= e!404449 Undefined!7140)))

(declare-fun d!99209 () Bool)

(declare-fun lt!320013 () SeekEntryResult!7140)

(assert (=> d!99209 (and (or ((_ is Undefined!7140) lt!320013) (not ((_ is Found!7140) lt!320013)) (and (bvsge (index!30929 lt!320013) #b00000000000000000000000000000000) (bvslt (index!30929 lt!320013) (size!19961 a!3186)))) (or ((_ is Undefined!7140) lt!320013) ((_ is Found!7140) lt!320013) (not ((_ is MissingZero!7140) lt!320013)) (and (bvsge (index!30928 lt!320013) #b00000000000000000000000000000000) (bvslt (index!30928 lt!320013) (size!19961 a!3186)))) (or ((_ is Undefined!7140) lt!320013) ((_ is Found!7140) lt!320013) ((_ is MissingZero!7140) lt!320013) (not ((_ is MissingVacant!7140) lt!320013)) (and (bvsge (index!30931 lt!320013) #b00000000000000000000000000000000) (bvslt (index!30931 lt!320013) (size!19961 a!3186)))) (or ((_ is Undefined!7140) lt!320013) (ite ((_ is Found!7140) lt!320013) (= (select (arr!19540 a!3186) (index!30929 lt!320013)) k0!2102) (ite ((_ is MissingZero!7140) lt!320013) (= (select (arr!19540 a!3186) (index!30928 lt!320013)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7140) lt!320013) (= (select (arr!19540 a!3186) (index!30931 lt!320013)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99209 (= lt!320013 e!404449)))

(declare-fun c!79384 () Bool)

(assert (=> d!99209 (= c!79384 (and ((_ is Intermediate!7140) lt!320015) (undefined!7952 lt!320015)))))

(assert (=> d!99209 (= lt!320015 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!99209 (validMask!0 mask!3328)))

(assert (=> d!99209 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!320013)))

(declare-fun b!721251 () Bool)

(assert (=> b!721251 (= e!404449 e!404450)))

(assert (=> b!721251 (= lt!320014 (select (arr!19540 a!3186) (index!30930 lt!320015)))))

(declare-fun c!79383 () Bool)

(assert (=> b!721251 (= c!79383 (= lt!320014 k0!2102))))

(assert (= (and d!99209 c!79384) b!721250))

(assert (= (and d!99209 (not c!79384)) b!721251))

(assert (= (and b!721251 c!79383) b!721249))

(assert (= (and b!721251 (not c!79383)) b!721248))

(assert (= (and b!721248 c!79382) b!721247))

(assert (= (and b!721248 (not c!79382)) b!721246))

(declare-fun m!676133 () Bool)

(assert (=> b!721246 m!676133))

(assert (=> d!99209 m!676009))

(declare-fun m!676135 () Bool)

(assert (=> d!99209 m!676135))

(declare-fun m!676137 () Bool)

(assert (=> d!99209 m!676137))

(declare-fun m!676139 () Bool)

(assert (=> d!99209 m!676139))

(assert (=> d!99209 m!676139))

(declare-fun m!676141 () Bool)

(assert (=> d!99209 m!676141))

(declare-fun m!676143 () Bool)

(assert (=> d!99209 m!676143))

(declare-fun m!676145 () Bool)

(assert (=> b!721251 m!676145))

(assert (=> b!721042 d!99209))

(declare-fun b!721306 () Bool)

(declare-fun e!404484 () SeekEntryResult!7140)

(assert (=> b!721306 (= e!404484 Undefined!7140)))

(declare-fun b!721308 () Bool)

(declare-fun e!404485 () SeekEntryResult!7140)

(assert (=> b!721308 (= e!404484 e!404485)))

(declare-fun lt!320036 () (_ BitVec 64))

(declare-fun c!79407 () Bool)

(assert (=> b!721308 (= c!79407 (= lt!320036 (select (arr!19540 a!3186) j!159)))))

(declare-fun b!721309 () Bool)

(assert (=> b!721309 (= e!404485 (Found!7140 index!1321))))

(declare-fun e!404486 () SeekEntryResult!7140)

(declare-fun b!721307 () Bool)

(assert (=> b!721307 (= e!404486 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19540 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!99223 () Bool)

(declare-fun lt!320037 () SeekEntryResult!7140)

(assert (=> d!99223 (and (or ((_ is Undefined!7140) lt!320037) (not ((_ is Found!7140) lt!320037)) (and (bvsge (index!30929 lt!320037) #b00000000000000000000000000000000) (bvslt (index!30929 lt!320037) (size!19961 a!3186)))) (or ((_ is Undefined!7140) lt!320037) ((_ is Found!7140) lt!320037) (not ((_ is MissingVacant!7140) lt!320037)) (not (= (index!30931 lt!320037) resIntermediateIndex!5)) (and (bvsge (index!30931 lt!320037) #b00000000000000000000000000000000) (bvslt (index!30931 lt!320037) (size!19961 a!3186)))) (or ((_ is Undefined!7140) lt!320037) (ite ((_ is Found!7140) lt!320037) (= (select (arr!19540 a!3186) (index!30929 lt!320037)) (select (arr!19540 a!3186) j!159)) (and ((_ is MissingVacant!7140) lt!320037) (= (index!30931 lt!320037) resIntermediateIndex!5) (= (select (arr!19540 a!3186) (index!30931 lt!320037)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99223 (= lt!320037 e!404484)))

(declare-fun c!79406 () Bool)

(assert (=> d!99223 (= c!79406 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99223 (= lt!320036 (select (arr!19540 a!3186) index!1321))))

(assert (=> d!99223 (validMask!0 mask!3328)))

(assert (=> d!99223 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19540 a!3186) j!159) a!3186 mask!3328) lt!320037)))

(declare-fun b!721310 () Bool)

(declare-fun c!79408 () Bool)

(assert (=> b!721310 (= c!79408 (= lt!320036 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!721310 (= e!404485 e!404486)))

(declare-fun b!721311 () Bool)

(assert (=> b!721311 (= e!404486 (MissingVacant!7140 resIntermediateIndex!5))))

(assert (= (and d!99223 c!79406) b!721306))

(assert (= (and d!99223 (not c!79406)) b!721308))

(assert (= (and b!721308 c!79407) b!721309))

(assert (= (and b!721308 (not c!79407)) b!721310))

(assert (= (and b!721310 c!79408) b!721311))

(assert (= (and b!721310 (not c!79408)) b!721307))

(declare-fun m!676165 () Bool)

(assert (=> b!721307 m!676165))

(assert (=> b!721307 m!676165))

(assert (=> b!721307 m!676013))

(declare-fun m!676167 () Bool)

(assert (=> b!721307 m!676167))

(declare-fun m!676169 () Bool)

(assert (=> d!99223 m!676169))

(declare-fun m!676171 () Bool)

(assert (=> d!99223 m!676171))

(declare-fun m!676173 () Bool)

(assert (=> d!99223 m!676173))

(assert (=> d!99223 m!676009))

(assert (=> b!721037 d!99223))

(declare-fun b!721312 () Bool)

(declare-fun e!404491 () Bool)

(declare-fun e!404487 () Bool)

(assert (=> b!721312 (= e!404491 e!404487)))

(declare-fun res!483237 () Bool)

(declare-fun lt!320039 () SeekEntryResult!7140)

(assert (=> b!721312 (= res!483237 (and ((_ is Intermediate!7140) lt!320039) (not (undefined!7952 lt!320039)) (bvslt (x!61932 lt!320039) #b01111111111111111111111111111110) (bvsge (x!61932 lt!320039) #b00000000000000000000000000000000) (bvsge (x!61932 lt!320039) x!1131)))))

(assert (=> b!721312 (=> (not res!483237) (not e!404487))))

(declare-fun b!721313 () Bool)

(declare-fun e!404490 () SeekEntryResult!7140)

(declare-fun e!404489 () SeekEntryResult!7140)

(assert (=> b!721313 (= e!404490 e!404489)))

(declare-fun c!79409 () Bool)

(declare-fun lt!320038 () (_ BitVec 64))

(assert (=> b!721313 (= c!79409 (or (= lt!320038 (select (arr!19540 a!3186) j!159)) (= (bvadd lt!320038 lt!320038) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721315 () Bool)

(assert (=> b!721315 (and (bvsge (index!30930 lt!320039) #b00000000000000000000000000000000) (bvslt (index!30930 lt!320039) (size!19961 a!3186)))))

(declare-fun res!483238 () Bool)

(assert (=> b!721315 (= res!483238 (= (select (arr!19540 a!3186) (index!30930 lt!320039)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!404488 () Bool)

(assert (=> b!721315 (=> res!483238 e!404488)))

(declare-fun b!721316 () Bool)

(assert (=> b!721316 (= e!404490 (Intermediate!7140 true index!1321 x!1131))))

(declare-fun b!721317 () Bool)

(assert (=> b!721317 (and (bvsge (index!30930 lt!320039) #b00000000000000000000000000000000) (bvslt (index!30930 lt!320039) (size!19961 a!3186)))))

(declare-fun res!483239 () Bool)

(assert (=> b!721317 (= res!483239 (= (select (arr!19540 a!3186) (index!30930 lt!320039)) (select (arr!19540 a!3186) j!159)))))

(assert (=> b!721317 (=> res!483239 e!404488)))

(assert (=> b!721317 (= e!404487 e!404488)))

(declare-fun b!721318 () Bool)

(assert (=> b!721318 (= e!404491 (bvsge (x!61932 lt!320039) #b01111111111111111111111111111110))))

(declare-fun b!721319 () Bool)

(assert (=> b!721319 (= e!404489 (Intermediate!7140 false index!1321 x!1131))))

(declare-fun b!721320 () Bool)

(assert (=> b!721320 (= e!404489 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19540 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!721314 () Bool)

(assert (=> b!721314 (and (bvsge (index!30930 lt!320039) #b00000000000000000000000000000000) (bvslt (index!30930 lt!320039) (size!19961 a!3186)))))

(assert (=> b!721314 (= e!404488 (= (select (arr!19540 a!3186) (index!30930 lt!320039)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!99235 () Bool)

(assert (=> d!99235 e!404491))

(declare-fun c!79410 () Bool)

(assert (=> d!99235 (= c!79410 (and ((_ is Intermediate!7140) lt!320039) (undefined!7952 lt!320039)))))

(assert (=> d!99235 (= lt!320039 e!404490)))

(declare-fun c!79411 () Bool)

(assert (=> d!99235 (= c!79411 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99235 (= lt!320038 (select (arr!19540 a!3186) index!1321))))

(assert (=> d!99235 (validMask!0 mask!3328)))

(assert (=> d!99235 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19540 a!3186) j!159) a!3186 mask!3328) lt!320039)))

(assert (= (and d!99235 c!79411) b!721316))

(assert (= (and d!99235 (not c!79411)) b!721313))

(assert (= (and b!721313 c!79409) b!721319))

(assert (= (and b!721313 (not c!79409)) b!721320))

(assert (= (and d!99235 c!79410) b!721318))

(assert (= (and d!99235 (not c!79410)) b!721312))

(assert (= (and b!721312 res!483237) b!721317))

(assert (= (and b!721317 (not res!483239)) b!721315))

(assert (= (and b!721315 (not res!483238)) b!721314))

(assert (=> b!721320 m!676165))

(assert (=> b!721320 m!676165))

(assert (=> b!721320 m!676013))

(declare-fun m!676175 () Bool)

(assert (=> b!721320 m!676175))

(declare-fun m!676177 () Bool)

(assert (=> b!721317 m!676177))

(assert (=> d!99235 m!676173))

(assert (=> d!99235 m!676009))

(assert (=> b!721315 m!676177))

(assert (=> b!721314 m!676177))

(assert (=> b!721047 d!99235))

(declare-fun d!99237 () Bool)

(assert (=> d!99237 (= (validKeyInArray!0 (select (arr!19540 a!3186) j!159)) (and (not (= (select (arr!19540 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19540 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!721038 d!99237))

(declare-fun b!721341 () Bool)

(declare-fun e!404506 () Bool)

(declare-fun e!404505 () Bool)

(assert (=> b!721341 (= e!404506 e!404505)))

(declare-fun c!79420 () Bool)

(assert (=> b!721341 (= c!79420 (validKeyInArray!0 (select (arr!19540 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!721342 () Bool)

(declare-fun call!34782 () Bool)

(assert (=> b!721342 (= e!404505 call!34782)))

(declare-fun b!721343 () Bool)

(declare-fun e!404504 () Bool)

(assert (=> b!721343 (= e!404504 call!34782)))

(declare-fun d!99239 () Bool)

(declare-fun res!483244 () Bool)

(assert (=> d!99239 (=> res!483244 e!404506)))

(assert (=> d!99239 (= res!483244 (bvsge #b00000000000000000000000000000000 (size!19961 a!3186)))))

(assert (=> d!99239 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!404506)))

(declare-fun b!721344 () Bool)

(assert (=> b!721344 (= e!404505 e!404504)))

(declare-fun lt!320057 () (_ BitVec 64))

(assert (=> b!721344 (= lt!320057 (select (arr!19540 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24678 0))(
  ( (Unit!24679) )
))
(declare-fun lt!320058 () Unit!24678)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40832 (_ BitVec 64) (_ BitVec 32)) Unit!24678)

(assert (=> b!721344 (= lt!320058 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!320057 #b00000000000000000000000000000000))))

(assert (=> b!721344 (arrayContainsKey!0 a!3186 lt!320057 #b00000000000000000000000000000000)))

(declare-fun lt!320056 () Unit!24678)

(assert (=> b!721344 (= lt!320056 lt!320058)))

(declare-fun res!483245 () Bool)

(assert (=> b!721344 (= res!483245 (= (seekEntryOrOpen!0 (select (arr!19540 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7140 #b00000000000000000000000000000000)))))

(assert (=> b!721344 (=> (not res!483245) (not e!404504))))

(declare-fun bm!34779 () Bool)

(assert (=> bm!34779 (= call!34782 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(assert (= (and d!99239 (not res!483244)) b!721341))

(assert (= (and b!721341 c!79420) b!721344))

(assert (= (and b!721341 (not c!79420)) b!721342))

(assert (= (and b!721344 res!483245) b!721343))

(assert (= (or b!721343 b!721342) bm!34779))

(assert (=> b!721341 m!676091))

(assert (=> b!721341 m!676091))

(declare-fun m!676179 () Bool)

(assert (=> b!721341 m!676179))

(assert (=> b!721344 m!676091))

(declare-fun m!676181 () Bool)

(assert (=> b!721344 m!676181))

(declare-fun m!676183 () Bool)

(assert (=> b!721344 m!676183))

(assert (=> b!721344 m!676091))

(declare-fun m!676185 () Bool)

(assert (=> b!721344 m!676185))

(declare-fun m!676187 () Bool)

(assert (=> bm!34779 m!676187))

(assert (=> b!721048 d!99239))

(declare-fun b!721373 () Bool)

(declare-fun e!404525 () Bool)

(declare-fun contains!4045 (List!13542 (_ BitVec 64)) Bool)

(assert (=> b!721373 (= e!404525 (contains!4045 Nil!13539 (select (arr!19540 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!721374 () Bool)

(declare-fun e!404526 () Bool)

(declare-fun e!404527 () Bool)

(assert (=> b!721374 (= e!404526 e!404527)))

(declare-fun c!79432 () Bool)

(assert (=> b!721374 (= c!79432 (validKeyInArray!0 (select (arr!19540 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!721375 () Bool)

(declare-fun e!404524 () Bool)

(assert (=> b!721375 (= e!404524 e!404526)))

(declare-fun res!483252 () Bool)

(assert (=> b!721375 (=> (not res!483252) (not e!404526))))

(assert (=> b!721375 (= res!483252 (not e!404525))))

(declare-fun res!483253 () Bool)

(assert (=> b!721375 (=> (not res!483253) (not e!404525))))

(assert (=> b!721375 (= res!483253 (validKeyInArray!0 (select (arr!19540 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!721376 () Bool)

(declare-fun call!34785 () Bool)

(assert (=> b!721376 (= e!404527 call!34785)))

(declare-fun b!721377 () Bool)

(assert (=> b!721377 (= e!404527 call!34785)))

(declare-fun d!99243 () Bool)

(declare-fun res!483254 () Bool)

(assert (=> d!99243 (=> res!483254 e!404524)))

(assert (=> d!99243 (= res!483254 (bvsge #b00000000000000000000000000000000 (size!19961 a!3186)))))

(assert (=> d!99243 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13539) e!404524)))

(declare-fun bm!34782 () Bool)

(assert (=> bm!34782 (= call!34785 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79432 (Cons!13538 (select (arr!19540 a!3186) #b00000000000000000000000000000000) Nil!13539) Nil!13539)))))

(assert (= (and d!99243 (not res!483254)) b!721375))

(assert (= (and b!721375 res!483253) b!721373))

(assert (= (and b!721375 res!483252) b!721374))

(assert (= (and b!721374 c!79432) b!721377))

(assert (= (and b!721374 (not c!79432)) b!721376))

(assert (= (or b!721377 b!721376) bm!34782))

(assert (=> b!721373 m!676091))

(assert (=> b!721373 m!676091))

(declare-fun m!676199 () Bool)

(assert (=> b!721373 m!676199))

(assert (=> b!721374 m!676091))

(assert (=> b!721374 m!676091))

(assert (=> b!721374 m!676179))

(assert (=> b!721375 m!676091))

(assert (=> b!721375 m!676091))

(assert (=> b!721375 m!676179))

(assert (=> bm!34782 m!676091))

(declare-fun m!676201 () Bool)

(assert (=> bm!34782 m!676201))

(assert (=> b!721043 d!99243))

(check-sat (not b!721320) (not b!721307) (not b!721341) (not b!721375) (not b!721374) (not b!721246) (not bm!34779) (not d!99185) (not d!99223) (not bm!34782) (not d!99235) (not b!721137) (not b!721373) (not d!99209) (not b!721344) (not b!721161))
(check-sat)
