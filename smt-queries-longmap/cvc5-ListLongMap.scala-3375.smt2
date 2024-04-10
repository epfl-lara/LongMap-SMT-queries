; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46482 () Bool)

(assert start!46482)

(declare-fun b!513914 () Bool)

(declare-fun e!300092 () Bool)

(declare-fun e!300093 () Bool)

(assert (=> b!513914 (= e!300092 e!300093)))

(declare-fun res!314027 () Bool)

(assert (=> b!513914 (=> (not res!314027) (not e!300093))))

(declare-datatypes ((SeekEntryResult!4322 0))(
  ( (MissingZero!4322 (index!19476 (_ BitVec 32))) (Found!4322 (index!19477 (_ BitVec 32))) (Intermediate!4322 (undefined!5134 Bool) (index!19478 (_ BitVec 32)) (x!48435 (_ BitVec 32))) (Undefined!4322) (MissingVacant!4322 (index!19479 (_ BitVec 32))) )
))
(declare-fun lt!235282 () SeekEntryResult!4322)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!513914 (= res!314027 (or (= lt!235282 (MissingZero!4322 i!1204)) (= lt!235282 (MissingVacant!4322 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32965 0))(
  ( (array!32966 (arr!15855 (Array (_ BitVec 32) (_ BitVec 64))) (size!16219 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32965)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32965 (_ BitVec 32)) SeekEntryResult!4322)

(assert (=> b!513914 (= lt!235282 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!513915 () Bool)

(declare-fun res!314033 () Bool)

(assert (=> b!513915 (=> (not res!314033) (not e!300093))))

(declare-datatypes ((List!10013 0))(
  ( (Nil!10010) (Cons!10009 (h!10898 (_ BitVec 64)) (t!16241 List!10013)) )
))
(declare-fun arrayNoDuplicates!0 (array!32965 (_ BitVec 32) List!10013) Bool)

(assert (=> b!513915 (= res!314033 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10010))))

(declare-fun b!513916 () Bool)

(declare-fun res!314029 () Bool)

(declare-fun e!300094 () Bool)

(assert (=> b!513916 (=> res!314029 e!300094)))

(declare-fun lt!235281 () SeekEntryResult!4322)

(assert (=> b!513916 (= res!314029 (or (undefined!5134 lt!235281) (not (is-Intermediate!4322 lt!235281))))))

(declare-fun b!513917 () Bool)

(declare-fun res!314031 () Bool)

(assert (=> b!513917 (=> (not res!314031) (not e!300092))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!513917 (= res!314031 (validKeyInArray!0 (select (arr!15855 a!3235) j!176)))))

(declare-fun b!513918 () Bool)

(assert (=> b!513918 (= e!300094 (or (= (select (arr!15855 a!3235) (index!19478 lt!235281)) (select (arr!15855 a!3235) j!176)) (= (select (arr!15855 a!3235) (index!19478 lt!235281)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (bvsge (index!19478 lt!235281) #b00000000000000000000000000000000) (bvslt (index!19478 lt!235281) (size!16219 a!3235)))))))

(assert (=> b!513918 (bvslt (x!48435 lt!235281) #b01111111111111111111111111111110)))

(declare-fun b!513919 () Bool)

(assert (=> b!513919 (= e!300093 (not e!300094))))

(declare-fun res!314034 () Bool)

(assert (=> b!513919 (=> res!314034 e!300094)))

(declare-fun lt!235280 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32965 (_ BitVec 32)) SeekEntryResult!4322)

(assert (=> b!513919 (= res!314034 (= lt!235281 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235280 (select (store (arr!15855 a!3235) i!1204 k!2280) j!176) (array!32966 (store (arr!15855 a!3235) i!1204 k!2280) (size!16219 a!3235)) mask!3524)))))

(declare-fun lt!235279 () (_ BitVec 32))

(assert (=> b!513919 (= lt!235281 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235279 (select (arr!15855 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513919 (= lt!235280 (toIndex!0 (select (store (arr!15855 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!513919 (= lt!235279 (toIndex!0 (select (arr!15855 a!3235) j!176) mask!3524))))

(declare-fun e!300096 () Bool)

(assert (=> b!513919 e!300096))

(declare-fun res!314028 () Bool)

(assert (=> b!513919 (=> (not res!314028) (not e!300096))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32965 (_ BitVec 32)) Bool)

(assert (=> b!513919 (= res!314028 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15902 0))(
  ( (Unit!15903) )
))
(declare-fun lt!235278 () Unit!15902)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32965 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15902)

(assert (=> b!513919 (= lt!235278 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!513920 () Bool)

(assert (=> b!513920 (= e!300096 (= (seekEntryOrOpen!0 (select (arr!15855 a!3235) j!176) a!3235 mask!3524) (Found!4322 j!176)))))

(declare-fun b!513921 () Bool)

(declare-fun res!314035 () Bool)

(assert (=> b!513921 (=> (not res!314035) (not e!300092))))

(assert (=> b!513921 (= res!314035 (and (= (size!16219 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16219 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16219 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!314026 () Bool)

(assert (=> start!46482 (=> (not res!314026) (not e!300092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46482 (= res!314026 (validMask!0 mask!3524))))

(assert (=> start!46482 e!300092))

(assert (=> start!46482 true))

(declare-fun array_inv!11651 (array!32965) Bool)

(assert (=> start!46482 (array_inv!11651 a!3235)))

(declare-fun b!513913 () Bool)

(declare-fun res!314036 () Bool)

(assert (=> b!513913 (=> (not res!314036) (not e!300092))))

(declare-fun arrayContainsKey!0 (array!32965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!513913 (= res!314036 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!513922 () Bool)

(declare-fun res!314030 () Bool)

(assert (=> b!513922 (=> (not res!314030) (not e!300093))))

(assert (=> b!513922 (= res!314030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!513923 () Bool)

(declare-fun res!314032 () Bool)

(assert (=> b!513923 (=> (not res!314032) (not e!300092))))

(assert (=> b!513923 (= res!314032 (validKeyInArray!0 k!2280))))

(assert (= (and start!46482 res!314026) b!513921))

(assert (= (and b!513921 res!314035) b!513917))

(assert (= (and b!513917 res!314031) b!513923))

(assert (= (and b!513923 res!314032) b!513913))

(assert (= (and b!513913 res!314036) b!513914))

(assert (= (and b!513914 res!314027) b!513922))

(assert (= (and b!513922 res!314030) b!513915))

(assert (= (and b!513915 res!314033) b!513919))

(assert (= (and b!513919 res!314028) b!513920))

(assert (= (and b!513919 (not res!314034)) b!513916))

(assert (= (and b!513916 (not res!314029)) b!513918))

(declare-fun m!495411 () Bool)

(assert (=> b!513918 m!495411))

(declare-fun m!495413 () Bool)

(assert (=> b!513918 m!495413))

(declare-fun m!495415 () Bool)

(assert (=> b!513923 m!495415))

(assert (=> b!513920 m!495413))

(assert (=> b!513920 m!495413))

(declare-fun m!495417 () Bool)

(assert (=> b!513920 m!495417))

(declare-fun m!495419 () Bool)

(assert (=> b!513913 m!495419))

(assert (=> b!513917 m!495413))

(assert (=> b!513917 m!495413))

(declare-fun m!495421 () Bool)

(assert (=> b!513917 m!495421))

(declare-fun m!495423 () Bool)

(assert (=> b!513914 m!495423))

(declare-fun m!495425 () Bool)

(assert (=> b!513915 m!495425))

(declare-fun m!495427 () Bool)

(assert (=> start!46482 m!495427))

(declare-fun m!495429 () Bool)

(assert (=> start!46482 m!495429))

(declare-fun m!495431 () Bool)

(assert (=> b!513919 m!495431))

(declare-fun m!495433 () Bool)

(assert (=> b!513919 m!495433))

(declare-fun m!495435 () Bool)

(assert (=> b!513919 m!495435))

(assert (=> b!513919 m!495435))

(declare-fun m!495437 () Bool)

(assert (=> b!513919 m!495437))

(assert (=> b!513919 m!495413))

(declare-fun m!495439 () Bool)

(assert (=> b!513919 m!495439))

(assert (=> b!513919 m!495413))

(declare-fun m!495441 () Bool)

(assert (=> b!513919 m!495441))

(assert (=> b!513919 m!495413))

(declare-fun m!495443 () Bool)

(assert (=> b!513919 m!495443))

(assert (=> b!513919 m!495435))

(declare-fun m!495445 () Bool)

(assert (=> b!513919 m!495445))

(declare-fun m!495447 () Bool)

(assert (=> b!513922 m!495447))

(push 1)

(assert (not b!513914))

(assert (not start!46482))

(assert (not b!513915))

(assert (not b!513920))

(assert (not b!513919))

(assert (not b!513923))

(assert (not b!513913))

(assert (not b!513917))

(assert (not b!513922))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79275 () Bool)

(assert (=> d!79275 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513923 d!79275))

(declare-fun d!79279 () Bool)

(assert (=> d!79279 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46482 d!79279))

(declare-fun d!79285 () Bool)

(assert (=> d!79285 (= (array_inv!11651 a!3235) (bvsge (size!16219 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46482 d!79285))

(declare-fun d!79289 () Bool)

(assert (=> d!79289 (= (validKeyInArray!0 (select (arr!15855 a!3235) j!176)) (and (not (= (select (arr!15855 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15855 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513917 d!79289))

(declare-fun b!514059 () Bool)

(declare-fun e!300175 () Bool)

(declare-fun e!300174 () Bool)

(assert (=> b!514059 (= e!300175 e!300174)))

(declare-fun c!60250 () Bool)

(assert (=> b!514059 (= c!60250 (validKeyInArray!0 (select (arr!15855 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79291 () Bool)

(declare-fun res!314129 () Bool)

(assert (=> d!79291 (=> res!314129 e!300175)))

(assert (=> d!79291 (= res!314129 (bvsge #b00000000000000000000000000000000 (size!16219 a!3235)))))

(assert (=> d!79291 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!300175)))

(declare-fun bm!31583 () Bool)

(declare-fun call!31586 () Bool)

(assert (=> bm!31583 (= call!31586 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!514060 () Bool)

(assert (=> b!514060 (= e!300174 call!31586)))

(declare-fun b!514061 () Bool)

(declare-fun e!300176 () Bool)

(assert (=> b!514061 (= e!300174 e!300176)))

(declare-fun lt!235346 () (_ BitVec 64))

(assert (=> b!514061 (= lt!235346 (select (arr!15855 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!235344 () Unit!15902)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32965 (_ BitVec 64) (_ BitVec 32)) Unit!15902)

(assert (=> b!514061 (= lt!235344 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235346 #b00000000000000000000000000000000))))

(assert (=> b!514061 (arrayContainsKey!0 a!3235 lt!235346 #b00000000000000000000000000000000)))

(declare-fun lt!235345 () Unit!15902)

(assert (=> b!514061 (= lt!235345 lt!235344)))

(declare-fun res!314130 () Bool)

(assert (=> b!514061 (= res!314130 (= (seekEntryOrOpen!0 (select (arr!15855 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4322 #b00000000000000000000000000000000)))))

(assert (=> b!514061 (=> (not res!314130) (not e!300176))))

(declare-fun b!514062 () Bool)

(assert (=> b!514062 (= e!300176 call!31586)))

(assert (= (and d!79291 (not res!314129)) b!514059))

(assert (= (and b!514059 c!60250) b!514061))

(assert (= (and b!514059 (not c!60250)) b!514060))

(assert (= (and b!514061 res!314130) b!514062))

(assert (= (or b!514062 b!514060) bm!31583))

(declare-fun m!495569 () Bool)

(assert (=> b!514059 m!495569))

(assert (=> b!514059 m!495569))

(declare-fun m!495571 () Bool)

(assert (=> b!514059 m!495571))

(declare-fun m!495573 () Bool)

(assert (=> bm!31583 m!495573))

(assert (=> b!514061 m!495569))

(declare-fun m!495575 () Bool)

(assert (=> b!514061 m!495575))

(declare-fun m!495577 () Bool)

(assert (=> b!514061 m!495577))

(assert (=> b!514061 m!495569))

(declare-fun m!495579 () Bool)

(assert (=> b!514061 m!495579))

(assert (=> b!513922 d!79291))

(declare-fun d!79299 () Bool)

(declare-fun lt!235363 () (_ BitVec 32))

(declare-fun lt!235362 () (_ BitVec 32))

(assert (=> d!79299 (= lt!235363 (bvmul (bvxor lt!235362 (bvlshr lt!235362 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79299 (= lt!235362 ((_ extract 31 0) (bvand (bvxor (select (arr!15855 a!3235) j!176) (bvlshr (select (arr!15855 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79299 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314131 (let ((h!10902 ((_ extract 31 0) (bvand (bvxor (select (arr!15855 a!3235) j!176) (bvlshr (select (arr!15855 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48439 (bvmul (bvxor h!10902 (bvlshr h!10902 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48439 (bvlshr x!48439 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314131 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314131 #b00000000000000000000000000000000))))))

(assert (=> d!79299 (= (toIndex!0 (select (arr!15855 a!3235) j!176) mask!3524) (bvand (bvxor lt!235363 (bvlshr lt!235363 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513919 d!79299))

(declare-fun b!514077 () Bool)

(declare-fun e!300185 () Bool)

(declare-fun e!300184 () Bool)

(assert (=> b!514077 (= e!300185 e!300184)))

(declare-fun c!60258 () Bool)

(assert (=> b!514077 (= c!60258 (validKeyInArray!0 (select (arr!15855 a!3235) j!176)))))

(declare-fun d!79305 () Bool)

(declare-fun res!314132 () Bool)

(assert (=> d!79305 (=> res!314132 e!300185)))

(assert (=> d!79305 (= res!314132 (bvsge j!176 (size!16219 a!3235)))))

(assert (=> d!79305 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!300185)))

(declare-fun bm!31584 () Bool)

(declare-fun call!31587 () Bool)

(assert (=> bm!31584 (= call!31587 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!514078 () Bool)

(assert (=> b!514078 (= e!300184 call!31587)))

(declare-fun b!514079 () Bool)

(declare-fun e!300186 () Bool)

(assert (=> b!514079 (= e!300184 e!300186)))

(declare-fun lt!235366 () (_ BitVec 64))

(assert (=> b!514079 (= lt!235366 (select (arr!15855 a!3235) j!176))))

(declare-fun lt!235364 () Unit!15902)

(assert (=> b!514079 (= lt!235364 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235366 j!176))))

(assert (=> b!514079 (arrayContainsKey!0 a!3235 lt!235366 #b00000000000000000000000000000000)))

(declare-fun lt!235365 () Unit!15902)

(assert (=> b!514079 (= lt!235365 lt!235364)))

(declare-fun res!314133 () Bool)

(assert (=> b!514079 (= res!314133 (= (seekEntryOrOpen!0 (select (arr!15855 a!3235) j!176) a!3235 mask!3524) (Found!4322 j!176)))))

(assert (=> b!514079 (=> (not res!314133) (not e!300186))))

(declare-fun b!514080 () Bool)

(assert (=> b!514080 (= e!300186 call!31587)))

(assert (= (and d!79305 (not res!314132)) b!514077))

(assert (= (and b!514077 c!60258) b!514079))

(assert (= (and b!514077 (not c!60258)) b!514078))

(assert (= (and b!514079 res!314133) b!514080))

(assert (= (or b!514080 b!514078) bm!31584))

(assert (=> b!514077 m!495413))

(assert (=> b!514077 m!495413))

(assert (=> b!514077 m!495421))

(declare-fun m!495593 () Bool)

(assert (=> bm!31584 m!495593))

(assert (=> b!514079 m!495413))

(declare-fun m!495595 () Bool)

(assert (=> b!514079 m!495595))

(declare-fun m!495597 () Bool)

(assert (=> b!514079 m!495597))

(assert (=> b!514079 m!495413))

(assert (=> b!514079 m!495417))

(assert (=> b!513919 d!79305))

(declare-fun b!514138 () Bool)

(declare-fun e!300225 () SeekEntryResult!4322)

(declare-fun e!300222 () SeekEntryResult!4322)

(assert (=> b!514138 (= e!300225 e!300222)))

(declare-fun lt!235387 () (_ BitVec 64))

(declare-fun c!60279 () Bool)

(assert (=> b!514138 (= c!60279 (or (= lt!235387 (select (store (arr!15855 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!235387 lt!235387) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514139 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514139 (= e!300222 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235280 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15855 a!3235) i!1204 k!2280) j!176) (array!32966 (store (arr!15855 a!3235) i!1204 k!2280) (size!16219 a!3235)) mask!3524))))

(declare-fun d!79307 () Bool)

(declare-fun e!300224 () Bool)

(assert (=> d!79307 e!300224))

(declare-fun c!60278 () Bool)

(declare-fun lt!235386 () SeekEntryResult!4322)

(assert (=> d!79307 (= c!60278 (and (is-Intermediate!4322 lt!235386) (undefined!5134 lt!235386)))))

(assert (=> d!79307 (= lt!235386 e!300225)))

(declare-fun c!60277 () Bool)

(assert (=> d!79307 (= c!60277 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79307 (= lt!235387 (select (arr!15855 (array!32966 (store (arr!15855 a!3235) i!1204 k!2280) (size!16219 a!3235))) lt!235280))))

(assert (=> d!79307 (validMask!0 mask!3524)))

(assert (=> d!79307 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235280 (select (store (arr!15855 a!3235) i!1204 k!2280) j!176) (array!32966 (store (arr!15855 a!3235) i!1204 k!2280) (size!16219 a!3235)) mask!3524) lt!235386)))

(declare-fun b!514140 () Bool)

(assert (=> b!514140 (and (bvsge (index!19478 lt!235386) #b00000000000000000000000000000000) (bvslt (index!19478 lt!235386) (size!16219 (array!32966 (store (arr!15855 a!3235) i!1204 k!2280) (size!16219 a!3235)))))))

(declare-fun e!300223 () Bool)

(assert (=> b!514140 (= e!300223 (= (select (arr!15855 (array!32966 (store (arr!15855 a!3235) i!1204 k!2280) (size!16219 a!3235))) (index!19478 lt!235386)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!514141 () Bool)

(assert (=> b!514141 (= e!300224 (bvsge (x!48435 lt!235386) #b01111111111111111111111111111110))))

(declare-fun b!514142 () Bool)

(assert (=> b!514142 (and (bvsge (index!19478 lt!235386) #b00000000000000000000000000000000) (bvslt (index!19478 lt!235386) (size!16219 (array!32966 (store (arr!15855 a!3235) i!1204 k!2280) (size!16219 a!3235)))))))

(declare-fun res!314157 () Bool)

(assert (=> b!514142 (= res!314157 (= (select (arr!15855 (array!32966 (store (arr!15855 a!3235) i!1204 k!2280) (size!16219 a!3235))) (index!19478 lt!235386)) (select (store (arr!15855 a!3235) i!1204 k!2280) j!176)))))

(assert (=> b!514142 (=> res!314157 e!300223)))

(declare-fun e!300221 () Bool)

(assert (=> b!514142 (= e!300221 e!300223)))

(declare-fun b!514143 () Bool)

(assert (=> b!514143 (= e!300222 (Intermediate!4322 false lt!235280 #b00000000000000000000000000000000))))

(declare-fun b!514144 () Bool)

(assert (=> b!514144 (= e!300224 e!300221)))

(declare-fun res!314156 () Bool)

(assert (=> b!514144 (= res!314156 (and (is-Intermediate!4322 lt!235386) (not (undefined!5134 lt!235386)) (bvslt (x!48435 lt!235386) #b01111111111111111111111111111110) (bvsge (x!48435 lt!235386) #b00000000000000000000000000000000) (bvsge (x!48435 lt!235386) #b00000000000000000000000000000000)))))

(assert (=> b!514144 (=> (not res!314156) (not e!300221))))

(declare-fun b!514145 () Bool)

(assert (=> b!514145 (= e!300225 (Intermediate!4322 true lt!235280 #b00000000000000000000000000000000))))

(declare-fun b!514146 () Bool)

(assert (=> b!514146 (and (bvsge (index!19478 lt!235386) #b00000000000000000000000000000000) (bvslt (index!19478 lt!235386) (size!16219 (array!32966 (store (arr!15855 a!3235) i!1204 k!2280) (size!16219 a!3235)))))))

(declare-fun res!314155 () Bool)

(assert (=> b!514146 (= res!314155 (= (select (arr!15855 (array!32966 (store (arr!15855 a!3235) i!1204 k!2280) (size!16219 a!3235))) (index!19478 lt!235386)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514146 (=> res!314155 e!300223)))

(assert (= (and d!79307 c!60277) b!514145))

(assert (= (and d!79307 (not c!60277)) b!514138))

(assert (= (and b!514138 c!60279) b!514143))

(assert (= (and b!514138 (not c!60279)) b!514139))

(assert (= (and d!79307 c!60278) b!514141))

(assert (= (and d!79307 (not c!60278)) b!514144))

(assert (= (and b!514144 res!314156) b!514142))

(assert (= (and b!514142 (not res!314157)) b!514146))

(assert (= (and b!514146 (not res!314155)) b!514140))

(declare-fun m!495619 () Bool)

(assert (=> b!514146 m!495619))

(assert (=> b!514140 m!495619))

(assert (=> b!514142 m!495619))

(declare-fun m!495621 () Bool)

(assert (=> b!514139 m!495621))

(assert (=> b!514139 m!495621))

(assert (=> b!514139 m!495435))

(declare-fun m!495623 () Bool)

(assert (=> b!514139 m!495623))

(declare-fun m!495625 () Bool)

(assert (=> d!79307 m!495625))

(assert (=> d!79307 m!495427))

(assert (=> b!513919 d!79307))

(declare-fun d!79319 () Bool)

(assert (=> d!79319 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!235406 () Unit!15902)

(declare-fun choose!38 (array!32965 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15902)

(assert (=> d!79319 (= lt!235406 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79319 (validMask!0 mask!3524)))

(assert (=> d!79319 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!235406)))

(declare-fun bs!16262 () Bool)

(assert (= bs!16262 d!79319))

(assert (=> bs!16262 m!495443))

(declare-fun m!495643 () Bool)

(assert (=> bs!16262 m!495643))

(assert (=> bs!16262 m!495427))

(assert (=> b!513919 d!79319))

(declare-fun d!79329 () Bool)

(declare-fun lt!235408 () (_ BitVec 32))

(declare-fun lt!235407 () (_ BitVec 32))

(assert (=> d!79329 (= lt!235408 (bvmul (bvxor lt!235407 (bvlshr lt!235407 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79329 (= lt!235407 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15855 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15855 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79329 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314131 (let ((h!10902 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15855 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15855 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48439 (bvmul (bvxor h!10902 (bvlshr h!10902 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48439 (bvlshr x!48439 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314131 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314131 #b00000000000000000000000000000000))))))

(assert (=> d!79329 (= (toIndex!0 (select (store (arr!15855 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!235408 (bvlshr lt!235408 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513919 d!79329))

(declare-fun b!514160 () Bool)

(declare-fun e!300238 () SeekEntryResult!4322)

(declare-fun e!300235 () SeekEntryResult!4322)

(assert (=> b!514160 (= e!300238 e!300235)))

(declare-fun c!60286 () Bool)

(declare-fun lt!235410 () (_ BitVec 64))

(assert (=> b!514160 (= c!60286 (or (= lt!235410 (select (arr!15855 a!3235) j!176)) (= (bvadd lt!235410 lt!235410) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514161 () Bool)

(assert (=> b!514161 (= e!300235 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235279 #b00000000000000000000000000000000 mask!3524) (select (arr!15855 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!79331 () Bool)

(declare-fun e!300237 () Bool)

(assert (=> d!79331 e!300237))

(declare-fun c!60285 () Bool)

(declare-fun lt!235409 () SeekEntryResult!4322)

(assert (=> d!79331 (= c!60285 (and (is-Intermediate!4322 lt!235409) (undefined!5134 lt!235409)))))

(assert (=> d!79331 (= lt!235409 e!300238)))

(declare-fun c!60284 () Bool)

(assert (=> d!79331 (= c!60284 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79331 (= lt!235410 (select (arr!15855 a!3235) lt!235279))))

(assert (=> d!79331 (validMask!0 mask!3524)))

(assert (=> d!79331 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235279 (select (arr!15855 a!3235) j!176) a!3235 mask!3524) lt!235409)))

(declare-fun b!514162 () Bool)

(assert (=> b!514162 (and (bvsge (index!19478 lt!235409) #b00000000000000000000000000000000) (bvslt (index!19478 lt!235409) (size!16219 a!3235)))))

(declare-fun e!300236 () Bool)

(assert (=> b!514162 (= e!300236 (= (select (arr!15855 a!3235) (index!19478 lt!235409)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!514163 () Bool)

(assert (=> b!514163 (= e!300237 (bvsge (x!48435 lt!235409) #b01111111111111111111111111111110))))

(declare-fun b!514164 () Bool)

(assert (=> b!514164 (and (bvsge (index!19478 lt!235409) #b00000000000000000000000000000000) (bvslt (index!19478 lt!235409) (size!16219 a!3235)))))

(declare-fun res!314166 () Bool)

(assert (=> b!514164 (= res!314166 (= (select (arr!15855 a!3235) (index!19478 lt!235409)) (select (arr!15855 a!3235) j!176)))))

(assert (=> b!514164 (=> res!314166 e!300236)))

(declare-fun e!300234 () Bool)

(assert (=> b!514164 (= e!300234 e!300236)))

(declare-fun b!514165 () Bool)

(assert (=> b!514165 (= e!300235 (Intermediate!4322 false lt!235279 #b00000000000000000000000000000000))))

(declare-fun b!514166 () Bool)

(assert (=> b!514166 (= e!300237 e!300234)))

(declare-fun res!314165 () Bool)

(assert (=> b!514166 (= res!314165 (and (is-Intermediate!4322 lt!235409) (not (undefined!5134 lt!235409)) (bvslt (x!48435 lt!235409) #b01111111111111111111111111111110) (bvsge (x!48435 lt!235409) #b00000000000000000000000000000000) (bvsge (x!48435 lt!235409) #b00000000000000000000000000000000)))))

(assert (=> b!514166 (=> (not res!314165) (not e!300234))))

(declare-fun b!514167 () Bool)

(assert (=> b!514167 (= e!300238 (Intermediate!4322 true lt!235279 #b00000000000000000000000000000000))))

(declare-fun b!514168 () Bool)

(assert (=> b!514168 (and (bvsge (index!19478 lt!235409) #b00000000000000000000000000000000) (bvslt (index!19478 lt!235409) (size!16219 a!3235)))))

(declare-fun res!314164 () Bool)

(assert (=> b!514168 (= res!314164 (= (select (arr!15855 a!3235) (index!19478 lt!235409)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514168 (=> res!314164 e!300236)))

(assert (= (and d!79331 c!60284) b!514167))

(assert (= (and d!79331 (not c!60284)) b!514160))

(assert (= (and b!514160 c!60286) b!514165))

(assert (= (and b!514160 (not c!60286)) b!514161))

(assert (= (and d!79331 c!60285) b!514163))

(assert (= (and d!79331 (not c!60285)) b!514166))

(assert (= (and b!514166 res!314165) b!514164))

(assert (= (and b!514164 (not res!314166)) b!514168))

(assert (= (and b!514168 (not res!314164)) b!514162))

(declare-fun m!495645 () Bool)

(assert (=> b!514168 m!495645))

(assert (=> b!514162 m!495645))

(assert (=> b!514164 m!495645))

(declare-fun m!495647 () Bool)

(assert (=> b!514161 m!495647))

(assert (=> b!514161 m!495647))

(assert (=> b!514161 m!495413))

(declare-fun m!495649 () Bool)

(assert (=> b!514161 m!495649))

(declare-fun m!495651 () Bool)

(assert (=> d!79331 m!495651))

(assert (=> d!79331 m!495427))

(assert (=> b!513919 d!79331))

(declare-fun d!79333 () Bool)

(declare-fun res!314171 () Bool)

(declare-fun e!300243 () Bool)

(assert (=> d!79333 (=> res!314171 e!300243)))

(assert (=> d!79333 (= res!314171 (= (select (arr!15855 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!79333 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!300243)))

(declare-fun b!514173 () Bool)

(declare-fun e!300244 () Bool)

(assert (=> b!514173 (= e!300243 e!300244)))

(declare-fun res!314172 () Bool)

(assert (=> b!514173 (=> (not res!314172) (not e!300244))))

(assert (=> b!514173 (= res!314172 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16219 a!3235)))))

(declare-fun b!514174 () Bool)

(assert (=> b!514174 (= e!300244 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79333 (not res!314171)) b!514173))

(assert (= (and b!514173 res!314172) b!514174))

(assert (=> d!79333 m!495569))

(declare-fun m!495653 () Bool)

(assert (=> b!514174 m!495653))

(assert (=> b!513913 d!79333))

(declare-fun b!514185 () Bool)

(declare-fun e!300253 () Bool)

(declare-fun contains!2734 (List!10013 (_ BitVec 64)) Bool)

(assert (=> b!514185 (= e!300253 (contains!2734 Nil!10010 (select (arr!15855 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!514186 () Bool)

(declare-fun e!300256 () Bool)

(declare-fun e!300255 () Bool)

(assert (=> b!514186 (= e!300256 e!300255)))

(declare-fun res!314180 () Bool)

(assert (=> b!514186 (=> (not res!314180) (not e!300255))))

(assert (=> b!514186 (= res!314180 (not e!300253))))

(declare-fun res!314179 () Bool)

(assert (=> b!514186 (=> (not res!314179) (not e!300253))))

(assert (=> b!514186 (= res!314179 (validKeyInArray!0 (select (arr!15855 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79335 () Bool)

(declare-fun res!314181 () Bool)

(assert (=> d!79335 (=> res!314181 e!300256)))

(assert (=> d!79335 (= res!314181 (bvsge #b00000000000000000000000000000000 (size!16219 a!3235)))))

(assert (=> d!79335 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10010) e!300256)))

(declare-fun b!514187 () Bool)

(declare-fun e!300254 () Bool)

(declare-fun call!31594 () Bool)

(assert (=> b!514187 (= e!300254 call!31594)))

(declare-fun b!514188 () Bool)

(assert (=> b!514188 (= e!300255 e!300254)))

(declare-fun c!60289 () Bool)

(assert (=> b!514188 (= c!60289 (validKeyInArray!0 (select (arr!15855 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31591 () Bool)

(assert (=> bm!31591 (= call!31594 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60289 (Cons!10009 (select (arr!15855 a!3235) #b00000000000000000000000000000000) Nil!10010) Nil!10010)))))

(declare-fun b!514189 () Bool)

(assert (=> b!514189 (= e!300254 call!31594)))

(assert (= (and d!79335 (not res!314181)) b!514186))

(assert (= (and b!514186 res!314179) b!514185))

(assert (= (and b!514186 res!314180) b!514188))

(assert (= (and b!514188 c!60289) b!514187))

(assert (= (and b!514188 (not c!60289)) b!514189))

(assert (= (or b!514187 b!514189) bm!31591))

(assert (=> b!514185 m!495569))

(assert (=> b!514185 m!495569))

(declare-fun m!495655 () Bool)

(assert (=> b!514185 m!495655))

(assert (=> b!514186 m!495569))

(assert (=> b!514186 m!495569))

(assert (=> b!514186 m!495571))

(assert (=> b!514188 m!495569))

(assert (=> b!514188 m!495569))

(assert (=> b!514188 m!495571))

(assert (=> bm!31591 m!495569))

(declare-fun m!495657 () Bool)

(assert (=> bm!31591 m!495657))

(assert (=> b!513915 d!79335))

(declare-fun b!514248 () Bool)

(declare-fun e!300293 () SeekEntryResult!4322)

(declare-fun e!300292 () SeekEntryResult!4322)

(assert (=> b!514248 (= e!300293 e!300292)))

(declare-fun lt!235433 () (_ BitVec 64))

(declare-fun lt!235434 () SeekEntryResult!4322)

(assert (=> b!514248 (= lt!235433 (select (arr!15855 a!3235) (index!19478 lt!235434)))))

(declare-fun c!60310 () Bool)

(assert (=> b!514248 (= c!60310 (= lt!235433 (select (arr!15855 a!3235) j!176)))))

(declare-fun d!79337 () Bool)

(declare-fun lt!235435 () SeekEntryResult!4322)

(assert (=> d!79337 (and (or (is-Undefined!4322 lt!235435) (not (is-Found!4322 lt!235435)) (and (bvsge (index!19477 lt!235435) #b00000000000000000000000000000000) (bvslt (index!19477 lt!235435) (size!16219 a!3235)))) (or (is-Undefined!4322 lt!235435) (is-Found!4322 lt!235435) (not (is-MissingZero!4322 lt!235435)) (and (bvsge (index!19476 lt!235435) #b00000000000000000000000000000000) (bvslt (index!19476 lt!235435) (size!16219 a!3235)))) (or (is-Undefined!4322 lt!235435) (is-Found!4322 lt!235435) (is-MissingZero!4322 lt!235435) (not (is-MissingVacant!4322 lt!235435)) (and (bvsge (index!19479 lt!235435) #b00000000000000000000000000000000) (bvslt (index!19479 lt!235435) (size!16219 a!3235)))) (or (is-Undefined!4322 lt!235435) (ite (is-Found!4322 lt!235435) (= (select (arr!15855 a!3235) (index!19477 lt!235435)) (select (arr!15855 a!3235) j!176)) (ite (is-MissingZero!4322 lt!235435) (= (select (arr!15855 a!3235) (index!19476 lt!235435)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4322 lt!235435) (= (select (arr!15855 a!3235) (index!19479 lt!235435)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79337 (= lt!235435 e!300293)))

(declare-fun c!60309 () Bool)

(assert (=> d!79337 (= c!60309 (and (is-Intermediate!4322 lt!235434) (undefined!5134 lt!235434)))))

(assert (=> d!79337 (= lt!235434 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15855 a!3235) j!176) mask!3524) (select (arr!15855 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79337 (validMask!0 mask!3524)))

(assert (=> d!79337 (= (seekEntryOrOpen!0 (select (arr!15855 a!3235) j!176) a!3235 mask!3524) lt!235435)))

(declare-fun b!514249 () Bool)

(assert (=> b!514249 (= e!300293 Undefined!4322)))

(declare-fun b!514250 () Bool)

(declare-fun c!60311 () Bool)

(assert (=> b!514250 (= c!60311 (= lt!235433 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300294 () SeekEntryResult!4322)

(assert (=> b!514250 (= e!300292 e!300294)))

(declare-fun b!514251 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32965 (_ BitVec 32)) SeekEntryResult!4322)

(assert (=> b!514251 (= e!300294 (seekKeyOrZeroReturnVacant!0 (x!48435 lt!235434) (index!19478 lt!235434) (index!19478 lt!235434) (select (arr!15855 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!514252 () Bool)

(assert (=> b!514252 (= e!300294 (MissingZero!4322 (index!19478 lt!235434)))))

(declare-fun b!514253 () Bool)

(assert (=> b!514253 (= e!300292 (Found!4322 (index!19478 lt!235434)))))

(assert (= (and d!79337 c!60309) b!514249))

(assert (= (and d!79337 (not c!60309)) b!514248))

(assert (= (and b!514248 c!60310) b!514253))

(assert (= (and b!514248 (not c!60310)) b!514250))

(assert (= (and b!514250 c!60311) b!514252))

(assert (= (and b!514250 (not c!60311)) b!514251))

(declare-fun m!495685 () Bool)

(assert (=> b!514248 m!495685))

(assert (=> d!79337 m!495441))

(assert (=> d!79337 m!495413))

(declare-fun m!495687 () Bool)

(assert (=> d!79337 m!495687))

(declare-fun m!495689 () Bool)

(assert (=> d!79337 m!495689))

(assert (=> d!79337 m!495413))

(assert (=> d!79337 m!495441))

(declare-fun m!495691 () Bool)

(assert (=> d!79337 m!495691))

(declare-fun m!495693 () Bool)

(assert (=> d!79337 m!495693))

(assert (=> d!79337 m!495427))

(assert (=> b!514251 m!495413))

(declare-fun m!495695 () Bool)

(assert (=> b!514251 m!495695))

(assert (=> b!513920 d!79337))

(declare-fun b!514254 () Bool)

(declare-fun e!300296 () SeekEntryResult!4322)

(declare-fun e!300295 () SeekEntryResult!4322)

(assert (=> b!514254 (= e!300296 e!300295)))

(declare-fun lt!235436 () (_ BitVec 64))

(declare-fun lt!235437 () SeekEntryResult!4322)

(assert (=> b!514254 (= lt!235436 (select (arr!15855 a!3235) (index!19478 lt!235437)))))

(declare-fun c!60313 () Bool)

(assert (=> b!514254 (= c!60313 (= lt!235436 k!2280))))

(declare-fun d!79351 () Bool)

(declare-fun lt!235438 () SeekEntryResult!4322)

(assert (=> d!79351 (and (or (is-Undefined!4322 lt!235438) (not (is-Found!4322 lt!235438)) (and (bvsge (index!19477 lt!235438) #b00000000000000000000000000000000) (bvslt (index!19477 lt!235438) (size!16219 a!3235)))) (or (is-Undefined!4322 lt!235438) (is-Found!4322 lt!235438) (not (is-MissingZero!4322 lt!235438)) (and (bvsge (index!19476 lt!235438) #b00000000000000000000000000000000) (bvslt (index!19476 lt!235438) (size!16219 a!3235)))) (or (is-Undefined!4322 lt!235438) (is-Found!4322 lt!235438) (is-MissingZero!4322 lt!235438) (not (is-MissingVacant!4322 lt!235438)) (and (bvsge (index!19479 lt!235438) #b00000000000000000000000000000000) (bvslt (index!19479 lt!235438) (size!16219 a!3235)))) (or (is-Undefined!4322 lt!235438) (ite (is-Found!4322 lt!235438) (= (select (arr!15855 a!3235) (index!19477 lt!235438)) k!2280) (ite (is-MissingZero!4322 lt!235438) (= (select (arr!15855 a!3235) (index!19476 lt!235438)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4322 lt!235438) (= (select (arr!15855 a!3235) (index!19479 lt!235438)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79351 (= lt!235438 e!300296)))

(declare-fun c!60312 () Bool)

(assert (=> d!79351 (= c!60312 (and (is-Intermediate!4322 lt!235437) (undefined!5134 lt!235437)))))

(assert (=> d!79351 (= lt!235437 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!79351 (validMask!0 mask!3524)))

(assert (=> d!79351 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!235438)))

(declare-fun b!514255 () Bool)

(assert (=> b!514255 (= e!300296 Undefined!4322)))

(declare-fun b!514256 () Bool)

(declare-fun c!60314 () Bool)

(assert (=> b!514256 (= c!60314 (= lt!235436 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300297 () SeekEntryResult!4322)

(assert (=> b!514256 (= e!300295 e!300297)))

(declare-fun b!514257 () Bool)

(assert (=> b!514257 (= e!300297 (seekKeyOrZeroReturnVacant!0 (x!48435 lt!235437) (index!19478 lt!235437) (index!19478 lt!235437) k!2280 a!3235 mask!3524))))

(declare-fun b!514258 () Bool)

(assert (=> b!514258 (= e!300297 (MissingZero!4322 (index!19478 lt!235437)))))

(declare-fun b!514259 () Bool)

(assert (=> b!514259 (= e!300295 (Found!4322 (index!19478 lt!235437)))))

(assert (= (and d!79351 c!60312) b!514255))

(assert (= (and d!79351 (not c!60312)) b!514254))

(assert (= (and b!514254 c!60313) b!514259))

(assert (= (and b!514254 (not c!60313)) b!514256))

(assert (= (and b!514256 c!60314) b!514258))

(assert (= (and b!514256 (not c!60314)) b!514257))

(declare-fun m!495697 () Bool)

(assert (=> b!514254 m!495697))

(declare-fun m!495699 () Bool)

(assert (=> d!79351 m!495699))

(declare-fun m!495701 () Bool)

(assert (=> d!79351 m!495701))

(declare-fun m!495703 () Bool)

(assert (=> d!79351 m!495703))

(assert (=> d!79351 m!495699))

(declare-fun m!495705 () Bool)

(assert (=> d!79351 m!495705))

(declare-fun m!495707 () Bool)

(assert (=> d!79351 m!495707))

(assert (=> d!79351 m!495427))

(declare-fun m!495709 () Bool)

(assert (=> b!514257 m!495709))

(assert (=> b!513914 d!79351))

(push 1)

(assert (not b!514174))

(assert (not b!514161))

(assert (not b!514188))

(assert (not b!514186))

(assert (not b!514251))

(assert (not b!514077))

(assert (not d!79351))

(assert (not b!514079))

(assert (not b!514139))

(assert (not b!514185))

(assert (not b!514257))

(assert (not d!79337))

(assert (not d!79307))

(assert (not b!514061))

(assert (not bm!31583))

(assert (not d!79331))

(assert (not b!514059))

(assert (not d!79319))

(assert (not bm!31591))

(assert (not bm!31584))

(check-sat)

(pop 1)

(push 1)

(check-sat)

