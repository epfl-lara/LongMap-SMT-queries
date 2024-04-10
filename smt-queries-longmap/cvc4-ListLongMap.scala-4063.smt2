; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55610 () Bool)

(assert start!55610)

(declare-fun b!609857 () Bool)

(declare-fun e!349308 () Bool)

(declare-fun e!349306 () Bool)

(assert (=> b!609857 (= e!349308 e!349306)))

(declare-fun res!392313 () Bool)

(assert (=> b!609857 (=> res!392313 e!349306)))

(declare-fun index!984 () (_ BitVec 32))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!609857 (= res!392313 (bvsge index!984 j!136))))

(declare-datatypes ((Unit!19546 0))(
  ( (Unit!19547) )
))
(declare-fun lt!278880 () Unit!19546)

(declare-fun e!349294 () Unit!19546)

(assert (=> b!609857 (= lt!278880 e!349294)))

(declare-fun c!69139 () Bool)

(assert (=> b!609857 (= c!69139 (bvslt j!136 index!984))))

(declare-fun e!349300 () Bool)

(declare-fun b!609858 () Bool)

(declare-datatypes ((array!37341 0))(
  ( (array!37342 (arr!17921 (Array (_ BitVec 32) (_ BitVec 64))) (size!18285 (_ BitVec 32))) )
))
(declare-fun lt!278876 () array!37341)

(declare-fun a!2986 () array!37341)

(declare-fun arrayContainsKey!0 (array!37341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!609858 (= e!349300 (arrayContainsKey!0 lt!278876 (select (arr!17921 a!2986) j!136) index!984))))

(declare-fun b!609859 () Bool)

(declare-fun e!349299 () Bool)

(declare-fun e!349301 () Bool)

(assert (=> b!609859 (= e!349299 e!349301)))

(declare-fun res!392321 () Bool)

(assert (=> b!609859 (=> res!392321 e!349301)))

(declare-fun lt!278865 () (_ BitVec 64))

(declare-fun lt!278877 () (_ BitVec 64))

(assert (=> b!609859 (= res!392321 (or (not (= (select (arr!17921 a!2986) j!136) lt!278865)) (not (= (select (arr!17921 a!2986) j!136) lt!278877)) (bvsge j!136 index!984)))))

(declare-fun b!609860 () Bool)

(declare-fun res!392319 () Bool)

(declare-fun e!349295 () Bool)

