; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54886 () Bool)

(assert start!54886)

(declare-fun b!600515 () Bool)

(declare-fun e!343343 () Bool)

(declare-fun e!343349 () Bool)

(assert (=> b!600515 (= e!343343 e!343349)))

(declare-fun res!385400 () Bool)

(assert (=> b!600515 (=> (not res!385400) (not e!343349))))

(declare-datatypes ((SeekEntryResult!6260 0))(
  ( (MissingZero!6260 (index!27297 (_ BitVec 32))) (Found!6260 (index!27298 (_ BitVec 32))) (Intermediate!6260 (undefined!7072 Bool) (index!27299 (_ BitVec 32)) (x!56099 (_ BitVec 32))) (Undefined!6260) (MissingVacant!6260 (index!27300 (_ BitVec 32))) )
))
(declare-fun lt!273193 () SeekEntryResult!6260)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!600515 (= res!385400 (or (= lt!273193 (MissingZero!6260 i!1108)) (= lt!273193 (MissingVacant!6260 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-datatypes ((array!37121 0))(
  ( (array!37122 (arr!17820 (Array (_ BitVec 32) (_ BitVec 64))) (size!18184 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!37121)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37121 (_ BitVec 32)) SeekEntryResult!6260)

(assert (=> b!600515 (= lt!273193 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!273191 () array!37121)

(declare-fun e!343340 () Bool)

(declare-fun b!600516 () Bool)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!37121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!600516 (= e!343340 (arrayContainsKey!0 lt!273191 (select (arr!17820 a!2986) j!136) index!984))))

(declare-fun b!600517 () Bool)

(declare-datatypes ((Unit!18958 0))(
  ( (Unit!18959) )
))
(declare-fun e!343345 () Unit!18958)

(declare-fun Unit!18960 () Unit!18958)

(assert (=> b!600517 (= e!343345 Unit!18960)))

(assert (=> b!600517 false))

(declare-fun b!600518 () Bool)

(declare-fun res!385393 () Bool)

(assert (=> b!600518 (=> (not res!385393) (not e!343343))))

(assert (=> b!600518 (= res!385393 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!600519 () Bool)

(declare-fun res!385394 () Bool)

(declare-fun e!343346 () Bool)

(assert (=> b!600519 (=> res!385394 e!343346)))

(declare-datatypes ((List!11861 0))(
  ( (Nil!11858) (Cons!11857 (h!12902 (_ BitVec 64)) (t!18089 List!11861)) )
))
(declare-fun noDuplicate!294 (List!11861) Bool)

(assert (=> b!600519 (= res!385394 (not (noDuplicate!294 Nil!11858)))))

(declare-fun b!600520 () Bool)

(declare-fun res!385409 () Bool)

(assert (=> b!600520 (=> (not res!385409) (not e!343349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37121 (_ BitVec 32)) Bool)

(assert (=> b!600520 (= res!385409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!600522 () Bool)

(declare-fun res!385402 () Bool)

(assert (=> b!600522 (=> (not res!385402) (not e!343349))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!600522 (= res!385402 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17820 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!600523 () Bool)

(declare-fun e!343350 () Bool)

(declare-fun lt!273184 () SeekEntryResult!6260)

(declare-fun lt!273189 () SeekEntryResult!6260)

(assert (=> b!600523 (= e!343350 (= lt!273184 lt!273189))))

(declare-fun b!600524 () Bool)

(declare-fun e!343348 () Bool)

(assert (=> b!600524 (= e!343349 e!343348)))

(declare-fun res!385412 () Bool)

(assert (=> b!600524 (=> (not res!385412) (not e!343348))))

(assert (=> b!600524 (= res!385412 (= (select (store (arr!17820 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!600524 (= lt!273191 (array!37122 (store (arr!17820 a!2986) i!1108 k!1786) (size!18184 a!2986)))))

(declare-fun b!600525 () Bool)

(declare-fun e!343344 () Bool)

(assert (=> b!600525 (= e!343344 e!343346)))

(declare-fun res!385406 () Bool)

(assert (=> b!600525 (=> res!385406 e!343346)))

(assert (=> b!600525 (= res!385406 (or (bvsge (size!18184 a!2986) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 j!136) (size!18184 a!2986))))))

(declare-fun arrayNoDuplicates!0 (array!37121 (_ BitVec 32) List!11861) Bool)

(assert (=> b!600525 (arrayNoDuplicates!0 lt!273191 j!136 Nil!11858)))

(declare-fun lt!273185 () Unit!18958)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37121 (_ BitVec 32) (_ BitVec 32)) Unit!18958)

(assert (=> b!600525 (= lt!273185 (lemmaNoDuplicateFromThenFromBigger!0 lt!273191 #b00000000000000000000000000000000 j!136))))

(assert (=> b!600525 (arrayNoDuplicates!0 lt!273191 #b00000000000000000000000000000000 Nil!11858)))

(declare-fun lt!273188 () Unit!18958)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37121 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!11861) Unit!18958)

(assert (=> b!600525 (= lt!273188 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!11858))))

(assert (=> b!600525 (arrayContainsKey!0 lt!273191 (select (arr!17820 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!273190 () Unit!18958)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37121 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!18958)

(assert (=> b!600525 (= lt!273190 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!273191 (select (arr!17820 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun b!600526 () Bool)

(declare-fun res!385396 () Bool)

(assert (=> b!600526 (=> (not res!385396) (not e!343343))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!600526 (= res!385396 (validKeyInArray!0 (select (arr!17820 a!2986) j!136)))))

(declare-fun b!600527 () Bool)

(declare-fun e!343347 () Bool)

(declare-fun e!343341 () Bool)

(assert (=> b!600527 (= e!343347 e!343341)))

(declare-fun res!385408 () Bool)

(assert (=> b!600527 (=> res!385408 e!343341)))

(declare-fun lt!273180 () (_ BitVec 64))

(declare-fun lt!273187 () (_ BitVec 64))

(assert (=> b!600527 (= res!385408 (or (not (= (select (arr!17820 a!2986) j!136) lt!273180)) (not (= (select (arr!17820 a!2986) j!136) lt!273187)) (bvsge j!136 index!984)))))

(declare-fun b!600528 () Bool)

(assert (=> b!600528 (= e!343341 e!343340)))

(declare-fun res!385399 () Bool)

(assert (=> b!600528 (=> (not res!385399) (not e!343340))))

(assert (=> b!600528 (= res!385399 (arrayContainsKey!0 lt!273191 (select (arr!17820 a!2986) j!136) j!136))))

(declare-fun b!600529 () Bool)

(declare-fun res!385395 () Bool)

(assert (=> b!600529 (=> (not res!385395) (not e!343343))))

(assert (=> b!600529 (= res!385395 (and (= (size!18184 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18184 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18184 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!600530 () Bool)

(declare-fun res!385398 () Bool)

(assert (=> b!600530 (=> (not res!385398) (not e!343349))))

(assert (=> b!600530 (= res!385398 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11858))))

(declare-fun b!600531 () Bool)

(declare-fun res!385404 () Bool)

(assert (=> b!600531 (=> (not res!385404) (not e!343343))))

(assert (=> b!600531 (= res!385404 (validKeyInArray!0 k!1786))))

(declare-fun b!600532 () Bool)

(assert (=> b!600532 (= e!343346 true)))

(declare-fun lt!273183 () Bool)

(declare-fun contains!2977 (List!11861 (_ BitVec 64)) Bool)

(assert (=> b!600532 (= lt!273183 (contains!2977 Nil!11858 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!600533 () Bool)

(declare-fun e!343342 () Bool)

(assert (=> b!600533 (= e!343348 e!343342)))

(declare-fun res!385403 () Bool)

(assert (=> b!600533 (=> (not res!385403) (not e!343342))))

(assert (=> b!600533 (= res!385403 (and (= lt!273184 (Found!6260 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17820 a!2986) index!984) (select (arr!17820 a!2986) j!136))) (not (= (select (arr!17820 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37121 (_ BitVec 32)) SeekEntryResult!6260)

(assert (=> b!600533 (= lt!273184 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17820 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!600534 () Bool)

(declare-fun Unit!18961 () Unit!18958)

(assert (=> b!600534 (= e!343345 Unit!18961)))

(declare-fun b!600521 () Bool)

(declare-fun res!385401 () Bool)

(assert (=> b!600521 (=> res!385401 e!343346)))

(assert (=> b!600521 (= res!385401 (contains!2977 Nil!11858 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!385407 () Bool)

(assert (=> start!54886 (=> (not res!385407) (not e!343343))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!54886 (= res!385407 (validMask!0 mask!3053))))

(assert (=> start!54886 e!343343))

(assert (=> start!54886 true))

(declare-fun array_inv!13616 (array!37121) Bool)

(assert (=> start!54886 (array_inv!13616 a!2986)))

(declare-fun b!600535 () Bool)

(declare-fun e!343339 () Bool)

(assert (=> b!600535 (= e!343339 e!343344)))

(declare-fun res!385397 () Bool)

(assert (=> b!600535 (=> res!385397 e!343344)))

(assert (=> b!600535 (= res!385397 (or (not (= (select (arr!17820 a!2986) j!136) lt!273180)) (not (= (select (arr!17820 a!2986) j!136) lt!273187)) (bvsge j!136 index!984)))))

(assert (=> b!600535 e!343347))

(declare-fun res!385411 () Bool)

(assert (=> b!600535 (=> (not res!385411) (not e!343347))))

(assert (=> b!600535 (= res!385411 (= lt!273187 (select (arr!17820 a!2986) j!136)))))

(assert (=> b!600535 (= lt!273187 (select (store (arr!17820 a!2986) i!1108 k!1786) index!984))))

(declare-fun b!600536 () Bool)

(assert (=> b!600536 (= e!343342 (not e!343339))))

(declare-fun res!385405 () Bool)

(assert (=> b!600536 (=> res!385405 e!343339)))

(declare-fun lt!273192 () SeekEntryResult!6260)

(assert (=> b!600536 (= res!385405 (not (= lt!273192 (Found!6260 index!984))))))

(declare-fun lt!273181 () Unit!18958)

(assert (=> b!600536 (= lt!273181 e!343345)))

(declare-fun c!67928 () Bool)

(assert (=> b!600536 (= c!67928 (= lt!273192 Undefined!6260))))

(assert (=> b!600536 (= lt!273192 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!273180 lt!273191 mask!3053))))

(assert (=> b!600536 e!343350))

(declare-fun res!385410 () Bool)

(assert (=> b!600536 (=> (not res!385410) (not e!343350))))

(declare-fun lt!273186 () (_ BitVec 32))

(assert (=> b!600536 (= res!385410 (= lt!273189 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273186 vacantSpotIndex!68 lt!273180 lt!273191 mask!3053)))))

(assert (=> b!600536 (= lt!273189 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!273186 vacantSpotIndex!68 (select (arr!17820 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!600536 (= lt!273180 (select (store (arr!17820 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!273182 () Unit!18958)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37121 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18958)

(assert (=> b!600536 (= lt!273182 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!273186 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!600536 (= lt!273186 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!54886 res!385407) b!600529))

(assert (= (and b!600529 res!385395) b!600526))

(assert (= (and b!600526 res!385396) b!600531))

(assert (= (and b!600531 res!385404) b!600518))

(assert (= (and b!600518 res!385393) b!600515))

(assert (= (and b!600515 res!385400) b!600520))

(assert (= (and b!600520 res!385409) b!600530))

(assert (= (and b!600530 res!385398) b!600522))

(assert (= (and b!600522 res!385402) b!600524))

(assert (= (and b!600524 res!385412) b!600533))

(assert (= (and b!600533 res!385403) b!600536))

(assert (= (and b!600536 res!385410) b!600523))

(assert (= (and b!600536 c!67928) b!600517))

(assert (= (and b!600536 (not c!67928)) b!600534))

(assert (= (and b!600536 (not res!385405)) b!600535))

(assert (= (and b!600535 res!385411) b!600527))

(assert (= (and b!600527 (not res!385408)) b!600528))

(assert (= (and b!600528 res!385399) b!600516))

(assert (= (and b!600535 (not res!385397)) b!600525))

(assert (= (and b!600525 (not res!385406)) b!600519))

(assert (= (and b!600519 (not res!385394)) b!600521))

(assert (= (and b!600521 (not res!385401)) b!600532))

(declare-fun m!577733 () Bool)

(assert (=> b!600530 m!577733))

(declare-fun m!577735 () Bool)

(assert (=> b!600536 m!577735))

(declare-fun m!577737 () Bool)

(assert (=> b!600536 m!577737))

(declare-fun m!577739 () Bool)

(assert (=> b!600536 m!577739))

(declare-fun m!577741 () Bool)

(assert (=> b!600536 m!577741))

(assert (=> b!600536 m!577739))

(declare-fun m!577743 () Bool)

(assert (=> b!600536 m!577743))

(declare-fun m!577745 () Bool)

(assert (=> b!600536 m!577745))

(declare-fun m!577747 () Bool)

(assert (=> b!600536 m!577747))

(declare-fun m!577749 () Bool)

(assert (=> b!600536 m!577749))

(declare-fun m!577751 () Bool)

(assert (=> b!600522 m!577751))

(declare-fun m!577753 () Bool)

(assert (=> b!600515 m!577753))

(assert (=> b!600528 m!577739))

(assert (=> b!600528 m!577739))

(declare-fun m!577755 () Bool)

(assert (=> b!600528 m!577755))

(assert (=> b!600524 m!577743))

(declare-fun m!577757 () Bool)

(assert (=> b!600524 m!577757))

(declare-fun m!577759 () Bool)

(assert (=> b!600519 m!577759))

(assert (=> b!600516 m!577739))

(assert (=> b!600516 m!577739))

(declare-fun m!577761 () Bool)

(assert (=> b!600516 m!577761))

(declare-fun m!577763 () Bool)

(assert (=> b!600521 m!577763))

(declare-fun m!577765 () Bool)

(assert (=> b!600525 m!577765))

(assert (=> b!600525 m!577739))

(declare-fun m!577767 () Bool)

(assert (=> b!600525 m!577767))

(assert (=> b!600525 m!577739))

(declare-fun m!577769 () Bool)

(assert (=> b!600525 m!577769))

(assert (=> b!600525 m!577739))

(declare-fun m!577771 () Bool)

(assert (=> b!600525 m!577771))

(declare-fun m!577773 () Bool)

(assert (=> b!600525 m!577773))

(declare-fun m!577775 () Bool)

(assert (=> b!600525 m!577775))

(declare-fun m!577777 () Bool)

(assert (=> b!600518 m!577777))

(declare-fun m!577779 () Bool)

(assert (=> start!54886 m!577779))

(declare-fun m!577781 () Bool)

(assert (=> start!54886 m!577781))

(declare-fun m!577783 () Bool)

(assert (=> b!600520 m!577783))

(declare-fun m!577785 () Bool)

(assert (=> b!600533 m!577785))

(assert (=> b!600533 m!577739))

(assert (=> b!600533 m!577739))

(declare-fun m!577787 () Bool)

(assert (=> b!600533 m!577787))

(assert (=> b!600527 m!577739))

(declare-fun m!577789 () Bool)

(assert (=> b!600532 m!577789))

(assert (=> b!600526 m!577739))

(assert (=> b!600526 m!577739))

(declare-fun m!577791 () Bool)

(assert (=> b!600526 m!577791))

(declare-fun m!577793 () Bool)

(assert (=> b!600531 m!577793))

(assert (=> b!600535 m!577739))

(assert (=> b!600535 m!577743))

(declare-fun m!577795 () Bool)

(assert (=> b!600535 m!577795))

(push 1)

