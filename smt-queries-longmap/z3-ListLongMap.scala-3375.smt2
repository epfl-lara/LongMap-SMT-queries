; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46472 () Bool)

(assert start!46472)

(declare-fun b!513852 () Bool)

(declare-fun res!314021 () Bool)

(declare-fun e!300055 () Bool)

(assert (=> b!513852 (=> res!314021 e!300055)))

(declare-datatypes ((SeekEntryResult!4273 0))(
  ( (MissingZero!4273 (index!19280 (_ BitVec 32))) (Found!4273 (index!19281 (_ BitVec 32))) (Intermediate!4273 (undefined!5085 Bool) (index!19282 (_ BitVec 32)) (x!48383 (_ BitVec 32))) (Undefined!4273) (MissingVacant!4273 (index!19283 (_ BitVec 32))) )
))
(declare-fun lt!235290 () SeekEntryResult!4273)

(get-info :version)

(assert (=> b!513852 (= res!314021 (or (undefined!5085 lt!235290) (not ((_ is Intermediate!4273) lt!235290))))))

(declare-fun e!300053 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32956 0))(
  ( (array!32957 (arr!15850 (Array (_ BitVec 32) (_ BitVec 64))) (size!16214 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32956)

(declare-fun b!513853 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32956 (_ BitVec 32)) SeekEntryResult!4273)

(assert (=> b!513853 (= e!300053 (= (seekEntryOrOpen!0 (select (arr!15850 a!3235) j!176) a!3235 mask!3524) (Found!4273 j!176)))))

(declare-fun b!513854 () Bool)

(declare-fun res!314027 () Bool)

(declare-fun e!300057 () Bool)

(assert (=> b!513854 (=> (not res!314027) (not e!300057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32956 (_ BitVec 32)) Bool)

(assert (=> b!513854 (= res!314027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!513855 () Bool)

(declare-fun res!314020 () Bool)

(declare-fun e!300056 () Bool)

(assert (=> b!513855 (=> (not res!314020) (not e!300056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!513855 (= res!314020 (validKeyInArray!0 (select (arr!15850 a!3235) j!176)))))

(declare-fun b!513856 () Bool)

(declare-fun res!314026 () Bool)

(assert (=> b!513856 (=> (not res!314026) (not e!300056))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!513856 (= res!314026 (validKeyInArray!0 k0!2280))))

(declare-fun b!513857 () Bool)

(declare-fun res!314019 () Bool)

(assert (=> b!513857 (=> (not res!314019) (not e!300056))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!513857 (= res!314019 (and (= (size!16214 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16214 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16214 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!513859 () Bool)

(assert (=> b!513859 (= e!300056 e!300057)))

(declare-fun res!314025 () Bool)

(assert (=> b!513859 (=> (not res!314025) (not e!300057))))

(declare-fun lt!235293 () SeekEntryResult!4273)

(assert (=> b!513859 (= res!314025 (or (= lt!235293 (MissingZero!4273 i!1204)) (= lt!235293 (MissingVacant!4273 i!1204))))))

(assert (=> b!513859 (= lt!235293 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!513860 () Bool)

(declare-fun res!314024 () Bool)

(assert (=> b!513860 (=> (not res!314024) (not e!300056))))

(declare-fun arrayContainsKey!0 (array!32956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!513860 (= res!314024 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!513861 () Bool)

(declare-fun res!314023 () Bool)

(assert (=> b!513861 (=> (not res!314023) (not e!300057))))

(declare-datatypes ((List!9915 0))(
  ( (Nil!9912) (Cons!9911 (h!10800 (_ BitVec 64)) (t!16135 List!9915)) )
))
(declare-fun arrayNoDuplicates!0 (array!32956 (_ BitVec 32) List!9915) Bool)

(assert (=> b!513861 (= res!314023 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9912))))

(declare-fun b!513862 () Bool)

(assert (=> b!513862 (= e!300057 (not e!300055))))

(declare-fun res!314028 () Bool)

(assert (=> b!513862 (=> res!314028 e!300055)))

(declare-fun lt!235294 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32956 (_ BitVec 32)) SeekEntryResult!4273)

(assert (=> b!513862 (= res!314028 (= lt!235290 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235294 (select (store (arr!15850 a!3235) i!1204 k0!2280) j!176) (array!32957 (store (arr!15850 a!3235) i!1204 k0!2280) (size!16214 a!3235)) mask!3524)))))

(declare-fun lt!235292 () (_ BitVec 32))

(assert (=> b!513862 (= lt!235290 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235292 (select (arr!15850 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513862 (= lt!235294 (toIndex!0 (select (store (arr!15850 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!513862 (= lt!235292 (toIndex!0 (select (arr!15850 a!3235) j!176) mask!3524))))

(assert (=> b!513862 e!300053))

(declare-fun res!314029 () Bool)

(assert (=> b!513862 (=> (not res!314029) (not e!300053))))

(assert (=> b!513862 (= res!314029 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15865 0))(
  ( (Unit!15866) )
))
(declare-fun lt!235291 () Unit!15865)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32956 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15865)

(assert (=> b!513862 (= lt!235291 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!314022 () Bool)

(assert (=> start!46472 (=> (not res!314022) (not e!300056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46472 (= res!314022 (validMask!0 mask!3524))))

(assert (=> start!46472 e!300056))

(assert (=> start!46472 true))

(declare-fun array_inv!11709 (array!32956) Bool)

(assert (=> start!46472 (array_inv!11709 a!3235)))

(declare-fun b!513858 () Bool)

(assert (=> b!513858 (= e!300055 (or (= (select (arr!15850 a!3235) (index!19282 lt!235290)) (select (arr!15850 a!3235) j!176)) (= (select (arr!15850 a!3235) (index!19282 lt!235290)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (bvsge (index!19282 lt!235290) #b00000000000000000000000000000000) (bvslt (index!19282 lt!235290) (size!16214 a!3235)))))))

(assert (=> b!513858 (bvslt (x!48383 lt!235290) #b01111111111111111111111111111110)))

(assert (= (and start!46472 res!314022) b!513857))

(assert (= (and b!513857 res!314019) b!513855))

(assert (= (and b!513855 res!314020) b!513856))

(assert (= (and b!513856 res!314026) b!513860))

(assert (= (and b!513860 res!314024) b!513859))

(assert (= (and b!513859 res!314025) b!513854))

(assert (= (and b!513854 res!314027) b!513861))

(assert (= (and b!513861 res!314023) b!513862))

(assert (= (and b!513862 res!314029) b!513853))

(assert (= (and b!513862 (not res!314028)) b!513852))

(assert (= (and b!513852 (not res!314021)) b!513858))

(declare-fun m!495595 () Bool)

(assert (=> b!513853 m!495595))

(assert (=> b!513853 m!495595))

(declare-fun m!495597 () Bool)

(assert (=> b!513853 m!495597))

(assert (=> b!513855 m!495595))

(assert (=> b!513855 m!495595))

(declare-fun m!495599 () Bool)

(assert (=> b!513855 m!495599))

(declare-fun m!495601 () Bool)

(assert (=> b!513859 m!495601))

(declare-fun m!495603 () Bool)

(assert (=> b!513862 m!495603))

(declare-fun m!495605 () Bool)

(assert (=> b!513862 m!495605))

(declare-fun m!495607 () Bool)

(assert (=> b!513862 m!495607))

(assert (=> b!513862 m!495607))

(declare-fun m!495609 () Bool)

(assert (=> b!513862 m!495609))

(assert (=> b!513862 m!495595))

(declare-fun m!495611 () Bool)

(assert (=> b!513862 m!495611))

(assert (=> b!513862 m!495595))

(declare-fun m!495613 () Bool)

(assert (=> b!513862 m!495613))

(assert (=> b!513862 m!495607))

(declare-fun m!495615 () Bool)

(assert (=> b!513862 m!495615))

(assert (=> b!513862 m!495595))

(declare-fun m!495617 () Bool)

(assert (=> b!513862 m!495617))

(declare-fun m!495619 () Bool)

(assert (=> b!513860 m!495619))

(declare-fun m!495621 () Bool)

(assert (=> b!513858 m!495621))

(assert (=> b!513858 m!495595))

(declare-fun m!495623 () Bool)

(assert (=> start!46472 m!495623))

(declare-fun m!495625 () Bool)

(assert (=> start!46472 m!495625))

(declare-fun m!495627 () Bool)

(assert (=> b!513856 m!495627))

(declare-fun m!495629 () Bool)

(assert (=> b!513854 m!495629))

(declare-fun m!495631 () Bool)

(assert (=> b!513861 m!495631))

(check-sat (not b!513860) (not start!46472) (not b!513854) (not b!513853) (not b!513855) (not b!513859) (not b!513856) (not b!513861) (not b!513862))
(check-sat)
(get-model)

(declare-fun d!79301 () Bool)

(assert (=> d!79301 (= (validKeyInArray!0 (select (arr!15850 a!3235) j!176)) (and (not (= (select (arr!15850 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15850 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513855 d!79301))

(declare-fun b!513939 () Bool)

(declare-fun e!300097 () Bool)

(declare-fun e!300099 () Bool)

(assert (=> b!513939 (= e!300097 e!300099)))

(declare-fun res!314102 () Bool)

(assert (=> b!513939 (=> (not res!314102) (not e!300099))))

(declare-fun e!300096 () Bool)

(assert (=> b!513939 (= res!314102 (not e!300096))))

(declare-fun res!314103 () Bool)

(assert (=> b!513939 (=> (not res!314103) (not e!300096))))

(assert (=> b!513939 (= res!314103 (validKeyInArray!0 (select (arr!15850 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513940 () Bool)

(declare-fun e!300098 () Bool)

(declare-fun call!31566 () Bool)

(assert (=> b!513940 (= e!300098 call!31566)))

(declare-fun bm!31563 () Bool)

(declare-fun c!60203 () Bool)

(assert (=> bm!31563 (= call!31566 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60203 (Cons!9911 (select (arr!15850 a!3235) #b00000000000000000000000000000000) Nil!9912) Nil!9912)))))

(declare-fun b!513941 () Bool)

(assert (=> b!513941 (= e!300098 call!31566)))

(declare-fun d!79303 () Bool)

(declare-fun res!314104 () Bool)

(assert (=> d!79303 (=> res!314104 e!300097)))

(assert (=> d!79303 (= res!314104 (bvsge #b00000000000000000000000000000000 (size!16214 a!3235)))))

(assert (=> d!79303 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9912) e!300097)))

(declare-fun b!513942 () Bool)

(declare-fun contains!2711 (List!9915 (_ BitVec 64)) Bool)

(assert (=> b!513942 (= e!300096 (contains!2711 Nil!9912 (select (arr!15850 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513943 () Bool)

(assert (=> b!513943 (= e!300099 e!300098)))

(assert (=> b!513943 (= c!60203 (validKeyInArray!0 (select (arr!15850 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79303 (not res!314104)) b!513939))

(assert (= (and b!513939 res!314103) b!513942))

(assert (= (and b!513939 res!314102) b!513943))

(assert (= (and b!513943 c!60203) b!513940))

(assert (= (and b!513943 (not c!60203)) b!513941))

(assert (= (or b!513940 b!513941) bm!31563))

(declare-fun m!495709 () Bool)

(assert (=> b!513939 m!495709))

(assert (=> b!513939 m!495709))

(declare-fun m!495711 () Bool)

(assert (=> b!513939 m!495711))

(assert (=> bm!31563 m!495709))

(declare-fun m!495713 () Bool)

(assert (=> bm!31563 m!495713))

(assert (=> b!513942 m!495709))

(assert (=> b!513942 m!495709))

(declare-fun m!495715 () Bool)

(assert (=> b!513942 m!495715))

(assert (=> b!513943 m!495709))

(assert (=> b!513943 m!495709))

(assert (=> b!513943 m!495711))

(assert (=> b!513861 d!79303))

(declare-fun d!79305 () Bool)

(assert (=> d!79305 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513856 d!79305))

(declare-fun e!300119 () SeekEntryResult!4273)

(declare-fun lt!235333 () SeekEntryResult!4273)

(declare-fun b!513971 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32956 (_ BitVec 32)) SeekEntryResult!4273)

(assert (=> b!513971 (= e!300119 (seekKeyOrZeroReturnVacant!0 (x!48383 lt!235333) (index!19282 lt!235333) (index!19282 lt!235333) k0!2280 a!3235 mask!3524))))

(declare-fun b!513972 () Bool)

(declare-fun e!300120 () SeekEntryResult!4273)

(assert (=> b!513972 (= e!300120 (Found!4273 (index!19282 lt!235333)))))

(declare-fun b!513973 () Bool)

(assert (=> b!513973 (= e!300119 (MissingZero!4273 (index!19282 lt!235333)))))

(declare-fun d!79307 () Bool)

(declare-fun lt!235332 () SeekEntryResult!4273)

(assert (=> d!79307 (and (or ((_ is Undefined!4273) lt!235332) (not ((_ is Found!4273) lt!235332)) (and (bvsge (index!19281 lt!235332) #b00000000000000000000000000000000) (bvslt (index!19281 lt!235332) (size!16214 a!3235)))) (or ((_ is Undefined!4273) lt!235332) ((_ is Found!4273) lt!235332) (not ((_ is MissingZero!4273) lt!235332)) (and (bvsge (index!19280 lt!235332) #b00000000000000000000000000000000) (bvslt (index!19280 lt!235332) (size!16214 a!3235)))) (or ((_ is Undefined!4273) lt!235332) ((_ is Found!4273) lt!235332) ((_ is MissingZero!4273) lt!235332) (not ((_ is MissingVacant!4273) lt!235332)) (and (bvsge (index!19283 lt!235332) #b00000000000000000000000000000000) (bvslt (index!19283 lt!235332) (size!16214 a!3235)))) (or ((_ is Undefined!4273) lt!235332) (ite ((_ is Found!4273) lt!235332) (= (select (arr!15850 a!3235) (index!19281 lt!235332)) k0!2280) (ite ((_ is MissingZero!4273) lt!235332) (= (select (arr!15850 a!3235) (index!19280 lt!235332)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4273) lt!235332) (= (select (arr!15850 a!3235) (index!19283 lt!235332)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!300118 () SeekEntryResult!4273)

(assert (=> d!79307 (= lt!235332 e!300118)))

(declare-fun c!60214 () Bool)

(assert (=> d!79307 (= c!60214 (and ((_ is Intermediate!4273) lt!235333) (undefined!5085 lt!235333)))))

(assert (=> d!79307 (= lt!235333 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79307 (validMask!0 mask!3524)))

(assert (=> d!79307 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!235332)))

(declare-fun b!513974 () Bool)

(assert (=> b!513974 (= e!300118 e!300120)))

(declare-fun lt!235331 () (_ BitVec 64))

(assert (=> b!513974 (= lt!235331 (select (arr!15850 a!3235) (index!19282 lt!235333)))))

(declare-fun c!60215 () Bool)

(assert (=> b!513974 (= c!60215 (= lt!235331 k0!2280))))

(declare-fun b!513975 () Bool)

(declare-fun c!60213 () Bool)

(assert (=> b!513975 (= c!60213 (= lt!235331 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!513975 (= e!300120 e!300119)))

(declare-fun b!513976 () Bool)

(assert (=> b!513976 (= e!300118 Undefined!4273)))

(assert (= (and d!79307 c!60214) b!513976))

(assert (= (and d!79307 (not c!60214)) b!513974))

(assert (= (and b!513974 c!60215) b!513972))

(assert (= (and b!513974 (not c!60215)) b!513975))

(assert (= (and b!513975 c!60213) b!513973))

(assert (= (and b!513975 (not c!60213)) b!513971))

(declare-fun m!495725 () Bool)

(assert (=> b!513971 m!495725))

(assert (=> d!79307 m!495623))

(declare-fun m!495727 () Bool)

(assert (=> d!79307 m!495727))

(declare-fun m!495729 () Bool)

(assert (=> d!79307 m!495729))

(declare-fun m!495731 () Bool)

(assert (=> d!79307 m!495731))

(assert (=> d!79307 m!495727))

(declare-fun m!495733 () Bool)

(assert (=> d!79307 m!495733))

(declare-fun m!495735 () Bool)

(assert (=> d!79307 m!495735))

(declare-fun m!495737 () Bool)

(assert (=> b!513974 m!495737))

(assert (=> b!513859 d!79307))

(declare-fun d!79321 () Bool)

(declare-fun res!314118 () Bool)

(declare-fun e!300133 () Bool)

(assert (=> d!79321 (=> res!314118 e!300133)))

(assert (=> d!79321 (= res!314118 (bvsge #b00000000000000000000000000000000 (size!16214 a!3235)))))

(assert (=> d!79321 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!300133)))

(declare-fun b!513997 () Bool)

(declare-fun e!300134 () Bool)

(declare-fun call!31572 () Bool)

(assert (=> b!513997 (= e!300134 call!31572)))

(declare-fun b!513998 () Bool)

(assert (=> b!513998 (= e!300133 e!300134)))

(declare-fun c!60224 () Bool)

(assert (=> b!513998 (= c!60224 (validKeyInArray!0 (select (arr!15850 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513999 () Bool)

(declare-fun e!300135 () Bool)

(assert (=> b!513999 (= e!300134 e!300135)))

(declare-fun lt!235347 () (_ BitVec 64))

(assert (=> b!513999 (= lt!235347 (select (arr!15850 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!235346 () Unit!15865)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32956 (_ BitVec 64) (_ BitVec 32)) Unit!15865)

(assert (=> b!513999 (= lt!235346 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235347 #b00000000000000000000000000000000))))

(assert (=> b!513999 (arrayContainsKey!0 a!3235 lt!235347 #b00000000000000000000000000000000)))

(declare-fun lt!235348 () Unit!15865)

(assert (=> b!513999 (= lt!235348 lt!235346)))

(declare-fun res!314119 () Bool)

(assert (=> b!513999 (= res!314119 (= (seekEntryOrOpen!0 (select (arr!15850 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4273 #b00000000000000000000000000000000)))))

(assert (=> b!513999 (=> (not res!314119) (not e!300135))))

(declare-fun b!514000 () Bool)

(assert (=> b!514000 (= e!300135 call!31572)))

(declare-fun bm!31569 () Bool)

(assert (=> bm!31569 (= call!31572 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!79321 (not res!314118)) b!513998))

(assert (= (and b!513998 c!60224) b!513999))

(assert (= (and b!513998 (not c!60224)) b!513997))

(assert (= (and b!513999 res!314119) b!514000))

(assert (= (or b!514000 b!513997) bm!31569))

(assert (=> b!513998 m!495709))

(assert (=> b!513998 m!495709))

(assert (=> b!513998 m!495711))

(assert (=> b!513999 m!495709))

(declare-fun m!495739 () Bool)

(assert (=> b!513999 m!495739))

(declare-fun m!495741 () Bool)

(assert (=> b!513999 m!495741))

(assert (=> b!513999 m!495709))

(declare-fun m!495743 () Bool)

(assert (=> b!513999 m!495743))

(declare-fun m!495745 () Bool)

(assert (=> bm!31569 m!495745))

(assert (=> b!513854 d!79321))

(declare-fun d!79323 () Bool)

(declare-fun res!314124 () Bool)

(declare-fun e!300140 () Bool)

(assert (=> d!79323 (=> res!314124 e!300140)))

(assert (=> d!79323 (= res!314124 (= (select (arr!15850 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79323 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!300140)))

(declare-fun b!514005 () Bool)

(declare-fun e!300141 () Bool)

(assert (=> b!514005 (= e!300140 e!300141)))

(declare-fun res!314125 () Bool)

(assert (=> b!514005 (=> (not res!314125) (not e!300141))))

(assert (=> b!514005 (= res!314125 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16214 a!3235)))))

(declare-fun b!514006 () Bool)

(assert (=> b!514006 (= e!300141 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79323 (not res!314124)) b!514005))

(assert (= (and b!514005 res!314125) b!514006))

(assert (=> d!79323 m!495709))

(declare-fun m!495747 () Bool)

(assert (=> b!514006 m!495747))

(assert (=> b!513860 d!79323))

(declare-fun lt!235351 () SeekEntryResult!4273)

(declare-fun b!514007 () Bool)

(declare-fun e!300143 () SeekEntryResult!4273)

(assert (=> b!514007 (= e!300143 (seekKeyOrZeroReturnVacant!0 (x!48383 lt!235351) (index!19282 lt!235351) (index!19282 lt!235351) (select (arr!15850 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!514008 () Bool)

(declare-fun e!300144 () SeekEntryResult!4273)

(assert (=> b!514008 (= e!300144 (Found!4273 (index!19282 lt!235351)))))

(declare-fun b!514009 () Bool)

(assert (=> b!514009 (= e!300143 (MissingZero!4273 (index!19282 lt!235351)))))

(declare-fun d!79325 () Bool)

(declare-fun lt!235350 () SeekEntryResult!4273)

(assert (=> d!79325 (and (or ((_ is Undefined!4273) lt!235350) (not ((_ is Found!4273) lt!235350)) (and (bvsge (index!19281 lt!235350) #b00000000000000000000000000000000) (bvslt (index!19281 lt!235350) (size!16214 a!3235)))) (or ((_ is Undefined!4273) lt!235350) ((_ is Found!4273) lt!235350) (not ((_ is MissingZero!4273) lt!235350)) (and (bvsge (index!19280 lt!235350) #b00000000000000000000000000000000) (bvslt (index!19280 lt!235350) (size!16214 a!3235)))) (or ((_ is Undefined!4273) lt!235350) ((_ is Found!4273) lt!235350) ((_ is MissingZero!4273) lt!235350) (not ((_ is MissingVacant!4273) lt!235350)) (and (bvsge (index!19283 lt!235350) #b00000000000000000000000000000000) (bvslt (index!19283 lt!235350) (size!16214 a!3235)))) (or ((_ is Undefined!4273) lt!235350) (ite ((_ is Found!4273) lt!235350) (= (select (arr!15850 a!3235) (index!19281 lt!235350)) (select (arr!15850 a!3235) j!176)) (ite ((_ is MissingZero!4273) lt!235350) (= (select (arr!15850 a!3235) (index!19280 lt!235350)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4273) lt!235350) (= (select (arr!15850 a!3235) (index!19283 lt!235350)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!300142 () SeekEntryResult!4273)

(assert (=> d!79325 (= lt!235350 e!300142)))

(declare-fun c!60226 () Bool)

(assert (=> d!79325 (= c!60226 (and ((_ is Intermediate!4273) lt!235351) (undefined!5085 lt!235351)))))

(assert (=> d!79325 (= lt!235351 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15850 a!3235) j!176) mask!3524) (select (arr!15850 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79325 (validMask!0 mask!3524)))

(assert (=> d!79325 (= (seekEntryOrOpen!0 (select (arr!15850 a!3235) j!176) a!3235 mask!3524) lt!235350)))

(declare-fun b!514010 () Bool)

(assert (=> b!514010 (= e!300142 e!300144)))

(declare-fun lt!235349 () (_ BitVec 64))

(assert (=> b!514010 (= lt!235349 (select (arr!15850 a!3235) (index!19282 lt!235351)))))

(declare-fun c!60227 () Bool)

(assert (=> b!514010 (= c!60227 (= lt!235349 (select (arr!15850 a!3235) j!176)))))

(declare-fun b!514011 () Bool)

(declare-fun c!60225 () Bool)

(assert (=> b!514011 (= c!60225 (= lt!235349 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!514011 (= e!300144 e!300143)))

(declare-fun b!514012 () Bool)

(assert (=> b!514012 (= e!300142 Undefined!4273)))

(assert (= (and d!79325 c!60226) b!514012))

(assert (= (and d!79325 (not c!60226)) b!514010))

(assert (= (and b!514010 c!60227) b!514008))

(assert (= (and b!514010 (not c!60227)) b!514011))

(assert (= (and b!514011 c!60225) b!514009))

(assert (= (and b!514011 (not c!60225)) b!514007))

(assert (=> b!514007 m!495595))

(declare-fun m!495749 () Bool)

(assert (=> b!514007 m!495749))

(assert (=> d!79325 m!495623))

(assert (=> d!79325 m!495611))

(assert (=> d!79325 m!495595))

(declare-fun m!495751 () Bool)

(assert (=> d!79325 m!495751))

(declare-fun m!495753 () Bool)

(assert (=> d!79325 m!495753))

(assert (=> d!79325 m!495595))

(assert (=> d!79325 m!495611))

(declare-fun m!495757 () Bool)

(assert (=> d!79325 m!495757))

(declare-fun m!495759 () Bool)

(assert (=> d!79325 m!495759))

(declare-fun m!495761 () Bool)

(assert (=> b!514010 m!495761))

(assert (=> b!513853 d!79325))

(declare-fun b!514094 () Bool)

(declare-fun e!300194 () SeekEntryResult!4273)

(assert (=> b!514094 (= e!300194 (Intermediate!4273 false lt!235292 #b00000000000000000000000000000000))))

(declare-fun d!79327 () Bool)

(declare-fun e!300196 () Bool)

(assert (=> d!79327 e!300196))

(declare-fun c!60259 () Bool)

(declare-fun lt!235390 () SeekEntryResult!4273)

(assert (=> d!79327 (= c!60259 (and ((_ is Intermediate!4273) lt!235390) (undefined!5085 lt!235390)))))

(declare-fun e!300198 () SeekEntryResult!4273)

(assert (=> d!79327 (= lt!235390 e!300198)))

(declare-fun c!60260 () Bool)

(assert (=> d!79327 (= c!60260 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235389 () (_ BitVec 64))

(assert (=> d!79327 (= lt!235389 (select (arr!15850 a!3235) lt!235292))))

(assert (=> d!79327 (validMask!0 mask!3524)))

(assert (=> d!79327 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235292 (select (arr!15850 a!3235) j!176) a!3235 mask!3524) lt!235390)))

(declare-fun b!514095 () Bool)

(declare-fun e!300197 () Bool)

(assert (=> b!514095 (= e!300196 e!300197)))

(declare-fun res!314150 () Bool)

(assert (=> b!514095 (= res!314150 (and ((_ is Intermediate!4273) lt!235390) (not (undefined!5085 lt!235390)) (bvslt (x!48383 lt!235390) #b01111111111111111111111111111110) (bvsge (x!48383 lt!235390) #b00000000000000000000000000000000) (bvsge (x!48383 lt!235390) #b00000000000000000000000000000000)))))

(assert (=> b!514095 (=> (not res!314150) (not e!300197))))

(declare-fun b!514096 () Bool)

(assert (=> b!514096 (and (bvsge (index!19282 lt!235390) #b00000000000000000000000000000000) (bvslt (index!19282 lt!235390) (size!16214 a!3235)))))

(declare-fun res!314148 () Bool)

(assert (=> b!514096 (= res!314148 (= (select (arr!15850 a!3235) (index!19282 lt!235390)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300195 () Bool)

(assert (=> b!514096 (=> res!314148 e!300195)))

(declare-fun b!514097 () Bool)

(assert (=> b!514097 (= e!300198 (Intermediate!4273 true lt!235292 #b00000000000000000000000000000000))))

(declare-fun b!514098 () Bool)

(assert (=> b!514098 (and (bvsge (index!19282 lt!235390) #b00000000000000000000000000000000) (bvslt (index!19282 lt!235390) (size!16214 a!3235)))))

(declare-fun res!314149 () Bool)

(assert (=> b!514098 (= res!314149 (= (select (arr!15850 a!3235) (index!19282 lt!235390)) (select (arr!15850 a!3235) j!176)))))

(assert (=> b!514098 (=> res!314149 e!300195)))

(assert (=> b!514098 (= e!300197 e!300195)))

(declare-fun b!514099 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!514099 (= e!300194 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235292 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!15850 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!514100 () Bool)

(assert (=> b!514100 (= e!300198 e!300194)))

(declare-fun c!60258 () Bool)

(assert (=> b!514100 (= c!60258 (or (= lt!235389 (select (arr!15850 a!3235) j!176)) (= (bvadd lt!235389 lt!235389) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514101 () Bool)

(assert (=> b!514101 (= e!300196 (bvsge (x!48383 lt!235390) #b01111111111111111111111111111110))))

(declare-fun b!514102 () Bool)

(assert (=> b!514102 (and (bvsge (index!19282 lt!235390) #b00000000000000000000000000000000) (bvslt (index!19282 lt!235390) (size!16214 a!3235)))))

(assert (=> b!514102 (= e!300195 (= (select (arr!15850 a!3235) (index!19282 lt!235390)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!79327 c!60260) b!514097))

(assert (= (and d!79327 (not c!60260)) b!514100))

(assert (= (and b!514100 c!60258) b!514094))

(assert (= (and b!514100 (not c!60258)) b!514099))

(assert (= (and d!79327 c!60259) b!514101))

(assert (= (and d!79327 (not c!60259)) b!514095))

(assert (= (and b!514095 res!314150) b!514098))

(assert (= (and b!514098 (not res!314149)) b!514096))

(assert (= (and b!514096 (not res!314148)) b!514102))

(declare-fun m!495829 () Bool)

(assert (=> b!514102 m!495829))

(declare-fun m!495831 () Bool)

(assert (=> d!79327 m!495831))

(assert (=> d!79327 m!495623))

(declare-fun m!495833 () Bool)

(assert (=> b!514099 m!495833))

(assert (=> b!514099 m!495833))

(assert (=> b!514099 m!495595))

(declare-fun m!495835 () Bool)

(assert (=> b!514099 m!495835))

(assert (=> b!514098 m!495829))

(assert (=> b!514096 m!495829))

(assert (=> b!513862 d!79327))

(declare-fun d!79347 () Bool)

(declare-fun res!314151 () Bool)

(declare-fun e!300199 () Bool)

(assert (=> d!79347 (=> res!314151 e!300199)))

(assert (=> d!79347 (= res!314151 (bvsge j!176 (size!16214 a!3235)))))

(assert (=> d!79347 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!300199)))

(declare-fun b!514103 () Bool)

(declare-fun e!300200 () Bool)

(declare-fun call!31579 () Bool)

(assert (=> b!514103 (= e!300200 call!31579)))

(declare-fun b!514104 () Bool)

(assert (=> b!514104 (= e!300199 e!300200)))

(declare-fun c!60261 () Bool)

(assert (=> b!514104 (= c!60261 (validKeyInArray!0 (select (arr!15850 a!3235) j!176)))))

(declare-fun b!514105 () Bool)

(declare-fun e!300201 () Bool)

(assert (=> b!514105 (= e!300200 e!300201)))

(declare-fun lt!235392 () (_ BitVec 64))

(assert (=> b!514105 (= lt!235392 (select (arr!15850 a!3235) j!176))))

(declare-fun lt!235391 () Unit!15865)

(assert (=> b!514105 (= lt!235391 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235392 j!176))))

(assert (=> b!514105 (arrayContainsKey!0 a!3235 lt!235392 #b00000000000000000000000000000000)))

(declare-fun lt!235393 () Unit!15865)

(assert (=> b!514105 (= lt!235393 lt!235391)))

(declare-fun res!314152 () Bool)

(assert (=> b!514105 (= res!314152 (= (seekEntryOrOpen!0 (select (arr!15850 a!3235) j!176) a!3235 mask!3524) (Found!4273 j!176)))))

(assert (=> b!514105 (=> (not res!314152) (not e!300201))))

(declare-fun b!514106 () Bool)

(assert (=> b!514106 (= e!300201 call!31579)))

(declare-fun bm!31576 () Bool)

(assert (=> bm!31576 (= call!31579 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!79347 (not res!314151)) b!514104))

(assert (= (and b!514104 c!60261) b!514105))

(assert (= (and b!514104 (not c!60261)) b!514103))

(assert (= (and b!514105 res!314152) b!514106))

(assert (= (or b!514106 b!514103) bm!31576))

(assert (=> b!514104 m!495595))

(assert (=> b!514104 m!495595))

(assert (=> b!514104 m!495599))

(assert (=> b!514105 m!495595))

(declare-fun m!495837 () Bool)

(assert (=> b!514105 m!495837))

(declare-fun m!495839 () Bool)

(assert (=> b!514105 m!495839))

(assert (=> b!514105 m!495595))

(assert (=> b!514105 m!495597))

(declare-fun m!495841 () Bool)

(assert (=> bm!31576 m!495841))

(assert (=> b!513862 d!79347))

(declare-fun d!79349 () Bool)

(assert (=> d!79349 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!235396 () Unit!15865)

(declare-fun choose!38 (array!32956 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15865)

(assert (=> d!79349 (= lt!235396 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79349 (validMask!0 mask!3524)))

(assert (=> d!79349 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!235396)))

(declare-fun bs!16277 () Bool)

(assert (= bs!16277 d!79349))

(assert (=> bs!16277 m!495613))

(declare-fun m!495845 () Bool)

(assert (=> bs!16277 m!495845))

(assert (=> bs!16277 m!495623))

(assert (=> b!513862 d!79349))

(declare-fun d!79353 () Bool)

(declare-fun lt!235411 () (_ BitVec 32))

(declare-fun lt!235410 () (_ BitVec 32))

(assert (=> d!79353 (= lt!235411 (bvmul (bvxor lt!235410 (bvlshr lt!235410 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79353 (= lt!235410 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15850 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15850 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79353 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314160 (let ((h!10805 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15850 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15850 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48389 (bvmul (bvxor h!10805 (bvlshr h!10805 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48389 (bvlshr x!48389 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314160 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314160 #b00000000000000000000000000000000))))))

(assert (=> d!79353 (= (toIndex!0 (select (store (arr!15850 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!235411 (bvlshr lt!235411 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513862 d!79353))

(declare-fun d!79359 () Bool)

(declare-fun lt!235413 () (_ BitVec 32))

(declare-fun lt!235412 () (_ BitVec 32))

(assert (=> d!79359 (= lt!235413 (bvmul (bvxor lt!235412 (bvlshr lt!235412 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79359 (= lt!235412 ((_ extract 31 0) (bvand (bvxor (select (arr!15850 a!3235) j!176) (bvlshr (select (arr!15850 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79359 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!314160 (let ((h!10805 ((_ extract 31 0) (bvand (bvxor (select (arr!15850 a!3235) j!176) (bvlshr (select (arr!15850 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48389 (bvmul (bvxor h!10805 (bvlshr h!10805 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48389 (bvlshr x!48389 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!314160 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!314160 #b00000000000000000000000000000000))))))

(assert (=> d!79359 (= (toIndex!0 (select (arr!15850 a!3235) j!176) mask!3524) (bvand (bvxor lt!235413 (bvlshr lt!235413 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513862 d!79359))

(declare-fun b!514117 () Bool)

(declare-fun e!300211 () SeekEntryResult!4273)

(assert (=> b!514117 (= e!300211 (Intermediate!4273 false lt!235294 #b00000000000000000000000000000000))))

(declare-fun d!79361 () Bool)

(declare-fun e!300213 () Bool)

(assert (=> d!79361 e!300213))

(declare-fun c!60264 () Bool)

(declare-fun lt!235415 () SeekEntryResult!4273)

(assert (=> d!79361 (= c!60264 (and ((_ is Intermediate!4273) lt!235415) (undefined!5085 lt!235415)))))

(declare-fun e!300215 () SeekEntryResult!4273)

(assert (=> d!79361 (= lt!235415 e!300215)))

(declare-fun c!60265 () Bool)

(assert (=> d!79361 (= c!60265 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235414 () (_ BitVec 64))

(assert (=> d!79361 (= lt!235414 (select (arr!15850 (array!32957 (store (arr!15850 a!3235) i!1204 k0!2280) (size!16214 a!3235))) lt!235294))))

(assert (=> d!79361 (validMask!0 mask!3524)))

(assert (=> d!79361 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!235294 (select (store (arr!15850 a!3235) i!1204 k0!2280) j!176) (array!32957 (store (arr!15850 a!3235) i!1204 k0!2280) (size!16214 a!3235)) mask!3524) lt!235415)))

(declare-fun b!514118 () Bool)

(declare-fun e!300214 () Bool)

(assert (=> b!514118 (= e!300213 e!300214)))

(declare-fun res!314165 () Bool)

(assert (=> b!514118 (= res!314165 (and ((_ is Intermediate!4273) lt!235415) (not (undefined!5085 lt!235415)) (bvslt (x!48383 lt!235415) #b01111111111111111111111111111110) (bvsge (x!48383 lt!235415) #b00000000000000000000000000000000) (bvsge (x!48383 lt!235415) #b00000000000000000000000000000000)))))

(assert (=> b!514118 (=> (not res!314165) (not e!300214))))

(declare-fun b!514119 () Bool)

(assert (=> b!514119 (and (bvsge (index!19282 lt!235415) #b00000000000000000000000000000000) (bvslt (index!19282 lt!235415) (size!16214 (array!32957 (store (arr!15850 a!3235) i!1204 k0!2280) (size!16214 a!3235)))))))

(declare-fun res!314163 () Bool)

(assert (=> b!514119 (= res!314163 (= (select (arr!15850 (array!32957 (store (arr!15850 a!3235) i!1204 k0!2280) (size!16214 a!3235))) (index!19282 lt!235415)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!300212 () Bool)

(assert (=> b!514119 (=> res!314163 e!300212)))

(declare-fun b!514120 () Bool)

(assert (=> b!514120 (= e!300215 (Intermediate!4273 true lt!235294 #b00000000000000000000000000000000))))

(declare-fun b!514121 () Bool)

(assert (=> b!514121 (and (bvsge (index!19282 lt!235415) #b00000000000000000000000000000000) (bvslt (index!19282 lt!235415) (size!16214 (array!32957 (store (arr!15850 a!3235) i!1204 k0!2280) (size!16214 a!3235)))))))

(declare-fun res!314164 () Bool)

(assert (=> b!514121 (= res!314164 (= (select (arr!15850 (array!32957 (store (arr!15850 a!3235) i!1204 k0!2280) (size!16214 a!3235))) (index!19282 lt!235415)) (select (store (arr!15850 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!514121 (=> res!314164 e!300212)))

(assert (=> b!514121 (= e!300214 e!300212)))

(declare-fun b!514122 () Bool)

(assert (=> b!514122 (= e!300211 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!235294 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (store (arr!15850 a!3235) i!1204 k0!2280) j!176) (array!32957 (store (arr!15850 a!3235) i!1204 k0!2280) (size!16214 a!3235)) mask!3524))))

(declare-fun b!514123 () Bool)

(assert (=> b!514123 (= e!300215 e!300211)))

(declare-fun c!60263 () Bool)

(assert (=> b!514123 (= c!60263 (or (= lt!235414 (select (store (arr!15850 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!235414 lt!235414) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!514124 () Bool)

(assert (=> b!514124 (= e!300213 (bvsge (x!48383 lt!235415) #b01111111111111111111111111111110))))

(declare-fun b!514125 () Bool)

(assert (=> b!514125 (and (bvsge (index!19282 lt!235415) #b00000000000000000000000000000000) (bvslt (index!19282 lt!235415) (size!16214 (array!32957 (store (arr!15850 a!3235) i!1204 k0!2280) (size!16214 a!3235)))))))

(assert (=> b!514125 (= e!300212 (= (select (arr!15850 (array!32957 (store (arr!15850 a!3235) i!1204 k0!2280) (size!16214 a!3235))) (index!19282 lt!235415)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!79361 c!60265) b!514120))

(assert (= (and d!79361 (not c!60265)) b!514123))

(assert (= (and b!514123 c!60263) b!514117))

(assert (= (and b!514123 (not c!60263)) b!514122))

(assert (= (and d!79361 c!60264) b!514124))

(assert (= (and d!79361 (not c!60264)) b!514118))

(assert (= (and b!514118 res!314165) b!514121))

(assert (= (and b!514121 (not res!314164)) b!514119))

(assert (= (and b!514119 (not res!314163)) b!514125))

(declare-fun m!495853 () Bool)

(assert (=> b!514125 m!495853))

(declare-fun m!495855 () Bool)

(assert (=> d!79361 m!495855))

(assert (=> d!79361 m!495623))

(declare-fun m!495857 () Bool)

(assert (=> b!514122 m!495857))

(assert (=> b!514122 m!495857))

(assert (=> b!514122 m!495607))

(declare-fun m!495859 () Bool)

(assert (=> b!514122 m!495859))

(assert (=> b!514121 m!495853))

(assert (=> b!514119 m!495853))

(assert (=> b!513862 d!79361))

(declare-fun d!79363 () Bool)

(assert (=> d!79363 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46472 d!79363))

(declare-fun d!79367 () Bool)

(assert (=> d!79367 (= (array_inv!11709 a!3235) (bvsge (size!16214 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46472 d!79367))

(check-sat (not bm!31576) (not d!79325) (not d!79307) (not b!513971) (not b!514105) (not bm!31569) (not b!514122) (not b!513942) (not b!514099) (not d!79349) (not d!79361) (not b!513939) (not b!513998) (not b!513943) (not b!514007) (not b!513999) (not d!79327) (not b!514104) (not bm!31563) (not b!514006))
(check-sat)
