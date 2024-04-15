; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45276 () Bool)

(assert start!45276)

(declare-fun b!497337 () Bool)

(declare-fun e!291490 () Bool)

(assert (=> b!497337 (= e!291490 false)))

(declare-fun b!497338 () Bool)

(declare-fun res!299849 () Bool)

(declare-fun e!291487 () Bool)

(assert (=> b!497338 (=> (not res!299849) (not e!291487))))

(declare-datatypes ((array!32174 0))(
  ( (array!32175 (arr!15470 (Array (_ BitVec 32) (_ BitVec 64))) (size!15835 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32174)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32174 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497338 (= res!299849 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497339 () Bool)

(declare-fun res!299846 () Bool)

(declare-fun e!291491 () Bool)

(assert (=> b!497339 (=> (not res!299846) (not e!291491))))

(declare-datatypes ((List!9667 0))(
  ( (Nil!9664) (Cons!9663 (h!10534 (_ BitVec 64)) (t!15886 List!9667)) )
))
(declare-fun arrayNoDuplicates!0 (array!32174 (_ BitVec 32) List!9667) Bool)

(assert (=> b!497339 (= res!299846 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9664))))

(declare-fun b!497340 () Bool)

(declare-fun res!299855 () Bool)

(assert (=> b!497340 (=> (not res!299855) (not e!291487))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497340 (= res!299855 (validKeyInArray!0 k0!2280))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun e!291486 () Bool)

(declare-fun b!497341 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3934 0))(
  ( (MissingZero!3934 (index!17915 (_ BitVec 32))) (Found!3934 (index!17916 (_ BitVec 32))) (Intermediate!3934 (undefined!4746 Bool) (index!17917 (_ BitVec 32)) (x!46973 (_ BitVec 32))) (Undefined!3934) (MissingVacant!3934 (index!17918 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32174 (_ BitVec 32)) SeekEntryResult!3934)

(assert (=> b!497341 (= e!291486 (= (seekEntryOrOpen!0 (select (arr!15470 a!3235) j!176) a!3235 mask!3524) (Found!3934 j!176)))))

(declare-fun b!497342 () Bool)

(declare-fun res!299847 () Bool)

(declare-fun e!291488 () Bool)

(assert (=> b!497342 (=> res!299847 e!291488)))

(declare-fun lt!225070 () SeekEntryResult!3934)

(get-info :version)

(assert (=> b!497342 (= res!299847 (or (undefined!4746 lt!225070) (not ((_ is Intermediate!3934) lt!225070))))))

(declare-fun b!497343 () Bool)

(declare-fun res!299853 () Bool)

(assert (=> b!497343 (=> (not res!299853) (not e!291491))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32174 (_ BitVec 32)) Bool)

(assert (=> b!497343 (= res!299853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497345 () Bool)

(declare-datatypes ((Unit!14806 0))(
  ( (Unit!14807) )
))
(declare-fun e!291492 () Unit!14806)

(declare-fun Unit!14808 () Unit!14806)

(assert (=> b!497345 (= e!291492 Unit!14808)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!225075 () (_ BitVec 32))

(declare-fun lt!225071 () Unit!14806)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32174 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14806)

(assert (=> b!497345 (= lt!225071 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225075 #b00000000000000000000000000000000 (index!17917 lt!225070) (x!46973 lt!225070) mask!3524))))

(declare-fun lt!225074 () array!32174)

(declare-fun res!299851 () Bool)

(declare-fun lt!225073 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32174 (_ BitVec 32)) SeekEntryResult!3934)

(assert (=> b!497345 (= res!299851 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225075 lt!225073 lt!225074 mask!3524) (Intermediate!3934 false (index!17917 lt!225070) (x!46973 lt!225070))))))

(assert (=> b!497345 (=> (not res!299851) (not e!291490))))

(assert (=> b!497345 e!291490))

(declare-fun b!497346 () Bool)

(declare-fun Unit!14809 () Unit!14806)

(assert (=> b!497346 (= e!291492 Unit!14809)))

(declare-fun b!497347 () Bool)

(assert (=> b!497347 (= e!291487 e!291491)))

(declare-fun res!299854 () Bool)

(assert (=> b!497347 (=> (not res!299854) (not e!291491))))

(declare-fun lt!225068 () SeekEntryResult!3934)

(assert (=> b!497347 (= res!299854 (or (= lt!225068 (MissingZero!3934 i!1204)) (= lt!225068 (MissingVacant!3934 i!1204))))))

(assert (=> b!497347 (= lt!225068 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!299845 () Bool)

(assert (=> start!45276 (=> (not res!299845) (not e!291487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45276 (= res!299845 (validMask!0 mask!3524))))

(assert (=> start!45276 e!291487))

(assert (=> start!45276 true))

(declare-fun array_inv!11353 (array!32174) Bool)

(assert (=> start!45276 (array_inv!11353 a!3235)))

(declare-fun b!497344 () Bool)

(declare-fun res!299850 () Bool)

(assert (=> b!497344 (=> (not res!299850) (not e!291487))))

(assert (=> b!497344 (= res!299850 (and (= (size!15835 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15835 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15835 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497348 () Bool)

(assert (=> b!497348 (= e!291488 (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> b!497348 (and (or (= (select (arr!15470 a!3235) (index!17917 lt!225070)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15470 a!3235) (index!17917 lt!225070)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15470 a!3235) (index!17917 lt!225070)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15470 a!3235) (index!17917 lt!225070)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225069 () Unit!14806)

(assert (=> b!497348 (= lt!225069 e!291492)))

(declare-fun c!59022 () Bool)

(assert (=> b!497348 (= c!59022 (= (select (arr!15470 a!3235) (index!17917 lt!225070)) (select (arr!15470 a!3235) j!176)))))

(assert (=> b!497348 (and (bvslt (x!46973 lt!225070) #b01111111111111111111111111111110) (or (= (select (arr!15470 a!3235) (index!17917 lt!225070)) (select (arr!15470 a!3235) j!176)) (= (select (arr!15470 a!3235) (index!17917 lt!225070)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15470 a!3235) (index!17917 lt!225070)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497349 () Bool)

(assert (=> b!497349 (= e!291491 (not e!291488))))

(declare-fun res!299844 () Bool)

(assert (=> b!497349 (=> res!299844 e!291488)))

(declare-fun lt!225072 () (_ BitVec 32))

(assert (=> b!497349 (= res!299844 (= lt!225070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225072 lt!225073 lt!225074 mask!3524)))))

(assert (=> b!497349 (= lt!225070 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225075 (select (arr!15470 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497349 (= lt!225072 (toIndex!0 lt!225073 mask!3524))))

(assert (=> b!497349 (= lt!225073 (select (store (arr!15470 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!497349 (= lt!225075 (toIndex!0 (select (arr!15470 a!3235) j!176) mask!3524))))

(assert (=> b!497349 (= lt!225074 (array!32175 (store (arr!15470 a!3235) i!1204 k0!2280) (size!15835 a!3235)))))

(assert (=> b!497349 e!291486))

(declare-fun res!299852 () Bool)

(assert (=> b!497349 (=> (not res!299852) (not e!291486))))

(assert (=> b!497349 (= res!299852 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225076 () Unit!14806)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14806)

(assert (=> b!497349 (= lt!225076 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497350 () Bool)

(declare-fun res!299848 () Bool)

(assert (=> b!497350 (=> (not res!299848) (not e!291487))))

(assert (=> b!497350 (= res!299848 (validKeyInArray!0 (select (arr!15470 a!3235) j!176)))))

(assert (= (and start!45276 res!299845) b!497344))

(assert (= (and b!497344 res!299850) b!497350))

(assert (= (and b!497350 res!299848) b!497340))

(assert (= (and b!497340 res!299855) b!497338))

(assert (= (and b!497338 res!299849) b!497347))

(assert (= (and b!497347 res!299854) b!497343))

(assert (= (and b!497343 res!299853) b!497339))

(assert (= (and b!497339 res!299846) b!497349))

(assert (= (and b!497349 res!299852) b!497341))

(assert (= (and b!497349 (not res!299844)) b!497342))

(assert (= (and b!497342 (not res!299847)) b!497348))

(assert (= (and b!497348 c!59022) b!497345))

(assert (= (and b!497348 (not c!59022)) b!497346))

(assert (= (and b!497345 res!299851) b!497337))

(declare-fun m!478243 () Bool)

(assert (=> b!497343 m!478243))

(declare-fun m!478245 () Bool)

(assert (=> b!497338 m!478245))

(declare-fun m!478247 () Bool)

(assert (=> b!497345 m!478247))

(declare-fun m!478249 () Bool)

(assert (=> b!497345 m!478249))

(declare-fun m!478251 () Bool)

(assert (=> b!497348 m!478251))

(declare-fun m!478253 () Bool)

(assert (=> b!497348 m!478253))

(declare-fun m!478255 () Bool)

(assert (=> b!497349 m!478255))

(declare-fun m!478257 () Bool)

(assert (=> b!497349 m!478257))

(declare-fun m!478259 () Bool)

(assert (=> b!497349 m!478259))

(declare-fun m!478261 () Bool)

(assert (=> b!497349 m!478261))

(assert (=> b!497349 m!478253))

(declare-fun m!478263 () Bool)

(assert (=> b!497349 m!478263))

(assert (=> b!497349 m!478253))

(declare-fun m!478265 () Bool)

(assert (=> b!497349 m!478265))

(assert (=> b!497349 m!478253))

(declare-fun m!478267 () Bool)

(assert (=> b!497349 m!478267))

(declare-fun m!478269 () Bool)

(assert (=> b!497349 m!478269))

(declare-fun m!478271 () Bool)

(assert (=> b!497339 m!478271))

(assert (=> b!497341 m!478253))

(assert (=> b!497341 m!478253))

(declare-fun m!478273 () Bool)

(assert (=> b!497341 m!478273))

(declare-fun m!478275 () Bool)

(assert (=> b!497340 m!478275))

(declare-fun m!478277 () Bool)

(assert (=> b!497347 m!478277))

(declare-fun m!478279 () Bool)

(assert (=> start!45276 m!478279))

(declare-fun m!478281 () Bool)

(assert (=> start!45276 m!478281))

(assert (=> b!497350 m!478253))

(assert (=> b!497350 m!478253))

(declare-fun m!478283 () Bool)

(assert (=> b!497350 m!478283))

(check-sat (not b!497350) (not b!497340) (not b!497341) (not b!497349) (not start!45276) (not b!497338) (not b!497343) (not b!497347) (not b!497345) (not b!497339))
(check-sat)
(get-model)

(declare-fun b!497453 () Bool)

(declare-fun e!291547 () Bool)

(declare-fun lt!225136 () SeekEntryResult!3934)

(assert (=> b!497453 (= e!291547 (bvsge (x!46973 lt!225136) #b01111111111111111111111111111110))))

(declare-fun d!78171 () Bool)

(assert (=> d!78171 e!291547))

(declare-fun c!59036 () Bool)

(assert (=> d!78171 (= c!59036 (and ((_ is Intermediate!3934) lt!225136) (undefined!4746 lt!225136)))))

(declare-fun e!291549 () SeekEntryResult!3934)

(assert (=> d!78171 (= lt!225136 e!291549)))

(declare-fun c!59035 () Bool)

(assert (=> d!78171 (= c!59035 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!225135 () (_ BitVec 64))

(assert (=> d!78171 (= lt!225135 (select (arr!15470 lt!225074) lt!225072))))

(assert (=> d!78171 (validMask!0 mask!3524)))

(assert (=> d!78171 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225072 lt!225073 lt!225074 mask!3524) lt!225136)))

(declare-fun b!497454 () Bool)

(assert (=> b!497454 (and (bvsge (index!17917 lt!225136) #b00000000000000000000000000000000) (bvslt (index!17917 lt!225136) (size!15835 lt!225074)))))

(declare-fun res!299936 () Bool)

(assert (=> b!497454 (= res!299936 (= (select (arr!15470 lt!225074) (index!17917 lt!225136)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!291548 () Bool)

(assert (=> b!497454 (=> res!299936 e!291548)))

(declare-fun b!497455 () Bool)

(declare-fun e!291545 () SeekEntryResult!3934)

(assert (=> b!497455 (= e!291545 (Intermediate!3934 false lt!225072 #b00000000000000000000000000000000))))

(declare-fun b!497456 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497456 (= e!291545 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!225072 #b00000000000000000000000000000000 mask!3524) lt!225073 lt!225074 mask!3524))))

(declare-fun b!497457 () Bool)

(assert (=> b!497457 (= e!291549 (Intermediate!3934 true lt!225072 #b00000000000000000000000000000000))))

(declare-fun b!497458 () Bool)

(assert (=> b!497458 (and (bvsge (index!17917 lt!225136) #b00000000000000000000000000000000) (bvslt (index!17917 lt!225136) (size!15835 lt!225074)))))

(assert (=> b!497458 (= e!291548 (= (select (arr!15470 lt!225074) (index!17917 lt!225136)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!497459 () Bool)

(assert (=> b!497459 (= e!291549 e!291545)))

(declare-fun c!59037 () Bool)

(assert (=> b!497459 (= c!59037 (or (= lt!225135 lt!225073) (= (bvadd lt!225135 lt!225135) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497460 () Bool)

(assert (=> b!497460 (and (bvsge (index!17917 lt!225136) #b00000000000000000000000000000000) (bvslt (index!17917 lt!225136) (size!15835 lt!225074)))))

(declare-fun res!299934 () Bool)

(assert (=> b!497460 (= res!299934 (= (select (arr!15470 lt!225074) (index!17917 lt!225136)) lt!225073))))

(assert (=> b!497460 (=> res!299934 e!291548)))

(declare-fun e!291546 () Bool)

(assert (=> b!497460 (= e!291546 e!291548)))

(declare-fun b!497461 () Bool)

(assert (=> b!497461 (= e!291547 e!291546)))

(declare-fun res!299935 () Bool)

(assert (=> b!497461 (= res!299935 (and ((_ is Intermediate!3934) lt!225136) (not (undefined!4746 lt!225136)) (bvslt (x!46973 lt!225136) #b01111111111111111111111111111110) (bvsge (x!46973 lt!225136) #b00000000000000000000000000000000) (bvsge (x!46973 lt!225136) #b00000000000000000000000000000000)))))

(assert (=> b!497461 (=> (not res!299935) (not e!291546))))

(assert (= (and d!78171 c!59035) b!497457))

(assert (= (and d!78171 (not c!59035)) b!497459))

(assert (= (and b!497459 c!59037) b!497455))

(assert (= (and b!497459 (not c!59037)) b!497456))

(assert (= (and d!78171 c!59036) b!497453))

(assert (= (and d!78171 (not c!59036)) b!497461))

(assert (= (and b!497461 res!299935) b!497460))

(assert (= (and b!497460 (not res!299934)) b!497454))

(assert (= (and b!497454 (not res!299936)) b!497458))

(declare-fun m!478369 () Bool)

(assert (=> b!497460 m!478369))

(declare-fun m!478371 () Bool)

(assert (=> b!497456 m!478371))

(assert (=> b!497456 m!478371))

(declare-fun m!478373 () Bool)

(assert (=> b!497456 m!478373))

(assert (=> b!497458 m!478369))

(assert (=> b!497454 m!478369))

(declare-fun m!478375 () Bool)

(assert (=> d!78171 m!478375))

(assert (=> d!78171 m!478279))

(assert (=> b!497349 d!78171))

(declare-fun d!78173 () Bool)

(declare-fun lt!225142 () (_ BitVec 32))

(declare-fun lt!225141 () (_ BitVec 32))

(assert (=> d!78173 (= lt!225142 (bvmul (bvxor lt!225141 (bvlshr lt!225141 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78173 (= lt!225141 ((_ extract 31 0) (bvand (bvxor (select (arr!15470 a!3235) j!176) (bvlshr (select (arr!15470 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78173 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!299937 (let ((h!10537 ((_ extract 31 0) (bvand (bvxor (select (arr!15470 a!3235) j!176) (bvlshr (select (arr!15470 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46977 (bvmul (bvxor h!10537 (bvlshr h!10537 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46977 (bvlshr x!46977 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!299937 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!299937 #b00000000000000000000000000000000))))))

(assert (=> d!78173 (= (toIndex!0 (select (arr!15470 a!3235) j!176) mask!3524) (bvand (bvxor lt!225142 (bvlshr lt!225142 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!497349 d!78173))

(declare-fun b!497462 () Bool)

(declare-fun e!291552 () Bool)

(declare-fun lt!225144 () SeekEntryResult!3934)

(assert (=> b!497462 (= e!291552 (bvsge (x!46973 lt!225144) #b01111111111111111111111111111110))))

(declare-fun d!78175 () Bool)

(assert (=> d!78175 e!291552))

(declare-fun c!59039 () Bool)

(assert (=> d!78175 (= c!59039 (and ((_ is Intermediate!3934) lt!225144) (undefined!4746 lt!225144)))))

(declare-fun e!291554 () SeekEntryResult!3934)

(assert (=> d!78175 (= lt!225144 e!291554)))

(declare-fun c!59038 () Bool)

(assert (=> d!78175 (= c!59038 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!225143 () (_ BitVec 64))

(assert (=> d!78175 (= lt!225143 (select (arr!15470 a!3235) lt!225075))))

(assert (=> d!78175 (validMask!0 mask!3524)))

(assert (=> d!78175 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225075 (select (arr!15470 a!3235) j!176) a!3235 mask!3524) lt!225144)))

(declare-fun b!497463 () Bool)

(assert (=> b!497463 (and (bvsge (index!17917 lt!225144) #b00000000000000000000000000000000) (bvslt (index!17917 lt!225144) (size!15835 a!3235)))))

(declare-fun res!299940 () Bool)

(assert (=> b!497463 (= res!299940 (= (select (arr!15470 a!3235) (index!17917 lt!225144)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!291553 () Bool)

(assert (=> b!497463 (=> res!299940 e!291553)))

(declare-fun b!497464 () Bool)

(declare-fun e!291550 () SeekEntryResult!3934)

(assert (=> b!497464 (= e!291550 (Intermediate!3934 false lt!225075 #b00000000000000000000000000000000))))

(declare-fun b!497465 () Bool)

(assert (=> b!497465 (= e!291550 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!225075 #b00000000000000000000000000000000 mask!3524) (select (arr!15470 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!497466 () Bool)

(assert (=> b!497466 (= e!291554 (Intermediate!3934 true lt!225075 #b00000000000000000000000000000000))))

(declare-fun b!497467 () Bool)

(assert (=> b!497467 (and (bvsge (index!17917 lt!225144) #b00000000000000000000000000000000) (bvslt (index!17917 lt!225144) (size!15835 a!3235)))))

(assert (=> b!497467 (= e!291553 (= (select (arr!15470 a!3235) (index!17917 lt!225144)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!497468 () Bool)

(assert (=> b!497468 (= e!291554 e!291550)))

(declare-fun c!59040 () Bool)

(assert (=> b!497468 (= c!59040 (or (= lt!225143 (select (arr!15470 a!3235) j!176)) (= (bvadd lt!225143 lt!225143) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497469 () Bool)

(assert (=> b!497469 (and (bvsge (index!17917 lt!225144) #b00000000000000000000000000000000) (bvslt (index!17917 lt!225144) (size!15835 a!3235)))))

(declare-fun res!299938 () Bool)

(assert (=> b!497469 (= res!299938 (= (select (arr!15470 a!3235) (index!17917 lt!225144)) (select (arr!15470 a!3235) j!176)))))

(assert (=> b!497469 (=> res!299938 e!291553)))

(declare-fun e!291551 () Bool)

(assert (=> b!497469 (= e!291551 e!291553)))

(declare-fun b!497470 () Bool)

(assert (=> b!497470 (= e!291552 e!291551)))

(declare-fun res!299939 () Bool)

(assert (=> b!497470 (= res!299939 (and ((_ is Intermediate!3934) lt!225144) (not (undefined!4746 lt!225144)) (bvslt (x!46973 lt!225144) #b01111111111111111111111111111110) (bvsge (x!46973 lt!225144) #b00000000000000000000000000000000) (bvsge (x!46973 lt!225144) #b00000000000000000000000000000000)))))

(assert (=> b!497470 (=> (not res!299939) (not e!291551))))

(assert (= (and d!78175 c!59038) b!497466))

(assert (= (and d!78175 (not c!59038)) b!497468))

(assert (= (and b!497468 c!59040) b!497464))

(assert (= (and b!497468 (not c!59040)) b!497465))

(assert (= (and d!78175 c!59039) b!497462))

(assert (= (and d!78175 (not c!59039)) b!497470))

(assert (= (and b!497470 res!299939) b!497469))

(assert (= (and b!497469 (not res!299938)) b!497463))

(assert (= (and b!497463 (not res!299940)) b!497467))

(declare-fun m!478377 () Bool)

(assert (=> b!497469 m!478377))

(declare-fun m!478379 () Bool)

(assert (=> b!497465 m!478379))

(assert (=> b!497465 m!478379))

(assert (=> b!497465 m!478253))

(declare-fun m!478381 () Bool)

(assert (=> b!497465 m!478381))

(assert (=> b!497467 m!478377))

(assert (=> b!497463 m!478377))

(declare-fun m!478383 () Bool)

(assert (=> d!78175 m!478383))

(assert (=> d!78175 m!478279))

(assert (=> b!497349 d!78175))

(declare-fun d!78177 () Bool)

(declare-fun lt!225146 () (_ BitVec 32))

(declare-fun lt!225145 () (_ BitVec 32))

(assert (=> d!78177 (= lt!225146 (bvmul (bvxor lt!225145 (bvlshr lt!225145 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78177 (= lt!225145 ((_ extract 31 0) (bvand (bvxor lt!225073 (bvlshr lt!225073 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78177 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!299937 (let ((h!10537 ((_ extract 31 0) (bvand (bvxor lt!225073 (bvlshr lt!225073 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46977 (bvmul (bvxor h!10537 (bvlshr h!10537 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46977 (bvlshr x!46977 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!299937 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!299937 #b00000000000000000000000000000000))))))

(assert (=> d!78177 (= (toIndex!0 lt!225073 mask!3524) (bvand (bvxor lt!225146 (bvlshr lt!225146 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!497349 d!78177))

(declare-fun b!497479 () Bool)

(declare-fun e!291562 () Bool)

(declare-fun e!291561 () Bool)

(assert (=> b!497479 (= e!291562 e!291561)))

(declare-fun lt!225155 () (_ BitVec 64))

(assert (=> b!497479 (= lt!225155 (select (arr!15470 a!3235) j!176))))

(declare-fun lt!225153 () Unit!14806)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32174 (_ BitVec 64) (_ BitVec 32)) Unit!14806)

(assert (=> b!497479 (= lt!225153 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!225155 j!176))))

(assert (=> b!497479 (arrayContainsKey!0 a!3235 lt!225155 #b00000000000000000000000000000000)))

(declare-fun lt!225154 () Unit!14806)

(assert (=> b!497479 (= lt!225154 lt!225153)))

(declare-fun res!299945 () Bool)

(assert (=> b!497479 (= res!299945 (= (seekEntryOrOpen!0 (select (arr!15470 a!3235) j!176) a!3235 mask!3524) (Found!3934 j!176)))))

(assert (=> b!497479 (=> (not res!299945) (not e!291561))))

(declare-fun b!497480 () Bool)

(declare-fun call!31408 () Bool)

(assert (=> b!497480 (= e!291562 call!31408)))

(declare-fun bm!31405 () Bool)

(assert (=> bm!31405 (= call!31408 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!497481 () Bool)

(assert (=> b!497481 (= e!291561 call!31408)))

(declare-fun b!497482 () Bool)

(declare-fun e!291563 () Bool)

(assert (=> b!497482 (= e!291563 e!291562)))

(declare-fun c!59043 () Bool)

(assert (=> b!497482 (= c!59043 (validKeyInArray!0 (select (arr!15470 a!3235) j!176)))))

(declare-fun d!78179 () Bool)

(declare-fun res!299946 () Bool)

(assert (=> d!78179 (=> res!299946 e!291563)))

(assert (=> d!78179 (= res!299946 (bvsge j!176 (size!15835 a!3235)))))

(assert (=> d!78179 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!291563)))

(assert (= (and d!78179 (not res!299946)) b!497482))

(assert (= (and b!497482 c!59043) b!497479))

(assert (= (and b!497482 (not c!59043)) b!497480))

(assert (= (and b!497479 res!299945) b!497481))

(assert (= (or b!497481 b!497480) bm!31405))

(assert (=> b!497479 m!478253))

(declare-fun m!478385 () Bool)

(assert (=> b!497479 m!478385))

(declare-fun m!478387 () Bool)

(assert (=> b!497479 m!478387))

(assert (=> b!497479 m!478253))

(assert (=> b!497479 m!478273))

(declare-fun m!478389 () Bool)

(assert (=> bm!31405 m!478389))

(assert (=> b!497482 m!478253))

(assert (=> b!497482 m!478253))

(assert (=> b!497482 m!478283))

(assert (=> b!497349 d!78179))

(declare-fun d!78183 () Bool)

(assert (=> d!78183 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!225158 () Unit!14806)

(declare-fun choose!38 (array!32174 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14806)

(assert (=> d!78183 (= lt!225158 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78183 (validMask!0 mask!3524)))

(assert (=> d!78183 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!225158)))

(declare-fun bs!15823 () Bool)

(assert (= bs!15823 d!78183))

(assert (=> bs!15823 m!478263))

(declare-fun m!478391 () Bool)

(assert (=> bs!15823 m!478391))

(assert (=> bs!15823 m!478279))

(assert (=> b!497349 d!78183))

(declare-fun d!78187 () Bool)

(declare-fun res!299953 () Bool)

(declare-fun e!291570 () Bool)

(assert (=> d!78187 (=> res!299953 e!291570)))

(assert (=> d!78187 (= res!299953 (= (select (arr!15470 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!78187 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!291570)))

(declare-fun b!497489 () Bool)

(declare-fun e!291571 () Bool)

(assert (=> b!497489 (= e!291570 e!291571)))

(declare-fun res!299954 () Bool)

(assert (=> b!497489 (=> (not res!299954) (not e!291571))))

(assert (=> b!497489 (= res!299954 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15835 a!3235)))))

(declare-fun b!497490 () Bool)

(assert (=> b!497490 (= e!291571 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78187 (not res!299953)) b!497489))

(assert (= (and b!497489 res!299954) b!497490))

(declare-fun m!478393 () Bool)

(assert (=> d!78187 m!478393))

(declare-fun m!478395 () Bool)

(assert (=> b!497490 m!478395))

(assert (=> b!497338 d!78187))

(declare-fun b!497492 () Bool)

(declare-fun e!291574 () Bool)

(declare-fun e!291573 () Bool)

(assert (=> b!497492 (= e!291574 e!291573)))

(declare-fun lt!225164 () (_ BitVec 64))

(assert (=> b!497492 (= lt!225164 (select (arr!15470 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!225162 () Unit!14806)

(assert (=> b!497492 (= lt!225162 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!225164 #b00000000000000000000000000000000))))

(assert (=> b!497492 (arrayContainsKey!0 a!3235 lt!225164 #b00000000000000000000000000000000)))

(declare-fun lt!225163 () Unit!14806)

(assert (=> b!497492 (= lt!225163 lt!225162)))

(declare-fun res!299956 () Bool)

(assert (=> b!497492 (= res!299956 (= (seekEntryOrOpen!0 (select (arr!15470 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3934 #b00000000000000000000000000000000)))))

(assert (=> b!497492 (=> (not res!299956) (not e!291573))))

(declare-fun b!497493 () Bool)

(declare-fun call!31409 () Bool)

(assert (=> b!497493 (= e!291574 call!31409)))

(declare-fun bm!31406 () Bool)

(assert (=> bm!31406 (= call!31409 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!497494 () Bool)

(assert (=> b!497494 (= e!291573 call!31409)))

(declare-fun b!497495 () Bool)

(declare-fun e!291575 () Bool)

(assert (=> b!497495 (= e!291575 e!291574)))

(declare-fun c!59044 () Bool)

(assert (=> b!497495 (= c!59044 (validKeyInArray!0 (select (arr!15470 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!78189 () Bool)

(declare-fun res!299957 () Bool)

(assert (=> d!78189 (=> res!299957 e!291575)))

(assert (=> d!78189 (= res!299957 (bvsge #b00000000000000000000000000000000 (size!15835 a!3235)))))

(assert (=> d!78189 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!291575)))

(assert (= (and d!78189 (not res!299957)) b!497495))

(assert (= (and b!497495 c!59044) b!497492))

(assert (= (and b!497495 (not c!59044)) b!497493))

(assert (= (and b!497492 res!299956) b!497494))

(assert (= (or b!497494 b!497493) bm!31406))

(assert (=> b!497492 m!478393))

(declare-fun m!478401 () Bool)

(assert (=> b!497492 m!478401))

(declare-fun m!478403 () Bool)

(assert (=> b!497492 m!478403))

(assert (=> b!497492 m!478393))

(declare-fun m!478405 () Bool)

(assert (=> b!497492 m!478405))

(declare-fun m!478407 () Bool)

(assert (=> bm!31406 m!478407))

(assert (=> b!497495 m!478393))

(assert (=> b!497495 m!478393))

(declare-fun m!478409 () Bool)

(assert (=> b!497495 m!478409))

(assert (=> b!497343 d!78189))

(declare-fun d!78193 () Bool)

(assert (=> d!78193 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!45276 d!78193))

(declare-fun d!78197 () Bool)

(assert (=> d!78197 (= (array_inv!11353 a!3235) (bvsge (size!15835 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!45276 d!78197))

(declare-fun b!497565 () Bool)

(declare-fun e!291616 () SeekEntryResult!3934)

(declare-fun e!291615 () SeekEntryResult!3934)

(assert (=> b!497565 (= e!291616 e!291615)))

(declare-fun lt!225193 () (_ BitVec 64))

(declare-fun lt!225194 () SeekEntryResult!3934)

(assert (=> b!497565 (= lt!225193 (select (arr!15470 a!3235) (index!17917 lt!225194)))))

(declare-fun c!59070 () Bool)

(assert (=> b!497565 (= c!59070 (= lt!225193 k0!2280))))

(declare-fun b!497566 () Bool)

(assert (=> b!497566 (= e!291616 Undefined!3934)))

(declare-fun b!497567 () Bool)

(declare-fun c!59071 () Bool)

(assert (=> b!497567 (= c!59071 (= lt!225193 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!291617 () SeekEntryResult!3934)

(assert (=> b!497567 (= e!291615 e!291617)))

(declare-fun d!78199 () Bool)

(declare-fun lt!225192 () SeekEntryResult!3934)

(assert (=> d!78199 (and (or ((_ is Undefined!3934) lt!225192) (not ((_ is Found!3934) lt!225192)) (and (bvsge (index!17916 lt!225192) #b00000000000000000000000000000000) (bvslt (index!17916 lt!225192) (size!15835 a!3235)))) (or ((_ is Undefined!3934) lt!225192) ((_ is Found!3934) lt!225192) (not ((_ is MissingZero!3934) lt!225192)) (and (bvsge (index!17915 lt!225192) #b00000000000000000000000000000000) (bvslt (index!17915 lt!225192) (size!15835 a!3235)))) (or ((_ is Undefined!3934) lt!225192) ((_ is Found!3934) lt!225192) ((_ is MissingZero!3934) lt!225192) (not ((_ is MissingVacant!3934) lt!225192)) (and (bvsge (index!17918 lt!225192) #b00000000000000000000000000000000) (bvslt (index!17918 lt!225192) (size!15835 a!3235)))) (or ((_ is Undefined!3934) lt!225192) (ite ((_ is Found!3934) lt!225192) (= (select (arr!15470 a!3235) (index!17916 lt!225192)) k0!2280) (ite ((_ is MissingZero!3934) lt!225192) (= (select (arr!15470 a!3235) (index!17915 lt!225192)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3934) lt!225192) (= (select (arr!15470 a!3235) (index!17918 lt!225192)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78199 (= lt!225192 e!291616)))

(declare-fun c!59069 () Bool)

(assert (=> d!78199 (= c!59069 (and ((_ is Intermediate!3934) lt!225194) (undefined!4746 lt!225194)))))

(assert (=> d!78199 (= lt!225194 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!78199 (validMask!0 mask!3524)))

(assert (=> d!78199 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!225192)))

(declare-fun b!497568 () Bool)

(assert (=> b!497568 (= e!291615 (Found!3934 (index!17917 lt!225194)))))

(declare-fun b!497569 () Bool)

(assert (=> b!497569 (= e!291617 (MissingZero!3934 (index!17917 lt!225194)))))

(declare-fun b!497570 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32174 (_ BitVec 32)) SeekEntryResult!3934)

(assert (=> b!497570 (= e!291617 (seekKeyOrZeroReturnVacant!0 (x!46973 lt!225194) (index!17917 lt!225194) (index!17917 lt!225194) k0!2280 a!3235 mask!3524))))

(assert (= (and d!78199 c!59069) b!497566))

(assert (= (and d!78199 (not c!59069)) b!497565))

(assert (= (and b!497565 c!59070) b!497568))

(assert (= (and b!497565 (not c!59070)) b!497567))

(assert (= (and b!497567 c!59071) b!497569))

(assert (= (and b!497567 (not c!59071)) b!497570))

(declare-fun m!478431 () Bool)

(assert (=> b!497565 m!478431))

(assert (=> d!78199 m!478279))

(declare-fun m!478433 () Bool)

(assert (=> d!78199 m!478433))

(declare-fun m!478435 () Bool)

(assert (=> d!78199 m!478435))

(assert (=> d!78199 m!478433))

(declare-fun m!478437 () Bool)

(assert (=> d!78199 m!478437))

(declare-fun m!478439 () Bool)

(assert (=> d!78199 m!478439))

(declare-fun m!478441 () Bool)

(assert (=> d!78199 m!478441))

(declare-fun m!478443 () Bool)

(assert (=> b!497570 m!478443))

(assert (=> b!497347 d!78199))

(declare-fun b!497571 () Bool)

(declare-fun e!291619 () SeekEntryResult!3934)

(declare-fun e!291618 () SeekEntryResult!3934)

(assert (=> b!497571 (= e!291619 e!291618)))

(declare-fun lt!225196 () (_ BitVec 64))

(declare-fun lt!225197 () SeekEntryResult!3934)

(assert (=> b!497571 (= lt!225196 (select (arr!15470 a!3235) (index!17917 lt!225197)))))

(declare-fun c!59073 () Bool)

(assert (=> b!497571 (= c!59073 (= lt!225196 (select (arr!15470 a!3235) j!176)))))

(declare-fun b!497572 () Bool)

(assert (=> b!497572 (= e!291619 Undefined!3934)))

(declare-fun b!497573 () Bool)

(declare-fun c!59074 () Bool)

(assert (=> b!497573 (= c!59074 (= lt!225196 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!291620 () SeekEntryResult!3934)

(assert (=> b!497573 (= e!291618 e!291620)))

(declare-fun d!78207 () Bool)

(declare-fun lt!225195 () SeekEntryResult!3934)

(assert (=> d!78207 (and (or ((_ is Undefined!3934) lt!225195) (not ((_ is Found!3934) lt!225195)) (and (bvsge (index!17916 lt!225195) #b00000000000000000000000000000000) (bvslt (index!17916 lt!225195) (size!15835 a!3235)))) (or ((_ is Undefined!3934) lt!225195) ((_ is Found!3934) lt!225195) (not ((_ is MissingZero!3934) lt!225195)) (and (bvsge (index!17915 lt!225195) #b00000000000000000000000000000000) (bvslt (index!17915 lt!225195) (size!15835 a!3235)))) (or ((_ is Undefined!3934) lt!225195) ((_ is Found!3934) lt!225195) ((_ is MissingZero!3934) lt!225195) (not ((_ is MissingVacant!3934) lt!225195)) (and (bvsge (index!17918 lt!225195) #b00000000000000000000000000000000) (bvslt (index!17918 lt!225195) (size!15835 a!3235)))) (or ((_ is Undefined!3934) lt!225195) (ite ((_ is Found!3934) lt!225195) (= (select (arr!15470 a!3235) (index!17916 lt!225195)) (select (arr!15470 a!3235) j!176)) (ite ((_ is MissingZero!3934) lt!225195) (= (select (arr!15470 a!3235) (index!17915 lt!225195)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3934) lt!225195) (= (select (arr!15470 a!3235) (index!17918 lt!225195)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!78207 (= lt!225195 e!291619)))

(declare-fun c!59072 () Bool)

(assert (=> d!78207 (= c!59072 (and ((_ is Intermediate!3934) lt!225197) (undefined!4746 lt!225197)))))

(assert (=> d!78207 (= lt!225197 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15470 a!3235) j!176) mask!3524) (select (arr!15470 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78207 (validMask!0 mask!3524)))

(assert (=> d!78207 (= (seekEntryOrOpen!0 (select (arr!15470 a!3235) j!176) a!3235 mask!3524) lt!225195)))

(declare-fun b!497574 () Bool)

(assert (=> b!497574 (= e!291618 (Found!3934 (index!17917 lt!225197)))))

(declare-fun b!497575 () Bool)

(assert (=> b!497575 (= e!291620 (MissingZero!3934 (index!17917 lt!225197)))))

(declare-fun b!497576 () Bool)

(assert (=> b!497576 (= e!291620 (seekKeyOrZeroReturnVacant!0 (x!46973 lt!225197) (index!17917 lt!225197) (index!17917 lt!225197) (select (arr!15470 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!78207 c!59072) b!497572))

(assert (= (and d!78207 (not c!59072)) b!497571))

(assert (= (and b!497571 c!59073) b!497574))

(assert (= (and b!497571 (not c!59073)) b!497573))

(assert (= (and b!497573 c!59074) b!497575))

(assert (= (and b!497573 (not c!59074)) b!497576))

(declare-fun m!478445 () Bool)

(assert (=> b!497571 m!478445))

(assert (=> d!78207 m!478279))

(assert (=> d!78207 m!478267))

(assert (=> d!78207 m!478253))

(declare-fun m!478447 () Bool)

(assert (=> d!78207 m!478447))

(assert (=> d!78207 m!478253))

(assert (=> d!78207 m!478267))

(declare-fun m!478449 () Bool)

(assert (=> d!78207 m!478449))

(declare-fun m!478451 () Bool)

(assert (=> d!78207 m!478451))

(declare-fun m!478453 () Bool)

(assert (=> d!78207 m!478453))

(assert (=> b!497576 m!478253))

(declare-fun m!478455 () Bool)

(assert (=> b!497576 m!478455))

(assert (=> b!497341 d!78207))

(declare-fun d!78209 () Bool)

(assert (=> d!78209 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!497340 d!78209))

(declare-fun d!78211 () Bool)

(declare-fun e!291667 () Bool)

(assert (=> d!78211 e!291667))

(declare-fun res!300013 () Bool)

(assert (=> d!78211 (=> (not res!300013) (not e!291667))))

(assert (=> d!78211 (= res!300013 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!15835 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15835 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!15835 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15835 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15835 a!3235))))))

(declare-fun lt!225227 () Unit!14806)

(declare-fun choose!47 (array!32174 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14806)

(assert (=> d!78211 (= lt!225227 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!225075 #b00000000000000000000000000000000 (index!17917 lt!225070) (x!46973 lt!225070) mask!3524))))

(assert (=> d!78211 (validMask!0 mask!3524)))

(assert (=> d!78211 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225075 #b00000000000000000000000000000000 (index!17917 lt!225070) (x!46973 lt!225070) mask!3524) lt!225227)))

(declare-fun b!497640 () Bool)

(assert (=> b!497640 (= e!291667 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225075 (select (store (arr!15470 a!3235) i!1204 k0!2280) j!176) (array!32175 (store (arr!15470 a!3235) i!1204 k0!2280) (size!15835 a!3235)) mask!3524) (Intermediate!3934 false (index!17917 lt!225070) (x!46973 lt!225070))))))

(assert (= (and d!78211 res!300013) b!497640))

(declare-fun m!478495 () Bool)

(assert (=> d!78211 m!478495))

(assert (=> d!78211 m!478279))

(assert (=> b!497640 m!478257))

(assert (=> b!497640 m!478261))

(assert (=> b!497640 m!478261))

(declare-fun m!478497 () Bool)

(assert (=> b!497640 m!478497))

(assert (=> b!497345 d!78211))

(declare-fun b!497641 () Bool)

(declare-fun e!291670 () Bool)

(declare-fun lt!225229 () SeekEntryResult!3934)

(assert (=> b!497641 (= e!291670 (bvsge (x!46973 lt!225229) #b01111111111111111111111111111110))))

(declare-fun d!78227 () Bool)

(assert (=> d!78227 e!291670))

(declare-fun c!59091 () Bool)

(assert (=> d!78227 (= c!59091 (and ((_ is Intermediate!3934) lt!225229) (undefined!4746 lt!225229)))))

(declare-fun e!291672 () SeekEntryResult!3934)

(assert (=> d!78227 (= lt!225229 e!291672)))

(declare-fun c!59090 () Bool)

(assert (=> d!78227 (= c!59090 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!225228 () (_ BitVec 64))

(assert (=> d!78227 (= lt!225228 (select (arr!15470 lt!225074) lt!225075))))

(assert (=> d!78227 (validMask!0 mask!3524)))

(assert (=> d!78227 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225075 lt!225073 lt!225074 mask!3524) lt!225229)))

(declare-fun b!497642 () Bool)

(assert (=> b!497642 (and (bvsge (index!17917 lt!225229) #b00000000000000000000000000000000) (bvslt (index!17917 lt!225229) (size!15835 lt!225074)))))

(declare-fun res!300016 () Bool)

(assert (=> b!497642 (= res!300016 (= (select (arr!15470 lt!225074) (index!17917 lt!225229)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!291671 () Bool)

(assert (=> b!497642 (=> res!300016 e!291671)))

(declare-fun b!497643 () Bool)

(declare-fun e!291668 () SeekEntryResult!3934)

(assert (=> b!497643 (= e!291668 (Intermediate!3934 false lt!225075 #b00000000000000000000000000000000))))

(declare-fun b!497644 () Bool)

(assert (=> b!497644 (= e!291668 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!225075 #b00000000000000000000000000000000 mask!3524) lt!225073 lt!225074 mask!3524))))

(declare-fun b!497645 () Bool)

(assert (=> b!497645 (= e!291672 (Intermediate!3934 true lt!225075 #b00000000000000000000000000000000))))

(declare-fun b!497647 () Bool)

(assert (=> b!497647 (and (bvsge (index!17917 lt!225229) #b00000000000000000000000000000000) (bvslt (index!17917 lt!225229) (size!15835 lt!225074)))))

(assert (=> b!497647 (= e!291671 (= (select (arr!15470 lt!225074) (index!17917 lt!225229)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!497649 () Bool)

(assert (=> b!497649 (= e!291672 e!291668)))

(declare-fun c!59092 () Bool)

(assert (=> b!497649 (= c!59092 (or (= lt!225228 lt!225073) (= (bvadd lt!225228 lt!225228) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497650 () Bool)

(assert (=> b!497650 (and (bvsge (index!17917 lt!225229) #b00000000000000000000000000000000) (bvslt (index!17917 lt!225229) (size!15835 lt!225074)))))

(declare-fun res!300014 () Bool)

(assert (=> b!497650 (= res!300014 (= (select (arr!15470 lt!225074) (index!17917 lt!225229)) lt!225073))))

(assert (=> b!497650 (=> res!300014 e!291671)))

(declare-fun e!291669 () Bool)

(assert (=> b!497650 (= e!291669 e!291671)))

(declare-fun b!497651 () Bool)

(assert (=> b!497651 (= e!291670 e!291669)))

(declare-fun res!300015 () Bool)

(assert (=> b!497651 (= res!300015 (and ((_ is Intermediate!3934) lt!225229) (not (undefined!4746 lt!225229)) (bvslt (x!46973 lt!225229) #b01111111111111111111111111111110) (bvsge (x!46973 lt!225229) #b00000000000000000000000000000000) (bvsge (x!46973 lt!225229) #b00000000000000000000000000000000)))))

(assert (=> b!497651 (=> (not res!300015) (not e!291669))))

(assert (= (and d!78227 c!59090) b!497645))

(assert (= (and d!78227 (not c!59090)) b!497649))

(assert (= (and b!497649 c!59092) b!497643))

(assert (= (and b!497649 (not c!59092)) b!497644))

(assert (= (and d!78227 c!59091) b!497641))

(assert (= (and d!78227 (not c!59091)) b!497651))

(assert (= (and b!497651 res!300015) b!497650))

(assert (= (and b!497650 (not res!300014)) b!497642))

(assert (= (and b!497642 (not res!300016)) b!497647))

(declare-fun m!478501 () Bool)

(assert (=> b!497650 m!478501))

(assert (=> b!497644 m!478379))

(assert (=> b!497644 m!478379))

(declare-fun m!478503 () Bool)

(assert (=> b!497644 m!478503))

(assert (=> b!497647 m!478501))

(assert (=> b!497642 m!478501))

(declare-fun m!478505 () Bool)

(assert (=> d!78227 m!478505))

(assert (=> d!78227 m!478279))

(assert (=> b!497345 d!78227))

(declare-fun d!78231 () Bool)

(assert (=> d!78231 (= (validKeyInArray!0 (select (arr!15470 a!3235) j!176)) (and (not (= (select (arr!15470 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15470 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!497350 d!78231))

(declare-fun b!497677 () Bool)

(declare-fun e!291697 () Bool)

(declare-fun call!31424 () Bool)

(assert (=> b!497677 (= e!291697 call!31424)))

(declare-fun b!497678 () Bool)

(declare-fun e!291696 () Bool)

(declare-fun e!291698 () Bool)

(assert (=> b!497678 (= e!291696 e!291698)))

(declare-fun res!300036 () Bool)

(assert (=> b!497678 (=> (not res!300036) (not e!291698))))

(declare-fun e!291695 () Bool)

(assert (=> b!497678 (= res!300036 (not e!291695))))

(declare-fun res!300034 () Bool)

(assert (=> b!497678 (=> (not res!300034) (not e!291695))))

(assert (=> b!497678 (= res!300034 (validKeyInArray!0 (select (arr!15470 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!497679 () Bool)

(assert (=> b!497679 (= e!291697 call!31424)))

(declare-fun d!78233 () Bool)

(declare-fun res!300035 () Bool)

(assert (=> d!78233 (=> res!300035 e!291696)))

(assert (=> d!78233 (= res!300035 (bvsge #b00000000000000000000000000000000 (size!15835 a!3235)))))

(assert (=> d!78233 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9664) e!291696)))

(declare-fun b!497680 () Bool)

(declare-fun contains!2700 (List!9667 (_ BitVec 64)) Bool)

(assert (=> b!497680 (= e!291695 (contains!2700 Nil!9664 (select (arr!15470 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!497681 () Bool)

(assert (=> b!497681 (= e!291698 e!291697)))

(declare-fun c!59098 () Bool)

(assert (=> b!497681 (= c!59098 (validKeyInArray!0 (select (arr!15470 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31421 () Bool)

(assert (=> bm!31421 (= call!31424 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59098 (Cons!9663 (select (arr!15470 a!3235) #b00000000000000000000000000000000) Nil!9664) Nil!9664)))))

(assert (= (and d!78233 (not res!300035)) b!497678))

(assert (= (and b!497678 res!300034) b!497680))

(assert (= (and b!497678 res!300036) b!497681))

(assert (= (and b!497681 c!59098) b!497679))

(assert (= (and b!497681 (not c!59098)) b!497677))

(assert (= (or b!497679 b!497677) bm!31421))

(assert (=> b!497678 m!478393))

(assert (=> b!497678 m!478393))

(assert (=> b!497678 m!478409))

(assert (=> b!497680 m!478393))

(assert (=> b!497680 m!478393))

(declare-fun m!478515 () Bool)

(assert (=> b!497680 m!478515))

(assert (=> b!497681 m!478393))

(assert (=> b!497681 m!478393))

(assert (=> b!497681 m!478409))

(assert (=> bm!31421 m!478393))

(declare-fun m!478517 () Bool)

(assert (=> bm!31421 m!478517))

(assert (=> b!497339 d!78233))

(check-sat (not b!497490) (not d!78207) (not b!497479) (not d!78171) (not b!497678) (not b!497465) (not b!497495) (not b!497640) (not b!497576) (not b!497482) (not d!78199) (not d!78211) (not d!78227) (not bm!31421) (not b!497456) (not d!78175) (not b!497644) (not bm!31406) (not b!497681) (not b!497492) (not b!497570) (not d!78183) (not b!497680) (not bm!31405))
(check-sat)
