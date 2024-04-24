; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54120 () Bool)

(assert start!54120)

(declare-fun b!590832 () Bool)

(declare-fun res!377931 () Bool)

(declare-fun e!337331 () Bool)

(assert (=> b!590832 (=> (not res!377931) (not e!337331))))

(declare-datatypes ((array!36852 0))(
  ( (array!36853 (arr!17695 (Array (_ BitVec 32) (_ BitVec 64))) (size!18059 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36852)

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36852 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!590832 (= res!377931 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!590833 () Bool)

(declare-fun res!377933 () Bool)

(assert (=> b!590833 (=> (not res!377933) (not e!337331))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!590833 (= res!377933 (validKeyInArray!0 (select (arr!17695 a!2986) j!136)))))

(declare-fun b!590834 () Bool)

(declare-fun e!337330 () Bool)

(declare-fun e!337323 () Bool)

(assert (=> b!590834 (= e!337330 e!337323)))

(declare-fun res!377929 () Bool)

(assert (=> b!590834 (=> res!377929 e!337323)))

(declare-fun lt!268068 () (_ BitVec 64))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!590834 (= res!377929 (or (not (= (select (arr!17695 a!2986) j!136) lt!268068)) (not (= (select (arr!17695 a!2986) j!136) (select (store (arr!17695 a!2986) i!1108 k0!1786) index!984))) (bvsge j!136 index!984)))))

(declare-fun b!590835 () Bool)

(declare-fun e!337325 () Bool)

(assert (=> b!590835 (= e!337325 (or (not (= (select (arr!17695 a!2986) j!136) lt!268068)) (not (= (select (arr!17695 a!2986) j!136) (select (store (arr!17695 a!2986) i!1108 k0!1786) index!984))) (bvsge j!136 index!984) (bvsge index!984 (size!18059 a!2986)) (bvslt (size!18059 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!590835 e!337330))

(declare-fun res!377936 () Bool)

(assert (=> b!590835 (=> (not res!377936) (not e!337330))))

(assert (=> b!590835 (= res!377936 (= (select (store (arr!17695 a!2986) i!1108 k0!1786) index!984) (select (arr!17695 a!2986) j!136)))))

(declare-fun b!590836 () Bool)

(declare-datatypes ((Unit!18457 0))(
  ( (Unit!18458) )
))
(declare-fun e!337332 () Unit!18457)

(declare-fun Unit!18459 () Unit!18457)

(assert (=> b!590836 (= e!337332 Unit!18459)))

(assert (=> b!590836 false))

(declare-fun b!590837 () Bool)

(declare-fun e!337327 () Bool)

(declare-fun e!337326 () Bool)

(assert (=> b!590837 (= e!337327 e!337326)))

(declare-fun res!377937 () Bool)

(assert (=> b!590837 (=> (not res!377937) (not e!337326))))

(declare-datatypes ((SeekEntryResult!6091 0))(
  ( (MissingZero!6091 (index!26597 (_ BitVec 32))) (Found!6091 (index!26598 (_ BitVec 32))) (Intermediate!6091 (undefined!6903 Bool) (index!26599 (_ BitVec 32)) (x!55541 (_ BitVec 32))) (Undefined!6091) (MissingVacant!6091 (index!26600 (_ BitVec 32))) )
))
(declare-fun lt!268070 () SeekEntryResult!6091)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!590837 (= res!377937 (and (= lt!268070 (Found!6091 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17695 a!2986) index!984) (select (arr!17695 a!2986) j!136))) (not (= (select (arr!17695 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36852 (_ BitVec 32)) SeekEntryResult!6091)

(assert (=> b!590837 (= lt!268070 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17695 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!590838 () Bool)

(declare-fun e!337324 () Bool)

(assert (=> b!590838 (= e!337324 e!337327)))

(declare-fun res!377940 () Bool)

(assert (=> b!590838 (=> (not res!377940) (not e!337327))))

(assert (=> b!590838 (= res!377940 (= (select (store (arr!17695 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!268065 () array!36852)

(assert (=> b!590838 (= lt!268065 (array!36853 (store (arr!17695 a!2986) i!1108 k0!1786) (size!18059 a!2986)))))

(declare-fun b!590839 () Bool)

(declare-fun res!377934 () Bool)

(assert (=> b!590839 (=> (not res!377934) (not e!337324))))

(declare-datatypes ((List!11643 0))(
  ( (Nil!11640) (Cons!11639 (h!12687 (_ BitVec 64)) (t!17863 List!11643)) )
))
(declare-fun arrayNoDuplicates!0 (array!36852 (_ BitVec 32) List!11643) Bool)

(assert (=> b!590839 (= res!377934 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11640))))

(declare-fun b!590840 () Bool)

(declare-fun e!337328 () Bool)

(declare-fun lt!268071 () SeekEntryResult!6091)

(assert (=> b!590840 (= e!337328 (= lt!268070 lt!268071))))

(declare-fun b!590841 () Bool)

(assert (=> b!590841 (= e!337326 (not e!337325))))

(declare-fun res!377932 () Bool)

(assert (=> b!590841 (=> res!377932 e!337325)))

(declare-fun lt!268064 () SeekEntryResult!6091)

(assert (=> b!590841 (= res!377932 (not (= lt!268064 (Found!6091 index!984))))))

(declare-fun lt!268072 () Unit!18457)

(assert (=> b!590841 (= lt!268072 e!337332)))

(declare-fun c!66821 () Bool)

(assert (=> b!590841 (= c!66821 (= lt!268064 Undefined!6091))))

(assert (=> b!590841 (= lt!268064 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268068 lt!268065 mask!3053))))

(assert (=> b!590841 e!337328))

(declare-fun res!377935 () Bool)

(assert (=> b!590841 (=> (not res!377935) (not e!337328))))

(declare-fun lt!268069 () (_ BitVec 32))

(assert (=> b!590841 (= res!377935 (= lt!268071 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268069 vacantSpotIndex!68 lt!268068 lt!268065 mask!3053)))))

(assert (=> b!590841 (= lt!268071 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268069 vacantSpotIndex!68 (select (arr!17695 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!590841 (= lt!268068 (select (store (arr!17695 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!268067 () Unit!18457)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36852 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18457)

(assert (=> b!590841 (= lt!268067 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268069 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!590841 (= lt!268069 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun res!377938 () Bool)

(assert (=> start!54120 (=> (not res!377938) (not e!337331))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54120 (= res!377938 (validMask!0 mask!3053))))

(assert (=> start!54120 e!337331))

(assert (=> start!54120 true))

(declare-fun array_inv!13554 (array!36852) Bool)

(assert (=> start!54120 (array_inv!13554 a!2986)))

(declare-fun b!590842 () Bool)

(assert (=> b!590842 (= e!337331 e!337324)))

(declare-fun res!377930 () Bool)

(assert (=> b!590842 (=> (not res!377930) (not e!337324))))

(declare-fun lt!268066 () SeekEntryResult!6091)

(assert (=> b!590842 (= res!377930 (or (= lt!268066 (MissingZero!6091 i!1108)) (= lt!268066 (MissingVacant!6091 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36852 (_ BitVec 32)) SeekEntryResult!6091)

(assert (=> b!590842 (= lt!268066 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!590843 () Bool)

(declare-fun res!377941 () Bool)

(assert (=> b!590843 (=> (not res!377941) (not e!337331))))

(assert (=> b!590843 (= res!377941 (and (= (size!18059 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18059 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18059 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!590844 () Bool)

(declare-fun Unit!18460 () Unit!18457)

(assert (=> b!590844 (= e!337332 Unit!18460)))

(declare-fun b!590845 () Bool)

(declare-fun res!377927 () Bool)

(assert (=> b!590845 (=> (not res!377927) (not e!337331))))

(assert (=> b!590845 (= res!377927 (validKeyInArray!0 k0!1786))))

(declare-fun b!590846 () Bool)

(declare-fun res!377928 () Bool)

(assert (=> b!590846 (=> (not res!377928) (not e!337324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36852 (_ BitVec 32)) Bool)

(assert (=> b!590846 (= res!377928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!590847 () Bool)

(declare-fun res!377939 () Bool)

(assert (=> b!590847 (=> (not res!377939) (not e!337324))))

(assert (=> b!590847 (= res!377939 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17695 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!590848 () Bool)

(assert (=> b!590848 (= e!337323 (arrayContainsKey!0 lt!268065 (select (arr!17695 a!2986) j!136) j!136))))

(assert (= (and start!54120 res!377938) b!590843))

(assert (= (and b!590843 res!377941) b!590833))

(assert (= (and b!590833 res!377933) b!590845))

(assert (= (and b!590845 res!377927) b!590832))

(assert (= (and b!590832 res!377931) b!590842))

(assert (= (and b!590842 res!377930) b!590846))

(assert (= (and b!590846 res!377928) b!590839))

(assert (= (and b!590839 res!377934) b!590847))

(assert (= (and b!590847 res!377939) b!590838))

(assert (= (and b!590838 res!377940) b!590837))

(assert (= (and b!590837 res!377937) b!590841))

(assert (= (and b!590841 res!377935) b!590840))

(assert (= (and b!590841 c!66821) b!590836))

(assert (= (and b!590841 (not c!66821)) b!590844))

(assert (= (and b!590841 (not res!377932)) b!590835))

(assert (= (and b!590835 res!377936) b!590834))

(assert (= (and b!590834 (not res!377929)) b!590848))

(declare-fun m!569375 () Bool)

(assert (=> b!590841 m!569375))

(declare-fun m!569377 () Bool)

(assert (=> b!590841 m!569377))

(declare-fun m!569379 () Bool)

(assert (=> b!590841 m!569379))

(declare-fun m!569381 () Bool)

(assert (=> b!590841 m!569381))

(declare-fun m!569383 () Bool)

(assert (=> b!590841 m!569383))

(assert (=> b!590841 m!569375))

(declare-fun m!569385 () Bool)

(assert (=> b!590841 m!569385))

(declare-fun m!569387 () Bool)

(assert (=> b!590841 m!569387))

(declare-fun m!569389 () Bool)

(assert (=> b!590841 m!569389))

(declare-fun m!569391 () Bool)

(assert (=> b!590837 m!569391))

(assert (=> b!590837 m!569375))

(assert (=> b!590837 m!569375))

(declare-fun m!569393 () Bool)

(assert (=> b!590837 m!569393))

(assert (=> b!590848 m!569375))

(assert (=> b!590848 m!569375))

(declare-fun m!569395 () Bool)

(assert (=> b!590848 m!569395))

(declare-fun m!569397 () Bool)

(assert (=> b!590846 m!569397))

(assert (=> b!590838 m!569385))

(declare-fun m!569399 () Bool)

(assert (=> b!590838 m!569399))

(assert (=> b!590835 m!569375))

(assert (=> b!590835 m!569385))

(declare-fun m!569401 () Bool)

(assert (=> b!590835 m!569401))

(declare-fun m!569403 () Bool)

(assert (=> start!54120 m!569403))

(declare-fun m!569405 () Bool)

(assert (=> start!54120 m!569405))

(assert (=> b!590833 m!569375))

(assert (=> b!590833 m!569375))

(declare-fun m!569407 () Bool)

(assert (=> b!590833 m!569407))

(declare-fun m!569409 () Bool)

(assert (=> b!590839 m!569409))

(declare-fun m!569411 () Bool)

(assert (=> b!590842 m!569411))

(declare-fun m!569413 () Bool)

(assert (=> b!590847 m!569413))

(declare-fun m!569415 () Bool)

(assert (=> b!590845 m!569415))

(assert (=> b!590834 m!569375))

(assert (=> b!590834 m!569385))

(assert (=> b!590834 m!569401))

(declare-fun m!569417 () Bool)

(assert (=> b!590832 m!569417))

(check-sat (not b!590845) (not b!590837) (not b!590833) (not b!590841) (not b!590839) (not b!590842) (not b!590832) (not start!54120) (not b!590846) (not b!590848))
(check-sat)
(get-model)

(declare-fun d!86229 () Bool)

(assert (=> d!86229 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!590845 d!86229))

(declare-fun b!590961 () Bool)

(declare-fun e!337403 () Bool)

(declare-fun e!337401 () Bool)

(assert (=> b!590961 (= e!337403 e!337401)))

(declare-fun res!378038 () Bool)

(assert (=> b!590961 (=> (not res!378038) (not e!337401))))

(declare-fun e!337402 () Bool)

(assert (=> b!590961 (= res!378038 (not e!337402))))

(declare-fun res!378040 () Bool)

(assert (=> b!590961 (=> (not res!378040) (not e!337402))))

(assert (=> b!590961 (= res!378040 (validKeyInArray!0 (select (arr!17695 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32817 () Bool)

(declare-fun call!32820 () Bool)

(declare-fun c!66830 () Bool)

(assert (=> bm!32817 (= call!32820 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66830 (Cons!11639 (select (arr!17695 a!2986) #b00000000000000000000000000000000) Nil!11640) Nil!11640)))))

(declare-fun d!86231 () Bool)

(declare-fun res!378039 () Bool)

(assert (=> d!86231 (=> res!378039 e!337403)))

(assert (=> d!86231 (= res!378039 (bvsge #b00000000000000000000000000000000 (size!18059 a!2986)))))

(assert (=> d!86231 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11640) e!337403)))

(declare-fun b!590962 () Bool)

(declare-fun e!337404 () Bool)

(assert (=> b!590962 (= e!337404 call!32820)))

(declare-fun b!590963 () Bool)

(declare-fun contains!2882 (List!11643 (_ BitVec 64)) Bool)

(assert (=> b!590963 (= e!337402 (contains!2882 Nil!11640 (select (arr!17695 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!590964 () Bool)

(assert (=> b!590964 (= e!337404 call!32820)))

(declare-fun b!590965 () Bool)

(assert (=> b!590965 (= e!337401 e!337404)))

(assert (=> b!590965 (= c!66830 (validKeyInArray!0 (select (arr!17695 a!2986) #b00000000000000000000000000000000)))))

(assert (= (and d!86231 (not res!378039)) b!590961))

(assert (= (and b!590961 res!378040) b!590963))

(assert (= (and b!590961 res!378038) b!590965))

(assert (= (and b!590965 c!66830) b!590964))

(assert (= (and b!590965 (not c!66830)) b!590962))

(assert (= (or b!590964 b!590962) bm!32817))

(declare-fun m!569507 () Bool)

(assert (=> b!590961 m!569507))

(assert (=> b!590961 m!569507))

(declare-fun m!569509 () Bool)

(assert (=> b!590961 m!569509))

(assert (=> bm!32817 m!569507))

(declare-fun m!569511 () Bool)

(assert (=> bm!32817 m!569511))

(assert (=> b!590963 m!569507))

(assert (=> b!590963 m!569507))

(declare-fun m!569513 () Bool)

(assert (=> b!590963 m!569513))

(assert (=> b!590965 m!569507))

(assert (=> b!590965 m!569507))

(assert (=> b!590965 m!569509))

(assert (=> b!590839 d!86231))

(declare-fun d!86233 () Bool)

(assert (=> d!86233 (= (validKeyInArray!0 (select (arr!17695 a!2986) j!136)) (and (not (= (select (arr!17695 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17695 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!590833 d!86233))

(declare-fun d!86235 () Bool)

(declare-fun res!378045 () Bool)

(declare-fun e!337409 () Bool)

(assert (=> d!86235 (=> res!378045 e!337409)))

(assert (=> d!86235 (= res!378045 (= (select (arr!17695 lt!268065) j!136) (select (arr!17695 a!2986) j!136)))))

(assert (=> d!86235 (= (arrayContainsKey!0 lt!268065 (select (arr!17695 a!2986) j!136) j!136) e!337409)))

(declare-fun b!590970 () Bool)

(declare-fun e!337410 () Bool)

(assert (=> b!590970 (= e!337409 e!337410)))

(declare-fun res!378046 () Bool)

(assert (=> b!590970 (=> (not res!378046) (not e!337410))))

(assert (=> b!590970 (= res!378046 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18059 lt!268065)))))

(declare-fun b!590971 () Bool)

(assert (=> b!590971 (= e!337410 (arrayContainsKey!0 lt!268065 (select (arr!17695 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86235 (not res!378045)) b!590970))

(assert (= (and b!590970 res!378046) b!590971))

(declare-fun m!569515 () Bool)

(assert (=> d!86235 m!569515))

(assert (=> b!590971 m!569375))

(declare-fun m!569517 () Bool)

(assert (=> b!590971 m!569517))

(assert (=> b!590848 d!86235))

(declare-fun d!86237 () Bool)

(declare-fun res!378047 () Bool)

(declare-fun e!337411 () Bool)

(assert (=> d!86237 (=> res!378047 e!337411)))

(assert (=> d!86237 (= res!378047 (= (select (arr!17695 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!86237 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!337411)))

(declare-fun b!590972 () Bool)

(declare-fun e!337412 () Bool)

(assert (=> b!590972 (= e!337411 e!337412)))

(declare-fun res!378048 () Bool)

(assert (=> b!590972 (=> (not res!378048) (not e!337412))))

(assert (=> b!590972 (= res!378048 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18059 a!2986)))))

(declare-fun b!590973 () Bool)

(assert (=> b!590973 (= e!337412 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86237 (not res!378047)) b!590972))

(assert (= (and b!590972 res!378048) b!590973))

(assert (=> d!86237 m!569507))

(declare-fun m!569519 () Bool)

(assert (=> b!590973 m!569519))

(assert (=> b!590832 d!86237))

(declare-fun b!590986 () Bool)

(declare-fun e!337419 () SeekEntryResult!6091)

(declare-fun lt!268134 () SeekEntryResult!6091)

(assert (=> b!590986 (= e!337419 (MissingZero!6091 (index!26599 lt!268134)))))

(declare-fun b!590987 () Bool)

(declare-fun e!337420 () SeekEntryResult!6091)

(declare-fun e!337421 () SeekEntryResult!6091)

(assert (=> b!590987 (= e!337420 e!337421)))

(declare-fun lt!268135 () (_ BitVec 64))

(assert (=> b!590987 (= lt!268135 (select (arr!17695 a!2986) (index!26599 lt!268134)))))

(declare-fun c!66837 () Bool)

(assert (=> b!590987 (= c!66837 (= lt!268135 k0!1786))))

(declare-fun b!590988 () Bool)

(declare-fun c!66838 () Bool)

(assert (=> b!590988 (= c!66838 (= lt!268135 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!590988 (= e!337421 e!337419)))

(declare-fun d!86239 () Bool)

(declare-fun lt!268133 () SeekEntryResult!6091)

(get-info :version)

(assert (=> d!86239 (and (or ((_ is Undefined!6091) lt!268133) (not ((_ is Found!6091) lt!268133)) (and (bvsge (index!26598 lt!268133) #b00000000000000000000000000000000) (bvslt (index!26598 lt!268133) (size!18059 a!2986)))) (or ((_ is Undefined!6091) lt!268133) ((_ is Found!6091) lt!268133) (not ((_ is MissingZero!6091) lt!268133)) (and (bvsge (index!26597 lt!268133) #b00000000000000000000000000000000) (bvslt (index!26597 lt!268133) (size!18059 a!2986)))) (or ((_ is Undefined!6091) lt!268133) ((_ is Found!6091) lt!268133) ((_ is MissingZero!6091) lt!268133) (not ((_ is MissingVacant!6091) lt!268133)) (and (bvsge (index!26600 lt!268133) #b00000000000000000000000000000000) (bvslt (index!26600 lt!268133) (size!18059 a!2986)))) (or ((_ is Undefined!6091) lt!268133) (ite ((_ is Found!6091) lt!268133) (= (select (arr!17695 a!2986) (index!26598 lt!268133)) k0!1786) (ite ((_ is MissingZero!6091) lt!268133) (= (select (arr!17695 a!2986) (index!26597 lt!268133)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6091) lt!268133) (= (select (arr!17695 a!2986) (index!26600 lt!268133)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!86239 (= lt!268133 e!337420)))

(declare-fun c!66839 () Bool)

(assert (=> d!86239 (= c!66839 (and ((_ is Intermediate!6091) lt!268134) (undefined!6903 lt!268134)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36852 (_ BitVec 32)) SeekEntryResult!6091)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86239 (= lt!268134 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!86239 (validMask!0 mask!3053)))

(assert (=> d!86239 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!268133)))

(declare-fun b!590989 () Bool)

(assert (=> b!590989 (= e!337419 (seekKeyOrZeroReturnVacant!0 (x!55541 lt!268134) (index!26599 lt!268134) (index!26599 lt!268134) k0!1786 a!2986 mask!3053))))

(declare-fun b!590990 () Bool)

(assert (=> b!590990 (= e!337420 Undefined!6091)))

(declare-fun b!590991 () Bool)

(assert (=> b!590991 (= e!337421 (Found!6091 (index!26599 lt!268134)))))

(assert (= (and d!86239 c!66839) b!590990))

(assert (= (and d!86239 (not c!66839)) b!590987))

(assert (= (and b!590987 c!66837) b!590991))

(assert (= (and b!590987 (not c!66837)) b!590988))

(assert (= (and b!590988 c!66838) b!590986))

(assert (= (and b!590988 (not c!66838)) b!590989))

(declare-fun m!569521 () Bool)

(assert (=> b!590987 m!569521))

(declare-fun m!569523 () Bool)

(assert (=> d!86239 m!569523))

(declare-fun m!569525 () Bool)

(assert (=> d!86239 m!569525))

(assert (=> d!86239 m!569403))

(declare-fun m!569527 () Bool)

(assert (=> d!86239 m!569527))

(assert (=> d!86239 m!569523))

(declare-fun m!569529 () Bool)

(assert (=> d!86239 m!569529))

(declare-fun m!569531 () Bool)

(assert (=> d!86239 m!569531))

(declare-fun m!569533 () Bool)

(assert (=> b!590989 m!569533))

(assert (=> b!590842 d!86239))

(declare-fun b!591012 () Bool)

(declare-fun e!337436 () SeekEntryResult!6091)

(assert (=> b!591012 (= e!337436 Undefined!6091)))

(declare-fun e!337434 () SeekEntryResult!6091)

(declare-fun b!591013 () Bool)

(assert (=> b!591013 (= e!337434 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17695 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591014 () Bool)

(declare-fun e!337435 () SeekEntryResult!6091)

(assert (=> b!591014 (= e!337436 e!337435)))

(declare-fun c!66848 () Bool)

(declare-fun lt!268140 () (_ BitVec 64))

(assert (=> b!591014 (= c!66848 (= lt!268140 (select (arr!17695 a!2986) j!136)))))

(declare-fun b!591016 () Bool)

(assert (=> b!591016 (= e!337435 (Found!6091 index!984))))

(declare-fun b!591017 () Bool)

(assert (=> b!591017 (= e!337434 (MissingVacant!6091 vacantSpotIndex!68))))

(declare-fun lt!268141 () SeekEntryResult!6091)

(declare-fun d!86241 () Bool)

(assert (=> d!86241 (and (or ((_ is Undefined!6091) lt!268141) (not ((_ is Found!6091) lt!268141)) (and (bvsge (index!26598 lt!268141) #b00000000000000000000000000000000) (bvslt (index!26598 lt!268141) (size!18059 a!2986)))) (or ((_ is Undefined!6091) lt!268141) ((_ is Found!6091) lt!268141) (not ((_ is MissingVacant!6091) lt!268141)) (not (= (index!26600 lt!268141) vacantSpotIndex!68)) (and (bvsge (index!26600 lt!268141) #b00000000000000000000000000000000) (bvslt (index!26600 lt!268141) (size!18059 a!2986)))) (or ((_ is Undefined!6091) lt!268141) (ite ((_ is Found!6091) lt!268141) (= (select (arr!17695 a!2986) (index!26598 lt!268141)) (select (arr!17695 a!2986) j!136)) (and ((_ is MissingVacant!6091) lt!268141) (= (index!26600 lt!268141) vacantSpotIndex!68) (= (select (arr!17695 a!2986) (index!26600 lt!268141)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86241 (= lt!268141 e!337436)))

(declare-fun c!66846 () Bool)

(assert (=> d!86241 (= c!66846 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86241 (= lt!268140 (select (arr!17695 a!2986) index!984))))

(assert (=> d!86241 (validMask!0 mask!3053)))

(assert (=> d!86241 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17695 a!2986) j!136) a!2986 mask!3053) lt!268141)))

(declare-fun b!591015 () Bool)

(declare-fun c!66847 () Bool)

(assert (=> b!591015 (= c!66847 (= lt!268140 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591015 (= e!337435 e!337434)))

(assert (= (and d!86241 c!66846) b!591012))

(assert (= (and d!86241 (not c!66846)) b!591014))

(assert (= (and b!591014 c!66848) b!591016))

(assert (= (and b!591014 (not c!66848)) b!591015))

(assert (= (and b!591015 c!66847) b!591017))

(assert (= (and b!591015 (not c!66847)) b!591013))

(declare-fun m!569535 () Bool)

(assert (=> b!591013 m!569535))

(assert (=> b!591013 m!569535))

(assert (=> b!591013 m!569375))

(declare-fun m!569537 () Bool)

(assert (=> b!591013 m!569537))

(declare-fun m!569539 () Bool)

(assert (=> d!86241 m!569539))

(declare-fun m!569541 () Bool)

(assert (=> d!86241 m!569541))

(assert (=> d!86241 m!569391))

(assert (=> d!86241 m!569403))

(assert (=> b!590837 d!86241))

(declare-fun d!86247 () Bool)

(assert (=> d!86247 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54120 d!86247))

(declare-fun d!86253 () Bool)

(assert (=> d!86253 (= (array_inv!13554 a!2986) (bvsge (size!18059 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54120 d!86253))

(declare-fun b!591075 () Bool)

(declare-fun e!337473 () Bool)

(declare-fun call!32829 () Bool)

(assert (=> b!591075 (= e!337473 call!32829)))

(declare-fun bm!32826 () Bool)

(assert (=> bm!32826 (= call!32829 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!591076 () Bool)

(declare-fun e!337474 () Bool)

(assert (=> b!591076 (= e!337474 e!337473)))

(declare-fun lt!268169 () (_ BitVec 64))

(assert (=> b!591076 (= lt!268169 (select (arr!17695 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!268168 () Unit!18457)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36852 (_ BitVec 64) (_ BitVec 32)) Unit!18457)

(assert (=> b!591076 (= lt!268168 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!268169 #b00000000000000000000000000000000))))

(assert (=> b!591076 (arrayContainsKey!0 a!2986 lt!268169 #b00000000000000000000000000000000)))

(declare-fun lt!268167 () Unit!18457)

(assert (=> b!591076 (= lt!268167 lt!268168)))

(declare-fun res!378069 () Bool)

(assert (=> b!591076 (= res!378069 (= (seekEntryOrOpen!0 (select (arr!17695 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6091 #b00000000000000000000000000000000)))))

(assert (=> b!591076 (=> (not res!378069) (not e!337473))))

(declare-fun b!591077 () Bool)

(declare-fun e!337475 () Bool)

(assert (=> b!591077 (= e!337475 e!337474)))

(declare-fun c!66872 () Bool)

(assert (=> b!591077 (= c!66872 (validKeyInArray!0 (select (arr!17695 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86255 () Bool)

(declare-fun res!378068 () Bool)

(assert (=> d!86255 (=> res!378068 e!337475)))

(assert (=> d!86255 (= res!378068 (bvsge #b00000000000000000000000000000000 (size!18059 a!2986)))))

(assert (=> d!86255 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!337475)))

(declare-fun b!591078 () Bool)

(assert (=> b!591078 (= e!337474 call!32829)))

(assert (= (and d!86255 (not res!378068)) b!591077))

(assert (= (and b!591077 c!66872) b!591076))

(assert (= (and b!591077 (not c!66872)) b!591078))

(assert (= (and b!591076 res!378069) b!591075))

(assert (= (or b!591075 b!591078) bm!32826))

(declare-fun m!569573 () Bool)

(assert (=> bm!32826 m!569573))

(assert (=> b!591076 m!569507))

(declare-fun m!569575 () Bool)

(assert (=> b!591076 m!569575))

(declare-fun m!569577 () Bool)

(assert (=> b!591076 m!569577))

(assert (=> b!591076 m!569507))

(declare-fun m!569579 () Bool)

(assert (=> b!591076 m!569579))

(assert (=> b!591077 m!569507))

(assert (=> b!591077 m!569507))

(assert (=> b!591077 m!569509))

(assert (=> b!590846 d!86255))

(declare-fun d!86259 () Bool)

(declare-fun e!337486 () Bool)

(assert (=> d!86259 e!337486))

(declare-fun res!378074 () Bool)

(assert (=> d!86259 (=> (not res!378074) (not e!337486))))

(assert (=> d!86259 (= res!378074 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18059 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18059 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18059 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18059 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18059 a!2986))))))

(declare-fun lt!268178 () Unit!18457)

(declare-fun choose!9 (array!36852 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18457)

(assert (=> d!86259 (= lt!268178 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268069 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86259 (validMask!0 mask!3053)))

(assert (=> d!86259 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!268069 vacantSpotIndex!68 mask!3053) lt!268178)))

(declare-fun b!591095 () Bool)

(assert (=> b!591095 (= e!337486 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268069 vacantSpotIndex!68 (select (arr!17695 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268069 vacantSpotIndex!68 (select (store (arr!17695 a!2986) i!1108 k0!1786) j!136) (array!36853 (store (arr!17695 a!2986) i!1108 k0!1786) (size!18059 a!2986)) mask!3053)))))

(assert (= (and d!86259 res!378074) b!591095))

(declare-fun m!569597 () Bool)

(assert (=> d!86259 m!569597))

(assert (=> d!86259 m!569403))

(assert (=> b!591095 m!569381))

(assert (=> b!591095 m!569375))

(assert (=> b!591095 m!569377))

(assert (=> b!591095 m!569381))

(declare-fun m!569599 () Bool)

(assert (=> b!591095 m!569599))

(assert (=> b!591095 m!569385))

(assert (=> b!591095 m!569375))

(assert (=> b!590841 d!86259))

(declare-fun b!591097 () Bool)

(declare-fun e!337490 () SeekEntryResult!6091)

(assert (=> b!591097 (= e!337490 Undefined!6091)))

(declare-fun e!337488 () SeekEntryResult!6091)

(declare-fun b!591098 () Bool)

(assert (=> b!591098 (= e!337488 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!268069 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!17695 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!591099 () Bool)

(declare-fun e!337489 () SeekEntryResult!6091)

(assert (=> b!591099 (= e!337490 e!337489)))

(declare-fun lt!268180 () (_ BitVec 64))

(declare-fun c!66881 () Bool)

(assert (=> b!591099 (= c!66881 (= lt!268180 (select (arr!17695 a!2986) j!136)))))

(declare-fun b!591101 () Bool)

(assert (=> b!591101 (= e!337489 (Found!6091 lt!268069))))

(declare-fun b!591102 () Bool)

(assert (=> b!591102 (= e!337488 (MissingVacant!6091 vacantSpotIndex!68))))

(declare-fun d!86269 () Bool)

(declare-fun lt!268181 () SeekEntryResult!6091)

(assert (=> d!86269 (and (or ((_ is Undefined!6091) lt!268181) (not ((_ is Found!6091) lt!268181)) (and (bvsge (index!26598 lt!268181) #b00000000000000000000000000000000) (bvslt (index!26598 lt!268181) (size!18059 a!2986)))) (or ((_ is Undefined!6091) lt!268181) ((_ is Found!6091) lt!268181) (not ((_ is MissingVacant!6091) lt!268181)) (not (= (index!26600 lt!268181) vacantSpotIndex!68)) (and (bvsge (index!26600 lt!268181) #b00000000000000000000000000000000) (bvslt (index!26600 lt!268181) (size!18059 a!2986)))) (or ((_ is Undefined!6091) lt!268181) (ite ((_ is Found!6091) lt!268181) (= (select (arr!17695 a!2986) (index!26598 lt!268181)) (select (arr!17695 a!2986) j!136)) (and ((_ is MissingVacant!6091) lt!268181) (= (index!26600 lt!268181) vacantSpotIndex!68) (= (select (arr!17695 a!2986) (index!26600 lt!268181)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86269 (= lt!268181 e!337490)))

(declare-fun c!66879 () Bool)

(assert (=> d!86269 (= c!66879 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86269 (= lt!268180 (select (arr!17695 a!2986) lt!268069))))

(assert (=> d!86269 (validMask!0 mask!3053)))

(assert (=> d!86269 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268069 vacantSpotIndex!68 (select (arr!17695 a!2986) j!136) a!2986 mask!3053) lt!268181)))

(declare-fun b!591100 () Bool)

(declare-fun c!66880 () Bool)

(assert (=> b!591100 (= c!66880 (= lt!268180 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591100 (= e!337489 e!337488)))

(assert (= (and d!86269 c!66879) b!591097))

(assert (= (and d!86269 (not c!66879)) b!591099))

(assert (= (and b!591099 c!66881) b!591101))

(assert (= (and b!591099 (not c!66881)) b!591100))

(assert (= (and b!591100 c!66880) b!591102))

(assert (= (and b!591100 (not c!66880)) b!591098))

(declare-fun m!569605 () Bool)

(assert (=> b!591098 m!569605))

(assert (=> b!591098 m!569605))

(assert (=> b!591098 m!569375))

(declare-fun m!569607 () Bool)

(assert (=> b!591098 m!569607))

(declare-fun m!569609 () Bool)

(assert (=> d!86269 m!569609))

(declare-fun m!569611 () Bool)

(assert (=> d!86269 m!569611))

(declare-fun m!569615 () Bool)

(assert (=> d!86269 m!569615))

(assert (=> d!86269 m!569403))

(assert (=> b!590841 d!86269))

(declare-fun b!591111 () Bool)

(declare-fun e!337498 () SeekEntryResult!6091)

(assert (=> b!591111 (= e!337498 Undefined!6091)))

(declare-fun e!337496 () SeekEntryResult!6091)

(declare-fun b!591112 () Bool)

(assert (=> b!591112 (= e!337496 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!268068 lt!268065 mask!3053))))

(declare-fun b!591113 () Bool)

(declare-fun e!337497 () SeekEntryResult!6091)

(assert (=> b!591113 (= e!337498 e!337497)))

(declare-fun c!66887 () Bool)

(declare-fun lt!268184 () (_ BitVec 64))

(assert (=> b!591113 (= c!66887 (= lt!268184 lt!268068))))

(declare-fun b!591115 () Bool)

(assert (=> b!591115 (= e!337497 (Found!6091 index!984))))

(declare-fun b!591116 () Bool)

(assert (=> b!591116 (= e!337496 (MissingVacant!6091 vacantSpotIndex!68))))

(declare-fun lt!268185 () SeekEntryResult!6091)

(declare-fun d!86273 () Bool)

(assert (=> d!86273 (and (or ((_ is Undefined!6091) lt!268185) (not ((_ is Found!6091) lt!268185)) (and (bvsge (index!26598 lt!268185) #b00000000000000000000000000000000) (bvslt (index!26598 lt!268185) (size!18059 lt!268065)))) (or ((_ is Undefined!6091) lt!268185) ((_ is Found!6091) lt!268185) (not ((_ is MissingVacant!6091) lt!268185)) (not (= (index!26600 lt!268185) vacantSpotIndex!68)) (and (bvsge (index!26600 lt!268185) #b00000000000000000000000000000000) (bvslt (index!26600 lt!268185) (size!18059 lt!268065)))) (or ((_ is Undefined!6091) lt!268185) (ite ((_ is Found!6091) lt!268185) (= (select (arr!17695 lt!268065) (index!26598 lt!268185)) lt!268068) (and ((_ is MissingVacant!6091) lt!268185) (= (index!26600 lt!268185) vacantSpotIndex!68) (= (select (arr!17695 lt!268065) (index!26600 lt!268185)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86273 (= lt!268185 e!337498)))

(declare-fun c!66885 () Bool)

(assert (=> d!86273 (= c!66885 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86273 (= lt!268184 (select (arr!17695 lt!268065) index!984))))

(assert (=> d!86273 (validMask!0 mask!3053)))

(assert (=> d!86273 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!268068 lt!268065 mask!3053) lt!268185)))

(declare-fun b!591114 () Bool)

(declare-fun c!66886 () Bool)

(assert (=> b!591114 (= c!66886 (= lt!268184 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591114 (= e!337497 e!337496)))

(assert (= (and d!86273 c!66885) b!591111))

(assert (= (and d!86273 (not c!66885)) b!591113))

(assert (= (and b!591113 c!66887) b!591115))

(assert (= (and b!591113 (not c!66887)) b!591114))

(assert (= (and b!591114 c!66886) b!591116))

(assert (= (and b!591114 (not c!66886)) b!591112))

(assert (=> b!591112 m!569535))

(assert (=> b!591112 m!569535))

(declare-fun m!569625 () Bool)

(assert (=> b!591112 m!569625))

(declare-fun m!569627 () Bool)

(assert (=> d!86273 m!569627))

(declare-fun m!569629 () Bool)

(assert (=> d!86273 m!569629))

(declare-fun m!569631 () Bool)

(assert (=> d!86273 m!569631))

(assert (=> d!86273 m!569403))

(assert (=> b!590841 d!86273))

(declare-fun b!591125 () Bool)

(declare-fun e!337507 () SeekEntryResult!6091)

(assert (=> b!591125 (= e!337507 Undefined!6091)))

(declare-fun e!337505 () SeekEntryResult!6091)

(declare-fun b!591126 () Bool)

(assert (=> b!591126 (= e!337505 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!268069 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!268068 lt!268065 mask!3053))))

(declare-fun b!591127 () Bool)

(declare-fun e!337506 () SeekEntryResult!6091)

(assert (=> b!591127 (= e!337507 e!337506)))

(declare-fun c!66892 () Bool)

(declare-fun lt!268186 () (_ BitVec 64))

(assert (=> b!591127 (= c!66892 (= lt!268186 lt!268068))))

(declare-fun b!591129 () Bool)

(assert (=> b!591129 (= e!337506 (Found!6091 lt!268069))))

(declare-fun b!591130 () Bool)

(assert (=> b!591130 (= e!337505 (MissingVacant!6091 vacantSpotIndex!68))))

(declare-fun d!86277 () Bool)

(declare-fun lt!268187 () SeekEntryResult!6091)

(assert (=> d!86277 (and (or ((_ is Undefined!6091) lt!268187) (not ((_ is Found!6091) lt!268187)) (and (bvsge (index!26598 lt!268187) #b00000000000000000000000000000000) (bvslt (index!26598 lt!268187) (size!18059 lt!268065)))) (or ((_ is Undefined!6091) lt!268187) ((_ is Found!6091) lt!268187) (not ((_ is MissingVacant!6091) lt!268187)) (not (= (index!26600 lt!268187) vacantSpotIndex!68)) (and (bvsge (index!26600 lt!268187) #b00000000000000000000000000000000) (bvslt (index!26600 lt!268187) (size!18059 lt!268065)))) (or ((_ is Undefined!6091) lt!268187) (ite ((_ is Found!6091) lt!268187) (= (select (arr!17695 lt!268065) (index!26598 lt!268187)) lt!268068) (and ((_ is MissingVacant!6091) lt!268187) (= (index!26600 lt!268187) vacantSpotIndex!68) (= (select (arr!17695 lt!268065) (index!26600 lt!268187)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86277 (= lt!268187 e!337507)))

(declare-fun c!66890 () Bool)

(assert (=> d!86277 (= c!66890 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86277 (= lt!268186 (select (arr!17695 lt!268065) lt!268069))))

(assert (=> d!86277 (validMask!0 mask!3053)))

(assert (=> d!86277 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!268069 vacantSpotIndex!68 lt!268068 lt!268065 mask!3053) lt!268187)))

(declare-fun b!591128 () Bool)

(declare-fun c!66891 () Bool)

(assert (=> b!591128 (= c!66891 (= lt!268186 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!591128 (= e!337506 e!337505)))

(assert (= (and d!86277 c!66890) b!591125))

(assert (= (and d!86277 (not c!66890)) b!591127))

(assert (= (and b!591127 c!66892) b!591129))

(assert (= (and b!591127 (not c!66892)) b!591128))

(assert (= (and b!591128 c!66891) b!591130))

(assert (= (and b!591128 (not c!66891)) b!591126))

(assert (=> b!591126 m!569605))

(assert (=> b!591126 m!569605))

(declare-fun m!569633 () Bool)

(assert (=> b!591126 m!569633))

(declare-fun m!569635 () Bool)

(assert (=> d!86277 m!569635))

(declare-fun m!569637 () Bool)

(assert (=> d!86277 m!569637))

(declare-fun m!569639 () Bool)

(assert (=> d!86277 m!569639))

(assert (=> d!86277 m!569403))

(assert (=> b!590841 d!86277))

(declare-fun d!86279 () Bool)

(declare-fun lt!268193 () (_ BitVec 32))

(assert (=> d!86279 (and (bvsge lt!268193 #b00000000000000000000000000000000) (bvslt lt!268193 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86279 (= lt!268193 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!86279 (validMask!0 mask!3053)))

(assert (=> d!86279 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!268193)))

(declare-fun bs!18279 () Bool)

(assert (= bs!18279 d!86279))

(declare-fun m!569647 () Bool)

(assert (=> bs!18279 m!569647))

(assert (=> bs!18279 m!569403))

(assert (=> b!590841 d!86279))

(check-sat (not b!591013) (not b!591112) (not b!590963) (not b!591076) (not b!590989) (not b!590973) (not d!86277) (not d!86279) (not d!86241) (not d!86273) (not b!590971) (not b!591095) (not b!591098) (not b!590965) (not bm!32817) (not d!86239) (not b!591077) (not d!86259) (not bm!32826) (not b!590961) (not d!86269) (not b!591126))
(check-sat)
