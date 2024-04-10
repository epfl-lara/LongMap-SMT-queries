; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50262 () Bool)

(assert start!50262)

(declare-fun b!550271 () Bool)

(declare-fun e!317645 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(assert (=> b!550271 (= e!317645 (not (or (bvslt mask!3119 #b00000000000000000000000000000000) (bvsle mask!3119 #b00111111111111111111111111111111))))))

(declare-fun e!317644 () Bool)

(assert (=> b!550271 e!317644))

(declare-fun res!343415 () Bool)

(assert (=> b!550271 (=> (not res!343415) (not e!317644))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((array!34715 0))(
  ( (array!34716 (arr!16673 (Array (_ BitVec 32) (_ BitVec 64))) (size!17037 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34715)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34715 (_ BitVec 32)) Bool)

(assert (=> b!550271 (= res!343415 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17018 0))(
  ( (Unit!17019) )
))
(declare-fun lt!250446 () Unit!17018)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34715 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17018)

(assert (=> b!550271 (= lt!250446 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550272 () Bool)

(declare-fun res!343416 () Bool)

(assert (=> b!550272 (=> (not res!343416) (not e!317645))))

(assert (=> b!550272 (= res!343416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550273 () Bool)

(declare-fun e!317643 () Bool)

(assert (=> b!550273 (= e!317643 e!317645)))

(declare-fun res!343421 () Bool)

(assert (=> b!550273 (=> (not res!343421) (not e!317645))))

(declare-datatypes ((SeekEntryResult!5122 0))(
  ( (MissingZero!5122 (index!22715 (_ BitVec 32))) (Found!5122 (index!22716 (_ BitVec 32))) (Intermediate!5122 (undefined!5934 Bool) (index!22717 (_ BitVec 32)) (x!51636 (_ BitVec 32))) (Undefined!5122) (MissingVacant!5122 (index!22718 (_ BitVec 32))) )
))
(declare-fun lt!250447 () SeekEntryResult!5122)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550273 (= res!343421 (or (= lt!250447 (MissingZero!5122 i!1132)) (= lt!250447 (MissingVacant!5122 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34715 (_ BitVec 32)) SeekEntryResult!5122)

(assert (=> b!550273 (= lt!250447 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!550274 () Bool)

(declare-fun res!343419 () Bool)

(assert (=> b!550274 (=> (not res!343419) (not e!317643))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550274 (= res!343419 (validKeyInArray!0 (select (arr!16673 a!3118) j!142)))))

(declare-fun res!343418 () Bool)

(assert (=> start!50262 (=> (not res!343418) (not e!317643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50262 (= res!343418 (validMask!0 mask!3119))))

(assert (=> start!50262 e!317643))

(assert (=> start!50262 true))

(declare-fun array_inv!12469 (array!34715) Bool)

(assert (=> start!50262 (array_inv!12469 a!3118)))

(declare-fun b!550275 () Bool)

(declare-fun res!343417 () Bool)

(assert (=> b!550275 (=> (not res!343417) (not e!317643))))

(assert (=> b!550275 (= res!343417 (validKeyInArray!0 k!1914))))

(declare-fun b!550276 () Bool)

(assert (=> b!550276 (= e!317644 (= (seekEntryOrOpen!0 (select (arr!16673 a!3118) j!142) a!3118 mask!3119) (Found!5122 j!142)))))

(declare-fun b!550277 () Bool)

(declare-fun res!343424 () Bool)

(assert (=> b!550277 (=> (not res!343424) (not e!317643))))

(declare-fun arrayContainsKey!0 (array!34715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550277 (= res!343424 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550278 () Bool)

(declare-fun res!343422 () Bool)

(assert (=> b!550278 (=> (not res!343422) (not e!317645))))

(declare-datatypes ((List!10753 0))(
  ( (Nil!10750) (Cons!10749 (h!11722 (_ BitVec 64)) (t!16981 List!10753)) )
))
(declare-fun arrayNoDuplicates!0 (array!34715 (_ BitVec 32) List!10753) Bool)

(assert (=> b!550278 (= res!343422 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10750))))

(declare-fun b!550279 () Bool)

(declare-fun res!343420 () Bool)

(assert (=> b!550279 (=> (not res!343420) (not e!317645))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34715 (_ BitVec 32)) SeekEntryResult!5122)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550279 (= res!343420 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16673 a!3118) j!142) mask!3119) (select (arr!16673 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16673 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16673 a!3118) i!1132 k!1914) j!142) (array!34716 (store (arr!16673 a!3118) i!1132 k!1914) (size!17037 a!3118)) mask!3119)))))

(declare-fun b!550280 () Bool)

(declare-fun res!343423 () Bool)

(assert (=> b!550280 (=> (not res!343423) (not e!317643))))

(assert (=> b!550280 (= res!343423 (and (= (size!17037 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17037 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17037 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50262 res!343418) b!550280))

(assert (= (and b!550280 res!343423) b!550274))

(assert (= (and b!550274 res!343419) b!550275))

(assert (= (and b!550275 res!343417) b!550277))

(assert (= (and b!550277 res!343424) b!550273))

(assert (= (and b!550273 res!343421) b!550272))

(assert (= (and b!550272 res!343416) b!550278))

(assert (= (and b!550278 res!343422) b!550279))

(assert (= (and b!550279 res!343420) b!550271))

(assert (= (and b!550271 res!343415) b!550276))

(declare-fun m!527319 () Bool)

(assert (=> b!550275 m!527319))

(declare-fun m!527321 () Bool)

(assert (=> b!550271 m!527321))

(declare-fun m!527323 () Bool)

(assert (=> b!550271 m!527323))

(declare-fun m!527325 () Bool)

(assert (=> b!550273 m!527325))

(declare-fun m!527327 () Bool)

(assert (=> b!550278 m!527327))

(declare-fun m!527329 () Bool)

(assert (=> b!550276 m!527329))

(assert (=> b!550276 m!527329))

(declare-fun m!527331 () Bool)

(assert (=> b!550276 m!527331))

(declare-fun m!527333 () Bool)

(assert (=> start!50262 m!527333))

(declare-fun m!527335 () Bool)

(assert (=> start!50262 m!527335))

(assert (=> b!550274 m!527329))

(assert (=> b!550274 m!527329))

(declare-fun m!527337 () Bool)

(assert (=> b!550274 m!527337))

(declare-fun m!527339 () Bool)

(assert (=> b!550277 m!527339))

(assert (=> b!550279 m!527329))

(declare-fun m!527341 () Bool)

(assert (=> b!550279 m!527341))

(assert (=> b!550279 m!527329))

(declare-fun m!527343 () Bool)

(assert (=> b!550279 m!527343))

(declare-fun m!527345 () Bool)

(assert (=> b!550279 m!527345))

(assert (=> b!550279 m!527343))

(declare-fun m!527347 () Bool)

(assert (=> b!550279 m!527347))

(assert (=> b!550279 m!527341))

(assert (=> b!550279 m!527329))

(declare-fun m!527349 () Bool)

(assert (=> b!550279 m!527349))

(declare-fun m!527351 () Bool)

(assert (=> b!550279 m!527351))

(assert (=> b!550279 m!527343))

(assert (=> b!550279 m!527345))

(declare-fun m!527353 () Bool)

(assert (=> b!550272 m!527353))

(push 1)

(assert (not b!550271))

(assert (not b!550276))

(assert (not start!50262))

(assert (not b!550273))

(assert (not b!550272))

(assert (not b!550277))

(assert (not b!550275))

(assert (not b!550279))

(assert (not b!550278))

(assert (not b!550274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82815 () Bool)

(assert (=> d!82815 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!550275 d!82815))

(declare-fun d!82817 () Bool)

(assert (=> d!82817 (= (validKeyInArray!0 (select (arr!16673 a!3118) j!142)) (and (not (= (select (arr!16673 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16673 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!550274 d!82817))

(declare-fun b!550357 () Bool)

(declare-fun e!317704 () SeekEntryResult!5122)

(declare-fun lt!250480 () SeekEntryResult!5122)

(assert (=> b!550357 (= e!317704 (Found!5122 (index!22717 lt!250480)))))

(declare-fun e!317706 () SeekEntryResult!5122)

(declare-fun b!550358 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34715 (_ BitVec 32)) SeekEntryResult!5122)

(assert (=> b!550358 (= e!317706 (seekKeyOrZeroReturnVacant!0 (x!51636 lt!250480) (index!22717 lt!250480) (index!22717 lt!250480) k!1914 a!3118 mask!3119))))

(declare-fun b!550359 () Bool)

(declare-fun e!317705 () SeekEntryResult!5122)

(assert (=> b!550359 (= e!317705 Undefined!5122)))

(declare-fun b!550361 () Bool)

(assert (=> b!550361 (= e!317706 (MissingZero!5122 (index!22717 lt!250480)))))

(declare-fun b!550362 () Bool)

(assert (=> b!550362 (= e!317705 e!317704)))

(declare-fun lt!250478 () (_ BitVec 64))

(assert (=> b!550362 (= lt!250478 (select (arr!16673 a!3118) (index!22717 lt!250480)))))

(declare-fun c!63778 () Bool)

(assert (=> b!550362 (= c!63778 (= lt!250478 k!1914))))

(declare-fun b!550360 () Bool)

(declare-fun c!63779 () Bool)

(assert (=> b!550360 (= c!63779 (= lt!250478 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!550360 (= e!317704 e!317706)))

(declare-fun d!82819 () Bool)

(declare-fun lt!250479 () SeekEntryResult!5122)

(assert (=> d!82819 (and (or (is-Undefined!5122 lt!250479) (not (is-Found!5122 lt!250479)) (and (bvsge (index!22716 lt!250479) #b00000000000000000000000000000000) (bvslt (index!22716 lt!250479) (size!17037 a!3118)))) (or (is-Undefined!5122 lt!250479) (is-Found!5122 lt!250479) (not (is-MissingZero!5122 lt!250479)) (and (bvsge (index!22715 lt!250479) #b00000000000000000000000000000000) (bvslt (index!22715 lt!250479) (size!17037 a!3118)))) (or (is-Undefined!5122 lt!250479) (is-Found!5122 lt!250479) (is-MissingZero!5122 lt!250479) (not (is-MissingVacant!5122 lt!250479)) (and (bvsge (index!22718 lt!250479) #b00000000000000000000000000000000) (bvslt (index!22718 lt!250479) (size!17037 a!3118)))) (or (is-Undefined!5122 lt!250479) (ite (is-Found!5122 lt!250479) (= (select (arr!16673 a!3118) (index!22716 lt!250479)) k!1914) (ite (is-MissingZero!5122 lt!250479) (= (select (arr!16673 a!3118) (index!22715 lt!250479)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5122 lt!250479) (= (select (arr!16673 a!3118) (index!22718 lt!250479)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82819 (= lt!250479 e!317705)))

(declare-fun c!63780 () Bool)

(assert (=> d!82819 (= c!63780 (and (is-Intermediate!5122 lt!250480) (undefined!5934 lt!250480)))))

(assert (=> d!82819 (= lt!250480 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!82819 (validMask!0 mask!3119)))

(assert (=> d!82819 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!250479)))

(assert (= (and d!82819 c!63780) b!550359))

(assert (= (and d!82819 (not c!63780)) b!550362))

(assert (= (and b!550362 c!63778) b!550357))

(assert (= (and b!550362 (not c!63778)) b!550360))

(assert (= (and b!550360 c!63779) b!550361))

(assert (= (and b!550360 (not c!63779)) b!550358))

(declare-fun m!527397 () Bool)

(assert (=> b!550358 m!527397))

(declare-fun m!527399 () Bool)

(assert (=> b!550362 m!527399))

(declare-fun m!527401 () Bool)

(assert (=> d!82819 m!527401))

(declare-fun m!527403 () Bool)

(assert (=> d!82819 m!527403))

(declare-fun m!527405 () Bool)

(assert (=> d!82819 m!527405))

(declare-fun m!527407 () Bool)

(assert (=> d!82819 m!527407))

(assert (=> d!82819 m!527333))

(assert (=> d!82819 m!527407))

(declare-fun m!527409 () Bool)

(assert (=> d!82819 m!527409))

(assert (=> b!550273 d!82819))

(declare-fun e!317733 () SeekEntryResult!5122)

(declare-fun b!550411 () Bool)

(assert (=> b!550411 (= e!317733 (Intermediate!5122 true (toIndex!0 (select (arr!16673 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun d!82843 () Bool)

(declare-fun e!317736 () Bool)

(assert (=> d!82843 e!317736))

(declare-fun c!63802 () Bool)

(declare-fun lt!250500 () SeekEntryResult!5122)

(assert (=> d!82843 (= c!63802 (and (is-Intermediate!5122 lt!250500) (undefined!5934 lt!250500)))))

(assert (=> d!82843 (= lt!250500 e!317733)))

(declare-fun c!63804 () Bool)

(assert (=> d!82843 (= c!63804 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!250501 () (_ BitVec 64))

(assert (=> d!82843 (= lt!250501 (select (arr!16673 a!3118) (toIndex!0 (select (arr!16673 a!3118) j!142) mask!3119)))))

(assert (=> d!82843 (validMask!0 mask!3119)))

(assert (=> d!82843 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16673 a!3118) j!142) mask!3119) (select (arr!16673 a!3118) j!142) a!3118 mask!3119) lt!250500)))

(declare-fun b!550412 () Bool)

(declare-fun e!317732 () SeekEntryResult!5122)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550412 (= e!317732 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16673 a!3118) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (arr!16673 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!550413 () Bool)

(assert (=> b!550413 (and (bvsge (index!22717 lt!250500) #b00000000000000000000000000000000) (bvslt (index!22717 lt!250500) (size!17037 a!3118)))))

(declare-fun res!343469 () Bool)

(assert (=> b!550413 (= res!343469 (= (select (arr!16673 a!3118) (index!22717 lt!250500)) (select (arr!16673 a!3118) j!142)))))

(declare-fun e!317735 () Bool)

(assert (=> b!550413 (=> res!343469 e!317735)))

(declare-fun e!317734 () Bool)

(assert (=> b!550413 (= e!317734 e!317735)))

(declare-fun b!550414 () Bool)

(assert (=> b!550414 (= e!317736 e!317734)))

(declare-fun res!343471 () Bool)

(assert (=> b!550414 (= res!343471 (and (is-Intermediate!5122 lt!250500) (not (undefined!5934 lt!250500)) (bvslt (x!51636 lt!250500) #b01111111111111111111111111111110) (bvsge (x!51636 lt!250500) #b00000000000000000000000000000000) (bvsge (x!51636 lt!250500) #b00000000000000000000000000000000)))))

(assert (=> b!550414 (=> (not res!343471) (not e!317734))))

(declare-fun b!550415 () Bool)

(assert (=> b!550415 (= e!317733 e!317732)))

(declare-fun c!63803 () Bool)

(assert (=> b!550415 (= c!63803 (or (= lt!250501 (select (arr!16673 a!3118) j!142)) (= (bvadd lt!250501 lt!250501) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!550416 () Bool)

(assert (=> b!550416 (and (bvsge (index!22717 lt!250500) #b00000000000000000000000000000000) (bvslt (index!22717 lt!250500) (size!17037 a!3118)))))

(assert (=> b!550416 (= e!317735 (= (select (arr!16673 a!3118) (index!22717 lt!250500)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!550417 () Bool)

(assert (=> b!550417 (= e!317732 (Intermediate!5122 false (toIndex!0 (select (arr!16673 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!550418 () Bool)

(assert (=> b!550418 (= e!317736 (bvsge (x!51636 lt!250500) #b01111111111111111111111111111110))))

(declare-fun b!550419 () Bool)

(assert (=> b!550419 (and (bvsge (index!22717 lt!250500) #b00000000000000000000000000000000) (bvslt (index!22717 lt!250500) (size!17037 a!3118)))))

(declare-fun res!343470 () Bool)

(assert (=> b!550419 (= res!343470 (= (select (arr!16673 a!3118) (index!22717 lt!250500)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!550419 (=> res!343470 e!317735)))

(assert (= (and d!82843 c!63804) b!550411))

(assert (= (and d!82843 (not c!63804)) b!550415))

(assert (= (and b!550415 c!63803) b!550417))

(assert (= (and b!550415 (not c!63803)) b!550412))

(assert (= (and d!82843 c!63802) b!550418))

(assert (= (and d!82843 (not c!63802)) b!550414))

(assert (= (and b!550414 res!343471) b!550413))

(assert (= (and b!550413 (not res!343469)) b!550419))

(assert (= (and b!550419 (not res!343470)) b!550416))

(declare-fun m!527425 () Bool)

(assert (=> b!550413 m!527425))

(assert (=> b!550412 m!527341))

(declare-fun m!527427 () Bool)

(assert (=> b!550412 m!527427))

(assert (=> b!550412 m!527427))

(assert (=> b!550412 m!527329))

(declare-fun m!527431 () Bool)

(assert (=> b!550412 m!527431))

(assert (=> d!82843 m!527341))

(declare-fun m!527437 () Bool)

(assert (=> d!82843 m!527437))

(assert (=> d!82843 m!527333))

(assert (=> b!550416 m!527425))

(assert (=> b!550419 m!527425))

(assert (=> b!550279 d!82843))

(declare-fun d!82851 () Bool)

(declare-fun lt!250515 () (_ BitVec 32))

(declare-fun lt!250514 () (_ BitVec 32))

(assert (=> d!82851 (= lt!250515 (bvmul (bvxor lt!250514 (bvlshr lt!250514 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82851 (= lt!250514 ((_ extract 31 0) (bvand (bvxor (select (arr!16673 a!3118) j!142) (bvlshr (select (arr!16673 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82851 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!343474 (let ((h!11723 ((_ extract 31 0) (bvand (bvxor (select (arr!16673 a!3118) j!142) (bvlshr (select (arr!16673 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51638 (bvmul (bvxor h!11723 (bvlshr h!11723 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51638 (bvlshr x!51638 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!343474 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!343474 #b00000000000000000000000000000000))))))

(assert (=> d!82851 (= (toIndex!0 (select (arr!16673 a!3118) j!142) mask!3119) (bvand (bvxor lt!250515 (bvlshr lt!250515 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!550279 d!82851))

(declare-fun e!317744 () SeekEntryResult!5122)

(declare-fun b!550430 () Bool)

(assert (=> b!550430 (= e!317744 (Intermediate!5122 true (toIndex!0 (select (store (arr!16673 a!3118) i!1132 k!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun d!82857 () Bool)

(declare-fun e!317747 () Bool)

(assert (=> d!82857 e!317747))

(declare-fun c!63809 () Bool)

(declare-fun lt!250517 () SeekEntryResult!5122)

(assert (=> d!82857 (= c!63809 (and (is-Intermediate!5122 lt!250517) (undefined!5934 lt!250517)))))

(assert (=> d!82857 (= lt!250517 e!317744)))

(declare-fun c!63811 () Bool)

(assert (=> d!82857 (= c!63811 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!250518 () (_ BitVec 64))

(assert (=> d!82857 (= lt!250518 (select (arr!16673 (array!34716 (store (arr!16673 a!3118) i!1132 k!1914) (size!17037 a!3118))) (toIndex!0 (select (store (arr!16673 a!3118) i!1132 k!1914) j!142) mask!3119)))))

(assert (=> d!82857 (validMask!0 mask!3119)))

(assert (=> d!82857 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16673 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16673 a!3118) i!1132 k!1914) j!142) (array!34716 (store (arr!16673 a!3118) i!1132 k!1914) (size!17037 a!3118)) mask!3119) lt!250517)))

(declare-fun e!317743 () SeekEntryResult!5122)

(declare-fun b!550431 () Bool)

(assert (=> b!550431 (= e!317743 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!16673 a!3118) i!1132 k!1914) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (store (arr!16673 a!3118) i!1132 k!1914) j!142) (array!34716 (store (arr!16673 a!3118) i!1132 k!1914) (size!17037 a!3118)) mask!3119))))

(declare-fun b!550432 () Bool)

(assert (=> b!550432 (and (bvsge (index!22717 lt!250517) #b00000000000000000000000000000000) (bvslt (index!22717 lt!250517) (size!17037 (array!34716 (store (arr!16673 a!3118) i!1132 k!1914) (size!17037 a!3118)))))))

(declare-fun res!343475 () Bool)

(assert (=> b!550432 (= res!343475 (= (select (arr!16673 (array!34716 (store (arr!16673 a!3118) i!1132 k!1914) (size!17037 a!3118))) (index!22717 lt!250517)) (select (store (arr!16673 a!3118) i!1132 k!1914) j!142)))))

(declare-fun e!317746 () Bool)

(assert (=> b!550432 (=> res!343475 e!317746)))

(declare-fun e!317745 () Bool)

(assert (=> b!550432 (= e!317745 e!317746)))

(declare-fun b!550433 () Bool)

(assert (=> b!550433 (= e!317747 e!317745)))

(declare-fun res!343477 () Bool)

(assert (=> b!550433 (= res!343477 (and (is-Intermediate!5122 lt!250517) (not (undefined!5934 lt!250517)) (bvslt (x!51636 lt!250517) #b01111111111111111111111111111110) (bvsge (x!51636 lt!250517) #b00000000000000000000000000000000) (bvsge (x!51636 lt!250517) #b00000000000000000000000000000000)))))

(assert (=> b!550433 (=> (not res!343477) (not e!317745))))

(declare-fun b!550434 () Bool)

(assert (=> b!550434 (= e!317744 e!317743)))

(declare-fun c!63810 () Bool)

(assert (=> b!550434 (= c!63810 (or (= lt!250518 (select (store (arr!16673 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!250518 lt!250518) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!550435 () Bool)

(assert (=> b!550435 (and (bvsge (index!22717 lt!250517) #b00000000000000000000000000000000) (bvslt (index!22717 lt!250517) (size!17037 (array!34716 (store (arr!16673 a!3118) i!1132 k!1914) (size!17037 a!3118)))))))

(assert (=> b!550435 (= e!317746 (= (select (arr!16673 (array!34716 (store (arr!16673 a!3118) i!1132 k!1914) (size!17037 a!3118))) (index!22717 lt!250517)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!550436 () Bool)

(assert (=> b!550436 (= e!317743 (Intermediate!5122 false (toIndex!0 (select (store (arr!16673 a!3118) i!1132 k!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!550437 () Bool)

(assert (=> b!550437 (= e!317747 (bvsge (x!51636 lt!250517) #b01111111111111111111111111111110))))

(declare-fun b!550438 () Bool)

(assert (=> b!550438 (and (bvsge (index!22717 lt!250517) #b00000000000000000000000000000000) (bvslt (index!22717 lt!250517) (size!17037 (array!34716 (store (arr!16673 a!3118) i!1132 k!1914) (size!17037 a!3118)))))))

(declare-fun res!343476 () Bool)

(assert (=> b!550438 (= res!343476 (= (select (arr!16673 (array!34716 (store (arr!16673 a!3118) i!1132 k!1914) (size!17037 a!3118))) (index!22717 lt!250517)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!550438 (=> res!343476 e!317746)))

(assert (= (and d!82857 c!63811) b!550430))

(assert (= (and d!82857 (not c!63811)) b!550434))

(assert (= (and b!550434 c!63810) b!550436))

(assert (= (and b!550434 (not c!63810)) b!550431))

(assert (= (and d!82857 c!63809) b!550437))

(assert (= (and d!82857 (not c!63809)) b!550433))

(assert (= (and b!550433 res!343477) b!550432))

(assert (= (and b!550432 (not res!343475)) b!550438))

(assert (= (and b!550438 (not res!343476)) b!550435))

(declare-fun m!527457 () Bool)

(assert (=> b!550432 m!527457))

(assert (=> b!550431 m!527345))

(declare-fun m!527463 () Bool)

(assert (=> b!550431 m!527463))

(assert (=> b!550431 m!527463))

(assert (=> b!550431 m!527343))

(declare-fun m!527467 () Bool)

(assert (=> b!550431 m!527467))

(assert (=> d!82857 m!527345))

(declare-fun m!527469 () Bool)

(assert (=> d!82857 m!527469))

(assert (=> d!82857 m!527333))

(assert (=> b!550435 m!527457))

(assert (=> b!550438 m!527457))

(assert (=> b!550279 d!82857))

(declare-fun d!82863 () Bool)

(declare-fun lt!250523 () (_ BitVec 32))

(declare-fun lt!250522 () (_ BitVec 32))

(assert (=> d!82863 (= lt!250523 (bvmul (bvxor lt!250522 (bvlshr lt!250522 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82863 (= lt!250522 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16673 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16673 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82863 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!343474 (let ((h!11723 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16673 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16673 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51638 (bvmul (bvxor h!11723 (bvlshr h!11723 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51638 (bvlshr x!51638 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!343474 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!343474 #b00000000000000000000000000000000))))))

(assert (=> d!82863 (= (toIndex!0 (select (store (arr!16673 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!250523 (bvlshr lt!250523 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!550279 d!82863))

(declare-fun d!82865 () Bool)

(declare-fun res!343488 () Bool)

(declare-fun e!317761 () Bool)

(assert (=> d!82865 (=> res!343488 e!317761)))

(assert (=> d!82865 (= res!343488 (= (select (arr!16673 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!82865 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!317761)))

(declare-fun b!550455 () Bool)

(declare-fun e!317762 () Bool)

(assert (=> b!550455 (= e!317761 e!317762)))

(declare-fun res!343489 () Bool)

(assert (=> b!550455 (=> (not res!343489) (not e!317762))))

(assert (=> b!550455 (= res!343489 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17037 a!3118)))))

(declare-fun b!550456 () Bool)

(assert (=> b!550456 (= e!317762 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82865 (not res!343488)) b!550455))

(assert (= (and b!550455 res!343489) b!550456))

(declare-fun m!527475 () Bool)

(assert (=> d!82865 m!527475))

(declare-fun m!527477 () Bool)

(assert (=> b!550456 m!527477))

(assert (=> b!550277 d!82865))

(declare-fun b!550485 () Bool)

(declare-fun e!317784 () Bool)

(declare-fun call!32263 () Bool)

(assert (=> b!550485 (= e!317784 call!32263)))

(declare-fun b!550486 () Bool)

(declare-fun e!317783 () Bool)

(declare-fun contains!2835 (List!10753 (_ BitVec 64)) Bool)

(assert (=> b!550486 (= e!317783 (contains!2835 Nil!10750 (select (arr!16673 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!82871 () Bool)

(declare-fun res!343504 () Bool)

(declare-fun e!317782 () Bool)

(assert (=> d!82871 (=> res!343504 e!317782)))

(assert (=> d!82871 (= res!343504 (bvsge #b00000000000000000000000000000000 (size!17037 a!3118)))))

(assert (=> d!82871 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10750) e!317782)))

(declare-fun b!550487 () Bool)

(declare-fun e!317781 () Bool)

(assert (=> b!550487 (= e!317782 e!317781)))

(declare-fun res!343502 () Bool)

(assert (=> b!550487 (=> (not res!343502) (not e!317781))))

(assert (=> b!550487 (= res!343502 (not e!317783))))

(declare-fun res!343503 () Bool)

(assert (=> b!550487 (=> (not res!343503) (not e!317783))))

(assert (=> b!550487 (= res!343503 (validKeyInArray!0 (select (arr!16673 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!550488 () Bool)

(assert (=> b!550488 (= e!317781 e!317784)))

(declare-fun c!63823 () Bool)

(assert (=> b!550488 (= c!63823 (validKeyInArray!0 (select (arr!16673 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!550489 () Bool)

(assert (=> b!550489 (= e!317784 call!32263)))

(declare-fun bm!32260 () Bool)

(assert (=> bm!32260 (= call!32263 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63823 (Cons!10749 (select (arr!16673 a!3118) #b00000000000000000000000000000000) Nil!10750) Nil!10750)))))

(assert (= (and d!82871 (not res!343504)) b!550487))

(assert (= (and b!550487 res!343503) b!550486))

(assert (= (and b!550487 res!343502) b!550488))

(assert (= (and b!550488 c!63823) b!550485))

(assert (= (and b!550488 (not c!63823)) b!550489))

(assert (= (or b!550485 b!550489) bm!32260))

(assert (=> b!550486 m!527475))

(assert (=> b!550486 m!527475))

(declare-fun m!527479 () Bool)

(assert (=> b!550486 m!527479))

(assert (=> b!550487 m!527475))

(assert (=> b!550487 m!527475))

(declare-fun m!527481 () Bool)

(assert (=> b!550487 m!527481))

(assert (=> b!550488 m!527475))

(assert (=> b!550488 m!527475))

(assert (=> b!550488 m!527481))

(assert (=> bm!32260 m!527475))

(declare-fun m!527483 () Bool)

(assert (=> bm!32260 m!527483))

(assert (=> b!550278 d!82871))

(declare-fun b!550528 () Bool)

(declare-fun e!317809 () Bool)

(declare-fun call!32266 () Bool)

(assert (=> b!550528 (= e!317809 call!32266)))

(declare-fun b!550529 () Bool)

(declare-fun e!317810 () Bool)

(declare-fun e!317811 () Bool)

(assert (=> b!550529 (= e!317810 e!317811)))

(declare-fun c!63838 () Bool)

(assert (=> b!550529 (= c!63838 (validKeyInArray!0 (select (arr!16673 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!550530 () Bool)

(assert (=> b!550530 (= e!317811 call!32266)))

(declare-fun b!550531 () Bool)

(assert (=> b!550531 (= e!317811 e!317809)))

(declare-fun lt!250549 () (_ BitVec 64))

(assert (=> b!550531 (= lt!250549 (select (arr!16673 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!250550 () Unit!17018)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34715 (_ BitVec 64) (_ BitVec 32)) Unit!17018)

(assert (=> b!550531 (= lt!250550 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250549 #b00000000000000000000000000000000))))

(assert (=> b!550531 (arrayContainsKey!0 a!3118 lt!250549 #b00000000000000000000000000000000)))

(declare-fun lt!250548 () Unit!17018)

(assert (=> b!550531 (= lt!250548 lt!250550)))

(declare-fun res!343519 () Bool)

(assert (=> b!550531 (= res!343519 (= (seekEntryOrOpen!0 (select (arr!16673 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5122 #b00000000000000000000000000000000)))))

(assert (=> b!550531 (=> (not res!343519) (not e!317809))))

(declare-fun bm!32263 () Bool)

(assert (=> bm!32263 (= call!32266 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!82873 () Bool)

(declare-fun res!343518 () Bool)

(assert (=> d!82873 (=> res!343518 e!317810)))

(assert (=> d!82873 (= res!343518 (bvsge #b00000000000000000000000000000000 (size!17037 a!3118)))))

(assert (=> d!82873 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!317810)))

(assert (= (and d!82873 (not res!343518)) b!550529))

(assert (= (and b!550529 c!63838) b!550531))

(assert (= (and b!550529 (not c!63838)) b!550530))

(assert (= (and b!550531 res!343519) b!550528))

(assert (= (or b!550528 b!550530) bm!32263))

(assert (=> b!550529 m!527475))

(assert (=> b!550529 m!527475))

(assert (=> b!550529 m!527481))

(assert (=> b!550531 m!527475))

(declare-fun m!527501 () Bool)

(assert (=> b!550531 m!527501))

(declare-fun m!527503 () Bool)

(assert (=> b!550531 m!527503))

(assert (=> b!550531 m!527475))

(declare-fun m!527505 () Bool)

(assert (=> b!550531 m!527505))

(declare-fun m!527507 () Bool)

(assert (=> bm!32263 m!527507))

(assert (=> b!550272 d!82873))

(declare-fun b!550544 () Bool)

(declare-fun e!317817 () Bool)

(declare-fun call!32267 () Bool)

(assert (=> b!550544 (= e!317817 call!32267)))

(declare-fun b!550545 () Bool)

(declare-fun e!317818 () Bool)

(declare-fun e!317819 () Bool)

(assert (=> b!550545 (= e!317818 e!317819)))

(declare-fun c!63842 () Bool)

(assert (=> b!550545 (= c!63842 (validKeyInArray!0 (select (arr!16673 a!3118) j!142)))))

(declare-fun b!550546 () Bool)

(assert (=> b!550546 (= e!317819 call!32267)))

(declare-fun b!550547 () Bool)

(assert (=> b!550547 (= e!317819 e!317817)))

(declare-fun lt!250557 () (_ BitVec 64))

(assert (=> b!550547 (= lt!250557 (select (arr!16673 a!3118) j!142))))

(declare-fun lt!250558 () Unit!17018)

(assert (=> b!550547 (= lt!250558 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250557 j!142))))

(assert (=> b!550547 (arrayContainsKey!0 a!3118 lt!250557 #b00000000000000000000000000000000)))

(declare-fun lt!250556 () Unit!17018)

(assert (=> b!550547 (= lt!250556 lt!250558)))

(declare-fun res!343525 () Bool)

(assert (=> b!550547 (= res!343525 (= (seekEntryOrOpen!0 (select (arr!16673 a!3118) j!142) a!3118 mask!3119) (Found!5122 j!142)))))

(assert (=> b!550547 (=> (not res!343525) (not e!317817))))

(declare-fun bm!32264 () Bool)

(assert (=> bm!32264 (= call!32267 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!82883 () Bool)

(declare-fun res!343524 () Bool)

(assert (=> d!82883 (=> res!343524 e!317818)))

(assert (=> d!82883 (= res!343524 (bvsge j!142 (size!17037 a!3118)))))

(assert (=> d!82883 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!317818)))

(assert (= (and d!82883 (not res!343524)) b!550545))

(assert (= (and b!550545 c!63842) b!550547))

(assert (= (and b!550545 (not c!63842)) b!550546))

(assert (= (and b!550547 res!343525) b!550544))

(assert (= (or b!550544 b!550546) bm!32264))

(assert (=> b!550545 m!527329))

(assert (=> b!550545 m!527329))

(assert (=> b!550545 m!527337))

(assert (=> b!550547 m!527329))

(declare-fun m!527515 () Bool)

(assert (=> b!550547 m!527515))

(declare-fun m!527517 () Bool)

(assert (=> b!550547 m!527517))

(assert (=> b!550547 m!527329))

(assert (=> b!550547 m!527331))

(declare-fun m!527519 () Bool)

(assert (=> bm!32264 m!527519))

(assert (=> b!550271 d!82883))

(declare-fun d!82885 () Bool)

(assert (=> d!82885 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!250563 () Unit!17018)

(declare-fun choose!38 (array!34715 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17018)

(assert (=> d!82885 (= lt!250563 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!82885 (validMask!0 mask!3119)))

(assert (=> d!82885 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!250563)))

(declare-fun bs!17154 () Bool)

(assert (= bs!17154 d!82885))

(assert (=> bs!17154 m!527321))

