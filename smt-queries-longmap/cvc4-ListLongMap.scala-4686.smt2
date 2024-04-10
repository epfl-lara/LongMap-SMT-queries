; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65180 () Bool)

(assert start!65180)

(declare-fun e!412387 () Bool)

(declare-datatypes ((array!41353 0))(
  ( (array!41354 (arr!19790 (Array (_ BitVec 32) (_ BitVec 64))) (size!20211 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41353)

(declare-datatypes ((SeekEntryResult!7390 0))(
  ( (MissingZero!7390 (index!31928 (_ BitVec 32))) (Found!7390 (index!31929 (_ BitVec 32))) (Intermediate!7390 (undefined!8202 Bool) (index!31930 (_ BitVec 32)) (x!62924 (_ BitVec 32))) (Undefined!7390) (MissingVacant!7390 (index!31931 (_ BitVec 32))) )
))
(declare-fun lt!327085 () SeekEntryResult!7390)

(declare-fun b!737260 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41353 (_ BitVec 32)) SeekEntryResult!7390)

(assert (=> b!737260 (= e!412387 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19790 a!3186) j!159) a!3186 mask!3328) lt!327085))))

(declare-fun b!737261 () Bool)

(declare-fun res!495549 () Bool)

(declare-fun e!412385 () Bool)

(assert (=> b!737261 (=> (not res!495549) (not e!412385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41353 (_ BitVec 32)) Bool)

(assert (=> b!737261 (= res!495549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!737262 () Bool)

(declare-fun res!495556 () Bool)

(assert (=> b!737262 (=> (not res!495556) (not e!412385))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!737262 (= res!495556 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20211 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20211 a!3186))))))

(declare-fun lt!327082 () SeekEntryResult!7390)

(declare-fun b!737263 () Bool)

(declare-fun e!412388 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41353 (_ BitVec 32)) SeekEntryResult!7390)

(assert (=> b!737263 (= e!412388 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19790 a!3186) j!159) a!3186 mask!3328) lt!327082))))

(declare-fun b!737264 () Bool)

(declare-fun res!495545 () Bool)

(declare-fun e!412391 () Bool)

(assert (=> b!737264 (=> (not res!495545) (not e!412391))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!737264 (= res!495545 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19790 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!495544 () Bool)

(declare-fun e!412390 () Bool)

(assert (=> start!65180 (=> (not res!495544) (not e!412390))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65180 (= res!495544 (validMask!0 mask!3328))))

(assert (=> start!65180 e!412390))

(assert (=> start!65180 true))

(declare-fun array_inv!15586 (array!41353) Bool)

(assert (=> start!65180 (array_inv!15586 a!3186)))

(declare-fun b!737265 () Bool)

(declare-fun e!412386 () Bool)

(assert (=> b!737265 (= e!412386 e!412388)))

(declare-fun res!495554 () Bool)

(assert (=> b!737265 (=> (not res!495554) (not e!412388))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41353 (_ BitVec 32)) SeekEntryResult!7390)

(assert (=> b!737265 (= res!495554 (= (seekEntryOrOpen!0 (select (arr!19790 a!3186) j!159) a!3186 mask!3328) lt!327082))))

(assert (=> b!737265 (= lt!327082 (Found!7390 j!159))))

(declare-fun b!737266 () Bool)

(declare-fun e!412394 () Bool)

(declare-fun e!412392 () Bool)

(assert (=> b!737266 (= e!412394 (not e!412392))))

(declare-fun res!495543 () Bool)

(assert (=> b!737266 (=> res!495543 e!412392)))

(declare-fun lt!327081 () SeekEntryResult!7390)

(assert (=> b!737266 (= res!495543 (or (not (is-Intermediate!7390 lt!327081)) (bvsge x!1131 (x!62924 lt!327081))))))

(declare-fun lt!327080 () SeekEntryResult!7390)

(assert (=> b!737266 (= lt!327080 (Found!7390 j!159))))

(assert (=> b!737266 e!412386))

(declare-fun res!495550 () Bool)

(assert (=> b!737266 (=> (not res!495550) (not e!412386))))

(assert (=> b!737266 (= res!495550 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25156 0))(
  ( (Unit!25157) )
))
(declare-fun lt!327084 () Unit!25156)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41353 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25156)

(assert (=> b!737266 (= lt!327084 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737267 () Bool)

(declare-fun e!412384 () Bool)

(assert (=> b!737267 (= e!412384 true)))

(declare-fun lt!327077 () (_ BitVec 64))

(declare-fun lt!327089 () array!41353)

(declare-fun lt!327078 () (_ BitVec 32))

(declare-fun lt!327086 () SeekEntryResult!7390)

(assert (=> b!737267 (= lt!327086 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327078 lt!327077 lt!327089 mask!3328))))

(declare-fun b!737268 () Bool)

(declare-fun e!412389 () Unit!25156)

(declare-fun Unit!25158 () Unit!25156)

(assert (=> b!737268 (= e!412389 Unit!25158)))

(declare-fun lt!327088 () SeekEntryResult!7390)

(assert (=> b!737268 (= lt!327088 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19790 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!737268 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327078 resIntermediateIndex!5 (select (arr!19790 a!3186) j!159) a!3186 mask!3328) lt!327080)))

(declare-fun b!737269 () Bool)

(declare-fun e!412393 () Bool)

(assert (=> b!737269 (= e!412393 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327078 resIntermediateIndex!5 (select (arr!19790 a!3186) j!159) a!3186 mask!3328) lt!327080)))))

