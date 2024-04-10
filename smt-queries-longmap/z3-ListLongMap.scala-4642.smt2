; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64554 () Bool)

(assert start!64554)

(declare-fun b!727243 () Bool)

(declare-fun res!488143 () Bool)

(declare-fun e!407124 () Bool)

(assert (=> b!727243 (=> (not res!488143) (not e!407124))))

(declare-datatypes ((array!41072 0))(
  ( (array!41073 (arr!19657 (Array (_ BitVec 32) (_ BitVec 64))) (size!20078 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41072)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!727243 (= res!488143 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20078 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20078 a!3186))))))

(declare-fun lt!322101 () (_ BitVec 32))

(declare-fun b!727244 () Bool)

(declare-fun e!407123 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!727244 (= e!407123 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvslt mask!3328 #b00000000000000000000000000000000) (and (bvsge lt!322101 #b00000000000000000000000000000000) (bvslt lt!322101 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727244 (= lt!322101 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun e!407125 () Bool)

(declare-fun b!727245 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7257 0))(
  ( (MissingZero!7257 (index!31396 (_ BitVec 32))) (Found!7257 (index!31397 (_ BitVec 32))) (Intermediate!7257 (undefined!8069 Bool) (index!31398 (_ BitVec 32)) (x!62379 (_ BitVec 32))) (Undefined!7257) (MissingVacant!7257 (index!31399 (_ BitVec 32))) )
))
(declare-fun lt!322106 () SeekEntryResult!7257)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41072 (_ BitVec 32)) SeekEntryResult!7257)

(assert (=> b!727245 (= e!407125 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19657 a!3186) j!159) a!3186 mask!3328) lt!322106))))

(declare-fun e!407121 () Bool)

(declare-fun b!727246 () Bool)

(declare-fun lt!322104 () SeekEntryResult!7257)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41072 (_ BitVec 32)) SeekEntryResult!7257)

(assert (=> b!727246 (= e!407121 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19657 a!3186) j!159) a!3186 mask!3328) lt!322104))))

(declare-fun b!727247 () Bool)

(declare-fun e!407129 () Bool)

(assert (=> b!727247 (= e!407129 e!407121)))

(declare-fun res!488146 () Bool)

(assert (=> b!727247 (=> (not res!488146) (not e!407121))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41072 (_ BitVec 32)) SeekEntryResult!7257)

(assert (=> b!727247 (= res!488146 (= (seekEntryOrOpen!0 (select (arr!19657 a!3186) j!159) a!3186 mask!3328) lt!322104))))

(assert (=> b!727247 (= lt!322104 (Found!7257 j!159))))

(declare-fun b!727248 () Bool)

(declare-fun e!407128 () Bool)

(assert (=> b!727248 (= e!407128 e!407124)))

(declare-fun res!488142 () Bool)

(assert (=> b!727248 (=> (not res!488142) (not e!407124))))

(declare-fun lt!322098 () SeekEntryResult!7257)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!727248 (= res!488142 (or (= lt!322098 (MissingZero!7257 i!1173)) (= lt!322098 (MissingVacant!7257 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!727248 (= lt!322098 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!727249 () Bool)

(assert (=> b!727249 (= e!407125 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19657 a!3186) j!159) a!3186 mask!3328) (Found!7257 j!159)))))

(declare-fun b!727251 () Bool)

(declare-fun res!488144 () Bool)

(assert (=> b!727251 (=> (not res!488144) (not e!407128))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!727251 (= res!488144 (validKeyInArray!0 k0!2102))))

(declare-fun b!727252 () Bool)

(declare-fun res!488145 () Bool)

(assert (=> b!727252 (=> (not res!488145) (not e!407128))))

(assert (=> b!727252 (= res!488145 (validKeyInArray!0 (select (arr!19657 a!3186) j!159)))))

(declare-fun b!727253 () Bool)

(declare-fun e!407126 () Bool)

(assert (=> b!727253 (= e!407124 e!407126)))

(declare-fun res!488135 () Bool)

(assert (=> b!727253 (=> (not res!488135) (not e!407126))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727253 (= res!488135 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19657 a!3186) j!159) mask!3328) (select (arr!19657 a!3186) j!159) a!3186 mask!3328) lt!322106))))

