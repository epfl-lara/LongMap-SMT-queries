; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66574 () Bool)

(assert start!66574)

(declare-fun b!767273 () Bool)

(declare-fun res!519062 () Bool)

(declare-fun e!427268 () Bool)

(assert (=> b!767273 (=> (not res!519062) (not e!427268))))

(declare-datatypes ((array!42284 0))(
  ( (array!42285 (arr!20245 (Array (_ BitVec 32) (_ BitVec 64))) (size!20666 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42284)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42284 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!767273 (= res!519062 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!767274 () Bool)

(declare-fun e!427272 () Bool)

(declare-fun e!427264 () Bool)

(assert (=> b!767274 (= e!427272 e!427264)))

(declare-fun res!519053 () Bool)

(assert (=> b!767274 (=> res!519053 e!427264)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!767274 (= res!519053 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!341313 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767274 (= lt!341313 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!767275 () Bool)

(assert (=> b!767275 (= e!427264 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7845 0))(
  ( (MissingZero!7845 (index!33748 (_ BitVec 32))) (Found!7845 (index!33749 (_ BitVec 32))) (Intermediate!7845 (undefined!8657 Bool) (index!33750 (_ BitVec 32)) (x!64663 (_ BitVec 32))) (Undefined!7845) (MissingVacant!7845 (index!33751 (_ BitVec 32))) )
))
(declare-fun lt!341319 () SeekEntryResult!7845)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42284 (_ BitVec 32)) SeekEntryResult!7845)

(assert (=> b!767275 (= lt!341319 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20245 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767276 () Bool)

(declare-fun e!427271 () Bool)

(declare-fun e!427263 () Bool)

(assert (=> b!767276 (= e!427271 e!427263)))

(declare-fun res!519056 () Bool)

(assert (=> b!767276 (=> (not res!519056) (not e!427263))))

(declare-fun lt!341316 () SeekEntryResult!7845)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42284 (_ BitVec 32)) SeekEntryResult!7845)

(assert (=> b!767276 (= res!519056 (= (seekEntryOrOpen!0 (select (arr!20245 a!3186) j!159) a!3186 mask!3328) lt!341316))))

(assert (=> b!767276 (= lt!341316 (Found!7845 j!159))))

(declare-fun b!767277 () Bool)

(assert (=> b!767277 (= e!427263 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20245 a!3186) j!159) a!3186 mask!3328) lt!341316))))

(declare-fun res!519059 () Bool)

(assert (=> start!66574 (=> (not res!519059) (not e!427268))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66574 (= res!519059 (validMask!0 mask!3328))))

(assert (=> start!66574 e!427268))

(assert (=> start!66574 true))

(declare-fun array_inv!16041 (array!42284) Bool)

(assert (=> start!66574 (array_inv!16041 a!3186)))

(declare-fun b!767278 () Bool)

(declare-fun res!519051 () Bool)

(declare-fun e!427265 () Bool)

(assert (=> b!767278 (=> (not res!519051) (not e!427265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42284 (_ BitVec 32)) Bool)

(assert (=> b!767278 (= res!519051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!767279 () Bool)

(assert (=> b!767279 (= e!427268 e!427265)))

(declare-fun res!519060 () Bool)

(assert (=> b!767279 (=> (not res!519060) (not e!427265))))

(declare-fun lt!341314 () SeekEntryResult!7845)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!767279 (= res!519060 (or (= lt!341314 (MissingZero!7845 i!1173)) (= lt!341314 (MissingVacant!7845 i!1173))))))

(assert (=> b!767279 (= lt!341314 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!767280 () Bool)

(declare-fun e!427266 () Bool)

(assert (=> b!767280 (= e!427266 (not e!427272))))

(declare-fun res!519058 () Bool)

(assert (=> b!767280 (=> res!519058 e!427272)))

(declare-fun lt!341315 () SeekEntryResult!7845)

(get-info :version)

(assert (=> b!767280 (= res!519058 (or (not ((_ is Intermediate!7845) lt!341315)) (bvsge x!1131 (x!64663 lt!341315))))))

(assert (=> b!767280 e!427271))

(declare-fun res!519052 () Bool)

(assert (=> b!767280 (=> (not res!519052) (not e!427271))))

(assert (=> b!767280 (= res!519052 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26416 0))(
  ( (Unit!26417) )
))
(declare-fun lt!341317 () Unit!26416)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42284 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26416)

(assert (=> b!767280 (= lt!341317 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun e!427267 () Bool)

(declare-fun lt!341321 () SeekEntryResult!7845)

(declare-fun b!767281 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42284 (_ BitVec 32)) SeekEntryResult!7845)

(assert (=> b!767281 (= e!427267 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20245 a!3186) j!159) a!3186 mask!3328) lt!341321))))

(declare-fun b!767282 () Bool)

(declare-fun res!519065 () Bool)

(declare-fun e!427270 () Bool)

(assert (=> b!767282 (=> (not res!519065) (not e!427270))))

(assert (=> b!767282 (= res!519065 e!427267)))

(declare-fun c!84502 () Bool)

(assert (=> b!767282 (= c!84502 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!767283 () Bool)

(declare-fun res!519055 () Bool)

(assert (=> b!767283 (=> (not res!519055) (not e!427268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!767283 (= res!519055 (validKeyInArray!0 (select (arr!20245 a!3186) j!159)))))

(declare-fun b!767284 () Bool)

(declare-fun res!519061 () Bool)

(assert (=> b!767284 (=> (not res!519061) (not e!427265))))

(assert (=> b!767284 (= res!519061 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20666 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20666 a!3186))))))

(declare-fun b!767285 () Bool)

(declare-fun res!519063 () Bool)

(assert (=> b!767285 (=> (not res!519063) (not e!427268))))

(assert (=> b!767285 (= res!519063 (and (= (size!20666 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20666 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20666 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!767286 () Bool)

(declare-fun res!519057 () Bool)

(assert (=> b!767286 (=> (not res!519057) (not e!427265))))

(declare-datatypes ((List!14247 0))(
  ( (Nil!14244) (Cons!14243 (h!15336 (_ BitVec 64)) (t!20562 List!14247)) )
))
(declare-fun arrayNoDuplicates!0 (array!42284 (_ BitVec 32) List!14247) Bool)

(assert (=> b!767286 (= res!519057 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14244))))

(declare-fun b!767287 () Bool)

(assert (=> b!767287 (= e!427270 e!427266)))

(declare-fun res!519054 () Bool)

(assert (=> b!767287 (=> (not res!519054) (not e!427266))))

(declare-fun lt!341312 () SeekEntryResult!7845)

(assert (=> b!767287 (= res!519054 (= lt!341312 lt!341315))))

(declare-fun lt!341320 () array!42284)

(declare-fun lt!341318 () (_ BitVec 64))

(assert (=> b!767287 (= lt!341315 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341318 lt!341320 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767287 (= lt!341312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341318 mask!3328) lt!341318 lt!341320 mask!3328))))

(assert (=> b!767287 (= lt!341318 (select (store (arr!20245 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!767287 (= lt!341320 (array!42285 (store (arr!20245 a!3186) i!1173 k0!2102) (size!20666 a!3186)))))

(declare-fun b!767288 () Bool)

(declare-fun res!519064 () Bool)

(assert (=> b!767288 (=> (not res!519064) (not e!427270))))

(assert (=> b!767288 (= res!519064 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20245 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!767289 () Bool)

(assert (=> b!767289 (= e!427265 e!427270)))

(declare-fun res!519066 () Bool)

(assert (=> b!767289 (=> (not res!519066) (not e!427270))))

(assert (=> b!767289 (= res!519066 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20245 a!3186) j!159) mask!3328) (select (arr!20245 a!3186) j!159) a!3186 mask!3328) lt!341321))))

(assert (=> b!767289 (= lt!341321 (Intermediate!7845 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!767290 () Bool)

(declare-fun res!519067 () Bool)

(assert (=> b!767290 (=> (not res!519067) (not e!427268))))

(assert (=> b!767290 (= res!519067 (validKeyInArray!0 k0!2102))))

(declare-fun b!767291 () Bool)

(assert (=> b!767291 (= e!427267 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20245 a!3186) j!159) a!3186 mask!3328) (Found!7845 j!159)))))

(assert (= (and start!66574 res!519059) b!767285))

(assert (= (and b!767285 res!519063) b!767283))

(assert (= (and b!767283 res!519055) b!767290))

(assert (= (and b!767290 res!519067) b!767273))

(assert (= (and b!767273 res!519062) b!767279))

(assert (= (and b!767279 res!519060) b!767278))

(assert (= (and b!767278 res!519051) b!767286))

(assert (= (and b!767286 res!519057) b!767284))

(assert (= (and b!767284 res!519061) b!767289))

(assert (= (and b!767289 res!519066) b!767288))

(assert (= (and b!767288 res!519064) b!767282))

(assert (= (and b!767282 c!84502) b!767281))

(assert (= (and b!767282 (not c!84502)) b!767291))

(assert (= (and b!767282 res!519065) b!767287))

(assert (= (and b!767287 res!519054) b!767280))

(assert (= (and b!767280 res!519052) b!767276))

(assert (= (and b!767276 res!519056) b!767277))

(assert (= (and b!767280 (not res!519058)) b!767274))

(assert (= (and b!767274 (not res!519053)) b!767275))

(declare-fun m!713073 () Bool)

(assert (=> b!767291 m!713073))

(assert (=> b!767291 m!713073))

(declare-fun m!713075 () Bool)

(assert (=> b!767291 m!713075))

(declare-fun m!713077 () Bool)

(assert (=> b!767280 m!713077))

(declare-fun m!713079 () Bool)

(assert (=> b!767280 m!713079))

(declare-fun m!713081 () Bool)

(assert (=> b!767287 m!713081))

(declare-fun m!713083 () Bool)

(assert (=> b!767287 m!713083))

(declare-fun m!713085 () Bool)

(assert (=> b!767287 m!713085))

(declare-fun m!713087 () Bool)

(assert (=> b!767287 m!713087))

(assert (=> b!767287 m!713083))

(declare-fun m!713089 () Bool)

(assert (=> b!767287 m!713089))

(declare-fun m!713091 () Bool)

(assert (=> start!66574 m!713091))

(declare-fun m!713093 () Bool)

(assert (=> start!66574 m!713093))

(assert (=> b!767281 m!713073))

(assert (=> b!767281 m!713073))

(declare-fun m!713095 () Bool)

(assert (=> b!767281 m!713095))

(declare-fun m!713097 () Bool)

(assert (=> b!767274 m!713097))

(declare-fun m!713099 () Bool)

(assert (=> b!767288 m!713099))

(assert (=> b!767276 m!713073))

(assert (=> b!767276 m!713073))

(declare-fun m!713101 () Bool)

(assert (=> b!767276 m!713101))

(declare-fun m!713103 () Bool)

(assert (=> b!767290 m!713103))

(assert (=> b!767277 m!713073))

(assert (=> b!767277 m!713073))

(declare-fun m!713105 () Bool)

(assert (=> b!767277 m!713105))

(assert (=> b!767289 m!713073))

(assert (=> b!767289 m!713073))

(declare-fun m!713107 () Bool)

(assert (=> b!767289 m!713107))

(assert (=> b!767289 m!713107))

(assert (=> b!767289 m!713073))

(declare-fun m!713109 () Bool)

(assert (=> b!767289 m!713109))

(declare-fun m!713111 () Bool)

(assert (=> b!767279 m!713111))

(declare-fun m!713113 () Bool)

(assert (=> b!767286 m!713113))

(declare-fun m!713115 () Bool)

(assert (=> b!767273 m!713115))

(assert (=> b!767275 m!713073))

(assert (=> b!767275 m!713073))

(assert (=> b!767275 m!713075))

(assert (=> b!767283 m!713073))

(assert (=> b!767283 m!713073))

(declare-fun m!713117 () Bool)

(assert (=> b!767283 m!713117))

(declare-fun m!713119 () Bool)

(assert (=> b!767278 m!713119))

(check-sat (not b!767278) (not b!767276) (not b!767277) (not b!767279) (not b!767275) (not b!767286) (not b!767291) (not b!767274) (not b!767283) (not b!767280) (not b!767289) (not b!767273) (not b!767287) (not b!767290) (not start!66574) (not b!767281))
(check-sat)
