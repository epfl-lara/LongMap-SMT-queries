; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65812 () Bool)

(assert start!65812)

(declare-fun b!757427 () Bool)

(declare-fun res!512261 () Bool)

(declare-fun e!422321 () Bool)

(assert (=> b!757427 (=> (not res!512261) (not e!422321))))

(declare-datatypes ((array!41985 0))(
  ( (array!41986 (arr!20106 (Array (_ BitVec 32) (_ BitVec 64))) (size!20527 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41985)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!757427 (= res!512261 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20106 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!757428 () Bool)

(declare-fun e!422318 () Bool)

(declare-fun e!422311 () Bool)

(assert (=> b!757428 (= e!422318 e!422311)))

(declare-fun res!512274 () Bool)

(assert (=> b!757428 (=> res!512274 e!422311)))

(declare-fun lt!337305 () (_ BitVec 64))

(declare-fun lt!337309 () (_ BitVec 64))

(assert (=> b!757428 (= res!512274 (= lt!337305 lt!337309))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!757428 (= lt!337305 (select (store (arr!20106 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!757429 () Bool)

(declare-datatypes ((Unit!26204 0))(
  ( (Unit!26205) )
))
(declare-fun e!422314 () Unit!26204)

(declare-fun Unit!26206 () Unit!26204)

(assert (=> b!757429 (= e!422314 Unit!26206)))

(declare-fun b!757430 () Bool)

(declare-fun res!512264 () Bool)

(declare-fun e!422313 () Bool)

(assert (=> b!757430 (=> (not res!512264) (not e!422313))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757430 (= res!512264 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20527 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20527 a!3186))))))

(declare-fun b!757431 () Bool)

(declare-fun res!512265 () Bool)

(declare-fun e!422315 () Bool)

(assert (=> b!757431 (=> (not res!512265) (not e!422315))))

(declare-fun lt!337304 () array!41985)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7706 0))(
  ( (MissingZero!7706 (index!33192 (_ BitVec 32))) (Found!7706 (index!33193 (_ BitVec 32))) (Intermediate!7706 (undefined!8518 Bool) (index!33194 (_ BitVec 32)) (x!64088 (_ BitVec 32))) (Undefined!7706) (MissingVacant!7706 (index!33195 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41985 (_ BitVec 32)) SeekEntryResult!7706)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41985 (_ BitVec 32)) SeekEntryResult!7706)

(assert (=> b!757431 (= res!512265 (= (seekEntryOrOpen!0 lt!337309 lt!337304 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337309 lt!337304 mask!3328)))))

(declare-fun b!757432 () Bool)

(declare-fun res!512275 () Bool)

(assert (=> b!757432 (=> (not res!512275) (not e!422313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41985 (_ BitVec 32)) Bool)

(assert (=> b!757432 (= res!512275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!757433 () Bool)

(declare-fun res!512270 () Bool)

(assert (=> b!757433 (=> (not res!512270) (not e!422313))))

(declare-datatypes ((List!14108 0))(
  ( (Nil!14105) (Cons!14104 (h!15176 (_ BitVec 64)) (t!20423 List!14108)) )
))
(declare-fun arrayNoDuplicates!0 (array!41985 (_ BitVec 32) List!14108) Bool)

(assert (=> b!757433 (= res!512270 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14105))))

(declare-fun b!757434 () Bool)

(declare-fun res!512259 () Bool)

(assert (=> b!757434 (=> (not res!512259) (not e!422321))))

(declare-fun e!422320 () Bool)

(assert (=> b!757434 (= res!512259 e!422320)))

(declare-fun c!82965 () Bool)

(assert (=> b!757434 (= c!82965 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!757435 () Bool)

(declare-fun e!422312 () Bool)

(assert (=> b!757435 (= e!422321 e!422312)))

(declare-fun res!512267 () Bool)

(assert (=> b!757435 (=> (not res!512267) (not e!422312))))

(declare-fun lt!337310 () SeekEntryResult!7706)

(declare-fun lt!337302 () SeekEntryResult!7706)

(assert (=> b!757435 (= res!512267 (= lt!337310 lt!337302))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41985 (_ BitVec 32)) SeekEntryResult!7706)

(assert (=> b!757435 (= lt!337302 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337309 lt!337304 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757435 (= lt!337310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337309 mask!3328) lt!337309 lt!337304 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!757435 (= lt!337309 (select (store (arr!20106 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!757435 (= lt!337304 (array!41986 (store (arr!20106 a!3186) i!1173 k!2102) (size!20527 a!3186)))))

(declare-fun b!757436 () Bool)

(declare-fun e!422319 () Bool)

(assert (=> b!757436 (= e!422312 (not e!422319))))

(declare-fun res!512269 () Bool)

(assert (=> b!757436 (=> res!512269 e!422319)))

(assert (=> b!757436 (= res!512269 (or (not (is-Intermediate!7706 lt!337302)) (bvslt x!1131 (x!64088 lt!337302)) (not (= x!1131 (x!64088 lt!337302))) (not (= index!1321 (index!33194 lt!337302)))))))

(declare-fun e!422316 () Bool)

(assert (=> b!757436 e!422316))

(declare-fun res!512258 () Bool)

(assert (=> b!757436 (=> (not res!512258) (not e!422316))))

(declare-fun lt!337313 () SeekEntryResult!7706)

(declare-fun lt!337307 () SeekEntryResult!7706)

(assert (=> b!757436 (= res!512258 (= lt!337313 lt!337307))))

(assert (=> b!757436 (= lt!337307 (Found!7706 j!159))))

(assert (=> b!757436 (= lt!337313 (seekEntryOrOpen!0 (select (arr!20106 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!757436 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337303 () Unit!26204)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41985 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26204)

(assert (=> b!757436 (= lt!337303 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!757437 () Bool)

(assert (=> b!757437 (= e!422319 e!422318)))

(declare-fun res!512276 () Bool)

(assert (=> b!757437 (=> res!512276 e!422318)))

(declare-fun lt!337306 () SeekEntryResult!7706)

(assert (=> b!757437 (= res!512276 (not (= lt!337306 lt!337307)))))

(assert (=> b!757437 (= lt!337306 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20106 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757438 () Bool)

(assert (=> b!757438 (= e!422316 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20106 a!3186) j!159) a!3186 mask!3328) lt!337307))))

(declare-fun b!757439 () Bool)

(declare-fun lt!337308 () SeekEntryResult!7706)

(assert (=> b!757439 (= e!422320 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20106 a!3186) j!159) a!3186 mask!3328) lt!337308))))

(declare-fun b!757440 () Bool)

(assert (=> b!757440 (= e!422311 true)))

(assert (=> b!757440 e!422315))

(declare-fun res!512262 () Bool)

(assert (=> b!757440 (=> (not res!512262) (not e!422315))))

(assert (=> b!757440 (= res!512262 (= lt!337305 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337312 () Unit!26204)

(assert (=> b!757440 (= lt!337312 e!422314)))

(declare-fun c!82966 () Bool)

(assert (=> b!757440 (= c!82966 (= lt!337305 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!757441 () Bool)

(assert (=> b!757441 (= e!422320 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20106 a!3186) j!159) a!3186 mask!3328) (Found!7706 j!159)))))

(declare-fun b!757442 () Bool)

(assert (=> b!757442 (= e!422313 e!422321)))

(declare-fun res!512266 () Bool)

(assert (=> b!757442 (=> (not res!512266) (not e!422321))))

(assert (=> b!757442 (= res!512266 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20106 a!3186) j!159) mask!3328) (select (arr!20106 a!3186) j!159) a!3186 mask!3328) lt!337308))))

(assert (=> b!757442 (= lt!337308 (Intermediate!7706 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757443 () Bool)

(declare-fun e!422310 () Bool)

(assert (=> b!757443 (= e!422310 e!422313)))

(declare-fun res!512268 () Bool)

(assert (=> b!757443 (=> (not res!512268) (not e!422313))))

(declare-fun lt!337311 () SeekEntryResult!7706)

(assert (=> b!757443 (= res!512268 (or (= lt!337311 (MissingZero!7706 i!1173)) (= lt!337311 (MissingVacant!7706 i!1173))))))

(assert (=> b!757443 (= lt!337311 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!757444 () Bool)

(declare-fun res!512260 () Bool)

(assert (=> b!757444 (=> (not res!512260) (not e!422310))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757444 (= res!512260 (validKeyInArray!0 (select (arr!20106 a!3186) j!159)))))

(declare-fun b!757445 () Bool)

(declare-fun res!512263 () Bool)

(assert (=> b!757445 (=> (not res!512263) (not e!422310))))

(assert (=> b!757445 (= res!512263 (and (= (size!20527 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20527 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20527 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!757446 () Bool)

(declare-fun res!512273 () Bool)

(assert (=> b!757446 (=> (not res!512273) (not e!422310))))

(assert (=> b!757446 (= res!512273 (validKeyInArray!0 k!2102))))

(declare-fun b!757447 () Bool)

(assert (=> b!757447 (= e!422315 (= lt!337313 lt!337306))))

(declare-fun res!512271 () Bool)

(assert (=> start!65812 (=> (not res!512271) (not e!422310))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65812 (= res!512271 (validMask!0 mask!3328))))

(assert (=> start!65812 e!422310))

(assert (=> start!65812 true))

(declare-fun array_inv!15902 (array!41985) Bool)

(assert (=> start!65812 (array_inv!15902 a!3186)))

(declare-fun b!757448 () Bool)

(declare-fun Unit!26207 () Unit!26204)

(assert (=> b!757448 (= e!422314 Unit!26207)))

(assert (=> b!757448 false))

(declare-fun b!757449 () Bool)

(declare-fun res!512272 () Bool)

(assert (=> b!757449 (=> (not res!512272) (not e!422310))))

(declare-fun arrayContainsKey!0 (array!41985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757449 (= res!512272 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65812 res!512271) b!757445))

(assert (= (and b!757445 res!512263) b!757444))

(assert (= (and b!757444 res!512260) b!757446))

(assert (= (and b!757446 res!512273) b!757449))

(assert (= (and b!757449 res!512272) b!757443))

(assert (= (and b!757443 res!512268) b!757432))

(assert (= (and b!757432 res!512275) b!757433))

(assert (= (and b!757433 res!512270) b!757430))

(assert (= (and b!757430 res!512264) b!757442))

(assert (= (and b!757442 res!512266) b!757427))

(assert (= (and b!757427 res!512261) b!757434))

(assert (= (and b!757434 c!82965) b!757439))

(assert (= (and b!757434 (not c!82965)) b!757441))

(assert (= (and b!757434 res!512259) b!757435))

(assert (= (and b!757435 res!512267) b!757436))

(assert (= (and b!757436 res!512258) b!757438))

(assert (= (and b!757436 (not res!512269)) b!757437))

(assert (= (and b!757437 (not res!512276)) b!757428))

(assert (= (and b!757428 (not res!512274)) b!757440))

(assert (= (and b!757440 c!82966) b!757448))

(assert (= (and b!757440 (not c!82966)) b!757429))

(assert (= (and b!757440 res!512262) b!757431))

(assert (= (and b!757431 res!512265) b!757447))

(declare-fun m!705139 () Bool)

(assert (=> b!757428 m!705139))

(declare-fun m!705141 () Bool)

(assert (=> b!757428 m!705141))

(declare-fun m!705143 () Bool)

(assert (=> b!757433 m!705143))

(declare-fun m!705145 () Bool)

(assert (=> b!757432 m!705145))

(declare-fun m!705147 () Bool)

(assert (=> start!65812 m!705147))

(declare-fun m!705149 () Bool)

(assert (=> start!65812 m!705149))

(declare-fun m!705151 () Bool)

(assert (=> b!757431 m!705151))

(declare-fun m!705153 () Bool)

(assert (=> b!757431 m!705153))

(declare-fun m!705155 () Bool)

(assert (=> b!757446 m!705155))

(declare-fun m!705157 () Bool)

(assert (=> b!757435 m!705157))

(declare-fun m!705159 () Bool)

(assert (=> b!757435 m!705159))

(assert (=> b!757435 m!705157))

(assert (=> b!757435 m!705139))

(declare-fun m!705161 () Bool)

(assert (=> b!757435 m!705161))

(declare-fun m!705163 () Bool)

(assert (=> b!757435 m!705163))

(declare-fun m!705165 () Bool)

(assert (=> b!757439 m!705165))

(assert (=> b!757439 m!705165))

(declare-fun m!705167 () Bool)

(assert (=> b!757439 m!705167))

(assert (=> b!757437 m!705165))

(assert (=> b!757437 m!705165))

(declare-fun m!705169 () Bool)

(assert (=> b!757437 m!705169))

(assert (=> b!757444 m!705165))

(assert (=> b!757444 m!705165))

(declare-fun m!705171 () Bool)

(assert (=> b!757444 m!705171))

(assert (=> b!757441 m!705165))

(assert (=> b!757441 m!705165))

(assert (=> b!757441 m!705169))

(assert (=> b!757442 m!705165))

(assert (=> b!757442 m!705165))

(declare-fun m!705173 () Bool)

(assert (=> b!757442 m!705173))

(assert (=> b!757442 m!705173))

(assert (=> b!757442 m!705165))

(declare-fun m!705175 () Bool)

(assert (=> b!757442 m!705175))

(assert (=> b!757436 m!705165))

(assert (=> b!757436 m!705165))

(declare-fun m!705177 () Bool)

(assert (=> b!757436 m!705177))

(declare-fun m!705179 () Bool)

(assert (=> b!757436 m!705179))

(declare-fun m!705181 () Bool)

(assert (=> b!757436 m!705181))

(declare-fun m!705183 () Bool)

(assert (=> b!757443 m!705183))

(declare-fun m!705185 () Bool)

(assert (=> b!757427 m!705185))

(assert (=> b!757438 m!705165))

(assert (=> b!757438 m!705165))

(declare-fun m!705187 () Bool)

(assert (=> b!757438 m!705187))

(declare-fun m!705189 () Bool)

(assert (=> b!757449 m!705189))

(push 1)

