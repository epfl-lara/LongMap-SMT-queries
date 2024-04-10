; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44884 () Bool)

(assert start!44884)

(declare-fun b!492560 () Bool)

(declare-fun res!295316 () Bool)

(declare-fun e!289334 () Bool)

(assert (=> b!492560 (=> (not res!295316) (not e!289334))))

(declare-datatypes ((array!31886 0))(
  ( (array!31887 (arr!15329 (Array (_ BitVec 32) (_ BitVec 64))) (size!15693 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31886)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31886 (_ BitVec 32)) Bool)

(assert (=> b!492560 (= res!295316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492561 () Bool)

(declare-fun e!289338 () Bool)

(declare-fun lt!222674 () (_ BitVec 32))

(assert (=> b!492561 (= e!289338 (or (bvslt mask!3524 #b00000000000000000000000000000000) (and (bvsge lt!222674 #b00000000000000000000000000000000) (bvslt lt!222674 (bvadd #b00000000000000000000000000000001 mask!3524)))))))

(declare-fun b!492562 () Bool)

(declare-fun res!295321 () Bool)

(assert (=> b!492562 (=> (not res!295321) (not e!289334))))

(declare-datatypes ((List!9487 0))(
  ( (Nil!9484) (Cons!9483 (h!10348 (_ BitVec 64)) (t!15715 List!9487)) )
))
(declare-fun arrayNoDuplicates!0 (array!31886 (_ BitVec 32) List!9487) Bool)

(assert (=> b!492562 (= res!295321 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9484))))

(declare-fun b!492563 () Bool)

(declare-fun res!295315 () Bool)

(declare-fun e!289337 () Bool)

(assert (=> b!492563 (=> (not res!295315) (not e!289337))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!492563 (= res!295315 (and (= (size!15693 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15693 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15693 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492564 () Bool)

(declare-fun res!295318 () Bool)

(assert (=> b!492564 (=> (not res!295318) (not e!289337))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492564 (= res!295318 (validKeyInArray!0 (select (arr!15329 a!3235) j!176)))))

(declare-fun b!492565 () Bool)

(declare-fun res!295317 () Bool)

(assert (=> b!492565 (=> (not res!295317) (not e!289337))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!492565 (= res!295317 (validKeyInArray!0 k!2280))))

(declare-fun res!295322 () Bool)

(assert (=> start!44884 (=> (not res!295322) (not e!289337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44884 (= res!295322 (validMask!0 mask!3524))))

(assert (=> start!44884 e!289337))

(assert (=> start!44884 true))

(declare-fun array_inv!11125 (array!31886) Bool)

(assert (=> start!44884 (array_inv!11125 a!3235)))

(declare-fun b!492566 () Bool)

(assert (=> b!492566 (= e!289334 (not e!289338))))

(declare-fun res!295313 () Bool)

(assert (=> b!492566 (=> res!295313 e!289338)))

(declare-datatypes ((SeekEntryResult!3796 0))(
  ( (MissingZero!3796 (index!17363 (_ BitVec 32))) (Found!3796 (index!17364 (_ BitVec 32))) (Intermediate!3796 (undefined!4608 Bool) (index!17365 (_ BitVec 32)) (x!46444 (_ BitVec 32))) (Undefined!3796) (MissingVacant!3796 (index!17366 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31886 (_ BitVec 32)) SeekEntryResult!3796)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492566 (= res!295313 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222674 (select (arr!15329 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15329 a!3235) i!1204 k!2280) j!176) mask!3524) (select (store (arr!15329 a!3235) i!1204 k!2280) j!176) (array!31887 (store (arr!15329 a!3235) i!1204 k!2280) (size!15693 a!3235)) mask!3524)))))

(assert (=> b!492566 (= lt!222674 (toIndex!0 (select (arr!15329 a!3235) j!176) mask!3524))))

(declare-fun e!289336 () Bool)

(assert (=> b!492566 e!289336))

(declare-fun res!295314 () Bool)

(assert (=> b!492566 (=> (not res!295314) (not e!289336))))

(assert (=> b!492566 (= res!295314 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14538 0))(
  ( (Unit!14539) )
))
(declare-fun lt!222676 () Unit!14538)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31886 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14538)

(assert (=> b!492566 (= lt!222676 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492567 () Bool)

(declare-fun res!295319 () Bool)

(assert (=> b!492567 (=> (not res!295319) (not e!289337))))

(declare-fun arrayContainsKey!0 (array!31886 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492567 (= res!295319 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492568 () Bool)

(assert (=> b!492568 (= e!289337 e!289334)))

(declare-fun res!295320 () Bool)

(assert (=> b!492568 (=> (not res!295320) (not e!289334))))

(declare-fun lt!222675 () SeekEntryResult!3796)

(assert (=> b!492568 (= res!295320 (or (= lt!222675 (MissingZero!3796 i!1204)) (= lt!222675 (MissingVacant!3796 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31886 (_ BitVec 32)) SeekEntryResult!3796)

(assert (=> b!492568 (= lt!222675 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!492569 () Bool)

(assert (=> b!492569 (= e!289336 (= (seekEntryOrOpen!0 (select (arr!15329 a!3235) j!176) a!3235 mask!3524) (Found!3796 j!176)))))

(assert (= (and start!44884 res!295322) b!492563))

(assert (= (and b!492563 res!295315) b!492564))

(assert (= (and b!492564 res!295318) b!492565))

(assert (= (and b!492565 res!295317) b!492567))

(assert (= (and b!492567 res!295319) b!492568))

(assert (= (and b!492568 res!295320) b!492560))

(assert (= (and b!492560 res!295316) b!492562))

(assert (= (and b!492562 res!295321) b!492566))

(assert (= (and b!492566 res!295314) b!492569))

(assert (= (and b!492566 (not res!295313)) b!492561))

(declare-fun m!473319 () Bool)

(assert (=> b!492566 m!473319))

(declare-fun m!473321 () Bool)

(assert (=> b!492566 m!473321))

(declare-fun m!473323 () Bool)

(assert (=> b!492566 m!473323))

(declare-fun m!473325 () Bool)

(assert (=> b!492566 m!473325))

(declare-fun m!473327 () Bool)

(assert (=> b!492566 m!473327))

(declare-fun m!473329 () Bool)

(assert (=> b!492566 m!473329))

(assert (=> b!492566 m!473323))

(declare-fun m!473331 () Bool)

(assert (=> b!492566 m!473331))

(assert (=> b!492566 m!473325))

(declare-fun m!473333 () Bool)

(assert (=> b!492566 m!473333))

(assert (=> b!492566 m!473325))

(declare-fun m!473335 () Bool)

(assert (=> b!492566 m!473335))

(assert (=> b!492566 m!473323))

(assert (=> b!492566 m!473329))

(declare-fun m!473337 () Bool)

(assert (=> b!492565 m!473337))

(assert (=> b!492569 m!473325))

(assert (=> b!492569 m!473325))

(declare-fun m!473339 () Bool)

(assert (=> b!492569 m!473339))

(declare-fun m!473341 () Bool)

(assert (=> b!492568 m!473341))

(declare-fun m!473343 () Bool)

(assert (=> start!44884 m!473343))

(declare-fun m!473345 () Bool)

(assert (=> start!44884 m!473345))

(declare-fun m!473347 () Bool)

(assert (=> b!492560 m!473347))

(declare-fun m!473349 () Bool)

(assert (=> b!492567 m!473349))

(assert (=> b!492564 m!473325))

(assert (=> b!492564 m!473325))

(declare-fun m!473351 () Bool)

(assert (=> b!492564 m!473351))

(declare-fun m!473353 () Bool)

(assert (=> b!492562 m!473353))

(push 1)

(assert (not b!492565))

(assert (not b!492568))

(assert (not start!44884))

(assert (not b!492562))

(assert (not b!492564))

(assert (not b!492566))

(assert (not b!492560))

(assert (not b!492567))

(assert (not b!492569))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!492602 () Bool)

(declare-fun e!289361 () Bool)

(declare-fun e!289362 () Bool)

(assert (=> b!492602 (= e!289361 e!289362)))

(declare-fun c!58907 () Bool)

(assert (=> b!492602 (= c!58907 (validKeyInArray!0 (select (arr!15329 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!492603 () Bool)

(declare-fun call!31391 () Bool)

(assert (=> b!492603 (= e!289362 call!31391)))

(declare-fun b!492605 () Bool)

(declare-fun e!289360 () Bool)

(assert (=> b!492605 (= e!289362 e!289360)))

(declare-fun lt!222699 () (_ BitVec 64))

(assert (=> b!492605 (= lt!222699 (select (arr!15329 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!222700 () Unit!14538)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31886 (_ BitVec 64) (_ BitVec 32)) Unit!14538)

(assert (=> b!492605 (= lt!222700 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!222699 #b00000000000000000000000000000000))))

(assert (=> b!492605 (arrayContainsKey!0 a!3235 lt!222699 #b00000000000000000000000000000000)))

(declare-fun lt!222698 () Unit!14538)

(assert (=> b!492605 (= lt!222698 lt!222700)))

(declare-fun res!295334 () Bool)

(assert (=> b!492605 (= res!295334 (= (seekEntryOrOpen!0 (select (arr!15329 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3796 #b00000000000000000000000000000000)))))

(assert (=> b!492605 (=> (not res!295334) (not e!289360))))

(declare-fun bm!31388 () Bool)

(assert (=> bm!31388 (= call!31391 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!492604 () Bool)

(assert (=> b!492604 (= e!289360 call!31391)))

(declare-fun d!78101 () Bool)

(declare-fun res!295335 () Bool)

(assert (=> d!78101 (=> res!295335 e!289361)))

(assert (=> d!78101 (= res!295335 (bvsge #b00000000000000000000000000000000 (size!15693 a!3235)))))

(assert (=> d!78101 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!289361)))

(assert (= (and d!78101 (not res!295335)) b!492602))

(assert (= (and b!492602 c!58907) b!492605))

(assert (= (and b!492602 (not c!58907)) b!492603))

(assert (= (and b!492605 res!295334) b!492604))

(assert (= (or b!492604 b!492603) bm!31388))

(declare-fun m!473371 () Bool)

(assert (=> b!492602 m!473371))

(assert (=> b!492602 m!473371))

(declare-fun m!473373 () Bool)

(assert (=> b!492602 m!473373))

(assert (=> b!492605 m!473371))

(declare-fun m!473375 () Bool)

(assert (=> b!492605 m!473375))

(declare-fun m!473377 () Bool)

(assert (=> b!492605 m!473377))

(assert (=> b!492605 m!473371))

(declare-fun m!473379 () Bool)

(assert (=> b!492605 m!473379))

(declare-fun m!473381 () Bool)

(assert (=> bm!31388 m!473381))

(assert (=> b!492560 d!78101))

(declare-fun d!78111 () Bool)

(assert (=> d!78111 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!492565 d!78111))

(declare-fun d!78113 () Bool)

(assert (=> d!78113 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44884 d!78113))

(declare-fun d!78119 () Bool)

(assert (=> d!78119 (= (array_inv!11125 a!3235) (bvsge (size!15693 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44884 d!78119))

(declare-fun d!78121 () Bool)

(declare-fun lt!222724 () (_ BitVec 32))

(declare-fun lt!222723 () (_ BitVec 32))

(assert (=> d!78121 (= lt!222724 (bvmul (bvxor lt!222723 (bvlshr lt!222723 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78121 (= lt!222723 ((_ extract 31 0) (bvand (bvxor (select (arr!15329 a!3235) j!176) (bvlshr (select (arr!15329 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78121 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!295342 (let ((h!10350 ((_ extract 31 0) (bvand (bvxor (select (arr!15329 a!3235) j!176) (bvlshr (select (arr!15329 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46446 (bvmul (bvxor h!10350 (bvlshr h!10350 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46446 (bvlshr x!46446 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!295342 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!295342 #b00000000000000000000000000000000))))))

(assert (=> d!78121 (= (toIndex!0 (select (arr!15329 a!3235) j!176) mask!3524) (bvand (bvxor lt!222724 (bvlshr lt!222724 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!492566 d!78121))

(declare-fun b!492705 () Bool)

(declare-fun e!289425 () SeekEntryResult!3796)

(declare-fun e!289423 () SeekEntryResult!3796)

(assert (=> b!492705 (= e!289425 e!289423)))

(declare-fun lt!222743 () (_ BitVec 64))

(declare-fun c!58943 () Bool)

(assert (=> b!492705 (= c!58943 (or (= lt!222743 (select (arr!15329 a!3235) j!176)) (= (bvadd lt!222743 lt!222743) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!492706 () Bool)

(assert (=> b!492706 (= e!289423 (Intermediate!3796 false lt!222674 #b00000000000000000000000000000000))))

(declare-fun b!492707 () Bool)

(declare-fun e!289426 () Bool)

(declare-fun e!289427 () Bool)

(assert (=> b!492707 (= e!289426 e!289427)))

(declare-fun res!295371 () Bool)

(declare-fun lt!222742 () SeekEntryResult!3796)

(assert (=> b!492707 (= res!295371 (and (is-Intermediate!3796 lt!222742) (not (undefined!4608 lt!222742)) (bvslt (x!46444 lt!222742) #b01111111111111111111111111111110) (bvsge (x!46444 lt!222742) #b00000000000000000000000000000000) (bvsge (x!46444 lt!222742) #b00000000000000000000000000000000)))))

(assert (=> b!492707 (=> (not res!295371) (not e!289427))))

(declare-fun b!492708 () Bool)

(assert (=> b!492708 (= e!289425 (Intermediate!3796 true lt!222674 #b00000000000000000000000000000000))))

(declare-fun b!492709 () Bool)

(assert (=> b!492709 (and (bvsge (index!17365 lt!222742) #b00000000000000000000000000000000) (bvslt (index!17365 lt!222742) (size!15693 a!3235)))))

(declare-fun res!295373 () Bool)

(assert (=> b!492709 (= res!295373 (= (select (arr!15329 a!3235) (index!17365 lt!222742)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!289424 () Bool)

(assert (=> b!492709 (=> res!295373 e!289424)))

(declare-fun b!492711 () Bool)

(assert (=> b!492711 (and (bvsge (index!17365 lt!222742) #b00000000000000000000000000000000) (bvslt (index!17365 lt!222742) (size!15693 a!3235)))))

(assert (=> b!492711 (= e!289424 (= (select (arr!15329 a!3235) (index!17365 lt!222742)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!492712 () Bool)

(assert (=> b!492712 (= e!289426 (bvsge (x!46444 lt!222742) #b01111111111111111111111111111110))))

(declare-fun b!492713 () Bool)

(assert (=> b!492713 (and (bvsge (index!17365 lt!222742) #b00000000000000000000000000000000) (bvslt (index!17365 lt!222742) (size!15693 a!3235)))))

(declare-fun res!295372 () Bool)

(assert (=> b!492713 (= res!295372 (= (select (arr!15329 a!3235) (index!17365 lt!222742)) (select (arr!15329 a!3235) j!176)))))

(assert (=> b!492713 (=> res!295372 e!289424)))

(assert (=> b!492713 (= e!289427 e!289424)))

(declare-fun b!492710 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492710 (= e!289423 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!222674 #b00000000000000000000000000000000 mask!3524) (select (arr!15329 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!78123 () Bool)

(assert (=> d!78123 e!289426))

(declare-fun c!58942 () Bool)

(assert (=> d!78123 (= c!58942 (and (is-Intermediate!3796 lt!222742) (undefined!4608 lt!222742)))))

(assert (=> d!78123 (= lt!222742 e!289425)))

(declare-fun c!58941 () Bool)

(assert (=> d!78123 (= c!58941 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78123 (= lt!222743 (select (arr!15329 a!3235) lt!222674))))

(assert (=> d!78123 (validMask!0 mask!3524)))

(assert (=> d!78123 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222674 (select (arr!15329 a!3235) j!176) a!3235 mask!3524) lt!222742)))

(assert (= (and d!78123 c!58941) b!492708))

(assert (= (and d!78123 (not c!58941)) b!492705))

(assert (= (and b!492705 c!58943) b!492706))

(assert (= (and b!492705 (not c!58943)) b!492710))

(assert (= (and d!78123 c!58942) b!492712))

(assert (= (and d!78123 (not c!58942)) b!492707))

(assert (= (and b!492707 res!295371) b!492713))

(assert (= (and b!492713 (not res!295372)) b!492709))

(assert (= (and b!492709 (not res!295373)) b!492711))

(declare-fun m!473427 () Bool)

(assert (=> b!492709 m!473427))

(declare-fun m!473429 () Bool)

(assert (=> b!492710 m!473429))

(assert (=> b!492710 m!473429))

(assert (=> b!492710 m!473325))

(declare-fun m!473431 () Bool)

(assert (=> b!492710 m!473431))

(assert (=> b!492713 m!473427))

(assert (=> b!492711 m!473427))

(declare-fun m!473433 () Bool)

(assert (=> d!78123 m!473433))

(assert (=> d!78123 m!473343))

(assert (=> b!492566 d!78123))

(declare-fun b!492714 () Bool)

(declare-fun e!289429 () Bool)

(declare-fun e!289430 () Bool)

(assert (=> b!492714 (= e!289429 e!289430)))

(declare-fun c!58944 () Bool)

(assert (=> b!492714 (= c!58944 (validKeyInArray!0 (select (arr!15329 a!3235) j!176)))))

(declare-fun b!492715 () Bool)

(declare-fun call!31398 () Bool)

(assert (=> b!492715 (= e!289430 call!31398)))

(declare-fun b!492717 () Bool)

(declare-fun e!289428 () Bool)

(assert (=> b!492717 (= e!289430 e!289428)))

(declare-fun lt!222745 () (_ BitVec 64))

(assert (=> b!492717 (= lt!222745 (select (arr!15329 a!3235) j!176))))

(declare-fun lt!222746 () Unit!14538)

(assert (=> b!492717 (= lt!222746 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!222745 j!176))))

(assert (=> b!492717 (arrayContainsKey!0 a!3235 lt!222745 #b00000000000000000000000000000000)))

(declare-fun lt!222744 () Unit!14538)

(assert (=> b!492717 (= lt!222744 lt!222746)))

(declare-fun res!295374 () Bool)

(assert (=> b!492717 (= res!295374 (= (seekEntryOrOpen!0 (select (arr!15329 a!3235) j!176) a!3235 mask!3524) (Found!3796 j!176)))))

(assert (=> b!492717 (=> (not res!295374) (not e!289428))))

(declare-fun bm!31395 () Bool)

(assert (=> bm!31395 (= call!31398 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!492716 () Bool)

(assert (=> b!492716 (= e!289428 call!31398)))

(declare-fun d!78143 () Bool)

(declare-fun res!295375 () Bool)

(assert (=> d!78143 (=> res!295375 e!289429)))

(assert (=> d!78143 (= res!295375 (bvsge j!176 (size!15693 a!3235)))))

(assert (=> d!78143 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!289429)))

(assert (= (and d!78143 (not res!295375)) b!492714))

(assert (= (and b!492714 c!58944) b!492717))

(assert (= (and b!492714 (not c!58944)) b!492715))

(assert (= (and b!492717 res!295374) b!492716))

(assert (= (or b!492716 b!492715) bm!31395))

(assert (=> b!492714 m!473325))

(assert (=> b!492714 m!473325))

(assert (=> b!492714 m!473351))

(assert (=> b!492717 m!473325))

(declare-fun m!473435 () Bool)

(assert (=> b!492717 m!473435))

(declare-fun m!473437 () Bool)

(assert (=> b!492717 m!473437))

(assert (=> b!492717 m!473325))

(assert (=> b!492717 m!473339))

(declare-fun m!473439 () Bool)

(assert (=> bm!31395 m!473439))

(assert (=> b!492566 d!78143))

(declare-fun d!78145 () Bool)

(assert (=> d!78145 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222755 () Unit!14538)

(declare-fun choose!38 (array!31886 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14538)

(assert (=> d!78145 (= lt!222755 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78145 (validMask!0 mask!3524)))

(assert (=> d!78145 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!222755)))

(declare-fun bs!15704 () Bool)

(assert (= bs!15704 d!78145))

(assert (=> bs!15704 m!473335))

(declare-fun m!473441 () Bool)

(assert (=> bs!15704 m!473441))

(assert (=> bs!15704 m!473343))

(assert (=> b!492566 d!78145))

(declare-fun d!78155 () Bool)

(declare-fun lt!222757 () (_ BitVec 32))

(declare-fun lt!222756 () (_ BitVec 32))

(assert (=> d!78155 (= lt!222757 (bvmul (bvxor lt!222756 (bvlshr lt!222756 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78155 (= lt!222756 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15329 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15329 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78155 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!295342 (let ((h!10350 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15329 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15329 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46446 (bvmul (bvxor h!10350 (bvlshr h!10350 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46446 (bvlshr x!46446 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!295342 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!295342 #b00000000000000000000000000000000))))))

(assert (=> d!78155 (= (toIndex!0 (select (store (arr!15329 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!222757 (bvlshr lt!222757 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!492566 d!78155))

(declare-fun b!492718 () Bool)

(declare-fun e!289433 () SeekEntryResult!3796)

(declare-fun e!289431 () SeekEntryResult!3796)

(assert (=> b!492718 (= e!289433 e!289431)))

(declare-fun c!58947 () Bool)

(declare-fun lt!222759 () (_ BitVec 64))

(assert (=> b!492718 (= c!58947 (or (= lt!222759 (select (store (arr!15329 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!222759 lt!222759) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!492719 () Bool)

(assert (=> b!492719 (= e!289431 (Intermediate!3796 false (toIndex!0 (select (store (arr!15329 a!3235) i!1204 k!2280) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun b!492720 () Bool)

(declare-fun e!289434 () Bool)

(declare-fun e!289435 () Bool)

(assert (=> b!492720 (= e!289434 e!289435)))

(declare-fun res!295376 () Bool)

(declare-fun lt!222758 () SeekEntryResult!3796)

(assert (=> b!492720 (= res!295376 (and (is-Intermediate!3796 lt!222758) (not (undefined!4608 lt!222758)) (bvslt (x!46444 lt!222758) #b01111111111111111111111111111110) (bvsge (x!46444 lt!222758) #b00000000000000000000000000000000) (bvsge (x!46444 lt!222758) #b00000000000000000000000000000000)))))

(assert (=> b!492720 (=> (not res!295376) (not e!289435))))

(declare-fun b!492721 () Bool)

(assert (=> b!492721 (= e!289433 (Intermediate!3796 true (toIndex!0 (select (store (arr!15329 a!3235) i!1204 k!2280) j!176) mask!3524) #b00000000000000000000000000000000))))

(declare-fun b!492722 () Bool)

(assert (=> b!492722 (and (bvsge (index!17365 lt!222758) #b00000000000000000000000000000000) (bvslt (index!17365 lt!222758) (size!15693 (array!31887 (store (arr!15329 a!3235) i!1204 k!2280) (size!15693 a!3235)))))))

(declare-fun res!295378 () Bool)

(assert (=> b!492722 (= res!295378 (= (select (arr!15329 (array!31887 (store (arr!15329 a!3235) i!1204 k!2280) (size!15693 a!3235))) (index!17365 lt!222758)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!289432 () Bool)

(assert (=> b!492722 (=> res!295378 e!289432)))

(declare-fun b!492724 () Bool)

(assert (=> b!492724 (and (bvsge (index!17365 lt!222758) #b00000000000000000000000000000000) (bvslt (index!17365 lt!222758) (size!15693 (array!31887 (store (arr!15329 a!3235) i!1204 k!2280) (size!15693 a!3235)))))))

(assert (=> b!492724 (= e!289432 (= (select (arr!15329 (array!31887 (store (arr!15329 a!3235) i!1204 k!2280) (size!15693 a!3235))) (index!17365 lt!222758)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!492725 () Bool)

(assert (=> b!492725 (= e!289434 (bvsge (x!46444 lt!222758) #b01111111111111111111111111111110))))

(declare-fun b!492726 () Bool)

(assert (=> b!492726 (and (bvsge (index!17365 lt!222758) #b00000000000000000000000000000000) (bvslt (index!17365 lt!222758) (size!15693 (array!31887 (store (arr!15329 a!3235) i!1204 k!2280) (size!15693 a!3235)))))))

(declare-fun res!295377 () Bool)

(assert (=> b!492726 (= res!295377 (= (select (arr!15329 (array!31887 (store (arr!15329 a!3235) i!1204 k!2280) (size!15693 a!3235))) (index!17365 lt!222758)) (select (store (arr!15329 a!3235) i!1204 k!2280) j!176)))))

(assert (=> b!492726 (=> res!295377 e!289432)))

(assert (=> b!492726 (= e!289435 e!289432)))

(declare-fun b!492723 () Bool)

(assert (=> b!492723 (= e!289431 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!15329 a!3235) i!1204 k!2280) j!176) mask!3524) #b00000000000000000000000000000000 mask!3524) (select (store (arr!15329 a!3235) i!1204 k!2280) j!176) (array!31887 (store (arr!15329 a!3235) i!1204 k!2280) (size!15693 a!3235)) mask!3524))))

(declare-fun d!78157 () Bool)

(assert (=> d!78157 e!289434))

(declare-fun c!58946 () Bool)

(assert (=> d!78157 (= c!58946 (and (is-Intermediate!3796 lt!222758) (undefined!4608 lt!222758)))))

(assert (=> d!78157 (= lt!222758 e!289433)))

(declare-fun c!58945 () Bool)

(assert (=> d!78157 (= c!58945 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78157 (= lt!222759 (select (arr!15329 (array!31887 (store (arr!15329 a!3235) i!1204 k!2280) (size!15693 a!3235))) (toIndex!0 (select (store (arr!15329 a!3235) i!1204 k!2280) j!176) mask!3524)))))

(assert (=> d!78157 (validMask!0 mask!3524)))

(assert (=> d!78157 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15329 a!3235) i!1204 k!2280) j!176) mask!3524) (select (store (arr!15329 a!3235) i!1204 k!2280) j!176) (array!31887 (store (arr!15329 a!3235) i!1204 k!2280) (size!15693 a!3235)) mask!3524) lt!222758)))

(assert (= (and d!78157 c!58945) b!492721))

(assert (= (and d!78157 (not c!58945)) b!492718))

(assert (= (and b!492718 c!58947) b!492719))

(assert (= (and b!492718 (not c!58947)) b!492723))

(assert (= (and d!78157 c!58946) b!492725))

(assert (= (and d!78157 (not c!58946)) b!492720))

(assert (= (and b!492720 res!295376) b!492726))

(assert (= (and b!492726 (not res!295377)) b!492722))

(assert (= (and b!492722 (not res!295378)) b!492724))

(declare-fun m!473443 () Bool)

(assert (=> b!492722 m!473443))

(assert (=> b!492723 m!473329))

(declare-fun m!473445 () Bool)

(assert (=> b!492723 m!473445))

(assert (=> b!492723 m!473445))

(assert (=> b!492723 m!473323))

(declare-fun m!473447 () Bool)

(assert (=> b!492723 m!473447))

(assert (=> b!492726 m!473443))

(assert (=> b!492724 m!473443))

(assert (=> d!78157 m!473329))

(declare-fun m!473449 () Bool)

(assert (=> d!78157 m!473449))

(assert (=> d!78157 m!473343))

(assert (=> b!492566 d!78157))

(declare-fun lt!222781 () SeekEntryResult!3796)

(declare-fun b!492776 () Bool)

(declare-fun e!289471 () SeekEntryResult!3796)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31886 (_ BitVec 32)) SeekEntryResult!3796)

(assert (=> b!492776 (= e!289471 (seekKeyOrZeroReturnVacant!0 (x!46444 lt!222781) (index!17365 lt!222781) (index!17365 lt!222781) k!2280 a!3235 mask!3524))))

(declare-fun b!492777 () Bool)

(declare-fun e!289470 () SeekEntryResult!3796)

(assert (=> b!492777 (= e!289470 Undefined!3796)))

(declare-fun b!492778 () Bool)

(declare-fun e!289469 () SeekEntryResult!3796)

(assert (=> b!492778 (= e!289470 e!289469)))

(declare-fun lt!222782 () (_ BitVec 64))

(assert (=> b!492778 (= lt!222782 (select (arr!15329 a!3235) (index!17365 lt!222781)))))

(declare-fun c!58966 () Bool)

(assert (=> b!492778 (= c!58966 (= lt!222782 k!2280))))

(declare-fun d!78159 () Bool)

(declare-fun lt!222783 () SeekEntryResult!3796)

(assert (=> d!78159 (and (or (is-Undefined!3796 lt!222783) (not (is-Found!3796 lt!222783)) (and (bvsge (index!17364 lt!222783) #b00000000000000000000000000000000) (bvslt (index!17364 lt!222783) (size!15693 a!3235)))) (or (is-Undefined!3796 lt!222783) (is-Found!3796 lt!222783) (not (is-MissingZero!3796 lt!222783)) (and (bvsge (index!17363 lt!222783) #b00000000000000000000000000000000) (bvslt (index!17363 lt!222783) (size!15693 a!3235)))) (or (is-Undefined!3796 lt!222783) (is-Found!3796 lt!222783) (is-MissingZero!3796 lt!222783) (not (is-MissingVacant!3796 lt!222783)) (and (bvsge (index!17366 lt!222783) #b00000000000000000000000000000000) (bvslt (index!17366 lt!222783) (size!15693 a!3235)))) (or (is-Undefined!3796 lt!222783) (ite (is-Found!3796 lt!222783) (= (select (arr!15329 a!3235) (index!17364 lt!222783)) k!2280) (ite (is-MissingZero!3796 lt!222783) (= (select (arr!15329 a!3235) (index!17363 lt!222783)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3796 lt!222783) (= (select (arr!15329 a!3235) (index!17366 lt!222783)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78159 (= lt!222783 e!289470)))

(declare-fun c!58964 () Bool)

(assert (=> d!78159 (= c!58964 (and (is-Intermediate!3796 lt!222781) (undefined!4608 lt!222781)))))

(assert (=> d!78159 (= lt!222781 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!78159 (validMask!0 mask!3524)))

(assert (=> d!78159 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!222783)))

(declare-fun b!492779 () Bool)

(assert (=> b!492779 (= e!289469 (Found!3796 (index!17365 lt!222781)))))

(declare-fun b!492780 () Bool)

(assert (=> b!492780 (= e!289471 (MissingZero!3796 (index!17365 lt!222781)))))

(declare-fun b!492781 () Bool)

(declare-fun c!58965 () Bool)

(assert (=> b!492781 (= c!58965 (= lt!222782 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!492781 (= e!289469 e!289471)))

(assert (= (and d!78159 c!58964) b!492777))

(assert (= (and d!78159 (not c!58964)) b!492778))

(assert (= (and b!492778 c!58966) b!492779))

(assert (= (and b!492778 (not c!58966)) b!492781))

(assert (= (and b!492781 c!58965) b!492780))

(assert (= (and b!492781 (not c!58965)) b!492776))

(declare-fun m!473485 () Bool)

(assert (=> b!492776 m!473485))

(declare-fun m!473487 () Bool)

(assert (=> b!492778 m!473487))

(declare-fun m!473489 () Bool)

(assert (=> d!78159 m!473489))

(declare-fun m!473491 () Bool)

(assert (=> d!78159 m!473491))

(assert (=> d!78159 m!473343))

(declare-fun m!473493 () Bool)

(assert (=> d!78159 m!473493))

(declare-fun m!473495 () Bool)

(assert (=> d!78159 m!473495))

(assert (=> d!78159 m!473491))

(declare-fun m!473497 () Bool)

(assert (=> d!78159 m!473497))

(assert (=> b!492568 d!78159))

(declare-fun b!492810 () Bool)

(declare-fun e!289492 () Bool)

(declare-fun contains!2713 (List!9487 (_ BitVec 64)) Bool)

(assert (=> b!492810 (= e!289492 (contains!2713 Nil!9484 (select (arr!15329 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!492811 () Bool)

(declare-fun e!289493 () Bool)

(declare-fun e!289491 () Bool)

(assert (=> b!492811 (= e!289493 e!289491)))

(declare-fun res!295408 () Bool)

(assert (=> b!492811 (=> (not res!295408) (not e!289491))))

(assert (=> b!492811 (= res!295408 (not e!289492))))

(declare-fun res!295410 () Bool)

(assert (=> b!492811 (=> (not res!295410) (not e!289492))))

(assert (=> b!492811 (= res!295410 (validKeyInArray!0 (select (arr!15329 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!78169 () Bool)

(declare-fun res!295409 () Bool)

(assert (=> d!78169 (=> res!295409 e!289493)))

(assert (=> d!78169 (= res!295409 (bvsge #b00000000000000000000000000000000 (size!15693 a!3235)))))

(assert (=> d!78169 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9484) e!289493)))

(declare-fun b!492812 () Bool)

(declare-fun e!289490 () Bool)

(declare-fun call!31408 () Bool)

(assert (=> b!492812 (= e!289490 call!31408)))

(declare-fun bm!31405 () Bool)

(declare-fun c!58975 () Bool)

(assert (=> bm!31405 (= call!31408 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58975 (Cons!9483 (select (arr!15329 a!3235) #b00000000000000000000000000000000) Nil!9484) Nil!9484)))))

(declare-fun b!492813 () Bool)

(assert (=> b!492813 (= e!289490 call!31408)))

(declare-fun b!492814 () Bool)

(assert (=> b!492814 (= e!289491 e!289490)))

(assert (=> b!492814 (= c!58975 (validKeyInArray!0 (select (arr!15329 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!78169 (not res!295409)) b!492811))

(assert (= (and b!492811 res!295410) b!492810))

(assert (= (and b!492811 res!295408) b!492814))

(assert (= (and b!492814 c!58975) b!492813))

(assert (= (and b!492814 (not c!58975)) b!492812))

(assert (= (or b!492813 b!492812) bm!31405))

(assert (=> b!492810 m!473371))

(assert (=> b!492810 m!473371))

(declare-fun m!473499 () Bool)

(assert (=> b!492810 m!473499))

(assert (=> b!492811 m!473371))

(assert (=> b!492811 m!473371))

(assert (=> b!492811 m!473373))

(assert (=> bm!31405 m!473371))

(declare-fun m!473501 () Bool)

(assert (=> bm!31405 m!473501))

(assert (=> b!492814 m!473371))

(assert (=> b!492814 m!473371))

(assert (=> b!492814 m!473373))

(assert (=> b!492562 d!78169))

(declare-fun d!78171 () Bool)

(declare-fun res!295418 () Bool)

(declare-fun e!289503 () Bool)

(assert (=> d!78171 (=> res!295418 e!289503)))

(assert (=> d!78171 (= res!295418 (= (select (arr!15329 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!78171 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!289503)))

(declare-fun b!492828 () Bool)

(declare-fun e!289504 () Bool)

(assert (=> b!492828 (= e!289503 e!289504)))

(declare-fun res!295419 () Bool)

(assert (=> b!492828 (=> (not res!295419) (not e!289504))))

(assert (=> b!492828 (= res!295419 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15693 a!3235)))))

(declare-fun b!492829 () Bool)

(assert (=> b!492829 (= e!289504 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78171 (not res!295418)) b!492828))

(assert (= (and b!492828 res!295419) b!492829))

(assert (=> d!78171 m!473371))

(declare-fun m!473511 () Bool)

(assert (=> b!492829 m!473511))

(assert (=> b!492567 d!78171))

(declare-fun d!78175 () Bool)

(assert (=> d!78175 (= (validKeyInArray!0 (select (arr!15329 a!3235) j!176)) (and (not (= (select (arr!15329 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15329 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!492564 d!78175))

(declare-fun e!289507 () SeekEntryResult!3796)

(declare-fun b!492830 () Bool)

(declare-fun lt!222790 () SeekEntryResult!3796)

(assert (=> b!492830 (= e!289507 (seekKeyOrZeroReturnVacant!0 (x!46444 lt!222790) (index!17365 lt!222790) (index!17365 lt!222790) (select (arr!15329 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!492831 () Bool)

(declare-fun e!289506 () SeekEntryResult!3796)

(assert (=> b!492831 (= e!289506 Undefined!3796)))

(declare-fun b!492832 () Bool)

(declare-fun e!289505 () SeekEntryResult!3796)

(assert (=> b!492832 (= e!289506 e!289505)))

(declare-fun lt!222791 () (_ BitVec 64))

(assert (=> b!492832 (= lt!222791 (select (arr!15329 a!3235) (index!17365 lt!222790)))))

(declare-fun c!58981 () Bool)

(assert (=> b!492832 (= c!58981 (= lt!222791 (select (arr!15329 a!3235) j!176)))))

(declare-fun d!78177 () Bool)

(declare-fun lt!222792 () SeekEntryResult!3796)

(assert (=> d!78177 (and (or (is-Undefined!3796 lt!222792) (not (is-Found!3796 lt!222792)) (and (bvsge (index!17364 lt!222792) #b00000000000000000000000000000000) (bvslt (index!17364 lt!222792) (size!15693 a!3235)))) (or (is-Undefined!3796 lt!222792) (is-Found!3796 lt!222792) (not (is-MissingZero!3796 lt!222792)) (and (bvsge (index!17363 lt!222792) #b00000000000000000000000000000000) (bvslt (index!17363 lt!222792) (size!15693 a!3235)))) (or (is-Undefined!3796 lt!222792) (is-Found!3796 lt!222792) (is-MissingZero!3796 lt!222792) (not (is-MissingVacant!3796 lt!222792)) (and (bvsge (index!17366 lt!222792) #b00000000000000000000000000000000) (bvslt (index!17366 lt!222792) (size!15693 a!3235)))) (or (is-Undefined!3796 lt!222792) (ite (is-Found!3796 lt!222792) (= (select (arr!15329 a!3235) (index!17364 lt!222792)) (select (arr!15329 a!3235) j!176)) (ite (is-MissingZero!3796 lt!222792) (= (select (arr!15329 a!3235) (index!17363 lt!222792)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!3796 lt!222792) (= (select (arr!15329 a!3235) (index!17366 lt!222792)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78177 (= lt!222792 e!289506)))

(declare-fun c!58979 () Bool)

(assert (=> d!78177 (= c!58979 (and (is-Intermediate!3796 lt!222790) (undefined!4608 lt!222790)))))

(assert (=> d!78177 (= lt!222790 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15329 a!3235) j!176) mask!3524) (select (arr!15329 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78177 (validMask!0 mask!3524)))

(assert (=> d!78177 (= (seekEntryOrOpen!0 (select (arr!15329 a!3235) j!176) a!3235 mask!3524) lt!222792)))

(declare-fun b!492833 () Bool)

(assert (=> b!492833 (= e!289505 (Found!3796 (index!17365 lt!222790)))))

(declare-fun b!492834 () Bool)

(assert (=> b!492834 (= e!289507 (MissingZero!3796 (index!17365 lt!222790)))))

(declare-fun b!492835 () Bool)

(declare-fun c!58980 () Bool)

(assert (=> b!492835 (= c!58980 (= lt!222791 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!492835 (= e!289505 e!289507)))

(assert (= (and d!78177 c!58979) b!492831))

(assert (= (and d!78177 (not c!58979)) b!492832))

(assert (= (and b!492832 c!58981) b!492833))

(assert (= (and b!492832 (not c!58981)) b!492835))

(assert (= (and b!492835 c!58980) b!492834))

(assert (= (and b!492835 (not c!58980)) b!492830))

(assert (=> b!492830 m!473325))

(declare-fun m!473513 () Bool)

(assert (=> b!492830 m!473513))

(declare-fun m!473515 () Bool)

(assert (=> b!492832 m!473515))

(declare-fun m!473517 () Bool)

(assert (=> d!78177 m!473517))

(assert (=> d!78177 m!473325))

(assert (=> d!78177 m!473327))

(assert (=> d!78177 m!473343))

(declare-fun m!473519 () Bool)

(assert (=> d!78177 m!473519))

(declare-fun m!473521 () Bool)

(assert (=> d!78177 m!473521))

(assert (=> d!78177 m!473327))

(assert (=> d!78177 m!473325))

(declare-fun m!473523 () Bool)

(assert (=> d!78177 m!473523))

(assert (=> b!492569 d!78177))

(push 1)

(assert (not b!492830))

(assert (not bm!31388))

(assert (not b!492776))

(assert (not d!78177))

(assert (not d!78145))

(assert (not bm!31395))

(assert (not b!492811))

(assert (not b!492814))

(assert (not b!492602))

(assert (not b!492714))

(assert (not d!78157))

(assert (not b!492710))

(assert (not d!78123))

(assert (not b!492810))

(assert (not b!492829))

(assert (not b!492723))

(assert (not b!492605))

(assert (not bm!31405))

(assert (not d!78159))

(assert (not b!492717))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

