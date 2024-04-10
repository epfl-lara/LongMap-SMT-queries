; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47154 () Bool)

(assert start!47154)

(declare-fun b!519379 () Bool)

(declare-fun res!317934 () Bool)

(declare-fun e!303047 () Bool)

(assert (=> b!519379 (=> (not res!317934) (not e!303047))))

(declare-datatypes ((array!33169 0))(
  ( (array!33170 (arr!15945 (Array (_ BitVec 32) (_ BitVec 64))) (size!16309 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33169)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33169 (_ BitVec 32)) Bool)

(assert (=> b!519379 (= res!317934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!519380 () Bool)

(declare-datatypes ((Unit!16100 0))(
  ( (Unit!16101) )
))
(declare-fun e!303046 () Unit!16100)

(declare-fun Unit!16102 () Unit!16100)

(assert (=> b!519380 (= e!303046 Unit!16102)))

(declare-fun b!519381 () Bool)

(declare-fun Unit!16103 () Unit!16100)

(assert (=> b!519381 (= e!303046 Unit!16103)))

(declare-fun lt!237838 () Unit!16100)

(declare-fun k!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4412 0))(
  ( (MissingZero!4412 (index!19842 (_ BitVec 32))) (Found!4412 (index!19843 (_ BitVec 32))) (Intermediate!4412 (undefined!5224 Bool) (index!19844 (_ BitVec 32)) (x!48819 (_ BitVec 32))) (Undefined!4412) (MissingVacant!4412 (index!19845 (_ BitVec 32))) )
))
(declare-fun lt!237837 () SeekEntryResult!4412)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!237834 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33169 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16100)

(assert (=> b!519381 (= lt!237838 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!237834 #b00000000000000000000000000000000 (index!19844 lt!237837) (x!48819 lt!237837) mask!3524))))

(declare-fun res!317945 () Bool)

(declare-fun lt!237835 () array!33169)

(declare-fun lt!237839 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33169 (_ BitVec 32)) SeekEntryResult!4412)

(assert (=> b!519381 (= res!317945 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237834 lt!237839 lt!237835 mask!3524) (Intermediate!4412 false (index!19844 lt!237837) (x!48819 lt!237837))))))

(declare-fun e!303050 () Bool)

(assert (=> b!519381 (=> (not res!317945) (not e!303050))))

(assert (=> b!519381 e!303050))

(declare-fun b!519382 () Bool)

(declare-fun e!303045 () Bool)

(assert (=> b!519382 (= e!303045 e!303047)))

(declare-fun res!317941 () Bool)

(assert (=> b!519382 (=> (not res!317941) (not e!303047))))

(declare-fun lt!237841 () SeekEntryResult!4412)

(assert (=> b!519382 (= res!317941 (or (= lt!237841 (MissingZero!4412 i!1204)) (= lt!237841 (MissingVacant!4412 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33169 (_ BitVec 32)) SeekEntryResult!4412)

(assert (=> b!519382 (= lt!237841 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!519383 () Bool)

(declare-fun res!317939 () Bool)

(assert (=> b!519383 (=> (not res!317939) (not e!303045))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!519383 (= res!317939 (validKeyInArray!0 k!2280))))

(declare-fun b!519384 () Bool)

(declare-fun res!317944 () Bool)

(assert (=> b!519384 (=> (not res!317944) (not e!303045))))

(declare-fun arrayContainsKey!0 (array!33169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!519384 (= res!317944 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!519385 () Bool)

(declare-fun e!303048 () Bool)

(assert (=> b!519385 (= e!303048 (and (bvsge (index!19844 lt!237837) #b00000000000000000000000000000000) (bvslt (index!19844 lt!237837) (size!16309 a!3235))))))

(assert (=> b!519385 (or (= (select (arr!15945 a!3235) (index!19844 lt!237837)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15945 a!3235) (index!19844 lt!237837)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!237836 () Unit!16100)

(assert (=> b!519385 (= lt!237836 e!303046)))

(declare-fun c!61019 () Bool)

(assert (=> b!519385 (= c!61019 (= (select (arr!15945 a!3235) (index!19844 lt!237837)) (select (arr!15945 a!3235) j!176)))))

(assert (=> b!519385 (and (bvslt (x!48819 lt!237837) #b01111111111111111111111111111110) (or (= (select (arr!15945 a!3235) (index!19844 lt!237837)) (select (arr!15945 a!3235) j!176)) (= (select (arr!15945 a!3235) (index!19844 lt!237837)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15945 a!3235) (index!19844 lt!237837)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!317935 () Bool)

(assert (=> start!47154 (=> (not res!317935) (not e!303045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47154 (= res!317935 (validMask!0 mask!3524))))

(assert (=> start!47154 e!303045))

(assert (=> start!47154 true))

(declare-fun array_inv!11741 (array!33169) Bool)

(assert (=> start!47154 (array_inv!11741 a!3235)))

(declare-fun b!519386 () Bool)

(declare-fun res!317943 () Bool)

(assert (=> b!519386 (=> res!317943 e!303048)))

(assert (=> b!519386 (= res!317943 (or (undefined!5224 lt!237837) (not (is-Intermediate!4412 lt!237837))))))

(declare-fun b!519387 () Bool)

(declare-fun res!317938 () Bool)

(assert (=> b!519387 (=> (not res!317938) (not e!303045))))

(assert (=> b!519387 (= res!317938 (validKeyInArray!0 (select (arr!15945 a!3235) j!176)))))

(declare-fun b!519388 () Bool)

(assert (=> b!519388 (= e!303050 false)))

(declare-fun b!519389 () Bool)

(declare-fun res!317936 () Bool)

(assert (=> b!519389 (=> (not res!317936) (not e!303045))))

(assert (=> b!519389 (= res!317936 (and (= (size!16309 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16309 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16309 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!303051 () Bool)

(declare-fun b!519390 () Bool)

(assert (=> b!519390 (= e!303051 (= (seekEntryOrOpen!0 (select (arr!15945 a!3235) j!176) a!3235 mask!3524) (Found!4412 j!176)))))

(declare-fun b!519391 () Bool)

(assert (=> b!519391 (= e!303047 (not e!303048))))

(declare-fun res!317937 () Bool)

(assert (=> b!519391 (=> res!317937 e!303048)))

(declare-fun lt!237840 () (_ BitVec 32))

(assert (=> b!519391 (= res!317937 (= lt!237837 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237840 lt!237839 lt!237835 mask!3524)))))

(assert (=> b!519391 (= lt!237837 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237834 (select (arr!15945 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519391 (= lt!237840 (toIndex!0 lt!237839 mask!3524))))

(assert (=> b!519391 (= lt!237839 (select (store (arr!15945 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!519391 (= lt!237834 (toIndex!0 (select (arr!15945 a!3235) j!176) mask!3524))))

(assert (=> b!519391 (= lt!237835 (array!33170 (store (arr!15945 a!3235) i!1204 k!2280) (size!16309 a!3235)))))

(assert (=> b!519391 e!303051))

(declare-fun res!317940 () Bool)

(assert (=> b!519391 (=> (not res!317940) (not e!303051))))

(assert (=> b!519391 (= res!317940 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!237833 () Unit!16100)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16100)

(assert (=> b!519391 (= lt!237833 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!519392 () Bool)

(declare-fun res!317942 () Bool)

(assert (=> b!519392 (=> (not res!317942) (not e!303047))))

(declare-datatypes ((List!10103 0))(
  ( (Nil!10100) (Cons!10099 (h!11012 (_ BitVec 64)) (t!16331 List!10103)) )
))
(declare-fun arrayNoDuplicates!0 (array!33169 (_ BitVec 32) List!10103) Bool)

(assert (=> b!519392 (= res!317942 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10100))))

(assert (= (and start!47154 res!317935) b!519389))

(assert (= (and b!519389 res!317936) b!519387))

(assert (= (and b!519387 res!317938) b!519383))

(assert (= (and b!519383 res!317939) b!519384))

(assert (= (and b!519384 res!317944) b!519382))

(assert (= (and b!519382 res!317941) b!519379))

(assert (= (and b!519379 res!317934) b!519392))

(assert (= (and b!519392 res!317942) b!519391))

(assert (= (and b!519391 res!317940) b!519390))

(assert (= (and b!519391 (not res!317937)) b!519386))

(assert (= (and b!519386 (not res!317943)) b!519385))

(assert (= (and b!519385 c!61019) b!519381))

(assert (= (and b!519385 (not c!61019)) b!519380))

(assert (= (and b!519381 res!317945) b!519388))

(declare-fun m!500571 () Bool)

(assert (=> b!519383 m!500571))

(declare-fun m!500573 () Bool)

(assert (=> b!519384 m!500573))

(declare-fun m!500575 () Bool)

(assert (=> b!519385 m!500575))

(declare-fun m!500577 () Bool)

(assert (=> b!519385 m!500577))

(declare-fun m!500579 () Bool)

(assert (=> b!519379 m!500579))

(declare-fun m!500581 () Bool)

(assert (=> b!519391 m!500581))

(declare-fun m!500583 () Bool)

(assert (=> b!519391 m!500583))

(declare-fun m!500585 () Bool)

(assert (=> b!519391 m!500585))

(assert (=> b!519391 m!500577))

(declare-fun m!500587 () Bool)

(assert (=> b!519391 m!500587))

(assert (=> b!519391 m!500577))

(assert (=> b!519391 m!500577))

(declare-fun m!500589 () Bool)

(assert (=> b!519391 m!500589))

(declare-fun m!500591 () Bool)

(assert (=> b!519391 m!500591))

(declare-fun m!500593 () Bool)

(assert (=> b!519391 m!500593))

(declare-fun m!500595 () Bool)

(assert (=> b!519391 m!500595))

(declare-fun m!500597 () Bool)

(assert (=> b!519381 m!500597))

(declare-fun m!500599 () Bool)

(assert (=> b!519381 m!500599))

(declare-fun m!500601 () Bool)

(assert (=> b!519382 m!500601))

(declare-fun m!500603 () Bool)

(assert (=> start!47154 m!500603))

(declare-fun m!500605 () Bool)

(assert (=> start!47154 m!500605))

(assert (=> b!519387 m!500577))

(assert (=> b!519387 m!500577))

(declare-fun m!500607 () Bool)

(assert (=> b!519387 m!500607))

(declare-fun m!500609 () Bool)

(assert (=> b!519392 m!500609))

(assert (=> b!519390 m!500577))

(assert (=> b!519390 m!500577))

(declare-fun m!500611 () Bool)

(assert (=> b!519390 m!500611))

(push 1)

(assert (not b!519379))

(assert (not b!519390))

(assert (not b!519384))

(assert (not b!519391))

(assert (not b!519383))

(assert (not b!519392))

(assert (not start!47154))

(assert (not b!519387))

(assert (not b!519382))

(assert (not b!519381))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!519546 () Bool)

(declare-fun e!303140 () SeekEntryResult!4412)

(assert (=> b!519546 (= e!303140 (Intermediate!4412 false lt!237834 #b00000000000000000000000000000000))))

(declare-fun b!519547 () Bool)

(declare-fun e!303137 () SeekEntryResult!4412)

(assert (=> b!519547 (= e!303137 (Intermediate!4412 true lt!237834 #b00000000000000000000000000000000))))

(declare-fun b!519548 () Bool)

(declare-fun lt!237931 () SeekEntryResult!4412)

(assert (=> b!519548 (and (bvsge (index!19844 lt!237931) #b00000000000000000000000000000000) (bvslt (index!19844 lt!237931) (size!16309 a!3235)))))

(declare-fun res!318046 () Bool)

(assert (=> b!519548 (= res!318046 (= (select (arr!15945 a!3235) (index!19844 lt!237931)) (select (arr!15945 a!3235) j!176)))))

(declare-fun e!303139 () Bool)

(assert (=> b!519548 (=> res!318046 e!303139)))

(declare-fun e!303138 () Bool)

(assert (=> b!519548 (= e!303138 e!303139)))

(declare-fun b!519549 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519549 (= e!303140 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237834 #b00000000000000000000000000000000 mask!3524) (select (arr!15945 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!80079 () Bool)

(declare-fun e!303136 () Bool)

(assert (=> d!80079 e!303136))

(declare-fun c!61048 () Bool)

(assert (=> d!80079 (= c!61048 (and (is-Intermediate!4412 lt!237931) (undefined!5224 lt!237931)))))

(assert (=> d!80079 (= lt!237931 e!303137)))

(declare-fun c!61049 () Bool)

(assert (=> d!80079 (= c!61049 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!237932 () (_ BitVec 64))

(assert (=> d!80079 (= lt!237932 (select (arr!15945 a!3235) lt!237834))))

(assert (=> d!80079 (validMask!0 mask!3524)))

(assert (=> d!80079 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237834 (select (arr!15945 a!3235) j!176) a!3235 mask!3524) lt!237931)))

(declare-fun b!519550 () Bool)

(assert (=> b!519550 (= e!303137 e!303140)))

(declare-fun c!61047 () Bool)

(assert (=> b!519550 (= c!61047 (or (= lt!237932 (select (arr!15945 a!3235) j!176)) (= (bvadd lt!237932 lt!237932) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519551 () Bool)

(assert (=> b!519551 (= e!303136 e!303138)))

(declare-fun res!318047 () Bool)

(assert (=> b!519551 (= res!318047 (and (is-Intermediate!4412 lt!237931) (not (undefined!5224 lt!237931)) (bvslt (x!48819 lt!237931) #b01111111111111111111111111111110) (bvsge (x!48819 lt!237931) #b00000000000000000000000000000000) (bvsge (x!48819 lt!237931) #b00000000000000000000000000000000)))))

(assert (=> b!519551 (=> (not res!318047) (not e!303138))))

(declare-fun b!519552 () Bool)

(assert (=> b!519552 (and (bvsge (index!19844 lt!237931) #b00000000000000000000000000000000) (bvslt (index!19844 lt!237931) (size!16309 a!3235)))))

(declare-fun res!318048 () Bool)

(assert (=> b!519552 (= res!318048 (= (select (arr!15945 a!3235) (index!19844 lt!237931)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519552 (=> res!318048 e!303139)))

(declare-fun b!519553 () Bool)

(assert (=> b!519553 (and (bvsge (index!19844 lt!237931) #b00000000000000000000000000000000) (bvslt (index!19844 lt!237931) (size!16309 a!3235)))))

(assert (=> b!519553 (= e!303139 (= (select (arr!15945 a!3235) (index!19844 lt!237931)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!519554 () Bool)

(assert (=> b!519554 (= e!303136 (bvsge (x!48819 lt!237931) #b01111111111111111111111111111110))))

(assert (= (and d!80079 c!61049) b!519547))

(assert (= (and d!80079 (not c!61049)) b!519550))

(assert (= (and b!519550 c!61047) b!519546))

(assert (= (and b!519550 (not c!61047)) b!519549))

(assert (= (and d!80079 c!61048) b!519554))

(assert (= (and d!80079 (not c!61048)) b!519551))

(assert (= (and b!519551 res!318047) b!519548))

(assert (= (and b!519548 (not res!318046)) b!519552))

(assert (= (and b!519552 (not res!318048)) b!519553))

(declare-fun m!500725 () Bool)

(assert (=> b!519553 m!500725))

(assert (=> b!519552 m!500725))

(declare-fun m!500727 () Bool)

(assert (=> b!519549 m!500727))

(assert (=> b!519549 m!500727))

(assert (=> b!519549 m!500577))

(declare-fun m!500729 () Bool)

(assert (=> b!519549 m!500729))

(assert (=> b!519548 m!500725))

(declare-fun m!500731 () Bool)

(assert (=> d!80079 m!500731))

(assert (=> d!80079 m!500603))

(assert (=> b!519391 d!80079))

(declare-fun d!80091 () Bool)

(declare-fun res!318060 () Bool)

(declare-fun e!303166 () Bool)

(assert (=> d!80091 (=> res!318060 e!303166)))

(assert (=> d!80091 (= res!318060 (bvsge j!176 (size!16309 a!3235)))))

(assert (=> d!80091 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!303166)))

(declare-fun b!519599 () Bool)

(declare-fun e!303167 () Bool)

(assert (=> b!519599 (= e!303166 e!303167)))

(declare-fun c!61067 () Bool)

(assert (=> b!519599 (= c!61067 (validKeyInArray!0 (select (arr!15945 a!3235) j!176)))))

(declare-fun bm!31748 () Bool)

(declare-fun call!31751 () Bool)

(assert (=> bm!31748 (= call!31751 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!519600 () Bool)

(declare-fun e!303168 () Bool)

(assert (=> b!519600 (= e!303167 e!303168)))

(declare-fun lt!237952 () (_ BitVec 64))

(assert (=> b!519600 (= lt!237952 (select (arr!15945 a!3235) j!176))))

(declare-fun lt!237954 () Unit!16100)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33169 (_ BitVec 64) (_ BitVec 32)) Unit!16100)

(assert (=> b!519600 (= lt!237954 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237952 j!176))))

(assert (=> b!519600 (arrayContainsKey!0 a!3235 lt!237952 #b00000000000000000000000000000000)))

(declare-fun lt!237953 () Unit!16100)

(assert (=> b!519600 (= lt!237953 lt!237954)))

(declare-fun res!318059 () Bool)

(assert (=> b!519600 (= res!318059 (= (seekEntryOrOpen!0 (select (arr!15945 a!3235) j!176) a!3235 mask!3524) (Found!4412 j!176)))))

(assert (=> b!519600 (=> (not res!318059) (not e!303168))))

(declare-fun b!519601 () Bool)

(assert (=> b!519601 (= e!303167 call!31751)))

(declare-fun b!519602 () Bool)

(assert (=> b!519602 (= e!303168 call!31751)))

(assert (= (and d!80091 (not res!318060)) b!519599))

(assert (= (and b!519599 c!61067) b!519600))

(assert (= (and b!519599 (not c!61067)) b!519601))

(assert (= (and b!519600 res!318059) b!519602))

(assert (= (or b!519602 b!519601) bm!31748))

(assert (=> b!519599 m!500577))

(assert (=> b!519599 m!500577))

(assert (=> b!519599 m!500607))

(declare-fun m!500747 () Bool)

(assert (=> bm!31748 m!500747))

(assert (=> b!519600 m!500577))

(declare-fun m!500749 () Bool)

(assert (=> b!519600 m!500749))

(declare-fun m!500751 () Bool)

(assert (=> b!519600 m!500751))

(assert (=> b!519600 m!500577))

(assert (=> b!519600 m!500611))

(assert (=> b!519391 d!80091))

(declare-fun b!519603 () Bool)

(declare-fun e!303177 () SeekEntryResult!4412)

(assert (=> b!519603 (= e!303177 (Intermediate!4412 false lt!237840 #b00000000000000000000000000000000))))

(declare-fun b!519605 () Bool)

(declare-fun e!303171 () SeekEntryResult!4412)

(assert (=> b!519605 (= e!303171 (Intermediate!4412 true lt!237840 #b00000000000000000000000000000000))))

(declare-fun b!519607 () Bool)

(declare-fun lt!237957 () SeekEntryResult!4412)

(assert (=> b!519607 (and (bvsge (index!19844 lt!237957) #b00000000000000000000000000000000) (bvslt (index!19844 lt!237957) (size!16309 lt!237835)))))

(declare-fun res!318061 () Bool)

(assert (=> b!519607 (= res!318061 (= (select (arr!15945 lt!237835) (index!19844 lt!237957)) lt!237839))))

(declare-fun e!303174 () Bool)

(assert (=> b!519607 (=> res!318061 e!303174)))

(declare-fun e!303173 () Bool)

(assert (=> b!519607 (= e!303173 e!303174)))

(declare-fun b!519609 () Bool)

(assert (=> b!519609 (= e!303177 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237840 #b00000000000000000000000000000000 mask!3524) lt!237839 lt!237835 mask!3524))))

(declare-fun d!80097 () Bool)

(declare-fun e!303170 () Bool)

(assert (=> d!80097 e!303170))

(declare-fun c!61071 () Bool)

(assert (=> d!80097 (= c!61071 (and (is-Intermediate!4412 lt!237957) (undefined!5224 lt!237957)))))

(assert (=> d!80097 (= lt!237957 e!303171)))

(declare-fun c!61073 () Bool)

(assert (=> d!80097 (= c!61073 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!237958 () (_ BitVec 64))

(assert (=> d!80097 (= lt!237958 (select (arr!15945 lt!237835) lt!237840))))

(assert (=> d!80097 (validMask!0 mask!3524)))

(assert (=> d!80097 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237840 lt!237839 lt!237835 mask!3524) lt!237957)))

(declare-fun b!519611 () Bool)

(assert (=> b!519611 (= e!303171 e!303177)))

(declare-fun c!61069 () Bool)

(assert (=> b!519611 (= c!61069 (or (= lt!237958 lt!237839) (= (bvadd lt!237958 lt!237958) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519613 () Bool)

(assert (=> b!519613 (= e!303170 e!303173)))

(declare-fun res!318062 () Bool)

(assert (=> b!519613 (= res!318062 (and (is-Intermediate!4412 lt!237957) (not (undefined!5224 lt!237957)) (bvslt (x!48819 lt!237957) #b01111111111111111111111111111110) (bvsge (x!48819 lt!237957) #b00000000000000000000000000000000) (bvsge (x!48819 lt!237957) #b00000000000000000000000000000000)))))

(assert (=> b!519613 (=> (not res!318062) (not e!303173))))

(declare-fun b!519615 () Bool)

(assert (=> b!519615 (and (bvsge (index!19844 lt!237957) #b00000000000000000000000000000000) (bvslt (index!19844 lt!237957) (size!16309 lt!237835)))))

(declare-fun res!318065 () Bool)

(assert (=> b!519615 (= res!318065 (= (select (arr!15945 lt!237835) (index!19844 lt!237957)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519615 (=> res!318065 e!303174)))

(declare-fun b!519617 () Bool)

(assert (=> b!519617 (and (bvsge (index!19844 lt!237957) #b00000000000000000000000000000000) (bvslt (index!19844 lt!237957) (size!16309 lt!237835)))))

(assert (=> b!519617 (= e!303174 (= (select (arr!15945 lt!237835) (index!19844 lt!237957)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!519619 () Bool)

(assert (=> b!519619 (= e!303170 (bvsge (x!48819 lt!237957) #b01111111111111111111111111111110))))

(assert (= (and d!80097 c!61073) b!519605))

(assert (= (and d!80097 (not c!61073)) b!519611))

(assert (= (and b!519611 c!61069) b!519603))

(assert (= (and b!519611 (not c!61069)) b!519609))

(assert (= (and d!80097 c!61071) b!519619))

(assert (= (and d!80097 (not c!61071)) b!519613))

(assert (= (and b!519613 res!318062) b!519607))

(assert (= (and b!519607 (not res!318061)) b!519615))

(assert (= (and b!519615 (not res!318065)) b!519617))

(declare-fun m!500759 () Bool)

(assert (=> b!519617 m!500759))

(assert (=> b!519615 m!500759))

(declare-fun m!500763 () Bool)

(assert (=> b!519609 m!500763))

(assert (=> b!519609 m!500763))

(declare-fun m!500765 () Bool)

(assert (=> b!519609 m!500765))

(assert (=> b!519607 m!500759))

(declare-fun m!500767 () Bool)

(assert (=> d!80097 m!500767))

(assert (=> d!80097 m!500603))

(assert (=> b!519391 d!80097))

(declare-fun d!80101 () Bool)

(assert (=> d!80101 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!237964 () Unit!16100)

(declare-fun choose!38 (array!33169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16100)

(assert (=> d!80101 (= lt!237964 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80101 (validMask!0 mask!3524)))

(assert (=> d!80101 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!237964)))

(declare-fun bs!16376 () Bool)

(assert (= bs!16376 d!80101))

(assert (=> bs!16376 m!500595))

(declare-fun m!500785 () Bool)

(assert (=> bs!16376 m!500785))

(assert (=> bs!16376 m!500603))

(assert (=> b!519391 d!80101))

(declare-fun d!80109 () Bool)

(declare-fun lt!237972 () (_ BitVec 32))

(declare-fun lt!237971 () (_ BitVec 32))

(assert (=> d!80109 (= lt!237972 (bvmul (bvxor lt!237971 (bvlshr lt!237971 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80109 (= lt!237971 ((_ extract 31 0) (bvand (bvxor (select (arr!15945 a!3235) j!176) (bvlshr (select (arr!15945 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80109 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318082 (let ((h!11016 ((_ extract 31 0) (bvand (bvxor (select (arr!15945 a!3235) j!176) (bvlshr (select (arr!15945 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48827 (bvmul (bvxor h!11016 (bvlshr h!11016 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48827 (bvlshr x!48827 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318082 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318082 #b00000000000000000000000000000000))))))

(assert (=> d!80109 (= (toIndex!0 (select (arr!15945 a!3235) j!176) mask!3524) (bvand (bvxor lt!237972 (bvlshr lt!237972 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!519391 d!80109))

(declare-fun d!80113 () Bool)

(declare-fun lt!237974 () (_ BitVec 32))

(declare-fun lt!237973 () (_ BitVec 32))

(assert (=> d!80113 (= lt!237974 (bvmul (bvxor lt!237973 (bvlshr lt!237973 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80113 (= lt!237973 ((_ extract 31 0) (bvand (bvxor lt!237839 (bvlshr lt!237839 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80113 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318082 (let ((h!11016 ((_ extract 31 0) (bvand (bvxor lt!237839 (bvlshr lt!237839 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48827 (bvmul (bvxor h!11016 (bvlshr h!11016 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48827 (bvlshr x!48827 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318082 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318082 #b00000000000000000000000000000000))))))

(assert (=> d!80113 (= (toIndex!0 lt!237839 mask!3524) (bvand (bvxor lt!237974 (bvlshr lt!237974 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!519391 d!80113))

(declare-fun d!80115 () Bool)

(assert (=> d!80115 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47154 d!80115))

(declare-fun d!80123 () Bool)

(assert (=> d!80123 (= (array_inv!11741 a!3235) (bvsge (size!16309 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47154 d!80123))

(declare-fun b!519729 () Bool)

(declare-fun e!303253 () SeekEntryResult!4412)

(assert (=> b!519729 (= e!303253 Undefined!4412)))

(declare-fun d!80125 () Bool)

(declare-fun lt!238007 () SeekEntryResult!4412)

(assert (=> d!80125 (and (or (is-Undefined!4412 lt!238007) (not (is-Found!4412 lt!238007)) (and (bvsge (index!19843 lt!238007) #b00000000000000000000000000000000) (bvslt (index!19843 lt!238007) (size!16309 a!3235)))) (or (is-Undefined!4412 lt!238007) (is-Found!4412 lt!238007) (not (is-MissingZero!4412 lt!238007)) (and (bvsge (index!19842 lt!238007) #b00000000000000000000000000000000) (bvslt (index!19842 lt!238007) (size!16309 a!3235)))) (or (is-Undefined!4412 lt!238007) (is-Found!4412 lt!238007) (is-MissingZero!4412 lt!238007) (not (is-MissingVacant!4412 lt!238007)) (and (bvsge (index!19845 lt!238007) #b00000000000000000000000000000000) (bvslt (index!19845 lt!238007) (size!16309 a!3235)))) (or (is-Undefined!4412 lt!238007) (ite (is-Found!4412 lt!238007) (= (select (arr!15945 a!3235) (index!19843 lt!238007)) (select (arr!15945 a!3235) j!176)) (ite (is-MissingZero!4412 lt!238007) (= (select (arr!15945 a!3235) (index!19842 lt!238007)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4412 lt!238007) (= (select (arr!15945 a!3235) (index!19845 lt!238007)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80125 (= lt!238007 e!303253)))

(declare-fun c!61109 () Bool)

(declare-fun lt!238005 () SeekEntryResult!4412)

(assert (=> d!80125 (= c!61109 (and (is-Intermediate!4412 lt!238005) (undefined!5224 lt!238005)))))

(assert (=> d!80125 (= lt!238005 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15945 a!3235) j!176) mask!3524) (select (arr!15945 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80125 (validMask!0 mask!3524)))

(assert (=> d!80125 (= (seekEntryOrOpen!0 (select (arr!15945 a!3235) j!176) a!3235 mask!3524) lt!238007)))

(declare-fun b!519730 () Bool)

(declare-fun e!303254 () SeekEntryResult!4412)

(assert (=> b!519730 (= e!303253 e!303254)))

(declare-fun lt!238006 () (_ BitVec 64))

(assert (=> b!519730 (= lt!238006 (select (arr!15945 a!3235) (index!19844 lt!238005)))))

(declare-fun c!61107 () Bool)

(assert (=> b!519730 (= c!61107 (= lt!238006 (select (arr!15945 a!3235) j!176)))))

(declare-fun b!519731 () Bool)

(declare-fun e!303255 () SeekEntryResult!4412)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33169 (_ BitVec 32)) SeekEntryResult!4412)

(assert (=> b!519731 (= e!303255 (seekKeyOrZeroReturnVacant!0 (x!48819 lt!238005) (index!19844 lt!238005) (index!19844 lt!238005) (select (arr!15945 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!519732 () Bool)

(declare-fun c!61108 () Bool)

(assert (=> b!519732 (= c!61108 (= lt!238006 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519732 (= e!303254 e!303255)))

(declare-fun b!519733 () Bool)

(assert (=> b!519733 (= e!303254 (Found!4412 (index!19844 lt!238005)))))

(declare-fun b!519734 () Bool)

(assert (=> b!519734 (= e!303255 (MissingZero!4412 (index!19844 lt!238005)))))

(assert (= (and d!80125 c!61109) b!519729))

(assert (= (and d!80125 (not c!61109)) b!519730))

(assert (= (and b!519730 c!61107) b!519733))

(assert (= (and b!519730 (not c!61107)) b!519732))

(assert (= (and b!519732 c!61108) b!519734))

(assert (= (and b!519732 (not c!61108)) b!519731))

(declare-fun m!500847 () Bool)

(assert (=> d!80125 m!500847))

(declare-fun m!500849 () Bool)

(assert (=> d!80125 m!500849))

(declare-fun m!500851 () Bool)

(assert (=> d!80125 m!500851))

(assert (=> d!80125 m!500577))

(assert (=> d!80125 m!500587))

(assert (=> d!80125 m!500587))

(assert (=> d!80125 m!500577))

(declare-fun m!500853 () Bool)

(assert (=> d!80125 m!500853))

(assert (=> d!80125 m!500603))

(declare-fun m!500855 () Bool)

(assert (=> b!519730 m!500855))

(assert (=> b!519731 m!500577))

(declare-fun m!500857 () Bool)

(assert (=> b!519731 m!500857))

(assert (=> b!519390 d!80125))

(declare-fun d!80145 () Bool)

(declare-fun res!318111 () Bool)

(declare-fun e!303256 () Bool)

(assert (=> d!80145 (=> res!318111 e!303256)))

(assert (=> d!80145 (= res!318111 (bvsge #b00000000000000000000000000000000 (size!16309 a!3235)))))

(assert (=> d!80145 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!303256)))

(declare-fun b!519735 () Bool)

(declare-fun e!303257 () Bool)

(assert (=> b!519735 (= e!303256 e!303257)))

(declare-fun c!61110 () Bool)

(assert (=> b!519735 (= c!61110 (validKeyInArray!0 (select (arr!15945 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31758 () Bool)

(declare-fun call!31761 () Bool)

(assert (=> bm!31758 (= call!31761 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!519736 () Bool)

(declare-fun e!303258 () Bool)

(assert (=> b!519736 (= e!303257 e!303258)))

(declare-fun lt!238008 () (_ BitVec 64))

(assert (=> b!519736 (= lt!238008 (select (arr!15945 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!238010 () Unit!16100)

(assert (=> b!519736 (= lt!238010 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!238008 #b00000000000000000000000000000000))))

(assert (=> b!519736 (arrayContainsKey!0 a!3235 lt!238008 #b00000000000000000000000000000000)))

(declare-fun lt!238009 () Unit!16100)

(assert (=> b!519736 (= lt!238009 lt!238010)))

(declare-fun res!318110 () Bool)

(assert (=> b!519736 (= res!318110 (= (seekEntryOrOpen!0 (select (arr!15945 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4412 #b00000000000000000000000000000000)))))

(assert (=> b!519736 (=> (not res!318110) (not e!303258))))

(declare-fun b!519737 () Bool)

(assert (=> b!519737 (= e!303257 call!31761)))

(declare-fun b!519738 () Bool)

(assert (=> b!519738 (= e!303258 call!31761)))

(assert (= (and d!80145 (not res!318111)) b!519735))

(assert (= (and b!519735 c!61110) b!519736))

(assert (= (and b!519735 (not c!61110)) b!519737))

(assert (= (and b!519736 res!318110) b!519738))

(assert (= (or b!519738 b!519737) bm!31758))

(declare-fun m!500859 () Bool)

(assert (=> b!519735 m!500859))

(assert (=> b!519735 m!500859))

(declare-fun m!500861 () Bool)

(assert (=> b!519735 m!500861))

(declare-fun m!500863 () Bool)

(assert (=> bm!31758 m!500863))

(assert (=> b!519736 m!500859))

(declare-fun m!500865 () Bool)

(assert (=> b!519736 m!500865))

(declare-fun m!500867 () Bool)

(assert (=> b!519736 m!500867))

(assert (=> b!519736 m!500859))

(declare-fun m!500869 () Bool)

(assert (=> b!519736 m!500869))

(assert (=> b!519379 d!80145))

(declare-fun d!80147 () Bool)

(declare-fun res!318119 () Bool)

(declare-fun e!303266 () Bool)

(assert (=> d!80147 (=> res!318119 e!303266)))

(assert (=> d!80147 (= res!318119 (= (select (arr!15945 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!80147 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!303266)))

(declare-fun b!519747 () Bool)

(declare-fun e!303267 () Bool)

(assert (=> b!519747 (= e!303266 e!303267)))

(declare-fun res!318120 () Bool)

(assert (=> b!519747 (=> (not res!318120) (not e!303267))))

(assert (=> b!519747 (= res!318120 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16309 a!3235)))))

(declare-fun b!519748 () Bool)

(assert (=> b!519748 (= e!303267 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80147 (not res!318119)) b!519747))

(assert (= (and b!519747 res!318120) b!519748))

(assert (=> d!80147 m!500859))

(declare-fun m!500879 () Bool)

(assert (=> b!519748 m!500879))

(assert (=> b!519384 d!80147))

(declare-fun d!80151 () Bool)

(assert (=> d!80151 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!519383 d!80151))

(declare-fun b!519749 () Bool)

(declare-fun e!303268 () SeekEntryResult!4412)

(assert (=> b!519749 (= e!303268 Undefined!4412)))

(declare-fun d!80153 () Bool)

(declare-fun lt!238016 () SeekEntryResult!4412)

(assert (=> d!80153 (and (or (is-Undefined!4412 lt!238016) (not (is-Found!4412 lt!238016)) (and (bvsge (index!19843 lt!238016) #b00000000000000000000000000000000) (bvslt (index!19843 lt!238016) (size!16309 a!3235)))) (or (is-Undefined!4412 lt!238016) (is-Found!4412 lt!238016) (not (is-MissingZero!4412 lt!238016)) (and (bvsge (index!19842 lt!238016) #b00000000000000000000000000000000) (bvslt (index!19842 lt!238016) (size!16309 a!3235)))) (or (is-Undefined!4412 lt!238016) (is-Found!4412 lt!238016) (is-MissingZero!4412 lt!238016) (not (is-MissingVacant!4412 lt!238016)) (and (bvsge (index!19845 lt!238016) #b00000000000000000000000000000000) (bvslt (index!19845 lt!238016) (size!16309 a!3235)))) (or (is-Undefined!4412 lt!238016) (ite (is-Found!4412 lt!238016) (= (select (arr!15945 a!3235) (index!19843 lt!238016)) k!2280) (ite (is-MissingZero!4412 lt!238016) (= (select (arr!15945 a!3235) (index!19842 lt!238016)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4412 lt!238016) (= (select (arr!15945 a!3235) (index!19845 lt!238016)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80153 (= lt!238016 e!303268)))

(declare-fun c!61114 () Bool)

(declare-fun lt!238014 () SeekEntryResult!4412)

(assert (=> d!80153 (= c!61114 (and (is-Intermediate!4412 lt!238014) (undefined!5224 lt!238014)))))

(assert (=> d!80153 (= lt!238014 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!80153 (validMask!0 mask!3524)))

(assert (=> d!80153 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!238016)))

(declare-fun b!519750 () Bool)

(declare-fun e!303269 () SeekEntryResult!4412)

(assert (=> b!519750 (= e!303268 e!303269)))

(declare-fun lt!238015 () (_ BitVec 64))

(assert (=> b!519750 (= lt!238015 (select (arr!15945 a!3235) (index!19844 lt!238014)))))

(declare-fun c!61112 () Bool)

(assert (=> b!519750 (= c!61112 (= lt!238015 k!2280))))

(declare-fun b!519751 () Bool)

(declare-fun e!303270 () SeekEntryResult!4412)

(assert (=> b!519751 (= e!303270 (seekKeyOrZeroReturnVacant!0 (x!48819 lt!238014) (index!19844 lt!238014) (index!19844 lt!238014) k!2280 a!3235 mask!3524))))

(declare-fun b!519752 () Bool)

(declare-fun c!61113 () Bool)

(assert (=> b!519752 (= c!61113 (= lt!238015 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519752 (= e!303269 e!303270)))

(declare-fun b!519753 () Bool)

(assert (=> b!519753 (= e!303269 (Found!4412 (index!19844 lt!238014)))))

(declare-fun b!519754 () Bool)

(assert (=> b!519754 (= e!303270 (MissingZero!4412 (index!19844 lt!238014)))))

(assert (= (and d!80153 c!61114) b!519749))

(assert (= (and d!80153 (not c!61114)) b!519750))

(assert (= (and b!519750 c!61112) b!519753))

(assert (= (and b!519750 (not c!61112)) b!519752))

(assert (= (and b!519752 c!61113) b!519754))

(assert (= (and b!519752 (not c!61113)) b!519751))

(declare-fun m!500881 () Bool)

(assert (=> d!80153 m!500881))

(declare-fun m!500883 () Bool)

(assert (=> d!80153 m!500883))

(declare-fun m!500885 () Bool)

(assert (=> d!80153 m!500885))

(declare-fun m!500887 () Bool)

(assert (=> d!80153 m!500887))

(assert (=> d!80153 m!500887))

(declare-fun m!500889 () Bool)

(assert (=> d!80153 m!500889))

(assert (=> d!80153 m!500603))

(declare-fun m!500891 () Bool)

(assert (=> b!519750 m!500891))

(declare-fun m!500893 () Bool)

(assert (=> b!519751 m!500893))

(assert (=> b!519382 d!80153))

(declare-fun d!80155 () Bool)

(assert (=> d!80155 (= (validKeyInArray!0 (select (arr!15945 a!3235) j!176)) (and (not (= (select (arr!15945 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15945 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!519387 d!80155))

(declare-fun b!519778 () Bool)

(declare-fun e!303290 () Bool)

(declare-fun contains!2757 (List!10103 (_ BitVec 64)) Bool)

(assert (=> b!519778 (= e!303290 (contains!2757 Nil!10100 (select (arr!15945 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!519779 () Bool)

(declare-fun e!303288 () Bool)

(declare-fun e!303289 () Bool)

(assert (=> b!519779 (= e!303288 e!303289)))

(declare-fun c!61121 () Bool)

(assert (=> b!519779 (= c!61121 (validKeyInArray!0 (select (arr!15945 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!519780 () Bool)

(declare-fun e!303287 () Bool)

(assert (=> b!519780 (= e!303287 e!303288)))

(declare-fun res!318132 () Bool)

(assert (=> b!519780 (=> (not res!318132) (not e!303288))))

(assert (=> b!519780 (= res!318132 (not e!303290))))

(declare-fun res!318133 () Bool)

(assert (=> b!519780 (=> (not res!318133) (not e!303290))))

(assert (=> b!519780 (= res!318133 (validKeyInArray!0 (select (arr!15945 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80157 () Bool)

(declare-fun res!318134 () Bool)

(assert (=> d!80157 (=> res!318134 e!303287)))

(assert (=> d!80157 (= res!318134 (bvsge #b00000000000000000000000000000000 (size!16309 a!3235)))))

(assert (=> d!80157 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10100) e!303287)))

(declare-fun b!519781 () Bool)

(declare-fun call!31766 () Bool)

(assert (=> b!519781 (= e!303289 call!31766)))

(declare-fun b!519782 () Bool)

(assert (=> b!519782 (= e!303289 call!31766)))

(declare-fun bm!31763 () Bool)

(assert (=> bm!31763 (= call!31766 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61121 (Cons!10099 (select (arr!15945 a!3235) #b00000000000000000000000000000000) Nil!10100) Nil!10100)))))

(assert (= (and d!80157 (not res!318134)) b!519780))

(assert (= (and b!519780 res!318133) b!519778))

(assert (= (and b!519780 res!318132) b!519779))

(assert (= (and b!519779 c!61121) b!519781))

(assert (= (and b!519779 (not c!61121)) b!519782))

(assert (= (or b!519781 b!519782) bm!31763))

(assert (=> b!519778 m!500859))

(assert (=> b!519778 m!500859))

(declare-fun m!500909 () Bool)

(assert (=> b!519778 m!500909))

(assert (=> b!519779 m!500859))

(assert (=> b!519779 m!500859))

(assert (=> b!519779 m!500861))

(assert (=> b!519780 m!500859))

(assert (=> b!519780 m!500859))

(assert (=> b!519780 m!500861))

(assert (=> bm!31763 m!500859))

(declare-fun m!500911 () Bool)

(assert (=> bm!31763 m!500911))

(assert (=> b!519392 d!80157))

(declare-fun d!80169 () Bool)

(declare-fun e!303298 () Bool)

(assert (=> d!80169 e!303298))

(declare-fun res!318140 () Bool)

(assert (=> d!80169 (=> (not res!318140) (not e!303298))))

(assert (=> d!80169 (= res!318140 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16309 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16309 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16309 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16309 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16309 a!3235))))))

(declare-fun lt!238037 () Unit!16100)

(declare-fun choose!47 (array!33169 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16100)

(assert (=> d!80169 (= lt!238037 (choose!47 a!3235 i!1204 k!2280 j!176 lt!237834 #b00000000000000000000000000000000 (index!19844 lt!237837) (x!48819 lt!237837) mask!3524))))

(assert (=> d!80169 (validMask!0 mask!3524)))

(assert (=> d!80169 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!237834 #b00000000000000000000000000000000 (index!19844 lt!237837) (x!48819 lt!237837) mask!3524) lt!238037)))

(declare-fun b!519794 () Bool)

(assert (=> b!519794 (= e!303298 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237834 (select (store (arr!15945 a!3235) i!1204 k!2280) j!176) (array!33170 (store (arr!15945 a!3235) i!1204 k!2280) (size!16309 a!3235)) mask!3524) (Intermediate!4412 false (index!19844 lt!237837) (x!48819 lt!237837))))))

(assert (= (and d!80169 res!318140) b!519794))

(declare-fun m!500921 () Bool)

(assert (=> d!80169 m!500921))

(assert (=> d!80169 m!500603))

(assert (=> b!519794 m!500581))

(assert (=> b!519794 m!500585))

(assert (=> b!519794 m!500585))

(declare-fun m!500923 () Bool)

(assert (=> b!519794 m!500923))

(assert (=> b!519381 d!80169))

(declare-fun b!519795 () Bool)

(declare-fun e!303303 () SeekEntryResult!4412)

(assert (=> b!519795 (= e!303303 (Intermediate!4412 false lt!237834 #b00000000000000000000000000000000))))

(declare-fun b!519796 () Bool)

(declare-fun e!303300 () SeekEntryResult!4412)

(assert (=> b!519796 (= e!303300 (Intermediate!4412 true lt!237834 #b00000000000000000000000000000000))))

(declare-fun b!519797 () Bool)

(declare-fun lt!238038 () SeekEntryResult!4412)

(assert (=> b!519797 (and (bvsge (index!19844 lt!238038) #b00000000000000000000000000000000) (bvslt (index!19844 lt!238038) (size!16309 lt!237835)))))

(declare-fun res!318141 () Bool)

(assert (=> b!519797 (= res!318141 (= (select (arr!15945 lt!237835) (index!19844 lt!238038)) lt!237839))))

(declare-fun e!303302 () Bool)

(assert (=> b!519797 (=> res!318141 e!303302)))

(declare-fun e!303301 () Bool)

(assert (=> b!519797 (= e!303301 e!303302)))

(declare-fun b!519798 () Bool)

(assert (=> b!519798 (= e!303303 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237834 #b00000000000000000000000000000000 mask!3524) lt!237839 lt!237835 mask!3524))))

(declare-fun d!80171 () Bool)

(declare-fun e!303299 () Bool)

(assert (=> d!80171 e!303299))

(declare-fun c!61126 () Bool)

(assert (=> d!80171 (= c!61126 (and (is-Intermediate!4412 lt!238038) (undefined!5224 lt!238038)))))

(assert (=> d!80171 (= lt!238038 e!303300)))

(declare-fun c!61127 () Bool)

(assert (=> d!80171 (= c!61127 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!238039 () (_ BitVec 64))

(assert (=> d!80171 (= lt!238039 (select (arr!15945 lt!237835) lt!237834))))

(assert (=> d!80171 (validMask!0 mask!3524)))

(assert (=> d!80171 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237834 lt!237839 lt!237835 mask!3524) lt!238038)))

(declare-fun b!519799 () Bool)

(assert (=> b!519799 (= e!303300 e!303303)))

(declare-fun c!61125 () Bool)

(assert (=> b!519799 (= c!61125 (or (= lt!238039 lt!237839) (= (bvadd lt!238039 lt!238039) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519800 () Bool)

(assert (=> b!519800 (= e!303299 e!303301)))

(declare-fun res!318142 () Bool)

(assert (=> b!519800 (= res!318142 (and (is-Intermediate!4412 lt!238038) (not (undefined!5224 lt!238038)) (bvslt (x!48819 lt!238038) #b01111111111111111111111111111110) (bvsge (x!48819 lt!238038) #b00000000000000000000000000000000) (bvsge (x!48819 lt!238038) #b00000000000000000000000000000000)))))

(assert (=> b!519800 (=> (not res!318142) (not e!303301))))

(declare-fun b!519801 () Bool)

(assert (=> b!519801 (and (bvsge (index!19844 lt!238038) #b00000000000000000000000000000000) (bvslt (index!19844 lt!238038) (size!16309 lt!237835)))))

(declare-fun res!318143 () Bool)

(assert (=> b!519801 (= res!318143 (= (select (arr!15945 lt!237835) (index!19844 lt!238038)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519801 (=> res!318143 e!303302)))

(declare-fun b!519802 () Bool)

(assert (=> b!519802 (and (bvsge (index!19844 lt!238038) #b00000000000000000000000000000000) (bvslt (index!19844 lt!238038) (size!16309 lt!237835)))))

(assert (=> b!519802 (= e!303302 (= (select (arr!15945 lt!237835) (index!19844 lt!238038)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!519803 () Bool)

(assert (=> b!519803 (= e!303299 (bvsge (x!48819 lt!238038) #b01111111111111111111111111111110))))

(assert (= (and d!80171 c!61127) b!519796))

(assert (= (and d!80171 (not c!61127)) b!519799))

(assert (= (and b!519799 c!61125) b!519795))

(assert (= (and b!519799 (not c!61125)) b!519798))

(assert (= (and d!80171 c!61126) b!519803))

(assert (= (and d!80171 (not c!61126)) b!519800))

(assert (= (and b!519800 res!318142) b!519797))

(assert (= (and b!519797 (not res!318141)) b!519801))

(assert (= (and b!519801 (not res!318143)) b!519802))

(declare-fun m!500925 () Bool)

(assert (=> b!519802 m!500925))

(assert (=> b!519801 m!500925))

(assert (=> b!519798 m!500727))

(assert (=> b!519798 m!500727))

(declare-fun m!500927 () Bool)

(assert (=> b!519798 m!500927))

(assert (=> b!519797 m!500925))

(declare-fun m!500929 () Bool)

(assert (=> d!80171 m!500929))

(assert (=> d!80171 m!500603))

(assert (=> b!519381 d!80171))

(push 1)

