; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!56178 () Bool)

(assert start!56178)

(declare-fun b!622226 () Bool)

(declare-fun res!401057 () Bool)

(declare-fun j!136 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!622226 (= res!401057 (bvsge j!136 index!984))))

(declare-fun e!356879 () Bool)

(assert (=> b!622226 (=> res!401057 e!356879)))

(declare-fun e!356882 () Bool)

(assert (=> b!622226 (= e!356882 e!356879)))

(declare-datatypes ((array!37662 0))(
  ( (array!37663 (arr!18077 (Array (_ BitVec 32) (_ BitVec 64))) (size!18442 (_ BitVec 32))) )
))
(declare-fun lt!288219 () array!37662)

(declare-fun e!356885 () Bool)

(declare-fun b!622227 () Bool)

(declare-fun a!2986 () array!37662)

(declare-fun arrayContainsKey!0 (array!37662 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!622227 (= e!356885 (arrayContainsKey!0 lt!288219 (select (arr!18077 a!2986) j!136) index!984))))

(declare-fun b!622228 () Bool)

(declare-datatypes ((Unit!20886 0))(
  ( (Unit!20887) )
))
(declare-fun e!356884 () Unit!20886)

(declare-fun Unit!20888 () Unit!20886)

(assert (=> b!622228 (= e!356884 Unit!20888)))

(assert (=> b!622228 false))

(declare-fun b!622229 () Bool)

(assert (=> b!622229 false))

(declare-fun lt!288222 () Unit!20886)

(declare-datatypes ((List!12157 0))(
  ( (Nil!12154) (Cons!12153 (h!13198 (_ BitVec 64)) (t!18376 List!12157)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37662 (_ BitVec 64) (_ BitVec 32) List!12157) Unit!20886)

(assert (=> b!622229 (= lt!288222 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288219 (select (arr!18077 a!2986) j!136) j!136 Nil!12154))))

(declare-fun arrayNoDuplicates!0 (array!37662 (_ BitVec 32) List!12157) Bool)

(assert (=> b!622229 (arrayNoDuplicates!0 lt!288219 j!136 Nil!12154)))

(declare-fun lt!288206 () Unit!20886)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37662 (_ BitVec 32) (_ BitVec 32)) Unit!20886)

