; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!57262 () Bool)

(assert start!57262)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!362406 () Bool)

(declare-fun b!633805 () Bool)

(declare-datatypes ((array!38181 0))(
  ( (array!38182 (arr!18320 (Array (_ BitVec 32) (_ BitVec 64))) (size!18685 (_ BitVec 32))) )
))
(declare-fun lt!292881 () array!38181)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!38181)

(declare-fun arrayContainsKey!0 (array!38181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633805 (= e!362406 (arrayContainsKey!0 lt!292881 (select (arr!18320 a!2986) j!136) index!984))))

(declare-fun b!633806 () Bool)

(declare-fun e!362402 () Bool)

(declare-fun e!362401 () Bool)

(assert (=> b!633806 (= e!362402 e!362401)))

(declare-fun res!410048 () Bool)

(assert (=> b!633806 (=> (not res!410048) (not e!362401))))

(declare-datatypes ((SeekEntryResult!6757 0))(
  ( (MissingZero!6757 (index!29327 (_ BitVec 32))) (Found!6757 (index!29328 (_ BitVec 32))) (Intermediate!6757 (undefined!7569 Bool) (index!29329 (_ BitVec 32)) (x!58077 (_ BitVec 32))) (Undefined!6757) (MissingVacant!6757 (index!29330 (_ BitVec 32))) )
))
(declare-fun lt!292878 () SeekEntryResult!6757)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!633806 (= res!410048 (and (= lt!292878 (Found!6757 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18320 a!2986) index!984) (select (arr!18320 a!2986) j!136))) (not (= (select (arr!18320 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38181 (_ BitVec 32)) SeekEntryResult!6757)

(assert (=> b!633806 (= lt!292878 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18320 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!633807 () Bool)

(declare-fun res!410038 () Bool)

(declare-fun e!362407 () Bool)

(assert (=> b!633807 (=> (not res!410038) (not e!362407))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!633807 (= res!410038 (and (= (size!18685 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18685 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18685 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!633808 () Bool)

(declare-datatypes ((Unit!21356 0))(
  ( (Unit!21357) )
))
(declare-fun e!362405 () Unit!21356)

(declare-fun Unit!21358 () Unit!21356)

(assert (=> b!633808 (= e!362405 Unit!21358)))

(declare-fun b!633809 () Bool)

(declare-fun res!410043 () Bool)

(declare-fun e!362399 () Bool)

(assert (=> b!633809 (=> (not res!410043) (not e!362399))))

(declare-datatypes ((List!12400 0))(
  ( (Nil!12397) (Cons!12396 (h!13441 (_ BitVec 64)) (t!18619 List!12400)) )
))
(declare-fun arrayNoDuplicates!0 (array!38181 (_ BitVec 32) List!12400) Bool)

(assert (=> b!633809 (= res!410043 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12397))))

(declare-fun b!633810 () Bool)

(declare-fun res!410034 () Bool)

(assert (=> b!633810 (=> (not res!410034) (not e!362407))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633810 (= res!410034 (validKeyInArray!0 k0!1786))))

(declare-fun b!633811 () Bool)

(declare-fun e!362397 () Bool)

(declare-fun e!362404 () Bool)

(assert (=> b!633811 (= e!362397 e!362404)))

(declare-fun res!410036 () Bool)

(assert (=> b!633811 (=> res!410036 e!362404)))

(declare-fun lt!292882 () (_ BitVec 64))

(declare-fun lt!292886 () (_ BitVec 64))

(assert (=> b!633811 (= res!410036 (or (not (= (select (arr!18320 a!2986) j!136) lt!292886)) (not (= (select (arr!18320 a!2986) j!136) lt!292882)) (bvsge j!136 index!984)))))

(declare-fun b!633804 () Bool)

(declare-fun res!410047 () Bool)

(assert (=> b!633804 (=> (not res!410047) (not e!362399))))

(assert (=> b!633804 (= res!410047 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18320 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!410039 () Bool)

(assert (=> start!57262 (=> (not res!410039) (not e!362407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57262 (= res!410039 (validMask!0 mask!3053))))

(assert (=> start!57262 e!362407))

(assert (=> start!57262 true))

(declare-fun array_inv!14203 (array!38181) Bool)

(assert (=> start!57262 (array_inv!14203 a!2986)))

(declare-fun b!633812 () Bool)

(assert (=> b!633812 (= e!362399 e!362402)))

(declare-fun res!410049 () Bool)

(assert (=> b!633812 (=> (not res!410049) (not e!362402))))

(assert (=> b!633812 (= res!410049 (= (select (store (arr!18320 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633812 (= lt!292881 (array!38182 (store (arr!18320 a!2986) i!1108 k0!1786) (size!18685 a!2986)))))

(declare-fun b!633813 () Bool)

(declare-fun res!410041 () Bool)

(assert (=> b!633813 (=> (not res!410041) (not e!362407))))

(assert (=> b!633813 (= res!410041 (validKeyInArray!0 (select (arr!18320 a!2986) j!136)))))

(declare-fun b!633814 () Bool)

(declare-fun res!410045 () Bool)

(assert (=> b!633814 (=> (not res!410045) (not e!362399))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38181 (_ BitVec 32)) Bool)

(assert (=> b!633814 (= res!410045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!633815 () Bool)

(assert (=> b!633815 (= e!362404 e!362406)))

(declare-fun res!410035 () Bool)

(assert (=> b!633815 (=> (not res!410035) (not e!362406))))

(assert (=> b!633815 (= res!410035 (arrayContainsKey!0 lt!292881 (select (arr!18320 a!2986) j!136) j!136))))

(declare-fun b!633816 () Bool)

(declare-fun res!410046 () Bool)

(assert (=> b!633816 (=> (not res!410046) (not e!362407))))

(assert (=> b!633816 (= res!410046 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!633817 () Bool)

(declare-fun e!362400 () Bool)

(declare-fun lt!292880 () SeekEntryResult!6757)

(assert (=> b!633817 (= e!362400 (= lt!292878 lt!292880))))

(declare-fun b!633818 () Bool)

(declare-fun Unit!21359 () Unit!21356)

(assert (=> b!633818 (= e!362405 Unit!21359)))

(assert (=> b!633818 false))

(declare-fun b!633819 () Bool)

(declare-fun e!362398 () Bool)

(assert (=> b!633819 (= e!362401 (not e!362398))))

(declare-fun res!410044 () Bool)

(assert (=> b!633819 (=> res!410044 e!362398)))

(declare-fun lt!292879 () SeekEntryResult!6757)

(assert (=> b!633819 (= res!410044 (not (= lt!292879 (Found!6757 index!984))))))

(declare-fun lt!292883 () Unit!21356)

(assert (=> b!633819 (= lt!292883 e!362405)))

(declare-fun c!72252 () Bool)

(assert (=> b!633819 (= c!72252 (= lt!292879 Undefined!6757))))

(assert (=> b!633819 (= lt!292879 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292886 lt!292881 mask!3053))))

(assert (=> b!633819 e!362400))

(declare-fun res!410042 () Bool)

(assert (=> b!633819 (=> (not res!410042) (not e!362400))))

(declare-fun lt!292884 () (_ BitVec 32))

(assert (=> b!633819 (= res!410042 (= lt!292880 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292884 vacantSpotIndex!68 lt!292886 lt!292881 mask!3053)))))

(assert (=> b!633819 (= lt!292880 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292884 vacantSpotIndex!68 (select (arr!18320 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!633819 (= lt!292886 (select (store (arr!18320 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!292877 () Unit!21356)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38181 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21356)

(assert (=> b!633819 (= lt!292877 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292884 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633819 (= lt!292884 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!633820 () Bool)

(assert (=> b!633820 (= e!362407 e!362399)))

(declare-fun res!410037 () Bool)

(assert (=> b!633820 (=> (not res!410037) (not e!362399))))

(declare-fun lt!292885 () SeekEntryResult!6757)

(assert (=> b!633820 (= res!410037 (or (= lt!292885 (MissingZero!6757 i!1108)) (= lt!292885 (MissingVacant!6757 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38181 (_ BitVec 32)) SeekEntryResult!6757)

(assert (=> b!633820 (= lt!292885 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!633821 () Bool)

(assert (=> b!633821 (= e!362398 (or (not (= (select (arr!18320 a!2986) j!136) lt!292886)) (not (= (select (arr!18320 a!2986) j!136) lt!292882)) (bvsge j!136 index!984) (bvsge index!984 (size!18685 a!2986)) (bvslt (bvadd #b00000000000000000000000000000001 j!136) #b00000000000000000000000000000000) (bvslt (size!18685 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!633821 e!362397))

(declare-fun res!410040 () Bool)

(assert (=> b!633821 (=> (not res!410040) (not e!362397))))

(assert (=> b!633821 (= res!410040 (= lt!292882 (select (arr!18320 a!2986) j!136)))))

(assert (=> b!633821 (= lt!292882 (select (store (arr!18320 a!2986) i!1108 k0!1786) index!984))))

(assert (= (and start!57262 res!410039) b!633807))

(assert (= (and b!633807 res!410038) b!633813))

(assert (= (and b!633813 res!410041) b!633810))

(assert (= (and b!633810 res!410034) b!633816))

(assert (= (and b!633816 res!410046) b!633820))

(assert (= (and b!633820 res!410037) b!633814))

(assert (= (and b!633814 res!410045) b!633809))

(assert (= (and b!633809 res!410043) b!633804))

(assert (= (and b!633804 res!410047) b!633812))

(assert (= (and b!633812 res!410049) b!633806))

(assert (= (and b!633806 res!410048) b!633819))

(assert (= (and b!633819 res!410042) b!633817))

(assert (= (and b!633819 c!72252) b!633818))

(assert (= (and b!633819 (not c!72252)) b!633808))

(assert (= (and b!633819 (not res!410044)) b!633821))

(assert (= (and b!633821 res!410040) b!633811))

(assert (= (and b!633811 (not res!410036)) b!633815))

(assert (= (and b!633815 res!410035) b!633805))

(declare-fun m!607883 () Bool)

(assert (=> b!633816 m!607883))

(declare-fun m!607885 () Bool)

(assert (=> b!633806 m!607885))

(declare-fun m!607887 () Bool)

(assert (=> b!633806 m!607887))

(assert (=> b!633806 m!607887))

(declare-fun m!607889 () Bool)

(assert (=> b!633806 m!607889))

(assert (=> b!633805 m!607887))

(assert (=> b!633805 m!607887))

(declare-fun m!607891 () Bool)

(assert (=> b!633805 m!607891))

(declare-fun m!607893 () Bool)

(assert (=> b!633804 m!607893))

(assert (=> b!633815 m!607887))

(assert (=> b!633815 m!607887))

(declare-fun m!607895 () Bool)

(assert (=> b!633815 m!607895))

(assert (=> b!633811 m!607887))

(assert (=> b!633821 m!607887))

(declare-fun m!607897 () Bool)

(assert (=> b!633821 m!607897))

(declare-fun m!607899 () Bool)

(assert (=> b!633821 m!607899))

(assert (=> b!633812 m!607897))

(declare-fun m!607901 () Bool)

(assert (=> b!633812 m!607901))

(declare-fun m!607903 () Bool)

(assert (=> b!633809 m!607903))

(assert (=> b!633813 m!607887))

(assert (=> b!633813 m!607887))

(declare-fun m!607905 () Bool)

(assert (=> b!633813 m!607905))

(declare-fun m!607907 () Bool)

(assert (=> b!633810 m!607907))

(declare-fun m!607909 () Bool)

(assert (=> b!633819 m!607909))

(declare-fun m!607911 () Bool)

(assert (=> b!633819 m!607911))

(assert (=> b!633819 m!607887))

(assert (=> b!633819 m!607887))

(declare-fun m!607913 () Bool)

(assert (=> b!633819 m!607913))

(assert (=> b!633819 m!607897))

(declare-fun m!607915 () Bool)

(assert (=> b!633819 m!607915))

(declare-fun m!607917 () Bool)

(assert (=> b!633819 m!607917))

(declare-fun m!607919 () Bool)

(assert (=> b!633819 m!607919))

(declare-fun m!607921 () Bool)

(assert (=> start!57262 m!607921))

(declare-fun m!607923 () Bool)

(assert (=> start!57262 m!607923))

(declare-fun m!607925 () Bool)

(assert (=> b!633814 m!607925))

(declare-fun m!607927 () Bool)

(assert (=> b!633820 m!607927))

(check-sat (not start!57262) (not b!633809) (not b!633814) (not b!633806) (not b!633819) (not b!633815) (not b!633813) (not b!633816) (not b!633820) (not b!633805) (not b!633810))
(check-sat)
(get-model)

(declare-fun b!633940 () Bool)

(declare-fun e!362482 () Bool)

(declare-fun call!33355 () Bool)

(assert (=> b!633940 (= e!362482 call!33355)))

(declare-fun b!633941 () Bool)

(assert (=> b!633941 (= e!362482 call!33355)))

(declare-fun b!633943 () Bool)

(declare-fun e!362483 () Bool)

(assert (=> b!633943 (= e!362483 e!362482)))

(declare-fun c!72261 () Bool)

(assert (=> b!633943 (= c!72261 (validKeyInArray!0 (select (arr!18320 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!633942 () Bool)

(declare-fun e!362484 () Bool)

(assert (=> b!633942 (= e!362484 e!362483)))

(declare-fun res!410152 () Bool)

(assert (=> b!633942 (=> (not res!410152) (not e!362483))))

(declare-fun e!362485 () Bool)

(assert (=> b!633942 (= res!410152 (not e!362485))))

(declare-fun res!410153 () Bool)

(assert (=> b!633942 (=> (not res!410153) (not e!362485))))

(assert (=> b!633942 (= res!410153 (validKeyInArray!0 (select (arr!18320 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!89395 () Bool)

(declare-fun res!410154 () Bool)

(assert (=> d!89395 (=> res!410154 e!362484)))

(assert (=> d!89395 (= res!410154 (bvsge #b00000000000000000000000000000000 (size!18685 a!2986)))))

(assert (=> d!89395 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12397) e!362484)))

(declare-fun bm!33352 () Bool)

(assert (=> bm!33352 (= call!33355 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!72261 (Cons!12396 (select (arr!18320 a!2986) #b00000000000000000000000000000000) Nil!12397) Nil!12397)))))

(declare-fun b!633944 () Bool)

(declare-fun contains!3078 (List!12400 (_ BitVec 64)) Bool)

(assert (=> b!633944 (= e!362485 (contains!3078 Nil!12397 (select (arr!18320 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89395 (not res!410154)) b!633942))

(assert (= (and b!633942 res!410153) b!633944))

(assert (= (and b!633942 res!410152) b!633943))

(assert (= (and b!633943 c!72261) b!633941))

(assert (= (and b!633943 (not c!72261)) b!633940))

(assert (= (or b!633941 b!633940) bm!33352))

(declare-fun m!608021 () Bool)

(assert (=> b!633943 m!608021))

(assert (=> b!633943 m!608021))

(declare-fun m!608023 () Bool)

(assert (=> b!633943 m!608023))

(assert (=> b!633942 m!608021))

(assert (=> b!633942 m!608021))

(assert (=> b!633942 m!608023))

(assert (=> bm!33352 m!608021))

(declare-fun m!608025 () Bool)

(assert (=> bm!33352 m!608025))

(assert (=> b!633944 m!608021))

(assert (=> b!633944 m!608021))

(declare-fun m!608027 () Bool)

(assert (=> b!633944 m!608027))

(assert (=> b!633809 d!89395))

(declare-fun b!633953 () Bool)

(declare-fun e!362493 () Bool)

(declare-fun call!33358 () Bool)

(assert (=> b!633953 (= e!362493 call!33358)))

(declare-fun bm!33355 () Bool)

(assert (=> bm!33355 (= call!33358 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!89397 () Bool)

(declare-fun res!410159 () Bool)

(declare-fun e!362494 () Bool)

(assert (=> d!89397 (=> res!410159 e!362494)))

(assert (=> d!89397 (= res!410159 (bvsge #b00000000000000000000000000000000 (size!18685 a!2986)))))

(assert (=> d!89397 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!362494)))

(declare-fun b!633954 () Bool)

(declare-fun e!362492 () Bool)

(assert (=> b!633954 (= e!362492 e!362493)))

(declare-fun lt!292954 () (_ BitVec 64))

(assert (=> b!633954 (= lt!292954 (select (arr!18320 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!292955 () Unit!21356)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38181 (_ BitVec 64) (_ BitVec 32)) Unit!21356)

(assert (=> b!633954 (= lt!292955 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!292954 #b00000000000000000000000000000000))))

(assert (=> b!633954 (arrayContainsKey!0 a!2986 lt!292954 #b00000000000000000000000000000000)))

(declare-fun lt!292953 () Unit!21356)

(assert (=> b!633954 (= lt!292953 lt!292955)))

(declare-fun res!410160 () Bool)

(assert (=> b!633954 (= res!410160 (= (seekEntryOrOpen!0 (select (arr!18320 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6757 #b00000000000000000000000000000000)))))

(assert (=> b!633954 (=> (not res!410160) (not e!362493))))

(declare-fun b!633955 () Bool)

(assert (=> b!633955 (= e!362492 call!33358)))

(declare-fun b!633956 () Bool)

(assert (=> b!633956 (= e!362494 e!362492)))

(declare-fun c!72264 () Bool)

(assert (=> b!633956 (= c!72264 (validKeyInArray!0 (select (arr!18320 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!89397 (not res!410159)) b!633956))

(assert (= (and b!633956 c!72264) b!633954))

(assert (= (and b!633956 (not c!72264)) b!633955))

(assert (= (and b!633954 res!410160) b!633953))

(assert (= (or b!633953 b!633955) bm!33355))

(declare-fun m!608029 () Bool)

(assert (=> bm!33355 m!608029))

(assert (=> b!633954 m!608021))

(declare-fun m!608031 () Bool)

(assert (=> b!633954 m!608031))

(declare-fun m!608033 () Bool)

(assert (=> b!633954 m!608033))

(assert (=> b!633954 m!608021))

(declare-fun m!608035 () Bool)

(assert (=> b!633954 m!608035))

(assert (=> b!633956 m!608021))

(assert (=> b!633956 m!608021))

(assert (=> b!633956 m!608023))

(assert (=> b!633814 d!89397))

(declare-fun d!89399 () Bool)

(declare-fun res!410165 () Bool)

(declare-fun e!362499 () Bool)

(assert (=> d!89399 (=> res!410165 e!362499)))

(assert (=> d!89399 (= res!410165 (= (select (arr!18320 lt!292881) j!136) (select (arr!18320 a!2986) j!136)))))

(assert (=> d!89399 (= (arrayContainsKey!0 lt!292881 (select (arr!18320 a!2986) j!136) j!136) e!362499)))

(declare-fun b!633961 () Bool)

(declare-fun e!362500 () Bool)

(assert (=> b!633961 (= e!362499 e!362500)))

(declare-fun res!410166 () Bool)

(assert (=> b!633961 (=> (not res!410166) (not e!362500))))

(assert (=> b!633961 (= res!410166 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18685 lt!292881)))))

(declare-fun b!633962 () Bool)

(assert (=> b!633962 (= e!362500 (arrayContainsKey!0 lt!292881 (select (arr!18320 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!89399 (not res!410165)) b!633961))

(assert (= (and b!633961 res!410166) b!633962))

(declare-fun m!608037 () Bool)

(assert (=> d!89399 m!608037))

(assert (=> b!633962 m!607887))

(declare-fun m!608039 () Bool)

(assert (=> b!633962 m!608039))

(assert (=> b!633815 d!89399))

(declare-fun d!89401 () Bool)

(declare-fun lt!292962 () SeekEntryResult!6757)

(get-info :version)

(assert (=> d!89401 (and (or ((_ is Undefined!6757) lt!292962) (not ((_ is Found!6757) lt!292962)) (and (bvsge (index!29328 lt!292962) #b00000000000000000000000000000000) (bvslt (index!29328 lt!292962) (size!18685 a!2986)))) (or ((_ is Undefined!6757) lt!292962) ((_ is Found!6757) lt!292962) (not ((_ is MissingZero!6757) lt!292962)) (and (bvsge (index!29327 lt!292962) #b00000000000000000000000000000000) (bvslt (index!29327 lt!292962) (size!18685 a!2986)))) (or ((_ is Undefined!6757) lt!292962) ((_ is Found!6757) lt!292962) ((_ is MissingZero!6757) lt!292962) (not ((_ is MissingVacant!6757) lt!292962)) (and (bvsge (index!29330 lt!292962) #b00000000000000000000000000000000) (bvslt (index!29330 lt!292962) (size!18685 a!2986)))) (or ((_ is Undefined!6757) lt!292962) (ite ((_ is Found!6757) lt!292962) (= (select (arr!18320 a!2986) (index!29328 lt!292962)) k0!1786) (ite ((_ is MissingZero!6757) lt!292962) (= (select (arr!18320 a!2986) (index!29327 lt!292962)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6757) lt!292962) (= (select (arr!18320 a!2986) (index!29330 lt!292962)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!362507 () SeekEntryResult!6757)

(assert (=> d!89401 (= lt!292962 e!362507)))

(declare-fun c!72273 () Bool)

(declare-fun lt!292963 () SeekEntryResult!6757)

(assert (=> d!89401 (= c!72273 (and ((_ is Intermediate!6757) lt!292963) (undefined!7569 lt!292963)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38181 (_ BitVec 32)) SeekEntryResult!6757)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89401 (= lt!292963 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!89401 (validMask!0 mask!3053)))

(assert (=> d!89401 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!292962)))

(declare-fun b!633975 () Bool)

(declare-fun e!362509 () SeekEntryResult!6757)

(assert (=> b!633975 (= e!362509 (seekKeyOrZeroReturnVacant!0 (x!58077 lt!292963) (index!29329 lt!292963) (index!29329 lt!292963) k0!1786 a!2986 mask!3053))))

(declare-fun b!633976 () Bool)

(declare-fun e!362508 () SeekEntryResult!6757)

(assert (=> b!633976 (= e!362507 e!362508)))

(declare-fun lt!292964 () (_ BitVec 64))

(assert (=> b!633976 (= lt!292964 (select (arr!18320 a!2986) (index!29329 lt!292963)))))

(declare-fun c!72271 () Bool)

(assert (=> b!633976 (= c!72271 (= lt!292964 k0!1786))))

(declare-fun b!633977 () Bool)

(assert (=> b!633977 (= e!362509 (MissingZero!6757 (index!29329 lt!292963)))))

(declare-fun b!633978 () Bool)

(assert (=> b!633978 (= e!362508 (Found!6757 (index!29329 lt!292963)))))

(declare-fun b!633979 () Bool)

(declare-fun c!72272 () Bool)

(assert (=> b!633979 (= c!72272 (= lt!292964 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!633979 (= e!362508 e!362509)))

(declare-fun b!633980 () Bool)

(assert (=> b!633980 (= e!362507 Undefined!6757)))

(assert (= (and d!89401 c!72273) b!633980))

(assert (= (and d!89401 (not c!72273)) b!633976))

(assert (= (and b!633976 c!72271) b!633978))

(assert (= (and b!633976 (not c!72271)) b!633979))

(assert (= (and b!633979 c!72272) b!633977))

(assert (= (and b!633979 (not c!72272)) b!633975))

(declare-fun m!608041 () Bool)

(assert (=> d!89401 m!608041))

(declare-fun m!608043 () Bool)

(assert (=> d!89401 m!608043))

(assert (=> d!89401 m!607921))

(declare-fun m!608045 () Bool)

(assert (=> d!89401 m!608045))

(assert (=> d!89401 m!608043))

(declare-fun m!608047 () Bool)

(assert (=> d!89401 m!608047))

(declare-fun m!608049 () Bool)

(assert (=> d!89401 m!608049))

(declare-fun m!608051 () Bool)

(assert (=> b!633975 m!608051))

(declare-fun m!608053 () Bool)

(assert (=> b!633976 m!608053))

(assert (=> b!633820 d!89401))

(declare-fun d!89403 () Bool)

(declare-fun res!410167 () Bool)

(declare-fun e!362510 () Bool)

(assert (=> d!89403 (=> res!410167 e!362510)))

(assert (=> d!89403 (= res!410167 (= (select (arr!18320 lt!292881) index!984) (select (arr!18320 a!2986) j!136)))))

(assert (=> d!89403 (= (arrayContainsKey!0 lt!292881 (select (arr!18320 a!2986) j!136) index!984) e!362510)))

(declare-fun b!633981 () Bool)

(declare-fun e!362511 () Bool)

(assert (=> b!633981 (= e!362510 e!362511)))

(declare-fun res!410168 () Bool)

(assert (=> b!633981 (=> (not res!410168) (not e!362511))))

(assert (=> b!633981 (= res!410168 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18685 lt!292881)))))

(declare-fun b!633982 () Bool)

(assert (=> b!633982 (= e!362511 (arrayContainsKey!0 lt!292881 (select (arr!18320 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!89403 (not res!410167)) b!633981))

(assert (= (and b!633981 res!410168) b!633982))

(declare-fun m!608055 () Bool)

(assert (=> d!89403 m!608055))

(assert (=> b!633982 m!607887))

(declare-fun m!608057 () Bool)

(assert (=> b!633982 m!608057))

(assert (=> b!633805 d!89403))

(declare-fun d!89405 () Bool)

(assert (=> d!89405 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!633810 d!89405))

(declare-fun d!89407 () Bool)

(declare-fun res!410169 () Bool)

(declare-fun e!362512 () Bool)

(assert (=> d!89407 (=> res!410169 e!362512)))

(assert (=> d!89407 (= res!410169 (= (select (arr!18320 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!89407 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!362512)))

(declare-fun b!633983 () Bool)

(declare-fun e!362513 () Bool)

(assert (=> b!633983 (= e!362512 e!362513)))

(declare-fun res!410170 () Bool)

(assert (=> b!633983 (=> (not res!410170) (not e!362513))))

(assert (=> b!633983 (= res!410170 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18685 a!2986)))))

(declare-fun b!633984 () Bool)

(assert (=> b!633984 (= e!362513 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!89407 (not res!410169)) b!633983))

(assert (= (and b!633983 res!410170) b!633984))

(assert (=> d!89407 m!608021))

(declare-fun m!608059 () Bool)

(assert (=> b!633984 m!608059))

(assert (=> b!633816 d!89407))

(declare-fun b!634009 () Bool)

(declare-fun e!362529 () SeekEntryResult!6757)

(assert (=> b!634009 (= e!362529 (MissingVacant!6757 vacantSpotIndex!68))))

(declare-fun d!89409 () Bool)

(declare-fun lt!292978 () SeekEntryResult!6757)

(assert (=> d!89409 (and (or ((_ is Undefined!6757) lt!292978) (not ((_ is Found!6757) lt!292978)) (and (bvsge (index!29328 lt!292978) #b00000000000000000000000000000000) (bvslt (index!29328 lt!292978) (size!18685 a!2986)))) (or ((_ is Undefined!6757) lt!292978) ((_ is Found!6757) lt!292978) (not ((_ is MissingVacant!6757) lt!292978)) (not (= (index!29330 lt!292978) vacantSpotIndex!68)) (and (bvsge (index!29330 lt!292978) #b00000000000000000000000000000000) (bvslt (index!29330 lt!292978) (size!18685 a!2986)))) (or ((_ is Undefined!6757) lt!292978) (ite ((_ is Found!6757) lt!292978) (= (select (arr!18320 a!2986) (index!29328 lt!292978)) (select (arr!18320 a!2986) j!136)) (and ((_ is MissingVacant!6757) lt!292978) (= (index!29330 lt!292978) vacantSpotIndex!68) (= (select (arr!18320 a!2986) (index!29330 lt!292978)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!362530 () SeekEntryResult!6757)

(assert (=> d!89409 (= lt!292978 e!362530)))

(declare-fun c!72283 () Bool)

(assert (=> d!89409 (= c!72283 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!292979 () (_ BitVec 64))

(assert (=> d!89409 (= lt!292979 (select (arr!18320 a!2986) index!984))))

(assert (=> d!89409 (validMask!0 mask!3053)))

(assert (=> d!89409 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18320 a!2986) j!136) a!2986 mask!3053) lt!292978)))

(declare-fun b!634010 () Bool)

(declare-fun e!362531 () SeekEntryResult!6757)

(assert (=> b!634010 (= e!362531 (Found!6757 index!984))))

(declare-fun b!634011 () Bool)

(assert (=> b!634011 (= e!362530 Undefined!6757)))

(declare-fun b!634012 () Bool)

(assert (=> b!634012 (= e!362530 e!362531)))

(declare-fun c!72285 () Bool)

(assert (=> b!634012 (= c!72285 (= lt!292979 (select (arr!18320 a!2986) j!136)))))

(declare-fun b!634013 () Bool)

(declare-fun c!72284 () Bool)

(assert (=> b!634013 (= c!72284 (= lt!292979 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634013 (= e!362531 e!362529)))

(declare-fun b!634014 () Bool)

(assert (=> b!634014 (= e!362529 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!18320 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!89409 c!72283) b!634011))

(assert (= (and d!89409 (not c!72283)) b!634012))

(assert (= (and b!634012 c!72285) b!634010))

(assert (= (and b!634012 (not c!72285)) b!634013))

(assert (= (and b!634013 c!72284) b!634009))

(assert (= (and b!634013 (not c!72284)) b!634014))

(declare-fun m!608073 () Bool)

(assert (=> d!89409 m!608073))

(declare-fun m!608075 () Bool)

(assert (=> d!89409 m!608075))

(assert (=> d!89409 m!607885))

(assert (=> d!89409 m!607921))

(assert (=> b!634014 m!607909))

(assert (=> b!634014 m!607909))

(assert (=> b!634014 m!607887))

(declare-fun m!608077 () Bool)

(assert (=> b!634014 m!608077))

(assert (=> b!633806 d!89409))

(declare-fun d!89415 () Bool)

(assert (=> d!89415 (= (validKeyInArray!0 (select (arr!18320 a!2986) j!136)) (and (not (= (select (arr!18320 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18320 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!633813 d!89415))

(declare-fun d!89417 () Bool)

(assert (=> d!89417 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!57262 d!89417))

(declare-fun d!89419 () Bool)

(assert (=> d!89419 (= (array_inv!14203 a!2986) (bvsge (size!18685 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!57262 d!89419))

(declare-fun d!89421 () Bool)

(declare-fun e!362549 () Bool)

(assert (=> d!89421 e!362549))

(declare-fun res!410185 () Bool)

(assert (=> d!89421 (=> (not res!410185) (not e!362549))))

(assert (=> d!89421 (= res!410185 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18685 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18685 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18685 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18685 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18685 a!2986))))))

(declare-fun lt!292991 () Unit!21356)

(declare-fun choose!9 (array!38181 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21356)

(assert (=> d!89421 (= lt!292991 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292884 vacantSpotIndex!68 mask!3053))))

(assert (=> d!89421 (validMask!0 mask!3053)))

(assert (=> d!89421 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!292884 vacantSpotIndex!68 mask!3053) lt!292991)))

(declare-fun b!634041 () Bool)

(assert (=> b!634041 (= e!362549 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292884 vacantSpotIndex!68 (select (arr!18320 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292884 vacantSpotIndex!68 (select (store (arr!18320 a!2986) i!1108 k0!1786) j!136) (array!38182 (store (arr!18320 a!2986) i!1108 k0!1786) (size!18685 a!2986)) mask!3053)))))

(assert (= (and d!89421 res!410185) b!634041))

(declare-fun m!608097 () Bool)

(assert (=> d!89421 m!608097))

(assert (=> d!89421 m!607921))

(assert (=> b!634041 m!607887))

(assert (=> b!634041 m!607911))

(declare-fun m!608099 () Bool)

(assert (=> b!634041 m!608099))

(assert (=> b!634041 m!607897))

(assert (=> b!634041 m!607911))

(assert (=> b!634041 m!607887))

(assert (=> b!634041 m!607913))

(assert (=> b!633819 d!89421))

(declare-fun d!89429 () Bool)

(declare-fun lt!292994 () (_ BitVec 32))

(assert (=> d!89429 (and (bvsge lt!292994 #b00000000000000000000000000000000) (bvslt lt!292994 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!89429 (= lt!292994 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!89429 (validMask!0 mask!3053)))

(assert (=> d!89429 (= (nextIndex!0 index!984 x!910 mask!3053) lt!292994)))

(declare-fun bs!19044 () Bool)

(assert (= bs!19044 d!89429))

(declare-fun m!608101 () Bool)

(assert (=> bs!19044 m!608101))

(assert (=> bs!19044 m!607921))

(assert (=> b!633819 d!89429))

(declare-fun b!634042 () Bool)

(declare-fun e!362550 () SeekEntryResult!6757)

(assert (=> b!634042 (= e!362550 (MissingVacant!6757 vacantSpotIndex!68))))

(declare-fun lt!292995 () SeekEntryResult!6757)

(declare-fun d!89431 () Bool)

(assert (=> d!89431 (and (or ((_ is Undefined!6757) lt!292995) (not ((_ is Found!6757) lt!292995)) (and (bvsge (index!29328 lt!292995) #b00000000000000000000000000000000) (bvslt (index!29328 lt!292995) (size!18685 a!2986)))) (or ((_ is Undefined!6757) lt!292995) ((_ is Found!6757) lt!292995) (not ((_ is MissingVacant!6757) lt!292995)) (not (= (index!29330 lt!292995) vacantSpotIndex!68)) (and (bvsge (index!29330 lt!292995) #b00000000000000000000000000000000) (bvslt (index!29330 lt!292995) (size!18685 a!2986)))) (or ((_ is Undefined!6757) lt!292995) (ite ((_ is Found!6757) lt!292995) (= (select (arr!18320 a!2986) (index!29328 lt!292995)) (select (arr!18320 a!2986) j!136)) (and ((_ is MissingVacant!6757) lt!292995) (= (index!29330 lt!292995) vacantSpotIndex!68) (= (select (arr!18320 a!2986) (index!29330 lt!292995)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!362551 () SeekEntryResult!6757)

(assert (=> d!89431 (= lt!292995 e!362551)))

(declare-fun c!72295 () Bool)

(assert (=> d!89431 (= c!72295 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!292996 () (_ BitVec 64))

(assert (=> d!89431 (= lt!292996 (select (arr!18320 a!2986) lt!292884))))

(assert (=> d!89431 (validMask!0 mask!3053)))

(assert (=> d!89431 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292884 vacantSpotIndex!68 (select (arr!18320 a!2986) j!136) a!2986 mask!3053) lt!292995)))

(declare-fun b!634043 () Bool)

(declare-fun e!362552 () SeekEntryResult!6757)

(assert (=> b!634043 (= e!362552 (Found!6757 lt!292884))))

(declare-fun b!634044 () Bool)

(assert (=> b!634044 (= e!362551 Undefined!6757)))

(declare-fun b!634045 () Bool)

(assert (=> b!634045 (= e!362551 e!362552)))

(declare-fun c!72297 () Bool)

(assert (=> b!634045 (= c!72297 (= lt!292996 (select (arr!18320 a!2986) j!136)))))

(declare-fun b!634046 () Bool)

(declare-fun c!72296 () Bool)

(assert (=> b!634046 (= c!72296 (= lt!292996 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634046 (= e!362552 e!362550)))

(declare-fun b!634047 () Bool)

(assert (=> b!634047 (= e!362550 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!292884 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!18320 a!2986) j!136) a!2986 mask!3053))))

(assert (= (and d!89431 c!72295) b!634044))

(assert (= (and d!89431 (not c!72295)) b!634045))

(assert (= (and b!634045 c!72297) b!634043))

(assert (= (and b!634045 (not c!72297)) b!634046))

(assert (= (and b!634046 c!72296) b!634042))

(assert (= (and b!634046 (not c!72296)) b!634047))

(declare-fun m!608103 () Bool)

(assert (=> d!89431 m!608103))

(declare-fun m!608105 () Bool)

(assert (=> d!89431 m!608105))

(declare-fun m!608107 () Bool)

(assert (=> d!89431 m!608107))

(assert (=> d!89431 m!607921))

(declare-fun m!608109 () Bool)

(assert (=> b!634047 m!608109))

(assert (=> b!634047 m!608109))

(assert (=> b!634047 m!607887))

(declare-fun m!608111 () Bool)

(assert (=> b!634047 m!608111))

(assert (=> b!633819 d!89431))

(declare-fun b!634048 () Bool)

(declare-fun e!362553 () SeekEntryResult!6757)

(assert (=> b!634048 (= e!362553 (MissingVacant!6757 vacantSpotIndex!68))))

(declare-fun d!89433 () Bool)

(declare-fun lt!292997 () SeekEntryResult!6757)

(assert (=> d!89433 (and (or ((_ is Undefined!6757) lt!292997) (not ((_ is Found!6757) lt!292997)) (and (bvsge (index!29328 lt!292997) #b00000000000000000000000000000000) (bvslt (index!29328 lt!292997) (size!18685 lt!292881)))) (or ((_ is Undefined!6757) lt!292997) ((_ is Found!6757) lt!292997) (not ((_ is MissingVacant!6757) lt!292997)) (not (= (index!29330 lt!292997) vacantSpotIndex!68)) (and (bvsge (index!29330 lt!292997) #b00000000000000000000000000000000) (bvslt (index!29330 lt!292997) (size!18685 lt!292881)))) (or ((_ is Undefined!6757) lt!292997) (ite ((_ is Found!6757) lt!292997) (= (select (arr!18320 lt!292881) (index!29328 lt!292997)) lt!292886) (and ((_ is MissingVacant!6757) lt!292997) (= (index!29330 lt!292997) vacantSpotIndex!68) (= (select (arr!18320 lt!292881) (index!29330 lt!292997)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!362554 () SeekEntryResult!6757)

(assert (=> d!89433 (= lt!292997 e!362554)))

(declare-fun c!72298 () Bool)

(assert (=> d!89433 (= c!72298 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!292998 () (_ BitVec 64))

(assert (=> d!89433 (= lt!292998 (select (arr!18320 lt!292881) lt!292884))))

(assert (=> d!89433 (validMask!0 mask!3053)))

(assert (=> d!89433 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!292884 vacantSpotIndex!68 lt!292886 lt!292881 mask!3053) lt!292997)))

(declare-fun b!634049 () Bool)

(declare-fun e!362555 () SeekEntryResult!6757)

(assert (=> b!634049 (= e!362555 (Found!6757 lt!292884))))

(declare-fun b!634050 () Bool)

(assert (=> b!634050 (= e!362554 Undefined!6757)))

(declare-fun b!634051 () Bool)

(assert (=> b!634051 (= e!362554 e!362555)))

(declare-fun c!72300 () Bool)

(assert (=> b!634051 (= c!72300 (= lt!292998 lt!292886))))

(declare-fun b!634052 () Bool)

(declare-fun c!72299 () Bool)

(assert (=> b!634052 (= c!72299 (= lt!292998 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634052 (= e!362555 e!362553)))

(declare-fun b!634053 () Bool)

(assert (=> b!634053 (= e!362553 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!292884 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!292886 lt!292881 mask!3053))))

(assert (= (and d!89433 c!72298) b!634050))

(assert (= (and d!89433 (not c!72298)) b!634051))

(assert (= (and b!634051 c!72300) b!634049))

(assert (= (and b!634051 (not c!72300)) b!634052))

(assert (= (and b!634052 c!72299) b!634048))

(assert (= (and b!634052 (not c!72299)) b!634053))

(declare-fun m!608113 () Bool)

(assert (=> d!89433 m!608113))

(declare-fun m!608115 () Bool)

(assert (=> d!89433 m!608115))

(declare-fun m!608117 () Bool)

(assert (=> d!89433 m!608117))

(assert (=> d!89433 m!607921))

(assert (=> b!634053 m!608109))

(assert (=> b!634053 m!608109))

(declare-fun m!608119 () Bool)

(assert (=> b!634053 m!608119))

(assert (=> b!633819 d!89433))

(declare-fun b!634054 () Bool)

(declare-fun e!362556 () SeekEntryResult!6757)

(assert (=> b!634054 (= e!362556 (MissingVacant!6757 vacantSpotIndex!68))))

(declare-fun d!89435 () Bool)

(declare-fun lt!292999 () SeekEntryResult!6757)

(assert (=> d!89435 (and (or ((_ is Undefined!6757) lt!292999) (not ((_ is Found!6757) lt!292999)) (and (bvsge (index!29328 lt!292999) #b00000000000000000000000000000000) (bvslt (index!29328 lt!292999) (size!18685 lt!292881)))) (or ((_ is Undefined!6757) lt!292999) ((_ is Found!6757) lt!292999) (not ((_ is MissingVacant!6757) lt!292999)) (not (= (index!29330 lt!292999) vacantSpotIndex!68)) (and (bvsge (index!29330 lt!292999) #b00000000000000000000000000000000) (bvslt (index!29330 lt!292999) (size!18685 lt!292881)))) (or ((_ is Undefined!6757) lt!292999) (ite ((_ is Found!6757) lt!292999) (= (select (arr!18320 lt!292881) (index!29328 lt!292999)) lt!292886) (and ((_ is MissingVacant!6757) lt!292999) (= (index!29330 lt!292999) vacantSpotIndex!68) (= (select (arr!18320 lt!292881) (index!29330 lt!292999)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!362557 () SeekEntryResult!6757)

(assert (=> d!89435 (= lt!292999 e!362557)))

(declare-fun c!72301 () Bool)

(assert (=> d!89435 (= c!72301 (bvsge x!910 #b01111111111111111111111111111110))))

(declare-fun lt!293000 () (_ BitVec 64))

(assert (=> d!89435 (= lt!293000 (select (arr!18320 lt!292881) index!984))))

(assert (=> d!89435 (validMask!0 mask!3053)))

(assert (=> d!89435 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!292886 lt!292881 mask!3053) lt!292999)))

(declare-fun b!634055 () Bool)

(declare-fun e!362558 () SeekEntryResult!6757)

(assert (=> b!634055 (= e!362558 (Found!6757 index!984))))

(declare-fun b!634056 () Bool)

(assert (=> b!634056 (= e!362557 Undefined!6757)))

(declare-fun b!634057 () Bool)

(assert (=> b!634057 (= e!362557 e!362558)))

(declare-fun c!72303 () Bool)

(assert (=> b!634057 (= c!72303 (= lt!293000 lt!292886))))

(declare-fun b!634058 () Bool)

(declare-fun c!72302 () Bool)

(assert (=> b!634058 (= c!72302 (= lt!293000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!634058 (= e!362558 e!362556)))

(declare-fun b!634059 () Bool)

(assert (=> b!634059 (= e!362556 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!292886 lt!292881 mask!3053))))

(assert (= (and d!89435 c!72301) b!634056))

(assert (= (and d!89435 (not c!72301)) b!634057))

(assert (= (and b!634057 c!72303) b!634055))

(assert (= (and b!634057 (not c!72303)) b!634058))

(assert (= (and b!634058 c!72302) b!634054))

(assert (= (and b!634058 (not c!72302)) b!634059))

(declare-fun m!608121 () Bool)

(assert (=> d!89435 m!608121))

(declare-fun m!608123 () Bool)

(assert (=> d!89435 m!608123))

(assert (=> d!89435 m!608055))

(assert (=> d!89435 m!607921))

(assert (=> b!634059 m!607909))

(assert (=> b!634059 m!607909))

(declare-fun m!608125 () Bool)

(assert (=> b!634059 m!608125))

(assert (=> b!633819 d!89435))

(check-sat (not d!89429) (not b!633944) (not b!633943) (not d!89421) (not b!633942) (not b!634047) (not b!633984) (not d!89435) (not b!634014) (not b!633975) (not b!633982) (not bm!33352) (not d!89433) (not d!89409) (not b!634059) (not b!634053) (not b!633954) (not b!634041) (not bm!33355) (not d!89401) (not b!633956) (not d!89431) (not b!633962))
(check-sat)
