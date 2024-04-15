; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51974 () Bool)

(assert start!51974)

(declare-fun b!567721 () Bool)

(declare-fun res!358254 () Bool)

(declare-fun e!326650 () Bool)

(assert (=> b!567721 (=> (not res!358254) (not e!326650))))

(declare-datatypes ((array!35620 0))(
  ( (array!35621 (arr!17105 (Array (_ BitVec 32) (_ BitVec 64))) (size!17470 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35620)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35620 (_ BitVec 32)) Bool)

(assert (=> b!567721 (= res!358254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!326648 () Bool)

(declare-datatypes ((SeekEntryResult!5551 0))(
  ( (MissingZero!5551 (index!24431 (_ BitVec 32))) (Found!5551 (index!24432 (_ BitVec 32))) (Intermediate!5551 (undefined!6363 Bool) (index!24433 (_ BitVec 32)) (x!53313 (_ BitVec 32))) (Undefined!5551) (MissingVacant!5551 (index!24434 (_ BitVec 32))) )
))
(declare-fun lt!258528 () SeekEntryResult!5551)

(declare-fun b!567722 () Bool)

(get-info :version)

(assert (=> b!567722 (= e!326648 (not (or (not ((_ is Intermediate!5551) lt!258528)) (undefined!6363 lt!258528) (= (select (arr!17105 a!3118) (index!24433 lt!258528)) (select (arr!17105 a!3118) j!142)) (and (bvsge (index!24433 lt!258528) #b00000000000000000000000000000000) (bvslt (index!24433 lt!258528) (size!17470 a!3118))))))))

(declare-fun e!326652 () Bool)

(assert (=> b!567722 e!326652))

(declare-fun res!358249 () Bool)

(assert (=> b!567722 (=> (not res!358249) (not e!326652))))

(assert (=> b!567722 (= res!358249 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17790 0))(
  ( (Unit!17791) )
))
(declare-fun lt!258530 () Unit!17790)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35620 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17790)

(assert (=> b!567722 (= lt!258530 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!567723 () Bool)

(declare-fun res!358255 () Bool)

(assert (=> b!567723 (=> (not res!358255) (not e!326650))))

(declare-datatypes ((List!11224 0))(
  ( (Nil!11221) (Cons!11220 (h!12235 (_ BitVec 64)) (t!17443 List!11224)) )
))
(declare-fun arrayNoDuplicates!0 (array!35620 (_ BitVec 32) List!11224) Bool)

(assert (=> b!567723 (= res!358255 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11221))))

(declare-fun b!567724 () Bool)

(declare-fun res!358252 () Bool)

(declare-fun e!326649 () Bool)

(assert (=> b!567724 (=> (not res!358252) (not e!326649))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!567724 (= res!358252 (and (= (size!17470 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17470 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17470 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!567726 () Bool)

(assert (=> b!567726 (= e!326650 e!326648)))

(declare-fun res!358251 () Bool)

(assert (=> b!567726 (=> (not res!358251) (not e!326648))))

(declare-fun lt!258529 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35620 (_ BitVec 32)) SeekEntryResult!5551)

(assert (=> b!567726 (= res!358251 (= lt!258528 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258529 (select (store (arr!17105 a!3118) i!1132 k0!1914) j!142) (array!35621 (store (arr!17105 a!3118) i!1132 k0!1914) (size!17470 a!3118)) mask!3119)))))

(declare-fun lt!258531 () (_ BitVec 32))

(assert (=> b!567726 (= lt!258528 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258531 (select (arr!17105 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567726 (= lt!258529 (toIndex!0 (select (store (arr!17105 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!567726 (= lt!258531 (toIndex!0 (select (arr!17105 a!3118) j!142) mask!3119))))

(declare-fun b!567727 () Bool)

(declare-fun res!358248 () Bool)

(assert (=> b!567727 (=> (not res!358248) (not e!326649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!567727 (= res!358248 (validKeyInArray!0 k0!1914))))

(declare-fun b!567728 () Bool)

(declare-fun res!358256 () Bool)

(assert (=> b!567728 (=> (not res!358256) (not e!326649))))

(declare-fun arrayContainsKey!0 (array!35620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!567728 (= res!358256 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!567729 () Bool)

(assert (=> b!567729 (= e!326649 e!326650)))

(declare-fun res!358253 () Bool)

(assert (=> b!567729 (=> (not res!358253) (not e!326650))))

(declare-fun lt!258532 () SeekEntryResult!5551)

(assert (=> b!567729 (= res!358253 (or (= lt!258532 (MissingZero!5551 i!1132)) (= lt!258532 (MissingVacant!5551 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35620 (_ BitVec 32)) SeekEntryResult!5551)

(assert (=> b!567729 (= lt!258532 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!567730 () Bool)

(assert (=> b!567730 (= e!326652 (= (seekEntryOrOpen!0 (select (arr!17105 a!3118) j!142) a!3118 mask!3119) (Found!5551 j!142)))))

(declare-fun b!567725 () Bool)

(declare-fun res!358250 () Bool)

(assert (=> b!567725 (=> (not res!358250) (not e!326649))))

(assert (=> b!567725 (= res!358250 (validKeyInArray!0 (select (arr!17105 a!3118) j!142)))))

(declare-fun res!358247 () Bool)

(assert (=> start!51974 (=> (not res!358247) (not e!326649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51974 (= res!358247 (validMask!0 mask!3119))))

(assert (=> start!51974 e!326649))

(assert (=> start!51974 true))

(declare-fun array_inv!12988 (array!35620) Bool)

(assert (=> start!51974 (array_inv!12988 a!3118)))

(assert (= (and start!51974 res!358247) b!567724))

(assert (= (and b!567724 res!358252) b!567725))

(assert (= (and b!567725 res!358250) b!567727))

(assert (= (and b!567727 res!358248) b!567728))

(assert (= (and b!567728 res!358256) b!567729))

(assert (= (and b!567729 res!358253) b!567721))

(assert (= (and b!567721 res!358254) b!567723))

(assert (= (and b!567723 res!358255) b!567726))

(assert (= (and b!567726 res!358251) b!567722))

(assert (= (and b!567722 res!358249) b!567730))

(declare-fun m!545801 () Bool)

(assert (=> b!567721 m!545801))

(declare-fun m!545803 () Bool)

(assert (=> start!51974 m!545803))

(declare-fun m!545805 () Bool)

(assert (=> start!51974 m!545805))

(declare-fun m!545807 () Bool)

(assert (=> b!567728 m!545807))

(declare-fun m!545809 () Bool)

(assert (=> b!567725 m!545809))

(assert (=> b!567725 m!545809))

(declare-fun m!545811 () Bool)

(assert (=> b!567725 m!545811))

(declare-fun m!545813 () Bool)

(assert (=> b!567723 m!545813))

(declare-fun m!545815 () Bool)

(assert (=> b!567729 m!545815))

(assert (=> b!567726 m!545809))

(declare-fun m!545817 () Bool)

(assert (=> b!567726 m!545817))

(assert (=> b!567726 m!545809))

(declare-fun m!545819 () Bool)

(assert (=> b!567726 m!545819))

(declare-fun m!545821 () Bool)

(assert (=> b!567726 m!545821))

(assert (=> b!567726 m!545819))

(assert (=> b!567726 m!545809))

(declare-fun m!545823 () Bool)

(assert (=> b!567726 m!545823))

(declare-fun m!545825 () Bool)

(assert (=> b!567726 m!545825))

(assert (=> b!567726 m!545819))

(declare-fun m!545827 () Bool)

(assert (=> b!567726 m!545827))

(assert (=> b!567730 m!545809))

(assert (=> b!567730 m!545809))

(declare-fun m!545829 () Bool)

(assert (=> b!567730 m!545829))

(declare-fun m!545831 () Bool)

(assert (=> b!567727 m!545831))

(declare-fun m!545833 () Bool)

(assert (=> b!567722 m!545833))

(assert (=> b!567722 m!545809))

(declare-fun m!545835 () Bool)

(assert (=> b!567722 m!545835))

(declare-fun m!545837 () Bool)

(assert (=> b!567722 m!545837))

(check-sat (not b!567730) (not b!567722) (not b!567723) (not b!567725) (not b!567726) (not b!567721) (not b!567728) (not b!567729) (not start!51974) (not b!567727))
(check-sat)
(get-model)

(declare-fun b!567799 () Bool)

(declare-fun e!326691 () Bool)

(declare-fun call!32518 () Bool)

(assert (=> b!567799 (= e!326691 call!32518)))

(declare-fun d!84181 () Bool)

(declare-fun res!358322 () Bool)

(declare-fun e!326689 () Bool)

(assert (=> d!84181 (=> res!358322 e!326689)))

(assert (=> d!84181 (= res!358322 (bvsge j!142 (size!17470 a!3118)))))

(assert (=> d!84181 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!326689)))

(declare-fun b!567800 () Bool)

(declare-fun e!326690 () Bool)

(assert (=> b!567800 (= e!326690 e!326691)))

(declare-fun lt!258570 () (_ BitVec 64))

(assert (=> b!567800 (= lt!258570 (select (arr!17105 a!3118) j!142))))

(declare-fun lt!258569 () Unit!17790)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35620 (_ BitVec 64) (_ BitVec 32)) Unit!17790)

(assert (=> b!567800 (= lt!258569 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258570 j!142))))

(assert (=> b!567800 (arrayContainsKey!0 a!3118 lt!258570 #b00000000000000000000000000000000)))

(declare-fun lt!258571 () Unit!17790)

(assert (=> b!567800 (= lt!258571 lt!258569)))

(declare-fun res!358321 () Bool)

(assert (=> b!567800 (= res!358321 (= (seekEntryOrOpen!0 (select (arr!17105 a!3118) j!142) a!3118 mask!3119) (Found!5551 j!142)))))

(assert (=> b!567800 (=> (not res!358321) (not e!326691))))

(declare-fun b!567801 () Bool)

(assert (=> b!567801 (= e!326690 call!32518)))

(declare-fun bm!32515 () Bool)

(assert (=> bm!32515 (= call!32518 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!567802 () Bool)

(assert (=> b!567802 (= e!326689 e!326690)))

(declare-fun c!65091 () Bool)

(assert (=> b!567802 (= c!65091 (validKeyInArray!0 (select (arr!17105 a!3118) j!142)))))

(assert (= (and d!84181 (not res!358322)) b!567802))

(assert (= (and b!567802 c!65091) b!567800))

(assert (= (and b!567802 (not c!65091)) b!567801))

(assert (= (and b!567800 res!358321) b!567799))

(assert (= (or b!567799 b!567801) bm!32515))

(assert (=> b!567800 m!545809))

(declare-fun m!545915 () Bool)

(assert (=> b!567800 m!545915))

(declare-fun m!545917 () Bool)

(assert (=> b!567800 m!545917))

(assert (=> b!567800 m!545809))

(assert (=> b!567800 m!545829))

(declare-fun m!545919 () Bool)

(assert (=> bm!32515 m!545919))

(assert (=> b!567802 m!545809))

(assert (=> b!567802 m!545809))

(assert (=> b!567802 m!545811))

(assert (=> b!567722 d!84181))

(declare-fun d!84183 () Bool)

(assert (=> d!84183 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!258580 () Unit!17790)

(declare-fun choose!38 (array!35620 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17790)

(assert (=> d!84183 (= lt!258580 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84183 (validMask!0 mask!3119)))

(assert (=> d!84183 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!258580)))

(declare-fun bs!17599 () Bool)

(assert (= bs!17599 d!84183))

(assert (=> bs!17599 m!545835))

(declare-fun m!545921 () Bool)

(assert (=> bs!17599 m!545921))

(assert (=> bs!17599 m!545803))

(assert (=> b!567722 d!84183))

(declare-fun d!84187 () Bool)

(assert (=> d!84187 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!567727 d!84187))

(declare-fun b!567845 () Bool)

(declare-fun e!326717 () SeekEntryResult!5551)

(declare-fun lt!258601 () SeekEntryResult!5551)

(assert (=> b!567845 (= e!326717 (MissingZero!5551 (index!24433 lt!258601)))))

(declare-fun b!567846 () Bool)

(declare-fun e!326718 () SeekEntryResult!5551)

(assert (=> b!567846 (= e!326718 (Found!5551 (index!24433 lt!258601)))))

(declare-fun b!567847 () Bool)

(declare-fun e!326716 () SeekEntryResult!5551)

(assert (=> b!567847 (= e!326716 Undefined!5551)))

(declare-fun d!84189 () Bool)

(declare-fun lt!258600 () SeekEntryResult!5551)

(assert (=> d!84189 (and (or ((_ is Undefined!5551) lt!258600) (not ((_ is Found!5551) lt!258600)) (and (bvsge (index!24432 lt!258600) #b00000000000000000000000000000000) (bvslt (index!24432 lt!258600) (size!17470 a!3118)))) (or ((_ is Undefined!5551) lt!258600) ((_ is Found!5551) lt!258600) (not ((_ is MissingZero!5551) lt!258600)) (and (bvsge (index!24431 lt!258600) #b00000000000000000000000000000000) (bvslt (index!24431 lt!258600) (size!17470 a!3118)))) (or ((_ is Undefined!5551) lt!258600) ((_ is Found!5551) lt!258600) ((_ is MissingZero!5551) lt!258600) (not ((_ is MissingVacant!5551) lt!258600)) (and (bvsge (index!24434 lt!258600) #b00000000000000000000000000000000) (bvslt (index!24434 lt!258600) (size!17470 a!3118)))) (or ((_ is Undefined!5551) lt!258600) (ite ((_ is Found!5551) lt!258600) (= (select (arr!17105 a!3118) (index!24432 lt!258600)) k0!1914) (ite ((_ is MissingZero!5551) lt!258600) (= (select (arr!17105 a!3118) (index!24431 lt!258600)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5551) lt!258600) (= (select (arr!17105 a!3118) (index!24434 lt!258600)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84189 (= lt!258600 e!326716)))

(declare-fun c!65111 () Bool)

(assert (=> d!84189 (= c!65111 (and ((_ is Intermediate!5551) lt!258601) (undefined!6363 lt!258601)))))

(assert (=> d!84189 (= lt!258601 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84189 (validMask!0 mask!3119)))

(assert (=> d!84189 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!258600)))

(declare-fun b!567848 () Bool)

(assert (=> b!567848 (= e!326716 e!326718)))

(declare-fun lt!258599 () (_ BitVec 64))

(assert (=> b!567848 (= lt!258599 (select (arr!17105 a!3118) (index!24433 lt!258601)))))

(declare-fun c!65110 () Bool)

(assert (=> b!567848 (= c!65110 (= lt!258599 k0!1914))))

(declare-fun b!567849 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35620 (_ BitVec 32)) SeekEntryResult!5551)

(assert (=> b!567849 (= e!326717 (seekKeyOrZeroReturnVacant!0 (x!53313 lt!258601) (index!24433 lt!258601) (index!24433 lt!258601) k0!1914 a!3118 mask!3119))))

(declare-fun b!567850 () Bool)

(declare-fun c!65112 () Bool)

(assert (=> b!567850 (= c!65112 (= lt!258599 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!567850 (= e!326718 e!326717)))

(assert (= (and d!84189 c!65111) b!567847))

(assert (= (and d!84189 (not c!65111)) b!567848))

(assert (= (and b!567848 c!65110) b!567846))

(assert (= (and b!567848 (not c!65110)) b!567850))

(assert (= (and b!567850 c!65112) b!567845))

(assert (= (and b!567850 (not c!65112)) b!567849))

(declare-fun m!545949 () Bool)

(assert (=> d!84189 m!545949))

(declare-fun m!545951 () Bool)

(assert (=> d!84189 m!545951))

(assert (=> d!84189 m!545803))

(assert (=> d!84189 m!545949))

(declare-fun m!545953 () Bool)

(assert (=> d!84189 m!545953))

(declare-fun m!545955 () Bool)

(assert (=> d!84189 m!545955))

(declare-fun m!545957 () Bool)

(assert (=> d!84189 m!545957))

(declare-fun m!545959 () Bool)

(assert (=> b!567848 m!545959))

(declare-fun m!545961 () Bool)

(assert (=> b!567849 m!545961))

(assert (=> b!567729 d!84189))

(declare-fun b!567869 () Bool)

(declare-fun e!326729 () Bool)

(declare-fun e!326731 () Bool)

(assert (=> b!567869 (= e!326729 e!326731)))

(declare-fun c!65117 () Bool)

(assert (=> b!567869 (= c!65117 (validKeyInArray!0 (select (arr!17105 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!567870 () Bool)

(declare-fun e!326730 () Bool)

(assert (=> b!567870 (= e!326730 e!326729)))

(declare-fun res!358335 () Bool)

(assert (=> b!567870 (=> (not res!358335) (not e!326729))))

(declare-fun e!326732 () Bool)

(assert (=> b!567870 (= res!358335 (not e!326732))))

(declare-fun res!358337 () Bool)

(assert (=> b!567870 (=> (not res!358337) (not e!326732))))

(assert (=> b!567870 (= res!358337 (validKeyInArray!0 (select (arr!17105 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84199 () Bool)

(declare-fun res!358336 () Bool)

(assert (=> d!84199 (=> res!358336 e!326730)))

(assert (=> d!84199 (= res!358336 (bvsge #b00000000000000000000000000000000 (size!17470 a!3118)))))

(assert (=> d!84199 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11221) e!326730)))

(declare-fun bm!32521 () Bool)

(declare-fun call!32524 () Bool)

(assert (=> bm!32521 (= call!32524 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65117 (Cons!11220 (select (arr!17105 a!3118) #b00000000000000000000000000000000) Nil!11221) Nil!11221)))))

(declare-fun b!567871 () Bool)

(assert (=> b!567871 (= e!326731 call!32524)))

(declare-fun b!567872 () Bool)

(assert (=> b!567872 (= e!326731 call!32524)))

(declare-fun b!567873 () Bool)

(declare-fun contains!2852 (List!11224 (_ BitVec 64)) Bool)

(assert (=> b!567873 (= e!326732 (contains!2852 Nil!11221 (select (arr!17105 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84199 (not res!358336)) b!567870))

(assert (= (and b!567870 res!358337) b!567873))

(assert (= (and b!567870 res!358335) b!567869))

(assert (= (and b!567869 c!65117) b!567872))

(assert (= (and b!567869 (not c!65117)) b!567871))

(assert (= (or b!567872 b!567871) bm!32521))

(declare-fun m!545963 () Bool)

(assert (=> b!567869 m!545963))

(assert (=> b!567869 m!545963))

(declare-fun m!545965 () Bool)

(assert (=> b!567869 m!545965))

(assert (=> b!567870 m!545963))

(assert (=> b!567870 m!545963))

(assert (=> b!567870 m!545965))

(assert (=> bm!32521 m!545963))

(declare-fun m!545967 () Bool)

(assert (=> bm!32521 m!545967))

(assert (=> b!567873 m!545963))

(assert (=> b!567873 m!545963))

(declare-fun m!545969 () Bool)

(assert (=> b!567873 m!545969))

(assert (=> b!567723 d!84199))

(declare-fun d!84201 () Bool)

(declare-fun res!358348 () Bool)

(declare-fun e!326747 () Bool)

(assert (=> d!84201 (=> res!358348 e!326747)))

(assert (=> d!84201 (= res!358348 (= (select (arr!17105 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84201 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!326747)))

(declare-fun b!567895 () Bool)

(declare-fun e!326748 () Bool)

(assert (=> b!567895 (= e!326747 e!326748)))

(declare-fun res!358349 () Bool)

(assert (=> b!567895 (=> (not res!358349) (not e!326748))))

(assert (=> b!567895 (= res!358349 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17470 a!3118)))))

(declare-fun b!567897 () Bool)

(assert (=> b!567897 (= e!326748 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84201 (not res!358348)) b!567895))

(assert (= (and b!567895 res!358349) b!567897))

(assert (=> d!84201 m!545963))

(declare-fun m!545971 () Bool)

(assert (=> b!567897 m!545971))

(assert (=> b!567728 d!84201))

(declare-fun d!84203 () Bool)

(assert (=> d!84203 (= (validKeyInArray!0 (select (arr!17105 a!3118) j!142)) (and (not (= (select (arr!17105 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17105 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!567725 d!84203))

(declare-fun b!567898 () Bool)

(declare-fun e!326752 () SeekEntryResult!5551)

(declare-fun lt!258612 () SeekEntryResult!5551)

(assert (=> b!567898 (= e!326752 (MissingZero!5551 (index!24433 lt!258612)))))

(declare-fun b!567899 () Bool)

(declare-fun e!326753 () SeekEntryResult!5551)

(assert (=> b!567899 (= e!326753 (Found!5551 (index!24433 lt!258612)))))

(declare-fun b!567900 () Bool)

(declare-fun e!326751 () SeekEntryResult!5551)

(assert (=> b!567900 (= e!326751 Undefined!5551)))

(declare-fun d!84205 () Bool)

(declare-fun lt!258611 () SeekEntryResult!5551)

(assert (=> d!84205 (and (or ((_ is Undefined!5551) lt!258611) (not ((_ is Found!5551) lt!258611)) (and (bvsge (index!24432 lt!258611) #b00000000000000000000000000000000) (bvslt (index!24432 lt!258611) (size!17470 a!3118)))) (or ((_ is Undefined!5551) lt!258611) ((_ is Found!5551) lt!258611) (not ((_ is MissingZero!5551) lt!258611)) (and (bvsge (index!24431 lt!258611) #b00000000000000000000000000000000) (bvslt (index!24431 lt!258611) (size!17470 a!3118)))) (or ((_ is Undefined!5551) lt!258611) ((_ is Found!5551) lt!258611) ((_ is MissingZero!5551) lt!258611) (not ((_ is MissingVacant!5551) lt!258611)) (and (bvsge (index!24434 lt!258611) #b00000000000000000000000000000000) (bvslt (index!24434 lt!258611) (size!17470 a!3118)))) (or ((_ is Undefined!5551) lt!258611) (ite ((_ is Found!5551) lt!258611) (= (select (arr!17105 a!3118) (index!24432 lt!258611)) (select (arr!17105 a!3118) j!142)) (ite ((_ is MissingZero!5551) lt!258611) (= (select (arr!17105 a!3118) (index!24431 lt!258611)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5551) lt!258611) (= (select (arr!17105 a!3118) (index!24434 lt!258611)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84205 (= lt!258611 e!326751)))

(declare-fun c!65127 () Bool)

(assert (=> d!84205 (= c!65127 (and ((_ is Intermediate!5551) lt!258612) (undefined!6363 lt!258612)))))

(assert (=> d!84205 (= lt!258612 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17105 a!3118) j!142) mask!3119) (select (arr!17105 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84205 (validMask!0 mask!3119)))

(assert (=> d!84205 (= (seekEntryOrOpen!0 (select (arr!17105 a!3118) j!142) a!3118 mask!3119) lt!258611)))

(declare-fun b!567901 () Bool)

(assert (=> b!567901 (= e!326751 e!326753)))

(declare-fun lt!258610 () (_ BitVec 64))

(assert (=> b!567901 (= lt!258610 (select (arr!17105 a!3118) (index!24433 lt!258612)))))

(declare-fun c!65126 () Bool)

(assert (=> b!567901 (= c!65126 (= lt!258610 (select (arr!17105 a!3118) j!142)))))

(declare-fun b!567902 () Bool)

(assert (=> b!567902 (= e!326752 (seekKeyOrZeroReturnVacant!0 (x!53313 lt!258612) (index!24433 lt!258612) (index!24433 lt!258612) (select (arr!17105 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!567903 () Bool)

(declare-fun c!65128 () Bool)

(assert (=> b!567903 (= c!65128 (= lt!258610 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!567903 (= e!326753 e!326752)))

(assert (= (and d!84205 c!65127) b!567900))

(assert (= (and d!84205 (not c!65127)) b!567901))

(assert (= (and b!567901 c!65126) b!567899))

(assert (= (and b!567901 (not c!65126)) b!567903))

(assert (= (and b!567903 c!65128) b!567898))

(assert (= (and b!567903 (not c!65128)) b!567902))

(assert (=> d!84205 m!545809))

(assert (=> d!84205 m!545817))

(declare-fun m!545973 () Bool)

(assert (=> d!84205 m!545973))

(assert (=> d!84205 m!545803))

(assert (=> d!84205 m!545817))

(assert (=> d!84205 m!545809))

(declare-fun m!545975 () Bool)

(assert (=> d!84205 m!545975))

(declare-fun m!545977 () Bool)

(assert (=> d!84205 m!545977))

(declare-fun m!545979 () Bool)

(assert (=> d!84205 m!545979))

(declare-fun m!545981 () Bool)

(assert (=> b!567901 m!545981))

(assert (=> b!567902 m!545809))

(declare-fun m!545983 () Bool)

(assert (=> b!567902 m!545983))

(assert (=> b!567730 d!84205))

(declare-fun b!567912 () Bool)

(declare-fun e!326762 () Bool)

(declare-fun call!32525 () Bool)

(assert (=> b!567912 (= e!326762 call!32525)))

(declare-fun d!84207 () Bool)

(declare-fun res!358357 () Bool)

(declare-fun e!326760 () Bool)

(assert (=> d!84207 (=> res!358357 e!326760)))

(assert (=> d!84207 (= res!358357 (bvsge #b00000000000000000000000000000000 (size!17470 a!3118)))))

(assert (=> d!84207 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!326760)))

(declare-fun b!567913 () Bool)

(declare-fun e!326761 () Bool)

(assert (=> b!567913 (= e!326761 e!326762)))

(declare-fun lt!258614 () (_ BitVec 64))

(assert (=> b!567913 (= lt!258614 (select (arr!17105 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!258613 () Unit!17790)

(assert (=> b!567913 (= lt!258613 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258614 #b00000000000000000000000000000000))))

(assert (=> b!567913 (arrayContainsKey!0 a!3118 lt!258614 #b00000000000000000000000000000000)))

(declare-fun lt!258615 () Unit!17790)

(assert (=> b!567913 (= lt!258615 lt!258613)))

(declare-fun res!358356 () Bool)

(assert (=> b!567913 (= res!358356 (= (seekEntryOrOpen!0 (select (arr!17105 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5551 #b00000000000000000000000000000000)))))

(assert (=> b!567913 (=> (not res!358356) (not e!326762))))

(declare-fun b!567914 () Bool)

(assert (=> b!567914 (= e!326761 call!32525)))

(declare-fun bm!32522 () Bool)

(assert (=> bm!32522 (= call!32525 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!567915 () Bool)

(assert (=> b!567915 (= e!326760 e!326761)))

(declare-fun c!65131 () Bool)

(assert (=> b!567915 (= c!65131 (validKeyInArray!0 (select (arr!17105 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!84207 (not res!358357)) b!567915))

(assert (= (and b!567915 c!65131) b!567913))

(assert (= (and b!567915 (not c!65131)) b!567914))

(assert (= (and b!567913 res!358356) b!567912))

(assert (= (or b!567912 b!567914) bm!32522))

(assert (=> b!567913 m!545963))

(declare-fun m!545985 () Bool)

(assert (=> b!567913 m!545985))

(declare-fun m!545987 () Bool)

(assert (=> b!567913 m!545987))

(assert (=> b!567913 m!545963))

(declare-fun m!545989 () Bool)

(assert (=> b!567913 m!545989))

(declare-fun m!545991 () Bool)

(assert (=> bm!32522 m!545991))

(assert (=> b!567915 m!545963))

(assert (=> b!567915 m!545963))

(assert (=> b!567915 m!545965))

(assert (=> b!567721 d!84207))

(declare-fun b!567994 () Bool)

(declare-fun lt!258659 () SeekEntryResult!5551)

(assert (=> b!567994 (and (bvsge (index!24433 lt!258659) #b00000000000000000000000000000000) (bvslt (index!24433 lt!258659) (size!17470 (array!35621 (store (arr!17105 a!3118) i!1132 k0!1914) (size!17470 a!3118)))))))

(declare-fun e!326811 () Bool)

(assert (=> b!567994 (= e!326811 (= (select (arr!17105 (array!35621 (store (arr!17105 a!3118) i!1132 k0!1914) (size!17470 a!3118))) (index!24433 lt!258659)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326814 () SeekEntryResult!5551)

(declare-fun b!567995 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567995 (= e!326814 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258529 #b00000000000000000000000000000000 mask!3119) (select (store (arr!17105 a!3118) i!1132 k0!1914) j!142) (array!35621 (store (arr!17105 a!3118) i!1132 k0!1914) (size!17470 a!3118)) mask!3119))))

(declare-fun d!84209 () Bool)

(declare-fun e!326815 () Bool)

(assert (=> d!84209 e!326815))

(declare-fun c!65155 () Bool)

(assert (=> d!84209 (= c!65155 (and ((_ is Intermediate!5551) lt!258659) (undefined!6363 lt!258659)))))

(declare-fun e!326812 () SeekEntryResult!5551)

(assert (=> d!84209 (= lt!258659 e!326812)))

(declare-fun c!65156 () Bool)

(assert (=> d!84209 (= c!65156 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!258660 () (_ BitVec 64))

(assert (=> d!84209 (= lt!258660 (select (arr!17105 (array!35621 (store (arr!17105 a!3118) i!1132 k0!1914) (size!17470 a!3118))) lt!258529))))

(assert (=> d!84209 (validMask!0 mask!3119)))

(assert (=> d!84209 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258529 (select (store (arr!17105 a!3118) i!1132 k0!1914) j!142) (array!35621 (store (arr!17105 a!3118) i!1132 k0!1914) (size!17470 a!3118)) mask!3119) lt!258659)))

(declare-fun b!567996 () Bool)

(assert (=> b!567996 (= e!326814 (Intermediate!5551 false lt!258529 #b00000000000000000000000000000000))))

(declare-fun b!567997 () Bool)

(assert (=> b!567997 (= e!326815 (bvsge (x!53313 lt!258659) #b01111111111111111111111111111110))))

(declare-fun b!567998 () Bool)

(declare-fun e!326813 () Bool)

(assert (=> b!567998 (= e!326815 e!326813)))

(declare-fun res!358393 () Bool)

(assert (=> b!567998 (= res!358393 (and ((_ is Intermediate!5551) lt!258659) (not (undefined!6363 lt!258659)) (bvslt (x!53313 lt!258659) #b01111111111111111111111111111110) (bvsge (x!53313 lt!258659) #b00000000000000000000000000000000) (bvsge (x!53313 lt!258659) #b00000000000000000000000000000000)))))

(assert (=> b!567998 (=> (not res!358393) (not e!326813))))

(declare-fun b!567999 () Bool)

(assert (=> b!567999 (= e!326812 e!326814)))

(declare-fun c!65154 () Bool)

(assert (=> b!567999 (= c!65154 (or (= lt!258660 (select (store (arr!17105 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!258660 lt!258660) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!568000 () Bool)

(assert (=> b!568000 (= e!326812 (Intermediate!5551 true lt!258529 #b00000000000000000000000000000000))))

(declare-fun b!568001 () Bool)

(assert (=> b!568001 (and (bvsge (index!24433 lt!258659) #b00000000000000000000000000000000) (bvslt (index!24433 lt!258659) (size!17470 (array!35621 (store (arr!17105 a!3118) i!1132 k0!1914) (size!17470 a!3118)))))))

(declare-fun res!358392 () Bool)

(assert (=> b!568001 (= res!358392 (= (select (arr!17105 (array!35621 (store (arr!17105 a!3118) i!1132 k0!1914) (size!17470 a!3118))) (index!24433 lt!258659)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568001 (=> res!358392 e!326811)))

(declare-fun b!568002 () Bool)

(assert (=> b!568002 (and (bvsge (index!24433 lt!258659) #b00000000000000000000000000000000) (bvslt (index!24433 lt!258659) (size!17470 (array!35621 (store (arr!17105 a!3118) i!1132 k0!1914) (size!17470 a!3118)))))))

(declare-fun res!358394 () Bool)

(assert (=> b!568002 (= res!358394 (= (select (arr!17105 (array!35621 (store (arr!17105 a!3118) i!1132 k0!1914) (size!17470 a!3118))) (index!24433 lt!258659)) (select (store (arr!17105 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!568002 (=> res!358394 e!326811)))

(assert (=> b!568002 (= e!326813 e!326811)))

(assert (= (and d!84209 c!65156) b!568000))

(assert (= (and d!84209 (not c!65156)) b!567999))

(assert (= (and b!567999 c!65154) b!567996))

(assert (= (and b!567999 (not c!65154)) b!567995))

(assert (= (and d!84209 c!65155) b!567997))

(assert (= (and d!84209 (not c!65155)) b!567998))

(assert (= (and b!567998 res!358393) b!568002))

(assert (= (and b!568002 (not res!358394)) b!568001))

(assert (= (and b!568001 (not res!358392)) b!567994))

(declare-fun m!546041 () Bool)

(assert (=> d!84209 m!546041))

(assert (=> d!84209 m!545803))

(declare-fun m!546043 () Bool)

(assert (=> b!567995 m!546043))

(assert (=> b!567995 m!546043))

(assert (=> b!567995 m!545819))

(declare-fun m!546045 () Bool)

(assert (=> b!567995 m!546045))

(declare-fun m!546047 () Bool)

(assert (=> b!568002 m!546047))

(assert (=> b!568001 m!546047))

(assert (=> b!567994 m!546047))

(assert (=> b!567726 d!84209))

(declare-fun b!568003 () Bool)

(declare-fun lt!258664 () SeekEntryResult!5551)

(assert (=> b!568003 (and (bvsge (index!24433 lt!258664) #b00000000000000000000000000000000) (bvslt (index!24433 lt!258664) (size!17470 a!3118)))))

(declare-fun e!326816 () Bool)

(assert (=> b!568003 (= e!326816 (= (select (arr!17105 a!3118) (index!24433 lt!258664)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!568004 () Bool)

(declare-fun e!326819 () SeekEntryResult!5551)

(assert (=> b!568004 (= e!326819 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258531 #b00000000000000000000000000000000 mask!3119) (select (arr!17105 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!84237 () Bool)

(declare-fun e!326820 () Bool)

(assert (=> d!84237 e!326820))

(declare-fun c!65158 () Bool)

(assert (=> d!84237 (= c!65158 (and ((_ is Intermediate!5551) lt!258664) (undefined!6363 lt!258664)))))

(declare-fun e!326817 () SeekEntryResult!5551)

(assert (=> d!84237 (= lt!258664 e!326817)))

(declare-fun c!65159 () Bool)

(assert (=> d!84237 (= c!65159 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!258665 () (_ BitVec 64))

(assert (=> d!84237 (= lt!258665 (select (arr!17105 a!3118) lt!258531))))

(assert (=> d!84237 (validMask!0 mask!3119)))

(assert (=> d!84237 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258531 (select (arr!17105 a!3118) j!142) a!3118 mask!3119) lt!258664)))

(declare-fun b!568005 () Bool)

(assert (=> b!568005 (= e!326819 (Intermediate!5551 false lt!258531 #b00000000000000000000000000000000))))

(declare-fun b!568006 () Bool)

(assert (=> b!568006 (= e!326820 (bvsge (x!53313 lt!258664) #b01111111111111111111111111111110))))

(declare-fun b!568007 () Bool)

(declare-fun e!326818 () Bool)

(assert (=> b!568007 (= e!326820 e!326818)))

(declare-fun res!358396 () Bool)

(assert (=> b!568007 (= res!358396 (and ((_ is Intermediate!5551) lt!258664) (not (undefined!6363 lt!258664)) (bvslt (x!53313 lt!258664) #b01111111111111111111111111111110) (bvsge (x!53313 lt!258664) #b00000000000000000000000000000000) (bvsge (x!53313 lt!258664) #b00000000000000000000000000000000)))))

(assert (=> b!568007 (=> (not res!358396) (not e!326818))))

(declare-fun b!568008 () Bool)

(assert (=> b!568008 (= e!326817 e!326819)))

(declare-fun c!65157 () Bool)

(assert (=> b!568008 (= c!65157 (or (= lt!258665 (select (arr!17105 a!3118) j!142)) (= (bvadd lt!258665 lt!258665) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!568009 () Bool)

(assert (=> b!568009 (= e!326817 (Intermediate!5551 true lt!258531 #b00000000000000000000000000000000))))

(declare-fun b!568010 () Bool)

(assert (=> b!568010 (and (bvsge (index!24433 lt!258664) #b00000000000000000000000000000000) (bvslt (index!24433 lt!258664) (size!17470 a!3118)))))

(declare-fun res!358395 () Bool)

(assert (=> b!568010 (= res!358395 (= (select (arr!17105 a!3118) (index!24433 lt!258664)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568010 (=> res!358395 e!326816)))

(declare-fun b!568011 () Bool)

(assert (=> b!568011 (and (bvsge (index!24433 lt!258664) #b00000000000000000000000000000000) (bvslt (index!24433 lt!258664) (size!17470 a!3118)))))

(declare-fun res!358397 () Bool)

(assert (=> b!568011 (= res!358397 (= (select (arr!17105 a!3118) (index!24433 lt!258664)) (select (arr!17105 a!3118) j!142)))))

(assert (=> b!568011 (=> res!358397 e!326816)))

(assert (=> b!568011 (= e!326818 e!326816)))

(assert (= (and d!84237 c!65159) b!568009))

(assert (= (and d!84237 (not c!65159)) b!568008))

(assert (= (and b!568008 c!65157) b!568005))

(assert (= (and b!568008 (not c!65157)) b!568004))

(assert (= (and d!84237 c!65158) b!568006))

(assert (= (and d!84237 (not c!65158)) b!568007))

(assert (= (and b!568007 res!358396) b!568011))

(assert (= (and b!568011 (not res!358397)) b!568010))

(assert (= (and b!568010 (not res!358395)) b!568003))

(declare-fun m!546051 () Bool)

(assert (=> d!84237 m!546051))

(assert (=> d!84237 m!545803))

(declare-fun m!546053 () Bool)

(assert (=> b!568004 m!546053))

(assert (=> b!568004 m!546053))

(assert (=> b!568004 m!545809))

(declare-fun m!546055 () Bool)

(assert (=> b!568004 m!546055))

(declare-fun m!546057 () Bool)

(assert (=> b!568011 m!546057))

(assert (=> b!568010 m!546057))

(assert (=> b!568003 m!546057))

(assert (=> b!567726 d!84237))

(declare-fun d!84241 () Bool)

(declare-fun lt!258671 () (_ BitVec 32))

(declare-fun lt!258670 () (_ BitVec 32))

(assert (=> d!84241 (= lt!258671 (bvmul (bvxor lt!258670 (bvlshr lt!258670 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84241 (= lt!258670 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17105 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17105 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84241 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358398 (let ((h!12240 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17105 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17105 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53321 (bvmul (bvxor h!12240 (bvlshr h!12240 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53321 (bvlshr x!53321 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358398 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358398 #b00000000000000000000000000000000))))))

(assert (=> d!84241 (= (toIndex!0 (select (store (arr!17105 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!258671 (bvlshr lt!258671 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!567726 d!84241))

(declare-fun d!84243 () Bool)

(declare-fun lt!258673 () (_ BitVec 32))

(declare-fun lt!258672 () (_ BitVec 32))

(assert (=> d!84243 (= lt!258673 (bvmul (bvxor lt!258672 (bvlshr lt!258672 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84243 (= lt!258672 ((_ extract 31 0) (bvand (bvxor (select (arr!17105 a!3118) j!142) (bvlshr (select (arr!17105 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84243 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358398 (let ((h!12240 ((_ extract 31 0) (bvand (bvxor (select (arr!17105 a!3118) j!142) (bvlshr (select (arr!17105 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53321 (bvmul (bvxor h!12240 (bvlshr h!12240 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53321 (bvlshr x!53321 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358398 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358398 #b00000000000000000000000000000000))))))

(assert (=> d!84243 (= (toIndex!0 (select (arr!17105 a!3118) j!142) mask!3119) (bvand (bvxor lt!258673 (bvlshr lt!258673 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!567726 d!84243))

(declare-fun d!84245 () Bool)

(assert (=> d!84245 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51974 d!84245))

(declare-fun d!84253 () Bool)

(assert (=> d!84253 (= (array_inv!12988 a!3118) (bvsge (size!17470 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51974 d!84253))

(check-sat (not b!567913) (not b!567802) (not b!567902) (not bm!32521) (not b!567915) (not b!567870) (not bm!32515) (not d!84183) (not b!567869) (not b!567849) (not b!567800) (not d!84237) (not d!84209) (not b!568004) (not b!567897) (not b!567995) (not b!567873) (not bm!32522) (not d!84205) (not d!84189))
(check-sat)
