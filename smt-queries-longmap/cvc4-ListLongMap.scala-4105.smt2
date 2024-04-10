; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!56132 () Bool)

(assert start!56132)

(declare-fun b!620265 () Bool)

(assert (=> b!620265 false))

(declare-datatypes ((Unit!20598 0))(
  ( (Unit!20599) )
))
(declare-fun lt!286587 () Unit!20598)

(declare-fun j!136 () (_ BitVec 32))

(declare-datatypes ((array!37602 0))(
  ( (array!37603 (arr!18047 (Array (_ BitVec 32) (_ BitVec 64))) (size!18411 (_ BitVec 32))) )
))
(declare-fun lt!286584 () array!37602)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun a!2986 () array!37602)

(declare-datatypes ((List!12088 0))(
  ( (Nil!12085) (Cons!12084 (h!13129 (_ BitVec 64)) (t!18316 List!12088)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!37602 (_ BitVec 64) (_ BitVec 32) List!12088) Unit!20598)

(assert (=> b!620265 (= lt!286587 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286584 (select (arr!18047 a!2986) j!136) index!984 Nil!12085))))

(declare-fun arrayNoDuplicates!0 (array!37602 (_ BitVec 32) List!12088) Bool)

(assert (=> b!620265 (arrayNoDuplicates!0 lt!286584 index!984 Nil!12085)))

(declare-fun lt!286588 () Unit!20598)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!37602 (_ BitVec 32) (_ BitVec 32)) Unit!20598)

