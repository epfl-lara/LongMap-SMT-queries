; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66558 () Bool)

(assert start!66558)

(declare-fun b!767139 () Bool)

(declare-fun e!427169 () Bool)

(declare-fun e!427172 () Bool)

(assert (=> b!767139 (= e!427169 e!427172)))

(declare-fun res!519062 () Bool)

(assert (=> b!767139 (=> res!519062 e!427172)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!767139 (= res!519062 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!341135 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767139 (= lt!341135 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-datatypes ((array!42285 0))(
  ( (array!42286 (arr!20246 (Array (_ BitVec 32) (_ BitVec 64))) (size!20667 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42285)

(declare-fun b!767140 () Bool)

(declare-fun e!427174 () Bool)

(declare-datatypes ((SeekEntryResult!7843 0))(
  ( (MissingZero!7843 (index!33740 (_ BitVec 32))) (Found!7843 (index!33741 (_ BitVec 32))) (Intermediate!7843 (undefined!8655 Bool) (index!33742 (_ BitVec 32)) (x!64664 (_ BitVec 32))) (Undefined!7843) (MissingVacant!7843 (index!33743 (_ BitVec 32))) )
))
(declare-fun lt!341132 () SeekEntryResult!7843)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42285 (_ BitVec 32)) SeekEntryResult!7843)

(assert (=> b!767140 (= e!427174 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20246 a!3186) j!159) a!3186 mask!3328) lt!341132))))

(declare-fun b!767141 () Bool)

(declare-fun e!427175 () Bool)

(assert (=> b!767141 (= e!427175 (not e!427169))))

(declare-fun res!519060 () Bool)

(assert (=> b!767141 (=> res!519060 e!427169)))

(declare-fun lt!341140 () SeekEntryResult!7843)

(get-info :version)

(assert (=> b!767141 (= res!519060 (or (not ((_ is Intermediate!7843) lt!341140)) (bvsge x!1131 (x!64664 lt!341140))))))

(declare-fun lt!341138 () SeekEntryResult!7843)

(assert (=> b!767141 (= lt!341138 (Found!7843 j!159))))

(declare-fun e!427176 () Bool)

(assert (=> b!767141 e!427176))

(declare-fun res!519058 () Bool)

(assert (=> b!767141 (=> (not res!519058) (not e!427176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42285 (_ BitVec 32)) Bool)

(assert (=> b!767141 (= res!519058 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26384 0))(
  ( (Unit!26385) )
))
(declare-fun lt!341134 () Unit!26384)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42285 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26384)

(assert (=> b!767141 (= lt!341134 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!767142 () Bool)

(declare-fun res!519057 () Bool)

(declare-fun e!427173 () Bool)

(assert (=> b!767142 (=> (not res!519057) (not e!427173))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!767142 (= res!519057 (validKeyInArray!0 k0!2102))))

(declare-fun b!767143 () Bool)

(declare-fun e!427178 () Bool)

(assert (=> b!767143 (= e!427173 e!427178)))

(declare-fun res!519056 () Bool)

(assert (=> b!767143 (=> (not res!519056) (not e!427178))))

(declare-fun lt!341136 () SeekEntryResult!7843)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!767143 (= res!519056 (or (= lt!341136 (MissingZero!7843 i!1173)) (= lt!341136 (MissingVacant!7843 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42285 (_ BitVec 32)) SeekEntryResult!7843)

(assert (=> b!767143 (= lt!341136 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!767144 () Bool)

(declare-fun res!519059 () Bool)

(declare-fun e!427170 () Bool)

(assert (=> b!767144 (=> (not res!519059) (not e!427170))))

(assert (=> b!767144 (= res!519059 e!427174)))

(declare-fun c!84438 () Bool)

(assert (=> b!767144 (= c!84438 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!767145 () Bool)

(declare-fun res!519048 () Bool)

(assert (=> b!767145 (=> (not res!519048) (not e!427170))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!767145 (= res!519048 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20246 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!767146 () Bool)

(assert (=> b!767146 (= e!427170 e!427175)))

(declare-fun res!519052 () Bool)

(assert (=> b!767146 (=> (not res!519052) (not e!427175))))

(declare-fun lt!341137 () SeekEntryResult!7843)

(assert (=> b!767146 (= res!519052 (= lt!341137 lt!341140))))

(declare-fun lt!341133 () (_ BitVec 64))

(declare-fun lt!341139 () array!42285)

(assert (=> b!767146 (= lt!341140 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341133 lt!341139 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!767146 (= lt!341137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341133 mask!3328) lt!341133 lt!341139 mask!3328))))

(assert (=> b!767146 (= lt!341133 (select (store (arr!20246 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!767146 (= lt!341139 (array!42286 (store (arr!20246 a!3186) i!1173 k0!2102) (size!20667 a!3186)))))

(declare-fun b!767147 () Bool)

(declare-fun res!519051 () Bool)

(assert (=> b!767147 (=> res!519051 e!427172)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42285 (_ BitVec 32)) SeekEntryResult!7843)

(assert (=> b!767147 (= res!519051 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20246 a!3186) j!159) a!3186 mask!3328) lt!341138)))))

(declare-fun res!519049 () Bool)

(assert (=> start!66558 (=> (not res!519049) (not e!427173))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66558 (= res!519049 (validMask!0 mask!3328))))

(assert (=> start!66558 e!427173))

(assert (=> start!66558 true))

(declare-fun array_inv!16129 (array!42285) Bool)

(assert (=> start!66558 (array_inv!16129 a!3186)))

(declare-fun b!767148 () Bool)

(assert (=> b!767148 (= e!427174 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20246 a!3186) j!159) a!3186 mask!3328) (Found!7843 j!159)))))

(declare-fun b!767149 () Bool)

(declare-fun res!519053 () Bool)

(assert (=> b!767149 (=> (not res!519053) (not e!427173))))

(assert (=> b!767149 (= res!519053 (validKeyInArray!0 (select (arr!20246 a!3186) j!159)))))

(declare-fun b!767150 () Bool)

(assert (=> b!767150 (= e!427172 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341135 resIntermediateIndex!5 (select (arr!20246 a!3186) j!159) a!3186 mask!3328) lt!341138))))

(declare-fun b!767151 () Bool)

(assert (=> b!767151 (= e!427178 e!427170)))

(declare-fun res!519047 () Bool)

(assert (=> b!767151 (=> (not res!519047) (not e!427170))))

(assert (=> b!767151 (= res!519047 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20246 a!3186) j!159) mask!3328) (select (arr!20246 a!3186) j!159) a!3186 mask!3328) lt!341132))))

(assert (=> b!767151 (= lt!341132 (Intermediate!7843 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!767152 () Bool)

(declare-fun res!519061 () Bool)

(assert (=> b!767152 (=> (not res!519061) (not e!427178))))

(assert (=> b!767152 (= res!519061 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20667 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20667 a!3186))))))

(declare-fun b!767153 () Bool)

(declare-fun res!519046 () Bool)

(assert (=> b!767153 (=> (not res!519046) (not e!427173))))

