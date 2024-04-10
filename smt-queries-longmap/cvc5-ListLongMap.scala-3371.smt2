; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46278 () Bool)

(assert start!46278)

(declare-fun b!512651 () Bool)

(declare-fun res!313322 () Bool)

(declare-fun e!299356 () Bool)

(assert (=> b!512651 (=> (not res!313322) (not e!299356))))

(declare-datatypes ((array!32932 0))(
  ( (array!32933 (arr!15843 (Array (_ BitVec 32) (_ BitVec 64))) (size!16207 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32932)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32932 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512651 (= res!313322 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512652 () Bool)

(declare-fun e!299355 () Bool)

(declare-datatypes ((SeekEntryResult!4310 0))(
  ( (MissingZero!4310 (index!19428 (_ BitVec 32))) (Found!4310 (index!19429 (_ BitVec 32))) (Intermediate!4310 (undefined!5122 Bool) (index!19430 (_ BitVec 32)) (x!48373 (_ BitVec 32))) (Undefined!4310) (MissingVacant!4310 (index!19431 (_ BitVec 32))) )
))
(declare-fun lt!234714 () SeekEntryResult!4310)

(assert (=> b!512652 (= e!299355 (or (not (is-Intermediate!4310 lt!234714)) (undefined!5122 lt!234714) (bvslt (x!48373 lt!234714) #b01111111111111111111111111111110)))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!299354 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!512653 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32932 (_ BitVec 32)) SeekEntryResult!4310)

(assert (=> b!512653 (= e!299354 (= (seekEntryOrOpen!0 (select (arr!15843 a!3235) j!176) a!3235 mask!3524) (Found!4310 j!176)))))

(declare-fun b!512654 () Bool)

(declare-fun res!313318 () Bool)

(assert (=> b!512654 (=> (not res!313318) (not e!299356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512654 (= res!313318 (validKeyInArray!0 k!2280))))

(declare-fun b!512655 () Bool)

(declare-fun res!313317 () Bool)

(declare-fun e!299357 () Bool)

(assert (=> b!512655 (=> (not res!313317) (not e!299357))))

(declare-datatypes ((List!10001 0))(
  ( (Nil!9998) (Cons!9997 (h!10877 (_ BitVec 64)) (t!16229 List!10001)) )
))
(declare-fun arrayNoDuplicates!0 (array!32932 (_ BitVec 32) List!10001) Bool)

(assert (=> b!512655 (= res!313317 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9998))))

(declare-fun b!512656 () Bool)

(assert (=> b!512656 (= e!299357 (not e!299355))))

(declare-fun res!313320 () Bool)

(assert (=> b!512656 (=> res!313320 e!299355)))

(declare-fun lt!234711 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32932 (_ BitVec 32)) SeekEntryResult!4310)

(assert (=> b!512656 (= res!313320 (= lt!234714 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234711 (select (store (arr!15843 a!3235) i!1204 k!2280) j!176) (array!32933 (store (arr!15843 a!3235) i!1204 k!2280) (size!16207 a!3235)) mask!3524)))))

(declare-fun lt!234713 () (_ BitVec 32))

(assert (=> b!512656 (= lt!234714 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234713 (select (arr!15843 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512656 (= lt!234711 (toIndex!0 (select (store (arr!15843 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!512656 (= lt!234713 (toIndex!0 (select (arr!15843 a!3235) j!176) mask!3524))))

(assert (=> b!512656 e!299354))

(declare-fun res!313319 () Bool)

(assert (=> b!512656 (=> (not res!313319) (not e!299354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32932 (_ BitVec 32)) Bool)

(assert (=> b!512656 (= res!313319 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15878 0))(
  ( (Unit!15879) )
))
(declare-fun lt!234715 () Unit!15878)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32932 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15878)

(assert (=> b!512656 (= lt!234715 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512657 () Bool)

(declare-fun res!313313 () Bool)

(assert (=> b!512657 (=> (not res!313313) (not e!299357))))

(assert (=> b!512657 (= res!313313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512659 () Bool)

(declare-fun res!313321 () Bool)

(assert (=> b!512659 (=> (not res!313321) (not e!299356))))

(assert (=> b!512659 (= res!313321 (validKeyInArray!0 (select (arr!15843 a!3235) j!176)))))

(declare-fun b!512660 () Bool)

(assert (=> b!512660 (= e!299356 e!299357)))

(declare-fun res!313314 () Bool)

(assert (=> b!512660 (=> (not res!313314) (not e!299357))))

(declare-fun lt!234712 () SeekEntryResult!4310)

(assert (=> b!512660 (= res!313314 (or (= lt!234712 (MissingZero!4310 i!1204)) (= lt!234712 (MissingVacant!4310 i!1204))))))

(assert (=> b!512660 (= lt!234712 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!512658 () Bool)

(declare-fun res!313316 () Bool)

(assert (=> b!512658 (=> (not res!313316) (not e!299356))))

(assert (=> b!512658 (= res!313316 (and (= (size!16207 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16207 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16207 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!313315 () Bool)

(assert (=> start!46278 (=> (not res!313315) (not e!299356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46278 (= res!313315 (validMask!0 mask!3524))))

(assert (=> start!46278 e!299356))

(assert (=> start!46278 true))

(declare-fun array_inv!11639 (array!32932) Bool)

(assert (=> start!46278 (array_inv!11639 a!3235)))

(assert (= (and start!46278 res!313315) b!512658))

(assert (= (and b!512658 res!313316) b!512659))

(assert (= (and b!512659 res!313321) b!512654))

(assert (= (and b!512654 res!313318) b!512651))

(assert (= (and b!512651 res!313322) b!512660))

(assert (= (and b!512660 res!313314) b!512657))

(assert (= (and b!512657 res!313313) b!512655))

(assert (= (and b!512655 res!313317) b!512656))

(assert (= (and b!512656 res!313319) b!512653))

(assert (= (and b!512656 (not res!313320)) b!512652))

(declare-fun m!494361 () Bool)

(assert (=> b!512660 m!494361))

(declare-fun m!494363 () Bool)

(assert (=> b!512653 m!494363))

(assert (=> b!512653 m!494363))

(declare-fun m!494365 () Bool)

(assert (=> b!512653 m!494365))

(declare-fun m!494367 () Bool)

(assert (=> b!512657 m!494367))

(declare-fun m!494369 () Bool)

(assert (=> b!512654 m!494369))

(declare-fun m!494371 () Bool)

(assert (=> b!512656 m!494371))

(declare-fun m!494373 () Bool)

(assert (=> b!512656 m!494373))

(declare-fun m!494375 () Bool)

(assert (=> b!512656 m!494375))

(declare-fun m!494377 () Bool)

(assert (=> b!512656 m!494377))

(assert (=> b!512656 m!494373))

(assert (=> b!512656 m!494363))

(declare-fun m!494379 () Bool)

(assert (=> b!512656 m!494379))

(assert (=> b!512656 m!494363))

(declare-fun m!494381 () Bool)

(assert (=> b!512656 m!494381))

(assert (=> b!512656 m!494363))

(declare-fun m!494383 () Bool)

(assert (=> b!512656 m!494383))

(assert (=> b!512656 m!494373))

(declare-fun m!494385 () Bool)

(assert (=> b!512656 m!494385))

(declare-fun m!494387 () Bool)

(assert (=> b!512651 m!494387))

(declare-fun m!494389 () Bool)

(assert (=> b!512655 m!494389))

(declare-fun m!494391 () Bool)

(assert (=> start!46278 m!494391))

(declare-fun m!494393 () Bool)

(assert (=> start!46278 m!494393))

(assert (=> b!512659 m!494363))

(assert (=> b!512659 m!494363))

(declare-fun m!494395 () Bool)

(assert (=> b!512659 m!494395))

(push 1)

(assert (not b!512651))

(assert (not b!512660))

(assert (not b!512654))

(assert (not b!512656))

(assert (not b!512655))

(assert (not b!512659))

(assert (not b!512653))

(assert (not start!46278))

(assert (not b!512657))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!512784 () Bool)

(declare-fun e!299432 () SeekEntryResult!4310)

(assert (=> b!512784 (= e!299432 Undefined!4310)))

(declare-fun b!512785 () Bool)

(declare-fun e!299433 () SeekEntryResult!4310)

(declare-fun lt!234777 () SeekEntryResult!4310)

(assert (=> b!512785 (= e!299433 (MissingZero!4310 (index!19430 lt!234777)))))

(declare-fun b!512786 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32932 (_ BitVec 32)) SeekEntryResult!4310)

(assert (=> b!512786 (= e!299433 (seekKeyOrZeroReturnVacant!0 (x!48373 lt!234777) (index!19430 lt!234777) (index!19430 lt!234777) (select (arr!15843 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!79003 () Bool)

(declare-fun lt!234778 () SeekEntryResult!4310)

(assert (=> d!79003 (and (or (is-Undefined!4310 lt!234778) (not (is-Found!4310 lt!234778)) (and (bvsge (index!19429 lt!234778) #b00000000000000000000000000000000) (bvslt (index!19429 lt!234778) (size!16207 a!3235)))) (or (is-Undefined!4310 lt!234778) (is-Found!4310 lt!234778) (not (is-MissingZero!4310 lt!234778)) (and (bvsge (index!19428 lt!234778) #b00000000000000000000000000000000) (bvslt (index!19428 lt!234778) (size!16207 a!3235)))) (or (is-Undefined!4310 lt!234778) (is-Found!4310 lt!234778) (is-MissingZero!4310 lt!234778) (not (is-MissingVacant!4310 lt!234778)) (and (bvsge (index!19431 lt!234778) #b00000000000000000000000000000000) (bvslt (index!19431 lt!234778) (size!16207 a!3235)))) (or (is-Undefined!4310 lt!234778) (ite (is-Found!4310 lt!234778) (= (select (arr!15843 a!3235) (index!19429 lt!234778)) (select (arr!15843 a!3235) j!176)) (ite (is-MissingZero!4310 lt!234778) (= (select (arr!15843 a!3235) (index!19428 lt!234778)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4310 lt!234778) (= (select (arr!15843 a!3235) (index!19431 lt!234778)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79003 (= lt!234778 e!299432)))

(declare-fun c!59972 () Bool)

(assert (=> d!79003 (= c!59972 (and (is-Intermediate!4310 lt!234777) (undefined!5122 lt!234777)))))

(assert (=> d!79003 (= lt!234777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15843 a!3235) j!176) mask!3524) (select (arr!15843 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79003 (validMask!0 mask!3524)))

(assert (=> d!79003 (= (seekEntryOrOpen!0 (select (arr!15843 a!3235) j!176) a!3235 mask!3524) lt!234778)))

(declare-fun b!512787 () Bool)

(declare-fun e!299431 () SeekEntryResult!4310)

(assert (=> b!512787 (= e!299432 e!299431)))

(declare-fun lt!234776 () (_ BitVec 64))

(assert (=> b!512787 (= lt!234776 (select (arr!15843 a!3235) (index!19430 lt!234777)))))

(declare-fun c!59971 () Bool)

(assert (=> b!512787 (= c!59971 (= lt!234776 (select (arr!15843 a!3235) j!176)))))

(declare-fun b!512788 () Bool)

(declare-fun c!59970 () Bool)

(assert (=> b!512788 (= c!59970 (= lt!234776 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!512788 (= e!299431 e!299433)))

(declare-fun b!512789 () Bool)

(assert (=> b!512789 (= e!299431 (Found!4310 (index!19430 lt!234777)))))

(assert (= (and d!79003 c!59972) b!512784))

(assert (= (and d!79003 (not c!59972)) b!512787))

(assert (= (and b!512787 c!59971) b!512789))

(assert (= (and b!512787 (not c!59971)) b!512788))

(assert (= (and b!512788 c!59970) b!512785))

(assert (= (and b!512788 (not c!59970)) b!512786))

(assert (=> b!512786 m!494363))

(declare-fun m!494505 () Bool)

(assert (=> b!512786 m!494505))

(declare-fun m!494507 () Bool)

(assert (=> d!79003 m!494507))

(declare-fun m!494509 () Bool)

(assert (=> d!79003 m!494509))

(declare-fun m!494511 () Bool)

(assert (=> d!79003 m!494511))

(assert (=> d!79003 m!494363))

(assert (=> d!79003 m!494381))

(assert (=> d!79003 m!494391))

(assert (=> d!79003 m!494381))

(assert (=> d!79003 m!494363))

(declare-fun m!494513 () Bool)

(assert (=> d!79003 m!494513))

(declare-fun m!494515 () Bool)

(assert (=> b!512787 m!494515))

(assert (=> b!512653 d!79003))

(declare-fun d!79013 () Bool)

(assert (=> d!79013 (= (validKeyInArray!0 (select (arr!15843 a!3235) j!176)) (and (not (= (select (arr!15843 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15843 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!512659 d!79013))

(declare-fun d!79015 () Bool)

(assert (=> d!79015 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!512654 d!79015))

(declare-fun b!512818 () Bool)

(declare-fun e!299453 () Bool)

(declare-fun call!31523 () Bool)

(assert (=> b!512818 (= e!299453 call!31523)))

(declare-fun b!512819 () Bool)

(assert (=> b!512819 (= e!299453 call!31523)))

(declare-fun b!512820 () Bool)

(declare-fun e!299454 () Bool)

(declare-fun e!299452 () Bool)

(assert (=> b!512820 (= e!299454 e!299452)))

(declare-fun res!313411 () Bool)

(assert (=> b!512820 (=> (not res!313411) (not e!299452))))

(declare-fun e!299451 () Bool)

(assert (=> b!512820 (= res!313411 (not e!299451))))

(declare-fun res!313412 () Bool)

(assert (=> b!512820 (=> (not res!313412) (not e!299451))))

(assert (=> b!512820 (= res!313412 (validKeyInArray!0 (select (arr!15843 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!512821 () Bool)

(declare-fun contains!2726 (List!10001 (_ BitVec 64)) Bool)

(assert (=> b!512821 (= e!299451 (contains!2726 Nil!9998 (select (arr!15843 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79017 () Bool)

(declare-fun res!313413 () Bool)

(assert (=> d!79017 (=> res!313413 e!299454)))

(assert (=> d!79017 (= res!313413 (bvsge #b00000000000000000000000000000000 (size!16207 a!3235)))))

(assert (=> d!79017 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9998) e!299454)))

(declare-fun bm!31520 () Bool)

(declare-fun c!59984 () Bool)

(assert (=> bm!31520 (= call!31523 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59984 (Cons!9997 (select (arr!15843 a!3235) #b00000000000000000000000000000000) Nil!9998) Nil!9998)))))

(declare-fun b!512822 () Bool)

(assert (=> b!512822 (= e!299452 e!299453)))

(assert (=> b!512822 (= c!59984 (validKeyInArray!0 (select (arr!15843 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79017 (not res!313413)) b!512820))

(assert (= (and b!512820 res!313412) b!512821))

(assert (= (and b!512820 res!313411) b!512822))

(assert (= (and b!512822 c!59984) b!512818))

(assert (= (and b!512822 (not c!59984)) b!512819))

(assert (= (or b!512818 b!512819) bm!31520))

(declare-fun m!494531 () Bool)

(assert (=> b!512820 m!494531))

(assert (=> b!512820 m!494531))

(declare-fun m!494533 () Bool)

(assert (=> b!512820 m!494533))

(assert (=> b!512821 m!494531))

(assert (=> b!512821 m!494531))

(declare-fun m!494535 () Bool)

(assert (=> b!512821 m!494535))

(assert (=> bm!31520 m!494531))

(declare-fun m!494537 () Bool)

(assert (=> bm!31520 m!494537))

(assert (=> b!512822 m!494531))

(assert (=> b!512822 m!494531))

(assert (=> b!512822 m!494533))

(assert (=> b!512655 d!79017))

(declare-fun b!512823 () Bool)

(declare-fun e!299456 () SeekEntryResult!4310)

(assert (=> b!512823 (= e!299456 Undefined!4310)))

(declare-fun b!512824 () Bool)

(declare-fun e!299457 () SeekEntryResult!4310)

(declare-fun lt!234789 () SeekEntryResult!4310)

(assert (=> b!512824 (= e!299457 (MissingZero!4310 (index!19430 lt!234789)))))

(declare-fun b!512825 () Bool)

(assert (=> b!512825 (= e!299457 (seekKeyOrZeroReturnVacant!0 (x!48373 lt!234789) (index!19430 lt!234789) (index!19430 lt!234789) k!2280 a!3235 mask!3524))))

(declare-fun d!79021 () Bool)

(declare-fun lt!234790 () SeekEntryResult!4310)

(assert (=> d!79021 (and (or (is-Undefined!4310 lt!234790) (not (is-Found!4310 lt!234790)) (and (bvsge (index!19429 lt!234790) #b00000000000000000000000000000000) (bvslt (index!19429 lt!234790) (size!16207 a!3235)))) (or (is-Undefined!4310 lt!234790) (is-Found!4310 lt!234790) (not (is-MissingZero!4310 lt!234790)) (and (bvsge (index!19428 lt!234790) #b00000000000000000000000000000000) (bvslt (index!19428 lt!234790) (size!16207 a!3235)))) (or (is-Undefined!4310 lt!234790) (is-Found!4310 lt!234790) (is-MissingZero!4310 lt!234790) (not (is-MissingVacant!4310 lt!234790)) (and (bvsge (index!19431 lt!234790) #b00000000000000000000000000000000) (bvslt (index!19431 lt!234790) (size!16207 a!3235)))) (or (is-Undefined!4310 lt!234790) (ite (is-Found!4310 lt!234790) (= (select (arr!15843 a!3235) (index!19429 lt!234790)) k!2280) (ite (is-MissingZero!4310 lt!234790) (= (select (arr!15843 a!3235) (index!19428 lt!234790)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4310 lt!234790) (= (select (arr!15843 a!3235) (index!19431 lt!234790)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79021 (= lt!234790 e!299456)))

(declare-fun c!59987 () Bool)

(assert (=> d!79021 (= c!59987 (and (is-Intermediate!4310 lt!234789) (undefined!5122 lt!234789)))))

(assert (=> d!79021 (= lt!234789 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!79021 (validMask!0 mask!3524)))

(assert (=> d!79021 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!234790)))

(declare-fun b!512826 () Bool)

(declare-fun e!299455 () SeekEntryResult!4310)

(assert (=> b!512826 (= e!299456 e!299455)))

(declare-fun lt!234788 () (_ BitVec 64))

(assert (=> b!512826 (= lt!234788 (select (arr!15843 a!3235) (index!19430 lt!234789)))))

(declare-fun c!59986 () Bool)

(assert (=> b!512826 (= c!59986 (= lt!234788 k!2280))))

(declare-fun b!512827 () Bool)

(declare-fun c!59985 () Bool)

(assert (=> b!512827 (= c!59985 (= lt!234788 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!512827 (= e!299455 e!299457)))

(declare-fun b!512828 () Bool)

(assert (=> b!512828 (= e!299455 (Found!4310 (index!19430 lt!234789)))))

(assert (= (and d!79021 c!59987) b!512823))

(assert (= (and d!79021 (not c!59987)) b!512826))

(assert (= (and b!512826 c!59986) b!512828))

(assert (= (and b!512826 (not c!59986)) b!512827))

(assert (= (and b!512827 c!59985) b!512824))

(assert (= (and b!512827 (not c!59985)) b!512825))

(declare-fun m!494539 () Bool)

(assert (=> b!512825 m!494539))

(declare-fun m!494541 () Bool)

(assert (=> d!79021 m!494541))

(declare-fun m!494543 () Bool)

(assert (=> d!79021 m!494543))

(declare-fun m!494545 () Bool)

(assert (=> d!79021 m!494545))

(declare-fun m!494547 () Bool)

(assert (=> d!79021 m!494547))

(assert (=> d!79021 m!494391))

(assert (=> d!79021 m!494547))

(declare-fun m!494549 () Bool)

(assert (=> d!79021 m!494549))

(declare-fun m!494551 () Bool)

(assert (=> b!512826 m!494551))

(assert (=> b!512660 d!79021))

(declare-fun d!79023 () Bool)

(assert (=> d!79023 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46278 d!79023))

(declare-fun d!79035 () Bool)

(assert (=> d!79035 (= (array_inv!11639 a!3235) (bvsge (size!16207 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46278 d!79035))

(declare-fun d!79037 () Bool)

(declare-fun res!313432 () Bool)

(declare-fun e!299485 () Bool)

(assert (=> d!79037 (=> res!313432 e!299485)))

(assert (=> d!79037 (= res!313432 (= (select (arr!15843 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!79037 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!299485)))

(declare-fun b!512873 () Bool)

(declare-fun e!299486 () Bool)

(assert (=> b!512873 (= e!299485 e!299486)))

(declare-fun res!313433 () Bool)

(assert (=> b!512873 (=> (not res!313433) (not e!299486))))

(assert (=> b!512873 (= res!313433 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16207 a!3235)))))

(declare-fun b!512874 () Bool)

(assert (=> b!512874 (= e!299486 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79037 (not res!313432)) b!512873))

(assert (= (and b!512873 res!313433) b!512874))

(assert (=> d!79037 m!494531))

(declare-fun m!494575 () Bool)

(assert (=> b!512874 m!494575))

(assert (=> b!512651 d!79037))

(declare-fun d!79039 () Bool)

(declare-fun lt!234815 () (_ BitVec 32))

(declare-fun lt!234814 () (_ BitVec 32))

(assert (=> d!79039 (= lt!234815 (bvmul (bvxor lt!234814 (bvlshr lt!234814 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79039 (= lt!234814 ((_ extract 31 0) (bvand (bvxor (select (arr!15843 a!3235) j!176) (bvlshr (select (arr!15843 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79039 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313434 (let ((h!10881 ((_ extract 31 0) (bvand (bvxor (select (arr!15843 a!3235) j!176) (bvlshr (select (arr!15843 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48378 (bvmul (bvxor h!10881 (bvlshr h!10881 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48378 (bvlshr x!48378 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313434 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313434 #b00000000000000000000000000000000))))))

(assert (=> d!79039 (= (toIndex!0 (select (arr!15843 a!3235) j!176) mask!3524) (bvand (bvxor lt!234815 (bvlshr lt!234815 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!512656 d!79039))

(declare-fun b!512955 () Bool)

(declare-fun lt!234839 () SeekEntryResult!4310)

(assert (=> b!512955 (and (bvsge (index!19430 lt!234839) #b00000000000000000000000000000000) (bvslt (index!19430 lt!234839) (size!16207 a!3235)))))

(declare-fun e!299539 () Bool)

(assert (=> b!512955 (= e!299539 (= (select (arr!15843 a!3235) (index!19430 lt!234839)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!512956 () Bool)

(declare-fun e!299540 () SeekEntryResult!4310)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512956 (= e!299540 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!234713 #b00000000000000000000000000000000 mask!3524) (select (arr!15843 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!512957 () Bool)

(declare-fun e!299542 () Bool)

(assert (=> b!512957 (= e!299542 (bvsge (x!48373 lt!234839) #b01111111111111111111111111111110))))

(declare-fun b!512958 () Bool)

(assert (=> b!512958 (and (bvsge (index!19430 lt!234839) #b00000000000000000000000000000000) (bvslt (index!19430 lt!234839) (size!16207 a!3235)))))

(declare-fun res!313470 () Bool)

(assert (=> b!512958 (= res!313470 (= (select (arr!15843 a!3235) (index!19430 lt!234839)) (select (arr!15843 a!3235) j!176)))))

(assert (=> b!512958 (=> res!313470 e!299539)))

(declare-fun e!299543 () Bool)

(assert (=> b!512958 (= e!299543 e!299539)))

(declare-fun b!512959 () Bool)

(declare-fun e!299541 () SeekEntryResult!4310)

(assert (=> b!512959 (= e!299541 (Intermediate!4310 true lt!234713 #b00000000000000000000000000000000))))

(declare-fun b!512960 () Bool)

(assert (=> b!512960 (= e!299540 (Intermediate!4310 false lt!234713 #b00000000000000000000000000000000))))

(declare-fun b!512961 () Bool)

(assert (=> b!512961 (= e!299542 e!299543)))

(declare-fun res!313471 () Bool)

(assert (=> b!512961 (= res!313471 (and (is-Intermediate!4310 lt!234839) (not (undefined!5122 lt!234839)) (bvslt (x!48373 lt!234839) #b01111111111111111111111111111110) (bvsge (x!48373 lt!234839) #b00000000000000000000000000000000) (bvsge (x!48373 lt!234839) #b00000000000000000000000000000000)))))

(assert (=> b!512961 (=> (not res!313471) (not e!299543))))

(declare-fun b!512962 () Bool)

(assert (=> b!512962 (and (bvsge (index!19430 lt!234839) #b00000000000000000000000000000000) (bvslt (index!19430 lt!234839) (size!16207 a!3235)))))

(declare-fun res!313472 () Bool)

(assert (=> b!512962 (= res!313472 (= (select (arr!15843 a!3235) (index!19430 lt!234839)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!512962 (=> res!313472 e!299539)))

(declare-fun d!79051 () Bool)

(assert (=> d!79051 e!299542))

(declare-fun c!60024 () Bool)

(assert (=> d!79051 (= c!60024 (and (is-Intermediate!4310 lt!234839) (undefined!5122 lt!234839)))))

(assert (=> d!79051 (= lt!234839 e!299541)))

(declare-fun c!60025 () Bool)

(assert (=> d!79051 (= c!60025 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!234838 () (_ BitVec 64))

(assert (=> d!79051 (= lt!234838 (select (arr!15843 a!3235) lt!234713))))

(assert (=> d!79051 (validMask!0 mask!3524)))

(assert (=> d!79051 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234713 (select (arr!15843 a!3235) j!176) a!3235 mask!3524) lt!234839)))

(declare-fun b!512963 () Bool)

(assert (=> b!512963 (= e!299541 e!299540)))

(declare-fun c!60026 () Bool)

(assert (=> b!512963 (= c!60026 (or (= lt!234838 (select (arr!15843 a!3235) j!176)) (= (bvadd lt!234838 lt!234838) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!79051 c!60025) b!512959))

(assert (= (and d!79051 (not c!60025)) b!512963))

(assert (= (and b!512963 c!60026) b!512960))

(assert (= (and b!512963 (not c!60026)) b!512956))

(assert (= (and d!79051 c!60024) b!512957))

(assert (= (and d!79051 (not c!60024)) b!512961))

(assert (= (and b!512961 res!313471) b!512958))

(assert (= (and b!512958 (not res!313470)) b!512962))

(assert (= (and b!512962 (not res!313472)) b!512955))

(declare-fun m!494611 () Bool)

(assert (=> b!512958 m!494611))

(assert (=> b!512955 m!494611))

(declare-fun m!494613 () Bool)

(assert (=> b!512956 m!494613))

(assert (=> b!512956 m!494613))

(assert (=> b!512956 m!494363))

(declare-fun m!494615 () Bool)

(assert (=> b!512956 m!494615))

(assert (=> b!512962 m!494611))

(declare-fun m!494617 () Bool)

(assert (=> d!79051 m!494617))

(assert (=> d!79051 m!494391))

(assert (=> b!512656 d!79051))

(declare-fun b!512995 () Bool)

(declare-fun e!299565 () Bool)

(declare-fun call!31534 () Bool)

(assert (=> b!512995 (= e!299565 call!31534)))

(declare-fun bm!31531 () Bool)

(assert (=> bm!31531 (= call!31534 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!512997 () Bool)

(declare-fun e!299566 () Bool)

(assert (=> b!512997 (= e!299566 e!299565)))

(declare-fun lt!234864 () (_ BitVec 64))

(assert (=> b!512997 (= lt!234864 (select (arr!15843 a!3235) j!176))))

(declare-fun lt!234863 () Unit!15878)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32932 (_ BitVec 64) (_ BitVec 32)) Unit!15878)

(assert (=> b!512997 (= lt!234863 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!234864 j!176))))

(assert (=> b!512997 (arrayContainsKey!0 a!3235 lt!234864 #b00000000000000000000000000000000)))

(declare-fun lt!234862 () Unit!15878)

(assert (=> b!512997 (= lt!234862 lt!234863)))

(declare-fun res!313485 () Bool)

(assert (=> b!512997 (= res!313485 (= (seekEntryOrOpen!0 (select (arr!15843 a!3235) j!176) a!3235 mask!3524) (Found!4310 j!176)))))

(assert (=> b!512997 (=> (not res!313485) (not e!299565))))

(declare-fun b!512998 () Bool)

(declare-fun e!299564 () Bool)

(assert (=> b!512998 (= e!299564 e!299566)))

(declare-fun c!60037 () Bool)

(assert (=> b!512998 (= c!60037 (validKeyInArray!0 (select (arr!15843 a!3235) j!176)))))

(declare-fun d!79061 () Bool)

(declare-fun res!313484 () Bool)

(assert (=> d!79061 (=> res!313484 e!299564)))

(assert (=> d!79061 (= res!313484 (bvsge j!176 (size!16207 a!3235)))))

(assert (=> d!79061 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!299564)))

(declare-fun b!512996 () Bool)

(assert (=> b!512996 (= e!299566 call!31534)))

(assert (= (and d!79061 (not res!313484)) b!512998))

(assert (= (and b!512998 c!60037) b!512997))

(assert (= (and b!512998 (not c!60037)) b!512996))

(assert (= (and b!512997 res!313485) b!512995))

(assert (= (or b!512995 b!512996) bm!31531))

(declare-fun m!494649 () Bool)

(assert (=> bm!31531 m!494649))

(assert (=> b!512997 m!494363))

(declare-fun m!494651 () Bool)

(assert (=> b!512997 m!494651))

(declare-fun m!494653 () Bool)

(assert (=> b!512997 m!494653))

(assert (=> b!512997 m!494363))

(assert (=> b!512997 m!494365))

(assert (=> b!512998 m!494363))

(assert (=> b!512998 m!494363))

(assert (=> b!512998 m!494395))

(assert (=> b!512656 d!79061))

(declare-fun b!512999 () Bool)

(declare-fun lt!234866 () SeekEntryResult!4310)

(assert (=> b!512999 (and (bvsge (index!19430 lt!234866) #b00000000000000000000000000000000) (bvslt (index!19430 lt!234866) (size!16207 (array!32933 (store (arr!15843 a!3235) i!1204 k!2280) (size!16207 a!3235)))))))

(declare-fun e!299567 () Bool)

(assert (=> b!512999 (= e!299567 (= (select (arr!15843 (array!32933 (store (arr!15843 a!3235) i!1204 k!2280) (size!16207 a!3235))) (index!19430 lt!234866)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!513000 () Bool)

(declare-fun e!299568 () SeekEntryResult!4310)

(assert (=> b!513000 (= e!299568 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!234711 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15843 a!3235) i!1204 k!2280) j!176) (array!32933 (store (arr!15843 a!3235) i!1204 k!2280) (size!16207 a!3235)) mask!3524))))

(declare-fun b!513001 () Bool)

(declare-fun e!299570 () Bool)

(assert (=> b!513001 (= e!299570 (bvsge (x!48373 lt!234866) #b01111111111111111111111111111110))))

(declare-fun b!513002 () Bool)

(assert (=> b!513002 (and (bvsge (index!19430 lt!234866) #b00000000000000000000000000000000) (bvslt (index!19430 lt!234866) (size!16207 (array!32933 (store (arr!15843 a!3235) i!1204 k!2280) (size!16207 a!3235)))))))

(declare-fun res!313486 () Bool)

(assert (=> b!513002 (= res!313486 (= (select (arr!15843 (array!32933 (store (arr!15843 a!3235) i!1204 k!2280) (size!16207 a!3235))) (index!19430 lt!234866)) (select (store (arr!15843 a!3235) i!1204 k!2280) j!176)))))

(assert (=> b!513002 (=> res!313486 e!299567)))

(declare-fun e!299571 () Bool)

(assert (=> b!513002 (= e!299571 e!299567)))

(declare-fun b!513003 () Bool)

(declare-fun e!299569 () SeekEntryResult!4310)

(assert (=> b!513003 (= e!299569 (Intermediate!4310 true lt!234711 #b00000000000000000000000000000000))))

(declare-fun b!513004 () Bool)

(assert (=> b!513004 (= e!299568 (Intermediate!4310 false lt!234711 #b00000000000000000000000000000000))))

(declare-fun b!513005 () Bool)

(assert (=> b!513005 (= e!299570 e!299571)))

(declare-fun res!313487 () Bool)

(assert (=> b!513005 (= res!313487 (and (is-Intermediate!4310 lt!234866) (not (undefined!5122 lt!234866)) (bvslt (x!48373 lt!234866) #b01111111111111111111111111111110) (bvsge (x!48373 lt!234866) #b00000000000000000000000000000000) (bvsge (x!48373 lt!234866) #b00000000000000000000000000000000)))))

(assert (=> b!513005 (=> (not res!313487) (not e!299571))))

(declare-fun b!513006 () Bool)

(assert (=> b!513006 (and (bvsge (index!19430 lt!234866) #b00000000000000000000000000000000) (bvslt (index!19430 lt!234866) (size!16207 (array!32933 (store (arr!15843 a!3235) i!1204 k!2280) (size!16207 a!3235)))))))

(declare-fun res!313488 () Bool)

(assert (=> b!513006 (= res!313488 (= (select (arr!15843 (array!32933 (store (arr!15843 a!3235) i!1204 k!2280) (size!16207 a!3235))) (index!19430 lt!234866)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!513006 (=> res!313488 e!299567)))

(declare-fun d!79071 () Bool)

(assert (=> d!79071 e!299570))

(declare-fun c!60038 () Bool)

(assert (=> d!79071 (= c!60038 (and (is-Intermediate!4310 lt!234866) (undefined!5122 lt!234866)))))

(assert (=> d!79071 (= lt!234866 e!299569)))

(declare-fun c!60039 () Bool)

(assert (=> d!79071 (= c!60039 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!234865 () (_ BitVec 64))

(assert (=> d!79071 (= lt!234865 (select (arr!15843 (array!32933 (store (arr!15843 a!3235) i!1204 k!2280) (size!16207 a!3235))) lt!234711))))

(assert (=> d!79071 (validMask!0 mask!3524)))

(assert (=> d!79071 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234711 (select (store (arr!15843 a!3235) i!1204 k!2280) j!176) (array!32933 (store (arr!15843 a!3235) i!1204 k!2280) (size!16207 a!3235)) mask!3524) lt!234866)))

(declare-fun b!513007 () Bool)

(assert (=> b!513007 (= e!299569 e!299568)))

(declare-fun c!60040 () Bool)

(assert (=> b!513007 (= c!60040 (or (= lt!234865 (select (store (arr!15843 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!234865 lt!234865) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!79071 c!60039) b!513003))

(assert (= (and d!79071 (not c!60039)) b!513007))

(assert (= (and b!513007 c!60040) b!513004))

(assert (= (and b!513007 (not c!60040)) b!513000))

(assert (= (and d!79071 c!60038) b!513001))

(assert (= (and d!79071 (not c!60038)) b!513005))

(assert (= (and b!513005 res!313487) b!513002))

(assert (= (and b!513002 (not res!313486)) b!513006))

(assert (= (and b!513006 (not res!313488)) b!512999))

(declare-fun m!494655 () Bool)

(assert (=> b!513002 m!494655))

(assert (=> b!512999 m!494655))

(declare-fun m!494657 () Bool)

(assert (=> b!513000 m!494657))

(assert (=> b!513000 m!494657))

(assert (=> b!513000 m!494373))

(declare-fun m!494659 () Bool)

(assert (=> b!513000 m!494659))

(assert (=> b!513006 m!494655))

(declare-fun m!494661 () Bool)

(assert (=> d!79071 m!494661))

(assert (=> d!79071 m!494391))

(assert (=> b!512656 d!79071))

(declare-fun d!79073 () Bool)

(assert (=> d!79073 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!234869 () Unit!15878)

(declare-fun choose!38 (array!32932 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15878)

(assert (=> d!79073 (= lt!234869 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79073 (validMask!0 mask!3524)))

(assert (=> d!79073 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!234869)))

(declare-fun bs!16242 () Bool)

(assert (= bs!16242 d!79073))

(assert (=> bs!16242 m!494383))

(declare-fun m!494663 () Bool)

(assert (=> bs!16242 m!494663))

(assert (=> bs!16242 m!494391))

(assert (=> b!512656 d!79073))

(declare-fun d!79075 () Bool)

(declare-fun lt!234871 () (_ BitVec 32))

(declare-fun lt!234870 () (_ BitVec 32))

(assert (=> d!79075 (= lt!234871 (bvmul (bvxor lt!234870 (bvlshr lt!234870 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79075 (= lt!234870 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15843 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15843 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79075 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313434 (let ((h!10881 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15843 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15843 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48378 (bvmul (bvxor h!10881 (bvlshr h!10881 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48378 (bvlshr x!48378 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313434 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313434 #b00000000000000000000000000000000))))))

(assert (=> d!79075 (= (toIndex!0 (select (store (arr!15843 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!234871 (bvlshr lt!234871 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!512656 d!79075))

(declare-fun b!513008 () Bool)

(declare-fun e!299573 () Bool)

(declare-fun call!31535 () Bool)

(assert (=> b!513008 (= e!299573 call!31535)))

(declare-fun bm!31532 () Bool)

(assert (=> bm!31532 (= call!31535 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!513010 () Bool)

(declare-fun e!299574 () Bool)

(assert (=> b!513010 (= e!299574 e!299573)))

(declare-fun lt!234874 () (_ BitVec 64))

(assert (=> b!513010 (= lt!234874 (select (arr!15843 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!234873 () Unit!15878)

(assert (=> b!513010 (= lt!234873 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!234874 #b00000000000000000000000000000000))))

(assert (=> b!513010 (arrayContainsKey!0 a!3235 lt!234874 #b00000000000000000000000000000000)))

(declare-fun lt!234872 () Unit!15878)

(assert (=> b!513010 (= lt!234872 lt!234873)))

(declare-fun res!313490 () Bool)

(assert (=> b!513010 (= res!313490 (= (seekEntryOrOpen!0 (select (arr!15843 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4310 #b00000000000000000000000000000000)))))

(assert (=> b!513010 (=> (not res!313490) (not e!299573))))

(declare-fun b!513011 () Bool)

(declare-fun e!299572 () Bool)

(assert (=> b!513011 (= e!299572 e!299574)))

(declare-fun c!60041 () Bool)

(assert (=> b!513011 (= c!60041 (validKeyInArray!0 (select (arr!15843 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79077 () Bool)

(declare-fun res!313489 () Bool)

(assert (=> d!79077 (=> res!313489 e!299572)))

(assert (=> d!79077 (= res!313489 (bvsge #b00000000000000000000000000000000 (size!16207 a!3235)))))

(assert (=> d!79077 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!299572)))

(declare-fun b!513009 () Bool)

(assert (=> b!513009 (= e!299574 call!31535)))

(assert (= (and d!79077 (not res!313489)) b!513011))

(assert (= (and b!513011 c!60041) b!513010))

(assert (= (and b!513011 (not c!60041)) b!513009))

(assert (= (and b!513010 res!313490) b!513008))

(assert (= (or b!513008 b!513009) bm!31532))

(declare-fun m!494665 () Bool)

(assert (=> bm!31532 m!494665))

(assert (=> b!513010 m!494531))

(declare-fun m!494667 () Bool)

(assert (=> b!513010 m!494667))

(declare-fun m!494669 () Bool)

(assert (=> b!513010 m!494669))

(assert (=> b!513010 m!494531))

(declare-fun m!494671 () Bool)

(assert (=> b!513010 m!494671))

(assert (=> b!513011 m!494531))

(assert (=> b!513011 m!494531))

(assert (=> b!513011 m!494533))

(assert (=> b!512657 d!79077))

(push 1)

