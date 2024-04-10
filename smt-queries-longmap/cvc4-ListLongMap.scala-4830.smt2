; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66390 () Bool)

(assert start!66390)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42232 0))(
  ( (array!42233 (arr!20222 (Array (_ BitVec 32) (_ BitVec 64))) (size!20643 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42232)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!765185 () Bool)

(declare-fun e!426139 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7822 0))(
  ( (MissingZero!7822 (index!33656 (_ BitVec 32))) (Found!7822 (index!33657 (_ BitVec 32))) (Intermediate!7822 (undefined!8634 Bool) (index!33658 (_ BitVec 32)) (x!64555 (_ BitVec 32))) (Undefined!7822) (MissingVacant!7822 (index!33659 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42232 (_ BitVec 32)) SeekEntryResult!7822)

(assert (=> b!765185 (= e!426139 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20222 a!3186) j!159) a!3186 mask!3328) (Found!7822 j!159)))))

(declare-fun e!426140 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!765186 () Bool)

(assert (=> b!765186 (= e!426140 (not (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20222 a!3186) j!159) a!3186 mask!3328) (Found!7822 j!159))))))

(declare-fun e!426143 () Bool)

(assert (=> b!765186 e!426143))

(declare-fun res!517714 () Bool)

(assert (=> b!765186 (=> (not res!517714) (not e!426143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42232 (_ BitVec 32)) Bool)

(assert (=> b!765186 (= res!517714 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26370 0))(
  ( (Unit!26371) )
))
(declare-fun lt!340428 () Unit!26370)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42232 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26370)

(assert (=> b!765186 (= lt!340428 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!517704 () Bool)

(declare-fun e!426138 () Bool)

(assert (=> start!66390 (=> (not res!517704) (not e!426138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66390 (= res!517704 (validMask!0 mask!3328))))

(assert (=> start!66390 e!426138))

(assert (=> start!66390 true))

(declare-fun array_inv!16018 (array!42232) Bool)

(assert (=> start!66390 (array_inv!16018 a!3186)))

(declare-fun b!765187 () Bool)

(declare-fun res!517712 () Bool)

(declare-fun e!426144 () Bool)

(assert (=> b!765187 (=> (not res!517712) (not e!426144))))

(declare-datatypes ((List!14224 0))(
  ( (Nil!14221) (Cons!14220 (h!15307 (_ BitVec 64)) (t!20539 List!14224)) )
))
(declare-fun arrayNoDuplicates!0 (array!42232 (_ BitVec 32) List!14224) Bool)

(assert (=> b!765187 (= res!517712 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14221))))

(declare-fun b!765188 () Bool)

(declare-fun e!426142 () Bool)

(assert (=> b!765188 (= e!426142 e!426140)))

(declare-fun res!517709 () Bool)

(assert (=> b!765188 (=> (not res!517709) (not e!426140))))

(declare-fun lt!340426 () array!42232)

(declare-fun lt!340430 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42232 (_ BitVec 32)) SeekEntryResult!7822)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!765188 (= res!517709 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340430 mask!3328) lt!340430 lt!340426 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340430 lt!340426 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!765188 (= lt!340430 (select (store (arr!20222 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!765188 (= lt!340426 (array!42233 (store (arr!20222 a!3186) i!1173 k!2102) (size!20643 a!3186)))))

(declare-fun b!765189 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42232 (_ BitVec 32)) SeekEntryResult!7822)

(assert (=> b!765189 (= e!426143 (= (seekEntryOrOpen!0 (select (arr!20222 a!3186) j!159) a!3186 mask!3328) (Found!7822 j!159)))))

(declare-fun b!765190 () Bool)

(declare-fun res!517708 () Bool)

(assert (=> b!765190 (=> (not res!517708) (not e!426142))))

(assert (=> b!765190 (= res!517708 e!426139)))

(declare-fun c!84130 () Bool)

(assert (=> b!765190 (= c!84130 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!765191 () Bool)

(declare-fun res!517701 () Bool)

(assert (=> b!765191 (=> (not res!517701) (not e!426138))))

(assert (=> b!765191 (= res!517701 (and (= (size!20643 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20643 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20643 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!765192 () Bool)

(declare-fun res!517711 () Bool)

(assert (=> b!765192 (=> (not res!517711) (not e!426142))))

(assert (=> b!765192 (= res!517711 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20222 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765193 () Bool)

(declare-fun res!517707 () Bool)

(assert (=> b!765193 (=> (not res!517707) (not e!426144))))

(assert (=> b!765193 (= res!517707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!765194 () Bool)

(assert (=> b!765194 (= e!426144 e!426142)))

(declare-fun res!517710 () Bool)

(assert (=> b!765194 (=> (not res!517710) (not e!426142))))

(declare-fun lt!340429 () SeekEntryResult!7822)

(assert (=> b!765194 (= res!517710 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20222 a!3186) j!159) mask!3328) (select (arr!20222 a!3186) j!159) a!3186 mask!3328) lt!340429))))

(assert (=> b!765194 (= lt!340429 (Intermediate!7822 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!765195 () Bool)

(declare-fun res!517705 () Bool)

(assert (=> b!765195 (=> (not res!517705) (not e!426138))))

(declare-fun arrayContainsKey!0 (array!42232 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!765195 (= res!517705 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!765196 () Bool)

(assert (=> b!765196 (= e!426138 e!426144)))

(declare-fun res!517706 () Bool)

(assert (=> b!765196 (=> (not res!517706) (not e!426144))))

(declare-fun lt!340427 () SeekEntryResult!7822)

(assert (=> b!765196 (= res!517706 (or (= lt!340427 (MissingZero!7822 i!1173)) (= lt!340427 (MissingVacant!7822 i!1173))))))

(assert (=> b!765196 (= lt!340427 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!765197 () Bool)

(declare-fun res!517713 () Bool)

(assert (=> b!765197 (=> (not res!517713) (not e!426138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!765197 (= res!517713 (validKeyInArray!0 (select (arr!20222 a!3186) j!159)))))

(declare-fun b!765198 () Bool)

(declare-fun res!517703 () Bool)

(assert (=> b!765198 (=> (not res!517703) (not e!426138))))

(assert (=> b!765198 (= res!517703 (validKeyInArray!0 k!2102))))

(declare-fun b!765199 () Bool)

(assert (=> b!765199 (= e!426139 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20222 a!3186) j!159) a!3186 mask!3328) lt!340429))))

(declare-fun b!765200 () Bool)

(declare-fun res!517702 () Bool)

(assert (=> b!765200 (=> (not res!517702) (not e!426144))))

(assert (=> b!765200 (= res!517702 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20643 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20643 a!3186))))))

(assert (= (and start!66390 res!517704) b!765191))

(assert (= (and b!765191 res!517701) b!765197))

(assert (= (and b!765197 res!517713) b!765198))

(assert (= (and b!765198 res!517703) b!765195))

(assert (= (and b!765195 res!517705) b!765196))

(assert (= (and b!765196 res!517706) b!765193))

(assert (= (and b!765193 res!517707) b!765187))

(assert (= (and b!765187 res!517712) b!765200))

(assert (= (and b!765200 res!517702) b!765194))

(assert (= (and b!765194 res!517710) b!765192))

(assert (= (and b!765192 res!517711) b!765190))

(assert (= (and b!765190 c!84130) b!765199))

(assert (= (and b!765190 (not c!84130)) b!765185))

(assert (= (and b!765190 res!517708) b!765188))

(assert (= (and b!765188 res!517709) b!765186))

(assert (= (and b!765186 res!517714) b!765189))

(declare-fun m!711395 () Bool)

(assert (=> start!66390 m!711395))

(declare-fun m!711397 () Bool)

(assert (=> start!66390 m!711397))

(declare-fun m!711399 () Bool)

(assert (=> b!765199 m!711399))

(assert (=> b!765199 m!711399))

(declare-fun m!711401 () Bool)

(assert (=> b!765199 m!711401))

(assert (=> b!765186 m!711399))

(assert (=> b!765186 m!711399))

(declare-fun m!711403 () Bool)

(assert (=> b!765186 m!711403))

(declare-fun m!711405 () Bool)

(assert (=> b!765186 m!711405))

(declare-fun m!711407 () Bool)

(assert (=> b!765186 m!711407))

(declare-fun m!711409 () Bool)

(assert (=> b!765192 m!711409))

(declare-fun m!711411 () Bool)

(assert (=> b!765188 m!711411))

(declare-fun m!711413 () Bool)

(assert (=> b!765188 m!711413))

(declare-fun m!711415 () Bool)

(assert (=> b!765188 m!711415))

(assert (=> b!765188 m!711411))

(declare-fun m!711417 () Bool)

(assert (=> b!765188 m!711417))

(declare-fun m!711419 () Bool)

(assert (=> b!765188 m!711419))

(assert (=> b!765194 m!711399))

(assert (=> b!765194 m!711399))

(declare-fun m!711421 () Bool)

(assert (=> b!765194 m!711421))

(assert (=> b!765194 m!711421))

(assert (=> b!765194 m!711399))

(declare-fun m!711423 () Bool)

(assert (=> b!765194 m!711423))

(declare-fun m!711425 () Bool)

(assert (=> b!765196 m!711425))

(assert (=> b!765189 m!711399))

(assert (=> b!765189 m!711399))

(declare-fun m!711427 () Bool)

(assert (=> b!765189 m!711427))

(declare-fun m!711429 () Bool)

(assert (=> b!765195 m!711429))

(assert (=> b!765197 m!711399))

(assert (=> b!765197 m!711399))

(declare-fun m!711431 () Bool)

(assert (=> b!765197 m!711431))

(declare-fun m!711433 () Bool)

(assert (=> b!765198 m!711433))

(declare-fun m!711435 () Bool)

(assert (=> b!765187 m!711435))

(declare-fun m!711437 () Bool)

(assert (=> b!765193 m!711437))

(assert (=> b!765185 m!711399))

(assert (=> b!765185 m!711399))

(declare-fun m!711439 () Bool)

(assert (=> b!765185 m!711439))

(push 1)

(assert (not b!765196))

(assert (not b!765194))

(assert (not b!765188))

(assert (not b!765189))

(assert (not b!765198))

(assert (not start!66390))

(assert (not b!765187))

(assert (not b!765185))

(assert (not b!765199))

(assert (not b!765193))

(assert (not b!765195))

(assert (not b!765186))

(assert (not b!765197))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!101107 () Bool)

(declare-fun res!517741 () Bool)

(declare-fun e!426180 () Bool)

(assert (=> d!101107 (=> res!517741 e!426180)))

(assert (=> d!101107 (= res!517741 (= (select (arr!20222 a!3186) #b00000000000000000000000000000000) k!2102))))

(assert (=> d!101107 (= (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000) e!426180)))

(declare-fun b!765256 () Bool)

(declare-fun e!426181 () Bool)

(assert (=> b!765256 (= e!426180 e!426181)))

(declare-fun res!517742 () Bool)

(assert (=> b!765256 (=> (not res!517742) (not e!426181))))

(assert (=> b!765256 (= res!517742 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20643 a!3186)))))

(declare-fun b!765257 () Bool)

(assert (=> b!765257 (= e!426181 (arrayContainsKey!0 a!3186 k!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101107 (not res!517741)) b!765256))

(assert (= (and b!765256 res!517742) b!765257))

(declare-fun m!711469 () Bool)

(assert (=> d!101107 m!711469))

(declare-fun m!711471 () Bool)

(assert (=> b!765257 m!711471))

(assert (=> b!765195 d!101107))

(declare-fun b!765306 () Bool)

(declare-fun e!426207 () SeekEntryResult!7822)

(assert (=> b!765306 (= e!426207 (MissingVacant!7822 resIntermediateIndex!5))))

(declare-fun lt!340471 () SeekEntryResult!7822)

(declare-fun d!101109 () Bool)

(assert (=> d!101109 (and (or (is-Undefined!7822 lt!340471) (not (is-Found!7822 lt!340471)) (and (bvsge (index!33657 lt!340471) #b00000000000000000000000000000000) (bvslt (index!33657 lt!340471) (size!20643 a!3186)))) (or (is-Undefined!7822 lt!340471) (is-Found!7822 lt!340471) (not (is-MissingVacant!7822 lt!340471)) (not (= (index!33659 lt!340471) resIntermediateIndex!5)) (and (bvsge (index!33659 lt!340471) #b00000000000000000000000000000000) (bvslt (index!33659 lt!340471) (size!20643 a!3186)))) (or (is-Undefined!7822 lt!340471) (ite (is-Found!7822 lt!340471) (= (select (arr!20222 a!3186) (index!33657 lt!340471)) (select (arr!20222 a!3186) j!159)) (and (is-MissingVacant!7822 lt!340471) (= (index!33659 lt!340471) resIntermediateIndex!5) (= (select (arr!20222 a!3186) (index!33659 lt!340471)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!426206 () SeekEntryResult!7822)

(assert (=> d!101109 (= lt!340471 e!426206)))

(declare-fun c!84171 () Bool)

(assert (=> d!101109 (= c!84171 (bvsge x!1131 #b01111111111111111111111111111110))))

(declare-fun lt!340472 () (_ BitVec 64))

(assert (=> d!101109 (= lt!340472 (select (arr!20222 a!3186) index!1321))))

(assert (=> d!101109 (validMask!0 mask!3328)))

(assert (=> d!101109 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20222 a!3186) j!159) a!3186 mask!3328) lt!340471)))

(declare-fun b!765307 () Bool)

(assert (=> b!765307 (= e!426206 Undefined!7822)))

(declare-fun b!765308 () Bool)

(declare-fun c!84172 () Bool)

(assert (=> b!765308 (= c!84172 (= lt!340472 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!426208 () SeekEntryResult!7822)

(assert (=> b!765308 (= e!426208 e!426207)))

(declare-fun b!765309 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!765309 (= e!426207 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20222 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!765310 () Bool)

(assert (=> b!765310 (= e!426206 e!426208)))

(declare-fun c!84170 () Bool)

(assert (=> b!765310 (= c!84170 (= lt!340472 (select (arr!20222 a!3186) j!159)))))

(declare-fun b!765311 () Bool)

(assert (=> b!765311 (= e!426208 (Found!7822 index!1321))))

(assert (= (and d!101109 c!84171) b!765307))

(assert (= (and d!101109 (not c!84171)) b!765310))

(assert (= (and b!765310 c!84170) b!765311))

(assert (= (and b!765310 (not c!84170)) b!765308))

(assert (= (and b!765308 c!84172) b!765306))

(assert (= (and b!765308 (not c!84172)) b!765309))

(declare-fun m!711493 () Bool)

(assert (=> d!101109 m!711493))

(declare-fun m!711495 () Bool)

(assert (=> d!101109 m!711495))

(declare-fun m!711497 () Bool)

(assert (=> d!101109 m!711497))

(assert (=> d!101109 m!711395))

(declare-fun m!711499 () Bool)

(assert (=> b!765309 m!711499))

(assert (=> b!765309 m!711499))

(assert (=> b!765309 m!711399))

(declare-fun m!711501 () Bool)

(assert (=> b!765309 m!711501))

(assert (=> b!765185 d!101109))

(declare-fun b!765372 () Bool)

(declare-fun e!426245 () SeekEntryResult!7822)

(assert (=> b!765372 (= e!426245 Undefined!7822)))

(declare-fun e!426246 () SeekEntryResult!7822)

(declare-fun lt!340491 () SeekEntryResult!7822)

(declare-fun b!765373 () Bool)

(assert (=> b!765373 (= e!426246 (seekKeyOrZeroReturnVacant!0 (x!64555 lt!340491) (index!33658 lt!340491) (index!33658 lt!340491) k!2102 a!3186 mask!3328))))

(declare-fun d!101117 () Bool)

(declare-fun lt!340492 () SeekEntryResult!7822)

(assert (=> d!101117 (and (or (is-Undefined!7822 lt!340492) (not (is-Found!7822 lt!340492)) (and (bvsge (index!33657 lt!340492) #b00000000000000000000000000000000) (bvslt (index!33657 lt!340492) (size!20643 a!3186)))) (or (is-Undefined!7822 lt!340492) (is-Found!7822 lt!340492) (not (is-MissingZero!7822 lt!340492)) (and (bvsge (index!33656 lt!340492) #b00000000000000000000000000000000) (bvslt (index!33656 lt!340492) (size!20643 a!3186)))) (or (is-Undefined!7822 lt!340492) (is-Found!7822 lt!340492) (is-MissingZero!7822 lt!340492) (not (is-MissingVacant!7822 lt!340492)) (and (bvsge (index!33659 lt!340492) #b00000000000000000000000000000000) (bvslt (index!33659 lt!340492) (size!20643 a!3186)))) (or (is-Undefined!7822 lt!340492) (ite (is-Found!7822 lt!340492) (= (select (arr!20222 a!3186) (index!33657 lt!340492)) k!2102) (ite (is-MissingZero!7822 lt!340492) (= (select (arr!20222 a!3186) (index!33656 lt!340492)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!7822 lt!340492) (= (select (arr!20222 a!3186) (index!33659 lt!340492)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!101117 (= lt!340492 e!426245)))

(declare-fun c!84198 () Bool)

(assert (=> d!101117 (= c!84198 (and (is-Intermediate!7822 lt!340491) (undefined!8634 lt!340491)))))

(assert (=> d!101117 (= lt!340491 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2102 mask!3328) k!2102 a!3186 mask!3328))))

(assert (=> d!101117 (validMask!0 mask!3328)))

(assert (=> d!101117 (= (seekEntryOrOpen!0 k!2102 a!3186 mask!3328) lt!340492)))

(declare-fun b!765374 () Bool)

(assert (=> b!765374 (= e!426246 (MissingZero!7822 (index!33658 lt!340491)))))

(declare-fun b!765375 () Bool)

(declare-fun e!426244 () SeekEntryResult!7822)

(assert (=> b!765375 (= e!426244 (Found!7822 (index!33658 lt!340491)))))

(declare-fun b!765376 () Bool)

(assert (=> b!765376 (= e!426245 e!426244)))

(declare-fun lt!340490 () (_ BitVec 64))

(assert (=> b!765376 (= lt!340490 (select (arr!20222 a!3186) (index!33658 lt!340491)))))

(declare-fun c!84199 () Bool)

(assert (=> b!765376 (= c!84199 (= lt!340490 k!2102))))

(declare-fun b!765377 () Bool)

(declare-fun c!84197 () Bool)

(assert (=> b!765377 (= c!84197 (= lt!340490 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!765377 (= e!426244 e!426246)))

(assert (= (and d!101117 c!84198) b!765372))

(assert (= (and d!101117 (not c!84198)) b!765376))

(assert (= (and b!765376 c!84199) b!765375))

(assert (= (and b!765376 (not c!84199)) b!765377))

(assert (= (and b!765377 c!84197) b!765374))

(assert (= (and b!765377 (not c!84197)) b!765373))

(declare-fun m!711537 () Bool)

(assert (=> b!765373 m!711537))

(declare-fun m!711539 () Bool)

(assert (=> d!101117 m!711539))

(declare-fun m!711541 () Bool)

(assert (=> d!101117 m!711541))

(declare-fun m!711543 () Bool)

(assert (=> d!101117 m!711543))

(assert (=> d!101117 m!711543))

(declare-fun m!711545 () Bool)

(assert (=> d!101117 m!711545))

(assert (=> d!101117 m!711395))

(declare-fun m!711547 () Bool)

(assert (=> d!101117 m!711547))

(declare-fun m!711549 () Bool)

(assert (=> b!765376 m!711549))

(assert (=> b!765196 d!101117))

(declare-fun b!765378 () Bool)

(declare-fun e!426248 () SeekEntryResult!7822)

(assert (=> b!765378 (= e!426248 (MissingVacant!7822 resIntermediateIndex!5))))

(declare-fun d!101131 () Bool)

(declare-fun lt!340493 () SeekEntryResult!7822)

(assert (=> d!101131 (and (or (is-Undefined!7822 lt!340493) (not (is-Found!7822 lt!340493)) (and (bvsge (index!33657 lt!340493) #b00000000000000000000000000000000) (bvslt (index!33657 lt!340493) (size!20643 a!3186)))) (or (is-Undefined!7822 lt!340493) (is-Found!7822 lt!340493) (not (is-MissingVacant!7822 lt!340493)) (not (= (index!33659 lt!340493) resIntermediateIndex!5)) (and (bvsge (index!33659 lt!340493) #b00000000000000000000000000000000) (bvslt (index!33659 lt!340493) (size!20643 a!3186)))) (or (is-Undefined!7822 lt!340493) (ite (is-Found!7822 lt!340493) (= (select (arr!20222 a!3186) (index!33657 lt!340493)) (select (arr!20222 a!3186) j!159)) (and (is-MissingVacant!7822 lt!340493) (= (index!33659 lt!340493) resIntermediateIndex!5) (= (select (arr!20222 a!3186) (index!33659 lt!340493)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!426247 () SeekEntryResult!7822)

(assert (=> d!101131 (= lt!340493 e!426247)))

(declare-fun c!84201 () Bool)

(assert (=> d!101131 (= c!84201 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(declare-fun lt!340494 () (_ BitVec 64))

(assert (=> d!101131 (= lt!340494 (select (arr!20222 a!3186) resIntermediateIndex!5))))

(assert (=> d!101131 (validMask!0 mask!3328)))

(assert (=> d!101131 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20222 a!3186) j!159) a!3186 mask!3328) lt!340493)))

(declare-fun b!765379 () Bool)

(assert (=> b!765379 (= e!426247 Undefined!7822)))

(declare-fun b!765380 () Bool)

(declare-fun c!84202 () Bool)

(assert (=> b!765380 (= c!84202 (= lt!340494 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!426249 () SeekEntryResult!7822)

(assert (=> b!765380 (= e!426249 e!426248)))

(declare-fun b!765381 () Bool)

(assert (=> b!765381 (= e!426248 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20222 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!765382 () Bool)

(assert (=> b!765382 (= e!426247 e!426249)))

(declare-fun c!84200 () Bool)

(assert (=> b!765382 (= c!84200 (= lt!340494 (select (arr!20222 a!3186) j!159)))))

(declare-fun b!765383 () Bool)

(assert (=> b!765383 (= e!426249 (Found!7822 resIntermediateIndex!5))))

(assert (= (and d!101131 c!84201) b!765379))

(assert (= (and d!101131 (not c!84201)) b!765382))

(assert (= (and b!765382 c!84200) b!765383))

(assert (= (and b!765382 (not c!84200)) b!765380))

(assert (= (and b!765380 c!84202) b!765378))

(assert (= (and b!765380 (not c!84202)) b!765381))

(declare-fun m!711551 () Bool)

(assert (=> d!101131 m!711551))

(declare-fun m!711553 () Bool)

(assert (=> d!101131 m!711553))

(assert (=> d!101131 m!711409))

(assert (=> d!101131 m!711395))

(declare-fun m!711555 () Bool)

(assert (=> b!765381 m!711555))

(assert (=> b!765381 m!711555))

(assert (=> b!765381 m!711399))

(declare-fun m!711557 () Bool)

(assert (=> b!765381 m!711557))

(assert (=> b!765186 d!101131))

(declare-fun d!101133 () Bool)

(declare-fun res!517766 () Bool)

(declare-fun e!426274 () Bool)

(assert (=> d!101133 (=> res!517766 e!426274)))

(assert (=> d!101133 (= res!517766 (bvsge j!159 (size!20643 a!3186)))))

(assert (=> d!101133 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!426274)))

(declare-fun b!765422 () Bool)

(declare-fun e!426276 () Bool)

(declare-fun e!426275 () Bool)

(assert (=> b!765422 (= e!426276 e!426275)))

(declare-fun lt!340520 () (_ BitVec 64))

(assert (=> b!765422 (= lt!340520 (select (arr!20222 a!3186) j!159))))

(declare-fun lt!340519 () Unit!26370)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42232 (_ BitVec 64) (_ BitVec 32)) Unit!26370)

(assert (=> b!765422 (= lt!340519 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!340520 j!159))))

(assert (=> b!765422 (arrayContainsKey!0 a!3186 lt!340520 #b00000000000000000000000000000000)))

(declare-fun lt!340521 () Unit!26370)

(assert (=> b!765422 (= lt!340521 lt!340519)))

(declare-fun res!517765 () Bool)

(assert (=> b!765422 (= res!517765 (= (seekEntryOrOpen!0 (select (arr!20222 a!3186) j!159) a!3186 mask!3328) (Found!7822 j!159)))))

(assert (=> b!765422 (=> (not res!517765) (not e!426275))))

(declare-fun b!765423 () Bool)

(declare-fun call!35031 () Bool)

(assert (=> b!765423 (= e!426276 call!35031)))

(declare-fun bm!35028 () Bool)

(assert (=> bm!35028 (= call!35031 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!765424 () Bool)

(assert (=> b!765424 (= e!426275 call!35031)))

(declare-fun b!765425 () Bool)

(assert (=> b!765425 (= e!426274 e!426276)))

(declare-fun c!84217 () Bool)

(assert (=> b!765425 (= c!84217 (validKeyInArray!0 (select (arr!20222 a!3186) j!159)))))

(assert (= (and d!101133 (not res!517766)) b!765425))

(assert (= (and b!765425 c!84217) b!765422))

(assert (= (and b!765425 (not c!84217)) b!765423))

(assert (= (and b!765422 res!517765) b!765424))

(assert (= (or b!765424 b!765423) bm!35028))

(assert (=> b!765422 m!711399))

(declare-fun m!711575 () Bool)

(assert (=> b!765422 m!711575))

(declare-fun m!711577 () Bool)

(assert (=> b!765422 m!711577))

(assert (=> b!765422 m!711399))

(assert (=> b!765422 m!711427))

(declare-fun m!711579 () Bool)

(assert (=> bm!35028 m!711579))

(assert (=> b!765425 m!711399))

(assert (=> b!765425 m!711399))

(assert (=> b!765425 m!711431))

(assert (=> b!765186 d!101133))

(declare-fun d!101141 () Bool)

(assert (=> d!101141 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!340530 () Unit!26370)

(declare-fun choose!38 (array!42232 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26370)

(assert (=> d!101141 (= lt!340530 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!101141 (validMask!0 mask!3328)))

(assert (=> d!101141 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!340530)))

(declare-fun bs!21487 () Bool)

(assert (= bs!21487 d!101141))

(assert (=> bs!21487 m!711405))

(declare-fun m!711581 () Bool)

(assert (=> bs!21487 m!711581))

(assert (=> bs!21487 m!711395))

(assert (=> b!765186 d!101141))

(declare-fun d!101143 () Bool)

(assert (=> d!101143 (= (validKeyInArray!0 (select (arr!20222 a!3186) j!159)) (and (not (= (select (arr!20222 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20222 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!765197 d!101143))

(declare-fun bm!35034 () Bool)

(declare-fun call!35037 () Bool)

(declare-fun c!84226 () Bool)

(assert (=> bm!35034 (= call!35037 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!84226 (Cons!14220 (select (arr!20222 a!3186) #b00000000000000000000000000000000) Nil!14221) Nil!14221)))))

(declare-fun b!765454 () Bool)

(declare-fun e!426300 () Bool)

(declare-fun contains!4078 (List!14224 (_ BitVec 64)) Bool)

(assert (=> b!765454 (= e!426300 (contains!4078 Nil!14221 (select (arr!20222 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!101145 () Bool)

(declare-fun res!517781 () Bool)

(declare-fun e!426297 () Bool)

(assert (=> d!101145 (=> res!517781 e!426297)))

(assert (=> d!101145 (= res!517781 (bvsge #b00000000000000000000000000000000 (size!20643 a!3186)))))

(assert (=> d!101145 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14221) e!426297)))

(declare-fun b!765455 () Bool)

(declare-fun e!426298 () Bool)

(declare-fun e!426299 () Bool)

(assert (=> b!765455 (= e!426298 e!426299)))

(assert (=> b!765455 (= c!84226 (validKeyInArray!0 (select (arr!20222 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!765456 () Bool)

(assert (=> b!765456 (= e!426297 e!426298)))

(declare-fun res!517780 () Bool)

(assert (=> b!765456 (=> (not res!517780) (not e!426298))))

(assert (=> b!765456 (= res!517780 (not e!426300))))

(declare-fun res!517779 () Bool)

(assert (=> b!765456 (=> (not res!517779) (not e!426300))))

(assert (=> b!765456 (= res!517779 (validKeyInArray!0 (select (arr!20222 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!765457 () Bool)

(assert (=> b!765457 (= e!426299 call!35037)))

(declare-fun b!765458 () Bool)

(assert (=> b!765458 (= e!426299 call!35037)))

(assert (= (and d!101145 (not res!517781)) b!765456))

(assert (= (and b!765456 res!517779) b!765454))

(assert (= (and b!765456 res!517780) b!765455))

(assert (= (and b!765455 c!84226) b!765458))

(assert (= (and b!765455 (not c!84226)) b!765457))

(assert (= (or b!765458 b!765457) bm!35034))

(assert (=> bm!35034 m!711469))

(declare-fun m!711597 () Bool)

(assert (=> bm!35034 m!711597))

(assert (=> b!765454 m!711469))

(assert (=> b!765454 m!711469))

(declare-fun m!711599 () Bool)

(assert (=> b!765454 m!711599))

(assert (=> b!765455 m!711469))

(assert (=> b!765455 m!711469))

(declare-fun m!711601 () Bool)

(assert (=> b!765455 m!711601))

(assert (=> b!765456 m!711469))

(assert (=> b!765456 m!711469))

(assert (=> b!765456 m!711601))

(assert (=> b!765187 d!101145))

(declare-fun d!101153 () Bool)

(assert (=> d!101153 (= (validKeyInArray!0 k!2102) (and (not (= k!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!765198 d!101153))

(declare-fun d!101155 () Bool)

(assert (=> d!101155 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!66390 d!101155))

(declare-fun d!101167 () Bool)

(assert (=> d!101167 (= (array_inv!16018 a!3186) (bvsge (size!20643 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!66390 d!101167))

(declare-fun b!765551 () Bool)

(declare-fun lt!340573 () SeekEntryResult!7822)

(assert (=> b!765551 (and (bvsge (index!33658 lt!340573) #b00000000000000000000000000000000) (bvslt (index!33658 lt!340573) (size!20643 lt!340426)))))

(declare-fun e!426359 () Bool)

(assert (=> b!765551 (= e!426359 (= (select (arr!20222 lt!340426) (index!33658 lt!340573)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!765552 () Bool)

(declare-fun e!426357 () SeekEntryResult!7822)

(assert (=> b!765552 (= e!426357 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!340430 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!340430 lt!340426 mask!3328))))

(declare-fun b!765553 () Bool)

(assert (=> b!765553 (and (bvsge (index!33658 lt!340573) #b00000000000000000000000000000000) (bvslt (index!33658 lt!340573) (size!20643 lt!340426)))))

(declare-fun res!517817 () Bool)

(assert (=> b!765553 (= res!517817 (= (select (arr!20222 lt!340426) (index!33658 lt!340573)) lt!340430))))

(assert (=> b!765553 (=> res!517817 e!426359)))

(declare-fun e!426360 () Bool)

(assert (=> b!765553 (= e!426360 e!426359)))

(declare-fun d!101169 () Bool)

(declare-fun e!426356 () Bool)

(assert (=> d!101169 e!426356))

(declare-fun c!84257 () Bool)

(assert (=> d!101169 (= c!84257 (and (is-Intermediate!7822 lt!340573) (undefined!8634 lt!340573)))))

(declare-fun e!426358 () SeekEntryResult!7822)

(assert (=> d!101169 (= lt!340573 e!426358)))

(declare-fun c!84258 () Bool)

(assert (=> d!101169 (= c!84258 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!340572 () (_ BitVec 64))

(assert (=> d!101169 (= lt!340572 (select (arr!20222 lt!340426) (toIndex!0 lt!340430 mask!3328)))))

(assert (=> d!101169 (validMask!0 mask!3328)))

(assert (=> d!101169 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340430 mask!3328) lt!340430 lt!340426 mask!3328) lt!340573)))

(declare-fun b!765554 () Bool)

(assert (=> b!765554 (= e!426358 e!426357)))

(declare-fun c!84256 () Bool)

(assert (=> b!765554 (= c!84256 (or (= lt!340572 lt!340430) (= (bvadd lt!340572 lt!340572) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765555 () Bool)

(assert (=> b!765555 (and (bvsge (index!33658 lt!340573) #b00000000000000000000000000000000) (bvslt (index!33658 lt!340573) (size!20643 lt!340426)))))

(declare-fun res!517819 () Bool)

(assert (=> b!765555 (= res!517819 (= (select (arr!20222 lt!340426) (index!33658 lt!340573)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!765555 (=> res!517819 e!426359)))

(declare-fun b!765556 () Bool)

(assert (=> b!765556 (= e!426357 (Intermediate!7822 false (toIndex!0 lt!340430 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!765557 () Bool)

(assert (=> b!765557 (= e!426358 (Intermediate!7822 true (toIndex!0 lt!340430 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!765558 () Bool)

(assert (=> b!765558 (= e!426356 (bvsge (x!64555 lt!340573) #b01111111111111111111111111111110))))

(declare-fun b!765559 () Bool)

(assert (=> b!765559 (= e!426356 e!426360)))

(declare-fun res!517818 () Bool)

(assert (=> b!765559 (= res!517818 (and (is-Intermediate!7822 lt!340573) (not (undefined!8634 lt!340573)) (bvslt (x!64555 lt!340573) #b01111111111111111111111111111110) (bvsge (x!64555 lt!340573) #b00000000000000000000000000000000) (bvsge (x!64555 lt!340573) #b00000000000000000000000000000000)))))

(assert (=> b!765559 (=> (not res!517818) (not e!426360))))

(assert (= (and d!101169 c!84258) b!765557))

(assert (= (and d!101169 (not c!84258)) b!765554))

(assert (= (and b!765554 c!84256) b!765556))

(assert (= (and b!765554 (not c!84256)) b!765552))

(assert (= (and d!101169 c!84257) b!765558))

(assert (= (and d!101169 (not c!84257)) b!765559))

(assert (= (and b!765559 res!517818) b!765553))

(assert (= (and b!765553 (not res!517817)) b!765555))

(assert (= (and b!765555 (not res!517819)) b!765551))

(declare-fun m!711669 () Bool)

(assert (=> b!765555 m!711669))

(assert (=> d!101169 m!711411))

(declare-fun m!711671 () Bool)

(assert (=> d!101169 m!711671))

(assert (=> d!101169 m!711395))

(assert (=> b!765551 m!711669))

(assert (=> b!765552 m!711411))

(declare-fun m!711673 () Bool)

(assert (=> b!765552 m!711673))

(assert (=> b!765552 m!711673))

(declare-fun m!711675 () Bool)

(assert (=> b!765552 m!711675))

(assert (=> b!765553 m!711669))

(assert (=> b!765188 d!101169))

(declare-fun d!101189 () Bool)

(declare-fun lt!340579 () (_ BitVec 32))

(declare-fun lt!340578 () (_ BitVec 32))

(assert (=> d!101189 (= lt!340579 (bvmul (bvxor lt!340578 (bvlshr lt!340578 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!101189 (= lt!340578 ((_ extract 31 0) (bvand (bvxor lt!340430 (bvlshr lt!340430 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!101189 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!517820 (let ((h!15310 ((_ extract 31 0) (bvand (bvxor lt!340430 (bvlshr lt!340430 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!64564 (bvmul (bvxor h!15310 (bvlshr h!15310 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!64564 (bvlshr x!64564 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!517820 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!517820 #b00000000000000000000000000000000))))))

(assert (=> d!101189 (= (toIndex!0 lt!340430 mask!3328) (bvand (bvxor lt!340579 (bvlshr lt!340579 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!765188 d!101189))

(declare-fun b!765570 () Bool)

(declare-fun lt!340581 () SeekEntryResult!7822)

(assert (=> b!765570 (and (bvsge (index!33658 lt!340581) #b00000000000000000000000000000000) (bvslt (index!33658 lt!340581) (size!20643 lt!340426)))))

(declare-fun e!426372 () Bool)

(assert (=> b!765570 (= e!426372 (= (select (arr!20222 lt!340426) (index!33658 lt!340581)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!765571 () Bool)

(declare-fun e!426370 () SeekEntryResult!7822)

(assert (=> b!765571 (= e!426370 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!340430 lt!340426 mask!3328))))

(declare-fun b!765572 () Bool)

(assert (=> b!765572 (and (bvsge (index!33658 lt!340581) #b00000000000000000000000000000000) (bvslt (index!33658 lt!340581) (size!20643 lt!340426)))))

