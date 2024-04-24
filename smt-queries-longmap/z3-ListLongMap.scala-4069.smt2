; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55962 () Bool)

(assert start!55962)

(declare-fun b!612264 () Bool)

(declare-datatypes ((Unit!19621 0))(
  ( (Unit!19622) )
))
(declare-fun e!350923 () Unit!19621)

(declare-fun Unit!19623 () Unit!19621)

(assert (=> b!612264 (= e!350923 Unit!19623)))

(declare-fun b!612265 () Bool)

(declare-fun Unit!19624 () Unit!19621)

(assert (=> b!612265 (= e!350923 Unit!19624)))

(assert (=> b!612265 false))

(declare-fun b!612266 () Bool)

(declare-fun e!350928 () Bool)

(declare-datatypes ((SeekEntryResult!6328 0))(
  ( (MissingZero!6328 (index!27596 (_ BitVec 32))) (Found!6328 (index!27597 (_ BitVec 32))) (Intermediate!6328 (undefined!7140 Bool) (index!27598 (_ BitVec 32)) (x!56563 (_ BitVec 32))) (Undefined!6328) (MissingVacant!6328 (index!27599 (_ BitVec 32))) )
))
(declare-fun lt!280247 () SeekEntryResult!6328)

(declare-fun lt!280245 () SeekEntryResult!6328)

(assert (=> b!612266 (= e!350928 (= lt!280247 lt!280245))))

(declare-fun b!612267 () Bool)

(declare-fun e!350926 () Unit!19621)

(declare-fun Unit!19625 () Unit!19621)

(assert (=> b!612267 (= e!350926 Unit!19625)))

(declare-fun b!612268 () Bool)

(declare-fun e!350919 () Bool)

(declare-fun e!350918 () Bool)

(assert (=> b!612268 (= e!350919 e!350918)))

(declare-fun res!393806 () Bool)

(assert (=> b!612268 (=> res!393806 e!350918)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!612268 (= res!393806 (bvsge index!984 j!136))))

(declare-fun lt!280236 () Unit!19621)

(assert (=> b!612268 (= lt!280236 e!350926)))

(declare-fun c!69604 () Bool)

(assert (=> b!612268 (= c!69604 (bvslt j!136 index!984))))

(declare-fun b!612269 () Bool)

(declare-fun e!350927 () Bool)

(declare-fun e!350917 () Bool)

(assert (=> b!612269 (= e!350927 (not e!350917))))

(declare-fun res!393811 () Bool)

(assert (=> b!612269 (=> res!393811 e!350917)))

(declare-fun lt!280242 () SeekEntryResult!6328)

(assert (=> b!612269 (= res!393811 (not (= lt!280242 (Found!6328 index!984))))))

(declare-fun lt!280239 () Unit!19621)

(assert (=> b!612269 (= lt!280239 e!350923)))

(declare-fun c!69605 () Bool)

(assert (=> b!612269 (= c!69605 (= lt!280242 Undefined!6328))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((array!37377 0))(
  ( (array!37378 (arr!17932 (Array (_ BitVec 32) (_ BitVec 64))) (size!18296 (_ BitVec 32))) )
))
(declare-fun lt!280238 () array!37377)

(declare-fun lt!280250 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37377 (_ BitVec 32)) SeekEntryResult!6328)

(assert (=> b!612269 (= lt!280242 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!280250 lt!280238 mask!3053))))

(assert (=> b!612269 e!350928))

(declare-fun res!393803 () Bool)

(assert (=> b!612269 (=> (not res!393803) (not e!350928))))

(declare-fun lt!280243 () (_ BitVec 32))

(assert (=> b!612269 (= res!393803 (= lt!280245 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280243 vacantSpotIndex!68 lt!280250 lt!280238 mask!3053)))))

(declare-fun a!2986 () array!37377)