(assert (=> b!727253 (= lt!322106 (Intermediate!7257 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!727254 () Bool)

(declare-fun e!407127 () Bool)

(assert (=> b!727254 (= e!407127 (not e!407123))))

(declare-fun res!488147 () Bool)

(assert (=> b!727254 (=> res!488147 e!407123)))

(declare-fun lt!322105 () SeekEntryResult!7257)

(get-info :version)

(assert (=> b!727254 (= res!488147 (or (not ((_ is Intermediate!7257) lt!322105)) (bvsge x!1131 (x!62379 lt!322105))))))

(assert (=> b!727254 e!407129))

(declare-fun res!488136 () Bool)

(assert (=> b!727254 (=> (not res!488136) (not e!407129))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41072 (_ BitVec 32)) Bool)

(assert (=> b!727254 (= res!488136 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24832 0))(
  ( (Unit!24833) )
))
(declare-fun lt!322099 () Unit!24832)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41072 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24832)

(assert (=> b!727254 (= lt!322099 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!727255 () Bool)

(declare-fun res!488137 () Bool)

(assert (=> b!727255 (=> (not res!488137) (not e!407124))))

(assert (=> b!727255 (= res!488137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!727256 () Bool)

(declare-fun res!488141 () Bool)

(assert (=> b!727256 (=> (not res!488141) (not e!407128))))

(assert (=> b!727256 (= res!488141 (and (= (size!20078 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20078 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20078 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!727257 () Bool)

(assert (=> b!727257 (= e!407126 e!407127)))

(declare-fun res!488138 () Bool)

(assert (=> b!727257 (=> (not res!488138) (not e!407127))))

(declare-fun lt!322102 () SeekEntryResult!7257)

(assert (=> b!727257 (= res!488138 (= lt!322102 lt!322105))))

(declare-fun lt!322100 () (_ BitVec 64))

(declare-fun lt!322103 () array!41072)

(assert (=> b!727257 (= lt!322105 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322100 lt!322103 mask!3328))))

(assert (=> b!727257 (= lt!322102 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322100 mask!3328) lt!322100 lt!322103 mask!3328))))

(assert (=> b!727257 (= lt!322100 (select (store (arr!19657 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!727257 (= lt!322103 (array!41073 (store (arr!19657 a!3186) i!1173 k0!2102) (size!20078 a!3186)))))

(declare-fun b!727258 () Bool)

(declare-fun res!488149 () Bool)

(assert (=> b!727258 (=> (not res!488149) (not e!407126))))

(assert (=> b!727258 (= res!488149 e!407125)))

(declare-fun c!79927 () Bool)

(assert (=> b!727258 (= c!79927 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!488139 () Bool)

(assert (=> start!64554 (=> (not res!488139) (not e!407128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64554 (= res!488139 (validMask!0 mask!3328))))

(assert (=> start!64554 e!407128))

(assert (=> start!64554 true))

(declare-fun array_inv!15453 (array!41072) Bool)

(assert (=> start!64554 (array_inv!15453 a!3186)))

(declare-fun b!727250 () Bool)

(declare-fun res!488150 () Bool)

(assert (=> b!727250 (=> (not res!488150) (not e!407124))))

(declare-datatypes ((List!13659 0))(
  ( (Nil!13656) (Cons!13655 (h!14712 (_ BitVec 64)) (t!19974 List!13659)) )
))
(declare-fun arrayNoDuplicates!0 (array!41072 (_ BitVec 32) List!13659) Bool)

(assert (=> b!727250 (= res!488150 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13656))))

(declare-fun b!727259 () Bool)

(declare-fun res!488140 () Bool)

(assert (=> b!727259 (=> (not res!488140) (not e!407128))))

(declare-fun arrayContainsKey!0 (array!41072 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!727259 (= res!488140 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!727260 () Bool)

(declare-fun res!488148 () Bool)

(assert (=> b!727260 (=> (not res!488148) (not e!407126))))

(assert (=> b!727260 (= res!488148 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19657 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!64554 res!488139) b!727256))

(assert (= (and b!727256 res!488141) b!727252))

(assert (= (and b!727252 res!488145) b!727251))

(assert (= (and b!727251 res!488144) b!727259))

(assert (= (and b!727259 res!488140) b!727248))

(assert (= (and b!727248 res!488142) b!727255))

(assert (= (and b!727255 res!488137) b!727250))

(assert (= (and b!727250 res!488150) b!727243))

(assert (= (and b!727243 res!488143) b!727253))

(assert (= (and b!727253 res!488135) b!727260))

(assert (= (and b!727260 res!488148) b!727258))

(assert (= (and b!727258 c!79927) b!727245))

(assert (= (and b!727258 (not c!79927)) b!727249))

(assert (= (and b!727258 res!488149) b!727257))

(assert (= (and b!727257 res!488138) b!727254))

(assert (= (and b!727254 res!488136) b!727247))

(assert (= (and b!727247 res!488146) b!727246))

(assert (= (and b!727254 (not res!488147)) b!727244))

(declare-fun m!681217 () Bool)

(assert (=> b!727260 m!681217))

(declare-fun m!681219 () Bool)

(assert (=> b!727248 m!681219))

(declare-fun m!681221 () Bool)

(assert (=> b!727246 m!681221))

(assert (=> b!727246 m!681221))

(declare-fun m!681223 () Bool)

(assert (=> b!727246 m!681223))

(declare-fun m!681225 () Bool)

(assert (=> b!727255 m!681225))

(assert (=> b!727253 m!681221))

(assert (=> b!727253 m!681221))

(declare-fun m!681227 () Bool)

(assert (=> b!727253 m!681227))

(assert (=> b!727253 m!681227))

(assert (=> b!727253 m!681221))

(declare-fun m!681229 () Bool)

(assert (=> b!727253 m!681229))

(declare-fun m!681231 () Bool)

(assert (=> b!727250 m!681231))

(declare-fun m!681233 () Bool)

(assert (=> b!727251 m!681233))

(assert (=> b!727252 m!681221))

(assert (=> b!727252 m!681221))

(declare-fun m!681235 () Bool)

(assert (=> b!727252 m!681235))

(declare-fun m!681237 () Bool)

(assert (=> b!727254 m!681237))

(declare-fun m!681239 () Bool)

(assert (=> b!727254 m!681239))

(declare-fun m!681241 () Bool)

(assert (=> b!727244 m!681241))

(declare-fun m!681243 () Bool)

(assert (=> b!727259 m!681243))

(assert (=> b!727247 m!681221))

(assert (=> b!727247 m!681221))

(declare-fun m!681245 () Bool)

(assert (=> b!727247 m!681245))

(declare-fun m!681247 () Bool)

(assert (=> b!727257 m!681247))

(declare-fun m!681249 () Bool)

(assert (=> b!727257 m!681249))

(assert (=> b!727257 m!681249))

(declare-fun m!681251 () Bool)

(assert (=> b!727257 m!681251))

(declare-fun m!681253 () Bool)

(assert (=> b!727257 m!681253))

(declare-fun m!681255 () Bool)

(assert (=> b!727257 m!681255))

(assert (=> b!727249 m!681221))

(assert (=> b!727249 m!681221))

(declare-fun m!681257 () Bool)

(assert (=> b!727249 m!681257))

(assert (=> b!727245 m!681221))

(assert (=> b!727245 m!681221))

(declare-fun m!681259 () Bool)

(assert (=> b!727245 m!681259))

(declare-fun m!681261 () Bool)

(assert (=> start!64554 m!681261))

(declare-fun m!681263 () Bool)

(assert (=> start!64554 m!681263))

(check-sat (not b!727254) (not b!727249) (not b!727250) (not b!727252) (not b!727247) (not b!727246) (not b!727244) (not b!727248) (not b!727251) (not b!727253) (not b!727259) (not b!727255) (not start!64554) (not b!727257) (not b!727245))
(check-sat)
(get-model)

(declare-fun b!727333 () Bool)

(declare-fun e!407170 () SeekEntryResult!7257)

(assert (=> b!727333 (= e!407170 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!322100 lt!322103 mask!3328))))

(declare-fun b!727334 () Bool)

(declare-fun lt!322139 () SeekEntryResult!7257)

(assert (=> b!727334 (and (bvsge (index!31398 lt!322139) #b00000000000000000000000000000000) (bvslt (index!31398 lt!322139) (size!20078 lt!322103)))))

(declare-fun e!407168 () Bool)

(assert (=> b!727334 (= e!407168 (= (select (arr!19657 lt!322103) (index!31398 lt!322139)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!727335 () Bool)

(assert (=> b!727335 (and (bvsge (index!31398 lt!322139) #b00000000000000000000000000000000) (bvslt (index!31398 lt!322139) (size!20078 lt!322103)))))

(declare-fun res!488205 () Bool)

(assert (=> b!727335 (= res!488205 (= (select (arr!19657 lt!322103) (index!31398 lt!322139)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!727335 (=> res!488205 e!407168)))

(declare-fun b!727336 () Bool)

(assert (=> b!727336 (and (bvsge (index!31398 lt!322139) #b00000000000000000000000000000000) (bvslt (index!31398 lt!322139) (size!20078 lt!322103)))))

(declare-fun res!488207 () Bool)

(assert (=> b!727336 (= res!488207 (= (select (arr!19657 lt!322103) (index!31398 lt!322139)) lt!322100))))

(assert (=> b!727336 (=> res!488207 e!407168)))

(declare-fun e!407167 () Bool)

(assert (=> b!727336 (= e!407167 e!407168)))

(declare-fun d!99447 () Bool)

(declare-fun e!407171 () Bool)

(assert (=> d!99447 e!407171))

(declare-fun c!79938 () Bool)

(assert (=> d!99447 (= c!79938 (and ((_ is Intermediate!7257) lt!322139) (undefined!8069 lt!322139)))))

(declare-fun e!407169 () SeekEntryResult!7257)

(assert (=> d!99447 (= lt!322139 e!407169)))

(declare-fun c!79939 () Bool)

(assert (=> d!99447 (= c!79939 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!322138 () (_ BitVec 64))

(assert (=> d!99447 (= lt!322138 (select (arr!19657 lt!322103) index!1321))))

(assert (=> d!99447 (validMask!0 mask!3328)))

(assert (=> d!99447 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322100 lt!322103 mask!3328) lt!322139)))

(declare-fun b!727337 () Bool)

(assert (=> b!727337 (= e!407169 e!407170)))

(declare-fun c!79937 () Bool)

(assert (=> b!727337 (= c!79937 (or (= lt!322138 lt!322100) (= (bvadd lt!322138 lt!322138) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!727338 () Bool)

(assert (=> b!727338 (= e!407171 (bvsge (x!62379 lt!322139) #b01111111111111111111111111111110))))

(declare-fun b!727339 () Bool)

(assert (=> b!727339 (= e!407170 (Intermediate!7257 false index!1321 x!1131))))

(declare-fun b!727340 () Bool)

(assert (=> b!727340 (= e!407171 e!407167)))

(declare-fun res!488206 () Bool)

(assert (=> b!727340 (= res!488206 (and ((_ is Intermediate!7257) lt!322139) (not (undefined!8069 lt!322139)) (bvslt (x!62379 lt!322139) #b01111111111111111111111111111110) (bvsge (x!62379 lt!322139) #b00000000000000000000000000000000) (bvsge (x!62379 lt!322139) x!1131)))))

(assert (=> b!727340 (=> (not res!488206) (not e!407167))))

(declare-fun b!727341 () Bool)

(assert (=> b!727341 (= e!407169 (Intermediate!7257 true index!1321 x!1131))))

(assert (= (and d!99447 c!79939) b!727341))

(assert (= (and d!99447 (not c!79939)) b!727337))

(assert (= (and b!727337 c!79937) b!727339))

(assert (= (and b!727337 (not c!79937)) b!727333))

(assert (= (and d!99447 c!79938) b!727338))

(assert (= (and d!99447 (not c!79938)) b!727340))

(assert (= (and b!727340 res!488206) b!727336))

(assert (= (and b!727336 (not res!488207)) b!727335))

(assert (= (and b!727335 (not res!488205)) b!727334))

(declare-fun m!681313 () Bool)

(assert (=> b!727336 m!681313))

(assert (=> b!727334 m!681313))

(assert (=> b!727335 m!681313))

(assert (=> b!727333 m!681241))

(assert (=> b!727333 m!681241))

(declare-fun m!681315 () Bool)

(assert (=> b!727333 m!681315))

(declare-fun m!681317 () Bool)

(assert (=> d!99447 m!681317))

(assert (=> d!99447 m!681261))

(assert (=> b!727257 d!99447))

(declare-fun e!407175 () SeekEntryResult!7257)

(declare-fun b!727342 () Bool)

(assert (=> b!727342 (= e!407175 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!322100 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!322100 lt!322103 mask!3328))))

(declare-fun b!727343 () Bool)

(declare-fun lt!322141 () SeekEntryResult!7257)

(assert (=> b!727343 (and (bvsge (index!31398 lt!322141) #b00000000000000000000000000000000) (bvslt (index!31398 lt!322141) (size!20078 lt!322103)))))

(declare-fun e!407173 () Bool)

(assert (=> b!727343 (= e!407173 (= (select (arr!19657 lt!322103) (index!31398 lt!322141)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!727344 () Bool)

(assert (=> b!727344 (and (bvsge (index!31398 lt!322141) #b00000000000000000000000000000000) (bvslt (index!31398 lt!322141) (size!20078 lt!322103)))))

(declare-fun res!488208 () Bool)

(assert (=> b!727344 (= res!488208 (= (select (arr!19657 lt!322103) (index!31398 lt!322141)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!727344 (=> res!488208 e!407173)))

(declare-fun b!727345 () Bool)

(assert (=> b!727345 (and (bvsge (index!31398 lt!322141) #b00000000000000000000000000000000) (bvslt (index!31398 lt!322141) (size!20078 lt!322103)))))

(declare-fun res!488210 () Bool)

(assert (=> b!727345 (= res!488210 (= (select (arr!19657 lt!322103) (index!31398 lt!322141)) lt!322100))))

(assert (=> b!727345 (=> res!488210 e!407173)))

(declare-fun e!407172 () Bool)

(assert (=> b!727345 (= e!407172 e!407173)))

(declare-fun d!99449 () Bool)

(declare-fun e!407176 () Bool)

(assert (=> d!99449 e!407176))

(declare-fun c!79941 () Bool)

(assert (=> d!99449 (= c!79941 (and ((_ is Intermediate!7257) lt!322141) (undefined!8069 lt!322141)))))

(declare-fun e!407174 () SeekEntryResult!7257)

(assert (=> d!99449 (= lt!322141 e!407174)))

(declare-fun c!79942 () Bool)

(assert (=> d!99449 (= c!79942 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!322140 () (_ BitVec 64))

(assert (=> d!99449 (= lt!322140 (select (arr!19657 lt!322103) (toIndex!0 lt!322100 mask!3328)))))

(assert (=> d!99449 (validMask!0 mask!3328)))

(assert (=> d!99449 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322100 mask!3328) lt!322100 lt!322103 mask!3328) lt!322141)))

(declare-fun b!727346 () Bool)

(assert (=> b!727346 (= e!407174 e!407175)))

(declare-fun c!79940 () Bool)

(assert (=> b!727346 (= c!79940 (or (= lt!322140 lt!322100) (= (bvadd lt!322140 lt!322140) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!727347 () Bool)

(assert (=> b!727347 (= e!407176 (bvsge (x!62379 lt!322141) #b01111111111111111111111111111110))))

(declare-fun b!727348 () Bool)

(assert (=> b!727348 (= e!407175 (Intermediate!7257 false (toIndex!0 lt!322100 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!727349 () Bool)

(assert (=> b!727349 (= e!407176 e!407172)))

(declare-fun res!488209 () Bool)

(assert (=> b!727349 (= res!488209 (and ((_ is Intermediate!7257) lt!322141) (not (undefined!8069 lt!322141)) (bvslt (x!62379 lt!322141) #b01111111111111111111111111111110) (bvsge (x!62379 lt!322141) #b00000000000000000000000000000000) (bvsge (x!62379 lt!322141) #b00000000000000000000000000000000)))))

(assert (=> b!727349 (=> (not res!488209) (not e!407172))))

(declare-fun b!727350 () Bool)

(assert (=> b!727350 (= e!407174 (Intermediate!7257 true (toIndex!0 lt!322100 mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!99449 c!79942) b!727350))

(assert (= (and d!99449 (not c!79942)) b!727346))

(assert (= (and b!727346 c!79940) b!727348))

(assert (= (and b!727346 (not c!79940)) b!727342))

(assert (= (and d!99449 c!79941) b!727347))

(assert (= (and d!99449 (not c!79941)) b!727349))

(assert (= (and b!727349 res!488209) b!727345))

(assert (= (and b!727345 (not res!488210)) b!727344))

(assert (= (and b!727344 (not res!488208)) b!727343))

(declare-fun m!681319 () Bool)

(assert (=> b!727345 m!681319))

(assert (=> b!727343 m!681319))

(assert (=> b!727344 m!681319))

(assert (=> b!727342 m!681249))

(declare-fun m!681321 () Bool)

(assert (=> b!727342 m!681321))

(assert (=> b!727342 m!681321))

(declare-fun m!681323 () Bool)

(assert (=> b!727342 m!681323))

(assert (=> d!99449 m!681249))

(declare-fun m!681325 () Bool)

(assert (=> d!99449 m!681325))

(assert (=> d!99449 m!681261))

(assert (=> b!727257 d!99449))

(declare-fun d!99451 () Bool)

(declare-fun lt!322147 () (_ BitVec 32))

(declare-fun lt!322146 () (_ BitVec 32))

(assert (=> d!99451 (= lt!322147 (bvmul (bvxor lt!322146 (bvlshr lt!322146 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99451 (= lt!322146 ((_ extract 31 0) (bvand (bvxor lt!322100 (bvlshr lt!322100 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99451 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!488211 (let ((h!14714 ((_ extract 31 0) (bvand (bvxor lt!322100 (bvlshr lt!322100 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62382 (bvmul (bvxor h!14714 (bvlshr h!14714 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62382 (bvlshr x!62382 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!488211 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!488211 #b00000000000000000000000000000000))))))

(assert (=> d!99451 (= (toIndex!0 lt!322100 mask!3328) (bvand (bvxor lt!322147 (bvlshr lt!322147 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!727257 d!99451))

(declare-fun b!727364 () Bool)

(declare-fun e!407183 () SeekEntryResult!7257)

(declare-fun e!407185 () SeekEntryResult!7257)

(assert (=> b!727364 (= e!407183 e!407185)))

(declare-fun c!79949 () Bool)

(declare-fun lt!322153 () (_ BitVec 64))

(assert (=> b!727364 (= c!79949 (= lt!322153 (select (arr!19657 a!3186) j!159)))))

(declare-fun b!727365 () Bool)

(assert (=> b!727365 (= e!407183 Undefined!7257)))

(declare-fun e!407184 () SeekEntryResult!7257)

(declare-fun b!727366 () Bool)

(assert (=> b!727366 (= e!407184 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!19657 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!727367 () Bool)

(assert (=> b!727367 (= e!407184 (MissingVacant!7257 resIntermediateIndex!5))))

(declare-fun b!727368 () Bool)

(assert (=> b!727368 (= e!407185 (Found!7257 resIntermediateIndex!5))))

(declare-fun lt!322152 () SeekEntryResult!7257)

(declare-fun d!99453 () Bool)

(assert (=> d!99453 (and (or ((_ is Undefined!7257) lt!322152) (not ((_ is Found!7257) lt!322152)) (and (bvsge (index!31397 lt!322152) #b00000000000000000000000000000000) (bvslt (index!31397 lt!322152) (size!20078 a!3186)))) (or ((_ is Undefined!7257) lt!322152) ((_ is Found!7257) lt!322152) (not ((_ is MissingVacant!7257) lt!322152)) (not (= (index!31399 lt!322152) resIntermediateIndex!5)) (and (bvsge (index!31399 lt!322152) #b00000000000000000000000000000000) (bvslt (index!31399 lt!322152) (size!20078 a!3186)))) (or ((_ is Undefined!7257) lt!322152) (ite ((_ is Found!7257) lt!322152) (= (select (arr!19657 a!3186) (index!31397 lt!322152)) (select (arr!19657 a!3186) j!159)) (and ((_ is MissingVacant!7257) lt!322152) (= (index!31399 lt!322152) resIntermediateIndex!5) (= (select (arr!19657 a!3186) (index!31399 lt!322152)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99453 (= lt!322152 e!407183)))

(declare-fun c!79951 () Bool)

(assert (=> d!99453 (= c!79951 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!99453 (= lt!322153 (select (arr!19657 a!3186) resIntermediateIndex!5))))

(assert (=> d!99453 (validMask!0 mask!3328)))

(assert (=> d!99453 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19657 a!3186) j!159) a!3186 mask!3328) lt!322152)))

(declare-fun b!727363 () Bool)

(declare-fun c!79950 () Bool)

(assert (=> b!727363 (= c!79950 (= lt!322153 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!727363 (= e!407185 e!407184)))

(assert (= (and d!99453 c!79951) b!727365))

(assert (= (and d!99453 (not c!79951)) b!727364))

(assert (= (and b!727364 c!79949) b!727368))

(assert (= (and b!727364 (not c!79949)) b!727363))

(assert (= (and b!727363 c!79950) b!727367))

(assert (= (and b!727363 (not c!79950)) b!727366))

(declare-fun m!681327 () Bool)

(assert (=> b!727366 m!681327))

(assert (=> b!727366 m!681327))

(assert (=> b!727366 m!681221))

(declare-fun m!681329 () Bool)

(assert (=> b!727366 m!681329))

(declare-fun m!681331 () Bool)

(assert (=> d!99453 m!681331))

(declare-fun m!681333 () Bool)

(assert (=> d!99453 m!681333))

(assert (=> d!99453 m!681217))

(assert (=> d!99453 m!681261))

(assert (=> b!727246 d!99453))

(declare-fun b!727405 () Bool)

(declare-fun c!79968 () Bool)

(declare-fun lt!322181 () (_ BitVec 64))

(assert (=> b!727405 (= c!79968 (= lt!322181 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!407208 () SeekEntryResult!7257)

(declare-fun e!407207 () SeekEntryResult!7257)

(assert (=> b!727405 (= e!407208 e!407207)))

(declare-fun b!727406 () Bool)

(declare-fun lt!322182 () SeekEntryResult!7257)

(assert (=> b!727406 (= e!407207 (seekKeyOrZeroReturnVacant!0 (x!62379 lt!322182) (index!31398 lt!322182) (index!31398 lt!322182) (select (arr!19657 a!3186) j!159) a!3186 mask!3328))))

(declare-fun d!99457 () Bool)

(declare-fun lt!322183 () SeekEntryResult!7257)

(assert (=> d!99457 (and (or ((_ is Undefined!7257) lt!322183) (not ((_ is Found!7257) lt!322183)) (and (bvsge (index!31397 lt!322183) #b00000000000000000000000000000000) (bvslt (index!31397 lt!322183) (size!20078 a!3186)))) (or ((_ is Undefined!7257) lt!322183) ((_ is Found!7257) lt!322183) (not ((_ is MissingZero!7257) lt!322183)) (and (bvsge (index!31396 lt!322183) #b00000000000000000000000000000000) (bvslt (index!31396 lt!322183) (size!20078 a!3186)))) (or ((_ is Undefined!7257) lt!322183) ((_ is Found!7257) lt!322183) ((_ is MissingZero!7257) lt!322183) (not ((_ is MissingVacant!7257) lt!322183)) (and (bvsge (index!31399 lt!322183) #b00000000000000000000000000000000) (bvslt (index!31399 lt!322183) (size!20078 a!3186)))) (or ((_ is Undefined!7257) lt!322183) (ite ((_ is Found!7257) lt!322183) (= (select (arr!19657 a!3186) (index!31397 lt!322183)) (select (arr!19657 a!3186) j!159)) (ite ((_ is MissingZero!7257) lt!322183) (= (select (arr!19657 a!3186) (index!31396 lt!322183)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7257) lt!322183) (= (select (arr!19657 a!3186) (index!31399 lt!322183)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!407209 () SeekEntryResult!7257)

(assert (=> d!99457 (= lt!322183 e!407209)))

(declare-fun c!79969 () Bool)

(assert (=> d!99457 (= c!79969 (and ((_ is Intermediate!7257) lt!322182) (undefined!8069 lt!322182)))))

(assert (=> d!99457 (= lt!322182 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19657 a!3186) j!159) mask!3328) (select (arr!19657 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!99457 (validMask!0 mask!3328)))

(assert (=> d!99457 (= (seekEntryOrOpen!0 (select (arr!19657 a!3186) j!159) a!3186 mask!3328) lt!322183)))

(declare-fun b!727407 () Bool)

(assert (=> b!727407 (= e!407209 Undefined!7257)))

(declare-fun b!727408 () Bool)

(assert (=> b!727408 (= e!407208 (Found!7257 (index!31398 lt!322182)))))

(declare-fun b!727409 () Bool)

(assert (=> b!727409 (= e!407207 (MissingZero!7257 (index!31398 lt!322182)))))

(declare-fun b!727410 () Bool)

(assert (=> b!727410 (= e!407209 e!407208)))

(assert (=> b!727410 (= lt!322181 (select (arr!19657 a!3186) (index!31398 lt!322182)))))

(declare-fun c!79967 () Bool)

(assert (=> b!727410 (= c!79967 (= lt!322181 (select (arr!19657 a!3186) j!159)))))

(assert (= (and d!99457 c!79969) b!727407))

(assert (= (and d!99457 (not c!79969)) b!727410))

(assert (= (and b!727410 c!79967) b!727408))

(assert (= (and b!727410 (not c!79967)) b!727405))

(assert (= (and b!727405 c!79968) b!727409))

(assert (= (and b!727405 (not c!79968)) b!727406))

(assert (=> b!727406 m!681221))

(declare-fun m!681345 () Bool)

(assert (=> b!727406 m!681345))

(assert (=> d!99457 m!681221))

(assert (=> d!99457 m!681227))

(declare-fun m!681347 () Bool)

(assert (=> d!99457 m!681347))

(declare-fun m!681349 () Bool)

(assert (=> d!99457 m!681349))

(assert (=> d!99457 m!681227))

(assert (=> d!99457 m!681221))

(assert (=> d!99457 m!681229))

(declare-fun m!681351 () Bool)

(assert (=> d!99457 m!681351))

(assert (=> d!99457 m!681261))

(declare-fun m!681353 () Bool)

(assert (=> b!727410 m!681353))

(assert (=> b!727247 d!99457))

(declare-fun e!407213 () SeekEntryResult!7257)

(declare-fun b!727411 () Bool)

(assert (=> b!727411 (= e!407213 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!19657 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!727413 () Bool)

(declare-fun lt!322187 () SeekEntryResult!7257)

(assert (=> b!727413 (and (bvsge (index!31398 lt!322187) #b00000000000000000000000000000000) (bvslt (index!31398 lt!322187) (size!20078 a!3186)))))

(declare-fun e!407211 () Bool)

(assert (=> b!727413 (= e!407211 (= (select (arr!19657 a!3186) (index!31398 lt!322187)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!727415 () Bool)

(assert (=> b!727415 (and (bvsge (index!31398 lt!322187) #b00000000000000000000000000000000) (bvslt (index!31398 lt!322187) (size!20078 a!3186)))))

(declare-fun res!488218 () Bool)

(assert (=> b!727415 (= res!488218 (= (select (arr!19657 a!3186) (index!31398 lt!322187)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!727415 (=> res!488218 e!407211)))

(declare-fun b!727417 () Bool)

(assert (=> b!727417 (and (bvsge (index!31398 lt!322187) #b00000000000000000000000000000000) (bvslt (index!31398 lt!322187) (size!20078 a!3186)))))

(declare-fun res!488220 () Bool)

(assert (=> b!727417 (= res!488220 (= (select (arr!19657 a!3186) (index!31398 lt!322187)) (select (arr!19657 a!3186) j!159)))))

(assert (=> b!727417 (=> res!488220 e!407211)))

(declare-fun e!407210 () Bool)

(assert (=> b!727417 (= e!407210 e!407211)))

(declare-fun d!99471 () Bool)

(declare-fun e!407216 () Bool)

(assert (=> d!99471 e!407216))

(declare-fun c!79972 () Bool)

(assert (=> d!99471 (= c!79972 (and ((_ is Intermediate!7257) lt!322187) (undefined!8069 lt!322187)))))

(declare-fun e!407212 () SeekEntryResult!7257)

(assert (=> d!99471 (= lt!322187 e!407212)))

(declare-fun c!79975 () Bool)

(assert (=> d!99471 (= c!79975 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!322184 () (_ BitVec 64))

(assert (=> d!99471 (= lt!322184 (select (arr!19657 a!3186) index!1321))))

(assert (=> d!99471 (validMask!0 mask!3328)))

(assert (=> d!99471 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19657 a!3186) j!159) a!3186 mask!3328) lt!322187)))

(declare-fun b!727419 () Bool)

(assert (=> b!727419 (= e!407212 e!407213)))

(declare-fun c!79970 () Bool)

(assert (=> b!727419 (= c!79970 (or (= lt!322184 (select (arr!19657 a!3186) j!159)) (= (bvadd lt!322184 lt!322184) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!727421 () Bool)

(assert (=> b!727421 (= e!407216 (bvsge (x!62379 lt!322187) #b01111111111111111111111111111110))))

(declare-fun b!727423 () Bool)

(assert (=> b!727423 (= e!407213 (Intermediate!7257 false index!1321 x!1131))))

(declare-fun b!727424 () Bool)

(assert (=> b!727424 (= e!407216 e!407210)))

(declare-fun res!488219 () Bool)

(assert (=> b!727424 (= res!488219 (and ((_ is Intermediate!7257) lt!322187) (not (undefined!8069 lt!322187)) (bvslt (x!62379 lt!322187) #b01111111111111111111111111111110) (bvsge (x!62379 lt!322187) #b00000000000000000000000000000000) (bvsge (x!62379 lt!322187) x!1131)))))

(assert (=> b!727424 (=> (not res!488219) (not e!407210))))

(declare-fun b!727425 () Bool)

(assert (=> b!727425 (= e!407212 (Intermediate!7257 true index!1321 x!1131))))

(assert (= (and d!99471 c!79975) b!727425))

(assert (= (and d!99471 (not c!79975)) b!727419))

(assert (= (and b!727419 c!79970) b!727423))

(assert (= (and b!727419 (not c!79970)) b!727411))

(assert (= (and d!99471 c!79972) b!727421))

(assert (= (and d!99471 (not c!79972)) b!727424))

(assert (= (and b!727424 res!488219) b!727417))

(assert (= (and b!727417 (not res!488220)) b!727415))

(assert (= (and b!727415 (not res!488218)) b!727413))

(declare-fun m!681359 () Bool)

(assert (=> b!727417 m!681359))

(assert (=> b!727413 m!681359))

(assert (=> b!727415 m!681359))

(assert (=> b!727411 m!681241))

(assert (=> b!727411 m!681241))

(assert (=> b!727411 m!681221))

(declare-fun m!681363 () Bool)

(assert (=> b!727411 m!681363))

(declare-fun m!681367 () Bool)

(assert (=> d!99471 m!681367))

(assert (=> d!99471 m!681261))

(assert (=> b!727245 d!99471))

(declare-fun b!727449 () Bool)

(declare-fun e!407237 () Bool)

(declare-fun call!34815 () Bool)

(assert (=> b!727449 (= e!407237 call!34815)))

(declare-fun bm!34812 () Bool)

(assert (=> bm!34812 (= call!34815 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!99475 () Bool)

(declare-fun res!488234 () Bool)

(declare-fun e!407238 () Bool)

(assert (=> d!99475 (=> res!488234 e!407238)))

(assert (=> d!99475 (= res!488234 (bvsge j!159 (size!20078 a!3186)))))

(assert (=> d!99475 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!407238)))

(declare-fun b!727450 () Bool)

(assert (=> b!727450 (= e!407238 e!407237)))

(declare-fun c!79981 () Bool)

(assert (=> b!727450 (= c!79981 (validKeyInArray!0 (select (arr!19657 a!3186) j!159)))))

(declare-fun b!727451 () Bool)

(declare-fun e!407236 () Bool)

(assert (=> b!727451 (= e!407236 call!34815)))

(declare-fun b!727452 () Bool)

(assert (=> b!727452 (= e!407237 e!407236)))

(declare-fun lt!322195 () (_ BitVec 64))

(assert (=> b!727452 (= lt!322195 (select (arr!19657 a!3186) j!159))))

(declare-fun lt!322196 () Unit!24832)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!41072 (_ BitVec 64) (_ BitVec 32)) Unit!24832)

(assert (=> b!727452 (= lt!322196 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!322195 j!159))))

(assert (=> b!727452 (arrayContainsKey!0 a!3186 lt!322195 #b00000000000000000000000000000000)))

(declare-fun lt!322197 () Unit!24832)

(assert (=> b!727452 (= lt!322197 lt!322196)))

(declare-fun res!488235 () Bool)

(assert (=> b!727452 (= res!488235 (= (seekEntryOrOpen!0 (select (arr!19657 a!3186) j!159) a!3186 mask!3328) (Found!7257 j!159)))))

(assert (=> b!727452 (=> (not res!488235) (not e!407236))))

(assert (= (and d!99475 (not res!488234)) b!727450))

(assert (= (and b!727450 c!79981) b!727452))

(assert (= (and b!727450 (not c!79981)) b!727449))

(assert (= (and b!727452 res!488235) b!727451))

(assert (= (or b!727451 b!727449) bm!34812))

(declare-fun m!681379 () Bool)

(assert (=> bm!34812 m!681379))

(assert (=> b!727450 m!681221))

(assert (=> b!727450 m!681221))

(assert (=> b!727450 m!681235))

(assert (=> b!727452 m!681221))

(declare-fun m!681381 () Bool)

(assert (=> b!727452 m!681381))

(declare-fun m!681383 () Bool)

(assert (=> b!727452 m!681383))

(assert (=> b!727452 m!681221))

(assert (=> b!727452 m!681245))

(assert (=> b!727254 d!99475))

(declare-fun d!99479 () Bool)

(assert (=> d!99479 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!322200 () Unit!24832)

(declare-fun choose!38 (array!41072 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24832)

(assert (=> d!99479 (= lt!322200 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!99479 (validMask!0 mask!3328)))

(assert (=> d!99479 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!322200)))

(declare-fun bs!20865 () Bool)

(assert (= bs!20865 d!99479))

(assert (=> bs!20865 m!681237))

(declare-fun m!681385 () Bool)

(assert (=> bs!20865 m!681385))

(assert (=> bs!20865 m!681261))

(assert (=> b!727254 d!99479))

(declare-fun b!727453 () Bool)

(declare-fun e!407240 () Bool)

(declare-fun call!34816 () Bool)

(assert (=> b!727453 (= e!407240 call!34816)))

(declare-fun bm!34813 () Bool)

(assert (=> bm!34813 (= call!34816 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun d!99481 () Bool)

(declare-fun res!488236 () Bool)

(declare-fun e!407241 () Bool)

(assert (=> d!99481 (=> res!488236 e!407241)))

(assert (=> d!99481 (= res!488236 (bvsge #b00000000000000000000000000000000 (size!20078 a!3186)))))

(assert (=> d!99481 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!407241)))

(declare-fun b!727454 () Bool)

(assert (=> b!727454 (= e!407241 e!407240)))

(declare-fun c!79982 () Bool)

(assert (=> b!727454 (= c!79982 (validKeyInArray!0 (select (arr!19657 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!727455 () Bool)

(declare-fun e!407239 () Bool)

(assert (=> b!727455 (= e!407239 call!34816)))

(declare-fun b!727456 () Bool)

(assert (=> b!727456 (= e!407240 e!407239)))

(declare-fun lt!322205 () (_ BitVec 64))

(assert (=> b!727456 (= lt!322205 (select (arr!19657 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!322206 () Unit!24832)

(assert (=> b!727456 (= lt!322206 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!322205 #b00000000000000000000000000000000))))

(assert (=> b!727456 (arrayContainsKey!0 a!3186 lt!322205 #b00000000000000000000000000000000)))

(declare-fun lt!322207 () Unit!24832)

(assert (=> b!727456 (= lt!322207 lt!322206)))

(declare-fun res!488237 () Bool)

(assert (=> b!727456 (= res!488237 (= (seekEntryOrOpen!0 (select (arr!19657 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7257 #b00000000000000000000000000000000)))))

(assert (=> b!727456 (=> (not res!488237) (not e!407239))))

(assert (= (and d!99481 (not res!488236)) b!727454))

(assert (= (and b!727454 c!79982) b!727456))

(assert (= (and b!727454 (not c!79982)) b!727453))

(assert (= (and b!727456 res!488237) b!727455))

(assert (= (or b!727455 b!727453) bm!34813))

(declare-fun m!681387 () Bool)

(assert (=> bm!34813 m!681387))

(declare-fun m!681389 () Bool)

(assert (=> b!727454 m!681389))

(assert (=> b!727454 m!681389))

(declare-fun m!681391 () Bool)

(assert (=> b!727454 m!681391))

(assert (=> b!727456 m!681389))

(declare-fun m!681393 () Bool)

(assert (=> b!727456 m!681393))

(declare-fun m!681395 () Bool)

(assert (=> b!727456 m!681395))

(assert (=> b!727456 m!681389))

(declare-fun m!681397 () Bool)

(assert (=> b!727456 m!681397))

(assert (=> b!727255 d!99481))

(declare-fun d!99483 () Bool)

(declare-fun lt!322210 () (_ BitVec 32))

(assert (=> d!99483 (and (bvsge lt!322210 #b00000000000000000000000000000000) (bvslt lt!322210 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!99483 (= lt!322210 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!99483 (validMask!0 mask!3328)))

(assert (=> d!99483 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!322210)))

(declare-fun bs!20866 () Bool)

(assert (= bs!20866 d!99483))

(declare-fun m!681399 () Bool)

(assert (=> bs!20866 m!681399))

(assert (=> bs!20866 m!681261))

(assert (=> b!727244 d!99483))

(declare-fun b!727475 () Bool)

(declare-fun e!407255 () SeekEntryResult!7257)

(assert (=> b!727475 (= e!407255 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!19657 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!19657 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!727476 () Bool)

(declare-fun lt!322212 () SeekEntryResult!7257)

(assert (=> b!727476 (and (bvsge (index!31398 lt!322212) #b00000000000000000000000000000000) (bvslt (index!31398 lt!322212) (size!20078 a!3186)))))

(declare-fun e!407253 () Bool)

(assert (=> b!727476 (= e!407253 (= (select (arr!19657 a!3186) (index!31398 lt!322212)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!727477 () Bool)

(assert (=> b!727477 (and (bvsge (index!31398 lt!322212) #b00000000000000000000000000000000) (bvslt (index!31398 lt!322212) (size!20078 a!3186)))))

(declare-fun res!488244 () Bool)

(assert (=> b!727477 (= res!488244 (= (select (arr!19657 a!3186) (index!31398 lt!322212)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!727477 (=> res!488244 e!407253)))

(declare-fun b!727478 () Bool)

(assert (=> b!727478 (and (bvsge (index!31398 lt!322212) #b00000000000000000000000000000000) (bvslt (index!31398 lt!322212) (size!20078 a!3186)))))

(declare-fun res!488246 () Bool)

(assert (=> b!727478 (= res!488246 (= (select (arr!19657 a!3186) (index!31398 lt!322212)) (select (arr!19657 a!3186) j!159)))))

(assert (=> b!727478 (=> res!488246 e!407253)))

(declare-fun e!407252 () Bool)

(assert (=> b!727478 (= e!407252 e!407253)))

(declare-fun d!99485 () Bool)

(declare-fun e!407256 () Bool)

(assert (=> d!99485 e!407256))

(declare-fun c!79990 () Bool)

(assert (=> d!99485 (= c!79990 (and ((_ is Intermediate!7257) lt!322212) (undefined!8069 lt!322212)))))

(declare-fun e!407254 () SeekEntryResult!7257)

(assert (=> d!99485 (= lt!322212 e!407254)))

(declare-fun c!79991 () Bool)

(assert (=> d!99485 (= c!79991 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!322211 () (_ BitVec 64))

(assert (=> d!99485 (= lt!322211 (select (arr!19657 a!3186) (toIndex!0 (select (arr!19657 a!3186) j!159) mask!3328)))))

(assert (=> d!99485 (validMask!0 mask!3328)))

(assert (=> d!99485 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19657 a!3186) j!159) mask!3328) (select (arr!19657 a!3186) j!159) a!3186 mask!3328) lt!322212)))

(declare-fun b!727479 () Bool)

(assert (=> b!727479 (= e!407254 e!407255)))

(declare-fun c!79989 () Bool)

(assert (=> b!727479 (= c!79989 (or (= lt!322211 (select (arr!19657 a!3186) j!159)) (= (bvadd lt!322211 lt!322211) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!727480 () Bool)

(assert (=> b!727480 (= e!407256 (bvsge (x!62379 lt!322212) #b01111111111111111111111111111110))))

(declare-fun b!727481 () Bool)

(assert (=> b!727481 (= e!407255 (Intermediate!7257 false (toIndex!0 (select (arr!19657 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!727482 () Bool)

(assert (=> b!727482 (= e!407256 e!407252)))

(declare-fun res!488245 () Bool)

(assert (=> b!727482 (= res!488245 (and ((_ is Intermediate!7257) lt!322212) (not (undefined!8069 lt!322212)) (bvslt (x!62379 lt!322212) #b01111111111111111111111111111110) (bvsge (x!62379 lt!322212) #b00000000000000000000000000000000) (bvsge (x!62379 lt!322212) #b00000000000000000000000000000000)))))

(assert (=> b!727482 (=> (not res!488245) (not e!407252))))

(declare-fun b!727483 () Bool)

(assert (=> b!727483 (= e!407254 (Intermediate!7257 true (toIndex!0 (select (arr!19657 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(assert (= (and d!99485 c!79991) b!727483))

(assert (= (and d!99485 (not c!79991)) b!727479))

(assert (= (and b!727479 c!79989) b!727481))

(assert (= (and b!727479 (not c!79989)) b!727475))

(assert (= (and d!99485 c!79990) b!727480))

(assert (= (and d!99485 (not c!79990)) b!727482))

(assert (= (and b!727482 res!488245) b!727478))

(assert (= (and b!727478 (not res!488246)) b!727477))

(assert (= (and b!727477 (not res!488244)) b!727476))

(declare-fun m!681401 () Bool)

(assert (=> b!727478 m!681401))

(assert (=> b!727476 m!681401))

(assert (=> b!727477 m!681401))

(assert (=> b!727475 m!681227))

(declare-fun m!681403 () Bool)

(assert (=> b!727475 m!681403))

(assert (=> b!727475 m!681403))

(assert (=> b!727475 m!681221))

(declare-fun m!681405 () Bool)

(assert (=> b!727475 m!681405))

(assert (=> d!99485 m!681227))

(declare-fun m!681407 () Bool)

(assert (=> d!99485 m!681407))

(assert (=> d!99485 m!681261))

(assert (=> b!727253 d!99485))

(declare-fun d!99487 () Bool)

(declare-fun lt!322220 () (_ BitVec 32))

(declare-fun lt!322219 () (_ BitVec 32))

(assert (=> d!99487 (= lt!322220 (bvmul (bvxor lt!322219 (bvlshr lt!322219 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!99487 (= lt!322219 ((_ extract 31 0) (bvand (bvxor (select (arr!19657 a!3186) j!159) (bvlshr (select (arr!19657 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!99487 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!488211 (let ((h!14714 ((_ extract 31 0) (bvand (bvxor (select (arr!19657 a!3186) j!159) (bvlshr (select (arr!19657 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!62382 (bvmul (bvxor h!14714 (bvlshr h!14714 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!62382 (bvlshr x!62382 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!488211 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!488211 #b00000000000000000000000000000000))))))

(assert (=> d!99487 (= (toIndex!0 (select (arr!19657 a!3186) j!159) mask!3328) (bvand (bvxor lt!322220 (bvlshr lt!322220 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!727253 d!99487))

(declare-fun d!99489 () Bool)

(assert (=> d!99489 (= (validKeyInArray!0 (select (arr!19657 a!3186) j!159)) (and (not (= (select (arr!19657 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19657 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!727252 d!99489))

(declare-fun bm!34816 () Bool)

(declare-fun call!34819 () Bool)

(declare-fun c!80009 () Bool)

(assert (=> bm!34816 (= call!34819 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!80009 (Cons!13655 (select (arr!19657 a!3186) #b00000000000000000000000000000000) Nil!13656) Nil!13656)))))

(declare-fun b!727530 () Bool)

(declare-fun e!407285 () Bool)

(assert (=> b!727530 (= e!407285 call!34819)))

(declare-fun b!727531 () Bool)

(declare-fun e!407286 () Bool)

(declare-fun e!407284 () Bool)

(assert (=> b!727531 (= e!407286 e!407284)))

(declare-fun res!488260 () Bool)

(assert (=> b!727531 (=> (not res!488260) (not e!407284))))

(declare-fun e!407287 () Bool)

(assert (=> b!727531 (= res!488260 (not e!407287))))

(declare-fun res!488262 () Bool)

(assert (=> b!727531 (=> (not res!488262) (not e!407287))))

(assert (=> b!727531 (= res!488262 (validKeyInArray!0 (select (arr!19657 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!727532 () Bool)

(assert (=> b!727532 (= e!407284 e!407285)))

(assert (=> b!727532 (= c!80009 (validKeyInArray!0 (select (arr!19657 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!727533 () Bool)

(declare-fun contains!4050 (List!13659 (_ BitVec 64)) Bool)

(assert (=> b!727533 (= e!407287 (contains!4050 Nil!13656 (select (arr!19657 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!99491 () Bool)

(declare-fun res!488261 () Bool)

(assert (=> d!99491 (=> res!488261 e!407286)))

(assert (=> d!99491 (= res!488261 (bvsge #b00000000000000000000000000000000 (size!20078 a!3186)))))

(assert (=> d!99491 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13656) e!407286)))

(declare-fun b!727534 () Bool)

(assert (=> b!727534 (= e!407285 call!34819)))

(assert (= (and d!99491 (not res!488261)) b!727531))

(assert (= (and b!727531 res!488262) b!727533))

(assert (= (and b!727531 res!488260) b!727532))

(assert (= (and b!727532 c!80009) b!727530))

(assert (= (and b!727532 (not c!80009)) b!727534))

(assert (= (or b!727530 b!727534) bm!34816))

(assert (=> bm!34816 m!681389))

(declare-fun m!681433 () Bool)

(assert (=> bm!34816 m!681433))

(assert (=> b!727531 m!681389))

(assert (=> b!727531 m!681389))

(assert (=> b!727531 m!681391))

(assert (=> b!727532 m!681389))

(assert (=> b!727532 m!681389))

(assert (=> b!727532 m!681391))

(assert (=> b!727533 m!681389))

(assert (=> b!727533 m!681389))

(declare-fun m!681435 () Bool)

(assert (=> b!727533 m!681435))

(assert (=> b!727250 d!99491))

(declare-fun d!99501 () Bool)

(assert (=> d!99501 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!727251 d!99501))

(declare-fun b!727536 () Bool)

(declare-fun e!407288 () SeekEntryResult!7257)

(declare-fun e!407290 () SeekEntryResult!7257)

(assert (=> b!727536 (= e!407288 e!407290)))

(declare-fun c!80010 () Bool)

(declare-fun lt!322235 () (_ BitVec 64))

(assert (=> b!727536 (= c!80010 (= lt!322235 (select (arr!19657 a!3186) j!159)))))

(declare-fun b!727537 () Bool)

(assert (=> b!727537 (= e!407288 Undefined!7257)))

(declare-fun b!727538 () Bool)

(declare-fun e!407289 () SeekEntryResult!7257)

(assert (=> b!727538 (= e!407289 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!19657 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!727539 () Bool)

(assert (=> b!727539 (= e!407289 (MissingVacant!7257 resIntermediateIndex!5))))

(declare-fun b!727540 () Bool)

(assert (=> b!727540 (= e!407290 (Found!7257 index!1321))))

(declare-fun d!99503 () Bool)

(declare-fun lt!322234 () SeekEntryResult!7257)

(assert (=> d!99503 (and (or ((_ is Undefined!7257) lt!322234) (not ((_ is Found!7257) lt!322234)) (and (bvsge (index!31397 lt!322234) #b00000000000000000000000000000000) (bvslt (index!31397 lt!322234) (size!20078 a!3186)))) (or ((_ is Undefined!7257) lt!322234) ((_ is Found!7257) lt!322234) (not ((_ is MissingVacant!7257) lt!322234)) (not (= (index!31399 lt!322234) resIntermediateIndex!5)) (and (bvsge (index!31399 lt!322234) #b00000000000000000000000000000000) (bvslt (index!31399 lt!322234) (size!20078 a!3186)))) (or ((_ is Undefined!7257) lt!322234) (ite ((_ is Found!7257) lt!322234) (= (select (arr!19657 a!3186) (index!31397 lt!322234)) (select (arr!19657 a!3186) j!159)) (and ((_ is MissingVacant!7257) lt!322234) (= (index!31399 lt!322234) resIntermediateIndex!5) (= (select (arr!19657 a!3186) (index!31399 lt!322234)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!99503 (= lt!322234 e!407288)))

(declare-fun c!80012 () Bool)

(assert (=> d!99503 (= c!80012 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!99503 (= lt!322235 (select (arr!19657 a!3186) index!1321))))

(assert (=> d!99503 (validMask!0 mask!3328)))

(assert (=> d!99503 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19657 a!3186) j!159) a!3186 mask!3328) lt!322234)))

(declare-fun b!727535 () Bool)

(declare-fun c!80011 () Bool)

(assert (=> b!727535 (= c!80011 (= lt!322235 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!727535 (= e!407290 e!407289)))

(assert (= (and d!99503 c!80012) b!727537))

(assert (= (and d!99503 (not c!80012)) b!727536))

(assert (= (and b!727536 c!80010) b!727540))

(assert (= (and b!727536 (not c!80010)) b!727535))

(assert (= (and b!727535 c!80011) b!727539))

(assert (= (and b!727535 (not c!80011)) b!727538))

(assert (=> b!727538 m!681241))

(assert (=> b!727538 m!681241))

(assert (=> b!727538 m!681221))

(declare-fun m!681437 () Bool)

(assert (=> b!727538 m!681437))

(declare-fun m!681439 () Bool)

(assert (=> d!99503 m!681439))

(declare-fun m!681441 () Bool)

(assert (=> d!99503 m!681441))

(assert (=> d!99503 m!681367))

(assert (=> d!99503 m!681261))

(assert (=> b!727249 d!99503))

(declare-fun d!99505 () Bool)

(assert (=> d!99505 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!64554 d!99505))

(declare-fun d!99511 () Bool)

(assert (=> d!99511 (= (array_inv!15453 a!3186) (bvsge (size!20078 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!64554 d!99511))

(declare-fun d!99513 () Bool)

(declare-fun res!488285 () Bool)

(declare-fun e!407322 () Bool)

(assert (=> d!99513 (=> res!488285 e!407322)))

(assert (=> d!99513 (= res!488285 (= (select (arr!19657 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!99513 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!407322)))

(declare-fun b!727587 () Bool)

(declare-fun e!407323 () Bool)

(assert (=> b!727587 (= e!407322 e!407323)))

(declare-fun res!488286 () Bool)

(assert (=> b!727587 (=> (not res!488286) (not e!407323))))

(assert (=> b!727587 (= res!488286 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20078 a!3186)))))

(declare-fun b!727588 () Bool)

(assert (=> b!727588 (= e!407323 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99513 (not res!488285)) b!727587))

(assert (= (and b!727587 res!488286) b!727588))

(assert (=> d!99513 m!681389))

(declare-fun m!681457 () Bool)

(assert (=> b!727588 m!681457))

(assert (=> b!727259 d!99513))

(declare-fun b!727589 () Bool)

(declare-fun c!80026 () Bool)

(declare-fun lt!322242 () (_ BitVec 64))

(assert (=> b!727589 (= c!80026 (= lt!322242 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!407325 () SeekEntryResult!7257)

(declare-fun e!407324 () SeekEntryResult!7257)

(assert (=> b!727589 (= e!407325 e!407324)))

(declare-fun lt!322243 () SeekEntryResult!7257)

(declare-fun b!727590 () Bool)

(assert (=> b!727590 (= e!407324 (seekKeyOrZeroReturnVacant!0 (x!62379 lt!322243) (index!31398 lt!322243) (index!31398 lt!322243) k0!2102 a!3186 mask!3328))))

(declare-fun d!99515 () Bool)

(declare-fun lt!322244 () SeekEntryResult!7257)

(assert (=> d!99515 (and (or ((_ is Undefined!7257) lt!322244) (not ((_ is Found!7257) lt!322244)) (and (bvsge (index!31397 lt!322244) #b00000000000000000000000000000000) (bvslt (index!31397 lt!322244) (size!20078 a!3186)))) (or ((_ is Undefined!7257) lt!322244) ((_ is Found!7257) lt!322244) (not ((_ is MissingZero!7257) lt!322244)) (and (bvsge (index!31396 lt!322244) #b00000000000000000000000000000000) (bvslt (index!31396 lt!322244) (size!20078 a!3186)))) (or ((_ is Undefined!7257) lt!322244) ((_ is Found!7257) lt!322244) ((_ is MissingZero!7257) lt!322244) (not ((_ is MissingVacant!7257) lt!322244)) (and (bvsge (index!31399 lt!322244) #b00000000000000000000000000000000) (bvslt (index!31399 lt!322244) (size!20078 a!3186)))) (or ((_ is Undefined!7257) lt!322244) (ite ((_ is Found!7257) lt!322244) (= (select (arr!19657 a!3186) (index!31397 lt!322244)) k0!2102) (ite ((_ is MissingZero!7257) lt!322244) (= (select (arr!19657 a!3186) (index!31396 lt!322244)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7257) lt!322244) (= (select (arr!19657 a!3186) (index!31399 lt!322244)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!407326 () SeekEntryResult!7257)

(assert (=> d!99515 (= lt!322244 e!407326)))

(declare-fun c!80027 () Bool)

(assert (=> d!99515 (= c!80027 (and ((_ is Intermediate!7257) lt!322243) (undefined!8069 lt!322243)))))

(assert (=> d!99515 (= lt!322243 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!99515 (validMask!0 mask!3328)))

(assert (=> d!99515 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!322244)))

(declare-fun b!727591 () Bool)

(assert (=> b!727591 (= e!407326 Undefined!7257)))

(declare-fun b!727592 () Bool)

(assert (=> b!727592 (= e!407325 (Found!7257 (index!31398 lt!322243)))))

(declare-fun b!727593 () Bool)

(assert (=> b!727593 (= e!407324 (MissingZero!7257 (index!31398 lt!322243)))))

(declare-fun b!727594 () Bool)

(assert (=> b!727594 (= e!407326 e!407325)))

(assert (=> b!727594 (= lt!322242 (select (arr!19657 a!3186) (index!31398 lt!322243)))))

(declare-fun c!80025 () Bool)

(assert (=> b!727594 (= c!80025 (= lt!322242 k0!2102))))

(assert (= (and d!99515 c!80027) b!727591))

(assert (= (and d!99515 (not c!80027)) b!727594))

(assert (= (and b!727594 c!80025) b!727592))

(assert (= (and b!727594 (not c!80025)) b!727589))

(assert (= (and b!727589 c!80026) b!727593))

(assert (= (and b!727589 (not c!80026)) b!727590))

(declare-fun m!681459 () Bool)

(assert (=> b!727590 m!681459))

(declare-fun m!681461 () Bool)

(assert (=> d!99515 m!681461))

(declare-fun m!681463 () Bool)

(assert (=> d!99515 m!681463))

(declare-fun m!681465 () Bool)

(assert (=> d!99515 m!681465))

(assert (=> d!99515 m!681461))

(declare-fun m!681467 () Bool)

(assert (=> d!99515 m!681467))

(declare-fun m!681469 () Bool)

(assert (=> d!99515 m!681469))

(assert (=> d!99515 m!681261))

(declare-fun m!681471 () Bool)

(assert (=> b!727594 m!681471))

(assert (=> b!727248 d!99515))

(check-sat (not bm!34812) (not d!99471) (not b!727406) (not d!99457) (not b!727538) (not b!727452) (not d!99449) (not bm!34813) (not d!99483) (not d!99503) (not b!727333) (not d!99485) (not b!727411) (not bm!34816) (not b!727588) (not b!727533) (not b!727532) (not b!727342) (not d!99515) (not b!727456) (not d!99479) (not d!99453) (not d!99447) (not b!727590) (not b!727454) (not b!727450) (not b!727366) (not b!727531) (not b!727475))
(check-sat)
