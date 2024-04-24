; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47144 () Bool)

(assert start!47144)

(declare-fun b!519318 () Bool)

(declare-fun e!303008 () Bool)

(declare-fun e!303011 () Bool)

(assert (=> b!519318 (= e!303008 e!303011)))

(declare-fun res!317932 () Bool)

(assert (=> b!519318 (=> (not res!317932) (not e!303011))))

(declare-datatypes ((SeekEntryResult!4363 0))(
  ( (MissingZero!4363 (index!19646 (_ BitVec 32))) (Found!4363 (index!19647 (_ BitVec 32))) (Intermediate!4363 (undefined!5175 Bool) (index!19648 (_ BitVec 32)) (x!48767 (_ BitVec 32))) (Undefined!4363) (MissingVacant!4363 (index!19649 (_ BitVec 32))) )
))
(declare-fun lt!237853 () SeekEntryResult!4363)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!519318 (= res!317932 (or (= lt!237853 (MissingZero!4363 i!1204)) (= lt!237853 (MissingVacant!4363 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33160 0))(
  ( (array!33161 (arr!15940 (Array (_ BitVec 32) (_ BitVec 64))) (size!16304 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33160)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33160 (_ BitVec 32)) SeekEntryResult!4363)

(assert (=> b!519318 (= lt!237853 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!519319 () Bool)

(declare-fun res!317930 () Bool)

(declare-fun e!303009 () Bool)

(assert (=> b!519319 (=> res!317930 e!303009)))

(declare-fun lt!237850 () SeekEntryResult!4363)

(get-info :version)

(assert (=> b!519319 (= res!317930 (or (undefined!5175 lt!237850) (not ((_ is Intermediate!4363) lt!237850))))))

(declare-fun b!519320 () Bool)

(declare-fun res!317927 () Bool)

(assert (=> b!519320 (=> (not res!317927) (not e!303011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33160 (_ BitVec 32)) Bool)

(assert (=> b!519320 (= res!317927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!519321 () Bool)

(declare-fun res!317936 () Bool)

(assert (=> b!519321 (=> (not res!317936) (not e!303008))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!519321 (= res!317936 (and (= (size!16304 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16304 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16304 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!519322 () Bool)

(assert (=> b!519322 (= e!303009 (and (bvsge (index!19648 lt!237850) #b00000000000000000000000000000000) (bvslt (index!19648 lt!237850) (size!16304 a!3235))))))

(assert (=> b!519322 (or (= (select (arr!15940 a!3235) (index!19648 lt!237850)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15940 a!3235) (index!19648 lt!237850)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16063 0))(
  ( (Unit!16064) )
))
(declare-fun lt!237849 () Unit!16063)

(declare-fun e!303007 () Unit!16063)

(assert (=> b!519322 (= lt!237849 e!303007)))

(declare-fun c!60992 () Bool)

(assert (=> b!519322 (= c!60992 (= (select (arr!15940 a!3235) (index!19648 lt!237850)) (select (arr!15940 a!3235) j!176)))))

(assert (=> b!519322 (and (bvslt (x!48767 lt!237850) #b01111111111111111111111111111110) (or (= (select (arr!15940 a!3235) (index!19648 lt!237850)) (select (arr!15940 a!3235) j!176)) (= (select (arr!15940 a!3235) (index!19648 lt!237850)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15940 a!3235) (index!19648 lt!237850)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519323 () Bool)

(declare-fun Unit!16065 () Unit!16063)

(assert (=> b!519323 (= e!303007 Unit!16065)))

(declare-fun b!519324 () Bool)

(declare-fun e!303010 () Bool)

(assert (=> b!519324 (= e!303010 false)))

(declare-fun b!519325 () Bool)

(declare-fun res!317934 () Bool)

(assert (=> b!519325 (=> (not res!317934) (not e!303011))))

(declare-datatypes ((List!10005 0))(
  ( (Nil!10002) (Cons!10001 (h!10914 (_ BitVec 64)) (t!16225 List!10005)) )
))
(declare-fun arrayNoDuplicates!0 (array!33160 (_ BitVec 32) List!10005) Bool)

(assert (=> b!519325 (= res!317934 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10002))))

(declare-fun b!519326 () Bool)

(declare-fun res!317929 () Bool)

(assert (=> b!519326 (=> (not res!317929) (not e!303008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!519326 (= res!317929 (validKeyInArray!0 k0!2280))))

(declare-fun b!519327 () Bool)

(assert (=> b!519327 (= e!303011 (not e!303009))))

(declare-fun res!317928 () Bool)

(assert (=> b!519327 (=> res!317928 e!303009)))

(declare-fun lt!237845 () array!33160)

(declare-fun lt!237847 () (_ BitVec 32))

(declare-fun lt!237848 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33160 (_ BitVec 32)) SeekEntryResult!4363)

(assert (=> b!519327 (= res!317928 (= lt!237850 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237847 lt!237848 lt!237845 mask!3524)))))

(declare-fun lt!237851 () (_ BitVec 32))

(assert (=> b!519327 (= lt!237850 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237851 (select (arr!15940 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519327 (= lt!237847 (toIndex!0 lt!237848 mask!3524))))

(assert (=> b!519327 (= lt!237848 (select (store (arr!15940 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!519327 (= lt!237851 (toIndex!0 (select (arr!15940 a!3235) j!176) mask!3524))))

(assert (=> b!519327 (= lt!237845 (array!33161 (store (arr!15940 a!3235) i!1204 k0!2280) (size!16304 a!3235)))))

(declare-fun e!303012 () Bool)

(assert (=> b!519327 e!303012))

(declare-fun res!317937 () Bool)

(assert (=> b!519327 (=> (not res!317937) (not e!303012))))

(assert (=> b!519327 (= res!317937 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!237852 () Unit!16063)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16063)

(assert (=> b!519327 (= lt!237852 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!519328 () Bool)

(declare-fun Unit!16066 () Unit!16063)

(assert (=> b!519328 (= e!303007 Unit!16066)))

(declare-fun lt!237846 () Unit!16063)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33160 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16063)

(assert (=> b!519328 (= lt!237846 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237851 #b00000000000000000000000000000000 (index!19648 lt!237850) (x!48767 lt!237850) mask!3524))))

(declare-fun res!317931 () Bool)

(assert (=> b!519328 (= res!317931 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237851 lt!237848 lt!237845 mask!3524) (Intermediate!4363 false (index!19648 lt!237850) (x!48767 lt!237850))))))

(assert (=> b!519328 (=> (not res!317931) (not e!303010))))

(assert (=> b!519328 e!303010))

(declare-fun b!519329 () Bool)

(assert (=> b!519329 (= e!303012 (= (seekEntryOrOpen!0 (select (arr!15940 a!3235) j!176) a!3235 mask!3524) (Found!4363 j!176)))))

(declare-fun b!519330 () Bool)

(declare-fun res!317933 () Bool)

(assert (=> b!519330 (=> (not res!317933) (not e!303008))))

(declare-fun arrayContainsKey!0 (array!33160 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!519330 (= res!317933 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!317935 () Bool)

(assert (=> start!47144 (=> (not res!317935) (not e!303008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47144 (= res!317935 (validMask!0 mask!3524))))

(assert (=> start!47144 e!303008))

(assert (=> start!47144 true))

(declare-fun array_inv!11799 (array!33160) Bool)

(assert (=> start!47144 (array_inv!11799 a!3235)))

(declare-fun b!519331 () Bool)

(declare-fun res!317938 () Bool)

(assert (=> b!519331 (=> (not res!317938) (not e!303008))))

(assert (=> b!519331 (= res!317938 (validKeyInArray!0 (select (arr!15940 a!3235) j!176)))))

(assert (= (and start!47144 res!317935) b!519321))

(assert (= (and b!519321 res!317936) b!519331))

(assert (= (and b!519331 res!317938) b!519326))

(assert (= (and b!519326 res!317929) b!519330))

(assert (= (and b!519330 res!317933) b!519318))

(assert (= (and b!519318 res!317932) b!519320))

(assert (= (and b!519320 res!317927) b!519325))

(assert (= (and b!519325 res!317934) b!519327))

(assert (= (and b!519327 res!317937) b!519329))

(assert (= (and b!519327 (not res!317928)) b!519319))

(assert (= (and b!519319 (not res!317930)) b!519322))

(assert (= (and b!519322 c!60992) b!519328))

(assert (= (and b!519322 (not c!60992)) b!519323))

(assert (= (and b!519328 res!317931) b!519324))

(declare-fun m!500755 () Bool)

(assert (=> b!519318 m!500755))

(declare-fun m!500757 () Bool)

(assert (=> b!519320 m!500757))

(declare-fun m!500759 () Bool)

(assert (=> b!519328 m!500759))

(declare-fun m!500761 () Bool)

(assert (=> b!519328 m!500761))

(declare-fun m!500763 () Bool)

(assert (=> b!519327 m!500763))

(declare-fun m!500765 () Bool)

(assert (=> b!519327 m!500765))

(declare-fun m!500767 () Bool)

(assert (=> b!519327 m!500767))

(declare-fun m!500769 () Bool)

(assert (=> b!519327 m!500769))

(declare-fun m!500771 () Bool)

(assert (=> b!519327 m!500771))

(assert (=> b!519327 m!500769))

(declare-fun m!500773 () Bool)

(assert (=> b!519327 m!500773))

(declare-fun m!500775 () Bool)

(assert (=> b!519327 m!500775))

(assert (=> b!519327 m!500769))

(declare-fun m!500777 () Bool)

(assert (=> b!519327 m!500777))

(declare-fun m!500779 () Bool)

(assert (=> b!519327 m!500779))

(assert (=> b!519329 m!500769))

(assert (=> b!519329 m!500769))

(declare-fun m!500781 () Bool)

(assert (=> b!519329 m!500781))

(declare-fun m!500783 () Bool)

(assert (=> b!519330 m!500783))

(declare-fun m!500785 () Bool)

(assert (=> b!519326 m!500785))

(declare-fun m!500787 () Bool)

(assert (=> start!47144 m!500787))

(declare-fun m!500789 () Bool)

(assert (=> start!47144 m!500789))

(declare-fun m!500791 () Bool)

(assert (=> b!519322 m!500791))

(assert (=> b!519322 m!500769))

(declare-fun m!500793 () Bool)

(assert (=> b!519325 m!500793))

(assert (=> b!519331 m!500769))

(assert (=> b!519331 m!500769))

(declare-fun m!500795 () Bool)

(assert (=> b!519331 m!500795))

(check-sat (not start!47144) (not b!519329) (not b!519325) (not b!519318) (not b!519320) (not b!519327) (not b!519330) (not b!519328) (not b!519326) (not b!519331))
(check-sat)
(get-model)

(declare-fun d!80105 () Bool)

(declare-fun res!318015 () Bool)

(declare-fun e!303059 () Bool)

(assert (=> d!80105 (=> res!318015 e!303059)))

(assert (=> d!80105 (= res!318015 (= (select (arr!15940 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80105 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!303059)))

(declare-fun b!519420 () Bool)

(declare-fun e!303060 () Bool)

(assert (=> b!519420 (= e!303059 e!303060)))

(declare-fun res!318016 () Bool)

(assert (=> b!519420 (=> (not res!318016) (not e!303060))))

(assert (=> b!519420 (= res!318016 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16304 a!3235)))))

(declare-fun b!519421 () Bool)

(assert (=> b!519421 (= e!303060 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80105 (not res!318015)) b!519420))

(assert (= (and b!519420 res!318016) b!519421))

(declare-fun m!500881 () Bool)

(assert (=> d!80105 m!500881))

(declare-fun m!500883 () Bool)

(assert (=> b!519421 m!500883))

(assert (=> b!519330 d!80105))

(declare-fun d!80107 () Bool)

(assert (=> d!80107 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47144 d!80107))

(declare-fun d!80109 () Bool)

(assert (=> d!80109 (= (array_inv!11799 a!3235) (bvsge (size!16304 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47144 d!80109))

(declare-fun b!519432 () Bool)

(declare-fun e!303071 () Bool)

(declare-fun e!303070 () Bool)

(assert (=> b!519432 (= e!303071 e!303070)))

(declare-fun c!61001 () Bool)

(assert (=> b!519432 (= c!61001 (validKeyInArray!0 (select (arr!15940 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80111 () Bool)

(declare-fun res!318024 () Bool)

(declare-fun e!303069 () Bool)

(assert (=> d!80111 (=> res!318024 e!303069)))

(assert (=> d!80111 (= res!318024 (bvsge #b00000000000000000000000000000000 (size!16304 a!3235)))))

(assert (=> d!80111 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10002) e!303069)))

(declare-fun bm!31731 () Bool)

(declare-fun call!31734 () Bool)

(assert (=> bm!31731 (= call!31734 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61001 (Cons!10001 (select (arr!15940 a!3235) #b00000000000000000000000000000000) Nil!10002) Nil!10002)))))

(declare-fun b!519433 () Bool)

(assert (=> b!519433 (= e!303070 call!31734)))

(declare-fun b!519434 () Bool)

(assert (=> b!519434 (= e!303070 call!31734)))

(declare-fun b!519435 () Bool)

(assert (=> b!519435 (= e!303069 e!303071)))

(declare-fun res!318025 () Bool)

(assert (=> b!519435 (=> (not res!318025) (not e!303071))))

(declare-fun e!303072 () Bool)

(assert (=> b!519435 (= res!318025 (not e!303072))))

(declare-fun res!318023 () Bool)

(assert (=> b!519435 (=> (not res!318023) (not e!303072))))

(assert (=> b!519435 (= res!318023 (validKeyInArray!0 (select (arr!15940 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!519436 () Bool)

(declare-fun contains!2733 (List!10005 (_ BitVec 64)) Bool)

(assert (=> b!519436 (= e!303072 (contains!2733 Nil!10002 (select (arr!15940 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80111 (not res!318024)) b!519435))

(assert (= (and b!519435 res!318023) b!519436))

(assert (= (and b!519435 res!318025) b!519432))

(assert (= (and b!519432 c!61001) b!519434))

(assert (= (and b!519432 (not c!61001)) b!519433))

(assert (= (or b!519434 b!519433) bm!31731))

(assert (=> b!519432 m!500881))

(assert (=> b!519432 m!500881))

(declare-fun m!500885 () Bool)

(assert (=> b!519432 m!500885))

(assert (=> bm!31731 m!500881))

(declare-fun m!500887 () Bool)

(assert (=> bm!31731 m!500887))

(assert (=> b!519435 m!500881))

(assert (=> b!519435 m!500881))

(assert (=> b!519435 m!500885))

(assert (=> b!519436 m!500881))

(assert (=> b!519436 m!500881))

(declare-fun m!500889 () Bool)

(assert (=> b!519436 m!500889))

(assert (=> b!519325 d!80111))

(declare-fun b!519446 () Bool)

(declare-fun e!303080 () Bool)

(declare-fun call!31737 () Bool)

(assert (=> b!519446 (= e!303080 call!31737)))

(declare-fun b!519447 () Bool)

(declare-fun e!303079 () Bool)

(assert (=> b!519447 (= e!303079 e!303080)))

(declare-fun c!61004 () Bool)

(assert (=> b!519447 (= c!61004 (validKeyInArray!0 (select (arr!15940 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!519448 () Bool)

(declare-fun e!303081 () Bool)

(assert (=> b!519448 (= e!303080 e!303081)))

(declare-fun lt!237914 () (_ BitVec 64))

(assert (=> b!519448 (= lt!237914 (select (arr!15940 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!237915 () Unit!16063)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33160 (_ BitVec 64) (_ BitVec 32)) Unit!16063)

(assert (=> b!519448 (= lt!237915 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237914 #b00000000000000000000000000000000))))

(assert (=> b!519448 (arrayContainsKey!0 a!3235 lt!237914 #b00000000000000000000000000000000)))

(declare-fun lt!237916 () Unit!16063)

(assert (=> b!519448 (= lt!237916 lt!237915)))

(declare-fun res!318030 () Bool)

(assert (=> b!519448 (= res!318030 (= (seekEntryOrOpen!0 (select (arr!15940 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4363 #b00000000000000000000000000000000)))))

(assert (=> b!519448 (=> (not res!318030) (not e!303081))))

(declare-fun bm!31734 () Bool)

(assert (=> bm!31734 (= call!31737 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80113 () Bool)

(declare-fun res!318031 () Bool)

(assert (=> d!80113 (=> res!318031 e!303079)))

(assert (=> d!80113 (= res!318031 (bvsge #b00000000000000000000000000000000 (size!16304 a!3235)))))

(assert (=> d!80113 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!303079)))

(declare-fun b!519445 () Bool)

(assert (=> b!519445 (= e!303081 call!31737)))

(assert (= (and d!80113 (not res!318031)) b!519447))

(assert (= (and b!519447 c!61004) b!519448))

(assert (= (and b!519447 (not c!61004)) b!519446))

(assert (= (and b!519448 res!318030) b!519445))

(assert (= (or b!519445 b!519446) bm!31734))

(assert (=> b!519447 m!500881))

(assert (=> b!519447 m!500881))

(assert (=> b!519447 m!500885))

(assert (=> b!519448 m!500881))

(declare-fun m!500891 () Bool)

(assert (=> b!519448 m!500891))

(declare-fun m!500893 () Bool)

(assert (=> b!519448 m!500893))

(assert (=> b!519448 m!500881))

(declare-fun m!500895 () Bool)

(assert (=> b!519448 m!500895))

(declare-fun m!500897 () Bool)

(assert (=> bm!31734 m!500897))

(assert (=> b!519320 d!80113))

(declare-fun d!80115 () Bool)

(assert (=> d!80115 (= (validKeyInArray!0 (select (arr!15940 a!3235) j!176)) (and (not (= (select (arr!15940 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15940 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!519331 d!80115))

(declare-fun d!80119 () Bool)

(assert (=> d!80119 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!519326 d!80119))

(declare-fun d!80121 () Bool)

(declare-fun lt!237922 () (_ BitVec 32))

(declare-fun lt!237921 () (_ BitVec 32))

(assert (=> d!80121 (= lt!237922 (bvmul (bvxor lt!237921 (bvlshr lt!237921 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80121 (= lt!237921 ((_ extract 31 0) (bvand (bvxor (select (arr!15940 a!3235) j!176) (bvlshr (select (arr!15940 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80121 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318032 (let ((h!10917 ((_ extract 31 0) (bvand (bvxor (select (arr!15940 a!3235) j!176) (bvlshr (select (arr!15940 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48770 (bvmul (bvxor h!10917 (bvlshr h!10917 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48770 (bvlshr x!48770 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318032 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318032 #b00000000000000000000000000000000))))))

(assert (=> d!80121 (= (toIndex!0 (select (arr!15940 a!3235) j!176) mask!3524) (bvand (bvxor lt!237922 (bvlshr lt!237922 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!519327 d!80121))

(declare-fun b!519450 () Bool)

(declare-fun e!303083 () Bool)

(declare-fun call!31738 () Bool)

(assert (=> b!519450 (= e!303083 call!31738)))

(declare-fun b!519451 () Bool)

(declare-fun e!303082 () Bool)

(assert (=> b!519451 (= e!303082 e!303083)))

(declare-fun c!61005 () Bool)

(assert (=> b!519451 (= c!61005 (validKeyInArray!0 (select (arr!15940 a!3235) j!176)))))

(declare-fun b!519452 () Bool)

(declare-fun e!303084 () Bool)

(assert (=> b!519452 (= e!303083 e!303084)))

(declare-fun lt!237923 () (_ BitVec 64))

(assert (=> b!519452 (= lt!237923 (select (arr!15940 a!3235) j!176))))

(declare-fun lt!237924 () Unit!16063)

(assert (=> b!519452 (= lt!237924 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237923 j!176))))

(assert (=> b!519452 (arrayContainsKey!0 a!3235 lt!237923 #b00000000000000000000000000000000)))

(declare-fun lt!237925 () Unit!16063)

(assert (=> b!519452 (= lt!237925 lt!237924)))

(declare-fun res!318033 () Bool)

(assert (=> b!519452 (= res!318033 (= (seekEntryOrOpen!0 (select (arr!15940 a!3235) j!176) a!3235 mask!3524) (Found!4363 j!176)))))

(assert (=> b!519452 (=> (not res!318033) (not e!303084))))

(declare-fun bm!31735 () Bool)

(assert (=> bm!31735 (= call!31738 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80123 () Bool)

(declare-fun res!318034 () Bool)

(assert (=> d!80123 (=> res!318034 e!303082)))

(assert (=> d!80123 (= res!318034 (bvsge j!176 (size!16304 a!3235)))))

(assert (=> d!80123 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!303082)))

(declare-fun b!519449 () Bool)

(assert (=> b!519449 (= e!303084 call!31738)))

(assert (= (and d!80123 (not res!318034)) b!519451))

(assert (= (and b!519451 c!61005) b!519452))

(assert (= (and b!519451 (not c!61005)) b!519450))

(assert (= (and b!519452 res!318033) b!519449))

(assert (= (or b!519449 b!519450) bm!31735))

(assert (=> b!519451 m!500769))

(assert (=> b!519451 m!500769))

(assert (=> b!519451 m!500795))

(assert (=> b!519452 m!500769))

(declare-fun m!500899 () Bool)

(assert (=> b!519452 m!500899))

(declare-fun m!500901 () Bool)

(assert (=> b!519452 m!500901))

(assert (=> b!519452 m!500769))

(assert (=> b!519452 m!500781))

(declare-fun m!500903 () Bool)

(assert (=> bm!31735 m!500903))

(assert (=> b!519327 d!80123))

(declare-fun b!519540 () Bool)

(declare-fun e!303143 () Bool)

(declare-fun lt!237961 () SeekEntryResult!4363)

(assert (=> b!519540 (= e!303143 (bvsge (x!48767 lt!237961) #b01111111111111111111111111111110))))

(declare-fun b!519541 () Bool)

(assert (=> b!519541 (and (bvsge (index!19648 lt!237961) #b00000000000000000000000000000000) (bvslt (index!19648 lt!237961) (size!16304 a!3235)))))

(declare-fun e!303144 () Bool)

(assert (=> b!519541 (= e!303144 (= (select (arr!15940 a!3235) (index!19648 lt!237961)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303147 () SeekEntryResult!4363)

(declare-fun b!519542 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519542 (= e!303147 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237851 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!15940 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!519543 () Bool)

(assert (=> b!519543 (= e!303147 (Intermediate!4363 false lt!237851 #b00000000000000000000000000000000))))

(declare-fun b!519545 () Bool)

(declare-fun e!303146 () Bool)

(assert (=> b!519545 (= e!303143 e!303146)))

(declare-fun res!318069 () Bool)

(assert (=> b!519545 (= res!318069 (and ((_ is Intermediate!4363) lt!237961) (not (undefined!5175 lt!237961)) (bvslt (x!48767 lt!237961) #b01111111111111111111111111111110) (bvsge (x!48767 lt!237961) #b00000000000000000000000000000000) (bvsge (x!48767 lt!237961) #b00000000000000000000000000000000)))))

(assert (=> b!519545 (=> (not res!318069) (not e!303146))))

(declare-fun b!519546 () Bool)

(assert (=> b!519546 (and (bvsge (index!19648 lt!237961) #b00000000000000000000000000000000) (bvslt (index!19648 lt!237961) (size!16304 a!3235)))))

(declare-fun res!318070 () Bool)

(assert (=> b!519546 (= res!318070 (= (select (arr!15940 a!3235) (index!19648 lt!237961)) (select (arr!15940 a!3235) j!176)))))

(assert (=> b!519546 (=> res!318070 e!303144)))

(assert (=> b!519546 (= e!303146 e!303144)))

(declare-fun b!519547 () Bool)

(assert (=> b!519547 (and (bvsge (index!19648 lt!237961) #b00000000000000000000000000000000) (bvslt (index!19648 lt!237961) (size!16304 a!3235)))))

(declare-fun res!318068 () Bool)

(assert (=> b!519547 (= res!318068 (= (select (arr!15940 a!3235) (index!19648 lt!237961)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519547 (=> res!318068 e!303144)))

(declare-fun b!519548 () Bool)

(declare-fun e!303145 () SeekEntryResult!4363)

(assert (=> b!519548 (= e!303145 (Intermediate!4363 true lt!237851 #b00000000000000000000000000000000))))

(declare-fun d!80125 () Bool)

(assert (=> d!80125 e!303143))

(declare-fun c!61035 () Bool)

(assert (=> d!80125 (= c!61035 (and ((_ is Intermediate!4363) lt!237961) (undefined!5175 lt!237961)))))

(assert (=> d!80125 (= lt!237961 e!303145)))

(declare-fun c!61033 () Bool)

(assert (=> d!80125 (= c!61033 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!237960 () (_ BitVec 64))

(assert (=> d!80125 (= lt!237960 (select (arr!15940 a!3235) lt!237851))))

(assert (=> d!80125 (validMask!0 mask!3524)))

(assert (=> d!80125 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237851 (select (arr!15940 a!3235) j!176) a!3235 mask!3524) lt!237961)))

(declare-fun b!519544 () Bool)

(assert (=> b!519544 (= e!303145 e!303147)))

(declare-fun c!61034 () Bool)

(assert (=> b!519544 (= c!61034 (or (= lt!237960 (select (arr!15940 a!3235) j!176)) (= (bvadd lt!237960 lt!237960) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!80125 c!61033) b!519548))

(assert (= (and d!80125 (not c!61033)) b!519544))

(assert (= (and b!519544 c!61034) b!519543))

(assert (= (and b!519544 (not c!61034)) b!519542))

(assert (= (and d!80125 c!61035) b!519540))

(assert (= (and d!80125 (not c!61035)) b!519545))

(assert (= (and b!519545 res!318069) b!519546))

(assert (= (and b!519546 (not res!318070)) b!519547))

(assert (= (and b!519547 (not res!318068)) b!519541))

(declare-fun m!500961 () Bool)

(assert (=> b!519546 m!500961))

(declare-fun m!500963 () Bool)

(assert (=> b!519542 m!500963))

(assert (=> b!519542 m!500963))

(assert (=> b!519542 m!500769))

(declare-fun m!500965 () Bool)

(assert (=> b!519542 m!500965))

(assert (=> b!519541 m!500961))

(declare-fun m!500967 () Bool)

(assert (=> d!80125 m!500967))

(assert (=> d!80125 m!500787))

(assert (=> b!519547 m!500961))

(assert (=> b!519327 d!80125))

(declare-fun d!80143 () Bool)

(declare-fun lt!237963 () (_ BitVec 32))

(declare-fun lt!237962 () (_ BitVec 32))

(assert (=> d!80143 (= lt!237963 (bvmul (bvxor lt!237962 (bvlshr lt!237962 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80143 (= lt!237962 ((_ extract 31 0) (bvand (bvxor lt!237848 (bvlshr lt!237848 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80143 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318032 (let ((h!10917 ((_ extract 31 0) (bvand (bvxor lt!237848 (bvlshr lt!237848 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48770 (bvmul (bvxor h!10917 (bvlshr h!10917 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48770 (bvlshr x!48770 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318032 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318032 #b00000000000000000000000000000000))))))

(assert (=> d!80143 (= (toIndex!0 lt!237848 mask!3524) (bvand (bvxor lt!237963 (bvlshr lt!237963 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!519327 d!80143))

(declare-fun d!80145 () Bool)

(assert (=> d!80145 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!237966 () Unit!16063)

(declare-fun choose!38 (array!33160 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16063)

(assert (=> d!80145 (= lt!237966 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80145 (validMask!0 mask!3524)))

(assert (=> d!80145 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!237966)))

(declare-fun bs!16391 () Bool)

(assert (= bs!16391 d!80145))

(assert (=> bs!16391 m!500779))

(declare-fun m!500971 () Bool)

(assert (=> bs!16391 m!500971))

(assert (=> bs!16391 m!500787))

(assert (=> b!519327 d!80145))

(declare-fun b!519555 () Bool)

(declare-fun e!303154 () Bool)

(declare-fun lt!237968 () SeekEntryResult!4363)

(assert (=> b!519555 (= e!303154 (bvsge (x!48767 lt!237968) #b01111111111111111111111111111110))))

(declare-fun b!519556 () Bool)

(assert (=> b!519556 (and (bvsge (index!19648 lt!237968) #b00000000000000000000000000000000) (bvslt (index!19648 lt!237968) (size!16304 lt!237845)))))

(declare-fun e!303155 () Bool)

(assert (=> b!519556 (= e!303155 (= (select (arr!15940 lt!237845) (index!19648 lt!237968)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303158 () SeekEntryResult!4363)

(declare-fun b!519557 () Bool)

(assert (=> b!519557 (= e!303158 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237847 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!237848 lt!237845 mask!3524))))

(declare-fun b!519558 () Bool)

(assert (=> b!519558 (= e!303158 (Intermediate!4363 false lt!237847 #b00000000000000000000000000000000))))

(declare-fun b!519560 () Bool)

(declare-fun e!303157 () Bool)

(assert (=> b!519560 (= e!303154 e!303157)))

(declare-fun res!318078 () Bool)

(assert (=> b!519560 (= res!318078 (and ((_ is Intermediate!4363) lt!237968) (not (undefined!5175 lt!237968)) (bvslt (x!48767 lt!237968) #b01111111111111111111111111111110) (bvsge (x!48767 lt!237968) #b00000000000000000000000000000000) (bvsge (x!48767 lt!237968) #b00000000000000000000000000000000)))))

(assert (=> b!519560 (=> (not res!318078) (not e!303157))))

(declare-fun b!519561 () Bool)

(assert (=> b!519561 (and (bvsge (index!19648 lt!237968) #b00000000000000000000000000000000) (bvslt (index!19648 lt!237968) (size!16304 lt!237845)))))

(declare-fun res!318079 () Bool)

(assert (=> b!519561 (= res!318079 (= (select (arr!15940 lt!237845) (index!19648 lt!237968)) lt!237848))))

(assert (=> b!519561 (=> res!318079 e!303155)))

(assert (=> b!519561 (= e!303157 e!303155)))

(declare-fun b!519562 () Bool)

(assert (=> b!519562 (and (bvsge (index!19648 lt!237968) #b00000000000000000000000000000000) (bvslt (index!19648 lt!237968) (size!16304 lt!237845)))))

(declare-fun res!318077 () Bool)

(assert (=> b!519562 (= res!318077 (= (select (arr!15940 lt!237845) (index!19648 lt!237968)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519562 (=> res!318077 e!303155)))

(declare-fun b!519563 () Bool)

(declare-fun e!303156 () SeekEntryResult!4363)

(assert (=> b!519563 (= e!303156 (Intermediate!4363 true lt!237847 #b00000000000000000000000000000000))))

(declare-fun d!80153 () Bool)

(assert (=> d!80153 e!303154))

(declare-fun c!61038 () Bool)

(assert (=> d!80153 (= c!61038 (and ((_ is Intermediate!4363) lt!237968) (undefined!5175 lt!237968)))))

(assert (=> d!80153 (= lt!237968 e!303156)))

(declare-fun c!61036 () Bool)

(assert (=> d!80153 (= c!61036 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!237967 () (_ BitVec 64))

(assert (=> d!80153 (= lt!237967 (select (arr!15940 lt!237845) lt!237847))))

(assert (=> d!80153 (validMask!0 mask!3524)))

(assert (=> d!80153 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237847 lt!237848 lt!237845 mask!3524) lt!237968)))

(declare-fun b!519559 () Bool)

(assert (=> b!519559 (= e!303156 e!303158)))

(declare-fun c!61037 () Bool)

(assert (=> b!519559 (= c!61037 (or (= lt!237967 lt!237848) (= (bvadd lt!237967 lt!237967) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!80153 c!61036) b!519563))

(assert (= (and d!80153 (not c!61036)) b!519559))

(assert (= (and b!519559 c!61037) b!519558))

(assert (= (and b!519559 (not c!61037)) b!519557))

(assert (= (and d!80153 c!61038) b!519555))

(assert (= (and d!80153 (not c!61038)) b!519560))

(assert (= (and b!519560 res!318078) b!519561))

(assert (= (and b!519561 (not res!318079)) b!519562))

(assert (= (and b!519562 (not res!318077)) b!519556))

(declare-fun m!500973 () Bool)

(assert (=> b!519561 m!500973))

(declare-fun m!500975 () Bool)

(assert (=> b!519557 m!500975))

(assert (=> b!519557 m!500975))

(declare-fun m!500977 () Bool)

(assert (=> b!519557 m!500977))

(assert (=> b!519556 m!500973))

(declare-fun m!500979 () Bool)

(assert (=> d!80153 m!500979))

(assert (=> d!80153 m!500787))

(assert (=> b!519562 m!500973))

(assert (=> b!519327 d!80153))

(declare-fun d!80159 () Bool)

(declare-fun e!303167 () Bool)

(assert (=> d!80159 e!303167))

(declare-fun res!318088 () Bool)

(assert (=> d!80159 (=> (not res!318088) (not e!303167))))

(assert (=> d!80159 (= res!318088 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16304 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16304 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16304 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16304 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16304 a!3235))))))

(declare-fun lt!237977 () Unit!16063)

(declare-fun choose!47 (array!33160 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16063)

(assert (=> d!80159 (= lt!237977 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!237851 #b00000000000000000000000000000000 (index!19648 lt!237850) (x!48767 lt!237850) mask!3524))))

(assert (=> d!80159 (validMask!0 mask!3524)))

(assert (=> d!80159 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!237851 #b00000000000000000000000000000000 (index!19648 lt!237850) (x!48767 lt!237850) mask!3524) lt!237977)))

(declare-fun b!519572 () Bool)

(assert (=> b!519572 (= e!303167 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237851 (select (store (arr!15940 a!3235) i!1204 k0!2280) j!176) (array!33161 (store (arr!15940 a!3235) i!1204 k0!2280) (size!16304 a!3235)) mask!3524) (Intermediate!4363 false (index!19648 lt!237850) (x!48767 lt!237850))))))

(assert (= (and d!80159 res!318088) b!519572))

(declare-fun m!500989 () Bool)

(assert (=> d!80159 m!500989))

(assert (=> d!80159 m!500787))

(assert (=> b!519572 m!500763))

(assert (=> b!519572 m!500767))

(assert (=> b!519572 m!500767))

(declare-fun m!500991 () Bool)

(assert (=> b!519572 m!500991))

(assert (=> b!519328 d!80159))

(declare-fun b!519573 () Bool)

(declare-fun e!303168 () Bool)

(declare-fun lt!237979 () SeekEntryResult!4363)

(assert (=> b!519573 (= e!303168 (bvsge (x!48767 lt!237979) #b01111111111111111111111111111110))))

(declare-fun b!519574 () Bool)

(assert (=> b!519574 (and (bvsge (index!19648 lt!237979) #b00000000000000000000000000000000) (bvslt (index!19648 lt!237979) (size!16304 lt!237845)))))

(declare-fun e!303169 () Bool)

(assert (=> b!519574 (= e!303169 (= (select (arr!15940 lt!237845) (index!19648 lt!237979)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!519575 () Bool)

(declare-fun e!303172 () SeekEntryResult!4363)

(assert (=> b!519575 (= e!303172 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!237851 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!237848 lt!237845 mask!3524))))

(declare-fun b!519576 () Bool)

(assert (=> b!519576 (= e!303172 (Intermediate!4363 false lt!237851 #b00000000000000000000000000000000))))

(declare-fun b!519578 () Bool)

(declare-fun e!303171 () Bool)

(assert (=> b!519578 (= e!303168 e!303171)))

(declare-fun res!318090 () Bool)

(assert (=> b!519578 (= res!318090 (and ((_ is Intermediate!4363) lt!237979) (not (undefined!5175 lt!237979)) (bvslt (x!48767 lt!237979) #b01111111111111111111111111111110) (bvsge (x!48767 lt!237979) #b00000000000000000000000000000000) (bvsge (x!48767 lt!237979) #b00000000000000000000000000000000)))))

(assert (=> b!519578 (=> (not res!318090) (not e!303171))))

(declare-fun b!519579 () Bool)

(assert (=> b!519579 (and (bvsge (index!19648 lt!237979) #b00000000000000000000000000000000) (bvslt (index!19648 lt!237979) (size!16304 lt!237845)))))

(declare-fun res!318091 () Bool)

(assert (=> b!519579 (= res!318091 (= (select (arr!15940 lt!237845) (index!19648 lt!237979)) lt!237848))))

(assert (=> b!519579 (=> res!318091 e!303169)))

(assert (=> b!519579 (= e!303171 e!303169)))

(declare-fun b!519580 () Bool)

(assert (=> b!519580 (and (bvsge (index!19648 lt!237979) #b00000000000000000000000000000000) (bvslt (index!19648 lt!237979) (size!16304 lt!237845)))))

(declare-fun res!318089 () Bool)

(assert (=> b!519580 (= res!318089 (= (select (arr!15940 lt!237845) (index!19648 lt!237979)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519580 (=> res!318089 e!303169)))

(declare-fun b!519581 () Bool)

(declare-fun e!303170 () SeekEntryResult!4363)

(assert (=> b!519581 (= e!303170 (Intermediate!4363 true lt!237851 #b00000000000000000000000000000000))))

(declare-fun d!80169 () Bool)

(assert (=> d!80169 e!303168))

(declare-fun c!61041 () Bool)

(assert (=> d!80169 (= c!61041 (and ((_ is Intermediate!4363) lt!237979) (undefined!5175 lt!237979)))))

(assert (=> d!80169 (= lt!237979 e!303170)))

(declare-fun c!61039 () Bool)

(assert (=> d!80169 (= c!61039 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!237978 () (_ BitVec 64))

(assert (=> d!80169 (= lt!237978 (select (arr!15940 lt!237845) lt!237851))))

(assert (=> d!80169 (validMask!0 mask!3524)))

(assert (=> d!80169 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!237851 lt!237848 lt!237845 mask!3524) lt!237979)))

(declare-fun b!519577 () Bool)

(assert (=> b!519577 (= e!303170 e!303172)))

(declare-fun c!61040 () Bool)

(assert (=> b!519577 (= c!61040 (or (= lt!237978 lt!237848) (= (bvadd lt!237978 lt!237978) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!80169 c!61039) b!519581))

(assert (= (and d!80169 (not c!61039)) b!519577))

(assert (= (and b!519577 c!61040) b!519576))

(assert (= (and b!519577 (not c!61040)) b!519575))

(assert (= (and d!80169 c!61041) b!519573))

(assert (= (and d!80169 (not c!61041)) b!519578))

(assert (= (and b!519578 res!318090) b!519579))

(assert (= (and b!519579 (not res!318091)) b!519580))

(assert (= (and b!519580 (not res!318089)) b!519574))

(declare-fun m!500993 () Bool)

(assert (=> b!519579 m!500993))

(assert (=> b!519575 m!500963))

(assert (=> b!519575 m!500963))

(declare-fun m!500995 () Bool)

(assert (=> b!519575 m!500995))

(assert (=> b!519574 m!500993))

(declare-fun m!500997 () Bool)

(assert (=> d!80169 m!500997))

(assert (=> d!80169 m!500787))

(assert (=> b!519580 m!500993))

(assert (=> b!519328 d!80169))

(declare-fun b!519670 () Bool)

(declare-fun e!303222 () SeekEntryResult!4363)

(declare-fun lt!238018 () SeekEntryResult!4363)

(assert (=> b!519670 (= e!303222 (MissingZero!4363 (index!19648 lt!238018)))))

(declare-fun d!80171 () Bool)

(declare-fun lt!238017 () SeekEntryResult!4363)

(assert (=> d!80171 (and (or ((_ is Undefined!4363) lt!238017) (not ((_ is Found!4363) lt!238017)) (and (bvsge (index!19647 lt!238017) #b00000000000000000000000000000000) (bvslt (index!19647 lt!238017) (size!16304 a!3235)))) (or ((_ is Undefined!4363) lt!238017) ((_ is Found!4363) lt!238017) (not ((_ is MissingZero!4363) lt!238017)) (and (bvsge (index!19646 lt!238017) #b00000000000000000000000000000000) (bvslt (index!19646 lt!238017) (size!16304 a!3235)))) (or ((_ is Undefined!4363) lt!238017) ((_ is Found!4363) lt!238017) ((_ is MissingZero!4363) lt!238017) (not ((_ is MissingVacant!4363) lt!238017)) (and (bvsge (index!19649 lt!238017) #b00000000000000000000000000000000) (bvslt (index!19649 lt!238017) (size!16304 a!3235)))) (or ((_ is Undefined!4363) lt!238017) (ite ((_ is Found!4363) lt!238017) (= (select (arr!15940 a!3235) (index!19647 lt!238017)) k0!2280) (ite ((_ is MissingZero!4363) lt!238017) (= (select (arr!15940 a!3235) (index!19646 lt!238017)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4363) lt!238017) (= (select (arr!15940 a!3235) (index!19649 lt!238017)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!303224 () SeekEntryResult!4363)

(assert (=> d!80171 (= lt!238017 e!303224)))

(declare-fun c!61074 () Bool)

(assert (=> d!80171 (= c!61074 (and ((_ is Intermediate!4363) lt!238018) (undefined!5175 lt!238018)))))

(assert (=> d!80171 (= lt!238018 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80171 (validMask!0 mask!3524)))

(assert (=> d!80171 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!238017)))

(declare-fun b!519671 () Bool)

(assert (=> b!519671 (= e!303224 Undefined!4363)))

(declare-fun b!519672 () Bool)

(declare-fun e!303223 () SeekEntryResult!4363)

(assert (=> b!519672 (= e!303223 (Found!4363 (index!19648 lt!238018)))))

(declare-fun b!519673 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33160 (_ BitVec 32)) SeekEntryResult!4363)

(assert (=> b!519673 (= e!303222 (seekKeyOrZeroReturnVacant!0 (x!48767 lt!238018) (index!19648 lt!238018) (index!19648 lt!238018) k0!2280 a!3235 mask!3524))))

(declare-fun b!519674 () Bool)

(assert (=> b!519674 (= e!303224 e!303223)))

(declare-fun lt!238016 () (_ BitVec 64))

(assert (=> b!519674 (= lt!238016 (select (arr!15940 a!3235) (index!19648 lt!238018)))))

(declare-fun c!61075 () Bool)

(assert (=> b!519674 (= c!61075 (= lt!238016 k0!2280))))

(declare-fun b!519675 () Bool)

(declare-fun c!61073 () Bool)

(assert (=> b!519675 (= c!61073 (= lt!238016 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519675 (= e!303223 e!303222)))

(assert (= (and d!80171 c!61074) b!519671))

(assert (= (and d!80171 (not c!61074)) b!519674))

(assert (= (and b!519674 c!61075) b!519672))

(assert (= (and b!519674 (not c!61075)) b!519675))

(assert (= (and b!519675 c!61073) b!519670))

(assert (= (and b!519675 (not c!61073)) b!519673))

(assert (=> d!80171 m!500787))

(declare-fun m!501037 () Bool)

(assert (=> d!80171 m!501037))

(declare-fun m!501039 () Bool)

(assert (=> d!80171 m!501039))

(declare-fun m!501041 () Bool)

(assert (=> d!80171 m!501041))

(declare-fun m!501043 () Bool)

(assert (=> d!80171 m!501043))

(assert (=> d!80171 m!501039))

(declare-fun m!501045 () Bool)

(assert (=> d!80171 m!501045))

(declare-fun m!501047 () Bool)

(assert (=> b!519673 m!501047))

(declare-fun m!501049 () Bool)

(assert (=> b!519674 m!501049))

(assert (=> b!519318 d!80171))

(declare-fun b!519676 () Bool)

(declare-fun e!303225 () SeekEntryResult!4363)

(declare-fun lt!238021 () SeekEntryResult!4363)

(assert (=> b!519676 (= e!303225 (MissingZero!4363 (index!19648 lt!238021)))))

(declare-fun d!80187 () Bool)

(declare-fun lt!238020 () SeekEntryResult!4363)

(assert (=> d!80187 (and (or ((_ is Undefined!4363) lt!238020) (not ((_ is Found!4363) lt!238020)) (and (bvsge (index!19647 lt!238020) #b00000000000000000000000000000000) (bvslt (index!19647 lt!238020) (size!16304 a!3235)))) (or ((_ is Undefined!4363) lt!238020) ((_ is Found!4363) lt!238020) (not ((_ is MissingZero!4363) lt!238020)) (and (bvsge (index!19646 lt!238020) #b00000000000000000000000000000000) (bvslt (index!19646 lt!238020) (size!16304 a!3235)))) (or ((_ is Undefined!4363) lt!238020) ((_ is Found!4363) lt!238020) ((_ is MissingZero!4363) lt!238020) (not ((_ is MissingVacant!4363) lt!238020)) (and (bvsge (index!19649 lt!238020) #b00000000000000000000000000000000) (bvslt (index!19649 lt!238020) (size!16304 a!3235)))) (or ((_ is Undefined!4363) lt!238020) (ite ((_ is Found!4363) lt!238020) (= (select (arr!15940 a!3235) (index!19647 lt!238020)) (select (arr!15940 a!3235) j!176)) (ite ((_ is MissingZero!4363) lt!238020) (= (select (arr!15940 a!3235) (index!19646 lt!238020)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4363) lt!238020) (= (select (arr!15940 a!3235) (index!19649 lt!238020)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!303227 () SeekEntryResult!4363)

(assert (=> d!80187 (= lt!238020 e!303227)))

(declare-fun c!61077 () Bool)

(assert (=> d!80187 (= c!61077 (and ((_ is Intermediate!4363) lt!238021) (undefined!5175 lt!238021)))))

(assert (=> d!80187 (= lt!238021 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15940 a!3235) j!176) mask!3524) (select (arr!15940 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80187 (validMask!0 mask!3524)))

(assert (=> d!80187 (= (seekEntryOrOpen!0 (select (arr!15940 a!3235) j!176) a!3235 mask!3524) lt!238020)))

(declare-fun b!519677 () Bool)

(assert (=> b!519677 (= e!303227 Undefined!4363)))

(declare-fun b!519678 () Bool)

(declare-fun e!303226 () SeekEntryResult!4363)

(assert (=> b!519678 (= e!303226 (Found!4363 (index!19648 lt!238021)))))

(declare-fun b!519679 () Bool)

(assert (=> b!519679 (= e!303225 (seekKeyOrZeroReturnVacant!0 (x!48767 lt!238021) (index!19648 lt!238021) (index!19648 lt!238021) (select (arr!15940 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!519680 () Bool)

(assert (=> b!519680 (= e!303227 e!303226)))

(declare-fun lt!238019 () (_ BitVec 64))

(assert (=> b!519680 (= lt!238019 (select (arr!15940 a!3235) (index!19648 lt!238021)))))

(declare-fun c!61078 () Bool)

(assert (=> b!519680 (= c!61078 (= lt!238019 (select (arr!15940 a!3235) j!176)))))

(declare-fun b!519681 () Bool)

(declare-fun c!61076 () Bool)

(assert (=> b!519681 (= c!61076 (= lt!238019 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519681 (= e!303226 e!303225)))

(assert (= (and d!80187 c!61077) b!519677))

(assert (= (and d!80187 (not c!61077)) b!519680))

(assert (= (and b!519680 c!61078) b!519678))

(assert (= (and b!519680 (not c!61078)) b!519681))

(assert (= (and b!519681 c!61076) b!519676))

(assert (= (and b!519681 (not c!61076)) b!519679))

(assert (=> d!80187 m!500787))

(declare-fun m!501051 () Bool)

(assert (=> d!80187 m!501051))

(assert (=> d!80187 m!500773))

(assert (=> d!80187 m!500769))

(declare-fun m!501053 () Bool)

(assert (=> d!80187 m!501053))

(declare-fun m!501055 () Bool)

(assert (=> d!80187 m!501055))

(assert (=> d!80187 m!500769))

(assert (=> d!80187 m!500773))

(declare-fun m!501057 () Bool)

(assert (=> d!80187 m!501057))

(assert (=> b!519679 m!500769))

(declare-fun m!501059 () Bool)

(assert (=> b!519679 m!501059))

(declare-fun m!501061 () Bool)

(assert (=> b!519680 m!501061))

(assert (=> b!519329 d!80187))

(check-sat (not b!519673) (not bm!31735) (not b!519679) (not bm!31734) (not b!519451) (not d!80159) (not b!519542) (not b!519575) (not b!519448) (not b!519436) (not d!80153) (not b!519447) (not b!519432) (not d!80169) (not d!80171) (not b!519421) (not b!519572) (not b!519435) (not bm!31731) (not b!519452) (not d!80125) (not d!80187) (not b!519557) (not d!80145))
(check-sat)
