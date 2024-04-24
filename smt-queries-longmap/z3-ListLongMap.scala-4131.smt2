; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56382 () Bool)

(assert start!56382)

(declare-fun b!624856 () Bool)

(declare-fun res!402910 () Bool)

(declare-fun e!358288 () Bool)

(assert (=> b!624856 (=> (not res!402910) (not e!358288))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37752 0))(
  ( (array!37753 (arr!18118 (Array (_ BitVec 32) (_ BitVec 64))) (size!18482 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37752)

(assert (=> b!624856 (= res!402910 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18118 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!18118 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!624858 () Bool)

(declare-fun res!402907 () Bool)

(declare-fun e!358289 () Bool)

(assert (=> b!624858 (=> (not res!402907) (not e!358289))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!624858 (= res!402907 (and (= (size!18482 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18482 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18482 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!624859 () Bool)

(declare-fun res!402906 () Bool)

(assert (=> b!624859 (=> (not res!402906) (not e!358289))))

(declare-fun arrayContainsKey!0 (array!37752 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!624859 (= res!402906 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!624860 () Bool)

(declare-fun res!402905 () Bool)

(assert (=> b!624860 (=> (not res!402905) (not e!358289))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!624860 (= res!402905 (validKeyInArray!0 (select (arr!18118 a!2986) j!136)))))

(declare-fun b!624861 () Bool)

(declare-fun res!402904 () Bool)

(assert (=> b!624861 (=> (not res!402904) (not e!358288))))

(declare-datatypes ((List!12066 0))(
  ( (Nil!12063) (Cons!12062 (h!13110 (_ BitVec 64)) (t!18286 List!12066)) )
))
(declare-fun arrayNoDuplicates!0 (array!37752 (_ BitVec 32) List!12066) Bool)

(assert (=> b!624861 (= res!402904 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12063))))

(declare-fun b!624862 () Bool)

(declare-fun res!402909 () Bool)

(assert (=> b!624862 (=> (not res!402909) (not e!358289))))

(assert (=> b!624862 (= res!402909 (validKeyInArray!0 k0!1786))))

(declare-fun b!624863 () Bool)

(declare-fun res!402908 () Bool)

(assert (=> b!624863 (=> (not res!402908) (not e!358288))))

(declare-datatypes ((SeekEntryResult!6514 0))(
  ( (MissingZero!6514 (index!28340 (_ BitVec 32))) (Found!6514 (index!28341 (_ BitVec 32))) (Intermediate!6514 (undefined!7326 Bool) (index!28342 (_ BitVec 32)) (x!57248 (_ BitVec 32))) (Undefined!6514) (MissingVacant!6514 (index!28343 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37752 (_ BitVec 32)) SeekEntryResult!6514)

(assert (=> b!624863 (= res!402908 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18118 a!2986) j!136) a!2986 mask!3053) (Found!6514 j!136)))))

(declare-fun b!624857 () Bool)

(declare-fun res!402901 () Bool)

(assert (=> b!624857 (=> (not res!402901) (not e!358288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37752 (_ BitVec 32)) Bool)

(assert (=> b!624857 (= res!402901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun res!402903 () Bool)

(assert (=> start!56382 (=> (not res!402903) (not e!358289))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56382 (= res!402903 (validMask!0 mask!3053))))

(assert (=> start!56382 e!358289))

(assert (=> start!56382 true))

(declare-fun array_inv!13977 (array!37752) Bool)

(assert (=> start!56382 (array_inv!13977 a!2986)))

(declare-fun b!624864 () Bool)

(assert (=> b!624864 (= e!358289 e!358288)))

(declare-fun res!402902 () Bool)

(assert (=> b!624864 (=> (not res!402902) (not e!358288))))

(declare-fun lt!289744 () SeekEntryResult!6514)

(assert (=> b!624864 (= res!402902 (or (= lt!289744 (MissingZero!6514 i!1108)) (= lt!289744 (MissingVacant!6514 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37752 (_ BitVec 32)) SeekEntryResult!6514)

(assert (=> b!624864 (= lt!289744 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!624865 () Bool)

(assert (=> b!624865 (= e!358288 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (= (and start!56382 res!402903) b!624858))

(assert (= (and b!624858 res!402907) b!624860))

(assert (= (and b!624860 res!402905) b!624862))

(assert (= (and b!624862 res!402909) b!624859))

(assert (= (and b!624859 res!402906) b!624864))

(assert (= (and b!624864 res!402902) b!624857))

(assert (= (and b!624857 res!402901) b!624861))

(assert (= (and b!624861 res!402904) b!624856))

(assert (= (and b!624856 res!402910) b!624863))

(assert (= (and b!624863 res!402908) b!624865))

(declare-fun m!600817 () Bool)

(assert (=> b!624862 m!600817))

(declare-fun m!600819 () Bool)

(assert (=> b!624861 m!600819))

(declare-fun m!600821 () Bool)

(assert (=> b!624864 m!600821))

(declare-fun m!600823 () Bool)

(assert (=> b!624859 m!600823))

(declare-fun m!600825 () Bool)

(assert (=> start!56382 m!600825))

(declare-fun m!600827 () Bool)

(assert (=> start!56382 m!600827))

(declare-fun m!600829 () Bool)

(assert (=> b!624857 m!600829))

(declare-fun m!600831 () Bool)

(assert (=> b!624860 m!600831))

(assert (=> b!624860 m!600831))

(declare-fun m!600833 () Bool)

(assert (=> b!624860 m!600833))

(declare-fun m!600835 () Bool)

(assert (=> b!624856 m!600835))

(declare-fun m!600837 () Bool)

(assert (=> b!624856 m!600837))

(declare-fun m!600839 () Bool)

(assert (=> b!624856 m!600839))

(assert (=> b!624863 m!600831))

(assert (=> b!624863 m!600831))

(declare-fun m!600841 () Bool)

(assert (=> b!624863 m!600841))

(check-sat (not b!624862) (not b!624864) (not b!624860) (not b!624859) (not b!624857) (not b!624861) (not b!624863) (not start!56382))
(check-sat)
(get-model)

(declare-fun d!88869 () Bool)

(assert (=> d!88869 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!624862 d!88869))

(declare-fun b!624936 () Bool)

(declare-fun e!358317 () Bool)

(declare-fun e!358319 () Bool)

(assert (=> b!624936 (= e!358317 e!358319)))

(declare-fun c!71348 () Bool)

(assert (=> b!624936 (= c!71348 (validKeyInArray!0 (select (arr!18118 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!624937 () Bool)

(declare-fun call!33207 () Bool)

(assert (=> b!624937 (= e!358319 call!33207)))

(declare-fun b!624938 () Bool)

(assert (=> b!624938 (= e!358319 call!33207)))

(declare-fun bm!33204 () Bool)

(assert (=> bm!33204 (= call!33207 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!71348 (Cons!12062 (select (arr!18118 a!2986) #b00000000000000000000000000000000) Nil!12063) Nil!12063)))))

(declare-fun d!88871 () Bool)

(declare-fun res!402978 () Bool)

(declare-fun e!358320 () Bool)

(assert (=> d!88871 (=> res!402978 e!358320)))

(assert (=> d!88871 (= res!402978 (bvsge #b00000000000000000000000000000000 (size!18482 a!2986)))))

(assert (=> d!88871 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12063) e!358320)))

(declare-fun b!624939 () Bool)

(assert (=> b!624939 (= e!358320 e!358317)))

(declare-fun res!402977 () Bool)

(assert (=> b!624939 (=> (not res!402977) (not e!358317))))

(declare-fun e!358318 () Bool)

(assert (=> b!624939 (= res!402977 (not e!358318))))

(declare-fun res!402979 () Bool)

(assert (=> b!624939 (=> (not res!402979) (not e!358318))))

(assert (=> b!624939 (= res!402979 (validKeyInArray!0 (select (arr!18118 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!624940 () Bool)

(declare-fun contains!3049 (List!12066 (_ BitVec 64)) Bool)

(assert (=> b!624940 (= e!358318 (contains!3049 Nil!12063 (select (arr!18118 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!88871 (not res!402978)) b!624939))

(assert (= (and b!624939 res!402979) b!624940))

(assert (= (and b!624939 res!402977) b!624936))

(assert (= (and b!624936 c!71348) b!624938))

(assert (= (and b!624936 (not c!71348)) b!624937))

(assert (= (or b!624938 b!624937) bm!33204))

(declare-fun m!600895 () Bool)

(assert (=> b!624936 m!600895))

(assert (=> b!624936 m!600895))

(declare-fun m!600897 () Bool)

(assert (=> b!624936 m!600897))

(assert (=> bm!33204 m!600895))

(declare-fun m!600899 () Bool)

(assert (=> bm!33204 m!600899))

(assert (=> b!624939 m!600895))

(assert (=> b!624939 m!600895))

(assert (=> b!624939 m!600897))

(assert (=> b!624940 m!600895))

(assert (=> b!624940 m!600895))

(declare-fun m!600901 () Bool)

(assert (=> b!624940 m!600901))

(assert (=> b!624861 d!88871))

(declare-fun d!88873 () Bool)

(assert (=> d!88873 (= (validKeyInArray!0 (select (arr!18118 a!2986) j!136)) (and (not (= (select (arr!18118 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18118 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!624860 d!88873))

(declare-fun d!88875 () Bool)

(declare-fun res!402984 () Bool)

(declare-fun e!358325 () Bool)

(assert (=> d!88875 (=> res!402984 e!358325)))

(assert (=> d!88875 (= res!402984 (= (select (arr!18118 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!88875 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!358325)))

(declare-fun b!624945 () Bool)

(declare-fun e!358326 () Bool)

(assert (=> b!624945 (= e!358325 e!358326)))

(declare-fun res!402985 () Bool)

(assert (=> b!624945 (=> (not res!402985) (not e!358326))))

(assert (=> b!624945 (= res!402985 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18482 a!2986)))))

(declare-fun b!624946 () Bool)

(assert (=> b!624946 (= e!358326 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!88875 (not res!402984)) b!624945))

(assert (= (and b!624945 res!402985) b!624946))

(assert (=> d!88875 m!600895))

(declare-fun m!600903 () Bool)

(assert (=> b!624946 m!600903))

(assert (=> b!624859 d!88875))

(declare-fun b!624979 () Bool)

(declare-fun c!71362 () Bool)

(declare-fun lt!289774 () (_ BitVec 64))

(assert (=> b!624979 (= c!71362 (= lt!289774 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!358349 () SeekEntryResult!6514)

(declare-fun e!358350 () SeekEntryResult!6514)

(assert (=> b!624979 (= e!358349 e!358350)))

(declare-fun b!624980 () Bool)

(declare-fun e!358348 () SeekEntryResult!6514)

(assert (=> b!624980 (= e!358348 e!358349)))

(declare-fun lt!289773 () SeekEntryResult!6514)

(assert (=> b!624980 (= lt!289774 (select (arr!18118 a!2986) (index!28342 lt!289773)))))

(declare-fun c!71361 () Bool)

(assert (=> b!624980 (= c!71361 (= lt!289774 k0!1786))))

(declare-fun b!624981 () Bool)

(assert (=> b!624981 (= e!358350 (seekKeyOrZeroReturnVacant!0 (x!57248 lt!289773) (index!28342 lt!289773) (index!28342 lt!289773) k0!1786 a!2986 mask!3053))))

(declare-fun d!88877 () Bool)

(declare-fun lt!289772 () SeekEntryResult!6514)

(get-info :version)

(assert (=> d!88877 (and (or ((_ is Undefined!6514) lt!289772) (not ((_ is Found!6514) lt!289772)) (and (bvsge (index!28341 lt!289772) #b00000000000000000000000000000000) (bvslt (index!28341 lt!289772) (size!18482 a!2986)))) (or ((_ is Undefined!6514) lt!289772) ((_ is Found!6514) lt!289772) (not ((_ is MissingZero!6514) lt!289772)) (and (bvsge (index!28340 lt!289772) #b00000000000000000000000000000000) (bvslt (index!28340 lt!289772) (size!18482 a!2986)))) (or ((_ is Undefined!6514) lt!289772) ((_ is Found!6514) lt!289772) ((_ is MissingZero!6514) lt!289772) (not ((_ is MissingVacant!6514) lt!289772)) (and (bvsge (index!28343 lt!289772) #b00000000000000000000000000000000) (bvslt (index!28343 lt!289772) (size!18482 a!2986)))) (or ((_ is Undefined!6514) lt!289772) (ite ((_ is Found!6514) lt!289772) (= (select (arr!18118 a!2986) (index!28341 lt!289772)) k0!1786) (ite ((_ is MissingZero!6514) lt!289772) (= (select (arr!18118 a!2986) (index!28340 lt!289772)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6514) lt!289772) (= (select (arr!18118 a!2986) (index!28343 lt!289772)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!88877 (= lt!289772 e!358348)))

(declare-fun c!71360 () Bool)

(assert (=> d!88877 (= c!71360 (and ((_ is Intermediate!6514) lt!289773) (undefined!7326 lt!289773)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37752 (_ BitVec 32)) SeekEntryResult!6514)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!88877 (= lt!289773 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!88877 (validMask!0 mask!3053)))

(assert (=> d!88877 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!289772)))

(declare-fun b!624982 () Bool)

(assert (=> b!624982 (= e!358349 (Found!6514 (index!28342 lt!289773)))))

(declare-fun b!624983 () Bool)

(assert (=> b!624983 (= e!358350 (MissingZero!6514 (index!28342 lt!289773)))))

(declare-fun b!624984 () Bool)

(assert (=> b!624984 (= e!358348 Undefined!6514)))

(assert (= (and d!88877 c!71360) b!624984))

(assert (= (and d!88877 (not c!71360)) b!624980))

(assert (= (and b!624980 c!71361) b!624982))

(assert (= (and b!624980 (not c!71361)) b!624979))

(assert (= (and b!624979 c!71362) b!624983))

(assert (= (and b!624979 (not c!71362)) b!624981))

(declare-fun m!600919 () Bool)

(assert (=> b!624980 m!600919))

(declare-fun m!600923 () Bool)

(assert (=> b!624981 m!600923))

(declare-fun m!600929 () Bool)

(assert (=> d!88877 m!600929))

(declare-fun m!600931 () Bool)

(assert (=> d!88877 m!600931))

(assert (=> d!88877 m!600825))

(declare-fun m!600937 () Bool)

(assert (=> d!88877 m!600937))

(declare-fun m!600939 () Bool)

(assert (=> d!88877 m!600939))

(declare-fun m!600941 () Bool)

(assert (=> d!88877 m!600941))

(assert (=> d!88877 m!600937))

(assert (=> b!624864 d!88877))

(declare-fun b!625011 () Bool)

(declare-fun e!358368 () SeekEntryResult!6514)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!625011 (= e!358368 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18118 a!2986) j!136) a!2986 mask!3053))))

(declare-fun d!88889 () Bool)

(declare-fun lt!289782 () SeekEntryResult!6514)

(assert (=> d!88889 (and (or ((_ is Undefined!6514) lt!289782) (not ((_ is Found!6514) lt!289782)) (and (bvsge (index!28341 lt!289782) #b00000000000000000000000000000000) (bvslt (index!28341 lt!289782) (size!18482 a!2986)))) (or ((_ is Undefined!6514) lt!289782) ((_ is Found!6514) lt!289782) (not ((_ is MissingVacant!6514) lt!289782)) (not (= (index!28343 lt!289782) vacantSpotIndex!68)) (and (bvsge (index!28343 lt!289782) #b00000000000000000000000000000000) (bvslt (index!28343 lt!289782) (size!18482 a!2986)))) (or ((_ is Undefined!6514) lt!289782) (ite ((_ is Found!6514) lt!289782) (= (select (arr!18118 a!2986) (index!28341 lt!289782)) (select (arr!18118 a!2986) j!136)) (and ((_ is MissingVacant!6514) lt!289782) (= (index!28343 lt!289782) vacantSpotIndex!68) (= (select (arr!18118 a!2986) (index!28343 lt!289782)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!358369 () SeekEntryResult!6514)

(assert (=> d!88889 (= lt!289782 e!358369)))

(declare-fun c!71372 () Bool)

(assert (=> d!88889 (= c!71372 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!289783 () (_ BitVec 64))

(assert (=> d!88889 (= lt!289783 (select (arr!18118 a!2986) index!984))))

(assert (=> d!88889 (validMask!0 mask!3053)))

(assert (=> d!88889 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18118 a!2986) j!136) a!2986 mask!3053) lt!289782)))

(declare-fun b!625012 () Bool)

(declare-fun c!71373 () Bool)

(assert (=> b!625012 (= c!71373 (= lt!289783 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!358370 () SeekEntryResult!6514)

(assert (=> b!625012 (= e!358370 e!358368)))

(declare-fun b!625013 () Bool)

(assert (=> b!625013 (= e!358368 (MissingVacant!6514 vacantSpotIndex!68))))

(declare-fun b!625014 () Bool)

(assert (=> b!625014 (= e!358370 (Found!6514 index!984))))

(declare-fun b!625015 () Bool)

(assert (=> b!625015 (= e!358369 e!358370)))

(declare-fun c!71374 () Bool)

(assert (=> b!625015 (= c!71374 (= lt!289783 (select (arr!18118 a!2986) j!136)))))

(declare-fun b!625016 () Bool)

(assert (=> b!625016 (= e!358369 Undefined!6514)))

(assert (= (and d!88889 c!71372) b!625016))

(assert (= (and d!88889 (not c!71372)) b!625015))

(assert (= (and b!625015 c!71374) b!625014))

(assert (= (and b!625015 (not c!71374)) b!625012))

(assert (= (and b!625012 c!71373) b!625013))

(assert (= (and b!625012 (not c!71373)) b!625011))

(declare-fun m!600943 () Bool)

(assert (=> b!625011 m!600943))

(assert (=> b!625011 m!600943))

(assert (=> b!625011 m!600831))

(declare-fun m!600945 () Bool)

(assert (=> b!625011 m!600945))

(declare-fun m!600947 () Bool)

(assert (=> d!88889 m!600947))

(declare-fun m!600949 () Bool)

(assert (=> d!88889 m!600949))

(declare-fun m!600951 () Bool)

(assert (=> d!88889 m!600951))

(assert (=> d!88889 m!600825))

(assert (=> b!624863 d!88889))

(declare-fun b!625054 () Bool)

(declare-fun e!358398 () Bool)

(declare-fun call!33219 () Bool)

(assert (=> b!625054 (= e!358398 call!33219)))

(declare-fun b!625055 () Bool)

(declare-fun e!358396 () Bool)

(declare-fun e!358397 () Bool)

(assert (=> b!625055 (= e!358396 e!358397)))

(declare-fun c!71387 () Bool)

(assert (=> b!625055 (= c!71387 (validKeyInArray!0 (select (arr!18118 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!88903 () Bool)

(declare-fun res!403017 () Bool)

(assert (=> d!88903 (=> res!403017 e!358396)))

(assert (=> d!88903 (= res!403017 (bvsge #b00000000000000000000000000000000 (size!18482 a!2986)))))

(assert (=> d!88903 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!358396)))

(declare-fun bm!33216 () Bool)

(assert (=> bm!33216 (= call!33219 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!625056 () Bool)

(assert (=> b!625056 (= e!358397 e!358398)))

(declare-fun lt!289798 () (_ BitVec 64))

(assert (=> b!625056 (= lt!289798 (select (arr!18118 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!21067 0))(
  ( (Unit!21068) )
))
(declare-fun lt!289796 () Unit!21067)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37752 (_ BitVec 64) (_ BitVec 32)) Unit!21067)

(assert (=> b!625056 (= lt!289796 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!289798 #b00000000000000000000000000000000))))

(assert (=> b!625056 (arrayContainsKey!0 a!2986 lt!289798 #b00000000000000000000000000000000)))

(declare-fun lt!289797 () Unit!21067)

(assert (=> b!625056 (= lt!289797 lt!289796)))

(declare-fun res!403018 () Bool)

(assert (=> b!625056 (= res!403018 (= (seekEntryOrOpen!0 (select (arr!18118 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6514 #b00000000000000000000000000000000)))))

(assert (=> b!625056 (=> (not res!403018) (not e!358398))))

(declare-fun b!625057 () Bool)

(assert (=> b!625057 (= e!358397 call!33219)))

(assert (= (and d!88903 (not res!403017)) b!625055))

(assert (= (and b!625055 c!71387) b!625056))

(assert (= (and b!625055 (not c!71387)) b!625057))

(assert (= (and b!625056 res!403018) b!625054))

(assert (= (or b!625054 b!625057) bm!33216))

(assert (=> b!625055 m!600895))

(assert (=> b!625055 m!600895))

(assert (=> b!625055 m!600897))

(declare-fun m!600969 () Bool)

(assert (=> bm!33216 m!600969))

(assert (=> b!625056 m!600895))

(declare-fun m!600971 () Bool)

(assert (=> b!625056 m!600971))

(declare-fun m!600973 () Bool)

(assert (=> b!625056 m!600973))

(assert (=> b!625056 m!600895))

(declare-fun m!600975 () Bool)

(assert (=> b!625056 m!600975))

(assert (=> b!624857 d!88903))

(declare-fun d!88911 () Bool)

(assert (=> d!88911 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!56382 d!88911))

(declare-fun d!88915 () Bool)

(assert (=> d!88915 (= (array_inv!13977 a!2986) (bvsge (size!18482 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!56382 d!88915))

(check-sat (not b!624936) (not b!624940) (not d!88889) (not b!625056) (not d!88877) (not b!625011) (not b!624981) (not b!624946) (not bm!33216) (not b!625055) (not b!624939) (not bm!33204))
(check-sat)
