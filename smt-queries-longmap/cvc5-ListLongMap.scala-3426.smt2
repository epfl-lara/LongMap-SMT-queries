; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47544 () Bool)

(assert start!47544)

(declare-fun b!523333 () Bool)

(declare-datatypes ((Unit!16352 0))(
  ( (Unit!16353) )
))
(declare-fun e!305211 () Unit!16352)

(declare-fun Unit!16354 () Unit!16352)

(assert (=> b!523333 (= e!305211 Unit!16354)))

(declare-fun res!320708 () Bool)

(declare-fun e!305213 () Bool)

(assert (=> start!47544 (=> (not res!320708) (not e!305213))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47544 (= res!320708 (validMask!0 mask!3524))))

(assert (=> start!47544 e!305213))

(assert (=> start!47544 true))

(declare-datatypes ((array!33307 0))(
  ( (array!33308 (arr!16008 (Array (_ BitVec 32) (_ BitVec 64))) (size!16372 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33307)

(declare-fun array_inv!11804 (array!33307) Bool)

(assert (=> start!47544 (array_inv!11804 a!3235)))

(declare-fun e!305209 () Bool)

(declare-datatypes ((SeekEntryResult!4475 0))(
  ( (MissingZero!4475 (index!20106 (_ BitVec 32))) (Found!4475 (index!20107 (_ BitVec 32))) (Intermediate!4475 (undefined!5287 Bool) (index!20108 (_ BitVec 32)) (x!49086 (_ BitVec 32))) (Undefined!4475) (MissingVacant!4475 (index!20109 (_ BitVec 32))) )
))
(declare-fun lt!240111 () SeekEntryResult!4475)

(declare-fun lt!240118 () (_ BitVec 32))

(declare-fun b!523334 () Bool)

(assert (=> b!523334 (= e!305209 (or (bvsgt #b00000000000000000000000000000000 (x!49086 lt!240111)) (bvsgt (x!49086 lt!240111) #b01111111111111111111111111111110) (and (bvsge lt!240118 #b00000000000000000000000000000000) (bvslt lt!240118 (size!16372 a!3235)))))))

(assert (=> b!523334 (and (or (= (select (arr!16008 a!3235) (index!20108 lt!240111)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16008 a!3235) (index!20108 lt!240111)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16008 a!3235) (index!20108 lt!240111)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16008 a!3235) (index!20108 lt!240111)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240114 () Unit!16352)

(assert (=> b!523334 (= lt!240114 e!305211)))

(declare-fun c!61616 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!523334 (= c!61616 (= (select (arr!16008 a!3235) (index!20108 lt!240111)) (select (arr!16008 a!3235) j!176)))))

(assert (=> b!523334 (and (bvslt (x!49086 lt!240111) #b01111111111111111111111111111110) (or (= (select (arr!16008 a!3235) (index!20108 lt!240111)) (select (arr!16008 a!3235) j!176)) (= (select (arr!16008 a!3235) (index!20108 lt!240111)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16008 a!3235) (index!20108 lt!240111)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523335 () Bool)

(declare-fun e!305214 () Bool)

(assert (=> b!523335 (= e!305213 e!305214)))

(declare-fun res!320717 () Bool)

(assert (=> b!523335 (=> (not res!320717) (not e!305214))))

(declare-fun lt!240116 () SeekEntryResult!4475)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!523335 (= res!320717 (or (= lt!240116 (MissingZero!4475 i!1204)) (= lt!240116 (MissingVacant!4475 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33307 (_ BitVec 32)) SeekEntryResult!4475)

(assert (=> b!523335 (= lt!240116 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!523336 () Bool)

(declare-fun res!320716 () Bool)

(assert (=> b!523336 (=> (not res!320716) (not e!305213))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!523336 (= res!320716 (validKeyInArray!0 (select (arr!16008 a!3235) j!176)))))

(declare-fun b!523337 () Bool)

(declare-fun Unit!16355 () Unit!16352)

(assert (=> b!523337 (= e!305211 Unit!16355)))

(declare-fun lt!240113 () Unit!16352)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33307 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16352)

(assert (=> b!523337 (= lt!240113 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!240118 #b00000000000000000000000000000000 (index!20108 lt!240111) (x!49086 lt!240111) mask!3524))))

(declare-fun lt!240117 () (_ BitVec 64))

(declare-fun lt!240115 () array!33307)

(declare-fun res!320711 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33307 (_ BitVec 32)) SeekEntryResult!4475)

(assert (=> b!523337 (= res!320711 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240118 lt!240117 lt!240115 mask!3524) (Intermediate!4475 false (index!20108 lt!240111) (x!49086 lt!240111))))))

(declare-fun e!305212 () Bool)

(assert (=> b!523337 (=> (not res!320711) (not e!305212))))

(assert (=> b!523337 e!305212))

(declare-fun b!523338 () Bool)

(declare-fun res!320713 () Bool)

(assert (=> b!523338 (=> (not res!320713) (not e!305214))))

(declare-datatypes ((List!10166 0))(
  ( (Nil!10163) (Cons!10162 (h!11087 (_ BitVec 64)) (t!16394 List!10166)) )
))
(declare-fun arrayNoDuplicates!0 (array!33307 (_ BitVec 32) List!10166) Bool)

(assert (=> b!523338 (= res!320713 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10163))))

(declare-fun b!523339 () Bool)

(declare-fun res!320715 () Bool)

(assert (=> b!523339 (=> (not res!320715) (not e!305213))))

(declare-fun arrayContainsKey!0 (array!33307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!523339 (= res!320715 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!523340 () Bool)

(declare-fun res!320707 () Bool)

(assert (=> b!523340 (=> res!320707 e!305209)))

(assert (=> b!523340 (= res!320707 (or (undefined!5287 lt!240111) (not (is-Intermediate!4475 lt!240111))))))

(declare-fun b!523341 () Bool)

(declare-fun res!320710 () Bool)

(assert (=> b!523341 (=> (not res!320710) (not e!305214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33307 (_ BitVec 32)) Bool)

(assert (=> b!523341 (= res!320710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!523342 () Bool)

(declare-fun res!320706 () Bool)

(assert (=> b!523342 (=> (not res!320706) (not e!305213))))

(assert (=> b!523342 (= res!320706 (validKeyInArray!0 k!2280))))

(declare-fun b!523343 () Bool)

(declare-fun res!320712 () Bool)

(assert (=> b!523343 (=> (not res!320712) (not e!305213))))

(assert (=> b!523343 (= res!320712 (and (= (size!16372 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16372 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16372 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!523344 () Bool)

(assert (=> b!523344 (= e!305214 (not e!305209))))

(declare-fun res!320709 () Bool)

(assert (=> b!523344 (=> res!320709 e!305209)))

(declare-fun lt!240110 () (_ BitVec 32))

(assert (=> b!523344 (= res!320709 (= lt!240111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240110 lt!240117 lt!240115 mask!3524)))))

(assert (=> b!523344 (= lt!240111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240118 (select (arr!16008 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523344 (= lt!240110 (toIndex!0 lt!240117 mask!3524))))

(assert (=> b!523344 (= lt!240117 (select (store (arr!16008 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!523344 (= lt!240118 (toIndex!0 (select (arr!16008 a!3235) j!176) mask!3524))))

(assert (=> b!523344 (= lt!240115 (array!33308 (store (arr!16008 a!3235) i!1204 k!2280) (size!16372 a!3235)))))

(declare-fun e!305210 () Bool)

(assert (=> b!523344 e!305210))

(declare-fun res!320714 () Bool)

(assert (=> b!523344 (=> (not res!320714) (not e!305210))))

(assert (=> b!523344 (= res!320714 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240112 () Unit!16352)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33307 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16352)

(assert (=> b!523344 (= lt!240112 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!523345 () Bool)

(assert (=> b!523345 (= e!305210 (= (seekEntryOrOpen!0 (select (arr!16008 a!3235) j!176) a!3235 mask!3524) (Found!4475 j!176)))))

(declare-fun b!523346 () Bool)

(assert (=> b!523346 (= e!305212 false)))

(assert (= (and start!47544 res!320708) b!523343))

(assert (= (and b!523343 res!320712) b!523336))

(assert (= (and b!523336 res!320716) b!523342))

(assert (= (and b!523342 res!320706) b!523339))

(assert (= (and b!523339 res!320715) b!523335))

(assert (= (and b!523335 res!320717) b!523341))

(assert (= (and b!523341 res!320710) b!523338))

(assert (= (and b!523338 res!320713) b!523344))

(assert (= (and b!523344 res!320714) b!523345))

(assert (= (and b!523344 (not res!320709)) b!523340))

(assert (= (and b!523340 (not res!320707)) b!523334))

(assert (= (and b!523334 c!61616) b!523337))

(assert (= (and b!523334 (not c!61616)) b!523333))

(assert (= (and b!523337 res!320711) b!523346))

(declare-fun m!504153 () Bool)

(assert (=> b!523336 m!504153))

(assert (=> b!523336 m!504153))

(declare-fun m!504155 () Bool)

(assert (=> b!523336 m!504155))

(declare-fun m!504157 () Bool)

(assert (=> b!523334 m!504157))

(assert (=> b!523334 m!504153))

(assert (=> b!523345 m!504153))

(assert (=> b!523345 m!504153))

(declare-fun m!504159 () Bool)

(assert (=> b!523345 m!504159))

(declare-fun m!504161 () Bool)

(assert (=> b!523341 m!504161))

(declare-fun m!504163 () Bool)

(assert (=> b!523342 m!504163))

(declare-fun m!504165 () Bool)

(assert (=> start!47544 m!504165))

(declare-fun m!504167 () Bool)

(assert (=> start!47544 m!504167))

(declare-fun m!504169 () Bool)

(assert (=> b!523337 m!504169))

(declare-fun m!504171 () Bool)

(assert (=> b!523337 m!504171))

(declare-fun m!504173 () Bool)

(assert (=> b!523339 m!504173))

(declare-fun m!504175 () Bool)

(assert (=> b!523344 m!504175))

(declare-fun m!504177 () Bool)

(assert (=> b!523344 m!504177))

(declare-fun m!504179 () Bool)

(assert (=> b!523344 m!504179))

(declare-fun m!504181 () Bool)

(assert (=> b!523344 m!504181))

(assert (=> b!523344 m!504153))

(declare-fun m!504183 () Bool)

(assert (=> b!523344 m!504183))

(declare-fun m!504185 () Bool)

(assert (=> b!523344 m!504185))

(assert (=> b!523344 m!504153))

(declare-fun m!504187 () Bool)

(assert (=> b!523344 m!504187))

(assert (=> b!523344 m!504153))

(declare-fun m!504189 () Bool)

(assert (=> b!523344 m!504189))

(declare-fun m!504191 () Bool)

(assert (=> b!523338 m!504191))

(declare-fun m!504193 () Bool)

(assert (=> b!523335 m!504193))

(push 1)

(assert (not b!523335))

(assert (not b!523338))

(assert (not b!523342))

(assert (not b!523336))

(assert (not b!523341))

(assert (not b!523339))

(assert (not b!523344))

(assert (not start!47544))

(assert (not b!523337))

(assert (not b!523345))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!523476 () Bool)

(declare-fun e!305285 () SeekEntryResult!4475)

(declare-fun e!305284 () SeekEntryResult!4475)

(assert (=> b!523476 (= e!305285 e!305284)))

(declare-fun lt!240188 () (_ BitVec 64))

(declare-fun lt!240189 () SeekEntryResult!4475)

(assert (=> b!523476 (= lt!240188 (select (arr!16008 a!3235) (index!20108 lt!240189)))))

(declare-fun c!61641 () Bool)

(assert (=> b!523476 (= c!61641 (= lt!240188 k!2280))))

(declare-fun d!80523 () Bool)

(declare-fun lt!240190 () SeekEntryResult!4475)

(assert (=> d!80523 (and (or (is-Undefined!4475 lt!240190) (not (is-Found!4475 lt!240190)) (and (bvsge (index!20107 lt!240190) #b00000000000000000000000000000000) (bvslt (index!20107 lt!240190) (size!16372 a!3235)))) (or (is-Undefined!4475 lt!240190) (is-Found!4475 lt!240190) (not (is-MissingZero!4475 lt!240190)) (and (bvsge (index!20106 lt!240190) #b00000000000000000000000000000000) (bvslt (index!20106 lt!240190) (size!16372 a!3235)))) (or (is-Undefined!4475 lt!240190) (is-Found!4475 lt!240190) (is-MissingZero!4475 lt!240190) (not (is-MissingVacant!4475 lt!240190)) (and (bvsge (index!20109 lt!240190) #b00000000000000000000000000000000) (bvslt (index!20109 lt!240190) (size!16372 a!3235)))) (or (is-Undefined!4475 lt!240190) (ite (is-Found!4475 lt!240190) (= (select (arr!16008 a!3235) (index!20107 lt!240190)) k!2280) (ite (is-MissingZero!4475 lt!240190) (= (select (arr!16008 a!3235) (index!20106 lt!240190)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4475 lt!240190) (= (select (arr!16008 a!3235) (index!20109 lt!240190)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80523 (= lt!240190 e!305285)))

(declare-fun c!61643 () Bool)

(assert (=> d!80523 (= c!61643 (and (is-Intermediate!4475 lt!240189) (undefined!5287 lt!240189)))))

(assert (=> d!80523 (= lt!240189 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!80523 (validMask!0 mask!3524)))

(assert (=> d!80523 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!240190)))

(declare-fun b!523477 () Bool)

(assert (=> b!523477 (= e!305285 Undefined!4475)))

(declare-fun b!523478 () Bool)

(declare-fun e!305286 () SeekEntryResult!4475)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33307 (_ BitVec 32)) SeekEntryResult!4475)

(assert (=> b!523478 (= e!305286 (seekKeyOrZeroReturnVacant!0 (x!49086 lt!240189) (index!20108 lt!240189) (index!20108 lt!240189) k!2280 a!3235 mask!3524))))

(declare-fun b!523479 () Bool)

(assert (=> b!523479 (= e!305286 (MissingZero!4475 (index!20108 lt!240189)))))

(declare-fun b!523480 () Bool)

(declare-fun c!61642 () Bool)

(assert (=> b!523480 (= c!61642 (= lt!240188 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!523480 (= e!305284 e!305286)))

(declare-fun b!523481 () Bool)

(assert (=> b!523481 (= e!305284 (Found!4475 (index!20108 lt!240189)))))

(assert (= (and d!80523 c!61643) b!523477))

(assert (= (and d!80523 (not c!61643)) b!523476))

(assert (= (and b!523476 c!61641) b!523481))

(assert (= (and b!523476 (not c!61641)) b!523480))

(assert (= (and b!523480 c!61642) b!523479))

(assert (= (and b!523480 (not c!61642)) b!523478))

(declare-fun m!504301 () Bool)

(assert (=> b!523476 m!504301))

(declare-fun m!504303 () Bool)

(assert (=> d!80523 m!504303))

(assert (=> d!80523 m!504165))

(declare-fun m!504305 () Bool)

(assert (=> d!80523 m!504305))

(declare-fun m!504307 () Bool)

(assert (=> d!80523 m!504307))

(declare-fun m!504309 () Bool)

(assert (=> d!80523 m!504309))

(assert (=> d!80523 m!504305))

(declare-fun m!504311 () Bool)

(assert (=> d!80523 m!504311))

(declare-fun m!504313 () Bool)

(assert (=> b!523478 m!504313))

(assert (=> b!523335 d!80523))

(declare-fun b!523482 () Bool)

(declare-fun e!305288 () SeekEntryResult!4475)

(declare-fun e!305287 () SeekEntryResult!4475)

(assert (=> b!523482 (= e!305288 e!305287)))

(declare-fun lt!240191 () (_ BitVec 64))

(declare-fun lt!240192 () SeekEntryResult!4475)

(assert (=> b!523482 (= lt!240191 (select (arr!16008 a!3235) (index!20108 lt!240192)))))

(declare-fun c!61644 () Bool)

(assert (=> b!523482 (= c!61644 (= lt!240191 (select (arr!16008 a!3235) j!176)))))

(declare-fun d!80535 () Bool)

(declare-fun lt!240193 () SeekEntryResult!4475)

(assert (=> d!80535 (and (or (is-Undefined!4475 lt!240193) (not (is-Found!4475 lt!240193)) (and (bvsge (index!20107 lt!240193) #b00000000000000000000000000000000) (bvslt (index!20107 lt!240193) (size!16372 a!3235)))) (or (is-Undefined!4475 lt!240193) (is-Found!4475 lt!240193) (not (is-MissingZero!4475 lt!240193)) (and (bvsge (index!20106 lt!240193) #b00000000000000000000000000000000) (bvslt (index!20106 lt!240193) (size!16372 a!3235)))) (or (is-Undefined!4475 lt!240193) (is-Found!4475 lt!240193) (is-MissingZero!4475 lt!240193) (not (is-MissingVacant!4475 lt!240193)) (and (bvsge (index!20109 lt!240193) #b00000000000000000000000000000000) (bvslt (index!20109 lt!240193) (size!16372 a!3235)))) (or (is-Undefined!4475 lt!240193) (ite (is-Found!4475 lt!240193) (= (select (arr!16008 a!3235) (index!20107 lt!240193)) (select (arr!16008 a!3235) j!176)) (ite (is-MissingZero!4475 lt!240193) (= (select (arr!16008 a!3235) (index!20106 lt!240193)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4475 lt!240193) (= (select (arr!16008 a!3235) (index!20109 lt!240193)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80535 (= lt!240193 e!305288)))

(declare-fun c!61646 () Bool)

(assert (=> d!80535 (= c!61646 (and (is-Intermediate!4475 lt!240192) (undefined!5287 lt!240192)))))

(assert (=> d!80535 (= lt!240192 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16008 a!3235) j!176) mask!3524) (select (arr!16008 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80535 (validMask!0 mask!3524)))

(assert (=> d!80535 (= (seekEntryOrOpen!0 (select (arr!16008 a!3235) j!176) a!3235 mask!3524) lt!240193)))

(declare-fun b!523483 () Bool)

(assert (=> b!523483 (= e!305288 Undefined!4475)))

(declare-fun e!305289 () SeekEntryResult!4475)

(declare-fun b!523484 () Bool)

(assert (=> b!523484 (= e!305289 (seekKeyOrZeroReturnVacant!0 (x!49086 lt!240192) (index!20108 lt!240192) (index!20108 lt!240192) (select (arr!16008 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!523485 () Bool)

(assert (=> b!523485 (= e!305289 (MissingZero!4475 (index!20108 lt!240192)))))

(declare-fun b!523486 () Bool)

(declare-fun c!61645 () Bool)

(assert (=> b!523486 (= c!61645 (= lt!240191 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!523486 (= e!305287 e!305289)))

(declare-fun b!523487 () Bool)

(assert (=> b!523487 (= e!305287 (Found!4475 (index!20108 lt!240192)))))

(assert (= (and d!80535 c!61646) b!523483))

(assert (= (and d!80535 (not c!61646)) b!523482))

(assert (= (and b!523482 c!61644) b!523487))

(assert (= (and b!523482 (not c!61644)) b!523486))

(assert (= (and b!523486 c!61645) b!523485))

(assert (= (and b!523486 (not c!61645)) b!523484))

(declare-fun m!504315 () Bool)

(assert (=> b!523482 m!504315))

(declare-fun m!504317 () Bool)

(assert (=> d!80535 m!504317))

(assert (=> d!80535 m!504165))

(assert (=> d!80535 m!504153))

(assert (=> d!80535 m!504187))

(declare-fun m!504319 () Bool)

(assert (=> d!80535 m!504319))

(declare-fun m!504321 () Bool)

(assert (=> d!80535 m!504321))

(assert (=> d!80535 m!504187))

(assert (=> d!80535 m!504153))

(declare-fun m!504323 () Bool)

(assert (=> d!80535 m!504323))

(assert (=> b!523484 m!504153))

(declare-fun m!504325 () Bool)

(assert (=> b!523484 m!504325))

(assert (=> b!523345 d!80535))

(declare-fun d!80537 () Bool)

(assert (=> d!80537 (= (validKeyInArray!0 (select (arr!16008 a!3235) j!176)) (and (not (= (select (arr!16008 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16008 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!523336 d!80537))

(declare-fun bm!31832 () Bool)

(declare-fun call!31835 () Bool)

(assert (=> bm!31832 (= call!31835 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!523511 () Bool)

(declare-fun e!305307 () Bool)

(assert (=> b!523511 (= e!305307 call!31835)))

(declare-fun b!523513 () Bool)

(declare-fun e!305306 () Bool)

(declare-fun e!305305 () Bool)

(assert (=> b!523513 (= e!305306 e!305305)))

(declare-fun c!61655 () Bool)

(assert (=> b!523513 (= c!61655 (validKeyInArray!0 (select (arr!16008 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!523514 () Bool)

(assert (=> b!523514 (= e!305305 call!31835)))

(declare-fun d!80539 () Bool)

(declare-fun res!320806 () Bool)

(assert (=> d!80539 (=> res!320806 e!305306)))

(assert (=> d!80539 (= res!320806 (bvsge #b00000000000000000000000000000000 (size!16372 a!3235)))))

(assert (=> d!80539 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!305306)))

(declare-fun b!523512 () Bool)

(assert (=> b!523512 (= e!305305 e!305307)))

(declare-fun lt!240211 () (_ BitVec 64))

(assert (=> b!523512 (= lt!240211 (select (arr!16008 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!240209 () Unit!16352)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33307 (_ BitVec 64) (_ BitVec 32)) Unit!16352)

(assert (=> b!523512 (= lt!240209 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!240211 #b00000000000000000000000000000000))))

(assert (=> b!523512 (arrayContainsKey!0 a!3235 lt!240211 #b00000000000000000000000000000000)))

(declare-fun lt!240210 () Unit!16352)

(assert (=> b!523512 (= lt!240210 lt!240209)))

(declare-fun res!320807 () Bool)

(assert (=> b!523512 (= res!320807 (= (seekEntryOrOpen!0 (select (arr!16008 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4475 #b00000000000000000000000000000000)))))

(assert (=> b!523512 (=> (not res!320807) (not e!305307))))

(assert (= (and d!80539 (not res!320806)) b!523513))

(assert (= (and b!523513 c!61655) b!523512))

(assert (= (and b!523513 (not c!61655)) b!523514))

(assert (= (and b!523512 res!320807) b!523511))

(assert (= (or b!523511 b!523514) bm!31832))

(declare-fun m!504331 () Bool)

(assert (=> bm!31832 m!504331))

(declare-fun m!504333 () Bool)

(assert (=> b!523513 m!504333))

(assert (=> b!523513 m!504333))

(declare-fun m!504335 () Bool)

(assert (=> b!523513 m!504335))

(assert (=> b!523512 m!504333))

(declare-fun m!504337 () Bool)

(assert (=> b!523512 m!504337))

(declare-fun m!504339 () Bool)

(assert (=> b!523512 m!504339))

(assert (=> b!523512 m!504333))

(declare-fun m!504341 () Bool)

(assert (=> b!523512 m!504341))

(assert (=> b!523341 d!80539))

(declare-fun d!80543 () Bool)

(declare-fun e!305322 () Bool)

(assert (=> d!80543 e!305322))

(declare-fun res!320816 () Bool)

(assert (=> d!80543 (=> (not res!320816) (not e!305322))))

(assert (=> d!80543 (= res!320816 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16372 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16372 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16372 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16372 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16372 a!3235))))))

(declare-fun lt!240226 () Unit!16352)

(declare-fun choose!47 (array!33307 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16352)

(assert (=> d!80543 (= lt!240226 (choose!47 a!3235 i!1204 k!2280 j!176 lt!240118 #b00000000000000000000000000000000 (index!20108 lt!240111) (x!49086 lt!240111) mask!3524))))

(assert (=> d!80543 (validMask!0 mask!3524)))

(assert (=> d!80543 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!240118 #b00000000000000000000000000000000 (index!20108 lt!240111) (x!49086 lt!240111) mask!3524) lt!240226)))

(declare-fun b!523535 () Bool)

(assert (=> b!523535 (= e!305322 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240118 (select (store (arr!16008 a!3235) i!1204 k!2280) j!176) (array!33308 (store (arr!16008 a!3235) i!1204 k!2280) (size!16372 a!3235)) mask!3524) (Intermediate!4475 false (index!20108 lt!240111) (x!49086 lt!240111))))))

(assert (= (and d!80543 res!320816) b!523535))

(declare-fun m!504369 () Bool)

(assert (=> d!80543 m!504369))

(assert (=> d!80543 m!504165))

(assert (=> b!523535 m!504175))

(assert (=> b!523535 m!504179))

(assert (=> b!523535 m!504179))

(declare-fun m!504371 () Bool)

(assert (=> b!523535 m!504371))

(assert (=> b!523337 d!80543))

(declare-fun b!523617 () Bool)

(declare-fun lt!240254 () SeekEntryResult!4475)

(assert (=> b!523617 (and (bvsge (index!20108 lt!240254) #b00000000000000000000000000000000) (bvslt (index!20108 lt!240254) (size!16372 lt!240115)))))

(declare-fun e!305374 () Bool)

(assert (=> b!523617 (= e!305374 (= (select (arr!16008 lt!240115) (index!20108 lt!240254)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!523618 () Bool)

(declare-fun e!305376 () SeekEntryResult!4475)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523618 (= e!305376 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240118 #b00000000000000000000000000000000 mask!3524) lt!240117 lt!240115 mask!3524))))

(declare-fun b!523619 () Bool)

(declare-fun e!305378 () SeekEntryResult!4475)

(assert (=> b!523619 (= e!305378 (Intermediate!4475 true lt!240118 #b00000000000000000000000000000000))))

(declare-fun d!80549 () Bool)

(declare-fun e!305375 () Bool)

(assert (=> d!80549 e!305375))

(declare-fun c!61687 () Bool)

(assert (=> d!80549 (= c!61687 (and (is-Intermediate!4475 lt!240254) (undefined!5287 lt!240254)))))

(assert (=> d!80549 (= lt!240254 e!305378)))

(declare-fun c!61688 () Bool)

(assert (=> d!80549 (= c!61688 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!240255 () (_ BitVec 64))

(assert (=> d!80549 (= lt!240255 (select (arr!16008 lt!240115) lt!240118))))

(assert (=> d!80549 (validMask!0 mask!3524)))

(assert (=> d!80549 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240118 lt!240117 lt!240115 mask!3524) lt!240254)))

(declare-fun b!523620 () Bool)

(assert (=> b!523620 (= e!305376 (Intermediate!4475 false lt!240118 #b00000000000000000000000000000000))))

(declare-fun b!523621 () Bool)

(assert (=> b!523621 (= e!305378 e!305376)))

(declare-fun c!61686 () Bool)

(assert (=> b!523621 (= c!61686 (or (= lt!240255 lt!240117) (= (bvadd lt!240255 lt!240255) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523622 () Bool)

(declare-fun e!305377 () Bool)

(assert (=> b!523622 (= e!305375 e!305377)))

(declare-fun res!320850 () Bool)

(assert (=> b!523622 (= res!320850 (and (is-Intermediate!4475 lt!240254) (not (undefined!5287 lt!240254)) (bvslt (x!49086 lt!240254) #b01111111111111111111111111111110) (bvsge (x!49086 lt!240254) #b00000000000000000000000000000000) (bvsge (x!49086 lt!240254) #b00000000000000000000000000000000)))))

(assert (=> b!523622 (=> (not res!320850) (not e!305377))))

(declare-fun b!523623 () Bool)

(assert (=> b!523623 (and (bvsge (index!20108 lt!240254) #b00000000000000000000000000000000) (bvslt (index!20108 lt!240254) (size!16372 lt!240115)))))

(declare-fun res!320851 () Bool)

(assert (=> b!523623 (= res!320851 (= (select (arr!16008 lt!240115) (index!20108 lt!240254)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!523623 (=> res!320851 e!305374)))

(declare-fun b!523624 () Bool)

(assert (=> b!523624 (and (bvsge (index!20108 lt!240254) #b00000000000000000000000000000000) (bvslt (index!20108 lt!240254) (size!16372 lt!240115)))))

(declare-fun res!320852 () Bool)

(assert (=> b!523624 (= res!320852 (= (select (arr!16008 lt!240115) (index!20108 lt!240254)) lt!240117))))

(assert (=> b!523624 (=> res!320852 e!305374)))

(assert (=> b!523624 (= e!305377 e!305374)))

(declare-fun b!523625 () Bool)

(assert (=> b!523625 (= e!305375 (bvsge (x!49086 lt!240254) #b01111111111111111111111111111110))))

(assert (= (and d!80549 c!61688) b!523619))

(assert (= (and d!80549 (not c!61688)) b!523621))

(assert (= (and b!523621 c!61686) b!523620))

(assert (= (and b!523621 (not c!61686)) b!523618))

(assert (= (and d!80549 c!61687) b!523625))

(assert (= (and d!80549 (not c!61687)) b!523622))

(assert (= (and b!523622 res!320850) b!523624))

(assert (= (and b!523624 (not res!320852)) b!523623))

(assert (= (and b!523623 (not res!320851)) b!523617))

(declare-fun m!504415 () Bool)

(assert (=> b!523618 m!504415))

(assert (=> b!523618 m!504415))

(declare-fun m!504417 () Bool)

(assert (=> b!523618 m!504417))

(declare-fun m!504419 () Bool)

(assert (=> b!523624 m!504419))

(assert (=> b!523623 m!504419))

(declare-fun m!504421 () Bool)

(assert (=> d!80549 m!504421))

(assert (=> d!80549 m!504165))

(assert (=> b!523617 m!504419))

(assert (=> b!523337 d!80549))

(declare-fun d!80571 () Bool)

(assert (=> d!80571 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!523342 d!80571))

(declare-fun d!80573 () Bool)

(declare-fun res!320858 () Bool)

(declare-fun e!305383 () Bool)

(assert (=> d!80573 (=> res!320858 e!305383)))

(assert (=> d!80573 (= res!320858 (= (select (arr!16008 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!80573 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!305383)))

(declare-fun b!523630 () Bool)

(declare-fun e!305384 () Bool)

(assert (=> b!523630 (= e!305383 e!305384)))

(declare-fun res!320859 () Bool)

(assert (=> b!523630 (=> (not res!320859) (not e!305384))))

(assert (=> b!523630 (= res!320859 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16372 a!3235)))))

(declare-fun b!523631 () Bool)

(assert (=> b!523631 (= e!305384 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80573 (not res!320858)) b!523630))

(assert (= (and b!523630 res!320859) b!523631))

(assert (=> d!80573 m!504333))

(declare-fun m!504423 () Bool)

(assert (=> b!523631 m!504423))

(assert (=> b!523339 d!80573))

(declare-fun d!80575 () Bool)

(declare-fun lt!240274 () (_ BitVec 32))

(declare-fun lt!240273 () (_ BitVec 32))

(assert (=> d!80575 (= lt!240274 (bvmul (bvxor lt!240273 (bvlshr lt!240273 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80575 (= lt!240273 ((_ extract 31 0) (bvand (bvxor lt!240117 (bvlshr lt!240117 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80575 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!320860 (let ((h!11091 ((_ extract 31 0) (bvand (bvxor lt!240117 (bvlshr lt!240117 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49095 (bvmul (bvxor h!11091 (bvlshr h!11091 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49095 (bvlshr x!49095 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!320860 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!320860 #b00000000000000000000000000000000))))))

(assert (=> d!80575 (= (toIndex!0 lt!240117 mask!3524) (bvand (bvxor lt!240274 (bvlshr lt!240274 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!523344 d!80575))

(declare-fun b!523645 () Bool)

(declare-fun lt!240275 () SeekEntryResult!4475)

(assert (=> b!523645 (and (bvsge (index!20108 lt!240275) #b00000000000000000000000000000000) (bvslt (index!20108 lt!240275) (size!16372 a!3235)))))

(declare-fun e!305393 () Bool)

(assert (=> b!523645 (= e!305393 (= (select (arr!16008 a!3235) (index!20108 lt!240275)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!305395 () SeekEntryResult!4475)

(declare-fun b!523646 () Bool)

(assert (=> b!523646 (= e!305395 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240118 #b00000000000000000000000000000000 mask!3524) (select (arr!16008 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!523647 () Bool)

(declare-fun e!305397 () SeekEntryResult!4475)

(assert (=> b!523647 (= e!305397 (Intermediate!4475 true lt!240118 #b00000000000000000000000000000000))))

(declare-fun d!80585 () Bool)

(declare-fun e!305394 () Bool)

(assert (=> d!80585 e!305394))

(declare-fun c!61694 () Bool)

(assert (=> d!80585 (= c!61694 (and (is-Intermediate!4475 lt!240275) (undefined!5287 lt!240275)))))

(assert (=> d!80585 (= lt!240275 e!305397)))

(declare-fun c!61695 () Bool)

(assert (=> d!80585 (= c!61695 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!240276 () (_ BitVec 64))

(assert (=> d!80585 (= lt!240276 (select (arr!16008 a!3235) lt!240118))))

(assert (=> d!80585 (validMask!0 mask!3524)))

(assert (=> d!80585 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240118 (select (arr!16008 a!3235) j!176) a!3235 mask!3524) lt!240275)))

(declare-fun b!523648 () Bool)

(assert (=> b!523648 (= e!305395 (Intermediate!4475 false lt!240118 #b00000000000000000000000000000000))))

(declare-fun b!523649 () Bool)

(assert (=> b!523649 (= e!305397 e!305395)))

(declare-fun c!61693 () Bool)

(assert (=> b!523649 (= c!61693 (or (= lt!240276 (select (arr!16008 a!3235) j!176)) (= (bvadd lt!240276 lt!240276) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523650 () Bool)

(declare-fun e!305396 () Bool)

(assert (=> b!523650 (= e!305394 e!305396)))

(declare-fun res!320866 () Bool)

(assert (=> b!523650 (= res!320866 (and (is-Intermediate!4475 lt!240275) (not (undefined!5287 lt!240275)) (bvslt (x!49086 lt!240275) #b01111111111111111111111111111110) (bvsge (x!49086 lt!240275) #b00000000000000000000000000000000) (bvsge (x!49086 lt!240275) #b00000000000000000000000000000000)))))

(assert (=> b!523650 (=> (not res!320866) (not e!305396))))

(declare-fun b!523651 () Bool)

(assert (=> b!523651 (and (bvsge (index!20108 lt!240275) #b00000000000000000000000000000000) (bvslt (index!20108 lt!240275) (size!16372 a!3235)))))

(declare-fun res!320867 () Bool)

(assert (=> b!523651 (= res!320867 (= (select (arr!16008 a!3235) (index!20108 lt!240275)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!523651 (=> res!320867 e!305393)))

(declare-fun b!523652 () Bool)

(assert (=> b!523652 (and (bvsge (index!20108 lt!240275) #b00000000000000000000000000000000) (bvslt (index!20108 lt!240275) (size!16372 a!3235)))))

(declare-fun res!320868 () Bool)

(assert (=> b!523652 (= res!320868 (= (select (arr!16008 a!3235) (index!20108 lt!240275)) (select (arr!16008 a!3235) j!176)))))

(assert (=> b!523652 (=> res!320868 e!305393)))

(assert (=> b!523652 (= e!305396 e!305393)))

(declare-fun b!523653 () Bool)

(assert (=> b!523653 (= e!305394 (bvsge (x!49086 lt!240275) #b01111111111111111111111111111110))))

(assert (= (and d!80585 c!61695) b!523647))

(assert (= (and d!80585 (not c!61695)) b!523649))

(assert (= (and b!523649 c!61693) b!523648))

(assert (= (and b!523649 (not c!61693)) b!523646))

(assert (= (and d!80585 c!61694) b!523653))

(assert (= (and d!80585 (not c!61694)) b!523650))

(assert (= (and b!523650 res!320866) b!523652))

(assert (= (and b!523652 (not res!320868)) b!523651))

(assert (= (and b!523651 (not res!320867)) b!523645))

(assert (=> b!523646 m!504415))

(assert (=> b!523646 m!504415))

(assert (=> b!523646 m!504153))

(declare-fun m!504437 () Bool)

(assert (=> b!523646 m!504437))

(declare-fun m!504439 () Bool)

(assert (=> b!523652 m!504439))

(assert (=> b!523651 m!504439))

(declare-fun m!504441 () Bool)

(assert (=> d!80585 m!504441))

(assert (=> d!80585 m!504165))

(assert (=> b!523645 m!504439))

(assert (=> b!523344 d!80585))

(declare-fun bm!31840 () Bool)

(declare-fun call!31843 () Bool)

(assert (=> bm!31840 (= call!31843 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!523654 () Bool)

(declare-fun e!305400 () Bool)

(assert (=> b!523654 (= e!305400 call!31843)))

(declare-fun b!523656 () Bool)

(declare-fun e!305399 () Bool)

(declare-fun e!305398 () Bool)

(assert (=> b!523656 (= e!305399 e!305398)))

(declare-fun c!61696 () Bool)

(assert (=> b!523656 (= c!61696 (validKeyInArray!0 (select (arr!16008 a!3235) j!176)))))

(declare-fun b!523657 () Bool)

(assert (=> b!523657 (= e!305398 call!31843)))

(declare-fun d!80587 () Bool)

(declare-fun res!320869 () Bool)

(assert (=> d!80587 (=> res!320869 e!305399)))

(assert (=> d!80587 (= res!320869 (bvsge j!176 (size!16372 a!3235)))))

(assert (=> d!80587 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!305399)))

(declare-fun b!523655 () Bool)

(assert (=> b!523655 (= e!305398 e!305400)))

(declare-fun lt!240279 () (_ BitVec 64))

(assert (=> b!523655 (= lt!240279 (select (arr!16008 a!3235) j!176))))

(declare-fun lt!240277 () Unit!16352)

(assert (=> b!523655 (= lt!240277 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!240279 j!176))))

(assert (=> b!523655 (arrayContainsKey!0 a!3235 lt!240279 #b00000000000000000000000000000000)))

(declare-fun lt!240278 () Unit!16352)

(assert (=> b!523655 (= lt!240278 lt!240277)))

(declare-fun res!320870 () Bool)

(assert (=> b!523655 (= res!320870 (= (seekEntryOrOpen!0 (select (arr!16008 a!3235) j!176) a!3235 mask!3524) (Found!4475 j!176)))))

(assert (=> b!523655 (=> (not res!320870) (not e!305400))))

(assert (= (and d!80587 (not res!320869)) b!523656))

(assert (= (and b!523656 c!61696) b!523655))

(assert (= (and b!523656 (not c!61696)) b!523657))

(assert (= (and b!523655 res!320870) b!523654))

(assert (= (or b!523654 b!523657) bm!31840))

(declare-fun m!504443 () Bool)

(assert (=> bm!31840 m!504443))

(assert (=> b!523656 m!504153))

(assert (=> b!523656 m!504153))

(assert (=> b!523656 m!504155))

(assert (=> b!523655 m!504153))

(declare-fun m!504445 () Bool)

(assert (=> b!523655 m!504445))

(declare-fun m!504447 () Bool)

(assert (=> b!523655 m!504447))

(assert (=> b!523655 m!504153))

(assert (=> b!523655 m!504159))

(assert (=> b!523344 d!80587))

(declare-fun d!80589 () Bool)

(assert (=> d!80589 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!240292 () Unit!16352)

(declare-fun choose!38 (array!33307 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16352)

(assert (=> d!80589 (= lt!240292 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80589 (validMask!0 mask!3524)))

(assert (=> d!80589 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!240292)))

(declare-fun bs!16451 () Bool)

(assert (= bs!16451 d!80589))

(assert (=> bs!16451 m!504189))

(declare-fun m!504465 () Bool)

(assert (=> bs!16451 m!504465))

(assert (=> bs!16451 m!504165))

(assert (=> b!523344 d!80589))

(declare-fun b!523688 () Bool)

(declare-fun lt!240293 () SeekEntryResult!4475)

(assert (=> b!523688 (and (bvsge (index!20108 lt!240293) #b00000000000000000000000000000000) (bvslt (index!20108 lt!240293) (size!16372 lt!240115)))))

(declare-fun e!305420 () Bool)

(assert (=> b!523688 (= e!305420 (= (select (arr!16008 lt!240115) (index!20108 lt!240293)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!305422 () SeekEntryResult!4475)

(declare-fun b!523689 () Bool)

(assert (=> b!523689 (= e!305422 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240110 #b00000000000000000000000000000000 mask!3524) lt!240117 lt!240115 mask!3524))))

(declare-fun b!523690 () Bool)

(declare-fun e!305424 () SeekEntryResult!4475)

(assert (=> b!523690 (= e!305424 (Intermediate!4475 true lt!240110 #b00000000000000000000000000000000))))

(declare-fun d!80595 () Bool)

(declare-fun e!305421 () Bool)

(assert (=> d!80595 e!305421))

(declare-fun c!61707 () Bool)

(assert (=> d!80595 (= c!61707 (and (is-Intermediate!4475 lt!240293) (undefined!5287 lt!240293)))))

(assert (=> d!80595 (= lt!240293 e!305424)))

(declare-fun c!61708 () Bool)

(assert (=> d!80595 (= c!61708 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!240294 () (_ BitVec 64))

(assert (=> d!80595 (= lt!240294 (select (arr!16008 lt!240115) lt!240110))))

(assert (=> d!80595 (validMask!0 mask!3524)))

(assert (=> d!80595 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240110 lt!240117 lt!240115 mask!3524) lt!240293)))

(declare-fun b!523691 () Bool)

(assert (=> b!523691 (= e!305422 (Intermediate!4475 false lt!240110 #b00000000000000000000000000000000))))

(declare-fun b!523692 () Bool)

(assert (=> b!523692 (= e!305424 e!305422)))

(declare-fun c!61706 () Bool)

(assert (=> b!523692 (= c!61706 (or (= lt!240294 lt!240117) (= (bvadd lt!240294 lt!240294) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523693 () Bool)

(declare-fun e!305423 () Bool)

(assert (=> b!523693 (= e!305421 e!305423)))

(declare-fun res!320883 () Bool)

(assert (=> b!523693 (= res!320883 (and (is-Intermediate!4475 lt!240293) (not (undefined!5287 lt!240293)) (bvslt (x!49086 lt!240293) #b01111111111111111111111111111110) (bvsge (x!49086 lt!240293) #b00000000000000000000000000000000) (bvsge (x!49086 lt!240293) #b00000000000000000000000000000000)))))

(assert (=> b!523693 (=> (not res!320883) (not e!305423))))

(declare-fun b!523694 () Bool)

(assert (=> b!523694 (and (bvsge (index!20108 lt!240293) #b00000000000000000000000000000000) (bvslt (index!20108 lt!240293) (size!16372 lt!240115)))))

(declare-fun res!320884 () Bool)

(assert (=> b!523694 (= res!320884 (= (select (arr!16008 lt!240115) (index!20108 lt!240293)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!523694 (=> res!320884 e!305420)))

(declare-fun b!523695 () Bool)

(assert (=> b!523695 (and (bvsge (index!20108 lt!240293) #b00000000000000000000000000000000) (bvslt (index!20108 lt!240293) (size!16372 lt!240115)))))

(declare-fun res!320885 () Bool)

(assert (=> b!523695 (= res!320885 (= (select (arr!16008 lt!240115) (index!20108 lt!240293)) lt!240117))))

(assert (=> b!523695 (=> res!320885 e!305420)))

(assert (=> b!523695 (= e!305423 e!305420)))

(declare-fun b!523696 () Bool)

(assert (=> b!523696 (= e!305421 (bvsge (x!49086 lt!240293) #b01111111111111111111111111111110))))

(assert (= (and d!80595 c!61708) b!523690))

(assert (= (and d!80595 (not c!61708)) b!523692))

(assert (= (and b!523692 c!61706) b!523691))

(assert (= (and b!523692 (not c!61706)) b!523689))

(assert (= (and d!80595 c!61707) b!523696))

(assert (= (and d!80595 (not c!61707)) b!523693))

(assert (= (and b!523693 res!320883) b!523695))

(assert (= (and b!523695 (not res!320885)) b!523694))

(assert (= (and b!523694 (not res!320884)) b!523688))

(declare-fun m!504467 () Bool)

(assert (=> b!523689 m!504467))

(assert (=> b!523689 m!504467))

(declare-fun m!504469 () Bool)

(assert (=> b!523689 m!504469))

(declare-fun m!504471 () Bool)

(assert (=> b!523695 m!504471))

(assert (=> b!523694 m!504471))

(declare-fun m!504473 () Bool)

(assert (=> d!80595 m!504473))

(assert (=> d!80595 m!504165))

(assert (=> b!523688 m!504471))

(assert (=> b!523344 d!80595))

(declare-fun d!80597 () Bool)

(declare-fun lt!240296 () (_ BitVec 32))

(declare-fun lt!240295 () (_ BitVec 32))

(assert (=> d!80597 (= lt!240296 (bvmul (bvxor lt!240295 (bvlshr lt!240295 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80597 (= lt!240295 ((_ extract 31 0) (bvand (bvxor (select (arr!16008 a!3235) j!176) (bvlshr (select (arr!16008 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80597 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!320860 (let ((h!11091 ((_ extract 31 0) (bvand (bvxor (select (arr!16008 a!3235) j!176) (bvlshr (select (arr!16008 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49095 (bvmul (bvxor h!11091 (bvlshr h!11091 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49095 (bvlshr x!49095 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!320860 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!320860 #b00000000000000000000000000000000))))))

(assert (=> d!80597 (= (toIndex!0 (select (arr!16008 a!3235) j!176) mask!3524) (bvand (bvxor lt!240296 (bvlshr lt!240296 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!523344 d!80597))

(declare-fun d!80599 () Bool)

(assert (=> d!80599 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47544 d!80599))

(declare-fun d!80603 () Bool)

(assert (=> d!80603 (= (array_inv!11804 a!3235) (bvsge (size!16372 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47544 d!80603))

(declare-fun d!80605 () Bool)

(declare-fun res!320898 () Bool)

(declare-fun e!305439 () Bool)

(assert (=> d!80605 (=> res!320898 e!305439)))

(assert (=> d!80605 (= res!320898 (bvsge #b00000000000000000000000000000000 (size!16372 a!3235)))))

(assert (=> d!80605 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10163) e!305439)))

(declare-fun b!523716 () Bool)

(declare-fun e!305440 () Bool)

(declare-fun contains!2768 (List!10166 (_ BitVec 64)) Bool)

(assert (=> b!523716 (= e!305440 (contains!2768 Nil!10163 (select (arr!16008 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!523717 () Bool)

(declare-fun e!305438 () Bool)

(assert (=> b!523717 (= e!305439 e!305438)))

(declare-fun res!320897 () Bool)

(assert (=> b!523717 (=> (not res!320897) (not e!305438))))

(assert (=> b!523717 (= res!320897 (not e!305440))))

(declare-fun res!320896 () Bool)

(assert (=> b!523717 (=> (not res!320896) (not e!305440))))

(assert (=> b!523717 (= res!320896 (validKeyInArray!0 (select (arr!16008 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31843 () Bool)

(declare-fun call!31846 () Bool)

(declare-fun c!61714 () Bool)

(assert (=> bm!31843 (= call!31846 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61714 (Cons!10162 (select (arr!16008 a!3235) #b00000000000000000000000000000000) Nil!10163) Nil!10163)))))

(declare-fun b!523718 () Bool)

(declare-fun e!305441 () Bool)

(assert (=> b!523718 (= e!305441 call!31846)))

(declare-fun b!523719 () Bool)

(assert (=> b!523719 (= e!305441 call!31846)))

(declare-fun b!523720 () Bool)

(assert (=> b!523720 (= e!305438 e!305441)))

(assert (=> b!523720 (= c!61714 (validKeyInArray!0 (select (arr!16008 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80605 (not res!320898)) b!523717))

(assert (= (and b!523717 res!320896) b!523716))

(assert (= (and b!523717 res!320897) b!523720))

(assert (= (and b!523720 c!61714) b!523718))

(assert (= (and b!523720 (not c!61714)) b!523719))

(assert (= (or b!523718 b!523719) bm!31843))

(assert (=> b!523716 m!504333))

(assert (=> b!523716 m!504333))

(declare-fun m!504483 () Bool)

(assert (=> b!523716 m!504483))

(assert (=> b!523717 m!504333))

(assert (=> b!523717 m!504333))

(assert (=> b!523717 m!504335))

(assert (=> bm!31843 m!504333))

(declare-fun m!504485 () Bool)

(assert (=> bm!31843 m!504485))

(assert (=> b!523720 m!504333))

(assert (=> b!523720 m!504333))

(assert (=> b!523720 m!504335))

(assert (=> b!523338 d!80605))

(push 1)

(assert (not d!80535))

(assert (not b!523716))

(assert (not b!523535))

(assert (not d!80549))

(assert (not b!523717))

(assert (not b!523646))

(assert (not d!80589))

(assert (not bm!31843))

(assert (not d!80543))

(assert (not b!523513))

(assert (not bm!31832))

(assert (not d!80523))

(assert (not b!523484))

(assert (not d!80595))

(assert (not d!80585))

(assert (not b!523618))

(assert (not b!523631))

(assert (not bm!31840))

(assert (not b!523655))

(assert (not b!523720))

(assert (not b!523656))

(assert (not b!523512))

(assert (not b!523689))

(assert (not b!523478))

(check-sat)

(pop 1)

(push 1)

(check-sat)

