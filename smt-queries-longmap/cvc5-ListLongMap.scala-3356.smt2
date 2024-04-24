; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46122 () Bool)

(assert start!46122)

(declare-fun b!511020 () Bool)

(declare-fun res!311918 () Bool)

(declare-fun e!298613 () Bool)

(assert (=> b!511020 (=> (not res!311918) (not e!298613))))

(declare-datatypes ((array!32834 0))(
  ( (array!32835 (arr!15795 (Array (_ BitVec 32) (_ BitVec 64))) (size!16159 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32834)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!511020 (= res!311918 (validKeyInArray!0 (select (arr!15795 a!3235) j!176)))))

(declare-fun b!511021 () Bool)

(declare-fun res!311923 () Bool)

(assert (=> b!511021 (=> (not res!311923) (not e!298613))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!511021 (= res!311923 (validKeyInArray!0 k!2280))))

(declare-fun b!511022 () Bool)

(declare-fun res!311924 () Bool)

(declare-fun e!298611 () Bool)

(assert (=> b!511022 (=> (not res!311924) (not e!298611))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32834 (_ BitVec 32)) Bool)

(assert (=> b!511022 (= res!311924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!511023 () Bool)

(declare-fun e!298612 () Bool)

(declare-datatypes ((SeekEntryResult!4218 0))(
  ( (MissingZero!4218 (index!19060 (_ BitVec 32))) (Found!4218 (index!19061 (_ BitVec 32))) (Intermediate!4218 (undefined!5030 Bool) (index!19062 (_ BitVec 32)) (x!48152 (_ BitVec 32))) (Undefined!4218) (MissingVacant!4218 (index!19063 (_ BitVec 32))) )
))
(declare-fun lt!233825 () SeekEntryResult!4218)

(declare-fun lt!233824 () SeekEntryResult!4218)

(assert (=> b!511023 (= e!298612 (or (not (is-Intermediate!4218 lt!233825)) (not (undefined!5030 lt!233825)) (= lt!233824 Undefined!4218)))))

(declare-fun b!511024 () Bool)

(assert (=> b!511024 (= e!298613 e!298611)))

(declare-fun res!311919 () Bool)

(assert (=> b!511024 (=> (not res!311919) (not e!298611))))

(declare-fun lt!233827 () SeekEntryResult!4218)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!511024 (= res!311919 (or (= lt!233827 (MissingZero!4218 i!1204)) (= lt!233827 (MissingVacant!4218 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32834 (_ BitVec 32)) SeekEntryResult!4218)

(assert (=> b!511024 (= lt!233827 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!511025 () Bool)

(assert (=> b!511025 (= e!298611 (not e!298612))))

(declare-fun res!311925 () Bool)

(assert (=> b!511025 (=> res!311925 e!298612)))

(declare-fun lt!233826 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32834 (_ BitVec 32)) SeekEntryResult!4218)

(assert (=> b!511025 (= res!311925 (= lt!233825 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233826 (select (store (arr!15795 a!3235) i!1204 k!2280) j!176) (array!32835 (store (arr!15795 a!3235) i!1204 k!2280) (size!16159 a!3235)) mask!3524)))))

(declare-fun lt!233822 () (_ BitVec 32))

(assert (=> b!511025 (= lt!233825 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233822 (select (arr!15795 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511025 (= lt!233826 (toIndex!0 (select (store (arr!15795 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!511025 (= lt!233822 (toIndex!0 (select (arr!15795 a!3235) j!176) mask!3524))))

(assert (=> b!511025 (= lt!233824 (Found!4218 j!176))))

(assert (=> b!511025 (= lt!233824 (seekEntryOrOpen!0 (select (arr!15795 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!511025 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15755 0))(
  ( (Unit!15756) )
))
(declare-fun lt!233823 () Unit!15755)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32834 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15755)

(assert (=> b!511025 (= lt!233823 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!511026 () Bool)

(declare-fun res!311926 () Bool)

(assert (=> b!511026 (=> (not res!311926) (not e!298613))))

(assert (=> b!511026 (= res!311926 (and (= (size!16159 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16159 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16159 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!511027 () Bool)

(declare-fun res!311921 () Bool)

(assert (=> b!511027 (=> (not res!311921) (not e!298611))))

(declare-datatypes ((List!9860 0))(
  ( (Nil!9857) (Cons!9856 (h!10733 (_ BitVec 64)) (t!16080 List!9860)) )
))
(declare-fun arrayNoDuplicates!0 (array!32834 (_ BitVec 32) List!9860) Bool)

(assert (=> b!511027 (= res!311921 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9857))))

(declare-fun b!511019 () Bool)

(declare-fun res!311920 () Bool)

(assert (=> b!511019 (=> (not res!311920) (not e!298613))))

(declare-fun arrayContainsKey!0 (array!32834 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!511019 (= res!311920 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!311922 () Bool)

(assert (=> start!46122 (=> (not res!311922) (not e!298613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46122 (= res!311922 (validMask!0 mask!3524))))

(assert (=> start!46122 e!298613))

(assert (=> start!46122 true))

(declare-fun array_inv!11654 (array!32834) Bool)

(assert (=> start!46122 (array_inv!11654 a!3235)))

(assert (= (and start!46122 res!311922) b!511026))

(assert (= (and b!511026 res!311926) b!511020))

(assert (= (and b!511020 res!311918) b!511021))

(assert (= (and b!511021 res!311923) b!511019))

(assert (= (and b!511019 res!311920) b!511024))

(assert (= (and b!511024 res!311919) b!511022))

(assert (= (and b!511022 res!311924) b!511027))

(assert (= (and b!511027 res!311921) b!511025))

(assert (= (and b!511025 (not res!311925)) b!511023))

(declare-fun m!492793 () Bool)

(assert (=> start!46122 m!492793))

(declare-fun m!492795 () Bool)

(assert (=> start!46122 m!492795))

(declare-fun m!492797 () Bool)

(assert (=> b!511021 m!492797))

(declare-fun m!492799 () Bool)

(assert (=> b!511022 m!492799))

(declare-fun m!492801 () Bool)

(assert (=> b!511024 m!492801))

(declare-fun m!492803 () Bool)

(assert (=> b!511027 m!492803))

(declare-fun m!492805 () Bool)

(assert (=> b!511020 m!492805))

(assert (=> b!511020 m!492805))

(declare-fun m!492807 () Bool)

(assert (=> b!511020 m!492807))

(declare-fun m!492809 () Bool)

(assert (=> b!511025 m!492809))

(assert (=> b!511025 m!492805))

(declare-fun m!492811 () Bool)

(assert (=> b!511025 m!492811))

(declare-fun m!492813 () Bool)

(assert (=> b!511025 m!492813))

(declare-fun m!492815 () Bool)

(assert (=> b!511025 m!492815))

(assert (=> b!511025 m!492805))

(declare-fun m!492817 () Bool)

(assert (=> b!511025 m!492817))

(assert (=> b!511025 m!492815))

(declare-fun m!492819 () Bool)

(assert (=> b!511025 m!492819))

(assert (=> b!511025 m!492805))

(declare-fun m!492821 () Bool)

(assert (=> b!511025 m!492821))

(assert (=> b!511025 m!492805))

(declare-fun m!492823 () Bool)

(assert (=> b!511025 m!492823))

(assert (=> b!511025 m!492815))

(declare-fun m!492825 () Bool)

(assert (=> b!511025 m!492825))

(declare-fun m!492827 () Bool)

(assert (=> b!511019 m!492827))

(push 1)

(assert (not b!511021))

(assert (not b!511019))

(assert (not start!46122))

(assert (not b!511027))

(assert (not b!511022))

(assert (not b!511024))

(assert (not b!511025))

(assert (not b!511020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!511073 () Bool)

(declare-fun e!298646 () Bool)

(declare-fun call!31485 () Bool)

(assert (=> b!511073 (= e!298646 call!31485)))

(declare-fun d!78911 () Bool)

(declare-fun res!311945 () Bool)

(declare-fun e!298648 () Bool)

(assert (=> d!78911 (=> res!311945 e!298648)))

(assert (=> d!78911 (= res!311945 (bvsge #b00000000000000000000000000000000 (size!16159 a!3235)))))

(assert (=> d!78911 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!298648)))

(declare-fun b!511074 () Bool)

(declare-fun e!298647 () Bool)

(assert (=> b!511074 (= e!298648 e!298647)))

(declare-fun c!59843 () Bool)

(assert (=> b!511074 (= c!59843 (validKeyInArray!0 (select (arr!15795 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!511075 () Bool)

(assert (=> b!511075 (= e!298647 e!298646)))

(declare-fun lt!233850 () (_ BitVec 64))

(assert (=> b!511075 (= lt!233850 (select (arr!15795 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!233851 () Unit!15755)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32834 (_ BitVec 64) (_ BitVec 32)) Unit!15755)

(assert (=> b!511075 (= lt!233851 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!233850 #b00000000000000000000000000000000))))

(assert (=> b!511075 (arrayContainsKey!0 a!3235 lt!233850 #b00000000000000000000000000000000)))

(declare-fun lt!233849 () Unit!15755)

(assert (=> b!511075 (= lt!233849 lt!233851)))

(declare-fun res!311946 () Bool)

(assert (=> b!511075 (= res!311946 (= (seekEntryOrOpen!0 (select (arr!15795 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4218 #b00000000000000000000000000000000)))))

(assert (=> b!511075 (=> (not res!311946) (not e!298646))))

(declare-fun bm!31482 () Bool)

(assert (=> bm!31482 (= call!31485 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!511076 () Bool)

(assert (=> b!511076 (= e!298647 call!31485)))

(assert (= (and d!78911 (not res!311945)) b!511074))

(assert (= (and b!511074 c!59843) b!511075))

(assert (= (and b!511074 (not c!59843)) b!511076))

(assert (= (and b!511075 res!311946) b!511073))

(assert (= (or b!511073 b!511076) bm!31482))

(declare-fun m!492849 () Bool)

(assert (=> b!511074 m!492849))

(assert (=> b!511074 m!492849))

(declare-fun m!492851 () Bool)

(assert (=> b!511074 m!492851))

(assert (=> b!511075 m!492849))

(declare-fun m!492853 () Bool)

(assert (=> b!511075 m!492853))

(declare-fun m!492855 () Bool)

(assert (=> b!511075 m!492855))

(assert (=> b!511075 m!492849))

(declare-fun m!492857 () Bool)

(assert (=> b!511075 m!492857))

(declare-fun m!492859 () Bool)

(assert (=> bm!31482 m!492859))

(assert (=> b!511022 d!78911))

(declare-fun b!511097 () Bool)

(declare-fun e!298666 () Bool)

(declare-fun call!31490 () Bool)

(assert (=> b!511097 (= e!298666 call!31490)))

(declare-fun b!511098 () Bool)

(declare-fun e!298665 () Bool)

(assert (=> b!511098 (= e!298665 e!298666)))

(declare-fun c!59848 () Bool)

(assert (=> b!511098 (= c!59848 (validKeyInArray!0 (select (arr!15795 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!78917 () Bool)

(declare-fun res!311959 () Bool)

(declare-fun e!298667 () Bool)

(assert (=> d!78917 (=> res!311959 e!298667)))

(assert (=> d!78917 (= res!311959 (bvsge #b00000000000000000000000000000000 (size!16159 a!3235)))))

(assert (=> d!78917 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9857) e!298667)))

(declare-fun b!511099 () Bool)

(assert (=> b!511099 (= e!298666 call!31490)))

(declare-fun bm!31487 () Bool)

(assert (=> bm!31487 (= call!31490 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59848 (Cons!9856 (select (arr!15795 a!3235) #b00000000000000000000000000000000) Nil!9857) Nil!9857)))))

(declare-fun b!511100 () Bool)

(assert (=> b!511100 (= e!298667 e!298665)))

(declare-fun res!311960 () Bool)

(assert (=> b!511100 (=> (not res!311960) (not e!298665))))

(declare-fun e!298668 () Bool)

(assert (=> b!511100 (= res!311960 (not e!298668))))

(declare-fun res!311961 () Bool)

(assert (=> b!511100 (=> (not res!311961) (not e!298668))))

(assert (=> b!511100 (= res!311961 (validKeyInArray!0 (select (arr!15795 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!511101 () Bool)

(declare-fun contains!2700 (List!9860 (_ BitVec 64)) Bool)

(assert (=> b!511101 (= e!298668 (contains!2700 Nil!9857 (select (arr!15795 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!78917 (not res!311959)) b!511100))

(assert (= (and b!511100 res!311961) b!511101))

(assert (= (and b!511100 res!311960) b!511098))

(assert (= (and b!511098 c!59848) b!511099))

(assert (= (and b!511098 (not c!59848)) b!511097))

(assert (= (or b!511099 b!511097) bm!31487))

(assert (=> b!511098 m!492849))

(assert (=> b!511098 m!492849))

(assert (=> b!511098 m!492851))

(assert (=> bm!31487 m!492849))

(declare-fun m!492863 () Bool)

(assert (=> bm!31487 m!492863))

(assert (=> b!511100 m!492849))

(assert (=> b!511100 m!492849))

(assert (=> b!511100 m!492851))

(assert (=> b!511101 m!492849))

(assert (=> b!511101 m!492849))

(declare-fun m!492865 () Bool)

(assert (=> b!511101 m!492865))

(assert (=> b!511027 d!78917))

(declare-fun d!78921 () Bool)

(assert (=> d!78921 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!511021 d!78921))

(declare-fun d!78923 () Bool)

(assert (=> d!78923 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46122 d!78923))

(declare-fun d!78929 () Bool)

(assert (=> d!78929 (= (array_inv!11654 a!3235) (bvsge (size!16159 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46122 d!78929))

(declare-fun d!78933 () Bool)

(declare-fun res!311968 () Bool)

(declare-fun e!298676 () Bool)

(assert (=> d!78933 (=> res!311968 e!298676)))

(assert (=> d!78933 (= res!311968 (= (select (arr!15795 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!78933 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!298676)))

(declare-fun b!511110 () Bool)

(declare-fun e!298677 () Bool)

(assert (=> b!511110 (= e!298676 e!298677)))

(declare-fun res!311969 () Bool)

(assert (=> b!511110 (=> (not res!311969) (not e!298677))))

(assert (=> b!511110 (= res!311969 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16159 a!3235)))))

(declare-fun b!511111 () Bool)

(assert (=> b!511111 (= e!298677 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78933 (not res!311968)) b!511110))

(assert (= (and b!511110 res!311969) b!511111))

(assert (=> d!78933 m!492849))

(declare-fun m!492873 () Bool)

(assert (=> b!511111 m!492873))

(assert (=> b!511019 d!78933))

(declare-fun b!511142 () Bool)

(declare-fun e!298694 () SeekEntryResult!4218)

(declare-fun lt!233871 () SeekEntryResult!4218)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32834 (_ BitVec 32)) SeekEntryResult!4218)

(assert (=> b!511142 (= e!298694 (seekKeyOrZeroReturnVacant!0 (x!48152 lt!233871) (index!19062 lt!233871) (index!19062 lt!233871) k!2280 a!3235 mask!3524))))

(declare-fun b!511143 () Bool)

(declare-fun c!59864 () Bool)

(declare-fun lt!233873 () (_ BitVec 64))

(assert (=> b!511143 (= c!59864 (= lt!233873 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!298695 () SeekEntryResult!4218)

(assert (=> b!511143 (= e!298695 e!298694)))

(declare-fun b!511144 () Bool)

(assert (=> b!511144 (= e!298694 (MissingZero!4218 (index!19062 lt!233871)))))

(declare-fun b!511145 () Bool)

(assert (=> b!511145 (= e!298695 (Found!4218 (index!19062 lt!233871)))))

(declare-fun d!78937 () Bool)

(declare-fun lt!233872 () SeekEntryResult!4218)

(assert (=> d!78937 (and (or (is-Undefined!4218 lt!233872) (not (is-Found!4218 lt!233872)) (and (bvsge (index!19061 lt!233872) #b00000000000000000000000000000000) (bvslt (index!19061 lt!233872) (size!16159 a!3235)))) (or (is-Undefined!4218 lt!233872) (is-Found!4218 lt!233872) (not (is-MissingZero!4218 lt!233872)) (and (bvsge (index!19060 lt!233872) #b00000000000000000000000000000000) (bvslt (index!19060 lt!233872) (size!16159 a!3235)))) (or (is-Undefined!4218 lt!233872) (is-Found!4218 lt!233872) (is-MissingZero!4218 lt!233872) (not (is-MissingVacant!4218 lt!233872)) (and (bvsge (index!19063 lt!233872) #b00000000000000000000000000000000) (bvslt (index!19063 lt!233872) (size!16159 a!3235)))) (or (is-Undefined!4218 lt!233872) (ite (is-Found!4218 lt!233872) (= (select (arr!15795 a!3235) (index!19061 lt!233872)) k!2280) (ite (is-MissingZero!4218 lt!233872) (= (select (arr!15795 a!3235) (index!19060 lt!233872)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4218 lt!233872) (= (select (arr!15795 a!3235) (index!19063 lt!233872)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!298696 () SeekEntryResult!4218)

(assert (=> d!78937 (= lt!233872 e!298696)))

(declare-fun c!59863 () Bool)

(assert (=> d!78937 (= c!59863 (and (is-Intermediate!4218 lt!233871) (undefined!5030 lt!233871)))))

(assert (=> d!78937 (= lt!233871 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!78937 (validMask!0 mask!3524)))

(assert (=> d!78937 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!233872)))

(declare-fun b!511146 () Bool)

(assert (=> b!511146 (= e!298696 Undefined!4218)))

(declare-fun b!511147 () Bool)

(assert (=> b!511147 (= e!298696 e!298695)))

(assert (=> b!511147 (= lt!233873 (select (arr!15795 a!3235) (index!19062 lt!233871)))))

(declare-fun c!59862 () Bool)

(assert (=> b!511147 (= c!59862 (= lt!233873 k!2280))))

(assert (= (and d!78937 c!59863) b!511146))

(assert (= (and d!78937 (not c!59863)) b!511147))

(assert (= (and b!511147 c!59862) b!511145))

(assert (= (and b!511147 (not c!59862)) b!511143))

(assert (= (and b!511143 c!59864) b!511144))

(assert (= (and b!511143 (not c!59864)) b!511142))

(declare-fun m!492875 () Bool)

(assert (=> b!511142 m!492875))

(declare-fun m!492877 () Bool)

(assert (=> d!78937 m!492877))

(assert (=> d!78937 m!492793))

(assert (=> d!78937 m!492877))

(declare-fun m!492879 () Bool)

(assert (=> d!78937 m!492879))

(declare-fun m!492881 () Bool)

(assert (=> d!78937 m!492881))

(declare-fun m!492883 () Bool)

(assert (=> d!78937 m!492883))

(declare-fun m!492885 () Bool)

(assert (=> d!78937 m!492885))

(declare-fun m!492887 () Bool)

(assert (=> b!511147 m!492887))

(assert (=> b!511024 d!78937))

(declare-fun d!78939 () Bool)

(assert (=> d!78939 (= (validKeyInArray!0 (select (arr!15795 a!3235) j!176)) (and (not (= (select (arr!15795 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15795 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!511020 d!78939))

(declare-fun d!78941 () Bool)

(declare-fun lt!233889 () (_ BitVec 32))

(declare-fun lt!233888 () (_ BitVec 32))

(assert (=> d!78941 (= lt!233889 (bvmul (bvxor lt!233888 (bvlshr lt!233888 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78941 (= lt!233888 ((_ extract 31 0) (bvand (bvxor (select (arr!15795 a!3235) j!176) (bvlshr (select (arr!15795 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78941 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!311979 (let ((h!10735 ((_ extract 31 0) (bvand (bvxor (select (arr!15795 a!3235) j!176) (bvlshr (select (arr!15795 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48155 (bvmul (bvxor h!10735 (bvlshr h!10735 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48155 (bvlshr x!48155 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!311979 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!311979 #b00000000000000000000000000000000))))))

(assert (=> d!78941 (= (toIndex!0 (select (arr!15795 a!3235) j!176) mask!3524) (bvand (bvxor lt!233889 (bvlshr lt!233889 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!511025 d!78941))

(declare-fun lt!233890 () SeekEntryResult!4218)

(declare-fun b!511178 () Bool)

(declare-fun e!298713 () SeekEntryResult!4218)

(assert (=> b!511178 (= e!298713 (seekKeyOrZeroReturnVacant!0 (x!48152 lt!233890) (index!19062 lt!233890) (index!19062 lt!233890) (select (arr!15795 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!511179 () Bool)

(declare-fun c!59879 () Bool)

(declare-fun lt!233892 () (_ BitVec 64))

(assert (=> b!511179 (= c!59879 (= lt!233892 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!298714 () SeekEntryResult!4218)

(assert (=> b!511179 (= e!298714 e!298713)))

(declare-fun b!511180 () Bool)

(assert (=> b!511180 (= e!298713 (MissingZero!4218 (index!19062 lt!233890)))))

(declare-fun b!511181 () Bool)

(assert (=> b!511181 (= e!298714 (Found!4218 (index!19062 lt!233890)))))

(declare-fun d!78947 () Bool)

(declare-fun lt!233891 () SeekEntryResult!4218)

(assert (=> d!78947 (and (or (is-Undefined!4218 lt!233891) (not (is-Found!4218 lt!233891)) (and (bvsge (index!19061 lt!233891) #b00000000000000000000000000000000) (bvslt (index!19061 lt!233891) (size!16159 a!3235)))) (or (is-Undefined!4218 lt!233891) (is-Found!4218 lt!233891) (not (is-MissingZero!4218 lt!233891)) (and (bvsge (index!19060 lt!233891) #b00000000000000000000000000000000) (bvslt (index!19060 lt!233891) (size!16159 a!3235)))) (or (is-Undefined!4218 lt!233891) (is-Found!4218 lt!233891) (is-MissingZero!4218 lt!233891) (not (is-MissingVacant!4218 lt!233891)) (and (bvsge (index!19063 lt!233891) #b00000000000000000000000000000000) (bvslt (index!19063 lt!233891) (size!16159 a!3235)))) (or (is-Undefined!4218 lt!233891) (ite (is-Found!4218 lt!233891) (= (select (arr!15795 a!3235) (index!19061 lt!233891)) (select (arr!15795 a!3235) j!176)) (ite (is-MissingZero!4218 lt!233891) (= (select (arr!15795 a!3235) (index!19060 lt!233891)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4218 lt!233891) (= (select (arr!15795 a!3235) (index!19063 lt!233891)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!298715 () SeekEntryResult!4218)

(assert (=> d!78947 (= lt!233891 e!298715)))

(declare-fun c!59878 () Bool)

(assert (=> d!78947 (= c!59878 (and (is-Intermediate!4218 lt!233890) (undefined!5030 lt!233890)))))

(assert (=> d!78947 (= lt!233890 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15795 a!3235) j!176) mask!3524) (select (arr!15795 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78947 (validMask!0 mask!3524)))

(assert (=> d!78947 (= (seekEntryOrOpen!0 (select (arr!15795 a!3235) j!176) a!3235 mask!3524) lt!233891)))

(declare-fun b!511182 () Bool)

(assert (=> b!511182 (= e!298715 Undefined!4218)))

(declare-fun b!511183 () Bool)

(assert (=> b!511183 (= e!298715 e!298714)))

(assert (=> b!511183 (= lt!233892 (select (arr!15795 a!3235) (index!19062 lt!233890)))))

(declare-fun c!59877 () Bool)

(assert (=> b!511183 (= c!59877 (= lt!233892 (select (arr!15795 a!3235) j!176)))))

(assert (= (and d!78947 c!59878) b!511182))

(assert (= (and d!78947 (not c!59878)) b!511183))

(assert (= (and b!511183 c!59877) b!511181))

(assert (= (and b!511183 (not c!59877)) b!511179))

(assert (= (and b!511179 c!59879) b!511180))

(assert (= (and b!511179 (not c!59879)) b!511178))

(assert (=> b!511178 m!492805))

(declare-fun m!492905 () Bool)

(assert (=> b!511178 m!492905))

(assert (=> d!78947 m!492805))

(assert (=> d!78947 m!492817))

(assert (=> d!78947 m!492793))

(assert (=> d!78947 m!492817))

(assert (=> d!78947 m!492805))

(declare-fun m!492907 () Bool)

(assert (=> d!78947 m!492907))

(declare-fun m!492909 () Bool)

(assert (=> d!78947 m!492909))

(declare-fun m!492911 () Bool)

(assert (=> d!78947 m!492911))

(declare-fun m!492913 () Bool)

(assert (=> d!78947 m!492913))

(declare-fun m!492915 () Bool)

(assert (=> b!511183 m!492915))

(assert (=> b!511025 d!78947))

(declare-fun b!511184 () Bool)

(declare-fun e!298716 () Bool)

(declare-fun call!31492 () Bool)

(assert (=> b!511184 (= e!298716 call!31492)))

(declare-fun d!78949 () Bool)

(declare-fun res!311983 () Bool)

(declare-fun e!298718 () Bool)

(assert (=> d!78949 (=> res!311983 e!298718)))

(assert (=> d!78949 (= res!311983 (bvsge j!176 (size!16159 a!3235)))))

(assert (=> d!78949 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!298718)))

(declare-fun b!511185 () Bool)

(declare-fun e!298717 () Bool)

(assert (=> b!511185 (= e!298718 e!298717)))

(declare-fun c!59880 () Bool)

(assert (=> b!511185 (= c!59880 (validKeyInArray!0 (select (arr!15795 a!3235) j!176)))))

(declare-fun b!511186 () Bool)

(assert (=> b!511186 (= e!298717 e!298716)))

(declare-fun lt!233894 () (_ BitVec 64))

(assert (=> b!511186 (= lt!233894 (select (arr!15795 a!3235) j!176))))

(declare-fun lt!233895 () Unit!15755)

(assert (=> b!511186 (= lt!233895 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!233894 j!176))))

(assert (=> b!511186 (arrayContainsKey!0 a!3235 lt!233894 #b00000000000000000000000000000000)))

(declare-fun lt!233893 () Unit!15755)

(assert (=> b!511186 (= lt!233893 lt!233895)))

(declare-fun res!311984 () Bool)

(assert (=> b!511186 (= res!311984 (= (seekEntryOrOpen!0 (select (arr!15795 a!3235) j!176) a!3235 mask!3524) (Found!4218 j!176)))))

(assert (=> b!511186 (=> (not res!311984) (not e!298716))))

(declare-fun bm!31489 () Bool)

(assert (=> bm!31489 (= call!31492 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!511187 () Bool)

(assert (=> b!511187 (= e!298717 call!31492)))

(assert (= (and d!78949 (not res!311983)) b!511185))

(assert (= (and b!511185 c!59880) b!511186))

(assert (= (and b!511185 (not c!59880)) b!511187))

(assert (= (and b!511186 res!311984) b!511184))

(assert (= (or b!511184 b!511187) bm!31489))

(assert (=> b!511185 m!492805))

(assert (=> b!511185 m!492805))

(assert (=> b!511185 m!492807))

(assert (=> b!511186 m!492805))

(declare-fun m!492917 () Bool)

(assert (=> b!511186 m!492917))

(declare-fun m!492919 () Bool)

(assert (=> b!511186 m!492919))

(assert (=> b!511186 m!492805))

(assert (=> b!511186 m!492823))

(declare-fun m!492921 () Bool)

(assert (=> bm!31489 m!492921))

(assert (=> b!511025 d!78949))

(declare-fun lt!233923 () SeekEntryResult!4218)

(declare-fun b!511249 () Bool)

(assert (=> b!511249 (and (bvsge (index!19062 lt!233923) #b00000000000000000000000000000000) (bvslt (index!19062 lt!233923) (size!16159 (array!32835 (store (arr!15795 a!3235) i!1204 k!2280) (size!16159 a!3235)))))))

(declare-fun res!312009 () Bool)

(assert (=> b!511249 (= res!312009 (= (select (arr!15795 (array!32835 (store (arr!15795 a!3235) i!1204 k!2280) (size!16159 a!3235))) (index!19062 lt!233923)) (select (store (arr!15795 a!3235) i!1204 k!2280) j!176)))))

(declare-fun e!298759 () Bool)

(assert (=> b!511249 (=> res!312009 e!298759)))

(declare-fun e!298762 () Bool)

(assert (=> b!511249 (= e!298762 e!298759)))

(declare-fun e!298761 () SeekEntryResult!4218)

(declare-fun b!511250 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!511250 (= e!298761 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!233826 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (store (arr!15795 a!3235) i!1204 k!2280) j!176) (array!32835 (store (arr!15795 a!3235) i!1204 k!2280) (size!16159 a!3235)) mask!3524))))

(declare-fun b!511251 () Bool)

(declare-fun e!298763 () Bool)

(assert (=> b!511251 (= e!298763 (bvsge (x!48152 lt!233923) #b01111111111111111111111111111110))))

(declare-fun d!78951 () Bool)

(assert (=> d!78951 e!298763))

(declare-fun c!59902 () Bool)

(assert (=> d!78951 (= c!59902 (and (is-Intermediate!4218 lt!233923) (undefined!5030 lt!233923)))))

(declare-fun e!298760 () SeekEntryResult!4218)

(assert (=> d!78951 (= lt!233923 e!298760)))

(declare-fun c!59900 () Bool)

(assert (=> d!78951 (= c!59900 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!233924 () (_ BitVec 64))

(assert (=> d!78951 (= lt!233924 (select (arr!15795 (array!32835 (store (arr!15795 a!3235) i!1204 k!2280) (size!16159 a!3235))) lt!233826))))

(assert (=> d!78951 (validMask!0 mask!3524)))

(assert (=> d!78951 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233826 (select (store (arr!15795 a!3235) i!1204 k!2280) j!176) (array!32835 (store (arr!15795 a!3235) i!1204 k!2280) (size!16159 a!3235)) mask!3524) lt!233923)))

(declare-fun b!511252 () Bool)

(assert (=> b!511252 (= e!298760 e!298761)))

(declare-fun c!59901 () Bool)

(assert (=> b!511252 (= c!59901 (or (= lt!233924 (select (store (arr!15795 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!233924 lt!233924) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!511253 () Bool)

(assert (=> b!511253 (and (bvsge (index!19062 lt!233923) #b00000000000000000000000000000000) (bvslt (index!19062 lt!233923) (size!16159 (array!32835 (store (arr!15795 a!3235) i!1204 k!2280) (size!16159 a!3235)))))))

(declare-fun res!312010 () Bool)

(assert (=> b!511253 (= res!312010 (= (select (arr!15795 (array!32835 (store (arr!15795 a!3235) i!1204 k!2280) (size!16159 a!3235))) (index!19062 lt!233923)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!511253 (=> res!312010 e!298759)))

(declare-fun b!511254 () Bool)

(assert (=> b!511254 (= e!298761 (Intermediate!4218 false lt!233826 #b00000000000000000000000000000000))))

(declare-fun b!511255 () Bool)

(assert (=> b!511255 (= e!298760 (Intermediate!4218 true lt!233826 #b00000000000000000000000000000000))))

(declare-fun b!511256 () Bool)

(assert (=> b!511256 (= e!298763 e!298762)))

(declare-fun res!312011 () Bool)

(assert (=> b!511256 (= res!312011 (and (is-Intermediate!4218 lt!233923) (not (undefined!5030 lt!233923)) (bvslt (x!48152 lt!233923) #b01111111111111111111111111111110) (bvsge (x!48152 lt!233923) #b00000000000000000000000000000000) (bvsge (x!48152 lt!233923) #b00000000000000000000000000000000)))))

(assert (=> b!511256 (=> (not res!312011) (not e!298762))))

(declare-fun b!511257 () Bool)

(assert (=> b!511257 (and (bvsge (index!19062 lt!233923) #b00000000000000000000000000000000) (bvslt (index!19062 lt!233923) (size!16159 (array!32835 (store (arr!15795 a!3235) i!1204 k!2280) (size!16159 a!3235)))))))

(assert (=> b!511257 (= e!298759 (= (select (arr!15795 (array!32835 (store (arr!15795 a!3235) i!1204 k!2280) (size!16159 a!3235))) (index!19062 lt!233923)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!78951 c!59900) b!511255))

(assert (= (and d!78951 (not c!59900)) b!511252))

(assert (= (and b!511252 c!59901) b!511254))

(assert (= (and b!511252 (not c!59901)) b!511250))

(assert (= (and d!78951 c!59902) b!511251))

(assert (= (and d!78951 (not c!59902)) b!511256))

(assert (= (and b!511256 res!312011) b!511249))

(assert (= (and b!511249 (not res!312009)) b!511253))

(assert (= (and b!511253 (not res!312010)) b!511257))

(declare-fun m!492977 () Bool)

(assert (=> b!511249 m!492977))

(declare-fun m!492979 () Bool)

(assert (=> b!511250 m!492979))

(assert (=> b!511250 m!492979))

(assert (=> b!511250 m!492815))

(declare-fun m!492981 () Bool)

(assert (=> b!511250 m!492981))

(assert (=> b!511253 m!492977))

(assert (=> b!511257 m!492977))

(declare-fun m!492983 () Bool)

(assert (=> d!78951 m!492983))

(assert (=> d!78951 m!492793))

(assert (=> b!511025 d!78951))

(declare-fun d!78971 () Bool)

(assert (=> d!78971 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233931 () Unit!15755)

(declare-fun choose!38 (array!32834 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15755)

(assert (=> d!78971 (= lt!233931 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78971 (validMask!0 mask!3524)))

(assert (=> d!78971 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!233931)))

(declare-fun bs!16209 () Bool)

(assert (= bs!16209 d!78971))

(assert (=> bs!16209 m!492821))

(declare-fun m!492987 () Bool)

(assert (=> bs!16209 m!492987))

(assert (=> bs!16209 m!492793))

(assert (=> b!511025 d!78971))

(declare-fun d!78975 () Bool)

(declare-fun lt!233933 () (_ BitVec 32))

(declare-fun lt!233932 () (_ BitVec 32))

(assert (=> d!78975 (= lt!233933 (bvmul (bvxor lt!233932 (bvlshr lt!233932 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78975 (= lt!233932 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15795 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15795 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78975 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!311979 (let ((h!10735 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15795 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15795 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48155 (bvmul (bvxor h!10735 (bvlshr h!10735 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48155 (bvlshr x!48155 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!311979 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!311979 #b00000000000000000000000000000000))))))

(assert (=> d!78975 (= (toIndex!0 (select (store (arr!15795 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!233933 (bvlshr lt!233933 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!511025 d!78975))

(declare-fun b!511264 () Bool)

(declare-fun lt!233934 () SeekEntryResult!4218)

(assert (=> b!511264 (and (bvsge (index!19062 lt!233934) #b00000000000000000000000000000000) (bvslt (index!19062 lt!233934) (size!16159 a!3235)))))

(declare-fun res!312018 () Bool)

(assert (=> b!511264 (= res!312018 (= (select (arr!15795 a!3235) (index!19062 lt!233934)) (select (arr!15795 a!3235) j!176)))))

(declare-fun e!298770 () Bool)

(assert (=> b!511264 (=> res!312018 e!298770)))

(declare-fun e!298773 () Bool)

(assert (=> b!511264 (= e!298773 e!298770)))

(declare-fun e!298772 () SeekEntryResult!4218)

(declare-fun b!511265 () Bool)

(assert (=> b!511265 (= e!298772 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!233822 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!15795 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!511266 () Bool)

(declare-fun e!298774 () Bool)

(assert (=> b!511266 (= e!298774 (bvsge (x!48152 lt!233934) #b01111111111111111111111111111110))))

(declare-fun d!78977 () Bool)

(assert (=> d!78977 e!298774))

(declare-fun c!59905 () Bool)

(assert (=> d!78977 (= c!59905 (and (is-Intermediate!4218 lt!233934) (undefined!5030 lt!233934)))))

(declare-fun e!298771 () SeekEntryResult!4218)

(assert (=> d!78977 (= lt!233934 e!298771)))

(declare-fun c!59903 () Bool)

(assert (=> d!78977 (= c!59903 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!233935 () (_ BitVec 64))

(assert (=> d!78977 (= lt!233935 (select (arr!15795 a!3235) lt!233822))))

(assert (=> d!78977 (validMask!0 mask!3524)))

(assert (=> d!78977 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233822 (select (arr!15795 a!3235) j!176) a!3235 mask!3524) lt!233934)))

(declare-fun b!511267 () Bool)

(assert (=> b!511267 (= e!298771 e!298772)))

(declare-fun c!59904 () Bool)

(assert (=> b!511267 (= c!59904 (or (= lt!233935 (select (arr!15795 a!3235) j!176)) (= (bvadd lt!233935 lt!233935) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!511268 () Bool)

(assert (=> b!511268 (and (bvsge (index!19062 lt!233934) #b00000000000000000000000000000000) (bvslt (index!19062 lt!233934) (size!16159 a!3235)))))

(declare-fun res!312019 () Bool)

(assert (=> b!511268 (= res!312019 (= (select (arr!15795 a!3235) (index!19062 lt!233934)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!511268 (=> res!312019 e!298770)))

(declare-fun b!511269 () Bool)

(assert (=> b!511269 (= e!298772 (Intermediate!4218 false lt!233822 #b00000000000000000000000000000000))))

(declare-fun b!511270 () Bool)

(assert (=> b!511270 (= e!298771 (Intermediate!4218 true lt!233822 #b00000000000000000000000000000000))))

(declare-fun b!511271 () Bool)

(assert (=> b!511271 (= e!298774 e!298773)))

(declare-fun res!312020 () Bool)

(assert (=> b!511271 (= res!312020 (and (is-Intermediate!4218 lt!233934) (not (undefined!5030 lt!233934)) (bvslt (x!48152 lt!233934) #b01111111111111111111111111111110) (bvsge (x!48152 lt!233934) #b00000000000000000000000000000000) (bvsge (x!48152 lt!233934) #b00000000000000000000000000000000)))))

(assert (=> b!511271 (=> (not res!312020) (not e!298773))))

(declare-fun b!511272 () Bool)

(assert (=> b!511272 (and (bvsge (index!19062 lt!233934) #b00000000000000000000000000000000) (bvslt (index!19062 lt!233934) (size!16159 a!3235)))))

(assert (=> b!511272 (= e!298770 (= (select (arr!15795 a!3235) (index!19062 lt!233934)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!78977 c!59903) b!511270))

(assert (= (and d!78977 (not c!59903)) b!511267))

(assert (= (and b!511267 c!59904) b!511269))

(assert (= (and b!511267 (not c!59904)) b!511265))

(assert (= (and d!78977 c!59905) b!511266))

(assert (= (and d!78977 (not c!59905)) b!511271))

(assert (= (and b!511271 res!312020) b!511264))

(assert (= (and b!511264 (not res!312018)) b!511268))

(assert (= (and b!511268 (not res!312019)) b!511272))

(declare-fun m!492989 () Bool)

(assert (=> b!511264 m!492989))

(declare-fun m!492991 () Bool)

(assert (=> b!511265 m!492991))

(assert (=> b!511265 m!492991))

(assert (=> b!511265 m!492805))

(declare-fun m!492993 () Bool)

(assert (=> b!511265 m!492993))

(assert (=> b!511268 m!492989))

(assert (=> b!511272 m!492989))

(declare-fun m!492995 () Bool)

(assert (=> d!78977 m!492995))

(assert (=> d!78977 m!492793))

(assert (=> b!511025 d!78977))

(push 1)

(assert (not b!511098))

(assert (not b!511250))

(assert (not b!511100))

(assert (not b!511186))

(assert (not d!78977))

(assert (not b!511074))

(assert (not d!78937))

(assert (not b!511101))

(assert (not d!78951))

(assert (not bm!31489))

(assert (not b!511075))

(assert (not bm!31487))

(assert (not b!511142))

(assert (not b!511185))

(assert (not d!78971))

(assert (not bm!31482))

(assert (not b!511265))

(assert (not d!78947))

(assert (not b!511178))

(assert (not b!511111))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

