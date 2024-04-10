; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54732 () Bool)

(assert start!54732)

(declare-fun b!597986 () Bool)

(declare-fun e!341764 () Bool)

(declare-fun e!341771 () Bool)

(assert (=> b!597986 (= e!341764 e!341771)))

(declare-fun res!383279 () Bool)

(assert (=> b!597986 (=> (not res!383279) (not e!341771))))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37048 0))(
  ( (array!37049 (arr!17785 (Array (_ BitVec 32) (_ BitVec 64))) (size!18149 (_ BitVec 32))) )
))
(declare-fun lt!271670 () array!37048)

(declare-fun a!2986 () array!37048)

(declare-fun arrayContainsKey!0 (array!37048 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!597986 (= res!383279 (arrayContainsKey!0 lt!271670 (select (arr!17785 a!2986) j!136) j!136))))

(declare-fun b!597987 () Bool)

(declare-fun res!383280 () Bool)

(declare-fun e!341774 () Bool)

(assert (=> b!597987 (=> (not res!383280) (not e!341774))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37048 (_ BitVec 32)) Bool)

(assert (=> b!597987 (= res!383280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!597988 () Bool)

(declare-fun e!341768 () Bool)

(declare-fun e!341766 () Bool)

(assert (=> b!597988 (= e!341768 e!341766)))

(declare-fun res!383287 () Bool)

(assert (=> b!597988 (=> (not res!383287) (not e!341766))))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6225 0))(
  ( (MissingZero!6225 (index!27154 (_ BitVec 32))) (Found!6225 (index!27155 (_ BitVec 32))) (Intermediate!6225 (undefined!7037 Bool) (index!27156 (_ BitVec 32)) (x!55959 (_ BitVec 32))) (Undefined!6225) (MissingVacant!6225 (index!27157 (_ BitVec 32))) )
))
(declare-fun lt!271679 () SeekEntryResult!6225)

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!597988 (= res!383287 (and (= lt!271679 (Found!6225 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17785 a!2986) index!984) (select (arr!17785 a!2986) j!136))) (not (= (select (arr!17785 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37048 (_ BitVec 32)) SeekEntryResult!6225)

(assert (=> b!597988 (= lt!271679 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17785 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597989 () Bool)

(declare-fun e!341767 () Bool)

(assert (=> b!597989 (= e!341766 (not e!341767))))

(declare-fun res!383285 () Bool)

(assert (=> b!597989 (=> res!383285 e!341767)))

(declare-fun lt!271676 () SeekEntryResult!6225)

(assert (=> b!597989 (= res!383285 (not (= lt!271676 (Found!6225 index!984))))))

(declare-datatypes ((Unit!18818 0))(
  ( (Unit!18819) )
))
(declare-fun lt!271681 () Unit!18818)

(declare-fun e!341770 () Unit!18818)

(assert (=> b!597989 (= lt!271681 e!341770)))

(declare-fun c!67721 () Bool)

(assert (=> b!597989 (= c!67721 (= lt!271676 Undefined!6225))))

(declare-fun lt!271680 () (_ BitVec 64))

(assert (=> b!597989 (= lt!271676 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271680 lt!271670 mask!3053))))

(declare-fun e!341769 () Bool)

(assert (=> b!597989 e!341769))

(declare-fun res!383286 () Bool)

(assert (=> b!597989 (=> (not res!383286) (not e!341769))))

(declare-fun lt!271677 () SeekEntryResult!6225)

(declare-fun lt!271672 () (_ BitVec 32))

(assert (=> b!597989 (= res!383286 (= lt!271677 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271672 vacantSpotIndex!68 lt!271680 lt!271670 mask!3053)))))

(assert (=> b!597989 (= lt!271677 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271672 vacantSpotIndex!68 (select (arr!17785 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!597989 (= lt!271680 (select (store (arr!17785 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!271673 () Unit!18818)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37048 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18818)

(assert (=> b!597989 (= lt!271673 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271672 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!597989 (= lt!271672 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!597990 () Bool)

(declare-fun e!341773 () Bool)

(assert (=> b!597990 (= e!341773 e!341774)))

(declare-fun res!383282 () Bool)

(assert (=> b!597990 (=> (not res!383282) (not e!341774))))

(declare-fun lt!271678 () SeekEntryResult!6225)

(assert (=> b!597990 (= res!383282 (or (= lt!271678 (MissingZero!6225 i!1108)) (= lt!271678 (MissingVacant!6225 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37048 (_ BitVec 32)) SeekEntryResult!6225)

(assert (=> b!597990 (= lt!271678 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!597991 () Bool)

(declare-fun e!341762 () Bool)

(assert (=> b!597991 (= e!341767 e!341762)))

(declare-fun res!383294 () Bool)

(assert (=> b!597991 (=> res!383294 e!341762)))

(declare-fun lt!271674 () (_ BitVec 64))

(assert (=> b!597991 (= res!383294 (or (not (= (select (arr!17785 a!2986) j!136) lt!271680)) (not (= (select (arr!17785 a!2986) j!136) lt!271674)) (bvsge j!136 index!984)))))

(declare-fun e!341772 () Bool)

(assert (=> b!597991 e!341772))

(declare-fun res!383284 () Bool)

(assert (=> b!597991 (=> (not res!383284) (not e!341772))))

(assert (=> b!597991 (= res!383284 (= lt!271674 (select (arr!17785 a!2986) j!136)))))

(assert (=> b!597991 (= lt!271674 (select (store (arr!17785 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!597992 () Bool)

(assert (=> b!597992 (= e!341771 (arrayContainsKey!0 lt!271670 (select (arr!17785 a!2986) j!136) index!984))))

(declare-fun b!597993 () Bool)

(declare-fun res!383283 () Bool)

(assert (=> b!597993 (=> (not res!383283) (not e!341773))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!597993 (= res!383283 (validKeyInArray!0 k0!1786))))

(declare-fun b!597994 () Bool)

(assert (=> b!597994 (= e!341772 e!341764)))

(declare-fun res!383296 () Bool)

(assert (=> b!597994 (=> res!383296 e!341764)))

(assert (=> b!597994 (= res!383296 (or (not (= (select (arr!17785 a!2986) j!136) lt!271680)) (not (= (select (arr!17785 a!2986) j!136) lt!271674)) (bvsge j!136 index!984)))))

(declare-fun b!597995 () Bool)

(declare-fun res!383292 () Bool)

(assert (=> b!597995 (=> (not res!383292) (not e!341773))))

(assert (=> b!597995 (= res!383292 (validKeyInArray!0 (select (arr!17785 a!2986) j!136)))))

(declare-fun b!597996 () Bool)

(declare-fun res!383297 () Bool)

(assert (=> b!597996 (=> (not res!383297) (not e!341774))))

(assert (=> b!597996 (= res!383297 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17785 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!597997 () Bool)

(declare-fun res!383281 () Bool)

(assert (=> b!597997 (=> (not res!383281) (not e!341773))))

(assert (=> b!597997 (= res!383281 (and (= (size!18149 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18149 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18149 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!597998 () Bool)

(declare-fun res!383291 () Bool)

(assert (=> b!597998 (=> (not res!383291) (not e!341774))))

(declare-datatypes ((List!11826 0))(
  ( (Nil!11823) (Cons!11822 (h!12867 (_ BitVec 64)) (t!18054 List!11826)) )
))
(declare-fun arrayNoDuplicates!0 (array!37048 (_ BitVec 32) List!11826) Bool)

(assert (=> b!597998 (= res!383291 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11823))))

(declare-fun b!597999 () Bool)

(declare-fun res!383289 () Bool)

(assert (=> b!597999 (=> (not res!383289) (not e!341773))))

(assert (=> b!597999 (= res!383289 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!598000 () Bool)

(declare-fun e!341765 () Bool)

(assert (=> b!598000 (= e!341762 e!341765)))

(declare-fun res!383295 () Bool)

(assert (=> b!598000 (=> res!383295 e!341765)))

(assert (=> b!598000 (= res!383295 (or (bvsgt #b00000000000000000000000000000000 (size!18149 a!2986)) (bvsge (size!18149 a!2986) #b01111111111111111111111111111111)))))

(assert (=> b!598000 (arrayNoDuplicates!0 lt!271670 #b00000000000000000000000000000000 Nil!11823)))

(declare-fun lt!271671 () Unit!18818)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37048 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11826) Unit!18818)

(assert (=> b!598000 (= lt!271671 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11823))))

(assert (=> b!598000 (arrayContainsKey!0 lt!271670 (select (arr!17785 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271675 () Unit!18818)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37048 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18818)

(assert (=> b!598000 (= lt!271675 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271670 (select (arr!17785 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!598001 () Bool)

(declare-fun Unit!18820 () Unit!18818)

(assert (=> b!598001 (= e!341770 Unit!18820)))

(assert (=> b!598001 false))

(declare-fun b!598002 () Bool)

(declare-fun e!341775 () Bool)

(declare-fun contains!2957 (List!11826 (_ BitVec 64)) Bool)

(assert (=> b!598002 (= e!341775 (not (contains!2957 Nil!11823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!598003 () Bool)

(assert (=> b!598003 (= e!341774 e!341768)))

(declare-fun res!383278 () Bool)

(assert (=> b!598003 (=> (not res!383278) (not e!341768))))

(assert (=> b!598003 (= res!383278 (= (select (store (arr!17785 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598003 (= lt!271670 (array!37049 (store (arr!17785 a!2986) i!1108 k0!1786) (size!18149 a!2986)))))

(declare-fun b!598004 () Bool)

(assert (=> b!598004 (= e!341769 (= lt!271679 lt!271677))))

(declare-fun b!598005 () Bool)

(declare-fun Unit!18821 () Unit!18818)

(assert (=> b!598005 (= e!341770 Unit!18821)))

(declare-fun b!598006 () Bool)

(declare-fun res!383293 () Bool)

(assert (=> b!598006 (=> res!383293 e!341765)))

(declare-fun noDuplicate!274 (List!11826) Bool)

(assert (=> b!598006 (= res!383293 (not (noDuplicate!274 Nil!11823)))))

(declare-fun res!383290 () Bool)

(assert (=> start!54732 (=> (not res!383290) (not e!341773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54732 (= res!383290 (validMask!0 mask!3053))))

(assert (=> start!54732 e!341773))

(assert (=> start!54732 true))

(declare-fun array_inv!13581 (array!37048) Bool)

(assert (=> start!54732 (array_inv!13581 a!2986)))

(declare-fun b!598007 () Bool)

(assert (=> b!598007 (= e!341765 e!341775)))

(declare-fun res!383288 () Bool)

(assert (=> b!598007 (=> (not res!383288) (not e!341775))))

(assert (=> b!598007 (= res!383288 (not (contains!2957 Nil!11823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!54732 res!383290) b!597997))

(assert (= (and b!597997 res!383281) b!597995))

(assert (= (and b!597995 res!383292) b!597993))

(assert (= (and b!597993 res!383283) b!597999))

(assert (= (and b!597999 res!383289) b!597990))

(assert (= (and b!597990 res!383282) b!597987))

(assert (= (and b!597987 res!383280) b!597998))

(assert (= (and b!597998 res!383291) b!597996))

(assert (= (and b!597996 res!383297) b!598003))

(assert (= (and b!598003 res!383278) b!597988))

(assert (= (and b!597988 res!383287) b!597989))

(assert (= (and b!597989 res!383286) b!598004))

(assert (= (and b!597989 c!67721) b!598001))

(assert (= (and b!597989 (not c!67721)) b!598005))

(assert (= (and b!597989 (not res!383285)) b!597991))

(assert (= (and b!597991 res!383284) b!597994))

(assert (= (and b!597994 (not res!383296)) b!597986))

(assert (= (and b!597986 res!383279) b!597992))

(assert (= (and b!597991 (not res!383294)) b!598000))

(assert (= (and b!598000 (not res!383295)) b!598006))

(assert (= (and b!598006 (not res!383293)) b!598007))

(assert (= (and b!598007 res!383288) b!598002))

(declare-fun m!575327 () Bool)

(assert (=> b!597988 m!575327))

(declare-fun m!575329 () Bool)

(assert (=> b!597988 m!575329))

(assert (=> b!597988 m!575329))

(declare-fun m!575331 () Bool)

(assert (=> b!597988 m!575331))

(assert (=> b!597994 m!575329))

(declare-fun m!575333 () Bool)

(assert (=> start!54732 m!575333))

(declare-fun m!575335 () Bool)

(assert (=> start!54732 m!575335))

(declare-fun m!575337 () Bool)

(assert (=> b!597990 m!575337))

(declare-fun m!575339 () Bool)

(assert (=> b!597987 m!575339))

(assert (=> b!597992 m!575329))

(assert (=> b!597992 m!575329))

(declare-fun m!575341 () Bool)

(assert (=> b!597992 m!575341))

(declare-fun m!575343 () Bool)

(assert (=> b!598002 m!575343))

(declare-fun m!575345 () Bool)

(assert (=> b!597996 m!575345))

(declare-fun m!575347 () Bool)

(assert (=> b!597993 m!575347))

(declare-fun m!575349 () Bool)

(assert (=> b!597999 m!575349))

(declare-fun m!575351 () Bool)

(assert (=> b!597989 m!575351))

(declare-fun m!575353 () Bool)

(assert (=> b!597989 m!575353))

(assert (=> b!597989 m!575329))

(declare-fun m!575355 () Bool)

(assert (=> b!597989 m!575355))

(declare-fun m!575357 () Bool)

(assert (=> b!597989 m!575357))

(assert (=> b!597989 m!575329))

(declare-fun m!575359 () Bool)

(assert (=> b!597989 m!575359))

(declare-fun m!575361 () Bool)

(assert (=> b!597989 m!575361))

(declare-fun m!575363 () Bool)

(assert (=> b!597989 m!575363))

(assert (=> b!598000 m!575329))

(declare-fun m!575365 () Bool)

(assert (=> b!598000 m!575365))

(assert (=> b!598000 m!575329))

(assert (=> b!598000 m!575329))

(declare-fun m!575367 () Bool)

(assert (=> b!598000 m!575367))

(declare-fun m!575369 () Bool)

(assert (=> b!598000 m!575369))

(declare-fun m!575371 () Bool)

(assert (=> b!598000 m!575371))

(assert (=> b!598003 m!575357))

(declare-fun m!575373 () Bool)

(assert (=> b!598003 m!575373))

(assert (=> b!597991 m!575329))

(assert (=> b!597991 m!575357))

(declare-fun m!575375 () Bool)

(assert (=> b!597991 m!575375))

(declare-fun m!575377 () Bool)

(assert (=> b!598007 m!575377))

(declare-fun m!575379 () Bool)

(assert (=> b!598006 m!575379))

(assert (=> b!597995 m!575329))

(assert (=> b!597995 m!575329))

(declare-fun m!575381 () Bool)

(assert (=> b!597995 m!575381))

(assert (=> b!597986 m!575329))

(assert (=> b!597986 m!575329))

(declare-fun m!575383 () Bool)

(assert (=> b!597986 m!575383))

(declare-fun m!575385 () Bool)

(assert (=> b!597998 m!575385))

(check-sat (not b!597998) (not b!597999) (not b!598007) (not b!597987) (not b!597988) (not b!597989) (not b!597986) (not start!54732) (not b!597990) (not b!598000) (not b!597995) (not b!597993) (not b!597992) (not b!598002) (not b!598006))
(check-sat)
(get-model)

(declare-fun b!598086 () Bool)

(declare-fun e!341826 () SeekEntryResult!6225)

(assert (=> b!598086 (= e!341826 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 (select (arr!17785 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!598087 () Bool)

(declare-fun e!341825 () SeekEntryResult!6225)

(declare-fun e!341824 () SeekEntryResult!6225)

(assert (=> b!598087 (= e!341825 e!341824)))

(declare-fun lt!271723 () (_ BitVec 64))

(declare-fun c!67732 () Bool)

(assert (=> b!598087 (= c!67732 (= lt!271723 (select (arr!17785 a!2986) j!136)))))

(declare-fun lt!271722 () SeekEntryResult!6225)

(declare-fun d!86965 () Bool)

(get-info :version)

(assert (=> d!86965 (and (or ((_ is Undefined!6225) lt!271722) (not ((_ is Found!6225) lt!271722)) (and (bvsge (index!27155 lt!271722) #b00000000000000000000000000000000) (bvslt (index!27155 lt!271722) (size!18149 a!2986)))) (or ((_ is Undefined!6225) lt!271722) ((_ is Found!6225) lt!271722) (not ((_ is MissingVacant!6225) lt!271722)) (not (= (index!27157 lt!271722) vacantSpotIndex!68)) (and (bvsge (index!27157 lt!271722) #b00000000000000000000000000000000) (bvslt (index!27157 lt!271722) (size!18149 a!2986)))) (or ((_ is Undefined!6225) lt!271722) (ite ((_ is Found!6225) lt!271722) (= (select (arr!17785 a!2986) (index!27155 lt!271722)) (select (arr!17785 a!2986) j!136)) (and ((_ is MissingVacant!6225) lt!271722) (= (index!27157 lt!271722) vacantSpotIndex!68) (= (select (arr!17785 a!2986) (index!27157 lt!271722)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86965 (= lt!271722 e!341825)))

(declare-fun c!67733 () Bool)

(assert (=> d!86965 (= c!67733 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86965 (= lt!271723 (select (arr!17785 a!2986) index!984))))

(assert (=> d!86965 (validMask!0 mask!3053)))

(assert (=> d!86965 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17785 a!2986) j!136) a!2986 mask!3053) lt!271722)))

(declare-fun b!598088 () Bool)

(assert (=> b!598088 (= e!341825 Undefined!6225)))

(declare-fun b!598089 () Bool)

(assert (=> b!598089 (= e!341824 (Found!6225 index!984))))

(declare-fun b!598090 () Bool)

(assert (=> b!598090 (= e!341826 (MissingVacant!6225 vacantSpotIndex!68))))

(declare-fun b!598091 () Bool)

(declare-fun c!67731 () Bool)

(assert (=> b!598091 (= c!67731 (= lt!271723 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598091 (= e!341824 e!341826)))

(assert (= (and d!86965 c!67733) b!598088))

(assert (= (and d!86965 (not c!67733)) b!598087))

(assert (= (and b!598087 c!67732) b!598089))

(assert (= (and b!598087 (not c!67732)) b!598091))

(assert (= (and b!598091 c!67731) b!598090))

(assert (= (and b!598091 (not c!67731)) b!598086))

(assert (=> b!598086 m!575351))

(assert (=> b!598086 m!575351))

(assert (=> b!598086 m!575329))

(declare-fun m!575447 () Bool)

(assert (=> b!598086 m!575447))

(declare-fun m!575449 () Bool)

(assert (=> d!86965 m!575449))

(declare-fun m!575451 () Bool)

(assert (=> d!86965 m!575451))

(assert (=> d!86965 m!575327))

(assert (=> d!86965 m!575333))

(assert (=> b!597988 d!86965))

(declare-fun b!598102 () Bool)

(declare-fun e!341836 () Bool)

(declare-fun e!341835 () Bool)

(assert (=> b!598102 (= e!341836 e!341835)))

(declare-fun c!67736 () Bool)

(assert (=> b!598102 (= c!67736 (validKeyInArray!0 (select (arr!17785 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!598103 () Bool)

(declare-fun e!341838 () Bool)

(assert (=> b!598103 (= e!341838 e!341836)))

(declare-fun res!383365 () Bool)

(assert (=> b!598103 (=> (not res!383365) (not e!341836))))

(declare-fun e!341837 () Bool)

(assert (=> b!598103 (= res!383365 (not e!341837))))

(declare-fun res!383364 () Bool)

(assert (=> b!598103 (=> (not res!383364) (not e!341837))))

(assert (=> b!598103 (= res!383364 (validKeyInArray!0 (select (arr!17785 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32945 () Bool)

(declare-fun call!32948 () Bool)

(assert (=> bm!32945 (= call!32948 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67736 (Cons!11822 (select (arr!17785 a!2986) #b00000000000000000000000000000000) Nil!11823) Nil!11823)))))

(declare-fun b!598104 () Bool)

(assert (=> b!598104 (= e!341837 (contains!2957 Nil!11823 (select (arr!17785 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!598105 () Bool)

(assert (=> b!598105 (= e!341835 call!32948)))

(declare-fun b!598106 () Bool)

(assert (=> b!598106 (= e!341835 call!32948)))

(declare-fun d!86967 () Bool)

(declare-fun res!383366 () Bool)

(assert (=> d!86967 (=> res!383366 e!341838)))

(assert (=> d!86967 (= res!383366 (bvsge #b00000000000000000000000000000000 (size!18149 a!2986)))))

(assert (=> d!86967 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11823) e!341838)))

(assert (= (and d!86967 (not res!383366)) b!598103))

(assert (= (and b!598103 res!383364) b!598104))

(assert (= (and b!598103 res!383365) b!598102))

(assert (= (and b!598102 c!67736) b!598105))

(assert (= (and b!598102 (not c!67736)) b!598106))

(assert (= (or b!598105 b!598106) bm!32945))

(declare-fun m!575453 () Bool)

(assert (=> b!598102 m!575453))

(assert (=> b!598102 m!575453))

(declare-fun m!575455 () Bool)

(assert (=> b!598102 m!575455))

(assert (=> b!598103 m!575453))

(assert (=> b!598103 m!575453))

(assert (=> b!598103 m!575455))

(assert (=> bm!32945 m!575453))

(declare-fun m!575457 () Bool)

(assert (=> bm!32945 m!575457))

(assert (=> b!598104 m!575453))

(assert (=> b!598104 m!575453))

(declare-fun m!575459 () Bool)

(assert (=> b!598104 m!575459))

(assert (=> b!597998 d!86967))

(declare-fun b!598115 () Bool)

(declare-fun e!341847 () Bool)

(declare-fun e!341846 () Bool)

(assert (=> b!598115 (= e!341847 e!341846)))

(declare-fun lt!271732 () (_ BitVec 64))

(assert (=> b!598115 (= lt!271732 (select (arr!17785 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!271731 () Unit!18818)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37048 (_ BitVec 64) (_ BitVec 32)) Unit!18818)

(assert (=> b!598115 (= lt!271731 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!271732 #b00000000000000000000000000000000))))

(assert (=> b!598115 (arrayContainsKey!0 a!2986 lt!271732 #b00000000000000000000000000000000)))

(declare-fun lt!271730 () Unit!18818)

(assert (=> b!598115 (= lt!271730 lt!271731)))

(declare-fun res!383372 () Bool)

(assert (=> b!598115 (= res!383372 (= (seekEntryOrOpen!0 (select (arr!17785 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6225 #b00000000000000000000000000000000)))))

(assert (=> b!598115 (=> (not res!383372) (not e!341846))))

(declare-fun bm!32948 () Bool)

(declare-fun call!32951 () Bool)

(assert (=> bm!32948 (= call!32951 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!598116 () Bool)

(assert (=> b!598116 (= e!341846 call!32951)))

(declare-fun d!86969 () Bool)

(declare-fun res!383371 () Bool)

(declare-fun e!341845 () Bool)

(assert (=> d!86969 (=> res!383371 e!341845)))

(assert (=> d!86969 (= res!383371 (bvsge #b00000000000000000000000000000000 (size!18149 a!2986)))))

(assert (=> d!86969 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!341845)))

(declare-fun b!598117 () Bool)

(assert (=> b!598117 (= e!341845 e!341847)))

(declare-fun c!67739 () Bool)

(assert (=> b!598117 (= c!67739 (validKeyInArray!0 (select (arr!17785 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!598118 () Bool)

(assert (=> b!598118 (= e!341847 call!32951)))

(assert (= (and d!86969 (not res!383371)) b!598117))

(assert (= (and b!598117 c!67739) b!598115))

(assert (= (and b!598117 (not c!67739)) b!598118))

(assert (= (and b!598115 res!383372) b!598116))

(assert (= (or b!598116 b!598118) bm!32948))

(assert (=> b!598115 m!575453))

(declare-fun m!575461 () Bool)

(assert (=> b!598115 m!575461))

(declare-fun m!575463 () Bool)

(assert (=> b!598115 m!575463))

(assert (=> b!598115 m!575453))

(declare-fun m!575465 () Bool)

(assert (=> b!598115 m!575465))

(declare-fun m!575467 () Bool)

(assert (=> bm!32948 m!575467))

(assert (=> b!598117 m!575453))

(assert (=> b!598117 m!575453))

(assert (=> b!598117 m!575455))

(assert (=> b!597987 d!86969))

(declare-fun b!598119 () Bool)

(declare-fun e!341849 () Bool)

(declare-fun e!341848 () Bool)

(assert (=> b!598119 (= e!341849 e!341848)))

(declare-fun c!67740 () Bool)

(assert (=> b!598119 (= c!67740 (validKeyInArray!0 (select (arr!17785 lt!271670) #b00000000000000000000000000000000)))))

(declare-fun b!598120 () Bool)

(declare-fun e!341851 () Bool)

(assert (=> b!598120 (= e!341851 e!341849)))

(declare-fun res!383374 () Bool)

(assert (=> b!598120 (=> (not res!383374) (not e!341849))))

(declare-fun e!341850 () Bool)

(assert (=> b!598120 (= res!383374 (not e!341850))))

(declare-fun res!383373 () Bool)

(assert (=> b!598120 (=> (not res!383373) (not e!341850))))

(assert (=> b!598120 (= res!383373 (validKeyInArray!0 (select (arr!17785 lt!271670) #b00000000000000000000000000000000)))))

(declare-fun bm!32949 () Bool)

(declare-fun call!32952 () Bool)

(assert (=> bm!32949 (= call!32952 (arrayNoDuplicates!0 lt!271670 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67740 (Cons!11822 (select (arr!17785 lt!271670) #b00000000000000000000000000000000) Nil!11823) Nil!11823)))))

(declare-fun b!598121 () Bool)

(assert (=> b!598121 (= e!341850 (contains!2957 Nil!11823 (select (arr!17785 lt!271670) #b00000000000000000000000000000000)))))

(declare-fun b!598122 () Bool)

(assert (=> b!598122 (= e!341848 call!32952)))

(declare-fun b!598123 () Bool)

(assert (=> b!598123 (= e!341848 call!32952)))

(declare-fun d!86973 () Bool)

(declare-fun res!383375 () Bool)

(assert (=> d!86973 (=> res!383375 e!341851)))

(assert (=> d!86973 (= res!383375 (bvsge #b00000000000000000000000000000000 (size!18149 lt!271670)))))

(assert (=> d!86973 (= (arrayNoDuplicates!0 lt!271670 #b00000000000000000000000000000000 Nil!11823) e!341851)))

(assert (= (and d!86973 (not res!383375)) b!598120))

(assert (= (and b!598120 res!383373) b!598121))

(assert (= (and b!598120 res!383374) b!598119))

(assert (= (and b!598119 c!67740) b!598122))

(assert (= (and b!598119 (not c!67740)) b!598123))

(assert (= (or b!598122 b!598123) bm!32949))

(declare-fun m!575469 () Bool)

(assert (=> b!598119 m!575469))

(assert (=> b!598119 m!575469))

(declare-fun m!575471 () Bool)

(assert (=> b!598119 m!575471))

(assert (=> b!598120 m!575469))

(assert (=> b!598120 m!575469))

(assert (=> b!598120 m!575471))

(assert (=> bm!32949 m!575469))

(declare-fun m!575473 () Bool)

(assert (=> bm!32949 m!575473))

(assert (=> b!598121 m!575469))

(assert (=> b!598121 m!575469))

(declare-fun m!575475 () Bool)

(assert (=> b!598121 m!575475))

(assert (=> b!598000 d!86973))

(declare-fun d!86977 () Bool)

(declare-fun e!341868 () Bool)

(assert (=> d!86977 e!341868))

(declare-fun res!383390 () Bool)

(assert (=> d!86977 (=> (not res!383390) (not e!341868))))

(assert (=> d!86977 (= res!383390 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18149 a!2986))))))

(declare-fun lt!271735 () Unit!18818)

(declare-fun choose!41 (array!37048 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11826) Unit!18818)

(assert (=> d!86977 (= lt!271735 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11823))))

(assert (=> d!86977 (bvslt (size!18149 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!86977 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11823) lt!271735)))

(declare-fun b!598142 () Bool)

(assert (=> b!598142 (= e!341868 (arrayNoDuplicates!0 (array!37049 (store (arr!17785 a!2986) i!1108 k0!1786) (size!18149 a!2986)) #b00000000000000000000000000000000 Nil!11823))))

(assert (= (and d!86977 res!383390) b!598142))

(declare-fun m!575481 () Bool)

(assert (=> d!86977 m!575481))

(assert (=> b!598142 m!575357))

(declare-fun m!575483 () Bool)

(assert (=> b!598142 m!575483))

(assert (=> b!598000 d!86977))

(declare-fun d!86981 () Bool)

(declare-fun res!383398 () Bool)

(declare-fun e!341877 () Bool)

(assert (=> d!86981 (=> res!383398 e!341877)))

(assert (=> d!86981 (= res!383398 (= (select (arr!17785 lt!271670) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17785 a!2986) j!136)))))

(assert (=> d!86981 (= (arrayContainsKey!0 lt!271670 (select (arr!17785 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!341877)))

(declare-fun b!598152 () Bool)

(declare-fun e!341878 () Bool)

(assert (=> b!598152 (= e!341877 e!341878)))

(declare-fun res!383399 () Bool)

(assert (=> b!598152 (=> (not res!383399) (not e!341878))))

(assert (=> b!598152 (= res!383399 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18149 lt!271670)))))

(declare-fun b!598153 () Bool)

(assert (=> b!598153 (= e!341878 (arrayContainsKey!0 lt!271670 (select (arr!17785 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!86981 (not res!383398)) b!598152))

(assert (= (and b!598152 res!383399) b!598153))

(declare-fun m!575491 () Bool)

(assert (=> d!86981 m!575491))

(assert (=> b!598153 m!575329))

(declare-fun m!575495 () Bool)

(assert (=> b!598153 m!575495))

(assert (=> b!598000 d!86981))

(declare-fun d!86983 () Bool)

(assert (=> d!86983 (arrayContainsKey!0 lt!271670 (select (arr!17785 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271738 () Unit!18818)

(declare-fun choose!114 (array!37048 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18818)

(assert (=> d!86983 (= lt!271738 (choose!114 lt!271670 (select (arr!17785 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!86983 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!86983 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271670 (select (arr!17785 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!271738)))

(declare-fun bs!18382 () Bool)

(assert (= bs!18382 d!86983))

(assert (=> bs!18382 m!575329))

(assert (=> bs!18382 m!575365))

(assert (=> bs!18382 m!575329))

(declare-fun m!575497 () Bool)

(assert (=> bs!18382 m!575497))

(assert (=> b!598000 d!86983))

(declare-fun b!598154 () Bool)

(declare-fun e!341881 () SeekEntryResult!6225)

(assert (=> b!598154 (= e!341881 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271672 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17785 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!598155 () Bool)

(declare-fun e!341880 () SeekEntryResult!6225)

(declare-fun e!341879 () SeekEntryResult!6225)

(assert (=> b!598155 (= e!341880 e!341879)))

(declare-fun c!67745 () Bool)

(declare-fun lt!271740 () (_ BitVec 64))

(assert (=> b!598155 (= c!67745 (= lt!271740 (select (arr!17785 a!2986) j!136)))))

(declare-fun d!86987 () Bool)

(declare-fun lt!271739 () SeekEntryResult!6225)

(assert (=> d!86987 (and (or ((_ is Undefined!6225) lt!271739) (not ((_ is Found!6225) lt!271739)) (and (bvsge (index!27155 lt!271739) #b00000000000000000000000000000000) (bvslt (index!27155 lt!271739) (size!18149 a!2986)))) (or ((_ is Undefined!6225) lt!271739) ((_ is Found!6225) lt!271739) (not ((_ is MissingVacant!6225) lt!271739)) (not (= (index!27157 lt!271739) vacantSpotIndex!68)) (and (bvsge (index!27157 lt!271739) #b00000000000000000000000000000000) (bvslt (index!27157 lt!271739) (size!18149 a!2986)))) (or ((_ is Undefined!6225) lt!271739) (ite ((_ is Found!6225) lt!271739) (= (select (arr!17785 a!2986) (index!27155 lt!271739)) (select (arr!17785 a!2986) j!136)) (and ((_ is MissingVacant!6225) lt!271739) (= (index!27157 lt!271739) vacantSpotIndex!68) (= (select (arr!17785 a!2986) (index!27157 lt!271739)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86987 (= lt!271739 e!341880)))

(declare-fun c!67746 () Bool)

(assert (=> d!86987 (= c!67746 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86987 (= lt!271740 (select (arr!17785 a!2986) lt!271672))))

(assert (=> d!86987 (validMask!0 mask!3053)))

(assert (=> d!86987 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271672 vacantSpotIndex!68 (select (arr!17785 a!2986) j!136) a!2986 mask!3053) lt!271739)))

(declare-fun b!598156 () Bool)

(assert (=> b!598156 (= e!341880 Undefined!6225)))

(declare-fun b!598157 () Bool)

(assert (=> b!598157 (= e!341879 (Found!6225 lt!271672))))

(declare-fun b!598158 () Bool)

(assert (=> b!598158 (= e!341881 (MissingVacant!6225 vacantSpotIndex!68))))

(declare-fun b!598159 () Bool)

(declare-fun c!67744 () Bool)

(assert (=> b!598159 (= c!67744 (= lt!271740 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598159 (= e!341879 e!341881)))

(assert (= (and d!86987 c!67746) b!598156))

(assert (= (and d!86987 (not c!67746)) b!598155))

(assert (= (and b!598155 c!67745) b!598157))

(assert (= (and b!598155 (not c!67745)) b!598159))

(assert (= (and b!598159 c!67744) b!598158))

(assert (= (and b!598159 (not c!67744)) b!598154))

(declare-fun m!575499 () Bool)

(assert (=> b!598154 m!575499))

(assert (=> b!598154 m!575499))

(assert (=> b!598154 m!575329))

(declare-fun m!575501 () Bool)

(assert (=> b!598154 m!575501))

(declare-fun m!575503 () Bool)

(assert (=> d!86987 m!575503))

(declare-fun m!575505 () Bool)

(assert (=> d!86987 m!575505))

(declare-fun m!575507 () Bool)

(assert (=> d!86987 m!575507))

(assert (=> d!86987 m!575333))

(assert (=> b!597989 d!86987))

(declare-fun d!86989 () Bool)

(declare-fun lt!271743 () (_ BitVec 32))

(assert (=> d!86989 (and (bvsge lt!271743 #b00000000000000000000000000000000) (bvslt lt!271743 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!86989 (= lt!271743 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!86989 (validMask!0 mask!3053)))

(assert (=> d!86989 (= (nextIndex!0 index!984 x!910 mask!3053) lt!271743)))

(declare-fun bs!18383 () Bool)

(assert (= bs!18383 d!86989))

(declare-fun m!575509 () Bool)

(assert (=> bs!18383 m!575509))

(assert (=> bs!18383 m!575333))

(assert (=> b!597989 d!86989))

(declare-fun e!341884 () SeekEntryResult!6225)

(declare-fun b!598160 () Bool)

(assert (=> b!598160 (= e!341884 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 x!910 mask!3053) vacantSpotIndex!68 lt!271680 lt!271670 mask!3053))))

(declare-fun b!598161 () Bool)

(declare-fun e!341883 () SeekEntryResult!6225)

(declare-fun e!341882 () SeekEntryResult!6225)

(assert (=> b!598161 (= e!341883 e!341882)))

(declare-fun c!67748 () Bool)

(declare-fun lt!271745 () (_ BitVec 64))

(assert (=> b!598161 (= c!67748 (= lt!271745 lt!271680))))

(declare-fun d!86991 () Bool)

(declare-fun lt!271744 () SeekEntryResult!6225)

(assert (=> d!86991 (and (or ((_ is Undefined!6225) lt!271744) (not ((_ is Found!6225) lt!271744)) (and (bvsge (index!27155 lt!271744) #b00000000000000000000000000000000) (bvslt (index!27155 lt!271744) (size!18149 lt!271670)))) (or ((_ is Undefined!6225) lt!271744) ((_ is Found!6225) lt!271744) (not ((_ is MissingVacant!6225) lt!271744)) (not (= (index!27157 lt!271744) vacantSpotIndex!68)) (and (bvsge (index!27157 lt!271744) #b00000000000000000000000000000000) (bvslt (index!27157 lt!271744) (size!18149 lt!271670)))) (or ((_ is Undefined!6225) lt!271744) (ite ((_ is Found!6225) lt!271744) (= (select (arr!17785 lt!271670) (index!27155 lt!271744)) lt!271680) (and ((_ is MissingVacant!6225) lt!271744) (= (index!27157 lt!271744) vacantSpotIndex!68) (= (select (arr!17785 lt!271670) (index!27157 lt!271744)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86991 (= lt!271744 e!341883)))

(declare-fun c!67749 () Bool)

(assert (=> d!86991 (= c!67749 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!86991 (= lt!271745 (select (arr!17785 lt!271670) index!984))))

(assert (=> d!86991 (validMask!0 mask!3053)))

(assert (=> d!86991 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271680 lt!271670 mask!3053) lt!271744)))

(declare-fun b!598162 () Bool)

(assert (=> b!598162 (= e!341883 Undefined!6225)))

(declare-fun b!598163 () Bool)

(assert (=> b!598163 (= e!341882 (Found!6225 index!984))))

(declare-fun b!598164 () Bool)

(assert (=> b!598164 (= e!341884 (MissingVacant!6225 vacantSpotIndex!68))))

(declare-fun b!598165 () Bool)

(declare-fun c!67747 () Bool)

(assert (=> b!598165 (= c!67747 (= lt!271745 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598165 (= e!341882 e!341884)))

(assert (= (and d!86991 c!67749) b!598162))

(assert (= (and d!86991 (not c!67749)) b!598161))

(assert (= (and b!598161 c!67748) b!598163))

(assert (= (and b!598161 (not c!67748)) b!598165))

(assert (= (and b!598165 c!67747) b!598164))

(assert (= (and b!598165 (not c!67747)) b!598160))

(assert (=> b!598160 m!575351))

(assert (=> b!598160 m!575351))

(declare-fun m!575511 () Bool)

(assert (=> b!598160 m!575511))

(declare-fun m!575513 () Bool)

(assert (=> d!86991 m!575513))

(declare-fun m!575515 () Bool)

(assert (=> d!86991 m!575515))

(declare-fun m!575517 () Bool)

(assert (=> d!86991 m!575517))

(assert (=> d!86991 m!575333))

(assert (=> b!597989 d!86991))

(declare-fun e!341889 () SeekEntryResult!6225)

(declare-fun b!598166 () Bool)

(assert (=> b!598166 (= e!341889 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271672 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!271680 lt!271670 mask!3053))))

(declare-fun b!598167 () Bool)

(declare-fun e!341888 () SeekEntryResult!6225)

(declare-fun e!341885 () SeekEntryResult!6225)

(assert (=> b!598167 (= e!341888 e!341885)))

(declare-fun c!67751 () Bool)

(declare-fun lt!271749 () (_ BitVec 64))

(assert (=> b!598167 (= c!67751 (= lt!271749 lt!271680))))

(declare-fun d!86993 () Bool)

(declare-fun lt!271748 () SeekEntryResult!6225)

(assert (=> d!86993 (and (or ((_ is Undefined!6225) lt!271748) (not ((_ is Found!6225) lt!271748)) (and (bvsge (index!27155 lt!271748) #b00000000000000000000000000000000) (bvslt (index!27155 lt!271748) (size!18149 lt!271670)))) (or ((_ is Undefined!6225) lt!271748) ((_ is Found!6225) lt!271748) (not ((_ is MissingVacant!6225) lt!271748)) (not (= (index!27157 lt!271748) vacantSpotIndex!68)) (and (bvsge (index!27157 lt!271748) #b00000000000000000000000000000000) (bvslt (index!27157 lt!271748) (size!18149 lt!271670)))) (or ((_ is Undefined!6225) lt!271748) (ite ((_ is Found!6225) lt!271748) (= (select (arr!17785 lt!271670) (index!27155 lt!271748)) lt!271680) (and ((_ is MissingVacant!6225) lt!271748) (= (index!27157 lt!271748) vacantSpotIndex!68) (= (select (arr!17785 lt!271670) (index!27157 lt!271748)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!86993 (= lt!271748 e!341888)))

(declare-fun c!67752 () Bool)

(assert (=> d!86993 (= c!67752 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!86993 (= lt!271749 (select (arr!17785 lt!271670) lt!271672))))

(assert (=> d!86993 (validMask!0 mask!3053)))

(assert (=> d!86993 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271672 vacantSpotIndex!68 lt!271680 lt!271670 mask!3053) lt!271748)))

(declare-fun b!598168 () Bool)

(assert (=> b!598168 (= e!341888 Undefined!6225)))

(declare-fun b!598169 () Bool)

(assert (=> b!598169 (= e!341885 (Found!6225 lt!271672))))

(declare-fun b!598170 () Bool)

(assert (=> b!598170 (= e!341889 (MissingVacant!6225 vacantSpotIndex!68))))

(declare-fun b!598171 () Bool)

(declare-fun c!67750 () Bool)

(assert (=> b!598171 (= c!67750 (= lt!271749 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598171 (= e!341885 e!341889)))

(assert (= (and d!86993 c!67752) b!598168))

(assert (= (and d!86993 (not c!67752)) b!598167))

(assert (= (and b!598167 c!67751) b!598169))

(assert (= (and b!598167 (not c!67751)) b!598171))

(assert (= (and b!598171 c!67750) b!598170))

(assert (= (and b!598171 (not c!67750)) b!598166))

(assert (=> b!598166 m!575499))

(assert (=> b!598166 m!575499))

(declare-fun m!575519 () Bool)

(assert (=> b!598166 m!575519))

(declare-fun m!575521 () Bool)

(assert (=> d!86993 m!575521))

(declare-fun m!575523 () Bool)

(assert (=> d!86993 m!575523))

(declare-fun m!575525 () Bool)

(assert (=> d!86993 m!575525))

(assert (=> d!86993 m!575333))

(assert (=> b!597989 d!86993))

(declare-fun d!86995 () Bool)

(declare-fun e!341914 () Bool)

(assert (=> d!86995 e!341914))

(declare-fun res!383422 () Bool)

(assert (=> d!86995 (=> (not res!383422) (not e!341914))))

(assert (=> d!86995 (= res!383422 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18149 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18149 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18149 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18149 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18149 a!2986))))))

(declare-fun lt!271764 () Unit!18818)

(declare-fun choose!9 (array!37048 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18818)

(assert (=> d!86995 (= lt!271764 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271672 vacantSpotIndex!68 mask!3053))))

(assert (=> d!86995 (validMask!0 mask!3053)))

(assert (=> d!86995 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271672 vacantSpotIndex!68 mask!3053) lt!271764)))

(declare-fun b!598202 () Bool)

(assert (=> b!598202 (= e!341914 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271672 vacantSpotIndex!68 (select (arr!17785 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271672 vacantSpotIndex!68 (select (store (arr!17785 a!2986) i!1108 k0!1786) j!136) (array!37049 (store (arr!17785 a!2986) i!1108 k0!1786) (size!18149 a!2986)) mask!3053)))))

(assert (= (and d!86995 res!383422) b!598202))

(declare-fun m!575549 () Bool)

(assert (=> d!86995 m!575549))

(assert (=> d!86995 m!575333))

(assert (=> b!598202 m!575357))

(assert (=> b!598202 m!575353))

(assert (=> b!598202 m!575353))

(declare-fun m!575551 () Bool)

(assert (=> b!598202 m!575551))

(assert (=> b!598202 m!575329))

(assert (=> b!598202 m!575329))

(assert (=> b!598202 m!575359))

(assert (=> b!597989 d!86995))

(declare-fun d!87007 () Bool)

(declare-fun res!383423 () Bool)

(declare-fun e!341921 () Bool)

(assert (=> d!87007 (=> res!383423 e!341921)))

(assert (=> d!87007 (= res!383423 (= (select (arr!17785 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!87007 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!341921)))

(declare-fun b!598215 () Bool)

(declare-fun e!341922 () Bool)

(assert (=> b!598215 (= e!341921 e!341922)))

(declare-fun res!383424 () Bool)

(assert (=> b!598215 (=> (not res!383424) (not e!341922))))

(assert (=> b!598215 (= res!383424 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18149 a!2986)))))

(declare-fun b!598216 () Bool)

(assert (=> b!598216 (= e!341922 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!87007 (not res!383423)) b!598215))

(assert (= (and b!598215 res!383424) b!598216))

(assert (=> d!87007 m!575453))

(declare-fun m!575553 () Bool)

(assert (=> b!598216 m!575553))

(assert (=> b!597999 d!87007))

(declare-fun d!87009 () Bool)

(declare-fun res!383432 () Bool)

(declare-fun e!341930 () Bool)

(assert (=> d!87009 (=> res!383432 e!341930)))

(assert (=> d!87009 (= res!383432 ((_ is Nil!11823) Nil!11823))))

(assert (=> d!87009 (= (noDuplicate!274 Nil!11823) e!341930)))

(declare-fun b!598224 () Bool)

(declare-fun e!341931 () Bool)

(assert (=> b!598224 (= e!341930 e!341931)))

(declare-fun res!383433 () Bool)

(assert (=> b!598224 (=> (not res!383433) (not e!341931))))

(assert (=> b!598224 (= res!383433 (not (contains!2957 (t!18054 Nil!11823) (h!12867 Nil!11823))))))

(declare-fun b!598225 () Bool)

(assert (=> b!598225 (= e!341931 (noDuplicate!274 (t!18054 Nil!11823)))))

(assert (= (and d!87009 (not res!383432)) b!598224))

(assert (= (and b!598224 res!383433) b!598225))

(declare-fun m!575563 () Bool)

(assert (=> b!598224 m!575563))

(declare-fun m!575565 () Bool)

(assert (=> b!598225 m!575565))

(assert (=> b!598006 d!87009))

(declare-fun d!87015 () Bool)

(assert (=> d!87015 (= (validKeyInArray!0 (select (arr!17785 a!2986) j!136)) (and (not (= (select (arr!17785 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17785 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!597995 d!87015))

(declare-fun d!87021 () Bool)

(declare-fun res!383434 () Bool)

(declare-fun e!341935 () Bool)

(assert (=> d!87021 (=> res!383434 e!341935)))

(assert (=> d!87021 (= res!383434 (= (select (arr!17785 lt!271670) j!136) (select (arr!17785 a!2986) j!136)))))

(assert (=> d!87021 (= (arrayContainsKey!0 lt!271670 (select (arr!17785 a!2986) j!136) j!136) e!341935)))

(declare-fun b!598232 () Bool)

(declare-fun e!341936 () Bool)

(assert (=> b!598232 (= e!341935 e!341936)))

(declare-fun res!383435 () Bool)

(assert (=> b!598232 (=> (not res!383435) (not e!341936))))

(assert (=> b!598232 (= res!383435 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18149 lt!271670)))))

(declare-fun b!598233 () Bool)

(assert (=> b!598233 (= e!341936 (arrayContainsKey!0 lt!271670 (select (arr!17785 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87021 (not res!383434)) b!598232))

(assert (= (and b!598232 res!383435) b!598233))

(declare-fun m!575571 () Bool)

(assert (=> d!87021 m!575571))

(assert (=> b!598233 m!575329))

(declare-fun m!575575 () Bool)

(assert (=> b!598233 m!575575))

(assert (=> b!597986 d!87021))

(declare-fun d!87023 () Bool)

(declare-fun lt!271785 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!237 (List!11826) (InoxSet (_ BitVec 64)))

(assert (=> d!87023 (= lt!271785 (select (content!237 Nil!11823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341950 () Bool)

(assert (=> d!87023 (= lt!271785 e!341950)))

(declare-fun res!383446 () Bool)

(assert (=> d!87023 (=> (not res!383446) (not e!341950))))

(assert (=> d!87023 (= res!383446 ((_ is Cons!11822) Nil!11823))))

(assert (=> d!87023 (= (contains!2957 Nil!11823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!271785)))

(declare-fun b!598250 () Bool)

(declare-fun e!341951 () Bool)

(assert (=> b!598250 (= e!341950 e!341951)))

(declare-fun res!383447 () Bool)

(assert (=> b!598250 (=> res!383447 e!341951)))

(assert (=> b!598250 (= res!383447 (= (h!12867 Nil!11823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!598251 () Bool)

(assert (=> b!598251 (= e!341951 (contains!2957 (t!18054 Nil!11823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!87023 res!383446) b!598250))

(assert (= (and b!598250 (not res!383447)) b!598251))

(declare-fun m!575591 () Bool)

(assert (=> d!87023 m!575591))

(declare-fun m!575595 () Bool)

(assert (=> d!87023 m!575595))

(declare-fun m!575599 () Bool)

(assert (=> b!598251 m!575599))

(assert (=> b!598007 d!87023))

(declare-fun d!87031 () Bool)

(assert (=> d!87031 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!597993 d!87031))

(declare-fun b!598318 () Bool)

(declare-fun lt!271808 () SeekEntryResult!6225)

(declare-fun e!341999 () SeekEntryResult!6225)

(assert (=> b!598318 (= e!341999 (seekKeyOrZeroReturnVacant!0 (x!55959 lt!271808) (index!27156 lt!271808) (index!27156 lt!271808) k0!1786 a!2986 mask!3053))))

(declare-fun b!598319 () Bool)

(declare-fun e!341997 () SeekEntryResult!6225)

(declare-fun e!341998 () SeekEntryResult!6225)

(assert (=> b!598319 (= e!341997 e!341998)))

(declare-fun lt!271807 () (_ BitVec 64))

(assert (=> b!598319 (= lt!271807 (select (arr!17785 a!2986) (index!27156 lt!271808)))))

(declare-fun c!67792 () Bool)

(assert (=> b!598319 (= c!67792 (= lt!271807 k0!1786))))

(declare-fun d!87035 () Bool)

(declare-fun lt!271806 () SeekEntryResult!6225)

(assert (=> d!87035 (and (or ((_ is Undefined!6225) lt!271806) (not ((_ is Found!6225) lt!271806)) (and (bvsge (index!27155 lt!271806) #b00000000000000000000000000000000) (bvslt (index!27155 lt!271806) (size!18149 a!2986)))) (or ((_ is Undefined!6225) lt!271806) ((_ is Found!6225) lt!271806) (not ((_ is MissingZero!6225) lt!271806)) (and (bvsge (index!27154 lt!271806) #b00000000000000000000000000000000) (bvslt (index!27154 lt!271806) (size!18149 a!2986)))) (or ((_ is Undefined!6225) lt!271806) ((_ is Found!6225) lt!271806) ((_ is MissingZero!6225) lt!271806) (not ((_ is MissingVacant!6225) lt!271806)) (and (bvsge (index!27157 lt!271806) #b00000000000000000000000000000000) (bvslt (index!27157 lt!271806) (size!18149 a!2986)))) (or ((_ is Undefined!6225) lt!271806) (ite ((_ is Found!6225) lt!271806) (= (select (arr!17785 a!2986) (index!27155 lt!271806)) k0!1786) (ite ((_ is MissingZero!6225) lt!271806) (= (select (arr!17785 a!2986) (index!27154 lt!271806)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6225) lt!271806) (= (select (arr!17785 a!2986) (index!27157 lt!271806)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!87035 (= lt!271806 e!341997)))

(declare-fun c!67790 () Bool)

(assert (=> d!87035 (= c!67790 (and ((_ is Intermediate!6225) lt!271808) (undefined!7037 lt!271808)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37048 (_ BitVec 32)) SeekEntryResult!6225)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87035 (= lt!271808 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!87035 (validMask!0 mask!3053)))

(assert (=> d!87035 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!271806)))

(declare-fun b!598320 () Bool)

(declare-fun c!67791 () Bool)

(assert (=> b!598320 (= c!67791 (= lt!271807 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!598320 (= e!341998 e!341999)))

(declare-fun b!598321 () Bool)

(assert (=> b!598321 (= e!341998 (Found!6225 (index!27156 lt!271808)))))

(declare-fun b!598322 () Bool)

(assert (=> b!598322 (= e!341997 Undefined!6225)))

(declare-fun b!598323 () Bool)

(assert (=> b!598323 (= e!341999 (MissingZero!6225 (index!27156 lt!271808)))))

(assert (= (and d!87035 c!67790) b!598322))

(assert (= (and d!87035 (not c!67790)) b!598319))

(assert (= (and b!598319 c!67792) b!598321))

(assert (= (and b!598319 (not c!67792)) b!598320))

(assert (= (and b!598320 c!67791) b!598323))

(assert (= (and b!598320 (not c!67791)) b!598318))

(declare-fun m!575651 () Bool)

(assert (=> b!598318 m!575651))

(declare-fun m!575653 () Bool)

(assert (=> b!598319 m!575653))

(declare-fun m!575655 () Bool)

(assert (=> d!87035 m!575655))

(assert (=> d!87035 m!575333))

(declare-fun m!575657 () Bool)

(assert (=> d!87035 m!575657))

(declare-fun m!575659 () Bool)

(assert (=> d!87035 m!575659))

(assert (=> d!87035 m!575659))

(declare-fun m!575661 () Bool)

(assert (=> d!87035 m!575661))

(declare-fun m!575663 () Bool)

(assert (=> d!87035 m!575663))

(assert (=> b!597990 d!87035))

(declare-fun d!87057 () Bool)

(declare-fun res!383472 () Bool)

(declare-fun e!342000 () Bool)

(assert (=> d!87057 (=> res!383472 e!342000)))

(assert (=> d!87057 (= res!383472 (= (select (arr!17785 lt!271670) index!984) (select (arr!17785 a!2986) j!136)))))

(assert (=> d!87057 (= (arrayContainsKey!0 lt!271670 (select (arr!17785 a!2986) j!136) index!984) e!342000)))

(declare-fun b!598324 () Bool)

(declare-fun e!342001 () Bool)

(assert (=> b!598324 (= e!342000 e!342001)))

(declare-fun res!383473 () Bool)

(assert (=> b!598324 (=> (not res!383473) (not e!342001))))

(assert (=> b!598324 (= res!383473 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18149 lt!271670)))))

(declare-fun b!598325 () Bool)

(assert (=> b!598325 (= e!342001 (arrayContainsKey!0 lt!271670 (select (arr!17785 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!87057 (not res!383472)) b!598324))

(assert (= (and b!598324 res!383473) b!598325))

(assert (=> d!87057 m!575517))

(assert (=> b!598325 m!575329))

(declare-fun m!575665 () Bool)

(assert (=> b!598325 m!575665))

(assert (=> b!597992 d!87057))

(declare-fun d!87059 () Bool)

(assert (=> d!87059 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!54732 d!87059))

(declare-fun d!87065 () Bool)

(assert (=> d!87065 (= (array_inv!13581 a!2986) (bvsge (size!18149 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!54732 d!87065))

(declare-fun d!87069 () Bool)

(declare-fun lt!271819 () Bool)

(assert (=> d!87069 (= lt!271819 (select (content!237 Nil!11823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!342011 () Bool)

(assert (=> d!87069 (= lt!271819 e!342011)))

(declare-fun res!383477 () Bool)

(assert (=> d!87069 (=> (not res!383477) (not e!342011))))

(assert (=> d!87069 (= res!383477 ((_ is Cons!11822) Nil!11823))))

(assert (=> d!87069 (= (contains!2957 Nil!11823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!271819)))

(declare-fun b!598341 () Bool)

(declare-fun e!342012 () Bool)

(assert (=> b!598341 (= e!342011 e!342012)))

(declare-fun res!383478 () Bool)

(assert (=> b!598341 (=> res!383478 e!342012)))

(assert (=> b!598341 (= res!383478 (= (h!12867 Nil!11823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!598342 () Bool)

(assert (=> b!598342 (= e!342012 (contains!2957 (t!18054 Nil!11823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!87069 res!383477) b!598341))

(assert (= (and b!598341 (not res!383478)) b!598342))

(assert (=> d!87069 m!575591))

(declare-fun m!575689 () Bool)

(assert (=> d!87069 m!575689))

(declare-fun m!575691 () Bool)

(assert (=> b!598342 m!575691))

(assert (=> b!598002 d!87069))

(check-sat (not b!598104) (not d!86995) (not d!86993) (not b!598224) (not b!598160) (not b!598117) (not bm!32945) (not b!598102) (not b!598103) (not d!86977) (not d!86989) (not b!598325) (not d!87023) (not b!598142) (not b!598153) (not b!598225) (not d!87035) (not d!86983) (not b!598216) (not b!598166) (not b!598233) (not b!598342) (not d!87069) (not b!598120) (not b!598086) (not b!598115) (not b!598119) (not b!598154) (not d!86991) (not b!598318) (not d!86965) (not d!86987) (not b!598251) (not b!598202) (not b!598121) (not bm!32948) (not bm!32949))
(check-sat)