(declare-fun b!737270 () Bool)

(assert (=> b!737270 (= e!412387 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19790 a!3186) j!159) a!3186 mask!3328) (Found!7390 j!159)))))

(declare-fun b!737271 () Bool)

(assert (=> b!737271 (= e!412390 e!412385)))

(declare-fun res!495557 () Bool)

(assert (=> b!737271 (=> (not res!495557) (not e!412385))))

(declare-fun lt!327076 () SeekEntryResult!7390)

(assert (=> b!737271 (= res!495557 (or (= lt!327076 (MissingZero!7390 i!1173)) (= lt!327076 (MissingVacant!7390 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!737271 (= lt!327076 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!737272 () Bool)

(declare-fun res!495546 () Bool)

(assert (=> b!737272 (=> res!495546 e!412384)))

(assert (=> b!737272 (= res!495546 e!412393)))

(declare-fun c!81241 () Bool)

(declare-fun lt!327079 () Bool)

(assert (=> b!737272 (= c!81241 lt!327079)))

(declare-fun b!737273 () Bool)

(assert (=> b!737273 (= e!412385 e!412391)))

(declare-fun res!495548 () Bool)

(assert (=> b!737273 (=> (not res!495548) (not e!412391))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737273 (= res!495548 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19790 a!3186) j!159) mask!3328) (select (arr!19790 a!3186) j!159) a!3186 mask!3328) lt!327085))))

(assert (=> b!737273 (= lt!327085 (Intermediate!7390 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737274 () Bool)

(declare-fun res!495552 () Bool)

(assert (=> b!737274 (=> (not res!495552) (not e!412385))))

(declare-datatypes ((List!13792 0))(
  ( (Nil!13789) (Cons!13788 (h!14860 (_ BitVec 64)) (t!20107 List!13792)) )
))
(declare-fun arrayNoDuplicates!0 (array!41353 (_ BitVec 32) List!13792) Bool)

(assert (=> b!737274 (= res!495552 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13789))))

(declare-fun b!737275 () Bool)

(assert (=> b!737275 (= e!412391 e!412394)))

(declare-fun res!495560 () Bool)

(assert (=> b!737275 (=> (not res!495560) (not e!412394))))

(declare-fun lt!327087 () SeekEntryResult!7390)

(assert (=> b!737275 (= res!495560 (= lt!327087 lt!327081))))

(assert (=> b!737275 (= lt!327081 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327077 lt!327089 mask!3328))))

(assert (=> b!737275 (= lt!327087 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327077 mask!3328) lt!327077 lt!327089 mask!3328))))