(assert (=> b!620265 (= lt!286588 (lemmaNoDuplicateFromThenFromBigger!0 lt!286584 #b00000000000000000000000000000000 index!984))))

(assert (=> b!620265 (arrayNoDuplicates!0 lt!286584 #b00000000000000000000000000000000 Nil!12085)))

(declare-fun lt!286594 () Unit!20598)

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!37602 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12088) Unit!20598)

(assert (=> b!620265 (= lt!286594 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12085))))

(declare-fun arrayContainsKey!0 (array!37602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!620265 (arrayContainsKey!0 lt!286584 (select (arr!18047 a!2986) j!136) (bvadd #b00000000000000000000000000000001 index!984))))

(declare-fun lt!286581 () Unit!20598)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!37602 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!20598)

(assert (=> b!620265 (= lt!286581 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286584 (select (arr!18047 a!2986) j!136) j!136 (bvadd #b00000000000000000000000000000001 index!984)))))

(declare-fun e!355750 () Bool)

(assert (=> b!620265 e!355750))

(declare-fun res!399697 () Bool)

(assert (=> b!620265 (=> (not res!399697) (not e!355750))))

(assert (=> b!620265 (= res!399697 (arrayContainsKey!0 lt!286584 (select (arr!18047 a!2986) j!136) j!136))))

(declare-fun e!355746 () Unit!20598)

(declare-fun Unit!20600 () Unit!20598)

(assert (=> b!620265 (= e!355746 Unit!20600)))

(declare-fun b!620266 () Bool)

(declare-fun res!399690 () Bool)

(declare-fun e!355755 () Bool)

(assert (=> b!620266 (=> (not res!399690) (not e!355755))))

(assert (=> b!620266 (= res!399690 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12085))))

(declare-fun b!620267 () Bool)

(declare-fun e!355752 () Bool)

(assert (=> b!620267 (= e!355752 e!355755)))

(declare-fun res!399688 () Bool)

(assert (=> b!620267 (=> (not res!399688) (not e!355755))))

(declare-datatypes ((SeekEntryResult!6487 0))(
  ( (MissingZero!6487 (index!28232 (_ BitVec 32))) (Found!6487 (index!28233 (_ BitVec 32))) (Intermediate!6487 (undefined!7299 Bool) (index!28234 (_ BitVec 32)) (x!57007 (_ BitVec 32))) (Undefined!6487) (MissingVacant!6487 (index!28235 (_ BitVec 32))) )
))
(declare-fun lt!286589 () SeekEntryResult!6487)

(assert (=> b!620267 (= res!399688 (or (= lt!286589 (MissingZero!6487 i!1108)) (= lt!286589 (MissingVacant!6487 i!1108))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!37602 (_ BitVec 32)) SeekEntryResult!6487)

(assert (=> b!620267 (= lt!286589 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!620268 () Bool)

(declare-fun res!399687 () Bool)

(assert (=> b!620268 (=> (not res!399687) (not e!355752))))

(assert (=> b!620268 (= res!399687 (and (= (size!18411 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18411 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18411 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!620269 () Bool)

(declare-fun res!399698 () Bool)

(assert (=> b!620269 (=> (not res!399698) (not e!355755))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!620269 (= res!399698 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18047 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!620270 () Bool)

(declare-fun e!355758 () Unit!20598)

(declare-fun Unit!20601 () Unit!20598)

(assert (=> b!620270 (= e!355758 Unit!20601)))

(declare-fun b!620271 () Bool)

(declare-fun e!355748 () Unit!20598)

(declare-fun Unit!20602 () Unit!20598)

(assert (=> b!620271 (= e!355748 Unit!20602)))

(assert (=> b!620271 false))

(declare-fun b!620272 () Bool)

(assert (=> b!620272 (= e!355750 (arrayContainsKey!0 lt!286584 (select (arr!18047 a!2986) j!136) index!984))))

(declare-fun b!620273 () Bool)

(declare-fun e!355747 () Bool)

(assert (=> b!620273 (= e!355755 e!355747)))

(declare-fun res!399691 () Bool)

(assert (=> b!620273 (=> (not res!399691) (not e!355747))))

(assert (=> b!620273 (= res!399691 (= (select (store (arr!18047 a!2986) i!1108 k!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!620273 (= lt!286584 (array!37603 (store (arr!18047 a!2986) i!1108 k!1786) (size!18411 a!2986)))))

(declare-fun res!399689 () Bool)

(declare-fun b!620274 () Bool)

(assert (=> b!620274 (= res!399689 (arrayContainsKey!0 lt!286584 (select (arr!18047 a!2986) j!136) j!136))))

(declare-fun e!355749 () Bool)

(assert (=> b!620274 (=> (not res!399689) (not e!355749))))

(declare-fun e!355754 () Bool)

(assert (=> b!620274 (= e!355754 e!355749)))

(declare-fun b!620275 () Bool)

(declare-fun e!355756 () Bool)

(declare-fun lt!286579 () SeekEntryResult!6487)

(declare-fun lt!286583 () SeekEntryResult!6487)

(assert (=> b!620275 (= e!355756 (= lt!286579 lt!286583))))

(declare-fun b!620276 () Bool)

(declare-fun res!399694 () Bool)

(assert (=> b!620276 (=> (not res!399694) (not e!355752))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!620276 (= res!399694 (validKeyInArray!0 k!1786))))

(declare-fun b!620278 () Bool)

(declare-fun Unit!20603 () Unit!20598)

(assert (=> b!620278 (= e!355748 Unit!20603)))

(declare-fun b!620279 () Bool)

(assert (=> b!620279 false))

(declare-fun lt!286578 () Unit!20598)

(assert (=> b!620279 (= lt!286578 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!286584 (select (arr!18047 a!2986) j!136) j!136 Nil!12085))))

(assert (=> b!620279 (arrayNoDuplicates!0 lt!286584 j!136 Nil!12085)))

(declare-fun lt!286591 () Unit!20598)

(assert (=> b!620279 (= lt!286591 (lemmaNoDuplicateFromThenFromBigger!0 lt!286584 #b00000000000000000000000000000000 j!136))))

(assert (=> b!620279 (arrayNoDuplicates!0 lt!286584 #b00000000000000000000000000000000 Nil!12085)))

(declare-fun lt!286592 () Unit!20598)

(assert (=> b!620279 (= lt!286592 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k!1786 i!1108 #b00000000000000000000000000000000 Nil!12085))))

(assert (=> b!620279 (arrayContainsKey!0 lt!286584 (select (arr!18047 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!286582 () Unit!20598)

(assert (=> b!620279 (= lt!286582 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!286584 (select (arr!18047 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun Unit!20604 () Unit!20598)

(assert (=> b!620279 (= e!355758 Unit!20604)))

(declare-fun b!620280 () Bool)

(declare-fun e!355753 () Unit!20598)

(declare-fun Unit!20605 () Unit!20598)

(assert (=> b!620280 (= e!355753 Unit!20605)))

(declare-fun b!620281 () Bool)

(declare-fun e!355757 () Bool)

(assert (=> b!620281 (= e!355747 e!355757)))

(declare-fun res!399695 () Bool)

(assert (=> b!620281 (=> (not res!399695) (not e!355757))))

(assert (=> b!620281 (= res!399695 (and (= lt!286579 (Found!6487 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18047 a!2986) index!984) (select (arr!18047 a!2986) j!136))) (not (= (select (arr!18047 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!37602 (_ BitVec 32)) SeekEntryResult!6487)

(assert (=> b!620281 (= lt!286579 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18047 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!620282 () Bool)

(assert (=> b!620282 (= e!355749 (arrayContainsKey!0 lt!286584 (select (arr!18047 a!2986) j!136) index!984))))

(declare-fun b!620283 () Bool)

(assert (=> b!620283 (= e!355757 (not true))))

(declare-fun lt!286593 () Unit!20598)

(assert (=> b!620283 (= lt!286593 e!355753)))

(declare-fun c!70659 () Bool)

(declare-fun lt!286596 () SeekEntryResult!6487)

(assert (=> b!620283 (= c!70659 (= lt!286596 (Found!6487 index!984)))))

(declare-fun lt!286586 () Unit!20598)

(assert (=> b!620283 (= lt!286586 e!355748)))

(declare-fun c!70661 () Bool)

(assert (=> b!620283 (= c!70661 (= lt!286596 Undefined!6487))))

(declare-fun lt!286590 () (_ BitVec 64))

(assert (=> b!620283 (= lt!286596 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!286590 lt!286584 mask!3053))))

(assert (=> b!620283 e!355756))

(declare-fun res!399693 () Bool)

(assert (=> b!620283 (=> (not res!399693) (not e!355756))))

(declare-fun lt!286580 () (_ BitVec 32))

(assert (=> b!620283 (= res!399693 (= lt!286583 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286580 vacantSpotIndex!68 lt!286590 lt!286584 mask!3053)))))

(assert (=> b!620283 (= lt!286583 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!286580 vacantSpotIndex!68 (select (arr!18047 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!620283 (= lt!286590 (select (store (arr!18047 a!2986) i!1108 k!1786) j!136))))

(declare-fun lt!286597 () Unit!20598)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!37602 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!20598)

(assert (=> b!620283 (= lt!286597 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!286580 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!620283 (= lt!286580 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!620284 () Bool)

(declare-fun res!399683 () Bool)

(assert (=> b!620284 (= res!399683 (bvsge j!136 index!984))))

(assert (=> b!620284 (=> res!399683 e!355754)))

(declare-fun e!355751 () Bool)

(assert (=> b!620284 (= e!355751 e!355754)))

(declare-fun b!620285 () Bool)

(declare-fun res!399696 () Bool)

(assert (=> b!620285 (=> (not res!399696) (not e!355752))))

(assert (=> b!620285 (= res!399696 (validKeyInArray!0 (select (arr!18047 a!2986) j!136)))))

(declare-fun b!620286 () Bool)

(declare-fun Unit!20606 () Unit!20598)

(assert (=> b!620286 (= e!355753 Unit!20606)))

(declare-fun res!399692 () Bool)

(assert (=> b!620286 (= res!399692 (= (select (store (arr!18047 a!2986) i!1108 k!1786) index!984) (select (arr!18047 a!2986) j!136)))))

(assert (=> b!620286 (=> (not res!399692) (not e!355751))))

(assert (=> b!620286 e!355751))

(declare-fun c!70660 () Bool)

(assert (=> b!620286 (= c!70660 (bvslt j!136 index!984))))

(declare-fun lt!286585 () Unit!20598)

(assert (=> b!620286 (= lt!286585 e!355758)))

(declare-fun c!70658 () Bool)

(assert (=> b!620286 (= c!70658 (bvslt index!984 j!136))))

(declare-fun lt!286595 () Unit!20598)

(assert (=> b!620286 (= lt!286595 e!355746)))

(assert (=> b!620286 false))

(declare-fun b!620287 () Bool)

(declare-fun Unit!20607 () Unit!20598)

(assert (=> b!620287 (= e!355746 Unit!20607)))

(declare-fun b!620288 () Bool)

(declare-fun res!399684 () Bool)

(assert (=> b!620288 (=> (not res!399684) (not e!355752))))

(assert (=> b!620288 (= res!399684 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!399686 () Bool)

(assert (=> start!56132 (=> (not res!399686) (not e!355752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!56132 (= res!399686 (validMask!0 mask!3053))))

(assert (=> start!56132 e!355752))

(assert (=> start!56132 true))

(declare-fun array_inv!13843 (array!37602) Bool)

(assert (=> start!56132 (array_inv!13843 a!2986)))

(declare-fun b!620277 () Bool)

(declare-fun res!399685 () Bool)

(assert (=> b!620277 (=> (not res!399685) (not e!355755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!37602 (_ BitVec 32)) Bool)

(assert (=> b!620277 (= res!399685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!56132 res!399686) b!620268))

(assert (= (and b!620268 res!399687) b!620285))

(assert (= (and b!620285 res!399696) b!620276))

(assert (= (and b!620276 res!399694) b!620288))

(assert (= (and b!620288 res!399684) b!620267))

(assert (= (and b!620267 res!399688) b!620277))

(assert (= (and b!620277 res!399685) b!620266))

(assert (= (and b!620266 res!399690) b!620269))

(assert (= (and b!620269 res!399698) b!620273))

(assert (= (and b!620273 res!399691) b!620281))

(assert (= (and b!620281 res!399695) b!620283))

(assert (= (and b!620283 res!399693) b!620275))

(assert (= (and b!620283 c!70661) b!620271))

(assert (= (and b!620283 (not c!70661)) b!620278))

(assert (= (and b!620283 c!70659) b!620286))

(assert (= (and b!620283 (not c!70659)) b!620280))

(assert (= (and b!620286 res!399692) b!620284))

(assert (= (and b!620284 (not res!399683)) b!620274))

(assert (= (and b!620274 res!399689) b!620282))

(assert (= (and b!620286 c!70660) b!620279))

(assert (= (and b!620286 (not c!70660)) b!620270))

(assert (= (and b!620286 c!70658) b!620265))

(assert (= (and b!620286 (not c!70658)) b!620287))

(assert (= (and b!620265 res!399697) b!620272))

(declare-fun m!596191 () Bool)

(assert (=> b!620266 m!596191))

(declare-fun m!596193 () Bool)

(assert (=> b!620276 m!596193))

(declare-fun m!596195 () Bool)

(assert (=> b!620273 m!596195))

(declare-fun m!596197 () Bool)

(assert (=> b!620273 m!596197))

(declare-fun m!596199 () Bool)

(assert (=> start!56132 m!596199))

(declare-fun m!596201 () Bool)

(assert (=> start!56132 m!596201))

(declare-fun m!596203 () Bool)

(assert (=> b!620265 m!596203))

(declare-fun m!596205 () Bool)

(assert (=> b!620265 m!596205))

(assert (=> b!620265 m!596203))

(declare-fun m!596207 () Bool)

(assert (=> b!620265 m!596207))

(assert (=> b!620265 m!596203))

(declare-fun m!596209 () Bool)

(assert (=> b!620265 m!596209))

(declare-fun m!596211 () Bool)

(assert (=> b!620265 m!596211))

(assert (=> b!620265 m!596203))

(declare-fun m!596213 () Bool)

(assert (=> b!620265 m!596213))

(assert (=> b!620265 m!596203))

(declare-fun m!596215 () Bool)

(assert (=> b!620265 m!596215))

(declare-fun m!596217 () Bool)

(assert (=> b!620265 m!596217))

(declare-fun m!596219 () Bool)

(assert (=> b!620265 m!596219))

(assert (=> b!620272 m!596203))

(assert (=> b!620272 m!596203))

(declare-fun m!596221 () Bool)

(assert (=> b!620272 m!596221))

(assert (=> b!620286 m!596195))

(declare-fun m!596223 () Bool)

(assert (=> b!620286 m!596223))

(assert (=> b!620286 m!596203))

(declare-fun m!596225 () Bool)

(assert (=> b!620277 m!596225))

(assert (=> b!620282 m!596203))

(assert (=> b!620282 m!596203))

(assert (=> b!620282 m!596221))

(assert (=> b!620285 m!596203))

(assert (=> b!620285 m!596203))

(declare-fun m!596227 () Bool)

(assert (=> b!620285 m!596227))

(declare-fun m!596229 () Bool)

(assert (=> b!620281 m!596229))

(assert (=> b!620281 m!596203))

(assert (=> b!620281 m!596203))

(declare-fun m!596231 () Bool)

(assert (=> b!620281 m!596231))

(declare-fun m!596233 () Bool)

(assert (=> b!620267 m!596233))

(assert (=> b!620283 m!596203))

(declare-fun m!596235 () Bool)

(assert (=> b!620283 m!596235))

(declare-fun m!596237 () Bool)

(assert (=> b!620283 m!596237))

(declare-fun m!596239 () Bool)

(assert (=> b!620283 m!596239))

(assert (=> b!620283 m!596203))

(declare-fun m!596241 () Bool)

(assert (=> b!620283 m!596241))

(assert (=> b!620283 m!596195))

(declare-fun m!596243 () Bool)

(assert (=> b!620283 m!596243))

(declare-fun m!596245 () Bool)

(assert (=> b!620283 m!596245))

(assert (=> b!620274 m!596203))

(assert (=> b!620274 m!596203))

(assert (=> b!620274 m!596215))

(declare-fun m!596247 () Bool)

(assert (=> b!620269 m!596247))

(declare-fun m!596249 () Bool)

(assert (=> b!620288 m!596249))

(declare-fun m!596251 () Bool)

(assert (=> b!620279 m!596251))

(assert (=> b!620279 m!596203))

(declare-fun m!596253 () Bool)

(assert (=> b!620279 m!596253))

(assert (=> b!620279 m!596203))

(declare-fun m!596255 () Bool)

(assert (=> b!620279 m!596255))

(declare-fun m!596257 () Bool)

(assert (=> b!620279 m!596257))

(assert (=> b!620279 m!596203))

(declare-fun m!596259 () Bool)

(assert (=> b!620279 m!596259))

(assert (=> b!620279 m!596219))

(assert (=> b!620279 m!596211))

(assert (=> b!620279 m!596203))

(push 1)