(assert (=> b!767153 (= res!519046 (and (= (size!20667 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20667 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20667 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!767154 () Bool)

(declare-fun res!519055 () Bool)

(assert (=> b!767154 (=> (not res!519055) (not e!427178))))

(assert (=> b!767154 (= res!519055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!767155 () Bool)

(declare-fun res!519054 () Bool)

(assert (=> b!767155 (=> (not res!519054) (not e!427173))))

(declare-fun arrayContainsKey!0 (array!42285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!767155 (= res!519054 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!767156 () Bool)

(declare-fun res!519045 () Bool)

(assert (=> b!767156 (=> (not res!519045) (not e!427178))))

(declare-datatypes ((List!14287 0))(
  ( (Nil!14284) (Cons!14283 (h!15376 (_ BitVec 64)) (t!20593 List!14287)) )
))
(declare-fun arrayNoDuplicates!0 (array!42285 (_ BitVec 32) List!14287) Bool)

(assert (=> b!767156 (= res!519045 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14284))))

(declare-fun b!767157 () Bool)

(declare-fun e!427171 () Bool)

(declare-fun lt!341141 () SeekEntryResult!7843)

(assert (=> b!767157 (= e!427171 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20246 a!3186) j!159) a!3186 mask!3328) lt!341141))))

(declare-fun b!767158 () Bool)

(assert (=> b!767158 (= e!427176 e!427171)))

(declare-fun res!519050 () Bool)

(assert (=> b!767158 (=> (not res!519050) (not e!427171))))

(assert (=> b!767158 (= res!519050 (= (seekEntryOrOpen!0 (select (arr!20246 a!3186) j!159) a!3186 mask!3328) lt!341141))))

(assert (=> b!767158 (= lt!341141 (Found!7843 j!159))))

(assert (= (and start!66558 res!519049) b!767153))

(assert (= (and b!767153 res!519046) b!767149))

(assert (= (and b!767149 res!519053) b!767142))

(assert (= (and b!767142 res!519057) b!767155))

(assert (= (and b!767155 res!519054) b!767143))

(assert (= (and b!767143 res!519056) b!767154))

(assert (= (and b!767154 res!519055) b!767156))

(assert (= (and b!767156 res!519045) b!767152))

(assert (= (and b!767152 res!519061) b!767151))

(assert (= (and b!767151 res!519047) b!767145))

(assert (= (and b!767145 res!519048) b!767144))

(assert (= (and b!767144 c!84438) b!767140))

(assert (= (and b!767144 (not c!84438)) b!767148))

(assert (= (and b!767144 res!519059) b!767146))

(assert (= (and b!767146 res!519052) b!767141))

(assert (= (and b!767141 res!519058) b!767158))

(assert (= (and b!767158 res!519050) b!767157))

(assert (= (and b!767141 (not res!519060)) b!767139))

(assert (= (and b!767139 (not res!519062)) b!767147))

(assert (= (and b!767147 (not res!519051)) b!767150))

(declare-fun m!712411 () Bool)

(assert (=> b!767141 m!712411))

(declare-fun m!712413 () Bool)

(assert (=> b!767141 m!712413))

(declare-fun m!712415 () Bool)

(assert (=> b!767155 m!712415))

(declare-fun m!712417 () Bool)

(assert (=> b!767143 m!712417))

(declare-fun m!712419 () Bool)

(assert (=> b!767156 m!712419))

(declare-fun m!712421 () Bool)

(assert (=> b!767145 m!712421))

(declare-fun m!712423 () Bool)

(assert (=> start!66558 m!712423))

(declare-fun m!712425 () Bool)

(assert (=> start!66558 m!712425))

(declare-fun m!712427 () Bool)

(assert (=> b!767147 m!712427))

(assert (=> b!767147 m!712427))

(declare-fun m!712429 () Bool)

(assert (=> b!767147 m!712429))

(assert (=> b!767151 m!712427))

(assert (=> b!767151 m!712427))

(declare-fun m!712431 () Bool)

(assert (=> b!767151 m!712431))

(assert (=> b!767151 m!712431))

(assert (=> b!767151 m!712427))

(declare-fun m!712433 () Bool)

(assert (=> b!767151 m!712433))

(assert (=> b!767150 m!712427))

(assert (=> b!767150 m!712427))

(declare-fun m!712435 () Bool)

(assert (=> b!767150 m!712435))

(declare-fun m!712437 () Bool)

(assert (=> b!767146 m!712437))

(declare-fun m!712439 () Bool)

(assert (=> b!767146 m!712439))

(declare-fun m!712441 () Bool)

(assert (=> b!767146 m!712441))

(assert (=> b!767146 m!712437))

(declare-fun m!712443 () Bool)

(assert (=> b!767146 m!712443))

(declare-fun m!712445 () Bool)

(assert (=> b!767146 m!712445))

(assert (=> b!767148 m!712427))

(assert (=> b!767148 m!712427))

(assert (=> b!767148 m!712429))

(assert (=> b!767157 m!712427))

(assert (=> b!767157 m!712427))

(declare-fun m!712447 () Bool)

(assert (=> b!767157 m!712447))

(assert (=> b!767140 m!712427))

(assert (=> b!767140 m!712427))

(declare-fun m!712449 () Bool)

(assert (=> b!767140 m!712449))

(declare-fun m!712451 () Bool)

(assert (=> b!767142 m!712451))

(declare-fun m!712453 () Bool)

(assert (=> b!767154 m!712453))

(assert (=> b!767158 m!712427))

(assert (=> b!767158 m!712427))

(declare-fun m!712455 () Bool)

(assert (=> b!767158 m!712455))

(assert (=> b!767149 m!712427))

(assert (=> b!767149 m!712427))

(declare-fun m!712457 () Bool)

(assert (=> b!767149 m!712457))

(declare-fun m!712459 () Bool)

(assert (=> b!767139 m!712459))

(check-sat (not b!767149) (not b!767156) (not b!767139) (not b!767155) (not b!767157) (not b!767158) (not b!767148) (not start!66558) (not b!767140) (not b!767143) (not b!767141) (not b!767146) (not b!767142) (not b!767151) (not b!767154) (not b!767147) (not b!767150))
(check-sat)
(get-model)

(declare-fun d!101155 () Bool)

(assert (=> d!101155 (= (validKeyInArray!0 (select (arr!20246 a!3186) j!159)) (and (not (= (select (arr!20246 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20246 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!767149 d!101155))

(declare-fun b!767291 () Bool)

(declare-fun e!427246 () SeekEntryResult!7843)

(assert (=> b!767291 (= e!427246 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20246 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767292 () Bool)

(declare-fun e!427247 () SeekEntryResult!7843)

(assert (=> b!767292 (= e!427247 (Found!7843 index!1321))))

(declare-fun b!767293 () Bool)

(declare-fun e!427245 () SeekEntryResult!7843)

(assert (=> b!767293 (= e!427245 e!427247)))

(declare-fun lt!341207 () (_ BitVec 64))

(declare-fun c!84452 () Bool)

(assert (=> b!767293 (= c!84452 (= lt!341207 (select (arr!20246 a!3186) j!159)))))

(declare-fun b!767294 () Bool)

(assert (=> b!767294 (= e!427245 Undefined!7843)))

(declare-fun d!101157 () Bool)

(declare-fun lt!341206 () SeekEntryResult!7843)

(assert (=> d!101157 (and (or ((_ is Undefined!7843) lt!341206) (not ((_ is Found!7843) lt!341206)) (and (bvsge (index!33741 lt!341206) #b00000000000000000000000000000000) (bvslt (index!33741 lt!341206) (size!20667 a!3186)))) (or ((_ is Undefined!7843) lt!341206) ((_ is Found!7843) lt!341206) (not ((_ is MissingVacant!7843) lt!341206)) (not (= (index!33743 lt!341206) resIntermediateIndex!5)) (and (bvsge (index!33743 lt!341206) #b00000000000000000000000000000000) (bvslt (index!33743 lt!341206) (size!20667 a!3186)))) (or ((_ is Undefined!7843) lt!341206) (ite ((_ is Found!7843) lt!341206) (= (select (arr!20246 a!3186) (index!33741 lt!341206)) (select (arr!20246 a!3186) j!159)) (and ((_ is MissingVacant!7843) lt!341206) (= (index!33743 lt!341206) resIntermediateIndex!5) (= (select (arr!20246 a!3186) (index!33743 lt!341206)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101157 (= lt!341206 e!427245)))

(declare-fun c!84451 () Bool)

(assert (=> d!101157 (= c!84451 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101157 (= lt!341207 (select (arr!20246 a!3186) index!1321))))

(assert (=> d!101157 (validMask!0 mask!3328)))

(assert (=> d!101157 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20246 a!3186) j!159) a!3186 mask!3328) lt!341206)))

(declare-fun b!767295 () Bool)

(assert (=> b!767295 (= e!427246 (MissingVacant!7843 resIntermediateIndex!5))))

(declare-fun b!767296 () Bool)

(declare-fun c!84453 () Bool)

(assert (=> b!767296 (= c!84453 (= lt!341207 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767296 (= e!427247 e!427246)))

(assert (= (and d!101157 c!84451) b!767294))

(assert (= (and d!101157 (not c!84451)) b!767293))

(assert (= (and b!767293 c!84452) b!767292))

(assert (= (and b!767293 (not c!84452)) b!767296))

(assert (= (and b!767296 c!84453) b!767295))

(assert (= (and b!767296 (not c!84453)) b!767291))

(assert (=> b!767291 m!712459))

(assert (=> b!767291 m!712459))

(assert (=> b!767291 m!712427))

(declare-fun m!712561 () Bool)

(assert (=> b!767291 m!712561))

(declare-fun m!712563 () Bool)

(assert (=> d!101157 m!712563))

(declare-fun m!712565 () Bool)

(assert (=> d!101157 m!712565))

(declare-fun m!712567 () Bool)

(assert (=> d!101157 m!712567))

(assert (=> d!101157 m!712423))

(assert (=> b!767148 d!101157))

(declare-fun b!767309 () Bool)

(declare-fun e!427255 () SeekEntryResult!7843)

(declare-fun e!427254 () SeekEntryResult!7843)

(assert (=> b!767309 (= e!427255 e!427254)))

(declare-fun lt!341216 () (_ BitVec 64))

(declare-fun lt!341214 () SeekEntryResult!7843)

(assert (=> b!767309 (= lt!341216 (select (arr!20246 a!3186) (index!33742 lt!341214)))))

(declare-fun c!84460 () Bool)

(assert (=> b!767309 (= c!84460 (= lt!341216 (select (arr!20246 a!3186) j!159)))))

(declare-fun b!767310 () Bool)

(assert (=> b!767310 (= e!427255 Undefined!7843)))

(declare-fun b!767311 () Bool)

(declare-fun e!427256 () SeekEntryResult!7843)

(assert (=> b!767311 (= e!427256 (MissingZero!7843 (index!33742 lt!341214)))))

(declare-fun b!767312 () Bool)

(assert (=> b!767312 (= e!427254 (Found!7843 (index!33742 lt!341214)))))

(declare-fun d!101159 () Bool)

(declare-fun lt!341215 () SeekEntryResult!7843)

(assert (=> d!101159 (and (or ((_ is Undefined!7843) lt!341215) (not ((_ is Found!7843) lt!341215)) (and (bvsge (index!33741 lt!341215) #b00000000000000000000000000000000) (bvslt (index!33741 lt!341215) (size!20667 a!3186)))) (or ((_ is Undefined!7843) lt!341215) ((_ is Found!7843) lt!341215) (not ((_ is MissingZero!7843) lt!341215)) (and (bvsge (index!33740 lt!341215) #b00000000000000000000000000000000) (bvslt (index!33740 lt!341215) (size!20667 a!3186)))) (or ((_ is Undefined!7843) lt!341215) ((_ is Found!7843) lt!341215) ((_ is MissingZero!7843) lt!341215) (not ((_ is MissingVacant!7843) lt!341215)) (and (bvsge (index!33743 lt!341215) #b00000000000000000000000000000000) (bvslt (index!33743 lt!341215) (size!20667 a!3186)))) (or ((_ is Undefined!7843) lt!341215) (ite ((_ is Found!7843) lt!341215) (= (select (arr!20246 a!3186) (index!33741 lt!341215)) (select (arr!20246 a!3186) j!159)) (ite ((_ is MissingZero!7843) lt!341215) (= (select (arr!20246 a!3186) (index!33740 lt!341215)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7843) lt!341215) (= (select (arr!20246 a!3186) (index!33743 lt!341215)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101159 (= lt!341215 e!427255)))

(declare-fun c!84461 () Bool)

(assert (=> d!101159 (= c!84461 (and ((_ is Intermediate!7843) lt!341214) (undefined!8655 lt!341214)))))

(assert (=> d!101159 (= lt!341214 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20246 a!3186) j!159) mask!3328) (select (arr!20246 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!101159 (validMask!0 mask!3328)))

(assert (=> d!101159 (= (seekEntryOrOpen!0 (select (arr!20246 a!3186) j!159) a!3186 mask!3328) lt!341215)))

(declare-fun b!767313 () Bool)

(declare-fun c!84462 () Bool)

(assert (=> b!767313 (= c!84462 (= lt!341216 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767313 (= e!427254 e!427256)))

(declare-fun b!767314 () Bool)

(assert (=> b!767314 (= e!427256 (seekKeyOrZeroReturnVacant!0 (x!64664 lt!341214) (index!33742 lt!341214) (index!33742 lt!341214) (select (arr!20246 a!3186) j!159) a!3186 mask!3328))))

(assert (= (and d!101159 c!84461) b!767310))

(assert (= (and d!101159 (not c!84461)) b!767309))

(assert (= (and b!767309 c!84460) b!767312))

(assert (= (and b!767309 (not c!84460)) b!767313))

(assert (= (and b!767313 c!84462) b!767311))

(assert (= (and b!767313 (not c!84462)) b!767314))

(declare-fun m!712569 () Bool)

(assert (=> b!767309 m!712569))

(assert (=> d!101159 m!712423))

(declare-fun m!712571 () Bool)

(assert (=> d!101159 m!712571))

(declare-fun m!712573 () Bool)

(assert (=> d!101159 m!712573))

(assert (=> d!101159 m!712431))

(assert (=> d!101159 m!712427))

(assert (=> d!101159 m!712433))

(declare-fun m!712575 () Bool)

(assert (=> d!101159 m!712575))

(assert (=> d!101159 m!712427))

(assert (=> d!101159 m!712431))

(assert (=> b!767314 m!712427))

(declare-fun m!712577 () Bool)

(assert (=> b!767314 m!712577))

(assert (=> b!767158 d!101159))

(assert (=> b!767147 d!101157))

(declare-fun bm!35038 () Bool)

(declare-fun call!35041 () Bool)

(assert (=> bm!35038 (= call!35041 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!767335 () Bool)

(declare-fun e!427269 () Bool)

(declare-fun e!427270 () Bool)

(assert (=> b!767335 (= e!427269 e!427270)))

(declare-fun c!84471 () Bool)

(assert (=> b!767335 (= c!84471 (validKeyInArray!0 (select (arr!20246 a!3186) j!159)))))

(declare-fun b!767336 () Bool)

(declare-fun e!427271 () Bool)

(assert (=> b!767336 (= e!427271 call!35041)))

(declare-fun d!101165 () Bool)

(declare-fun res!519176 () Bool)

(assert (=> d!101165 (=> res!519176 e!427269)))

(assert (=> d!101165 (= res!519176 (bvsge j!159 (size!20667 a!3186)))))

(assert (=> d!101165 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!427269)))

(declare-fun b!767337 () Bool)

(assert (=> b!767337 (= e!427270 call!35041)))

(declare-fun b!767338 () Bool)

(assert (=> b!767338 (= e!427270 e!427271)))

(declare-fun lt!341228 () (_ BitVec 64))

(assert (=> b!767338 (= lt!341228 (select (arr!20246 a!3186) j!159))))

(declare-fun lt!341227 () Unit!26384)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42285 (_ BitVec 64) (_ BitVec 32)) Unit!26384)

(assert (=> b!767338 (= lt!341227 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341228 j!159))))

(assert (=> b!767338 (arrayContainsKey!0 a!3186 lt!341228 #b00000000000000000000000000000000)))

(declare-fun lt!341229 () Unit!26384)

(assert (=> b!767338 (= lt!341229 lt!341227)))

(declare-fun res!519175 () Bool)

(assert (=> b!767338 (= res!519175 (= (seekEntryOrOpen!0 (select (arr!20246 a!3186) j!159) a!3186 mask!3328) (Found!7843 j!159)))))

(assert (=> b!767338 (=> (not res!519175) (not e!427271))))

(assert (= (and d!101165 (not res!519176)) b!767335))

(assert (= (and b!767335 c!84471) b!767338))

(assert (= (and b!767335 (not c!84471)) b!767337))

(assert (= (and b!767338 res!519175) b!767336))

(assert (= (or b!767336 b!767337) bm!35038))

(declare-fun m!712579 () Bool)

(assert (=> bm!35038 m!712579))

(assert (=> b!767335 m!712427))

(assert (=> b!767335 m!712427))

(assert (=> b!767335 m!712457))

(assert (=> b!767338 m!712427))

(declare-fun m!712581 () Bool)

(assert (=> b!767338 m!712581))

(declare-fun m!712583 () Bool)

(assert (=> b!767338 m!712583))

(assert (=> b!767338 m!712427))

(assert (=> b!767338 m!712455))

(assert (=> b!767141 d!101165))

(declare-fun d!101169 () Bool)

(assert (=> d!101169 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!341234 () Unit!26384)

(declare-fun choose!38 (array!42285 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26384)

(assert (=> d!101169 (= lt!341234 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101169 (validMask!0 mask!3328)))

(assert (=> d!101169 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!341234)))

(declare-fun bs!21491 () Bool)

(assert (= bs!21491 d!101169))

(assert (=> bs!21491 m!712411))

(declare-fun m!712593 () Bool)

(assert (=> bs!21491 m!712593))

(assert (=> bs!21491 m!712423))

(assert (=> b!767141 d!101169))

(declare-fun d!101173 () Bool)

(declare-fun e!427318 () Bool)

(assert (=> d!101173 e!427318))

(declare-fun c!84507 () Bool)

(declare-fun lt!341255 () SeekEntryResult!7843)

(assert (=> d!101173 (= c!84507 (and ((_ is Intermediate!7843) lt!341255) (undefined!8655 lt!341255)))))

(declare-fun e!427319 () SeekEntryResult!7843)

(assert (=> d!101173 (= lt!341255 e!427319)))

(declare-fun c!84505 () Bool)

(assert (=> d!101173 (= c!84505 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!341256 () (_ BitVec 64))

(assert (=> d!101173 (= lt!341256 (select (arr!20246 a!3186) (toIndex!0 (select (arr!20246 a!3186) j!159) mask!3328)))))

(assert (=> d!101173 (validMask!0 mask!3328)))

(assert (=> d!101173 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20246 a!3186) j!159) mask!3328) (select (arr!20246 a!3186) j!159) a!3186 mask!3328) lt!341255)))

(declare-fun b!767423 () Bool)

(assert (=> b!767423 (and (bvsge (index!33742 lt!341255) #b00000000000000000000000000000000) (bvslt (index!33742 lt!341255) (size!20667 a!3186)))))

(declare-fun res!519197 () Bool)

(assert (=> b!767423 (= res!519197 (= (select (arr!20246 a!3186) (index!33742 lt!341255)) (select (arr!20246 a!3186) j!159)))))

(declare-fun e!427321 () Bool)

(assert (=> b!767423 (=> res!519197 e!427321)))

(declare-fun e!427320 () Bool)

(assert (=> b!767423 (= e!427320 e!427321)))

(declare-fun b!767424 () Bool)

(assert (=> b!767424 (= e!427318 (bvsge (x!64664 lt!341255) #b01111111111111111111111111111110))))

(declare-fun e!427317 () SeekEntryResult!7843)

(declare-fun b!767425 () Bool)

(assert (=> b!767425 (= e!427317 (Intermediate!7843 false (toIndex!0 (select (arr!20246 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!767426 () Bool)

(assert (=> b!767426 (= e!427317 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20246 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20246 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767427 () Bool)

(assert (=> b!767427 (= e!427319 (Intermediate!7843 true (toIndex!0 (select (arr!20246 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!767428 () Bool)

(assert (=> b!767428 (and (bvsge (index!33742 lt!341255) #b00000000000000000000000000000000) (bvslt (index!33742 lt!341255) (size!20667 a!3186)))))

(declare-fun res!519196 () Bool)

(assert (=> b!767428 (= res!519196 (= (select (arr!20246 a!3186) (index!33742 lt!341255)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767428 (=> res!519196 e!427321)))

(declare-fun b!767429 () Bool)

(assert (=> b!767429 (= e!427318 e!427320)))

(declare-fun res!519195 () Bool)

(assert (=> b!767429 (= res!519195 (and ((_ is Intermediate!7843) lt!341255) (not (undefined!8655 lt!341255)) (bvslt (x!64664 lt!341255) #b01111111111111111111111111111110) (bvsge (x!64664 lt!341255) #b00000000000000000000000000000000) (bvsge (x!64664 lt!341255) #b00000000000000000000000000000000)))))

(assert (=> b!767429 (=> (not res!519195) (not e!427320))))

(declare-fun b!767430 () Bool)

(assert (=> b!767430 (and (bvsge (index!33742 lt!341255) #b00000000000000000000000000000000) (bvslt (index!33742 lt!341255) (size!20667 a!3186)))))

(assert (=> b!767430 (= e!427321 (= (select (arr!20246 a!3186) (index!33742 lt!341255)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!767431 () Bool)

(assert (=> b!767431 (= e!427319 e!427317)))

(declare-fun c!84506 () Bool)

(assert (=> b!767431 (= c!84506 (or (= lt!341256 (select (arr!20246 a!3186) j!159)) (= (bvadd lt!341256 lt!341256) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!101173 c!84505) b!767427))

(assert (= (and d!101173 (not c!84505)) b!767431))

(assert (= (and b!767431 c!84506) b!767425))

(assert (= (and b!767431 (not c!84506)) b!767426))

(assert (= (and d!101173 c!84507) b!767424))

(assert (= (and d!101173 (not c!84507)) b!767429))

(assert (= (and b!767429 res!519195) b!767423))

(assert (= (and b!767423 (not res!519197)) b!767428))

(assert (= (and b!767428 (not res!519196)) b!767430))

(declare-fun m!712627 () Bool)

(assert (=> b!767430 m!712627))

(assert (=> d!101173 m!712431))

(declare-fun m!712629 () Bool)

(assert (=> d!101173 m!712629))

(assert (=> d!101173 m!712423))

(assert (=> b!767428 m!712627))

(assert (=> b!767423 m!712627))

(assert (=> b!767426 m!712431))

(declare-fun m!712631 () Bool)

(assert (=> b!767426 m!712631))

(assert (=> b!767426 m!712631))

(assert (=> b!767426 m!712427))

(declare-fun m!712633 () Bool)

(assert (=> b!767426 m!712633))

(assert (=> b!767151 d!101173))

(declare-fun d!101187 () Bool)

(declare-fun lt!341268 () (_ BitVec 32))

(declare-fun lt!341267 () (_ BitVec 32))

(assert (=> d!101187 (= lt!341268 (bvmul (bvxor lt!341267 (bvlshr lt!341267 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101187 (= lt!341267 ((_ extract 31 0) (bvand (bvxor (select (arr!20246 a!3186) j!159) (bvlshr (select (arr!20246 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101187 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!519199 (let ((h!15380 ((_ extract 31 0) (bvand (bvxor (select (arr!20246 a!3186) j!159) (bvlshr (select (arr!20246 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64673 (bvmul (bvxor h!15380 (bvlshr h!15380 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64673 (bvlshr x!64673 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!519199 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!519199 #b00000000000000000000000000000000))))))

(assert (=> d!101187 (= (toIndex!0 (select (arr!20246 a!3186) j!159) mask!3328) (bvand (bvxor lt!341268 (bvlshr lt!341268 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!767151 d!101187))

(declare-fun d!101191 () Bool)

(declare-fun e!427323 () Bool)

(assert (=> d!101191 e!427323))

(declare-fun c!84510 () Bool)

(declare-fun lt!341269 () SeekEntryResult!7843)

(assert (=> d!101191 (= c!84510 (and ((_ is Intermediate!7843) lt!341269) (undefined!8655 lt!341269)))))

(declare-fun e!427324 () SeekEntryResult!7843)

(assert (=> d!101191 (= lt!341269 e!427324)))

(declare-fun c!84508 () Bool)

(assert (=> d!101191 (= c!84508 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!341270 () (_ BitVec 64))

(assert (=> d!101191 (= lt!341270 (select (arr!20246 a!3186) index!1321))))

(assert (=> d!101191 (validMask!0 mask!3328)))

(assert (=> d!101191 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20246 a!3186) j!159) a!3186 mask!3328) lt!341269)))

(declare-fun b!767432 () Bool)

(assert (=> b!767432 (and (bvsge (index!33742 lt!341269) #b00000000000000000000000000000000) (bvslt (index!33742 lt!341269) (size!20667 a!3186)))))

(declare-fun res!519202 () Bool)

(assert (=> b!767432 (= res!519202 (= (select (arr!20246 a!3186) (index!33742 lt!341269)) (select (arr!20246 a!3186) j!159)))))

(declare-fun e!427326 () Bool)

(assert (=> b!767432 (=> res!519202 e!427326)))

(declare-fun e!427325 () Bool)

(assert (=> b!767432 (= e!427325 e!427326)))

(declare-fun b!767433 () Bool)

(assert (=> b!767433 (= e!427323 (bvsge (x!64664 lt!341269) #b01111111111111111111111111111110))))

(declare-fun b!767434 () Bool)

(declare-fun e!427322 () SeekEntryResult!7843)

(assert (=> b!767434 (= e!427322 (Intermediate!7843 false index!1321 x!1131))))

(declare-fun b!767435 () Bool)

(assert (=> b!767435 (= e!427322 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20246 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767436 () Bool)

(assert (=> b!767436 (= e!427324 (Intermediate!7843 true index!1321 x!1131))))

(declare-fun b!767437 () Bool)

(assert (=> b!767437 (and (bvsge (index!33742 lt!341269) #b00000000000000000000000000000000) (bvslt (index!33742 lt!341269) (size!20667 a!3186)))))

(declare-fun res!519201 () Bool)

(assert (=> b!767437 (= res!519201 (= (select (arr!20246 a!3186) (index!33742 lt!341269)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767437 (=> res!519201 e!427326)))

(declare-fun b!767438 () Bool)

(assert (=> b!767438 (= e!427323 e!427325)))

(declare-fun res!519200 () Bool)

(assert (=> b!767438 (= res!519200 (and ((_ is Intermediate!7843) lt!341269) (not (undefined!8655 lt!341269)) (bvslt (x!64664 lt!341269) #b01111111111111111111111111111110) (bvsge (x!64664 lt!341269) #b00000000000000000000000000000000) (bvsge (x!64664 lt!341269) x!1131)))))

(assert (=> b!767438 (=> (not res!519200) (not e!427325))))

(declare-fun b!767439 () Bool)

(assert (=> b!767439 (and (bvsge (index!33742 lt!341269) #b00000000000000000000000000000000) (bvslt (index!33742 lt!341269) (size!20667 a!3186)))))

(assert (=> b!767439 (= e!427326 (= (select (arr!20246 a!3186) (index!33742 lt!341269)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!767440 () Bool)

(assert (=> b!767440 (= e!427324 e!427322)))

(declare-fun c!84509 () Bool)

(assert (=> b!767440 (= c!84509 (or (= lt!341270 (select (arr!20246 a!3186) j!159)) (= (bvadd lt!341270 lt!341270) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!101191 c!84508) b!767436))

(assert (= (and d!101191 (not c!84508)) b!767440))

(assert (= (and b!767440 c!84509) b!767434))

(assert (= (and b!767440 (not c!84509)) b!767435))

(assert (= (and d!101191 c!84510) b!767433))

(assert (= (and d!101191 (not c!84510)) b!767438))

(assert (= (and b!767438 res!519200) b!767432))

(assert (= (and b!767432 (not res!519202)) b!767437))

(assert (= (and b!767437 (not res!519201)) b!767439))

(declare-fun m!712635 () Bool)

(assert (=> b!767439 m!712635))

(assert (=> d!101191 m!712567))

(assert (=> d!101191 m!712423))

(assert (=> b!767437 m!712635))

(assert (=> b!767432 m!712635))

(assert (=> b!767435 m!712459))

(assert (=> b!767435 m!712459))

(assert (=> b!767435 m!712427))

(declare-fun m!712637 () Bool)

(assert (=> b!767435 m!712637))

(assert (=> b!767140 d!101191))

(declare-fun d!101193 () Bool)

(assert (=> d!101193 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66558 d!101193))

(declare-fun d!101199 () Bool)

(assert (=> d!101199 (= (array_inv!16129 a!3186) (bvsge (size!20667 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66558 d!101199))

(declare-fun e!427349 () SeekEntryResult!7843)

(declare-fun b!767474 () Bool)

(assert (=> b!767474 (= e!427349 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!341135 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) resIntermediateIndex!5 (select (arr!20246 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767475 () Bool)

(declare-fun e!427350 () SeekEntryResult!7843)

(assert (=> b!767475 (= e!427350 (Found!7843 lt!341135))))

(declare-fun b!767476 () Bool)

(declare-fun e!427348 () SeekEntryResult!7843)

(assert (=> b!767476 (= e!427348 e!427350)))

(declare-fun lt!341278 () (_ BitVec 64))

(declare-fun c!84521 () Bool)

(assert (=> b!767476 (= c!84521 (= lt!341278 (select (arr!20246 a!3186) j!159)))))

(declare-fun b!767477 () Bool)

(assert (=> b!767477 (= e!427348 Undefined!7843)))

(declare-fun lt!341277 () SeekEntryResult!7843)

(declare-fun d!101201 () Bool)

(assert (=> d!101201 (and (or ((_ is Undefined!7843) lt!341277) (not ((_ is Found!7843) lt!341277)) (and (bvsge (index!33741 lt!341277) #b00000000000000000000000000000000) (bvslt (index!33741 lt!341277) (size!20667 a!3186)))) (or ((_ is Undefined!7843) lt!341277) ((_ is Found!7843) lt!341277) (not ((_ is MissingVacant!7843) lt!341277)) (not (= (index!33743 lt!341277) resIntermediateIndex!5)) (and (bvsge (index!33743 lt!341277) #b00000000000000000000000000000000) (bvslt (index!33743 lt!341277) (size!20667 a!3186)))) (or ((_ is Undefined!7843) lt!341277) (ite ((_ is Found!7843) lt!341277) (= (select (arr!20246 a!3186) (index!33741 lt!341277)) (select (arr!20246 a!3186) j!159)) (and ((_ is MissingVacant!7843) lt!341277) (= (index!33743 lt!341277) resIntermediateIndex!5) (= (select (arr!20246 a!3186) (index!33743 lt!341277)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101201 (= lt!341277 e!427348)))

(declare-fun c!84520 () Bool)

(assert (=> d!101201 (= c!84520 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!101201 (= lt!341278 (select (arr!20246 a!3186) lt!341135))))

(assert (=> d!101201 (validMask!0 mask!3328)))

(assert (=> d!101201 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341135 resIntermediateIndex!5 (select (arr!20246 a!3186) j!159) a!3186 mask!3328) lt!341277)))

(declare-fun b!767478 () Bool)

(assert (=> b!767478 (= e!427349 (MissingVacant!7843 resIntermediateIndex!5))))

(declare-fun b!767479 () Bool)

(declare-fun c!84522 () Bool)

(assert (=> b!767479 (= c!84522 (= lt!341278 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767479 (= e!427350 e!427349)))

(assert (= (and d!101201 c!84520) b!767477))

(assert (= (and d!101201 (not c!84520)) b!767476))

(assert (= (and b!767476 c!84521) b!767475))

(assert (= (and b!767476 (not c!84521)) b!767479))

(assert (= (and b!767479 c!84522) b!767478))

(assert (= (and b!767479 (not c!84522)) b!767474))

(declare-fun m!712647 () Bool)

(assert (=> b!767474 m!712647))

(assert (=> b!767474 m!712647))

(assert (=> b!767474 m!712427))

(declare-fun m!712649 () Bool)

(assert (=> b!767474 m!712649))

(declare-fun m!712651 () Bool)

(assert (=> d!101201 m!712651))

(declare-fun m!712653 () Bool)

(assert (=> d!101201 m!712653))

(declare-fun m!712655 () Bool)

(assert (=> d!101201 m!712655))

(assert (=> d!101201 m!712423))

(assert (=> b!767150 d!101201))

(declare-fun d!101203 () Bool)

(declare-fun lt!341281 () (_ BitVec 32))

(assert (=> d!101203 (and (bvsge lt!341281 #b00000000000000000000000000000000) (bvslt lt!341281 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101203 (= lt!341281 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!101203 (validMask!0 mask!3328)))

(assert (=> d!101203 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!341281)))

(declare-fun bs!21492 () Bool)

(assert (= bs!21492 d!101203))

(declare-fun m!712657 () Bool)

(assert (=> bs!21492 m!712657))

(assert (=> bs!21492 m!712423))

(assert (=> b!767139 d!101203))

(declare-fun bm!35039 () Bool)

(declare-fun call!35042 () Bool)

(assert (=> bm!35039 (= call!35042 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!767480 () Bool)

(declare-fun e!427351 () Bool)

(declare-fun e!427352 () Bool)

(assert (=> b!767480 (= e!427351 e!427352)))

(declare-fun c!84523 () Bool)

(assert (=> b!767480 (= c!84523 (validKeyInArray!0 (select (arr!20246 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!767481 () Bool)

(declare-fun e!427353 () Bool)

(assert (=> b!767481 (= e!427353 call!35042)))

(declare-fun d!101205 () Bool)

(declare-fun res!519219 () Bool)

(assert (=> d!101205 (=> res!519219 e!427351)))

(assert (=> d!101205 (= res!519219 (bvsge #b00000000000000000000000000000000 (size!20667 a!3186)))))

(assert (=> d!101205 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!427351)))

(declare-fun b!767482 () Bool)

(assert (=> b!767482 (= e!427352 call!35042)))

(declare-fun b!767483 () Bool)

(assert (=> b!767483 (= e!427352 e!427353)))

(declare-fun lt!341283 () (_ BitVec 64))

(assert (=> b!767483 (= lt!341283 (select (arr!20246 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!341282 () Unit!26384)

(assert (=> b!767483 (= lt!341282 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!341283 #b00000000000000000000000000000000))))

(assert (=> b!767483 (arrayContainsKey!0 a!3186 lt!341283 #b00000000000000000000000000000000)))

(declare-fun lt!341284 () Unit!26384)

(assert (=> b!767483 (= lt!341284 lt!341282)))

(declare-fun res!519218 () Bool)

(assert (=> b!767483 (= res!519218 (= (seekEntryOrOpen!0 (select (arr!20246 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7843 #b00000000000000000000000000000000)))))

(assert (=> b!767483 (=> (not res!519218) (not e!427353))))

(assert (= (and d!101205 (not res!519219)) b!767480))

(assert (= (and b!767480 c!84523) b!767483))

(assert (= (and b!767480 (not c!84523)) b!767482))

(assert (= (and b!767483 res!519218) b!767481))

(assert (= (or b!767481 b!767482) bm!35039))

(declare-fun m!712659 () Bool)

(assert (=> bm!35039 m!712659))

(declare-fun m!712661 () Bool)

(assert (=> b!767480 m!712661))

(assert (=> b!767480 m!712661))

(declare-fun m!712663 () Bool)

(assert (=> b!767480 m!712663))

(assert (=> b!767483 m!712661))

(declare-fun m!712665 () Bool)

(assert (=> b!767483 m!712665))

(declare-fun m!712667 () Bool)

(assert (=> b!767483 m!712667))

(assert (=> b!767483 m!712661))

(declare-fun m!712669 () Bool)

(assert (=> b!767483 m!712669))

(assert (=> b!767154 d!101205))

(declare-fun b!767484 () Bool)

(declare-fun e!427355 () SeekEntryResult!7843)

(declare-fun e!427354 () SeekEntryResult!7843)

(assert (=> b!767484 (= e!427355 e!427354)))

(declare-fun lt!341287 () (_ BitVec 64))

(declare-fun lt!341285 () SeekEntryResult!7843)

(assert (=> b!767484 (= lt!341287 (select (arr!20246 a!3186) (index!33742 lt!341285)))))

(declare-fun c!84524 () Bool)

(assert (=> b!767484 (= c!84524 (= lt!341287 k0!2102))))

(declare-fun b!767485 () Bool)

(assert (=> b!767485 (= e!427355 Undefined!7843)))

(declare-fun b!767486 () Bool)

(declare-fun e!427356 () SeekEntryResult!7843)

(assert (=> b!767486 (= e!427356 (MissingZero!7843 (index!33742 lt!341285)))))

(declare-fun b!767487 () Bool)

(assert (=> b!767487 (= e!427354 (Found!7843 (index!33742 lt!341285)))))

(declare-fun d!101207 () Bool)

(declare-fun lt!341286 () SeekEntryResult!7843)

(assert (=> d!101207 (and (or ((_ is Undefined!7843) lt!341286) (not ((_ is Found!7843) lt!341286)) (and (bvsge (index!33741 lt!341286) #b00000000000000000000000000000000) (bvslt (index!33741 lt!341286) (size!20667 a!3186)))) (or ((_ is Undefined!7843) lt!341286) ((_ is Found!7843) lt!341286) (not ((_ is MissingZero!7843) lt!341286)) (and (bvsge (index!33740 lt!341286) #b00000000000000000000000000000000) (bvslt (index!33740 lt!341286) (size!20667 a!3186)))) (or ((_ is Undefined!7843) lt!341286) ((_ is Found!7843) lt!341286) ((_ is MissingZero!7843) lt!341286) (not ((_ is MissingVacant!7843) lt!341286)) (and (bvsge (index!33743 lt!341286) #b00000000000000000000000000000000) (bvslt (index!33743 lt!341286) (size!20667 a!3186)))) (or ((_ is Undefined!7843) lt!341286) (ite ((_ is Found!7843) lt!341286) (= (select (arr!20246 a!3186) (index!33741 lt!341286)) k0!2102) (ite ((_ is MissingZero!7843) lt!341286) (= (select (arr!20246 a!3186) (index!33740 lt!341286)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7843) lt!341286) (= (select (arr!20246 a!3186) (index!33743 lt!341286)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101207 (= lt!341286 e!427355)))

(declare-fun c!84525 () Bool)

(assert (=> d!101207 (= c!84525 (and ((_ is Intermediate!7843) lt!341285) (undefined!8655 lt!341285)))))

(assert (=> d!101207 (= lt!341285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!101207 (validMask!0 mask!3328)))

(assert (=> d!101207 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!341286)))

(declare-fun b!767488 () Bool)

(declare-fun c!84526 () Bool)

(assert (=> b!767488 (= c!84526 (= lt!341287 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767488 (= e!427354 e!427356)))

(declare-fun b!767489 () Bool)

(assert (=> b!767489 (= e!427356 (seekKeyOrZeroReturnVacant!0 (x!64664 lt!341285) (index!33742 lt!341285) (index!33742 lt!341285) k0!2102 a!3186 mask!3328))))

(assert (= (and d!101207 c!84525) b!767485))

(assert (= (and d!101207 (not c!84525)) b!767484))

(assert (= (and b!767484 c!84524) b!767487))

(assert (= (and b!767484 (not c!84524)) b!767488))

(assert (= (and b!767488 c!84526) b!767486))

(assert (= (and b!767488 (not c!84526)) b!767489))

(declare-fun m!712671 () Bool)

(assert (=> b!767484 m!712671))

(assert (=> d!101207 m!712423))

(declare-fun m!712673 () Bool)

(assert (=> d!101207 m!712673))

(declare-fun m!712675 () Bool)

(assert (=> d!101207 m!712675))

(declare-fun m!712677 () Bool)

(assert (=> d!101207 m!712677))

(declare-fun m!712679 () Bool)

(assert (=> d!101207 m!712679))

(declare-fun m!712681 () Bool)

(assert (=> d!101207 m!712681))

(assert (=> d!101207 m!712677))

(declare-fun m!712683 () Bool)

(assert (=> b!767489 m!712683))

(assert (=> b!767143 d!101207))

(declare-fun d!101209 () Bool)

(assert (=> d!101209 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!767142 d!101209))

(declare-fun b!767490 () Bool)

(declare-fun e!427358 () SeekEntryResult!7843)

(assert (=> b!767490 (= e!427358 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20246 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!767491 () Bool)

(declare-fun e!427359 () SeekEntryResult!7843)

(assert (=> b!767491 (= e!427359 (Found!7843 resIntermediateIndex!5))))

(declare-fun b!767492 () Bool)

(declare-fun e!427357 () SeekEntryResult!7843)

(assert (=> b!767492 (= e!427357 e!427359)))

(declare-fun lt!341289 () (_ BitVec 64))

(declare-fun c!84528 () Bool)

(assert (=> b!767492 (= c!84528 (= lt!341289 (select (arr!20246 a!3186) j!159)))))

(declare-fun b!767493 () Bool)

(assert (=> b!767493 (= e!427357 Undefined!7843)))

(declare-fun lt!341288 () SeekEntryResult!7843)

(declare-fun d!101211 () Bool)

(assert (=> d!101211 (and (or ((_ is Undefined!7843) lt!341288) (not ((_ is Found!7843) lt!341288)) (and (bvsge (index!33741 lt!341288) #b00000000000000000000000000000000) (bvslt (index!33741 lt!341288) (size!20667 a!3186)))) (or ((_ is Undefined!7843) lt!341288) ((_ is Found!7843) lt!341288) (not ((_ is MissingVacant!7843) lt!341288)) (not (= (index!33743 lt!341288) resIntermediateIndex!5)) (and (bvsge (index!33743 lt!341288) #b00000000000000000000000000000000) (bvslt (index!33743 lt!341288) (size!20667 a!3186)))) (or ((_ is Undefined!7843) lt!341288) (ite ((_ is Found!7843) lt!341288) (= (select (arr!20246 a!3186) (index!33741 lt!341288)) (select (arr!20246 a!3186) j!159)) (and ((_ is MissingVacant!7843) lt!341288) (= (index!33743 lt!341288) resIntermediateIndex!5) (= (select (arr!20246 a!3186) (index!33743 lt!341288)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!101211 (= lt!341288 e!427357)))

(declare-fun c!84527 () Bool)

(assert (=> d!101211 (= c!84527 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!101211 (= lt!341289 (select (arr!20246 a!3186) resIntermediateIndex!5))))

(assert (=> d!101211 (validMask!0 mask!3328)))

(assert (=> d!101211 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20246 a!3186) j!159) a!3186 mask!3328) lt!341288)))

(declare-fun b!767494 () Bool)

(assert (=> b!767494 (= e!427358 (MissingVacant!7843 resIntermediateIndex!5))))

(declare-fun b!767495 () Bool)

(declare-fun c!84529 () Bool)

(assert (=> b!767495 (= c!84529 (= lt!341289 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767495 (= e!427359 e!427358)))

(assert (= (and d!101211 c!84527) b!767493))

(assert (= (and d!101211 (not c!84527)) b!767492))

(assert (= (and b!767492 c!84528) b!767491))

(assert (= (and b!767492 (not c!84528)) b!767495))

(assert (= (and b!767495 c!84529) b!767494))

(assert (= (and b!767495 (not c!84529)) b!767490))

(declare-fun m!712685 () Bool)

(assert (=> b!767490 m!712685))

(assert (=> b!767490 m!712685))

(assert (=> b!767490 m!712427))

(declare-fun m!712687 () Bool)

(assert (=> b!767490 m!712687))

(declare-fun m!712689 () Bool)

(assert (=> d!101211 m!712689))

(declare-fun m!712691 () Bool)

(assert (=> d!101211 m!712691))

(assert (=> d!101211 m!712421))

(assert (=> d!101211 m!712423))

(assert (=> b!767157 d!101211))

(declare-fun d!101213 () Bool)

(declare-fun e!427365 () Bool)

(assert (=> d!101213 e!427365))

(declare-fun c!84536 () Bool)

(declare-fun lt!341296 () SeekEntryResult!7843)

(assert (=> d!101213 (= c!84536 (and ((_ is Intermediate!7843) lt!341296) (undefined!8655 lt!341296)))))

(declare-fun e!427366 () SeekEntryResult!7843)

(assert (=> d!101213 (= lt!341296 e!427366)))

(declare-fun c!84534 () Bool)

(assert (=> d!101213 (= c!84534 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!341297 () (_ BitVec 64))

(assert (=> d!101213 (= lt!341297 (select (arr!20246 lt!341139) index!1321))))

(assert (=> d!101213 (validMask!0 mask!3328)))

(assert (=> d!101213 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341133 lt!341139 mask!3328) lt!341296)))

(declare-fun b!767504 () Bool)

(assert (=> b!767504 (and (bvsge (index!33742 lt!341296) #b00000000000000000000000000000000) (bvslt (index!33742 lt!341296) (size!20667 lt!341139)))))

(declare-fun res!519222 () Bool)

(assert (=> b!767504 (= res!519222 (= (select (arr!20246 lt!341139) (index!33742 lt!341296)) lt!341133))))

(declare-fun e!427368 () Bool)

(assert (=> b!767504 (=> res!519222 e!427368)))

(declare-fun e!427367 () Bool)

(assert (=> b!767504 (= e!427367 e!427368)))

(declare-fun b!767505 () Bool)

(assert (=> b!767505 (= e!427365 (bvsge (x!64664 lt!341296) #b01111111111111111111111111111110))))

(declare-fun b!767506 () Bool)

(declare-fun e!427364 () SeekEntryResult!7843)

(assert (=> b!767506 (= e!427364 (Intermediate!7843 false index!1321 x!1131))))

(declare-fun b!767507 () Bool)

(assert (=> b!767507 (= e!427364 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!341133 lt!341139 mask!3328))))

(declare-fun b!767508 () Bool)

(assert (=> b!767508 (= e!427366 (Intermediate!7843 true index!1321 x!1131))))

(declare-fun b!767509 () Bool)

(assert (=> b!767509 (and (bvsge (index!33742 lt!341296) #b00000000000000000000000000000000) (bvslt (index!33742 lt!341296) (size!20667 lt!341139)))))

(declare-fun res!519221 () Bool)

(assert (=> b!767509 (= res!519221 (= (select (arr!20246 lt!341139) (index!33742 lt!341296)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767509 (=> res!519221 e!427368)))

(declare-fun b!767510 () Bool)

(assert (=> b!767510 (= e!427365 e!427367)))

(declare-fun res!519220 () Bool)

(assert (=> b!767510 (= res!519220 (and ((_ is Intermediate!7843) lt!341296) (not (undefined!8655 lt!341296)) (bvslt (x!64664 lt!341296) #b01111111111111111111111111111110) (bvsge (x!64664 lt!341296) #b00000000000000000000000000000000) (bvsge (x!64664 lt!341296) x!1131)))))

(assert (=> b!767510 (=> (not res!519220) (not e!427367))))

(declare-fun b!767511 () Bool)

(assert (=> b!767511 (and (bvsge (index!33742 lt!341296) #b00000000000000000000000000000000) (bvslt (index!33742 lt!341296) (size!20667 lt!341139)))))

(assert (=> b!767511 (= e!427368 (= (select (arr!20246 lt!341139) (index!33742 lt!341296)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!767512 () Bool)

(assert (=> b!767512 (= e!427366 e!427364)))

(declare-fun c!84535 () Bool)

(assert (=> b!767512 (= c!84535 (or (= lt!341297 lt!341133) (= (bvadd lt!341297 lt!341297) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!101213 c!84534) b!767508))

(assert (= (and d!101213 (not c!84534)) b!767512))

(assert (= (and b!767512 c!84535) b!767506))

(assert (= (and b!767512 (not c!84535)) b!767507))

(assert (= (and d!101213 c!84536) b!767505))

(assert (= (and d!101213 (not c!84536)) b!767510))

(assert (= (and b!767510 res!519220) b!767504))

(assert (= (and b!767504 (not res!519222)) b!767509))

(assert (= (and b!767509 (not res!519221)) b!767511))

(declare-fun m!712693 () Bool)

(assert (=> b!767511 m!712693))

(declare-fun m!712695 () Bool)

(assert (=> d!101213 m!712695))

(assert (=> d!101213 m!712423))

(assert (=> b!767509 m!712693))

(assert (=> b!767504 m!712693))

(assert (=> b!767507 m!712459))

(assert (=> b!767507 m!712459))

(declare-fun m!712697 () Bool)

(assert (=> b!767507 m!712697))

(assert (=> b!767146 d!101213))

(declare-fun d!101215 () Bool)

(declare-fun e!427372 () Bool)

(assert (=> d!101215 e!427372))

(declare-fun c!84541 () Bool)

(declare-fun lt!341298 () SeekEntryResult!7843)

(assert (=> d!101215 (= c!84541 (and ((_ is Intermediate!7843) lt!341298) (undefined!8655 lt!341298)))))

(declare-fun e!427373 () SeekEntryResult!7843)

(assert (=> d!101215 (= lt!341298 e!427373)))

(declare-fun c!84539 () Bool)

(assert (=> d!101215 (= c!84539 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!341299 () (_ BitVec 64))

(assert (=> d!101215 (= lt!341299 (select (arr!20246 lt!341139) (toIndex!0 lt!341133 mask!3328)))))

(assert (=> d!101215 (validMask!0 mask!3328)))

(assert (=> d!101215 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341133 mask!3328) lt!341133 lt!341139 mask!3328) lt!341298)))

(declare-fun b!767517 () Bool)

(assert (=> b!767517 (and (bvsge (index!33742 lt!341298) #b00000000000000000000000000000000) (bvslt (index!33742 lt!341298) (size!20667 lt!341139)))))

(declare-fun res!519225 () Bool)

(assert (=> b!767517 (= res!519225 (= (select (arr!20246 lt!341139) (index!33742 lt!341298)) lt!341133))))

(declare-fun e!427375 () Bool)

(assert (=> b!767517 (=> res!519225 e!427375)))

(declare-fun e!427374 () Bool)

(assert (=> b!767517 (= e!427374 e!427375)))

(declare-fun b!767518 () Bool)

(assert (=> b!767518 (= e!427372 (bvsge (x!64664 lt!341298) #b01111111111111111111111111111110))))

(declare-fun b!767519 () Bool)

(declare-fun e!427371 () SeekEntryResult!7843)

(assert (=> b!767519 (= e!427371 (Intermediate!7843 false (toIndex!0 lt!341133 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!767520 () Bool)

(assert (=> b!767520 (= e!427371 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!341133 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!341133 lt!341139 mask!3328))))

(declare-fun b!767521 () Bool)

(assert (=> b!767521 (= e!427373 (Intermediate!7843 true (toIndex!0 lt!341133 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!767522 () Bool)

(assert (=> b!767522 (and (bvsge (index!33742 lt!341298) #b00000000000000000000000000000000) (bvslt (index!33742 lt!341298) (size!20667 lt!341139)))))

(declare-fun res!519224 () Bool)

(assert (=> b!767522 (= res!519224 (= (select (arr!20246 lt!341139) (index!33742 lt!341298)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!767522 (=> res!519224 e!427375)))

(declare-fun b!767523 () Bool)

(assert (=> b!767523 (= e!427372 e!427374)))

(declare-fun res!519223 () Bool)

(assert (=> b!767523 (= res!519223 (and ((_ is Intermediate!7843) lt!341298) (not (undefined!8655 lt!341298)) (bvslt (x!64664 lt!341298) #b01111111111111111111111111111110) (bvsge (x!64664 lt!341298) #b00000000000000000000000000000000) (bvsge (x!64664 lt!341298) #b00000000000000000000000000000000)))))

(assert (=> b!767523 (=> (not res!519223) (not e!427374))))

(declare-fun b!767524 () Bool)

(assert (=> b!767524 (and (bvsge (index!33742 lt!341298) #b00000000000000000000000000000000) (bvslt (index!33742 lt!341298) (size!20667 lt!341139)))))

(assert (=> b!767524 (= e!427375 (= (select (arr!20246 lt!341139) (index!33742 lt!341298)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!767525 () Bool)

(assert (=> b!767525 (= e!427373 e!427371)))

(declare-fun c!84540 () Bool)

(assert (=> b!767525 (= c!84540 (or (= lt!341299 lt!341133) (= (bvadd lt!341299 lt!341299) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!101215 c!84539) b!767521))

(assert (= (and d!101215 (not c!84539)) b!767525))

(assert (= (and b!767525 c!84540) b!767519))

(assert (= (and b!767525 (not c!84540)) b!767520))

(assert (= (and d!101215 c!84541) b!767518))

(assert (= (and d!101215 (not c!84541)) b!767523))

(assert (= (and b!767523 res!519223) b!767517))

(assert (= (and b!767517 (not res!519225)) b!767522))

(assert (= (and b!767522 (not res!519224)) b!767524))

(declare-fun m!712699 () Bool)

(assert (=> b!767524 m!712699))

(assert (=> d!101215 m!712437))

(declare-fun m!712701 () Bool)

(assert (=> d!101215 m!712701))

(assert (=> d!101215 m!712423))

(assert (=> b!767522 m!712699))

(assert (=> b!767517 m!712699))

(assert (=> b!767520 m!712437))

(declare-fun m!712703 () Bool)

(assert (=> b!767520 m!712703))

(assert (=> b!767520 m!712703))

(declare-fun m!712705 () Bool)

(assert (=> b!767520 m!712705))

(assert (=> b!767146 d!101215))

(declare-fun d!101217 () Bool)

(declare-fun lt!341301 () (_ BitVec 32))

(declare-fun lt!341300 () (_ BitVec 32))

(assert (=> d!101217 (= lt!341301 (bvmul (bvxor lt!341300 (bvlshr lt!341300 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101217 (= lt!341300 ((_ extract 31 0) (bvand (bvxor lt!341133 (bvlshr lt!341133 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101217 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!519199 (let ((h!15380 ((_ extract 31 0) (bvand (bvxor lt!341133 (bvlshr lt!341133 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64673 (bvmul (bvxor h!15380 (bvlshr h!15380 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64673 (bvlshr x!64673 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!519199 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!519199 #b00000000000000000000000000000000))))))

(assert (=> d!101217 (= (toIndex!0 lt!341133 mask!3328) (bvand (bvxor lt!341301 (bvlshr lt!341301 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!767146 d!101217))

(declare-fun bm!35042 () Bool)

(declare-fun call!35045 () Bool)

(declare-fun c!84565 () Bool)

(assert (=> bm!35042 (= call!35045 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!84565 (Cons!14283 (select (arr!20246 a!3186) #b00000000000000000000000000000000) Nil!14284) Nil!14284)))))

(declare-fun b!767582 () Bool)

(declare-fun e!427410 () Bool)

(assert (=> b!767582 (= e!427410 call!35045)))

(declare-fun b!767583 () Bool)

(declare-fun e!427409 () Bool)

(assert (=> b!767583 (= e!427409 e!427410)))

(assert (=> b!767583 (= c!84565 (validKeyInArray!0 (select (arr!20246 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!767581 () Bool)

(declare-fun e!427407 () Bool)

(declare-fun contains!4064 (List!14287 (_ BitVec 64)) Bool)

(assert (=> b!767581 (= e!427407 (contains!4064 Nil!14284 (select (arr!20246 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!101219 () Bool)

(declare-fun res!519236 () Bool)

(declare-fun e!427408 () Bool)

(assert (=> d!101219 (=> res!519236 e!427408)))

(assert (=> d!101219 (= res!519236 (bvsge #b00000000000000000000000000000000 (size!20667 a!3186)))))

(assert (=> d!101219 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14284) e!427408)))

(declare-fun b!767584 () Bool)

(assert (=> b!767584 (= e!427410 call!35045)))

(declare-fun b!767585 () Bool)

(assert (=> b!767585 (= e!427408 e!427409)))

(declare-fun res!519237 () Bool)

(assert (=> b!767585 (=> (not res!519237) (not e!427409))))

(assert (=> b!767585 (= res!519237 (not e!427407))))

(declare-fun res!519235 () Bool)

(assert (=> b!767585 (=> (not res!519235) (not e!427407))))

(assert (=> b!767585 (= res!519235 (validKeyInArray!0 (select (arr!20246 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!101219 (not res!519236)) b!767585))

(assert (= (and b!767585 res!519235) b!767581))

(assert (= (and b!767585 res!519237) b!767583))

(assert (= (and b!767583 c!84565) b!767582))

(assert (= (and b!767583 (not c!84565)) b!767584))

(assert (= (or b!767582 b!767584) bm!35042))

(assert (=> bm!35042 m!712661))

(declare-fun m!712749 () Bool)

(assert (=> bm!35042 m!712749))

(assert (=> b!767583 m!712661))

(assert (=> b!767583 m!712661))

(assert (=> b!767583 m!712663))

(assert (=> b!767581 m!712661))

(assert (=> b!767581 m!712661))

(declare-fun m!712753 () Bool)

(assert (=> b!767581 m!712753))

(assert (=> b!767585 m!712661))

(assert (=> b!767585 m!712661))

(assert (=> b!767585 m!712663))

(assert (=> b!767156 d!101219))

(declare-fun d!101229 () Bool)

(declare-fun res!519242 () Bool)

(declare-fun e!427418 () Bool)

(assert (=> d!101229 (=> res!519242 e!427418)))

(assert (=> d!101229 (= res!519242 (= (select (arr!20246 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!101229 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!427418)))

(declare-fun b!767596 () Bool)

(declare-fun e!427419 () Bool)

(assert (=> b!767596 (= e!427418 e!427419)))

(declare-fun res!519243 () Bool)

(assert (=> b!767596 (=> (not res!519243) (not e!427419))))

(assert (=> b!767596 (= res!519243 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20667 a!3186)))))

(declare-fun b!767597 () Bool)

(assert (=> b!767597 (= e!427419 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101229 (not res!519242)) b!767596))

(assert (= (and b!767596 res!519243) b!767597))

(assert (=> d!101229 m!712661))

(declare-fun m!712765 () Bool)

(assert (=> b!767597 m!712765))

(assert (=> b!767155 d!101229))

(check-sat (not b!767489) (not b!767426) (not b!767335) (not b!767490) (not b!767507) (not d!101215) (not b!767435) (not d!101191) (not d!101201) (not d!101207) (not bm!35042) (not b!767338) (not b!767581) (not d!101173) (not b!767483) (not d!101211) (not d!101159) (not b!767585) (not b!767597) (not d!101203) (not d!101213) (not bm!35038) (not b!767583) (not bm!35039) (not d!101157) (not d!101169) (not b!767520) (not b!767314) (not b!767474) (not b!767480) (not b!767291))
(check-sat)