(assert (=> b!609860 (=> (not res!392319) (not e!349295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!609860 (= res!392319 (validKeyInArray!0 (select (arr!17921 a!2986) j!136)))))

(declare-fun b!609861 () Bool)

(declare-fun e!349305 () Bool)

(assert (=> b!609861 (= e!349305 (arrayContainsKey!0 lt!278876 (select (arr!17921 a!2986) j!136) index!984))))

(declare-fun b!609862 () Bool)

(declare-fun res!392326 () Bool)

(declare-fun e!349297 () Bool)

(assert (=> b!609862 (=> (not res!392326) (not e!349297))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37341 (_ BitVec 32)) Bool)

(assert (=> b!609862 (= res!392326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!609863 () Bool)

(declare-fun e!349304 () Unit!19546)

(declare-fun Unit!19548 () Unit!19546)

(assert (=> b!609863 (= e!349304 Unit!19548)))

(assert (=> b!609863 false))

(declare-fun b!609864 () Bool)

(assert (=> b!609864 (= e!349306 (bvsle #b00000000000000000000000000000000 (size!18285 a!2986)))))

(declare-datatypes ((List!11962 0))(
  ( (Nil!11959) (Cons!11958 (h!13003 (_ BitVec 64)) (t!18190 List!11962)) )
))
(declare-fun arrayNoDuplicates!0 (array!37341 (_ BitVec 32) List!11962) Bool)

(assert (=> b!609864 (arrayNoDuplicates!0 lt!278876 #b00000000000000000000000000000000 Nil!11959)))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lt!278879 () Unit!19546)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37341 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11962) Unit!19546)

(assert (=> b!609864 (= lt!278879 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11959))))

(assert (=> b!609864 (arrayContainsKey!0 lt!278876 (select (arr!17921 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!278872 () Unit!19546)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37341 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!19546)

(assert (=> b!609864 (= lt!278872 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278876 (select (arr!17921 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!609864 e!349300))

(declare-fun res!392315 () Bool)

(assert (=> b!609864 (=> (not res!392315) (not e!349300))))

(assert (=> b!609864 (= res!392315 (arrayContainsKey!0 lt!278876 (select (arr!17921 a!2986) j!136) j!136))))

(declare-fun b!609865 () Bool)

(assert (=> b!609865 (= e!349301 e!349305)))

(declare-fun res!392329 () Bool)

(assert (=> b!609865 (=> (not res!392329) (not e!349305))))

(assert (=> b!609865 (= res!392329 (arrayContainsKey!0 lt!278876 (select (arr!17921 a!2986) j!136) j!136))))

(declare-fun b!609866 () Bool)

(assert (=> b!609866 (= e!349295 e!349297)))

(declare-fun res!392320 () Bool)

(assert (=> b!609866 (=> (not res!392320) (not e!349297))))

(declare-datatypes ((SeekEntryResult!6361 0))(
  ( (MissingZero!6361 (index!27719 (_ BitVec 32))) (Found!6361 (index!27720 (_ BitVec 32))) (Intermediate!6361 (undefined!7173 Bool) (index!27721 (_ BitVec 32)) (x!56518 (_ BitVec 32))) (Undefined!6361) (MissingVacant!6361 (index!27722 (_ BitVec 32))) )
))
(declare-fun lt!278866 () SeekEntryResult!6361)

(assert (=> b!609866 (= res!392320 (or (= lt!278866 (MissingZero!6361 i!1108)) (= lt!278866 (MissingVacant!6361 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37341 (_ BitVec 32)) SeekEntryResult!6361)

(assert (=> b!609866 (= lt!278866 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!609867 () Bool)

(declare-fun e!349307 () Bool)

(declare-fun e!349296 () Bool)

(assert (=> b!609867 (= e!349307 e!349296)))

(declare-fun res!392322 () Bool)

(assert (=> b!609867 (=> (not res!392322) (not e!349296))))

(declare-fun lt!278869 () SeekEntryResult!6361)

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!609867 (= res!392322 (and (= lt!278869 (Found!6361 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17921 a!2986) index!984) (select (arr!17921 a!2986) j!136))) (not (= (select (arr!17921 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37341 (_ BitVec 32)) SeekEntryResult!6361)

(assert (=> b!609867 (= lt!278869 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17921 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!392318 () Bool)

(assert (=> start!55610 (=> (not res!392318) (not e!349295))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!55610 (= res!392318 (validMask!0 mask!3053))))

(assert (=> start!55610 e!349295))

(assert (=> start!55610 true))

(declare-fun array_inv!13717 (array!37341) Bool)

(assert (=> start!55610 (array_inv!13717 a!2986)))

(declare-fun b!609856 () Bool)

(declare-fun e!349298 () Bool)

(assert (=> b!609856 (= e!349296 (not e!349298))))

(declare-fun res!392323 () Bool)

(assert (=> b!609856 (=> res!392323 e!349298)))

(declare-fun lt!278868 () SeekEntryResult!6361)

(assert (=> b!609856 (= res!392323 (not (= lt!278868 (Found!6361 index!984))))))

(declare-fun lt!278881 () Unit!19546)

(assert (=> b!609856 (= lt!278881 e!349304)))

(declare-fun c!69140 () Bool)

(assert (=> b!609856 (= c!69140 (= lt!278868 Undefined!6361))))

(assert (=> b!609856 (= lt!278868 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!278865 lt!278876 mask!3053))))

(declare-fun e!349303 () Bool)

(assert (=> b!609856 e!349303))

(declare-fun res!392312 () Bool)

(assert (=> b!609856 (=> (not res!392312) (not e!349303))))

(declare-fun lt!278871 () (_ BitVec 32))

(declare-fun lt!278867 () SeekEntryResult!6361)

(assert (=> b!609856 (= res!392312 (= lt!278867 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278871 vacantSpotIndex!68 lt!278865 lt!278876 mask!3053)))))

(assert (=> b!609856 (= lt!278867 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!278871 vacantSpotIndex!68 (select (arr!17921 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!609856 (= lt!278865 (select (store (arr!17921 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!278875 () Unit!19546)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37341 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19546)

(assert (=> b!609856 (= lt!278875 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!278871 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!609856 (= lt!278871 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!609868 () Bool)

(assert (=> b!609868 (= e!349298 e!349308)))

(declare-fun res!392314 () Bool)

(assert (=> b!609868 (=> res!392314 e!349308)))

(assert (=> b!609868 (= res!392314 (or (not (= (select (arr!17921 a!2986) j!136) lt!278865)) (not (= (select (arr!17921 a!2986) j!136) lt!278877))))))

(assert (=> b!609868 e!349299))

(declare-fun res!392324 () Bool)

(assert (=> b!609868 (=> (not res!392324) (not e!349299))))

(assert (=> b!609868 (= res!392324 (= lt!278877 (select (arr!17921 a!2986) j!136)))))

(assert (=> b!609868 (= lt!278877 (select (store (arr!17921 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!609869 () Bool)

(assert (=> b!609869 (= e!349297 e!349307)))

(declare-fun res!392316 () Bool)

(assert (=> b!609869 (=> (not res!392316) (not e!349307))))

(assert (=> b!609869 (= res!392316 (= (select (store (arr!17921 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!609869 (= lt!278876 (array!37342 (store (arr!17921 a!2986) i!1108 k!1786) (size!18285 a!2986)))))

(declare-fun b!609870 () Bool)

(declare-fun Unit!19549 () Unit!19546)

(assert (=> b!609870 (= e!349294 Unit!19549)))

(declare-fun b!609871 () Bool)

(declare-fun Unit!19550 () Unit!19546)

(assert (=> b!609871 (= e!349294 Unit!19550)))

(declare-fun lt!278870 () Unit!19546)

(assert (=> b!609871 (= lt!278870 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!278876 (select (arr!17921 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!609871 (arrayContainsKey!0 lt!278876 (select (arr!17921 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!278874 () Unit!19546)

(assert (=> b!609871 (= lt!278874 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11959))))

(assert (=> b!609871 (arrayNoDuplicates!0 lt!278876 #b00000000000000000000000000000000 Nil!11959)))

(declare-fun lt!278873 () Unit!19546)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37341 (_ BitVec 32) (_ BitVec 32)) Unit!19546)

(assert (=> b!609871 (= lt!278873 (lemmaNoDuplicateFromThenFromBigger!0 lt!278876 #b00000000000000000000000000000000 j!136))))

(assert (=> b!609871 (arrayNoDuplicates!0 lt!278876 j!136 Nil!11959)))

(declare-fun lt!278878 () Unit!19546)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37341 (_ BitVec 64) (_ BitVec 32) List!11962) Unit!19546)

(assert (=> b!609871 (= lt!278878 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!278876 (select (arr!17921 a!2986) j!136) j!136 Nil!11959))))

(assert (=> b!609871 false))

(declare-fun b!609872 () Bool)

(declare-fun res!392328 () Bool)

(assert (=> b!609872 (=> (not res!392328) (not e!349297))))

(assert (=> b!609872 (= res!392328 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11959))))

(declare-fun b!609873 () Bool)

(declare-fun Unit!19551 () Unit!19546)

(assert (=> b!609873 (= e!349304 Unit!19551)))

(declare-fun b!609874 () Bool)

(declare-fun res!392330 () Bool)

(assert (=> b!609874 (=> (not res!392330) (not e!349297))))

(assert (=> b!609874 (= res!392330 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!17921 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!609875 () Bool)

(declare-fun res!392325 () Bool)

(assert (=> b!609875 (=> (not res!392325) (not e!349295))))

(assert (=> b!609875 (= res!392325 (validKeyInArray!0 k!1786))))

(declare-fun b!609876 () Bool)

(assert (=> b!609876 (= e!349303 (= lt!278869 lt!278867))))

(declare-fun b!609877 () Bool)

(declare-fun res!392327 () Bool)

(assert (=> b!609877 (=> (not res!392327) (not e!349295))))

(assert (=> b!609877 (= res!392327 (and (= (size!18285 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18285 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18285 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!609878 () Bool)

(declare-fun res!392317 () Bool)

(assert (=> b!609878 (=> (not res!392317) (not e!349295))))

(assert (=> b!609878 (= res!392317 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(assert (= (and start!55610 res!392318) b!609877))

(assert (= (and b!609877 res!392327) b!609860))

(assert (= (and b!609860 res!392319) b!609875))

(assert (= (and b!609875 res!392325) b!609878))

(assert (= (and b!609878 res!392317) b!609866))

(assert (= (and b!609866 res!392320) b!609862))

(assert (= (and b!609862 res!392326) b!609872))

(assert (= (and b!609872 res!392328) b!609874))

(assert (= (and b!609874 res!392330) b!609869))

(assert (= (and b!609869 res!392316) b!609867))

(assert (= (and b!609867 res!392322) b!609856))

(assert (= (and b!609856 res!392312) b!609876))

(assert (= (and b!609856 c!69140) b!609863))

(assert (= (and b!609856 (not c!69140)) b!609873))

(assert (= (and b!609856 (not res!392323)) b!609868))

(assert (= (and b!609868 res!392324) b!609859))

(assert (= (and b!609859 (not res!392321)) b!609865))

(assert (= (and b!609865 res!392329) b!609861))

(assert (= (and b!609868 (not res!392314)) b!609857))

(assert (= (and b!609857 c!69139) b!609871))

(assert (= (and b!609857 (not c!69139)) b!609870))

(assert (= (and b!609857 (not res!392313)) b!609864))

(assert (= (and b!609864 res!392315) b!609858))

(declare-fun m!586339 () Bool)

(assert (=> b!609874 m!586339))

(declare-fun m!586341 () Bool)

(assert (=> b!609859 m!586341))

(declare-fun m!586343 () Bool)

(assert (=> b!609867 m!586343))

(assert (=> b!609867 m!586341))

(assert (=> b!609867 m!586341))

(declare-fun m!586345 () Bool)

(assert (=> b!609867 m!586345))

(declare-fun m!586347 () Bool)

(assert (=> b!609872 m!586347))

(declare-fun m!586349 () Bool)

(assert (=> start!55610 m!586349))

(declare-fun m!586351 () Bool)

(assert (=> start!55610 m!586351))

(assert (=> b!609861 m!586341))

(assert (=> b!609861 m!586341))

(declare-fun m!586353 () Bool)

(assert (=> b!609861 m!586353))

(declare-fun m!586355 () Bool)

(assert (=> b!609862 m!586355))

(declare-fun m!586357 () Bool)

(assert (=> b!609856 m!586357))

(declare-fun m!586359 () Bool)

(assert (=> b!609856 m!586359))

(declare-fun m!586361 () Bool)

(assert (=> b!609856 m!586361))

(assert (=> b!609856 m!586341))

(declare-fun m!586363 () Bool)

(assert (=> b!609856 m!586363))

(declare-fun m!586365 () Bool)

(assert (=> b!609856 m!586365))

(assert (=> b!609856 m!586341))

(declare-fun m!586367 () Bool)

(assert (=> b!609856 m!586367))

(declare-fun m!586369 () Bool)

(assert (=> b!609856 m!586369))

(declare-fun m!586371 () Bool)

(assert (=> b!609875 m!586371))

(assert (=> b!609865 m!586341))

(assert (=> b!609865 m!586341))

(declare-fun m!586373 () Bool)

(assert (=> b!609865 m!586373))

(assert (=> b!609860 m!586341))

(assert (=> b!609860 m!586341))

(declare-fun m!586375 () Bool)

(assert (=> b!609860 m!586375))

(declare-fun m!586377 () Bool)

(assert (=> b!609878 m!586377))

(assert (=> b!609869 m!586363))

(declare-fun m!586379 () Bool)

(assert (=> b!609869 m!586379))

(assert (=> b!609864 m!586341))

(assert (=> b!609864 m!586373))

(assert (=> b!609864 m!586341))

(declare-fun m!586381 () Bool)

(assert (=> b!609864 m!586381))

(assert (=> b!609864 m!586341))

(declare-fun m!586383 () Bool)

(assert (=> b!609864 m!586383))

(assert (=> b!609864 m!586341))

(declare-fun m!586385 () Bool)

(assert (=> b!609864 m!586385))

(declare-fun m!586387 () Bool)

(assert (=> b!609864 m!586387))

(declare-fun m!586389 () Bool)

(assert (=> b!609866 m!586389))

(assert (=> b!609868 m!586341))

(assert (=> b!609868 m!586363))

(declare-fun m!586391 () Bool)

(assert (=> b!609868 m!586391))

(assert (=> b!609871 m!586341))

(declare-fun m!586393 () Bool)

(assert (=> b!609871 m!586393))

(assert (=> b!609871 m!586341))

(declare-fun m!586395 () Bool)

(assert (=> b!609871 m!586395))

(assert (=> b!609871 m!586341))

(assert (=> b!609871 m!586383))

(assert (=> b!609871 m!586341))

(declare-fun m!586397 () Bool)

(assert (=> b!609871 m!586397))

(declare-fun m!586399 () Bool)

(assert (=> b!609871 m!586399))

(declare-fun m!586401 () Bool)

(assert (=> b!609871 m!586401))

(assert (=> b!609871 m!586387))

(assert (=> b!609858 m!586341))

(assert (=> b!609858 m!586341))

(assert (=> b!609858 m!586353))

(push 1)

