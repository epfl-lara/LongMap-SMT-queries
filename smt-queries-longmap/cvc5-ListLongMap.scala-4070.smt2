; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55918 () Bool)

(assert start!55918)

(declare-fun b!612262 () Bool)

(declare-fun res!393860 () Bool)

(declare-fun e!350931 () Bool)

(assert (=> b!612262 (=> (not res!393860) (not e!350931))))

(declare-datatypes ((array!37388 0))(
  ( (array!37389 (arr!17940 (Array (_ BitVec 32) (_ BitVec 64))) (size!18304 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37388)

(declare-datatypes ((List!11981 0))(
  ( (Nil!11978) (Cons!11977 (h!13022 (_ BitVec 64)) (t!18209 List!11981)) )
))
(declare-fun arrayNoDuplicates!0 (array!37388 (_ BitVec 32) List!11981) Bool)

(assert (=> b!612262 (= res!393860 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11978))))

(declare-fun b!612263 () Bool)

(declare-datatypes ((Unit!19660 0))(
  ( (Unit!19661) )
))
(declare-fun e!350924 () Unit!19660)

(declare-fun Unit!19662 () Unit!19660)

(assert (=> b!612263 (= e!350924 Unit!19662)))

(declare-fun b!612264 () Bool)

(declare-fun e!350920 () Bool)

(assert (=> b!612264 (= e!350920 true)))

(declare-fun lt!280299 () array!37388)

(assert (=> b!612264 (arrayNoDuplicates!0 lt!280299 #b00000000000000000000000000000000 Nil!11978)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!280296 () Unit!19660)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37388 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11981) Unit!19660)

(assert (=> b!612264 (= lt!280296 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11978))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!612264 (arrayContainsKey!0 lt!280299 (select (arr!17940 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!280289 () Unit!19660)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37388 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19660)

(assert (=> b!612264 (= lt!280289 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280299 (select (arr!17940 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!350934 () Bool)

(assert (=> b!612264 e!350934))

(declare-fun res!393871 () Bool)

(assert (=> b!612264 (=> (not res!393871) (not e!350934))))

(assert (=> b!612264 (= res!393871 (arrayContainsKey!0 lt!280299 (select (arr!17940 a!2986) j!136) j!136))))

(declare-fun b!612265 () Bool)

(declare-fun e!350932 () Unit!19660)

(declare-fun Unit!19663 () Unit!19660)

(assert (=> b!612265 (= e!350932 Unit!19663)))

(declare-fun lt!280292 () Unit!19660)

(assert (=> b!612265 (= lt!280292 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!280299 (select (arr!17940 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!612265 (arrayContainsKey!0 lt!280299 (select (arr!17940 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!280288 () Unit!19660)

(assert (=> b!612265 (= lt!280288 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11978))))

(assert (=> b!612265 (arrayNoDuplicates!0 lt!280299 #b00000000000000000000000000000000 Nil!11978)))

(declare-fun lt!280302 () Unit!19660)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37388 (_ BitVec 32) (_ BitVec 32)) Unit!19660)

(assert (=> b!612265 (= lt!280302 (lemmaNoDuplicateFromThenFromBigger!0 lt!280299 #b00000000000000000000000000000000 j!136))))

(assert (=> b!612265 (arrayNoDuplicates!0 lt!280299 j!136 Nil!11978)))

(declare-fun lt!280294 () Unit!19660)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37388 (_ BitVec 64) (_ BitVec 32) List!11981) Unit!19660)

(assert (=> b!612265 (= lt!280294 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!280299 (select (arr!17940 a!2986) j!136) j!136 Nil!11978))))

(assert (=> b!612265 false))

(declare-fun b!612266 () Bool)

(assert (=> b!612266 (= e!350934 (arrayContainsKey!0 lt!280299 (select (arr!17940 a!2986) j!136) index!984))))

(declare-fun b!612267 () Bool)

(declare-fun res!393864 () Bool)

(assert (=> b!612267 (=> (not res!393864) (not e!350931))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37388 (_ BitVec 32)) Bool)

(assert (=> b!612267 (= res!393864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!612268 () Bool)

(declare-fun e!350922 () Bool)

(declare-fun e!350927 () Bool)

(assert (=> b!612268 (= e!350922 e!350927)))

(declare-fun res!393878 () Bool)

(assert (=> b!612268 (=> res!393878 e!350927)))

(declare-fun lt!280301 () (_ BitVec 64))

(declare-fun lt!280303 () (_ BitVec 64))

(assert (=> b!612268 (= res!393878 (or (not (= (select (arr!17940 a!2986) j!136) lt!280301)) (not (= (select (arr!17940 a!2986) j!136) lt!280303))))))

(declare-fun e!350923 () Bool)

(assert (=> b!612268 e!350923))

(declare-fun res!393876 () Bool)

(assert (=> b!612268 (=> (not res!393876) (not e!350923))))

(assert (=> b!612268 (= res!393876 (= lt!280303 (select (arr!17940 a!2986) j!136)))))

(assert (=> b!612268 (= lt!280303 (select (store (arr!17940 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!612269 () Bool)

(declare-fun Unit!19664 () Unit!19660)

(assert (=> b!612269 (= e!350932 Unit!19664)))

(declare-fun res!393867 () Bool)

(declare-fun e!350930 () Bool)

(assert (=> start!55918 (=> (not res!393867) (not e!350930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55918 (= res!393867 (validMask!0 mask!3053))))

(assert (=> start!55918 e!350930))

(assert (=> start!55918 true))

(declare-fun array_inv!13736 (array!37388) Bool)

(assert (=> start!55918 (array_inv!13736 a!2986)))

(declare-fun b!612270 () Bool)

(assert (=> b!612270 (= e!350930 e!350931)))

(declare-fun res!393877 () Bool)

(assert (=> b!612270 (=> (not res!393877) (not e!350931))))

(declare-datatypes ((SeekEntryResult!6380 0))(
  ( (MissingZero!6380 (index!27804 (_ BitVec 32))) (Found!6380 (index!27805 (_ BitVec 32))) (Intermediate!6380 (undefined!7192 Bool) (index!27806 (_ BitVec 32)) (x!56620 (_ BitVec 32))) (Undefined!6380) (MissingVacant!6380 (index!27807 (_ BitVec 32))) )
))
(declare-fun lt!280290 () SeekEntryResult!6380)

(assert (=> b!612270 (= res!393877 (or (= lt!280290 (MissingZero!6380 i!1108)) (= lt!280290 (MissingVacant!6380 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37388 (_ BitVec 32)) SeekEntryResult!6380)

(assert (=> b!612270 (= lt!280290 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!612271 () Bool)

(declare-fun e!350933 () Bool)

(declare-fun e!350926 () Bool)

(assert (=> b!612271 (= e!350933 e!350926)))

(declare-fun res!393862 () Bool)

(assert (=> b!612271 (=> (not res!393862) (not e!350926))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!280293 () SeekEntryResult!6380)

(assert (=> b!612271 (= res!393862 (and (= lt!280293 (Found!6380 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17940 a!2986) index!984) (select (arr!17940 a!2986) j!136))) (not (= (select (arr!17940 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37388 (_ BitVec 32)) SeekEntryResult!6380)

(assert (=> b!612271 (= lt!280293 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17940 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!612272 () Bool)

(declare-fun e!350925 () Bool)

(assert (=> b!612272 (= e!350923 e!350925)))

(declare-fun res!393863 () Bool)

(assert (=> b!612272 (=> res!393863 e!350925)))

(assert (=> b!612272 (= res!393863 (or (not (= (select (arr!17940 a!2986) j!136) lt!280301)) (not (= (select (arr!17940 a!2986) j!136) lt!280303)) (bvsge j!136 index!984)))))

(declare-fun b!612273 () Bool)

(declare-fun res!393861 () Bool)

(assert (=> b!612273 (=> (not res!393861) (not e!350930))))

(assert (=> b!612273 (= res!393861 (and (= (size!18304 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18304 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18304 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!612274 () Bool)

(declare-fun res!393875 () Bool)

(assert (=> b!612274 (=> (not res!393875) (not e!350931))))

(assert (=> b!612274 (= res!393875 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17940 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!612275 () Bool)

(assert (=> b!612275 (= e!350931 e!350933)))

(declare-fun res!393872 () Bool)

(assert (=> b!612275 (=> (not res!393872) (not e!350933))))

(assert (=> b!612275 (= res!393872 (= (select (store (arr!17940 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!612275 (= lt!280299 (array!37389 (store (arr!17940 a!2986) i!1108 k!1786) (size!18304 a!2986)))))

(declare-fun b!612276 () Bool)

(assert (=> b!612276 (= e!350927 e!350920)))

(declare-fun res!393870 () Bool)

(assert (=> b!612276 (=> res!393870 e!350920)))

(assert (=> b!612276 (= res!393870 (bvsge index!984 j!136))))

(declare-fun lt!280297 () Unit!19660)

(assert (=> b!612276 (= lt!280297 e!350932)))

(declare-fun c!69569 () Bool)

(assert (=> b!612276 (= c!69569 (bvslt j!136 index!984))))

(declare-fun b!612277 () Bool)

(declare-fun res!393868 () Bool)

(assert (=> b!612277 (=> (not res!393868) (not e!350930))))

(assert (=> b!612277 (= res!393868 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!612278 () Bool)

(declare-fun e!350921 () Bool)

(assert (=> b!612278 (= e!350925 e!350921)))

(declare-fun res!393874 () Bool)

(assert (=> b!612278 (=> (not res!393874) (not e!350921))))

(assert (=> b!612278 (= res!393874 (arrayContainsKey!0 lt!280299 (select (arr!17940 a!2986) j!136) j!136))))

(declare-fun b!612279 () Bool)

(assert (=> b!612279 (= e!350926 (not e!350922))))

(declare-fun res!393865 () Bool)

(assert (=> b!612279 (=> res!393865 e!350922)))

(declare-fun lt!280295 () SeekEntryResult!6380)

(assert (=> b!612279 (= res!393865 (not (= lt!280295 (Found!6380 index!984))))))

(declare-fun lt!280291 () Unit!19660)

(assert (=> b!612279 (= lt!280291 e!350924)))

(declare-fun c!69568 () Bool)

(assert (=> b!612279 (= c!69568 (= lt!280295 Undefined!6380))))

(assert (=> b!612279 (= lt!280295 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!280301 lt!280299 mask!3053))))

(declare-fun e!350928 () Bool)

(assert (=> b!612279 e!350928))

(declare-fun res!393869 () Bool)

(assert (=> b!612279 (=> (not res!393869) (not e!350928))))

(declare-fun lt!280298 () SeekEntryResult!6380)

(declare-fun lt!280287 () (_ BitVec 32))

(assert (=> b!612279 (= res!393869 (= lt!280298 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280287 vacantSpotIndex!68 lt!280301 lt!280299 mask!3053)))))

(assert (=> b!612279 (= lt!280298 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!280287 vacantSpotIndex!68 (select (arr!17940 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!612279 (= lt!280301 (select (store (arr!17940 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!280300 () Unit!19660)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37388 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19660)

(assert (=> b!612279 (= lt!280300 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!280287 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!612279 (= lt!280287 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!612280 () Bool)

(assert (=> b!612280 (= e!350928 (= lt!280293 lt!280298))))

(declare-fun b!612281 () Bool)

(assert (=> b!612281 (= e!350921 (arrayContainsKey!0 lt!280299 (select (arr!17940 a!2986) j!136) index!984))))

(declare-fun b!612282 () Bool)

(declare-fun res!393873 () Bool)

(assert (=> b!612282 (=> (not res!393873) (not e!350930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!612282 (= res!393873 (validKeyInArray!0 k!1786))))

(declare-fun b!612283 () Bool)

(declare-fun Unit!19665 () Unit!19660)

(assert (=> b!612283 (= e!350924 Unit!19665)))

(assert (=> b!612283 false))

(declare-fun b!612284 () Bool)

(declare-fun res!393866 () Bool)

(assert (=> b!612284 (=> (not res!393866) (not e!350930))))

(assert (=> b!612284 (= res!393866 (validKeyInArray!0 (select (arr!17940 a!2986) j!136)))))

(assert (= (and start!55918 res!393867) b!612273))

(assert (= (and b!612273 res!393861) b!612284))

(assert (= (and b!612284 res!393866) b!612282))

(assert (= (and b!612282 res!393873) b!612277))

(assert (= (and b!612277 res!393868) b!612270))

(assert (= (and b!612270 res!393877) b!612267))

(assert (= (and b!612267 res!393864) b!612262))

(assert (= (and b!612262 res!393860) b!612274))

(assert (= (and b!612274 res!393875) b!612275))

(assert (= (and b!612275 res!393872) b!612271))

(assert (= (and b!612271 res!393862) b!612279))

(assert (= (and b!612279 res!393869) b!612280))

(assert (= (and b!612279 c!69568) b!612283))

(assert (= (and b!612279 (not c!69568)) b!612263))

(assert (= (and b!612279 (not res!393865)) b!612268))

(assert (= (and b!612268 res!393876) b!612272))

(assert (= (and b!612272 (not res!393863)) b!612278))

(assert (= (and b!612278 res!393874) b!612281))

(assert (= (and b!612268 (not res!393878)) b!612276))

(assert (= (and b!612276 c!69569) b!612265))

(assert (= (and b!612276 (not c!69569)) b!612269))

(assert (= (and b!612276 (not res!393870)) b!612264))

(assert (= (and b!612264 res!393871) b!612266))

(declare-fun m!588623 () Bool)

(assert (=> b!612268 m!588623))

(declare-fun m!588625 () Bool)

(assert (=> b!612268 m!588625))

(declare-fun m!588627 () Bool)

(assert (=> b!612268 m!588627))

(declare-fun m!588629 () Bool)

(assert (=> b!612265 m!588629))

(assert (=> b!612265 m!588623))

(declare-fun m!588631 () Bool)

(assert (=> b!612265 m!588631))

(declare-fun m!588633 () Bool)

(assert (=> b!612265 m!588633))

(assert (=> b!612265 m!588623))

(assert (=> b!612265 m!588623))

(declare-fun m!588635 () Bool)

(assert (=> b!612265 m!588635))

(declare-fun m!588637 () Bool)

(assert (=> b!612265 m!588637))

(assert (=> b!612265 m!588623))

(declare-fun m!588639 () Bool)

(assert (=> b!612265 m!588639))

(declare-fun m!588641 () Bool)

(assert (=> b!612265 m!588641))

(declare-fun m!588643 () Bool)

(assert (=> b!612262 m!588643))

(declare-fun m!588645 () Bool)

(assert (=> b!612282 m!588645))

(declare-fun m!588647 () Bool)

(assert (=> b!612267 m!588647))

(assert (=> b!612278 m!588623))

(assert (=> b!612278 m!588623))

(declare-fun m!588649 () Bool)

(assert (=> b!612278 m!588649))

(declare-fun m!588651 () Bool)

(assert (=> b!612277 m!588651))

(assert (=> b!612281 m!588623))

(assert (=> b!612281 m!588623))

(declare-fun m!588653 () Bool)

(assert (=> b!612281 m!588653))

(assert (=> b!612266 m!588623))

(assert (=> b!612266 m!588623))

(assert (=> b!612266 m!588653))

(assert (=> b!612275 m!588625))

(declare-fun m!588655 () Bool)

(assert (=> b!612275 m!588655))

(declare-fun m!588657 () Bool)

(assert (=> b!612274 m!588657))

(declare-fun m!588659 () Bool)

(assert (=> start!55918 m!588659))

(declare-fun m!588661 () Bool)

(assert (=> start!55918 m!588661))

(assert (=> b!612272 m!588623))

(assert (=> b!612284 m!588623))

(assert (=> b!612284 m!588623))

(declare-fun m!588663 () Bool)

(assert (=> b!612284 m!588663))

(declare-fun m!588665 () Bool)

(assert (=> b!612270 m!588665))

(assert (=> b!612264 m!588623))

(assert (=> b!612264 m!588623))

(declare-fun m!588667 () Bool)

(assert (=> b!612264 m!588667))

(assert (=> b!612264 m!588623))

(assert (=> b!612264 m!588649))

(assert (=> b!612264 m!588633))

(assert (=> b!612264 m!588623))

(declare-fun m!588669 () Bool)

(assert (=> b!612264 m!588669))

(assert (=> b!612264 m!588641))

(declare-fun m!588671 () Bool)

(assert (=> b!612271 m!588671))

(assert (=> b!612271 m!588623))

(assert (=> b!612271 m!588623))

(declare-fun m!588673 () Bool)

(assert (=> b!612271 m!588673))

(declare-fun m!588675 () Bool)

(assert (=> b!612279 m!588675))

(declare-fun m!588677 () Bool)

(assert (=> b!612279 m!588677))

(declare-fun m!588679 () Bool)

(assert (=> b!612279 m!588679))

(assert (=> b!612279 m!588623))

(assert (=> b!612279 m!588625))

(assert (=> b!612279 m!588623))

(declare-fun m!588681 () Bool)

(assert (=> b!612279 m!588681))

(declare-fun m!588683 () Bool)

(assert (=> b!612279 m!588683))

(declare-fun m!588685 () Bool)

(assert (=> b!612279 m!588685))

(push 1)

