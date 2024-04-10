; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54904 () Bool)

(assert start!54904)

(declare-fun b!601107 () Bool)

(declare-fun res!385938 () Bool)

(declare-fun e!343696 () Bool)

(assert (=> b!601107 (=> (not res!385938) (not e!343696))))

(declare-datatypes ((array!37139 0))(
  ( (array!37140 (arr!17829 (Array (_ BitVec 32) (_ BitVec 64))) (size!18193 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37139)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37139 (_ BitVec 32)) Bool)

(assert (=> b!601107 (= res!385938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!601108 () Bool)

(declare-fun e!343691 () Bool)

(declare-fun e!343700 () Bool)

(assert (=> b!601108 (= e!343691 e!343700)))

(declare-fun res!385936 () Bool)

(assert (=> b!601108 (=> res!385936 e!343700)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!273562 () (_ BitVec 64))

(declare-fun lt!273569 () (_ BitVec 64))

(assert (=> b!601108 (= res!385936 (or (not (= (select (arr!17829 a!2986) j!136) lt!273562)) (not (= (select (arr!17829 a!2986) j!136) lt!273569))))))

(declare-fun e!343692 () Bool)

(assert (=> b!601108 e!343692))

(declare-fun res!385934 () Bool)

(assert (=> b!601108 (=> (not res!385934) (not e!343692))))

(assert (=> b!601108 (= res!385934 (= lt!273569 (select (arr!17829 a!2986) j!136)))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!601108 (= lt!273569 (select (store (arr!17829 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!601109 () Bool)

(declare-fun res!385939 () Bool)

(declare-fun e!343690 () Bool)

(assert (=> b!601109 (=> (not res!385939) (not e!343690))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!601109 (= res!385939 (validKeyInArray!0 (select (arr!17829 a!2986) j!136)))))

(declare-fun b!601111 () Bool)

(declare-fun e!343697 () Bool)

(assert (=> b!601111 (= e!343696 e!343697)))

(declare-fun res!385932 () Bool)

(assert (=> b!601111 (=> (not res!385932) (not e!343697))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!601111 (= res!385932 (= (select (store (arr!17829 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!273573 () array!37139)

(assert (=> b!601111 (= lt!273573 (array!37140 (store (arr!17829 a!2986) i!1108 k!1786) (size!18193 a!2986)))))

(declare-fun b!601112 () Bool)

(declare-fun e!343701 () Bool)

(assert (=> b!601112 (= e!343701 (not e!343691))))

(declare-fun res!385941 () Bool)

(assert (=> b!601112 (=> res!385941 e!343691)))

(declare-datatypes ((SeekEntryResult!6269 0))(
  ( (MissingZero!6269 (index!27333 (_ BitVec 32))) (Found!6269 (index!27334 (_ BitVec 32))) (Intermediate!6269 (undefined!7081 Bool) (index!27335 (_ BitVec 32)) (x!56132 (_ BitVec 32))) (Undefined!6269) (MissingVacant!6269 (index!27336 (_ BitVec 32))) )
))
(declare-fun lt!273574 () SeekEntryResult!6269)

(assert (=> b!601112 (= res!385941 (not (= lt!273574 (Found!6269 index!984))))))

(declare-datatypes ((Unit!18994 0))(
  ( (Unit!18995) )
))
(declare-fun lt!273560 () Unit!18994)

(declare-fun e!343689 () Unit!18994)

(assert (=> b!601112 (= lt!273560 e!343689)))

(declare-fun c!67957 () Bool)

(assert (=> b!601112 (= c!67957 (= lt!273574 Undefined!6269))))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37139 (_ BitVec 32)) SeekEntryResult!6269)

(assert (=> b!601112 (= lt!273574 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273562 lt!273573 mask!3053))))

(declare-fun e!343693 () Bool)

(assert (=> b!601112 e!343693))

(declare-fun res!385940 () Bool)

(assert (=> b!601112 (=> (not res!385940) (not e!343693))))

(declare-fun lt!273568 () (_ BitVec 32))

(declare-fun lt!273571 () SeekEntryResult!6269)

(assert (=> b!601112 (= res!385940 (= lt!273571 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273568 vacantSpotIndex!68 lt!273562 lt!273573 mask!3053)))))

(assert (=> b!601112 (= lt!273571 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273568 vacantSpotIndex!68 (select (arr!17829 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!601112 (= lt!273562 (select (store (arr!17829 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!273561 () Unit!18994)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37139 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18994)

(assert (=> b!601112 (= lt!273561 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273568 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!601112 (= lt!273568 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!601113 () Bool)

(declare-fun e!343699 () Unit!18994)

(declare-fun Unit!18996 () Unit!18994)

(assert (=> b!601113 (= e!343699 Unit!18996)))

(declare-fun b!601114 () Bool)

(declare-fun res!385928 () Bool)

(assert (=> b!601114 (=> (not res!385928) (not e!343696))))

(assert (=> b!601114 (= res!385928 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17829 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!601115 () Bool)

(assert (=> b!601115 (= e!343700 true)))

(declare-fun lt!273563 () Unit!18994)

(assert (=> b!601115 (= lt!273563 e!343699)))

(declare-fun c!67958 () Bool)

(assert (=> b!601115 (= c!67958 (bvslt j!136 index!984))))

(declare-fun b!601116 () Bool)

(declare-fun Unit!18997 () Unit!18994)

(assert (=> b!601116 (= e!343689 Unit!18997)))

(assert (=> b!601116 false))

(declare-fun b!601117 () Bool)

(declare-fun Unit!18998 () Unit!18994)

(assert (=> b!601117 (= e!343689 Unit!18998)))

(declare-fun res!385933 () Bool)

(assert (=> start!54904 (=> (not res!385933) (not e!343690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54904 (= res!385933 (validMask!0 mask!3053))))

(assert (=> start!54904 e!343690))

(assert (=> start!54904 true))

(declare-fun array_inv!13625 (array!37139) Bool)

(assert (=> start!54904 (array_inv!13625 a!2986)))

(declare-fun b!601110 () Bool)

(declare-fun res!385943 () Bool)

(assert (=> b!601110 (=> (not res!385943) (not e!343690))))

(assert (=> b!601110 (= res!385943 (and (= (size!18193 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18193 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18193 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!601118 () Bool)

(declare-fun e!343694 () Bool)

(declare-fun arrayContainsKey!0 (array!37139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!601118 (= e!343694 (arrayContainsKey!0 lt!273573 (select (arr!17829 a!2986) j!136) index!984))))

(declare-fun b!601119 () Bool)

(declare-fun res!385942 () Bool)

(assert (=> b!601119 (=> (not res!385942) (not e!343696))))

(declare-datatypes ((List!11870 0))(
  ( (Nil!11867) (Cons!11866 (h!12911 (_ BitVec 64)) (t!18098 List!11870)) )
))
(declare-fun arrayNoDuplicates!0 (array!37139 (_ BitVec 32) List!11870) Bool)

(assert (=> b!601119 (= res!385942 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11867))))

(declare-fun b!601120 () Bool)

(declare-fun Unit!18999 () Unit!18994)

(assert (=> b!601120 (= e!343699 Unit!18999)))

(declare-fun lt!273570 () Unit!18994)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37139 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18994)

(assert (=> b!601120 (= lt!273570 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273573 (select (arr!17829 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!601120 (arrayContainsKey!0 lt!273573 (select (arr!17829 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273567 () Unit!18994)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37139 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11870) Unit!18994)

(assert (=> b!601120 (= lt!273567 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11867))))

(assert (=> b!601120 (arrayNoDuplicates!0 lt!273573 #b00000000000000000000000000000000 Nil!11867)))

(declare-fun lt!273572 () Unit!18994)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37139 (_ BitVec 32) (_ BitVec 32)) Unit!18994)

(assert (=> b!601120 (= lt!273572 (lemmaNoDuplicateFromThenFromBigger!0 lt!273573 #b00000000000000000000000000000000 j!136))))

(assert (=> b!601120 (arrayNoDuplicates!0 lt!273573 j!136 Nil!11867)))

(declare-fun lt!273565 () Unit!18994)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37139 (_ BitVec 64) (_ BitVec 32) List!11870) Unit!18994)

(assert (=> b!601120 (= lt!273565 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!273573 (select (arr!17829 a!2986) j!136) j!136 Nil!11867))))

(assert (=> b!601120 false))

(declare-fun b!601121 () Bool)

(assert (=> b!601121 (= e!343690 e!343696)))

(declare-fun res!385927 () Bool)

(assert (=> b!601121 (=> (not res!385927) (not e!343696))))

(declare-fun lt!273564 () SeekEntryResult!6269)

(assert (=> b!601121 (= res!385927 (or (= lt!273564 (MissingZero!6269 i!1108)) (= lt!273564 (MissingVacant!6269 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37139 (_ BitVec 32)) SeekEntryResult!6269)

(assert (=> b!601121 (= lt!273564 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!601122 () Bool)

(declare-fun e!343698 () Bool)

(assert (=> b!601122 (= e!343698 e!343694)))

(declare-fun res!385937 () Bool)

(assert (=> b!601122 (=> (not res!385937) (not e!343694))))

(assert (=> b!601122 (= res!385937 (arrayContainsKey!0 lt!273573 (select (arr!17829 a!2986) j!136) j!136))))

(declare-fun b!601123 () Bool)

(assert (=> b!601123 (= e!343697 e!343701)))

(declare-fun res!385935 () Bool)

(assert (=> b!601123 (=> (not res!385935) (not e!343701))))

(declare-fun lt!273566 () SeekEntryResult!6269)

(assert (=> b!601123 (= res!385935 (and (= lt!273566 (Found!6269 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17829 a!2986) index!984) (select (arr!17829 a!2986) j!136))) (not (= (select (arr!17829 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!601123 (= lt!273566 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17829 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!601124 () Bool)

(declare-fun res!385931 () Bool)

(assert (=> b!601124 (=> (not res!385931) (not e!343690))))

(assert (=> b!601124 (= res!385931 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!601125 () Bool)

(assert (=> b!601125 (= e!343693 (= lt!273566 lt!273571))))

(declare-fun b!601126 () Bool)

(declare-fun res!385930 () Bool)

(assert (=> b!601126 (=> (not res!385930) (not e!343690))))

(assert (=> b!601126 (= res!385930 (validKeyInArray!0 k!1786))))

(declare-fun b!601127 () Bool)

(assert (=> b!601127 (= e!343692 e!343698)))

(declare-fun res!385929 () Bool)

(assert (=> b!601127 (=> res!385929 e!343698)))

(assert (=> b!601127 (= res!385929 (or (not (= (select (arr!17829 a!2986) j!136) lt!273562)) (not (= (select (arr!17829 a!2986) j!136) lt!273569)) (bvsge j!136 index!984)))))

(assert (= (and start!54904 res!385933) b!601110))

(assert (= (and b!601110 res!385943) b!601109))

(assert (= (and b!601109 res!385939) b!601126))

(assert (= (and b!601126 res!385930) b!601124))

(assert (= (and b!601124 res!385931) b!601121))

(assert (= (and b!601121 res!385927) b!601107))

(assert (= (and b!601107 res!385938) b!601119))

(assert (= (and b!601119 res!385942) b!601114))

(assert (= (and b!601114 res!385928) b!601111))

(assert (= (and b!601111 res!385932) b!601123))

(assert (= (and b!601123 res!385935) b!601112))

(assert (= (and b!601112 res!385940) b!601125))

(assert (= (and b!601112 c!67957) b!601116))

(assert (= (and b!601112 (not c!67957)) b!601117))

(assert (= (and b!601112 (not res!385941)) b!601108))

(assert (= (and b!601108 res!385934) b!601127))

(assert (= (and b!601127 (not res!385929)) b!601122))

(assert (= (and b!601122 res!385937) b!601118))

(assert (= (and b!601108 (not res!385936)) b!601115))

(assert (= (and b!601115 c!67958) b!601120))

(assert (= (and b!601115 (not c!67958)) b!601113))

(declare-fun m!578309 () Bool)

(assert (=> start!54904 m!578309))

(declare-fun m!578311 () Bool)

(assert (=> start!54904 m!578311))

(declare-fun m!578313 () Bool)

(assert (=> b!601123 m!578313))

(declare-fun m!578315 () Bool)

(assert (=> b!601123 m!578315))

(assert (=> b!601123 m!578315))

(declare-fun m!578317 () Bool)

(assert (=> b!601123 m!578317))

(declare-fun m!578319 () Bool)

(assert (=> b!601112 m!578319))

(declare-fun m!578321 () Bool)

(assert (=> b!601112 m!578321))

(declare-fun m!578323 () Bool)

(assert (=> b!601112 m!578323))

(assert (=> b!601112 m!578315))

(assert (=> b!601112 m!578315))

(declare-fun m!578325 () Bool)

(assert (=> b!601112 m!578325))

(declare-fun m!578327 () Bool)

(assert (=> b!601112 m!578327))

(declare-fun m!578329 () Bool)

(assert (=> b!601112 m!578329))

(declare-fun m!578331 () Bool)

(assert (=> b!601112 m!578331))

(declare-fun m!578333 () Bool)

(assert (=> b!601124 m!578333))

(declare-fun m!578335 () Bool)

(assert (=> b!601107 m!578335))

(declare-fun m!578337 () Bool)

(assert (=> b!601126 m!578337))

(declare-fun m!578339 () Bool)

(assert (=> b!601114 m!578339))

(assert (=> b!601109 m!578315))

(assert (=> b!601109 m!578315))

(declare-fun m!578341 () Bool)

(assert (=> b!601109 m!578341))

(assert (=> b!601127 m!578315))

(declare-fun m!578343 () Bool)

(assert (=> b!601120 m!578343))

(declare-fun m!578345 () Bool)

(assert (=> b!601120 m!578345))

(declare-fun m!578347 () Bool)

(assert (=> b!601120 m!578347))

(declare-fun m!578349 () Bool)

(assert (=> b!601120 m!578349))

(assert (=> b!601120 m!578315))

(assert (=> b!601120 m!578315))

(declare-fun m!578351 () Bool)

(assert (=> b!601120 m!578351))

(assert (=> b!601120 m!578315))

(declare-fun m!578353 () Bool)

(assert (=> b!601120 m!578353))

(assert (=> b!601120 m!578315))

(declare-fun m!578355 () Bool)

(assert (=> b!601120 m!578355))

(declare-fun m!578357 () Bool)

(assert (=> b!601121 m!578357))

(declare-fun m!578359 () Bool)

(assert (=> b!601119 m!578359))

(assert (=> b!601108 m!578315))

(assert (=> b!601108 m!578327))

(declare-fun m!578361 () Bool)

(assert (=> b!601108 m!578361))

(assert (=> b!601111 m!578327))

(declare-fun m!578363 () Bool)

(assert (=> b!601111 m!578363))

(assert (=> b!601118 m!578315))

(assert (=> b!601118 m!578315))

(declare-fun m!578365 () Bool)

(assert (=> b!601118 m!578365))

(assert (=> b!601122 m!578315))

(assert (=> b!601122 m!578315))

(declare-fun m!578367 () Bool)

(assert (=> b!601122 m!578367))

(push 1)