(assert (=> b!612269 (= lt!280245 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280243 vacantSpotIndex!68 (select (arr!17932 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!612269 (= lt!280250 (select (store (arr!17932 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!280249 () Unit!19621)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37377 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19621)

(assert (=> b!612269 (= lt!280249 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!280243 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!612269 (= lt!280243 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!612271 () Bool)

(assert (=> b!612271 (= e!350918 true)))

(declare-datatypes ((List!11880 0))(
  ( (Nil!11877) (Cons!11876 (h!12924 (_ BitVec 64)) (t!18100 List!11880)) )
))
(declare-fun arrayNoDuplicates!0 (array!37377 (_ BitVec 32) List!11880) Bool)

(assert (=> b!612271 (arrayNoDuplicates!0 lt!280238 #b00000000000000000000000000000000 Nil!11877)))

(declare-fun lt!280248 () Unit!19621)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37377 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11880) Unit!19621)

(assert (=> b!612271 (= lt!280248 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11877))))

(declare-fun arrayContainsKey!0 (array!37377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!612271 (arrayContainsKey!0 lt!280238 (select (arr!17932 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!280252 () Unit!19621)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37377 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19621)

(assert (=> b!612271 (= lt!280252 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280238 (select (arr!17932 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!350921 () Bool)

(assert (=> b!612271 e!350921))

(declare-fun res!393798 () Bool)

(assert (=> b!612271 (=> (not res!393798) (not e!350921))))

(assert (=> b!612271 (= res!393798 (arrayContainsKey!0 lt!280238 (select (arr!17932 a!2986) j!136) j!136))))

(declare-fun b!612272 () Bool)

(declare-fun res!393793 () Bool)

(declare-fun e!350925 () Bool)

(assert (=> b!612272 (=> (not res!393793) (not e!350925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37377 (_ BitVec 32)) Bool)

(assert (=> b!612272 (= res!393793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!612273 () Bool)

(declare-fun res!393801 () Bool)

(declare-fun e!350916 () Bool)

(assert (=> b!612273 (=> (not res!393801) (not e!350916))))

(assert (=> b!612273 (= res!393801 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!612274 () Bool)

(declare-fun e!350924 () Bool)

(declare-fun e!350914 () Bool)

(assert (=> b!612274 (= e!350924 e!350914)))

(declare-fun res!393799 () Bool)

(assert (=> b!612274 (=> (not res!393799) (not e!350914))))

(assert (=> b!612274 (= res!393799 (arrayContainsKey!0 lt!280238 (select (arr!17932 a!2986) j!136) j!136))))

(declare-fun b!612275 () Bool)

(assert (=> b!612275 (= e!350917 e!350919)))

(declare-fun res!393810 () Bool)

(assert (=> b!612275 (=> res!393810 e!350919)))

(declare-fun lt!280246 () (_ BitVec 64))

(assert (=> b!612275 (= res!393810 (or (not (= (select (arr!17932 a!2986) j!136) lt!280250)) (not (= (select (arr!17932 a!2986) j!136) lt!280246))))))

(declare-fun e!350920 () Bool)

(assert (=> b!612275 e!350920))

(declare-fun res!393802 () Bool)

(assert (=> b!612275 (=> (not res!393802) (not e!350920))))

(assert (=> b!612275 (= res!393802 (= lt!280246 (select (arr!17932 a!2986) j!136)))))

(assert (=> b!612275 (= lt!280246 (select (store (arr!17932 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!612276 () Bool)

(declare-fun res!393800 () Bool)

(assert (=> b!612276 (=> (not res!393800) (not e!350925))))

(assert (=> b!612276 (= res!393800 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17932 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!612277 () Bool)

(declare-fun e!350922 () Bool)

(assert (=> b!612277 (= e!350925 e!350922)))

(declare-fun res!393794 () Bool)

(assert (=> b!612277 (=> (not res!393794) (not e!350922))))

(assert (=> b!612277 (= res!393794 (= (select (store (arr!17932 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!612277 (= lt!280238 (array!37378 (store (arr!17932 a!2986) i!1108 k0!1786) (size!18296 a!2986)))))

(declare-fun b!612278 () Bool)

(declare-fun res!393808 () Bool)

(assert (=> b!612278 (=> (not res!393808) (not e!350916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!612278 (= res!393808 (validKeyInArray!0 (select (arr!17932 a!2986) j!136)))))

(declare-fun b!612279 () Bool)

(declare-fun res!393809 () Bool)

(assert (=> b!612279 (=> (not res!393809) (not e!350925))))

(assert (=> b!612279 (= res!393809 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11877))))

(declare-fun b!612280 () Bool)

(declare-fun res!393804 () Bool)

(assert (=> b!612280 (=> (not res!393804) (not e!350916))))

(assert (=> b!612280 (= res!393804 (and (= (size!18296 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18296 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18296 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!612281 () Bool)

(assert (=> b!612281 (= e!350920 e!350924)))

(declare-fun res!393795 () Bool)

(assert (=> b!612281 (=> res!393795 e!350924)))

(assert (=> b!612281 (= res!393795 (or (not (= (select (arr!17932 a!2986) j!136) lt!280250)) (not (= (select (arr!17932 a!2986) j!136) lt!280246)) (bvsge j!136 index!984)))))

(declare-fun b!612282 () Bool)

(assert (=> b!612282 (= e!350914 (arrayContainsKey!0 lt!280238 (select (arr!17932 a!2986) j!136) index!984))))

(declare-fun b!612283 () Bool)

(declare-fun Unit!19626 () Unit!19621)

(assert (=> b!612283 (= e!350926 Unit!19626)))

(declare-fun lt!280244 () Unit!19621)

(assert (=> b!612283 (= lt!280244 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280238 (select (arr!17932 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!612283 (arrayContainsKey!0 lt!280238 (select (arr!17932 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!280237 () Unit!19621)

(assert (=> b!612283 (= lt!280237 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!11877))))

(assert (=> b!612283 (arrayNoDuplicates!0 lt!280238 #b00000000000000000000000000000000 Nil!11877)))

(declare-fun lt!280240 () Unit!19621)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37377 (_ BitVec 32) (_ BitVec 32)) Unit!19621)

(assert (=> b!612283 (= lt!280240 (lemmaNoDuplicateFromThenFromBigger!0 lt!280238 #b00000000000000000000000000000000 j!136))))

(assert (=> b!612283 (arrayNoDuplicates!0 lt!280238 j!136 Nil!11877)))

(declare-fun lt!280241 () Unit!19621)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37377 (_ BitVec 64) (_ BitVec 32) List!11880) Unit!19621)

(assert (=> b!612283 (= lt!280241 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!280238 (select (arr!17932 a!2986) j!136) j!136 Nil!11877))))

(assert (=> b!612283 false))

(declare-fun b!612284 () Bool)

(assert (=> b!612284 (= e!350922 e!350927)))

(declare-fun res!393797 () Bool)

(assert (=> b!612284 (=> (not res!393797) (not e!350927))))

(assert (=> b!612284 (= res!393797 (and (= lt!280247 (Found!6328 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17932 a!2986) index!984) (select (arr!17932 a!2986) j!136))) (not (= (select (arr!17932 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!612284 (= lt!280247 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17932 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!612270 () Bool)

(assert (=> b!612270 (= e!350921 (arrayContainsKey!0 lt!280238 (select (arr!17932 a!2986) j!136) index!984))))

(declare-fun res!393805 () Bool)

(assert (=> start!55962 (=> (not res!393805) (not e!350916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55962 (= res!393805 (validMask!0 mask!3053))))

(assert (=> start!55962 e!350916))

(assert (=> start!55962 true))

(declare-fun array_inv!13791 (array!37377) Bool)

(assert (=> start!55962 (array_inv!13791 a!2986)))

(declare-fun b!612285 () Bool)

(assert (=> b!612285 (= e!350916 e!350925)))

(declare-fun res!393796 () Bool)

(assert (=> b!612285 (=> (not res!393796) (not e!350925))))

(declare-fun lt!280251 () SeekEntryResult!6328)

(assert (=> b!612285 (= res!393796 (or (= lt!280251 (MissingZero!6328 i!1108)) (= lt!280251 (MissingVacant!6328 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37377 (_ BitVec 32)) SeekEntryResult!6328)

(assert (=> b!612285 (= lt!280251 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!612286 () Bool)

(declare-fun res!393807 () Bool)

(assert (=> b!612286 (=> (not res!393807) (not e!350916))))

(assert (=> b!612286 (= res!393807 (validKeyInArray!0 k0!1786))))

(assert (= (and start!55962 res!393805) b!612280))

(assert (= (and b!612280 res!393804) b!612278))

(assert (= (and b!612278 res!393808) b!612286))

(assert (= (and b!612286 res!393807) b!612273))

(assert (= (and b!612273 res!393801) b!612285))

(assert (= (and b!612285 res!393796) b!612272))

(assert (= (and b!612272 res!393793) b!612279))

(assert (= (and b!612279 res!393809) b!612276))

(assert (= (and b!612276 res!393800) b!612277))

(assert (= (and b!612277 res!393794) b!612284))

(assert (= (and b!612284 res!393797) b!612269))

(assert (= (and b!612269 res!393803) b!612266))

(assert (= (and b!612269 c!69605) b!612265))

(assert (= (and b!612269 (not c!69605)) b!612264))

(assert (= (and b!612269 (not res!393811)) b!612275))

(assert (= (and b!612275 res!393802) b!612281))

(assert (= (and b!612281 (not res!393795)) b!612274))

(assert (= (and b!612274 res!393799) b!612282))

(assert (= (and b!612275 (not res!393810)) b!612268))

(assert (= (and b!612268 c!69604) b!612283))

(assert (= (and b!612268 (not c!69604)) b!612267))

(assert (= (and b!612268 (not res!393806)) b!612271))

(assert (= (and b!612271 res!393798) b!612270))

(declare-fun m!588917 () Bool)

(assert (=> b!612286 m!588917))

(declare-fun m!588919 () Bool)

(assert (=> b!612273 m!588919))

(declare-fun m!588921 () Bool)

(assert (=> b!612276 m!588921))

(declare-fun m!588923 () Bool)

(assert (=> b!612270 m!588923))

(assert (=> b!612270 m!588923))

(declare-fun m!588925 () Bool)

(assert (=> b!612270 m!588925))

(declare-fun m!588927 () Bool)

(assert (=> b!612279 m!588927))

(assert (=> b!612275 m!588923))

(declare-fun m!588929 () Bool)

(assert (=> b!612275 m!588929))

(declare-fun m!588931 () Bool)

(assert (=> b!612275 m!588931))

(assert (=> b!612282 m!588923))

(assert (=> b!612282 m!588923))

(assert (=> b!612282 m!588925))

(declare-fun m!588933 () Bool)

(assert (=> b!612284 m!588933))

(assert (=> b!612284 m!588923))

(assert (=> b!612284 m!588923))

(declare-fun m!588935 () Bool)

(assert (=> b!612284 m!588935))

(assert (=> b!612281 m!588923))

(declare-fun m!588937 () Bool)

(assert (=> start!55962 m!588937))

(declare-fun m!588939 () Bool)

(assert (=> start!55962 m!588939))

(assert (=> b!612278 m!588923))

(assert (=> b!612278 m!588923))

(declare-fun m!588941 () Bool)

(assert (=> b!612278 m!588941))

(assert (=> b!612274 m!588923))

(assert (=> b!612274 m!588923))

(declare-fun m!588943 () Bool)

(assert (=> b!612274 m!588943))

(assert (=> b!612277 m!588929))

(declare-fun m!588945 () Bool)

(assert (=> b!612277 m!588945))

(declare-fun m!588947 () Bool)

(assert (=> b!612285 m!588947))

(declare-fun m!588949 () Bool)

(assert (=> b!612269 m!588949))

(declare-fun m!588951 () Bool)

(assert (=> b!612269 m!588951))

(assert (=> b!612269 m!588923))

(assert (=> b!612269 m!588929))

(declare-fun m!588953 () Bool)

(assert (=> b!612269 m!588953))

(declare-fun m!588955 () Bool)

(assert (=> b!612269 m!588955))

(assert (=> b!612269 m!588923))

(declare-fun m!588957 () Bool)

(assert (=> b!612269 m!588957))

(declare-fun m!588959 () Bool)

(assert (=> b!612269 m!588959))

(declare-fun m!588961 () Bool)

(assert (=> b!612272 m!588961))

(assert (=> b!612283 m!588923))

(declare-fun m!588963 () Bool)

(assert (=> b!612283 m!588963))

(assert (=> b!612283 m!588923))

(declare-fun m!588965 () Bool)

(assert (=> b!612283 m!588965))

(declare-fun m!588967 () Bool)

(assert (=> b!612283 m!588967))

(declare-fun m!588969 () Bool)

(assert (=> b!612283 m!588969))

(assert (=> b!612283 m!588923))

(declare-fun m!588971 () Bool)

(assert (=> b!612283 m!588971))

(assert (=> b!612283 m!588923))

(declare-fun m!588973 () Bool)

(assert (=> b!612283 m!588973))

(declare-fun m!588975 () Bool)

(assert (=> b!612283 m!588975))

(assert (=> b!612271 m!588923))

(assert (=> b!612271 m!588923))

(assert (=> b!612271 m!588943))

(assert (=> b!612271 m!588923))

(declare-fun m!588977 () Bool)

(assert (=> b!612271 m!588977))

(assert (=> b!612271 m!588965))

(assert (=> b!612271 m!588923))

(declare-fun m!588979 () Bool)

(assert (=> b!612271 m!588979))

(assert (=> b!612271 m!588967))

(check-sat (not b!612278) (not b!612274) (not b!612269) (not b!612272) (not b!612285) (not b!612279) (not b!612270) (not b!612286) (not b!612273) (not b!612284) (not b!612271) (not start!55962) (not b!612283) (not b!612282))
(check-sat)