(assert (=> b!737275 (= lt!327077 (select (store (arr!19790 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!737275 (= lt!327089 (array!41354 (store (arr!19790 a!3186) i!1173 k!2102) (size!20211 a!3186)))))

(declare-fun b!737276 () Bool)

(declare-fun res!495547 () Bool)

(assert (=> b!737276 (=> (not res!495547) (not e!412390))))

(declare-fun arrayContainsKey!0 (array!41353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737276 (= res!495547 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!737277 () Bool)

(declare-fun res!495558 () Bool)

(assert (=> b!737277 (=> (not res!495558) (not e!412390))))

(assert (=> b!737277 (= res!495558 (and (= (size!20211 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20211 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20211 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737278 () Bool)

(assert (=> b!737278 (= e!412392 e!412384)))

(declare-fun res!495559 () Bool)

(assert (=> b!737278 (=> res!495559 e!412384)))

(assert (=> b!737278 (= res!495559 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327078 #b00000000000000000000000000000000) (bvsge lt!327078 (size!20211 a!3186))))))

(declare-fun lt!327083 () Unit!25156)

(assert (=> b!737278 (= lt!327083 e!412389)))

(declare-fun c!81239 () Bool)

(assert (=> b!737278 (= c!81239 lt!327079)))

(assert (=> b!737278 (= lt!327079 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737278 (= lt!327078 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!737279 () Bool)

(assert (=> b!737279 (= e!412393 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327078 (select (arr!19790 a!3186) j!159) a!3186 mask!3328) lt!327085)))))

(declare-fun b!737280 () Bool)

(declare-fun res!495555 () Bool)

(assert (=> b!737280 (=> (not res!495555) (not e!412390))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737280 (= res!495555 (validKeyInArray!0 k!2102))))

(declare-fun b!737281 () Bool)

(declare-fun res!495553 () Bool)

(assert (=> b!737281 (=> (not res!495553) (not e!412390))))

(assert (=> b!737281 (= res!495553 (validKeyInArray!0 (select (arr!19790 a!3186) j!159)))))

(declare-fun b!737282 () Bool)

(declare-fun Unit!25159 () Unit!25156)

(assert (=> b!737282 (= e!412389 Unit!25159)))

(assert (=> b!737282 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327078 (select (arr!19790 a!3186) j!159) a!3186 mask!3328) lt!327085)))

(declare-fun b!737283 () Bool)

(declare-fun res!495551 () Bool)

(assert (=> b!737283 (=> (not res!495551) (not e!412391))))

(assert (=> b!737283 (= res!495551 e!412387)))

(declare-fun c!81240 () Bool)

(assert (=> b!737283 (= c!81240 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65180 res!495544) b!737277))

(assert (= (and b!737277 res!495558) b!737281))

(assert (= (and b!737281 res!495553) b!737280))

(assert (= (and b!737280 res!495555) b!737276))

(assert (= (and b!737276 res!495547) b!737271))

(assert (= (and b!737271 res!495557) b!737261))

(assert (= (and b!737261 res!495549) b!737274))

(assert (= (and b!737274 res!495552) b!737262))

(assert (= (and b!737262 res!495556) b!737273))

(assert (= (and b!737273 res!495548) b!737264))

(assert (= (and b!737264 res!495545) b!737283))

(assert (= (and b!737283 c!81240) b!737260))

(assert (= (and b!737283 (not c!81240)) b!737270))

(assert (= (and b!737283 res!495551) b!737275))

(assert (= (and b!737275 res!495560) b!737266))

(assert (= (and b!737266 res!495550) b!737265))

(assert (= (and b!737265 res!495554) b!737263))

(assert (= (and b!737266 (not res!495543)) b!737278))

(assert (= (and b!737278 c!81239) b!737282))

(assert (= (and b!737278 (not c!81239)) b!737268))

(assert (= (and b!737278 (not res!495559)) b!737272))

(assert (= (and b!737272 c!81241) b!737279))

(assert (= (and b!737272 (not c!81241)) b!737269))

(assert (= (and b!737272 (not res!495546)) b!737267))

(declare-fun m!689185 () Bool)

(assert (=> b!737269 m!689185))

(assert (=> b!737269 m!689185))

(declare-fun m!689187 () Bool)

(assert (=> b!737269 m!689187))

(declare-fun m!689189 () Bool)

(assert (=> b!737275 m!689189))

(declare-fun m!689191 () Bool)

(assert (=> b!737275 m!689191))

(declare-fun m!689193 () Bool)

(assert (=> b!737275 m!689193))

(declare-fun m!689195 () Bool)

(assert (=> b!737275 m!689195))

(declare-fun m!689197 () Bool)

(assert (=> b!737275 m!689197))

(assert (=> b!737275 m!689193))

(declare-fun m!689199 () Bool)

(assert (=> b!737274 m!689199))

(declare-fun m!689201 () Bool)

(assert (=> b!737267 m!689201))

(declare-fun m!689203 () Bool)

(assert (=> b!737266 m!689203))

(declare-fun m!689205 () Bool)

(assert (=> b!737266 m!689205))

(assert (=> b!737270 m!689185))

(assert (=> b!737270 m!689185))

(declare-fun m!689207 () Bool)

(assert (=> b!737270 m!689207))

(assert (=> b!737260 m!689185))

(assert (=> b!737260 m!689185))

(declare-fun m!689209 () Bool)

(assert (=> b!737260 m!689209))

(assert (=> b!737273 m!689185))

(assert (=> b!737273 m!689185))

(declare-fun m!689211 () Bool)

(assert (=> b!737273 m!689211))

(assert (=> b!737273 m!689211))

(assert (=> b!737273 m!689185))

(declare-fun m!689213 () Bool)

(assert (=> b!737273 m!689213))

(declare-fun m!689215 () Bool)

(assert (=> b!737278 m!689215))

(assert (=> b!737282 m!689185))

(assert (=> b!737282 m!689185))

(declare-fun m!689217 () Bool)

(assert (=> b!737282 m!689217))

(assert (=> b!737265 m!689185))

(assert (=> b!737265 m!689185))

(declare-fun m!689219 () Bool)

(assert (=> b!737265 m!689219))

(declare-fun m!689221 () Bool)

(assert (=> b!737276 m!689221))

(assert (=> b!737279 m!689185))

(assert (=> b!737279 m!689185))

(assert (=> b!737279 m!689217))

(declare-fun m!689223 () Bool)

(assert (=> b!737264 m!689223))

(declare-fun m!689225 () Bool)

(assert (=> b!737280 m!689225))

(assert (=> b!737268 m!689185))

(assert (=> b!737268 m!689185))

(assert (=> b!737268 m!689207))

(assert (=> b!737268 m!689185))

(assert (=> b!737268 m!689187))

(assert (=> b!737263 m!689185))

(assert (=> b!737263 m!689185))

(declare-fun m!689227 () Bool)

(assert (=> b!737263 m!689227))

(declare-fun m!689229 () Bool)

(assert (=> b!737271 m!689229))

(declare-fun m!689231 () Bool)

(assert (=> b!737261 m!689231))

(declare-fun m!689233 () Bool)

(assert (=> start!65180 m!689233))

(declare-fun m!689235 () Bool)

(assert (=> start!65180 m!689235))

(assert (=> b!737281 m!689185))

(assert (=> b!737281 m!689185))

(declare-fun m!689237 () Bool)

(assert (=> b!737281 m!689237))

(push 1)