(assert (=> b!622229 (= lt!288206 (lemmaNoDuplicateFromThenFromBigger!0 lt!288219 #b00000000000000000000000000000000 j!136))))

(assert (=> b!622229 (arrayNoDuplicates!0 lt!288219 #b00000000000000000000000000000000 Nil!12154)))

(declare-fun lt!288216 () Unit!20886)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37662 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12157) Unit!20886)

(assert (=> b!622229 (= lt!288216 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12154))))

(assert (=> b!622229 (arrayContainsKey!0 lt!288219 (select (arr!18077 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!288204 () Unit!20886)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37662 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20886)

(assert (=> b!622229 (= lt!288204 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288219 (select (arr!18077 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun e!356875 () Unit!20886)

(declare-fun Unit!20889 () Unit!20886)

(assert (=> b!622229 (= e!356875 Unit!20889)))

(declare-fun b!622230 () Bool)

(declare-fun Unit!20890 () Unit!20886)

(assert (=> b!622230 (= e!356875 Unit!20890)))

(declare-fun b!622231 () Bool)

(declare-fun e!356881 () Unit!20886)

(declare-fun Unit!20891 () Unit!20886)

(assert (=> b!622231 (= e!356881 Unit!20891)))

(declare-fun res!401054 () Bool)

(assert (=> b!622231 (= res!401054 (= (select (store (arr!18077 a!2986) i!1108 k0!1786) index!984) (select (arr!18077 a!2986) j!136)))))

(assert (=> b!622231 (=> (not res!401054) (not e!356882))))

(assert (=> b!622231 e!356882))

(declare-fun c!70962 () Bool)

(assert (=> b!622231 (= c!70962 (bvslt j!136 index!984))))

(declare-fun lt!288207 () Unit!20886)

(assert (=> b!622231 (= lt!288207 e!356875)))

(declare-fun c!70960 () Bool)

(assert (=> b!622231 (= c!70960 (bvslt index!984 j!136))))

(declare-fun lt!288223 () Unit!20886)

(declare-fun e!356873 () Unit!20886)

(assert (=> b!622231 (= lt!288223 e!356873)))

(assert (=> b!622231 false))

(declare-fun b!622232 () Bool)

(declare-fun e!356876 () Bool)

(assert (=> b!622232 (= e!356876 (not true))))

(declare-fun lt!288208 () Unit!20886)

(assert (=> b!622232 (= lt!288208 e!356881)))

(declare-fun c!70961 () Bool)

(declare-datatypes ((SeekEntryResult!6514 0))(
  ( (MissingZero!6514 (index!28340 (_ BitVec 32))) (Found!6514 (index!28341 (_ BitVec 32))) (Intermediate!6514 (undefined!7326 Bool) (index!28342 (_ BitVec 32)) (x!57117 (_ BitVec 32))) (Undefined!6514) (MissingVacant!6514 (index!28343 (_ BitVec 32))) )
))
(declare-fun lt!288218 () SeekEntryResult!6514)

(assert (=> b!622232 (= c!70961 (= lt!288218 (Found!6514 index!984)))))

(declare-fun lt!288215 () Unit!20886)

(assert (=> b!622232 (= lt!288215 e!356884)))

(declare-fun c!70959 () Bool)

(assert (=> b!622232 (= c!70959 (= lt!288218 Undefined!6514))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun lt!288217 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37662 (_ BitVec 32)) SeekEntryResult!6514)

(assert (=> b!622232 (= lt!288218 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!288217 lt!288219 mask!3053))))

(declare-fun e!356877 () Bool)

(assert (=> b!622232 e!356877))

(declare-fun res!401047 () Bool)

(assert (=> b!622232 (=> (not res!401047) (not e!356877))))

(declare-fun lt!288211 () (_ BitVec 32))

(declare-fun lt!288221 () SeekEntryResult!6514)

(assert (=> b!622232 (= res!401047 (= lt!288221 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288211 vacantSpotIndex!68 lt!288217 lt!288219 mask!3053)))))

(assert (=> b!622232 (= lt!288221 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!288211 vacantSpotIndex!68 (select (arr!18077 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!622232 (= lt!288217 (select (store (arr!18077 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!288214 () Unit!20886)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37662 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20886)

(assert (=> b!622232 (= lt!288214 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!288211 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!622232 (= lt!288211 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!622233 () Bool)

(declare-fun res!401042 () Bool)

(declare-fun e!356874 () Bool)

(assert (=> b!622233 (=> (not res!401042) (not e!356874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!622233 (= res!401042 (validKeyInArray!0 k0!1786))))

(declare-fun b!622234 () Bool)

(declare-fun Unit!20892 () Unit!20886)

(assert (=> b!622234 (= e!356881 Unit!20892)))

(declare-fun b!622235 () Bool)

(declare-fun res!401045 () Bool)

(declare-fun e!356878 () Bool)

(assert (=> b!622235 (=> (not res!401045) (not e!356878))))

(assert (=> b!622235 (= res!401045 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12154))))

(declare-fun b!622236 () Bool)

(declare-fun e!356886 () Bool)

(assert (=> b!622236 (= e!356878 e!356886)))

(declare-fun res!401043 () Bool)

(assert (=> b!622236 (=> (not res!401043) (not e!356886))))

(assert (=> b!622236 (= res!401043 (= (select (store (arr!18077 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!622236 (= lt!288219 (array!37663 (store (arr!18077 a!2986) i!1108 k0!1786) (size!18442 a!2986)))))

(declare-fun b!622237 () Bool)

(declare-fun Unit!20893 () Unit!20886)

(assert (=> b!622237 (= e!356884 Unit!20893)))

(declare-fun b!622238 () Bool)

(assert (=> b!622238 (= e!356874 e!356878)))

(declare-fun res!401052 () Bool)

(assert (=> b!622238 (=> (not res!401052) (not e!356878))))

(declare-fun lt!288210 () SeekEntryResult!6514)

(assert (=> b!622238 (= res!401052 (or (= lt!288210 (MissingZero!6514 i!1108)) (= lt!288210 (MissingVacant!6514 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37662 (_ BitVec 32)) SeekEntryResult!6514)

(assert (=> b!622238 (= lt!288210 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun res!401048 () Bool)

(assert (=> start!56178 (=> (not res!401048) (not e!356874))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56178 (= res!401048 (validMask!0 mask!3053))))

(assert (=> start!56178 e!356874))

(assert (=> start!56178 true))

(declare-fun array_inv!13960 (array!37662) Bool)

(assert (=> start!56178 (array_inv!13960 a!2986)))

(declare-fun b!622239 () Bool)

(declare-fun e!356880 () Bool)

(assert (=> b!622239 (= e!356880 (arrayContainsKey!0 lt!288219 (select (arr!18077 a!2986) j!136) index!984))))

(declare-fun b!622240 () Bool)

(declare-fun res!401049 () Bool)

(assert (=> b!622240 (= res!401049 (arrayContainsKey!0 lt!288219 (select (arr!18077 a!2986) j!136) j!136))))

(assert (=> b!622240 (=> (not res!401049) (not e!356885))))

(assert (=> b!622240 (= e!356879 e!356885)))

(declare-fun b!622241 () Bool)

(declare-fun res!401044 () Bool)

(assert (=> b!622241 (=> (not res!401044) (not e!356874))))

(assert (=> b!622241 (= res!401044 (and (= (size!18442 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18442 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18442 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!622242 () Bool)

(declare-fun res!401046 () Bool)

(assert (=> b!622242 (=> (not res!401046) (not e!356878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37662 (_ BitVec 32)) Bool)

(assert (=> b!622242 (= res!401046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!622243 () Bool)

(declare-fun Unit!20894 () Unit!20886)

(assert (=> b!622243 (= e!356873 Unit!20894)))

(declare-fun b!622244 () Bool)

(declare-fun res!401055 () Bool)

(assert (=> b!622244 (=> (not res!401055) (not e!356874))))

(assert (=> b!622244 (= res!401055 (validKeyInArray!0 (select (arr!18077 a!2986) j!136)))))

(declare-fun b!622245 () Bool)

(assert (=> b!622245 false))

(declare-fun lt!288213 () Unit!20886)

(assert (=> b!622245 (= lt!288213 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!288219 (select (arr!18077 a!2986) j!136) index!984 Nil!12154))))

(assert (=> b!622245 (arrayNoDuplicates!0 lt!288219 index!984 Nil!12154)))

(declare-fun lt!288212 () Unit!20886)

(assert (=> b!622245 (= lt!288212 (lemmaNoDuplicateFromThenFromBigger!0 lt!288219 #b00000000000000000000000000000000 index!984))))

(assert (=> b!622245 (arrayNoDuplicates!0 lt!288219 #b00000000000000000000000000000000 Nil!12154)))

(declare-fun lt!288220 () Unit!20886)

(assert (=> b!622245 (= lt!288220 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12154))))

(assert (=> b!622245 (arrayContainsKey!0 lt!288219 (select (arr!18077 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!288209 () Unit!20886)

(assert (=> b!622245 (= lt!288209 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!288219 (select (arr!18077 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(assert (=> b!622245 e!356880))

(declare-fun res!401056 () Bool)

(assert (=> b!622245 (=> (not res!401056) (not e!356880))))

(assert (=> b!622245 (= res!401056 (arrayContainsKey!0 lt!288219 (select (arr!18077 a!2986) j!136) j!136))))

(declare-fun Unit!20895 () Unit!20886)

(assert (=> b!622245 (= e!356873 Unit!20895)))

(declare-fun b!622246 () Bool)

(assert (=> b!622246 (= e!356886 e!356876)))

(declare-fun res!401050 () Bool)

(assert (=> b!622246 (=> (not res!401050) (not e!356876))))

(declare-fun lt!288205 () SeekEntryResult!6514)

(assert (=> b!622246 (= res!401050 (and (= lt!288205 (Found!6514 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18077 a!2986) index!984) (select (arr!18077 a!2986) j!136))) (not (= (select (arr!18077 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!622246 (= lt!288205 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18077 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!622247 () Bool)

(assert (=> b!622247 (= e!356877 (= lt!288205 lt!288221))))

(declare-fun b!622248 () Bool)

(declare-fun res!401051 () Bool)

(assert (=> b!622248 (=> (not res!401051) (not e!356874))))

(assert (=> b!622248 (= res!401051 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!622249 () Bool)

(declare-fun res!401053 () Bool)

(assert (=> b!622249 (=> (not res!401053) (not e!356878))))

(assert (=> b!622249 (= res!401053 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18077 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!56178 res!401048) b!622241))

(assert (= (and b!622241 res!401044) b!622244))

(assert (= (and b!622244 res!401055) b!622233))

(assert (= (and b!622233 res!401042) b!622248))

(assert (= (and b!622248 res!401051) b!622238))

(assert (= (and b!622238 res!401052) b!622242))

(assert (= (and b!622242 res!401046) b!622235))

(assert (= (and b!622235 res!401045) b!622249))

(assert (= (and b!622249 res!401053) b!622236))

(assert (= (and b!622236 res!401043) b!622246))

(assert (= (and b!622246 res!401050) b!622232))

(assert (= (and b!622232 res!401047) b!622247))

(assert (= (and b!622232 c!70959) b!622228))

(assert (= (and b!622232 (not c!70959)) b!622237))

(assert (= (and b!622232 c!70961) b!622231))

(assert (= (and b!622232 (not c!70961)) b!622234))

(assert (= (and b!622231 res!401054) b!622226))

(assert (= (and b!622226 (not res!401057)) b!622240))

(assert (= (and b!622240 res!401049) b!622227))

(assert (= (and b!622231 c!70962) b!622229))

(assert (= (and b!622231 (not c!70962)) b!622230))

(assert (= (and b!622231 c!70960) b!622245))

(assert (= (and b!622231 (not c!70960)) b!622243))

(assert (= (and b!622245 res!401056) b!622239))

(declare-fun m!597589 () Bool)

(assert (=> b!622227 m!597589))

(assert (=> b!622227 m!597589))

(declare-fun m!597591 () Bool)

(assert (=> b!622227 m!597591))

(assert (=> b!622239 m!597589))

(assert (=> b!622239 m!597589))

(assert (=> b!622239 m!597591))

(declare-fun m!597593 () Bool)

(assert (=> b!622249 m!597593))

(assert (=> b!622244 m!597589))

(assert (=> b!622244 m!597589))

(declare-fun m!597595 () Bool)

(assert (=> b!622244 m!597595))

(assert (=> b!622229 m!597589))

(declare-fun m!597597 () Bool)

(assert (=> b!622229 m!597597))

(assert (=> b!622229 m!597589))

(declare-fun m!597599 () Bool)

(assert (=> b!622229 m!597599))

(assert (=> b!622229 m!597589))

(declare-fun m!597601 () Bool)

(assert (=> b!622229 m!597601))

(declare-fun m!597603 () Bool)

(assert (=> b!622229 m!597603))

(declare-fun m!597605 () Bool)

(assert (=> b!622229 m!597605))

(assert (=> b!622229 m!597589))

(declare-fun m!597607 () Bool)

(assert (=> b!622229 m!597607))

(declare-fun m!597609 () Bool)

(assert (=> b!622229 m!597609))

(declare-fun m!597611 () Bool)

(assert (=> b!622235 m!597611))

(declare-fun m!597613 () Bool)

(assert (=> b!622248 m!597613))

(declare-fun m!597615 () Bool)

(assert (=> b!622236 m!597615))

(declare-fun m!597617 () Bool)

(assert (=> b!622236 m!597617))

(assert (=> b!622240 m!597589))

(assert (=> b!622240 m!597589))

(declare-fun m!597619 () Bool)

(assert (=> b!622240 m!597619))

(assert (=> b!622232 m!597589))

(declare-fun m!597621 () Bool)

(assert (=> b!622232 m!597621))

(declare-fun m!597623 () Bool)

(assert (=> b!622232 m!597623))

(assert (=> b!622232 m!597589))

(assert (=> b!622232 m!597615))

(declare-fun m!597625 () Bool)

(assert (=> b!622232 m!597625))

(declare-fun m!597627 () Bool)

(assert (=> b!622232 m!597627))

(declare-fun m!597629 () Bool)

(assert (=> b!622232 m!597629))

(declare-fun m!597631 () Bool)

(assert (=> b!622232 m!597631))

(declare-fun m!597633 () Bool)

(assert (=> b!622233 m!597633))

(declare-fun m!597635 () Bool)

(assert (=> b!622246 m!597635))

(assert (=> b!622246 m!597589))

(assert (=> b!622246 m!597589))

(declare-fun m!597637 () Bool)

(assert (=> b!622246 m!597637))

(assert (=> b!622231 m!597615))

(declare-fun m!597639 () Bool)

(assert (=> b!622231 m!597639))

(assert (=> b!622231 m!597589))

(declare-fun m!597641 () Bool)

(assert (=> start!56178 m!597641))

(declare-fun m!597643 () Bool)

(assert (=> start!56178 m!597643))

(declare-fun m!597645 () Bool)

(assert (=> b!622238 m!597645))

(declare-fun m!597647 () Bool)

(assert (=> b!622242 m!597647))

(assert (=> b!622245 m!597589))

(declare-fun m!597649 () Bool)

(assert (=> b!622245 m!597649))

(assert (=> b!622245 m!597589))

(declare-fun m!597651 () Bool)

(assert (=> b!622245 m!597651))

(assert (=> b!622245 m!597589))

(assert (=> b!622245 m!597589))

(assert (=> b!622245 m!597619))

(declare-fun m!597653 () Bool)

(assert (=> b!622245 m!597653))

(assert (=> b!622245 m!597603))

(declare-fun m!597655 () Bool)

(assert (=> b!622245 m!597655))

(assert (=> b!622245 m!597589))

(declare-fun m!597657 () Bool)

(assert (=> b!622245 m!597657))

(assert (=> b!622245 m!597609))

(check-sat (not b!622238) (not b!622239) (not b!622242) (not b!622232) (not b!622248) (not b!622245) (not b!622244) (not start!56178) (not b!622229) (not b!622235) (not b!622227) (not b!622233) (not b!622240) (not b!622246))
(check-sat)
