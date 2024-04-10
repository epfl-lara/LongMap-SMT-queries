; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55906 () Bool)

(assert start!55906)

(declare-fun b!611848 () Bool)

(declare-fun e!350650 () Bool)

(declare-fun e!350652 () Bool)

(assert (=> b!611848 (= e!350650 e!350652)))

(declare-fun res!393533 () Bool)

(assert (=> b!611848 (=> res!393533 e!350652)))

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37376 0))(
  ( (array!37377 (arr!17934 (Array (_ BitVec 32) (_ BitVec 64))) (size!18298 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37376)

(declare-fun lt!279992 () (_ BitVec 64))

(declare-fun lt!279993 () (_ BitVec 64))

(assert (=> b!611848 (= res!393533 (or (not (= (select (arr!17934 a!2986) j!136) lt!279992)) (not (= (select (arr!17934 a!2986) j!136) lt!279993))))))

(declare-fun e!350656 () Bool)

(assert (=> b!611848 e!350656))

(declare-fun res!393527 () Bool)

(assert (=> b!611848 (=> (not res!393527) (not e!350656))))

(assert (=> b!611848 (= res!393527 (= lt!279993 (select (arr!17934 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!611848 (= lt!279993 (select (store (arr!17934 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!611849 () Bool)

(declare-fun res!393526 () Bool)

(declare-fun e!350664 () Bool)

(assert (=> b!611849 (=> (not res!393526) (not e!350664))))

(declare-fun mask!3053 () (_ BitVec 32))

(assert (=> b!611849 (= res!393526 (and (= (size!18298 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18298 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18298 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!611850 () Bool)

(declare-fun res!393530 () Bool)

(declare-fun e!350658 () Bool)

(assert (=> b!611850 (=> (not res!393530) (not e!350658))))

(declare-datatypes ((List!11975 0))(
  ( (Nil!11972) (Cons!11971 (h!13016 (_ BitVec 64)) (t!18203 List!11975)) )
))
(declare-fun arrayNoDuplicates!0 (array!37376 (_ BitVec 32) List!11975) Bool)

(assert (=> b!611850 (= res!393530 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11972))))

(declare-fun lt!279995 () array!37376)

(declare-fun e!350651 () Bool)

(declare-fun b!611851 () Bool)

(declare-fun arrayContainsKey!0 (array!37376 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!611851 (= e!350651 (arrayContainsKey!0 lt!279995 (select (arr!17934 a!2986) j!136) index!984))))

(declare-fun b!611852 () Bool)

(declare-fun res!393519 () Bool)

(assert (=> b!611852 (=> (not res!393519) (not e!350664))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!611852 (= res!393519 (validKeyInArray!0 k!1786))))

(declare-fun b!611853 () Bool)

(declare-fun res!393536 () Bool)

(assert (=> b!611853 (=> (not res!393536) (not e!350658))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!611853 (= res!393536 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17934 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!611854 () Bool)

(declare-datatypes ((Unit!19624 0))(
  ( (Unit!19625) )
))
(declare-fun e!350661 () Unit!19624)

(declare-fun Unit!19626 () Unit!19624)

(assert (=> b!611854 (= e!350661 Unit!19626)))

(declare-fun b!611855 () Bool)

(declare-fun e!350653 () Bool)

(assert (=> b!611855 (= e!350656 e!350653)))

(declare-fun res!393521 () Bool)

(assert (=> b!611855 (=> res!393521 e!350653)))

(assert (=> b!611855 (= res!393521 (or (not (= (select (arr!17934 a!2986) j!136) lt!279992)) (not (= (select (arr!17934 a!2986) j!136) lt!279993)) (bvsge j!136 index!984)))))

(declare-fun b!611856 () Bool)

(declare-fun e!350663 () Bool)

(declare-datatypes ((SeekEntryResult!6374 0))(
  ( (MissingZero!6374 (index!27780 (_ BitVec 32))) (Found!6374 (index!27781 (_ BitVec 32))) (Intermediate!6374 (undefined!7186 Bool) (index!27782 (_ BitVec 32)) (x!56598 (_ BitVec 32))) (Undefined!6374) (MissingVacant!6374 (index!27783 (_ BitVec 32))) )
))
(declare-fun lt!279981 () SeekEntryResult!6374)

(declare-fun lt!279984 () SeekEntryResult!6374)

(assert (=> b!611856 (= e!350663 (= lt!279981 lt!279984))))

(declare-fun b!611857 () Bool)

(declare-fun Unit!19627 () Unit!19624)

(assert (=> b!611857 (= e!350661 Unit!19627)))

(declare-fun lt!279982 () Unit!19624)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37376 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19624)

(assert (=> b!611857 (= lt!279982 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279995 (select (arr!17934 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!611857 (arrayContainsKey!0 lt!279995 (select (arr!17934 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!279986 () Unit!19624)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37376 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11975) Unit!19624)

(assert (=> b!611857 (= lt!279986 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11972))))

(assert (=> b!611857 (arrayNoDuplicates!0 lt!279995 #b00000000000000000000000000000000 Nil!11972)))

(declare-fun lt!279989 () Unit!19624)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37376 (_ BitVec 32) (_ BitVec 32)) Unit!19624)

(assert (=> b!611857 (= lt!279989 (lemmaNoDuplicateFromThenFromBigger!0 lt!279995 #b00000000000000000000000000000000 j!136))))

(assert (=> b!611857 (arrayNoDuplicates!0 lt!279995 j!136 Nil!11972)))

(declare-fun lt!279988 () Unit!19624)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37376 (_ BitVec 64) (_ BitVec 32) List!11975) Unit!19624)

(assert (=> b!611857 (= lt!279988 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!279995 (select (arr!17934 a!2986) j!136) j!136 Nil!11972))))

(assert (=> b!611857 false))

(declare-fun b!611858 () Bool)

(declare-fun res!393532 () Bool)

(assert (=> b!611858 (=> (not res!393532) (not e!350658))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37376 (_ BitVec 32)) Bool)

(assert (=> b!611858 (= res!393532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!611859 () Bool)

(declare-fun res!393529 () Bool)

(assert (=> b!611859 (=> (not res!393529) (not e!350664))))

(assert (=> b!611859 (= res!393529 (validKeyInArray!0 (select (arr!17934 a!2986) j!136)))))

(declare-fun b!611860 () Bool)

(declare-fun e!350662 () Bool)

(assert (=> b!611860 (= e!350662 (arrayContainsKey!0 lt!279995 (select (arr!17934 a!2986) j!136) index!984))))

(declare-fun b!611861 () Bool)

(declare-fun e!350655 () Bool)

(assert (=> b!611861 (= e!350652 e!350655)))

(declare-fun res!393534 () Bool)

(assert (=> b!611861 (=> res!393534 e!350655)))

(assert (=> b!611861 (= res!393534 (bvsge index!984 j!136))))

(declare-fun lt!279985 () Unit!19624)

(assert (=> b!611861 (= lt!279985 e!350661)))

(declare-fun c!69532 () Bool)

(assert (=> b!611861 (= c!69532 (bvslt j!136 index!984))))

(declare-fun b!611862 () Bool)

(declare-fun e!350657 () Bool)

(assert (=> b!611862 (= e!350658 e!350657)))

(declare-fun res!393531 () Bool)

(assert (=> b!611862 (=> (not res!393531) (not e!350657))))

(assert (=> b!611862 (= res!393531 (= (select (store (arr!17934 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!611862 (= lt!279995 (array!37377 (store (arr!17934 a!2986) i!1108 k!1786) (size!18298 a!2986)))))

(declare-fun b!611863 () Bool)

(assert (=> b!611863 (= e!350655 true)))

(assert (=> b!611863 (arrayNoDuplicates!0 lt!279995 #b00000000000000000000000000000000 Nil!11972)))

(declare-fun lt!279991 () Unit!19624)

(assert (=> b!611863 (= lt!279991 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11972))))

(assert (=> b!611863 (arrayContainsKey!0 lt!279995 (select (arr!17934 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!279994 () Unit!19624)

(assert (=> b!611863 (= lt!279994 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!279995 (select (arr!17934 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!611863 e!350651))

(declare-fun res!393525 () Bool)

(assert (=> b!611863 (=> (not res!393525) (not e!350651))))

(assert (=> b!611863 (= res!393525 (arrayContainsKey!0 lt!279995 (select (arr!17934 a!2986) j!136) j!136))))

(declare-fun b!611864 () Bool)

(assert (=> b!611864 (= e!350664 e!350658)))

(declare-fun res!393535 () Bool)

(assert (=> b!611864 (=> (not res!393535) (not e!350658))))

(declare-fun lt!279997 () SeekEntryResult!6374)

(assert (=> b!611864 (= res!393535 (or (= lt!279997 (MissingZero!6374 i!1108)) (= lt!279997 (MissingVacant!6374 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37376 (_ BitVec 32)) SeekEntryResult!6374)

(assert (=> b!611864 (= lt!279997 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!611865 () Bool)

(declare-fun e!350659 () Unit!19624)

(declare-fun Unit!19628 () Unit!19624)

(assert (=> b!611865 (= e!350659 Unit!19628)))

(declare-fun b!611866 () Bool)

(declare-fun Unit!19629 () Unit!19624)

(assert (=> b!611866 (= e!350659 Unit!19629)))

(assert (=> b!611866 false))

(declare-fun b!611867 () Bool)

(declare-fun res!393528 () Bool)

(assert (=> b!611867 (=> (not res!393528) (not e!350664))))

(assert (=> b!611867 (= res!393528 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!393520 () Bool)

(assert (=> start!55906 (=> (not res!393520) (not e!350664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55906 (= res!393520 (validMask!0 mask!3053))))

(assert (=> start!55906 e!350664))

(assert (=> start!55906 true))

(declare-fun array_inv!13730 (array!37376) Bool)

(assert (=> start!55906 (array_inv!13730 a!2986)))

(declare-fun b!611868 () Bool)

(declare-fun e!350654 () Bool)

(assert (=> b!611868 (= e!350657 e!350654)))

(declare-fun res!393523 () Bool)

(assert (=> b!611868 (=> (not res!393523) (not e!350654))))

(assert (=> b!611868 (= res!393523 (and (= lt!279981 (Found!6374 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17934 a!2986) index!984) (select (arr!17934 a!2986) j!136))) (not (= (select (arr!17934 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37376 (_ BitVec 32)) SeekEntryResult!6374)

(assert (=> b!611868 (= lt!279981 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17934 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!611869 () Bool)

(assert (=> b!611869 (= e!350654 (not e!350650))))

(declare-fun res!393524 () Bool)

(assert (=> b!611869 (=> res!393524 e!350650)))

(declare-fun lt!279983 () SeekEntryResult!6374)

(assert (=> b!611869 (= res!393524 (not (= lt!279983 (Found!6374 index!984))))))

(declare-fun lt!279996 () Unit!19624)

(assert (=> b!611869 (= lt!279996 e!350659)))

(declare-fun c!69533 () Bool)

(assert (=> b!611869 (= c!69533 (= lt!279983 Undefined!6374))))

(assert (=> b!611869 (= lt!279983 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!279992 lt!279995 mask!3053))))

(assert (=> b!611869 e!350663))

(declare-fun res!393518 () Bool)

(assert (=> b!611869 (=> (not res!393518) (not e!350663))))

(declare-fun lt!279987 () (_ BitVec 32))

(assert (=> b!611869 (= res!393518 (= lt!279984 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279987 vacantSpotIndex!68 lt!279992 lt!279995 mask!3053)))))

(assert (=> b!611869 (= lt!279984 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!279987 vacantSpotIndex!68 (select (arr!17934 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!611869 (= lt!279992 (select (store (arr!17934 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!279990 () Unit!19624)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37376 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19624)

(assert (=> b!611869 (= lt!279990 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!279987 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!611869 (= lt!279987 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!611870 () Bool)

(assert (=> b!611870 (= e!350653 e!350662)))

(declare-fun res!393522 () Bool)

(assert (=> b!611870 (=> (not res!393522) (not e!350662))))

(assert (=> b!611870 (= res!393522 (arrayContainsKey!0 lt!279995 (select (arr!17934 a!2986) j!136) j!136))))

(assert (= (and start!55906 res!393520) b!611849))

(assert (= (and b!611849 res!393526) b!611859))

(assert (= (and b!611859 res!393529) b!611852))

(assert (= (and b!611852 res!393519) b!611867))

(assert (= (and b!611867 res!393528) b!611864))

(assert (= (and b!611864 res!393535) b!611858))

(assert (= (and b!611858 res!393532) b!611850))

(assert (= (and b!611850 res!393530) b!611853))

(assert (= (and b!611853 res!393536) b!611862))

(assert (= (and b!611862 res!393531) b!611868))

(assert (= (and b!611868 res!393523) b!611869))

(assert (= (and b!611869 res!393518) b!611856))

(assert (= (and b!611869 c!69533) b!611866))

(assert (= (and b!611869 (not c!69533)) b!611865))

(assert (= (and b!611869 (not res!393524)) b!611848))

(assert (= (and b!611848 res!393527) b!611855))

(assert (= (and b!611855 (not res!393521)) b!611870))

(assert (= (and b!611870 res!393522) b!611860))

(assert (= (and b!611848 (not res!393533)) b!611861))

(assert (= (and b!611861 c!69532) b!611857))

(assert (= (and b!611861 (not c!69532)) b!611854))

(assert (= (and b!611861 (not res!393534)) b!611863))

(assert (= (and b!611863 res!393525) b!611851))

(declare-fun m!588239 () Bool)

(assert (=> b!611864 m!588239))

(declare-fun m!588241 () Bool)

(assert (=> b!611848 m!588241))

(declare-fun m!588243 () Bool)

(assert (=> b!611848 m!588243))

(declare-fun m!588245 () Bool)

(assert (=> b!611848 m!588245))

(declare-fun m!588247 () Bool)

(assert (=> b!611869 m!588247))

(declare-fun m!588249 () Bool)

(assert (=> b!611869 m!588249))

(assert (=> b!611869 m!588241))

(declare-fun m!588251 () Bool)

(assert (=> b!611869 m!588251))

(assert (=> b!611869 m!588243))

(declare-fun m!588253 () Bool)

(assert (=> b!611869 m!588253))

(assert (=> b!611869 m!588241))

(declare-fun m!588255 () Bool)

(assert (=> b!611869 m!588255))

(declare-fun m!588257 () Bool)

(assert (=> b!611869 m!588257))

(declare-fun m!588259 () Bool)

(assert (=> b!611852 m!588259))

(assert (=> b!611857 m!588241))

(declare-fun m!588261 () Bool)

(assert (=> b!611857 m!588261))

(assert (=> b!611857 m!588241))

(assert (=> b!611857 m!588241))

(declare-fun m!588263 () Bool)

(assert (=> b!611857 m!588263))

(assert (=> b!611857 m!588241))

(declare-fun m!588265 () Bool)

(assert (=> b!611857 m!588265))

(declare-fun m!588267 () Bool)

(assert (=> b!611857 m!588267))

(declare-fun m!588269 () Bool)

(assert (=> b!611857 m!588269))

(declare-fun m!588271 () Bool)

(assert (=> b!611857 m!588271))

(declare-fun m!588273 () Bool)

(assert (=> b!611857 m!588273))

(assert (=> b!611859 m!588241))

(assert (=> b!611859 m!588241))

(declare-fun m!588275 () Bool)

(assert (=> b!611859 m!588275))

(declare-fun m!588277 () Bool)

(assert (=> b!611867 m!588277))

(assert (=> b!611863 m!588241))

(assert (=> b!611863 m!588267))

(assert (=> b!611863 m!588241))

(declare-fun m!588279 () Bool)

(assert (=> b!611863 m!588279))

(assert (=> b!611863 m!588273))

(assert (=> b!611863 m!588241))

(declare-fun m!588281 () Bool)

(assert (=> b!611863 m!588281))

(assert (=> b!611863 m!588241))

(declare-fun m!588283 () Bool)

(assert (=> b!611863 m!588283))

(assert (=> b!611870 m!588241))

(assert (=> b!611870 m!588241))

(assert (=> b!611870 m!588279))

(declare-fun m!588285 () Bool)

(assert (=> b!611868 m!588285))

(assert (=> b!611868 m!588241))

(assert (=> b!611868 m!588241))

(declare-fun m!588287 () Bool)

(assert (=> b!611868 m!588287))

(assert (=> b!611862 m!588243))

(declare-fun m!588289 () Bool)

(assert (=> b!611862 m!588289))

(assert (=> b!611860 m!588241))

(assert (=> b!611860 m!588241))

(declare-fun m!588291 () Bool)

(assert (=> b!611860 m!588291))

(assert (=> b!611855 m!588241))

(declare-fun m!588293 () Bool)

(assert (=> b!611850 m!588293))

(assert (=> b!611851 m!588241))

(assert (=> b!611851 m!588241))

(assert (=> b!611851 m!588291))

(declare-fun m!588295 () Bool)

(assert (=> start!55906 m!588295))

(declare-fun m!588297 () Bool)

(assert (=> start!55906 m!588297))

(declare-fun m!588299 () Bool)

(assert (=> b!611853 m!588299))

(declare-fun m!588301 () Bool)

(assert (=> b!611858 m!588301))

(push 1)

