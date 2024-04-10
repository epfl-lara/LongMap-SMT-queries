; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54730 () Bool)

(assert start!54730)

(declare-fun b!597920 () Bool)

(declare-fun res!383233 () Bool)

(declare-fun e!341721 () Bool)

(assert (=> b!597920 (=> (not res!383233) (not e!341721))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!37046 0))(
  ( (array!37047 (arr!17784 (Array (_ BitVec 32) (_ BitVec 64))) (size!18148 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37046)

(assert (=> b!597920 (= res!383233 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17784 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!597921 () Bool)

(declare-fun res!383221 () Bool)

(declare-fun e!341727 () Bool)

(assert (=> b!597921 (=> (not res!383221) (not e!341727))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!597921 (= res!383221 (validKeyInArray!0 k!1786))))

(declare-fun lt!271644 () array!37046)

(declare-fun b!597922 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun e!341732 () Bool)

(declare-fun arrayContainsKey!0 (array!37046 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!597922 (= e!341732 (arrayContainsKey!0 lt!271644 (select (arr!17784 a!2986) j!136) index!984))))

(declare-fun b!597923 () Bool)

(declare-datatypes ((Unit!18814 0))(
  ( (Unit!18815) )
))
(declare-fun e!341728 () Unit!18814)

(declare-fun Unit!18816 () Unit!18814)

(assert (=> b!597923 (= e!341728 Unit!18816)))

(assert (=> b!597923 false))

(declare-fun b!597924 () Bool)

(declare-fun res!383222 () Bool)

(declare-fun e!341722 () Bool)

(assert (=> b!597924 (=> res!383222 e!341722)))

(declare-datatypes ((List!11825 0))(
  ( (Nil!11822) (Cons!11821 (h!12866 (_ BitVec 64)) (t!18053 List!11825)) )
))
(declare-fun noDuplicate!273 (List!11825) Bool)

(assert (=> b!597924 (= res!383222 (not (noDuplicate!273 Nil!11822)))))

(declare-fun b!597925 () Bool)

(declare-fun e!341731 () Bool)

(assert (=> b!597925 (= e!341731 e!341732)))

(declare-fun res!383231 () Bool)

(assert (=> b!597925 (=> (not res!383231) (not e!341732))))

(assert (=> b!597925 (= res!383231 (arrayContainsKey!0 lt!271644 (select (arr!17784 a!2986) j!136) j!136))))

(declare-fun b!597926 () Bool)

(declare-fun e!341730 () Bool)

(assert (=> b!597926 (= e!341730 e!341731)))

(declare-fun res!383223 () Bool)

(assert (=> b!597926 (=> res!383223 e!341731)))

(declare-fun lt!271639 () (_ BitVec 64))

(declare-fun lt!271640 () (_ BitVec 64))

(assert (=> b!597926 (= res!383223 (or (not (= (select (arr!17784 a!2986) j!136) lt!271639)) (not (= (select (arr!17784 a!2986) j!136) lt!271640)) (bvsge j!136 index!984)))))

(declare-fun b!597927 () Bool)

(declare-fun Unit!18817 () Unit!18814)

(assert (=> b!597927 (= e!341728 Unit!18817)))

(declare-fun b!597928 () Bool)

(declare-fun e!341724 () Bool)

(assert (=> b!597928 (= e!341721 e!341724)))

(declare-fun res!383220 () Bool)

(assert (=> b!597928 (=> (not res!383220) (not e!341724))))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!597928 (= res!383220 (= (select (store (arr!17784 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!597928 (= lt!271644 (array!37047 (store (arr!17784 a!2986) i!1108 k!1786) (size!18148 a!2986)))))

(declare-fun b!597929 () Bool)

(declare-fun e!341723 () Bool)

(declare-fun e!341725 () Bool)

(assert (=> b!597929 (= e!341723 (not e!341725))))

(declare-fun res!383219 () Bool)

(assert (=> b!597929 (=> res!383219 e!341725)))

(declare-datatypes ((SeekEntryResult!6224 0))(
  ( (MissingZero!6224 (index!27150 (_ BitVec 32))) (Found!6224 (index!27151 (_ BitVec 32))) (Intermediate!6224 (undefined!7036 Bool) (index!27152 (_ BitVec 32)) (x!55958 (_ BitVec 32))) (Undefined!6224) (MissingVacant!6224 (index!27153 (_ BitVec 32))) )
))
(declare-fun lt!271638 () SeekEntryResult!6224)

(assert (=> b!597929 (= res!383219 (not (= lt!271638 (Found!6224 index!984))))))

(declare-fun lt!271641 () Unit!18814)

(assert (=> b!597929 (= lt!271641 e!341728)))

(declare-fun c!67718 () Bool)

(assert (=> b!597929 (= c!67718 (= lt!271638 Undefined!6224))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37046 (_ BitVec 32)) SeekEntryResult!6224)

(assert (=> b!597929 (= lt!271638 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!271639 lt!271644 mask!3053))))

(declare-fun e!341726 () Bool)

(assert (=> b!597929 e!341726))

(declare-fun res!383226 () Bool)

(assert (=> b!597929 (=> (not res!383226) (not e!341726))))

(declare-fun lt!271636 () (_ BitVec 32))

(declare-fun lt!271645 () SeekEntryResult!6224)

(assert (=> b!597929 (= res!383226 (= lt!271645 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271636 vacantSpotIndex!68 lt!271639 lt!271644 mask!3053)))))

(assert (=> b!597929 (= lt!271645 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271636 vacantSpotIndex!68 (select (arr!17784 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!597929 (= lt!271639 (select (store (arr!17784 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!271642 () Unit!18814)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37046 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18814)

(assert (=> b!597929 (= lt!271642 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271636 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!597929 (= lt!271636 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!597930 () Bool)

(declare-fun res!383228 () Bool)

(assert (=> b!597930 (=> (not res!383228) (not e!341721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37046 (_ BitVec 32)) Bool)

(assert (=> b!597930 (= res!383228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!597931 () Bool)

(declare-fun e!341720 () Bool)

(assert (=> b!597931 (= e!341725 e!341720)))

(declare-fun res!383232 () Bool)

(assert (=> b!597931 (=> res!383232 e!341720)))

(assert (=> b!597931 (= res!383232 (or (not (= (select (arr!17784 a!2986) j!136) lt!271639)) (not (= (select (arr!17784 a!2986) j!136) lt!271640)) (bvsge j!136 index!984)))))

(assert (=> b!597931 e!341730))

(declare-fun res!383237 () Bool)

(assert (=> b!597931 (=> (not res!383237) (not e!341730))))

(assert (=> b!597931 (= res!383237 (= lt!271640 (select (arr!17784 a!2986) j!136)))))

(assert (=> b!597931 (= lt!271640 (select (store (arr!17784 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!597932 () Bool)

(declare-fun res!383235 () Bool)

(assert (=> b!597932 (=> (not res!383235) (not e!341727))))

(assert (=> b!597932 (= res!383235 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!383225 () Bool)

(assert (=> start!54730 (=> (not res!383225) (not e!341727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54730 (= res!383225 (validMask!0 mask!3053))))

(assert (=> start!54730 e!341727))

(assert (=> start!54730 true))

(declare-fun array_inv!13580 (array!37046) Bool)

(assert (=> start!54730 (array_inv!13580 a!2986)))

(declare-fun b!597933 () Bool)

(declare-fun e!341729 () Bool)

(declare-fun contains!2956 (List!11825 (_ BitVec 64)) Bool)

(assert (=> b!597933 (= e!341729 (not (contains!2956 Nil!11822 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!597934 () Bool)

(declare-fun lt!271637 () SeekEntryResult!6224)

(assert (=> b!597934 (= e!341726 (= lt!271637 lt!271645))))

(declare-fun b!597935 () Bool)

(assert (=> b!597935 (= e!341727 e!341721)))

(declare-fun res!383234 () Bool)

(assert (=> b!597935 (=> (not res!383234) (not e!341721))))

(declare-fun lt!271634 () SeekEntryResult!6224)

(assert (=> b!597935 (= res!383234 (or (= lt!271634 (MissingZero!6224 i!1108)) (= lt!271634 (MissingVacant!6224 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37046 (_ BitVec 32)) SeekEntryResult!6224)

(assert (=> b!597935 (= lt!271634 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!597936 () Bool)

(assert (=> b!597936 (= e!341724 e!341723)))

(declare-fun res!383227 () Bool)

(assert (=> b!597936 (=> (not res!383227) (not e!341723))))

(assert (=> b!597936 (= res!383227 (and (= lt!271637 (Found!6224 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17784 a!2986) index!984) (select (arr!17784 a!2986) j!136))) (not (= (select (arr!17784 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!597936 (= lt!271637 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17784 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!597937 () Bool)

(declare-fun res!383224 () Bool)

(assert (=> b!597937 (=> (not res!383224) (not e!341727))))

(assert (=> b!597937 (= res!383224 (and (= (size!18148 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18148 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18148 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!597938 () Bool)

(declare-fun res!383230 () Bool)

(assert (=> b!597938 (=> (not res!383230) (not e!341727))))

(assert (=> b!597938 (= res!383230 (validKeyInArray!0 (select (arr!17784 a!2986) j!136)))))

(declare-fun b!597939 () Bool)

(assert (=> b!597939 (= e!341720 e!341722)))

(declare-fun res!383218 () Bool)

(assert (=> b!597939 (=> res!383218 e!341722)))

(assert (=> b!597939 (= res!383218 (or (bvsgt #b00000000000000000000000000000000 (size!18148 a!2986)) (bvsge (size!18148 a!2986) #b01111111111111111111111111111111)))))

(declare-fun arrayNoDuplicates!0 (array!37046 (_ BitVec 32) List!11825) Bool)

(assert (=> b!597939 (arrayNoDuplicates!0 lt!271644 #b00000000000000000000000000000000 Nil!11822)))

(declare-fun lt!271643 () Unit!18814)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37046 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11825) Unit!18814)

(assert (=> b!597939 (= lt!271643 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11822))))

(assert (=> b!597939 (arrayContainsKey!0 lt!271644 (select (arr!17784 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271635 () Unit!18814)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37046 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18814)

(assert (=> b!597939 (= lt!271635 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271644 (select (arr!17784 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!597940 () Bool)

(assert (=> b!597940 (= e!341722 e!341729)))

(declare-fun res!383229 () Bool)

(assert (=> b!597940 (=> (not res!383229) (not e!341729))))

(assert (=> b!597940 (= res!383229 (not (contains!2956 Nil!11822 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!597941 () Bool)

(declare-fun res!383236 () Bool)

(assert (=> b!597941 (=> (not res!383236) (not e!341721))))

(assert (=> b!597941 (= res!383236 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11822))))

(assert (= (and start!54730 res!383225) b!597937))

(assert (= (and b!597937 res!383224) b!597938))

(assert (= (and b!597938 res!383230) b!597921))

(assert (= (and b!597921 res!383221) b!597932))

(assert (= (and b!597932 res!383235) b!597935))

(assert (= (and b!597935 res!383234) b!597930))

(assert (= (and b!597930 res!383228) b!597941))

(assert (= (and b!597941 res!383236) b!597920))

(assert (= (and b!597920 res!383233) b!597928))

(assert (= (and b!597928 res!383220) b!597936))

(assert (= (and b!597936 res!383227) b!597929))

(assert (= (and b!597929 res!383226) b!597934))

(assert (= (and b!597929 c!67718) b!597923))

(assert (= (and b!597929 (not c!67718)) b!597927))

(assert (= (and b!597929 (not res!383219)) b!597931))

(assert (= (and b!597931 res!383237) b!597926))

(assert (= (and b!597926 (not res!383223)) b!597925))

(assert (= (and b!597925 res!383231) b!597922))

(assert (= (and b!597931 (not res!383232)) b!597939))

(assert (= (and b!597939 (not res!383218)) b!597924))

(assert (= (and b!597924 (not res!383222)) b!597940))

(assert (= (and b!597940 res!383229) b!597933))

(declare-fun m!575267 () Bool)

(assert (=> b!597940 m!575267))

(declare-fun m!575269 () Bool)

(assert (=> b!597929 m!575269))

(declare-fun m!575271 () Bool)

(assert (=> b!597929 m!575271))

(declare-fun m!575273 () Bool)

(assert (=> b!597929 m!575273))

(declare-fun m!575275 () Bool)

(assert (=> b!597929 m!575275))

(declare-fun m!575277 () Bool)

(assert (=> b!597929 m!575277))

(declare-fun m!575279 () Bool)

(assert (=> b!597929 m!575279))

(declare-fun m!575281 () Bool)

(assert (=> b!597929 m!575281))

(assert (=> b!597929 m!575273))

(declare-fun m!575283 () Bool)

(assert (=> b!597929 m!575283))

(declare-fun m!575285 () Bool)

(assert (=> b!597932 m!575285))

(declare-fun m!575287 () Bool)

(assert (=> b!597920 m!575287))

(assert (=> b!597925 m!575273))

(assert (=> b!597925 m!575273))

(declare-fun m!575289 () Bool)

(assert (=> b!597925 m!575289))

(declare-fun m!575291 () Bool)

(assert (=> start!54730 m!575291))

(declare-fun m!575293 () Bool)

(assert (=> start!54730 m!575293))

(declare-fun m!575295 () Bool)

(assert (=> b!597936 m!575295))

(assert (=> b!597936 m!575273))

(assert (=> b!597936 m!575273))

(declare-fun m!575297 () Bool)

(assert (=> b!597936 m!575297))

(declare-fun m!575299 () Bool)

(assert (=> b!597921 m!575299))

(assert (=> b!597939 m!575273))

(declare-fun m!575301 () Bool)

(assert (=> b!597939 m!575301))

(assert (=> b!597939 m!575273))

(declare-fun m!575303 () Bool)

(assert (=> b!597939 m!575303))

(assert (=> b!597939 m!575273))

(declare-fun m!575305 () Bool)

(assert (=> b!597939 m!575305))

(declare-fun m!575307 () Bool)

(assert (=> b!597939 m!575307))

(assert (=> b!597931 m!575273))

(assert (=> b!597931 m!575275))

(declare-fun m!575309 () Bool)

(assert (=> b!597931 m!575309))

(declare-fun m!575311 () Bool)

(assert (=> b!597924 m!575311))

(declare-fun m!575313 () Bool)

(assert (=> b!597935 m!575313))

(declare-fun m!575315 () Bool)

(assert (=> b!597933 m!575315))

(assert (=> b!597926 m!575273))

(assert (=> b!597922 m!575273))

(assert (=> b!597922 m!575273))

(declare-fun m!575317 () Bool)

(assert (=> b!597922 m!575317))

(assert (=> b!597928 m!575275))

(declare-fun m!575319 () Bool)

(assert (=> b!597928 m!575319))

(declare-fun m!575321 () Bool)

(assert (=> b!597930 m!575321))

(assert (=> b!597938 m!575273))

(assert (=> b!597938 m!575273))

(declare-fun m!575323 () Bool)

(assert (=> b!597938 m!575323))

(declare-fun m!575325 () Bool)

(assert (=> b!597941 m!575325))

(push 1)

(assert (not b!597932))

(assert (not b!597933))

(assert (not b!597929))

(assert (not b!597930))

(assert (not b!597935))

(assert (not b!597940))

(assert (not b!597921))

(assert (not b!597922))

(assert (not b!597939))

(assert (not b!597936))

(assert (not start!54730))

(assert (not b!597924))

(assert (not b!597938))

(assert (not b!597925))

(assert (not b!597941))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!598147 () Bool)

(declare-fun e!341873 () Bool)

(declare-fun e!341876 () Bool)

(assert (=> b!598147 (= e!341873 e!341876)))

(declare-fun c!67743 () Bool)

(assert (=> b!598147 (= c!67743 (validKeyInArray!0 (select (arr!17784 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!598148 () Bool)

(declare-fun e!341874 () Bool)

(assert (=> b!598148 (= e!341874 (contains!2956 Nil!11822 (select (arr!17784 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!32952 () Bool)

(declare-fun call!32955 () Bool)

(assert (=> bm!32952 (= call!32955 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67743 (Cons!11821 (select (arr!17784 a!2986) #b00000000000000000000000000000000) Nil!11822) Nil!11822)))))

(declare-fun b!598149 () Bool)

(assert (=> b!598149 (= e!341876 call!32955)))

(declare-fun b!598150 () Bool)

(assert (=> b!598150 (= e!341876 call!32955)))

(declare-fun b!598151 () Bool)

(declare-fun e!341875 () Bool)

(assert (=> b!598151 (= e!341875 e!341873)))

(declare-fun res!383395 () Bool)

(assert (=> b!598151 (=> (not res!383395) (not e!341873))))

(assert (=> b!598151 (= res!383395 (not e!341874))))

(declare-fun res!383396 () Bool)

(assert (=> b!598151 (=> (not res!383396) (not e!341874))))

(assert (=> b!598151 (= res!383396 (validKeyInArray!0 (select (arr!17784 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!86971 () Bool)

(declare-fun res!383397 () Bool)

(assert (=> d!86971 (=> res!383397 e!341875)))

(assert (=> d!86971 (= res!383397 (bvsge #b00000000000000000000000000000000 (size!18148 a!2986)))))

(assert (=> d!86971 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11822) e!341875)))

(assert (= (and d!86971 (not res!383397)) b!598151))

(assert (= (and b!598151 res!383396) b!598148))

(assert (= (and b!598151 res!383395) b!598147))

(assert (= (and b!598147 c!67743) b!598149))

(assert (= (and b!598147 (not c!67743)) b!598150))

(assert (= (or b!598149 b!598150) bm!32952))

(declare-fun m!575485 () Bool)

(assert (=> b!598147 m!575485))

(assert (=> b!598147 m!575485))

(declare-fun m!575487 () Bool)

(assert (=> b!598147 m!575487))

(assert (=> b!598148 m!575485))

(assert (=> b!598148 m!575485))

(declare-fun m!575489 () Bool)

(assert (=> b!598148 m!575489))

(assert (=> bm!32952 m!575485))

(declare-fun m!575493 () Bool)

(assert (=> bm!32952 m!575493))

(assert (=> b!598151 m!575485))

(assert (=> b!598151 m!575485))

(assert (=> b!598151 m!575487))

(assert (=> b!597941 d!86971))

(declare-fun b!598183 () Bool)

(declare-fun e!341897 () Bool)

(declare-fun e!341899 () Bool)

(assert (=> b!598183 (= e!341897 e!341899)))

(declare-fun c!67755 () Bool)

(assert (=> b!598183 (= c!67755 (validKeyInArray!0 (select (arr!17784 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!598184 () Bool)

(declare-fun e!341898 () Bool)

(assert (=> b!598184 (= e!341899 e!341898)))

(declare-fun lt!271759 () (_ BitVec 64))

(assert (=> b!598184 (= lt!271759 (select (arr!17784 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!271758 () Unit!18814)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!37046 (_ BitVec 64) (_ BitVec 32)) Unit!18814)

(assert (=> b!598184 (= lt!271758 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!271759 #b00000000000000000000000000000000))))

(assert (=> b!598184 (arrayContainsKey!0 a!2986 lt!271759 #b00000000000000000000000000000000)))

(declare-fun lt!271757 () Unit!18814)

(assert (=> b!598184 (= lt!271757 lt!271758)))

(declare-fun res!383408 () Bool)

(assert (=> b!598184 (= res!383408 (= (seekEntryOrOpen!0 (select (arr!17784 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6224 #b00000000000000000000000000000000)))))

(assert (=> b!598184 (=> (not res!383408) (not e!341898))))

(declare-fun bm!32955 () Bool)

(declare-fun call!32958 () Bool)

(assert (=> bm!32955 (= call!32958 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun d!86985 () Bool)

(declare-fun res!383407 () Bool)

(assert (=> d!86985 (=> res!383407 e!341897)))

(assert (=> d!86985 (= res!383407 (bvsge #b00000000000000000000000000000000 (size!18148 a!2986)))))

(assert (=> d!86985 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!341897)))

(declare-fun b!598185 () Bool)

(assert (=> b!598185 (= e!341898 call!32958)))

(declare-fun b!598186 () Bool)

(assert (=> b!598186 (= e!341899 call!32958)))

(assert (= (and d!86985 (not res!383407)) b!598183))

(assert (= (and b!598183 c!67755) b!598184))

(assert (= (and b!598183 (not c!67755)) b!598186))

(assert (= (and b!598184 res!383408) b!598185))

(assert (= (or b!598185 b!598186) bm!32955))

(assert (=> b!598183 m!575485))

(assert (=> b!598183 m!575485))

(assert (=> b!598183 m!575487))

(assert (=> b!598184 m!575485))

(declare-fun m!575531 () Bool)

(assert (=> b!598184 m!575531))

(declare-fun m!575533 () Bool)

(assert (=> b!598184 m!575533))

(assert (=> b!598184 m!575485))

(declare-fun m!575535 () Bool)

(assert (=> b!598184 m!575535))

(declare-fun m!575537 () Bool)

(assert (=> bm!32955 m!575537))

(assert (=> b!597930 d!86985))

(declare-fun d!86999 () Bool)

(declare-fun res!383413 () Bool)

(declare-fun e!341904 () Bool)

(assert (=> d!86999 (=> res!383413 e!341904)))

(assert (=> d!86999 (= res!383413 (= (select (arr!17784 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!86999 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!341904)))

(declare-fun b!598191 () Bool)

(declare-fun e!341905 () Bool)

(assert (=> b!598191 (= e!341904 e!341905)))

(declare-fun res!383414 () Bool)

(assert (=> b!598191 (=> (not res!383414) (not e!341905))))

(assert (=> b!598191 (= res!383414 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18148 a!2986)))))

(declare-fun b!598192 () Bool)

(assert (=> b!598192 (= e!341905 (arrayContainsKey!0 a!2986 k!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!86999 (not res!383413)) b!598191))

(assert (= (and b!598191 res!383414) b!598192))

(assert (=> d!86999 m!575485))

(declare-fun m!575539 () Bool)

(assert (=> b!598192 m!575539))

(assert (=> b!597932 d!86999))

(declare-fun d!87001 () Bool)

(assert (=> d!87001 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!597921 d!87001))

(declare-fun b!598193 () Bool)

(declare-fun e!341906 () Bool)

(declare-fun e!341909 () Bool)

(assert (=> b!598193 (= e!341906 e!341909)))

(declare-fun c!67756 () Bool)

(assert (=> b!598193 (= c!67756 (validKeyInArray!0 (select (arr!17784 lt!271644) #b00000000000000000000000000000000)))))

(declare-fun b!598194 () Bool)

(declare-fun e!341907 () Bool)

(assert (=> b!598194 (= e!341907 (contains!2956 Nil!11822 (select (arr!17784 lt!271644) #b00000000000000000000000000000000)))))

(declare-fun bm!32956 () Bool)

(declare-fun call!32959 () Bool)

(assert (=> bm!32956 (= call!32959 (arrayNoDuplicates!0 lt!271644 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!67756 (Cons!11821 (select (arr!17784 lt!271644) #b00000000000000000000000000000000) Nil!11822) Nil!11822)))))

(declare-fun b!598195 () Bool)

(assert (=> b!598195 (= e!341909 call!32959)))

(declare-fun b!598196 () Bool)

(assert (=> b!598196 (= e!341909 call!32959)))

(declare-fun b!598197 () Bool)

(declare-fun e!341908 () Bool)

(assert (=> b!598197 (= e!341908 e!341906)))

(declare-fun res!383415 () Bool)

(assert (=> b!598197 (=> (not res!383415) (not e!341906))))

(assert (=> b!598197 (= res!383415 (not e!341907))))

(declare-fun res!383416 () Bool)

(assert (=> b!598197 (=> (not res!383416) (not e!341907))))

(assert (=> b!598197 (= res!383416 (validKeyInArray!0 (select (arr!17784 lt!271644) #b00000000000000000000000000000000)))))

(declare-fun d!87003 () Bool)

(declare-fun res!383417 () Bool)

(assert (=> d!87003 (=> res!383417 e!341908)))

(assert (=> d!87003 (= res!383417 (bvsge #b00000000000000000000000000000000 (size!18148 lt!271644)))))

(assert (=> d!87003 (= (arrayNoDuplicates!0 lt!271644 #b00000000000000000000000000000000 Nil!11822) e!341908)))

(assert (= (and d!87003 (not res!383417)) b!598197))

(assert (= (and b!598197 res!383416) b!598194))

(assert (= (and b!598197 res!383415) b!598193))

(assert (= (and b!598193 c!67756) b!598195))

(assert (= (and b!598193 (not c!67756)) b!598196))

(assert (= (or b!598195 b!598196) bm!32956))

(declare-fun m!575541 () Bool)

(assert (=> b!598193 m!575541))

(assert (=> b!598193 m!575541))

(declare-fun m!575543 () Bool)

(assert (=> b!598193 m!575543))

(assert (=> b!598194 m!575541))

(assert (=> b!598194 m!575541))

(declare-fun m!575545 () Bool)

(assert (=> b!598194 m!575545))

(assert (=> bm!32956 m!575541))

(declare-fun m!575547 () Bool)

(assert (=> bm!32956 m!575547))

(assert (=> b!598197 m!575541))

(assert (=> b!598197 m!575541))

(assert (=> b!598197 m!575543))

(assert (=> b!597939 d!87003))

(declare-fun d!87005 () Bool)

(declare-fun e!341923 () Bool)

(assert (=> d!87005 e!341923))

(declare-fun res!383425 () Bool)

(assert (=> d!87005 (=> (not res!383425) (not e!341923))))

(assert (=> d!87005 (= res!383425 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18148 a!2986))))))

(declare-fun lt!271769 () Unit!18814)

(declare-fun choose!41 (array!37046 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11825) Unit!18814)

(assert (=> d!87005 (= lt!271769 (choose!41 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11822))))

(assert (=> d!87005 (bvslt (size!18148 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!87005 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11822) lt!271769)))

(declare-fun b!598217 () Bool)

(assert (=> b!598217 (= e!341923 (arrayNoDuplicates!0 (array!37047 (store (arr!17784 a!2986) i!1108 k!1786) (size!18148 a!2986)) #b00000000000000000000000000000000 Nil!11822))))

(assert (= (and d!87005 res!383425) b!598217))

(declare-fun m!575555 () Bool)

(assert (=> d!87005 m!575555))

(assert (=> b!598217 m!575275))

(declare-fun m!575557 () Bool)

(assert (=> b!598217 m!575557))

(assert (=> b!597939 d!87005))

(declare-fun d!87011 () Bool)

(declare-fun res!383426 () Bool)

(declare-fun e!341924 () Bool)

(assert (=> d!87011 (=> res!383426 e!341924)))

(assert (=> d!87011 (= res!383426 (= (select (arr!17784 lt!271644) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!17784 a!2986) j!136)))))

(assert (=> d!87011 (= (arrayContainsKey!0 lt!271644 (select (arr!17784 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!341924)))

(declare-fun b!598218 () Bool)

(declare-fun e!341925 () Bool)

(assert (=> b!598218 (= e!341924 e!341925)))

(declare-fun res!383427 () Bool)

(assert (=> b!598218 (=> (not res!383427) (not e!341925))))

(assert (=> b!598218 (= res!383427 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18148 lt!271644)))))

(declare-fun b!598219 () Bool)

(assert (=> b!598219 (= e!341925 (arrayContainsKey!0 lt!271644 (select (arr!17784 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!87011 (not res!383426)) b!598218))

(assert (= (and b!598218 res!383427) b!598219))

(declare-fun m!575559 () Bool)

(assert (=> d!87011 m!575559))

(assert (=> b!598219 m!575273))

(declare-fun m!575561 () Bool)

(assert (=> b!598219 m!575561))

(assert (=> b!597939 d!87011))

(declare-fun d!87013 () Bool)

(assert (=> d!87013 (arrayContainsKey!0 lt!271644 (select (arr!17784 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!271772 () Unit!18814)

(declare-fun choose!114 (array!37046 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18814)

(assert (=> d!87013 (= lt!271772 (choose!114 lt!271644 (select (arr!17784 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!87013 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!87013 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!271644 (select (arr!17784 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!271772)))

(declare-fun bs!18384 () Bool)

(assert (= bs!18384 d!87013))

(assert (=> bs!18384 m!575273))

(assert (=> bs!18384 m!575305))

(assert (=> bs!18384 m!575273))

(declare-fun m!575567 () Bool)

(assert (=> bs!18384 m!575567))

(assert (=> b!597939 d!87013))

(declare-fun d!87017 () Bool)

(assert (=> d!87017 (= (validKeyInArray!0 (select (arr!17784 a!2986) j!136)) (and (not (= (select (arr!17784 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17784 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!597938 d!87017))

(declare-fun d!87019 () Bool)

(declare-fun lt!271781 () Bool)

(declare-fun content!238 (List!11825) (Set (_ BitVec 64)))

(assert (=> d!87019 (= lt!271781 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!238 Nil!11822)))))

(declare-fun e!341946 () Bool)

(assert (=> d!87019 (= lt!271781 e!341946)))

(declare-fun res!383444 () Bool)

(assert (=> d!87019 (=> (not res!383444) (not e!341946))))

(assert (=> d!87019 (= res!383444 (is-Cons!11821 Nil!11822))))

(assert (=> d!87019 (= (contains!2956 Nil!11822 #b0000000000000000000000000000000000000000000000000000000000000000) lt!271781)))

(declare-fun b!598242 () Bool)

(declare-fun e!341945 () Bool)

(assert (=> b!598242 (= e!341946 e!341945)))

(declare-fun res!383445 () Bool)

(assert (=> b!598242 (=> res!383445 e!341945)))

(assert (=> b!598242 (= res!383445 (= (h!12866 Nil!11822) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!598243 () Bool)

(assert (=> b!598243 (= e!341945 (contains!2956 (t!18053 Nil!11822) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!87019 res!383444) b!598242))

(assert (= (and b!598242 (not res!383445)) b!598243))

(declare-fun m!575585 () Bool)

(assert (=> d!87019 m!575585))

(declare-fun m!575587 () Bool)

(assert (=> d!87019 m!575587))

(declare-fun m!575589 () Bool)

(assert (=> b!598243 m!575589))

(assert (=> b!597940 d!87019))

(declare-fun lt!271798 () SeekEntryResult!6224)

(declare-fun d!87029 () Bool)

(assert (=> d!87029 (and (or (is-Undefined!6224 lt!271798) (not (is-Found!6224 lt!271798)) (and (bvsge (index!27151 lt!271798) #b00000000000000000000000000000000) (bvslt (index!27151 lt!271798) (size!18148 lt!271644)))) (or (is-Undefined!6224 lt!271798) (is-Found!6224 lt!271798) (not (is-MissingVacant!6224 lt!271798)) (not (= (index!27153 lt!271798) vacantSpotIndex!68)) (and (bvsge (index!27153 lt!271798) #b00000000000000000000000000000000) (bvslt (index!27153 lt!271798) (size!18148 lt!271644)))) (or (is-Undefined!6224 lt!271798) (ite (is-Found!6224 lt!271798) (= (select (arr!17784 lt!271644) (index!27151 lt!271798)) lt!271639) (and (is-MissingVacant!6224 lt!271798) (= (index!27153 lt!271798) vacantSpotIndex!68) (= (select (arr!17784 lt!271644) (index!27153 lt!271798)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!341980 () SeekEntryResult!6224)

(assert (=> d!87029 (= lt!271798 e!341980)))

(declare-fun c!67782 () Bool)

(assert (=> d!87029 (= c!67782 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!271797 () (_ BitVec 64))

(assert (=> d!87029 (= lt!271797 (select (arr!17784 lt!271644) lt!271636))))

(assert (=> d!87029 (validMask!0 mask!3053)))

(assert (=> d!87029 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271636 vacantSpotIndex!68 lt!271639 lt!271644 mask!3053) lt!271798)))

(declare-fun b!598290 () Bool)

(declare-fun e!341979 () SeekEntryResult!6224)

(assert (=> b!598290 (= e!341979 (Found!6224 lt!271636))))

(declare-fun b!598291 () Bool)

(assert (=> b!598291 (= e!341980 e!341979)))

(declare-fun c!67781 () Bool)

(assert (=> b!598291 (= c!67781 (= lt!271797 lt!271639))))

(declare-fun b!598292 () Bool)

(declare-fun c!67783 () Bool)

(assert (=> b!598292 (= c!67783 (= lt!271797 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!341978 () SeekEntryResult!6224)

(assert (=> b!598292 (= e!341979 e!341978)))

(declare-fun b!598293 () Bool)

(assert (=> b!598293 (= e!341978 (MissingVacant!6224 vacantSpotIndex!68))))

(declare-fun b!598294 () Bool)

(assert (=> b!598294 (= e!341978 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271636 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 lt!271639 lt!271644 mask!3053))))

(declare-fun b!598295 () Bool)

(assert (=> b!598295 (= e!341980 Undefined!6224)))

(assert (= (and d!87029 c!67782) b!598295))

(assert (= (and d!87029 (not c!67782)) b!598291))

(assert (= (and b!598291 c!67781) b!598290))

(assert (= (and b!598291 (not c!67781)) b!598292))

(assert (= (and b!598292 c!67783) b!598293))

(assert (= (and b!598292 (not c!67783)) b!598294))

(declare-fun m!575631 () Bool)

(assert (=> d!87029 m!575631))

(declare-fun m!575633 () Bool)

(assert (=> d!87029 m!575633))

(declare-fun m!575635 () Bool)

(assert (=> d!87029 m!575635))

(assert (=> d!87029 m!575291))

(declare-fun m!575637 () Bool)

(assert (=> b!598294 m!575637))

(assert (=> b!598294 m!575637))

(declare-fun m!575639 () Bool)

(assert (=> b!598294 m!575639))

(assert (=> b!597929 d!87029))

(declare-fun d!87047 () Bool)

(declare-fun e!342004 () Bool)

(assert (=> d!87047 e!342004))

(declare-fun res!383476 () Bool)

(assert (=> d!87047 (=> (not res!383476) (not e!342004))))

(assert (=> d!87047 (= res!383476 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18148 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18148 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18148 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18148 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18148 a!2986))))))

(declare-fun lt!271811 () Unit!18814)

(declare-fun choose!9 (array!37046 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18814)

(assert (=> d!87047 (= lt!271811 (choose!9 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271636 vacantSpotIndex!68 mask!3053))))

(assert (=> d!87047 (validMask!0 mask!3053)))

(assert (=> d!87047 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!271636 vacantSpotIndex!68 mask!3053) lt!271811)))

(declare-fun b!598328 () Bool)

(assert (=> b!598328 (= e!342004 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271636 vacantSpotIndex!68 (select (arr!17784 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271636 vacantSpotIndex!68 (select (store (arr!17784 a!2986) i!1108 k!1786) j!136) (array!37047 (store (arr!17784 a!2986) i!1108 k!1786) (size!18148 a!2986)) mask!3053)))))

(assert (= (and d!87047 res!383476) b!598328))

(declare-fun m!575667 () Bool)

(assert (=> d!87047 m!575667))

(assert (=> d!87047 m!575291))

(assert (=> b!598328 m!575271))

(assert (=> b!598328 m!575273))

(assert (=> b!598328 m!575283))

(assert (=> b!598328 m!575273))

(assert (=> b!598328 m!575275))

(assert (=> b!598328 m!575271))

(declare-fun m!575669 () Bool)

(assert (=> b!598328 m!575669))

(assert (=> b!597929 d!87047))

(declare-fun d!87061 () Bool)

(declare-fun lt!271814 () (_ BitVec 32))

(assert (=> d!87061 (and (bvsge lt!271814 #b00000000000000000000000000000000) (bvslt lt!271814 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!87061 (= lt!271814 (choose!52 index!984 x!910 mask!3053))))

(assert (=> d!87061 (validMask!0 mask!3053)))

(assert (=> d!87061 (= (nextIndex!0 index!984 x!910 mask!3053) lt!271814)))

(declare-fun bs!18387 () Bool)

(assert (= bs!18387 d!87061))

(declare-fun m!575671 () Bool)

(assert (=> bs!18387 m!575671))

(assert (=> bs!18387 m!575291))

(assert (=> b!597929 d!87061))

(declare-fun d!87063 () Bool)

(declare-fun lt!271816 () SeekEntryResult!6224)

(assert (=> d!87063 (and (or (is-Undefined!6224 lt!271816) (not (is-Found!6224 lt!271816)) (and (bvsge (index!27151 lt!271816) #b00000000000000000000000000000000) (bvslt (index!27151 lt!271816) (size!18148 a!2986)))) (or (is-Undefined!6224 lt!271816) (is-Found!6224 lt!271816) (not (is-MissingVacant!6224 lt!271816)) (not (= (index!27153 lt!271816) vacantSpotIndex!68)) (and (bvsge (index!27153 lt!271816) #b00000000000000000000000000000000) (bvslt (index!27153 lt!271816) (size!18148 a!2986)))) (or (is-Undefined!6224 lt!271816) (ite (is-Found!6224 lt!271816) (= (select (arr!17784 a!2986) (index!27151 lt!271816)) (select (arr!17784 a!2986) j!136)) (and (is-MissingVacant!6224 lt!271816) (= (index!27153 lt!271816) vacantSpotIndex!68) (= (select (arr!17784 a!2986) (index!27153 lt!271816)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!342007 () SeekEntryResult!6224)

(assert (=> d!87063 (= lt!271816 e!342007)))

(declare-fun c!67794 () Bool)

(assert (=> d!87063 (= c!67794 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(declare-fun lt!271815 () (_ BitVec 64))

(assert (=> d!87063 (= lt!271815 (select (arr!17784 a!2986) lt!271636))))

(assert (=> d!87063 (validMask!0 mask!3053)))

(assert (=> d!87063 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!271636 vacantSpotIndex!68 (select (arr!17784 a!2986) j!136) a!2986 mask!3053) lt!271816)))

(declare-fun b!598329 () Bool)

(declare-fun e!342006 () SeekEntryResult!6224)

(assert (=> b!598329 (= e!342006 (Found!6224 lt!271636))))

(declare-fun b!598330 () Bool)

(assert (=> b!598330 (= e!342007 e!342006)))

(declare-fun c!67793 () Bool)

(assert (=> b!598330 (= c!67793 (= lt!271815 (select (arr!17784 a!2986) j!136)))))

(declare-fun b!598331 () Bool)

(declare-fun c!67795 () Bool)

(assert (=> b!598331 (= c!67795 (= lt!271815 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!342005 () SeekEntryResult!6224)

(assert (=> b!598331 (= e!342006 e!342005)))

(declare-fun b!598332 () Bool)

(assert (=> b!598332 (= e!342005 (MissingVacant!6224 vacantSpotIndex!68))))

(declare-fun b!598333 () Bool)

(assert (=> b!598333 (= e!342005 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!271636 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) vacantSpotIndex!68 (select (arr!17784 a!2986) j!136) a!2986 mask!3053))))

