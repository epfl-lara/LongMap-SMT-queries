; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49826 () Bool)

(assert start!49826)

(declare-fun b!547249 () Bool)

(declare-fun res!340858 () Bool)

(declare-fun e!316230 () Bool)

(assert (=> b!547249 (=> (not res!340858) (not e!316230))))

(declare-datatypes ((array!34510 0))(
  ( (array!34511 (arr!16579 (Array (_ BitVec 32) (_ BitVec 64))) (size!16943 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34510)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547249 (= res!340858 (validKeyInArray!0 (select (arr!16579 a!3118) j!142)))))

(declare-fun b!547250 () Bool)

(declare-fun e!316228 () Bool)

(assert (=> b!547250 (= e!316228 (and (bvsle #b00000000000000000000000000000000 (size!16943 a!3118)) (bvsge (size!16943 a!3118) #b01111111111111111111111111111111)))))

(declare-fun b!547251 () Bool)

(declare-fun res!340864 () Bool)

(assert (=> b!547251 (=> (not res!340864) (not e!316230))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34510 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547251 (= res!340864 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!340862 () Bool)

(assert (=> start!49826 (=> (not res!340862) (not e!316230))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49826 (= res!340862 (validMask!0 mask!3119))))

(assert (=> start!49826 e!316230))

(assert (=> start!49826 true))

(declare-fun array_inv!12438 (array!34510) Bool)

(assert (=> start!49826 (array_inv!12438 a!3118)))

(declare-fun b!547252 () Bool)

(assert (=> b!547252 (= e!316230 e!316228)))

(declare-fun res!340863 () Bool)

(assert (=> b!547252 (=> (not res!340863) (not e!316228))))

(declare-datatypes ((SeekEntryResult!4984 0))(
  ( (MissingZero!4984 (index!22163 (_ BitVec 32))) (Found!4984 (index!22164 (_ BitVec 32))) (Intermediate!4984 (undefined!5796 Bool) (index!22165 (_ BitVec 32)) (x!51263 (_ BitVec 32))) (Undefined!4984) (MissingVacant!4984 (index!22166 (_ BitVec 32))) )
))
(declare-fun lt!249523 () SeekEntryResult!4984)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547252 (= res!340863 (or (= lt!249523 (MissingZero!4984 i!1132)) (= lt!249523 (MissingVacant!4984 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34510 (_ BitVec 32)) SeekEntryResult!4984)

(assert (=> b!547252 (= lt!249523 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!547253 () Bool)

(declare-fun res!340860 () Bool)

(assert (=> b!547253 (=> (not res!340860) (not e!316228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34510 (_ BitVec 32)) Bool)

(assert (=> b!547253 (= res!340860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!547254 () Bool)

(declare-fun res!340861 () Bool)

(assert (=> b!547254 (=> (not res!340861) (not e!316230))))

(assert (=> b!547254 (= res!340861 (validKeyInArray!0 k0!1914))))

(declare-fun b!547255 () Bool)

(declare-fun res!340859 () Bool)

(assert (=> b!547255 (=> (not res!340859) (not e!316230))))

(assert (=> b!547255 (= res!340859 (and (= (size!16943 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16943 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16943 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!49826 res!340862) b!547255))

(assert (= (and b!547255 res!340859) b!547249))

(assert (= (and b!547249 res!340858) b!547254))

(assert (= (and b!547254 res!340861) b!547251))

(assert (= (and b!547251 res!340864) b!547252))

(assert (= (and b!547252 res!340863) b!547253))

(assert (= (and b!547253 res!340860) b!547250))

(declare-fun m!524761 () Bool)

(assert (=> b!547251 m!524761))

(declare-fun m!524763 () Bool)

(assert (=> b!547249 m!524763))

(assert (=> b!547249 m!524763))

(declare-fun m!524765 () Bool)

(assert (=> b!547249 m!524765))

(declare-fun m!524767 () Bool)

(assert (=> b!547254 m!524767))

(declare-fun m!524769 () Bool)

(assert (=> start!49826 m!524769))

(declare-fun m!524771 () Bool)

(assert (=> start!49826 m!524771))

(declare-fun m!524773 () Bool)

(assert (=> b!547252 m!524773))

(declare-fun m!524775 () Bool)

(assert (=> b!547253 m!524775))

(check-sat (not b!547253) (not b!547251) (not b!547254) (not b!547252) (not b!547249) (not start!49826))
(check-sat)
(get-model)

(declare-fun d!82509 () Bool)

(assert (=> d!82509 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547254 d!82509))

(declare-fun d!82511 () Bool)

(assert (=> d!82511 (= (validKeyInArray!0 (select (arr!16579 a!3118) j!142)) (and (not (= (select (arr!16579 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16579 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!547249 d!82511))

(declare-fun d!82513 () Bool)

(assert (=> d!82513 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!49826 d!82513))

(declare-fun d!82523 () Bool)

(assert (=> d!82523 (= (array_inv!12438 a!3118) (bvsge (size!16943 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!49826 d!82523))

(declare-fun d!82525 () Bool)

(declare-fun res!340911 () Bool)

(declare-fun e!316253 () Bool)

(assert (=> d!82525 (=> res!340911 e!316253)))

(assert (=> d!82525 (= res!340911 (= (select (arr!16579 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!82525 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!316253)))

(declare-fun b!547302 () Bool)

(declare-fun e!316254 () Bool)

(assert (=> b!547302 (= e!316253 e!316254)))

(declare-fun res!340912 () Bool)

(assert (=> b!547302 (=> (not res!340912) (not e!316254))))

(assert (=> b!547302 (= res!340912 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16943 a!3118)))))

(declare-fun b!547303 () Bool)

(assert (=> b!547303 (= e!316254 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82525 (not res!340911)) b!547302))

(assert (= (and b!547302 res!340912) b!547303))

(declare-fun m!524809 () Bool)

(assert (=> d!82525 m!524809))

(declare-fun m!524811 () Bool)

(assert (=> b!547303 m!524811))

(assert (=> b!547251 d!82525))

(declare-fun b!547334 () Bool)

(declare-fun e!316276 () SeekEntryResult!4984)

(declare-fun lt!249546 () SeekEntryResult!4984)

(assert (=> b!547334 (= e!316276 (MissingZero!4984 (index!22165 lt!249546)))))

(declare-fun d!82527 () Bool)

(declare-fun lt!249547 () SeekEntryResult!4984)

(get-info :version)

(assert (=> d!82527 (and (or ((_ is Undefined!4984) lt!249547) (not ((_ is Found!4984) lt!249547)) (and (bvsge (index!22164 lt!249547) #b00000000000000000000000000000000) (bvslt (index!22164 lt!249547) (size!16943 a!3118)))) (or ((_ is Undefined!4984) lt!249547) ((_ is Found!4984) lt!249547) (not ((_ is MissingZero!4984) lt!249547)) (and (bvsge (index!22163 lt!249547) #b00000000000000000000000000000000) (bvslt (index!22163 lt!249547) (size!16943 a!3118)))) (or ((_ is Undefined!4984) lt!249547) ((_ is Found!4984) lt!249547) ((_ is MissingZero!4984) lt!249547) (not ((_ is MissingVacant!4984) lt!249547)) (and (bvsge (index!22166 lt!249547) #b00000000000000000000000000000000) (bvslt (index!22166 lt!249547) (size!16943 a!3118)))) (or ((_ is Undefined!4984) lt!249547) (ite ((_ is Found!4984) lt!249547) (= (select (arr!16579 a!3118) (index!22164 lt!249547)) k0!1914) (ite ((_ is MissingZero!4984) lt!249547) (= (select (arr!16579 a!3118) (index!22163 lt!249547)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4984) lt!249547) (= (select (arr!16579 a!3118) (index!22166 lt!249547)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!316278 () SeekEntryResult!4984)

(assert (=> d!82527 (= lt!249547 e!316278)))

(declare-fun c!63535 () Bool)

(assert (=> d!82527 (= c!63535 (and ((_ is Intermediate!4984) lt!249546) (undefined!5796 lt!249546)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34510 (_ BitVec 32)) SeekEntryResult!4984)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!82527 (= lt!249546 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!82527 (validMask!0 mask!3119)))

(assert (=> d!82527 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!249547)))

(declare-fun b!547335 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34510 (_ BitVec 32)) SeekEntryResult!4984)

(assert (=> b!547335 (= e!316276 (seekKeyOrZeroReturnVacant!0 (x!51263 lt!249546) (index!22165 lt!249546) (index!22165 lt!249546) k0!1914 a!3118 mask!3119))))

(declare-fun b!547336 () Bool)

(assert (=> b!547336 (= e!316278 Undefined!4984)))

(declare-fun b!547337 () Bool)

(declare-fun e!316277 () SeekEntryResult!4984)

(assert (=> b!547337 (= e!316278 e!316277)))

(declare-fun lt!249545 () (_ BitVec 64))

(assert (=> b!547337 (= lt!249545 (select (arr!16579 a!3118) (index!22165 lt!249546)))))

(declare-fun c!63534 () Bool)

(assert (=> b!547337 (= c!63534 (= lt!249545 k0!1914))))

(declare-fun b!547338 () Bool)

(declare-fun c!63536 () Bool)

(assert (=> b!547338 (= c!63536 (= lt!249545 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!547338 (= e!316277 e!316276)))

(declare-fun b!547339 () Bool)

(assert (=> b!547339 (= e!316277 (Found!4984 (index!22165 lt!249546)))))

(assert (= (and d!82527 c!63535) b!547336))

(assert (= (and d!82527 (not c!63535)) b!547337))

(assert (= (and b!547337 c!63534) b!547339))

(assert (= (and b!547337 (not c!63534)) b!547338))

(assert (= (and b!547338 c!63536) b!547334))

(assert (= (and b!547338 (not c!63536)) b!547335))

(declare-fun m!524827 () Bool)

(assert (=> d!82527 m!524827))

(declare-fun m!524829 () Bool)

(assert (=> d!82527 m!524829))

(declare-fun m!524831 () Bool)

(assert (=> d!82527 m!524831))

(assert (=> d!82527 m!524769))

(declare-fun m!524833 () Bool)

(assert (=> d!82527 m!524833))

(assert (=> d!82527 m!524829))

(declare-fun m!524835 () Bool)

(assert (=> d!82527 m!524835))

(declare-fun m!524837 () Bool)

(assert (=> b!547335 m!524837))

(declare-fun m!524839 () Bool)

(assert (=> b!547337 m!524839))

(assert (=> b!547252 d!82527))

(declare-fun b!547390 () Bool)

(declare-fun e!316310 () Bool)

(declare-fun call!32157 () Bool)

(assert (=> b!547390 (= e!316310 call!32157)))

(declare-fun bm!32154 () Bool)

(assert (=> bm!32154 (= call!32157 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!547391 () Bool)

(declare-fun e!316309 () Bool)

(assert (=> b!547391 (= e!316310 e!316309)))

(declare-fun lt!249574 () (_ BitVec 64))

(assert (=> b!547391 (= lt!249574 (select (arr!16579 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16925 0))(
  ( (Unit!16926) )
))
(declare-fun lt!249573 () Unit!16925)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34510 (_ BitVec 64) (_ BitVec 32)) Unit!16925)

(assert (=> b!547391 (= lt!249573 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!249574 #b00000000000000000000000000000000))))

(assert (=> b!547391 (arrayContainsKey!0 a!3118 lt!249574 #b00000000000000000000000000000000)))

(declare-fun lt!249572 () Unit!16925)

(assert (=> b!547391 (= lt!249572 lt!249573)))

(declare-fun res!340935 () Bool)

(assert (=> b!547391 (= res!340935 (= (seekEntryOrOpen!0 (select (arr!16579 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!4984 #b00000000000000000000000000000000)))))

(assert (=> b!547391 (=> (not res!340935) (not e!316309))))

(declare-fun b!547392 () Bool)

(assert (=> b!547392 (= e!316309 call!32157)))

(declare-fun d!82537 () Bool)

(declare-fun res!340936 () Bool)

(declare-fun e!316311 () Bool)

(assert (=> d!82537 (=> res!340936 e!316311)))

(assert (=> d!82537 (= res!340936 (bvsge #b00000000000000000000000000000000 (size!16943 a!3118)))))

(assert (=> d!82537 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!316311)))

(declare-fun b!547393 () Bool)

(assert (=> b!547393 (= e!316311 e!316310)))

(declare-fun c!63557 () Bool)

(assert (=> b!547393 (= c!63557 (validKeyInArray!0 (select (arr!16579 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!82537 (not res!340936)) b!547393))

(assert (= (and b!547393 c!63557) b!547391))

(assert (= (and b!547393 (not c!63557)) b!547390))

(assert (= (and b!547391 res!340935) b!547392))

(assert (= (or b!547392 b!547390) bm!32154))

(declare-fun m!524873 () Bool)

(assert (=> bm!32154 m!524873))

(assert (=> b!547391 m!524809))

(declare-fun m!524875 () Bool)

(assert (=> b!547391 m!524875))

(declare-fun m!524877 () Bool)

(assert (=> b!547391 m!524877))

(assert (=> b!547391 m!524809))

(declare-fun m!524879 () Bool)

(assert (=> b!547391 m!524879))

(assert (=> b!547393 m!524809))

(assert (=> b!547393 m!524809))

(declare-fun m!524881 () Bool)

(assert (=> b!547393 m!524881))

(assert (=> b!547253 d!82537))

(check-sat (not b!547335) (not d!82527) (not bm!32154) (not b!547303) (not b!547391) (not b!547393))
(check-sat)
