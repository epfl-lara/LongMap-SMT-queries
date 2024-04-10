; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57266 () Bool)

(assert start!57266)

(declare-fun b!633918 () Bool)

(declare-fun e!362484 () Bool)

(declare-datatypes ((SeekEntryResult!6758 0))(
  ( (MissingZero!6758 (index!29331 (_ BitVec 32))) (Found!6758 (index!29332 (_ BitVec 32))) (Intermediate!6758 (undefined!7570 Bool) (index!29333 (_ BitVec 32)) (x!58075 (_ BitVec 32))) (Undefined!6758) (MissingVacant!6758 (index!29334 (_ BitVec 32))) )
))
(declare-fun lt!293035 () SeekEntryResult!6758)

(declare-fun lt!293033 () SeekEntryResult!6758)

(assert (=> b!633918 (= e!362484 (= lt!293035 lt!293033))))

(declare-fun b!633919 () Bool)

(declare-fun res!410025 () Bool)

(declare-fun e!362477 () Bool)

(assert (=> b!633919 (=> (not res!410025) (not e!362477))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!38176 0))(
  ( (array!38177 (arr!18318 (Array (_ BitVec 32) (_ BitVec 64))) (size!18682 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38176)

(assert (=> b!633919 (= res!410025 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18318 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!633921 () Bool)

(declare-fun res!410027 () Bool)

(assert (=> b!633921 (=> (not res!410027) (not e!362477))))

(declare-datatypes ((List!12359 0))(
  ( (Nil!12356) (Cons!12355 (h!13400 (_ BitVec 64)) (t!18587 List!12359)) )
))
(declare-fun arrayNoDuplicates!0 (array!38176 (_ BitVec 32) List!12359) Bool)

(assert (=> b!633921 (= res!410027 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12356))))

(declare-fun b!633922 () Bool)

(declare-fun res!410022 () Bool)

(assert (=> b!633922 (=> (not res!410022) (not e!362477))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38176 (_ BitVec 32)) Bool)

(assert (=> b!633922 (= res!410022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!633923 () Bool)

(declare-datatypes ((Unit!21366 0))(
  ( (Unit!21367) )
))
(declare-fun e!362478 () Unit!21366)

(declare-fun Unit!21368 () Unit!21366)

(assert (=> b!633923 (= e!362478 Unit!21368)))

(declare-fun b!633924 () Bool)

(declare-fun e!362480 () Bool)

(assert (=> b!633924 (= e!362480 e!362477)))

(declare-fun res!410032 () Bool)

(assert (=> b!633924 (=> (not res!410032) (not e!362477))))

(declare-fun lt!293040 () SeekEntryResult!6758)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!633924 (= res!410032 (or (= lt!293040 (MissingZero!6758 i!1108)) (= lt!293040 (MissingVacant!6758 i!1108))))))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38176 (_ BitVec 32)) SeekEntryResult!6758)

(assert (=> b!633924 (= lt!293040 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!633925 () Bool)

(declare-fun res!410020 () Bool)

(assert (=> b!633925 (=> (not res!410020) (not e!362480))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!633925 (= res!410020 (and (= (size!18682 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18682 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18682 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!633926 () Bool)

(declare-fun res!410024 () Bool)

(assert (=> b!633926 (=> (not res!410024) (not e!362480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!633926 (= res!410024 (validKeyInArray!0 k!1786))))

(declare-fun b!633927 () Bool)

(declare-fun e!362479 () Bool)

(assert (=> b!633927 (= e!362477 e!362479)))

(declare-fun res!410021 () Bool)

(assert (=> b!633927 (=> (not res!410021) (not e!362479))))

(assert (=> b!633927 (= res!410021 (= (select (store (arr!18318 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!293032 () array!38176)

(assert (=> b!633927 (= lt!293032 (array!38177 (store (arr!18318 a!2986) i!1108 k!1786) (size!18682 a!2986)))))

(declare-fun b!633928 () Bool)

(declare-fun e!362474 () Bool)

(assert (=> b!633928 (= e!362479 e!362474)))

(declare-fun res!410029 () Bool)

(assert (=> b!633928 (=> (not res!410029) (not e!362474))))

(assert (=> b!633928 (= res!410029 (and (= lt!293035 (Found!6758 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18318 a!2986) index!984) (select (arr!18318 a!2986) j!136))) (not (= (select (arr!18318 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38176 (_ BitVec 32)) SeekEntryResult!6758)

(assert (=> b!633928 (= lt!293035 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18318 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!633929 () Bool)

(declare-fun res!410030 () Bool)

(assert (=> b!633929 (=> (not res!410030) (not e!362480))))

(declare-fun arrayContainsKey!0 (array!38176 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!633929 (= res!410030 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun b!633930 () Bool)

(declare-fun res!410026 () Bool)

(assert (=> b!633930 (=> (not res!410026) (not e!362480))))

(assert (=> b!633930 (= res!410026 (validKeyInArray!0 (select (arr!18318 a!2986) j!136)))))

(declare-fun b!633931 () Bool)

(declare-fun Unit!21369 () Unit!21366)

(assert (=> b!633931 (= e!362478 Unit!21369)))

(assert (=> b!633931 false))

(declare-fun b!633932 () Bool)

(declare-fun e!362475 () Bool)

(declare-fun e!362481 () Bool)

(assert (=> b!633932 (= e!362475 e!362481)))

(declare-fun res!410019 () Bool)

(assert (=> b!633932 (=> res!410019 e!362481)))

(declare-fun lt!293039 () (_ BitVec 64))

(declare-fun lt!293038 () (_ BitVec 64))

(assert (=> b!633932 (= res!410019 (or (not (= (select (arr!18318 a!2986) j!136) lt!293039)) (not (= (select (arr!18318 a!2986) j!136) lt!293038)) (bvsge j!136 index!984)))))

(declare-fun e!362476 () Bool)

(declare-fun b!633933 () Bool)

(assert (=> b!633933 (= e!362476 (arrayContainsKey!0 lt!293032 (select (arr!18318 a!2986) j!136) index!984))))

(declare-fun b!633934 () Bool)

(assert (=> b!633934 (= e!362481 e!362476)))

(declare-fun res!410033 () Bool)

(assert (=> b!633934 (=> (not res!410033) (not e!362476))))

(assert (=> b!633934 (= res!410033 (arrayContainsKey!0 lt!293032 (select (arr!18318 a!2986) j!136) j!136))))

(declare-fun b!633935 () Bool)

(declare-fun e!362482 () Bool)

(assert (=> b!633935 (= e!362482 true)))

(assert (=> b!633935 e!362475))

(declare-fun res!410031 () Bool)

(assert (=> b!633935 (=> (not res!410031) (not e!362475))))

(assert (=> b!633935 (= res!410031 (= lt!293038 (select (arr!18318 a!2986) j!136)))))

(assert (=> b!633935 (= lt!293038 (select (store (arr!18318 a!2986) i!1108 k!1786) index!984))))

(declare-fun res!410023 () Bool)

(assert (=> start!57266 (=> (not res!410023) (not e!362480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!57266 (= res!410023 (validMask!0 mask!3053))))

(assert (=> start!57266 e!362480))

(assert (=> start!57266 true))

(declare-fun array_inv!14114 (array!38176) Bool)

(assert (=> start!57266 (array_inv!14114 a!2986)))

(declare-fun b!633920 () Bool)

(assert (=> b!633920 (= e!362474 (not e!362482))))

(declare-fun res!410018 () Bool)

(assert (=> b!633920 (=> res!410018 e!362482)))

(declare-fun lt!293034 () SeekEntryResult!6758)

(assert (=> b!633920 (= res!410018 (not (= lt!293034 (Found!6758 index!984))))))

(declare-fun lt!293037 () Unit!21366)

(assert (=> b!633920 (= lt!293037 e!362478)))

(declare-fun c!72317 () Bool)

(assert (=> b!633920 (= c!72317 (= lt!293034 Undefined!6758))))

(assert (=> b!633920 (= lt!293034 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!293039 lt!293032 mask!3053))))

(assert (=> b!633920 e!362484))

(declare-fun res!410028 () Bool)

(assert (=> b!633920 (=> (not res!410028) (not e!362484))))

(declare-fun lt!293036 () (_ BitVec 32))

(assert (=> b!633920 (= res!410028 (= lt!293033 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293036 vacantSpotIndex!68 lt!293039 lt!293032 mask!3053)))))

(assert (=> b!633920 (= lt!293033 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!293036 vacantSpotIndex!68 (select (arr!18318 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!633920 (= lt!293039 (select (store (arr!18318 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!293041 () Unit!21366)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38176 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21366)

(assert (=> b!633920 (= lt!293041 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!293036 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!633920 (= lt!293036 (nextIndex!0 index!984 x!910 mask!3053))))

(assert (= (and start!57266 res!410023) b!633925))

(assert (= (and b!633925 res!410020) b!633930))

(assert (= (and b!633930 res!410026) b!633926))

(assert (= (and b!633926 res!410024) b!633929))

(assert (= (and b!633929 res!410030) b!633924))

(assert (= (and b!633924 res!410032) b!633922))

(assert (= (and b!633922 res!410022) b!633921))

(assert (= (and b!633921 res!410027) b!633919))

(assert (= (and b!633919 res!410025) b!633927))

(assert (= (and b!633927 res!410021) b!633928))

(assert (= (and b!633928 res!410029) b!633920))

(assert (= (and b!633920 res!410028) b!633918))

(assert (= (and b!633920 c!72317) b!633931))

(assert (= (and b!633920 (not c!72317)) b!633923))

(assert (= (and b!633920 (not res!410018)) b!633935))

(assert (= (and b!633935 res!410031) b!633932))

(assert (= (and b!633932 (not res!410019)) b!633934))

(assert (= (and b!633934 res!410033) b!633933))

(declare-fun m!608501 () Bool)

(assert (=> b!633926 m!608501))

(declare-fun m!608503 () Bool)

(assert (=> b!633934 m!608503))

(assert (=> b!633934 m!608503))

(declare-fun m!608505 () Bool)

(assert (=> b!633934 m!608505))

(declare-fun m!608507 () Bool)

(assert (=> b!633922 m!608507))

(declare-fun m!608509 () Bool)

(assert (=> b!633927 m!608509))

(declare-fun m!608511 () Bool)

(assert (=> b!633927 m!608511))

(declare-fun m!608513 () Bool)

(assert (=> start!57266 m!608513))

(declare-fun m!608515 () Bool)

(assert (=> start!57266 m!608515))

(declare-fun m!608517 () Bool)

(assert (=> b!633929 m!608517))

(declare-fun m!608519 () Bool)

(assert (=> b!633928 m!608519))

(assert (=> b!633928 m!608503))

(assert (=> b!633928 m!608503))

(declare-fun m!608521 () Bool)

(assert (=> b!633928 m!608521))

(declare-fun m!608523 () Bool)

(assert (=> b!633924 m!608523))

(assert (=> b!633932 m!608503))

(assert (=> b!633933 m!608503))

(assert (=> b!633933 m!608503))

(declare-fun m!608525 () Bool)

(assert (=> b!633933 m!608525))

(declare-fun m!608527 () Bool)

(assert (=> b!633921 m!608527))

(declare-fun m!608529 () Bool)

(assert (=> b!633919 m!608529))

(assert (=> b!633935 m!608503))

(assert (=> b!633935 m!608509))

(declare-fun m!608531 () Bool)

(assert (=> b!633935 m!608531))

(declare-fun m!608533 () Bool)

(assert (=> b!633920 m!608533))

(declare-fun m!608535 () Bool)

(assert (=> b!633920 m!608535))

(assert (=> b!633920 m!608509))

(declare-fun m!608537 () Bool)

(assert (=> b!633920 m!608537))

(declare-fun m!608539 () Bool)

(assert (=> b!633920 m!608539))

(assert (=> b!633920 m!608503))

(declare-fun m!608541 () Bool)

(assert (=> b!633920 m!608541))

(declare-fun m!608543 () Bool)

(assert (=> b!633920 m!608543))

(assert (=> b!633920 m!608503))

(assert (=> b!633930 m!608503))

(assert (=> b!633930 m!608503))

(declare-fun m!608545 () Bool)

(assert (=> b!633930 m!608545))

(push 1)

