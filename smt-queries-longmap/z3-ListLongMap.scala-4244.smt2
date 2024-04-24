; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58908 () Bool)

(assert start!58908)

(declare-fun b!648629 () Bool)

(declare-fun e!372030 () Bool)

(declare-fun e!372031 () Bool)

(assert (=> b!648629 (= e!372030 e!372031)))

(declare-fun res!420169 () Bool)

(assert (=> b!648629 (=> res!420169 e!372031)))

(declare-datatypes ((array!38508 0))(
  ( (array!38509 (arr!18457 (Array (_ BitVec 32) (_ BitVec 64))) (size!18821 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38508)

(assert (=> b!648629 (= res!420169 (or (bvsge (size!18821 a!2986) #b01111111111111111111111111111111) (bvsge #b00000000000000000000000000000000 (size!18821 a!2986))))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!301021 () array!38508)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!38508 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!648629 (arrayContainsKey!0 lt!301021 (select (arr!18457 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-datatypes ((Unit!22017 0))(
  ( (Unit!22018) )
))
(declare-fun lt!301036 () Unit!22017)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38508 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!22017)

(assert (=> b!648629 (= lt!301036 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301021 (select (arr!18457 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!372039 () Bool)

(assert (=> b!648629 e!372039))

(declare-fun res!420170 () Bool)

(assert (=> b!648629 (=> (not res!420170) (not e!372039))))

(assert (=> b!648629 (= res!420170 (arrayContainsKey!0 lt!301021 (select (arr!18457 a!2986) j!136) j!136))))

(declare-fun b!648630 () Bool)

(declare-fun e!372033 () Bool)

(declare-fun e!372041 () Bool)

(assert (=> b!648630 (= e!372033 e!372041)))

(declare-fun res!420188 () Bool)

(assert (=> b!648630 (=> (not res!420188) (not e!372041))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(assert (=> b!648630 (= res!420188 (= (select (store (arr!18457 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!648630 (= lt!301021 (array!38509 (store (arr!18457 a!2986) i!1108 k0!1786) (size!18821 a!2986)))))

(declare-fun b!648631 () Bool)

(declare-fun res!420174 () Bool)

(declare-fun e!372035 () Bool)

(assert (=> b!648631 (=> (not res!420174) (not e!372035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!648631 (= res!420174 (validKeyInArray!0 (select (arr!18457 a!2986) j!136)))))

(declare-fun b!648632 () Bool)

(assert (=> b!648632 (= e!372039 (arrayContainsKey!0 lt!301021 (select (arr!18457 a!2986) j!136) index!984))))

(declare-fun b!648633 () Bool)

(declare-fun res!420187 () Bool)

(assert (=> b!648633 (=> res!420187 e!372031)))

(declare-datatypes ((List!12405 0))(
  ( (Nil!12402) (Cons!12401 (h!13449 (_ BitVec 64)) (t!18625 List!12405)) )
))
(declare-fun contains!3137 (List!12405 (_ BitVec 64)) Bool)

(assert (=> b!648633 (= res!420187 (contains!3137 Nil!12402 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648634 () Bool)

(declare-fun e!372027 () Bool)

(assert (=> b!648634 (= e!372027 e!372030)))

(declare-fun res!420172 () Bool)

(assert (=> b!648634 (=> res!420172 e!372030)))

(assert (=> b!648634 (= res!420172 (bvsge index!984 j!136))))

(declare-fun lt!301024 () Unit!22017)

(declare-fun e!372037 () Unit!22017)

(assert (=> b!648634 (= lt!301024 e!372037)))

(declare-fun c!74599 () Bool)

(assert (=> b!648634 (= c!74599 (bvslt j!136 index!984))))

(declare-fun b!648635 () Bool)

(declare-fun e!372036 () Bool)

(assert (=> b!648635 (= e!372036 e!372027)))

(declare-fun res!420185 () Bool)

(assert (=> b!648635 (=> res!420185 e!372027)))

(declare-fun lt!301035 () (_ BitVec 64))

(declare-fun lt!301027 () (_ BitVec 64))

(assert (=> b!648635 (= res!420185 (or (not (= (select (arr!18457 a!2986) j!136) lt!301027)) (not (= (select (arr!18457 a!2986) j!136) lt!301035))))))

(declare-fun e!372029 () Bool)

(assert (=> b!648635 e!372029))

(declare-fun res!420181 () Bool)

(assert (=> b!648635 (=> (not res!420181) (not e!372029))))

(assert (=> b!648635 (= res!420181 (= lt!301035 (select (arr!18457 a!2986) j!136)))))

(assert (=> b!648635 (= lt!301035 (select (store (arr!18457 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!648636 () Bool)

(declare-fun e!372038 () Bool)

(assert (=> b!648636 (= e!372029 e!372038)))

(declare-fun res!420182 () Bool)

(assert (=> b!648636 (=> res!420182 e!372038)))

(assert (=> b!648636 (= res!420182 (or (not (= (select (arr!18457 a!2986) j!136) lt!301027)) (not (= (select (arr!18457 a!2986) j!136) lt!301035)) (bvsge j!136 index!984)))))

(declare-fun b!648637 () Bool)

(declare-fun e!372032 () Bool)

(assert (=> b!648637 (= e!372032 (not e!372036))))

(declare-fun res!420180 () Bool)

(assert (=> b!648637 (=> res!420180 e!372036)))

(declare-datatypes ((SeekEntryResult!6853 0))(
  ( (MissingZero!6853 (index!29759 (_ BitVec 32))) (Found!6853 (index!29760 (_ BitVec 32))) (Intermediate!6853 (undefined!7665 Bool) (index!29761 (_ BitVec 32)) (x!58701 (_ BitVec 32))) (Undefined!6853) (MissingVacant!6853 (index!29762 (_ BitVec 32))) )
))
(declare-fun lt!301020 () SeekEntryResult!6853)

(assert (=> b!648637 (= res!420180 (not (= lt!301020 (Found!6853 index!984))))))

(declare-fun lt!301022 () Unit!22017)

(declare-fun e!372034 () Unit!22017)

(assert (=> b!648637 (= lt!301022 e!372034)))

(declare-fun c!74600 () Bool)

(assert (=> b!648637 (= c!74600 (= lt!301020 Undefined!6853))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38508 (_ BitVec 32)) SeekEntryResult!6853)

(assert (=> b!648637 (= lt!301020 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!301027 lt!301021 mask!3053))))

(declare-fun e!372028 () Bool)

(assert (=> b!648637 e!372028))

(declare-fun res!420168 () Bool)

(assert (=> b!648637 (=> (not res!420168) (not e!372028))))

(declare-fun lt!301025 () SeekEntryResult!6853)

(declare-fun lt!301023 () (_ BitVec 32))

(assert (=> b!648637 (= res!420168 (= lt!301025 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301023 vacantSpotIndex!68 lt!301027 lt!301021 mask!3053)))))

(assert (=> b!648637 (= lt!301025 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!301023 vacantSpotIndex!68 (select (arr!18457 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!648637 (= lt!301027 (select (store (arr!18457 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!301028 () Unit!22017)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38508 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!22017)

(assert (=> b!648637 (= lt!301028 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!301023 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!648637 (= lt!301023 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!648638 () Bool)

(declare-fun res!420186 () Bool)

(assert (=> b!648638 (=> (not res!420186) (not e!372035))))

(assert (=> b!648638 (= res!420186 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!648639 () Bool)

(declare-fun lt!301032 () SeekEntryResult!6853)

(assert (=> b!648639 (= e!372028 (= lt!301032 lt!301025))))

(declare-fun res!420171 () Bool)

(assert (=> start!58908 (=> (not res!420171) (not e!372035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58908 (= res!420171 (validMask!0 mask!3053))))

(assert (=> start!58908 e!372035))

(assert (=> start!58908 true))

(declare-fun array_inv!14316 (array!38508) Bool)

(assert (=> start!58908 (array_inv!14316 a!2986)))

(declare-fun b!648640 () Bool)

(declare-fun res!420173 () Bool)

(assert (=> b!648640 (=> res!420173 e!372031)))

(assert (=> b!648640 (= res!420173 (contains!3137 Nil!12402 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!648641 () Bool)

(declare-fun res!420184 () Bool)

(assert (=> b!648641 (=> (not res!420184) (not e!372033))))

(assert (=> b!648641 (= res!420184 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18457 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!648642 () Bool)

(declare-fun res!420190 () Bool)

(assert (=> b!648642 (=> (not res!420190) (not e!372033))))

(declare-fun arrayNoDuplicates!0 (array!38508 (_ BitVec 32) List!12405) Bool)

(assert (=> b!648642 (= res!420190 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12402))))

(declare-fun b!648643 () Bool)

(declare-fun Unit!22019 () Unit!22017)

(assert (=> b!648643 (= e!372037 Unit!22019)))

(declare-fun b!648644 () Bool)

(declare-fun res!420176 () Bool)

(assert (=> b!648644 (=> (not res!420176) (not e!372033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38508 (_ BitVec 32)) Bool)

(assert (=> b!648644 (= res!420176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!648645 () Bool)

(declare-fun Unit!22020 () Unit!22017)

(assert (=> b!648645 (= e!372037 Unit!22020)))

(declare-fun lt!301029 () Unit!22017)

(assert (=> b!648645 (= lt!301029 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!301021 (select (arr!18457 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> b!648645 (arrayContainsKey!0 lt!301021 (select (arr!18457 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!301026 () Unit!22017)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38508 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12405) Unit!22017)

(assert (=> b!648645 (= lt!301026 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12402))))

(assert (=> b!648645 (arrayNoDuplicates!0 lt!301021 #b00000000000000000000000000000000 Nil!12402)))

(declare-fun lt!301031 () Unit!22017)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38508 (_ BitVec 32) (_ BitVec 32)) Unit!22017)

(assert (=> b!648645 (= lt!301031 (lemmaNoDuplicateFromThenFromBigger!0 lt!301021 #b00000000000000000000000000000000 j!136))))

(assert (=> b!648645 (arrayNoDuplicates!0 lt!301021 j!136 Nil!12402)))

(declare-fun lt!301030 () Unit!22017)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38508 (_ BitVec 64) (_ BitVec 32) List!12405) Unit!22017)

(assert (=> b!648645 (= lt!301030 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!301021 (select (arr!18457 a!2986) j!136) j!136 Nil!12402))))

(assert (=> b!648645 false))

(declare-fun b!648646 () Bool)

(declare-fun res!420183 () Bool)

(assert (=> b!648646 (=> (not res!420183) (not e!372035))))

(assert (=> b!648646 (= res!420183 (validKeyInArray!0 k0!1786))))

(declare-fun b!648647 () Bool)

(assert (=> b!648647 (= e!372035 e!372033)))

(declare-fun res!420175 () Bool)

(assert (=> b!648647 (=> (not res!420175) (not e!372033))))

(declare-fun lt!301034 () SeekEntryResult!6853)

(assert (=> b!648647 (= res!420175 (or (= lt!301034 (MissingZero!6853 i!1108)) (= lt!301034 (MissingVacant!6853 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38508 (_ BitVec 32)) SeekEntryResult!6853)

(assert (=> b!648647 (= lt!301034 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!648648 () Bool)

(assert (=> b!648648 (= e!372031 true)))

(declare-fun lt!301033 () Bool)

(assert (=> b!648648 (= lt!301033 (contains!3137 Nil!12402 k0!1786))))

(declare-fun b!648649 () Bool)

(declare-fun Unit!22021 () Unit!22017)

(assert (=> b!648649 (= e!372034 Unit!22021)))

(declare-fun b!648650 () Bool)

(declare-fun e!372042 () Bool)

(assert (=> b!648650 (= e!372038 e!372042)))

(declare-fun res!420178 () Bool)

(assert (=> b!648650 (=> (not res!420178) (not e!372042))))

(assert (=> b!648650 (= res!420178 (arrayContainsKey!0 lt!301021 (select (arr!18457 a!2986) j!136) j!136))))

(declare-fun b!648651 () Bool)

(assert (=> b!648651 (= e!372041 e!372032)))

(declare-fun res!420189 () Bool)

(assert (=> b!648651 (=> (not res!420189) (not e!372032))))

(assert (=> b!648651 (= res!420189 (and (= lt!301032 (Found!6853 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18457 a!2986) index!984) (select (arr!18457 a!2986) j!136))) (not (= (select (arr!18457 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!648651 (= lt!301032 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18457 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!648652 () Bool)

(declare-fun res!420177 () Bool)

(assert (=> b!648652 (=> res!420177 e!372031)))

(declare-fun noDuplicate!424 (List!12405) Bool)

(assert (=> b!648652 (= res!420177 (not (noDuplicate!424 Nil!12402)))))

(declare-fun b!648653 () Bool)

(declare-fun res!420179 () Bool)

(assert (=> b!648653 (=> (not res!420179) (not e!372035))))

(assert (=> b!648653 (= res!420179 (and (= (size!18821 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18821 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18821 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!648654 () Bool)

(assert (=> b!648654 (= e!372042 (arrayContainsKey!0 lt!301021 (select (arr!18457 a!2986) j!136) index!984))))

(declare-fun b!648655 () Bool)

(declare-fun Unit!22022 () Unit!22017)

(assert (=> b!648655 (= e!372034 Unit!22022)))

(assert (=> b!648655 false))

(assert (= (and start!58908 res!420171) b!648653))

(assert (= (and b!648653 res!420179) b!648631))

(assert (= (and b!648631 res!420174) b!648646))

(assert (= (and b!648646 res!420183) b!648638))

(assert (= (and b!648638 res!420186) b!648647))

(assert (= (and b!648647 res!420175) b!648644))

(assert (= (and b!648644 res!420176) b!648642))

(assert (= (and b!648642 res!420190) b!648641))

(assert (= (and b!648641 res!420184) b!648630))

(assert (= (and b!648630 res!420188) b!648651))

(assert (= (and b!648651 res!420189) b!648637))

(assert (= (and b!648637 res!420168) b!648639))

(assert (= (and b!648637 c!74600) b!648655))

(assert (= (and b!648637 (not c!74600)) b!648649))

(assert (= (and b!648637 (not res!420180)) b!648635))

(assert (= (and b!648635 res!420181) b!648636))

(assert (= (and b!648636 (not res!420182)) b!648650))

(assert (= (and b!648650 res!420178) b!648654))

(assert (= (and b!648635 (not res!420185)) b!648634))

(assert (= (and b!648634 c!74599) b!648645))

(assert (= (and b!648634 (not c!74599)) b!648643))

(assert (= (and b!648634 (not res!420172)) b!648629))

(assert (= (and b!648629 res!420170) b!648632))

(assert (= (and b!648629 (not res!420169)) b!648652))

(assert (= (and b!648652 (not res!420177)) b!648640))

(assert (= (and b!648640 (not res!420173)) b!648633))

(assert (= (and b!648633 (not res!420187)) b!648648))

(declare-fun m!622429 () Bool)

(assert (=> b!648654 m!622429))

(assert (=> b!648654 m!622429))

(declare-fun m!622431 () Bool)

(assert (=> b!648654 m!622431))

(declare-fun m!622433 () Bool)

(assert (=> b!648646 m!622433))

(assert (=> b!648650 m!622429))

(assert (=> b!648650 m!622429))

(declare-fun m!622435 () Bool)

(assert (=> b!648650 m!622435))

(declare-fun m!622437 () Bool)

(assert (=> b!648647 m!622437))

(assert (=> b!648636 m!622429))

(assert (=> b!648635 m!622429))

(declare-fun m!622439 () Bool)

(assert (=> b!648635 m!622439))

(declare-fun m!622441 () Bool)

(assert (=> b!648635 m!622441))

(declare-fun m!622443 () Bool)

(assert (=> b!648640 m!622443))

(declare-fun m!622445 () Bool)

(assert (=> b!648642 m!622445))

(assert (=> b!648631 m!622429))

(assert (=> b!648631 m!622429))

(declare-fun m!622447 () Bool)

(assert (=> b!648631 m!622447))

(declare-fun m!622449 () Bool)

(assert (=> b!648637 m!622449))

(assert (=> b!648637 m!622429))

(assert (=> b!648637 m!622439))

(assert (=> b!648637 m!622429))

(declare-fun m!622451 () Bool)

(assert (=> b!648637 m!622451))

(declare-fun m!622453 () Bool)

(assert (=> b!648637 m!622453))

(declare-fun m!622455 () Bool)

(assert (=> b!648637 m!622455))

(declare-fun m!622457 () Bool)

(assert (=> b!648637 m!622457))

(declare-fun m!622459 () Bool)

(assert (=> b!648637 m!622459))

(declare-fun m!622461 () Bool)

(assert (=> b!648644 m!622461))

(assert (=> b!648629 m!622429))

(assert (=> b!648629 m!622429))

(declare-fun m!622463 () Bool)

(assert (=> b!648629 m!622463))

(assert (=> b!648629 m!622429))

(declare-fun m!622465 () Bool)

(assert (=> b!648629 m!622465))

(assert (=> b!648629 m!622429))

(assert (=> b!648629 m!622435))

(declare-fun m!622467 () Bool)

(assert (=> b!648641 m!622467))

(declare-fun m!622469 () Bool)

(assert (=> b!648652 m!622469))

(declare-fun m!622471 () Bool)

(assert (=> b!648651 m!622471))

(assert (=> b!648651 m!622429))

(assert (=> b!648651 m!622429))

(declare-fun m!622473 () Bool)

(assert (=> b!648651 m!622473))

(declare-fun m!622475 () Bool)

(assert (=> b!648648 m!622475))

(assert (=> b!648632 m!622429))

(assert (=> b!648632 m!622429))

(assert (=> b!648632 m!622431))

(assert (=> b!648630 m!622439))

(declare-fun m!622477 () Bool)

(assert (=> b!648630 m!622477))

(declare-fun m!622479 () Bool)

(assert (=> b!648633 m!622479))

(declare-fun m!622481 () Bool)

(assert (=> b!648638 m!622481))

(declare-fun m!622483 () Bool)

(assert (=> b!648645 m!622483))

(assert (=> b!648645 m!622429))

(declare-fun m!622485 () Bool)

(assert (=> b!648645 m!622485))

(assert (=> b!648645 m!622429))

(declare-fun m!622487 () Bool)

(assert (=> b!648645 m!622487))

(declare-fun m!622489 () Bool)

(assert (=> b!648645 m!622489))

(declare-fun m!622491 () Bool)

(assert (=> b!648645 m!622491))

(assert (=> b!648645 m!622429))

(declare-fun m!622493 () Bool)

(assert (=> b!648645 m!622493))

(assert (=> b!648645 m!622429))

(declare-fun m!622495 () Bool)

(assert (=> b!648645 m!622495))

(declare-fun m!622497 () Bool)

(assert (=> start!58908 m!622497))

(declare-fun m!622499 () Bool)

(assert (=> start!58908 m!622499))

(check-sat (not b!648651) (not b!648633) (not b!648645) (not b!648638) (not b!648652) (not b!648647) (not b!648646) (not b!648632) (not b!648631) (not b!648654) (not start!58908) (not b!648648) (not b!648642) (not b!648650) (not b!648637) (not b!648640) (not b!648644) (not b!648629))
(check-sat)
